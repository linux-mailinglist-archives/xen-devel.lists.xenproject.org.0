Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26379B2C4B8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 15:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086583.1444784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoM5g-0001JK-MQ; Tue, 19 Aug 2025 13:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086583.1444784; Tue, 19 Aug 2025 13:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoM5g-0001GM-JH; Tue, 19 Aug 2025 13:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1086583;
 Tue, 19 Aug 2025 13:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uoM5f-0001GG-4H
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 13:09:27 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb21470a-7cfd-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 15:09:25 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb79db329so718517366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 06:09:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a758b8efesm1683289a12.50.2025.08.19.06.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 06:09:24 -0700 (PDT)
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
X-Inumbo-ID: bb21470a-7cfd-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755608965; x=1756213765; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X1lkhk08FQM22QPp21nEhLJClfw5J+nQdf8CMWaFBvs=;
        b=FQJUt+0y/ahOQ9ojkWFKPuzYveMFh3twKSmWzvUT9I4Sk9wnGz3xPLN3L8qcGu//+n
         gcQ+EPtSc3yQxjjhSa/Ol08dnDtpmwrMLynGa+u3tMyUirR5s4E7d2YSnCYoWeVqsl/K
         SnZ9nhdCs5432XjiHL8A3M9kpIFnYzWVp6Pac36myqhL9xQzILSQFgjP/E/NwuTrOFZZ
         oJyEHcC1bTGBrZWfcnCiP6buWxvKKOAUUJyAMsCi1EoUuABhGSksF7cNPt7+wGVZmy7j
         SDen7lbh73AnerM4W+yzmk20amLSzKRhVZwgxst2Z7V/sFCpng5aKpJ6wZ6ntiTnLkVu
         J44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608965; x=1756213765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1lkhk08FQM22QPp21nEhLJClfw5J+nQdf8CMWaFBvs=;
        b=GsNV2quGu7x5PemcsgP5yg20xxykydQ69yLpHS+NjfxPpW3jeAAIh+++GUh1tA92rm
         ktDeL0RHOIEJYbU+j9dnCQSkS6hf58sIH3nMrd231MjcxM8icFefnITDYdjwhrgoifZb
         upJwGIqNsQwOFEDWeKJmswi4SBlsSJed1dChWdZds8lA8JZRtjid8rl69rCoUNotVLyv
         cvFhW5yHOjvDBheZGiZxXs+QW/71ZN2wCz695UEADy64YjmLMepcWHiEpENeIWkz92lR
         yYAp5ErRi19LnY1cfC4iuxlH+bJLMmO1/3l14Ngh1qGUyeX03zhVFB/z5BCd2CmTbNnm
         uc0A==
X-Forwarded-Encrypted: i=1; AJvYcCUT5QsxcVUERXb8lb5ADj2Jv0EoRC+Xy/+26WUKPnYjNC3al1R1rfuT5Q0+H8LE228fyQAHXTUUMWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwMPFK9twftRX63e0uNSz//TSxs5wd+Cp61rnzbCFvJwNl6mIyk
	JmFF995SiTfcdVPYMMF5DAUEMmnp0k4+MFn4/WT/l+BcPy12nR9TYXPAyNC3B0+S1w==
X-Gm-Gg: ASbGncun5RsRIBDTXLHlDJMTGLu7Znz44/XFqkfYL269TTpr69DvNZk2hhNa+aETxJW
	s8GjDBF9NVOoky7P5mqrn+cRPNebd/WZIs0RPVKwXVNQRBrSMt+VwXklVMed48JrCpMSk3UbLoJ
	1sPJCv9Gz+NrxTLw5PGo45OyXp3BRTWPXhynhxjQamJJFfIU8AojGRUalyNEX/3ATDfpXRPG9bJ
	F252MPevxcTckeZeJXrdPlseGTMUZLCQG4EW7PbNB2wYGjazDiYzj3CykMFpDffq5JEStR36dzE
	mtvFiXX0jYMuyV4hzhKU9Bu+qwa5fJgHcNmqKiwvbxRdJtf49OTfRMWal8nA8f5WLt4pmTuI8W+
	k+83HdizNCdkdnKD3D+L2QlumFFkoM3OrGunr0OlqxCFmJFW8z7EBtZ2rxv6uABsBckxBwg/C93
	zkkiFXEsw=
X-Google-Smtp-Source: AGHT+IGcCGVB2A62UC58OhtpaaXaVCzLnhChXFctFGhD5tDm+yMt2bbM+JBRBi6IpsU1jbGNN1PcoA==
X-Received: by 2002:a17:907:1c92:b0:afd:d94b:830f with SMTP id a640c23a62f3a-afddd211e15mr232290066b.64.1755608965129;
        Tue, 19 Aug 2025 06:09:25 -0700 (PDT)
Message-ID: <ae2e8b69-8251-4f60-a5ae-f6bfe413aafb@suse.com>
Date: Tue, 19 Aug 2025 15:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] x86/fsgsbase: Update fs/gs helpers to use
 wrmsrns()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-16-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250815204117.3312742-16-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2025 22:41, Andrew Cooper wrote:
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2733,8 +2733,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>      case MSR_SHADOW_GS_BASE:
>          if ( v != curr )
>              return v->arch.hvm.vmx.shadow_gs;
> -        rdmsrl(MSR_SHADOW_GS_BASE, val);
> -        return val;
> +        else
> +            return rdmsr(MSR_SHADOW_GS_BASE);
>      }

Here and below, can we please do without the pointless "else"? Strictly
speaking in Misra's terms that's "dead code" (things working identically
without), and I'm quite happy that I can now use this argument to
support my personal antipathy to this style of coding. Or else use the
conditional operator in such cases (where applicable).

Jan

