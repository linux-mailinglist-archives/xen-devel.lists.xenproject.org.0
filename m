Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD592B040A2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 15:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042843.1412913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJdv-0002sY-F8; Mon, 14 Jul 2025 13:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042843.1412913; Mon, 14 Jul 2025 13:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJdv-0002q9-CC; Mon, 14 Jul 2025 13:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1042843;
 Mon, 14 Jul 2025 13:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubJdt-0002q3-Rx
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 13:54:53 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d5dbe1a-60ba-11f0-a319-13f23c93f187;
 Mon, 14 Jul 2025 15:54:52 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2627434f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 06:54:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4350bb0sm99936715ad.205.2025.07.14.06.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 06:54:51 -0700 (PDT)
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
X-Inumbo-ID: 1d5dbe1a-60ba-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752501292; x=1753106092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V3wcQzWE4SveXlxdWKFvPKaJ4kIS294185TXHSe5OhY=;
        b=cntiiTExW53A5kN6k3tqteSbcEWQ+3N8NVJJTHN5S3IXWECwiRq3g/viIVYEmm+z0A
         jMwSFmHRIpaL5+5HD0zxK6Qk1nlU++QuQTK62AH8Y0RakcfF0FRqjwjmd14QJrRIseVo
         8X0N70LlXNi99GUwjsn94vPoDEHX8iFGgA3fl81OZIClC+J3CSiIUVW+Ejp7z84YP80L
         VqVWj3iTboxlzVJRQ6qZqRgjLfnV1KOaKF4CGAgZs0FDoGsq6HMK3yjH95Fpu+U103fL
         iAB9G+xVcIqgQ2tDMhMNW8EdUtOhet0DdT5WqXbo6lIjPQ4vQUU3KUgJo3FMMRw47nG1
         abhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501292; x=1753106092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3wcQzWE4SveXlxdWKFvPKaJ4kIS294185TXHSe5OhY=;
        b=ckuNpTiEwP2UmXRshvImccYHQlnwJNYY43YNFXXQQbxjGF3xH4uLVrUr2bhRMkA4LM
         wS1BmQ9mhz1CUj5654OZ+myjLoyvfRuu4dGadoTUay/N69Bti1Zku2axyAQ5e7ZB7h/U
         wQ1iNP/uP0lgcHTXN8pFfM4UMzQHWePTwEGlHdiK55ZKOgI1Dtp5AfpDZw2lSG30P+z/
         N8DRceJZ5BUVLsd7jSaEzdTv9R8+Z/aG6S+YWhs3vY5wORdqDqeQbG0mL19A+85WJNQ4
         mBiooCR16SRuxZR+aXIfkqBDu1+XslIz4fzSLMZVVWr+xCMQanpaIeJuJhmVTWHLPSR0
         vBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYo0TsK+PGQG6Em485pqA/UKagm4XP/aIONT/mWvkAxKFDxkwJ4vwTvRGJ3F9KrGlS1yprc5y9rMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxP1qq/xD3MTJdJlM7Fzv5HgzDJMVLQyGasRRnjnTh915zfIwR
	ybXNWmM+fkyx45X9/1GmgRa8YlVcDFFZqLHoAL83DmhXE2lh2LLIzUW1toZOfqHuCA==
X-Gm-Gg: ASbGncsfRCNOGkd2KfHzEPsab9Y9t+33OKTH2XiTERQJ8F2uLVBhAIdtXEKHdn2Uaqt
	CEIZ99OCF2fYfHpcHvuFuj1OB0UZC0mkyCnUfcMh6S3nP7dwxjB26OmONWhg3DFXzTlEz1BVwub
	bNsL2gph4/4FRb4hnyBf951zd599FQabCtpkFtHhQMdlGb7EjpT0MsLrvtUKkUBwsv1FAjwmutK
	vrtrSTlXkm6MOHlr/5zL6MXV41OoVRrZpKX3Ggx5VCoFoKDiEFED4oJrRCrdEw0NjWCS0flHXLw
	ZlcgCMzOPjNoXttirCYEzx5Crax+N5geRTYjQidJ6Nh+MZHGl728C8g4GrA8cCraFRHrh7NlUUX
	Z20no67ivYSB1tN4PrMwiymitV5F11y7Zv9aWE4HQtwQy36a3AP3I7+Am7dVHYsDaVCmEtxZXvf
	/7EPs3Sbk=
X-Google-Smtp-Source: AGHT+IEwFKdlt7eMD6bQPPxo3J8lBzJkpaYNj065G0gyUlhBU295aQuW6KGomSfypPgGAQlNfNuZNQ==
X-Received: by 2002:a05:6000:2203:b0:3b5:dc07:50a4 with SMTP id ffacd0b85a97d-3b5f187ac86mr11471655f8f.2.1752501291652;
        Mon, 14 Jul 2025 06:54:51 -0700 (PDT)
Message-ID: <01ae5bd5-efbe-4f7e-baff-cf62ae2c8501@suse.com>
Date: Mon, 14 Jul 2025 15:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] misra: address violation of MISRA C Rule 10.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 15:26, Dmytro Prokopchuk1 wrote:
> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
>      }
>      tbuf.tm_year = y - 1900;
>      tbuf.tm_yday = days;
> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
> +    ip = (const unsigned short int *)__mon_lengths[__isleap(y) ? 1 : 0];

Oh, and: This cast is one of the more dangerous ones, and afaict it's entirely
pointless. When touching this line, I think the cast would want removing at the
same time.

Jan

