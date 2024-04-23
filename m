Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DEF8AEA0C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710764.1110211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHfF-0008IU-Pw; Tue, 23 Apr 2024 15:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710764.1110211; Tue, 23 Apr 2024 15:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHfF-0008GA-NL; Tue, 23 Apr 2024 15:02:33 +0000
Received: by outflank-mailman (input) for mailman id 710764;
 Tue, 23 Apr 2024 15:02:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzHfE-0008BO-Id
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:02:32 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 826d32f0-0182-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:02:31 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41a7ae25d53so15091505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 08:02:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b00346bda84bf9sm14974870wrr.78.2024.04.23.08.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 08:02:31 -0700 (PDT)
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
X-Inumbo-ID: 826d32f0-0182-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713884551; x=1714489351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBWpWKSR0WxPbo83WjVOkNodfd3s6jtoeJvcZtfrHYY=;
        b=atVWz7drEUuF5sSCOFPLrlT1gt5J+JWfrADZMgn1NtBZlQpJgq0Tgc73l7xqciVPa5
         q/LjvY9zOVqrfiT3ApzOLV6wh6S5+lffMjdaOQPOFOissR9ivE88B7uljtIaZpaIbEj+
         zeBkGZRGJB3jw/EY2UT94pqZnBZo2k84xntarWe59isHzuZgDARny4yhgyvdmkndvsYG
         4AvHltpBhtM2jybcSvhj6u6kTXu1jw2SjJWN4L265225GVCdjxpCFJF9kUTFh1D917PM
         zcTOjzjTcd8ZxzjfsUfns5bmUfXwH1Zzklsm6xf1ZI0G+LhkrlO5tzwl8IldrbZ3oP9l
         0XjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884551; x=1714489351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBWpWKSR0WxPbo83WjVOkNodfd3s6jtoeJvcZtfrHYY=;
        b=mwYuRT+cACoZS4Ca2LrU1F0uOHNgzstzosqj9xKvmiT7X8JfKxCLPlqE0hKYkV48++
         HwHaVrjHo85us43oxbrtAoKp7tqVLrjQP0osN2r+5rgYtR90/3CApPnG359ddukrqRhZ
         gZ63znS0RJ7+LhHakyp6FzEiO0QKUUC3C+hg9qYS7DMmQ86UNkJUH+KgEwmKtGszUcRw
         bMeckNkS0IwPsRSzKVg/jfBlxl9tb2c9xLl0wnKovV7uFJfG8nPHuCwhOJUaJxsO1LeP
         DvHS+4n72qgX637ye79I5iYKf648bYpHtC4D9BGfp1vn2jq3gES7j6xHI3IR4xeUZydd
         bspA==
X-Forwarded-Encrypted: i=1; AJvYcCWIYWPgCEFZYVrV6wOH5UKOdIiDbcWBFkxwWgZxjpPU6TscwzqRBUOkblofEFzLtnmG4YrY0OGLxivKjk5Ko5dbxyrCG1SnFLWdiF7/4lc=
X-Gm-Message-State: AOJu0YzjkcqszG7I03/ZVn/brXw6p2gLfW3yWtLEBx8Roi9gMLfdz+Dl
	z5joJkEapzRHyByiS1OufXFOPdosvhY8iTk3BEqbCZmd8AjVpfz50dzETQj2cw==
X-Google-Smtp-Source: AGHT+IE+5MCpadnjcrkQZyrIQQUM5BR1gJTXwoXfF+8cV+5tv7VkbbtQ/1OBflGHDdeadMJfbzNY9g==
X-Received: by 2002:a05:600c:34cf:b0:41a:21dc:ac2e with SMTP id d15-20020a05600c34cf00b0041a21dcac2emr5644962wmq.18.1713884551324;
        Tue, 23 Apr 2024 08:02:31 -0700 (PDT)
Message-ID: <c51c84cc-9b8a-4276-9035-fbd495f4bf49@suse.com>
Date: Tue, 23 Apr 2024 17:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/alternative: Replace a continue with a goto
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
 <20240422181434.3463252-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240422181434.3463252-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.2024 20:14, Andrew Cooper wrote:
> A subsequent patch is going to insert a loop, which interferes with the
> continue in the devirtualisation logic.
> 
> Replace it with a goto, and a paragraph explaining why we intentionally avoid
> setting a->priv = 1.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



