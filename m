Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE2EAE36D3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 09:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022074.1397784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbe9-00028m-21; Mon, 23 Jun 2025 07:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022074.1397784; Mon, 23 Jun 2025 07:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTbe8-00027G-Vc; Mon, 23 Jun 2025 07:31:16 +0000
Received: by outflank-mailman (input) for mailman id 1022074;
 Mon, 23 Jun 2025 07:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTbe7-000279-Dz
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 07:31:15 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a6d2537-5004-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 09:31:13 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2054825f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 00:31:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d87294adsm75540245ad.237.2025.06.23.00.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 00:31:12 -0700 (PDT)
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
X-Inumbo-ID: 0a6d2537-5004-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750663873; x=1751268673; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DBVR7jFGMlN2CBKgSQucJ5PrkC2gFAITtdVWqnTBVlQ=;
        b=EDPiRGsdzrkfikE/KWkV682Iy/dtcpqXyyPzzqUcWS/9EMqoGIYiR24EAXBMvPZtjs
         aNoDU7SAyQAQtbQjMs6aec6aw2puNNo57Rkf5G1+OTnVyw/CH0h1XJTf5mLem4/IbXlq
         Q+h1gwHljIAlGk29OQPUunhToYMVm1klN4e8t0V4XdpNMlA+ONKvaGXA/EKQRqOKFyqX
         wp2+gGLtLlF2OSLPKT+QeWGnuZ9Wpr/8yuND+dZPvmsxEoLCEOTs3cuM2RK4knSGuKGu
         jZnilcODjxOUp7CCPP/vrJI/qpxoYmm3z5qihO0k9yH1Hm9mY2JrcK62gXUAP+U6j0MH
         HkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663873; x=1751268673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBVR7jFGMlN2CBKgSQucJ5PrkC2gFAITtdVWqnTBVlQ=;
        b=RO6/pRXNfBgnHiczzhSHKrxJMGXQfctV4220kmmzNh3lINugTJc3yp0Xgrd5GrPj/V
         tqbce+UAEy16KhKX2Cq4R1+foghw+S4Nvi59MGJgC1oTMmS/jA0hoSTh5oa2U+LZU1ab
         GRasdbgN2qNY7kQMLVCr9opoSI7MjAsyTXgp1TlqUOPrtLeN3hHoIz0clLKoUStidIx/
         tql6sFJjYnBd2Kd1oMZtPcoXvphqbReb1Jf/Wa9X9JsDGLOq37otejkfE6LZQuzkIsUp
         LBmdIYE4U27nLzjf/JoO7l8Tj7ib8JUadp2VVicneD5Ua8cbzl7dT0tJtSbhHJullpwY
         O9kA==
X-Forwarded-Encrypted: i=1; AJvYcCWezh8/a9EykXePXbh6p+TSLOjKvfdJ2GCxDZJGvHR9ea3dFXxvvg3bTZ5f6Eo8pCB2cmcszFd2QoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYcKulc8+dtYRodxqwXQLxrMkTEi5FSQW7NkJPak+UsK2QJoV4
	lwtz4uu/AfnfGPJud7YdThPOSmkTpkL1qrinmwcsT2E9IP31KiA8v/uAkzsBp0JsUw==
X-Gm-Gg: ASbGncu8zCI0dY+jP/Z6ALiN7YVHuyItNt3hgvSkAdz1Gi8e9m34smy38ilsJlgFeqj
	LxNBN3BeP5xDOUVuzUsMf2D//5FotHGJZ6YNawWtZN83YPNVDbhSMl3yoTQpDalnpgmiUmDvYba
	Cy0kM2SFA4KoxvAkx9P3mzVOyH79i7cqMDivzyGbYBbi/+gvzqPaJ/kyr9TwwAT+7LpLMxksG3Q
	HybReacIL6bleanSAs1lm2jn82KYUtQe0SnjtGpPmo7Ua/7AFvivSZMlEuY/oQ52uGToCHwWOcb
	9qK+C6+8Wy2shmYpmIynls2bnosHs8OEwjuvt2gpHRJeGKD2dYgovougpbAJAuidKEuE5S4wNBZ
	BCxXEYtx/ZRsQdqgD4mm/Wc3QZNlhDrJRB/g5SiU4lNI/aos=
X-Google-Smtp-Source: AGHT+IHKwBaPQM48DfcKm24ZJOpVp28PCZMUNkbxZ0FFrlMreIORvW2s6E08Y/3p5DNGmJsQoj4xXQ==
X-Received: by 2002:a05:6000:25f8:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3a6d12fb46emr8304537f8f.6.1750663872938;
        Mon, 23 Jun 2025 00:31:12 -0700 (PDT)
Message-ID: <a91755cb-0c98-488f-a551-adc0827c9628@suse.com>
Date: Mon, 23 Jun 2025 09:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] CODING_STYLE: Custom type names must be
 snake-cased by word.
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-2-agarciav@amd.com>
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
In-Reply-To: <20250620182859.23378-2-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2025 20:28, Alejandro Vallejo wrote:
> There's the unwritten convention in x86 of splitting type names using
> underscores. Add such convention to the CODINNG_STYLE to make it
> common and less unwritten.

Just curious: How does x86 come into play here? Xen inherited this un-
written rule from Linux, afaict.

Jan

