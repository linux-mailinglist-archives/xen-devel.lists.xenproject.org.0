Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGpmDoi3gGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:41:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A34CD7B8
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218641.1527477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmv6Y-0005xw-P7; Mon, 02 Feb 2026 14:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218641.1527477; Mon, 02 Feb 2026 14:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmv6Y-0005wV-Lt; Mon, 02 Feb 2026 14:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1218641;
 Mon, 02 Feb 2026 14:40:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmv6X-0005wP-KM
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 14:40:41 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e427d0-0045-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 15:40:39 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43246af170aso2853196f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 06:40:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132303fsm44845102f8f.36.2026.02.02.06.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:40:38 -0800 (PST)
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
X-Inumbo-ID: 24e427d0-0045-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770043239; x=1770648039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rjC1EX9KJVnb1S6fp61ezW5tAb3mjW3MwuVKqZW2MR4=;
        b=Wt/12f7xJAmUnu02KWjMIhFwmG+D8ZbFJvoXpLFbXFBggL5jsqPgL2zRC5MnZ9LGIi
         0nvyoifdHkI9b3AmWwSVVhsPouoG3wLELLalQmXPnmAO7FbJe6mJPjsCNcJpHASXvlaR
         Xz9+ZIwu78BMBrzfE5PCKlDfcfVMn0Vn7v+T4ZQkTTV6TVVKt6cwPkGUou4bxsPAPgxR
         Hwc2/3A2BPVyjzXQ0yFK9JqoeUZuCchTfuC6rG5NhqSBPPTUpZVafjpuCdFMm5ZFCTql
         r1VAr+nWb4PCvcvx50+CqCvS+2YaTVFWn5yG5Kq41bRPqDig8ct6zr22Slg/jBNojVhf
         aDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043239; x=1770648039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjC1EX9KJVnb1S6fp61ezW5tAb3mjW3MwuVKqZW2MR4=;
        b=EjgMqWt+EdrLPcOiSLVNsSzoI0eTYTIb9f5kyI2sXAdQt4WdK1RRzmNxXYMBta9wnZ
         1YcAdjBQ6XXK0Kw4vliiRB0NjfaYfNH/alWbl/GBC75Ug/9fzX7ozg5qJvw4DtqutjqR
         8r44mTPp2XDGFj+CMOAKAyjYoDsCauDQ4xrPR+Bq892hEe8MiGogKnnaBn6/2eCX6u2+
         KGA3GT4Cqs7srPJ+JTT3q6gXkjueZb74htOlLTmp6HPcFJxKZ9LUsX4Cy2cGN1lfoxwP
         77kltlcjdX7UnT0XeP5eDP2lOzidP23p66au93Kn2jeoZS83RoO06ZN4QvfJcL8HImqb
         kkqw==
X-Gm-Message-State: AOJu0YzSQ0WmX8jgfs9FamFArcNZpDmDngKn676K/XB5453rI3ITKL0O
	q/lbjuRpiv6HYuTsc0NTBNp26cPIraWlCbGXplrbgC2honNNIXio4DcBWuNkNSpiVw==
X-Gm-Gg: AZuq6aLHxoW8/l7YODN5+/gqtQcrYhIf8lzukcYHHFwkmNJLK1Timrp5lDnYX2G07JM
	13+AQdXQFvjGSmOdNZJlIdBZVAY0yNMN0EbtateRPiek0J7btUQAXikBffZYVdMDw9mzB+WaHp0
	aGAmD9KSV/1FJWTJ8ngsmP/B+IJvrlH0v7ypbK/b3E8UnKoMRcNFqJnxwJ3NxwJSxpt3TLWfQSD
	aphonPXYZTAC/s1dx4zfNJN3wujasGirF/ANBKByKzdCUpaE9G3uC14NZ6D/kKinRz/m3wUCvpN
	eR97+l36XgKY/m3I7yqFmdFBS+Q2MPMmVrTfL1zbp2xFSMBVQSkwhWhyKc0UJCC5cqcs4OBO0DL
	dnmSNxbnoh/Vm7wrxHtO1RVuhbX8Sam+DTMHo7kk/7VIq3vuREUW0xjv8wVlZFPa+wU6gBWqH/h
	IM2i9r+ibHQy3ZHKyQ+MYV6LjfeNxgcy2aMqoa0A7ikFA9Jg773AFI0NPVSG6WTM7IxT75DvzNO
	z8=
X-Received: by 2002:a05:6000:2906:b0:435:db93:7311 with SMTP id ffacd0b85a97d-435ea0f4231mr23442604f8f.18.1770043239100;
        Mon, 02 Feb 2026 06:40:39 -0800 (PST)
