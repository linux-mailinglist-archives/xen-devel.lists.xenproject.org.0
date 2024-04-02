Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C818F894BB9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 08:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.699984.1092431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrXuY-0005kV-W4; Tue, 02 Apr 2024 06:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699984.1092431; Tue, 02 Apr 2024 06:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrXuY-0005ig-Se; Tue, 02 Apr 2024 06:46:22 +0000
Received: by outflank-mailman (input) for mailman id 699984;
 Tue, 02 Apr 2024 06:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrXuX-0005ia-LJ
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 06:46:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b364b9-f0bc-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 08:46:20 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4161bd0a4ecso1232725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Apr 2024 23:46:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t1-20020adfe441000000b0033e756ed840sm13292799wrm.47.2024.04.01.23.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 23:46:19 -0700 (PDT)
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
X-Inumbo-ID: b6b364b9-f0bc-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712040380; x=1712645180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjZTJ9wQXvMBGOs8OL3MPHrmrDRcsnrJnMq0g2Y/4Bw=;
        b=UV7xvzF3XGEAkQ35QxFoTPO3qms41wcraQYAb8RZbHMv3vfjWUoI528zdFTa1XTLwI
         wQNSrnMidiYY0nZgfYIPt1GuIEIqEq4g68ONUQeOSqQDAjgRAJjwqrufiaTsZwarR2XG
         4owGF1T+VNCO8aPuBPkm0CApkeNEz41EBoek6OFAu0zZLa/jnTNdCwO/UjxTcY/0U2il
         QPnzDnY1zrWYHwGmlAsbuUhE2B+uOxVy45mq2OWDUU6V0TPrkhWPn+0ouk4R9TFVxlVd
         njla4ODMR5T4/ebitxMHtd3R+Dt+0xS3smzRqjkAVgTFMiCeiRJEZNCZpWhAtHk85Wab
         8gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712040380; x=1712645180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjZTJ9wQXvMBGOs8OL3MPHrmrDRcsnrJnMq0g2Y/4Bw=;
        b=iuQGVbq3mSdEnNVeHy7fpUWCH5HncS0U4UhfY90S42le0DTRpynQA4sQsv0xaynV0i
         Ld6xaOo1ptxdRkepkKogwG/5S5DhCKK76RHtHERnD2AETNvS1dJQnxPK09OwDbJQ6/m8
         I1ZChyiv4MTDtjQigS8oBLS0A9YnOe3QrFpigBDJoNaysehli1vJlaEi24e38SW0vMMk
         ufSedXRT4t55QDhaU0cpfzKq/22w+pm6GiKP+n0iDBtVVI6PNIp9JXEm3lmlL91fW809
         +2lqVtd0w6dwTLeGQ2PVOEE5tySGoZQpCka1/PTmDfUsOGDNSnGruaJ78c9Nu4xouOmu
         Gb9g==
X-Forwarded-Encrypted: i=1; AJvYcCX1qXFHI8y7l70jwRASt24NU/HCJq/L5Q8d4mTdNfxcREMo0Ftsvh3XR6ARD3Yu/Y2C3ashtLqgstaiiFiH217tJvcOMc5tyhr/0SEpw54=
X-Gm-Message-State: AOJu0Yx0U4tPU7fY6zStCKLMMHQIV9r5TqaBvPiKE9wDFaKwgIV47Pyp
	OoPP8ISrRgN57y01iuxEnD1IBnmKyMSLppjDKsDHBWAjguuOq/QFSfT8bZPJZQ==
X-Google-Smtp-Source: AGHT+IGNLPqTmaWvBmj1dDmB516BIccvjIzkVSpZAhl/4Kg55cX0ImjzLFIm5AU1ID/FYizYz+Mt8A==
X-Received: by 2002:a05:600c:3007:b0:415:589b:c01c with SMTP id j7-20020a05600c300700b00415589bc01cmr5854087wmh.23.1712040380129;
        Mon, 01 Apr 2024 23:46:20 -0700 (PDT)
Message-ID: <050a155f-325b-4b70-b954-bcdb3a64fbaa@suse.com>
Date: Tue, 2 Apr 2024 08:46:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/20] xen/bitops: put __ffs() and ffz() into linux
 compatible header
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <8bc35da4a9fd44d2dcf9677dcc99334eb7142581.1710517542.git.oleksii.kurochko@gmail.com>
 <a4d36c0f-d3a3-4d64-a62e-b631a4ece9a8@suse.com>
 <827d3d8ee11bd4a3c20dbee936132df231db1e73.camel@gmail.com>
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
In-Reply-To: <827d3d8ee11bd4a3c20dbee936132df231db1e73.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.03.2024 19:23, Oleksii wrote:
> On Wed, 2024-03-20 at 16:42 +0100, Jan Beulich wrote:
>> On 15.03.2024 19:06, Oleksii Kurochko wrote:
>>> --- a/xen/lib/find-next-bit.c
>>> +++ b/xen/lib/find-next-bit.c
>>> @@ -9,6 +9,7 @@
>>>   * 2 of the License, or (at your option) any later version.
>>>   */
>>>  #include <xen/bitops.h>
>>> +#include <xen/linux-compat.h>
>>>  
>>>  #include <asm/byteorder.h>
>>
>> Hmm, no, a library source would better not include this header.
>> Surely
>> the ffz() can be taken care of locally here?
> Except that __ffs() from xen/linux-compat.h is used in find-next-bit.c,
> so it seems that it is still need to include the header.

Hmm, no - that __ffs() use, if we mean that to become a Linux compat thing
only, should then be replaced (or covered locally), too, imo.

Jan

