Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8454787B73
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 00:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590378.922650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZIlI-0005YS-37; Thu, 24 Aug 2023 22:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590378.922650; Thu, 24 Aug 2023 22:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZIlH-0005Wq-VZ; Thu, 24 Aug 2023 22:25:07 +0000
Received: by outflank-mailman (input) for mailman id 590378;
 Thu, 24 Aug 2023 22:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZIlF-0005Wj-W8
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 22:25:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12002c01-42cd-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 00:25:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A0629622BB;
 Thu, 24 Aug 2023 22:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59527C433C7;
 Thu, 24 Aug 2023 22:25:01 +0000 (UTC)
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
X-Inumbo-ID: 12002c01-42cd-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692915902;
	bh=rxl1EOik2RvNuNs4XWPNerc7crzYgkyv7EgWMDrh4QM=;
	h=Date:From:To:cc:Subject:From;
	b=hgtwEJRcfhxz5Q2vjxv2EDsQ8HuG8t570/B3Rc2nVVgYakeKZ8bAjn1rndVHZ2G/d
	 UR2LQu6sWcMv9ipSNr4ovQh7wT/7lO16CoOIEtoovRR+HzD1HlQJPfu+XaziQqI1S1
	 BMUVGup64TTDbsI6bW7AV/E2isbsyRIhJprvYxndBNjuYgs2S9Y9T5Qc6WW5yUMbFJ
	 FbskvgWPhzrfcGXZHQ3zLBzpiHrMhQTbdLU8nur4gAVjDCwOryMTzUQwIfnnfx9Oft
	 bHGxpqodtLBwy+0nRFmr8jR3cQMXokfGyDSNcPmsTZ31oiGxPdXj74W/e7ONS0o3EF
	 TIQCjEIQOxUHw==
Date: Thu, 24 Aug 2023 15:24:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: luca.fancellu@arm.com
cc: sstabellini@kernel.org, nicola.vetrini@bugseng.com, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com
Subject: xen-analysis ECLAIR support
Message-ID: <alpine.DEB.2.22.394.2308241453470.6458@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Luca,

We are looking into adding ECLAIR support for xen-analysis so that we
can use the SAF-n-safe tags also with ECLAIR.

One question that came up is about multi-line statements. For instance,
in a case like the following:

diff --git a/xen/common/inflate.c b/xen/common/inflate.c
index 8fa4b96d12..8bdc9208da 100644
--- a/xen/common/inflate.c
+++ b/xen/common/inflate.c
@@ -1201,6 +1201,7 @@ static int __init gunzip(void)
     magic[1] = NEXTBYTE();
     method   = NEXTBYTE();
 
+    /* SAF-1-safe */
     if (magic[0] != 037 ||
         ((magic[1] != 0213) && (magic[1] != 0236))) {
         error("bad gzip magic numbers");


Would SAF-1-safe cover both 037, and also 0213 and 0213?
Or would it cover only 037?

We haven't use SAFE-n-safe extensively through the codebase yet but
my understanding is that SAFE-n-safe would cover the entire statement of
the following line, even if it is multi-line. Is that also your
understanding? Does it work like that with cppcheck?


It looks like ECLAIR requires a written-down number of lines of code to
deviate if it is more than 1 line. In this example it would be 2 lines:

     /* SAF-1-safe 2 */
     if (magic[0] != 037 ||
         ((magic[1] != 0213) && (magic[1] != 0236))) {

One option that I was thinking about is whether we can add the number of
lines automatically in xen-analysis based on the number of lines of the
next statement. What do you think?

It seems fragile to actually keep the number of lines inside the SAF
comment in the code. I am afraid it could get out of sync due to code
style refactoring or other mechanical changes.

Cheers,

Stefano

