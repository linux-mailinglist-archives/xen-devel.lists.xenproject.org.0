Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07C1806A42
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649001.1013205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnmD-00018g-EC; Wed, 06 Dec 2023 09:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649001.1013205; Wed, 06 Dec 2023 09:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnmD-00016W-BG; Wed, 06 Dec 2023 09:01:05 +0000
Received: by outflank-mailman (input) for mailman id 649001;
 Wed, 06 Dec 2023 09:01:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnmB-00014k-TF
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:01:03 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb76d7d8-9415-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 10:01:03 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33348e711e0so482255f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 01:01:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j9-20020adfea49000000b0033331beb85asm13580883wrn.69.2023.12.06.01.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 01:01:01 -0800 (PST)
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
X-Inumbo-ID: fb76d7d8-9415-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701853262; x=1702458062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ul/+2J/Q9UnLYNeMt387FM5aK0kgEyIrv9wS6MqhWlg=;
        b=ZBHdaKeRuurIUKxYySDURIb9sZm1ST1Ph6oFe7sJUjtSGomst7vJv5JTBTJxEpgWEY
         /J5txmTWmPqY93T80TssqXLLQkH/dz65Id2Epq75Po4wWu/jgm3m3exCphG2jLojRro5
         z1ucw0AC7bWxtOMCbkXwmT2bcWNL385ECgW3Kt+BqqRRDWBQvQ/PITXtm7/iyLqFK8PH
         rsVGJ/qTLMMRv1UMGRE8+FQtEO+KhGfYwTsB+B2fhXrGAnXLVI7AfVcuGjkK9L/8uBaN
         u2dufjc1AqYD1Z8YVEDbWfeK2IaAJ7wpNdhHi2aMU4pxavG1ht75QoHVV2DcMqp1QpgB
         XYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853262; x=1702458062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ul/+2J/Q9UnLYNeMt387FM5aK0kgEyIrv9wS6MqhWlg=;
        b=JjLfVL+dtetRdIRBxuYMGFg+7usw3FJlGAtGGD2KxS8p3Q/wMAFr1/zTKJw6xSgp2m
         SVr0x2KZ7EUPKrjPM2jyVxsCP8nQIURUrxmuFhx/PRk9jwJWS1SoSex92Vtf7mCtTc0S
         MxkFJXotNQFBZWZ86qO/3Wk4eykn2XOhBjPK8J/k70LmM7U5dy9ZkJRs6tvJPwwF5+iI
         LUQh02YOlZhMUdXQw3LIIG2jvYMTNwFmNyz4Z9fVOjfbVu4Wgafr/DMbG5qeedd4s/gS
         iX+imQcL/GhaNf/VdCVwcYVQSwR6uM2kKx75wY5+IzGH2L3TQuhd07totm8Ru2XbbN9z
         +M6Q==
X-Gm-Message-State: AOJu0YwQnQ1P6pczQkDauTqDR5hQId8RWcwaaPGwkDmQ6+x2N8QwtQTD
	md5HivU+5zHJUxUhfCeQHBE4
X-Google-Smtp-Source: AGHT+IFPNn4gB1hBVFNQNywtPvrXF6btbJ+oaiCbOQlG6emDHncB0WpObvKj9r+p/8qjTt/tnKmb9A==
X-Received: by 2002:a5d:4d81:0:b0:333:3bc1:1f95 with SMTP id b1-20020a5d4d81000000b003333bc11f95mr301938wru.106.1701853261790;
        Wed, 06 Dec 2023 01:01:01 -0800 (PST)
Message-ID: <21691a25-1630-4f56-bd3f-60e2a71107ef@suse.com>
Date: Wed, 6 Dec 2023 10:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] ns16550: remove partial explicit initializer
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <89f9aebddac56c034aace59c5b910ad4bef701c5.1701793717.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <89f9aebddac56c034aace59c5b910ad4bef701c5.1701793717.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2023 17:31, Nicola Vetrini wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -73,7 +73,7 @@ static struct ns16550 {

With the variable even being static, ...

>      bool msi;
>      const struct ns16550_config_param *param; /* Points into .init.*! */
>  #endif
> -} ns16550_com[2] = { { 0 } };
> +} ns16550_com[2] = { };

... what use is the initializer in the first place?

Jan

