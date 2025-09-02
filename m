Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7BB3FA53
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105907.1456722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNIr-0005QQ-A1; Tue, 02 Sep 2025 09:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105907.1456722; Tue, 02 Sep 2025 09:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utNIr-0005Nt-6i; Tue, 02 Sep 2025 09:27:49 +0000
Received: by outflank-mailman (input) for mailman id 1105907;
 Tue, 02 Sep 2025 09:27:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utNIp-0005Nn-Mx
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:27:47 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1525d984-87df-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:27:45 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afec56519c8so850961066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:27:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04323984ffsm387513866b.64.2025.09.02.02.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:27:44 -0700 (PDT)
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
X-Inumbo-ID: 1525d984-87df-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756805265; x=1757410065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X97cz4NWfnz3pesE7r7aRVYydzyNmT9gdbV9HvKfhDs=;
        b=H1WL8wD4Y8BjRJfOwxbqlqqXR0luQ0GyY2Q0Y5Rb+GAMEkHy7PyM/FNEkhlniUAIm6
         aNjqN7R7WdC7Zoz+DyURd8HrkQ/kpEDLed9lJSRLr/175MabydjfPQt79oOsdBrCmtyS
         hGhmDIgy220JpIP0OXuZbclAZbZuBS8E54vaeQJkPikKG3+yif6vX6/dksE2W58H1/Jd
         +V8zRb4bmBTQSJyPtc9YVPTnkLZ0f4RxjC90LfkXu2KFlC6vcmcQGbE9nTw97ekXucTZ
         GtsUiUKOy4hNoY5st/tlCBq1ZDKk92n/TLKVhsjQll9fy0hwhIsSU9qWl1awbCsFvMsq
         I4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805265; x=1757410065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X97cz4NWfnz3pesE7r7aRVYydzyNmT9gdbV9HvKfhDs=;
        b=tOd5SfU97qHCC7mgeyZmFfzo9rL4y1mD7qxwIJyqscS7sPcR63ltaPzpi3ICDyq0xc
         JjWa3wzgC0dHx2h5u6XLfBkdhvcU4LAy1Is4pJUItuUgvWgt+2FbV28qjln21/H0nrSB
         +sBfEz1XWHFzIl1cgDtu2ntVPnxYVJLzqbphvzygRIDgVypH9tbu3srTlft+0Q65DkTH
         jkecJMyo3W1Ch7xsZplyuNHFsksmAWt8Z2vOwRhO5kCN3fUlniflwRIQIr89InofUwCL
         BkTQaQ1on3fObtm2spLL72Kif8YfnnC6H5TLlm2FmqnE1DmJfYpGEBXJ3QG/Esw+dfqK
         NLpw==
X-Forwarded-Encrypted: i=1; AJvYcCVUksSvxCYHZUHHI0VUCrJvSm9VtArtXuADtKEawzYIPmL/JVRt+YKULUKqcs5eWrUvj70f7HgzRCs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7DnA5qWcQTN+AmstixStavk2dR12/n8Rw/j9pVyouFf/QY3HW
	p7JIJYUeQYGS5XwEKsTbGu65n4tp6B64l6ATdyrnFe8rdtHM8jklmxSHuwadBd+9mw==
X-Gm-Gg: ASbGncvVGrMypUg+MOLEF7VF6TysnOHWD+bjsgl16BzETJkHEZ9WDCuRzhKAyY+UxPE
	NCu4eiiYjKCGjs3LMCQQFLvCccQTnTi9yMgdqIOUP+6lK9GHj9fqbRc5L3JJPEat6zktoAWEGkm
	U3kV5U+GHXyu6LrkXaPsAnCSF9gC0JZB/xoNdc0+x0FqXMuhL6AGnxM5hTyF2ocLbfhI2QEnNAD
	lV0yDsZZ91FSTlaeQVOHLuItSQEIjsQfUDRsJJ+TmZWAbHt0Hl7a8oPUEPvPvPO8JhvNcQeZOTt
	v4NLxkxMOliNd39x9kh7TcsCZVHOElxgQWfQV8WXhq9wGjHn2+YNb0AZ7GgPYPMExSnFVut3oXh
	HCXqY6oy990ycfKzINt4+e0Kgemh3B5jzry1NRsFWeGOTIJjzwEduBNcQmrV/FMjhyI7FLsJkuC
	REBT4yBPM=
X-Google-Smtp-Source: AGHT+IErc2bc7GNzVsMWnH4iTDE8EOQuQzEuefu/ThOJKNtF1lSCtuukiijMdl3t64rdNSL/zadwag==
X-Received: by 2002:a17:907:7fa0:b0:b04:3a9c:33ac with SMTP id a640c23a62f3a-b043a9c3bb5mr474653566b.50.1756805264642;
        Tue, 02 Sep 2025 02:27:44 -0700 (PDT)
Message-ID: <69a2cf29-2c87-45a6-9b27-dc5332e28c16@suse.com>
Date: Tue, 2 Sep 2025 11:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1756586648.git.mykola_kvach@epam.com>
 <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com>
 <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
 <CAGeoDV_5856nbOA6_H00yxGvBD=+YG3XOAObw6dCMesb00ZiTg@mail.gmail.com>
 <b1f195a0-6471-43e1-8973-ceabcb6ce9bf@suse.com>
 <CAGeoDV9XVHHpUxDr1McXP8gk5mbH-SeSk+TwCCiy1A24FcqScg@mail.gmail.com>
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
In-Reply-To: <CAGeoDV9XVHHpUxDr1McXP8gk5mbH-SeSk+TwCCiy1A24FcqScg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2025 10:42, Mykola Kvach wrote:
> Since the current codebase already uses this approach in multiple places,
> contributors may get mixed signals when similar patterns are sometimes
> accepted and sometimes discouraged. Clearer project-wide guidance, or even
> small clarifications in coding style, would make it easier for contributors
> to align with maintainers’ expectations.
> 
> I will adjust my patch accordingly and use has_include as you suggested.

One other thing to mention: I know time is somewhat tight, but you shouldn't
be too quick either - another maintainer may have a different view, after all.

Jan

