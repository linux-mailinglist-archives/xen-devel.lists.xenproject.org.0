Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C692B9FD532
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2024 15:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863433.1274850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tRBJ8-0005KQ-4e; Fri, 27 Dec 2024 14:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863433.1274850; Fri, 27 Dec 2024 14:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tRBJ8-0005IK-1G; Fri, 27 Dec 2024 14:27:18 +0000
Received: by outflank-mailman (input) for mailman id 863433;
 Fri, 27 Dec 2024 14:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tRBJ5-0005IE-Vl
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2024 14:27:15 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9b7699e-c45e-11ef-99a3-01e77a169b0f;
 Fri, 27 Dec 2024 15:27:12 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso3357943f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2024 06:27:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a412f778esm7175399f8f.4.2024.12.27.06.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 06:27:11 -0800 (PST)
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
X-Inumbo-ID: a9b7699e-c45e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735309632; x=1735914432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BK+vgjvSDgpccyofTB5YeJUtbMDWpp/knxY+zLZnRZo=;
        b=A2Rm3PTUJnWHNm+2/FOJuwRzonTn53y7M0z1Xt1J2rI5Yh8Oaxuzkotv9uJrgwGUyJ
         rFPhypvfZieL47+p0BduV3X7tJJRcOr1HID4i9dx9EKpX5uYz5v1mGwTQUhtqswGQ2iM
         +uSyAhF4SX9W40jU2R4IfLyJfNtYXkLBJULAWYgssclVAkc449m1BHTUREv9G2yMtKp2
         e8nZFfgS/b/t5pslQxANlnv1OGXD3CiWBOTseunkkvYycQlxOOzxcxMz4YIiepn5kiZF
         IlH4odJ6kP1iy3eGhVgS+vJ1iuYjCP7FAEI4r7EeHVqr2UEMMFWX/qMLvLGibvyTJDoE
         gvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735309632; x=1735914432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BK+vgjvSDgpccyofTB5YeJUtbMDWpp/knxY+zLZnRZo=;
        b=uJX350zlWMFXdRsKhgzu848llpey7ShHq8HMqpHQnkHhMYRsDYg8dwEWyfM6HVog5V
         F6dsPfE7vJYcrA/HTrLItjD2+HLK0w37ZDPx7phPIpBj2ZjFggz60kRZBtfiJIhHNx9K
         zAQE+0WIklk6dsqW2d9DgB9Ov1zuxLsRfFM2JOXJ99YeccD2HOJ2JjmKgD3G7Y2kSfZC
         70pCrBbTJOyRISFLvLYmfuUttw9LN41mE1OPXQVPwi/mKdEOMwA7UirxbMs8uLbfOAlk
         pYvhLbuq+e74gHpYCF1DSiFy0ZIiVAXEyQMcxfSYoH8gb9wqy7AXG0O0nWChGWQQ7RIg
         D3rg==
X-Forwarded-Encrypted: i=1; AJvYcCUrtq4NcxekVvGLcn1U3cspZvJa7s5rdR6HdJoGB2Gkvfem7z3wR0gDTR4b55VKuCoUwc6l4QgG07c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxW1DIC79vuO7IbMIzK/tyM2BFvVBlYXswk1hAzfimK0Uus1iYr
	7MyAFgKiqaHwim4k+icTmPBsr4kKzsUxTJ1gLlE5Ax6PMZmKyKSSZU9U4g6dgw==
X-Gm-Gg: ASbGncsfkcG8xOWnhh4P1JbSVf0rp9tWSsKp/C0rZfKShBeXMjDC0OI31OOy0Tvhrrk
	kH2YKJkA8HtcttGlk7jkpiN9HeiUjYlCEyHK7lhvi38SdjlhiSAR160b6h+ZKoxpSCFpERUP+ly
	3Ss99LmPWV/DyvnITZFP1EFvHSrLuG8MaktMoXuuiLBLARO2GR+4tN3SVWDZw58BS1EEiq5pkah
	36AewATzuMQpT24cZgt+emUwvxJukV58bweI+RXI3mGFCSxFH4lOLIMXSebx6wdE09Ixxo3K4wK
	KniHDvWQPXUKbt0s5AtQ5m3arLTx9G/aD5hGFZAl2Q==
X-Google-Smtp-Source: AGHT+IFiNAXKez1faEYIXGDL18sVjFN/hLRyX3OJ2TAqTGLUg4jnHXRM8VvDgfkLaom2JPiyQmAglQ==
X-Received: by 2002:adf:b511:0:b0:38a:372b:ff2c with SMTP id ffacd0b85a97d-38a372bff53mr8533514f8f.17.1735309632065;
        Fri, 27 Dec 2024 06:27:12 -0800 (PST)
