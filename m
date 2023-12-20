Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299E819B3B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657493.1026355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsid-0002gh-Ba; Wed, 20 Dec 2023 09:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657493.1026355; Wed, 20 Dec 2023 09:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsid-0002eQ-86; Wed, 20 Dec 2023 09:18:23 +0000
Received: by outflank-mailman (input) for mailman id 657493;
 Wed, 20 Dec 2023 09:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsib-0002eK-LS
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:18:21 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a1a47b-9f18-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:18:20 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so59313875e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:18:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b0040c4c9c52a3sm6588727wmb.12.2023.12.20.01.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:18:19 -0800 (PST)
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
X-Inumbo-ID: b7a1a47b-9f18-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703063900; x=1703668700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wY6zpPMEJxP/sYRaRsIa6ez9ybWY8t3xykZwJPXugWA=;
        b=SovBDYwETNMcUMWZyGso0DXM+uoAZ5pl/LKPTDTDB/KOBSVlPy5Kj4L8jdWORi985n
         4UDy5nIyo+v1MSpjsFFanRMgKZScOdmqhzqK70NMvj0uZk3gDG2gX3CDmmxdCQ4vkYhu
         dRd6Vntz7mwR1OqOnzmUqUYbF3+XaCTXmN9yqE4uAoxPmvgsKUsiAiLdT9m1/yOQcLL/
         W7ACGRG0ZOSCLBT5IWW+LZIXu+aANOy1ifDFBBOHejgTwin8UA54EgaYvVNqqfZCstJZ
         rcXhap2HY3Lt7qsnL2wITF3UD7ZFqwp3Bg7kMW8EgTC7zQ8iZcxKafGfjzUbfEEJ5ZGM
         TRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703063900; x=1703668700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wY6zpPMEJxP/sYRaRsIa6ez9ybWY8t3xykZwJPXugWA=;
        b=HpLu3kMxM0Qdzu6k7cMq42Yw+3ZZs3EqHVma5U3rZzAqLnqqJ647/X0Nm0ZOMyeKGG
         6su3eQ+vI+4rw83FTECPmr2vsVKS6P8eehNpJLHmRCWtZT7Mf2e0McZUmK2VTKpKNHH+
         1EWLeIup3Yqr69o9Gj58qJkYB1Qc5zAyTkbB4sfTeCzVFp+rJHos20laVfP2o024cesS
         r3eN2n6QrBWFfYTgASPuiiEzfSC31RHkAa4SgNE/q0I0vjT+eErUEuPKiBEGYB+p4Pj0
         ArzEKb2CeHjwATEJXBQBmghk5bAYq1DbZOF2tseajroyN+c5wOy0on8ctYWCIrcFJcK7
         Qbfg==
X-Gm-Message-State: AOJu0Ywa/+a2TTpw7kLA3Rn223tsenEFdZ4SpQTaY7rYNijqpNtQyrxr
	EcEJPv2pGxNpr5iZTbrG7ISw
X-Google-Smtp-Source: AGHT+IHdeN59V1krgUwUIzpuFnWaV4Pm4LCCFdzwrbukE37G51ZBA84luBsjLHsm7psV2UNJnGaiZg==
X-Received: by 2002:a05:600c:224b:b0:40c:35fd:be17 with SMTP id a11-20020a05600c224b00b0040c35fdbe17mr9625277wmm.23.1703063899903;
        Wed, 20 Dec 2023 01:18:19 -0800 (PST)
Message-ID: <83a14a83-e186-4c91-936b-58743f1e136d@suse.com>
Date: Wed, 20 Dec 2023 10:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: move declaration of first_valid_mfn to
 xen/numa.h
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <ad7ee70bd00c0de4b6dad48c91281929e98ef95c.1702911455.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312181748430.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312181748430.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 02:48, Stefano Stabellini wrote:
> On Mon, 18 Dec 2023, Nicola Vetrini wrote:
>> Such declaration is moved in order to provide it for Arm and PPC,
>> whilst not violating MISRA C:2012 Rule 8.4 in common/page_alloc.c:
>> "A compatible declaration shall be visible when an object or
>> function with external linkage is defined".
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I was about to submit my replacement, just to find that this was committed
during my night. I have to admit that I absolutely do not understand the
need for rushing here; I thought I said quite clearly that I will come
forward with a patch dealing with two issues in one go. Now I need to go
and re-base my change, because all of what this patch touches is also
touched by my change, as the 2nd issue (the pointless presence of
asm/numa.h and the need for RISC-V to introduce a 3rd instance if nothing
is done up front) is still there.

Jan

