Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BF8A9835
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708215.1106887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPak-00043L-8s; Thu, 18 Apr 2024 11:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708215.1106887; Thu, 18 Apr 2024 11:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPak-000413-69; Thu, 18 Apr 2024 11:06:10 +0000
Received: by outflank-mailman (input) for mailman id 708215;
 Thu, 18 Apr 2024 11:06:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxPai-00040e-6m
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:06:08 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a52a7f6d-fd73-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 13:06:03 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-418dc00a31dso5943715e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:06:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b00418f308091csm563453wmo.48.2024.04.18.04.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:06:02 -0700 (PDT)
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
X-Inumbo-ID: a52a7f6d-fd73-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713438362; x=1714043162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhK1ZshKcZ2qaOnJQ6VPCMWbvpcTdm85fk7zi+R8Qa0=;
        b=KWGDzGlQPNpUhbvVRnWWXuCLRYtnKnrof5Q1DoccyUKGWH7dT7Ltu+7rpJZ0vRnAtn
         7+nVhSIpryXtoE/I3N3CONB22MbI2OyLqHuch2BUeS1nYLvELuUrhSmtk/UGvz3erGoW
         znzLtF6AR9RLdJZ9ZzSwoA2NTwUAdz8DklFXAIWJapUx9kSAqECR01k8MjYv9wgdmOk/
         YpMG8pAaDQmM6C/rrHaif+PeijJKnlfLoZijcCksImm9Ra7XZPoHCF0F9NSRd1Dj70lp
         EH6wueykbBO8xtoPthjFVHI25CCmx7MlyBLXhqijSIo9j+BzbHzCPdv7iCGqsfJsbzsq
         +Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713438362; x=1714043162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhK1ZshKcZ2qaOnJQ6VPCMWbvpcTdm85fk7zi+R8Qa0=;
        b=qMSBtmmf+IU09kA6Cx4p11RXgEaAVcyjz/maJk+wxymwqLKG5q7MgW+17SI3i5DO9e
         KD29KYVShzwuBfAEkiVmD3grjxPzxidJ4lBo/5XJBZ7kgFuwfPv65RZy5hFNCRLhhunh
         DE9IKuwxMdfo5/ogWq0POLeXQQwcj3VR6qGtI5MN3wjrRWz0VayMRhvrY08CINjnw2XQ
         aMccpBOngn+M3fZoNfy/FS36GjH5U1vnKrqyaezHdRzTBGrHIhf++rAo6SGe1ZMnKHyo
         vAshjQ327sMW1XhG4jYyetWY0O6WMb3REbBSVw6xAZsgFnywHab7/r+5ln9BnbtWNatc
         Yilw==
X-Gm-Message-State: AOJu0YwfQJ7923texKnCZm4ry5JnW0d16Hksc79FgcocgOGMEJ8s1GgW
	OAJgAMsDX1fhI5bqv3mvXelyehFpeWNAmmphoBc1uX/L2n2T+HvzrcBHL5k8Tg==
X-Google-Smtp-Source: AGHT+IGhEMbpQOOc27Q/u+Z3K/u/WR4dMbV17PxWlJcJdOcKlhP/yaLyYFq4RDi4n2sfQvWHU4XOyQ==
X-Received: by 2002:a05:600c:4fcb:b0:418:969b:cb37 with SMTP id o11-20020a05600c4fcb00b00418969bcb37mr1950850wmq.39.1713438362530;
        Thu, 18 Apr 2024 04:06:02 -0700 (PDT)
Message-ID: <07d373eb-2859-41dd-8bc2-834a76337947@suse.com>
Date: Thu, 18 Apr 2024 13:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Rewrite DOS/PE magic checking without memcmp()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240416155251.2942504-1-andrew.cooper3@citrix.com>
 <Zh92vsPzuHjTIs21@macbook>
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
In-Reply-To: <Zh92vsPzuHjTIs21@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.04.2024 09:14, Roger Pau Monné wrote:
> On Tue, Apr 16, 2024 at 04:52:51PM +0100, Andrew Cooper wrote:
>> --- a/xen/common/efi/pe.c
>> +++ b/xen/common/efi/pe.c
>> @@ -111,7 +111,8 @@ const void *__init pe_find_section(const void *image, const UINTN image_size,
>>      UINTN offset, i;
>>  
>>      if ( image_size < sizeof(*dos) ||
>> -         memcmp(dos->Magic, "MZ", 2) != 0 )
>> +         dos->Magic[0] != 'M' ||
>> +         dos->Magic[1] != 'Z' )
> 
> For this one you could likely use strncmp()?

strncmp() against UINT8[2] wouldn't be liked by the compiler, I guess.

Jan

