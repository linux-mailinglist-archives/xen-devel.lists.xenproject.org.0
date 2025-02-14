Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDC2A357E8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 08:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888411.1297772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiq9v-00080K-11; Fri, 14 Feb 2025 07:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888411.1297772; Fri, 14 Feb 2025 07:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiq9u-0007xn-UQ; Fri, 14 Feb 2025 07:30:46 +0000
Received: by outflank-mailman (input) for mailman id 888411;
 Fri, 14 Feb 2025 07:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiq9t-0007xg-Bi
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 07:30:45 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99a09a00-eaa5-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 08:30:44 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab7c14b880dso369791466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 23:30:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53280ee4sm285049766b.78.2025.02.13.23.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 23:30:43 -0800 (PST)
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
X-Inumbo-ID: 99a09a00-eaa5-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739518243; x=1740123043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zao28lBkXvJxk0fI2Vjr62Sq7NctLSbKgwxN7Jtr7Q=;
        b=AzAzgc1DHKOCZ91QuQuH/lQ+D+bOhmZAJdmEKA04hB+3o3vyqEBx71A+qxXDxbFkNY
         QkBi7jTltu1hophZUjDSPVHf5VBXaQL6YV+ksc7L8Db1C68ZPuJ5LIjbwU7cjdW/EZyU
         ePudgNw2BdEnjZIAMGRDp/A5f1R3gu4PLIlCGftBLv869L5kgNjhmXZ7OfxNcT132Vek
         Y6WKoUp+peIZAu1yHom8BOAMbA8pNnfl4JoGVRQJrM07ygVByRQkmTWw48etmcYALtky
         /IGX9iiJOo7BzJPyISRwJ57KfoPmKhLaxAg1f8we9GmlVLT5CgpwD3Vza5gUlRZoqw8r
         tMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739518243; x=1740123043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zao28lBkXvJxk0fI2Vjr62Sq7NctLSbKgwxN7Jtr7Q=;
        b=fIYBLcpCK1pUgvsIYbhpNbAvPxjbCpyy1iC0WEKRlMa5ze1meotGCvyQtowx976eBD
         ykA8NjxfyuZXf/T/a0XCQZiHq5TPlSDnTEx7aNW3QHuJlJ4l/lu6bIyDVFgmPD2iDTwf
         zrPUpZwsMa752loOYTmE1Mrkp7lwTzUSL77fDPM6/tWgxu1gZLNVWMCIeXMvizXxdhO6
         RTpZ1AG0mty2fYwa8kSsUmzAl2dwM1HdpikQTzMwzqOGr5XkrjIiIlh7bIlDGTG+97qa
         aG4s+QPtklBWIw0wVkBhnMWA68tI3o9J0Gw2esuFP2Xmn3gy5PhMQAkFuDbNdWogI6yb
         Yb2A==
X-Forwarded-Encrypted: i=1; AJvYcCWwLiwItbeNGxKzCpmt5uUDZPfHiTbucIiQaK5HZGs4W6MR0g7h2C0pTzODUlLwNBBmgD5U+2/tG1o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1jwomuysqYRJC/qHxMzxZCl/ithwpJncSiOWRAl2hv7NOpMu6
	Fn6SbP17vAaXoaDirWTVxIDRwkQ16cGNc2wTZBgLa/T7s+pjdCgqM0DHcFfNPQ==
X-Gm-Gg: ASbGnctzt2LIvOhS1aVk88GVPTsecUeyQdlonFfgDt3CnaclPiy5ASLCOrXUyO16QPQ
	wAZsqfwDGZj2ZktIQ36rYZzY20aLkox5VTKXS2WgbLCkVFxthQUJWOUdUcnkstMyNNp342o+hrJ
	m6cS6iJzTgtJHluo08uuoKNoGFuh9hAouKFlbmKzzXNIY4UQre+7xlXnvKQr5DsAuDe5eFhfiH8
	QU4LXT2Kx4TiBGalJ421lfAOn99yT9B4TaXrWpUCj1HcDMlNj3eYG5ZQoGFaWX9ZQPEOerOibex
	rgaNwRq7QNxEJmCnhb4b1SkOJ/drrUH2LR9VtvkQiSinBA4NoacKdn2W1V6ULry1ssl+uFYN7Sr
	n
X-Google-Smtp-Source: AGHT+IE1p/GhN+49xhzw1Ga0Ig0m/irc6otuTKUpoaGBjdQjriIVRpLwQTR0O2qmwlIXt9JfwhRUOA==
X-Received: by 2002:a17:907:1c85:b0:aa6:9624:78f1 with SMTP id a640c23a62f3a-ab7f3714978mr1079717966b.9.1739518243487;
        Thu, 13 Feb 2025 23:30:43 -0800 (PST)
