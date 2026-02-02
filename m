Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Op5DiawgGn6AQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:09:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC10CD298
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218626.1527458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmubt-0000T3-9E; Mon, 02 Feb 2026 14:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218626.1527458; Mon, 02 Feb 2026 14:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmubt-0000P4-60; Mon, 02 Feb 2026 14:09:01 +0000
Received: by outflank-mailman (input) for mailman id 1218626;
 Mon, 02 Feb 2026 14:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmubr-0000Oy-Rm
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 14:08:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b74d5b68-0040-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 15:08:58 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so45693615e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 06:08:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce5ec6bsm427320845e9.15.2026.02.02.06.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:08:56 -0800 (PST)
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
X-Inumbo-ID: b74d5b68-0040-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770041337; x=1770646137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zIzpfAWCZzwXm/2pev8nwmeXwYp9xljjpfFbYKNDb1s=;
        b=IzEYOtE1HU4hK9aJhHgTAP8YnCcBG3S0rQofh4/FezXIC1GoDkr1OQtncCkMCkkGYN
         oTM/otJX9AYvTPhemC2YG1yAWgaWQBbDLq3O1INAxm4TlbipBi1bSg8B68gZTiyyOHmW
         ggl5ZW3Po3qw4mEARO9kpjKPxrghmEICPG5fBpJLmoqozXk3YRtI0L9n4ZS5Hq6N6NZB
         0go3HyI21jSrc1ONRviauSlWJ4gibUBt9Ybaqjr8qGnZdP7MfW/9C6Sp2uUFzn+bVg6l
         8cFc8iQ9va8nW9RWfX55KXBwEoz9bB3xZhl26/kqDBNZYLvPdYs0dtb7bMpSl29F+ECm
         rp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770041337; x=1770646137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIzpfAWCZzwXm/2pev8nwmeXwYp9xljjpfFbYKNDb1s=;
        b=G4hoX/LV2k8ANnzqNgh1WYGc97BmznwxwcjeTQisfuVKL/gtIXfVLWwKibU8iSVwh9
         Zz0/UyDUQaKC1lq+ld0V2nzXrBuT6IUq8nxcyRoVzOPKp7Mb8h+mgB61+K12gqA0+Xbs
         9myV76aNf2wpOF1ATl2leFf0CcTpCJtrsVE9BOUCk9lJl45O3DEzJ8z66/3B2bqdE71a
         gy1C0DZs3PcTvpjG8ndVpRcFSP/+9qzqjFzfwS8a7ORO62/gO89bj0YeMD8xQ81WtndJ
         H1FFA6ZZ8SJdWpaeeR/2drCYHxQGCVwPjEgK4NLBjvE7swWu3jq+uIPTG7db889qLpcK
         YoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcR+UGhlpuaTJXBNgp3PCOGTXI7wP1pJmjsvZU6sH92RQV3obGsmc5YHfW+GcG7ecHd8B69nBEwc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyopvdRou2JzS+outdpDDzeL5KbXqMlMv9fmQWEJhLdCTfGJJwj
	RsButyJzcAIhj/uCo2kzlvQcoFUCef+OFK3rvj3taaY3HJGUPtEhuvjoGj3zhIWTRw==
X-Gm-Gg: AZuq6aIe76c1EGQfc+eVUKDNQK2x9g53/gHhmS0526t+aIVbTjyBJ6AAk7XEfzONopZ
	+Ke3frGWm2PuFeA4rfyIXs+9NjdrHtpIEmvStxwdTknbh0unas59YZ24H7WMd8/0dJDPeVdcAsK
	VYDPbrVKhRW+Ml0BrzhdeerucfG4RtWCprgY0nAJ+XdWl5xXgENlKLn7uMjw8oDWlwjn98S5F+O
	+K6s/5Ap9GxfFAGDGTMoRN6dSakSPuy9fuLGIpssM67AWCioYnTmJFESCTVelLqfdgkXsl15mlj
	w51HJhaekKs0CSPpGCABqmGp51dNz6DjVoI2z926NliCguHvzcfYyjHVmz28NY75cQZ6iu/j7Xk
	J50NnhN4pFrhrK/C9SKVZRr262n9LcZaPq16Ei6Q67m/T+NcR2oJCFYMdlCV9XaUq74xyVXcmmb
	lXvpSMrcysIy77EIJCpp2z/ktzhuVlUqHZ3UqHIHfzKu4X26vLHeF3Ev4JYXH4ss85XCT54jlo8
	UU=
X-Received: by 2002:a05:600c:c04b:10b0:482:eec4:74c with SMTP id 5b1f17b1804b1-482eec4094fmr74784075e9.22.1770041337371;
        Mon, 02 Feb 2026 06:08:57 -0800 (PST)
Message-ID: <f0773662-808c-44d2-b4c7-8858fb8d365c@suse.com>
Date: Mon, 2 Feb 2026 15:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce struct arch_vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1770036584.git.oleksii.kurochko@gmail.com>
 <98214488c67fac866ba519c368aef697da2d2bb6.1770036584.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <98214488c67fac866ba519c368aef697da2d2bb6.1770036584.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,lists.xenproject.org,xen.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8AC10CD298
X-Rspamd-Action: no action

On 02.02.2026 13:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -24,6 +24,55 @@ struct arch_vcpu_io {
>  
>  struct arch_vcpu {
>      struct vcpu_vmid vmid;

Nit: This being already here contradicts the title saying "introduce".

> +
> +    /*
> +     * Callee saved registers for Xen's state used to switch from
> +     * prev's stack to the next's stack during context switch.
> +     */
> +    struct
> +    {
> +        register_t s0;
> +        register_t s1;
> +        register_t s2;
> +        register_t s3;
> +        register_t s4;
> +        register_t s5;
> +        register_t s6;
> +        register_t s7;
> +        register_t s8;
> +        register_t s9;
> +        register_t s10;
> +        register_t s11;
> +        register_t sp;
> +        register_t ra;
> +    } xen_saved_context;
> +
> +    register_t hedeleg;
> +    register_t hideleg;
> +    register_t hvip;
> +    register_t hip;
> +    register_t hie;
> +    register_t hgeie;
> +    register_t henvcfg;
> +    register_t hcounteren;
> +    register_t htimedelta;
> +    register_t htval;
> +    register_t htinst;
> +    register_t hstateen0;
> +#ifdef CONFIG_RISCV_32
> +    register_t henvcfgh;
> +    register_t htimedeltah;
> +#endif

When you add these right away, any reason other high-half registers aren't added
as well? HVIP (above) and VSIE / VSIP at the very least have such counterparts,
iirc.

> +    register_t vsstatus;
> +    register_t vsip;
> +    register_t vsie;
> +    register_t vstvec;
> +    register_t vsscratch;
> +    register_t vscause;
> +    register_t vstval;
> +    register_t vsatp;
> +    register_t vsepc;
>  };

What I'm generally concerned of: With the registers all being put here in one go,
without any of them actually being used in this patch, it'll likely be harder to
track that they're saved / restored / initialized correctly (once uses appear).

Jan

