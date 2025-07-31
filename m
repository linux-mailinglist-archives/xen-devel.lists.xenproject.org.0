Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4544CB16DA5
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065050.1430372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOlt-0004Dd-Ck; Thu, 31 Jul 2025 08:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065050.1430372; Thu, 31 Jul 2025 08:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOlt-0004An-99; Thu, 31 Jul 2025 08:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1065050;
 Thu, 31 Jul 2025 08:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhOlr-00049M-Ox
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:36:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b07f743-6de9-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 10:36:14 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b783ea5014so380729f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 01:36:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e89a3a6fsm11556845ad.147.2025.07.31.01.36.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 01:36:12 -0700 (PDT)
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
X-Inumbo-ID: 6b07f743-6de9-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753950973; x=1754555773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ONgRhdXmf9onFuBGl4bd/30WXWwjYnF1E1GUafL/mWM=;
        b=GarXf0Yf8hNGRh2z2+r6p35y4q6C/DwtOE4uq3Srr8vt8TZ/9B6Cno8yYHt/EFn8Pp
         Y64JnGP/NWu41f97cRyH8zbhMjRRA72K4vXmEURmUQewDqTcWC9kG2RVkykzFTVr+vQq
         QyAi0u5/5XG+yTZwE/3m+/gjaMBX/nb/MnMAhleeH47kX0kZijViqetzYZfjvryIiheM
         uMraGhg9MJcxZs7ll2NzNg+aer4Ork2KvoOHtP9uPolM9rwLM8DQsU6gmsUlFhdZC6MA
         BOvsEVbblFvfWs4ASwYewERkAOMiXZiKlCMbCal/bh1+JSZh5MW6OFrPgL5aczE3L1JH
         KFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950973; x=1754555773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONgRhdXmf9onFuBGl4bd/30WXWwjYnF1E1GUafL/mWM=;
        b=HTTDxrANiLYQ3/CoHN7QfmmfBkd7spRkd4GqP7t+abJVRrGyfbN1DJ55ZLtjfBMXAB
         BTkXis8VwFiydacD6+trQhvIE/Rq5cguGdwRsqs0xk3Z77qFNwXVgCU+pRLY9ED1HOOj
         kB8TierXvIdt5uMuEqpCN6289A7Bkv7TWP+Qc3ehgc240Ppr24mQ1QFkCvRLknY/q+bS
         8NRvZWL+78OCQpICHaWZPCHwIcYTUJvgwrxdaEZ6OK+8+HEx903NhEPJiWWBPAonoxVO
         gXb++t76Gky0QssUw1iHt//RTq+Eu2JH5Jwt8H8wtjmc2H8lSv/Pp566Lj5qgLHf34VD
         tpwg==
X-Forwarded-Encrypted: i=1; AJvYcCXiLjGknKej3nS+qJOwtSFEibaroe1LX1elIMmMoeOjwjpaUsWvL2O6xg2Tr6NCRqYTDzlepBZ/0SE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSf+lP/biorC9WBKbQeCEM+DLzruwWNzrCAhlnIfKsxp/yArgu
	AuAwlBRDcFsOxT253UvICr3VZv2a6kj1sxqgMJYZF42CL4fT5uZ4O6GACrjW/8iBew==
X-Gm-Gg: ASbGncvdIg1WEqjBC9dNOziMIKw57IQenpvOrtw9Q7Ycro/yXVueA6DK2BtFfc3YKaN
	GzCf3fFP7B6wMOtmHGQJRQI/Wo0xW6wAEsVoY8ZrX8zHsesT1G/hlUFcIIPTUco2NjrL2Q6KTuR
	QkCm7NID7lh0oDKh5p00jmbUdf296iDyhsBGxEMzbU1S0zBsIXgvPB+wUZat8+xZwPS+Iu1Z3Ca
	DrE536wDv2q8rCn07RWMGsvZOVwa3bfihJ88/jUDK6uw+2M17tUjD3M6pTj04NVxNbywIxN0WHw
	CH0We92pym+vqyBQVmWhggEIddTvB3SZdOf0In3RE5EuCBKoHq7OHH5GaWXqiJ7oMNOUCSvZMSH
	60ZmCL7wtHd0pLxpDEihufyQzAwTwzUO7jxcl/FULk3yR0Z3qB/Hk6ENnASK9ujDOfm+9r1ZZE8
	6beo9Z2Jg=