Message-ID: <da490e92-c8b1-40b3-83ca-ad77dc2defe8@suse.com>
Date: Mon, 2 Feb 2026 15:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] x86/PCI: avoid re-evaluation of extended config
 space accessibility
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <a67e69b8-c1e9-4448-adbd-17a19dfe13de@suse.com>
 <a0b10d39-daae-4fc0-af42-a3794a96f9f5@suse.com>
 <b63b0f9e-93cd-4b55-a7c0-f8eab9df1947@suse.com> <aYBq2EoeP_TGv_sK@Mac.lan>
 <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com> <aYB4z8CSA590Ytpo@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <aYB4z8CSA590Ytpo@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 98A34CD7B8
X-Rspamd-Action: no action

On 02.02.2026 11:13, Roger Pau Monné wrote:
> On Mon, Feb 02, 2026 at 10:30:29AM +0100, Jan Beulich wrote:
>> On 02.02.2026 10:14, Roger Pau Monné wrote:
>>> On Mon, Feb 02, 2026 at 09:51:18AM +0100, Jan Beulich wrote:
>>>> On 29.01.2026 14:10, Jan Beulich wrote:
>>>>> @@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
>>>>>      return 0;
>>>>>  }
>>>>>  
>>>>> -void pci_mmcfg_arch_disable(unsigned int idx)
>>>>> +int pci_mmcfg_arch_disable(unsigned int idx)
>>>>>  {
>>>>>      const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
>>>>>  
>>>>> +    if ( !pci_mmcfg_virt[idx].virt )
>>>>> +        return 1;
>>>>
>>>> Afaict this is what causes CI (adl-*) to say no here:
>>>>
>>>> (XEN) [    4.132689] PCI: Using MCFG for segment 0000 bus 00-ff
>>>> (XEN) [    4.132697] ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>>>> (XEN) [    4.132700] CPU:    12
>>>> (XEN) [    4.132702] RIP:    e008:[<ffff82d0405779bd>] pci_mmcfg_read+0x19e/0x1c7
>>>> (XEN) [    4.132708] RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v0)
>>>> (XEN) [    4.132711] rax: 0000000000300000   rbx: ffff808000300100   rcx: 0000000000000000
>>>> (XEN) [    4.132714] rdx: ffff808000300100   rsi: 0000000000000000   rdi: ffff8304959ffcec
>>>> (XEN) [    4.132716] rbp: ffff8304959ffd18   rsp: ffff8304959ffce8   r8:  0000000000000004
>>>> (XEN) [    4.132718] r9:  ffff8304959ffd2c   r10: 0000000000000000   r11: 0000000000000000
>>>> (XEN) [    4.132720] r12: 0000000000000100   r13: 0000000000000004   r14: ffff8304959ffd2c
>>>> (XEN) [    4.132723] r15: ffff808000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
>>>> (XEN) [    4.132725] cr3: 0000000492a30000   cr2: ffff808000300100
>>>> (XEN) [    4.132727] fsb: 0000000000000000   gsb: ffff8881b9a00000   gss: 0000000000000000
>>>> (XEN) [    4.132729] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>>>> (XEN) [    4.132733] Xen code around <ffff82d0405779bd> (pci_mmcfg_read+0x19e/0x1c7):
>>>> (XEN) [    4.132734]  48 39 d3 72 ea 4c 01 e3 <8b> 03 89 c3 4d 85 f6 74 0d 41 89 1e b8 00 00 00
>>>> (XEN) [    4.132744] Xen stack trace from rsp=ffff8304959ffce8:
>>>> (XEN) [    4.132745]    0000000300000286 ffff830495bd8010 0000000000000003 ffff830495bd8010
>>>> (XEN) [    4.132749]    ffff8304959ffdd0 ffff82d0405fa7ef ffff8304959ffd30 ffff82d040576877
>>>> (XEN) [    4.132753]    000000000000000c ffff8304959ffd58 ffff82d04039b81d ffff8304959ffe28
>>>> (XEN) [    4.132756]    0000000000000003 ffff830495bd8010 ffff8304959ffd80 ffff82d0405fa90b
>>>> (XEN) [    4.132760]    ffff8304959ffdc8 ffff830495bd8010 ffff830498019650 ffff8304959ffdb8
>>>> (XEN) [    4.132764]    ffff82d0403983e0 ffff830498019650 ffff8304959ffe28 ffff82d0405fa7ef
>>>> (XEN) [    4.132767]    0000000000000018 ffffc9004002b900 ffff8304959ffdf8 ffff82d04039feba
>>>> (XEN) [    4.132771]    ffff82d0405fa7ef ffff8304959ffe28 0000000000000000 ffffc9004002b900
>>>> (XEN) [    4.132774]    0000000000000000 ffff8304959bb000 ffff8304959ffe78 ffff82d0405ff666
>>>> (XEN) [    4.132778]    ffff82d0405713b8 00000000ffffffff 00a0fb0081f456e0 ffff8304959b3010
>>>> (XEN) [    4.132782]    00000000c0000000 00000001ff000000 ffff8304959fff08 0000000000000040
>>>> (XEN) [    4.132785]    000000ec00000001 ffff8304959fff08 ffff8304959a4000 0000000000000021
>>>> (XEN) [    4.132789]    0000000000000000 ffffc9004002b900 ffff8304959ffef8 ffff82d0405711b2
>>>> (XEN) [    4.132792]    0000000000000000 ffff888100456938 ffff8881001470b8 0000000000000018
>>>> (XEN) [    4.132795]    0000000000000000 ffff8304959ffef8 ffff82d0406213f9 ffff8304959a4000
>>>> (XEN) [    4.132799]    0000000000000000 ffff8304959a4000 0000000000000000 0000000000000000
>>>> (XEN) [    4.132802]    ffff8304959fffff 0000000000000000 00007cfb6a6000d7 ffff82d0402012d3
>>>> (XEN) [    4.132806]    0000000000000000 00000000ffffffff ffff8881001470b8 ffff888100b88900
>>>> (XEN) [    4.132809]    ffffc9004002b900 ffff8881001470b8 0000000000000283 ffff888100456938
>>>> (XEN) [    4.132813]    ffff888100065410 0000000000000000 0000000000000021 ffffffff81f7842a
>>>> (XEN) [    4.132816] Xen call trace:
>>>> (XEN) [    4.132819]    [<ffff82d0405779bd>] R pci_mmcfg_read+0x19e/0x1c7
>>>> (XEN) [    4.132822]    [<ffff82d040576877>] F pci_conf_read32+0x55/0x5e
>>>> (XEN) [    4.132826]    [<ffff82d04039b81d>] F pci_check_extcfg+0xb1/0x13b
>>>> (XEN) [    4.132831]    [<ffff82d0405fa90b>] F physdev_check_pci_extcfg+0x11c/0x121
>>>> (XEN) [    4.132833]    [<ffff82d0403983e0>] F drivers/passthrough/pci.c#iterate_all+0xa2/0xe2
>>>> (XEN) [    4.132836]    [<ffff82d04039feba>] F pci_segment_iterate+0x4e/0x74
>>>> (XEN) [    4.132839]    [<ffff82d0405ff666>] F do_physdev_op+0x362a/0x4161
>>>> (XEN) [    4.132842]    [<ffff82d0405711b2>] F pv_hypercall+0x6be/0x838
>>>> (XEN) [    4.132845]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x148
>>>> (XEN) [    4.132847] 
>>>> (XEN) [    4.132848] Pagetable walk from ffff808000300100:
>>>> (XEN) [    4.132851]  L4[0x101] = 0000000000000000 ffffffffffffffff
>>>>
>>>> There is an important comment in pci_mmcfg_arch_disable():
>>>>
>>>>     /*
>>>>      * Don't use destroy_xen_mappings() here, or make sure that at least
>>>>      * the necessary L4 entries get populated (so that they get properly
>>>>      * propagated to guest domains' page tables).
>>>>      */
>>>>
>>>> Hence it is wrong to bypass
>>>>
>>>>     mcfg_ioremap(cfg, idx, 0);
>>>
>>> Hm, I see.  The L4 slot must be unconditionally populated before we
>>> clone the idle page-table, otherwise the mappings won't propagate.
>>>
>>> What about unconditionally populating the L4 slot in
>>> subarch_init_memory()?  That seems less fragile than doing it in
>>> pci_mmcfg_arch_disable().
>>
>> Less fragile - perhaps. Yet I don't see why we should populate the field if
>> we wouldn't ever need it. Of course with violating layering some, we could
>> know in subarch_init_memory(), as pci_setup() runs earlier.
> 
> How can Xen be sure at setup time that the slot will never be used?
> The MMCFG could be empty initially when parsed by Xen, but MMCFG
> regions might appear as a result of AML method execution (_CBA and
> _CRS methods in hotplug host bridges).

Their usability may change, but how many of them there are (going to be) we
need to know at boot time. See how pci_mmcfg_config_num, pci_mmcfg_config[],
and pci_mmcfg_virt[] are initialized (all by __init functions). If regions
could truly appear "out of the blue", we'd have a bigger problem.

Jan

