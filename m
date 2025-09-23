Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A844B962E6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 16:19:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128404.1468766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13qt-0000yO-0C; Tue, 23 Sep 2025 14:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128404.1468766; Tue, 23 Sep 2025 14:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v13qs-0000vm-T8; Tue, 23 Sep 2025 14:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1128404;
 Tue, 23 Sep 2025 14:18:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v13qr-0000vg-CW
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 14:18:41 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 339da682-9888-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 16:18:40 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso3401335f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 07:18:39 -0700 (PDT)
Received: from [172.20.5.108] ([50.239.116.157])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33060619253sm16514548a91.4.2025.09.23.07.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 07:18:38 -0700 (PDT)
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
X-Inumbo-ID: 339da682-9888-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758637119; x=1759241919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hnL+TBSgCYqTL4vGYnVPUwW+/cEh1JjfV8yMCpwGGk=;
        b=UM2tXDwSRrse9vfln+2OnKtA2ayRCYgCfF/uViYbKFzgvV4FeUPpZlS3l3C+GEs/h2
         h4+Wl6hMWnoaQBdIAKpUZfhLjW/T25zVzWnMob0XsLQIUK6OUKd6l4w5zme/fW7KPnpK
         I7QUzv13+F5o7qUREJgFqOx+wHgNiflfPDpjIdAwtjj2AUkguCX9L70gUszdNSWPmqFO
         obsDCQIcSF8+6IycHzUpc9MY+WwsB3vhm1uaFxYM2OZ1v0POMuUCwQCMxOPnNrb55N9P
         jArGHQxomyBNDAp0LYRUVunr8sXsgAHrE+RyjonUkgG4zxxSrVIohsp+biMx50NWT4Qw
         9sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637119; x=1759241919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hnL+TBSgCYqTL4vGYnVPUwW+/cEh1JjfV8yMCpwGGk=;
        b=P2VyPtE+Jppb7ukL5KkM4jy1SP6JTUWNWolcT9yW86De2wHIFkDgM0HKqxDvSdqgmN
         b40yPXM2YtTY4ZgwPBvcoDFUrnz6SEogwpU4o4kFDJOffD/yAenbM40eDLJzwc0mqqIb
         mOWE1CkmPxx3sko8FGQeQCB2XYWV6kXt9/eHm/DHgpJKn+VmDySQVuutY4APVp4wrW0+
         MBTr5qArMdbgRIe+Qt/sfzLr9mKoiQ/OFhRzH3yZG8mxFwZbmlfH7ot6kJmYqnrSJ/R1
         x/InufXK1to6ExVQge6V3ZPkwxoWm6ax56M8yjTXIWNWtmpTITJ0ZIR16ISD51tYe64n
         X+sA==
X-Forwarded-Encrypted: i=1; AJvYcCWffDyxfi+knVXwi5WTNAzY3UrVmne2NdUSZOnI8EbLzK5mccpuhu43E5+AvaYaDUmTr0u15RCfwls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS0Ozc34UIwYkOLbDWdS1OP9Q4ORm1TGq3AD1ZsvOeRC2Vy71Z
	2oFHGotdEgsucjf8sTuBEZgsU+p/xOt6yp0YHmjAYHj7+DMi5GVBx+sam44KVHtuTQ==
X-Gm-Gg: ASbGncuZ/eNUGD+copXbhIYAikDxuxEfgzc2A93kxuwLfy1nLeMy7bSVUMH85GU67LE
	n2meIQ9aDq386XowbRJzZeWrlgtZYT1MFWStCpQiPTAuqFWRGunkpUvlXKDjS3PC3v9QcIzOMJN
	0osKwLLpnzhP+inIzobLdkZlcVuuaCar+yVfh95rASfoZuzoWmoXSEKtH71QgcDBUBcMX6RZkKY
	9zQ9ss9QxgGLNN5kxDpUQRW2KopBZWLFRmgJdJM7aOPcK2koinJ+lLd+k+8Npf6E/UGnP27Pnxr
	1We2oCUmtFkCX1+jZjaWKJ4iwlJ3wxDzCc2MyXqEBxgC4ebYr0CFYiuVxKSFoKGwqa4RbVxgokI
	JBR5pFGh+jPtwZetEVG2vX63wj99EYM/M
X-Google-Smtp-Source: AGHT+IENCRlBu4swxzv3D0VfPtVRhv6OQ8pilkQjOpw5Vc1Qr/O/f5yNEom/MPZYMaai4HLuVV8jGw==
X-Received: by 2002:a05:6000:178e:b0:401:2cbf:ccad with SMTP id ffacd0b85a97d-405cf9c1c48mr2182174f8f.17.1758637119142;
        Tue, 23 Sep 2025 07:18:39 -0700 (PDT)
Message-ID: <0c268124-b0a4-451e-8713-827b8074c767@suse.com>
Date: Tue, 23 Sep 2025 16:18:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20250912045254.3731398-1-Penny.Zheng@amd.com>
 <e29930b6-2f13-483b-a8ce-62a93550199d@suse.com>
 <DM4PR12MB8451FAC5FB96133C64325DEDE11DA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM4PR12MB8451FAC5FB96133C64325DEDE11DA@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.09.2025 10:19, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, September 12, 2025 3:30 PM
