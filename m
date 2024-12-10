Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4869EB1F0
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852407.1266211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Jq-0005tj-V2; Tue, 10 Dec 2024 13:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852407.1266211; Tue, 10 Dec 2024 13:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL0Jq-0005rU-S1; Tue, 10 Dec 2024 13:30:30 +0000
Received: by outflank-mailman (input) for mailman id 852407;
 Tue, 10 Dec 2024 13:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL0Jp-0005rO-Fn
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:30:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb1ba314-b6fa-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 14:30:27 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so1720034f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:30:27 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbd72sm230709945e9.44.2024.12.10.05.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:30:26 -0800 (PST)
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
X-Inumbo-ID: eb1ba314-b6fa-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733837427; x=1734442227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XyJBdey3p6iuG1n18uVDr94Cn3NvsWWrH930guGT5y4=;
        b=TTG5B18DgY5c4y8ISPKkg+yi1eCN3v6Xp01M5XvwsgrFRLOPL6+1EVDbgNDcwYKwxR
         d2hT1S8GTQ8dRZaShPA6U3IqOZxIiOkIG18mJKE0BeV9+Q+cMM81aSyA4w30EBFxNixy
         6jIzTl+CxwJ/ztUJ0w2Kh5euwt2kWLW7R3/kyj2yOCxnA4ezJu+tKQ5d9uN28xnfjMUa
         rqr0i8TwKpTjwR0qaGm8qNuSmSPlNMNlLtT9smpbFRKtXHcOwJL9/jmH4qsTZVaSmaJP
         qjvka/gpTzSjGNQY/VTqJqe8KqsWZFr1uVi9PcTnLhVplzPcBlGjBvqNEdZ8mbFluDP5
         SZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837427; x=1734442227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyJBdey3p6iuG1n18uVDr94Cn3NvsWWrH930guGT5y4=;
        b=VoWfoFulfmCV3l0H88WS+u7qhM6qc97kFB7/KVKrXyrqO0+2AaQ74JIZunopPQh9Zh
         E9UgKh3bRfisd5G0FKsiWq4gHVnmiMUV2qyZ7hCXAY3MsTSxfgvwzssp3VyQ1erSHEoZ
         KFlnxxzAPWaQAGJ/P1vqKlCldteIcDcVgCfq7XcAX+gapq6Oieicurw38ABf9IZQ380t
         VyeH3YXv6nfnomv8V9B7VIDq5z4GkXCBThAXVkTPVQtaNNbof4evduqBSGJmJp1jxYxT
         z4a0UfHCRl+qN6vH7y7nzdYplK2ZUFCzdjWQpP2WrmY34MOVVXnIiONfjCYKpVOEPQr9
         RfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYhLGKBIBntGWoWCkDAlDROnhtr6VgKLenQBl0HQdJJC/LNNPTIIy01dno8SwlqQn3SPnnsRhsF8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmLQPXyd54d0pvt1sv+xXv7XuQQOCrapAyG98kVPji0ibmoAwt
	b6Wp3hUrv8H2GSXMCdfZggimBZ5yhyhgdCFK8eaFaJhdU/5jMkvmrUkfd1Wn3Q==
X-Gm-Gg: ASbGncvAja6D252vE8eL0502W6TQRKkHyrkBOBV7dDiR6LqAskywrWfIY6iZABT2inj
	rtc/OIO0ykU2BrFe78BuhvRBs2RMhLRyzRuuiESoon84cHswG0gtxKW4HR4ut2EHVZSupy2wL0D
	YJa1SMkJBAciPyCKMU9ZNZgYCuzU390oJ1raid2k7dre8GStzw1gmzsFuHZMGH//C/OrjqJUzEu
	D9Mavy6SN8TcndtB8e4ANsRfTi8RsI07CIEuAB6JSrWKpcDlUFRba8vzFStwjivoeLEU85ieyIo
	MJiPICoPTyE62uChc9eXdRGFBw+kPMOG9Dkp1911ta4hShKaIUJEfwAYGUnKMLNWf0UvUcrma6C
	levNtmlqVfw==
X-Google-Smtp-Source: AGHT+IFVRfAlkqJnjo2m8OY8QXIAgnvdEmrVrQESMpo6C4LWjkxN2vihnMeWp/rx3gDjRil0s/z/lw==
X-Received: by 2002:a5d:6daa:0:b0:385:e176:4420 with SMTP id ffacd0b85a97d-386453c5e67mr3616947f8f.10.1733837426841;
        Tue, 10 Dec 2024 05:30:26 -0800 (PST)
Message-ID: <d64d0e24-6e88-44d5-a5c8-36f4296489bf@suse.com>
Date: Tue, 10 Dec 2024 14:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/35] x86/domain: print emulation_flags
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-9-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> Print d->arch.emulation_flags on the console for better traceability while
> debugging in-hypervisor hardware emulators.

Personally I disagree with such extra printing. And that would in this case
even apply if you used dprintk() or gdprintk(). However, if others support
the idea, I don't mean to stand in the way. Just that ...

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -818,11 +818,15 @@ int arch_domain_create(struct domain *d,
>  
>      if ( !emulation_flags_ok(d, emflags) )
>      {
> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> +        printk(XENLOG_G_ERR "d%d: Xen does not allow %s %sdomain creation "
>                 "with the current selection of emulators: %#x\n",
> -               d->domain_id, is_hvm_domain(d) ? "HVM" : "PV", emflags);
> +               d->domain_id,

... if already you touch this, please switch to %pd and also ...

> +               is_hvm_domain(d) ? "HVM" : "PV",
> +               is_hardware_domain(d) ? "(hardware) " : "",
> +               emflags);
>          return -EOPNOTSUPP;
>      }
> +    printk(XENLOG_G_INFO "d%d: emulation_flags %#x\n", d->domain_id, emflags);

.. use that here.

Jan

