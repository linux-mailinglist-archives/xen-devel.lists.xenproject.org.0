Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF939875E9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 16:47:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805604.1216754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpl5-000410-9L; Thu, 26 Sep 2024 14:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805604.1216754; Thu, 26 Sep 2024 14:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stpl5-0003xz-6Y; Thu, 26 Sep 2024 14:46:19 +0000
Received: by outflank-mailman (input) for mailman id 805604;
 Thu, 26 Sep 2024 14:46:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stpl3-0003xo-Ox
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 14:46:17 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1532ea2a-7c16-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 16:46:16 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso1190701a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 07:46:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88240a38asm20308a12.22.2024.09.26.07.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 07:46:15 -0700 (PDT)
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
X-Inumbo-ID: 1532ea2a-7c16-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727361975; x=1727966775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zaoJuWFXsqlWbfLoRdKYUSRsbbAnEvHNJIkAI3VB2AA=;
        b=MmoPd9c+CI3BtWuJRboLvPNPjvZEDry6DBn5kgi4Xzg2dmswnhEV7ygWY/lBXSyzGK
         q4ofAlCNGp8hsbAOQknQDxuDpq3+eXkc41XhrF5Iu3Xjx6YFRQ/O3M2PuWuci+lMqm0s
         CFZ4joI9nxS5fCwyzz97kvf+h2R3kDQYe0bOJ6dm7niawlz2CkktRXXahKeyJgjd4Kka
         7Wt8XHrwoFiC9ettuL2enVUKF4UyxVPqY4B6RaiU3TCTaSFEJo3f+JYGaEi/lftE6vWU
         /Qk/KE8qxKKd2//n8lxv46Q5jyf1T7dg/svD6ekYs4EPbQdysjuzqsK+YTRWa5cFU7dl
         dQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727361975; x=1727966775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaoJuWFXsqlWbfLoRdKYUSRsbbAnEvHNJIkAI3VB2AA=;
        b=vvVLdZqOFukiP9eepMWBFUaafJ4VkPSaK7zvECPFqV+xZFYhqbfdBcui6EfHgaSEUR
         Tuf1rfGzUDkZMvdxpMTT0BeYGiLZnGB5guZcQ7pp9hiI/g+eVmRGhQY/lscjaGTlLgyp
         YvFiy7JOAGdBA9NOrWdSzpcfiwq79U24fOaRO2+2qyo3D0lqshaEHAWF/d53XNQMx3++
         DM1mteqa1OyPgHtw3FarInWW64oLaUNNf4PFhWiO8YyXi6OqsDCyFi1+QjbAQUxbXMJt
         uUlJjdiHvqCMwfoGgTz5WHlXs/2m5os7DENvfuhGhOM7m+Bb1pI0MmkJfdY5PQcz54bd
         mQsA==
X-Forwarded-Encrypted: i=1; AJvYcCUESIMzKmhTZvoJpXQEseVxwtS12uPzHzqk1k49PYhPX3d1g3vW5kZ0v/apalRHvmDsUqZGJzzVpUU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDwopDAyzJO0ZNBfEcs1ThvHq4/newR7fgpLAdGNoep9e0Gw7y
	4xROJ20R2rrt+EmMwrF7saFRkWliX44KVYvC0JYbBhFEU93NKTT2fIkZWHY07w==
X-Google-Smtp-Source: AGHT+IGuyWwLWEQTK7QuuQ/Mc++lhWOCXOMARGvJf9carSJehpQh6kRuddUOeMCzcPcwgntq0+bTuA==
X-Received: by 2002:a05:6402:518d:b0:5c8:7a0b:2852 with SMTP id 4fb4d7f45d1cf-5c87a0b2a1emr1473100a12.11.1727361975323;
        Thu, 26 Sep 2024 07:46:15 -0700 (PDT)
Message-ID: <63129694-ace9-4b55-92c2-7cfb8a2c1386@suse.com>
Date: Thu, 26 Sep 2024 16:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/video: Convert source files to UTF-8
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240926134823.688372-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240926134823.688372-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.09.2024 15:48, Frediano Ziglio wrote:
> --- a/xen/drivers/video/font_8x14.c
> +++ b/xen/drivers/video/font_8x14.c
> @@ -2059,7 +2059,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
>      0x00, /* 00000000 */
>      0x00, /* 00000000 */
>  
> -    /* 128 0x80 'Ÿˆ */
> +    /* 128 0x80 'ÂŸÂˆ */

I'm unconvinced this representation is any better. The data that follows
right here clearly means 'Ç', not 'Ÿ'. Which is U+00c7, not U+0080. I
don't have my Unicode manual to hand, but I seem to vaguely recall that
U+0080 doesn't really have a glyph associated with it.

Of course I'm also uncertain whether my mail UI actually correctly decoded
the transfer encoding (base64) that you now used. In any event I'm unsure
of associating the upper 128 code points with any particular characters
(glyphs). We don't render UTF-8 to the console, and what those code points
mean is unknown until code page information is provided. I see the
following options:
1) The glyphs represent what the bit patterns encode, encoded as UTF-8.
2) The glyphs are simply omitted for the upper half of the range.
3) We purge any encoding of particular glyphs for the upper half of the
   range and instead expand the upper 128 entries to some placeholders
   when rendering (like e.g. the Windows font I'm looking at, using a
   boxed question mark).

Jan

