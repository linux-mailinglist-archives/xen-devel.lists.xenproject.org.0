Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7A5CD60BA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 13:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192083.1511432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXfO5-00058c-GG; Mon, 22 Dec 2025 12:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192083.1511432; Mon, 22 Dec 2025 12:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXfO5-000570-DK; Mon, 22 Dec 2025 12:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1192083;
 Mon, 22 Dec 2025 12:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXfO3-000569-Jg
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 12:51:43 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63a0d57-df34-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 13:51:41 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42e33956e76so1452414f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 04:51:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4325dbc522esm11184995f8f.11.2025.12.22.04.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 04:51:40 -0800 (PST)
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
X-Inumbo-ID: f63a0d57-df34-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766407901; x=1767012701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n3OD+bwAin0vzopokKROaodSWCLiZhEzXg2sOIsrxjU=;
        b=eDQZbCXS/3deBURv3MnrCEQsn+OmW+CbQqILJvevnnExpbuJJLI0q7TGRgzGfv4REM
         FEx5MJFf560sMFgLapSA5YD2AILcsgWQy17bpwNdorRK31E8J3Z6637ubsNFT6idcn8q
         dTQtTkPfV0zkrWIJ3BYayiximApG25tDonTdRScbripnRmToWuAVlSwkZ+Hmp4INe0py
         l1eObcf6xxpq86JBifm/mV9sgnRupaSYXhcpmxO69yonK+76+8P+7DzuWctAWVMNkMfU
         UAwVN+NfNnDKiXkUuK+PQhYzJ2OrvsjUN4FEIqpnPbPCoLbln6Mn/y8x3AXgDDSsbgGf
         pyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766407901; x=1767012701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3OD+bwAin0vzopokKROaodSWCLiZhEzXg2sOIsrxjU=;
        b=K46+NTr4VCBhhJdfiN8WtNU24IoTaIJ76Sluc1x55/ESL1DxyC8/jfEQGNgJjXDjFu
         fahwbcvBpiwEGKmhiYY4AkUi3WnqYCUy2u/JogZmu342A4hfZzCINq712Uqvi5qY45H8
         FXogeJNqOeC9vSY7d0/bzjMOVPFAa6Zv5dL+9QRQYIyo9jJQqLVkCCB92UhVyqWpAcvb
         zxBY6WrCo3ZTSal3f00/3B8q2J2pwRa1FxGNQ5voJ0lYkdrMkQI6XHxJtmXMp0iet3Kg
         WjEbcEV0sHyScZTk9aRc2EtX1XpDXy5lx3/W6DdLy8EfnWAHUWFEffV6/tyvq9w1dc+r
         5zYg==
X-Forwarded-Encrypted: i=1; AJvYcCUhndo3YLsZUAxtzXH2z1Ln1RVj/nlLcRXULnO6HaAnAEm+/hIrHtwEKb+1mMu75JlBSUL/fIF5nTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7s+CBhzapqRf23gotbFqkRJ8SmVob7bAqFGGrIyBLO0YRiwys
	AjtGQHD8RX8ZKC4ibjQlOAXJDxMf79NxVb0f8lCKciXhjCdI7YWo9TsKtFkr0VvkPw==
X-Gm-Gg: AY/fxX7XbGOzqg46z4nchlvz9sXARKUKQkmgep04i+qe3InefxIvLK35NoXhh1FohDo
	EBziGfv2JzW7RDRUc3EU5CQTSLIwSpx+r/OIXZABmKck4DPKkrTfiY04HdVX7Oiew89xzL3tCBv
	qhnAurIA0NWfubx0bsY2D4i6+FkqQVjW1MVb72GK491akDiEHIphwc+F/aTecfvFHGWPfzl4wmY
	AcM7f0OJnBheusXIZ967EsL0ITrWlhIK6aNFsaJlnHn/+HJvifKKvahLoNN+a0vt9/oNY5/Jd9J
	eBwXDjqtTUqY8EGkCnTB/9fuMO8lW2a0z9n8zHMMWnKK9SLxl7Xp6CSDSeYfLIk6zfXBnA3msmA
	EigunlJ09QBEySjfoo3sTMs6yD2SsQtMdsuFe4vqx0t9/NilAfSx8tnW1IZdeRkCic76fU8eJDZ
	83uIm8CjwcftcRgJ7wQMLUcpmeNOlaVVcqaAm5ZCYSzNJzMGh7Lq1+VfrlMaMV57BcdlpUcGefh
	/8=
