Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBAE46596D
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 23:42:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236258.409812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msYID-0008Od-Po; Wed, 01 Dec 2021 22:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236258.409812; Wed, 01 Dec 2021 22:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msYID-0008Lp-Ml; Wed, 01 Dec 2021 22:41:37 +0000
Received: by outflank-mailman (input) for mailman id 236258;
 Wed, 01 Dec 2021 22:41:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msYIC-0008Lj-3l
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 22:41:36 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d54900b7-52f7-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 23:41:33 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34828)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msYI4-000qjh-7w (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 22:41:28 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 31AB21FDDA;
 Wed,  1 Dec 2021 22:41:28 +0000 (GMT)
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
X-Inumbo-ID: d54900b7-52f7-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <9c5c489d-8941-9be9-5af3-734894e99a00@srcf.net>
Date: Wed, 1 Dec 2021 22:41:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
 <aa19f4cf-6f62-3bf8-7057-7dae1cf28162@suse.com>
 <17bb5295-6207-0bf4-6432-426729a3a288@srcf.net>
 <b40d95d9-6bf5-e2cc-396c-12c3be6c48eb@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/vPMU: convert vendor hook invocations to altcall
In-Reply-To: <b40d95d9-6bf5-e2cc-396c-12c3be6c48eb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 07:32, Jan Beulich wrote:
> On 30.11.2021 21:56, Andrew Cooper wrote:
>> On 29/11/2021 09:10, Jan Beulich wrote:
>>> @@ -133,14 +133,13 @@ int vpmu_do_msr(unsigned int msr, uint64
>>>           goto nop;
>>>  
>>>      vpmu = vcpu_vpmu(curr);
>>> -    ops = vpmu->arch_vpmu_ops;
>>> -    if ( !ops )
>>> +    if ( !vpmu_is_set(vpmu, VPMU_INITIALIZED) )
>>>          goto nop;
>>>  
>>> -    if ( is_write && ops->do_wrmsr )
>>> -        ret = ops->do_wrmsr(msr, *msr_content, supported);
>>> -    else if ( !is_write && ops->do_rdmsr )
>>> -        ret = ops->do_rdmsr(msr, msr_content);
>>> +    if ( is_write && vpmu_ops.do_wrmsr )
>>> +        ret = alternative_call(vpmu_ops.do_wrmsr, msr, *msr_content, supported);
>>> +    else if ( !is_write && vpmu_ops.do_rdmsr )
>>> +        ret = alternative_call(vpmu_ops.do_rdmsr, msr, msr_content);
>> Elsewhere, you've dropped the function pointer NULL checks.  Why not here?
> No, I'm not dropping any function pointer checks here; all I drop is
> checks of the ops pointer being NULL. These checks all get dropped in
> patch 3.

Oh ok.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>
>>> --- a/xen/include/asm-x86/vpmu.h
>>> +++ b/xen/include/asm-x86/vpmu.h
>>> @@ -61,25 +61,25 @@ struct vpmu_struct {
>>>      u32 hw_lapic_lvtpc;
>>>      void *context;      /* May be shared with PV guest */
>>>      void *priv_context; /* hypervisor-only */
>>> -    const struct arch_vpmu_ops *arch_vpmu_ops;
>>>      struct xen_pmu_data *xenpmu_data;
>>>      spinlock_t vpmu_lock;
>>>  };
>>>  
>>>  /* VPMU states */
>>> -#define VPMU_CONTEXT_ALLOCATED              0x1
>>> -#define VPMU_CONTEXT_LOADED                 0x2
>>> -#define VPMU_RUNNING                        0x4
>>> -#define VPMU_CONTEXT_SAVE                   0x8   /* Force context save */
>>> -#define VPMU_FROZEN                         0x10  /* Stop counters while VCPU is not running */
>>> -#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x20
>>> +#define VPMU_INITIALIZED                    0x1
>>> +#define VPMU_CONTEXT_ALLOCATED              0x2
>>> +#define VPMU_CONTEXT_LOADED                 0x4
>>> +#define VPMU_RUNNING                        0x8
>>> +#define VPMU_CONTEXT_SAVE                   0x10  /* Force context save */
>>> +#define VPMU_FROZEN                         0x20  /* Stop counters while VCPU is not running */
>>> +#define VPMU_PASSIVE_DOMAIN_ALLOCATED       0x40
>>>  /* PV(H) guests: VPMU registers are accessed by guest from shared page */
>>> -#define VPMU_CACHED                         0x40
>>> -#define VPMU_AVAILABLE                      0x80
>>> +#define VPMU_CACHED                         0x80
>>> +#define VPMU_AVAILABLE                      0x100
>>>  
>>>  /* Intel-specific VPMU features */
>>> -#define VPMU_CPU_HAS_DS                     0x100 /* Has Debug Store */
>>> -#define VPMU_CPU_HAS_BTS                    0x200 /* Has Branch Trace Store */
>>> +#define VPMU_CPU_HAS_DS                     0x1000 /* Has Debug Store */
>>> +#define VPMU_CPU_HAS_BTS                    0x2000 /* Has Branch Trace Store */
>> Seeing as you're shuffling each of these, how about adding some leading
>> 0's for alignment?
> Fine with me; I did consider it at the time of writing the patch,
> but decided that such a change of non-mandatory style may not be
> justified here (or even in general), as there are also downsides
> to such padding: Once adding a constant with more significant
> digits, all pre-existing ones need touching to insert yet another
> zero.

I don't mind specifically if it gets left as-is, but having a pile of
constants like this tabulated correct makes a massive improvement to
code clarity.


That said, this whole flags infrastructure is almost exclusively
obfuscation, and I've got a good mind to replace it all with a
bitfield.  I'll save taking some shears to this code for another time.

~Andrew

