Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D3CA6DBF1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925550.1328422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi7G-0004JV-S1; Mon, 24 Mar 2025 13:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925550.1328422; Mon, 24 Mar 2025 13:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twi7G-0004Gf-On; Mon, 24 Mar 2025 13:45:22 +0000
Received: by outflank-mailman (input) for mailman id 925550;
 Mon, 24 Mar 2025 13:45:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jtpT=WL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1twi7F-0004GZ-KH
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:45:21 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e25872-08b6-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 14:45:16 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e60cfef9cfso6531578a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 06:45:16 -0700 (PDT)
Received: from [10.81.43.157] ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf84600sm6145321a12.19.2025.03.24.06.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:45:15 -0700 (PDT)
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
X-Inumbo-ID: 37e25872-08b6-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742823916; x=1743428716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v2enonT82uVNOGfs34M/ppoFtj7JbgfWttnegJ+WRzY=;
        b=Ngi7AIkzTAIJqLn7XkZGlSCXT+pOnwgasiPFtTxniOURO8PX2j+UjJduBmjD8/95Y0
         7lalCVCKFSoZYeEULrxAym4BGGknlqMvwx/F/gixmgZGNI7IB9YB4DiZqHWXIRGGyFXJ
         8YD1gPrj33rzLwx80Hdb8yqy4+u9pQZCsghmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742823916; x=1743428716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2enonT82uVNOGfs34M/ppoFtj7JbgfWttnegJ+WRzY=;
        b=X5VhGYaErVEEIga6ZSwPGz5ihXAH4NYJVOEKs86XhNgH4U94X8yJ17vqdVviO0bzsp
         gqnhUNNV7FRSJNfFmaCk9Hs8cYn0goYmlOZeJy063gAkefGW9cs+dKCEDeHX/QAahWS8
         SGW2Dw7ZraNzocfp8sbDg8vF2NVLefR7U6ws7aJWAju/DuDoL+vH/cLOFnhHnAfzpCAU
         VjFijcSr6iYnKeXjdwlPoEHyeh9Rkui1uwLXtVrQewxpu7GJVX/bH+iUOfoK2v1LIw7N
         HX6Hv7LKUXkqf978tbG2z1DaxyGF3ciILb7PbWvUaTcE1RYS+NAedgts94d2dgtn3S1d
         Om4g==
X-Forwarded-Encrypted: i=1; AJvYcCV1v0o5YUfmSUle16LVrcNmctI5PNjEfb1eUWk2p/yGcmT3dQMPVAxOB0iR4Dg4AJC1Ze4mduaIrq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzElOexYiwrD040AT0SbsRIr6jGEtjhuxwiC6IJUUFqR2W96JQP
	2hZMTw1HciIaDBhFyfCKPOeClpDnnTcorhkVvQfQjJBJo7I/uzjV/KXURPnHhqcb/wRw0esWhvk
	HrjA=
X-Gm-Gg: ASbGnctQz2in0XSeQikpNByE/KPKi0QTBZfgCkeV9PwfXEBW50wD1j/UkgRnQIk3YQc
	0KVXt012ghf8e+8SDyAo8T4U3xBQWrgXr5KSMcb0eMsHiCk5lZ4tbC14iqkSy4Uogxq1NAgooZU
	ZqH6xYd5v4s3owoMkvik09P2Zb68Z5nNUaYLr7BOQdaXZ8EWZo+59v9k5xSqdP1I1rRngRip5Jf
	KnlJWgELcGZnNuEXc9QVtotrGUlKrCDCKIwJN07cFhCM+S5Sik2tLW2g7w46M1hupO5uDbYvfya
	ptGX/xobh3CfQTp18pu7PKnBoensYzmdYjiKu+YP20wbJj1K5xkj+3y075Dw/tak
X-Google-Smtp-Source: AGHT+IH1mgwRXola4Q7mlptlDpQH0sMXMXMaVxSp9PyZ1BsK+kxa2ckGVFT5aemqupdr6A7HPR360Q==
X-Received: by 2002:a05:6402:2805:b0:5e7:8be5:d1b1 with SMTP id 4fb4d7f45d1cf-5ebcd46a666mr12694530a12.19.1742823915760;
        Mon, 24 Mar 2025 06:45:15 -0700 (PDT)
Message-ID: <ed7cfe64-4f38-4628-a4bc-aaaa708c97a2@citrix.com>
Date: Mon, 24 Mar 2025 13:45:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
 <85162f47-421f-4980-965e-b156f56b8de0@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <85162f47-421f-4980-965e-b156f56b8de0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2025 1:37 pm, Jan Beulich wrote:
