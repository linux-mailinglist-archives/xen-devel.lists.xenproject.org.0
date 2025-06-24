Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87216AE5C01
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 07:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023069.1398967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwUd-0003Db-Js; Tue, 24 Jun 2025 05:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023069.1398967; Tue, 24 Jun 2025 05:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTwUd-0003Bc-Gi; Tue, 24 Jun 2025 05:46:51 +0000
Received: by outflank-mailman (input) for mailman id 1023069;
 Tue, 24 Jun 2025 05:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uTwUc-0003BV-Du
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 05:46:50 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f351e79-50be-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 07:46:49 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-453634d8609so39405e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jun 2025 22:46:49 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2f9:d2d:164b:59bd:2475?
 (p200300cab711f2f90d2d164b59bd2475.dip0.t-ipconnect.de.
 [2003:ca:b711:f2f9:d2d:164b:59bd:2475])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80ff799sm1004652f8f.69.2025.06.23.22.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:46:48 -0700 (PDT)
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
X-Inumbo-ID: 9f351e79-50be-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750744009; x=1751348809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WwjJqIiD+vRIY+U9Ab2FDWWcE9p4j6eu5LP3+GPVKCI=;
        b=Ngw/QZVxwFupSrHlnlFW8k+gafqhxi3Mm9yN7AAVWLeykA+x6CZasVOartQ+hjdaAc
         Jpq1GAo4VcOhQYH44ib6wcXLDiECjnWsfPjZ+a2UUZRVRKGH3i/Eu0SpkvcnardKosjw
         bGXcakjV5w+GeUORikQ2AJ+FUh0DDfn460ullvT4F91fq+e7i2WFZ7iAbuIzNxZcYMGd
         DPnDhE95OD+tiRf0V2nVmuevGtUEiMvz228252rZvDwFC+9BxfPYcgfp6mChdVDVvLPB
         DlJPooAtUGT4GyU0/g3WjOxFQKMClHphXT8E0YmoWJqh4xPZ25ArJqkJPbYVNISkcVn9
         xUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750744009; x=1751348809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwjJqIiD+vRIY+U9Ab2FDWWcE9p4j6eu5LP3+GPVKCI=;
        b=RIiQyvAhhuAQoXCUbq7y5g1S/BKYSY/bkFl+NC0IL1QKPc5tVr9K/mKMkyOn7VeGsr
         mVPkClq60hVvWUTpBjIEQuhjfchjLY8RQusU4RrrKgbZzD/pMeEICQWtbXfyWDF5ki9m
         a5CFz0hLTQcKaIm7tZp79d07gHiOdsV2onGtJN3ljo1v+YL2dshF0E/BghtGghqnr7Je
         DTM+1KufRB+fRzU7glZ4zC3/HKl2AOecghphF6SSdkSIq5qvO8ss6LiWfC16rHztmxIG
         faaI69iiKBIkvffIEMP6JeDEac2Xcc/rNDY1vmPqx7LiAvA+QkwOmCMZDXDMho0Jvqui
         U0ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWA4ngsfBIN5b6f2aQAvtfTv6fYCgvkjHl9S4W5x9omxIOPFuuM+DoguVACJQjLDlf5NZwQkMb8pLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxR9QtThCyNe5Gq6QSIHKzwm09+t39ginO2Gw3WJKWn5HwDV40P
	jNicWrJxvZT568cYyD24ytIIw+yu1gk7rvFo6DvN9wWDydBjeXigGjUzUvhk4rLrnQ==
X-Gm-Gg: ASbGncszuo2mgmF/1Q7hLXbo40+egpTo6V3Gd1wZBP2sd3Ga+K+XoYB7V7l48PXSgnK
	s8Wi03VHdo2mHwTXlbv/k9B7wnxbUL5B5VPBcB3yKZKLFNpJVroWwZRzXl5mqy1vJVrfmT+08w/
	ftOFBqQWEoYwXhxuhbsYj1Wk6l0kUqTy4/xkwDHNG1vLP5gQNmJvHbeRosRkGi1zVsXPoQIJyBb
	SG4vda8cPAj5+gYx2vAWhqIxNBtFZVPV4MhDBclYSWlmBKmgTI5N3oL1M3TykDvDZ+AFivpaq74
	o0mJA9tKfeTgvZPJTSxlGatDv7wykIstftyLJDn+eh8inmQQWhRzap/zKcbW3SCGcv6/UGAFO/8
	vadBNeptiOxo0Q6+vlJxizuhCX19YVwOxmzp4dzDV4cfI6VO84F31w0wkoPCzidnhbB8WoROUlf
	ZFnPQy063aGHMWp3pWfA==
X-Google-Smtp-Source: AGHT+IF2Avmc6DE2VARtmB6K1L/+AwYTXrhPkBsZTYZ6JH+u+yhLaZPAAP6PQXcgk7PPAA3F7AqzXA==
X-Received: by 2002:a05:6000:4903:b0:3a4:dcb0:a5f with SMTP id ffacd0b85a97d-3a6d12a21d6mr12380692f8f.16.1750744008951;
        Mon, 23 Jun 2025 22:46:48 -0700 (PDT)
Message-ID: <08cb7878-fad7-47f4-9c91-5f866c54b1df@suse.com>
Date: Tue, 24 Jun 2025 07:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/16] arm/vpl011: use raw
 spin_lock_{irqrestore,irqsave}
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-5-dmukhin@ford.com>
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
In-Reply-To: <20250624035443.344099-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 05:55, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Replace VPL011_{LOCK,UNLOCK} macros with raw spinlock calls to improve
> readability.

I'm not an Arm maintainer, so I have limited say here, but: How is this
improving readability? It better utilizes available local variables, yes,
so this may be a little bit of an optimization, but otherwise to me this
looks to rather hamper readability.

Jan

