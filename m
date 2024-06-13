Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D2D9069D6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 12:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739767.1146711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhYJ-0002Mo-5X; Thu, 13 Jun 2024 10:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739767.1146711; Thu, 13 Jun 2024 10:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhYJ-0002Jz-2A; Thu, 13 Jun 2024 10:19:31 +0000
Received: by outflank-mailman (input) for mailman id 739767;
 Thu, 13 Jun 2024 10:19:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHhYH-0002Jt-Q0
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 10:19:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a28fc68-296e-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 12:19:27 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57c73a3b3d7so730327a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 03:19:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbb30ba30sm194754a12.39.2024.06.13.03.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 03:19:27 -0700 (PDT)
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
X-Inumbo-ID: 6a28fc68-296e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718273967; x=1718878767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aeLOOdXKE2aiRzZ5FVjg3Rz9YKI1cO3KwN+PP5oYw/k=;
        b=Z54FzTgm0NgTJz2Sz+Ex9sCBp+0eTZUm5i7UqXMd0upE+WuXXfqimhtaq3rqouqTmb
         aEvZcKbnh4ERTKIXCHWDm8/jf8JxKwTFMUCLwZWW4T49s+37xY/dbhnfRp3N1+3ya+Wx
         nVkULAVQsIFPz4kYyMB8iwtTyrVnl4tBX0mOk+og5pr+eMIpYoOw/7QZn6mTsBu5X6R6
         5l9npH2+lQAiko82mDp8dTcx78TQz/KUGU82usb2JqnN2ThW++9KjzaebWK27v5pgVlK
         phLgGgRt3DEna1hEzatduHL8BZv3iMJVGKB5KHFfPTF4C+LKPQHiSgqzya0stNLEtoFD
         g10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273967; x=1718878767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeLOOdXKE2aiRzZ5FVjg3Rz9YKI1cO3KwN+PP5oYw/k=;
        b=Dx5ltFQ/nhk/Bi4mtXSiM52yfMko6bdkKdSqy/kvulB71t3TDfTiKa2kCDAZ18mhXY
         VjWWW6iiYsflbTwMsjw7756AStAGzrQedsCMVE77dOMLu6LkDL34K2uKoS6sdTMxMfTo
         RAoh5jtlGt4ObM8wNwq07W+vEJlXACmuKg6o+Mj6pu+3qFpEeGEZhsvb7jaMu3axZWJt
         knskYNjnA1G2va8NJ0d/egP4arn1XKzDH+S1ymAfItS2Gh4vrgeEtjTYtUyG306lGZtV
         MZld/OEoKFwVa3rrqDiGWz7NVZ+Ie+T8JZWOCZIvLQnTHW+RK/2a2x9ZSojSwQrPQwto
         hpFw==
X-Forwarded-Encrypted: i=1; AJvYcCXCoIqyKkpGCHIk5oskkhsw0CaJZ8i9QXk4faj0qU6YeQJkYWS/YP5/AFqYbyj72kuZkTEwtZc25ZnSHtrfgEa2fE+UEyKtyOrhydJmbjc=
X-Gm-Message-State: AOJu0YxQJEdKXT+U38/V+O9/lsFCIBqdY6WX4VkyELZqGN4ul/rDuIN8
	sOMeDjmM3wfN/Ax9vzqEQUz6p9ORKHFLSlfaA78Xcv3t5tz/+kgCKEjcEeO+ew==
X-Google-Smtp-Source: AGHT+IGwjVkKC8DOibl4F0rf3MSfjAIMG11OVXGGe0Yr01K+UgqzVsxtX+t7l7PLP4oSD41AYQTxUg==
X-Received: by 2002:a50:bb64:0:b0:57c:47c3:dc62 with SMTP id 4fb4d7f45d1cf-57ca97496cfmr2736123a12.5.1718273967209;
        Thu, 13 Jun 2024 03:19:27 -0700 (PDT)
Message-ID: <bc39fe10-68a4-47c3-aa70-c2a8865ea8cd@suse.com>
Date: Thu, 13 Jun 2024 12:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN v1] docs/designs: Introduce IOMMU context management
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <1cdd746f1af79970f8c7151d23854d33416772e0.1713876394.git.teddy.astie@vates.tech>
 <5c7c76f29726d377e3ff8a22ba2e3eb01dfa4c3b.1713876394.git.teddy.astie@vates.tech>
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
In-Reply-To: <5c7c76f29726d377e3ff8a22ba2e3eb01dfa4c3b.1713876394.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 14:59, Teddy Astie wrote:
> --- /dev/null
> +++ b/docs/designs/iommu-contexts.md
> @@ -0,0 +1,373 @@
> +# IOMMU context management in Xen
> +
> +Status: Experimental
> +Revision: 0
> +
> +# Background
> +
> +The design for *IOMMU paravirtualization for Dom0* [1] explains that some guests may
> +want to access to IOMMU features. In order to implement this in Xen, several adjustments 
> +needs to be made to the IOMMU subsystem.
> +
> +This "hardware IOMMU domain"

One very basic question up front, before I can even think of properly reading this
doc: Here you refer to terminology used in that other doc, yet ...

> +[1] See pv-iommu.md

... it's not clear what this actually refers to. There's no such doc in our tree,
afaics.

Jan

