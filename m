Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F589DBAAC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 16:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845538.1260909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGgbu-0000Ck-Sq; Thu, 28 Nov 2024 15:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845538.1260909; Thu, 28 Nov 2024 15:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGgbu-00009r-Pb; Thu, 28 Nov 2024 15:39:18 +0000
Received: by outflank-mailman (input) for mailman id 845538;
 Thu, 28 Nov 2024 15:39:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGgbt-00009k-Gz
 for xen-devel@lists.xen.org; Thu, 28 Nov 2024 15:39:17 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9882c4a-ad9e-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 16:39:10 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-aa560a65fd6so175535066b.0
 for <xen-devel@lists.xen.org>; Thu, 28 Nov 2024 07:39:10 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d560asm79003066b.61.2024.11.28.07.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 07:39:09 -0800 (PST)
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
X-Inumbo-ID: e9882c4a-ad9e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU5ODgyYzRhLWFkOWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODA4MzUwLjgxOTc4NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732808350; x=1733413150; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ict90+v2Hlc8MFOxEiVBnvgRBGAGEH0NagzFCD5F3JQ=;
        b=dOpPZtsNJcIjaAQ7ylE2eesvTyeGBIBvR9DbeFFk2E+toIXngqN3e+el18nd4Xw1oH
         tJg2r3YzGGzlwWZpH4itNhwMWfLOP0o+D6XBwe2Dc5eUWnqd61os3ykqN7Mi1SWbFFIl
         34Rhd0dvkwEFU+LUX8oUL5Ifr8nfdAsLq5YNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732808350; x=1733413150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ict90+v2Hlc8MFOxEiVBnvgRBGAGEH0NagzFCD5F3JQ=;
        b=kDHW8tgXpyAwxE2BHNf2mHbKUQnTd+FD1Gatfi5jvCj0TiFRapGHaLdPgDSpyKpjon
         Bkn1GouPuas24fk0tcHMj6CPMi/p5FUAF+txywTZ3BDX37dcJoFKX7uCa81yTAkvzowg
         kduXKBLG6WdBmW/SN+9Kgj/QlQCoTU51mj2G1cswPQ9MDxNO9lfoSiWXKeuPMBQjOoRv
         zXm1iKRMVeNaUtfXBCLkcAzDB4Q2sPHu5g8IrPr+9vyA/SQhX+eYdJ7cm5FtmXXzsvHO
         1osdA6AJYIo4fFgqWRmnvRL6IOBHeJ7oCzVZQawfQJy0jeFetupKD6+erI02AXrk5n/C
         /RgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmEIq3z+0mO/t5Q9vCy2hn2PngZEJ1CyUs/nC7gAZtIQ3HgVIjn8+B3OQ+CCrJJ61LuJercamdMIg=@lists.xen.org
X-Gm-Message-State: AOJu0Yz0vD8J2eybN+a+iwuSwg637sjlSEgPnwY/qohPZdNJtSSZiRaQ
	6oGufxwBxerY6TTGnBuNWHC8/1SbD9cxkA17yhjault+p0txCo0923MEu8sy3R8=
X-Gm-Gg: ASbGncs2hiF6VnIh0Lk91fs0Frswhv8uxOSlPDSNaoMKufyFZc3wmlBcICwizHXgOyN
	OxB8lVQrPb5kkzSSq0AxgDYX0viDW0EX7ohISkbLIhoyp+Nw4KZMZD51xRZAHgK0yDE4BT32FxC
	Dhvy4MMaJiaImhioKdt/iTH3ZZHsvGq9ZUPXb5gNi2U6tx9Dr7J5D8VbKK62DHJ3eU/OsFdcO18
	aRm4TfinMvr1o0jo6VUMJ8LkXGC3JXOIUwqc06WvkyLomIzxEZk8N218yhqPJU=
X-Google-Smtp-Source: AGHT+IGWv8dxtC3KULiJyQ1TvjQkHJfGqy34yE66SXDmvwnzgwL95CTi7RSgV704I5Jk1pcpzeqUcQ==
X-Received: by 2002:a17:907:1de8:b0:a9a:eeb:b26a with SMTP id a640c23a62f3a-aa5945081f0mr385454766b.1.1732808350035;
        Thu, 28 Nov 2024 07:39:10 -0800 (PST)
Message-ID: <6614df33-e383-44dd-aebc-a238ad82f398@citrix.com>
Date: Thu, 28 Nov 2024 15:39:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stable-4.18: reliably crash network driver domain by squeezing
 free_memory
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xen.org
References: <Z0iMxP2gah9Ky4Pl@dingwall.me.uk>
Content-Language: en-GB
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z0iMxP2gah9Ky4Pl@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2024 3:31 pm, James Dingwall wrote:
> Hi,
>
> We have reproducible issue with the current HEAD of the stable-4.18 branch
> which crashes a network driver domain and on some hardware subsequently
> results in a dom0 crash.
>
> `xl info` reports: free_memory : 39961, configuring a guest with
> memory = 39800 and starting it gives the log as below.  This is intel
> hardware so if I've followed the code correctly I think this leads through
> to intel_iommu_map_page() from drivers/passthrough/vtd/iommu.c.
>
> The expectation is that we can safely allocate up to free_memory for a
> guest without any issue.  Is there any extra logging we could enable to
> gain more information?

