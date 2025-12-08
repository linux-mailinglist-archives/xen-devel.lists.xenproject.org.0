Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A194CAC838
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180147.1503385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWiA-00075P-SV; Mon, 08 Dec 2025 08:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180147.1503385; Mon, 08 Dec 2025 08:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWiA-00072o-PS; Mon, 08 Dec 2025 08:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1180147;
 Mon, 08 Dec 2025 08:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSWiA-00072c-2B
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:35:14 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cff62d71-d410-11f0-980a-7dc792cee155;
 Mon, 08 Dec 2025 09:35:12 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so34523975e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:35:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbfee71sm24438972f8f.15.2025.12.08.00.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:35:10 -0800 (PST)
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
X-Inumbo-ID: cff62d71-d410-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765182912; x=1765787712; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3HpQPNbqszi3NMfjMYiRKpGVgHT9Cl9IqmomIJKoc9E=;
        b=QNqkQOtlbTsax+/bROpiJyBpNBj4Z/QCqJkTtLzSMpp9ZADU0fe0wkm+9S8plHAHNB
         Ju5N4rlEL6nOMbEx2RLDWm40BJiLOj+lcPlwk2Psc+QpH0jKqckKokpj0/+dcUvEajE/
         O1NCeJ2WtJ4Bpo0LBqJA7hOvh67Fnk/5QYJ/pqo/D+T+3imDskxnX2ohdAB3aiD8p4eE
         IIHV7vLUSP7YRU0T4aBccFDMtsxccDOcN0Zm2MPRJnf9IpdqNA7SjYUfLfrKyIsm53Td
         rEtEdmFUOghrhxbDAB9hASxfkPKPOqnUEyHcDQTsff0yzw0ilDnkyPfjFC7/Z70ezVT0
         NW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765182912; x=1765787712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HpQPNbqszi3NMfjMYiRKpGVgHT9Cl9IqmomIJKoc9E=;
        b=LmsC8KT4T8n2gvpVgdbQ2nRhKRUcq73bI9/b8gaFjzhKocLJC0VSl108DPdoMolUHe
         eOY6H+rNH/a+kiB+RUe1+CEWkkCZxb92knWgGJ0C3FAn5smmBMfpLNMkTsauZ+QL6qBu
         KIzwX82PVSI8etTwMudsG3sX282t9b0P8si06i13KvrjwuYDeRTQ4TvOOviLAkKqG9SM
         +TBaH8GWtHV9kP+9N2QtDQGTy/OaRIAL+VLl+BPs35OnhvktprZl90NI48BU8VGHcDHC
         7IkF+ysG++Rr6W/Kmg91WlQ40jkoYsQaxX8sgimf6fyE5UT116IKbR1GtUPaIMsH1haB
         0BFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl9Sfz5Mh+8npEAXW5dD88AE4w4B2V4+ZqMoYELljyM7Hlirs5djAuhyjUs+gkYrhCdAsjLHD7kcc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxEohiwmyuHz2DzcnmZULtI7PICNc/PPKnNeWR1CIgDhotbbRP
	ZxCKOHsftoLH5zRVvXadlUTcQaGlE3alkxrMeQtHIbmGr8DP3WLHngxXRi+Cr+FSeQ==
X-Gm-Gg: ASbGncsbnqjznzRKkZL3vtGuhXi47AYoN1rnxjr9IKCvqRj37Xqcxv4W6yLWRpOyBeO
	huNkb80VooDzLghxTMCDDuzJ7AhqiAUO4PeoLGyfuArCp8ZKRW/aeVW2gMpckGccWvo+CbKc81y
	XH3f5KgFM37XBzQ/7nXAYUkHvNQ+fJzGRw6APZfRQ9oUFmz+NaHPOxlNFKRX/Kycsw8rD7q5GfR
	oymnzuGomKZ1NNOyPKBkBA2S812BlO9dtvSZ/WB9bT9vFTd1glvvC8FpKl+xuzXZh+vzToG1+yw
	iLJOBqxLNqU3ouwGKcykmqSnGDl/7JlT4EYTnYieY2He2QTT44/a7NlcjYVDymslfU+dStS3eiB
	2SlMQX//prelAZfWH1/oy+4JDlSeRkdfT1qkSPiE/1dWkUJLajyM1Ujuubjfklc7NzPps1nDEq7
	t8tf9LGq+p5kqx6IpzHQ0j5dVv+LZfvWFxiyrixZz6CD5F9M+xTxGMRWpSi8rv+Z0Ii1q8wfj+9
	6w=
X-Google-Smtp-Source: AGHT+IF1KnzP5hv59bEGBfcW2SLBgBDAUTPAzrmLeJLVMz/Jv2S+h8RWMKliSLm83qLgLffduzk5zg==
X-Received: by 2002:a05:6000:608:b0:42b:4219:269 with SMTP id ffacd0b85a97d-42f89f48476mr8045946f8f.41.1765182911711;
        Mon, 08 Dec 2025 00:35:11 -0800 (PST)
Message-ID: <bd53bc18-f2b5-4857-b06c-2674c799ff0f@suse.com>
Date: Mon, 8 Dec 2025 09:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251205193411.1368659-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 20:34, Grygorii Strashko wrote:
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -39,11 +39,23 @@ config COVERAGE
>  	bool "Code coverage support"
>  	depends on SYSCTL && !LIVEPATCH
>  	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
> +	select RELAX_INIT_CHECK
> +	select DO_NOT_FREE_INIT_MEMORY
>  	help
>  	  Enable code coverage support.
>  
>  	  If unsure, say N here.
>  
> +config RELAX_INIT_CHECK
> +    bool
> +    help
> +      Relax strict check for .init sections only in %.init.o files.
> +
> +config DO_NOT_FREE_INIT_MEMORY
> +    bool
> +    help
> +      Prevent freeing of .init sections at the end of Xen boot.
> +
>  config CONDITION_COVERAGE
>  	bool "Condition coverage support"
>  	depends on COVERAGE && CC_HAS_MCDC

Please obey to the somewhat special indentation rules for Kconfig files.

> @@ -259,6 +259,7 @@ $(obj)/%.o: $(src)/%.S FORCE
>  
>  
>  quiet_cmd_obj_init_o = INIT_O  $@
> +ifneq ($(CONFIG_RELAX_INIT_CHECK),y)
>  define cmd_obj_init_o
>      $(OBJDUMP) -h $< | while read idx name sz rest; do \
>          case "$$name" in \
> @@ -271,6 +272,11 @@ define cmd_obj_init_o
>      done || exit $$?; \
>      $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>  endef
> +else
> +define cmd_obj_init_o
> +    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
> +endef
> +endif

If the objcopy indeed needs suppressing altogether (as Andrew suggests), the
unwanted redundancy here would go away anyway. Otherwise my (recurring)
request to avoid such duplication.

> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -5,7 +5,6 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>  # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
>  ifneq ($(CONFIG_OVERLAY_DTB),y)
>  OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
> -nocov-y += libfdt.o
>  endif
>  
>  obj-y += libfdt.o

Is this sufficient? Don't you first need to replace the custom objcopy use?

Jan

