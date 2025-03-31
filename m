Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC05A76016
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 09:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931947.1334120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz9bO-0004Dz-Cf; Mon, 31 Mar 2025 07:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931947.1334120; Mon, 31 Mar 2025 07:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz9bO-0004B9-9P; Mon, 31 Mar 2025 07:30:34 +0000
Received: by outflank-mailman (input) for mailman id 931947;
 Mon, 31 Mar 2025 07:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz9bN-00048a-58
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 07:30:33 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 070476f2-0e02-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 09:30:32 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39143200ddaso2639276f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 00:30:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b662850sm10396115f8f.26.2025.03.31.00.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 00:30:31 -0700 (PDT)
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
X-Inumbo-ID: 070476f2-0e02-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743406231; x=1744011031; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5WxpwyIlJPxlrIKLTCvktjafdgYpbJds4VnDH9Ewamk=;
        b=XkwNK9UKUKZ+ZvFhqUjKCwZW4xkFOjY2z46qFRK5q6+fifQeKRaEHBWdWZcHRxSqPk
         uyyiyd6kd9nRXW9jIeswcYEcpR6ecZ5XjzwNxMiJswTrEYqK5yecGEgWu3VuuiXM8d4u
         vtWcr+7y5NJFVT5SGnHo0Ge39rttuFbg/CNAg+MaAIzJqq1SWiehwcgWS8QVGMS5Udo9
         vweTO+dRyZDqgwkyJbotr1mvyfPoY8LfSA5v2/rMgcj7SGccnG/OGkDkBPGzSgS0vBz0
         Gxjf2ns4ZaSxouZt+d16Hc594+Tz0swA+v6wqpjBeXYckmyMYzQibvO9WGAuNb0vVZGa
         6+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406231; x=1744011031;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WxpwyIlJPxlrIKLTCvktjafdgYpbJds4VnDH9Ewamk=;
        b=WMHq9JgcgsBuNIXKJTDq9PdOO+JKMTSE5Rq/+r2/4pkyDSBW7Kw1zTBCTS3JMiAOkd
         MC986blvJu6PisUUG//Txa3kLMIUfPF/j+cx3nkquMN5yH0pY9KXvVtxMcRX9Nr5QhhK
         TTf+Q0p/I0Kgku7xvN+QnxVxSDdMeeJuqwmx24MhsXgGan7H1YzhnO+PftOPsB37Z7HK
         95tR6U82E9SbMDk/pREtJTzSH0Ogdl7yD+B4pq4usJc8bzOeXiWwnr62o7f9BefEP8uX
         KRlB80jx9WoxnWzpsG5xpgjociyHHblIaepldqbAZsCHrDlTR8UWe4QyAKCRAe8jLsN+
         yU0A==
X-Forwarded-Encrypted: i=1; AJvYcCUbyW/BxC0bZRiHPv66LtkJ+tUBQyh727UOi5ggt8vT2BbGXMLQ0VtOi8+NKt5qCG0QH4tzyFdlN+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDjBxH+WgM47VRlgDTDtUc6EsxRNuKTqwm0CYCP0Jmbnvgfuvt
	ykA8v7WUPiwVuH+XA+rAyKISMFPXbezc6NJ/Xcq1zazVfINf/tN/JavVBXEXHQ==
X-Gm-Gg: ASbGnctYIzBg7Z2DtURIQY0hzLaBCDyrRdzScMA+b9/D27B6tDjmdizPydDi+B6BFeE
	j/Hc0tCqcrlrZpwlnI1bnot4K2Pirw+YilMQWLzfFvaQP2cjw+kTCjs85hVeKzJnPPUORPhHfg/
	Fjq6VjXZwEqoEGqQq//E1T5pduEzSiyy74VfvzfsCXqAsJEYQEZYGsg0pZJ4Oan9OctHDtNRZNe
	TgLR04/Ms8sUIkKEZkt51u8uXVOb6d7n2D78HFWGUi7X1KzP7Go8AThluGdK2lDt1jQurWzhroY
	X/Sr43UkhPf/ft86zojLoVAyApeRMYRsVVzm1t0P7Agib+zoJm6XkCMAsW3RDrYL2qmNQXee1f2
	tslUR5sD+9fBcS1GdRXlFtPDLXWoExQ==
X-Google-Smtp-Source: AGHT+IFSmPH36kvQUiaiu4R6ZBkigfODMirAfEfVXsp7JRV9vLUbaFkxDEkRYMgPDfE9enkKvmGtDQ==
X-Received: by 2002:a05:6000:1ace:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39c12117c44mr5819462f8f.38.1743406231382;
        Mon, 31 Mar 2025 00:30:31 -0700 (PDT)
Message-ID: <81dad4de-dbb1-44ff-b1bf-5d30c8f5d22b@suse.com>
Date: Mon, 31 Mar 2025 09:30:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] xen/lzo: Remove more remanants of TMEM
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Lin Liu <lin.liu@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20250328134427.874848-1-andrew.cooper3@citrix.com>
 <20250328134427.874848-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250328134427.874848-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 14:44, Andrew Cooper wrote:
> This logic was inserted by commit 447f613c5404 ("lzo: update LZO compression
> to current upstream version") but was only relevant for the TMEM logic, so
> should have been deleted in commit c492e19fdd05 ("xen: remove tmem from
> hypervisor")
> 
> Fixes: c492e19fdd05 ("xen: remove tmem from hypervisor")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



