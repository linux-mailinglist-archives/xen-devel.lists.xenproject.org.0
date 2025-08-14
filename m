Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A9BB25DF2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 09:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080966.1441128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umShb-0005xD-6u; Thu, 14 Aug 2025 07:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080966.1441128; Thu, 14 Aug 2025 07:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umShb-0005ux-4J; Thu, 14 Aug 2025 07:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1080966;
 Thu, 14 Aug 2025 07:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umShY-0005ur-UT
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 07:48:44 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19fb5096-78e3-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 09:48:43 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b113eso965270a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:48:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcab1be05asm246696566b.98.2025.08.14.00.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 00:48:42 -0700 (PDT)
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
X-Inumbo-ID: 19fb5096-78e3-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755157723; x=1755762523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TTwdu2u9qxsxf+fQT0m0u9KDfD0pFtLdKsJjVyf7yeI=;
        b=LSh+NgnOp/8oU7C7UxYARo2us3xKozZ3FWt4qKTADTcQ7zYkdg7OxZL9AKUnQfZbxK
         wpoKqammWKfPQIHyLASZ4/fDujxdEFO1DcbP9rnaUNFrhZy86Q//3kbXSm+qXl3ppl+l
         H0ldlMzhP5mouK888W5qZSjvXZhEqlADbCkskOf490l0XfHYoVkLPPoQ5bJlOgL0Oqlv
         d09HSmtneYMcwOCsGQ5jJ5kbMWh/AiGkmnlYdUs2BhVnhLkAMU9o7lO6SIQxOFTql5bf
         AbW1PUstujCOqkGDkhIQBFDyULSH5IeXE6s1rcnik4E3Ph+/bMTKzJ1rvIQExzhaYz9H
         bs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157723; x=1755762523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTwdu2u9qxsxf+fQT0m0u9KDfD0pFtLdKsJjVyf7yeI=;
        b=add535zpBCeBku83LzOxJ9KPyOr/Esi76EYNCnoMq6JZg545XvU9ZUSisOoYkMJVbD
         kdALo4/zFixZG5P3o43c4EPcg9cG9BZxiokXXbYozdeEYIGfkrsRI60NjRz4+x0Bmxyp
         5uvV2d4ado9PsfK/NVo/LAgscrtxJZVEq97w/wHvsvB+r3n8PIMcCuoDvq24bdAPWl1p
         I8KfeX6XFzhl6Zmrx8irqsne0TdFWbF9JUvEGQat20A+Bn6VEZrV+QxFlYwas04FAsDt
         FpIWqLZn0EVrmgf+BJl6rA+slYGh8hbKeoZXf/9s99XbJUt/HI2t4ym2E6ZoF9bIh9Fp
         OHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi2qlAjTbPXFLkYoGTcBPdoxo7kYbwgcYaEE+rrbfW8dQnXP0Hyp0e9GheIsF8w488p4pdKTTNdaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvHr9K9EWxqDc3yI4EXLti1hyoi6O0mBmqWvnFrjZFKv0uftWy
	vZDCvGmcIJ5CQNsUM0NuUCnwdLNM4ejo6uTFeUD9O+AU+si+KzO+hl/jCYOAVYuJ/w==
X-Gm-Gg: ASbGncsGmUnJdUJSqFvL+SW7foNha+VrvAfbIwSYIBF812TnjFLleVO8NvLqf4svLKw
	Q8CXJG2ShFp5u0WQUteEI/B+Gs1NIGkPurKA45BIxkXNl7X6K/njgAYxcJLdCF8BGHJCRTlOLWc
	/uUitBZ8BpBbAHyTZyftILkVAhJm+ve4KXOSrORptiIbhbE93zynm+6y5vjzC0CwP9ESCXEAmOu
	RS+sWnGKYX7M5kf2yHoGyuZiRIpZgwZed1HspnlPmrCrIvVlgDNHhhTiPBQTu7NZVTB3JR0OF7D
	+qXrhNy7n0aqqvHalyI3A6ryRFMMUjs9hYXC6exfhHfamtDNbRVVUZs/bGOMsVxlcgIHzCmPgG8
	aw0E+F8nVZUrSVssgaaY9UqW6vpj47QX7LSFY8RiDCg3rxzMGcfrgvFuh3dXXNCRk62PlhGczn+
	9IXXibIs5ABg2KSn9aAA==
X-Google-Smtp-Source: AGHT+IEDELgUrowk01ajVG9orMxszpvy0812M6T0dB3yV2jK8H9A3JFWvjKE4k5qROhjzIwOGQGdew==
X-Received: by 2002:a17:907:97cb:b0:ae0:a483:39bc with SMTP id a640c23a62f3a-afcb98ea4b6mr174023366b.46.1755157723185;
        Thu, 14 Aug 2025 00:48:43 -0700 (PDT)
Message-ID: <87420043-c081-4d2e-af09-cc7f8ae642ca@suse.com>
Date: Thu, 14 Aug 2025 09:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/3] xen/efi: efibind: Drop alternative define for old
 GCC versions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, nicola.vetrini@gmail.com,
 xen-devel@lists.xenproject.org
References: <cover.1755111932.git.nicola.vetrini@bugseng.com>
 <4140895d7382e1e1d84b5f3988b497a7edd67034.1755111932.git.nicola.vetrini@bugseng.com>
 <a4ff322a-8cf3-4e8f-b243-6153e823eafd@citrix.com>
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
In-Reply-To: <a4ff322a-8cf3-4e8f-b243-6153e823eafd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2025 00:39, Andrew Cooper wrote:
> On 13/08/2025 8:12 pm, nicola.vetrini@gmail.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@gmail.com>
>>
>> Since the toolchain baseline for GCC is 5.1, there is no need for
>> this case.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
>> ---
>> Mentioned in https://gitlab.com/xen-project/xen/-/issues/201
> 
> I personally am in favour of this change, but in the past there has been
> objection to changing this header it is vendered from elsewhere.

The two lines Nicola is taking out altogether were our additions already
anyway. Playing with them ought to be fine. Context may better be left
intact. I'd like to note though that in gnuefi the detection logic has
changed, too. Maintainers may want to sync that.

As to me, earlier on, objecting to fiddling with imported files here:
Now that maintainership has changed, the new maintainers will need to
make up their take on this.

Jan

