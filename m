Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383269F7798
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860890.1272869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOC61-0000ld-NS; Thu, 19 Dec 2024 08:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860890.1272869; Thu, 19 Dec 2024 08:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOC61-0000jl-Kx; Thu, 19 Dec 2024 08:41:25 +0000
Received: by outflank-mailman (input) for mailman id 860890;
 Thu, 19 Dec 2024 08:41:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOC60-0000jf-5j
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:41:24 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0588d904-bde5-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 09:41:21 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so345715f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 00:41:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c833899sm1010308f8f.42.2024.12.19.00.41.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:41:20 -0800 (PST)
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
X-Inumbo-ID: 0588d904-bde5-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734597681; x=1735202481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6k/WBCkl7iCln5WNVAn5Y+/eeL+jo8CzgxPWBCK+wx0=;
        b=WoxSgaPJj8ZrH9nork8dE5/OtZsY085gks2m+v+ffM7MakZRQp8vF8UeMrYa0R/+8H
         ZWJE12wuPd9LbZ7FxWW7QcWTk33xspWZtU6XsOoXHUMUIW6V+9xMayyynZvAWxRY41/u
         VK/o5FCzev33k8Hs/XG9U3Eu7fUkXT+Mu1tOB6MTrO011vbHC/REG3ziBY7QoRyziqlO
         waukmJ7g1XB/Lgx+K5nGHuFA2LxlX62UJEYjfia0NoPf68PXgGVMWm2OrjkQOvLYN2tv
         qunDH8oMKA3TDjcZl7RItWusGZxUjYICxOZ1VzhaufC2wbGJ+oMuy5uLl4nU9n9h+kyD
         Ck4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734597681; x=1735202481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k/WBCkl7iCln5WNVAn5Y+/eeL+jo8CzgxPWBCK+wx0=;
        b=p+G+3g5H9VBBIJW7ZIopUL9YQ2khsM7qh7rI6axXQzWyUNgrvqvu+pvAtUAAcpt2sL
         sWKAwaMnpdBELYx8feQNEhqOLyyeRODxo3iMnWCZPb5oWBGZFRMwv3vn7kfm8FSPaZG2
         zoOYh2sSigpp2TMzNfGbtxNAmItTKEb6Kyo8MM9lhoOZ1mwJsw7IZ9GSWz62EX9zGfSM
         fZuHj2fd8I2PMIcSz5d4dx2mPmW2b91bt0orkcChWB0STOa2gV3yC5b1M4T8ulasQDAM
         eRPJja/yLkvlj2r5q8DduZGok/FEnQM0nURVubbwhv8/cGtDfwqCR+x2dz8BCRB2MAS+
         /Ozg==
X-Forwarded-Encrypted: i=1; AJvYcCX8YrtJQdrvsa9mBNMEF0n/BbWG16ucfqPKlE77rq6qrc9sZhBz/PJixpICmSGi2nceGfWZ6PF8Rbg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQs+XhcQUAnHrNiJIQCcX9PrAkLuU3sjFA0EsIGbFxqkzfBSTR
	NLCgpJE8G0UA/XLxOD2204vL38AI+6if9EQlhvb5mwbRxXaEiH08stpZikZW/A==
X-Gm-Gg: ASbGncsY8APQYA76+cAT367tovuxlxN7JouPLWUipd899Jxk2YkY8AMbj8CBFpN2XMK
	fSsID8pJbb9NkS27oa7u+M3usQVRU/Fge8VLj9JPiW8CkGmCaRyAl6t0pUFLqgs2JgzL0B3Hx6F
	uZ4tKtLNBroVFE1N3VrMXyq69YKdyYsrakbin3s/2EeVnMLMae8wNaOORN1rL4P57gJyWhr2hXG
	v+SJkjELDRp05Omnu38dLDLs1TJR6H4qBpVcLcVVvnIeHOR2fnE5JJmfz2yiV9axUYhAStacEEA
	jdshm4Q0RZbMFWaBvwA/mb1cBatGkBeITwfE+G7eCQ==
X-Google-Smtp-Source: AGHT+IHCiHf1/bPsT/BhRkoJk8oRl8joVnBCEud3zqc9X1KHn+PXDdDlgrJN1Gne4wds4QzlSt6qpg==
X-Received: by 2002:a5d:64e6:0:b0:385:e3e7:547b with SMTP id ffacd0b85a97d-38a1a237d53mr2230865f8f.25.1734597681081;
        Thu, 19 Dec 2024 00:41:21 -0800 (PST)
Message-ID: <224c0fde-a8c2-4d44-b1bb-48e7ed6daee5@suse.com>
Date: Thu, 19 Dec 2024 09:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/libxg: Don't gunzip the guests initrd
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240904123121.3837140-1-andrew.cooper3@citrix.com>
 <20241218185453.367465-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241218185453.367465-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2024 19:54, Andrew Cooper wrote:
> Decompressing the kernel is necessary to inspect the ELF notes, but the
> dombuilder will gunzip() secondary modules too.  Specifically gunzip(), no
> other decompression algorithms.
> 
> This may have been necessary in the dim and distant past, but it is broken
> today.  Linux specifically supports concatenating CPIO fragments of differing
> compressions, and any attempt to interpret it with a single algorithm may
> corrupt later parts.
> 
> This was an unexpected discovery while trying to test Xen's gunzip()
> logic (Xen as a PVH guest, with a gzipped XTF kernel as dom0).
> 
> Intepreting secondary modules *should* be left as an exersize to the guest.

Nit: "Interpreting" and "exercise" and ...

> This reduces work done in dom0.
> 
> This is not expected to cause a practical different to guests these days.

... "difference"?

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

