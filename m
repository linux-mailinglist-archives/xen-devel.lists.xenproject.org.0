Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907EA73706
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929779.1332530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqGa-0001n8-6e; Thu, 27 Mar 2025 16:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929779.1332530; Thu, 27 Mar 2025 16:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txqGa-0001m8-2y; Thu, 27 Mar 2025 16:39:40 +0000
Received: by outflank-mailman (input) for mailman id 929779;
 Thu, 27 Mar 2025 16:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txqGY-0001ZW-BJ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:39:38 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 124cf9f2-0b2a-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:39:37 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so490827f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:39:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658c87sm31887f8f.9.2025.03.27.09.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:39:36 -0700 (PDT)
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
X-Inumbo-ID: 124cf9f2-0b2a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743093577; x=1743698377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JEcMrIyCObStPjgLTR7Cc7eNEUrhNcIOYFIB3UZ+YpY=;
        b=Fc30aS1MUoewOMNywiWosOTXbRuQ3HxGgOOLcOEs3nlrRpTqhdgcBtnGWVFSByc1s/
         wfdr4ZrA7aXv9E78Sb6LBU0ZqkgbMvUPKelRnSrXmszv00/2QUR//ft7SYzQRWnKf7D/
         VJtxmcAf8qCCSyO+1v8I93HjKZo7kAeEOu6SQBUUGNOXABf9IW8fefkmWJqFocmmWr0r
         I8tHoJRH2Bt6z49LmYzbYA/Ou5Ropy8IFMT3rWksq3NR/cWMXtuY0TG5zVItgHRF6uGy
         B/TPzyD0XLa/a+bhuOXMSeY1knX5613xGh575yBvN+uqyArahWWjgi3ccTH2b6tA1XNx
         ZM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093577; x=1743698377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEcMrIyCObStPjgLTR7Cc7eNEUrhNcIOYFIB3UZ+YpY=;
        b=TMD+6E7dFUuVd7EIkW6uCo0QQviw4OLV4uPWgqjZ/Zss+GoEuD4XIBps9BxEWh9He5
         PmEZ/FeCOQjWH6tHClvWfxaVMNdVsvCe5yvpAZ2Ug9bXPbFm+Vat77iaAIUZDM90C8bs
         ynld42ku+Z3moZveAbXOrAJx8Iox1MpPsjWsptClE4acH1dyd0njPhO3AAk+Sk5eorX6
         fctwFOLxgWPRKcKnCFtkGpvBc/PvrzhWU4h/X4Z7HVGxeNq1bPFInQUErmyht9j+axza
         HPffi9jcTrMKa+7zOpBlbSHYw4IXTtG9p2uhmmqhtcSfOEZS8HpKlB5wS/mA6LszaclL
         8+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWOZRWp8Qlr7hBJJ7vExSK1jUlbNxsvt6bXZkGKD+tt1H/5vU3zNH19ZQ4YOry2VxCqpRZedyIfrDw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybIUSF/1aSbqfAAoa1gtkxj9I9vOexrXePyc6PBrcnfGVb+Jna
	PiJX+NMdFvy/Whg2HnxQh7yI48rBO0fDNp9csWkTR6x5oenEhvcvLlbqPqi4hQ==
X-Gm-Gg: ASbGncs/JPIp5bX9qmwDSs+0hKlnc3vijzLXSK45P/OSBmNAxxPsWIjCtuiAcZ2Pbtg
	BjUMTgKRN69raYlVBaRVsWxqAJif1w2xkq2uz2zNtpNCyxgzIYQB/WFyj5WYejPBQHDAnTGWmaN
	XPBjpL8TU9YisEg9Nfif9up15na/xXc94fsVQQfTgFjyumcO1zi4yZJJSA7RsrWBJUAjmGJSUKf
	TFJxKflrS8hgRgOr22a9BtJPYoySoGgDgqaAOPaw9DQcmal8suaLRVLOOt3KemCJ8sQ9r1CbwVy
	+rzQj0sxxJ8+yejtBJmB9J2/81BnjY3UOiKCGKOx0ox3GZEYAb5Ta6HzZGg1U9e48W77FkziegX
	wFQJ75K5fILZC+syeFeDBTX4YhN5JlQ==
X-Google-Smtp-Source: AGHT+IH1PWqJmS8To/lbThPOw1u/H9Pzgmar6IyJrxGaguMKldkPxLvN8tyLq2icBkqPVloR3Ggzkg==
X-Received: by 2002:a05:6000:2cb:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-39ad175c052mr3730468f8f.16.1743093576688;
        Thu, 27 Mar 2025 09:39:36 -0700 (PDT)
Message-ID: <d56b2e8f-58ca-4a7d-a8c2-59de9d1c9102@suse.com>
Date: Thu, 27 Mar 2025 17:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Xen: Update compiler checks
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250327163114.405824-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250327163114.405824-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 17:31, Andrew Cooper wrote:
> We have checks in both xen/compiler.h, and Config.mk.  Both are incomplete.
> Remove the one from compiler.h, as it's pointless to perform in addition to
> the xen.git-wide one as well.

Isn't this premature? The Config.mk one doesn't terminate the build, according
to what there is in the post-commit-message area?

> Expand the checks to cover RISCV wanting GCC 11.1, and to cover Clang on x86.

./README says 12.2 though.

> PPC still is unspecified, and inherits the GCC 5.1 global baseline.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> v2:
>  * Change to altering Config.mk
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1738628602 with
> the CI changes reverted, so as to expect failures for CentOS 7 and earlier
> Ubuntu Clangs.
> 
> The $(eval $(check-y)) is badly positioned:
> 
>   xen.git/xen$ make
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>     HOSTCC  tools/fixdep
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   make[1]: *** [scripts/Makefile.host:108: tools/fixdep] Error 1
>     HOSTCC  tools/symbols
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   make[1]: *** [scripts/Makefile.host:108: tools/symbols] Error 1
>   make: *** [Makefile:610: xen] Error 2
> 
> It is involved every time Config.mk is included, rather than once per `make`
> invocation.

Right, I guess the $(eval ...) wants to move to every */Makefile in the
top-level subdirs. But as you said elsewhere, that's an orthogonal issue.

Jan

