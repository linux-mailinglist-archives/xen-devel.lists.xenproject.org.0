Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66159B1B229
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 12:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070331.1433988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujF8P-0007HS-OY; Tue, 05 Aug 2025 10:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070331.1433988; Tue, 05 Aug 2025 10:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujF8P-0007FC-Lm; Tue, 05 Aug 2025 10:43:09 +0000
Received: by outflank-mailman (input) for mailman id 1070331;
 Tue, 05 Aug 2025 10:43:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujF8O-0007Ew-CL
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 10:43:08 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f953d3f8-71e8-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 12:43:07 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af93c3bac8fso573279966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 03:43:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a911a66asm7990548a12.64.2025.08.05.03.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 03:43:07 -0700 (PDT)
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
X-Inumbo-ID: f953d3f8-71e8-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754390587; x=1754995387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gAP9eRgCn3/MdbdWK7FpW2EKJtswmlWQ239+zlD5QME=;
        b=Nphld2Ng4aBrKb5v6j+0hfQ+ZcrzbC6gBxeKBd3dZLS0QrcMZuOrjGZejtCCrGbZnm
         js7JwnuC2GoMSu3rp+7WnXAA5bki/NrpRFfGiir1L7hBbkzc065+80to/cTsdnCcmu3e
         jpEmANJU1pv7mj387xHlm3sqYK9ZMezn5ClGZZz+nK4QJMCv31Klr8P6PNIRq2qZl8a7
         rlSnmNUgUUPwuW1TpFSHENzyh23Q8ETanu45d8MBHDLZh+aZurS+2EKh/5ZrGsJgydjS
         R0GYU0q+NRBQ8DE6e1OfEekZR3IrXAMkpIqhJl+Q9S9IsjLL6rHeynsbRsyXjWKm6M4n
         ORxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754390587; x=1754995387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAP9eRgCn3/MdbdWK7FpW2EKJtswmlWQ239+zlD5QME=;
        b=hqIN0DcsR8iaFGOpbzyH1gRpV2K1RRHRMwdPq0TvBZNr5o0m0ORLmYp3qoGJxdyiri
         jIAW/2YL7ofi87iItyW0BBYk/jQP9z+M/PAmmtoNqHqEiezCYh/OPPyhqNXbFHzHmY6G
         7BhNEreFswa6x26a6qjt8OJaJxvNtC2pus142cadOtt3fvIRJ3p/Vg7qFKh1bd8ZkwU8
         GOTp7TcRyd3HYbofzrj8dVUTbU+PHt8P2iixUdUa1w1ZtfHq7jhTmO+xjrSUFoXcLWhw
         uxAK0AwuBP7PYcyWtcW+8p2TlrMYA0iTT13Fxhi2nnozkgBgaHPDuoqISjbDIJ7U+6Bm
         lJgA==
X-Forwarded-Encrypted: i=1; AJvYcCW6efEAV4/yHYYYfYYLceXugTs2uCH4r4ft60TxC9rWm7EtkOfgCYjkfizn2Vb6e27seOSN4gCh/yU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXZoqmE2sd0Dr5EUJv3sQJq8r+uLRxYL5F0gmm+SL2/F6PTTUx
	fqhuvHovpQ0vSbaqUpQg49BKYhxt13GGxLxYVesQd4Hr2soHIhyscZ++mFhTRiVVyQ==
X-Gm-Gg: ASbGncs3upSOjc2yAGpLNTrnG7kQw7ad+Yf9sgWR536X3s9gj7rEUsIuLk+ICll/GQ4
	TvYZPYpJ7ALEQVzPJ+G/Bg8Y29KuMeKWIFiH6DbuI0ReWROb27fkdqlMsYXmschmr9nmxn/io6T
	p8TAXKIq4Gh39//WRnbTMh5hJz1Or/fBElii8M0pbLdwxvhflmWQifGFT5zJ02YrRyubcnJeSQN
	QV2M7u+stLcxySPye9AzXNB/8ZK+pzAADeQg97qye+fCKsART0SFnLnxjCvZc8/JROWUpCw8WON
	BPRTd7MOC0ejCPml+4qtVMxGDlaTg5YnhAdF45e2kn5VAWrKmXnX9mgbIJBOYWUc/I2l0LUqYLZ
	AY/OYaaIMljRMmDMUaivZXCHNgXCVnamH/sAnV0oCyu6iVB8TVBIazuEJXNb8Z0JkREqu87HpPY
	EsWyUaKHw=
X-Google-Smtp-Source: AGHT+IE6Kk6ncZzJfPwUyNuuLlewygtvGLe1VOkVl+AN0Y7M/jZ6bVfMGiZqp6hzhoqw7eXeEHT+cw==
X-Received: by 2002:a17:906:c14a:b0:af9:81d0:d971 with SMTP id a640c23a62f3a-af981d0dbe3mr192923066b.50.1754390587313;
        Tue, 05 Aug 2025 03:43:07 -0700 (PDT)
Message-ID: <7491c934-f847-4fe2-9d9b-a500f0888198@suse.com>
Date: Tue, 5 Aug 2025 12:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
> +{
> +    struct domain *d = p2m->domain;
> +    struct page_info *page;
> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
> +
> +    /*
> +     * Return back nr_root_pages to assure the root table memory is also
> +     * accounted against the P2M pool of the domain.
> +     */
> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
> +        return -ENOMEM;
> +
> +    page = p2m_allocate_root(d);
> +    if ( !page )
> +        return -ENOMEM;
> +
> +    p2m->root = page;
> +
> +    return 0;
> +}

In the success case, shouldn't you bump the paging pool's total_pages by
P2M_ROOT_PAGES? (As the freeing side is missing so far, it's not easy to
tell whether there's [going to be] a balancing problem in the long run.
In the short run there certainly is.)

Jan

