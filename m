Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8601C396B1
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 08:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156513.1485575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGuXv-0001sG-M3; Thu, 06 Nov 2025 07:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156513.1485575; Thu, 06 Nov 2025 07:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGuXv-0001py-Iu; Thu, 06 Nov 2025 07:36:39 +0000
Received: by outflank-mailman (input) for mailman id 1156513;
 Thu, 06 Nov 2025 07:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGuXu-0001ps-Be
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 07:36:38 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fbe2d06-bae3-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 08:36:30 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b472842981fso30228566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 23:36:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72896c814esm146795666b.68.2025.11.05.23.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 23:36:29 -0800 (PST)
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
X-Inumbo-ID: 4fbe2d06-bae3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762414590; x=1763019390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BtwYyPAmaEz5JSyi5EkBfHhtYNWZVpEUSgWuXT4T6Qg=;
        b=FHApuhO3USnfn52AiJqPdgjQ7GX0kWhCIeXVqvys+Ufl8l4pzbN1AD52TtggkzMEyX
         IXq1/KT8g6Y5hC6UeyaQXDgPWoqI5BpG2IWq6vAsFLdzRH3/yQKz9kKCWsH2L5R0O+Qr
         b4L/dSL+XITnvZbbYlpsi3nhGyi2ipWWG4cb+XdHcnu4pth/YpMTYiHmGy+VXFATdMpL
         waHaa/cheQFfOK0v21mg1NtKIogxsnzfDFbf6p/Ns2szM4MUP6Ay/keBFLTwUodnZyyS
         hXAnRVnirUv7Oly7f8SDEG5d6lYLxltlC2upcxtjg+70kaTvPhdg9C2xzknFY9615HqW
         gagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762414590; x=1763019390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtwYyPAmaEz5JSyi5EkBfHhtYNWZVpEUSgWuXT4T6Qg=;
        b=CtH5jYG7aDxLtPXmbvZqkf1qAENpkwejD5yv57X8TlDOBbVu6b9NSe0XkXUk3wEc7A
         qxZ0zj+Ebr86z4eXuLXUvf0fmzU+7T6Qd7HmRDZbXv1tBPwT9l2UWLRQhp5Rs2Wli9R8
         CHM1XC1zg/VWK+0Jfy2+a+TFgB5lYvXv2rhGaYX1owYFs4XBYjrIRpjLdMUi4IGfV9yb
         QKDPQLDUNsjnsxFiWx7lp6apa2s4DbZK2pMFQV30n/5dTwlZImF4HwDEXN3tc8yC7l6k
         8ORPfKJKT8Cvwj/SBVYOh6iXshGWyZEQjDUFqdSilIOCjYucunDnLs8z3ftaF/dkymet
         h/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJlY/KP7SmTqRz/sYJ/Hgos9qZH9NtUTGw5S2gVfKbfAz0StOvRoXv/FGInkwPeEuZUwDFsgNlDds=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHreRs2VfPLITOCqhgowzKJWvgwfGfShY5nQHGY1ztbHlObm1p
	7B2sk6gqpRFPIle6TQeK5RvqvQsdYkz993siY+ZukHYTlS9qChKbYdHzXVQyYZ9frQ==
X-Gm-Gg: ASbGncvWlGuY9BgleBC/n408a1Q3XkDr1ZHRCJ3+rJHyAism/5nMqZ4PW2C6Q8C0GQM
	i51tQYK1QDjgvcam58C0OeCrNyWqtnFYijK1ZNfAlaWc0o5bqKpVzwFz6Gus/F+83jn/yvSF2oL
	VtA0m8SlhF2loFBAU9sADC4M2xJB/qnXiQad3Ttyzj8pNk5J9Z5A7Wy/Zb7PyY3nijvBKkk6BiO
	0dsB5meqaspl/71YU2YqoBTJH83NxXgEnvTGiSYRYVClxtAoVzqRxjlZDtz97RAUNfXLWaVa5ho
	6twI31ZNUggU5VC2TZD+PT645oMXbieTEUNjM/JYU99ICzPa0ea0kaCNkjfDkR5e2H/H7k0zagc
	ghcUbE35Z+gATC0DLZiQRHnr6ZG9IhOElS4k7iQVr6RcXd4f9We6Wz2cgNcfeyvpWwKmbeCs9MX
	eERnx62SLQOKaNkPpr7nHDxmULNY6xyXGEC3nZZBB/TcLxof5SkZy8yelHbzmirQoIgXZ9384=
X-Google-Smtp-Source: AGHT+IGkilK1aWhpGvi+J8pY06M+wPz+NlZhbhURE89ITjs6RENAGyN9lkgvTSbvJfcqL9tCR2Qgxg==
X-Received: by 2002:a17:907:7256:b0:b6d:8ce4:ff18 with SMTP id a640c23a62f3a-b72651557c0mr643357966b.9.1762414590092;
        Wed, 05 Nov 2025 23:36:30 -0800 (PST)
Message-ID: <1ef6423e-91bb-45db-801d-221de74bbd2f@suse.com>
Date: Thu, 6 Nov 2025 08:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: adjust soft-reset arch dependency
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
 <3baba476-9d64-4619-b391-4afcc5fd7dba@gmail.com>
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
In-Reply-To: <3baba476-9d64-4619-b391-4afcc5fd7dba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2025 12:33, Oleksii Kurochko wrote:
> 
> On 10/30/25 1:10 PM, Jan Beulich wrote:
>> Arm's arch_domain_soft_reset() returning -ENOSYS is quite unhelpful: This
>> way a domain will be crashed if a tool stack mistakenly invokes
>> XEN_DOMCTL_soft_reset on it. Instead the tool stack should be told of its
>> mistake.
>>
>> Introduce HAS_SOFT_RESET, implied only by x86. "imply" rather than
>> "select" such that HAS_SOFT_RESET can later gain a dependency on
>> MGMT_HYPERCALLS. That way HAS_SOFT_RESET will go off when
>> MGMT_HYPERCALLS is off.
>>
>> Check the new setting early in domctl handling, and compile out the thus
>> dead (when HAS_SOFT_RESET=n) domain_soft_reset() as well as its dedicated
>> helpers.
>>
>> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> 
> LGTM:
> 
> Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks, but one remark: Here as well as in your release-acks, can you please
get used to inserting a blank ahead of the opening angle bracket? Roger had
asked (me, not you) about its absence too, the other day.

Jan

