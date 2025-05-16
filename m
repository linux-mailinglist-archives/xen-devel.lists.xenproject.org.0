Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A79AB9727
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 10:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986469.1372030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq5G-0006CQ-4H; Fri, 16 May 2025 08:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986469.1372030; Fri, 16 May 2025 08:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFq5G-0006Ao-16; Fri, 16 May 2025 08:06:22 +0000
Received: by outflank-mailman (input) for mailman id 986469;
 Fri, 16 May 2025 08:06:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFq5E-0005fT-Cy
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 08:06:20 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6260fb5-322c-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 10:06:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fc7edf00b2so2838892a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 01:06:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4ca2bfsm111403666b.157.2025.05.16.01.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 01:06:18 -0700 (PDT)
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
X-Inumbo-ID: a6260fb5-322c-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747382779; x=1747987579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P71CORrXcAjS2HNkE4UYt784LxAsBT3j+MQ+sMVtq7k=;
        b=JjfDr/RugsQnpmnghtGDgrtiUVn+ejH42I3dENvBx+fDawyuWd2fs1LE+o/LWgmlJt
         jGjgWv4BnC7lC48fpnvdRlB+MnuO+ud55r1BN5XiuCLNlb56kMSTEtiRH+Wo73grptur
         EJxJaaLJV1mGYqNifgHk1/LsDomWwdHv3+ZYcD1O8OfoAmUIEW5zDct11/F2fceAX7Ut
         rfTzRJNwfcc/b8iCKOobfdJOxe13I3xgqTT049f9KHKBwN/xlCYWlFATzQeFqW+g1zq1
         eUzeLlQ1AVm4NBdx6QxkYcQjP7KLyIn78SScdfYx2zvckz4YG1PoAaIrAyOBpUFzq2zk
         qPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382779; x=1747987579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P71CORrXcAjS2HNkE4UYt784LxAsBT3j+MQ+sMVtq7k=;
        b=PMdhPlC+CwdrzJLk2owOCV+bRsZcPg+TmCIoUnMKKWrR+DXWKc7RNuunBwqTcZlYFE
         +DxsSpNDGTHh+hHSjgCHwAYBQ2IzUbfxxFXX1jxJaUno5QchH7DIosYyAlKqZDFvdRka
         YoXWaqilQ3Jk4e8X2U4cKg1Ec0CwowRiXd9/7eEJx0rrB7pGd1Kqp0uE1dqqEDtFPfwH
         mxrIBz9qKTMkuJMQUifjWuuGDjWjJk6sjPWidEN5SgI+Hqg3OJXPUwNCU//3gk6VYSk5
         79Qat5tIvuaaUN1VGmUlUvnjoWD8CkTIEJZxZC6/GsDXeIO0vc0q/djqoHGvHnGmZaKZ
         kxCA==
X-Forwarded-Encrypted: i=1; AJvYcCVRbo5kPyxhAeBguxiWUMNBdTeEiszK9HCU5KjEc/nUalFEcOuS5rhxW7hfxxWDUilPQ6hX5DERAEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHbOi/nIdVkLcykYlHSM2At+pVPEg3YHslcSjdqXyrVKIsZEw8
	kpXQV4SOjMW3RQwHaWOuJP2BBEBmsrneBOSx/V7Jdkh94d0+uEYBm19Ic1Ti3Tb7mw==
X-Gm-Gg: ASbGncvGkDIFXyInMlJu/lr5Lt3pOEY1Jd8bqyL6ka2C8uPRslEKfFmobB1qRB66Ljt
	ZABHdhtZtGRucdlFOzn4a4uiwaf7Q8Eco5uwSE151y6B32m82OSJ/mpWmPuCReWxs9AnraFlGrz
	xYK7hrqZaqGIhDl10fcqXutuj/qSIlC5SDLCijKdiTGFM0chtHfN8OOSfjBSAsLmMgF/oMMP0SN
	lIn3HYhkETRIkjB29AF30oqPaDsEeX8IR7RU3D5BNb++RcFRiobCZq5ZzyobNrJl9JkV6QxY/EW
	2a1sHG4HfjTqwbPR1iuoLzZ1FR4VdixpJKK+H6zamO8U6n/41bEcBvc+FWMD7E5wibdLRnm6Oct
	/f3Vc2Uve0k+0T1HTwFxT00In0QE4AMQQSVRX
X-Google-Smtp-Source: AGHT+IE4nJKVbwTX9mc8nGAG4QsDlcYiH1QGeBgDscboTFPujPxU+fcgpGDCpu8nIWhDIuiO8aRNbw==
X-Received: by 2002:a17:907:3d4e:b0:ad5:e0f:7850 with SMTP id a640c23a62f3a-ad536bde688mr119178766b.23.1747382779182;
        Fri, 16 May 2025 01:06:19 -0700 (PDT)
Message-ID: <13e936b0-55b6-49d2-9e61-289ee334e51b@suse.com>
Date: Fri, 16 May 2025 10:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/emul: Fix emulation of RDSEED with older
 toolchains
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250515195058.3702872-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250515195058.3702872-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2025 21:50, Andrew Cooper wrote:
> This is reported as a MISRA R16.3 (missing break) violation, but turns out to
> be substantially more complicated than expected.
> 
> In commit a8fe4ec5320a ("x86emul: support RDRAND/RDSEED"), the switch()
> statement had a default case going to cannot_emulate, with both the case 6 and
> case 7 labels being fully within #ifdef HAVE_GAS_RD{RAND,SEED}.
> 
> Therefore, when the toolchain didn't understand the RDRAND/RDSEED
> instructions, attempts to emulate them suffered #UD.  (This is arguably a
> problem as there's no interlock to prevent RDRAND/RDSEED being advertied to
> the guest, but as instructions with only register encodings, they can only end
> up being emulated with VM Introspection is in use.)
> 
> In commit 58f1bba44033 ("x86emul: support RDPID"), case 7 was taken outside of
> HAVE_GAS_RDSEED, meaning that emulating an RDSEED instruction no longer hit
> the default case when the toolchain was too old.
> 
> Instead, it would fall out of the switch statment and be completed normally,
> behaving as a NOP to the guest.
> 
> Retrofit a "return X86EMUL_UNIMPLEMENTED" in the case that the toolchain
> doesn't know the RDRAND instruction, matching how RDRAND work.
> 
> Note that this has been fixed differently in Xen 4.21.  Commit
> 05bf9f1f0f52 ("x86/emulate: Remove HAVE_AS_RDRAND and HAVE_AS_RDSEED") has
> removed the problematic condition due to the toolchain baseline upgrade.
> 
> Fixes: 58f1bba44033 ("x86emul: support RDPID")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


