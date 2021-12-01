Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BABA46502B
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 15:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236048.409410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msQlq-0006ze-6T; Wed, 01 Dec 2021 14:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236048.409410; Wed, 01 Dec 2021 14:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msQlq-0006xL-3M; Wed, 01 Dec 2021 14:39:42 +0000
Received: by outflank-mailman (input) for mailman id 236048;
 Wed, 01 Dec 2021 14:39:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msQlo-0006xF-RN
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 14:39:40 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82efb41d-52b4-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 15:39:39 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:43982)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msQlh-000cu0-1W (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 14:39:33 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 5416E1FC17;
 Wed,  1 Dec 2021 14:39:32 +0000 (GMT)
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
X-Inumbo-ID: 82efb41d-52b4-11ec-b945-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <2a448375-6f57-578f-6ac3-ba818d0c2eb3@srcf.net>
Date: Wed, 1 Dec 2021 14:39:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <e0819175-83b4-9489-8e4b-7be4940f1d54@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 2/4] VT-d / x86: re-arrange cache syncing
In-Reply-To: <e0819175-83b4-9489-8e4b-7be4940f1d54@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 09:40, Jan Beulich wrote:
> The actual function should always have lived in core x86 code; move it
> there, replacing get_cache_line_size() by readily available (except very
> early during boot; see the code comment) data.
>
> Drop the respective IOMMU hook, (re)introducing a respective boolean
> instead. Replace a true and an almost open-coding instance of
> iommu_sync_cache().

Coherency (or not) is a per-IOMMU property, not a global platform
property.  iGPU IOMMUs are very different to those the uncore, and
there's no reason to presume that IOMMUs in the PCH would have the same
properties as those in the uncore.

Given how expensive sync_cache() is, we cannot afford to be using it for
coherent IOMMUs in a mixed system.

This wants to be a boolean in arch_iommu.


> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Placing the function next to flush_area_local() exposes a curious
> asymmetry between the SFENCE placements: sync_cache() has it after the
> flush, while flush_area_local() has it before it. I think the latter one
> is misplaced.

Wow this is a mess.

First and foremost, AMD state that on pre-CLFLUSHOPT parts, CLFLUSH is
unordered with ~anything (including SFENCE), and need bounding with
MFENCE on both sides.  We definitely aren't doing this correctly right now.


AMD explicitly states that SFENCE drains the store and WC buffers (i.e.
make stuff instantaneously globally visible).  Intel does not, and
merely guarantees ordering.

A leading SFENCE would only make sense if there were WC concerns, but
both manuals say that the memory type doesn't matter, so I can't see a
justification for it.

What does matter, from the IOMMU's point of view, is that the line has
been written back (or evicted on pre-CLWB parts) before the IOTLB
invalidation occurs.  The invalidation will be a write to a different
address, which is why the trailing SFENCE is necessary, as CLFLUSHOPT
isn't ordered with respect to unaliasing writes.


On a more minor note, both Intel and AMD say that CLFLUSH* are permitted
to target an execute-only code segment, so we need a fix in
hvmemul_cache_op()'s use of hvmemul_virtual_to_linear(...,
hvm_access_read, ...) which will currently #GP in this case.

>
> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -11,6 +11,7 @@
>  #include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/softirq.h>
> +#include <asm/cache.h>
>  #include <asm/flushtlb.h>
>  #include <asm/invpcid.h>
>  #include <asm/nops.h>
> @@ -265,6 +266,57 @@ unsigned int flush_area_local(const void
>      return flags;
>  }
>  
> +void sync_cache(const void *addr, unsigned int size)

Can we name this cache_writeback()?  sync is very generic, and it really
doesn't want confusing cache_flush().

~Andrew

