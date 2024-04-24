Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9A8B0A12
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711409.1111334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzc6H-00005v-AO; Wed, 24 Apr 2024 12:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711409.1111334; Wed, 24 Apr 2024 12:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzc6H-0008UU-6u; Wed, 24 Apr 2024 12:51:49 +0000
Received: by outflank-mailman (input) for mailman id 711409;
 Wed, 24 Apr 2024 12:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzc6G-0008UO-AT
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:51:48 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 691ddc02-0239-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 14:51:47 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41af670185fso7060575e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 05:51:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q15-20020a05600c46cf00b00416e2c8b290sm27777141wmo.1.2024.04.24.05.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 05:51:46 -0700 (PDT)
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
X-Inumbo-ID: 691ddc02-0239-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713963107; x=1714567907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eu/SFWKb4KKWc8XYifsnnkB7wr7xZQX95q2t0lUGkQQ=;
        b=OxdARhrfAakwBSu9QNjVbVO8pFe9McdOzhjIVqSWn6GK3fiWoRNf5bDEi3kxR6NuZV
         QPOHo2OUXM7n3J4s1XSmEqkGZ/qE1Bf9IWXAo6lQAx4VQCv3aoaUlL3428dbDKsiGQwq
         F9awkd1LHqnsQ/a7hCe2pBVTgdxNSeeXj49NiHTpbHmmmgeXAXDOB2B4UDvwCmrV/GgM
         VBqPwEIfjeCeVm4ajh21Khv3fsXsT6pV5a9h18g52JMlLYSI1Q7YHxE/C65cur7IApbC
         TCIdkBmCFkrSP+66sTCQBC46GjoAhsigCT25jYaT9NUv7ozcSwgJc716PYMudWwpnPuR
         Snpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713963107; x=1714567907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eu/SFWKb4KKWc8XYifsnnkB7wr7xZQX95q2t0lUGkQQ=;
        b=qDgW3EeXd208GNs3CFE5SNpVjD4DkR3n64sVMo5jxvFk0eXfaEAAVFlThxOzs6g0ab
         /GOxMYtfn44WYZ1jXmK4baY0dYCbwAglD8SoEOimCBprfMEHg18k+3aXWpn4xi9FnZvX
         Mrp4nzvDSim2CE4QRxEOeTZuMhfJ/JxL6DykimTlbJh7mCYNuF9tL9G0NBuQJFIH9Ie5
         ioXWOmzLcu0ecAvHGWFIVCmNrBzZrehpZmOlJvpHC08yYoBRtXOd5w8iIKRxCDkuv0Av
         u/YP0CNKsiTthgFfNYZDAo0IiIaJ9qajk/pGke2rQswkiDcQ0zs/u4+C+Sl+cQ6qyIlS
         lKVw==
X-Forwarded-Encrypted: i=1; AJvYcCXb2pCfQZ74m/ZR1ERioca5EhQU3rwnGv3iO3GFDkm1aT3lIqMJX1I1JuaSq6O5E6+DHxwncw0x/Jwd37nUZCnRsK9H1R3PWvUuPInmZgI=
X-Gm-Message-State: AOJu0YxU7Gx/h3Z0amMg8H+7J658hd5OL4DcEJfsXU+9mpa0rdMu7znf
	fIhyy2WKDSyABIga+XtYzC0XnM5A31Vj9NhK/tvrGr12ys7KVQM6wxz6KXGxtQ==
X-Google-Smtp-Source: AGHT+IFgrdOTBL5Ft4+F+EQh9bFvluJMR45rBnLmskFzz6K1KHSHyGtgsiu6+ef8CBl5vCrLfCjs6w==
X-Received: by 2002:a05:600c:3ba1:b0:418:b9fa:43e9 with SMTP id n33-20020a05600c3ba100b00418b9fa43e9mr2021087wms.29.1713963106771;
        Wed, 24 Apr 2024 05:51:46 -0700 (PDT)
Message-ID: <424463bd-2682-4f77-896c-f1d1f47aadc9@suse.com>
Date: Wed, 24 Apr 2024 14:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] x86/msr: add suffix 'U' to MSR_AMD_CSTATE_CFG
 macro.
Content-Language: en-US
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
 <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 14:11, Alessandro Zucchelli wrote:
> This addresses violations of MISRA C:2012 Rule 7.2 which states as
> following: A “u” or “U” suffix shall be applied to all integer constants
> that are represented in an unsigned type.
> 
> No functional change.

I'm inclined to suggest
Fixes: 652683e1aeaa ("x86/hvm: address violations of MISRA C:2012 Rule 7.2")
as that change clearly should have taken care of this already. The line
changed here is even visible in patch context there.

> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



