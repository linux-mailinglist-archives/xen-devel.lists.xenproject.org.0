Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B448CCE22
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 10:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728205.1133064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3ip-0002n6-AC; Thu, 23 May 2024 08:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728205.1133064; Thu, 23 May 2024 08:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3ip-0002jY-7G; Thu, 23 May 2024 08:22:47 +0000
Received: by outflank-mailman (input) for mailman id 728205;
 Thu, 23 May 2024 08:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA3in-00026a-Dp
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 08:22:45 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a18a0ad6-18dd-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 10:22:44 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so11008973e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 01:22:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c6b1sm1901920166b.57.2024.05.23.01.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 01:22:44 -0700 (PDT)
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
X-Inumbo-ID: a18a0ad6-18dd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716452564; x=1717057364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U53RxWXEYKSWLg5Ju6vVotqdHlvFxcIu9IrmCSx409s=;
        b=Uj0JKcVQIVQklOb4uUns5QNfU18qPng+3vVx0PCqaM7E0xEUaW580VHhfUJexixNDZ
         B4kj2h1KhdBk4x2KL7qkQSDIBqlFp/G+XauZtG7Dvgp1beHUKgjMhuJWzhKE+Yrdde8B
         fZiR4lGRAo5QCA8blS+mCwCv7XWYAfxRVA5hhuxhEU2Mm9wa5ZCxTLhNY2LnVMW6thAY
         hEtevASNAl7g1A8EZtQJF2o0Zh5JZUNPnN8yKT8qF47G/2VCjuR05LDzj8SKu9GRqAh6
         nHfuq9jrnegunQgL77Asc4eGqQZN7qyEpyuzrMArqwK+dxXtWfVvE3Ap94ec0O7wNsLv
         8cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716452564; x=1717057364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U53RxWXEYKSWLg5Ju6vVotqdHlvFxcIu9IrmCSx409s=;
        b=IbGDRIzShOHr2833h9Z3H3GVLTV1IjaYZZCyfJMmyw+dPxMdHokjUnvsziC8kYMKT9
         j7BPZVQ8AGPbukeTKwiybII5FfXRsGtO5wsTn3W+ahnN4Ks74Oz9H4VnlIibGrn7jkDu
         ztmDqS25Cj3JlzmNEOSa0bLsVSuD/x1dwEnuRPeRkHbdH1sqtfhSKwpK0tIrlwlyQZCw
         Vv02x8QoqtS/7pYo8vC06SUvJ7/BKwNu/8PymxAQ7UjzXmieKMk3abRbPc57HTkErtI8
         dw1MaA85pgRRgFJ1Tm98rEtB/33h9bLb/gODBPfOT1vLOsuh32W2bFu8hPrltb/tlWTy
         Ov9g==
X-Forwarded-Encrypted: i=1; AJvYcCUXVF6zCOIAnCYGc6LuMDXeh8SP3yQZ9BTrIM4xNcTpCnrN5/7v2EQNa9FJzzl53dHJFFGfEVJ6ngxoex0l4Tvz6Pi0rPUGHnaOFjSaPSw=
X-Gm-Message-State: AOJu0Yzy97z8/eFz42GSJuLPZmd+eIeWYkxU0evyFMYGP+V+qH54UpHG
	YMLn643/j51slSUcqbO1/5PoWWdTUexlc60R10vhYualyootTsA9DGjJD6RWrQ==
X-Google-Smtp-Source: AGHT+IGMpH5PGljwmz0DduOePvcuPXGZUqLFJuLOTwV0U52MbDtJSnywO+KPg9qBBMJlxzH70aJ1ww==
X-Received: by 2002:a19:f510:0:b0:51d:3675:6a06 with SMTP id 2adb3069b0e04-526c12153f0mr3100052e87.66.1716452564313;
        Thu, 23 May 2024 01:22:44 -0700 (PDT)
Message-ID: <3011751b-aa59-4266-b52d-df661bb9e4ee@suse.com>
Date: Thu, 23 May 2024 10:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drivers/char: Use sub-page ro API to make just
 xhci dbc cap RO
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <83dfaaf5cbd056ffbe381cbd39f0230348257642.1716392340.git-series.marmarek@invisiblethingslab.com>
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
In-Reply-To: <83dfaaf5cbd056ffbe381cbd39f0230348257642.1716392340.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 17:39, Marek Marczykowski-Górecki wrote:
> Not the whole page, which may contain other registers too. The XHCI
> specification describes DbC as designed to be controlled by a different
> driver, but does not mandate placing registers on a separate page. In fact
> on Tiger Lake and newer (at least), this page do contain other registers
> that Linux tries to use. And with share=yes, a domU would use them too.
> Without this patch, PV dom0 would fail to initialize the controller,
> while HVM would be killed on EPT violation.
> 
> With `share=yes`, this patch gives domU more access to the emulator
> (although a HVM with any emulated device already has plenty of it). This
> configuration is already documented as unsafe with untrusted guests and
> not security supported.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



