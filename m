Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3496B52D38C
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 15:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332946.556715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrfqy-0000Tq-TH; Thu, 19 May 2022 13:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332946.556715; Thu, 19 May 2022 13:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrfqy-0000RM-Qb; Thu, 19 May 2022 13:06:08 +0000
Received: by outflank-mailman (input) for mailman id 332946;
 Thu, 19 May 2022 13:06:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a//1=V3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nrfqx-0000RG-5p
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 13:06:07 +0000
Received: from ppsw-41.csi.cam.ac.uk (ppsw-41.csi.cam.ac.uk [131.111.8.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f2aba07-d774-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 15:06:05 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34306)
 by ppsw-41.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nrfqg-000gSU-Py (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 19 May 2022 14:05:50 +0100
Received: from [10.80.3.190] (default-46-102-197-194.interdsl.co.uk
 [46.102.197.194]) (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C471C1FA77;
 Thu, 19 May 2022 14:05:49 +0100 (BST)
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
X-Inumbo-ID: 6f2aba07-d774-11ec-bd2c-47488cf2e6aa
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <096a2967-1947-1d49-fa9f-c33bce7bb108@srcf.net>
Date: Thu, 19 May 2022 14:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20220517132130.38185-1-roger.pau@citrix.com>
 <20220517132130.38185-2-roger.pau@citrix.com>
 <84ee0886-9ed2-97ad-e9f9-c81e8a3885c5@citrix.com>
 <YoY2LLyaXhX9aJQ4@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/2] x86/vmx: implement Bus Lock detection
In-Reply-To: <YoY2LLyaXhX9aJQ4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/05/2022 13:21, Roger Pau Monné wrote:
> On Wed, May 18, 2022 at 10:50:02PM +0000, Andrew Cooper wrote:
>> On 17/05/2022 14:21, Roger Pau Monne wrote:
>>> Add support for enabling Bus Lock Detection on Intel systems.  Such
>>> detection works by triggering a vmexit, which is enough of a pause to
>>> prevent a guest from abusing of the Bus Lock.
>> "which is enough of a" is a bit firmer than ideal.  "which Andy says
>> will be ok" is perhaps more accurate.
>>
>> Perhaps "which ought to be enough" ?
>>
>> A buslock here or there is no problem, and non-malicious software
>> appears to be devoid of buslocks (hardly surprising - it would be a hard
>> error on other architectures), but a malicious piece of userspace can
>> trivially cripple the system.
>>
>> Forcing a vmexit on every buslock limits an attacker to one buslock per
>> however long a vmentry/exit cycle takes.
>>
>>> Add an extra perf counter to track the number of Bus Locks detected.
>> extra Xen perf counter.
>>
>> Because other hypervisors use actual perf counters to emulate this
>> ability on current hardware.  Maybe something we should consider...
>>
>>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>>> index d03e78bf0d..02cc7a2023 100644
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -4053,6 +4053,16 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>>  
>>>      if ( unlikely(exit_reason & VMX_EXIT_REASONS_FAILED_VMENTRY) )
>>>          return vmx_failed_vmentry(exit_reason, regs);
>>> +    if ( unlikely(exit_reason & VMX_EXIT_REASONS_BUS_LOCK) )
>>> +    {
>>> +        /*
>>> +         * Delivery of Bus Lock VM exit was pre-empted by a higher priority VM
>>> +         * exit.
>>> +         */
>>> +        exit_reason &= ~VMX_EXIT_REASONS_BUS_LOCK;
>>> +        if ( exit_reason != EXIT_REASON_BUS_LOCK )
>>> +            perfc_incr(buslock);
>> I'm pretty sure you can drop the if, and do the perfc_incr()
>> unconditionally.  You won't get EXIT_REASON_BUS_LOCK |
>> VMX_EXIT_REASONS_BUS_LOCK given that wording in the ISE.
> I though the same, but got a EXIT_REASON_BUS_LOCK |
> VMX_EXIT_REASONS_BUS_LOCK fairly easy by simply doing a xchg over a
> cache line boundary.
>
> I think at least on the model I'm testing it looks like
> VMX_EXIT_REASONS_BUS_LOCK is added unconditionally, regardless of
> whether the vmexit itself is already EXIT_REASON_BUS_LOCK.

Hmm, in which case you've found either an SDP bug, or a documentation bug.

Lets follow up with Intel and try to identify which it is.

~Andrew

