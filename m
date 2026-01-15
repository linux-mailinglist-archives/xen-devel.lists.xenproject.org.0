Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF1ED237C2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204461.1519111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJcN-0006Tj-NH; Thu, 15 Jan 2026 09:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204461.1519111; Thu, 15 Jan 2026 09:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJcN-0006RY-Ki; Thu, 15 Jan 2026 09:26:15 +0000
Received: by outflank-mailman (input) for mailman id 1204461;
 Thu, 15 Jan 2026 09:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgJcL-0006RS-SM
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:26:13 +0000
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aee1811-f1f4-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 10:26:11 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so523436f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:26:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-434af653576sm4880524f8f.17.2026.01.15.01.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:26:10 -0800 (PST)
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
X-Inumbo-ID: 3aee1811-f1f4-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768469171; x=1769073971; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cVX8I+QMYPBxGP8lOvP8ShcblrEkJtFKFsIG5peRypo=;
        b=Zod8JCgoIsfJhahsWkVNPOaSLcZBN1JrjTwiHkCNC0L4CyvF2grK0fSiTGdp1A+fOe
         BZOB1ah8mPhpEe68yrdnc0ID/ml39X3+4RbfW7+HbzZ61Lx5I/HNv80kJUhd9rUIqMtY
         /N2FdvISamXnW3be+XpvL9U//hkacKyNq1pTpEQGm5IjxF35beNNwQlrRecc09CU0WqA
         ZrPfvO2yBb6/7ZwxI/afDP9K+yjpZAjrAFOrX/w8PlUj/RZIHqOYB52uSuotpZEcRxxZ
         1iD7OGXz3Wb59Iyq4nO+lrvbXwMPJuIjXV5O4RSOnc+d90cdQyLL9lpCdhyn37WYbaDZ
         fVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469171; x=1769073971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVX8I+QMYPBxGP8lOvP8ShcblrEkJtFKFsIG5peRypo=;
        b=UX1vQf9qrSjIhoPViYWtwd10hhv39gdVFGyfnMif/gjxlV1od1TlcVOABBdn7LgFoM
         FKaATX+ge9go7hxhuAks29Jv7y9YPeiIkWRJGpH1WjKwUo48IwV7h0DqBHhAnMkChLMi
         kydewV3QHyv93KGdeIE70gZ5WutrzklVSXbpZ7yceWcSU+9j6JwHrIKzwRYNFoY2XdvY
         GFr3/ULoBdJef7fSKFnz857nQdETQjWV8x8W8BRIMYAZEOPOfnvxn3bZRQ4HIouxNtCL
         /aYNokszWftuAWWNhPx2jIMQLxgEwoX4D9xMYPcJbn10GtU8lp8MoT9CMWyQiZiU8EMf
         cPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxb122wJhUM1FYaAbmVJlT5I82WqDf/nYdvQTnxULzE7hlcLIY/tbAfivvcUSXViU9gHWroGlooO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNELoIHE22etMUl82pykudXlUIyMnNYM/psAA9Bi2yM7KDBihX
	lWt+ZV8L+ycenyvksu1l5g5ZHuGdiSdB0W8qn2d5JjEtvD1lCpdu1FHs1k1VU13jPg==
X-Gm-Gg: AY/fxX45wvKZTwpfbxSuZNeroW6dmE+2K4jTLiuS9aA3msrxhjmW0QE3NfucJEHtcj4
	dOuwSZpWezBAFL6A8rO6sHIQj/kxqIf1gbDtrHlABGrwm5mpJ33G4HrNYE2X/fx0fylIPMaigr3
	oX3MQbBZBb5t60Mt9P8PQXrK9IkxnBgdJklg3ieCEXAUh5E/NuSAYgGE+wJ7VWBxxbkUwj9beOT
	sokzJOY7RXVKjcJSl75xo60OviklRA0AgQBQrSprfUzOUtpGRKf+Rb9ua0rWcb6/wHarLK51J0J
	Wzd+pZaFDxpbJmv8QsE0Ay66gWpIwlUZ8eOGVBWYLHHfWiEPdt6I3K0OqOiRBE48JEmHI+LlgCA
	U4f4XgnnUmmMKoMSmHQuZiA9uncNMHFD8gm09Jba5lWf1I3mRqOEXRcv7q02sW4PC4tjsMuEYyL
	nCMkbVmJQY+7fOGt20CPXAOWeFpQK4W84Ea/gDMGz9anGkVsDaQ2CB7PXmp2cduAxtmg6W+x4Gr
	K8=
X-Received: by 2002:a5d:5f44:0:b0:432:84f9:9803 with SMTP id ffacd0b85a97d-4342c3f1586mr6476803f8f.3.1768469170681;
        Thu, 15 Jan 2026 01:26:10 -0800 (PST)
Message-ID: <bf3e38f1-d88a-445a-b55b-a13d401dba80@suse.com>
Date: Thu, 15 Jan 2026 10:26:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.01.2026 19:29, Oleksii Moisieiev wrote:
> --- /dev/null
> +++ b/xen/lib/arm/Makefile
> @@ -0,0 +1 @@
> +obj-y += memcpy_fromio.o memcpy_toio.o

lib-y please (requiring a change in Arm's arch.mk as well), and each
file on its own line. Plus if this is to be Arm-only (see below), it
really means to live in xen/arch/arm/lib/ - see how xen/lib/x86/ is
about to go away:
https://lists.xen.org/archives/html/xen-devel/2026-01/msg00138.html.

> --- /dev/null
> +++ b/xen/lib/arm/memcpy_fromio.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <asm/io.h>
> +#include <xen/lib/io.h>
> +
> +/*
> + * Use 32-bit raw IO operations for portability across ARM32/ARM64 where
> + * 64-bit accessors may not be atomic and some devices only support 32-bit
> + * aligned accesses.
> + */
> +
> +void memcpy_fromio(void *to, const volatile void __iomem *from,
> +		   size_t count)
> +{
> +	while ( count && (!IS_ALIGNED((unsigned long)from, 4) ||
> +			  !IS_ALIGNED((unsigned long)to, 4)) )

Nit: Xen style indentation (no hard tabs) please throughout.

> +	{
> +		*(uint8_t *)to = __raw_readb(from);
> +		from++;
> +		to++;
> +		count--;
> +	}
> +
> +	while ( count >= 4 )
> +	{
> +		*(uint32_t *)to = __raw_readl(from);
> +		from += 4;
> +		to += 4;
> +		count -= 4;
> +	}
> +
> +	while ( count )
> +	{
> +		*(uint8_t *)to = __raw_readb(from);
> +		from++;
> +		to++;
> +		count--;
> +	}
> +}

Barrier requirements on Arm aren't quite clear to me here: Is it really correct
to use __raw_read{b,w,l}() here, rather than read{b,w,l}()? If it was, wouldn't
a barrier then be needed at the end of the function?

And then, if it was read{b,w,l}() that is to be used here, what about all of
this would then still be Arm-specific? Hmm, I guess the IS_ALIGNED() on "to" is,
but that's Arm32-specific, with Arm64 not needing it? Plus then it's again not
exactly Arm-specific, but specific to all architectures where misaligned
accesses may fault.

Jan

