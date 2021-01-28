Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F93077A0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77062.139378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57vb-0003Eb-I0; Thu, 28 Jan 2021 14:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77062.139378; Thu, 28 Jan 2021 14:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l57vb-0003EB-EP; Thu, 28 Jan 2021 14:05:43 +0000
Received: by outflank-mailman (input) for mailman id 77062;
 Thu, 28 Jan 2021 14:05:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l57va-0003Dm-0N
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:05:42 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0955a34a-bac1-4dc7-80d2-1253f5292c0d;
 Thu, 28 Jan 2021 14:05:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id h12so7712536lfp.9
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 06:05:40 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l6sm2094781lje.6.2021.01.28.06.05.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:05:37 -0800 (PST)
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
X-Inumbo-ID: 0955a34a-bac1-4dc7-80d2-1253f5292c0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nGmqKAI/EiS5jVDpz7vEG7dK+bUpsPIecrGiHz+6uD4=;
        b=ihvNfq4iLKvzLgPvHHFPdDjf7Qdw0ESk2DeB1tF7gPw7eKnc3uAvEmKB9i4zxhsr/J
         NdvIu+f+nl2VNmIGoAhWdqO2gNwo5YyFfbTm/FFWYrzy9JTpI/c1gvPImP93THgI3Vr1
         zzh/cPve1kuHl3BQMDzDrjl6pvgVvQ6/IobAgbzww6iJFDLI4mYOAxA3gZrJMm3YnMqk
         CI2cTztFSepBv04huFiUeljzXX19p2PlMKqQlKEAzAyO3Wyycm7ZC3ICERFnAnQZS3nP
         zAwee0cNNQ0jqTGD12xd8LipeiGa3TBbFTdTTYHAL24L5yWyeDdqNs3okI78qNK1fp9E
         CmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nGmqKAI/EiS5jVDpz7vEG7dK+bUpsPIecrGiHz+6uD4=;
        b=d7TqwMUTYl1PTbDVyOztT7hmLyp0PtOmKStuw1GwKeYVwbSRvNP3rOG/E2kCH25XiT
         27vxKaAZRizhAEdJHwm5WH4RVzw/XTaU1Ts2yHyNLcKinW5ijEKKRQnV8QTOMTLIa38J
         2zFEnUwm3tS/uJB7LfmdT/Sn5pgiVOrsWcYTafvACysp6XdD6YHPbG/xDqN5SqzpsWNw
         aH7CBBl2UkrA8jORd+Gu8xCWtlvgjN1Tu8gwPJ+YzusmRIDPKxD/MjW8Kdyqjahkjd1S
         A4eK8oFQ/wQMslvt6PNo5STJ7ov2ylUKsno36briTTHadJa7x8mqEdE3CbLrI4yHAKBb
         +7nQ==
X-Gm-Message-State: AOAM533W1xipQrqCG0xS9c3qmmTpdxflPlfmzOvhO+fo7OrIehgD3MUc
	3BMJXbDmxdKq8xt+v7wI3lU=
X-Google-Smtp-Source: ABdhPJxrVd/W7jbyMbGZk8XB6/LG/hmRSFmOPaT7AKL1/Bg/Xmz/x1xMMZrWlm7i/Ps3rwZEuPz+Lg==
X-Received: by 2002:a19:8983:: with SMTP id l125mr7612024lfd.274.1611842739174;
        Thu, 28 Jan 2021 06:05:39 -0800 (PST)
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
 <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <39421ab3-2b30-52a2-53b6-753aaf1fd16b@gmail.com>
Date: Thu, 28 Jan 2021 16:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 15:41, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


>
> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The IOREQ is a common feature now and these fields will be used
>> on Arm as is. Move them to common struct vcpu as a part of new
>> struct vcpu_io and drop duplicating "io" prefixes. Also move
>> enum hvm_io_completion to xen/sched.h and remove "hvm" prefixes.
>>
>> This patch completely removes layering violation in the common code.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>
> I seem to have trouble running Xen on x86 platform after this patch is 
> applied (see trace below).
First of all thank you for testing! I admit, I didn't physically test on 
x86 (but performed various build tests).
Also, in current patch I mostly did (or even all) mechanical changes 
which wouldn't change a behavior I think,
what is more that I tried to retain existing x86 behavior as much as I 
could not only in current patch,
but among all patches in this series.

