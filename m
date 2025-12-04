Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1680CA30FA
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 10:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177475.1501751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5tI-00060y-Lk; Thu, 04 Dec 2025 09:44:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177475.1501751; Thu, 04 Dec 2025 09:44:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR5tI-0005zT-I4; Thu, 04 Dec 2025 09:44:48 +0000
Received: by outflank-mailman (input) for mailman id 1177475;
 Thu, 04 Dec 2025 09:44:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vR5tH-0005zN-2V
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 09:44:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddd50745-d0f5-11f0-9d1a-b5c5bf9af7f9;
 Thu, 04 Dec 2025 10:44:45 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so9581055e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Dec 2025 01:44:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d331af5sm2133764f8f.31.2025.12.04.01.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 01:44:44 -0800 (PST)
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
X-Inumbo-ID: ddd50745-d0f5-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764841485; x=1765446285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=10upfO7vJ8RQPtB7AjY8QmUcQxUBYZu2o7pwoNTVqbU=;
        b=Wt68wcyYn9LQCX/CLWsGUIHt6CdWdnDkpaHJ9rVD7GK9aWnu941Qr9M7BrFv5LWxFd
         32FAcDqWlpG78JgJ0nyqiiF01Onzrp+jZ56hNpLSZe7asScf62CqOjUePcZLSLJ0rN8Y
         HaJVplchShhIxDL6SbCsJVmEZhZI076Yh551B/RAcCNPPmlJyPjI/S1R9ZUnAsTDDTQk
         1vIYnSTx9RIXYDX0ZWq50trhiYyiaiB+so8Nj8XYSirr0wxSkUhpp4YNSpXu2YTca3v/
         YMawSuZeKRM36AiW8/UObohu7lMNaKIfwAhcO27Q3A3QuKUKQKiTxkaM3hWDpgbnvJnf
         lrDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841485; x=1765446285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10upfO7vJ8RQPtB7AjY8QmUcQxUBYZu2o7pwoNTVqbU=;
        b=EBMGBiHUSE/fnau/lKj94/Ao7E19xADL2FM2YnVrc2NkuIUYJkUmmRxAPT9G+vKhQI
         tc4hOGKlrSS8ZRKDgdoSW+4B/jKie6NA31/Idmv3gY+oqUVNRlxDkQ8UwahIsAD8BsDR
         I+tQXF9XF7ipxb5FQsN7l6uLRic4WDzskJY7jxThYgJK9s2VhD37aiLVPuAReeY2Qtx2
         RTEqPgvrkQe+Kd/P22nZdc8F4Wyzm+siwlKz/tgdGucLewD3TCPzf+a5IveSyk3faH2g
         oysEUm3LT5gKrg0cV4l4IH6vtir/StGUplwZpCs13McmdTlu1fUchKpkHDK9o9YTzUrD
         FK5w==
X-Forwarded-Encrypted: i=1; AJvYcCWb4zDiU2XnNKQCJ7q11EM2lvMMh5VbMkKH6YGTovmpw5SyjEq9rreleGMpee6aEBDlrjA0gd4VeQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9nfvL8Zu2ePXZ6MlnQCBYwqfmnsiPpUOw9qHI1Qtc+Jm4lyls
	etwWk7Onrw1OY5f6dUZ9j5loodiCsLigNgQghB+o/v8m3glsfowehDJz3MYbv9XaOw==
X-Gm-Gg: ASbGncsl6XC0+At2rxv7f2Ao3Txz6biPN95l1Kks/B0UrAQchUlsxebIs2SbkoR0XU8
	eHXAhzja8PE/ZL0D9Qt0wb7ircNwFNJryylblYuC4Ufj3d+rJ+yDVPHU8KXcSPIh3sRlJ4t3WuC
	Al4U1DTRVOPRP8C+SN0EtpxnohnTCEMSIZLzumxMczqSsea8a+k58bJ+kdej1ZUtyJR8EWtzrLZ
	tCyO2+KQwYV+YmnDyXFwxQ8FVVsR8GPci4ghkV7asXDKt1fBfXI7adaXaXLIIlwPEkiTsx2cPh1
	8ufmQfSbRqHMPxBOvH8i09FqhtZtOxYxQ7BroyWXViq+7zr7J24YJpc8/dNnmLwhVWq4Rbqi/8p
	Wimj+xs5d/W0tm/nWgdoV3u7UiZlrzH3al18zIUxA8y+F+7fBVhdMVRlMq2S6m4eZaknbN9KF2G
	pkym+0ipkR0B4dAKSWVMp2nNxRLOeIrGMFVYKhkDxfSESWRtEEskouuZq8DwVkyvbYiDZ1riNi8
	+s=
X-Google-Smtp-Source: AGHT+IHrDtZPMMKs52aT0kzZLDy4cepHY2+eqXjkFvzX8T5KIkiNQ/oUESwu4k0L5iP+ffM4UHOnRQ==
X-Received: by 2002:a05:600c:4743:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4792f244d1bmr16511735e9.5.1764841485032;
        Thu, 04 Dec 2025 01:44:45 -0800 (PST)
Message-ID: <75e0490c-935e-4fc9-ac63-377cf4324778@suse.com>
Date: Thu, 4 Dec 2025 10:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/24] xen: move MGMT_HYPERCALLS out of
 PV_SHIM_EXCLUSIVE
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "grygorii_strashko@epam.com" <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-25-Penny.Zheng@amd.com>
 <55d23825-fb8c-472c-9d31-5b482f32e915@suse.com>
 <DM4PR12MB84514B5C0BF7AC492D8E863AE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84514B5C0BF7AC492D8E863AE1A6A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2025 10:20, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, November 26, 2025 5:34 PM
>>
>> Further, because of prior issue: Can you please clarify that you have tried builds
>> with all (possible) combinations of the involved Kconfig settings? The set isn't that
>> big, so exhaustive testing is possible.
> 
> In case I omits anything:
> I'll test the following four scenario, (turning on all other possible kconfigs at the same time):
> 1) MGMT_HYPERCALLS=y && PV_SHIM_EXCLUSIVE=y
> 2) MGMT_HYPERCALLS=n && PV_SHIM_EXCLUSIVE=y
> 3) MGMT_HYPERCALLS=y && PV_SHIM_EXCLUSIVE=n
> 4) MGMT_HYPERCALLS=n && PV_SHIM_EXCLUSIVE=n

Judging from this patch alone, at least PAGING also looks to be in need of
testing both ways (indirectly, as it can't be controlled directly).

Jan

