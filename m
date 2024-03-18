Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4F87EB68
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694768.1083870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEIh-0005Mz-9I; Mon, 18 Mar 2024 14:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694768.1083870; Mon, 18 Mar 2024 14:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmEIh-0005Ja-6a; Mon, 18 Mar 2024 14:49:19 +0000
Received: by outflank-mailman (input) for mailman id 694768;
 Mon, 18 Mar 2024 14:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmEIg-0005JU-B3
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:49:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1ca4807-e536-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 15:49:17 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56b8e4f38a2so6580a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:49:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p8-20020aa7c888000000b00567fa27e75fsm4655186eds.32.2024.03.18.07.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:49:16 -0700 (PDT)
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
X-Inumbo-ID: b1ca4807-e536-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710773356; x=1711378156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1E622452z54d2ZKN7d8wn0TImsbuLvk7Yn3b+UyU6CA=;
        b=KbiEssLKPwTsbogkgHNllKt2sdrecxgqGSzW+eVJ9ym8Uzmyn3vJazY+i8mmbJTd/g
         2oXVuXUChs6wI78xtlPN2QDvyAzp1CzHNQ8LHsPni/JcMTvEgssh9FDGebeYNJ1WCIBl
         4qzmv6QEDyVW9iiKxggRsdIOtYOsSOBVe3JaQON9MNn4paaoq5567XBc/1ggjJZGStEF
         tinV2iMmrjKmQ8Q9S157dRbe78iisiukhYVFe85KSX0XXDHDjVo9fthqcOgh6Dkb9r4D
         /imJfYwBQl415Q3p6ndb0/RirgpLjE5P4KkI3cH9PkT0cH06oTnjrb7oB3rHbR9G+dZJ
         sIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710773356; x=1711378156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1E622452z54d2ZKN7d8wn0TImsbuLvk7Yn3b+UyU6CA=;
        b=ZjRVYNhIM9FqkzjvGwtkGEAXGXEg+XFrfA6C0SGCAka7/fd+jUz0yfz8qAo12bZUf0
         B42+FM3vzqgcgCsyGeAjJgblzUbrXJGOPDt7yA0NSwf+f7Wu3GIOOcH89+Nii9YoQB1p
         ElbI64lHVkjEslOcCsFihLowcZAl2cB2/J8jfHJQ5+IUI44P5Z7qXMP8HQmgVJ/sPtmp
         61ba8sWxdRGdWd/1ml4WEmSlKhBgTWJogpjJUJdhC15JaXa01dVlrKbfAB/dWyPHvwf8
         WiOXUcNf+TJspt9njU0Mp010GsKjIspu+Dd9pIVwRGh4TinFEGZe4bcygANMKEfzr5/x
         aHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6EYH3m3CSIAqnzfGmui9ucevpmblh3ZxjIA9aJDu7BXbMey/7Xxyq+Idj9Xij3abwA03SipVySA6W1X4SAFxNVsTO8Br2y8oUWs7X5po=
X-Gm-Message-State: AOJu0Yx7p+1pU2dis/9D+fem2eeKbvZdilXuO46Y0fME/4L98CzHs4L7
	NfMlWLTttYtQjk98w6mX1GC3nSX7Fl6EOS96d1BPSu+f4ATePPDssvK/mZ2KhQ==
X-Google-Smtp-Source: AGHT+IFA9M1AzQM14aWje1Sf86pErhuNUlRMgo1sZsXZ8ap2P5nKkLmnACdOh1qn8mf2C0mHEB8tyQ==
X-Received: by 2002:a05:6402:1f49:b0:568:93f:36c6 with SMTP id 9-20020a0564021f4900b00568093f36c6mr8924338edz.22.1710773356582;
        Mon, 18 Mar 2024 07:49:16 -0700 (PDT)
Message-ID: <91819455-52ca-41c8-aa9f-ae092e117489@suse.com>
Date: Mon, 18 Mar 2024 15:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] xen/spinlock: add another function level
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-8-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> Add another function level in spinlock.c hiding the spinlock_t layout
> from the low level locking code.
> 
> This is done in preparation of introducing rspinlock_t for recursive
> locks without having to duplicate all of the locking code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



