Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781C7968B2B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788178.1197636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl99s-0007sQ-2U; Mon, 02 Sep 2024 15:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788178.1197636; Mon, 02 Sep 2024 15:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl99r-0007pw-VD; Mon, 02 Sep 2024 15:39:59 +0000
Received: by outflank-mailman (input) for mailman id 788178;
 Mon, 02 Sep 2024 15:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl99p-0007pp-VV
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:39:57 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a79bd3d-6941-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:39:55 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a86883231b4so526863166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:39:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898919fcb4sm573580966b.132.2024.09.02.08.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:39:54 -0700 (PDT)
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
X-Inumbo-ID: 9a79bd3d-6941-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725291595; x=1725896395; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j/svr+aNfOFkanvIqA1KnFVp44ul/w9rcVYUtMF/Zng=;
        b=NXuhQF11mh144AaI0gaZr/6+Wo4du50mMpD39AdjZxZmcGbKyPFe13Xwvaj7KvFAiV
         t+7ITcw4XCnc9khf4G3JxXEZIqQ/i71R2hpVjfbIJmGMR2mcja1l5QLLI3tsjZ7P9pCL
         4KgcRgeX4/gHkvbTPQHd4qLhyjMxOXJEjAaVh8sbEvCfn3h35CIlLrCgxWSfBwoquxDt
         lxcTRij8gNLl11Kz+o3+g15Qy4KqFR2wMNS7voxCiTch15H1hydopDPSaXcl72+X9PoP
         yH1+zW3vsEYxdIvmiILlkKFSx/LX6eZLUpbZn+SpOK44lU4S/DrOOPM7Its6t3JTYnti
         ty6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291595; x=1725896395;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/svr+aNfOFkanvIqA1KnFVp44ul/w9rcVYUtMF/Zng=;
        b=nRu0v9kQ1wXl9MGy3l/GWdxJjze1IeRFZwZTpRZwpw2wOilC7mqcPm5mGKcsYQDYfz
         46eMWMWFVDF2yzO69YpZOO3XDOJmqEHOLdeXMzaG7l1PEEgtcOe2L7cRqEUUBNys91qx
         bSo06BIAUbg0LF3uLAwfNb3DcggZUdiB3quGAejs5Aut+MZCVsvWd3qgiGNPDc7yu9rK
         sx8MuVz5kl7dEgw2FyL5QWRig8fkpTIGYvSiP1p90CgDsj6G0mbyIdTh7EVIIbSitEa0
         nTyxdYKTHtWlXm3N8vRyGTewxzU7JTz029dA43ZF4IRt9VCr/r/QyD/WHdg93J6XhwYI
         UG+w==
X-Forwarded-Encrypted: i=1; AJvYcCWWF0ns0E58UQOv6TnKCkyU2iNohbC9WsSUz2LVtg/XgKl6dKkUI/Jh3sXvZNb4w7nX6imkx7D/xWg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtvaR6r0vUp7TGl7LPAP+Kf50dgck8Yii0+kYa1EfZyRfk9jz8
	T8M0Sbok3H8Ht53n0la6KeO+SflhWD5e7oYj4u9ZbJ/PDezbafpOewV9FsN2hQ==
X-Google-Smtp-Source: AGHT+IGvtKv0UbMZx21FQAgjGw88J6EyztEfBvIz4tMZLfiN/NncQ7HSeUc18uA4IHF1qD+LZb6OYw==
X-Received: by 2002:a17:906:6a21:b0:a7a:9e11:e87c with SMTP id a640c23a62f3a-a89d8724415mr481975366b.9.1725291595199;
        Mon, 02 Sep 2024 08:39:55 -0700 (PDT)
Message-ID: <da874b44-08a5-4e49-a9e2-5495711926b7@suse.com>
Date: Mon, 2 Sep 2024 17:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/boot: Use fastcall for 32bit code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
 <20240902133232.3302839-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240902133232.3302839-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2024 15:32, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> RFC.  This doesn't boot, but I haven't quite figured out where yet.

Because you got the register use wrong maybe? I think it's %eax, %edx,
and then %ecx.

Jan


