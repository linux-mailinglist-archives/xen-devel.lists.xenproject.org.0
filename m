Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6877828FE74
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 08:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7781.20507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJTK-0006iM-Du; Fri, 16 Oct 2020 06:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7781.20507; Fri, 16 Oct 2020 06:44:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTJTK-0006hx-Ax; Fri, 16 Oct 2020 06:44:14 +0000
Received: by outflank-mailman (input) for mailman id 7781;
 Fri, 16 Oct 2020 06:44:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTJTI-0006hs-Su
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:44:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f628764-2c53-4fdd-bc58-e06c0d956297;
 Fri, 16 Oct 2020 06:44:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 813D3ACD9;
 Fri, 16 Oct 2020 06:44:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTJTI-0006hs-Su
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 06:44:12 +0000
X-Inumbo-ID: 0f628764-2c53-4fdd-bc58-e06c0d956297
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f628764-2c53-4fdd-bc58-e06c0d956297;
	Fri, 16 Oct 2020 06:44:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602830648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HwZIN0/5cggcluncTcnNNvqypXWTvfy5WvjBm4xdXaM=;
	b=sJkyLCgTSNtFUM3cazEmrkG7Zuh0KbzJpwyPmc05eHPcaUBC7sBT7qtIw76r8gyMw8lmLf
	1I71SbGcXh0HNZHpdwgQKPlEkJ68XttkFLXqEGLbxXVy7sJIcAsALTPL/JQkIpJsM3xPCH
	oSXrExojoE0S3qS5C+hNDuXZ7TUWJn4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 813D3ACD9;
	Fri, 16 Oct 2020 06:44:08 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: XENMAPSPACE_gmfn{,_batch,_range} want to special case
 idx == gpfn
Message-ID: <920fa307-190e-dc11-f338-5b44a2126050@suse.com>
Date: Fri, 16 Oct 2020 08:44:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In this case up to now we've been freeing the page (through
guest_remove_page(), with the actual free typically happening at the
put_page() later in the function), but then failing the call on the
subsequent GFN consistency check. However, in my opinion such a request
should complete as an "expensive" no-op (leaving aside the potential
unsharing of the page).

This points out that f33d653f46f5 ("x86: replace bad ASSERT() in
xenmem_add_to_physmap_one()" would really have needed an XSA, despite
its description claiming otherwise, as in release builds we then put in
place a P2M entry referencing the about to be freed page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I've been considering to make such operations "cheap" NOPs rather than
"expensive" ones, by comparing idx and gpfn early in the function in
the XENMAPSPACE_gmfn case block, but I've come to the conclusion that
having the operation perform otherwise normally is better - this way,
errors that would result if idx != gpfn will still result. While I'm
open to reasons towards the other alternative, having the added check be
MFN-based makes crystal clear that we're dealing with the same
underlying physical resource, i.e. also covers the hypothetical(?) case
of two GFNs referring to the same MFN.

I'm unconvinced that it is correct for prev_mfn's p2mt to not be
inspected at all - I don't think things will go right if p2m_shared()
was true for it. But I'm afraid I'm not up to correcting mem-sharing
related logic.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4555,7 +4555,7 @@ int xenmem_add_to_physmap_one(
         if ( is_special_page(mfn_to_page(prev_mfn)) )
             /* Special pages are simply unhooked from this phys slot. */
             rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
-        else
+        else if ( !mfn_eq(mfn, prev_mfn) )
             /* Normal domain memory is freed, to avoid leaking memory. */
             rc = guest_remove_page(d, gfn_x(gpfn));
     }

