Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74DDAE5E8A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023263.1399216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyTD-0005Bj-OE; Tue, 24 Jun 2025 07:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023263.1399216; Tue, 24 Jun 2025 07:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyTD-00059Q-Lh; Tue, 24 Jun 2025 07:53:31 +0000
Received: by outflank-mailman (input) for mailman id 1023263;
 Tue, 24 Jun 2025 07:53:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTyTC-00059K-GD
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:53:30 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5134daf7-50d0-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:53:29 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso2990242f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:53:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a226f6fsm12742157a91.6.2025.06.24.00.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 00:53:28 -0700 (PDT)
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
X-Inumbo-ID: 5134daf7-50d0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750751609; x=1751356409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C1QJrSMq6CXVVCTvl8sSq5jZgyRmHg68fGGy4yje03g=;
        b=H+OU1WFoy4hXzzXqCKnqUXQXTl8KLWuOdlqfVCQ9+yRXGuPzyHqyekH3EwF6dufiNh
         xQTkPECSXHrHdSVCgIqEfy0gZojn43Wc3x4e/1kqSXz3alJdv81qh8h8ep71AB8rELFd
         J0PgAIkSpUbzlMawBvBWlNBPMRUGNwTVC80zBmfYB2omcXjpzN+0X+RKe9xqYanyDxUb
         hLLW6vH9owba3secpNIpZRkozItKQnd2OQu4xZBNr+mOcnGe4NzIsczKP+rR3IDaUgwz
         w5OQJU7TwuKhLsTjkHuOfjyv7bC1o77yGp9oKPgsWd+n0OND8ge10+Ku0ook+QVQh7I2
         HHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750751609; x=1751356409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1QJrSMq6CXVVCTvl8sSq5jZgyRmHg68fGGy4yje03g=;
        b=iEypLPTdbckn5Qd7VcbWWLfNkIPdg4+gAjUhZTr7/nXXVoaU6TKMpTPU167GkliT7N
         zbo0Ye2nMkR1HoDfJFiBxMrR8XA9YaQkUL6sh2dtGqFgNiGkd7HGyG8Uh/ytzu/uT+DQ
         +K80QuYUvY/nz0ZDgRwvba/9D+OBeuek0OZ/wp2OXMzkUhF/7Kd991h3L/zH7f/xLAQN
         3oF8x2ZMlKnwvH+mL2iOof5fF8j16G/q1oaosI4majrpjGmc+zb2Qwt88CdcEgYzSxG4
         NFGAnZsl66oQd+Ie4iXfs7xIfs4nZTlfrbOgyx8EswtiFDY3qe6Y52cPOe7tgAe/8+NY
         v1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFuGQNpgiOa28lmDXVWFhblY0ykk1NCzrgIKthp5aBDPz8Spvnebu89fyeijZ99ICuFeMv3V4xvM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymHOi1So1Wf1ckCGN9sD3Vpa863jc5zIWT389XhQ3J4f1Xzto3
	1N78o0fu9DqGPdKbfLiH6PnhnzO4CdukFYnQA7hnOX2hWoNhYDDqmV5LKQ6res1kIA==
X-Gm-Gg: ASbGncu22j8PbsJAvIAWVyBZInBr6Aaya7PdyaExAJ1TPV+QRPW83ll5WzpBmhFLeu1
	Dh0LCsTHrheAVAEhsYne2J3p/ELMf8MrvLRShU7e+tYhKt+BhxZVwr4Svudvt8j1rO6wxBNmflf
	I+RL3Fc61lUsbwrZp4v+pgcTaNJQqzRhqgJH8Is8rpHGcyrudz4mA5v7eZhWByEfaXXE+5tIGE/
	Ijrj/svBrhsw+nYPJPZYj533kpjWlSeduYs6pseHMvEa5A+5GcXGgJPNloDSvkGyOCcaWIZalRd
	KHgfbQfwT6DvaNVvj+i0H3crlC9DtorZ8JRzO3Bctg9hf9U/6eCBtqEm52UoPfw3Uyib6IyEZKZ
	EidQgUXNFP7qHycciPT8SpDbYt1lT1NswOB9X9fNlfdtCMwzHCbnJ3UBA3A==
X-Google-Smtp-Source: AGHT+IF6enLITgWcdwf3Q3YXdaAKxsCC3a8NeAJ5+5yNggWbSj6cB3mLENq1X9qfRUtchcehlEhGaA==
X-Received: by 2002:a05:6000:25f3:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a6d129d7f7mr11063287f8f.20.1750751608972;
        Tue, 24 Jun 2025 00:53:28 -0700 (PDT)
Message-ID: <2b345a72-5ab7-443f-bff4-2b4ee9952825@suse.com>
Date: Tue, 24 Jun 2025 09:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
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
In-Reply-To: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 09:18, Mykola Kvach wrote:
> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>      .start_tx     = scif_uart_start_tx,
>      .stop_tx      = scif_uart_stop_tx,
>      .vuart_info   = scif_vuart_info,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend      = scif_uart_suspend,
> +    .resume       = scif_uart_resume,
> +#endif
>  };

As this being put inside #ifdef was to be expected, imo a prereq change is to
also make the struct fields conditional in xen/console.h. I think I did even
comment to this effect back at the time.

Jan

