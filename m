Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6000F996C1E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814513.1228080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWpN-0001LJ-Ts; Wed, 09 Oct 2024 13:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814513.1228080; Wed, 09 Oct 2024 13:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syWpN-0001Ip-QX; Wed, 09 Oct 2024 13:34:09 +0000
Received: by outflank-mailman (input) for mailman id 814513;
 Wed, 09 Oct 2024 13:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syWpM-0001Ii-Ce
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:34:08 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2883718a-8643-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 15:34:07 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a994ecf79e7so92251566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:34:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994ce357b2sm493884066b.144.2024.10.09.06.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 06:34:06 -0700 (PDT)
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
X-Inumbo-ID: 2883718a-8643-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728480847; x=1729085647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pO70ZWUWUT/WLY9hq9dglcxyf5Inf+MgDcSO9dJxveE=;
        b=WhXb16EJSz971wiuWv2Ln4iFggjvv7+JI4L1pdIdM28K2T2dLvT6EciZmrCUw09/dA
         xGN45i6G6pcPMIpnNOtzok9MzFCBQNGj2BiykSqa7BQvjHt+C8jb6fBIbCOeUwdLicGH
         o6ApmDro9/0IEaBheCaO1lYQEtH9Zg8N0NocqPdFQduvuxky0EgWiohT3Esoot3NYvJ0
         bGm2pQ6I95bZXfK5RjCd0wkPa2irw0po2b/z0HPgCKq9eYiutHwunZ9qFtjuwyeX44fO
         JWe4Cr92Kcy85DvldZo04WmffujuP0iCNhGMBzbX2X4bf0AxHWOcqwOh+Rs24ZErxZzD
         OsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728480847; x=1729085647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pO70ZWUWUT/WLY9hq9dglcxyf5Inf+MgDcSO9dJxveE=;
        b=MapzdbKnvESgz8pIaMHCDoAZrFAMEiUdDCu6ApxwrGvvGWNseigbuPOebZChmnuBOE
         SY/V6sdvIQ73FZx2slzNw439XDAXK5AgnRivstB1t43gCmoDH1QpskVjjMsU3uNKPaYQ
         qhHYvCUfgsiXidOMPT7595NCCoco+/F37uHzBMmS053gAstdXG2I9Vub0y4trqB944LK
         blmcRhqfX+06aAwfm4/+DHxMqG/Aw28CR5MFiQudzHwRbsPggMVyAAzrtlkd7vGrzg5N
         a6yE6m+CO1LP58gXl3ezfHGdulokuPebCB3pjnCyp/E9IYAg16lR+21dNUMFDUq1mNCG
         gZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCX+rYpAT/PD3RaVz6iCPEDkzWLnBpV2yG6+c2NAfLxyu9H4FPLBzyZoyuP3UxVkBY33VdI8DfGHFjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyPsMPJGb8g8yTXGVt0G4j8k2g/A/5g1KTfrmfYSLSYpVnrGWD
	zJSja8v1rxRr6A24r0y+Kqt6NgwxVrtoCDhrEvm/1s0i+ny2AcWngcKPcnbRcw==
X-Google-Smtp-Source: AGHT+IHTQRflfurRT0jF+OXwzrgxvWwxSGPwVfFxNHUbzdDdiX50TWNkQHC2kJcKtjGmA0Vp0/JMiw==
X-Received: by 2002:a17:907:8688:b0:a99:43b2:417e with SMTP id a640c23a62f3a-a998d34dceemr213191866b.62.1728480846625;
        Wed, 09 Oct 2024 06:34:06 -0700 (PDT)
Message-ID: <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
Date: Wed, 9 Oct 2024 15:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] byteorder: replace __u16
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com>
 <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
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
In-Reply-To: <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.10.2024 15:20, Andrew Cooper wrote:
> On 09/10/2024 10:21 am, Jan Beulich wrote:
>> In {big,little}_endian.h the changes are entirely mechanical, except for
>> dealing with casting away of const from pointers-to-const on lines
>> touched anyway.
>>
>> In swab.h the casting of constants is done away with as well - I simply
>> don't see what the respective comment is concerned about in our
>> environment (sizeof(int) >= 4, sizeof(long) >= {4,8} depending on
>> architecture, sizeof(long long) >= 8). The comment is certainly relevant
>> in more general cases. Excess parentheses are dropped as well,
>> ___swab16()'s local variable is renamed, and __arch__swab16()'s is
>> dropped as being redundant with ___swab16()'s.
>>
>> With that no uses of the type remain, so it moves to linux-compat.h.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I'm unconvinced of the need of the separate ___constant_swab16(). I'm
>> also unconvinced of the need for said constants (that even had casts on
>> them).
> 
> There is a still-good series deleting the whole of byteorder/ and
> replacing it with a few-hundred line single header.
> 
> It is the second thing stalled on a governance change (prohibited
> reasons to object to a change) which clearly no-one gives a damn about
> fixing.  In fact double spite because it denied a good engineer his
> first changes in Xen.
> 
> 
> I don't particularly feel like trying to polish byteorder.  I'm inclined
> to rebase+repost Lin's patches, at which point the majority of this
> series simply disappears.

I wouldn't mind you doing so, as long as that other series then progresses.
What I don't want to get into is the other series being stuck rendering this
one stuck, too. Then it would imo be better to take this one first, rebase
the other on top, and work towards it becoming unstuck (whatever that takes;
I have no recollection of what the issue was back at the time, all I recall
is that, yes, there was such work at some point).

Jan

