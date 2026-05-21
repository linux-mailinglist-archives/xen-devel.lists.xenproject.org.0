Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ETmE6YjD2rPGAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:24:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B310B5A83EB
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315383.1585198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Ft-0004qr-6z; Thu, 21 May 2026 15:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315383.1585198; Thu, 21 May 2026 15:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5Ft-0004nh-3z; Thu, 21 May 2026 15:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1315383;
 Thu, 21 May 2026 15:24:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ5Fq-0004mv-Ul
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5Fq-0036JO-BH
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:24:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f2391-5cb7-0a2a0a5109dd-0a2a450ce70e-14
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:24:10 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f239a-62f1-0a2a450c0019-d1558031b068-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:24:10 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49039a8851fso8598665e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:24:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035eba897sm24488015e9.5.2026.05.21.08.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:24:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779377050; x=1779981850; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hvXeXBmk/ojxOflt/rgGxdITeIRsZsBqbgGoZkEHDfQ=;
        b=YxDT0mD9yGoHHURG1NdnoboPEuXDLicbohCV3nqEq0fZdq3uuQ67HnhcJUIcHUX9q7
         5l2gfGliAQKaQCzKPbZJNVIi0KQb2Mh3KQfoZ25/SrNyd8RT6Yjja2+nmW0B6iRDC2eU
         dkHBfh8CEGV+kmT5+BmRbMgCCCOEUYPthjXcf0YcLzlyqboJjO1SqZIVSrMVGyDeZy87
         mLJBO0rKB/QO9aRPGtgJcAiqU8iTPUPBwpHKRFT3kow8Fw20EihUPkUx/h67ZRtSVWzo
         8bRGGeXarwSPvC0W7qodqigL+sA41tXjYRgf7lixHx1zcA9moBUfu3qao43icFqE0lCU
         90tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377050; x=1779981850;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvXeXBmk/ojxOflt/rgGxdITeIRsZsBqbgGoZkEHDfQ=;
        b=FmFrJvxP21z0GUF5mf6vs8VM6/YhUnzSY73kuhS44dL7cSlu96Sz9BdLARqZ9VMQI1
         2TUmvknp1KBRE1i4x/PUyE52uj0BaAPbNS56xVyUVpi5UUv142A3VP1u69k7ZW3JHDYI
         KfT4/y9YeJuVmzJ8x7VZatBVBj1vGWftp8kXGSptz0sEXjMG16BhJchMOSmVaMgj5GX7
         EkNzNSC2nhssxexjqEgeKsFdbw6OjgA0UOC6GreFTnIteDqfG9uvhqPUy1WSTBqP3AQX
         yhdQN52Nxi6+QqIA9ylAuw8BNriMRfcxbYaM2j6pWDSlwTsx+mb7frJn3en6Jm4VX1C9
         8NnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IvqaBsMS6o94e+BUgnZ/j2IFe9iOrbYnf+MQLN8eHJ37/UIU32yUsbM4hWsy1AQbtMgY7DYGfXe8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy64onu2FB++xjgrFgQh0u0EzUzGoiujNX2swCAkLwBZj+lCzD
	S0vO93Ps0PGZNQ16MAEjZJmAvVD0h8VtReJzf6+mynvHHOlt0+LyR2TSBCJgJytDKw==
X-Gm-Gg: Acq92OFMcUdeHipbo/BA9+GtIXg9vBMJy2s8OTDFvE0WoWGjBoJrpy6LJ1GsJ1Hd9KN
	z8DOOyxUSYoOLpfQgZTFoaOqjMzlCiSufEJC4lixFSQ3bn3XUCuKeYA0CXkSx7NSu47VXKShe2H
	7z0gCswkA2qL5EuahXzbxBBTux4TUUuB+YCmiEkKfrV1NTxRvy5jZC0PP0Oy9p5N8YinJYHQhfX
	q3bEMGSbgNpMWhj1wCDG/s1VFzkdc4LTmUtquxHT7qwW/OXTIuP8Ht7ltcgkdghcNjq328SNwF6
	2SXbDMyFg/DTHleGwcFZPB9Zsv+dYJMZulMix5aVAij9uoopDb0nS8KR3qDdI4e4snZWVdfYHaW
	/XVkdMylqaN7DQFXBmYtV2mTi9CL/69PRsRAxcdMnN0ui5JHd0j/WW8xebCF7t/2QaUDDchSaWk
	uLzXNlSf/zL0P5icHv2vS71YmsHU5pDqcZ6cPpdjRMYAeNZIYCkMaJSz9lw4gr1y2ryrX7kO2/6
	CI8sEpS1KgtdYZvUrL/QCpiig==