X-Google-Smtp-Source: AGHT+IFIR+V3Sx50qX9F3cFH3KIVD7JRX8u7NqplLZtwZlSSHLdOJVwGNtPMnuRm498rjY4BNC7ZPQ==
X-Received: by 2002:a05:6000:43d5:b0:3b7:fbe3:66bb with SMTP id ffacd0b85a97d-3b7fbe36970mr399294f8f.50.1753950973376;
        Thu, 31 Jul 2025 01:36:13 -0700 (PDT)
Message-ID: <59f03a28-71a6-4cbd-aca6-0a5a1bf1f0cd@suse.com>
Date: Thu, 31 Jul 2025 10:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hvmloader: fix SMBIOS table length checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1753869323.git.w1benny@gmail.com>
 <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
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
In-Reply-To: <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 11:56, Petr Beneš wrote:
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -47,6 +47,8 @@ static void
>  smbios_pt_init(void);
>  static void*
>  get_smbios_pt_struct(uint8_t type, uint32_t *length_out);
> +static void *
> +smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size);
>  static void
>  get_cpu_manufacturer(char *buf, int len);
>  static int
> @@ -154,6 +156,24 @@ get_smbios_pt_struct(uint8_t type, uint32_t *length_out)
>      return NULL;
>  }
>  
> +static void *
> +smbios_pt_copy(void *start, uint8_t type, uint16_t handle, size_t table_size)
> +{
> +    struct smbios_structure_header *header = start;
> +    void *pts;
> +    uint32_t length;
> +
> +    pts = get_smbios_pt_struct(type, &length);
> +    if ( pts != NULL && length >= table_size )

With this, the function parameter may better be named "min_size" or "req_size".
(I was first irritated by ...

> @@ -381,16 +401,17 @@ smbios_type_0_init(void *start, const char *xen_version,
>      struct smbios_type_0 *p = start;
>      static const char *smbios_release_date = __SMBIOS_DATE__;
>      const char *s;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>  
> -    pts = get_smbios_pt_struct(0, &length);
> -    if ( pts != NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle = SMBIOS_HANDLE_TYPE0;
> -        return start + length;
> -    }
> +    /*
> +     * Specification says Type 0 table has length of at least 18h for v2.4-3.0.
> +     */
> +
> +    BUILD_BUG_ON(sizeof(*p) != 24);

... there being != here, despite the comment saying "at least". And the
check here is ...

> +    next = smbios_pt_copy(start, 0, SMBIOS_HANDLE_TYPE0, sizeof(*p));

... for the sizeof() use here, aiui.)

> @@ -498,26 +517,30 @@ smbios_type_2_init(void *start)
>  {
>      struct smbios_type_2 *p = start;
>      const char *s;
> -    uint8_t *ptr;
> -    void *pts;
> -    uint32_t length;
> +    void *next;
>      unsigned int counter = 0;
>  
> -    pts = get_smbios_pt_struct(2, &length);
> -    if ( pts != NULL && length > 0 )
> -    {
> -        memcpy(start, pts, length);
> -        p->header.handle = SMBIOS_HANDLE_TYPE2;
> +    /*
> +     * Specification says Type 2 table has length of at least 08h,
> +     * which corresponds with the end of the "Serial Number" field.
> +     */
> +
> +    BUILD_BUG_ON(offsetof_end(struct smbios_type_2, serial_number_str) != 8);
>  
> +    next = smbios_pt_copy(start, 2, SMBIOS_HANDLE_TYPE2,
> +                          offsetof_end(struct smbios_type_3,

Was this meant to be smbios_type_2?

With the adjustments
Acked-by: Jan Beulich <jbeulich@suse.com>
The adjustments also look to be isolated enough to carry out while committing.
Provided of course that you agree with making them.

Jan

