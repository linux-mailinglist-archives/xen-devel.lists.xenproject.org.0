Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4085A121
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 11:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682760.1061903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc136-0002rZ-Dv; Mon, 19 Feb 2024 10:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682760.1061903; Mon, 19 Feb 2024 10:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc136-0002oW-BK; Mon, 19 Feb 2024 10:39:00 +0000
Received: by outflank-mailman (input) for mailman id 682760;
 Mon, 19 Feb 2024 10:38:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc134-0002oO-U5
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 10:38:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14be030e-cf13-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 11:38:55 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4125df8f347so11433875e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 02:38:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c44c900b00411e3cc0e0asm10708999wmo.44.2024.02.19.02.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:38:53 -0800 (PST)
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
X-Inumbo-ID: 14be030e-cf13-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708339135; x=1708943935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJ+9saTvcizSh/kaxEm9YiT1T8GFT4Ezz+YzRbfjCkE=;
        b=f1gau9XTEvd71GfCYoSuGz8kM4HqTrprdoCh6WuGgTNAhfT5frUyGfYVHuZsYi3Go4
         pgQCbU1WUtrctYl5Npuw+MbCpwZH8bjW4+NnM1gYr/4jRxOvmys5HdveIOZPWZlHJTyr
         p+MWNgmXvxqavJXYcB/57tHwCW5TXr5tYd9+1aaq4clqiSHCqTko0bn15wjPtqqfEEBm
         8OAtQAayTV2o9f831DJTx/0nmuQ0QywuV69htkcKXcFiaHm7jn2yl5j9H72oXP2fEL10
         7ePMlE4sQf8QrFTK4QTjKrWQFyVEx5HhL4xE9EkEbM3ZSnQSdZIU6AoCF5gnnjylpJvB
         kLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708339135; x=1708943935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ+9saTvcizSh/kaxEm9YiT1T8GFT4Ezz+YzRbfjCkE=;
        b=LX80c48WR1ROrlrJCgHou+CaposoR01SyAUIsX3/GjVU1GCfZydcu+Ux7UJaxMZnfQ
         9xLuzLocMvtdf5p6zomteq3wMdsAPTPSU+gSjTz91TEAKsdss7kIedGL2vbfG1hnkHuQ
         W8ObQNg7F8B8PuADcu5r8sgsU37nxsQtx9/qKwaoSkw7hXZ2QOAbulKA+n/MedU8fxWD
         IH4k658y4LJ6DYiGiFfzoPDsmtNHHkrjR+F/XznE8eEL+hBdLpGBUt++D/fEGCl68HNI
         9wHf5CKT8+mqTs50qDKsmTaQciggTVkkwdgquucqs+q7ZSyeleV3AGmWklQS969cJOYg
         0jPw==
X-Gm-Message-State: AOJu0Yy/etomE6Vxq+DXEWV9LYv+cuTmqTjbCQGDDNhkn9Z4cD+9GEwI
	kjEdi8uzH/eHDLxysFmrvCgCrgA+SsKJKOg+ITYC3kBl3DqYay/0/2B1uDt7GA==
X-Google-Smtp-Source: AGHT+IH/7fw7xnboIqUa2Iw8Ff9KwcgTv0f2jT3SH94o252EFByXjlyUUxNJPpganmGldbORipTg4Q==
X-Received: by 2002:a05:600c:4ece:b0:412:6101:915c with SMTP id g14-20020a05600c4ece00b004126101915cmr2398725wmq.19.1708339135126;
        Mon, 19 Feb 2024 02:38:55 -0800 (PST)
Message-ID: <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
Date: Mon, 19 Feb 2024 11:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stats on Xen tarball downloads
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdMt88BSNMYtq39n@macbook>
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
In-Reply-To: <ZdMt88BSNMYtq39n@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2024 11:31, Roger Pau Monné wrote:
> On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
>> One of the questions we had with respect to changing our release
>> practice (for instance, making the process more light-weight so that
>> we could do a point release after every XSA) was, "How many people are
>> actually using the tarballs?"
> 
> What would this more lightweight process involve from a downstream
> PoV?  IOW: in what would the contents of the tarball change compared
> to the current releases?

From all prior discussion my conclusion was "no tarball at all".

Jan

