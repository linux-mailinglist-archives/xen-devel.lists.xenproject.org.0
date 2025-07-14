Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8457FB04088
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 15:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042837.1412904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJZ3-00017p-UW; Mon, 14 Jul 2025 13:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042837.1412904; Mon, 14 Jul 2025 13:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJZ3-000151-Rh; Mon, 14 Jul 2025 13:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1042837;
 Mon, 14 Jul 2025 13:49:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubJZ2-00014v-VK
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 13:49:52 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69817d17-60b9-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 15:49:50 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4550709f2c1so19174045e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 06:49:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd73a6sm10204195b3a.20.2025.07.14.06.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 06:49:49 -0700 (PDT)
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
X-Inumbo-ID: 69817d17-60b9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752500990; x=1753105790; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UvDp+Wt4R0rqhAlM6APDVpq5ESYZ+IQcmzEkjRSJTOU=;
        b=IUlfHlS1L+nhDkKI+Qekt/ev3qxiL0TV9RxzyGdrR82XdavgNQy574fQJXR85P8xSl
         SuDsYVXEi1NowAyE4zeJ8ctlFY3JVNb98M7dhve62XDN0mRoPhsM+qrXc3xuLfJ9qcjA
         sONdzcdfGZPte0Whb+Xgyjmo7Yog/TY8CgAVhzVQyu5MYZCHw9kH+czdmeNCysM1Vqlc
         VsNWpr4lKKYGbPuIZ8JjTAoaYSMkVUcbW/nPjVuxP4ckEpVp6+WFwLJV1wOmndrv6zkH
         V2A58onhFVB52QSzuEtqR4goeFUyISrydoH7CiON3vVimPmwUuzxvGbWcVbgxSoHWLqF
         hFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500990; x=1753105790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvDp+Wt4R0rqhAlM6APDVpq5ESYZ+IQcmzEkjRSJTOU=;
        b=lP6pO7OboCrXKkb6JqGe10jt96yJXqMRcppcCZYWFAXxY546dzpRt5IqR3ZkU2H496
         Pka5hrhLyXPRXqNM7Azm2S+nXgDCp0nztA3B88OlA7Lmg7O0K8P8lxYfwxQ5PNsrvHzJ
         PoyQeUtsJCEd0JHnCbPrkshYbJmK3zBn5d9Vm5ILHEG+4/yVr1NP3YLsEVSqntMATbgA
         ZNu87Dci+EyFoJc3ugVrYGYLRKF7KiafCRGI5Z3rAK5Nr6/ezTJiBsLXvmpv2KLOvN+C
         4hvUT2Ta1XE3r5BRaz44B3f43JqW3di8Iv6wR04KKiA/kyLd/zelyk6IKk0U87H+oPKm
         LPhA==
X-Forwarded-Encrypted: i=1; AJvYcCWaCt1yNsCvM3XWu3GAUshpG6Ld+MeS5R/XGcAbKBzZxxF4OIcoFyVB3sHXrSiglAgji0xjyaGwOkY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQcteKZvx0rWezaen6songGLfviBsdUVtrQszLFVaeiNLjO3tK
	XI3pCUEe82S2wYdcWpOltMz2ytFkLL2Bc6zYIkm6U9h91TFlCRaYlE7fXETdkBYVdA==
X-Gm-Gg: ASbGncvF8onLGM0HxQqg4ZMGhsmhvfGmuWlFt+x2tqDJBWKnyRLoFDcemMaa3MlFj59
	JdEAQaOb03824fZ/M6FEa2lizUiPvn8MC3Z04zkxJmbf1poMy5yxwYW0prXy31+a31v1UBMhzmX
	THMyznjoRKioPKFOtMXL+xPYBK0UUaXmiz9MosWXayfQEMUif2DbIS9FfxwgT634uJD90y6Q+Os
	S6e9xFNpFHV9EVkMnEvdwqB7wNS5xBXtee3Mg1EGWvjvGBxa/98JwQIbyQKdkWXzmUoDMUT8XlY
	FxqqruTurk8pWeG3Ykp0rSNIgFa6+AVlb+RSh0uEYcUrPQTTnbIazKjBJ56HcH6E/Sm16RUbfXv
	ExtPtazEuqUxgXlNB08imP5fQ0zioEoTMe/wU1aHirGn4jnid2X8V6KMr+hUHFKvTtoCYa8CgJ8
	lOl9v6/ag=
X-Google-Smtp-Source: AGHT+IEQKKCuq2uxEJGfRekSVcIo5v7oVonCleHCIASmUpUtDu7R/L9EvWDVn13Y73jeRrzdV3BOyA==
X-Received: by 2002:adf:a347:0:b0:3a4:ec32:e4da with SMTP id ffacd0b85a97d-3b5f18806eemr8055660f8f.15.1752500989676;
        Mon, 14 Jul 2025 06:49:49 -0700 (PDT)
Message-ID: <87ab0914-4a90-4dc2-ba33-188c7eb4cdca@suse.com>
Date: Mon, 14 Jul 2025 15:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] misra: address violation of MISRA C Rule 10.1
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.07.2025 15:26, Dmytro Prokopchuk1 wrote:
> Rule 10.1: Operands shall not be of an
> inappropriate essential type
> 
> The following are non-compliant:
> - boolean used as a numeric value.
> 
> The result of the '__isleap' macro is a boolean.
> Use a ternary operator to replace it with a numeric value.
> 
> The result of 'NOW() > timeout' is a boolean,
> which is compared to a numeric value. Fix this.
> Regression was introdiced by commit:
> be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.)
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes since v2:
> - improve the wording
> Link to v2: https://patchew.org/Xen/41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro._5Fprokopchuk1@epam.com/
> Link to the deviation of an unary minus: https://patchew.org/Xen/7e6263a15c71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro._5Fprokopchuk1@epam.com/
> 
> Jan, regarding that:
> If an expression is needed here, I'd suggest to use !!, as we have in
> (luckily decreasing) number of places elsewhere. Personally I don't
> understand though why a boolean cannot be used as an array index.
> 
> The '!!' isn't a solution here, we'll have other violation:
> `!' logical negation operator has essential type boolean and standard type `int'
> (https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/10674114852/PROJECT.ecd;/by_service/MC3A2.R10.1.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}})

And that doesn't fall under any other of the deviations we already have?
__isleap() is used in another boolean context after all, and apparently
there's no issue there.

> Well, in our case boolean can be used as an array index.
> But index value is limited: 0 or 1.
> I guess MISRA wants to predict such errors related to index limitations.
> And I think fixing the code is easier here, instead of writing a deviation.

It may be easier indeed, but ...

> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
>      }
>      tbuf.tm_year = y - 1900;
>      tbuf.tm_yday = days;
> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
> +    ip = (const unsigned short int *)__mon_lengths[__isleap(y) ? 1 : 0];

... especially as long as it's un-annotated, I'd be very likely to submit
a patch to undo this again, should I ever run across this after having
forgotten about the change here. At least to me, _this_ is the confusing
way to write things.

Once you add a comment though, you can as well leave the code unchanged
and use a SAF comment.

Jan

