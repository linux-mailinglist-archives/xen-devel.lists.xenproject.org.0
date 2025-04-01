Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A5A7771C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 11:02:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933775.1335628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXVU-0000VT-FS; Tue, 01 Apr 2025 09:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933775.1335628; Tue, 01 Apr 2025 09:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXVU-0000Tf-CQ; Tue, 01 Apr 2025 09:02:04 +0000
Received: by outflank-mailman (input) for mailman id 933775;
 Tue, 01 Apr 2025 09:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzXVT-0000TZ-Ca
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 09:02:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f850c840-0ed7-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 11:01:59 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1efbefc6so793932f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 02:01:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e136sm13594597f8f.67.2025.04.01.02.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 02:01:58 -0700 (PDT)
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
X-Inumbo-ID: f850c840-0ed7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743498119; x=1744102919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0rh1MlzLcKRGud8Gqy7zKpiAgAmPuaUeoP2Pc6JhElo=;
        b=fJQWVagiZUwhYfoXARi/6hYBX8vWDtu5opcVCmN0mwyWLRfLh2faByMmctMIgmQb4H
         BSo/0IQK5uSOti7Ie/z9WsHf3VCr8PBVymdrwbqv9lTe0cGhzmSr4qrQk93nKyYkM/RU
         mxinB+66Pht9zkKCokT7eNbSIOWTXGtbBMZUJadms5d5IX4ZD10rFbJEkmZe6rLPs2VG
         EXIyLp6pAHukreKQPFH/P3t6R9ZaF9EbAVCDTSorsrKX6c5UcNIVhjUUv1Fl7+QKs6WP
         IXCj0ew87uVdXWxpQh93MGSoc/FpoADnPUqwdhg4uF8xOHD7mYRvs37cyZZzGT5W9qo/
         tNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498119; x=1744102919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rh1MlzLcKRGud8Gqy7zKpiAgAmPuaUeoP2Pc6JhElo=;
        b=K5Ii4Pmtd68EZt4ZxWAsM5FCxoyuGbDMuVR2e44NSGZ3TY7YnIJdMlbxg8KgV6Tmgk
         Lb7cM2+4dGo32ZVAXQsQYt9XmSXgzUmWb8e6+ftwP3fVuiCdBlkvVZAT3UKsTidQtHUl
         rTJGZcbXnzXQylhmOtQyTMmQRqHAvKpnTlXy1lDMa6gStowZsJJFu+eCdX1WFCbCJ8p0
         HkvahPOZYezLMXKVLnu6qirdR4pONViIcrVFAHKlW23XIMdF/ScbUEkkIPe+/Z7PNGNQ
         Ug6WjJka0Lpjwd8/0zI0fNtFT0MsFy/9PCX8N/rdMzHQITRQSfVDgArbRZXpcEqZTNB6
         SCfA==
X-Gm-Message-State: AOJu0YzDHZqbIVlH13j0by+ONBYwvuQs2SpK3kNOJL6DqyotdeG5sMUc
	emlL5aUYBrb4rCbfJQSyNZtfySjI1meLYzlQ3W/Y0OareTZLfMdexxrg/JgwvA==
X-Gm-Gg: ASbGncs69IrzlAUb1VNTvLQ43OUWkIVX1+nraaGIhbh8w73eeIkyl0F3SuS7ssUWa/1
	GdmrkFNuLJGj9B5unrfdDdiXfNYTmFdBEYXWZ8fsjppyToUkgOsrlTUlHnI7NK5oK86VhEZhTyW
	vdu3aGjf9BifoRtt48/VXkcqSGzQI/e1NHtwdLo0cbdjRThtXC8frRDH+r2hml39FZ2LJg1hfhK
	f0aFjk1V8ksF8Rxa1WfqjRAT895yZBByWPZlmpnagRy5F8iy38QoYw4OT+8BrFvVHwHe/yI/am1
	4fOgY8Z8zkclO0EfPUUQL/X+HzYbYUMdFLvkPmVKmBzKr5kWF9RPChgKYCPApRb8sx8yDWkNzAL
	rYKCbAcqRwhEw0KEDaFkhr02fD4x9UQ==
X-Google-Smtp-Source: AGHT+IEbrm+sD2dy/Wgc9WB37KWJkWnSJdZenG0HuGYZLPhb1o9gapqPsGz1nt3pmvu94ER0lXIurQ==
X-Received: by 2002:a5d:588a:0:b0:39a:d32c:fb5e with SMTP id ffacd0b85a97d-39c120deb56mr9283793f8f.21.1743498119121;
        Tue, 01 Apr 2025 02:01:59 -0700 (PDT)
Message-ID: <a0148fb5-0b0f-4fe7-b31a-ea220965c662@suse.com>
Date: Tue, 1 Apr 2025 11:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-2-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2503281655590.563920@ubuntu-linux-20-04-desktop>
 <6b3c3baa-331c-44fa-9085-9b0bf72c62a1@suse.com>
 <DM4PR12MB845170590A152B7AEF4D4153E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB845170590A152B7AEF4D4153E1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 10:41, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, March 31, 2025 2:30 PM
>>
>> On 29.03.2025 00:56, Stefano Stabellini wrote:
>>> On Wed, 26 Mar 2025, Penny Zheng wrote:
>>>> We intend to remove all "depends on !PV_SHIM_EXCLUSIVE" (also the
>>>> functionally equivalent "if !...") in Kconfig file, since negative
>>>> dependancy will badly affect allyesconfig.
>>>> This commit is based on "x86: provide an inverted Kconfig control for
>>>> shim-exclusive mode"[1]
>>>>
>>>> [1]
>>>> https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Where's this coming from, if I may ask?
> 
> I said in the commit message, this commit is based on your commit "x86: provide an inverted Kconfig control for
> shim-exclusive mode"[1].

I don't think this belongs there. Also recall what I said elsewhere about
"This commit ..." and alike not being appropriate wording for commit messages.

> So I think I shall add-in the original author, if it is not the rule, I'll remove it.

Please remove it. You necessarily touch a few of the same places, but that's
about it. I accept this route being taken, but I don't agree with it. I don't
want to be viewed as a co-author in such a case.

However, you having gone from that patch (which had an entirely different
intention), has lead to the patch here being incomplete. At least my
understanding of Andrew's original request was to not only prune Kconfig-s of
the dependency, but also e.g. various Makefile-s. Possibly even .c and .h
ones. That clearly wasn't necessary with the approach I had taken. Please
consult with Andrew to confirm.

Jan

