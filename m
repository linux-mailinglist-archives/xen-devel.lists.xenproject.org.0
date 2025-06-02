Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92959ACB8F7
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003647.1383237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7R5-0000wc-Ts; Mon, 02 Jun 2025 15:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003647.1383237; Mon, 02 Jun 2025 15:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7R5-0000u5-QT; Mon, 02 Jun 2025 15:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1003647;
 Mon, 02 Jun 2025 15:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM7R4-0000sm-RE
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:50:50 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a5823ef-3fc9-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 17:50:48 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a375888197so2333443f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:50:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afe96781sm7798189b3a.29.2025.06.02.08.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 08:50:47 -0700 (PDT)
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
X-Inumbo-ID: 5a5823ef-3fc9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748879448; x=1749484248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JCcK73cs/9H9t85O0GxARqxzcSe8RU3p6Y+o+djw8jE=;
        b=g54ub1LBp2eRMg3bm2/4uQMkquVBq3Zwt5LwYqlVed0AuLvgqeOC2yjlkB4LMtvoPE
         YURY2WutJkhdu/73X7Wqv2spBmcvLPx4c9Z3z/FEQ0jWCmU0gcjUR/8sk+Ft7HCqKyn4
         mXWWfRReYq7Fo98Y7QtWAvv/lx4i1AgwHd6ddSsb34RMaY8WM3V9eXydpP+iSV3dkJN7
         IVsJnJJPVrhIq6dkGNUdtZm9R1z9UXI//JVS+x3Arq2FKt2/HA07pRFb0s6EgkGQ1pXm
         rpjSthLZ0Nxsgtoqb4t1plzx1zP50wfyyVXYyWdvaH7Ve57cTJVpzRjoMq5PUVERakdB
         4OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748879448; x=1749484248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCcK73cs/9H9t85O0GxARqxzcSe8RU3p6Y+o+djw8jE=;
        b=j3HGKr6N+PmestIvDxzz2xOkrHT1xv3fJJwPcLAgnDtDn3PUA5S0ObzyVg3zEwXUwU
         JL6nbAY/aN5Z5r/Mg49ni3DchmFAcElPIrW1T3c9HNJhlt0q6ZiLRbM+fdqC7SJPDXwF
         xbtw5GLBP91KHN8Tr+AMwyNpybuh/WPjcFUgc8oZJg5W3vmo4hgrbm7G1WIkru4GxPVL
         FIXAK+D1B38JLIDOuGVJQ4ozyycI6lvj13JuL6CULKyerF2CGHilYoxUh9lI/nuou5+Q
         mIbfXMHrndYsc+IVoDo9djEcNKL6HVuzrYFwc0CCFwZUCGUoJFQuppSk0DBLAictrihO
         jPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlJsIjvvNBzq1AtrOGMGeARBuwtKbYXGfB2gQa/x9XZg2H6nanoqS6PUvhme3JQsQ4NicTm01t3kA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz01/r2xf8/23JU1TWEQz2hDjSW2s3DuC/yOgD/T1Bp8TponYIK
	0cuyQc8DwrcOgKT2VyRgNW1fWswZ2YQqrlVuCTjhukG5DAXD7bhTag/fJAO7FFlrsA==
X-Gm-Gg: ASbGncuX9Ewd6tzLWSRmGWsTSVB3YgLTGbmMb8NTYJB5eheUTg5e4h9/iP/wY2YKELW
	ZA8WMlqCFQZJICuKBdGTorNKF/qVCctGG7tTGHnNDS7smjs4T3a5hsMuYL3qo6UGDHsyJ/xrYF3
	jxtntZXOgtUMk2as/8wtWF0I+S2GIboFFpiiDKnw9cv9WkRT7GJeYs2q5fNU+zfELxdxA/1QiuR
	vRAWNlzLD4FT168WAupZxehs7HOp7t8rBu7vngBhOMXQFn0ZLbTTiOc7YsrzOd52X4wmW1N+ZX9
	/546rjy0s7K5yMyZLMJMflK4WMrUT6688ACHHot0DORSPCJ43hhKES1SUtTt8FlIKWVkFu4xCOf
	4V5m3C5zTp4bnw3ZbNtj9pDm19M07krGhp76vJFPAZWEwWLQ=
X-Google-Smtp-Source: AGHT+IFu2iPd4yaF5j0v15LiN7mjt6B4RyMR9nCD6RCIe+3okpsyhVh6y/FN9tkswPETAwEt3xjhiQ==
X-Received: by 2002:a5d:5f49:0:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a4fe39475bmr6730730f8f.29.1748879448024;
        Mon, 02 Jun 2025 08:50:48 -0700 (PDT)
Message-ID: <811c154c-d7d4-480c-8898-a21f62f2cf6a@suse.com>
Date: Mon, 2 Jun 2025 17:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/vpci: Use $(CC) instead of $(HOSTCC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250602150929.10679-1-michal.orzel@amd.com>
 <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
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
In-Reply-To: <e3f4b507-5f66-47f4-bffd-6cfda48bea3f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2025 17:36, Andrew Cooper wrote:
> On 02/06/2025 4:09 pm, Michal Orzel wrote:
>> These tests are supposed to run on target. HOSTCC can be different than
>> CC (when cross-compiling). At the moment, tests installation would put
>> a binary of a wrong format in the destdir.
>>
>> Fixes: e90580f25bd7 ("vpci: introduce basic handlers to trap accesses to the PCI config space")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Oh.  This didn't explode in GitlabCI because there's no ARM version of
> *-tools-tests-*.
> 
> Can we fix that too please, seeing as there is a real ARM board?
> 
> Also, I guess we have to finally sort out the CC vs HOSTCC debate.

I think the situation here makes pretty clear that HOSTCC is almost always
wrong to use for tests/. The emulator test harness is special in that it (in
principle) needs a target compiler (CC) and additionally an x86 one (with no
present representation). The present way of (partly) distinguishing the two
by using CC and HOSTCC was assigning wrong meaning to one (perhaps both) of
them. The (or maybe just my) problem is that in the toolchain world it is
build, host, and target which are distinguished. As per Michal's description
my understanding is that HOSTCC is matching "build" there, not "host".

Jan

