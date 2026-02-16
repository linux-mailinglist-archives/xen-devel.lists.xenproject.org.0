Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEnlB6jxkmlA0QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:30:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CC1425B0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 11:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233939.1537319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvrR-0008Jw-2G; Mon, 16 Feb 2026 10:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233939.1537319; Mon, 16 Feb 2026 10:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvrQ-0008HM-VQ; Mon, 16 Feb 2026 10:29:48 +0000
Received: by outflank-mailman (input) for mailman id 1233939;
 Mon, 16 Feb 2026 10:29:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrvrP-0008HC-R7
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:29:47 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69bd20fd-0b22-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:29:45 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48069a48629so28512715e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 02:29:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad015bsm26904605f8f.38.2026.02.16.02.29.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 02:29:44 -0800 (PST)
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
X-Inumbo-ID: 69bd20fd-0b22-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771237785; x=1771842585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cp32WQWbTQ8MKPJJKqDoVmBh1hXH7xKEGVXuVRDu4ck=;
        b=H1bG0pbuPahwCvTmJUhP6NlpWpEGAo4VhDy0l50nZ7c3RaZuxmLpV/RP6D/s9a3jpU
         vvsyCW7BaOmmjurYHQyG8gDV3EZcvuaUAJuZHhZWLQxlw8FPFUHDzydltX2ifGXM9cF8
         5R+7PcdMjm4wDk/S8GCUOvlaJ4UJa6p6WFrlKjAggbU+iO6RuIuZlzQFMmhiJujf28LB
         dCtM7iU+eaODcdoG6Ubh5M7f7NtVIt466YuRGNyJEbDl8BKOIcrGuy/8EvU7Yc3jZsKU
         o3am75gmPJoEXJhZ4Jmy2aEqsOZlnYY+C5YwwU3ua4Y+HECL3P4y5uvheQ5psJ7NXXQA
         HP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237785; x=1771842585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp32WQWbTQ8MKPJJKqDoVmBh1hXH7xKEGVXuVRDu4ck=;
        b=HCHqyUa8vmDNk5TzcatMxpodI6drBfNRuYRTvTkAvXOTNGkG96tOjJ1oUaXa3SxMH3
         qWa0LUtniHCJkfFnOOS+kGXzsPtcibbMrnlMGa1srYLJC2abVpogby0NnP/4wiUDDICj
         Zalvsc9YWUyjeYQYfM9wXJe2tqyl4z+rJ/pNZMYN7lOy9x0ZWe1cSsuVU5v209Du+3vn
         DvAlw1X/5nys6PniSz/Qkp3nFMDmazIVXJJe3Y0gRO3DhRQPWZF3qFiW9cdL1QZ9AV5J
         1XSDeClL1ZkArNE8UEcKM3wEQ58o7r/UfFUZbKe7XoNByYhrqaaO0OABBYtAUkeNo6qZ
         oljg==
X-Forwarded-Encrypted: i=1; AJvYcCUE1zz+oGOz+/qGCWAE/H0DNgGZS+jb/66D0M3jlOl2tEkxB3M3e2t0pm4yBXCppQhPNwDBGe9Pumc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTZ6IvunMipZn67VOpDqtFGGvQ5GPyyw8XFDCXlwksrhrRDtdI
	KL0a2kxZj2tboV7tDGZo8LddVcC0ndgP9xY/CaRN4Lq09WTtMrIzKgKCbfng5yE+vw==
X-Gm-Gg: AZuq6aLunDrfSc2jLSnqtevw+GvtYFKdNTV/mjNz8BFxjTSjrYQMI4ml5DU00XsdfdX
	NNcwgE+7HUmvlYOP3893psM+UsLZ+SKKfw5Q6/65IpLpcrQqjBjCuOELT+np0lvyK6hh2whODlE
	Qi9pEZbJrh0sV4iFI76ccdfphEMF2hXH3QiSSugc2KirIflS6DuwaTQgjhy2lxzIou408Tkh9Hk
	CxxXHGtuJkZ/Xc4Tllqh+SD4rz/J09GYflVcnVIPlSFVIpnSVnnYFCy8i2BZRlIA05NleO+otJP
	uHwdc9Yl+pN4nLipfQW0xhx0K+DZTywLNn6dncIBQHbmTpureSiD6ZD4tjAksw1k/IL5WqSb3uR
	0gEbzsEvnvZDoQiOO4UNXUT6TVVqzmGoyKxcMDBIf1xmvUaCEq2rTFSpWbMnxW56h3lDqqAWd1X
	BcD60qsnp59JA2cj9ZH8PQgMfax1uqK+FxIfjmdduQK4hb1rMjeMbWLyfsTqOeF1BzaPHag/nTm
	uz4boHG7Agvyak=
X-Received: by 2002:a05:600c:8189:b0:483:6de6:37b8 with SMTP id 5b1f17b1804b1-48373a61afdmr163542105e9.34.1771237785137;
        Mon, 16 Feb 2026 02:29:45 -0800 (PST)
Message-ID: <6948e67b-09d1-4b2f-8c20-560420ebd3c3@suse.com>
Date: Mon, 16 Feb 2026 11:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <ccd7d351fcf47e6a74bd6bdfe3fe8bc9f5023e7e.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7E1CC1425B0
X-Rspamd-Action: no action

On 15.02.2026 19:16, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,6 +33,15 @@ static void svm_inject_nmi(struct vcpu *v)
>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      intinfo_t event;
>  
> +    if ( vmcb->_vintr.fields.vnmi_enable )
> +    {
> +       if ( !vmcb->_vintr.fields.vnmi_pending &&
> +            !vmcb->_vintr.fields.vnmi_blocking )
> +           vmcb->_vintr.fields.vnmi_pending = 1;

Nit: Off-by-1 indentation, while ...

> +        return;

... interestingly this one's indented correctly.

Jan