Message-ID: <65903263-efd3-48a3-8e71-909afaf0b6d6@suse.com>
Date: Fri, 27 Dec 2024 15:27:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] libacpi/Makefile: clear ASL warning about PCI0
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20241222161444.1558599-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241222161444.1558599-2-Ariel.Otilibili-Anieli@eurecom.fr>
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
In-Reply-To: <20241222161444.1558599-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2024 17:10, Ariel Otilibili wrote:
> iasl has one ID per warning [6]; subsequent commits will address other ASL warnings.
> 
> ```
> $ awk 'NR>533 && NR<556 {print NR ":" $0}' source/compiler/aslmethod.c
> 534:    case PARSEOP_DEVICE:
> 535:
> 536:        /* Check usage of _HID and _ADR objects */
> 537:
> 538:        HidExists = ApFindNameInDeviceTree (METHOD_NAME__HID, Op);
> 539:        AdrExists = ApFindNameInDeviceTree (METHOD_NAME__ADR, Op);
> 540:
> 541:        if (!HidExists && !AdrExists)
> 542:        {
> 543:            AslError (ASL_ERROR, ASL_MSG_MISSING_DEPENDENCY, Op,
> 544:                "Device object requires a _HID or _ADR");
> 545:        }
> 546:        else if (HidExists && AdrExists)
> 547:        {
> 548:            /*
> 549:             * According to the ACPI spec, "A device object must contain
> 550:             * either an _HID object or an _ADR object, but should not contain
> 551:             * both".
> 552:             */
> 553:            AslError (ASL_WARNING, ASL_MSG_MULTIPLE_TYPES, Op,
> 554:                "Device object requires either a _HID or _ADR, but not both");
> 555:        }
> 
> $ awk 'NR>188 && NR<206 || NR==432 || /ASL_MSG_MULTIPLE_TYPES/ {print NR ":" $0}' source/compiler/aslmessages.h
> 189:/*
> 190: * Values (message IDs) for all compiler messages. There are currently
> 191: * three distinct blocks of error messages (so that they can be expanded
> 192: * individually):
> 193: *      Main ASL compiler
> 194: *      Data Table compiler
> 195: *      Preprocessor
> 196: *
> 197: * NOTE1: This list must match the tables of message strings in the file
> 198: * aslmessages.c exactly.
> 199: *
> 200: * NOTE2: With the introduction of the -vw option to disable specific
> 201: * messages, new messages should only be added to the end of these
> 202: * lists, so that values for existing messages are not disturbed.
> 203: */
> 204:typedef enum
> 205:{
> 280:    ASL_MSG_MULTIPLE_TYPES,
> 432:} ASL_MESSAGE_IDS;

From this I can't conclude that the same message ID (ASL_MSG_MULTIPLE_TYPES
here) can't (in principle) be used in multiple places, for similar purposes.
Pretty certainly we want to avoid disabling unrelated warnings elsewhere
(including ones only to be surfaced by future versions of iasl).

> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -21,6 +21,8 @@ H_SRC += $(addprefix $(ACPI_BUILD_DIR)/, ssdt_tpm.h ssdt_tpm2.h ssdt_laptop_slat
>  MKDSDT_CFLAGS-$(CONFIG_ARM_64) = -DCONFIG_ARM_64
>  MKDSDT_CFLAGS-$(CONFIG_X86) = -DCONFIG_X86
>  
> +IASL_WARNS=3073

If we were to go this route, the variable name better would make clear that
this is a list of warnings to be disabled.

And then instead of ...

> @@ -32,7 +34,7 @@ TMP_SUFFIX	= tmp
>  all: $(C_SRC) $(H_SRC)
>  
>  $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl
> -	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
> +	$(IASL) $(IASL_WARNS:%=-vw%) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
>  	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@
>  	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
>   
> @@ -65,7 +67,7 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_arm.asl: $(MK_DSDT)
>  	mv -f $@.$(TMP_SUFFIX) $@
>  
>  $(C_SRC): $(ACPI_BUILD_DIR)/%.c: $(ACPI_BUILD_DIR)/%.asl
> -	$(IASL) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
> +	$(IASL) $(IASL_WARNS:%=-vw%) -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
>  	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex > $@.$(TMP_SUFFIX)
>  	echo "int $*_len=sizeof($*);" >> $@.$(TMP_SUFFIX)
>  	mv -f $@.$(TMP_SUFFIX) $@

... continuing to need to alter two places, I guess we'd be better off
introducing IASL_FLAGS or some such, where the -vs then could also go.

Jan