X-Received: by 2002:a05:600c:468b:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-490360c12cbmr49605035e9.26.1779377049672;
        Thu, 21 May 2026 08:24:09 -0700 (PDT)
Message-ID: <e5ce9b16-c692-48bd-9b3e-c4346fd8f797@suse.com>
Date: Thu, 21 May 2026 17:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/26] xen/riscv: introduce per-vCPU IMSIC state
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <2471b51e89aff30765433d88b1646c5b2c72b5c2.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2471b51e89aff30765433d88b1646c5b2c72b5c2.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1779377050-F447DCF5-A61F50E1/0/0
X-purgate-type: clean
X-purgate-size: 2541
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B310B5A83EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -16,6 +16,7 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/macros.h>
> +#include <xen/sched.h>
>  #include <xen/smp.h>
>  #include <xen/spinlock.h>
>  #include <xen/xvmalloc.h>
> @@ -56,6 +57,16 @@ do {                            \
>      csr_clear(CSR_SIREG, v);    \
>  } while (0)
>  
> +unsigned int vcpu_guest_file_id(const struct vcpu *v)
> +{
> +    return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
> +}
> +
> +void imsic_set_guest_file_id(const struct vcpu *v, unsigned int guest_file_id)

Some people will demand that "const" be omitted in cases like this one, as
it only works ...

> +{
> +    ACCESS_ONCE(v->arch.vimsic_state->guest_file_id) = guest_file_id;

... as long as vimsic_state is a pointer (and not a sub-structure).

> @@ -312,6 +323,30 @@ static int imsic_parse_node(const struct dt_device_node *node,
>      return 0;
>  }
>  
> +int vcpu_imsic_init(struct vcpu *v)
> +{
> +    struct vimsic_state *imsic_state;
> +
> +    /* Allocate IMSIC context */
> +    imsic_state = xvzalloc(struct vimsic_state);
> +    if ( !imsic_state )
> +        return -ENOMEM;
> +
> +    v->arch.vimsic_state = imsic_state;
> +
> +    /* Setup IMSIC context  */
> +    rwlock_init(&imsic_state->vsfile_lock);
> +
> +    imsic_state->vsfile_pcpu = NR_CPUS;
> +
> +    return 0;
> +}
> +
> +void vcpu_imsic_deinit(const struct vcpu *v)
> +{
> +    xvfree(v->arch.vimsic_state);

Better XVFREE(), for the function to be idempotent.

> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -11,6 +11,7 @@
>  #ifndef ASM_RISCV_IMSIC_H
>  #define ASM_RISCV_IMSIC_H
>  
> +#include <xen/rwlock.h>
>  #include <xen/spinlock.h>
>  #include <xen/stdbool.h>
>  #include <xen/types.h>
> @@ -61,7 +62,24 @@ struct imsic_config {
>      spinlock_t lock;
>  };
>  
> +struct vimsic_state {
> +    /* IMSIC VS-file */
> +    rwlock_t vsfile_lock;
> +    /*
> +     * (guest_file_id == 0) -> s/w IMSIC SW-file
> +     * (guest_file_id > 0) -> h/w IMSIC VS-file
> +     */
> +    unsigned int guest_file_id;
> +    /*
> +     * (vsfile_pcpu >= 0) => h/w IMSIC VS-file
> +     * (vsfile_pcpu == NR_CPUS) => s/w IMSIC SW-file
> +     */
> +    unsigned int vsfile_pcpu;
> +};

In the comments, what does SW stand for? Not "software" I assume, as
that's already expressed by s/w.

Jan

