Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874B9A28976
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 12:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882175.1292357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdkW-00051M-9z; Wed, 05 Feb 2025 11:39:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882175.1292357; Wed, 05 Feb 2025 11:39:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfdkW-0004yY-6d; Wed, 05 Feb 2025 11:39:20 +0000
Received: by outflank-mailman (input) for mailman id 882175;
 Wed, 05 Feb 2025 11:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kcl=U4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfdkU-0004yR-Ij
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 11:39:18 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d44f4ef7-e3b5-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 12:39:16 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaec111762bso857513966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 03:39:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab703fbcc0csm862254966b.53.2025.02.05.03.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 03:39:15 -0800 (PST)
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
X-Inumbo-ID: d44f4ef7-e3b5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738755556; x=1739360356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=heca1CkwRY0geQle2e/RQNz/OuP+e76q1LqnUUBxWHM=;
        b=Mm9XTukzy496j+lAI+ZwoEYVv2R6jZg4j3DbOoi/z7hIMXa1m4W920usxH1W6XYcNK
         r3wHad33VNctZGB8cpbwXifFB6AZy/DOsromm3NKze0ssxfjgaUZ4pE69iagxyn4X7ye
         sQTqAKaJNj/UuBaGi87OzqeK3W/R1xnz85dbINq9yYM+KmxMJvdL+mD8Wq4KSVhh0WgO
         n8texwsKFWGN9wtQbni/TD74LkKaLY7OYMbxjqB4vJA6eHgwFbLqhrZdAAQbOeQK+ZvR
         GlIEd3ITVAySDC+qoqZ1U7aGGmw9DnvNTeQPDFVCN/h7q+L2soNUA2fhNq2OTkndhLqO
         V02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738755556; x=1739360356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heca1CkwRY0geQle2e/RQNz/OuP+e76q1LqnUUBxWHM=;
        b=R90DWOpd/nnuv2RVLjzW0xCdMISOQh3fLsSxEmtHLie8i9DWmhmjwQhWV6IkILTxbr
         kRdSAKfl6JpvYMCRCWuYkEj4aKXFUXqpyBtnybzLlMwMj3RNS2ybIthPw7IqbsvInHNw
         G0frlg5uv/pCQeKIiXbftFyDmLVXbJWGvL6wRaX6LyUVDKxfqAyKkuSD7g9ba70hJ+WN
         eU4A2XSGXX65ZA9s+sXV37J5HyQFVQiF8NWWF9245yaOTF75snyCHZflJKU6Hb8GT22c
         i47jp2clw4rEgu2jdl0jpbTmOfyjXL1p+kIujpbNlko/St8kzuNEqt9M+hZKrinFbrkI
         Ao1g==
X-Forwarded-Encrypted: i=1; AJvYcCW7cveapW66rBdt7XffXN+OgvAmyxp3ugzFQM+Ul3xHlTzdfZRE8Sap/Q79c57yz1WLdYQd2RMvvYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4r3ZaEaNrACPuokOWoItPKU7oTVsWApdwpyOnOGJ5qbCqf3Dy
	c9ElyAVBoAXyVYVCVYPU8rcBCf7UgQFIVuSp2v1qgFqkVZHsbBUD7/mngk+IVA==
X-Gm-Gg: ASbGnctFYjVHxS5eSzYrI1k1/dVAI7YVBxXI8741iTmOxzzqSQfyZraM6v+jFvZwacp
	CZqViLy1jDpPIso1poKllTzkwtSARvRk3D3iyvjP0limg8n4viODwzymRmNmGUKDJJlsWhJ/8pm
	SYfIuReEsppuSlhZuvhy7UfAdT2BisrlioGafthL9e/tPqM3yhd3tz/pdhw+FsBoNWk9k/JmOgo
	sj7j/aPJBKbPYQ4lKoxXgXrIoVNAei3L/pKrnKvkTP+FnrTWuVi6DY3YjwNvEd2iqssnoZFgyAh
	52D+Nrs799/3AlzF8FVBHma/577AmVkPiJBjZHN5BFU7Ls/14wEeTXZYDDcRMfXGsUJ1GWYGqh5
	w
X-Google-Smtp-Source: AGHT+IF4l0S39gz25a0TR1Go6gKpCC/s8Q9FNfEboFf25fP1gs64OZGiYJRyo8gF1+u/x+oAsKz3sw==
X-Received: by 2002:a17:907:1b29:b0:ab3:2b9a:4a5a with SMTP id a640c23a62f3a-ab75e362679mr247700666b.51.1738755555732;
        Wed, 05 Feb 2025 03:39:15 -0800 (PST)
Message-ID: <f1aae953-cd21-4bd2-b35c-01a88684f9a6@suse.com>
Date: Wed, 5 Feb 2025 12:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] x86/xen: some xen_hypercall_hvm() fixes
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20250205110651.26280-1-jgross@suse.com>
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
In-Reply-To: <20250205110651.26280-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 12:06, Juergen Gross wrote:
> 3 fixes of the xen_hypercall_hvm() function, with the last one being
> probably more a cleanup.
> 
> Juergen Gross (3):
>   x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
>   x86/xen: add FRAME_END to xen_hypercall_hvm()
>   x86/xen: remove unneeded dummy push from xen_hypercall_hvm()

Reviewed-by: Jan Beulich <jbeulich@suse.com>


