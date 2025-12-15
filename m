Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0920CBD7D7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186867.1508286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6jj-0007EH-3z; Mon, 15 Dec 2025 11:27:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186867.1508286; Mon, 15 Dec 2025 11:27:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6jj-0007CH-0d; Mon, 15 Dec 2025 11:27:31 +0000
Received: by outflank-mailman (input) for mailman id 1186867;
 Mon, 15 Dec 2025 11:27:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV6jh-0007CB-Dn
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:27:29 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08ec0941-d9a9-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:27:27 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so3115845e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:27:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4f4150sm182118715e9.11.2025.12.15.03.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:27:26 -0800 (PST)
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
X-Inumbo-ID: 08ec0941-d9a9-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765798047; x=1766402847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hR3Nt6TKd4sOlm7Y8Qhpv1OXx0NlAD/Ebw9cfGcp60k=;
        b=JdcjgR6Vsa4B7rTIGBtOLc23SC97Z/TbdKxXLP4vmC1Mj2wYxE2nmWXH5QahAcbqs/
         dK/J2DMKS4nHtox5fK8pxGBTDAqh9qH/tpqOsGpGg0sRolQRakhw1XMIXKaxpRTjHOgX
         x+F3IuDDMyfdNezSjAIvyO6OohCRSTokwqKCjPtB6gt+GaxEqWSSFKb3NYJEyDj9N6hQ
         MgXzcAp6SoJFbZmtWUrCZApcEPOTMRKkZ5Wnbz7t/OMiaCxIew2gXtLUVBX2iD1hJFg+
         T2YK3fFWBOIQb+B3NmEPbPIajreAXXBOf9AlDUo/IF0Sf4d+JeedBPT4ML1Z5JF+DkFn
         yMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798047; x=1766402847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR3Nt6TKd4sOlm7Y8Qhpv1OXx0NlAD/Ebw9cfGcp60k=;
        b=L7HCaXL3fDDEBiXMDCBcEcGQbrwgjQXRWP74/H8bOLD1NmukhzXOqSZTBoTIRNerpH
         uOQ17YCxT3ojLIgqX9IDKP9J8hq53z/lHQHd5O5LNT+gw3R1tc+WMsx6+bh4SYyJ/jrq
         PnucJs2OapkSxOz7Qp6b9QhvIxs/XtFVuX2UvdMGI1H67fjUmr5ngMW8Ehq1GFhFYIEZ
         S3FUPSDTdtYXYEnuxghoIkLq3WvkPunbz/CIF86mygw4M0ucUOFo3xIrqUkUcH15znLO
         ZU+MmakHYgUbpOCdKqyi7PE11GlSbGUZYhO4qXzA6U7HeFJd5PSQhPNatixOfhcZOxYv
         22Tw==
X-Gm-Message-State: AOJu0Yyth203yum4dMBzzTxUBC/fbWhOr3rZ7b3GVf6NiWG/MhMS6pIP
	XWVnJvMhU32GOnLK8JTvIjsXTFavD86HoPwARHT2cH7XcxmA6exFGAW7ZoZ6W8dRrQ==
X-Gm-Gg: AY/fxX5OheDgEpLHLwxP5s9HOXOYNc5Qki5cQ5bB0o7C/gOemX2l9oTGE8X43NiSjMF
	T/EBx3AtooHSlDMjDoC7A2l3KZgNA+uPPlyVMBL0ZTjczeFD2ZlbO4oolCsk+cLSmWgmxO7F5+v
	ioM9htGBQZNyb9id93vBUnZE7sMREYLSDQnsdzXz02HTPY5D8beXuxaCvE0zThh65DA5Oy37FWB
	e+KuEDEskbNIgw0h9LmpN/NgfitSODA0hLErOUgBXfEQdltc/H9MSq3nVV9rxD0vPhrmxmqrwRk
	kyKXMagsdw709vNGew8fxPW2hAIGx3V51lHScyAH8cUs7/8nmUBWw1SyB0Lhqc8WNWNI3xH4fd/
	y094qhTw4tfgMo9OF+N1nxB+hCuiGwPnZCG8sleF3EhSByRdPqxprRNM03cbrq1z7hkdGeBKNTq
	9bw6XcZ1lDnSyI6ifJY11/YWGSwLALpXe/NkJ1Mil8Ne0uf5hruEsWVpAmqx0dvJuKzU+csNt8U
	Vk=
X-Google-Smtp-Source: AGHT+IGUshkBKTpJBopfZ6Lp5ob3D2AwraG7cALw4mTcqBkwkuPjhCmd0LhtfmTD0gfb2i11/HALDA==
X-Received: by 2002:a05:600d:844f:10b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47a90019d50mr82836815e9.21.1765798046683;
        Mon, 15 Dec 2025 03:27:26 -0800 (PST)
Message-ID: <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
Date: Mon, 15 Dec 2025 12:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
 <a5361a51-128d-47e0-b5ed-58bfd0d9e8ad@suse.com>
 <CAGeoDV-vfiKECmvWzJ4dnzicXDL7XJDxwEy_Z737k+234Gkzpg@mail.gmail.com>
 <CAGeoDV8VZ1m6CQAkKK-9UDz4npXm2V+Up+BBo=+NyzgLJMW+3g@mail.gmail.com>
 <b4013cae-f27a-4c69-b136-d33db2d22725@suse.com>
 <CAGeoDV91W24tu6MOuM6a9B1jDjJ_8oNdsMYaxNA-ehbxn3xLoA@mail.gmail.com>
 <10aaed6d-6cb1-4bed-aa8c-5f9761f04fde@suse.com>
 <CAGeoDV_bTFNMS_XbEyfB0xNmpi=Yhr5VzszDBPTS5yYtjo1hnQ@mail.gmail.com>
 <e38c24dd-1acc-4d9a-b6f6-5e1964753840@suse.com>
 <CAGeoDV8QDBeqTPv30hcbd2giGRJp_1h+JgeGuTodhP3m8qHpHQ@mail.gmail.com>
 <b30ecffe-f696-4777-8e85-2fe30407534d@suse.com>
 <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8US=pPHN-jYCKDLJpjJGwLg7jm2FaBCRwv-zmQ3rUUkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2025 12:00, Mykola Kvach wrote:
> On Thu, Dec 11, 2025 at 6:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.12.2025 17:30, Mykola Kvach wrote:
>>> I have now attached the corresponding build log.
>>
>> Okay, so indeed not a table size change issue here. Then I fear some instrumenting
>> will be needed to at least know what exactly is going wrong. Alternatively you could
>> arrange for the intermediate binaries to not be deleted, and make them available
>> somehow / somewhere for me to see whether by inspection I can gain some clue.
> 
> I prepared a small patch to keep the intermediate artifacts instead of
> deleting them.
> 
> It removes two cleanup commands:
>     xen/arch/arm/Makefile: drops rm -f $(@D)/.$(@F).[0-9]* (keeps
> .xen-syms.* intermediates)

This alone should be sufficient.

>     xen/scripts/Kbuild.include: drops rm -f $(@D)/.cst.$$$$ (keeps
> .cst.<pid> used by compare-symbol-tables)

These can be easily re-created from the ones retained above. (They might be
of immediate interest - and hence worth keeping - if the comparisons failed,
but you said the build works fine for you even with these comparisons added.)

Jan

> Should I gather any other files/logs that would be useful?
> 
> 
> 
> Mykola
> 
>>
>> Jan


