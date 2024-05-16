Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B535C8C722E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722852.1127204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Vjk-0002Ej-1n; Thu, 16 May 2024 07:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722852.1127204; Thu, 16 May 2024 07:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Vjj-0002Ca-VO; Thu, 16 May 2024 07:41:11 +0000
Received: by outflank-mailman (input) for mailman id 722852;
 Thu, 16 May 2024 07:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7Vji-0002CE-Dw
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:41:10 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a71da56e-1357-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 09:41:06 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-574d1a1c36aso2985700a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 00:41:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a5ecd37a3sm570486466b.79.2024.05.16.00.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:41:05 -0700 (PDT)
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
X-Inumbo-ID: a71da56e-1357-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715845265; x=1716450065; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUi9nDgpZQHSi7udgEBCMlqbXC6UNa3fLlCLL5Lanow=;
        b=R9ph+h7nAz84KPph13hAEUhrsERhhJmwYfYeOdgFc2vWyg1iKenxF0GitFU0M5qyP2
         hrjoOG6x48kRzCilDClaA8V4fquVrgnm/2mzB+CX65V2HRbyEw4JPPiyt5KOEdFIHLYj
         QXHdkrljlflkRe8lGdCC+GqAHklEA1P2zysT73yy5i1baV4c3k4DzTiKPiwXIuw6D1jv
         Ldg+NdtnpJa+SObFDrasseMTU88QlOapLP9Z4Bs5A346+dnyaol7mv5hI/v6saEAH9/y
         nVd5FfIV0GxS+3FWVUo/iaKqd83CmD+x441wPanG0wIRCUMfmKSiUSRxBxzJjxkhhGJo
         DXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715845265; x=1716450065;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUi9nDgpZQHSi7udgEBCMlqbXC6UNa3fLlCLL5Lanow=;
        b=eR7V7XUEMsAo1faJTB0mY6nq5luWG3Kbtmhtq5YvpXDW+JNGY6I8pAoj97kLB5zg0w
         rBpHIZvAwh0UcccZb99putq2IF0/uaARE9Re6ho8SdjfepKc5sR8XaCYgI3mwE0Hp3OJ
         D0HKuG4RHmJblQ1g1hEpY3PXpVkzuaAVmvyfdiKjUjHQweXdj40xb9qkbQUcIsXjKcjU
         Ry9TvWt76/crnRCRqGyxqx864X1QN1wH07OG2e8Js0OYo+1VhpV5VGRwWdaB9esSoMxB
         H6QDGIF6nO4mJHxsJCjeKtrdEfQrzkDPJs3+3nsQpr3JAIoIpjymaiLqkhrHSL9F2UbU
         bkBA==
X-Forwarded-Encrypted: i=1; AJvYcCVpHoXnqeg1t3peYhh+BP3eYWValY/IqIXzulZhM4FzN70m1PKc5CxXMa7xJsjgEi24lAM6YSY7XVAc9z/OhJLUJEdy+cFKoSj8iFNMZpM=
X-Gm-Message-State: AOJu0YygJg42dXvbGBEER1+tmVEHrxMZXjCQnrCo3p+YIKiFUxcNG7k0
	3KoJLP9E7SS3CJm7z/acHJIS9ce7exPfZ8ZbbhlG9sm7803sD/zrcQ7nZFJuyQ==
X-Google-Smtp-Source: AGHT+IEJgmyZ46oMLxX2hOixtDzwhjsLAOPvaUbr+EVnBftqqWJJ2K2w0cGLOLjvy62ej/Pny2H/Pg==
X-Received: by 2002:a17:906:8d7:b0:a59:a0c1:2624 with SMTP id a640c23a62f3a-a5a2d5cb855mr1190695266b.39.1715845265485;
        Thu, 16 May 2024 00:41:05 -0700 (PDT)
Message-ID: <64083e01-edf1-4395-a9d7-82e82d220de7@suse.com>
Date: Thu, 16 May 2024 09:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hotplug: Restore block-tap phy compatibility
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <20240516022212.5034-1-jandryuk@gmail.com>
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
In-Reply-To: <20240516022212.5034-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 04:22, Jason Andryuk wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
> 
> From: Jason Andryuk <jason.andryuk@amd.com>

Two identical From: (also in another patch of yours, while in yet another one
you have two _different_ ones, when only one will survive into the eventual
commit anyway)?

> backendtype=phy using the blktap kernel module needs to use write_dev,
> but tapback can't support that.  tapback should perform better, but make
> the script compatible with the old kernel module again.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Should there be a Fixes: tag here?

Jan

