Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ/CD9lanWmxOgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:01:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE801835C8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 09:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239488.1540888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunLm-0001Cb-IS; Tue, 24 Feb 2026 08:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239488.1540888; Tue, 24 Feb 2026 08:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vunLm-0001AB-Eh; Tue, 24 Feb 2026 08:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1239488;
 Tue, 24 Feb 2026 08:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vunLk-0001A5-Ra
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 08:00:56 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f2d133-1156-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 09:00:55 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso38910095e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 00:00:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b87db57fsm21582525e9.3.2026.02.24.00.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 00:00:53 -0800 (PST)
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
X-Inumbo-ID: f1f2d133-1156-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771920054; x=1772524854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lIwLd3yogIzi7F2jeRG5vi3doaglPxjhxjaEsBsFMCM=;
        b=Yejj7C/XNiRA00y/Cdc3a5OctyakkmREEAe6VlfEPwUzTWBSgnr3V1OGVcrxYxx0ss
         FhAtZZeOHel0P8F1XB+p9Unt8V5SslI4JLI4gx5MZR3rILeF33S0/gDqmxdu6hHa/KY9
         p82pDQUg7KRSu6hFkjDML5gOBRPR9m5+M+n4H8pQTa54g/eOoKkePHNuRVLmBq+Xa7zN
         xOHNI9B33O0AmA9f7PZxrfH0T/WFMB6gdbXqe4Go/6+aIzmND6NLSHPUiDiz3g8Ka7X/
         mxoDA73IGxLZOB/zWpsdzR96Xq4KYcz+qVRvR+h8LiGejgZnZM3gyOdLBIA/4zWlzL90
         wi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920054; x=1772524854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIwLd3yogIzi7F2jeRG5vi3doaglPxjhxjaEsBsFMCM=;
        b=nyyqYW3AA4HSx7Q85TINrlYJ9xVqYONoZ/cox7sQo6QSOuzxVbjFrJ5rY2H4/mkiF1
         2mU4PiIad3EC20Vyyk5dYQPdl+mmnqdGNiTEfyesS7Rc1MG2whA72Ojz8Xurufr3eTIu
         vcd7V99tkxEQOxlxGeJxNnBVR0W64FRw9s+b1P0OfR4otq33Fm6JF3rHztqY7pJ4JtF0
         xTdwP0Z0JHOV1cikf9il76jnFHTEzHH8JXVWzh8tUK5N2hd53zTyEQ8IuxW1lriHGJbW
         3xhoq06XQUPc+we8ZJiMvFPmTBzEgK6xIH04ddmX5slttBLf+Me7Xr4rRDCtVuVdZU95
         tqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKyKcnvyoADOb/RUVHFxaHaXHrg4jOALkUodbqn2AUZP66jXQE7zd5IyxcXUVM8DX6qNE7uKX/XBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY402FIs5DqpSeVRs4T5meWTf71pd1PKlzi+RlYhNRSw6kYDLp
	+7wZwVG8UDrXoSd+XNxC8ujd2OGQ3SQQIkje4MLs4BmTqrip8qvLdqb73AOufpiuR18To7+uIc/
	Ty2M=
X-Gm-Gg: AZuq6aKz0Nkt8DJh5Rlkaq7zYJWxkpO7ljtrpqUD08yVuqTzc2/pz9xf4+6czFY/FJG
	iPgzc5DIRbRV828GH+fUQej/MfMeApZ9SiWVQ2DuivGa1d89bSzVNVwC0G0RcRD0Gb8SnW234Oo
	Fs0DflybOtqZQ5dLF+nSB7dJ4MgugDPAzGX1HYStDYR3h7k30DvAtvcLpSfHwjx6vikJ5Nkc/qm
	7p7AaIBZFCdSv9w9Ztlxz5dghh1HmNodQcK/WrryWBnlG+O0e0X0wdxHiE2DlfAeKst011wXSAU
	q6ElHgsB/5BoqAfwBGDJJySshm4WOOYzoBYyP8DirTofBz1bLERH4CsMun9rY9ZuQnggQt2Z6tK
	kpFSm0gUNCDlqwTNa9B0TFQbcEDbOYMwZho4cx8pL9yNIKSUl3vjLNWARlR+Spo1bPNbGFDiix+
	pp1khGjMgJOK8l5HejSmLbBRXB83yHfmp1/UBU6qx5vuKFjXr/CWlDpbboNE+66RybM/th0G2Vf
	hGrKtVjIcTn6R8=
X-Received: by 2002:a05:600c:8b66:b0:483:6f7c:19f4 with SMTP id 5b1f17b1804b1-483a95ed6f3mr163376475e9.30.1771920054229;
        Tue, 24 Feb 2026 00:00:54 -0800 (PST)
Message-ID: <501dd443-e82e-4af2-a8ae-7ef333a38d1e@suse.com>
Date: Tue, 24 Feb 2026 09:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Remove fallback path from SWAPGS
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260223170856.3594016-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260223170856.3594016-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sreg.base:url,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7DE801835C8
X-Rspamd-Action: no action

On 23.02.2026 18:08, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_emulate/0f01.c
> +++ b/xen/arch/x86/x86_emulate/0f01.c
> @@ -192,18 +192,21 @@ int x86emul_0f01(struct x86_emulate_state *s,
>          if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
>                                       ctxt)) != X86EMUL_OKAY ||
>               (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
> -                                 ctxt)) != X86EMUL_OKAY ||
> -             (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> -                                  ctxt, false)) != X86EMUL_OKAY )
> +                                 ctxt)) != X86EMUL_OKAY )
>              goto done;
> -        sreg.base = msr_val;
> -        if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
> -                                      ctxt)) != X86EMUL_OKAY )
> +        if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
> +                                  ctxt, false)) != X86EMUL_OKAY ||
> +             (sreg.base = msr_val,
> +              (rc = ops->write_segment(x86_seg_gs, &sreg,
> +                                       ctxt)) != X86EMUL_OKAY) )
>          {
> -            /* Best effort unwind (i.e. no real error checking). */
> -            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
> -                                ctxt, false) == X86EMUL_EXCEPTION )
> -                x86_emul_reset_event(ctxt);

I don't think this can be dropped. If (for whatever reason) ->write_msr()
failed with X86EMUL_EXCEPTION, it would have recorded an exception.
x86_emul_hw_exception() unconditionally checks there's none. Of course
...

> +            /*
> +             * In real hardware, access to the registers cannot fail.  It is
> +             * an error in Xen if the writes fail given that both MSRs have
> +             * equivalent checks.
> +             */
> +            ASSERT_UNREACHABLE();

... this and the ASSERT() there will both be present / absent at the same
time, so in both release and debug builds the wanted effect is achieved,
yet I think we'd set a bad precedent if we didn't x86_emul_reset_event()
here first. (Also, technically it ought to be legitimate to convert any
individual assertion to BUG_ON(), without strong need to look at any other
assertions.) Alternatively ...

> +            generate_exception(X86_EXC_DF);

... we may want to consider to relax the ASSERT() there, e.g. to always
permit #DF to override what's already there (if not already #DF).

I also think we'd better explicitly specify an error code (of 0) here.
mkec() copes with the form above, yes, but afaics we never actually
leverage this actively. Iirc it was merely meant to act as a safety net.

Jan

