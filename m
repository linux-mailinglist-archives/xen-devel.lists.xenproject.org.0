Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F7461AA2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 16:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234613.407151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriI6-0000Dh-90; Mon, 29 Nov 2021 15:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234613.407151; Mon, 29 Nov 2021 15:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mriI6-0000AO-47; Mon, 29 Nov 2021 15:10:02 +0000
Received: by outflank-mailman (input) for mailman id 234613;
 Mon, 29 Nov 2021 15:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K9yz=QQ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mriI5-0008Tq-35
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 15:10:01 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aeed4fd-5126-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 16:09:59 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39796)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mriHv-000XaE-or (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 29 Nov 2021 15:09:51 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 065BA1FC54;
 Mon, 29 Nov 2021 15:09:51 +0000 (GMT)
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
X-Inumbo-ID: 6aeed4fd-5126-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c05512bf-ceff-8402-07ec-17e44163d45f@srcf.net>
Date: Mon, 29 Nov 2021 15:09:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <178aa1cd-b510-7e3a-2074-a2ae261d4975@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 00/65] x86: Support for CET Indirect Branch Tracking
In-Reply-To: <178aa1cd-b510-7e3a-2074-a2ae261d4975@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2021 14:44, Jan Beulich wrote:
> On 26.11.2021 13:33, Andrew Cooper wrote:
>> CET Indirect Branch Tracking is a hardware feature designed to protect against
>> forward-edge control flow hijacking (Call/Jump oriented programming), and is a
>> companion feature to CET Shadow Stacks added in Xen 4.14.
>>
>> This series depends on lots of previously posted patches.  See
>> xenbits/xen-cet-ibt for the full branch with all dependencies.
>>
>> Patch 1 introduces some compile time infrastructure.
>>
>> Patches 2 thru 56 annotate all function pointer targets in the common and x86
>> hypervisor code.  Patches are split by API and in no particular order, and
>> largely mechanical.  As such, I'm limiting review mainly to The Rest.  While
>> doing this work does depend on an experimental GCC change (patch 56), the
>> result does actually work properly with GCC 9 onwards.
>>
>> Patches 57 thru 65 do the final enablement of CET-IBT.
>>
>> I have developed this on a TigerLake NUC.  Many thanks to Marek who has also
>> given the series a spin on a TigerLake laptop.
>>
>> Some CI runs, green across the board:
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/416737379
>>   https://cirrus-ci.com/build/6547947216175104
>>
>> Various note accumulated through the work:
>>   * I have already posted patches fixing some of the most egregious (ab)uses of
>>     function pointers.  There are plenty of other areas which could do with
>>     cleanup.
>>   * With everything turned on, we get 1688 runtime endbr64's, and 233 init
>>     time.  The number of runtime endbr64's is expected to reduce with
>>     Juergen's hypercall series (see later), and in common deployment cases
>>     where not everything is compiled in by default.
>>   * I have not checked for misaligned endbr64's, and I'm not sure there is
>>     anything useful we could do upon discovering that there were any.
>>     Naively, there is a 1 in 2^32 chance (endbr64 being 4 bytes long), but
>>     this doesn't account for the structure of x86 code, which is most
>>     certainly not a uniform random distribution of bytes.
>>   * I have followup work to reduce the number of runtime endbr64's using boot
>>     time patching, which further improves the security benefit.
>>   * Patches 2 and 3 are a minimal subset of Juergen's hypercall series, with
>>     patch 4 annotating every hypercall.  I failed to get the full series pass
>>     in CI, so put this together as a stopgap.  It reduces the dependencies
>>     involved, and patch 4 can be dropped if the hypercall series gets in
>>     first.
>>   * The x86 MTRR code is a complete mess, and as far as I can tell, is mostly
>>     pre-64bit support.  It could do with a prune.
>>   * We do many passes of the MADT counting objects.  This is a waste of time
>>     and we should count them on a single pass.
>>   * The NUMA setup (SRAT parsing) appears to happen twice.  I'm pretty sure
>>     this is one too many.
>>
>> Andrew Cooper (63):
>>   x86: Introduce support for CET-IBT
>>   x86/hypercall: Annotate fnptr targets
>>   xen: Annotate fnptr targets from custom_param()
>>   xen: Annotate fnptr targets from __initcall()
>>   xen: Annotate fnptr targets from notifier callbacks
>>   xen: Annotate fnptr targets from acpi_table_parse()
>>   xen: Annotate fnptr targets from continue_hypercall_on_cpu()
>>   xen: Annotate fnptr targets from init_timer()
>>   xen: Annotate fnptr targets from call_rcu()
>>   xen: Annotate fnptr targets from IPIs
>>   xen: Annotate fnptr targets from open_softirq()
>>   xsm/flask:  Annotate fnptr targets in the security server
>>   xsm: Annotate fnptr targets
>>   xen/sched: Annotate fnptr targets
>>   xen/evtchn: Annotate fnptr targets
>>   xen/hypfs: Annotate fnptr targets
>>   xen/tasklet: Annotate fnptr targets
>>   xen/keyhandler: Annotate fnptr targets
>>   xen/vpci: Annotate fnptr targets
>>   xen/decompress: Annotate fnptr targets
>>   xen/iommu: Annotate fnptr targets
>>   xen/video: Annotate fnptr targets
>>   xen/console: Annotate fnptr targets
>>   xen/misc: Annotate fnptr targets
>>   x86: Annotate fnptr targets from request_irq()
>>   x86/hvm: Annotate fnptr targets from hvm_funcs
>>   x86/hvm: Annotate fnptr targets from device emulation
>>   x86/emul: Annotate fnptr targets
>>   x86/ucode: Annotate fnptr targets
>>   x86/power: Annotate fnptr targets
>>   x86/apic: Annotate fnptr targets
>>   x86/nmi: Annotate fnptr targets
>>   x86/mtrr: Annotate fnptr targets
>>   x86/idle: Annotate fnptr targets
>>   x86/quirks: Annotate fnptr targets
>>   x86/hvmsave: Annotate fnptr targets
>>   x86/mce: Annotate fnptr targets
>>   x86/pmu: Annotate fnptr targets
>>   x86/cpu: Annotate fnptr targets
>>   x86/guest: Annotate fnptr targets
>>   x86/logdirty: Annotate fnptr targets
>>   x86/shadow: Annotate fnptr targets
>>   x86/hap: Annotate fnptr targets
>>   x86/p2m: Annotate fnptr targets
>>   x86/irq: Annotate fnptr targets
>>   x86/aepi: Annotate fnptr targets
>>   x86/psr: Annotate fnptr targets
>>   x86/dpci: Annotate fnptr targets
>>   x86/pt: Annotate fnptr targets
>>   x86/time: Annotate fnptr targets
>>   x86/misc: Annotate fnptr targets
>>   x86/stack: Annotate fnptr targets
>>   x86/bugframe: Annotate fnptr targets
> Patches 4-55 as applicable
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> preferably with the subjects disambiguated and the minor remarks on
> individual patches taken care of one way or another. It seems to me as
> if the annotations on declarations are going to obtain a meaning, so I
> guess I'm okay seeing them added despite not having any function there
> just yet.
>
> One question though: With the large number of __init functions gaining
> cf_check, wouldn't it be possible to turn on CET-IBT only when we're
> done using .init.text?

233 to be precise.

GCC can't distinguish init from non-init functions as far as the
improved typechecking (patch 56) goes, so omitting __init would cause
compilation issues.

Furthermore, CET-IBT is only one Control Flow Integrity scheme
attempting to use a nominally arch-neutral interface.  There are others
(PaX RAP, and Intel's FineIBT) which have software components to them,
and for those, the function pointer callers and callees need to have all
appropriate ABI modifications.

I'm pretty certain that if we skipped annotation of the __init functions
for now, we'd have to add them in due course anyway.

We could defer enabling CET-IBT until late on boot, but enabling it
early gets us better coverage of issues until the first software scheme
turns up.

~Andrew

