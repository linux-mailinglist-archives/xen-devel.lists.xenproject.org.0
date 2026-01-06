Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BBDCF78E4
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 10:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195935.1513811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3Ub-0001p0-7c; Tue, 06 Jan 2026 09:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195935.1513811; Tue, 06 Jan 2026 09:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd3Ub-0001lq-4i; Tue, 06 Jan 2026 09:36:45 +0000
Received: by outflank-mailman (input) for mailman id 1195935;
 Tue, 06 Jan 2026 09:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd3UZ-0001lk-6m
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 09:36:43 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350c324a-eae3-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 10:36:41 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso7105455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 01:36:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e175csm3434024f8f.14.2026.01.06.01.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 01:36:40 -0800 (PST)
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
X-Inumbo-ID: 350c324a-eae3-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767692201; x=1768297001; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lBXTGRE5HcDeLgIDuPEpao5sCLOV6JQ0v3radDtzHXc=;
        b=PCFYF18BnWKRKmi8jyZsg8JWTIdZUJGRE68jSH+yOPTNLS6jd+i5lbhJJXOVFBPCvL
         haJp7s5eGvEm4eiiktqymqYfWmJH2QBdxNaPmOAAonABDivbN/HFqswxbladrV5uk+y8
         NxV5OX2s81vjNZ2FjFkKlpvDmzrbL0hY+N7U6wTIAAWZtNWj+p8VFJBReiz0XKu5NJCC
         nS+yFclW1tS/+6ASbYU0ut4LUCUkLNBv26ru0WKBmJygN8y27yMX3PLhZWrSNRjdD8xx
         cjwcMeWMA7ThWqgU011RQW88HdxhyKsKCcbLCDOidUgswIh7Pl87HO30ntz9J4xE+jaa
         jv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692201; x=1768297001;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBXTGRE5HcDeLgIDuPEpao5sCLOV6JQ0v3radDtzHXc=;
        b=FYn6dbd9P3CUvWEcEvr52V6pZhCZ1ng0TIxfyFbPia6e8cFuj3mxFnzGI3olnCjf84
         O5hDCvTy/6HVQZ5tzIfTOYvEJOL4UXcDvnZFdLWQ1yHg4KSlt/UXE282iLwFZo68kEPl
         dIVEFsyAxN2RGzg6a5pANcy9aG8NMR1+MGKmlqiImFOZ3U+DBFyW0YHo/FSUufPV5jKe
         ISXyYi9Y6vbFfgDuUtLch9L8xH/S0p64A3mqHBdthWXEGQZYMqsL2dc8i7MzpE97gw2N
         zkeu8w4SKxHNlC7drlSnQwghbSd5uwbRB7dzClxW2ZEYM4DxDoibEdDjgUd5LWRnKSD8
         Ku3A==
X-Forwarded-Encrypted: i=1; AJvYcCVB90+jR5itMdpBtwCBBAOl6fihZ6eJ7PyoFVIo3M2F7jFqbE7HWDNzv0qmsdDHqo8iADpnYzYeb9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDxceRc5qqOJ7L/xJ62C9a+hrquL+MlvuiW5xJbSRAxbBa/lA+
	u55b++ETUhnQpMNLKoLnd/pHP3EVi3igqfCPPNZiRjbPLaOMF+yeSHbUUV7f524KfPmTik7wJvo
	bQWU=
X-Gm-Gg: AY/fxX50B1YGIZcs4NklumApY1uSTzPJVg0am9LnqjoGOo756FbsY2BkV1W2vcMokqv
	UzojVZ2TVh8t3QbbSkNLUHOOxrKIfJviwUPTakQJCl7KkR+ItrYWcwNG6mGBFKI2ACFSKxvgr1a
	jDZO5r4fVBGem6UJ05K3p76HxM+VIZjvAk4yiwiZ7yyN8ARAJGdvUNDXzNUgZMe4iViA2QjRWC/
	AyuXRzXMLY5ePF4218Rr7Lbb66OrUUZ6zhXu3NCBaO08MnxShzMXhBVsFabeE2EaOwNEXSaXQd6
	ZctTEu03yBJCTn8QyjCUSyJlkMvKzRm4ICFGAl1stS+txshBDni9+sf0XGqLo4Cheicq15gHxvS
	ZLmHp8iZ92ZeUZFGQ9VC1xm3bIlBBun00Qw/1uaVUw2YNelCQuRTL5BhU0foVjOcmPJxo3mcg6X
	+JryuvHPVHLLlue9ItUbWqIIzuVre7rgNf22+2EGo6sTgRgrTZuWPdowbVc//Oz+iCOJ3Bwq7b/
	xJawPNkFEB3kQ==
X-Google-Smtp-Source: AGHT+IGyxZINnobUJHzeiTqZeTjswJdiG6gOb3gsDkWxzrpTGomrFQWUdthTJuXfvw3UkyCeVkScNA==
X-Received: by 2002:a05:600c:524f:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-47d7f616361mr27408265e9.9.1767692200933;
        Tue, 06 Jan 2026 01:36:40 -0800 (PST)
Message-ID: <5d45bb91-4ef5-48ec-b1fd-4f186f46c0ad@suse.com>
Date: Tue, 6 Jan 2026 10:36:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/cpu-policy: enable build of fuzzing harness by
 default
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
 <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
Content-Language: en-US
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
In-Reply-To: <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:53, Jan Beulich wrote:
> ... on x86, to make sure its bit-rotting can be limited at least a little.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/tools/fuzz/Makefile
> +++ b/tools/fuzz/Makefile
> @@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
>  SUBDIRS-y :=
>  SUBDIRS-y += libelf
>  SUBDIRS-y += x86_instruction_emulator
> +SUBDIRS-$(CONFIG_X86_64) += cpu-policy
>  
>  .PHONY: all clean distclean install uninstall
>  all clean distclean install uninstall: %: subdirs-%
> 

As it turns out this causes build failures on Ubuntu (and only there, and only
with gcc, which I don't understand):

afl-policy-fuzzer.c: In function 'main':
afl-policy-fuzzer.c:153:9: error: ignoring return value of 'fread', declared with attribute warn_unused_result [-Werror=unused-result]
         fread(cp, sizeof(*cp), 1, fp);
         ^
cc1: all warnings being treated as errors

Given how the code uses calloc() up front I don't really see why evaluating
the return value would actually be meaningful here, so I'm inclined to add a
cast to void (provided that would make a difference, which I have yet to
check). Opinions?

Jan

