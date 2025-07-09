Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2663AFEBA0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 16:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038268.1410759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVdC-00029x-IY; Wed, 09 Jul 2025 14:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038268.1410759; Wed, 09 Jul 2025 14:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZVdC-00027v-Fn; Wed, 09 Jul 2025 14:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1038268;
 Wed, 09 Jul 2025 14:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZVdA-00027p-7V
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 14:18:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b986ef6-5ccf-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 16:18:38 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so4520861f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 07:18:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8455b778sm147583525ad.139.2025.07.09.07.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 07:18:37 -0700 (PDT)
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
X-Inumbo-ID: 9b986ef6-5ccf-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752070718; x=1752675518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0qfZ1yuO3mpZgiMbiFaYKDpMWfLKnpzQggNKf+8dRRA=;
        b=W5LgJydUmtyc/fu3kh/0O+iqoGBCTWmuFeDbF9VdolqSLiEqmYaJ4V7+su80ICVV0D
         alCMt3d88sfixUsAjENnqKyeRlW6eZiGoqHNZqdxQSX8fK+P+xyaHzfMiKJplljZWxMs
         5HGCyW7qbra9z+tfe9DlRBHjQiMpO0G+PmLPm7DXvxY/4nXsrxFwAxQG6yDuf8pEGY+B
         VFlO73YKYo0oIwiRKnBORsaWwmzDdIdJRe7SLNYstYgri4IHdxqE1SnI2JIo8qdL6K++
         3sIjDk0ZE+V8GPjZPb2jjSKEVVyk7CDMMhMyqllbmMbY/gDGBPumCvIOlK9eO1MBzN5Q
         3MAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070718; x=1752675518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qfZ1yuO3mpZgiMbiFaYKDpMWfLKnpzQggNKf+8dRRA=;
        b=lNZlq5nTKyyc5DLVEbFobUHz7S3k7u5FEeSu3TNC8G5FGNWTcpkjKIqiFLMfmQOkiv
         Hlta1JMNcZSZRZlu+wxvhWUTbywPBhSCk8LTBzYDG/acBSU9pgMEV8KdE6qFltIhhbgE
         jxKN5akoWrvKq+zYP87R+F7KRd+8KL1xHvowaKRNVv0azQG99W0K7AVXco4B9/ys2GTA
         6gcPd5B3S5cKzXtf33bh0Cwoyn8ytGF+24JqPJ3ZmBS3/21u1NcKB3nhRhGhSC/T/Kck
         zI6EajyzDST0jHdNmrg27CfwhLekzzx1FVqtF+ONntbkzBAefcuJh1FGR+4jJH0VDYK6
         wOvA==
X-Forwarded-Encrypted: i=1; AJvYcCXOlcUWUBnWLII5gAa23bU60xbzS/iTkzHsgh1ApGrgYPPfSzFNB7IQjZmmpj0SdAU253y1Id8psDU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLcS6THyzJHeyUviTbCvZMkjAdJP5sYfjBIUm8rc1jml7C/FNq
	4JmIOmV/RvxPsMUSQlT5QDYACUOwYV0zjm2HYxuo1iqgvBdGPe96tEgp0UzFEweKtw==
X-Gm-Gg: ASbGncs1nriGCG+7ZS89azm/MOo/cFs2krcNue+waVmyAfYUlen9EGFdsPKzyUYoIbE
	kTUGvhjMRs7Qo33cUNdHgpULT5JdD/qGG9v9RuPY0rGAds1mvL6UU8qLw3NIy1H1qZhrli8OgRP
	hbt856Z+opPblxi5AvJZeK3VLtHA+A8vNwxNXRfDgqFCnOBc6kqgtMvuAa/xdMUxGSTEIFNlMUl
	SyZLybXyEti0DPwqUd7grW2pwoU6pkP3efqRI6eAr34mjGMJ8Fl4cqQmyVt7HScuUDtRJpWSxHG
	SYJU8ugYIwCf4eAml61SRzPoPKFS7jqM8IMhR5Q90beVknHUFJt8/Etwy74/gDM7DFfnbkovvxY
	9ZccX3ahitan44sCYEQnsdmxiisd5fx0V/C3xCeBdd9vaHsc=
X-Google-Smtp-Source: AGHT+IGdL9iz3d7FibsHzlWiKRi8UX0bQNa9fnhbbU87/zvx9Cisq9YSlrPX2V3F8YWXSFT3kSOVWA==
X-Received: by 2002:a05:6000:2d05:b0:3a8:38b3:6e32 with SMTP id ffacd0b85a97d-3b5e788d3f1mr84833f8f.8.1752070718232;
        Wed, 09 Jul 2025 07:18:38 -0700 (PDT)
Message-ID: <9644c76b-ed26-4237-834d-99d33623fe7d@suse.com>
Date: Wed, 9 Jul 2025 16:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] x86: Replace arch-specific boot_module with
 common one
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
 <20250708180721.2338036-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250708180721.2338036-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 20:07, Alejandro Vallejo wrote:
> From: Alejandro Vallejo <agarciav@amd.com>
> 
> These types resemble each other very closely in layout and intent,
> and with "struct boot_module" already in common code it makes perfect
> sense to merge them. In order to do so, rename identical fields with
> conflicting names.
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


