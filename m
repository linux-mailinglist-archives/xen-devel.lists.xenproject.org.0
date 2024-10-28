Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23509B316D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826534.1240812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PZZ-0007HS-HE; Mon, 28 Oct 2024 13:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826534.1240812; Mon, 28 Oct 2024 13:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PZZ-0007FC-EG; Mon, 28 Oct 2024 13:14:17 +0000
Received: by outflank-mailman (input) for mailman id 826534;
 Mon, 28 Oct 2024 13:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5PZY-0007F6-NS
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:14:16 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8812d0a5-952e-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 14:14:15 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso40089195e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:14:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b92963sm9473621f8f.98.2024.10.28.06.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:14:14 -0700 (PDT)
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
X-Inumbo-ID: 8812d0a5-952e-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730121255; x=1730726055; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H1vSwM+CFgKinKrL3bSwpA1sOZKzkRd931BucJZ1snA=;
        b=dLXXQ7o49Fp+Go6tCR/1hwDd6I7d4x8cexfcoC8htnxQC/RbxG/mJLWQKakIRmV4ZN
         GGoQ2fHOnhTbGFK8pFBp3mX+eY7tmZe42Y4ehAnMNRembfpjeSD+jMQ+QmCiHk6mlkZw
         DlXFK6Pqa+yt66+ByOk9u4n4wP0qveya4TSpFKodaYbZ1aBkcadXzCMMi7f80IlncvFG
         aqHJANzjLqZrcmQS/vaaKQgiHU5/3Ns2EkeiyHMhRGeP5Z2HjXjzly86Duqa3PJNS5UP
         AqlMSOMvTa9rTDVKe7o0Z8U045FXM0ARxa+O0u10ezkHrrrqgwADjdj1uw6wjbIV9KSA
         xFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730121255; x=1730726055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1vSwM+CFgKinKrL3bSwpA1sOZKzkRd931BucJZ1snA=;
        b=jIbeE67BmSTFg4TMhG1TxkzbZZNRAf2qHYnWWQ8NjGwo9+OpAiuCngQ4rN+U8oby9P
         3/mhDhOYRHjPrL2iUNSWXCDO/NPMHOfEoCAczM5IAbF565xhzI+9GUi3ApjRymfHLBJE
         Ih+yJj+fxV6PxpthOeKXr71lsS79dkbE7m2TILIwsqHhkTAQbt1N214ghgP7hBqkSB2i
         qEiSdyFDLvwDhc0W0UfuM+uoL7BPchSygkBvTMT8NkTITRSfFzX3xLFbKzoT+aS5oYDN
         MAhUTGmP8vCb/pGXIuA9D6XsZQ0E1XuQtmQZUMZdTDnfc6fT9QmRFZPN1wnk5bFkWOka
         VNMA==
X-Gm-Message-State: AOJu0YwvR5TrXG+zsyCuKMjSXdTUTYrf5OH/sGFP4+mSsM3t9qaRbmKz
	5wjLZddJT9Jd7Vwfdt6LQSeca8XS5t6QB6853Qkhf+OMqHgRgrnMknj8ggyd5A==
X-Google-Smtp-Source: AGHT+IGvvb3VksGD2TtKlOma1YZp+yL4bQjiohUfSRIHazFJfgb4CSPYXJIOS0taFyxhX5mDy22DBA==
X-Received: by 2002:a05:600c:1c1a:b0:431:55af:a22f with SMTP id 5b1f17b1804b1-4319aca400bmr72288555e9.13.1730121255108;
        Mon, 28 Oct 2024 06:14:15 -0700 (PDT)
Message-ID: <6fe9d8c9-536b-482b-af66-bddee42e94e2@suse.com>
Date: Mon, 28 Oct 2024 14:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/ucode: Rename the apply_microcode() hook to
 load()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20241024132205.987042-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.10.2024 15:22, Andrew Cooper wrote:
> The microcode suffix is redundant, and "microcode loading" is the more common
> term

Just to mention it - much like the microcode suffix is redundant, ...

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -214,8 +214,8 @@ static enum microcode_match_result cf_check compare_patch(
>      return compare_header(new, old);
>  }
>  
> -static int cf_check apply_microcode(const struct microcode_patch *patch,
> -                                    unsigned int flags)
> +static int cf_check amd_ucode_load(const struct microcode_patch *patch,
> +                                   unsigned int flags)
>  {

... the ucode infix is as well. Arguably even the amd prefix is redundant
(with the file name). I won't insist on either adjustment, though.

Jan

