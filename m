Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10378562BB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 13:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681647.1060495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaa7-0001V9-Cq; Thu, 15 Feb 2024 12:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681647.1060495; Thu, 15 Feb 2024 12:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raaa7-0001Td-AH; Thu, 15 Feb 2024 12:11:11 +0000
Received: by outflank-mailman (input) for mailman id 681647;
 Thu, 15 Feb 2024 12:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raaa5-0001TV-Cc
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 12:11:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bb8ed36-cbfb-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 13:11:06 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-412191ed8aaso3470195e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 04:11:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x17-20020a05600c21d100b00410b98a5c77sm4791449wmj.32.2024.02.15.04.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 04:11:05 -0800 (PST)
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
X-Inumbo-ID: 4bb8ed36-cbfb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707999066; x=1708603866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcRMUwPZcmaSPhqmiHsxfNjaMovTXTDT448L2EiX46M=;
        b=XkGXBnH35HMePRoxH3NnH1ohG8OVZvJ2768Dbcf3qSlOdi35EByPtduXWNGdRyPvIG
         GNUPK5dnLFl7mxUrQlD5yHzPG11OZ7h4WLYkqiGjvqY8PN/eAmtCQtYFQbrgbko/DhGS
         G3gJIGTLk2bLS5w+XLx36nuBIC0utvoCuEpzJ4EK4OFBFMVzEHE63bEPmttB7zydobEE
         c2/cHE9r8yihj7Lemd1PTTOkbY/mSMuzUN9KTNiGECsMOOV1wB6rNP6WHKGvItD3zzNj
         5p559AW+F9JjgduNHxmbTt4g/FORRicLepTxEvn2W4u+HHOOMwk/wLqrMzOTfDupZdcO
         dWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707999066; x=1708603866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcRMUwPZcmaSPhqmiHsxfNjaMovTXTDT448L2EiX46M=;
        b=J10+soL/z9qlTHxPOOp0glFwPMnQI1yB0xenhaYeUtBPb5B42+hgFqME573caRC97b
         DzXP1a4MCdLnNJ+g53G38r/BxldTLIPDEm0dQRp11wK4PZzNZkPb/LlvN7pMVW6fynDj
         jGP5sU6SNUEM2e/tcDfzuYLmI4jLZvk64oeyQ1qvMgYHwLo79agrCfW9pV76IHfqC4lI
         x0IrTmxAc5yQMgWalS+pYGFUh7hLt49B6sO3rMwV8u+KtA184Mue7MbTr3X9Tkk9VoV7
         DmlWbMq8hLzFc4h8IrfV986BWKZ6OOjqEuti4usbuK0VUiVUyUZjO2tS5nbiPOEqCRKS
         bh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlzsCSQ3TTRj+vW0dt7XBtLmScV2jGDJME3N5WA0ShytOTpS47sGTOYnkYnJSPyMCcZVJJDhZYN+hnIkF2XgUPhfM5xhBXMwDOUFJh6q8=
X-Gm-Message-State: AOJu0YxwkMDJjvBHsFV0ucUsUPenDm1ihX7W5NHJ9TBkMr1mgaRVVKRx
	I/7Lnfv8S3lQo480klsYL4k8pCMNZTl70oWUyQBN2Uy9xS62ZZC5Hywy8P90QkqI41m9zhzliJk
	=
X-Google-Smtp-Source: AGHT+IF6Db8sMd+Tb3U9olw/t7dSlP1TGmCvGVen1RoVuwd75gDChg/A5kFyp2AcluXgKh66BpTz7A==
X-Received: by 2002:a05:600c:1c8a:b0:412:1ccd:d770 with SMTP id k10-20020a05600c1c8a00b004121ccdd770mr898337wms.25.1707999065958;
        Thu, 15 Feb 2024 04:11:05 -0800 (PST)
Message-ID: <4a462da5-e826-489f-8b59-40c7e6c6ba68@suse.com>
Date: Thu, 15 Feb 2024 13:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: anthony.perard@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com> <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com> <Zc3v20RKMssbaDsl@macbook>
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
In-Reply-To: <Zc3v20RKMssbaDsl@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.02.2024 12:04, Roger Pau Monné wrote:
> On Thu, Feb 15, 2024 at 11:43:02AM +0100, Jan Beulich wrote:
>> On 15.02.2024 11:28, Roger Pau Monné wrote:
>>> Without the reordering the include of include/config/auto.conf will
>>> always succeed on rebuilds, because the include is done before
>>> executing the include/config/%.conf.cmd target that does the `rm`.
>>
>> That's a dual target: It also handles include/config/%.conf. I.e.
>> because of this ...
>>
>>> With the current order the include of include/config/%.conf.cmd that
>>> triggers the re-build of auto.conf happens after having included the
>>> file already.
>>
>> ... either include would trigger this same rule. IOW I'm afraid I'm still
>> not seeing what is gained by the re-ordering. I'm also unconvinced that
>> "triggers" in the sense you use it is actually applicable. Quoting make
>> doc again: "Once it has finished reading makefiles, make will try to
>> remake any that are out of date or don’t exist." To me this means that
>> first all makefile reading will finish, and then whichever included files
>> need re-making will be re-made.
> 
> Without the re-ordering the execution is not stopped on failure to
> generate include/config/auto.conf:
> 
> # gmake -j8 xen clang=y
> gmake -C xen install
> gmake[1]: Entering directory '/root/src/xen/xen'
> rm -rf include/config/auto.conf
> tools/kconfig/conf  --syncconfig Kconfig
> common/Kconfig:2: syntax error
> common/Kconfig:1: invalid statement
> gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
> gmake[1]: Failed to remake makefile 'include/config/auto.conf'.
>   UPD     include/xen/compile.h
>  Xen 4.19-unstable
> gmake[3]: Nothing to be done for 'all'.
> [...]
> 
> With the re-ordering:
> 
> # gmake -j8 xen clang=y
> gmake -C xen install
> gmake[1]: Entering directory '/root/src/xen/xen'
> rm -rf include/config/auto.conf
> tools/kconfig/conf  --syncconfig Kconfig
> common/Kconfig:2: syntax error
> common/Kconfig:1: invalid statement
> gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
> gmake[1]: *** [Makefile:379: include/config/auto.conf] Error 2
> gmake[1]: Leaving directory '/root/src/xen/xen'
> gmake: *** [Makefile:143: install-xen] Error 2
> #
> 
> So the re-ordering is meaningful.

Hmm, I was about to say "no, it isn't" but then remembered to try newer
make. With 3.81 all is working as intended with no re-ordering. I wonder
if this isn't something with make, rather than our makefiles ...

Jan