>
>
> The bisector pointed out to this patch but I can't quite figure out 
> why this is breaking.
>
> Does this ring any bell to someone?
>
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch 
> input)
> (XEN) ----[ Xen-4.15-unstable  x86_64  debug=n gcov=y  Tainted: C   ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d04041c1c7>] 
> x86_64/entry.S#restore_all_guest+0x7/0x145
> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor (d0v0)
> (XEN) rax: 00000000000000ff   rbx: ffff83027c806000   rcx: 
> ffff82d0406c9a80
> (XEN) rdx: 0000000000000000   rsi: fffffffffffffed9   rdi: 
> 0000000000000001
> (XEN) rbp: ffff83027c887df0   rsp: ffff83027c887ef8   r8: 
> 00000000aaa8946e
> (XEN) r9:  0000000000000002   r10: ffff83027c806040   r11: 
> ffff83027c8cc020
> (XEN) r12: ffff83027c80f000   r13: ffff83027c895000   r14: 
> 0000000000000000
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 
> 00000000003426e0
> (XEN) cr3: 0000000273a2d000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 
> 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d04041c1c7> 
> (x86_64/entry.S#restore_all_guest+0x7/0x145):
> (XEN)  00 48 8b 93 98 0d 00 00 <44> 8b 3a 4c 8b 8b 68 0b 00 00 ba ff 
> 7f 00 00 48
> (XEN) Xen stack trace from rsp=ffff83027c887ef8:
> (XEN)    0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> (XEN)    0000000000000000 ffffffff83a2c000 0000000000000000 
> 0000000000000000
> (XEN)    ffffffff82c9e160 000000000000e033 0000000000000200 
> ffffffff83a4f000
> (XEN)    000000000000e02b 0000000000000000 0000000000000000 
> 00000000ffffffff
> (XEN)    0000000000000000 0000e01000000001 ffff83027c806000 
> 000000323c1d9000
> (XEN)    00000000003426e0 0000000000000000 0000000000000000 
> 0000060100000000
> (XEN)    0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04041c1c7>] R 
> x86_64/entry.S#restore_all_guest+0x7/0x145
> (XEN)
> (XEN) Pagetable walk from 0000000000000000:
> (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
> (XEN) Xen lock profile info SHOW  (now = 4770175959 total = 4770175959)
> (XEN) Global xenpf_lock: addr=ffff82d04052c4a0, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global rtc_lock: addr=ffff82d04052c480, lockval=00010001, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global pit_lock: addr=ffff82d04052c470, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global platform_timer_lock: addr=ffff82d04052c460, 
> lockval=000e000e, not locked
> (XEN)   lock:6(57390), block:0(0)
> (XEN) Global sync_lock: addr=ffff82d04052c440, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global lock: addr=ffff82d04052c450, lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global flush_lock: addr=ffff82d04052c430, lockval=00080007, cpu=0
> (XEN)   lock:3(49953), block:0(0)
> (XEN) Global pci_config_lock: addr=ffff82d04052c420, lockval=22702270, 
> not locked
> (XEN)   lock:14(100313), block:0(0)
> (XEN) Global lapic_nmi_owner_lock: addr=ffff82d04052bff0, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global map_pgdir_lock: addr=ffff82d04052bfd0, lockval=00050005, 
> not locked
> (XEN)   lock:3(386), block:0(0)
> (XEN) Global vector_lock: addr=ffff82d04052bfc0, lockval=00260026, not 
> locked
> (XEN)   lock:1(383), block:0(0)
> (XEN) Global irq_ratelimit_lock: addr=ffff82d04052bfb0, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global lock: addr=ffff82d04052bf90, lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global msix_fixmap_lock: addr=ffff82d04052bf80, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global ioapic_lock: addr=ffff82d04052bf60, lockval=003a003a, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global i8259A_lock: addr=ffff82d04052bf50, lockval=00210021, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global osvw_lock: addr=ffff82d04052bf10, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global vpmu_lock: addr=ffff82d04052bf00, lockval=00040004, not 
> locked
> (XEN)   lock:4(449), block:0(0)
> (XEN) Global mtrr_mutex: addr=ffff82d04052bcf0, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global set_atomicity_lock: addr=ffff82d04052bce0, 
> lockval=00040004, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global microcode_mutex: addr=ffff82d04052bcc0, lockval=00030003, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global cmci_discover_lock: addr=ffff82d04052bc90, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global mce_logout_lock: addr=ffff82d04052bc70, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global processing_lock: addr=ffff82d04052bc50, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global pm_lock: addr=ffff82d04052bbc0, lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global apei_iomaps_lock: addr=ffff82d04052bbb0, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global erst_lock: addr=ffff82d04052bba0, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global shared_intremap_lock: addr=ffff82d04052bb20, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global console_lock: addr=ffff82d04052b7d0, lockval=01350135, 
> not locked
> (XEN)   lock:154(111298857), block:0(0)
> (XEN) Global ratelimit_lock: addr=ffff82d04052b7c0, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global lock: addr=ffff82d04052b7a0, lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global sched_free_cpu_lock: addr=ffff82d04052b770, 
> lockval=00040004, not locked
> (XEN)   lock:4(2963), block:0(0)
> (XEN) Global cpupool_lock: addr=ffff82d04052b750, lockval=00030003, 
> not locked
> (XEN)   lock:3(19403), block:0(0)
> (XEN) Global sysctl_lock: addr=ffff82d04052b740, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global domctl_lock: addr=ffff82d04052b730, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global pool_list_lock: addr=ffff82d04052b720, lockval=00010001, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global xenoprof_lock: addr=ffff82d04052b710, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global pmu_owner_lock: addr=ffff82d04052b700, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global vm_lock: addr=ffff82d04052b6f0, lockval=00130013, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global virtual_region_lock: addr=ffff82d04052b6e0, 
> lockval=00010001, not locked
> (XEN)   lock:1(198), block:0(0)
> (XEN) Global wc_lock: addr=ffff82d04052b6d0, lockval=00020002, not locked
> (XEN)   lock:1(770), block:0(0)
> (XEN) Global tasklet_lock: addr=ffff82d04052b6c0, lockval=03790379, 
> not locked
> (XEN)   lock:612(52925), block:0(0)
> (XEN) Global symbols_mutex: addr=ffff82d04052b6b0, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global stopmachine_lock: addr=ffff82d04052b6a0, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global call_lock: addr=ffff82d04052b680, lockval=00040004, not 
> locked
> (XEN)   lock:3(27688741), block:0(0)
> (XEN) Global lock: addr=ffff82d04052b560, lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global heap_lock: addr=ffff82d04052b540, lockval=c5d0c5d0, not 
> locked
> (XEN)   lock:16949(5481440), block:1(34420)
> (XEN) Global crash_notes_lock: addr=ffff82d04052b520, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global lock: addr=ffff82d04052b500, lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global global_virq_handlers_lock: addr=ffff82d04052b4f0, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global domlist_update_lock: addr=ffff82d04052b4d0, 
> lockval=00010001, not locked
> (XEN)   lock:1(105), block:0(0)
> (XEN) Global debugtrace_lock: addr=ffff82d04052b4b0, lockval=00030003, 
> not locked
> (XEN)   lock:3(3327), block:0(0)
> (XEN) Global accounting_lock: addr=ffff82d04052b480, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Global efi_rs_lock: addr=ffff82d04052b020, lockval=00000000, not 
> locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 0 event_lock: addr=ffff83027c80f110, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 0 page_alloc_lock: addr=ffff83027c80f028, 
> lockval=05cf05cf, not locked
> (XEN)   lock:1487(3914530), block:0(0)
> (XEN) Domain 0 domain_lock: addr=ffff83027c80f018, lockval=00000000, 
> not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 32767 page_alloc_lock: addr=ffff83027c875028, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 32767 domain_lock: addr=ffff83027c875018, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 32753 page_alloc_lock: addr=ffff83027c8c8028, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 32753 domain_lock: addr=ffff83027c8c8018, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) Domain 32754 page_alloc_lock: addr=ffff83027c8c9028, 
> lockval=18001800, not locked
> (XEN)   lock:6144(101574), block:0(0)
> (XEN) Domain 32754 domain_lock: addr=ffff83027c8c9018, 
> lockval=00000000, not locked
> (XEN)   lock:0(0), block:0(0)
> (XEN) debugtrace_dump() global buffer starting
> 1 cpupool_create(pool=0,sched=0)
> 2 Created cpupool 0 with scheduler SMP Credit Scheduler rev2 (credit2)
> 3 cpupool_add_domain(dom=0,pool=0) n_dom 1 rc 0
> (XEN) wrap: 0
> (XEN) debugtrace_dump() global buffer finished
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: 0000000000000000
> (XEN) ****************************************
>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


