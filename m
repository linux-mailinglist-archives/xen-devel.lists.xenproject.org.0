Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC62AB324D
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981009.1367401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOw1-0007PB-FG; Mon, 12 May 2025 08:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981009.1367401; Mon, 12 May 2025 08:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOw1-0007M4-BN; Mon, 12 May 2025 08:54:53 +0000
Received: by outflank-mailman (input) for mailman id 981009;
 Mon, 12 May 2025 08:54:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEOw0-0007Ly-OQ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:54:52 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4441a32-2f0e-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 10:54:51 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5fbeadf2275so7242212a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 01:54:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e92sm5362880a12.55.2025.05.12.01.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 01:54:51 -0700 (PDT)
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
X-Inumbo-ID: c4441a32-2f0e-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747040091; x=1747644891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+ryrX3zt0PUxJueZ1oYUQ6/2efPjKt5e/3zSd0pUc2I=;
        b=d8p8cdN2+7jfe3OUIR0L8VzP/217Np3CdG3QVDty2/4+nhJY4HiyIK/zJsg/n757oO
         qGPIwJ0GjxjX19Km1OoTicWMBmx7otRzEpzaKCgY4tDfnSAXpDDT+XWeTrTSWBWz8W1/
         1eRh2ryz/kyiYN0e/F0gvWC2/FemrhE0EQXoe+bhSfJHdTg2XLU7crTtE2cps/pffaEK
         FXnlXH3hlBFamZEoXYXaxMacPpsT2xn9X47ZOnAHw0qPUW2KS1qg1N1OqiqPHOlyh1pf
         1/sx8XOOWmEQJdI3pG4i4miCj2VEuSyz8uxYFo51tLZsYcRFJteng+7JAmxobTmPPz6n
         JOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747040091; x=1747644891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ryrX3zt0PUxJueZ1oYUQ6/2efPjKt5e/3zSd0pUc2I=;
        b=CewnvNgDE5fZlonYi8QL582E8k2iobtVqt8V+RAEBHMC4yY18l052bZKz3C+Sc8jpk
         WmH/NmuSmx/aFLGLwejE7O9OD8niWzBabpZ2VZ4bHw9+h7Ua0DA35pnsh8sP+XJxNm1l
         qZ6+BQ+A40geJHU510Yx7dJCkFKH0hXNfodDo2zA3MS9oO44L2jfQqiptas1pOhuGM3O
         q+8kH55qVHbgC4y9Fbp1O86uUzK2cxZQRNBKlVQjeSO+Tprbh3Anlbp4FUDmijo8Rszl
         d7Ia+wwgX1xTTBCqX5f7yFJeoDVmjyhYNI7RESIdgeGWAkKToOV1K2lQVPbc92doa5wp
         K43g==
X-Gm-Message-State: AOJu0YzMC3Qy0syis8vhfFTqcwW1seDLeC9QDc3y4dVcwflHNeub8jtO
	g60AyqZjJcA28B1n6OK+JYHoheTEPQf+WHQ2HX0W+9vYMVygFWqMUbROkYRkyIY2swikj58TW6k
	=
X-Gm-Gg: ASbGncvllnYx2rdDvz8odIdkxYiAB8cC9FTLPRqSX4APP+JE3uqonugg/Y6hHI4MoDr
	w29ribwzMUH7rIqh/nioL5GLFSjuIozLKq35O7cz464XCXLasaw1BVKQBcDYoFJfWKk62AWBtZ9
	sUGF3Ui6hSCAgTG+hxO7j5WVjaGo0wTUiPJq5ofJElgYhrr44DIQyXPAOjBK0TSb8rznUiFx09m
	PupBQyT9HsWp++1Lg59Deu/VJcW04pBCtXYCEtxJIQDh6Uqd72rZNOLH6XrkDVHLo1KODU4xhDS
	N/23ltbKOKWd2yaPZxn+l0HXoyEYU8ueR4ypOGJrggt+UbsNKXjkAwVdxLU2BWpdfgepmKqIogL
	2zVPBRvmHKh1Z++QaaUUgHNhSDBJkFCuLw3D0L0KlHwzRQZo=
X-Google-Smtp-Source: AGHT+IG+9WV8lTzbX9x3V9RdTH8qyM7DZ+6BR+Ti9FGRjanhdWwBb0mHuShZ9dGDNaW2gsDtu+w8gw==
X-Received: by 2002:a05:6402:90c:b0:5fb:868b:5a59 with SMTP id 4fb4d7f45d1cf-5fca081b48dmr10712644a12.32.1747040091313;
        Mon, 12 May 2025 01:54:51 -0700 (PDT)
Message-ID: <ccfce0be-8208-4431-b93d-da0e63f3552e@suse.com>
Date: Mon, 12 May 2025 10:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Request for patch to fix boot loop issue in Xen 4.17.6
To: Ngamia Djabiri Julie <Julie.NgamiaDjabiri@student.uliege.be>
References: <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <DB9P250MB05235527B537774F77EB9E26A08D2@DB9P250MB0523.EURP250.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.05.2025 16:02, Ngamia Djabiri Julie wrote:
> Dear Xen developers,
> 
> I would like to ask if the following fix can also be included in Xen 4.17.6 (and eventually in the Xen versions after 4.17.6 that don't have the fix) :
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=dd05d265b8abda4cc7206b29cd71b77fb46658bf
> 
> This bug causes a boot loop in nested virtualization environments (for instance nested environments that use VMware Workstation), making Xen unable to start. It was introduced in version 4.17.3 and the fix has already be included in 4.19(.2) and 4.20(.0) and woud be planned to be included in Xen 4.18.6 in the coming weeks.
> 
> Even though Xen 4.17 is in security-only support, this is an issue that blocks testing and usage for users and projects such as Alpine Linux.

I fear I don't view this severe enough an issue to break the security-only
status of that branch. People concerned ought to simply update to a branch
where the bug was fixed. Or the distro could include a backport.

The underlying consideration being that once we start making exceptions,
more exceptions will be asked for, along the lines of ...

> I am a student using Xen in a nested setup for Virtal Machine Introspection (VMI), and including this fix in 4.17.6 would really help avoid these problems for others in a similar case.

... what you say here.

Jan

