Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JecHvLSpmk3XQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 13:24:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63391EF567
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 13:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244686.1544074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxOn1-0006tC-U3; Tue, 03 Mar 2026 12:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244686.1544074; Tue, 03 Mar 2026 12:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxOn1-0006rK-QQ; Tue, 03 Mar 2026 12:23:51 +0000
Received: by outflank-mailman (input) for mailman id 1244686;
 Tue, 03 Mar 2026 12:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxOn0-0006rE-FV
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 12:23:50 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b6dbf6-16fb-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 13:23:42 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4833115090dso57890925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 04:23:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d4228sm18463455e9.30.2026.03.03.04.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 04:23:41 -0800 (PST)
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
X-Inumbo-ID: d0b6dbf6-16fb-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772540621; x=1773145421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wrtzYQRA1AG3GXiJ2C5lpnR+bDdEvX3UQGRRP/xfbFE=;
        b=cve/GfX2nKmwCQmwjPD0xT6E4rzR2kK48Cd1uOAMwPcDhkNa7rueZ7Sj6nqVTJ0Vkd
         wgw/aCSCz3au9CXasx2D630mWxzV7NTHNv+APgIM/dNTthkMC/CbOqpHww744y9FUMFL
         qyR3R5BrcznIQ5YqUKXPCkRw9iDvMPBMbplh9N+vfxw0H+LqWBYhIcf5pa15u+WdeSWh
         lp5K6yZ2ymAuHQmVazEHKXR8Ep1mi0dHMJSFJeaRfgufJL/sJoJ850ZM7W8QvVc4aMFP
         he2Tcy++H8Y4bexWRleWIJ0fYyCUAw9dN23FXMF8vl8f910GmXMuKdbzObCat67+AJBt
         7s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540621; x=1773145421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrtzYQRA1AG3GXiJ2C5lpnR+bDdEvX3UQGRRP/xfbFE=;
        b=OAl9Xc0NRo/ZT7XFEibMIlYZslepKFwUXl2/Mu8NERIJKyHcGJA8tl3+AKrUQmXlXi
         Lr672TPmgvIREdqinIkkVJz11U+ksnNIvWyu8M/KXF6bcu3M//lM06ZBK8imoOfDxl2M
         dfQ5S30PeYZzvGKuXonGTbTj81NTOMl2ublEfV29q3qUFCRvT75uvcBRb+hrZPfpB+Zp
         tapcuZ2V5vQvvTzosg4EIktPJjTSRGeOSB6ltSNTfEdTTpYEX/6dFzRhDGrMjVXM8YzD
         11h8q3WL8SRRKCK23cqaOwtefGW/mr+IpreA0RsR2ATi1x7k0t4mo2VESv65J4ga5tla
         NXWw==
X-Forwarded-Encrypted: i=1; AJvYcCWxxl0z6+F1OU0KMEPWJUZekLK1g7ZE0hcgVZ4KBr9zNHxqdymAcvt9Yq6vtc+Nco9Ck2nl5my/qjU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxasKUhldeKE5TPw+PcfRH77Muct1tYVaeuhLz4mhO84yDlKJo1
	trTls6w0PujCpT+fuVX75tXaq8F/rf5bVbPPFloaC1JvIdyIESVmUZY0OH0oTDH4fg==
X-Gm-Gg: ATEYQzxSKP1Vs6yHx5ZZ40L2Fq6NZhNCN0JSkQYCn7liYPrEz2Ud7/wmUwX+BW0Bpwg
	iO7PU7LCdcok8qmgu9j1eha3U/rpDBOcGzZsToZE4p1YFQG+y2b/g71Ssh9dblGXk5iHWW7OieK
	OEyS0nQA+N2rQLu8zmUi7Fg5VqFM67vxmwazv0MD/TOM2QD3SOYUDr8h4gW7We5Xh3NQ0cb/A+X
	I3kktbW4Ct2gGlK8Ex99HLmo43LansirgOMAr0OuqRJgCyK5xTOMMURekulGxeXhKv7kCho/h3a
	MjfnoRDju8/qCB9+MKASOLn7Fd3kqb+23IHEiycxCm2kBNYSmTjikBVZutub17E3v1h2qIDfj9v
	ZyM39pcjUbdzJEN5mX+VTlHSEOUpYs6X84EFHlH5EeSfj88qjNHTUk4VRNmw3sGAslfx750rn9S
	50eNc/HP/Tb0f0fkunat1l29q9i3s/3H8VE+ATnXvI42+jki0Wr0ukFTTMCT6rPBUmp48F18DIV
	rysJi1vmJNJsUE=
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr316225055e9.19.1772540621422;
        Tue, 03 Mar 2026 04:23:41 -0800 (PST)
Message-ID: <4b67f8cb-43d4-4f18-b2b6-156e21330887@suse.com>
Date: Tue, 3 Mar 2026 13:23:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a17b6a117726904a9384dc7d9cc140672d3b0453.1772016457.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a17b6a117726904a9384dc7d9cc140672d3b0453.1772016457.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E63391EF567
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Action: no action

On 26.02.2026 12:51, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -2,9 +2,56 @@
>  
>  #include <xen/init.h>
>  #include <xen/mm.h>
> +#include <xen/sections.h>
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/cpufeature.h>
> +#include <asm/csr.h>
> +
> +struct csr_masks {
> +    register_t hedeleg;
> +    register_t henvcfg;
> +    register_t hideleg;
> +    register_t hstateen0;
> +
> +    struct {
> +        register_t hstateen0;
> +    } ro_one;
> +};
> +
> +static struct csr_masks __ro_after_init csr_masks;
> +
> +void __init init_csr_masks(void)
> +{
> +    /*
> +     * The mask specifies the bits that may be safely modified without
> +     * causing side effects.
> +     *
> +     * For example, registers such as henvcfg or hstateen0 contain WPRI
> +     * fields that must be preserved. Any write to the full register must
> +     * therefore retain the original values of those fields.
> +     */
> +#define INIT_CSR_MASK(csr, field, mask) do { \
> +        old = csr_read(CSR_##csr); \
> +        csr_write(CSR_##csr, (old & ~(mask)) | (mask)); \

I (now) agree csr_swap() can't be used here, but isn't the above

    old = csr_read_set(CSR_##csr, mask);

?

> +        csr_masks.field = csr_swap(CSR_##csr, old); \
> +    } while (0)
> +
> +    register_t old;

Since the macro uses the variable, this decl may better move up.

> +    INIT_CSR_MASK(HEDELEG, hedeleg, ULONG_MAX);
> +    INIT_CSR_MASK(HIDELEG, hideleg, ULONG_MAX);
> +
> +    INIT_CSR_MASK(HENVCFG, henvcfg, _UL(0xE0000003000000FF));

This raw hex number (also the other one below) isn't quite nice. Can we have
a #define for this, please? It doesn't need to live in a header file if it's
not going to be used anywhere else.

> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +    {
> +        INIT_CSR_MASK(HSTATEEN0, hstateen0, _UL(0xDE00000000000007));
> +        csr_masks.ro_one.hstateen0 = old;

What guarantees that only r/o-one bits are set in the incoming hstateen0? I
can't help thinking that to determine those bits you want to use
csr_read_clear() (or csr_clear()).

> +    }

#undef INIT_CSR_MASK

Jan

