Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE457B98D2
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 01:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612808.952907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoBZz-00073I-1y; Wed, 04 Oct 2023 23:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612808.952907; Wed, 04 Oct 2023 23:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoBZy-00071s-V8; Wed, 04 Oct 2023 23:46:58 +0000
Received: by outflank-mailman (input) for mailman id 612808;
 Wed, 04 Oct 2023 23:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XhzZ=FS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qoBZw-000711-US
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 23:46:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4be7c203-6310-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 01:46:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C484CE1F99;
 Wed,  4 Oct 2023 23:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0D7C433C8;
 Wed,  4 Oct 2023 23:46:50 +0000 (UTC)
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
X-Inumbo-ID: 4be7c203-6310-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696463211;
	bh=t63+aQvma45AbzY9KUouSPT5IQo9SYFBi5Iojj+uAYM=;
	h=Date:From:To:cc:Subject:From;
	b=Hs25Y3NEj49vZE8vn8U7BHYR+mqsxgHwgfJl5BS52ZxGz33OmgLbmRqzKH3jUG4Aq
	 oZBxkjnGIf0VnTlgBi/O76swkwa+eNmeHxTdbXzCVVs0ipHsfh49faBkvRmpgnGSlC
	 gN6/OldpjUpFupyfmZ3KCOMYsPpaueLMSvnD+6TenxusvgjpGLag72shTI/ry9T9Ou
	 xTmuikYFY9qQ4j6Q1gtzuaOO6dov1Avn9V2iGmOEKvTUXxHwc3vvG3KHi36l0zxT35
	 fuUqlCB5DxrnHpWJDqhk+fDJaAZ7mwX6GUF0nbbJi1/gTCQEF0U8xc7CJnHCrxUe2A
	 +UI1yP2/AL1Bg==
Date: Wed, 4 Oct 2023 16:46:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com, roger.pau@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, george.dunlap@citrix.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: SAF-x-safe rename
Message-ID: <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi MISRA C working group (Jan, Roger, Andrew, Julien, Bertrand, George)

in a recent thread Andrew pointed out that the SAF-2-safe tag is
confusing and requested a rename:
https://marc.info/?l=xen-devel&m=169634970821202

As documented by docs/misra/documenting-violations.rst:

 - SAF-X-safe: This tag means that the next line of code contains a finding, but
   the non compliance to the checker is analysed and demonstrated to be safe.
 - SAF-X-false-positive-<tool>: This tag means that the next line of code
   contains a finding, but the finding is a bug of the tool.


Today we have already 28 instances of SAF tags in the Xen codebase.


Andrew suggested "ANALYSIS" instead of SAF so I would imagine:
- ANALYSIS-X-safe
- ANALYSIS-X-false-positive-<tool>

If we really want a rename I suggest to rename SAF to SAFE:
- SAFE-X-safe
- SAFE-X-false-positive-<tool>

Or maybe MISRA:
- MISRA-X-safe
- MISRA-X-false-positive-<tool>

But I actually prefer to keep the tag as it is today.


If you have any naming suggestions please let me know by Oct 11. After
that, I plan to run a Doodle poll to check the preference of the group.

Cheers,

Stefano

