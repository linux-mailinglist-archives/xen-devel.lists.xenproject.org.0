Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B61B33B2C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092832.1448460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTaV-0005SI-QA; Mon, 25 Aug 2025 09:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092832.1448460; Mon, 25 Aug 2025 09:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTaV-0005QH-MN; Mon, 25 Aug 2025 09:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1092832;
 Mon, 25 Aug 2025 09:34:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqTaT-0005QB-UV
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:34:01 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1c9afa6-8196-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 11:34:00 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b7550c0so5673080a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 02:34:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312c4cdesm4698320a12.23.2025.08.25.02.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:34:00 -0700 (PDT)
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
X-Inumbo-ID: a1c9afa6-8196-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756114440; x=1756719240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D7tCF6483C64WzJ9/szGu7MPxFf1/1NhyZRb2ULcjd8=;
        b=PW2N3Sn9QHEjxYZ5Xtqf4/xwCvFqclDhSF8FkKkpM529I2PjT4w/czpPz2b6/yLxaB
         sqJjkHVr3atOL9/0Hjeuwf9TH7vFCiNU+FJbjl/tQatLC8iPQeSUP1GvXoI6Ms7R346K
         dy5pYlb1GviLHrxvgfyZ63KqmuZPVuxMyNFv3oG1K1Lqs9GWESqnznciSHjg9blchLke
         GxWFarTxpwZ4DrvNVuzvUSXs8oPIVAS5imAneBjd14Yipy9JEouhd1VUVz8Lus4OdZAZ
         ZBsNjfOaCbhHheAiz2y6xoVbmHcHSSVAXI6pmB7JEjVfJ3ceJv7LkZ/VYsnBmZhwooRF
         T+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756114440; x=1756719240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7tCF6483C64WzJ9/szGu7MPxFf1/1NhyZRb2ULcjd8=;
        b=ZRIpfxhK7LoZPcXahRI9qn5/4Nej9YLBtD6iHhYBcjSrIQdBJYxIv2SYruLmTloMjP
         SiwDjq2/wrO9iMxhrL6iqJ85iHS7RuCct7igL5niNERqMW8aGaLmehyz9J7rLkmN/L2r
         mINn04NCg2q4YVt9B7m3kxJTmof5CsgKmP4B7nFs1TPuxne4p/nFI3cvl7z+6Q09Vzch
         CIoYDaJSEcjpi681bqWPx0JBC5HBmMvQXP4+c7hvDvAiHHiUDKN+A8EdT568AP6qg+2l
         4qiirbt90AH4dkUJQ8Af+uSawMn95gUijm5ZP9Dc2TIVbwaBGT2EOe/tazPZIaDUbu8v
         ZPLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlE5m/cUgompsYiyjZWPiZ+DwB/AEWp3Tc7kHAQ4GVUKxQ72+jtZ6oOwH1SAmQGv4jZqiAumy5/xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxla70lsRtYwolXHZetfXR2+KbqlqfaahCDFvujGfqYz/xq55Ax
	2+lDO01k7ryqogOq3fXqUmWS8AQJOVOUqK4gn65TNOOq29E7pMIZn8dx5iv4yfrelA==
X-Gm-Gg: ASbGnctIR6EBaF+9WMG+Dez7rB2LxUDb+JZ8ibA/x0qAor6imkSDRA6HKWN8akb41Sq
	xbrPFbfwTr1E8DUsKsncNHw28UERK4IXBkhJcVc73FHfJIqUQIovq3rKNjTjBIuihmQ/iwhnuCh
	1lLLqXDUhjl/diziXI8ir9fVm+9p3of/OsLBH/IgNVIljaSu+R3IkpxzZ9ROwG7Ask97iku3cj/
	EyweMErFoop8Qx3Kx+6mxkZDvovk/l2B8KXaR/ieTzGKSqd6wAnwjlAd0sS80wD18MiMkAz3Xbl
	0povse5+TXsmAs1z8Bmz+eeY0mvlS4jdWX9AIKeUjhbFZrAAAmwB9fA0dHvUMjNBL6k59cljOrX
	YJzJhYI0fACxMaLdRB6jRhhWJhK771s2FRL+maGOX43ql/cEKhY2xUKdBWnwnkm47qTFy1PJc3V
	H8Z9YVZcM=
X-Google-Smtp-Source: AGHT+IGQz7Aq5MUrWNTWbONKh2CdY+7DeRAQGmZVXn+dhIFC73GwBP6iHY5YkSHkXwLfk2qg3MgNnQ==
X-Received: by 2002:a05:6402:1d4a:b0:61c:74b1:d3ea with SMTP id 4fb4d7f45d1cf-61c74b1d7bdmr1234729a12.22.1756114440299;
        Mon, 25 Aug 2025 02:34:00 -0700 (PDT)
Message-ID: <a451e477-27a6-48db-8db7-31c93f83bafc@suse.com>
Date: Mon, 25 Aug 2025 11:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/mce: Sort headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250821154825.3968600-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250821154825.3968600-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 17:48, Andrew Cooper wrote:
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


