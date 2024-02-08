Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1384E2BC
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 15:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678216.1055299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY4xE-0008CU-U6; Thu, 08 Feb 2024 14:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678216.1055299; Thu, 08 Feb 2024 14:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY4xE-00089T-RP; Thu, 08 Feb 2024 14:00:40 +0000
Received: by outflank-mailman (input) for mailman id 678216;
 Thu, 08 Feb 2024 14:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY4xE-00089N-8N
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 14:00:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fbfa450-c68a-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 15:00:38 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33b18099411so1252694f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 06:00:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m25-20020a056000181900b0033b4235b155sm3643276wrh.48.2024.02.08.06.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 06:00:37 -0800 (PST)
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
X-Inumbo-ID: 6fbfa450-c68a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707400837; x=1708005637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uyq1ZZ40J4/aUjA9k6OM/KOmgk4jM219yrQCxmgufoY=;
        b=aLrv9O6wAPbiU/PmO/7KNKx7m5eDjDK7UB86RgEzwmYumpvL7ox3POOPVTHOz0MYWZ
         afggCJZGX53iWJSPCFc/eRCJJEfvW98u6n8/w1JIC+wjGDb81+yv+cKqk1OXooSKPiuY
         YIh7OVRgpPV8QJUQ6Q/8HSaw0BeZ75b0HhaXcWJCIhs5FU0zDuVDterzP7IAC4UXkDCF
         qYc0nrI6aWpBDddRkxVtcwlfELjCMB+YQScJiDd9aBuvF4iCivDLOgGnHCDUu2isJIt+
         PnSIgqE1uDBVLx6CbbSBtxcbUOM8sFj1MhPzNqex0VIF0mmVWp+E1QIGUCHH98VkDTeT
         RfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400837; x=1708005637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyq1ZZ40J4/aUjA9k6OM/KOmgk4jM219yrQCxmgufoY=;
        b=sk5qps7EypjCE4ZShHOSzcOUMEscxgAQZfYbSYL5pBxwBxQdkL7k6+Cp48NlPi9O9u
         VbJ6HsjsN43UStmk83n4qaUohpt5SNUdRz5xNOq0hqeRZV1O+iPetAjul3zzM7vdQLBh
         0+1tsFn1seED8y5wHlmhXz51Qov4uPon9/kYULZm0TUdf9ccChqo35wwkEQCyNoFEFSa
         se+3KRHKkrEet+DqbQs1gC0NLr89fTEhUN4/qTGLm8HC9LyqOaK9L14Iu6Un4Fub9ahS
         jOOZQF7PnemL95shrqpV1HejLqXe/UhgFyf3+f5Z43dDcaEsEzLPvS0+5QTYmIovlFqS
         OBCw==
X-Forwarded-Encrypted: i=1; AJvYcCWEd+n43rnq1F0iFWAO/TyK9ztqbZooXvBlPtrRbjqMdpghvsuZCvXaqOBSQI95IkWYtrNzMPLngDwBw+F0KHBtnVKss7iRW9vutqpD/S4=
X-Gm-Message-State: AOJu0YyLzZkAWpWK/4louZlJzaHmi6wLvUrR7Lo/uEPtM1C63mRHiCGh
	QBOvf3yx8H0FPZT5jRSzXiJxaW2LkStgdHA2yMb76/wgPNFEj2vvAQGKX2ZUiQ==
X-Google-Smtp-Source: AGHT+IGo3FfxugMBGnhL2hFjWpurs+bL+X5PcVpF0wKWUjkvOcfa6d4y7zv7Q/b8Wg5Vjd9KJ5t8Hg==
X-Received: by 2002:adf:ce8c:0:b0:33b:136a:95a3 with SMTP id r12-20020adfce8c000000b0033b136a95a3mr5305528wrn.28.1707400837334;
        Thu, 08 Feb 2024 06:00:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwSMlnzp+unxLae35BjcAFPuSVAeK1nRuxm0adM/EQ8MTD0/F4VazSoHGbTOo/Ay8rVhLEz+3F9lcY+eRoylXMuubS/4AfVe7jZxz1py0jRZepoUg6KbEicpeInUTqnWJhcPqNzM8HmymjDY2IfgLAsilCg91+JlluJ6O/N77xfZP2H+IVml2caAU0MlLbY0pqq1ffkaThLQa+/hHEsJ3H6g+3nz+OsbS4036FtTLz8E5/MIwhjlpbQPS4zrB4vWqu9QmyyQc1XOV1giAgTbLjEBkkv63ADW3BK+/AABBVdxZVP/QqrdD29/Z+mprJ
Message-ID: <6e818fdc-defe-41dd-a931-f5abc7ffce6b@suse.com>
Date: Thu, 8 Feb 2024 15:00:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor
 ap2m->default_access
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <george.dunlap@cloud.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
 <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com>
 <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
 <CA+zSX=Zou19sjb8ToLTaMjLHLYmqptsMXCT50Y9MwGykOaTrZQ@mail.gmail.com>
 <156f2693-e178-4553-b4b4-f671b0221dfc@suse.com>
 <CABfawhmYaGCLN2rsi4y+-CJs-AA+01YLEZdbkGvUi3t0MM42=A@mail.gmail.com>
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
In-Reply-To: <CABfawhmYaGCLN2rsi4y+-CJs-AA+01YLEZdbkGvUi3t0MM42=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 14:45, Tamas K Lengyel wrote:
> On Thu, Feb 8, 2024 at 2:46 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.02.2024 05:32, George Dunlap wrote:
>>> Er, ok, just one more comment: this could allow an altp2m to have more
>>> permissions than the host; for example, the host p2m entry could be
>>> p2m_access_r, but if the altp2m's default_access were p2m_access_rw,
>>> it would override that.  Is that the behavior we want?  Or do we want
>>> to do some sort of intersection of permissions?
>>>
>>> If the former, I'd propose the comment be adjusted thus:
> 
> No intersection of permissions please, that needlessly complicates
> things and makes it hard to reason about the state of a view where
> default permissions are used. No need to force a specific type of
> usecase here where the hostp2m's permissions are special just cause we
> say so. No, the permissions in the hostp2m should not have more weight
> then the specifically requested default permission.
> 
>>>
>>>  * If the entry is invalid, and the host entry was valid, propagate
>>>  * the host's entry to the altp2m, retaining page order but using the
>>>  * altp2m's default_access, and indicate that the caller should re-try
>>>  * the faulting instruction.
>>
>> I find it highly questionable that such blind overriding should be taking
>> place.
> 
> It's not blind overriding, it's the requested default permission set
> for a view where no entry was present before. It is the expected
> behavior. It would be way harder to design applications with this
> feature if it was special cased and it would take different
> permissions based on what permission is set in another view.

But the default can be only one specific value: How do you make sure that
R/O, R/X, and R/W mappings all retain their respective restrictions in the
alternative view? To not over-restrict permissions, the default would then
need to be RWX, yet then all mappings will have full permission. What am I
missing?

Jan