For this, you really should CC the x86 maintainers, or it stands a
chance of getting missed.

Do you have the complete serial log including boot and eventual crash ?

-12 is -ENOMEM so something is wonky, and while dom2 is definitely dead
at this point, Xen ought to be able to unwind cleanly and not take down
dom0 too.

~Andrew

>
> Thanks,
> James
>
>
> (XEN) d2: IOMMU mapping dfn afdf79 to mfn afdf79 failed: -12
> (XEN) domain_crash called from drivers/passthrough/iommu.c:366
> (XEN) Domain 2 (vcpu#1) crashed on cpu#3:
> (XEN) ----[ Xen-4.18.4-pre  x86_64  debug=y  Not tainted ]----
> (XEN) CPU:    3
> (XEN) RIP:    e033:[<ffffffff8220128c>]
> (XEN) RFLAGS: 0000000000000282   EM: 0   CONTEXT: pv guest (d2v1)
> (XEN) rax: 0000000000000014   rbx: ffffc90041361000   rcx: ffffffff8220128c
> (XEN) rdx: 0000000000000001   rsi: ffffc9004136b018   rdi: 0000000000000000
> (XEN) rbp: ffffc900400e0e18   rsp: ffffc900400e0dc8   r8:  0000000000000000
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000282
> (XEN) r12: 0000000000000001   r13: ffffc9004136b018   r14: ffffc90041361000
> (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000003526e0
> (XEN) cr3: 0000000cb07c6000   cr2: 00005dc9ed4f6710
> (XEN) fsb: 000073436e0b9400   gsb: ffff888023100000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
> (XEN) Guest stack trace from rsp=ffffc900400e0dc8:
> (XEN)    0000000000000000 0000000000000001 ffffffff81a94320 0000000000000000
> (XEN)    ffffc9004136e818 ffffc90041361000 0000000000000000 0000000000000001
> (XEN)    ffffc90041361000 0000000000000000 ffffc900400e0e58 ffffffffc0542f35
> (XEN)    0000000100000001 1332c17936eda000 ffffc90041361030 0000000000000000
> (XEN)    0000000000000040 ffffc90041361000 ffffc900400e0e88 ffffffffc05464ae
> (XEN)    ffffc90041361030 0000000000000000 ffffc900400e0eef 0000000000000040
> (XEN)    ffffc900400e0ec0 ffffffff81edef70 ffff888023135e40 000000000000012c
> (XEN)    ffffc900400e0ef8 ffffc90041361030 0000000000000000 ffffc900400e0f48
> (XEN)    ffffffff81edf551 ffffffff811b5c7f ffff888023136100 0000000100566b96
> (XEN)    0000000000000007 ffff888023131b60 ffffc900400e0ef8 ffffc900400e0ef8
> (XEN)    ffffc900400e0f08 ffffc900400e0f08 1332c17936eda000 0000000080000100
> (XEN)    0000000000000003 0000000000000008 0000000000000004 ffffffff834060d8
> (XEN)    ffffc900400e0fb8 ffffffff8110a198 ffff888023134200 0040010000000001
> (XEN)    ffff888004798000 0000000100566b96 000000000000000a ffffc90000000003
> (XEN)    ffffffff81a9f77e ffffc9004000b788 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000000000000000 ffffc900400e0fd8 ffffffff8110a4e9
> (XEN)    ffffc9004000b788 0000000000000000 ffffc900400e0fe8 ffffffff8110a84e
> (XEN)    ffffc9004000b778 ffffffff821ffd0a ffffc9004000b760
> (XEN)     Fault while accessing guest memory.
> (XEN) common/memory.c:278:d0v2 Could not allocate order=18 extent: id=24 memflags=0xc0 (0 of 1)
> ...repeated
> (XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (3 of 4)
> (XEN) common/memory.c:278:d0v2 Could not allocate order=9 extent: id=24 memflags=0xc0 (0 of 4)
> ...repeated
>
>
>
>
> decoding the symbols from the crashed driver domain:
>
> vcpu0:
> rip: ffffffff8220128c
> flags: 00001282 i s nz
> rsp: ffffc90040003dc8
> rax: 0000000000000000 rcx: ffffffff8220128c rdx: deadbeefdeadf00d
> rbx: ffffc90040358680 rsi: deadbeefdeadf00d rdi: deadbeefdeadf00d
> rbp: ffffc90040003e18 r8: 0000000000000000 r9: 0000000000000000
> r10: 0000000000000000 r11: 0000000000000282 r12: 0000000000000001
> r13: ffffc90040362698 r14: ffffc90040358680 r15: 0000000000000000
> cs: e033 ss: e02b ds: 0000 es: 0000
> fs: 0000 @ 0000000000000000
> gs: 0000 @ ffff888103c00000/0000000000000000
> Code (instr addr ffffffff8220128c)
> cc cc cc cc cc cc cc cc cc 51 41 53 48 c7 c0 14 00 00 00 0f 05 <41> 5b 59 c3 cc cc cc cc cc cc cc
>
>
> Stack:
> 0000000000000000 0000000000000001 ffffffff81a942a0 0000000000000000
> ffffc90040365e98 ffffc90040358680 0000000000000000 0000000000000001
> ffffc90040358680 0000000000000000 ffffc90040003e58 ffffffffc05a6f35
> 0000000200000001 2acc1e6e51961900 ffffc900403586b0 0000000000000000
> 0000000000000040 ffffc90040358680 ffffc90040003e88 ffffffffc05aa4ae
>
> Call Trace:
> [<ffffffff8220128c>] <--  xen_hypercall_grant_table_op+0xc
> ffffc90040003dd8: [<ffffffff81a942a0>]  gnttab_map_refs+0x30
> ffffc90040003e20: [<ffffffffc05a6f35>]  
> ffffc90040003e60: [<ffffffffc05aa4ae>]  
> ffffc90040003e90: [<ffffffff81edede0>]  __napi_poll+0x30
> ffffc90040003ec8: [<ffffffff81edf3c1>]  net_rx_action+0x181
> ffffc90040003ed0: [<ffffffff811b5c7f>]  generic_handle_irq+0x1f
> ffffc90040003f40: [<ffffffff834060d8>]  
> ffffc90040003f50: [<ffffffff8110a198>]  handle_softirqs+0xd8
> ffffc90040003f68: [<ffffffff8340fcc0>]  
> ffffc90040003f88: [<ffffffff81a9f6fe>]  evtchn_fifo_handle_events+0xe
> ffffc90040003f90: [<ffffffff83403cc8>]  
> ffffc90040003fc0: [<ffffffff8110a4e9>]  __irq_exit_rcu+0xd9
> ffffc90040003fc8: [<ffffffff83403cc8>]  
> ffffc90040003fe0: [<ffffffff8110a84e>]  irq_exit_rcu+0xe
> ffffc90040003fe8: [<ffffffff83403cb8>]  
> ffffc90040003ff0: [<ffffffff821ffd0a>]  xen_pv_evtchn_do_upcall+0xaa
> ffffc90040003ff8: [<ffffffff83403ca0>]  
>
> vcpu1:
> rip: ffffffff822013ac
> flags: 00001246 i z p
> rsp: ffffc900400a3e60
> rax: 0000000000000000 rcx: ffffffff822013ac rdx: 0000000000000000
> rbx: 0000000000000000 rsi: deadbeefdeadf00d rdi: deadbeefdeadf00d
> rbp: ffffc900400a3e78 r8: 0000000000000000 r9: 0000000000000000
> r10: 0000000000000000 r11: 0000000000000246 r12: ffff8881003b8000
> r13: 0000000000000000 r14: 0000000000000000 r15: 0000000000000000
> cs: e033 ss: e02b ds: 002b es: 002b
> fs: 0000 @ 0000000000000000
> gs: 0000 @ ffff888103d00000/0000000000000000
> Code (instr addr ffffffff822013ac)
> cc cc cc cc cc cc cc cc cc 51 41 53 48 c7 c0 1d 00 00 00 0f 05 <41> 5b 59 c3 cc cc cc cc cc cc cc
>
>
> Stack:
> 0000000000000000 0000000000000000 ffffffff82200060 ffffc900400a3e88
> ffffffff82209629 ffffc900400a3e98 ffffffff822096f9 ffffc900400a3ea8
> ffffffff822099cc ffffc900400a3ee8 ffffffff8117bf53 0000000000000001
> ac54db278c0d3c00 0000000000000001 ffff8881003b8000 0000000000000001
> 0000000000000000 ffffc900400a3f08 ffffffff8117c027 000000000000008f
>
> Call Trace:
> [<ffffffff822013ac>] <--  xen_hypercall_sched_op+0xc
> ffffc900400a3e70: [<ffffffff82200060>]  xen_safe_halt+0x10
> ffffc900400a3e80: [<ffffffff82209629>]  default_idle+0x9
> ffffc900400a3e90: [<ffffffff822096f9>]  arch_cpu_idle+0x9
> ffffc900400a3ea0: [<ffffffff822099cc>]  default_idle_call+0x2c
> ffffc900400a3eb0: [<ffffffff8117bf53>]  cpuidle_idle_call+0x153
> ffffc900400a3ef0: [<ffffffff8117c027>]  do_idle+0x87
> ffffc900400a3f10: [<ffffffff8117c2ba>]  cpu_startup_entry+0x2a
> ffffc900400a3f28: [<ffffffff8104bb51>]  cpu_bringup_and_idle+0xa1
> ffffc900400a3f50: [<ffffffff81052565>]  asm_cpu_bringup_and_idle+0x5
>
>


