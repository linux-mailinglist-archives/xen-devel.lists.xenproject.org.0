Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49194B20043
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 09:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076952.1438047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulMx6-0004Kw-R3; Mon, 11 Aug 2025 07:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076952.1438047; Mon, 11 Aug 2025 07:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulMx6-0004Iz-OW; Mon, 11 Aug 2025 07:28:16 +0000
Received: by outflank-mailman (input) for mailman id 1076952;
 Mon, 11 Aug 2025 07:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulMx4-0004Ir-TT
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 07:28:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb4a3a7b-7684-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 09:28:10 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-615d0b11621so8837235a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 00:28:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f000c3sm18059751a12.4.2025.08.11.00.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 00:28:09 -0700 (PDT)
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
X-Inumbo-ID: bb4a3a7b-7684-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754897289; x=1755502089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7wJ6Oq2TWjLoeNua3H6TFQOypTZjRK2+DjCno4Lq9gI=;
        b=ADkHuUkgVE6vBxnxEQEKzsSS8CDKswnRmubyF7AWzdQj/6JqaisEDoD+b5Da895Fyf
         RNjX1FaLNcgaBkMqqSpwh2JF39UBH2weJSg5EugXY+5YAm+Zn380e9/CKdO+fjxaejab
         qyKzT72wwbdI6hdtvZ4BMWHz5fev8iRFgZPNc277pBOUnkjPR9mm64AYD8uS6wNk1y9a
         W4kB/KkMG9EMKPMK6EZvgu2B/tvh5EwIHBE14L8jyUf0XGCBeFiXGp1gYHlV95EjnkfP
         MvVlFRoxSql+UI6XP/r5hzlF+F1MLO8/5SzgRU47Q66K/Xi5oJlr5+ARXAUUHq7LJV05
         FCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897289; x=1755502089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wJ6Oq2TWjLoeNua3H6TFQOypTZjRK2+DjCno4Lq9gI=;
        b=gStjHlmUiUzXmqnPdjxfX4A9V4QKdQlk+2OyLBIXnSALQOErsxpNxPJQuCYEi/dEbD
         BnlXv1s7MgIg3X0GI+YA/7a0yxLdiF+/k+qj3PdDQ3m8ETgzUVE8cxNbLrt55l2Dy2P2
         OcJgagLjQ5t8q0213lf8QfvySJyynLBtp8uyZ+dTie4VVu/3u49HjV8NktcgdQ6Z1wjj
         iUrmOTgiUMJIHF/vlkMjicn+dWvPr38DqhA5yAje2bF/mKeyzVBwegN8Ua1vz2SGMAFI
         tszHGAuyQh9ojU+CcdO8b25lLysCNIyvjbF59BLchccokOtmkgvTyyYb+yEj0Ssm1g+Y
         feGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkBbXv9IuFIdoTq8MfPAT4cyOtYidzcjOowyMcatZjq5IleqRSLLHLkIKhJICXyCSzORugYzmsAjc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yww0N1MJYR2GpcLVPjxNrY+IWY8p/jjxXagcHxQuX4uxdeb2U56
	IhRlfvGVFTso72BpYS++fE7ufwE4IExHDyD2INSx1OKKLt4oj2TQGTj0q0qRReCe8A==
X-Gm-Gg: ASbGnct0WMzQGPIqNwEcJnq/sh2vo0hXgNk3TFMIno0j9T1JdoJN9yW0oESIe/S2Ipb
	zmxP+EMh+j7vkD0LhqerBiIU427ZxbYyOzzHS1frpO60e3+Yc27Wc66LKkkPB33qd6t697q22bw
	1GW2i551U/5pKZ4U4rQAK49gdhZV47YounD2ftCEOBJB7U7EhhXwHCaA0aSFlCgFp/Py5WcW1tD
	E4+rmrJyCDx+fjQdAg+k2uz4/AJpTRgApuwvo8e4UqlAorvUzUm0COrnTFhmwzTksV3+ZZUMyg8
	OOZDnWD4+zm5wpKogN9/yfR78HIlP+1po9ySwwYT82c6kGGAvEBOgfrrgf/bKYUYNiehcVTuM/K
	kVDUDu8+/B2aHdwDcbtaLii2RLpFUwl/Ao/alG4J9SH5hl1GuKHUNO1hxDk5H1MB2ONGRwzlMgQ
	CSxwHnwwPV6a5orLQr0g==
X-Google-Smtp-Source: AGHT+IHoG3IhpsWdj8cmoqJ01J4+Ck2QD6aVHr1tKz4Uv+qojUmvdqCGNRRzCHwiPD5xzkqDVHCY8Q==
X-Received: by 2002:a17:907:7247:b0:af9:6863:9d41 with SMTP id a640c23a62f3a-af9a3e3f258mr1608592966b.14.1754897289344;
        Mon, 11 Aug 2025 00:28:09 -0700 (PDT)
Message-ID: <ffec4fe0-cca7-40fb-a870-6fdf0201f44a@suse.com>
Date: Mon, 11 Aug 2025 09:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] xen/riscv: implement function to map memory in
 guest p2m
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <e00dcbecf8f0dbe863628dcc45526100f9ee86a3.1753973161.git.oleksii.kurochko@gmail.com>
 <e7b4b220-4da9-4a87-a4d6-179350849eaa@suse.com>
 <31c75a64-8b69-47ac-9e08-6010fa6cfb9c@gmail.com>
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
In-Reply-To: <31c75a64-8b69-47ac-9e08-6010fa6cfb9c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 15:46, Oleksii Kurochko wrote:
> On 8/5/25 5:20 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> +/* Unlock the flush and do a P2M TLB flush if necessary */
>>> +void p2m_write_unlock(struct p2m_domain *p2m)
>>> +{
>>> +    /*
>>> +     * The final flush is done with the P2M write lock taken to avoid
>>> +     * someone else modifying the P2M wbefore the TLB invalidation has
>> Nit: Stray 'w'.
>>
>>> +     * completed.
>>> +     */
>>> +    p2m_tlb_flush_sync(p2m);
>> Wasn't the plan to have this be conditional?
> 
> Not really, probably, I misunderstood you before.
> 
> Previously, I only had|p2m_force_tlb_flush_sync()| here, instead of
> |p2m_tlb_flush_sync()|, and the latter includes a condition check on
> |p2m->need_flush|.

Just to re-iterate my point: Not every unlock will require a flush. Hence
why I expect the flush to be conditional upon there being an indication
that some change was done that requires flushing.

Jan

