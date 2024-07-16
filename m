Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C659E9320E2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 09:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759335.1169010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcFY-0006Vr-JZ; Tue, 16 Jul 2024 07:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759335.1169010; Tue, 16 Jul 2024 07:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTcFY-0006UM-Gt; Tue, 16 Jul 2024 07:05:24 +0000
Received: by outflank-mailman (input) for mailman id 759335;
 Tue, 16 Jul 2024 07:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTcFW-0006UG-JG
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 07:05:22 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c42163cc-4341-11ef-bbfb-fd08da9f4363;
 Tue, 16 Jul 2024 09:05:21 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eedeca1c79so33651371fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2024 00:05:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cacd2d08a7sm7516304a91.10.2024.07.16.00.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 00:05:20 -0700 (PDT)
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
X-Inumbo-ID: c42163cc-4341-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721113521; x=1721718321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/yruyH7zdsCWrOqPTuir244f0sjUGJ3ulZpiH97Fp7M=;
        b=Zsn/ta9LnvJwFLKbjCzpytJtBrRbiqlvTxcXz9/W1rHre5h6uckXbDMRYRk8BMJGC6
         v0bvnY3Az9gOvoYXH+i9KMmnY+6BEB8k+PNvkqZRDpH6yo9x+0zLYEW4Df/wdvn/SPTH
         vFBG5GaanbP6xcFUPpPdjZq0nVXhr+eI38aTcm6wTOaqIkUfWthdd1wtZvidaB9JtlaT
         S5ETN2LC/djYcRPPDKN2e5EeYQgYGCl9o21BZrtrNNAMeiwOlFNVVxgovAl/pQaP5qg3
         fwT+gQCGUhTgwHSEVFyro5ZH67/mHsdgrUl/FKJTPwYfQsU43l7lAWrUGr2W20ixb1QW
         p2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721113521; x=1721718321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yruyH7zdsCWrOqPTuir244f0sjUGJ3ulZpiH97Fp7M=;
        b=AMjLB0Kg9yYeLHKL4RyKrcgIZGVr7tpNg8Y2MRNaju01wsf+TrUFghonvp5jSdvHSN
         euiVjcgE+G0HJ9BB+C0OTjctMHuTpFH9qoy7g+DcxNKvQL19+AgavuUZaPSGjaL+m/ud
         Q2rBMiRae3yXBjBVGw1UmtE54wioW+/GBXOEa8jDGEkkDMka9LQuhKa61nwlqiLCYEWl
         4nyJhhtiF/is7OtcxLE4mRtNblq7qukqprp/vr1sOYnUDwhkhWVadKzkjOIb3FnH0M/A
         +Ka4QAI4uMFKIM4Uk3qcPk9NC2Yioha/tdbI0HuOQySH9OS5VDvSyV/58+DE6nHPuho5
         eZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXeIh+rS50Oo+2LIWG+uch7kUmVARExtfSC92cfVftdu33+lOdi6wCaJ+L5dcV4U6/eLKovJzxWk/NOPVRVL4lsSdmCI8MUM0eyVeu+2rA=
X-Gm-Message-State: AOJu0YzZ/ilbmt1e7tzXefehqhjNK9M5z9DKufe744h1XCmMAAHqeNH5
	eUukfDVgQ8EEi0U9TAcR3hEpsh0s7Ch1vjD7VgKg2dK9QN1sAA2meASzX6fI5A==
X-Google-Smtp-Source: AGHT+IFKjFWGiFK1a0zg02Ns3PX/5V0LaVHVkCLf9kG1wcz3vcdjfwd0Vh9vuJTM9Kwd8mzB4vyxSg==
X-Received: by 2002:a2e:9155:0:b0:2ec:507f:7319 with SMTP id 38308e7fff4ca-2eef41dd853mr9422821fa.43.1721113520890;
        Tue, 16 Jul 2024 00:05:20 -0700 (PDT)
Message-ID: <6cfb8a87-a3e1-4bd4-9dcb-59e9a12e668d@suse.com>
Date: Tue, 16 Jul 2024 09:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 4/9] x86/vpmu: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <67c30f4ef05846f8c3b371eb5fb2de4bd42eb5f1.1721050709.git.federico.serafini@bugseng.com>
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
In-Reply-To: <67c30f4ef05846f8c3b371eb5fb2de4bd42eb5f1.1721050709.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:48, Federico Serafini wrote:
> Add missing break statements to address violations of MISRA C Rule
> 16.3: "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

And my R-b was lost?

Jan


