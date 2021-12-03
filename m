Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B99DD46786F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237652.412201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8hs-0002OA-K2; Fri, 03 Dec 2021 13:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237652.412201; Fri, 03 Dec 2021 13:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8hs-0002L9-GQ; Fri, 03 Dec 2021 13:34:32 +0000
Received: by outflank-mailman (input) for mailman id 237652;
 Fri, 03 Dec 2021 13:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LwEy=QU=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mt8hr-0002Kv-2M
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:34:31 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd1fd776-543d-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 14:34:29 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50974)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mt8hj-000WBP-hE (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 03 Dec 2021 13:34:23 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2446D1FC8B;
 Fri,  3 Dec 2021 13:34:23 +0000 (GMT)
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
X-Inumbo-ID: bd1fd776-543d-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <115c178b-f0a7-cf6e-3e33-e6aa49b17baf@srcf.net>
Date: Fri, 3 Dec 2021 13:34:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: xen: linker symbol mess, and freeing errors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Following the __ro_after_init work, I tried to complete a few pieces of
cleanup that I'd accrued, and everything has unravelled.

On x86, the __2M_* symbols haven't really been 2M aligned since their
introduction, and the utter mess that was _stext starting at 1M has long
since been cleared up.  Dropping the 2M prefix reveals that we have both
__init_{start,begin} and identifying that lead to discovering that

    /* Destroy Xen's mappings, and reuse the pages. */
    if ( using_2M_mapping() )
    {
        start = (unsigned long)&__2M_init_start,
        end   = (unsigned long)&__2M_init_end;
    }
    else
    {
        start = (unsigned long)&__init_begin;
        end   = (unsigned long)&__init_end;
    }

is a tautology that nothing is capable of optimising.

So I set about trying to simply both x86 and ARM down to a single sets
of bounding variables, with a requirement that these would be expected
to be common across all architectures.

I'm intending to use __$FOO_{start,end} because we're semi-consistent on
this already, and get rid of the ones such as _{s,e}$FOO because they're
unnecessarily obscure, and complicated to read for a compound foo.

At this point (as I haven't really started yet), I could be persuaded on
a different naming scheme if anyone has any strong views.


But that's only the start of the fun.  The is_kernel() predicate is
broken (or at least problematic) because it covers the init section. 
Reviewing its usage shows that ARM is broken when trying to handle
BUG/ASSERT in livepatches, because they don't check is_patch() on the
message target.  But for both x86 and ARM, this should be restricted to
(a new) is_active_rodata() predicate.

The x86 xen_region[] bss logic is broken, because of ebmalloc.  Its dumb
to have the ebmalloc region anywhere but at the end of bss (at least we
could avoid punching a hole in the middle of the BSS, and avoid needing
an extra region for tboot/etc), but honestly, 1M is excessive for what
it contains, and 8k is probably plenty (so call it 32/64k for headroom),
and we'll be in a far better position not freeing it at all.  Saving a
few kb of memory is absolutely not worth the breakages it introduces. 
In particular...

is_xen_fixed_mfn() is broken for it's main caller, because it includes
MFNs which are not Xen's, and the offline page logic will take the wrong
action.

The helper is also unnecessarily complicated, and unnecessarily
different between x86 and ARM.  ARM has paddr_t phys_offset, while x86
has xen_phys_start  (ARM even extern's it, looking like copy&paste from
x86), both of which relate to XEN_VIRT_START.

Details like this really need to be common, as they're invariant of
architecture.  Furthermore, making it common allows us to consolidate
helpers such as is_xen_fixed_mfn() in common logic too, which
substantially reduces the complexity for common code trying to figure
out whether predicates with the same name are the same in each arch
(because some are not).

Therefore, I'm going to make it common, along with a very clear
description of what it is and how to use it.

On x86, we further have a mess between XEN_VIRT_START and
__XEN_VIRT_START, along with XEN_IMG_OFFSET.  Now that head.S was
rewritten to be position independent for MB2, this is easy to resolve,
and doing so will massively simplify the linker file, and the setup logic.

On ARM, the embedded dtb support wants a rethink, because it was placed
after BSS, rendering any space-saving null and void in the compiled (and
loaded) image.  There is also nothing which checks the BSS is correctly
aligned for the zeroing loops (which I do have fix for).


I'm fairly sure I've forgotten some things, but lets start with these
for now.  I really am quite alarmed at the mess and errors we've got
with freeing various pieces of the compiled image.

~Andrew

