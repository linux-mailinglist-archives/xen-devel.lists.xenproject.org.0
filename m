Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FpkL+A5l2l2vwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:27:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2578F160A8B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 17:27:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236581.1539255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6rh-0008GM-79; Thu, 19 Feb 2026 16:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236581.1539255; Thu, 19 Feb 2026 16:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt6rh-0008Dw-49; Thu, 19 Feb 2026 16:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1236581;
 Thu, 19 Feb 2026 16:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt6rf-0008Dq-Jt
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 16:26:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccedce00-0daf-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 17:26:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-483487335c2so11273465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 08:26:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839ea386dasm32383205e9.1.2026.02.19.08.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 08:26:52 -0800 (PST)
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
X-Inumbo-ID: ccedce00-0daf-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771518413; x=1772123213; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zie/J5zNpGEq5F9mXUCAELLe6eQWNUqO/EF8FSWX2aA=;
        b=T11e2sfwjEXvkzqJuS+Kl/CKMoazsOq7lp+sev2GAECX7RGYS9czTRbSQ1uXwavVWP
         yKmZwnLK8R4uX14bsGmeOZoqEw1qC4rrCwVnX4s6GisburgYZYNBwFalRB98z26KMY2c
         tuoMQCusJqSvUWcjQN7Yubg4sNbvgpplzbmgLSj2QQoOdz5linKOl9Q/Q4+KvjhdYgAw
         c+L0KMTNgdPVVe4YKVdstJW8xrK8iD9QMuzf0DoVKtPHZ/uH7M2+fG8b6Jd3tJmv1qYV
         fJVpntoMXHsHe3lEuL29c1scsNHv0ZUPuxMg4NXPzmQBaxpf9MhFbuSyrPK1Xydv5r1G
         hpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518413; x=1772123213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zie/J5zNpGEq5F9mXUCAELLe6eQWNUqO/EF8FSWX2aA=;
        b=PBYQzOIMZ5Sb3ikGl2G5M7TvJsMDGcm9LTyRCYttofyXBAo0W+6DfokXDZ1wpzU4Ar
         E/mCJ8TD6UKN7VPtNRLYbhcy9rorAWdUwg18Nvksj0dNf51+8LL3P7Ubs+APoZbx6z7K
         /ANH0TyXLGMXF36m3RvbEvXhK8ScdfChL/CKNEcrX8rl8dyiuElmfjiWAn4ZbWynnujf
         ua/nwrQFYCQMzcuauL2fWy4XfI5Dmt1H26zSuEuR0VrhQmKarWOMcagQhwNkZ6R26i7L
         uVNzUf7kOUzPBotwcQyBWHdR/hwugfHNfbShOnzQ1BWwE2ZWxHZKCVSuXd9hDj4PboUW
         3AEw==
X-Forwarded-Encrypted: i=1; AJvYcCWDUpqP7R1XZA6qQDM3IOe4lgR+gudcSs2ktebNIYefMvJnmoVUQB4l24HKSwuleMLeGSIxllSDr9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyrUCl0V1pHKFEBad5L1TXq+/Xl1gyB4WqENIFN2sjwctT3LVIX
	kGCFiPy2dHTi1lo+H5asPZ9je35OyNR6zpzh5oA0PRCNYNlZsn+Gy50oSuPWDOBT4w==
X-Gm-Gg: AZuq6aKGhT31iw6sG7BWh732T/m7HZIQi7sUV/MylSTL6k9ZKIiRtLOSOovwuPprSch
	sAFEnetXjFOFQvik2u0ZtDIe7ab0jGaJ8dUWrWVNBZHPYfk2BzPKzg8386zvqL5Ow0i1Rq4EfBC
	p9vWOftokn3YlW2aFDDdjhlqHJ4nBylrqfFQVy33mIHU0NARCHAe6lr6R09yecAHE1UTMYZXcz6
	v9fx42+/dVxtNMqLx0JBCe+zzH/FMvZBpDmFCWSXDUIS+GhO4KlZHaRWggGT4sOmdgZqq4AM19J
	ghZ86pNdVDrQVbBY37XMfvdlVsvLfP7H5xzG9N+z4B7ajUFARTqdkEci4d2D/PwP13yLwu5a7zp
	CvSibNqLjzNBKW1BsmYpeSieYpsi9hEHv/VgobiSCqv/1zaK6fAuxGvGhpv5iap2NomjL2XoYGJ
	NaUJ94klEfiL6ytDGIskkacH0nrZhJC1l/ezyhT6tioUmS4UJYsSrx6YWufmwuQD/HMFxltkDdl
	9QvrN5as/oJathTP9WxUT9pQw==
X-Received: by 2002:a05:600c:5397:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-4839e64443fmr63096535e9.16.1771518412687;
        Thu, 19 Feb 2026 08:26:52 -0800 (PST)
Message-ID: <3989d531-00fc-4a78-b236-1693fda61b62@suse.com>
Date: Thu, 19 Feb 2026 17:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: roger.pau@citrix.com, teddy.astie@vates.tech, jason.andryuk@amd.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
 <b4c0009eeee03b855321954135a37ef08290f640.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <b4c0009eeee03b855321954135a37ef08290f640.1771424278.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2578F160A8B
X-Rspamd-Action: no action

On 18.02.2026 15:48, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,6 +33,14 @@ static void svm_inject_nmi(struct vcpu *v)
>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      intinfo_t event;
>  
> +    if ( vmcb->_vintr.fields.vnmi_enable )
> +    {
> +        if ( !vmcb->_vintr.fields.vnmi_pending )
> +            vmcb->_vintr.fields.vnmi_pending = 1;

Why the (inner) conditional?

Also, as I think Teddy had already indicated before, might we better not use
the _vintr field directly, but rather use the vmcb_[gs]et_vintr() wrappers? I
notice nestedsvm.c open-codes many of the accesses, but elsewhere I see just
one such case. The field name has a leading underscore for this reason, iirc.

Jan

