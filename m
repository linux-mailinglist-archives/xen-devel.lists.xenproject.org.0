Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A6AA762A2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 10:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932226.1334406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAkz-0001uQ-Nr; Mon, 31 Mar 2025 08:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932226.1334406; Mon, 31 Mar 2025 08:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzAkz-0001s2-L6; Mon, 31 Mar 2025 08:44:33 +0000
Received: by outflank-mailman (input) for mailman id 932226;
 Mon, 31 Mar 2025 08:44:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzAky-0001rr-Oq
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 08:44:32 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d32d657-0e0c-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 10:44:31 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39141ffa9fcso4020209f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 01:44:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e14csm10683168f8f.76.2025.03.31.01.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 01:44:30 -0700 (PDT)
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
X-Inumbo-ID: 5d32d657-0e0c-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743410671; x=1744015471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hnTbd6S7QTLXrS1CqEBrXOnsut7BpSA5Btng0Eyw5FM=;
        b=NK44N+kcJksjso4fjls+zTutxdo/LrdJoJZ7IcESMRdHQuxqaKYnMw80oP3oyFESmG
         bx+6IL3y8VA36cDmrM/a3DI+UcXaDb/4i6Dt3S27H78hpqDVfNIcCFLgynP9tDxa7pC6
         Ow2M3Fcnk1VHl5j6UvXozADkPgAfjocKFHLw7q+1ea1p2Sc/NrkTCYtIX5fnKtk3W/ii
         qCjndY5MY1PorlAiutNf2G7CDdhYI7ndpsMT3i0FSnsB0cz2EpwpuoCujzFcE+bgnv6h
         wuVDuU8Gn/KusEN6nKu3q7QqxkdFfE9SSLu8b341x4aOOukBRTW/cNaOkt/2u+88p/6i
         WNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410671; x=1744015471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnTbd6S7QTLXrS1CqEBrXOnsut7BpSA5Btng0Eyw5FM=;
        b=rQ88I7hqyohN4QQ/6S1rQG1+Glg7kCp/sn7RQpJag0AvUPjq7v0rSUDPBMrbmiLYza
         Hxq8W4gTJQKU0T+3EgWCGOXEeJQG8BfVZjW6w8S7+f+v44Og/hM8OkgqHS6wAFe0u0Of
         jzdq9JVGDxwECwz7z72o8CPepbu6B3FxXVoimlanb2gnty7NdWLh5DL8SwB7jTfqC1eL
         lmSoq1soV2Kkf723QYWArTkbTFGIL2fJ/SdGVsYqw2yTSm7Qx+ukfY7tM+G6bXCX8bFc
         4d9Cgry5eBwhQWVFDVnvv+5f1KylVBHayPRgT2hw880JUHZZehMsgsIH6sUPPCOnGj5J
         ZdQA==
X-Forwarded-Encrypted: i=1; AJvYcCWV0+84ikhCAtrCUnFZqUEO7BhGmvrBvnQcNxbNmHhsbZltpoY20msLRI7l3Q34rWjUj1JmxMaMhWY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJUzHqyaFZCVYNv50ozoc5s/fJdy1br8Bl+5Ko83eGwnGwLKTl
	gX2jloTYySRVWwJbY+AxdbrZDjqJhDwDDbyGF3HZkqG2fP37TwGTPBgPWl4Hrw==
X-Gm-Gg: ASbGnculQgIXGns8yWi/q1vWCTohptzmo4UNZF3OqvHXlJ6pWouB3+Vtuu7KLLngDaF
	zQ1xIygFLqbf4TJ9KJtiIATFoTg8fz7y+xG9dgNa7oS3crXmKkFbr1tCpD+mfGYmKp77XM8x4nh
	Y8/7GfIkgae5W6Noh8eHAuls/HW3Zefv8GZxmiY2o/yvDw+DEnhJSwPPikVnNhdQpkUc5QJWLNz
	HhpJjDe5GlNYiqg2GCLeo670snLlAKQa3IZ+vrQbiFWbSppS0xZ6ag99Z0AjSod6XOYTcoR1wMC
	KQR9baKylMCAMw7btbDi2wqdw/NT6ROe3lxW5/ScD4CTglFObrPYJZaAvGFcIQljGy6eLZkuTFh
	p22cC01v8PHA1f4z0flA6F0ZFl34ysA==
X-Google-Smtp-Source: AGHT+IEsoxXhKLr6p3aUPye7KQ2RlOmDtz9Z1xNZa5ldasrFM05iRu/Z4PyUDL7STcnN02nVRLS+fA==
X-Received: by 2002:a5d:47c6:0:b0:391:20ef:6300 with SMTP id ffacd0b85a97d-39c12118deamr6373161f8f.37.1743410671072;
        Mon, 31 Mar 2025 01:44:31 -0700 (PDT)
Message-ID: <ba6adcbb-3192-4f82-bb8d-6df8f4fc3fe7@suse.com>
Date: Mon, 31 Mar 2025 10:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/16] xen/lib: Switch to xen/byteorder.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Lin Liu <lin.liu@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> From: Lin Liu <lin.liu@citrix.com>
> 
> In divmod.c, additionally swap xen/lib.h for xen/macros.h as only ABS() is
> needed.
> 
> In find-next-bit.c, ext2 has nothing to do with this logic.

While I agree here, ...

>  Despite the
> comments, it was a local modification when the logic was imported from Linux,
> because Xen didn't have a suitable helper.

... I certainly can see functions of these names in Linux 2.6.16. Just in the
PA-RISC bitops.h, though. Yet this may be an indication that yet earlier on
this was a wider thing there.

> The new infrsatructure does have a suitable primitive, so use it.
> 
> No functional change.
> 
> Signed-off-by: Lin Liu <lin.liu@citrix.com>

Missing your own S-o-b?

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

