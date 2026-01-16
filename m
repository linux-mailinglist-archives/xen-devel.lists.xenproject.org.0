Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81003D321B4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jan 2026 14:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1206626.1520036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgkDE-000254-As; Fri, 16 Jan 2026 13:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1206626.1520036; Fri, 16 Jan 2026 13:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgkDE-00021P-7H; Fri, 16 Jan 2026 13:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1206626;
 Fri, 16 Jan 2026 13:50:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgkDC-0001YF-WA
 for xen-devel@lists.xenproject.org; Fri, 16 Jan 2026 13:50:02 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4092efc0-f2e2-11f0-9ccf-f158ae23cfc8;
 Fri, 16 Jan 2026 14:50:01 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fb5810d39so1632877f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Jan 2026 05:50:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921dedsm5415980f8f.9.2026.01.16.05.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 05:50:00 -0800 (PST)
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
X-Inumbo-ID: 4092efc0-f2e2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768571400; x=1769176200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U+rQyQgzpiX9jFzahbz+s4ZW0ETE/t7YYZZKejJ9Hwo=;
        b=P0TRqGSsZX/HG/KcT4fs1HgPfakLdq7KxKUEsLwK/o+7VptmejJNIjj9aTfUalLR2K
         BZ1h42Q2LsNtnLwhYsa/wc0PNnZfMuRn23ShXdmVvDu+05IuHH+DaeTwoNZkauTdExnT
         NULTsmGaUUgRUDOjVeqEFHM37tGCrji9NT9lHBRZZxOqbUaU3oFlavf54BJnO9n6Q4PK
         X52gBl8y2bhZpAWLiBImCnBnu3l41NpNS4HRttVEVp0zCJILd7FaCvidV9N6w6QnGQ9A
         i0dXbEamWygL458Jb3AEDlFQq+gXbxlBvf41oVvNr8UrVmkDM45+maeFiCFjQ+GcPJQJ
         KGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571400; x=1769176200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+rQyQgzpiX9jFzahbz+s4ZW0ETE/t7YYZZKejJ9Hwo=;
        b=k8YqdKt+xHxqT8JsjOkZge5k4EmnX5mAlrhlhgxkOz3e47L8GtDmUgKfsYxvg3g8KH
         2preqk88Mw27gMysqdi6rVEY6eFF7gFzLU5AF+TAJ6jpjuSr7J6Ijkogkmd6xQrVk2hW
         q4YcXYontmBdoaPOzr1U9IOxEWMaO1JPF0dlOyOf+ud8pi2rIVx/NloeAfH/3LEFVOjM
         +Q89ZSuL5ikHEuauYywbKf4NoEaoOZIVzhcunmtg04utFBe0szl5iB4/92U/BqxSjGjW
         7xYX/T8v8mLot8nJPJNQajRq5XHApBo6CSG95kw2LByIle5OoyFMA05XtYdAlNhs+uOi
         WBNg==
X-Gm-Message-State: AOJu0Yxex5Ha7oGNkdPpbJhxmV8V70XKrZKkBs0mLZG3+YfMoncWTY1t
	oy8MchNImD2MxHbrBsGi2cvF62gwxhG5ePzjhbnnk6Mwv7tf9S/+mFFPpqexqaJdoQ==
X-Gm-Gg: AY/fxX5bs0gE0gvvC69hc56kO+V3GtZDDYTF0W181vmr4ySZIkhtf6Z1bQU98ZS9DMD
	aigCLMe/plAfpClrywizBzbUxPzsI5nOinpvf/lmVkalmOwY2ong8XWE+uu8ZrrWAcOZhAHlhTs
	Zpoejj4y3ZxHb/RiGTwAN2223zbNgnkoucZASU5391S5F7RhKJeCC3DogAOgsadPBs6EvoyZ6Ri
	jS16I1eHN5ZctAIEZiM6iURFrcjlgXq4s98jPwHjbTS8R7aVLsONfSQdglUnlZBkAmcM7C4tNXC
	VAf73VUlTVNBV2YVAg/nBazHWXGx0tD6CSWupjwBxKxVY6gFgDaklKEUvz7yqB1KoFIP8qZpUOq
	k9ujWfo8U5Fck+ZnsZvZ1ziT6XH4V16D1F9V1ieCzvcCtgYKBJ6JHLK7C25QHBOphLgQ7XwRct0
	llcWczus1R6Oa9DNXHth7v/VPM2uCh5oReC2MqtTjkskwpZVhBhy+/oasjKBwIVORRALOdNGLj3
	/I=
X-Received: by 2002:a05:6000:2382:b0:430:f742:fbc3 with SMTP id ffacd0b85a97d-4356a05c0f1mr3699473f8f.48.1768571400392;
        Fri, 16 Jan 2026 05:50:00 -0800 (PST)
Message-ID: <728956d5-b404-4e9c-b618-06289acbc71f@suse.com>
Date: Fri, 16 Jan 2026 14:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Strange symbols_lookup() behaviour in test-symbols on arm64 CI
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <CAGeoDV_YS8hV2+FXVgXxvHLw=MQOAoJZwrP1Ypw8+ZUjKB9GSA@mail.gmail.com>
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
 <35819233-07ba-4e00-8939-74b2f4454250@suse.com>
 <CAGeoDV_fN84JPxLJfE0uWujYfeb+7t5HnFhK-up1Oymk0VT2MQ@mail.gmail.com>
 <d237b414-eec7-4cf2-bf1c-0c12b0f9f364@suse.com>
 <a6798348-35e9-406e-b6ef-4f88b7da84ac@suse.com>
 <CAGeoDV-sYJC-bXMAN2qJmPRHqE7oQPRb6D0e0BZi=tJ0aTK-Mw@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-sYJC-bXMAN2qJmPRHqE7oQPRb6D0e0BZi=tJ0aTK-Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2026 13:48, Mykola Kvach wrote:
>> Actually, can you give the patch below a try? That would explain the 24-byte
>> difference (albeit I'm struggling with some other aspects of a proper
>> explanation).
>>
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -87,13 +87,13 @@ endif
>>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
>>         $(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
>>         $(MAKE) $(build)=$(@D) $(dot-target).0.o
>> -       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>> +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>>               $(dot-target).0.o -o $(dot-target).0
>>         $(NM) -pa --format=sysv $(dot-target).0 \
>>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>>                 > $(dot-target).1.S
>>         $(MAKE) $(build)=$(@D) $(dot-target).1.o
>> -       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>> +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>>             $(dot-target).1.o -o $(dot-target).1
>>         $(NM) -pa --format=sysv $(dot-target).1 \
>>                 | $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> 
> Thank you for fixing this issue.
> 
> I tried the Makefile change you suggested (adding $(build_id_linker)
> to the two $(LD) invocations.
> With this patch applied, I no longer see the issue.

May I translate this to Tested-by: then (confined to Arm, as the full patch
touches PPC and RISC-V as well)?

Jan

