Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA0470312
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 15:45:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243980.422116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvh8p-0003QZ-O0; Fri, 10 Dec 2021 14:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243980.422116; Fri, 10 Dec 2021 14:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvh8p-0003OR-L2; Fri, 10 Dec 2021 14:44:55 +0000
Received: by outflank-mailman (input) for mailman id 243980;
 Fri, 10 Dec 2021 14:44:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a5or=Q3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvh8o-0003OH-3N
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 14:44:54 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe59301-59c7-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 15:44:53 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:36080)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvh8k-000JOB-7Q (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 10 Dec 2021 14:44:50 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 072851FBFC;
 Fri, 10 Dec 2021 14:44:50 +0000 (GMT)
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
X-Inumbo-ID: bbe59301-59c7-11ec-9d12-4777fae47e2b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <dac66683-a2b1-e548-9d19-3a0e9a74c5cb@srcf.net>
Date: Fri, 10 Dec 2021 14:44:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-9-andrew.cooper3@citrix.com>
 <bddd9fc4-d442-9272-0fcd-4472c83e36e7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 08/65] xen: Annotate fnptr targets from acpi_table_parse()
In-Reply-To: <bddd9fc4-d442-9272-0fcd-4472c83e36e7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 08:36, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
> Elsewhere in this file we have
>
>         rc = map ?   map_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn))
>                  : unmap_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn));
>
> which has been in this shape only as of commit e3b418ac4919
> ("x86/pvh-dom0: Remove unnecessary function pointer call from
> modify_identity_mmio()"). Aren't we relying on the compiler not
> transforming this back into the earlier
>
>         rc = (map ? map_mmio_regions : unmap_mmio_regions)
>              (d, _gfn(pfn), nr_pages, _mfn(pfn));
>
> ?

That old code was especially dumb even before retpoline.  See also the
damage caused by c/s 245a320ce2.

Yes, we are relying on the compiler not to do transformations behind our
backs, but it won't of its own accord.

>  And aren't we further relying on the compiler not transforming direct
> calls into indirect ones for other reasons (I recall Microsoft's compiler
> being pretty aggressive about this when the same function was called
> more than once in close succession, it at least certain past versions)?

That sounds like a broken compiler.

There are legal cases where a direct call has to turn into an indirect
one, and that's when we need to traverse more than disp32 distance.

But without going to a larger mcmodel, we'd get linker errors before
that becomes a problem, because R_X86_64_PLT32 relocations can't be
retrofitted into an indirect call at link time.

> Is the widened effect of the annotation intended to also guarantee that
> indirect calls will not be produced by the compiler for any reason when
> the annotation is absent on a targeted function's declaration?

That would be one for the clang and gcc developers.

I don't see a plausible problem here.

~Andrew

