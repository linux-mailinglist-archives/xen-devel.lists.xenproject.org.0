Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9DC818641
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656719.1025124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYCm-00054H-JB; Tue, 19 Dec 2023 11:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656719.1025124; Tue, 19 Dec 2023 11:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFYCm-00052O-Fd; Tue, 19 Dec 2023 11:24:08 +0000
Received: by outflank-mailman (input) for mailman id 656719;
 Tue, 19 Dec 2023 11:24:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFYCl-00052G-Cq
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:24:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1eb749c1-9e61-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 12:24:06 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3363aa2bbfbso4674080f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 03:24:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m16-20020a056000009000b003366811fd6bsm5223870wrx.14.2023.12.19.03.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 03:24:05 -0800 (PST)
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
X-Inumbo-ID: 1eb749c1-9e61-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702985046; x=1703589846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsZeXOPv9S3nK/XDAcTKyrqtAr0C7riCX+yn9Di+91I=;
        b=AFpDdnVS6nEbkMkrv/LGJg4BEyLkzVfVRmpwjI5/nibq+BEU73IwokyGOqiOyFAxf3
         /CGtJeWiy0Pt24aozys7NN581l8lp22M6BNQSrY1KezQJVaEjPDUW9POseMLw4WtghAL
         Qk/mRtrEuyPxQE9Td2P/rubiB6Hz1Ij/LfxxGRkhbelerWwiZATxgAPPqF2Xfa17CW4M
         7b7Csvv+F17C7FKKw9FrFeIqRU/O5YGThHXt5RmevHIfRvBSZ8urSYMEZgBReT0NJld4
         GFAv8vdZBgEWxkwa05yC92JYRL7e3F8onxMZb92dH+guD8R2j0ilA4H0UrgOUYcPVHWT
         5vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702985046; x=1703589846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsZeXOPv9S3nK/XDAcTKyrqtAr0C7riCX+yn9Di+91I=;
        b=Gavdb2qGc9ESrnbY5iQ2V+pkrId3MN8L693qrNapXS91QTzin9iUAilCtOBpS8ZsWP
         fHslAx6kzcUXyiGhRz6iI5u6gyNOj2oXphn34Bj7/XOExK9rdmL4I0Wgi66lejtksnTZ
         1MKmRUZOEpAqcRRMAUOYCrIH1Ap2l3VWEzB2VofnKd8vhWlry/HAERy+reyn5edSs/Na
         08LfrsW1wwI3skBieLMgJkY7Ws/UTpVr7NmJPMdkbe9DM2YZ/kYKAB7mmSkh0XVaYPBv
         Upx9Z0z60Hj4p6MNkyggO9iZPjnPwZWUG1aXDV1mRE6rIVy0ju3/j4278a+m9r6a1iJt
         Xd8Q==
X-Gm-Message-State: AOJu0YxCfanxhL841Tf4qv4BYWxMoNYKPdHdG3cMTbyjyx8E2gdvpg87
	PSI0suZzEnPqShQrMDAbTbTi
X-Google-Smtp-Source: AGHT+IEjzxxtdRggSagjRMlahhUxaJQIysTPEYnDGpG2fUiK9TYRlNTYPHeU+LWI8KTNhPIjm8IXsQ==
X-Received: by 2002:a5d:6992:0:b0:336:5637:4239 with SMTP id g18-20020a5d6992000000b0033656374239mr3863891wru.120.1702985045912;
        Tue, 19 Dec 2023 03:24:05 -0800 (PST)
Message-ID: <dd920868-11ea-46cc-b300-c332e74e2f1b@suse.com>
Date: Tue, 19 Dec 2023 12:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen: remove unused function ERR_CAST
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <e6152a631d3bb6ad4c798fe9d795b360100d63f5.1702982442.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <e6152a631d3bb6ad4c798fe9d795b360100d63f5.1702982442.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 12:05, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Function ERR_CAST contains a violation of MISRA C:2012 Rule 11.8,
> whose headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Since the function has no users, it is appropriate to remove it.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



