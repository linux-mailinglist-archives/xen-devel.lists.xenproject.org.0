Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE0AEA1E9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026640.1401825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoBx-0001mp-P4; Thu, 26 Jun 2025 15:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026640.1401825; Thu, 26 Jun 2025 15:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoBx-0001ki-LV; Thu, 26 Jun 2025 15:07:09 +0000
Received: by outflank-mailman (input) for mailman id 1026640;
 Thu, 26 Jun 2025 15:07:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUoBw-0001kc-1c
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:07:08 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39a490b0-529f-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:07:07 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so885578f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 08:07:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23abe3db391sm375525ad.139.2025.06.26.08.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jun 2025 08:07:05 -0700 (PDT)
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
X-Inumbo-ID: 39a490b0-529f-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750950426; x=1751555226; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1oPywFUyYv/fTsXTDWp8CyF7m0n1Bg6cJujbKlNGHO0=;
        b=IIMWI/5bAdYmQKohB0lfpN933LZ71uz/gPoV7oHaC8WrTeEwi0hLwy4Swb2DA8n33G
         LcoYK36P+CLj3gsKDOevyb4CNGZbp3qwj7BzmH5Gv4h1iyG17jahdBUCi2GJXFIIZsum
         p8XdrR3NVbnO7Ip5MLftQLzKEy+IPbyrhm93fQGt1Lz9mqb37gVmy2c1rQ2nX8KTwCbD
         0T9ifvfe/kUogGYeCbDibOJzWCbLF2ArXbfggl9FjVTPngGqp5FlyPbvY2F5ixqcMnn0
         KecIjCdneQ+MwIMqZc58xzyI8Y+WsnhqgYzhKixlU/nWvO38VhrNVNOcsf6e0WgKZOPI
         LRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950426; x=1751555226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oPywFUyYv/fTsXTDWp8CyF7m0n1Bg6cJujbKlNGHO0=;
        b=Pcmhv1Fmbdi9vWaNSiH2IabeEIrbVBiQBXeh4nIFXh5p8nHV8OrVBwPxSb4mnYwB/W
         Mil5ahjgRBghhm6ua6OLl03ng3mnoan4hpyfFFdglzGLDIgz0L6YRF0TdjJYF/3YIoyB
         WmLiZy+ilSiDsBeTzUSx/GbL5er9fkilmGsgqIdZXXIaB1gaZJLvyYv+19lLVhBcD6uv
         jUF81AmHn5r0wLnqU98vzAS7UGsL1yAIlhkB3CDPVo/AI+Du6sLge0HlzsvaXlsvcVFA
         3qbt8vz1aFNNo2JeoPW7vBuppYb64X4oVA18veyBEaiGR/gb4JDRdSY+8iTa6y8b6fMu
         ydNw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Rj2NqGFEDjdChucol5i5pj96us9BN+bOP+xeLghp1xPm8Bg4eLDLXHhu9CZJYGwE1Y1FyLybUS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6LuuLi3mTwBMOKE3I26dskp/E1rQBf2yX8XbkvXmCcLDxGqBD
	BtpIjRNny5RoBd/x3pZNfK/TgjWzA73+YKPavo4zbUlMplAsUgNVeqCIyZjAA5E+3g==
X-Gm-Gg: ASbGncusgjOT2QoEuRm2m2ldk/CgNHKdONe3rx87WgmiqTacHxg8y7CXbeHhhlecJI5
	y+ZwFfrVGhMVxxh+ED4MNBx+NleCcz7p3zyfFHE72tFZR+PrCL8MlgGvPs0aBZY2LNe/jUUp1+Z
	eNooimgfqkuJ6yAZsh/ZjIrs4YVoUe9Ac6WQBfSqYW2hV+845LBfCtwrSMfUJCHMscvu/G7bH/r
	1AUVKLvKUW0llsN5lJhYWdXnHebPdn2cMljgda+rIRsk40eOswhhPzNhaLzFwtTLGgLpbBzJjM7
	WobO5Y6g9AycEVOa4hMWuQXlQ8oPstM0x/C8sF5bf/tsBKtKi0Tw/mhIkPAkbeUEBxcZT8wbIRj
	TdiCf1Wwx7dUAWtPgURyhlslKwLIkIlChZG2Kaq1dvoQCZzE=
X-Google-Smtp-Source: AGHT+IFfpnQgKBgzIoesLSMa4iwugYZPf09Jey5rOcTdqytakJ5xS15YC8xF1favhNHGM7U+MpddNA==
X-Received: by 2002:a05:6000:18ac:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6ed5fac72mr6102493f8f.17.1750950425919;
        Thu, 26 Jun 2025 08:07:05 -0700 (PDT)
Message-ID: <51f1103a-0efc-4dfb-8ea8-9bf8ebe9f6a9@suse.com>
Date: Thu, 26 Jun 2025 17:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: fix unspecified behavior in tr invocation
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <df5119a0e5f617ed1a2756dfca77368596e2c369.1750949938.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <df5119a0e5f617ed1a2756dfca77368596e2c369.1750949938.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2025 16:59, Nicola Vetrini wrote:
> The result of the command is undefined according to the specification if
> the "string2" argument in tr is shorter than "string1". GNU tr behaves
> correctly by extending "string2" to repeat the last character.
> 
> Fixes: eb61a4fb14d2 ("xen: fix header guard generation for asm-generic headers")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


