Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIhtNtFugGnC8AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:30:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43315CA251
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218449.1527193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqGN-0006fM-Gv; Mon, 02 Feb 2026 09:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218449.1527193; Mon, 02 Feb 2026 09:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqGN-0006dB-CI; Mon, 02 Feb 2026 09:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1218449;
 Mon, 02 Feb 2026 09:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmqGM-0006d5-Mr
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:30:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff76c17-0019-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 10:30:29 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so46483685e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 01:30:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffc0sm437701485e9.5.2026.02.02.01.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 01:30:27 -0800 (PST)
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
X-Inumbo-ID: cff76c17-0019-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770024628; x=1770629428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T28K2QmfD4zyIgF8sXByuh95R5TkyNmgYqzdeBXOrwE=;
        b=gTlynRSt7wqG7P2362x/v1ONhAdcNbM3PeaPWr8jfn3g4n/nQHhDm5+uUC2fsOUBAG
         2r0VEtWAzKmrB6IS8H9m7T9IF+rBC5MR7niyHptN6s6wtcq0Otej6EQ90Be0pdx9dLQR
         CokMoqNkeBgxvy/04oauJsHiVlw+NzymyN8ueMfHe6tDScB10Vj4zzaNSN5fkNQmNDX7
         4c/1pdJeU8vZjyQpOYBPxSnrMICKwuZQx5XDuczTUYiTJfPBh+IOdGEtiiATgFGP+VGf
         Dv+1D7yZMDgYUGGsNhwmrrtCQsCnqmdeeZ1+iIdGGKzC6+PlAxqyEITHj9UmdDpIFduJ
         r1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770024628; x=1770629428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T28K2QmfD4zyIgF8sXByuh95R5TkyNmgYqzdeBXOrwE=;
        b=eZLEY9sJDQlI4cfsvltLgspU8mglFyeQ0im0HTv4c+JmCLderMuCfGMNtmogCjJ5Fd
         V3waQPttZY1gYXvp+ij+L1Si2Jr5NFKBv6IxoaDiW1Fz+dA98qjsLBGKoaVWYJ60X8xa
         H1KthsILo2L3ZZGr57yQli3OlKKQqpF+5mB9mavekY9BKsJ5PVq9vV5xL5j/8Y3F0o3Y
         57Hsg5Gfocpq03+Mc51MYrECYiCALEufEtNXTVUWIfbT2yXgpCIeVqK2MVa8NGm529c0
         dMKHqnjx9YRAWC2KJUHVvb0KlQGbpJvUUCTdrzGgvEGhVlqG3Rs8ug2RlkCER9LypEbD
         1kSA==
X-Gm-Message-State: AOJu0YzLENpAbA9OxxwJJVXNMfycdApTNXkflSdwyAbFaT91yHlHyO7f
	CTU6frYEULyfB3ouZ4er7zbQjRQsWTOAg8AL2td+ltl2cgb0x8d8wl7PJgWWc/G/Jw==
X-Gm-Gg: AZuq6aIDqFYonzluodyyziwJOwqKlTMixbVABCDKfaTQ9OGv2kErZ7bDtgUs21mjyYD
	RyINA8L67fwbcSFlswWaHhB6fzOD1+lonzO29qHAKuwAoamM0HFn9RYomu/sc15B3TPiGrhfowp
	6EE4ozTwoc2kPZH/K1pnNFLS1JABPJOgRKZi56GJYwJG14ZXBwAxHh0pZwsY+PitEFArNym3CDh
	AyJRNNOg+tROZ80yPsdLgoYfQeptQ+8ByXfukWAaQgfI1GuHkfdk4Z/HmIaaYE2eemxuQddaXld
	TZ1zw4TtHqyWsxbXDquTWmlmqSi73pXrjWd3PiPbFCxMsRNd3BDXdp7dbe/XDuiCf0D2x3gfn5c
	GL2JuFP+JKK6u/E/CQc45hvvDwytqdTkAUgVk1nYlLrweYquy6PrKj15EwojBbyzOeT6QAFde9x
	YR20ZNTH4fkltkTAY4bo12pIQWvd5FsdTjmer0f6Ksjdf1Ys9gDEZhg2g/671+v6a6nbmEkQOWK
	oM=
