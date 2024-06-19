Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E290EA61
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 14:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743755.1150723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJu5t-0002vY-DI; Wed, 19 Jun 2024 12:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743755.1150723; Wed, 19 Jun 2024 12:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJu5t-0002tL-A8; Wed, 19 Jun 2024 12:07:17 +0000
Received: by outflank-mailman (input) for mailman id 743755;
 Wed, 19 Jun 2024 12:07:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJu5r-0001r1-HB
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 12:07:15 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c7e2a2-2e34-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 14:07:13 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cdbso47218841fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 05:07:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c709daa42fsm1640971a91.0.2024.06.19.05.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 05:07:10 -0700 (PDT)
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
X-Inumbo-ID: 76c7e2a2-2e34-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718798833; x=1719403633; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nKnF4xZRu1H+OC8kbromdYm/WrmdId7lQrk1LdUmNIA=;
        b=GH1SqoP6uxT80NDzDn9+XDxwQul2H89qBgFFHdHSRTq4oM06Pd2eaVs/bLzZN4IRg0
         k32H3+Cwtcc9I5kO/KGwdLHKJ4kLlvyoeXywSfW4JSOAXuzXAUu8+lxpW2pOVfiNxIX1
         iN3mUbVQDFWDfxJOfkzGvlrOWQenld1KKGWyULoBf4eKPEG7WztAEXN9dyaOEKTdNQiR
         TY+EoPkEZC/uUvwXu8yEPFUJ1baPvGyDEbYfwWa7vWmlrVU30h6Me37z/ZMAUINyorVK
         ayV4Q6gDk7IJhO6W1d9VgiLnMtBcol1DvF0lF+2PTv/PyYS+TGN+w3L0gm37L8qMfxaY
         3Xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718798833; x=1719403633;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKnF4xZRu1H+OC8kbromdYm/WrmdId7lQrk1LdUmNIA=;
        b=t1RhimlIiNJIYV9btoz3Yjv1s6xG0Hz4XwnN897D2R1us/ycPbo/BKEyffzpJDIRhg
         TCAzB7a9acCnlfhZf9BEKCSiIh0J3oMtYNmqh5rg1D2PwIpzwSjkEUHZYwHUAzbFvEfq
         G+LOmRxFtqf7fUEbmSHDsrlpHQmByfldjBCzB3BR1MetADI28CpBoVGtzfAkdDP3JVLM
         9LLqGbSphSTyzqx+p9DI/jr0pQwDSHPqLLicJ8Iuc6z+/202pU79Z/jJQ4Yy72HXb7o3
         9VfoTzoEb9W0zp9PujikyXD0bSwAJUvyorU1PRM3F0yd8iJ3+9GxiUONPosQ2tv+5JP6
         pJSA==
X-Gm-Message-State: AOJu0Ywf71RVXtNzA69bHhjB9CYNZ5tWglHoJB17rEPAWzS9uTYB0TCk
	iSwTfkiHXST8+FmSg1d439tU0e6u9bY49AUbXK6ItfxS5/TJsDTbC0fMaGN7ow==
X-Google-Smtp-Source: AGHT+IEJWz7W+oSkKluCyJaGfVLWDakSZxCbhJCULRf6Amuo4yHhB8dDaIuOoQsbgw7IbXbcOQvw7w==
X-Received: by 2002:a2e:a787:0:b0:2ec:3f82:f9a2 with SMTP id 38308e7fff4ca-2ec3f82f9dfmr13055611fa.0.1718798831367;
        Wed, 19 Jun 2024 05:07:11 -0700 (PDT)
Message-ID: <7de20763-b9bc-4dfc-b250-8f83c42e9e16@suse.com>
Date: Wed, 19 Jun 2024 14:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
To: Anthony PERARD <anthony@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240516022212.5034-1-jandryuk@gmail.com>
 <64083e01-edf1-4395-a9d7-82e82d220de7@suse.com>
 <9678073f-82d5-4402-b5a0-e24985c1446b@amd.com>
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
In-Reply-To: <9678073f-82d5-4402-b5a0-e24985c1446b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 15:52, Jason Andryuk wrote:
> On 2024-05-16 03:41, Jan Beulich wrote:
>> On 16.05.2024 04:22, Jason Andryuk wrote:
>>> From: Jason Andryuk <jason.andryuk@amd.com>
>>>
>>> From: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Two identical From: (also in another patch of yours, while in yet another one
>> you have two _different_ ones, when only one will survive into the eventual
>> commit anyway)?
> 
> Sorry about that.  Since I was sending from my gmail account, I thought 
> I needed explicit From: lines to ensure the authorship was listed w/ 
> amd.com.  I generated the patches with `git format-patch --from`, to get 
> the explicit From: lines, and then sent with `git send-email`.  The 
> send-email step then inserted the additional lines.  I guess it added 
>  From amd.com since I had changed to that address in .gitconfig.
> 
>>> backendtype=phy using the blktap kernel module needs to use write_dev,
>>> but tapback can't support that.  tapback should perform better, but make
>>> the script compatible with the old kernel module again.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>
>> Should there be a Fixes: tag here?
> 
> That makes sense.
> 
> Fixes: 76a484193d ("hotplug: Update block-tap")

Surely this wants going into 4.19? Thus - Anthony, Oleksii?

Jan

