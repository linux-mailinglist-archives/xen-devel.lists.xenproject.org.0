Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E78D947523
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 08:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771778.1182214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sar1w-00064E-2f; Mon, 05 Aug 2024 06:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771778.1182214; Mon, 05 Aug 2024 06:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sar1v-00061o-WE; Mon, 05 Aug 2024 06:17:16 +0000
Received: by outflank-mailman (input) for mailman id 771778;
 Mon, 05 Aug 2024 06:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sar1u-00061i-Qn
 for xen-devel@lists.xen.org; Mon, 05 Aug 2024 06:17:14 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a6937e1-52f2-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 08:17:12 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so16350197e87.2
 for <xen-devel@lists.xen.org>; Sun, 04 Aug 2024 23:17:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d42825sm412369066b.123.2024.08.04.23.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Aug 2024 23:17:11 -0700 (PDT)
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
X-Inumbo-ID: 5a6937e1-52f2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722838632; x=1723443432; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MbvJ05UAFQQZo2nYRYkOVwY26JkXQ5QL51jc2pRyyqE=;
        b=XNQ4QeHxD6mU6Ir+CA1AZGgdCu92MERfIwt+jc0Fl6POVuSaQ4+evUOHtlWK3bxZEJ
         5SS5dw4ZpabkbxOlKXGXJQmX7jp2nBFqo8+BGZhsSNkSDNta10SFvnRJYhZ26HnKhObz
         C2vhz3ZkHqNXsoymi6f/baXV1XO+PRmTPg7yqyEhG8C1oZ0nA5MN+PvsBwpOUfR7uC6h
         521UiFtZnqjrd8FycVY3tZdp6ihPz5AkIcMf2DQBZwpETt5Heo/W3Av+Jn/LdfmRzE8e
         //T/ne1f8uNtF1LwgvZppfH7/qF4K8OrzXJzDe31SSoGiwccc5Wznjcf5mznIOaIvMsE
         Lr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722838632; x=1723443432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbvJ05UAFQQZo2nYRYkOVwY26JkXQ5QL51jc2pRyyqE=;
        b=wK/0hjTC0OSyUA59qplakm+NfRlgbdZXptXaEh3KYOHO1tbDU5AbBW7ZZSMfL1A8Cr
         HoIL3qU+qcT1Cz57MxGLqhBr2x0oHM8n7QO1mE75mH18HuMaX4RMGW+5BdMOcMLAjRho
         uzZwrnKcdrKNtmc8CsxJKWIixUn+ONIYOeF9zSsnt4bvTUHw+pWF931OB4W3R8oxpydc
         Zg30CiCI+a4LULeEFol6Z6KqLACyFpeH6Y4Yxc0Lm42sGn/kyMP+0tnXOTKtA2MH7XSA
         JG8Gtx304aLZXSm0zBImRiMlWRlUJzzV1jGJFqWeJbZNum6a2U0GJFDBUOHuu8pWkQ4/
         vzaQ==
X-Gm-Message-State: AOJu0YxM9JdQrJWWDRAMeanPFXBkBY/W+3c0JNleBWiiIxNXWfY8Tr54
	yZdvg6kyLv1dFOmgp1shVxe7EaaYHIQBl6gLAUGn9RI5esxW92dnAEFeKenq76BxcNA4/6h5Mmc
	=
X-Google-Smtp-Source: AGHT+IHOIM4dm7aptX0+n4AFJVfQ5UBh3mEAekwTg1OVC6QZJM/ioq43tKnRBrw23LG3Wl236q7skQ==
X-Received: by 2002:a05:6512:ba3:b0:52c:df8e:a367 with SMTP id 2adb3069b0e04-530bb3bbfd1mr9065118e87.53.1722838631630;
        Sun, 04 Aug 2024 23:17:11 -0700 (PDT)
Message-ID: <8e25bb26-2356-43a3-a479-6a679c6577c5@suse.com>
Date: Mon, 5 Aug 2024 08:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] incorrect "help" output
To: "John E. Krokes" <mag@netherworld.org>
References: <c79f8028-6c34-0e25-1445-79e5bcb93890@decay.netherworld.org>
Content-Language: en-US
Cc: xen-devel@lists.xen.org
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
In-Reply-To: <c79f8028-6c34-0e25-1445-79e5bcb93890@decay.netherworld.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.08.2024 15:18, John E. Krokes wrote:
> Here's a simple and obvious mistake:
> 
> 
> ~> xl help | grep vsnd
>   vsnd-attach         Create a new virtual sound device
>   vsnd-list           List virtual display devices for a domain
>   vsnd-detach         Destroy a domain's virtual sound device
>   ~>
> 
> 
> I'm pretty sure vsnd-list should say "sound devices" instead of
> "display devices". The problem is in tools/xl/xl_cmdtable.c.

Would you mind sending a patch (against the current staging tree)?

Jan


