Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912D3A38A0E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890713.1299852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4Kw-0003xf-AV; Mon, 17 Feb 2025 16:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890713.1299852; Mon, 17 Feb 2025 16:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4Kw-0003vp-6j; Mon, 17 Feb 2025 16:51:14 +0000
Received: by outflank-mailman (input) for mailman id 890713;
 Mon, 17 Feb 2025 16:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tk4Ku-0003uV-Sa
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:51:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63e5215c-ed4f-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 17:51:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab771575040so1097956866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:51:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba9cf8a262sm623036666b.22.2025.02.17.08.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:51:09 -0800 (PST)
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
X-Inumbo-ID: 63e5215c-ed4f-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739811070; x=1740415870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=50dQfwki/T2wtKQ9o9GaDqI63tWgDRKUyMlyQmgQqe4=;
        b=HOMnYqH/ZCVAfG2R1WfX1XGa9Nldu3BrIh2Sv7OrszqMkB6C8LSn0acz9SwaycnBMO
         EhgC0zcJUUnC5VpI0axpjTs6SX+BWefEwgUu90a7I6zgFW2mSalY1kPOkynCbY2dz0qQ
         gvwMe+E8DyISkMBYbW08nekyeNSAEHWU6rI9zIChNYw/JewNAh3WSf+XyKALACCy/+ot
         OPBhrdSz5uTuViwr6ujwILrNOYOBO3yqV/pOYITd7LdfX9UOp9B/DYpfWuhIDRqkUIIs
         5GFUB84Nm3MRDasOFmyz6EwoFfKK9VPvedMunP8wn3Te12/dfx0mit0Oz15xR1iQVKSG
         ZNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811070; x=1740415870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50dQfwki/T2wtKQ9o9GaDqI63tWgDRKUyMlyQmgQqe4=;
        b=BfVIBiloJYRddGYcfk5uQancdFW9axgIcw13fi+ry+mePrdEOjTJFjpx2tqRznbX7K
         XQmuSAzNU1R9rPUZ1Re8THnfL4X+X3VQRxJZ4KfYTvbgyVIeT5eNtEw5C9sfMe1eBA7u
         3Gj07f575F9hzmKQdd+AmyTZcSbnmvLzJoP57oF4J/5qE0iLLds9YGJpSOLd1vjYs/p8
         CZvCxNuefyNuqTGehrkTqZ+eSLgiyq6cutZSwrC8j1aDK7OVf3OpjXtfauu3I72jmJIr
         vukiGKNt6+GJP0Dm6GFSsxZlzPnBq5PJoPJtYpFGpnF0H++uYQe25C9WmnHvs/rWkXvL
         A+GA==
X-Forwarded-Encrypted: i=1; AJvYcCXSy0vmpSbRCOQKqLO7MiTEk3QK0XWCUSCkO/TxeFdBXPtS7I5B/96WCWxfPOfulnOgHlS9KCj90FU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDQzcXnab9H3TE5l8KDWl9NKiEXa8ePURpXG8ZLo0UuYSi3lZg
	+iKGB/d2KerNTAVtBqPFxYZhbs9xwumQMJBbehaTfcNTHbW1NvCPaFHxS60R6w==
X-Gm-Gg: ASbGncvBpsoBxGH3p9RAvLy9KBdiNlg6WltRc/0V4+mSdyhj1pNoXENXQ5yGwLQ8HXG
	WijK4fu5YdRiUurc4OrjSnG8/59GSDDFKfFF8Lzeo6GU24PKMxiNNpPuym32Okg4jeANMsxR2Dn
	gbhAIVuDIlEMV22cmQJA6wLVaQJoGiih3/cVggR1fj/tNEkYsrKKZAbU/EQRvLkW4w1uSPIPamk
	sGSTOtQ0fNx5VXO55M4ayY+R7iteByPxPWh5GsxmI+WNvAMZEWfgujQx/3ku8jkyqSTvU+6TGo2
	TplT19el0sddD+xOimxHJWSlndLgU1dQ4ymkRtZwWvLv9KT8KMsj8HFxBEPnPkKFLWMI8azhKW8
	n
X-Google-Smtp-Source: AGHT+IHCcXwS9Okn7BPjMZLBxwWn+0FXc7fVyx/L8/RtS1urNyn7lLAoUq39B8YBG4CNCakGPtkZtQ==
X-Received: by 2002:a17:906:6a03:b0:ab7:798:e16e with SMTP id a640c23a62f3a-abb7097f5d1mr1127025766b.15.1739811070149;
        Mon, 17 Feb 2025 08:51:10 -0800 (PST)
Message-ID: <7763e57c-a2d2-4642-b613-8628ae4c55da@suse.com>
Date: Mon, 17 Feb 2025 17:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Separate STI and VMRUN instructions in
 svm_asm_do_resume()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250217161241.537168-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250217161241.537168-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 17:12, Andrew Cooper wrote:
> There is a corner case in the VMRUN instruction where its INTR_SHADOW state
> leaks into guest state if a VMExit occurs before the VMRUN is complete.  An
> example of this could be taking #NPF due to event injection.

Ouch.

> --- a/xen/arch/x86/hvm/svm/entry.S
> +++ b/xen/arch/x86/hvm/svm/entry.S
> @@ -57,6 +57,14 @@ __UNLIKELY_END(nsvm_hap)
>  
>          clgi
>  
> +        /*
> +         * Set EFLAGS.IF, after CLGI covers us from real interrupts, but not
> +         * immediately prior to VMRUN.  AMD CPUs leak Xen's INTR_SHADOW from
> +         * the STI into guest state if a VMExit occurs during VMEntry
> +         * (e.g. taking #NPF during event injecting.)
> +         */
> +        sti
> +
>          /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
>          /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
>          .macro svm_vmentry_spec_ctrl

I'm mildly worried to see it moved this high up. Any exception taken in
this exit code would consider the system to have interrupts enabled, when
we have more restrictive handling for the IF=0 case. Could we meet in the
middle and have STI before we start popping registers off the stack, but
after all the speculation machinery?

Jan

