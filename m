Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A1A5C781
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:35:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908358.1315488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1dd-0003x3-RP; Tue, 11 Mar 2025 15:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908358.1315488; Tue, 11 Mar 2025 15:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1dd-0003uW-O2; Tue, 11 Mar 2025 15:35:25 +0000
Received: by outflank-mailman (input) for mailman id 908358;
 Tue, 11 Mar 2025 15:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts1dc-0003uQ-8V
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:35:24 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 722808aa-fe8e-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:35:22 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1266583f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:35:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfddcsm18783791f8f.35.2025.03.11.08.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:35:21 -0700 (PDT)
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
X-Inumbo-ID: 722808aa-fe8e-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741707322; x=1742312122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4uE9N5twhjrpVbHN9FqmvEeNo0w2UL2PcEkt11qCvbs=;
        b=c6OxOfRSblk1kv0n/D2tMiE1ONL8VEVSHm2p8vmzbe4ujhPNGHgQ+ygeUQXwJAjYV0
         4e/2uFhknZyBR2LbitpIcwz77j5QN2YqAAQW80MFgMFYEtbLmx0MabnO5dnHiE8O9aV2
         cePthdHVvVD/lBgBBf+tXphb1dH0GHNI/ajmb/niCiHlf2y1ywDpnjCTOHvpCaFaR28j
         yh26H9YBFYwT1k/tGiQxTbuOpkMAG64kr/HT4UIYSmhYtw/tCNFqP7Y7Etn3PD5wpqrx
         fbEpBBnIuri9k3gIx4DJNa3DPm8xxFxsBcgrALLnG9fFsbW7ESSYLUlNy4H7kjuw/9v2
         KsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707322; x=1742312122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uE9N5twhjrpVbHN9FqmvEeNo0w2UL2PcEkt11qCvbs=;
        b=OoW0Nq+l1GHZ5ICxUW7WNx/A8YMnjf0HAU8m//wHCt7s+gJl1EjOarc+1QeMlXX9fQ
         jh5rPXSTtHi+o4DWWxpT2UhsmmfBCFQghLMDAortMTw3hbq4GmVObw5RMyRAAqqBvy4W
         WV4N1i5mX2pl7pcDMZnFb5/di5cVPzhIjGInNt3wBsJXCSOKfyvgH0q6tPaCB84Cal8E
         +mC7QaikOukmdyJFy8QHxf93LSaFMLtQQsPEeJuvmJInJ5ij/oZ9d1H7k85+KbL3xdsD
         F7bZYJci4gOdR/Ah/Ict2TUNgjzZ/J6PvIVb3jNB8rLut5rv8AJZBBCQBzy0nJ+LHzge
         xWvg==
X-Forwarded-Encrypted: i=1; AJvYcCXCgwpxHDaGDMOU98zn8FgRKkukuHCw+Uczb06+DV1Iqk9ujbOr6YSaGnoc3P72hr71BAfmuWThIfE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyO1k/k+Rxym6aW1+o9uNb0vSKUmDVNsKtYWS6/AKkiTH0nD9V6
	WwnY3V3yq3TyBXa1tWNJR+otIEtID/er9FonAFKshYSpwKMdazGPRsveufFv4A==
X-Gm-Gg: ASbGncusKa5Ukvnri6ohB20tFhptB6rhxXR8ORF11G3gCQNrFmYoiTkhb3l6edG2WDH
	PyHKbClng0yf8ipLo+ac1DlXOtbbvAhwLS9vjLbXije/YuvAldzgy8lzRaszsiqZXS+XHRhWXCb
	IRRIuqk2PNWB0Ux2e1H1oDDIAEdJaTRRs7zyJ258nhmzJxNDaMJ8gE0g/dXqC5qB5tOPRpsWdp0
	lZc5ng9kahRfZPqwn4hCO+RZtCh490tbqEFHjzvdvLEYF3JlZn5LXoBuZMIchGTYZ4hbSFkkMKQ
	J7qM/Xyetsmc+bEHbA6zIZe2a5TUmyDoyKdwShnKIAnmRLosdUrVr4+c857g7e1DBJTDkhi188p
	nycmTrgIjt78KCN7zS5sn7Ls5UmI4w+Aroa4XLqsV
X-Google-Smtp-Source: AGHT+IE8AUmsLbLy+Bq4lQMQH7c32WxpzRo5qPGevSH96itAAutfBnueqwuqmv1TKMbuxr2R6JWPNA==
X-Received: by 2002:a05:6000:1845:b0:391:2dea:c984 with SMTP id ffacd0b85a97d-39132d063f2mr14123301f8f.11.1741707322169;
        Tue, 11 Mar 2025 08:35:22 -0700 (PDT)
Message-ID: <60eff646-724f-4ff9-9dde-3a7f9a1da66a@suse.com>
Date: Tue, 11 Mar 2025 16:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/iocap.h: add documentation
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Grygorii Strashko <gragst.linux@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250224113828.151794-1-grygorii_strashko@epam.com>
 <83d5d612-2f6a-430a-8aee-4738f43204e0@suse.com>
 <d7fe19f2-f8ac-497a-833e-44a04e1ca4c7@epam.com>
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
In-Reply-To: <d7fe19f2-f8ac-497a-833e-44a04e1ca4c7@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 15:53, Grygorii Strashko wrote:
> On 05.03.25 12:37, Jan Beulich wrote:
>> On 24.02.2025 12:38, Grygorii Strashko wrote:
>>> Change rangeset parameters to "start, last" as proposed in [1],
>>> and add documentation for public interface.
>>>
>>> No functional changes.
>>>
>>> [1] https://patchwork.kernel.org/comment/26251962/
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> To be honest, this is getting too verbose for my taste. I also don't think
>> title and description fit together: One says the main thing the patch does
>> is add doc, the other says the main thing is the parameter renaming. When
>> then there's at least one further parameter which is also renamed, despite
>> not fitting the description.
> 
> I can update subject and commit message and resend.

This would address the latter part of my comment, but ...

> Or you want me to drop some parts?

... only this would address the former part.

Jan

