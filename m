Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E1C640D0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163668.1490753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyMt-0003Bc-5u; Mon, 17 Nov 2025 12:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163668.1490753; Mon, 17 Nov 2025 12:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyMt-00038Y-2E; Mon, 17 Nov 2025 12:30:03 +0000
Received: by outflank-mailman (input) for mailman id 1163668;
 Mon, 17 Nov 2025 12:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKyMr-0002nL-22
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:30:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 225bbd08-c3b1-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 13:30:00 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so663809666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:30:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734ff75e4fsm1070289666b.12.2025.11.17.04.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:29:58 -0800 (PST)
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
X-Inumbo-ID: 225bbd08-c3b1-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763382600; x=1763987400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gocl5TiaGmVKnsy/ZmqGIMk6DmOfHv76xIlys1CiaYs=;
        b=U6YXOYB3uRaQIrYQeTTpOQIGST6Px0Z5ii7de+e++8eOWwIUooFr0/HHeyiYpjdMl/
         pNpLbnqQUI6b4mKbrJ6Vzs77/6aEZbr9+RJ+0Gh0pzGRHJ/2wdeLIW6cqmObo7UVAT+C
         +ElJfaGcdXzylDBTG99DUeIjTX4OKxdO5Ah5UZh5BAgNwver6BgOrXVCfjHZWEK45CNY
         l8+KeOB/TpcywHs16kJMFXmVUYpMBwRr3lGMWkiHaFg/zlM+Q0D/5hxjixbXnt7yAvFg
         w6QD7fVtVUnzwoHA4ata0xjpyTW2LsMFsGqyJ6mG3fXr5BwrL1vzMLLGfDndRQLkoBgi
         shzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763382600; x=1763987400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gocl5TiaGmVKnsy/ZmqGIMk6DmOfHv76xIlys1CiaYs=;
        b=Ygdp3MbGVhyXSmP/fJytIVueC/4/twvLmATWwhLgD3smJ6SEnMwr6GanLB+4zKB+4r
         fGlyhKqhAiFQkGTFbK6tv2HXmedzPW0Bh5EgedIAzqLIjr0XxDsuUwEIZoNjytEX/ZtL
         0F1hNjGINfM2r/stQMtwFSEvcuusvZYe213Uvy4O60xKp2pC4etzNspdMLeB6R+CSw0z
         b/N+BHqSbgwYLcDz2J/j/Pt6J2LvlM+PGQrwSfKJnh3XsCj9nsnguC6WJXUVkpx41+s8
         6n9ks58KudHYzpuOV+4+6fhN98xqyzmbzq/3ajVBixuxAhw9C81jCOk1SdlOuTRElEry
         wMpw==
X-Forwarded-Encrypted: i=1; AJvYcCU6mkW5/RZvgejbppCZONYBjOAyupwNIA+mn8/dK1jQtnPz9O63oMRgkYtWtZ+2IvDWg36TypbvhtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVQEN+1smNPqVoM4rzCeDgkpjh8NimimT5/RvXz0CaR/PCsfis
	jICTV2LIs8Uxh6BDJxMAmuSRnh0SdF6ztA0IUO3IXqEVBT7OGaa4RTI9jQV094VwzQ==
X-Gm-Gg: ASbGnctL3m86XrmAWTBRV7nV0/awxckRa0ZYnm+JTR9enHaCdSG+7FrlXi5R0Z5XAFJ
	rYIN2Zy5b/nnwrlAdEo3cfMImhvhkZtYab9vcIPql8AVRd2BwQMbARY/AAior7/i5q1Tto4Xg9A
	czo635FHThk0WR0i9UZTY/ui4sGTx0WiXsiL2Po/tvrbG2ZIBPzO1DPHvK2/v17mPXZl/Z6xAGo
	suUt/9jq4JFl1dWbiqGyNjIRDuH5EZohE2/NBaKMVMp0E8z3ib3EDfMQLawec8C1iRfJ3h77QdC
	rRdYR9uNsd5Evk1SDOZCA5dGsexG6edDaqTvniv6H53U2nCq7pHG7soGo2Dbl/OR29AHr8MBqND
	iqm86dhCBEp5zmc6u1VgtvzonQaGTUNUL9rTSxqAbseeE2ojsATwNhnUvRxTSmWd+CMo2kx5NC6
	PkUNBjgUwgWk7DR3ft0idLyMeBRyWTBtyAuGnTuRSmgpiN82Q5Ppg0EliSnwnqKyPvNSY5/CGB1
	oJVQfYE2dhG2w==
X-Google-Smtp-Source: AGHT+IGhgcNMegrL2eJx0cCps9Vs7uEPKF96I26sQPHNgOR1Oi8MhdBoboPN6YZrAvv9LPXd5XMLYQ==
X-Received: by 2002:a17:907:6d15:b0:b4b:dd7e:65f2 with SMTP id a640c23a62f3a-b7367828df9mr1371258866b.5.1763382599505;
        Mon, 17 Nov 2025 04:29:59 -0800 (PST)
Message-ID: <936632a3-d713-4183-b1db-5a554b617b74@suse.com>
Date: Mon, 17 Nov 2025 13:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
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
In-Reply-To: <20251114113238.9279-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2025 12:32, Juergen Gross wrote:
> Add a new make macro for creating <file> from <file>.in at build
> time. To be used like this:
> 
> $(foreach file,$(IN_FILES),$(eval $(call apply-build-vars,$(file))))
> 
> This can be used instead of the current approach to perform the similar
> step for file.in during ./configure.
> 
> This will avoid having to run ./configure just because of modifying a
> file depending on a variable set by configure.
> 
> Prepare to have multiple files as source for the replacement patterns.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - don't use pattern rule, but create explicit dependency in macro,
>   don't require to rename source files (Jan Beulich, Andrew Cooper)
> ---
>  Config.mk | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Config.mk b/Config.mk
> index e1556dfbfa..d21d67945a 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -159,6 +159,19 @@ define move-if-changed
>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>  endef
>  
> +PATH_FILES := Paths
> +INC_FILES := $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
> +
> +include $(INC_FILES)

Is any of the above part of introducing the macro? "Paths" is already a
specific case of holding patterns that want replacing. In turn ...

> +BUILD_MAKE_VARS := $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).mk.in))

... it's not quite clear to me how it can be $(PATH_FILES) here.

> +# Replace @xxx@ markers in $(1).in with $(xxx) variable contents, write to $(1)
> +define apply-build-vars
> + $(1): $(1).in

This being indented by a space looks a little unusual.

Jan

> +	sed $$(foreach v, $$(BUILD_MAKE_VARS), -e 's#@$$(v)@#$$($$(v))#g') <$$< >$$@
> +endef
> +
>  CFLAGS += -fno-strict-aliasing
>  
>  CFLAGS += -std=gnu99


