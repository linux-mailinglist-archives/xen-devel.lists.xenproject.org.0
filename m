Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7639C5525
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 12:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834368.1249999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAocz-0006iH-EP; Tue, 12 Nov 2024 11:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834368.1249999; Tue, 12 Nov 2024 11:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAocz-0006gA-Ar; Tue, 12 Nov 2024 11:00:09 +0000
Received: by outflank-mailman (input) for mailman id 834368;
 Tue, 12 Nov 2024 11:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAocx-0006fw-E3
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 11:00:07 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455c76a8-a0e5-11ef-a0c6-8be0dac302b0;
 Tue, 12 Nov 2024 12:00:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso45710485e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 03:00:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b054aed6sm203008895e9.15.2024.11.12.03.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 03:00:03 -0800 (PST)
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
X-Inumbo-ID: 455c76a8-a0e5-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1NWM3NmE4LWEwZTUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDA5MjA0LjU0NjI1Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731409204; x=1732014004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qPsdqIwA9UKL567W0fQtpntc+rItlAmX8h3hQ74XqYc=;
        b=cY6DSIaV3cR1PIVM6xtNaah4A//mgQDkidKdKpa1Tf+6NEEWMT4N59X8QTDB23N45u
         l8FvrqsrYTblcZIGAk1+Jklog/SIHQkT314D/OOuMRHlIXZdlyBGuQfsdGFiXQ1hMYhm
         Lw21tbn8PByHsZPjUK8nwAoiajrWKpQRzzRmlfsILVRiZ6qCfSC48L7Q6t0GowSwZWHT
         ygK5huwMYOKMV9kdtukheMbJdE3Q4XIzGtlLxeUxny0nnTm+eZzAA2xzGmH/YkViHo0Z
         ap9pBAWiLbX27vG0mCaAJQ4Sbrui4Yk0a3JJEl2aq5UdnDwlE2/+QGBMYKfkwmI7nVJu
         MsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731409204; x=1732014004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPsdqIwA9UKL567W0fQtpntc+rItlAmX8h3hQ74XqYc=;
        b=Am8h3yZNTVvyyrpA4eqKN9Uwql+gFjGWXMP9q46xMSY3w3v9QKLds6iO/HwkQjEAFT
         WsFk9q0woJ1rlaxJrmOO3gegeqVIZ5Xsq1XAv/Cgf8Q03QTQtVImYR5quAzRRzDrOhl1
         mwq818rWYzoc7QRC1KCDiysl0pVlF3aANSVVo/PYLxw4tn/3iI13lRHTm4eIAeVW5+9F
         i9EUS6TAGlObXpZVX+yHT8YY7PuKhI7feG/cMTbsbkmFSqIA3KSs9KCUkicoXba+pHgR
         Jh8i0PO7Y9fFgiVJxDu5pxwCctCS6ueBOdSUaqhMxLbaDkxAfI94e300ZV2uSqs+qhPj
         /wnA==
X-Forwarded-Encrypted: i=1; AJvYcCVm4BpF+rysFq3DhBVdiJORSTZj0g9zrXMYzlCKa+CI6qLs9TGZ3q1D1t8XXeqvMui0CNujA0prC84=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9NvO+UTcUzE3Q3IbfMsJef0DAeG+YepvXhZcI3IGufbzsNl32
	f1FOvoqt0UGjEpuyczHT3WlstbglH9rqSnmBjDPaVCbRR90yINw/Cn8AoyQfVQ==
X-Google-Smtp-Source: AGHT+IFZpY4t4YA+aTYFRcAcumGVmHGRq5+bUYwAloTDLtXHEMRjdNmPpIaA8K/UQS3W7tlstlAlhg==
X-Received: by 2002:a05:600c:1c16:b0:431:4a83:2d80 with SMTP id 5b1f17b1804b1-432b749bc9bmr144731045e9.0.1731409203892;
        Tue, 12 Nov 2024 03:00:03 -0800 (PST)
Message-ID: <74cb0caa-6089-4bcc-9c9f-1d049d0553d7@suse.com>
Date: Tue, 12 Nov 2024 12:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/ucode: Remove the collect_cpu_info() call from
 parse_blob()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
 <20241107122117.4073266-4-andrew.cooper3@citrix.com>
 <5aa29b23-cf22-45a5-b7b6-7e307a2238d2@citrix.com>
 <6d972a06-4acd-4b6c-b8e9-543a338d66ae@citrix.com>
 <3f0ad893-4a67-488d-a350-020fdef2ad1f@suse.com>
 <aae641b2-23e3-4631-98e6-454376ff3b9a@citrix.com>
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
In-Reply-To: <aae641b2-23e3-4631-98e6-454376ff3b9a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.11.2024 11:57, Andrew Cooper wrote:
> On 12/11/2024 10:49 am, Jan Beulich wrote:
>> On 12.11.2024 11:36, Andrew Cooper wrote:
>>> On 07/11/2024 9:58 pm, Andrew Cooper wrote:
>>>> On 07/11/2024 12:21 pm, Andrew Cooper wrote:
>>>>> With the tangle of logic starting to come under control, it is now plain to
>>>>> see that parse_blob()'s side effect of re-gathering the signature/revision is
>>>>> pointless.
>>>>>
>>>>> The cpu_request_microcode() hooks need the signature only.  The BSP gathers
>>>>> this in early_microcode_init(), the APs and S3 in microcode_update_cpu().  For
>>>>> good measure, the apply_microcode() hooks also keep the revision correct as
>>>>> load attempts are made.
>>>>>
>>>>> This finally gets us down to a single call per CPU on boot / S3 resume, and no
>>>>> calls during late-load hypercalls.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>
>>>>> Slightly RFC.
>>>>>
>>>>> Just before posting, I've realised that cpu_request_microcode() does actually
>>>>> use the current CPU revision, and it's buggy, and it's the cause of `xen-ucode
>>>>> --force` not working as expected.
>>>>>
>>>>> I'm tempted to do another series cleaning that up in isolation, such that this
>>>>> patch becomes true in this form.
>>>> Actually no.  Having tried a bit, I think it's easier to do with patch 2
>>>> already in place.
>>>>
>>>> So instead I'm tempted to edit the middle paragraph to note that it
>>>> currently uses the revision but that's going to be fixed shortly.  The
>>>> rest of the paragraph explains why it's still safe anyway.
>>> So, after the latter series, this patch happens to be accurate.
>>>
>>> cpu_request_microcode() does read the revision, but discards the result
>>> of the calculation which used it.
>> What's the intended overall sequence of patches then? With two series that
>> (aiui) now have grown some sort of dependency, and with this series have
>> gained a 4/3 patch, having a clear picture would certainly help. Might it
>> be best if you merge both series and re-submit as a single one?
> 
> The order turns out to be as emailed out and threaded.

Yet above you said "after the latter series, this patch happens to be accurate."
Which suggest to me that at least part of the latter series needs to be in place
for the change here to be correct. IOW - I'm confused now.

Jan

