Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1F7F52D4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 22:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639201.996210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5v3e-000092-Fx; Wed, 22 Nov 2023 21:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639201.996210; Wed, 22 Nov 2023 21:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5v3e-00006L-Ch; Wed, 22 Nov 2023 21:46:54 +0000
Received: by outflank-mailman (input) for mailman id 639201;
 Wed, 22 Nov 2023 21:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5v3c-00006F-Av
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 21:46:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f3d083-8980-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 22:46:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D9EFCB827AC;
 Wed, 22 Nov 2023 21:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7AFC433C8;
 Wed, 22 Nov 2023 21:46:46 +0000 (UTC)
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
X-Inumbo-ID: a3f3d083-8980-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700689607;
	bh=LRkoP6ih25g5CenKtlE7D41MaEgKKhlp0jpndEkCi6E=;
	h=Date:From:To:cc:Subject:From;
	b=liK0uIN1h4qos8kNOaTH60qNMnRT6VlvZAYbS1/S1ARosiMTKpFJkVWsS8tvK6JQP
	 vJi4jZg5m2fBucqpYIjJGQytUdfY7BTpEM+ayqs+7nzr9xtKCVQo3LsuVNLamDiVA6
	 mLx07tSWe4lifANRiAp7dUwCK0vwVWV96Dl7BvcNgEH8ehFmTd1ocgXGqy5nv0nUCW
	 BcCN9ZDfruWYQ5UtaZAVhPvp4mmyC7sH0IcOZwXNaFN8WnLNhFxao9tprH+1kgVlqA
	 r6kopx+PYBmbTNIO7nhbb1u03NzAH9fqav5Vxt9cdc/7udrQh4lf4vKK8IhKKEKnl+
	 AM1W3rYdJJ+1g==
Date: Wed, 22 Nov 2023 13:46:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, federico.serafini@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] do_multicall and MISRA Rule 8.3
Message-ID: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Two out of three do_multicall definitions/declarations use uint32_t as
type for the "nr_calls" parameters. Change the third one to be
consistent with the other two. 

Link: https://lore.kernel.org/xen-devel/7e3abd4c0ef5127a07a60de1bf090a8aefac8e5c.1692717906.git.federico.serafini@bugseng.com/
Link: https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2308251502430.6458@ubuntu-linux-20-04-desktop/
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Note that a previous discussion showed disagreement between maintainers
on this topic. The source of disagreements are that we don't want to
change a guest-visible ABI and we haven't properly documented how to use
types for guest ABIs.

As an example, fixed-width types have the advantage of being explicit
about their size but sometimes register-size types are required (e.g.
unsigned long). The C specification says little about the size of
unsigned long and today, and we even use unsigned int in guest ABIs
without specifying the expected width of unsigned int on the various
arches. As Jan pointed out, in Xen we assume sizeof(int) >= 4, but
that's not written anywhere as far as I can tell.

I think the appropriate solution would be to document properly our
expectations of both fixed-width and non-fixed-width types, and how to
use them for guest-visible ABIs.

In this patch I used uint32_t for a couple of reasons:
- until we have better documentation, I feel more confident in using
  explicitly-sized integers in guest-visible ABIs
- 2/3 of the do_multicall definition/declaration are using uint32_t

diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 6d361ddfce..8b8ee16074 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -172,7 +172,7 @@ console_io(unsigned int cmd, unsigned int count, char *buffer)
 vm_assist(unsigned int cmd, unsigned int type)
 event_channel_op(int cmd, void *arg)
 mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
-multicall(multicall_entry_t *call_list, unsigned int nr_calls)
+multicall(multicall_entry_t *call_list, uint32_t nr_calls)
 #ifdef CONFIG_PV
 mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 stack_switch(unsigned long ss, unsigned long esp)

