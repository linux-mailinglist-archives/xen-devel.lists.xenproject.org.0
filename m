Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B8AE1899
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 12:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020791.1396928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYgh-0003e6-Oy; Fri, 20 Jun 2025 10:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020791.1396928; Fri, 20 Jun 2025 10:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSYgh-0003bl-MD; Fri, 20 Jun 2025 10:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1020791;
 Fri, 20 Jun 2025 10:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSYgg-0003bd-08
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 10:09:34 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e6e693-4dbe-11f0-a30e-13f23c93f187;
 Fri, 20 Jun 2025 12:09:32 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so1478045f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jun 2025 03:09:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d8393440sm14805875ad.35.2025.06.20.03.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 03:09:31 -0700 (PDT)
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
X-Inumbo-ID: a8e6e693-4dbe-11f0-a30e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750414172; x=1751018972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MHFjjp58C1aLxjsSShGWca7HgWMpQZBZEd413SZsb9I=;
        b=SZZUSUVHL7D/7EWZKG1W10BnW+xm0jCWhP/ZgTaVmJopnz1xvbQfKhiSMsLBH0znBA
         kIWdaIjkl6c8iIKDJBZWcO6wIuTlaWM7Ax/zIw41inyQdJq/zWOnQhOAa4qem7Qzz9sv
         XW0rbtVGVBWd4yTIvCY6qaFcCRE4cUtVL3iYxrLNWchLAhZrItxzh+IIiIQlAHnlG0II
         7sSb6Hc6Y5/lvPI0DHkBqk9Ye+HgQ66QUjEiB2uCTwSf1raNh7deypKYE4W0Vz8Nw6GO
         Vzt8C20wixsvoHffWlFt7m/BvIFOxkUrtXuHFA3kq4RkCtRl0WdUr9OCCUV3OnRR2GEy
         zGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414172; x=1751018972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHFjjp58C1aLxjsSShGWca7HgWMpQZBZEd413SZsb9I=;
        b=pgAmoOu+oCcfpGTIt1aEBcphteO+6dX49iFVxV5Jh7A7Uy0GSGk2FriqYsP8Vs6CyK
         QQr0NqxtFLxzgbcfU0ocsvMS1F8d1H/awBFQJZnkRSfDKOxcpsCPg+9aGT2xTbzWsTwa
         kFesldXnGb0+BlP0Xd1KChaV6puK2f+84bg9d8KO3k+1KqIu9oezB94zycPbS30YVIBr
         TurDtTByq1OR+t9y/5274MbRSS/G/6jjyTmHbty+cbw9JimnYOjPQ/zS2wBQDeWwY1f3
         f7FeN5oLCNj9ld62HrdBCTGF8TTvPSOuBJeG+ARLmvNPtMR0L1j1+z8DVLC0rCbizMLy
         rLZg==
X-Gm-Message-State: AOJu0YyIK0H9E+bHCkXFx3Nw6zCJwAdLYeiiVWkgAMEbOoEQ4fkjwO5N
	VuNeQUYmVXvyjzmOt3tsV456OjV4STUOoRdQ/M1RdVQO31X8f9TywVCYDWZfA+A0zg==
X-Gm-Gg: ASbGncumyFZ2/Kd9zWdkMiEkESIkUDf3tchruINp2zDhBlw1L4dHodQRm1OxArA+c2p
	sOYYg2tv2mURWlFfjjsHOMHI1FfCfUkUCqIVRPf1KhzJfDQccjkyKj2FKmqpnS+CJHVUkpPsoeY
	1nUMyZO8IbRYJ6C4qzzF85P5z+mtHLrXBGkPn/BlR0QJVXdCRElir0OdEyA1fLWkUZjyoeqDTfq
	sj0/EvAFIPYHc3Ifb6q2/wd3FEDmQmCXQa7nuFmR8K7GkR/4+bbksf6k9CorywHIuMIMwAy92Xn
	+ec92z+qf9PLpRmJ33bHruwJ1DG4U4GA4TZbd6Pikd2vjqIaak5PANaCp5n03aYKPlcjhsRA3gw
	jk44vtX8Niw8qd5oPjE8n4Ogda2pvDLOUpz01eGCDDbnbfBU=
