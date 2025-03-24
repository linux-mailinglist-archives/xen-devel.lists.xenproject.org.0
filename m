Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154DA6DBBF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:38:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925520.1328388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhzm-0000M6-K8; Mon, 24 Mar 2025 13:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925520.1328388; Mon, 24 Mar 2025 13:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twhzm-0000KZ-Gl; Mon, 24 Mar 2025 13:37:38 +0000
Received: by outflank-mailman (input) for mailman id 925520;
 Mon, 24 Mar 2025 13:37:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twhzl-0000KT-BD
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:37:37 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24f7011a-08b5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:37:35 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso3123750f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 06:37:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efd61sm11124721f8f.91.2025.03.24.06.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 06:37:34 -0700 (PDT)
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
X-Inumbo-ID: 24f7011a-08b5-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742823454; x=1743428254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LZJD84PE7qVnTgB5ljtg9G7WfvxWLy4hlzna5iyNKkM=;
        b=el6EOWCNV+b7yXH07d+6IYaOo91dWenVwTyhPWAvqDTA0PfEeK35zDib8zvYutuC56
         mAGCzlz/ytzyf2eYlB/prmtfMcVFtMr21ZzRbXji0AbX+Jt52mRe5i0AjvpLsyxaiWyO
         ZPZp7BZGyZSu5f4KLH9EXVxYPtJGiSfUlWH39AM70byxTRbpKXVBZYbEje+bArM1XN+X
         YqjKp8SDtogyZzZPVUjUkP+VNUJP2nLM+MpXCF+VAXPWnQyleBTxtT4V7EZF7LpnVPWK
         GrWsXr246id3DW0metb0pZX5uYPUUpSgOQE+uW/XPIun2h8wputTn3gpS8CdKhbbOpj9
         58LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742823454; x=1743428254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZJD84PE7qVnTgB5ljtg9G7WfvxWLy4hlzna5iyNKkM=;
        b=OBwC6GXIuaGgue1s2qOeeg8CTRnyDl3aCbmbjqRRLblfvXd3H2YMegMTPH157cw4k8
         slwFW8RzUTKwtr4YNxTH00O1WnEcyoBOzt2/n3bIwaKXWHHIRdb+JSTRbRElcQtXpE+S
         DBm8haaBrfz0zNrzNwEtgDdgu7Ye6Dazq3iMSHxDMQ9I3avsBPSl1JKA0ZJE9bUN0L/Y
         cq0+gwYIvbsicIcdZ50Z5dBXO1pM4LrEvfuTRFBOxSne7SR2ixxdWBNz+2ZCei1mACZl
         5xqLvONAmWCfAgtwCLy/5j5DVCX/NlACfhT+PTDC/QeUVAHBchDkMgYeiMiio/mmf31k
         nA0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUIAnxRgx8015s7dFj56wwSQwWH6fh3Mpu5fjzBCx5iVIph1QyDCJoS7RojMYL9NniLm1tIYWLsRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+htUdG+hqV53WcJtCNMWtJAtioRKBwE1pBeXEzGjCRYNgWdiB
	rI3Erv/3Ru00etn8pAMHH71ndLu83h1s/kIIylyScYLQ+YP854UdYvkn5guRqw==
X-Gm-Gg: ASbGncsPDsTsW9R/c9QE36krmzI5okhp87xJEfkgHftZ0gbi77+aUih/TcQvk6NPPuH
	hDj4v8kdg5+TVymoONJb0SL1qXTJ2sYlZ8q309+h9HCyM67N0yW6agxAXHdqpqllqZ79VkJ+/ee
	z/zjhcVxUnpbjCBJQPONvCF6qdZ5zKTr43pRPLqrFmSqWdjw2dgTlZviEtlFNjjQSMAFXfv2aME
	ilxukH2d+N3+YznE5YMtTrulefoKiKkUEKO79FgXS8zyXeyUEuizCn9S4G9mS/ZlmOQbRJkku3d
	WtTdjdCyHKaCQ2QfUdZHxqa8T8yjOX7se3KACgMVKojqIK3RBKUaNS//6EeOEznvfPbBQAF4cu9
	err33zxoS6bhwLMRva7byoDaESkYS4A==
X-Google-Smtp-Source: AGHT+IHDih0+a6aVbVdWfi1o1KeLF3jMScMP0+if78bSywjHXtNOcMv0c7LJOwV5ShG7h9W0E6RL3w==
X-Received: by 2002:a5d:6daa:0:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-3997f93c45dmr11588338f8f.25.1742823454516;
        Mon, 24 Mar 2025 06:37:34 -0700 (PDT)
Message-ID: <85162f47-421f-4980-965e-b156f56b8de0@suse.com>
Date: Mon, 24 Mar 2025 14:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: make Viridian support optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250321092633.3982645-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 10:26, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,
>      if ( hvm_tsc_scaling_supported )
>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>  
> -    rc = viridian_domain_init(d);
> -    if ( rc )
> -        goto fail2;
> +    if ( is_viridian_domain(d) )
> +    {
> +        rc = viridian_domain_init(d);
> +        if ( rc )
> +            goto fail2;
> +    }

It is, aiui, this conditional initialization which causes