X-Received: by 2002:a05:600c:6814:b0:480:699c:abe9 with SMTP id 5b1f17b1804b1-482db4b21c6mr112875325e9.37.1770024628377;
        Mon, 02 Feb 2026 01:30:28 -0800 (PST)
Message-ID: <1bcdd2dd-9b2b-4eb2-a569-e28b03c1e1fb@suse.com>
Date: Mon, 2 Feb 2026 10:30:29 +0100
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
In-Reply-To: <aYBq2EoeP_TGv_sK@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 43315CA251
X-Rspamd-Action: no action

On 02.02.2026 10:14, Roger Pau Monné wrote:
> On Mon, Feb 02, 2026 at 09:51:18AM +0100, Jan Beulich wrote:
>> On 29.01.2026 14:10, Jan Beulich wrote:
>>> @@ -160,10 +161,13 @@ int pci_mmcfg_arch_enable(unsigned int i
>>>      return 0;
>>>  }
>>>  
>>> -void pci_mmcfg_arch_disable(unsigned int idx)
>>> +int pci_mmcfg_arch_disable(unsigned int idx)
>>>  {
>>>      const typeof(pci_mmcfg_config[0]) *cfg = pci_mmcfg_virt[idx].cfg;
>>>  
>>> +    if ( !pci_mmcfg_virt[idx].virt )
>>> +        return 1;
>>
>> Afaict this is what causes CI (adl-*) to say no here:
>>
>> (XEN) [    4.132689] PCI: Using MCFG for segment 0000 bus 00-ff
>> (XEN) [    4.132697] ----[ Xen-4.22-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>> (XEN) [    4.132700] CPU:    12
>> (XEN) [    4.132702] RIP:    e008:[<ffff82d0405779bd>] pci_mmcfg_read+0x19e/0x1c7
>> (XEN) [    4.132708] RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v0)
>> (XEN) [    4.132711] rax: 0000000000300000   rbx: ffff808000300100   rcx: 0000000000000000
>> (XEN) [    4.132714] rdx: ffff808000300100   rsi: 0000000000000000   rdi: ffff8304959ffcec
>> (XEN) [    4.132716] rbp: ffff8304959ffd18   rsp: ffff8304959ffce8   r8:  0000000000000004
>> (XEN) [    4.132718] r9:  ffff8304959ffd2c   r10: 0000000000000000   r11: 0000000000000000
>> (XEN) [    4.132720] r12: 0000000000000100   r13: 0000000000000004   r14: ffff8304959ffd2c
>> (XEN) [    4.132723] r15: ffff808000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
>> (XEN) [    4.132725] cr3: 0000000492a30000   cr2: ffff808000300100
>> (XEN) [    4.132727] fsb: 0000000000000000   gsb: ffff8881b9a00000   gss: 0000000000000000
>> (XEN) [    4.132729] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) [    4.132733] Xen code around <ffff82d0405779bd> (pci_mmcfg_read+0x19e/0x1c7):
>> (XEN) [    4.132734]  48 39 d3 72 ea 4c 01 e3 <8b> 03 89 c3 4d 85 f6 74 0d 41 89 1e b8 00 00 00
>> (XEN) [    4.132744] Xen stack trace from rsp=ffff8304959ffce8:
>> (XEN) [    4.132745]    0000000300000286 ffff830495bd8010 0000000000000003 ffff830495bd8010
>> (XEN) [    4.132749]    ffff8304959ffdd0 ffff82d0405fa7ef ffff8304959ffd30 ffff82d040576877
>> (XEN) [    4.132753]    000000000000000c ffff8304959ffd58 ffff82d04039b81d ffff8304959ffe28
>> (XEN) [    4.132756]    0000000000000003 ffff830495bd8010 ffff8304959ffd80 ffff82d0405fa90b
>> (XEN) [    4.132760]    ffff8304959ffdc8 ffff830495bd8010 ffff830498019650 ffff8304959ffdb8
>> (XEN) [    4.132764]    ffff82d0403983e0 ffff830498019650 ffff8304959ffe28 ffff82d0405fa7ef
>> (XEN) [    4.132767]    0000000000000018 ffffc9004002b900 ffff8304959ffdf8 ffff82d04039feba
>> (XEN) [    4.132771]    ffff82d0405fa7ef ffff8304959ffe28 0000000000000000 ffffc9004002b900
>> (XEN) [    4.132774]    0000000000000000 ffff8304959bb000 ffff8304959ffe78 ffff82d0405ff666
>> (XEN) [    4.132778]    ffff82d0405713b8 00000000ffffffff 00a0fb0081f456e0 ffff8304959b3010
>> (XEN) [    4.132782]    00000000c0000000 00000001ff000000 ffff8304959fff08 0000000000000040
>> (XEN) [    4.132785]    000000ec00000001 ffff8304959fff08 ffff8304959a4000 0000000000000021
>> (XEN) [    4.132789]    0000000000000000 ffffc9004002b900 ffff8304959ffef8 ffff82d0405711b2
>> (XEN) [    4.132792]    0000000000000000 ffff888100456938 ffff8881001470b8 0000000000000018
>> (XEN) [    4.132795]    0000000000000000 ffff8304959ffef8 ffff82d0406213f9 ffff8304959a4000
>> (XEN) [    4.132799]    0000000000000000 ffff8304959a4000 0000000000000000 0000000000000000
>> (XEN) [    4.132802]    ffff8304959fffff 0000000000000000 00007cfb6a6000d7 ffff82d0402012d3
>> (XEN) [    4.132806]    0000000000000000 00000000ffffffff ffff8881001470b8 ffff888100b88900
>> (XEN) [    4.132809]    ffffc9004002b900 ffff8881001470b8 0000000000000283 ffff888100456938
>> (XEN) [    4.132813]    ffff888100065410 0000000000000000 0000000000000021 ffffffff81f7842a
>> (XEN) [    4.132816] Xen call trace:
>> (XEN) [    4.132819]    [<ffff82d0405779bd>] R pci_mmcfg_read+0x19e/0x1c7
>> (XEN) [    4.132822]    [<ffff82d040576877>] F pci_conf_read32+0x55/0x5e
>> (XEN) [    4.132826]    [<ffff82d04039b81d>] F pci_check_extcfg+0xb1/0x13b
>> (XEN) [    4.132831]    [<ffff82d0405fa90b>] F physdev_check_pci_extcfg+0x11c/0x121
>> (XEN) [    4.132833]    [<ffff82d0403983e0>] F drivers/passthrough/pci.c#iterate_all+0xa2/0xe2
>> (XEN) [    4.132836]    [<ffff82d04039feba>] F pci_segment_iterate+0x4e/0x74
>> (XEN) [    4.132839]    [<ffff82d0405ff666>] F do_physdev_op+0x362a/0x4161
>> (XEN) [    4.132842]    [<ffff82d0405711b2>] F pv_hypercall+0x6be/0x838
>> (XEN) [    4.132845]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x148
>> (XEN) [    4.132847] 
>> (XEN) [    4.132848] Pagetable walk from ffff808000300100:
>> (XEN) [    4.132851]  L4[0x101] = 0000000000000000 ffffffffffffffff
>>
>> There is an important comment in pci_mmcfg_arch_disable():
>>
>>     /*
>>      * Don't use destroy_xen_mappings() here, or make sure that at least
>>      * the necessary L4 entries get populated (so that they get properly
>>      * propagated to guest domains' page tables).
>>      */
>>
>> Hence it is wrong to bypass
>>
>>     mcfg_ioremap(cfg, idx, 0);
> 
> Hm, I see.  The L4 slot must be unconditionally populated before we
> clone the idle page-table, otherwise the mappings won't propagate.
> 
> What about unconditionally populating the L4 slot in
> subarch_init_memory()?  That seems less fragile than doing it in
> pci_mmcfg_arch_disable().

Less fragile - perhaps. Yet I don't see why we should populate the field if
we wouldn't ever need it. Of course with violating layering some, we could
know in subarch_init_memory(), as pci_setup() runs earlier.

Jan