X-Google-Smtp-Source: AGHT+IFHqAXql+eP8VW9VtWR93m1D0EEyRjgW29xhKR/PddbQ3vNRyyqJI3p32EbfyF9oeCNHogtbw==
X-Received: by 2002:a05:6000:1447:b0:3a4:f6fe:5244 with SMTP id ffacd0b85a97d-3a6d128a3dcmr1753914f8f.12.1750414171639;
        Fri, 20 Jun 2025 03:09:31 -0700 (PDT)
Message-ID: <aa1354da-46d1-4867-9a51-1b6b00ceb50b@suse.com>
Date: Fri, 20 Jun 2025 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] livepatch: Embed public key in Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Kevin Lampis <kevin.lampis@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-3-ross.lagerwall@citrix.com>
 <aFUsaySlHs4ymmtB@macbook.local>
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
In-Reply-To: <aFUsaySlHs4ymmtB@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2025 11:39, Roger Pau Monné wrote:
> On Mon, Jun 02, 2025 at 02:36:34PM +0100, Ross Lagerwall wrote:
>> From: Kevin Lampis <kevin.lampis@cloud.com>
>>
>> Make it possible to embed a public key in Xen to be used when verifying
>> live patch payloads. Inclusion of the public key is optional.
>>
>> To avoid needing to include a DER / X.509 parser in the hypervisor, the
>> public key is unpacked at build time and included in a form that is
>> convenient for the hypervisor to consume. This is different approach
>> from that used by Linux which embeds the entire X.509 certificate and
>> builds in a parser for it.
>>
>> A suitable key can be created using openssl:
>>
>> openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
>>     -sha256 -days 3650 -nodes \
>>     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
>> openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem
>>
>> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>> ---
>>
>> In v3:
>>
>> * Drop unnecessary condition in Makefile
>> * Use dashes instead of underscores
>> * Drop section placement annotation on declaration
>> * Clarify endianness of embedded key
>>
>>  xen/common/Kconfig          | 18 +++++++++++++++++
>>  xen/crypto/Makefile         | 11 ++++++++++
>>  xen/include/xen/livepatch.h |  5 +++++
>>  xen/tools/extract-key.py    | 40 +++++++++++++++++++++++++++++++++++++
>>  4 files changed, 74 insertions(+)
>>  create mode 100755 xen/tools/extract-key.py
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 0951d4c2f286..74673078202a 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -472,6 +472,24 @@ config LIVEPATCH
>>  
>>  	  If unsure, say Y.
>>  
>> +config PAYLOAD_VERIFY
>> +	bool "Verify signed LivePatch payloads"
>> +	depends on LIVEPATCH
>> +	select CRYPTO
>> +	help
>> +	  Verify signed LivePatch payloads using an RSA public key built
>> +	  into the Xen hypervisor. Selecting this option requires a
>> +	  public key in PEM format to be available for embedding during
>> +	  the build.
>> +
>> +config PAYLOAD_VERIFY_KEY
>> +	string "File name of public key used to verify payloads"
>> +	default "verify_key.pem"
>> +	depends on PAYLOAD_VERIFY
>> +	help
>> +	  The file name of an RSA public key in PEM format to be used for
>> +	  verifying signed LivePatch payloads.
> 
> I think this is likely to break the randconfig testing that we do in
> Gitlab CI, as randconfig could select PAYLOAD_VERIFY, but there will
> be no key included, and hence the build will fail?
> 
> Ideally Gitlab CI would need to be adjusted to provide such key so the
> build doesn't fail.  I think it could be provided unconditionally to
> simplify the logic, if the option is not selected the file will simply
> be ignored.

Alternatively the two options could be folded, the default being the
empty string meaning "no payload verification". I don't think randconfig
can sensibly make up random strings ...

Jan

