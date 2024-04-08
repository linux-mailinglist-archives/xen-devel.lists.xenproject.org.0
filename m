Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AEA89B94E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701787.1096289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjom-0000BO-UI; Mon, 08 Apr 2024 07:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701787.1096289; Mon, 08 Apr 2024 07:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtjom-000099-RJ; Mon, 08 Apr 2024 07:53:28 +0000
Received: by outflank-mailman (input) for mailman id 701787;
 Mon, 08 Apr 2024 07:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtjol-000093-FP
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:53:27 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f00fb7-f57d-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 09:53:26 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-516d6c1e238so2638268e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:53:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z13-20020a056000110d00b0034174875850sm8359750wrw.70.2024.04.08.00.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:53:25 -0700 (PDT)
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
X-Inumbo-ID: 14f00fb7-f57d-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712562806; x=1713167606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q21+13Ih1D4g09Geddm40/IryGoHeJrUpfeaEV1PTyM=;
        b=UGqm+RciDoDoOBp/mgARx8v2RYeUt5lU7CTyBQfckAS/GH33ud2SRYxrFV1eg6xvgz
         Pt2qVpq0Hi+3XEbPXH3wS04NXpF9JZDe4pXFpd7d4qHJrlkQwzIMN7eYng+fnsHmVdNB
         ZAewnJubCixWABFBZrkoFQDPCT/Abwr8CPWtiYFvzqX75HgOBRNqaL3pzT7wPffaoaA6
         8DUK9YQZsKLG85R1PiA6Ri6cajmuoIf6sD/9f2hz8JLaaeypsfTnxFPuu8tO7QJDOdKf
         FG2ZnhiT0kqQozObiZK5puXLEdnUhjFguMpCavwklA2ObcOyJj6s4Q7HC8EWu3Q2qB1a
         /mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562806; x=1713167606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q21+13Ih1D4g09Geddm40/IryGoHeJrUpfeaEV1PTyM=;
        b=YnO+IU6QzauCSO/ZKj2JL2W0glNOYhOsOT1mgGzvqR0TSeNHJYDmfYnPuR1aU+2O+X
         VhVWPEmxkR6t3eZwFhgmRhBMv4pDmHyIEx/CfbkXKXp7+OXc361B4h8hhxOnsvCth7QQ
         qXY4FmApbkKGh+INYK8cbu+DuX6+ft8m34tuWchxEOHN3qFrzx7O5d9mS7H15DBPFJha
         lAazq159TjbZEot84WZFdwVoAQbOBy0ib+WxufWB8Eoxp1TfhqeUZpYwN1cxyYGW3zpd
         EIRSZSI/yyOtYQsNDmmAFitPWELicsceNuOWhvP2AKBrK7mtIuzk793kJral9RowJT1G
         06mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsEGI8/kk/YesMYb17k01koJQj6ymhb4+ZtoKRX2Iyz1EBVH+5iKdz/6YLyxBUXHBAh0kNnTyYeyvtQZYJpgAZbZ2mTkrMRxfkzxBEMXo=
X-Gm-Message-State: AOJu0YylWi8zzEFLsREpQC6Q2gDVzYhS+JXydjoa3PXlTjnjmah6RfCy
	sTU3kvtRCkJpHWXQzJq+AasQsU51DhI3dWXLWppehRbJ+t0b3AnIxgT51hiqsA==
X-Google-Smtp-Source: AGHT+IFCrLStyWiujC4rjkyDaYf1qPneie3zCT3QzjnwNP8/Ui8k/ay4Aklh9GwnJnakStxY756Ewg==
X-Received: by 2002:a05:6512:3b90:b0:513:27a1:24cb with SMTP id g16-20020a0565123b9000b0051327a124cbmr6455768lfv.51.1712562806126;
        Mon, 08 Apr 2024 00:53:26 -0700 (PDT)
Message-ID: <57d40b07-fe98-43e3-a5aa-4839a24f641d@suse.com>
Date: Mon, 8 Apr 2024 09:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/9] xen/domctl: address violations of MISRA C Rule
 16.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <5ba6dafed08ca148f7ea92e4c8f7fc947f825cd0.1712305581.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <5ba6dafed08ca148f7ea92e4c8f7fc947f825cd0.1712305581.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 11:14, Nicola Vetrini wrote:
> Refactor the first clauses so that a violation of
> MISRA C Rule 16.2 is resolved (a switch label should be immediately
> enclosed in the compound statement of the switch).
> Note that the switch clause ending with the pseudo
> keyword "fallthrough" is an allowed exception to Rule 16.3.
> 
> Convert fallthrough comments in other clauses to the pseudo-keyword
> while at it.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably ...

> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -293,6 +293,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  
>      switch ( op->cmd )
>      {
> +    case XEN_DOMCTL_createdomain:
> +        d = NULL;
> +        break;
>      case XEN_DOMCTL_assign_device:

... again with a blank line added above this last one (even if this switch()
isn't all so big).

Jan

