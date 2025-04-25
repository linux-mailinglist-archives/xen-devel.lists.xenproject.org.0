Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD959A9CBE2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 16:43:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968210.1357880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KGA-0006VF-VK; Fri, 25 Apr 2025 14:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968210.1357880; Fri, 25 Apr 2025 14:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8KGA-0006Sz-SA; Fri, 25 Apr 2025 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 968210;
 Fri, 25 Apr 2025 14:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u8KG9-0006St-TN
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 14:42:33 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801115bf-21e3-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 16:42:24 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39efc1365e4so1167467f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 07:42:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5225sm2599018f8f.33.2025.04.25.07.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 07:42:23 -0700 (PDT)
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
X-Inumbo-ID: 801115bf-21e3-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745592144; x=1746196944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZtQPHmzG31xriP/OP/HmV8wfUBy3Mw67KqFymqL98U=;
        b=Y3inQXvLK7st7FZ8zuiQSNIL8Mgf8KTMPzMDGm/jpZVPQWy87aKSYguQYemJuaUL58
         r49Bwx0ecLxYAIzmKG/ncfQ/oxtDaM86WnVeGCQfy5xpK19cn7NOG0s56KElnDTlbOid
         OJEuE73XepGuDXL6BXDeByeDPFZCLtQ2kmDlul6VoZQZ91/CeWzGkK1K/x/g/n96dPud
         ez8WcHhFB71cnT4S6gCx5Pf31LMDVykBpfMNnm/oWT5zrIHnIb0xDU+qq568tBF0l0YL
         64BezL3WUN11YxLhfiRLW02BYY13Yf60WW0VsOb++RQ+42N1yfbJv6w9/Z5wmABIUkcr
         BIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592144; x=1746196944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZtQPHmzG31xriP/OP/HmV8wfUBy3Mw67KqFymqL98U=;
        b=T4dePFBRkCZD+dIw9TYYy4/2gQK7rqbeqtOiF3f/dFadj8rJvbcSXzb3W3yOmrU9eg
         ttBhjCAMe00NTYLu3xyq4yqBYlCmc4mcJkcz0zpQZGfUhi7OSTZYvRFbWha/nthPLSvx
         EL+E5GlWZxKpwdVMxk2sQyb32Ipga0pu8SA/8b8JqPO+gRUX0hHl9ZgMOVSTicj3OkMG
         1zoX/hwT+3rpBEaM6/EVzwUIH5lCcoJAfU2/DFy7pfELESy7dXMsP20RqnXBsjKTLYQj
         FG3k5GON4BQ95VXp4YaQF7B8wWj+TgI6AV6cn4M6Mc40adI1ZuUopFZT3Yq8DTlz+Gy7
         0K8A==
X-Forwarded-Encrypted: i=1; AJvYcCXTBVAF+hsXkCBLXcZtITq2oCUo3iAxjEb0mjEuZyHbpJcsbatVFYHSQXX476JLqRHDCEwY4n3PMeo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNMu+0Pcj38dknBXGoRfOkntyeJOpMi3xyWq3Pv77I8Dsjb2Xp
	3Fy1GMs+EsVrGaN9zD5PKF96qS23UBtKSaJ4YnBqn6kd8dE06dBiLbtRwYvnWw==
X-Gm-Gg: ASbGncvth4OaHbK2G4qks+kbRcArXAkYNjMUoKtk3IxP5+eaD+4+H9Y0Pe/z2nO3tjV
	mjx3I2LNlyKVPhpE18Cs1Q5d5e0KTSabxfjk/os7V68bnaAdDhgs7k3TYEnqs1atqrecYL0A1W5
	T1fZ5ltdm3wN1UP6gRhTZwuiC7HmO0d75j/8z9SGpBv1dFPKb35dWIe4LTn2+Pt6bG5BNx3Fcy2
	tdTq3+DC6DO6hmh45f4Qr5/3s2GLhtwhCVGmHNBQosW5fYt4usTgv/JCqYY7q6+EEyziTaYlUdg
	LFRu9tmM29ozrsQOvOA2FMYmeEVXdwAbO/L34VbRjbWGu6q5u98Cb9gxVgnKkjCwA6E8APS0U7B
	POZnG/wLnc6Tcy1rtuEoPj3MORw==
X-Google-Smtp-Source: AGHT+IGqdu/MWt+1xMFfc6l/vxACo3VMfbv+HMYpM3ETfkK978bTu4EbdjOI/+yNip/WxY4WB7iqlw==
X-Received: by 2002:a5d:47c9:0:b0:3a0:6aca:88c5 with SMTP id ffacd0b85a97d-3a074e0ffa1mr2074976f8f.11.1745592143523;
        Fri, 25 Apr 2025 07:42:23 -0700 (PDT)
Message-ID: <fb85bf50-2a44-493d-b4ef-29417b4efcb4@suse.com>
Date: Fri, 25 Apr 2025 16:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com>
 <20250425112415.245585-2-andrew.cooper3@citrix.com>
 <e5c6b448-945c-4c93-a3d6-e6e598102c2b@suse.com>
 <74bf3a58-6c90-4123-80e3-b72ba67ea46d@citrix.com>
 <654dd5d3-b235-4f5b-9ad6-b3f1281434d2@suse.com>
 <25666272-71b9-4ec6-8a77-a3b419132d83@citrix.com>
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
In-Reply-To: <25666272-71b9-4ec6-8a77-a3b419132d83@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.04.2025 15:48, Andrew Cooper wrote:
> On 25/04/2025 2:13 pm, Jan Beulich wrote:
>> On 25.04.2025 15:05, Andrew Cooper wrote:
>>> On 25/04/2025 1:48 pm, Jan Beulich wrote:
>>>> On 25.04.2025 13:24, Andrew Cooper wrote:
>>>>> The type used for pagetable attributes/permissions is currently unsigned int,
>>>>> but needs to become architecture dependent as PPC needs unsigned long.
>>>>>
>>>>> Introduce mm-types.h to house pte_attr_t.
>>>>>
>>>>> Given the new toolchain baseline, we can use __has_include() now to remove the
>>>>> need for boilerplate on most architectures.
>>>> That's true now, when it's just pte_attr_t that's there. Memory management,
>>>> however, is pretty different between architectures, so I wonder if in the
>>>> longer run any one will remain that actually can use the common header.
>>> Anything in xen/mm.h is common and needs architectures to provide (or
>>> use the defaults) the bits required.
>>>
>>> asm/mm{,-types.h} still exist (when necessary) to provide the
>>> arch-specific extensions.
>> Sure, but you kind of avoid my question: Are you reasonably certain more than
>> one arch will still be able to use the defaults, once a few more things appear
>> in this header? (IOW: Won't we be better off having each arch have its
>> asm/mm-types.h right away?)
> 
> I can't predict the future, but my gut feeling is that it's not going to
> diverge very much.
> 
> If needs be, we can go to conditional override for specific bits.  Or,
> if I'm wrong, I'm wrong.  It's not hard to change.

Well, feel free then to put in with Oleksii's R-b.

Jan

