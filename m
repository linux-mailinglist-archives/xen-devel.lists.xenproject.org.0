Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B3A3D294
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 08:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893557.1302426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1HM-0003s1-8o; Thu, 20 Feb 2025 07:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893557.1302426; Thu, 20 Feb 2025 07:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl1HM-0003pY-6D; Thu, 20 Feb 2025 07:47:28 +0000
Received: by outflank-mailman (input) for mailman id 893557;
 Thu, 20 Feb 2025 07:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl1HL-0003pS-7Q
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 07:47:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed19a782-ef5e-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 08:47:26 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e04064af07so1133109a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 23:47:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb6c312637sm1039939766b.45.2025.02.19.23.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 23:47:25 -0800 (PST)
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
X-Inumbo-ID: ed19a782-ef5e-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740037645; x=1740642445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4XUiIH3+osX9uuxbkddDFicHl7BxRbrNbxMyVtFG4A=;
        b=KDHdoBo9oqqd9xaWfNjWEoOSh/1pNAs46plUzu0TTjTu4VAKwtv9k+DdGuj7VH7m5V
         yGEM92l5NxhQZehQUQrimjeyXs4pQjTYDBUfNUZ6ki2boTzOlGriRnkGabiOgQhXrrde
         9g8nYRyla5/GkzABYUtclOtOXKjiXEBFxHaZEayouubE7c1CxY6RQ0J8n8/S5NfBN+gb
         uwSb3ZDJzLr5q2xa285AD19sBk12c0HNWpV1snaxbNbo/D3kTOIhRH3Iz0H7GM9TcjS/
         kBRn/xXnI7UfNRMH5gbhc+DpCbPHzzYLoFr8hkvfQloWyS3GMMDmLJIxJ+Gu6DIrWpBN
         cOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740037645; x=1740642445;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4XUiIH3+osX9uuxbkddDFicHl7BxRbrNbxMyVtFG4A=;
        b=vuDRtWhUa72NcKf6kAwItWWWoqY4CIfOiB80DgUbXarW9bsLdU8CIJz2baZJ0eCgGi
         yHDXLUvCN0vAQ+X0xc78NNTogS1WOyfYcwRMoGF/lnIdYpshVWtLJGzNnLs7GMz8iRiW
         x2CaQS5wMy4p/VcZhgn8wnDzdTkGkveLmMIayc4OpUSMZCmTELKdcjoswCE/j3LcLyy2
         Olbwm1pLlwxF0EuKJm1mc4/J4Thw/6AJxcFaV1ruXPpdvaQfFaHkDSswFYeVJHCrXtow
         4UV69cVUOgIyrJH/EfBAnxIdKHW9CVfUxZHcmWJMWs6fOZw7c6p1sm6/6ZRnrm3WIuKZ
         +W2g==
X-Gm-Message-State: AOJu0YxiR0kYjeNtnvkplBo14JwxmX0Jqz0mLjJIJUCoW2rChEO/zr8l
	dZnIWLyi+H0tTo56oq9Y5A2Snt3dPOUnXZrP77k4XD775yBLJiTGCbRJi3PwTw==
X-Gm-Gg: ASbGnctYLvvWuyR3CSqvM/Yh//W2FUdf/zzSrxG1waXdorY3kIGEbSIRScarvX9Rhoc
	IotmTD7LD9BtfzM8FG5Z5bVazStmuA4iQ7yvMhZQ19hHh2F8dY+zrcIvVv16XnAJIyk+ezEx1+f
	/qk0kYU3pLz/75nFXBDyPesXZMf1FNdM/r3lFgReRCHQWOH4V75IMP9+G7x6LhMyDeVNLgOlD4q
	8HB5lqse0a7SSivSaf40SzgBBEEfsJU6tIZpV3iXJyo7c6TOCfW3zlHUQWcqu0x9AAhkk4Aiw+E
	NyeBvzRmtbPq9jnzZS5gC7KrWcnF4wcYmA1ECI4rSD1kmIGbrLjdMwv8J3yzQHVrNQe12ImElXX
	R
X-Google-Smtp-Source: AGHT+IHWysOcT+dyxmcSemA73O4d/7a1PtOTDFX29fOXmpIfzaOgNo3o3KuDm9nw3AmNacTZxqQkDw==
X-Received: by 2002:a17:907:930a:b0:ab7:bc17:b3a4 with SMTP id a640c23a62f3a-abb70de2878mr2121513866b.34.1740037645341;
        Wed, 19 Feb 2025 23:47:25 -0800 (PST)
Message-ID: <b8f7b0c9-e7b1-43c6-a314-6cafaaa9c9a3@suse.com>
Date: Thu, 20 Feb 2025 08:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Wrong RC reported during 'make install'
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com>
 <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop>
 <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com>
 <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
 <c75a1003-5035-4ba5-a65d-d9e5f9dc5624@citrix.com>
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
In-Reply-To: <c75a1003-5035-4ba5-a65d-d9e5f9dc5624@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 19:04, Andrew Cooper wrote:
> Oleksii has asked for RC5, and we're overdue.  I'm intending to commit:
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 65b460e2b480..4e37fff92514 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>  # All other places this is stored (eg. compile.h) should be autogenerated.
>  export XEN_VERSION       = 4
>  export XEN_SUBVERSION    = 20
> -export XEN_EXTRAVERSION ?= -rc$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?= .0-rc5$(XEN_VENDORVERSION)
>  export XEN_FULLVERSION   =
> $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>  -include xen-version
>  
> in order to make that happen properly, and finally have the tarball be a
> straight `git archive` invocation.
> 
> Does this sound acceptable?

Yes. It's not optimal that the file then needs touching for every RC, but
then again it's also no different from what we do on every stable release.

Jan