(XEN) [    9.136463] UBSAN: Undefined behaviour in arch/x86/hvm/viridian/viridian.c:1118:43
(XEN) [    9.136465] member access within null pointer of type 'const struct viridian_domain'
(XEN) [    9.136471] ----[ Xen-4.21-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
(XEN) [    9.136473] CPU:    14
(XEN) [    9.136475] RIP:    e008:[<ffff82d04032e8a8>] common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd9
(XEN) [    9.136480] RFLAGS: 0000000000010096   CONTEXT: hypervisor (d0v6)
(XEN) [    9.136484] rax: 0000000000000000   rbx: ffff8304761afb40   rcx: 0000000000000868
(XEN) [    9.136486] rdx: ffff8304761affd0   rsi: 0000000000000004   rdi: ffff8304761afb40
(XEN) [    9.136488] rbp: ffff8304761afb30   rsp: ffff8304761afb20   r8:  0000000000000006
(XEN) [    9.136490] r9:  00000000ffffffff   r10: 0000000000000000   r11: 0000000000000000
(XEN) [    9.136493] r12: ffff82d040913d22   r13: 0000000000000003   r14: ffff82d040b237a0
(XEN) [    9.136495] r15: 000000000000000f   cr0: 0000000080050033   cr4: 0000000000b526e0
(XEN) [    9.136497] cr3: 0000000308528000   cr2: 00007f24a0c9de28
(XEN) [    9.136499] fsb: 00007f24a3fd6b48   gsb: ffff8881b9b80000   gss: 0000000000000000
(XEN) [    9.136501] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) [    9.136505] Xen code around <ffff82d04032e8a8> (common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd9):
(XEN) [    9.136507]  89 e5 41 54 53 48 89 fb <0f> 0b 48 8d 3d ff 92 37 00 e8 9d 99 00 00 48 85
(XEN) [    9.136572] Xen stack trace from rsp=ffff8304761afb20:
(XEN) [    9.136574]    0000000000000003 ffff82d040913d22 ffff8304761afb70 ffff82d04032ef58
(XEN) [    9.136578]    0000000000000202 ffff82d040911100 0000000000000000 0000000000000000
(XEN) [    9.136581]    ffff82d040b237a0 000000000000000f ffff8304761afbd0 ffff82d04032f3af
(XEN) [    9.136585]    ffff82d0406b8900 0000002b8000045e ffff82d040913d1e 0000000000000001
(XEN) [    9.136588]    ffff82d040b23703 000000000000000f ffff8304761afbc0 ffff830405d65000
(XEN) [    9.136592]    ffff8304761afd00 0000000000000000 ffff8304761afc18 ffff82d040418b9c
(XEN) [    9.136595]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) [    9.136598]    ffff82d040b23a88 00000000000002e8 ffff830401d6cfe0 ffff8304761afc98
(XEN) [    9.136602]    ffff82d04045fc14 00000000000002c0 ffff82d040b23a58 ffff8304761afd00
(XEN) [    9.136605]    ffff82d040418a0a ffff830405d65000 ffff82d040b23a88 0000000154381286
(XEN) [    9.136609]    0000000000000000 00383ffe00090672 0000000000001c78 fffffffffffffff4
(XEN) [    9.136612]    ffff830476161000 ffff8304761afdb0 ffff830405d65000 ffff8304761afd50
(XEN) [    9.136616]    ffff82d040630690 800000030847e127 0000000000000206 000000000000000e
(XEN) [    9.136619]    ffff82d040a00b44 ffff82d040a00b40 ffff82d040a00b44 ffff83047618f000
(XEN) [    9.136622]    00007f24a3c7a010 ffff8304761afef8 ffff8304761afef8 ffff8304761b5088
(XEN) [    9.136626]    00001c7800000580 ffff830483a24000 0000000000000001 00007f24a3c7a010
(XEN) [    9.136629]    0000000000000001 ffff830405d65000 00007f24a3c7a010 0000000000000001
(XEN) [    9.136633]    0000000000000021 0000000000000000 ffff8304761afe68 ffff82d0402c662f
(XEN) [    9.136636]    ffff8304761afd80 ffff82d0405a0fbb ffff830476161000 ffff8881b9b80000
(XEN) [    9.136640]    ffff8304761afdb8 ffff82d04052fdef ffff830476161000 ffff8881b9b80000
(XEN) [    9.136643] Xen call trace:
(XEN) [    9.136646]    [<ffff82d04032e8a8>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd9
(XEN) [    9.136648]    [<ffff82d04032ef58>] F __ubsan_handle_type_mismatch+0x135/0x48e
(XEN) [    9.136651]    [<ffff82d04032f3af>] F __ubsan_handle_type_mismatch_v1+0xfe/0x100
(XEN) [    9.136655]    [<ffff82d040418b9c>] F arch/x86/hvm/viridian/viridian.c#viridian_save_domain_ctxt+0x192/0x204
(XEN) [    9.136658]    [<ffff82d04045fc14>] F hvm_save+0x4d1/0x5c6
(XEN) [    9.136661]    [<ffff82d040630690>] F arch_do_domctl+0x2f8/0x51aa
(XEN) [    9.136664]    [<ffff82d0402c662f>] F do_domctl+0xc91/0x460d
(XEN) [    9.136667]    [<ffff82d04053ab70>] F pv_hypercall+0x6d6/0x834
(XEN) [    9.136669]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
(XEN) [    9.136671] 
(XEN) [    9.136673] ================================================================================
(XEN) [    9.622282] 
(XEN) [    9.624469] ****************************************
(XEN) [    9.630471] Panic on CPU 14:
(XEN) [    9.634182] UBSAN failure detected
(XEN) [    9.638469] ****************************************

throughout tests on actual hardware in CI. And really I don't think it's just UB, but
rather a real NULL deref:

    const struct viridian_domain *vd = d->arch.hvm.viridian;
    struct hvm_viridian_domain_context ctxt = {
        .hypercall_gpa = vd->hypercall_gpa.raw,
        .guest_os_id = vd->guest_os_id.raw,
    };

and only then

    if ( !is_viridian_domain(d) )
        return 0;

Makes me wonder if this change was actually tested ... In any event I'm about to revert
it.

Jan

