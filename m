Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE443C3971D
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 08:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156525.1485585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGuip-0003WW-LB; Thu, 06 Nov 2025 07:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156525.1485585; Thu, 06 Nov 2025 07:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGuip-0003Ue-Ht; Thu, 06 Nov 2025 07:47:55 +0000
Received: by outflank-mailman (input) for mailman id 1156525;
 Thu, 06 Nov 2025 07:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vGuin-0003UW-Dd
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 07:47:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4f8b134-bae4-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 08:47:50 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7200568b13so116774866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Nov 2025 23:47:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728937dd4bsm155494966b.28.2025.11.05.23.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 23:47:49 -0800 (PST)
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
X-Inumbo-ID: e4f8b134-bae4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762415270; x=1763020070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ink/ZD5j4OM8DF6/xe+V6qGAlsfqYeTy8FxN7XWmuHU=;
        b=Ujd/QF5zoaTADszd2xbjEUN22DRjo4JOwA9zu8YNEtD7iJJMm0efphuC4o/DCLdbuN
         6e8xldfkzX4xqxxjQl8KhHJSzd90XYLr0AcoU+TuJoCNjmw7aW3tU5n74gy9gF+gB9GJ
         2dzRLVg+h14nzsV5lkG41vBJSaB5ClkUFzzOi6S7eEN+sKZOcs+f9CEhO3YU10huscXy
         4VcMF/dfmCQAIo+929l+7cY22J/dk8xtD07EeNUka77YC6zkeL3AbSRDIr3yV59KPYfd
         10NKC4DjZDYp27pgMMEZ74BMfUp/Exl2qc3jWpWfIVilKuaVeSoMToSiiq4HoyUrUjb0
         BmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415270; x=1763020070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ink/ZD5j4OM8DF6/xe+V6qGAlsfqYeTy8FxN7XWmuHU=;
        b=sGxUudEhmFhfukrsvOJWS4y2MsYJg8Lopm0lQCtraMKgfeqbI+5766CWNsUH4N87FR
         Sx0SwgQHcmF628R20RBxmAwzZQVZDMcmNJ+Gj3t2wDdv3eunXbiokF9A0hSBpEoXqvvg
         qEBKSu9znLrwEHGSWHXDTTuiXn4jkQEUJ28OsFxl5JF6IqZNjx7AYPCdlg1oAr5MdMI8
         N5QO9ZlTHibUIsoiMFwVLNdyxSgV4Ggh3tPDm2aD5HcKTbWp4V7+AXBFIpaX8TcEKa3j
         xO9oZ4Z6vZUF/fo6CYShTYL0xJKZHTCPpAILhbSnsf/N7Qe67pGWg+Jwsy8sAu175bzg
         CRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7yAcS//pczZYo9gbICOY/+frD0bkZ2GHZRLkVZCXAJyAyDK5Z+HWxWNCvpb8769BWIhzcN0IXpgA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIsZeIyMODFRpB+SwIwn9Ee5URmA7ielkVTUMGBGI2tyST9ieC
	cDi6GyVBmUSN3JRlSvMNRbD5u9JlU3l/WbG5O1PgWkZHCMmyWmOUnzUx0XeGbRmBwQ==
X-Gm-Gg: ASbGncsXrgzugYVBiVABv7Sj1DekH4jgENPphQmaSEdZydndOeBe2bdCUo38/Tvxkfs
	gVQrAMhEo1Klr9/ZNymKTvhMUJK/zpq1q/mBqI7l8Iz3oK0uvXh20wDrIrTbU3+FoaNmoJy33lA
	Ho/x8kJg/xySC1NIWhtjGYa+RtdtCSWLD45w3u4QELtSDng0huhG+DnSxQUiGYzHhGw1K/XVqD9
	ZCFO8OZiYHIl37ssG3v4ji2360rRoKWI6T9UAGeqDctK4rCmyGA096aTOq52tvEirJVivTISVuR
	wpGuo5NhXrjcvBzHu6extRQ9j2tejVSONacVfgimKo+VfMgIdmfLrvu5O3uo11JS87FqEAOQ6Zi
	njZEVI9BL8Lje2eoUfqzwwD1SxlX39Hw7Qk4EQ3GApg3gzIE7Z9ne55vRC3MqsQ0cvGHDjhfLlN
	FsYTPPDZKhIvNd/NO5Oo7xX/BKmHin7nkMOG5bpSaVYQQc6hxtoRIX47Z6J8x0agX7EGLlBB6Ai
	1FmVMjEmQ==
X-Google-Smtp-Source: AGHT+IE36vDZQaBorxVHg3UkIMBTExwdFwGhJUImNDuYnIRUKBGY0CNHzfj5WmfG8w7ZS8zHD3ReTg==
X-Received: by 2002:a17:906:478a:b0:b71:d701:cac2 with SMTP id a640c23a62f3a-b726560f2c9mr604368666b.50.1762415269879;
        Wed, 05 Nov 2025 23:47:49 -0800 (PST)
Message-ID: <43c10d2e-47c4-4571-8495-5106b6b5ca79@suse.com>
Date: Thu, 6 Nov 2025 08:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: adjust soft-reset arch dependency
To: Grygorii Strashko <grygorii_strashko@epam.com>
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
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, milan_djokic@epam.com,
 Sergiy Kibrik <sergiy_kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
 <40609db8-ea7d-4866-b7b2-d9647c64d512@epam.com>
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
In-Reply-To: <40609db8-ea7d-4866-b7b2-d9647c64d512@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.10.2025 14:08, Grygorii Strashko wrote:
> Hi Jan,
> 
> On 30.10.25 14:10, Jan Beulich wrote:
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
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
> 
> Thank you for your patch.
> 
> Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>

Thanks.

> But one question - soft_reset is applicable for domain, so wouldn't it
> be better to note that in Kconfig option name:
> 
>    HAS_DOMAIN_SOFT_RESET

I thought that "soft reset" is (going to remain) pretty unambiguous without the
"domain". If (in particular) other REST maintainers think differently, I'm open
to change the name. Generally my aim is to prefer reasonably short names for
variables and alike, as long as no ambiguity arises.

Jan

