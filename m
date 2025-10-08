Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0CBC5B08
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 17:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139943.1475128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6WDT-0000x8-0u; Wed, 08 Oct 2025 15:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139943.1475128; Wed, 08 Oct 2025 15:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6WDS-0000ur-UV; Wed, 08 Oct 2025 15:36:34 +0000
Received: by outflank-mailman (input) for mailman id 1139943;
 Wed, 08 Oct 2025 15:36:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6WDR-0000ul-CR
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 15:36:33 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90926fa7-a45c-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 17:36:31 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3e7cc84b82so1316779266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 08:36:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-639f30ceaaasm253067a12.10.2025.10.08.08.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 08:36:30 -0700 (PDT)
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
X-Inumbo-ID: 90926fa7-a45c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759937791; x=1760542591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JA1EhhERvokDdE+jUmbn5V/7w40H0FPAGo6FtVmfcSI=;
        b=cxFMkEwVvm3LV3ZRSYR/Ad893Q7+hRNmtMOjbK3vI9/M19L9yFvHUyjbtWT6uoKsq+
         G9K3gNU6vrmSx8sY3GcnpcWEN8C2vH2Pwm2d8ceqGavE9gDlpOFaeMUpzgfGg4fNgNss
         YHrbVRyc0mjG4V2GdM3Y/VlTyXUebf7KC8CxP7n858cimiE6nuPK5RHedj1loqEiiI9Q
         dObVLXvkQZyEkd70DzP4Rb6+/ygWEEMU5FKrcFxHvCC67ABkcvMl5UmD5lQgCmpaY5zl
         fWKSKIrBfFxDjCk+dT2WgdngvJwRjIL/LJZL0kCGQ+WmYiuK1hNvsvKvX/EFPsrcFM+0
         YzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759937791; x=1760542591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA1EhhERvokDdE+jUmbn5V/7w40H0FPAGo6FtVmfcSI=;
        b=iwwbqdUehhZxEzFKH4wQwrWaArJw06rdfyCV2ZSAQRANGr1xPnup3JVJ+gLcXtrz4J
         1hFCBFJKZTWXR42NJet+u2+Rm1cecr1wArl77WM+03BNABlnyRdjpQaD+TGaBpqTEExB
         mRgz1FmAU6+4knL0X5taSC7dcDoD9CE1jc+Llrxcc85iQo+Foj1lU/Ct8/A0y/nhn5Ps
         peR8WEirBk7bi1rvvDy4AHXYksoRN+/385gnfk8TWzCD71FEntE8s11TPCl0vRH57Tzd
         WFxpKLSKf+XglBdpAzK7aC8DcYfrYGr5ln88YdACtpY92EwtQF+M67SAhPHoT4fdHCT5
         UU0g==
X-Gm-Message-State: AOJu0YzkoQK11zG22Zu/vgxQGfCvndAmZ09S7XNJnE3s2C22RoSJ5m5p
	pg/d6y9zBkirbth4eZ/aR77xhOXcDtiiUswabP3yWTRUX40+9HahJi/8Fz8Ya9qxBw==
X-Gm-Gg: ASbGncuHZ81Dgep89fG5bm04majv852a4eO4QWAJz/+O6KNuU+5lyZRs1KcEoPXJ1Hl
	4OJ6nmdzK+vpZC1SNhoSpXmFVTTVO3NM0kVpSrJQ5HUgTbhnqtZ7fOo2VvKm5t2/J2E8xUUzikO
	sUi2K02r2CXTYOThxuuWq/nr4+B/ZN9AGirxLazFjp9SK2ld6VNx7Dlb+iN6P620Y32vYtlCHjv
	5+NhYXycJ5t0a/NRSWozRQyn2R4ett2Dsh5dhU0tTlZb9IkOE465OZU9ZYjHmKTC5gcoaKt5hac
	QYWagJJME7HddRzPNFOcYW5cHnfurmKAtpMbYNx8d4Iz3qs1hGcrK4WVtu5xK+w6KUXW/ahyyy/
	vAraPVl1Eui1GM+fu+fVNzEOk9ly4ESOZCdmGIdsZRmKysfS+WTeT3yJqbSapqQZuxdMh5nxBiA
	wofpMPQ+5Qkjf4Hi/VTo2xvauy6q+ln9+Jn8Q+oOscYg==
X-Google-Smtp-Source: AGHT+IGBn/d5Mi1h5Rii3tGqDQ5UDFq6NDE9OpMm+/pTqzuJhEbAClWa0/XWFGgJCEelM6YyGXJqmA==
X-Received: by 2002:a17:907:7fa7:b0:b3d:c3ee:406b with SMTP id a640c23a62f3a-b50aca012dbmr401336266b.61.1759937791159;
        Wed, 08 Oct 2025 08:36:31 -0700 (PDT)
Message-ID: <9b2ad27a-ffaf-46fc-890f-b5d94ff6a08a@suse.com>
Date: Wed, 8 Oct 2025 17:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/tests: don't pass -E to sed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
 <aOZ1nneO_4-KvvVK@Mac.lan> <dd1f9a5f-fc45-4ffe-b541-6f250b74dfb6@suse.com>
 <aOZ-MY8jP6R1I9Uf@Mac.lan>
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
In-Reply-To: <aOZ-MY8jP6R1I9Uf@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 17:07, Roger Pau Monné wrote:
> On Wed, Oct 08, 2025 at 04:42:13PM +0200, Jan Beulich wrote:
>> On 08.10.2025 16:30, Roger Pau Monné wrote:
>>> On Wed, Oct 08, 2025 at 11:47:05AM +0200, Jan Beulich wrote:
>>>> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
>>>> doesn't name -E as a standard option; only Issue 8 [2] does. As there's
>>>> nothing "extended" about the expression used, simply drop the -E.
>>>>
>>>> [1] https://pubs.opengroup.org/onlinepubs/9699919799/
>>>> [2] https://pubs.opengroup.org/onlinepubs/9799919799/
>>>>
>>>> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>>> ---
>>>> In principle the -e could be dropped too, for being redundant.
>>>>
>>>> Hitting the problem with an older sed pointed out another problem here as
>>>> well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
>>>> of make was (obviously) deemed up-to-date, thus causing the build to fail
>>>> again (until the bad file was actually removed).
>>>
>>> Hm, we could do something like:
>>>
>>> sed -e '/^#[[:space:]]*include/d' <$< >$@ || $(RM) $@
>>
>> As is that would hide failure of the sed invocation from make. I was first
>> thinking to sed into a temporary file, to then rename that file. But this
>> won't cover the more general case of the issue either.
> 
> Well, it would work if the sed into temporary file is a FORCE target,
> and then the move to the final file is only done if there are
> differences?

Yes, splitting like this ought to do.

>> Meanwhile I think
>> that the Makefile itself should become a dependency of the of the target
>> header. That way, if the sed expression changes, the file will be rebuilt.
>> (Of course this still builds on an assumption, specifically that any
>> failure here would be dealt with by an adjustment to the rule. So possibly
>> we need a combination of both.)
> 
> It feels weird to me that a Makefile depends on itself, but yes, it
> might solve the issue you pointed out in a simpler way.  Doesn't
> makefile consider all make generated targets as obsolete if the
> makefile itself changes?

I don't think so, no. What it feels a little as if you may be thinking of
is that if a Makefile itself is a target, make will re-invoke itself once
it was updated.

>  The pdx.h generation is a clear example
> here, but the same could apply to runes used to build object files?

Well, yes. That's why we have the .*.cmd files in the hypervisor build
system. That's less coarse than using the full Makefile-s as dependencies.

Jan