>> To: Penny, Zheng <penny.zheng@amd.com>; Tamas K Lengyel
>> <tamas@tklengyel.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Alexandru Isaila <aisaila@bitdefender.com>; Petre Pircalabu
>> <ppircalabu@bitdefender.com>; xen-devel@lists.xenproject.org; Oleksii Kurochko
>> <oleksii.kurochko@gmail.com>
>> Subject: Re: [PATCH] xen/vm_event: introduce vm_event_is_enabled()
>>
>> On 12.09.2025 06:52, Penny Zheng wrote:
>>> @@ -2462,9 +2461,8 @@ int hvm_set_cr3(unsigned long value, bool noflush,
>> bool may_defer)
>>>      if ( may_defer && unlikely(currd->arch.monitor.write_ctrlreg_enabled &
>>>                                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR3)) )
>>>      {
>>> -        ASSERT(curr->arch.vm_event);
>>> -
>>> -        if ( hvm_monitor_crX(CR3, value, curr->arch.hvm.guest_cr[3]) )
>>> +        if ( vm_event_is_enabled(curr) &&
>>> +             hvm_monitor_crX(CR3, value, curr->arch.hvm.guest_cr[3])
>>> + )
>>>          {
>>>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>>>              curr->arch.vm_event->write_data.do_write.cr3 = 1; @@
>>> -2544,9 +2542,7 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
>>>      if ( may_defer && unlikely(v->domain->arch.monitor.write_ctrlreg_enabled &
>>>                                 monitor_ctrlreg_bitmask(VM_EVENT_X86_CR4)) )
>>>      {
>>> -        ASSERT(v->arch.vm_event);
>>> -
>>> -        if ( hvm_monitor_crX(CR4, value, old_cr) )
>>> +        if ( vm_event_is_enabled(v) && hvm_monitor_crX(CR4, value,
>>> + old_cr) )
>>>          {
>>>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>>>              v->arch.vm_event->write_data.do_write.cr4 = 1; @@ -3407,7
>>> +3403,7 @@ static enum hvm_translation_result __hvm_copy(
>>>              return HVMTRANS_bad_gfn_to_mfn;
>>>          }
>>>
>>> -        if ( unlikely(v->arch.vm_event) &&
>>> +        if ( unlikely(vm_event_is_enabled(v)) &&
>>>               (flags & HVMCOPY_linear) &&
>>>               v->arch.vm_event->send_event &&
>>>               hvm_monitor_check_p2m(addr, gfn, pfec,
>>> npfec_kind_with_gla) ) @@ -3538,6 +3534,7 @@ int hvm_vmexit_cpuid(struct
>> cpu_user_regs *regs, unsigned int inst_len)
>>>      struct vcpu *curr = current;
>>>      unsigned int leaf = regs->eax, subleaf = regs->ecx;
>>>      struct cpuid_leaf res;
>>> +    int ret = 0;
>>>
>>>      if ( curr->arch.msrs->misc_features_enables.cpuid_faulting &&
>>>           hvm_get_cpl(curr) > 0 )
>>> @@ -3554,7 +3551,10 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs,
>> unsigned int inst_len)
>>>      regs->rcx = res.c;
>>>      regs->rdx = res.d;
>>>
>>> -    return hvm_monitor_cpuid(inst_len, leaf, subleaf);
>>> +    if ( vm_event_is_enabled(curr) )
>>> +        ret = hvm_monitor_cpuid(inst_len, leaf, subleaf);
>>> +
>>> +    return ret;
>>>  }
>>>
>>>  void hvm_rdtsc_intercept(struct cpu_user_regs *regs) @@ -3694,9
>>> +3694,8 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t
>> msr_content,
>>>          if ( ret != X86EMUL_OKAY )
>>>              return ret;
>>>
>>> -        ASSERT(v->arch.vm_event);
>>> -
>>> -        if ( hvm_monitor_msr(msr, msr_content, msr_old_content) )
>>> +        if ( vm_event_is_enabled(v) &&
>>> +             hvm_monitor_msr(msr, msr_content, msr_old_content) )
>>>          {
>>>              /* The actual write will occur in hvm_do_resume(), if permitted. */
>>>              v->arch.vm_event->write_data.do_write.msr = 1; @@
>>> -3854,12 +3853,10 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
>>>      struct vcpu *curr = current;
>>>      struct domain *currd = curr->domain;
>>>
>>> -    if ( currd->arch.monitor.descriptor_access_enabled )
>>> -    {
>>> -        ASSERT(curr->arch.vm_event);
>>> +    if ( currd->arch.monitor.descriptor_access_enabled &&
>>> +         vm_event_is_enabled(curr) )
>>>          hvm_monitor_descriptor_access(exit_info, vmx_exit_qualification,
>>>                                        descriptor, is_write);
>>> -    }
>>>      else if ( !hvm_emulate_one_insn(is_sysdesc_access, "sysdesc access") )
>>>          domain_crash(currd);
>>
>> Following "xen: consolidate CONFIG_VM_EVENT" this function is actually
>> unreachable when VM_EVENT=n, so no change should be needed here. It's instead
>> the unreachability which needs properly taking care of (to satisfy Misra
>> requirements) there.
>>
> 
> I'm a bit confused and may not understand you correctly here.
> Just because that hvm_monitor_descriptor_access() will become unreachable codes when VM_EVENT=n, and to avoid writing stubs, we added the vm_event_xxx check here. Or maybe you want me to add description to say the new checking also helps compiling out unreachable codes?

If the function becomes unreachable, it's not its contents which need
altering. Instead, the unreachable function should be "removed" (by
#ifdef-ary) altogether in the respective configuration. Recall that
unreachability is a Misra violation (or a rule that iirc we accepted).

Jan

