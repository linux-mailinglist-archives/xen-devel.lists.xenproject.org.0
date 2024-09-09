Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586DD9718CF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794367.1203243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd1H-0006AI-Jw; Mon, 09 Sep 2024 11:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794367.1203243; Mon, 09 Sep 2024 11:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snd1H-00068W-HI; Mon, 09 Sep 2024 11:57:23 +0000
Received: by outflank-mailman (input) for mailman id 794367;
 Mon, 09 Sep 2024 11:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snd1F-0005Q0-Sr
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:57:21 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab71c5ea-6ea2-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:57:21 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so4630794a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:57:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d258317d6sm330791866b.29.2024.09.09.04.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:57:20 -0700 (PDT)
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
X-Inumbo-ID: ab71c5ea-6ea2-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725883041; x=1726487841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nDv0P5jbmT2u0Ey3tgryk5HBuJOs627/pyiJAL+Ia3I=;
        b=gBXNw9wf1K7tatQfH1xVycP3FvTMcmKcBPPkGyCs2Ha6rK+aCSNq+MpmTl140X4gQq
         LGYf9RlSlV8jsx30MbrZn2NxXrqk7K7lG9Fk/P+gKgHOa4fVgoBPWsBKkJDmbIQBpgDb
         4ZQlq2xgXBWQ6tzMD73S1NhBaz9IX/BAEN0iNnEymyIWKhxaAoqAZL2CPEEO1kQNmrgy
         d0cxuK9Aroq8/2SjFoWpVHjombfnZcEAFvdr3QPr4hwfol1NhbVc08Q/GXpelLs0ETit
         IHPStZ7nnNZ/6bUr4MWQon+seTeF/jAv5m/WbPcFm/cJ+VyFZgRIcquZSHEH1gEHsr1P
         8aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883041; x=1726487841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDv0P5jbmT2u0Ey3tgryk5HBuJOs627/pyiJAL+Ia3I=;
        b=Li+fiODMTdDcNGwDQ8z9uBsT213Kuzl5FdF+aHu8ayCUfQ9QRUKJvfa7R1g7ot9Tx2
         Tmung3XG3T8tr2olA4CfPxqV4SH2eko594NyH+1DS5EssO9ulu5pMFXugIvXC6zEqu+/
         0KvE7H7j4tgyrOc1PAHfO0eEZ7a8fzjmK8KXp9o5YDQANOSmf/IV5WTd2CQlWbiPaHWy
         ZtF+hGUOqqpXvAVXxDMyfOIKjqSMODhxCqPfL3WCg3k8Z9GIjInSMS/eCvKv31keA9ox
         7L/qXOIbQIa/k3qhBIAk16gNXkZr6MNhGNe0AALtVSyhNRp++1+VfNLc5PWP3geiKLXF
         +nIw==
X-Forwarded-Encrypted: i=1; AJvYcCX66Um4grHf8jQOIF4WkHnQ6Xxt3Jr/6vY1ED1SSg4ugFoai7FcXv7dw1cWqroSDJga8CnPMHbevO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzP35t6a5W5ZE7ZMj5TGB7ZsJHD9AYtTIoszMFOcRXFvPwepa4n
	NAXFd+O5k+grqDk64KesMa/KkksOVhkyHVfg5im0z5cnXPwaOgq/00bera3KmA==
X-Google-Smtp-Source: AGHT+IFz1YEt4ruAwwsurlt0FWtEqBEc6Z4uu7/bzsa21efCYn/Mr21Rz1wr/TReAD5PeMGoZ1mFQw==
X-Received: by 2002:a17:907:3188:b0:a86:6d39:cbfd with SMTP id a640c23a62f3a-a8a88858b3cmr745471466b.57.1725883040872;
        Mon, 09 Sep 2024 04:57:20 -0700 (PDT)
Message-ID: <bea4b54f-c885-4724-a7fe-e8e1113f1d30@suse.com>
Date: Mon, 9 Sep 2024 13:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/build: Drop unused includes of xen/cache.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
 <20240905220806.141300-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240905220806.141300-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.09.2024 00:08, Andrew Cooper wrote:
> None of these are used, not even transitively.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



