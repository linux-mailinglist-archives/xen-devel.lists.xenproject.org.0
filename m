Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD897806A2E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:55:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648989.1013175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnh7-0005hh-9J; Wed, 06 Dec 2023 08:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648989.1013175; Wed, 06 Dec 2023 08:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnh7-0005eo-6T; Wed, 06 Dec 2023 08:55:49 +0000
Received: by outflank-mailman (input) for mailman id 648989;
 Wed, 06 Dec 2023 08:55:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnh5-0005ei-Hv
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:55:47 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ec79325-9415-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 09:55:46 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so491897f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:55:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e8-20020adfe388000000b00333381c6e12sm11594901wrm.40.2023.12.06.00.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:55:45 -0800 (PST)
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
X-Inumbo-ID: 3ec79325-9415-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701852946; x=1702457746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OUYLbfJ+OPIUWWufbdxTRZ59WUsv0nRjSj+wv9/Bxk=;
        b=UN+HY90PsZ9/XoyoagPTjV1JLgaqy6lOWzeUO36defMapD535+g3qT05mam6RqPS5d
         Q4HTYaXKMKk1solnhK+4Mqm6/sksXtwtrwPrja25qkyLWbKJtv5qzO4upLvr1S64AtBo
         497Owil1JPPQ1SfldK2/ftIRrJAoIRjR9HU85c+M1oglFjLqr3Zk5rupXblizZMaOPsc
         fk10zwHuM/u0ZEPUm8qZYl1eXbn6LuwzhUVGrPmIw7VpE2vpalA7AtxCbsFqa1GtcsD3
         XF0fc2eBu/iCc23rbwa6deTxZBFoV+8hHAcSp+ugVpheVOHwkw7MGGwalee7o864NXV5
         Y+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701852946; x=1702457746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OUYLbfJ+OPIUWWufbdxTRZ59WUsv0nRjSj+wv9/Bxk=;
        b=Dt0ChmXCKFbhQiWXpcH6fduuMLwN3qBMHLees2twQIouyRpI6fB7WEK1SGQEaa4Zm1
         Mep9mnUDYJxZGEPx3EdlaavnmcclnDS189ilBIR+/z8Yl3rzkhus1L5aANCtCQ8bAakY
         q1LXSPhwvfj4L5fpGE5E+gS7BqsmpHLviO/nSwsdOxfpgCe0g4797/BJxA19WuZEQfrK
         2s9CnV9HdJaemRUQb4UlyoqXrBHMKRdEzTasCKQYRssMo/M1GV8UHl5ViXYEo89kvPxd
         oZt9nhPqZczJJOuSWhShTc7CYjB2EKIhQE9uZUgW2KuXjX9v6OeOtO36TPxb2hjYx3cR
         HRww==
X-Gm-Message-State: AOJu0YxvL5DKHEEIEO433Rs/Ff9CN8yHYTaAmbBJ0sotijEFxTsQLGh0
	wnLe3c0qDIxMfOhxZqppv32E
X-Google-Smtp-Source: AGHT+IG7HuQISta89U+Wjz3DjSC9WfrqBXkbSpQ3Tt0b5hehxdbVMHBgCxKqfpYL4C3HSPmNlB2RSg==
X-Received: by 2002:a5d:4530:0:b0:333:2fd2:68fc with SMTP id j16-20020a5d4530000000b003332fd268fcmr253860wra.143.1701852946054;
        Wed, 06 Dec 2023 00:55:46 -0800 (PST)
Message-ID: <efde6c9e-142e-4ee7-920a-cce42387546c@suse.com>
Date: Wed, 6 Dec 2023 09:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/6] x86/page: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
 <626f8040804d8f7dbdcde57725ac4eab895f295c.1701764980.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312051916470.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051916470.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:16, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


