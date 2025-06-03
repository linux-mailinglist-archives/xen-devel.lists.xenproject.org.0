Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5737ACC0C5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 09:07:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004051.1383706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLjm-0007fb-Hb; Tue, 03 Jun 2025 07:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004051.1383706; Tue, 03 Jun 2025 07:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLjm-0007d8-Ds; Tue, 03 Jun 2025 07:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1004051;
 Tue, 03 Jun 2025 07:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMLjk-00076O-Cv
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 07:07:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a21fc06-4049-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 09:07:03 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1808696f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 00:07:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd8d06sm81242915ad.143.2025.06.03.00.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 00:07:02 -0700 (PDT)
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
X-Inumbo-ID: 5a21fc06-4049-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748934423; x=1749539223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mk3zj09tfKC6WcxhJF3QCL1xgpQdaYGCvL/chwb+SWU=;
        b=HEsbZNGHOIJhWcqpP9EUKQ+d1UwIt1uaqVt6F4zNMkL2N3EoKmhUKmxCF5yZIxiSak
         2XSoPLKoQx0EBnf4opwOQscfUlf14BQ66Nhq4dRE4RE4sKlLfTNmauBkB6XiN8lNKgV+
         b6MDKCY2JR9FijB7vkCuJBAc64PJ6hqU95UNT81JfAXmbOIfmcv55YyKi5DTGwH8Defd
         8EUE9cWaam3vWP2i/SgnmL5JYV6vt4NPor+P5ghZJvK7drKl+yY61nohwdF3xKTw/pt4
         g3CV13A9LjbS8o+KjUkE64TrDOYwPJyKaXV0yMGzHEsVkxlp1hf1ROxI5xeEOf1PAoEX
         a25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934423; x=1749539223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mk3zj09tfKC6WcxhJF3QCL1xgpQdaYGCvL/chwb+SWU=;
        b=nMzBp7qQPJO0PYH5lFF0l92y91uhyRJirr39dEPQmXuwog79IlL343ALYn3pIEeabH
         7e2jKhSYa4OiIbWcDWHDqTEz4iDDh3f2nZeWuzouOhV+8fRig0IEoleeH0N0JDhLkLHU
         c3ZYa/W8c7uS/kaYVRfWbSq1lo/i48VJNftQJ8i8TE8RfWsbVI350jhcJ/9VQiEtTosh
         D2gnVo3eXVNDmaibMT4SEILT4OYVMxTtjaIZyxwC2PWtYGLbExBgoBjBe7buIbV9Yf1h
         tK5CDWOSyxvDCSYUBO2WTvS5Ctx/yVbtoTNBqzQu5QK1XVML9HNyH1HWfxI9iYQBzUzC
         PBAA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1lLLKGEMxp42fNsHc5zG/nkOITNk+6wN4yk1IDh8DROL7x14zTUBvJh4kHM+ksvZwOn569+n/A8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYLb9P4zO8AyabpisuGZSkdUiCiOucdV4cKEQPysFmRILjLaHo
	oEOAZNRn+wpLShgde9p8AKWKdulSsNKipeC4vGAo+q/zy6IIkggUHDHxG9PKL/yUzA==
X-Gm-Gg: ASbGncse1mc2S31gdaMoVn1vvfvVyqQwy5V3fQi19mBPsZYnkoqBJ3e5j8RjiMI3iYO
	sKsKq71gafTwTlKrI/PKji5NUkhtSDN2Qmd9W7OGIx1KOC1YrPEmhJbvqbrVLZrV5yB8p80I++p
	PRuxdTA1AVR2B0xt4t3bwSHpDhsjmC/cdrowV4NyiXt20QbBx4VYkWHAFd2toqufZZfjwn4h2eG
	wKPF5QLGxn/rWa3pVT8P35s3+2R9pL4cCUO7uLcinxscKaZ5XbCPGJMliaqcx+qhLT0U3+Zax8y
	P71/gT0+Wf+AXQ25yC6KB+wVR3ifPHoMPiiRgCmXDimZXDBUvtcKtD9Mbs1qleBpHaadfPyjt7h
	vLcFVzCdNRw7dBunp9i/L01TTdkxmQbwz3IegnCUyPDweckU=
X-Google-Smtp-Source: AGHT+IGv6TKooDvpwY1ohwdW8gMyvs1IsDyq7rJb3ZDjUWA5eCxKB4ow6nGWJ5O4GeQaGYClXzcNlQ==
X-Received: by 2002:a05:6000:1a8b:b0:3a4:f519:ed3 with SMTP id ffacd0b85a97d-3a4f89da770mr11074269f8f.44.1748934423338;
        Tue, 03 Jun 2025 00:07:03 -0700 (PDT)
Message-ID: <ad0ee5a5-0fa2-465f-a774-a8c0707c0e86@suse.com>
Date: Tue, 3 Jun 2025 09:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <bf892a80-fe3c-4163-b857-9d073a093451@suse.com> <aDDRrOviNNSvFig8@MjU3Nj>
 <31c7faf1-d393-40d5-87f9-1a01d1ab39cb@suse.com> <aD4fBA6ouCrtdfX4@MjU3Nj>
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
In-Reply-To: <aD4fBA6ouCrtdfX4@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2025 00:00, Sergii Dmytruk wrote:
> On Mon, Jun 02, 2025 at 09:17:37AM +0200, Jan Beulich wrote:
>> On 23.05.2025 21:51, Sergii Dmytruk wrote:
>>> On Wed, May 21, 2025 at 05:19:57PM +0200, Jan Beulich wrote:
>>>>> +static inline uint64_t txt_bios_data_size(void *heap)
>>>>
>>>> Here, below, and in general: Please try to have code be const-correct, i.e.
>>>> use pointers-to-const wherever applicable.
>>>
>>> I assume this doesn't apply to functions returning `void *`.  The
>>> approach used in libc is to accept pointers-to-const but then cast the
>>> constness away for the return value, but this header isn't a widely-used
>>> code.
>>
>> Which is, from all I know, bad practice not only by my own view.
> 
> I actually ended up doing that to have const-correctness in v3.  In the
> absence of function overloads the casts have to be somewhere, can put
> them in the calling code instead.

Casts of which kind? For context: There shouldn't be any casting away of
const-ness (or volatile-ness, for the sake of completeness).

Jan

