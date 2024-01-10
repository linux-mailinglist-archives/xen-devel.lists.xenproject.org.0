Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0F82977E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 11:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665372.1035574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVml-0004Bv-Gj; Wed, 10 Jan 2024 10:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665372.1035574; Wed, 10 Jan 2024 10:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVml-00048j-Dy; Wed, 10 Jan 2024 10:26:11 +0000
Received: by outflank-mailman (input) for mailman id 665372;
 Wed, 10 Jan 2024 10:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNVmj-00048d-DS
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 10:26:09 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a97bdbb4-afa2-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 11:26:05 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cd1a1c5addso46085471fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 02:26:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ba44-20020a0566383aac00b0046dfb833ea5sm1208480jab.17.2024.01.10.02.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 02:26:05 -0800 (PST)
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
X-Inumbo-ID: a97bdbb4-afa2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704882365; x=1705487165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkIxd72KTRK5aGLmX3F3dRULdYZln7retd8aWfq1A5Y=;
        b=Qja1I6ogccg0KJ4zq5eDacv26H0I8uABsikh3JonVt7/EohyQS26sZl72bjyXzwUJa
         41H1b4MZ9RjoT2N4G1Y1D0JJpIPBDgXPty1rti+shTZaeep+n+LiTT5EtpUOeewq0TJF
         62pO4AvalnyyVRnVs4Gj8VIotHmOMLr1hEM2VliwGeLqqOljWBglfjgapMj+0mXDYlZs
         mQ+hwXPg1rd+tzq4Bhi6LzwgEo7pJNst3pOV4iwZXttKNY3QFJipWA/JV3sgT1bNwJbm
         fWeuAPFaDPmOokU23CNsq+6SzTHIrrniFIEWFWQgtCh9+JtR+WJc0D103HSa6QMsz2Q2
         Rbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882365; x=1705487165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UkIxd72KTRK5aGLmX3F3dRULdYZln7retd8aWfq1A5Y=;
        b=aoprF3Z8TaQ6vn3RVEtKpU2T1+iS8VNcpq5qoM8eahSD+nXg6FmPu5iNnSTG/saUdt
         /pAk5u7sfYVuqAMlXOP0qeq1HCZn1yNYGFaU/Mzrur88WlV9s4+H/rpyJ2YvOsyorz+u
         w0EbH0t5NNo08Wvhim+YqDp5DN1q52lVrep6c3xw+DbRBDJL51/X4adjQAqXjo3txqZZ
         /xO0Rr/xXcunYBM3HbUnFw3q2jIeTcrlAAtbtn2DBdS1B6a5X+wF/2o2xv4CH7VO1mLz
         eVGaU3lUXknlTcVc4W3cHVrqVW25USxznA0tlW6hMoNBdQD86fXLkZHbttstjeejs/gH
         8qTg==
X-Gm-Message-State: AOJu0Yz331gFZnAitIEKzBabtYWXOKI9dzhpNLmip6fQtkGFp0ykZtQR
	MDYoQxG2oV2W5/jniT2M58ZwlWB1bTlR
X-Google-Smtp-Source: AGHT+IG+GmmVasy2X8N7zexuxhc0Tv6+P0/2vT8yiojQGp6gb0RMHyTz4bokcHwO2S+ELh5hIEgS3w==
X-Received: by 2002:a2e:8447:0:b0:2cd:3141:5d52 with SMTP id u7-20020a2e8447000000b002cd31415d52mr411807ljh.83.1704882365399;
        Wed, 10 Jan 2024 02:26:05 -0800 (PST)
Message-ID: <238b79f5-0510-4306-9c32-19dade08e819@suse.com>
Date: Wed, 10 Jan 2024 11:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240110095311.61809-1-roger.pau@citrix.com>
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
In-Reply-To: <20240110095311.61809-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2024 10:53, Roger Pau Monne wrote:
> The HVM pirq feature allows routing interrupts from both physical and emulated
> devices over event channels, this was done a performance improvement.  However
> its usage is fully undocumented, and the only reference implementation is in
> Linux.  It defeats the purpose of local APIC hardware virtualization, because
> when using it interrupts avoid the usage of the local APIC altogether.

So without sufficient APIC acceleration, isn't this arranging for degraded
performance then? IOW should the new default perhaps be dependent on the
degree of APIC acceleration?

> It has also been reported to not work properly with certain devices, at least
> when using some AMD GPUs Linux attempts to route interrupts over event
> channels, but Xen doesn't correctly detect such routing, which leads to the
> hypervisor complaining with:
> 
> (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
> 
> When MSIs are attempted to be routed over event channels the entry delivery
> mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> inject the interrupt following the native MSI path, and the ExtINT delivery
> mode is not supported.

Shouldn't this be properly addressed nevertheless? The way it's described
it sounds as if MSI wouldn't work at all this way; I can't spot why the
issue would only be "with certain devices". Yet that in turn doesn't look
to be very likely - pass-through use cases, in particular SR-IOV ones,
would certainly have noticed.

Jan

