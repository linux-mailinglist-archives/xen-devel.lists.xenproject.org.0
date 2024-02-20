Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9585BBD1
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683485.1063043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP6i-0004JR-Rq; Tue, 20 Feb 2024 12:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683485.1063043; Tue, 20 Feb 2024 12:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP6i-0004GZ-OR; Tue, 20 Feb 2024 12:20:20 +0000
Received: by outflank-mailman (input) for mailman id 683485;
 Tue, 20 Feb 2024 12:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcP6h-0004GE-SK
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:20:19 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68ef44ce-cfea-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:20:18 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso36042615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 04:20:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h7-20020a056000000700b0033ce214a97csm13294488wrx.17.2024.02.20.04.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 04:20:17 -0800 (PST)
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
X-Inumbo-ID: 68ef44ce-cfea-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708431618; x=1709036418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gGpH+jB7t66iuiZhxtwTK7HRXVSiLbcivuzs1lr+EUs=;
        b=Z90UEnNIBnt0Iq+C0n+kW+7uFiCaJypTOuIxNanLmkWzET7SIT97rFoe5+3hBzDY14
         AsqdWxztquncWs2uUs8cfk+B/5RNIKqjoVp8YFTyn21i1r7+5cnP0KsZLorCKjOg1CGf
         k2iNlKwbKjXqj4GFQnCaq6OLuYD18yBS2amRUSf2A5IjzvYfaihcINT6E99dkBInkLQd
         0zvUJIwSMrX1rksgc7grcmk5ibTXHyXrdUaE+JhhMFUbcAkaWeELHhIoVdC6EnKi3NPz
         NXtYkFai9e2gYeVoCBN1xYHq7+JeI3ldrIRNYWnEZiUD55m4sKu8i9csWb6b0ShVN/Id
         A/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431618; x=1709036418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gGpH+jB7t66iuiZhxtwTK7HRXVSiLbcivuzs1lr+EUs=;
        b=N/92FlGOYvfvRB+01Y2MdDXLGXVlrGDT3em764Mi7l6M2vAmWsKM0JApJOKqzLPvs6
         UBqwK2ImlrgUMECtdlYL+FVh+CFz6Eh8cydRDtgcx4CWESOtUCqtiGveDDCylyZTroZg
         HTgqJSUJrxQ4BTLJp6HD1f7AItLPikTkEBuSXd6edrWrywSBf8BabNeoN8dQ+5uuxJB1
         N0vZtmy8zyNp5RISEJvoBp4pjVyfWyJiTEaZydmrRjMjhjKy7POVzpMwi+dpcQKT9SVn
         VWTFyk8nRxrOI67jF42nTa48trCHzY8P6P3c+pU5hf3QIZSDQNqo8dxKmMB+uea1dOHM
         0doQ==
X-Gm-Message-State: AOJu0Yy+83NYzMQpt3wAUVvmTsV8B0rsw/jzkBjoeTFf2mhP1PCVzC3+
	b6rxK/+6Fyq9O/GOO4/IU0NoGgBcsrtr9rLHHZgqwUOm2QPZ3t+peNDJHvuTrg==
X-Google-Smtp-Source: AGHT+IEp6LZtjnmzI9LcyMMXQ4nn/eBJ+wKlP3BB1yg2+nIueMrhvUp644KGaxtuvfWYkkVUgjcQcQ==
X-Received: by 2002:a5d:42ca:0:b0:33d:4e39:1c45 with SMTP id t10-20020a5d42ca000000b0033d4e391c45mr5576998wrr.6.1708431618024;
        Tue, 20 Feb 2024 04:20:18 -0800 (PST)
Message-ID: <abbae372-5e3e-4013-a2a3-45892ec96c89@suse.com>
Date: Tue, 20 Feb 2024 13:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: make sure build fails when running kconfig fails
Content-Language: en-US
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <55c3a781-17f8-47f2-9629-515e1aea77aa@suse.com>
 <b7c22718-ec6c-470e-be72-e613b2af3c54@perard>
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
In-Reply-To: <b7c22718-ec6c-470e-be72-e613b2af3c54@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.02.2024 12:18, Anthony PERARD wrote:
> On Tue, Feb 20, 2024 at 09:43:56AM +0100, Jan Beulich wrote:
>> Because of using "-include", failure to (re)build auto.conf (with
>> auto.conf.cmd produced as a secondary target) won't stop make from
>> continuing the build. Arrange for it being possible to drop the - from
>> Rules.mk, requiring that the include be skipped for tools-only targets.
>> Note that relying on the inclusion in those cases wouldn't be correct
>> anyway, as it might be a stale file (yet to be rebuilt) which would be
>> included, while during initial build, the file would be absent
>> altogether.
>>
>> Fixes: 8d4c17a90b0a ("xen/build: silence make warnings about missing auto.conf*")
>> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Just to make sure, this patch is a workaround to a harmless bug in older
> version of GNU Make which print spurious error messages, and said bug as
> been fixed in GNU Make 4.2, right? Bug report:
> 
>     bug #102: Make prints an incorrect error for missing includes
>     https://savannah.gnu.org/bugs/?func=detailitem&item_id=102

Assuming you mean the change referenced in Fixes: - yes, that's my
understanding. (Whether the referenced make bug is the one I can't tell,
though. But it looks like it is.)

>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>>  # This exploits the 'multi-target pattern rule' trick.
>>  # The syncconfig should be executed only once to make all the targets.
>>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
>> +	$(Q)rm -f include/config/$*.conf
> 
> Maybe this should say "include/config/auto.conf" instead of using "$*".
> "syncconfig" is going to generate "auto.conf" and not "$*.conf". And it
> would make easier to find the "rm" command via "grep".

Generally I advocate for using $* wherever possible in pattern rules. If,
however, replacing that is the only way to get an ack for this change, then
I would (hesitantly) do so.

Jan