> On 21.03.2025 10:26, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,
>>      if ( hvm_tsc_scaling_supported )
>>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>  
>> -    rc = viridian_domain_init(d);
>> -    if ( rc )
>> -        goto fail2;
>> +    if ( is_viridian_domain(d) )
>> +    {
>> +        rc = viridian_domain_init(d);
>> +        if ( rc )
>> +            goto fail2;
>> +    }
> It is, aiui, this conditional initialization which causes
>
> (XEN) [    9.136463] UBSAN: Undefined behaviour in arch/x86/hvm/viridian/viridian.c:1118:43
> (XEN) [    9.136465] member access within null pointer of type 'const struct viridian_domain'
> (XEN) [    9.136471] ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
> (XEN) [    9.136473] CPU:    14
> (XEN) [    9.136475] RIP:    e008:[<ffff82d04032e8a8>] common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd9
> (XEN) [    9.136480] RFLAGS: 0000000000010096   CONTEXT: hypervisor (d0v6)
> (XEN) [    9.136484] rax: 0000000000000000   rbx: ffff8304761afb40   rcx: 0000000000000868
> (XEN) [    9.136486] rdx: ffff8304761affd0   rsi: 0000000000000004   rdi: ffff8304761afb40
> (XEN) [    9.136488] rbp: ffff8304761afb30   rsp: ffff8304761afb20   r8:  0000000000000006
> (XEN) [    9.136490] r9:  00000000ffffffff   r10: 0000000000000000   r11: 0000000000000000
> (XEN) [    9.136493] r12: ffff82d040913d22   r13: 0000000000000003   r14: ffff82d040b237a0
> (XEN) [    9.136495] r15: 000000000000000f   cr0: 0000000080050033   cr4: 0000000000b526e0
> (XEN) [    9.136497] cr3: 0000000308528000   cr2: 00007f24a0c9de28
> (XEN) [    9.136499] fsb: 00007f24a3fd6b48   gsb: ffff8881b9b80000   gss: 0000000000000000
> (XEN) [    9.136501] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) [    9.136505] Xen code around <ffff82d04032e8a8> (common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd9):
> (XEN) [    9.136507]  89 e5 41 54 53 48 89 fb <0f> 0b 48 8d 3d ff 92 37 00 e8 9d 99 00 00 48 85
> (XEN) [    9.136572] Xen stack trace from rsp=ffff8304761afb20:
> (XEN) [    9.136574]    0000000000000003 ffff82d040913d22 ffff8304761afb70 ffff82d04032ef58
> (XEN) [    9.136578]    0000000000000202 ffff82d040911100 0000000000000000 0000000000000000
> (XEN) [    9.136581]    ffff82d040b237a0 000000000000000f ffff8304761afbd0 ffff82d04032f3af
> (XEN) [    9.136585]    ffff82d0406b8900 0000002b8000045e ffff82d040913d1e 0000000000000001
> (XEN) [    9.136588]    ffff82d040b23703 000000000000000f ffff8304761afbc0 ffff830405d65000
> (XEN) [    9.136592]    ffff8304761afd00 0000000000000000 ffff8304761afc18 ffff82d040418b9c
> (XEN) [    9.136595]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [    9.136598]    ffff82d040b23a88 00000000000002e8 ffff830401d6cfe0 ffff8304761afc98
> (XEN) [    9.136602]    ffff82d04045fc14 00000000000002c0 ffff82d040b23a58 ffff8304761afd00
> (XEN) [    9.136605]    ffff82d040418a0a ffff830405d65000 ffff82d040b23a88 0000000154381286
> (XEN) [    9.136609]    0000000000000000 00383ffe00090672 0000000000001c78 fffffffffffffff4
> (XEN) [    9.136612]    ffff830476161000 ffff8304761afdb0 ffff830405d65000 ffff8304761afd50
> (XEN) [    9.136616]    ffff82d040630690 800000030847e127 0000000000000206 000000000000000e
> (XEN) [    9.136619]    ffff82d040a00b44 ffff82d040a00b40 ffff82d040a00b44 ffff83047618f000
> (XEN) [    9.136622]    00007f24a3c7a010 ffff8304761afef8 ffff8304761afef8 ffff8304761b5088
> (XEN) [    9.136626]    00001c7800000580 ffff830483a24000 0000000000000001 00007f24a3c7a010
> (XEN) [    9.136629]    0000000000000001 ffff830405d65000 00007f24a3c7a010 0000000000000001
> (XEN) [    9.136633]    0000000000000021 0000000000000000 ffff8304761afe68 ffff82d0402c662f
> (XEN) [    9.136636]    ffff8304761afd80 ffff82d0405a0fbb ffff830476161000 ffff8881b9b80000
> (XEN) [    9.136640]    ffff8304761afdb8 ffff82d04052fdef ffff830476161000 ffff8881b9b80000
> (XEN) [    9.136643] Xen call trace:
> (XEN) [    9.136646]    [<ffff82d04032e8a8>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd9
> (XEN) [    9.136648]    [<ffff82d04032ef58>] F __ubsan_handle_type_mismatch+0x135/0x48e
> (XEN) [    9.136651]    [<ffff82d04032f3af>] F __ubsan_handle_type_mismatch_v1+0xfe/0x100
> (XEN) [    9.136655]    [<ffff82d040418b9c>] F arch/x86/hvm/viridian/viridian.c#viridian_save_domain_ctxt+0x192/0x204
> (XEN) [    9.136658]    [<ffff82d04045fc14>] F hvm_save+0x4d1/0x5c6
> (XEN) [    9.136661]    [<ffff82d040630690>] F arch_do_domctl+0x2f8/0x51aa
> (XEN) [    9.136664]    [<ffff82d0402c662f>] F do_domctl+0xc91/0x460d
> (XEN) [    9.136667]    [<ffff82d04053ab70>] F pv_hypercall+0x6d6/0x834
> (XEN) [    9.136669]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
> (XEN) [    9.136671] 
> (XEN) [    9.136673] ================================================================================
> (XEN) [    9.622282] 
> (XEN) [    9.624469] ****************************************
> (XEN) [    9.630471] Panic on CPU 14:
> (XEN) [    9.634182] UBSAN failure detected
> (XEN) [    9.638469] ****************************************
>
> throughout tests on actual hardware in CI. And really I don't think it's just UB, but
> rather a real NULL deref:

This is a consequence of us turning on UBSAN generally in GitlabCI, and
will be the norm moving forward.

Nevertheless, "member access within null pointer of type $X" is very
clear cut.

~Andrew

