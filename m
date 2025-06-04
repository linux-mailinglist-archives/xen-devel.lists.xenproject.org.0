Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82969ACD94D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 10:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005192.1384708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjAD-000749-U8; Wed, 04 Jun 2025 08:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005192.1384708; Wed, 04 Jun 2025 08:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMjAD-00072L-Qt; Wed, 04 Jun 2025 08:07:57 +0000
Received: by outflank-mailman (input) for mailman id 1005192;
 Wed, 04 Jun 2025 08:07:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMjAD-00072F-1V
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 08:07:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04c79826-411b-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 10:07:55 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442ea341570so45351415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 01:07:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed4566sm10661082b3a.80.2025.06.04.01.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jun 2025 01:07:53 -0700 (PDT)
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
X-Inumbo-ID: 04c79826-411b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749024474; x=1749629274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LieOTA9FfiY7vHi/zrl88X3f6M26S9qGc7eS+VMX0lg=;
        b=OJMJwQS6DTb9KFutsXHpwLP+jNa7nPuewKN/Jc+yBXGZY7+/4/W2YEkxXgpHYMGD0f
         mawpMDriuoihgC2iiuZMcc6qii0akt7MComjxRQ6+Dy3q9Gl1nM9FVKR91k4J6SvRRAD
         G56c3wvmsXD1Kf+yjfQxXyTxPTl+fxUZ6tN3u7kKSpb2mqO53TtUrtLXyumeoj6jGiq8
         2kLeHGfYh3I7n0pTeQmzKB2fdMPNpGaVhnoW4Dho1/rKUKsWgUpEwDSznUxMG2JQXxWb
         lw4vOGaGN3xjD05T7gA2IgP+1zICzv1pIoxeeSoWuDNZG9YyE0Q3ZXIF9nJRxXXMAlEd
         kwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024474; x=1749629274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LieOTA9FfiY7vHi/zrl88X3f6M26S9qGc7eS+VMX0lg=;
        b=BjctsfoHkGkzJ7HJr8BQd3rwWzfRi8ADsYmRSoAGR91AyYUap3BkPv8C5wk6JO6QIX
         fu4S2DY+jCrYp9FJ75XpxTYsu6fLEOgpnQ62eLsuFMdMG6LOA2ddkxQmm/wrzkxOqqRc
         a64yTSV+Nzc44V4qRak2/vE2OWMj0U/qUnOl6vipsp3upeoxjnvbOfbslSnsj3CLLNrQ
         OsmVxIhgDpX1NRo/y1E2qNhmjfJ3tFIvTAWGnKi26tNOfr7J/ovAi6C6OQSsYEdhPGZp
         IoJsrqkMxx8wklg5NSgn4hrjSYjpYBk/YXYfKA0NfGc/HH0cs2qcxt93mvZrUvC+DGJh
         LYng==
X-Forwarded-Encrypted: i=1; AJvYcCVtnJpOoC6J78drm1msqUDpp7CIpEADULtC381vaX+WxLrkGyqAy61k8xgnA7GjLHFvRczOupD9f9U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0beCDURKzH3lFwLav2MK+eq6CMHehlFmd7uDhCfu7136ELW3W
	ApGso87AGZ7wJKbPtG6ZvrWTzFTTanIBp8POvREhYcT+H3Kz7HNrmf43SyMBZvWuNg==
X-Gm-Gg: ASbGncuyS6LS4DkgTUfA31IhokFafbEUeN8gVjhv0U+mQ2W1lKOXKCha/DsmFdnNvMN
	JGz6g4PEkwZr5cCAya/ukUUQfkA6ZzgTwr2dNyreJH0Ck2esInVvquXqbrWHOdJfnAItGeOCCiu
	fpCAahv45H0Lbp91AuA01RyvDy+Q64RIzUymc1TSpu2m+2em69kuYY4s219sliAPmW2tCSLVlMD
	achZbAB8fFndFPiQrzB6aiMT8t5zmgr71dMTHNKxqdzTHgvu5AwlRDNkDlD7wz8ohNCoShYHqDF
	crJYkAwgwLvi+X/EI2claciFS/ajnwv3ZyX+6dLzGX6ZmiX9QRGP+9xbi6enjdWRpSviWVIU5+U
	34A+TmIZHaxO8XlrBEGYcGBTYJE0NJRIQi78yX3aAzzNicR4=
X-Google-Smtp-Source: AGHT+IFPlLzhL7zpk4RRgRhoF5OJP5moBTZIMCiHuVjSUvw5+V62ROjnmRfT11TxDGnOld77BAQKdw==
X-Received: by 2002:a5d:5f48:0:b0:3a4:ead4:5ea4 with SMTP id ffacd0b85a97d-3a51d930f6cmr1452485f8f.24.1749024474348;
        Wed, 04 Jun 2025 01:07:54 -0700 (PDT)
Message-ID: <d8fc3301-30b9-48bd-9832-b4fc18828a0c@suse.com>
Date: Wed, 4 Jun 2025 10:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Michal Orzel <michal.orzel@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250604072128.16628-1-michal.orzel@amd.com>
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
In-Reply-To: <20250604072128.16628-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2025 09:21, Michal Orzel wrote:
> When cross-compiling, HOSTCC can be different than CC.

I'm sorry for being pedantic, but the two can also be different for other
reasons (and I'd like to avoid this becoming a bad precedent, then getting
copied elsewhere). Both may target the same architecture. Hence I'd like
to suggest ...

> With the recent
> `install` rule addition, this would put a binary of a wrong format in
> the destdir (e.g. building tests on x86 host for Arm target).
> 
> Take the opportunity to adjust the `run` rule to only run the test if
> HOSTCC is CC, else print a warning message.
> 
> Fixes: 96a587a05736 ("tools/tests: Add install target for vPCI")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
>  - change Fixes tag
>  - add `run` rule adjustment from Roger
> ---
>  tools/tests/vpci/Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/tests/vpci/Makefile b/tools/tests/vpci/Makefile
> index 9450f7593a41..f2226a5543bc 100644
> --- a/tools/tests/vpci/Makefile
> +++ b/tools/tests/vpci/Makefile
> @@ -8,10 +8,14 @@ all: $(TARGET)
>  
>  .PHONY: run
>  run: $(TARGET)
> +ifeq ($(CC),$(HOSTCC))
>  	./$(TARGET)
> +else
> +	$(warning HOSTCC != CC, cannot run test)

... s/cannot/will not/ here. Alternatively, -dumpmachine output of both
could be compared, yet even that would leave us with false negatives
(e.g. x86_64-suse-linux vs x86_64-pc-linux-gnu as I can see for my
system compiler vs the ones I built myself).

Jan

> +endif
>  
>  $(TARGET): vpci.c vpci.h list.h main.c emul.h
> -	$(HOSTCC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
> +	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>  
>  .PHONY: clean
>  clean:


