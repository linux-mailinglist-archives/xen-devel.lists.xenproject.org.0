Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59258069FA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648977.1013135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnTW-0000Vv-AT; Wed, 06 Dec 2023 08:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648977.1013135; Wed, 06 Dec 2023 08:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnTW-0000T3-6L; Wed, 06 Dec 2023 08:41:46 +0000
Received: by outflank-mailman (input) for mailman id 648977;
 Wed, 06 Dec 2023 08:41:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnTT-0000SG-Sd
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:41:43 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47d3e242-9413-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 09:41:42 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-332c0c32d19so578204f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:41:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l14-20020a5d6d8e000000b0033343b1ec1asm8704506wrs.26.2023.12.06.00.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:41:41 -0800 (PST)
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
X-Inumbo-ID: 47d3e242-9413-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701852102; x=1702456902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FSJmxM6AaCYttK0D/fkGRAXDM/3Z8X9PgrOncB9F9OQ=;
        b=gRxJpmfXiUkdf+4vixQ7K0SkImiJ9WyiRnIxgUw/oV6tCKonEZ5Py2EoKrOzsaQOLF
         ChHeiVvAwJv3XZog3/2/MZXL51O//pp0oXCusTidg+vj4hGnDRF8rpE2apImY3KjZ8fB
         MBa7+ObqgeNnCkD3v2ZlD5Gs4UNgb8bF41UXDuv3dADkQknbXBrIzd6dqNZM0Hlz6NMI
         Q3Fzi+1aNIRDX4rS4+dxcP3ET2XbJWjEGruBQy/sYkTuGT9NTawkzt5/PSiVkFWHX0UM
         fOgYPtwohhRWqXglu0Lof1VYZPu1DTF3XoCinl/yLvqZiyILMD/fJjBRX/I29MlOJhoO
         4S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701852102; x=1702456902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSJmxM6AaCYttK0D/fkGRAXDM/3Z8X9PgrOncB9F9OQ=;
        b=TD/a5+P3HIcMayBhgBpXI3IeTj51PTXvVrW8c1ZzGHACo0aKcgtbIJIVauzzuJadnD
         /CJN0FFieiB1qXKp4+hpjsUtNCNtxWnwPcYC7EOXney2UdS4PSNuq7GGOQa2HwUmF5vW
         qiITc5AZBpClpWmHqKD5hNVS2M9kXL9BZIaSyEl1Qux75nsrSP1ukbZp+iQZMIOKp/yb
         0Aj88Y5UBqiY7Mw93E8h/AXGAFQzjzlNG79irYEYvJ0V7wrET7Z7cEOueK24ShtEhxai
         kiCRBAeH95fGy1u1MDtltAkZucqaOohF+zlvVA3iE7iSdhwOaOB5BfyrB7EHQXO3yYmU
         ab2Q==
X-Gm-Message-State: AOJu0YyxuBOUMZipuX6n5XktfOufPAtkYAgrTYvDKF7VDB4uTXU2/UCc
	DCd92H+ePMcxBYfAGoJ9sM6Y
X-Google-Smtp-Source: AGHT+IEt8BQ36J6a3X/Kz6hddQFV22uS9olYdkI6dikI24GGvg2UKGZMfjZKhA/sYWL/3fcU2BxxAQ==
X-Received: by 2002:a5d:6143:0:b0:333:2fd2:2ed4 with SMTP id y3-20020a5d6143000000b003332fd22ed4mr263672wrt.77.1701852102175;
        Wed, 06 Dec 2023 00:41:42 -0800 (PST)
Message-ID: <50b36423-d1e1-406f-a63f-66f2e4dce68e@suse.com>
Date: Wed, 6 Dec 2023 09:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
To: George Dunlap <george.dunlap@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20231205181218.74667-1-julien@xen.org>
 <CA+zSX=aUV00BwnNfFTbCE=6PuVNT=UFvE0tnMO3UhwCMh5jmHQ@mail.gmail.com>
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
In-Reply-To: <CA+zSX=aUV00BwnNfFTbCE=6PuVNT=UFvE0tnMO3UhwCMh5jmHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2023 03:21, George Dunlap wrote:
> On Tue, Dec 5, 2023 at 6:12 PM Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Several maintainers have expressed a stronger preference
>> to use '-' when in filename and option that contains multiple
>> words.
>>
>> So document it in CODING_STYLE.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>     Changes in v2:
>>         - New wording
>>         - Update the section title
>>         - Add Jan's acked-by
>> ---
>>  CODING_STYLE | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index ced3ade5a6fb..ed13ee2b664b 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -144,6 +144,15 @@ separate lines and each line should begin with a leading '*'.
>>   * Note beginning and end markers on separate lines and leading '*'.
>>   */
>>
>> +Naming convention for files and command line options
>> +----------------------------------------------------
>> +
>> +'-' should be used to separate words in commandline options and filenames.
>> +E.g. timer-works.
>> +
>> +Note that some of the options and filenames are using '_'. This is now
>> +deprecated.
> 
> Sorry for not catching this last time; "are using X" isn't really
> idiomatic English; more idiomatic would be something like the
> following:
> 
> "Note that some existing options and file names use '_'.  This is now
> deprecated."
> 
> Since we're changing things, I *think* most style guides would advise
> against starting the sentence with a punctuation; so perhaps:
> 
> "Command-line options and file names should use '-' to separate words;
> e.g., timer-works."
> 
> And what about adding to the last paragraph:
> 
> "When touching code around command-line parameters still using '_', it
> is recommended to modify the documentation to say only '-', but modify
> the code to accept both '-' and '_' (for backwards compatibility)."

In this context see
https://lists.xen.org/archives/html/xen-devel/2020-01/msg01945.html
and Andrew's response
https://lists.xen.org/archives/html/xen-devel/2020-01/msg02006.html
I'm still in favor of addressing the issue centrally (making unnecessary
adjustments like you suggest in the new paragraph). Yet I think Andrew's
objection would cover such adjustments as much as my generic solution.

Jan

