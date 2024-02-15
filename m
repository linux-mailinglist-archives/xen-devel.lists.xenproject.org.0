Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27E856971
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681923.1060919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeUv-0007tb-B7; Thu, 15 Feb 2024 16:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681923.1060919; Thu, 15 Feb 2024 16:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeUv-0007qk-8Q; Thu, 15 Feb 2024 16:22:05 +0000
Received: by outflank-mailman (input) for mailman id 681923;
 Thu, 15 Feb 2024 16:22:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raeUt-0007qc-Lr
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:22:03 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59b9d3bc-cc1e-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 17:22:02 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0a4e8444dso11299361fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 08:22:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z21-20020a05600c221500b004101f27737asm5457323wml.29.2024.02.15.08.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 08:22:01 -0800 (PST)
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
X-Inumbo-ID: 59b9d3bc-cc1e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708014122; x=1708618922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ajDoNXNUtH6hm2dr8oDNaxorI1c4VSR0dhnmF/C+Hw=;
        b=YgudTOR8Vg/S8q+o7g2DpkCF59DJgmyN2aSu7N5d2pq3jcMGMw3jJh4bitJ1pvnwyj
         vVOCywN7UWQIOowXWjamHVLbq0eBKzQkBnmuLlAQO4rUYbjd9UAict0MljSm9Ea+mAWM
         ei5muW4PnV06EWsCSRgvEqyPmAfxEqKGJoaLwRpvi5r08KeR1EKkKyYK4hm7H2Q9W3bj
         FQphRjRaEpU5gu3VhQsDNP3ndOrrwehFoe/4vgMMG7xascZtpTYbIR7FmQmzjnrENp9R
         e9Fpi5NJx1hN5Muav3rTSnus2urcKpjkBS8adBosgw9jFHzqdZhLG1lrgM2lVLQnK8Wt
         7mAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708014122; x=1708618922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ajDoNXNUtH6hm2dr8oDNaxorI1c4VSR0dhnmF/C+Hw=;
        b=e8FcKwKjvgaDU4odtZULkUMdSIDI+qSN0gmtA8rycPFj7HuU6C+aZxqNv6IeBerKST
         a7w8hjsRFexNBwGVsYT3kwTsPr2xm5xXaXxYNClRsQV+DvCbaH8y8nzIV0YWfHtCYL8V
         +dHk8ta8cAwXEfCJkdH/qfgKQe01PbMMs1poZIW70YmwSbMWlGm52l3l6kCdRJur9mts
         0Yu//kr1oK/PPwfNIl9Ehmaz0L2IPUUjBdYLuoF+fHrANX7xGy7ItU2teVgrMxmKTUln
         NFAer7/iXBdLV48MwJx18oQsGYr19L/QhTI1gsoQnQb1kBmFwC9lqGASVq/IvFIxpuDY
         0klg==
X-Forwarded-Encrypted: i=1; AJvYcCVCRme/e4AMRyIbTtv2NvIOuJr1o0biU7heqnSafDhdQ8vmkSeTAEhXnYSvP3H3r/ud/L5i7s//l6jAE2Gpm0JGHh1SM2Iw+ykm8yaADzk=
X-Gm-Message-State: AOJu0YwHWnY77vhdwudxh70a11PPw/GULuRYDMOStGLbkLxhM1jzw+My
	9V6Qh51nagmm2dtKyuFnlnFN49xQ4Puz10hV7Jba4JexETMqyaAxOjhU+VvMHA==
X-Google-Smtp-Source: AGHT+IHoMiRRAyWbUk53zBO+gf7oS14qLpogDEPsZFVIAGZI6wgY4XGtQZvaAqdZw2NOiOeMY3R3gQ==
X-Received: by 2002:a2e:98c7:0:b0:2d0:b0f4:89ee with SMTP id s7-20020a2e98c7000000b002d0b0f489eemr1556602ljj.47.1708014121739;
        Thu, 15 Feb 2024 08:22:01 -0800 (PST)
Message-ID: <d545cc6c-d213-43da-af31-1768af32aba0@suse.com>
Date: Thu, 15 Feb 2024 17:22:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com> <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com> <Zc3v20RKMssbaDsl@macbook>
 <a48cbad6-701d-4077-9044-4205b932a7f3@suse.com> <Zc428VMDoYnPw1zo@macbook>
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
In-Reply-To: <Zc428VMDoYnPw1zo@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 17:08, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 02:02:41PM +0100, Jan Beulich wrote:
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -15,7 +15,11 @@ srcdir := $(srctree)/$(src)
>>  PHONY := __build
>>  __build:
>>  
>> --include $(objtree)/include/config/auto.conf
>> +ifneq ($(obj),tools)
>> +ifneq ($(obj),tools/kconfig)
>> +include $(objtree)/include/config/auto.conf
>> +endif
>> +endif
> 
> Trying to understand this, I assume it's to avoid an infinite
> dependency loop that generating include/config/auto.conf requires some
> tools that are build using xen/Rules.mk?

The file has dependencies only in xen/Makefile. This is about the
file simply not being there when initially building. Perhaps the
patch description helps that I've written in the meantime:

"Because of using "-include", failure to (re)build auto.conf (with
 auto.conf.cmd produced as a secondary target) won't stop make from
 continuing the build. Arrange for it being possible to drop the - from
 Rules.mk, requiring that the include be skipped for tools-only targets.
 Note that relying on the inclusion in those cases wouldn't be correct
 anyway, as it might be a stale file (yet to be rebuilt) which would be
 included, while during initial build, the file would be absent
 altogether."

Jan

