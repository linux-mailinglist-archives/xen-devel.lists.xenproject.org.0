Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41608A75EE1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 08:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931877.1334060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8oN-0005Qn-NJ; Mon, 31 Mar 2025 06:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931877.1334060; Mon, 31 Mar 2025 06:39:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tz8oN-0005Ok-Kk; Mon, 31 Mar 2025 06:39:55 +0000
Received: by outflank-mailman (input) for mailman id 931877;
 Mon, 31 Mar 2025 06:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tz8oM-0005Oc-Ss
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 06:39:54 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37fa652-0dfa-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 08:39:52 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso1469754f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 30 Mar 2025 23:39:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b658838sm10258320f8f.5.2025.03.30.23.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Mar 2025 23:39:51 -0700 (PDT)
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
X-Inumbo-ID: f37fa652-0dfa-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743403192; x=1744007992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AtZW6QGKp/u9Q39Loq82TaQCuJAgMFzFKNcw7exkBFI=;
        b=WFAmFozQlllJaVPyZxZrHBQe9n6bFjWl9zB4pyfvo/O9UXQ0pQ+Q+9PlivIcOVsnxk
         Ik+eK2j7KaIwngJsnbTwKKGFfTWAa4H7ai4bjIQc5WU7T0XnaR0IYab/l7HcS3nTrmA5
         Sf8S/tzV7Gn7Ao8wOcnHrkEQeY/vc5BZJsO+hf+ME3oOgSLSvrSLk5f2fGZM2pX42fMX
         ylQI80HigSWYDoJ00uhZWJnl269REYTHW1tjWYo8tgq8CnscYm2q0TL82yWzZusAE8+i
         NSNjS2jbjeqwWvUWMP19XFsbOhgUewr9QcIoACC3pnd6cxog/W6TLGEnmbStoZWQR5ft
         l7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403192; x=1744007992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtZW6QGKp/u9Q39Loq82TaQCuJAgMFzFKNcw7exkBFI=;
        b=UCU7Enqy/zdys+jhkft0dyPVbOsKFjzcDgUGStxMOVbkk+qsnkKILMAnzijMjQJdAR
         tiOYjPAWFIvGnVa6k/fbYVXwUzLHBeBsiXFcBuRGn0MhlrfalzPjid2MBcEfEB0PdKiJ
         zbn+I5wNssk/ZKu2yg4PgTdjiKFIBjXqhdt3RMVy3hKdF+XPj1ZyuA5vqB+FF4YQtQaS
         Afmi/LaMOAPQfvYZ2D61m40sJR05WU81mkkBXWc7eI5M6TAaFI/tm13V+A2yN3QcyPN1
         nub6eO0FN+Ib2Qz8JLXdT75ACIDy14Yx7TRexbaPU+EUzu/gJPG82YyQlx+4BUyOVpOv
         D/pA==
X-Forwarded-Encrypted: i=1; AJvYcCWKRjhfNlMlUQFDrtKHBXEer9dQRTWLsaCI1TF7M/tfLwUBYiEGL5UZYD43XDH4V6TEGJ65pH/nnFs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBetRV1Jvl7jEs2P09Y1WdRTj9u0Gb+zoQrFz6w2Y9hwB+NGbG
	M4JXCdrzvsIxe9M8buBUE4UjPb4P/tqJThUruY7bXEMX2SVxXBXbLNlaAeIeyw==
X-Gm-Gg: ASbGnctrfPT+an9ZTx+M174xEhs47u0aUHkz81HWFis/hC6USjmOslwuMqxu0q80XRp
	QjvIUAg4LSfIzAJBNbsW1uyD8S5Kl0wJCJnzgOk/w7/VsFdu/F7PBxOSK+xR8yorjI12W6s8Wxh
	rTT3D9vry0c7K8Ci8WdVD4tHk7KiZVIYoQ2ai9lHx4Kc1jnQmsaPNZAEYPmeuyU9C87HExMESge
	eOzE1SOTKHlx5noza9R25dhW/18RV+pNoT2r+wQ5hXJ3W7quimJEdEi3dvJf4uYQr4xJsmxHSdr
	Bq7t1L2JwE/fsJ2BbE4gpPvxIE21Z5uOLYhw05SKiimiPDH6SPBr7fJq4d3OZGcwxZqM34LTmY+
	wlm62zkBy8TmtifhLjmNTjZ6jnlW0Bg==
X-Google-Smtp-Source: AGHT+IGk2nRubtsNjwJbL5I0c5wP/gF+XRL/IWFimXQ94tL5d+kLTzkMRz+uJpMkVSK/Lt0UIX2gCw==
X-Received: by 2002:a5d:5987:0:b0:391:3988:1c97 with SMTP id ffacd0b85a97d-39c120dd6d2mr5990644f8f.17.1743403192168;
        Sun, 30 Mar 2025 23:39:52 -0700 (PDT)
Message-ID: <ad19a0b3-2695-4eb1-a60a-71263ec41c9a@suse.com>
Date: Mon, 31 Mar 2025 08:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: simplify bitmap_to_xenctl_bitmap for little
 endian
To: Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 michal.orzel@amd.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20250327233419.1119763-1-stefano.stabellini@amd.com>
 <5b901464-64f4-489c-ad62-e03b7f9d47b7@xen.org>
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
In-Reply-To: <5b901464-64f4-489c-ad62-e03b7f9d47b7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.03.2025 11:29, Julien Grall wrote:
> On 27/03/2025 23:34, Stefano Stabellini wrote:
>> The little endian implementation of bitmap_to_xenctl_bitmap leads to
>> unnecessary xmallocs and xfrees. Given that Xen only supports little
>> endian architectures, it is worth optimizing.
>>
>> This patch removes the need for the xmalloc on little endian
>> architectures.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>> Changes in v3:
>> - code style
>> - copy_bytes > 1 checks
>> - copy_bytes > 0 check for copy_to_guest_offset
>> ---
>>   xen/common/bitmap.c | 42 ++++++++++++++++++++++++++++++------------
>>   1 file changed, 30 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
>> index 3da63a32a6..d3f9347e62 100644
>> --- a/xen/common/bitmap.c
>> +++ b/xen/common/bitmap.c
>> @@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
>>   	unsigned int remainder = nbits % 8;
>>   
>>   	if (remainder)
>> -		bp[nbits/8] &= (1U << remainder) - 1;
>> +		*bp &= (1U << remainder) - 1;
> 
> This is changing the behavior of clamp_last_byte(). Yet, it doesn't seem 
> the comment on top of is changed. Is this intended? Also, I would 
> consider rename 'bp' so it is clearer this is meant to point to the last 
> byte of the bitmap rather than the start.

+1

Perhaps also drop "last" from its name? (It's not clear to me what 'b' actually
is meant to stand for in the parameter name. It may have been meant to say
"base"; it could now be meant to say "byte". Nevertheless just "p" as parameter
name is likely sufficient and then no longer ambiguous.)

Jan

