Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05E8B1BE1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 09:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711864.1112154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztVY-0008Lu-Th; Thu, 25 Apr 2024 07:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711864.1112154; Thu, 25 Apr 2024 07:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztVY-0008Jl-RB; Thu, 25 Apr 2024 07:27:04 +0000
Received: by outflank-mailman (input) for mailman id 711864;
 Thu, 25 Apr 2024 07:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rztVX-0008HB-K0
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 07:27:03 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f5d632-02d5-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 09:27:01 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b5dc5e037so487705e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 00:27:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv20-20020a05600c549400b00418e4cc9de7sm26094358wmb.7.2024.04.25.00.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 00:27:00 -0700 (PDT)
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
X-Inumbo-ID: 34f5d632-02d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714030021; x=1714634821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jic6N/sTlcTsMuzxshnawSUTS0h7ojbct+KQdG8CJjU=;
        b=Q+RPNChC1a7wrnGr2MFDyu4p/OUvsQqiKBEQNRk126B2/Je7STJ1/CCjOn5HAmAXjz
         V73kdFovcp90YPPKkvTQEhgOLGAHcm6edxcOz4f+Enjgo13ea/sLpm/1G5JvkoL/YWJv
         0sSa++rbzzDh2N5d9n0Y3IFBGSRitgJrj44gEIiPloebpdloQyGGULcheGwENOWygpru
         CLcSxkqNKyZ8nB/sP+lLvcLZGHQ0NeNUIO4n1Mkwd0qwq2Q6A8C99BnyPH07DYX/T5rI
         lRuixDhddoQItRydymxq2NCkKO19gQOsU4LZlTI8nF9CasD1+n0dNWbk1TX4shFSaqds
         QR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714030021; x=1714634821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jic6N/sTlcTsMuzxshnawSUTS0h7ojbct+KQdG8CJjU=;
        b=WckqKftMecmq44K21q76DQNIuoBW02hBUZFL+m4RT7aLGKBjLlnpQ4K/5S5H3MHeyE
         RcTiiJQJcw2PuSWYXY2DJv553GF9dYiIwukfkSzUwOFdTCsAK73FDWss9S9uvW0T709o
         h3k5Azg3ADJtpXDQezqyGt+eXYVvYgF7Gv/xYyfsQhOp25V7K9790kVIbvEt1EbwHcM7
         JQEJ08nT3ikrBU/Kt72+ttkKZQ59ZNU+kLyh8avlGCwsDVQEvgGj+VBv9uUsUkCafpfW
         ReRpEp0knejwcmS5z/qPfH2uX8XdY23423lF5iZRzaTvGAMSDuHAsWFi2WFxu79ZoBKt
         sW9A==
X-Forwarded-Encrypted: i=1; AJvYcCX/i1cLI52LdC7Z4UxSr4n7B/T+qSgp7T4lXYRZvSRLcO4KZrRKYNTdijev3pvdvvkQiFLdJF6RQ7AxBKc9/7UtyvYTBQU6M4eXjXzjwtQ=
X-Gm-Message-State: AOJu0YwFYi6pHuECMEtL21m5KJ87vEmTSg8e1UPc1aYWmiOSuPRW75pL
	gd+BZk8OLacP2kXsdjwMetvMUleG5PyN8lD17KqSoLktEqmWuC6czynRlbIDKw==
X-Google-Smtp-Source: AGHT+IFoee3TSAKsdoq47h5kEqVQHz8zlu5VH2HPpqGUFu9fe/RjJQ3rS4bNXuobBbQVW7nOVFsdHQ==
X-Received: by 2002:a05:600c:4f53:b0:418:c2af:ab83 with SMTP id m19-20020a05600c4f5300b00418c2afab83mr4200999wmq.36.1714030020785;
        Thu, 25 Apr 2024 00:27:00 -0700 (PDT)
Message-ID: <adf9c5c2-ef6e-47b6-a29b-8765549d02df@suse.com>
Date: Thu, 25 Apr 2024 09:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/x86/pvh: handle ACPI RSDT table in PVH Dom0 build
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240424191826.23656-1-dpsmith@apertussolutions.com>
 <9861a2f8-4a16-40f1-ab10-583101f922f1@suse.com> <ZioB5c6fVcateTbj@macbook>
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
In-Reply-To: <ZioB5c6fVcateTbj@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2024 09:10, Roger Pau Monné wrote:
> On Thu, Apr 25, 2024 at 08:12:09AM +0200, Jan Beulich wrote:
>> On 24.04.2024 21:18, Daniel P. Smith wrote:
>>> @@ -1089,6 +1098,9 @@ static int __init pvh_setup_acpi_xsdt(struct domain *d, paddr_t madt_addr,
>>>      xsdt->header = *table;
>>>      acpi_os_unmap_memory(table, sizeof(*table));
>>>  
>>> +    /* In case the header is an RSDT copy, blindly ensure it has an XSDT sig */
>>> +    xsdt->header.signature[0] = 'X';
>>
>> This is in no way "blindly". The size of the table elements being different
>> between RSDT and XSDT makes it mandatory to have the correct signature. Else
>> the consumer of the struct is going to be misled.
> 
> The "blindly" IMO refers to the fact that the table might already have
> the right signature, but this is not checked, IOW we could do:
> 
> if ( xsdt->header.signature[0] == 'R' )
>     xsdt->header.signature[0] = 'X';

Right, and indeed I was seeing this as a possible further interpretation.
Yet given multiple ways of reading this, I'm of the opinion that it wants
adjusting. ", ... unconditionally ensure it has ... " may already do.
Simply dropping "blindly" would too be okay with me.

Jan

