Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8053AB26A1C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 16:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081841.1441799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZLL-0000MQ-RY; Thu, 14 Aug 2025 14:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081841.1441799; Thu, 14 Aug 2025 14:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZLL-0000Jl-Ov; Thu, 14 Aug 2025 14:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1081841;
 Thu, 14 Aug 2025 14:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZLK-0000Jf-4W
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 14:54:14 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88244208-791e-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 16:54:09 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b7c72so1389882a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 07:54:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm23880914a12.57.2025.08.14.07.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:54:08 -0700 (PDT)
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
X-Inumbo-ID: 88244208-791e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755183248; x=1755788048; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdCgU1v9HK6NrezqwvKMitSNFgouyHp1cNf1VReAl54=;
        b=XdPBkLg+1Vh5Rn3k9U0PUtuoTalh/5RtAe8Rk4C2OywZeVfU8LbS5WdHpziCZeSyIR
         zttC14fvj7dk2tkn1V8YgYH988HpQi8fs+QOYUhxPPbLc8iP1Uy5fjDPZpXLXSt3Bz3z
         kOEDrOMpC0lyFA0DNOD2hpF6+MUew3yiLf69tBupsybxHzdOYHl8vsKEbtn5sSdUWxph
         U4GbFlG1AFO9wsmZIkBMGTCESmbv9vFxb1jMiC4lN2rH7tFJzVZJgE3/LYvdl9ypfvfB
         THye3Najo4blIMAHxzeJCIRlmC1qx1YIKwKzR65uNTxQn65F601pzFok27fGUcSQqTZJ
         HfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755183248; x=1755788048;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdCgU1v9HK6NrezqwvKMitSNFgouyHp1cNf1VReAl54=;
        b=Jdi9/gx70/cVX4EvdfmYe7khOnpbERRIsa0jJY/zk5DrywViHsScvJ3UWFzU2PkFfM
         acSYoNHUJZkyGocnMkB/GIzxBvt4FynlyVUVgXHbTbxC84NgWo9ZCheLTYILJpxzD38w
         iGqzR4Hx4ubvarfw58vMpb956xQBS5eULzk3iKfUIkF6tD4m3j6TN/1XTsVpfU6i0yG4
         lUOlrIj5TcigdN7Kk0jO1xPgtE/VgYn7uOl1V++KP59RzOy4yNBDo5n/+R+rfY9Dixc1
         M0dImMPf42yytYMLbzednekuJKYvlDSl3r9+nPupY1VoKJ0EnLUrwA78R++weL6HBFgy
         Vxjg==
X-Forwarded-Encrypted: i=1; AJvYcCVj65VwNKIVNgY7TuVNJ9+P4R5xi5ECAKmjPagydWQ2GH09TGDhaNnUVhPBR1l5valya+anUOXRvkM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3C9TrDUGuveHeP2rA6wIIP70FoWrOYSyAz8RMnSsIBkNmixpW
	r9fQhBkR3T6cvEJF3cN8e2TeRWH42GnySJRjpH6Rng58coJxE3hXjCwOcH27QMyHDA==
X-Gm-Gg: ASbGncum7kAOtYS0jQel3UPwQCKX0oYC2ocLQEGZ9FGGakSyHfLO2XeNbv3C9KynlJH
	Jk7dNnmkD+byGXc2znKNm/BZiW2Bdr55PgQlh2uhG3qRKkCAFWDcraZ/tpp1gRYMM/C0yjCjAwW
	zPpr8Ko6qqbOTQ2PnIQinCtf4ghE89sVvb7ubylRgGDWxC4zPCLbikRccAtwfft8YTjpWfGFwBd
	AT501zvsVgRS/1EKZDCpySeVH69r4RLuF6KK0zuFGdYPvNWLOQ9n7/cb53wbtS21Kc+VxZAIhST
	9LF4Vc3gBgW/Fa4TTaW5CIOkAow8yQvRFkV8SZkJDXvlk4/qwEECqAoOn3zh48RNyLhUjlyj2qc
	Sp6YnfLgKixBk2yOVmo3EFgvVtj9etNxT/vEEbx4DrB5P/Q2DgDezxEaKdRfzsRPlrgdimQdqWY
	ry7pjVdB1ILGhJ4TZAOA==
X-Google-Smtp-Source: AGHT+IGWAmz1kzEepN4KVbE5BgC9osFy0BlWS5O052n1+LjR2SPfInMoS1bbsIViHJFzDFn0obhEHg==
X-Received: by 2002:a05:6402:348c:b0:602:1b8b:2925 with SMTP id 4fb4d7f45d1cf-6188c21772cmr2549821a12.29.1755183248324;
        Thu, 14 Aug 2025 07:54:08 -0700 (PDT)
Message-ID: <50fd32ef-ac5e-4842-9d14-2d9b77a9d470@suse.com>
Date: Thu, 14 Aug 2025 16:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/22] x86/S3: Switch to using RSTORSSP to recover SSP on
 resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-18-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-18-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
> to setting up shadow stacks.  Luckily, RSTORSSP will also work in this case.
> 
> This involves a new type of shadow stack token, the Restore Token, which is
> distinguished from the Supervisor Token by pointing to the adjacent slot on
> the shadow stack rather than pointing at itself.
> 
> In the short term, this logic still needs to load MSR_PL0_SSP.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