Message-ID: <e58bfb67-1a6e-46cb-9b5d-435eca5cd842@suse.com>
Date: Fri, 14 Feb 2025 08:30:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blowfish failure to compile
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <65338578-dd6c-4f01-807e-da389cc60cb8@citrix.com>
 <a2ef5618-b719-4c7b-ac6c-6861ba146ce2@suse.com>
 <a8df54e6-1fef-4eff-9846-d24bcfdd5bd4@citrix.com>
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
In-Reply-To: <a8df54e6-1fef-4eff-9846-d24bcfdd5bd4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 19:32, Andrew Cooper wrote:
> On 13/02/2025 10:06 am, Jan Beulich wrote:
>> On 12.02.2025 18:20, Andrew Cooper wrote:
>>> Elsewhere in the tree we fix this with -ffreestanding -nostdinc
>>> -I$(XEN_ROOT)/tools/firmware/include but that isn't an option for
>>> test_x86_emulator in general which is hosted.
>>>
>>> However, it is an option for blowfish.c specifically which is
>>> freestanding, and for which we build a 32bit form in an otherwise 64bit
>>> build.
>>>
>>> Therefore, it stands to reason that:
>>>
>>> diff --git a/tools/tests/x86_emulator/Makefile
>>> b/tools/tests/x86_emulator/Makefile
>>> index 294d27ebaa08..e46fd8becb96 100644
>>> --- a/tools/tests/x86_emulator/Makefile
>>> +++ b/tools/tests/x86_emulator/Makefile
>>> @@ -33,8 +33,8 @@ HOSTCFLAGS += -m32 -I..
>>>  
>>>  else
>>>  
>>> -blowfish-cflags := ""
>>> -blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
>>> +blowfish-cflags := "-ffreestanding -nostdinc
>>> -I$(XEN_ROOT)/tools/firmware/include "
>>> +blowfish-cflags-x86_32 := "$(blowfish-cflags)
>>> -mno-accumulate-outgoing-args -Dstatic="
>> What this does is request the shared (between 32- and 64-bit)) flavor to
>> be built differently, with the options "-ffreestanding -nostdinc
>> -I$(XEN_ROOT)/tools/firmware/include". And then the (kind of) nested use
>> of double quotes in blowfish-cflags-x86_32 ends up asking for several
>> 32-bit flavors: One with -ffreestanding, one with -nostdinc, one with
>> -I$(XEN_ROOT)/tools/firmware/include (which is what causes the
>> strangeness you saw), and the pre-existing one with
>> "-mno-accumulate-outgoing-args -Dstatic=".
>>
>> Every set of options grouped together by double quotes (or any unquoted
>> option) designates a flavor (while the quotation isn't meaningful to
>> make aiui, its use is in a shell construct, where those quotes play
>> their usual role). That is,
>>
>> blowfish-cflags := ""
>>
>> designates a flavor without any special options. What I understand you
>> want, though, is to have these flags passed to all of the blowfish
>> flavors.
>>
>> What complicates things slightly is that the first of the options names
>> the flavor (i.e. prior to your change, but with my APX changes in place,
>> we have
>>
>> blowfish_x86_32[]
>> blowfish_x86_32_mno_accumulate_outgoing_args[]
>> blowfish_x86_64[]
>> blowfish_x86_64_DREX2[]
>> blowfish_x86_64_mapxf[]
>>
>> resulting from
>>
>> blowfish-cflags := ""
>> blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
>> blowfish-cflags-x86_64 := "-DREX2 -Dstatic=" "-mapxf -Dstatic="
>>
>> . I think you can see now how the compiler ends up choking on
>>
>> blowfish_x86_32_I/local/xen.spec/scm/tools/tests/x86_emulator/../../../tools/firmware/include[]
>>
>> .) Surely we could accommodate for the added options by changing the
>> references from test_x86_emulator.c, but maybe there's a better way
>> (and also potentially useful for other test blobs going forward),
>> modifying the .h generator rule(s):
>>
>> 		$(MAKE) -f testcase.mk TESTCASE=$* XEN_TARGET_ARCH=$(arch) $*-cflags="$$cflags $($*-cflags-common)" all; \
>>
>> and then the needed addition simply being
>>
>> blowfish-cflags-common := -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
>>
>> Entirely untested, though, for now.
>>
>> However, further: The freestanding-ness does apply to all of the test
>> blobs, doesn't it? Why don't we alter
>>
>> CFLAGS += -fno-builtin -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)
>>
>> in testcase.mk to become
>>
>> CFLAGS += -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
>> CFLAGS += -g0 $($(TESTCASE)-cflags) $(CFLAGS-VSZ)
>>
>> (which doesn't appear to become dependent upon anything we don't already
>> have available in this file, i.e. in particular $(XEN_ROOT) is already
>> used elsewhere), seeing that -ffreestanding implies -fno-builtin?
> 
> -ffreestanding seems fine.
> 
> And while -nostdinc -I... works for the 32bit builds, they break the
> 64bit builds.
> 
>> In file included from blowfish.c:18:
>> /builddir/build/BUILD/xen-4.20.0/tools/tests/x86_emulator/../../../tools/firmware/include/stdint.h:5:2:
>> error: #error "32bit only header"
>>     5 | #error "32bit only header"
>>       |  ^~~~~
>> make[6]: *** [testcase.mk:16: blowfish.bin] Error 1
> 
> which is because we've only provided half a stdint.h
> 
> I think that means we only want the -nostdinc -I... in the cross-build
> case, which I guess means searching CFLAGS for `-m32`.

This or make the 64-bit case work in tools/firmware/include/stdint.h.
At some point that may end up being necessary anyway.

Jan

