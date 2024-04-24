Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9E8B0337
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 09:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711191.1110987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX3g-0004pr-4a; Wed, 24 Apr 2024 07:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711191.1110987; Wed, 24 Apr 2024 07:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzX3g-0004nw-1j; Wed, 24 Apr 2024 07:28:48 +0000
Received: by outflank-mailman (input) for mailman id 711191;
 Wed, 24 Apr 2024 07:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzX3d-0004nO-RC
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 07:28:45 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47afacc2-020c-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 09:28:43 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2db7c6b5598so86061841fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 00:28:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm26604454wmq.34.2024.04.24.00.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 00:28:43 -0700 (PDT)
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
X-Inumbo-ID: 47afacc2-020c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713943723; x=1714548523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=YqCj3W2M6OW5EV2G9+NdaomUNfnsSh2QHssAjnQhh69BgazuBR6KK0lUIqkkgKLjBI
         sPCwW5rzB4dv7GT3a8d38Oc/aAkGCKpAQjiM1Lon66DhJrA/fdoN4RoF/rpAk4fl1dQI
         Ha4qUGkKha2VrZfd8IwNdibIuVWIIfqMVq5l9lgoimp6KjRjaqKk7sgT70hsbSYe0OUH
         6RJXWLIGT224zWj84qeCv9kXoTlGZR0ud8afX0meGb6y9MDx+eNe04Q7vU7hQLl0Ulye
         MOgI69QELNaenJ+lUKd0YA8l+uftnc9fYeR9PZFb0p0SKkPk/xSPxG2Wu83Tp+rTbrNO
         ibWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943723; x=1714548523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5X0Zdmp/5vAXHNnlark0kMUOgAR7ijjsaVoa8nppOY=;
        b=bCI7ZAzv0hDXV+EFiRC53HZqANTCIL01xDjSLGCI0viEwdpboNCoe4HDE1ycA8t7Xl
         Z9jvtqT6URLiKEGTOO3Ddtf0ytfGWJ46bIQThTqJbNHh3mUICMZrG6KXZIX15fOs2TeD
         9gPjTnKpvYf9x/hXZaDSmTsiJ9blVJX/dTLQi7mDarJk+Cj/IGmZ1ogkxjCdH8vdsdw4
         B93fp44o/S6/SLRwgU+o/m2X4jBcrPq6qMTjsnTEBdux0enGQcchPWtipXBDDcH8qs5R
         XdhGYbLBRyaXV7oB/ZlSGTxW0+22fn74o3KljtJnlo4YncNqG/VWI/J+xIBAFae9VvH+
         48QA==
X-Forwarded-Encrypted: i=1; AJvYcCUikynZmwRpCW6k8IzAjOPCsd3svBXc66Zk9iswPsfSKK2nWKiDZloh5cBmpc2nwm5tHTlB0bM86hlrrrcYL7XAvcURNOks9+gN9peYXCk=
X-Gm-Message-State: AOJu0YwuD/NEXHZ2jk8bfLxQCHfdkawXnfM1zTHm/30uUr63fM5G4B7G
	4wHBsFZfTWoUtl7c7p2w5s1GsjIN4nstQBGEpz5pbHMMrNC+f+KTqz6KBX+YtQ==
X-Google-Smtp-Source: AGHT+IHO2xxdNIUwJLg6ImbaSSmVryTmkOio5s8qwbQCpLJuKPCEmGr2lza7S6J49pr6r2bbAuJ7tQ==
X-Received: by 2002:a2e:bc18:0:b0:2d8:635d:56bc with SMTP id b24-20020a2ebc18000000b002d8635d56bcmr1129467ljf.23.1713943723399;
        Wed, 24 Apr 2024 00:28:43 -0700 (PDT)
Message-ID: <1cccd211-7b82-4898-ab0d-04e7f684962a@suse.com>
Date: Wed, 24 Apr 2024 09:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/10] x86/debugreg: address violation of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
 <d0821fd968d371d03b6b336dd4b5226c1f5b68c9.1713885065.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d0821fd968d371d03b6b336dd4b5226c1f5b68c9.1713885065.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 17:12, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



