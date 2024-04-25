Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005C8B257B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 17:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712158.1112618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s01HC-0005uY-Mq; Thu, 25 Apr 2024 15:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712158.1112618; Thu, 25 Apr 2024 15:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s01HC-0005rm-Jq; Thu, 25 Apr 2024 15:44:46 +0000
Received: by outflank-mailman (input) for mailman id 712158;
 Thu, 25 Apr 2024 15:44:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s01HB-0005rg-65
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 15:44:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbf8733f-031a-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 17:44:43 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso154747766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 08:44:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i21-20020a170906091500b00a5216df5d25sm9627924ejd.3.2024.04.25.08.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 08:44:42 -0700 (PDT)
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
X-Inumbo-ID: bbf8733f-031a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714059882; x=1714664682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42vflNR7QPzyJUAaeNHg+n4vo87cxc9nQbRVM8EohSg=;
        b=JZDt9p+AutNEWteLnwFLwDAT0JnQ6378tw6BAgqA9YHBSztpigxQpsbAE4e7oWgo14
         TI5Vuj2QC3ib/2DVuKkYbCsZMJXFLyrl0usgyjUL93Z42bOH9rm1aTE2JOH5IotWaAjo
         TVeVQVEPgSFKmuF6X8g+JorLFGvXSFflb/h4QDEn27K+5tozERZBdHM6DLYrEkno9M3z
         SRMLyy/ri03NEVO/4162QJoPzR81JddeEKvyYbCjuvMGtYSQkY29QyTmHRqgEulQdpj2
         UKR5ANPA412BoN7SEriUF9aCwnMj+19AKMpijcNfda3gBDkEchPWOcaU9PquDHd39oOF
         Zg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714059882; x=1714664682;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42vflNR7QPzyJUAaeNHg+n4vo87cxc9nQbRVM8EohSg=;
        b=SEmGeaxc6I5PP9KVw0HKE082q43HyW8ux1rORkFzP0g3/VU2DMTSQPXIERfIwMDzyE
         boxpt/hb2vKgExmpdyKNvM1qc7W9WXVmDXdoOU2un1o19hBWCU2TYUz71qCcMYx5+tgs
         ysuIbKGYIyxVHoFyNFHSParAhskbMnGOKFDLbNvyGp8D2a4/WH2yJM7ifgyC8NZeVup9
         ir0qN2RDPf2wTUOki49Fd2QFYFC7zRZR102Pfd87T85O1rKbMcktM0iN+OJoSRxb/ta5
         VaW9uTHR0mVyrCDHfvl3NGYsttc5qmqnC94yjEDo1Wc27uZNX+PldfXHOTV1WYoWtXWD
         TfSg==
X-Forwarded-Encrypted: i=1; AJvYcCWCf35puV3dhwEkxruvvZWr5Px3tLfrn0B9olmKxyniuFiiT2GJnVtZXHkprc76PAhH4qPcY4DeB+ccwFcreh99Mxsgfut+0OooWL9wr98=
X-Gm-Message-State: AOJu0YzFUU0LLycY8CSG8gBKczWuOQotS0D6b/SE7X+NZa5pMdz2gz98
	9qeDwmdhVEMsDbYEePSyD8GsfAhAyGKHu48y/PtUv+UgLXbVYNLlRMjmCMfZMQ==
X-Google-Smtp-Source: AGHT+IHuKUBvgiFsjW2uZsLF2ccbWLR590bIPT0vKphwcY0aN5KlPDhsdsld80xyxPzrfzFWUbtNDw==
X-Received: by 2002:a17:906:2786:b0:a58:7554:b641 with SMTP id j6-20020a170906278600b00a587554b641mr69466ejc.73.1714059882481;
        Thu, 25 Apr 2024 08:44:42 -0700 (PDT)
Message-ID: <a6245e9e-a156-4b17-8695-e072915fe78b@suse.com>
Date: Thu, 25 Apr 2024 17:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/17] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
 <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2024 12:04, Oleksii Kurochko wrote:
> Return type was left 'int' because of the following compilation error:
> 
> ./include/xen/kernel.h:18:21: error: comparison of distinct pointer types lacks a cast [-Werror]
>        18 |         (void) (&_x == &_y);            \
>           |                     ^~
>     common/page_alloc.c:1843:34: note: in expansion of macro 'min'
>      1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);

Apart from this I'm okay with this patch, assuming Andrew's won't change in
any conflicting way. As to the above - no, I don't see us having ffs() / ffsl()
returning unsigned int, fls() / flsl() returning plain int. Even more so that,
given the LHS variable's type, an unsigned quantity is really meant in the
quoted code.

Jan