X-Google-Smtp-Source: AGHT+IH3U4fd+YoBi45sYQ+Uu3aQEpfOQ6Fd5/YdzuWxv47BMGZEsqVokaZIRCgOLPPFGymQvsUdaQ==
X-Received: by 2002:a05:6000:12c9:b0:431:104:6db7 with SMTP id ffacd0b85a97d-4324e4d012fmr10543772f8f.26.1766407900595;
        Mon, 22 Dec 2025 04:51:40 -0800 (PST)
Message-ID: <5b0950d6-b321-410b-b3fa-2ce6031fe46d@suse.com>
Date: Mon, 22 Dec 2025 13:51:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251218151530.249065-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251218151530.249065-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2025 16:15, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Extend coverage support on .init and lib code.
> 
> To enable coverage support on .init code the gcc special
> section should stay in memory after Xen boot when COVERAGE=y.

What is "the gcc special section" here, and ...

> So, add hidden Kconfig option RELAX_INIT_CHECK "Relax strict check for
> .init sections only in %.init.o files", which is selected when COVERAGE=y
> and allows to bypass strict check for .init sections only in %.init.o
> files.

... why / how would this mechanism get in the way?

> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -33,11 +33,15 @@ cov-cflags-y :=
>  nocov-y :=
>  noubsan-y :=
>  
> +# when coverage is enabled the gcc special section should stay in memory
> +# after Xen boot

Nit: Comment style (./CODING_STYLE applies to Makefile-s equally in this
regard).

> +ifneq ($(CONFIG_COVERAGE),y)
>  SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>                                              $(foreach w,1 2 4, \
>                                                          rodata.str$(w).$(a)) \
>                                              rodata.cst$(a)) \
>                           $(foreach r,rel rel.ro,data.$(r).local)
> +endif
>  
>  # The filename build.mk has precedence over Makefile
>  include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
> @@ -146,10 +150,9 @@ endif
>  $(call cc-option-add,cov-cflags-$(CONFIG_COVERAGE),CC,-fprofile-update=atomic)
>  
>  # Reset cov-cflags-y in cases where an objects has another one as prerequisite
> -$(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> -    cov-cflags-y :=
> +$(nocov-y) $(extra-y): cov-cflags-y :=
>  
> -$(non-init-objects): _c_flags += $(cov-cflags-y)
> +$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y): _c_flags += $(cov-cflags-y)
>  
>  ifeq ($(CONFIG_UBSAN),y)
>  # Any -fno-sanitize= options need to come after any -fsanitize= options
> @@ -259,8 +262,8 @@ $(obj)/%.o: $(src)/%.S FORCE
>  	$(call if_changed_dep,cc_o_S)
>  
>  
> -quiet_cmd_obj_init_o = INIT_O  $@
> -define cmd_obj_init_o
> +quiet_cmd_obj_init_check = INIT_C  $@
> +define cmd_obj_init_check
>      $(OBJDUMP) -h $< | while read idx name sz rest; do \
>          case "$$name" in \
>          .*.local) ;; \
> @@ -269,12 +272,17 @@ define cmd_obj_init_o
>              echo "Error: size of $<:$$name is 0x$$sz" >&2; \
>              exit $$(expr $$idx + 1);; \
>          esac; \
> -    done || exit $$?; \
> +    done || exit $$?
> +endef

The " || exit $$?" isn't needed anymore when this is the last command?

> +quiet_cmd_obj_init_objcopy = INIT_O  $@
> +define cmd_obj_init_objcopy
>      $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@

What use is this step when $(SPECIAL_DATA_SECTIONS) isn't set at all?

>  endef
>  
>  $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
> -	$(call if_changed,obj_init_o)
> +	$(if $(filter y,$(CONFIG_RELAX_INIT_CHECK)),,$(call if_changed,obj_init_check))
> +	$(call if_changed,obj_init_objcopy)

Feels pretty fragile to do the modifications (as per above - if there were any
in the first place) without first having checked that doing them is actually
(going to be) okay.

Furthermore - why RELAX_INIT_CHECK when you don't really "relax" it, but skip
it altogether?

Jan

