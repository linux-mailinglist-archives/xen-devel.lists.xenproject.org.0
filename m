Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C035485D52
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 01:41:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253806.435065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Gpg-0001r3-C5; Thu, 06 Jan 2022 00:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253806.435065; Thu, 06 Jan 2022 00:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Gpg-0001pF-8w; Thu, 06 Jan 2022 00:40:44 +0000
Received: by outflank-mailman (input) for mailman id 253806;
 Thu, 06 Jan 2022 00:40:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmKD=RW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5Gpe-0001p9-Op
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 00:40:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44db545b-6e89-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 01:40:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4803E6198A;
 Thu,  6 Jan 2022 00:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FC7C36AEB;
 Thu,  6 Jan 2022 00:40:37 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 44db545b-6e89-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641429637;
	bh=yhjlieHsS2F1nOEoEhFP+YOyRQ6e4+0F0JnKWl3r4ng=;
	h=Date:From:To:cc:Subject:From;
	b=ehblOepZmyIBTMA4mECJVK2UHnNK0qJzrNrWcXZ1+avfqDcvxzYdHka3/VMdv6p+V
	 UzjyyrhLPWdoK8h8N2djb0CwrEwVhyokqYselgm6kg550DNvjsuE4wVpTlMlOkWll0
	 2F/MjkwpwZNrwFiUfSQwk1Ro1U1QQxdAv32L7L/0SEGApYEOLfgty+ycXNAleGc71M
	 l/DA8VGjwIab1mimdHrvTFM2x/16wJiHdZw6RX5taGuzkYC8vi/AIpCWGYgUHs02DO
	 hScwXshBWI7bXKVlWS966FfYA0WPx51VFcDyzvQRhM5KAwEerqhsQ1nza0suAd3NUt
	 c+Utu1TXB6yaw==
Date: Wed, 5 Jan 2022 16:40:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dfaggioli@suse.com, george.dunlap@citrix.com
cc: sstabellini@kernel.org, julien@xen.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, jgross@suse.com, 
    xen-devel@lists.xenproject.org
Subject: sched=null vwfi=native and call_rcu()
Message-ID: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

As you might remember, we have an outstanding issue with call_rcu() when
sched=null vwfi=native are used. That is because in that configuration
the CPU never goes idle so rcu_idle_enter() never gets called.

The issue was caught on the field and I managed to repro the problem
doing the following:

xl destroy test
xl create ./test.cfg

Resulting in the following error:

# Parsing config from ./test.cfg
# (XEN) IRQ 54 is already used by domain 1

The test domain has 3 interrupts remapped to it and they don't get
released before the new domain creation is requested.

Just FYI, the below hacky patch seems to reliably work-around the
problem in my environment.

Do you have any suggestions on what would be the right way to solve
this issue?

Cheers,

Stefano


diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index a5a27af3de..841a5cb3c9 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -289,6 +289,9 @@ void call_rcu(struct rcu_head *head,
         force_quiescent_state(rdp, &rcu_ctrlblk);
     }
     local_irq_restore(flags);
+    /* make sure that the CPU has a chance to check RCUs */
+    set_timer(&rdp->idle_timer, NOW() + SECONDS(1));
+    rdp->idle_timer_active = true;
 }
 
 /*


