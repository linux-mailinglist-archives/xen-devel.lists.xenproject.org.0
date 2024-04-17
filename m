Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02B8A8342
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707479.1105437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4aA-0002Pr-Hg; Wed, 17 Apr 2024 12:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707479.1105437; Wed, 17 Apr 2024 12:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4aA-0002OG-Ey; Wed, 17 Apr 2024 12:40:10 +0000
Received: by outflank-mailman (input) for mailman id 707479;
 Wed, 17 Apr 2024 12:40:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rx4a9-0002OA-2M
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:40:09 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e8579ce-fcb7-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 14:40:06 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-417e327773cso4606355e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:40:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b004186f979543sm2715409wms.33.2024.04.17.05.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 05:40:03 -0700 (PDT)
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
X-Inumbo-ID: 9e8579ce-fcb7-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713357606; x=1713962406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cQtomOWAZ0u83hqF7RHks+zhBXGztnXwjMY2Wvajd0o=;
        b=S3gA7tLZ52QzTMPu9roiOzuVSsxwCan483U0FCaGC+arJ91VHT5qvr4nZBuX3Xq4hP
         CnLquVCwgDkszZb7F/Pvz6kSH6fp1x05UnBxx6MP7Bi8qNw0WIGaLH56XbeMuV9g8kEK
         ORl4JXd84WoOw1YKWySllW6R0aG2VWhVCIud7zusX4khKb/wcxYUwQgoEps6Ut/Z8Uf+
         nyjlSnqfFeZ9K7UJJAJ6bTCc3USIMsgDDeuMX6c04BoUI2nb0mAh68jWje0p5PP7dShG
         Jxv7teMAHkZ0bzOr3wFwfmdxStIlsef6L5MgeksDVGpSaH8F17bGLzKVCR+YBV76Qfnm
         ThHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713357606; x=1713962406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQtomOWAZ0u83hqF7RHks+zhBXGztnXwjMY2Wvajd0o=;
        b=IQEqpE1g8SpSXGbTu3TngcY9LMol9tFF1LXvlkNdBfWs6ipYW7hm6ixzL04j85WBjf
         J9cWrSSHN0+UY713IHW3Spg77tQYGcSlcryGo9cAapnCCff0akN6/CRcujAqWvuXqTDk
         97cKvWeUOd6t+6z8H66YIMBptbOTeTOrLB3R0s4KcbiAE77TYW0LuO6jlNlGnUZT0FnQ
         1uE+m1Jl7O42hhlR2ynemWYqtwZLvWZpAueuy06Ru2sOov6AkHarEla3905+2pLMVBLP
         RrYYVhUBnGkL0z/KxlO6db8cq+A8eYWvGmPuJinuVuFmNluqIjuM4lAkSqWUifOOrcHD
         2PTg==
X-Gm-Message-State: AOJu0YxEDZO4XIvj1TPYa5GpJvX0/j4Dsul4SiLXKEEkKLvgi9QKs4Xj
	vxycoIi4W/fkVwweO73W3bJpnf0PwwmeaZxbJeTpcfrZzymVBL3JyQXH9oNqLg==
X-Google-Smtp-Source: AGHT+IGRD0Kl4Vjj39visiXGxANIXcTcYUTQ0Fccb3HLv+KL703mdsID9ciodpKpFTGX5uIc78Phqg==
X-Received: by 2002:a05:600c:3393:b0:418:5e81:415f with SMTP id o19-20020a05600c339300b004185e81415fmr2071460wmp.14.1713357604354;
        Wed, 17 Apr 2024 05:40:04 -0700 (PDT)
Message-ID: <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
Date: Wed, 17 Apr 2024 14:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Serious AMD-Vi(?) issue
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <ZcqoVBnsgUJw8G0l@mattapan.m5p.com> <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
 <ZgHwEGCsCLHiYU5J@mattapan.m5p.com> <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
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
In-Reply-To: <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 04:41, Elliott Mitchell wrote:
> On Thu, Mar 28, 2024 at 07:25:02AM +0100, Jan Beulich wrote:
>> On 27.03.2024 18:27, Elliott Mitchell wrote:
>>> On Mon, Mar 25, 2024 at 02:43:44PM -0700, Elliott Mitchell wrote:
>>>> On Mon, Mar 25, 2024 at 08:55:56AM +0100, Jan Beulich wrote:
>>>>>
>>>>> In fact when running into trouble, the usual course of action would be to
>>>>> increase verbosity in both hypervisor and kernel, just to make sure no
>>>>> potentially relevant message is missed.
>>>>
>>>> More/better information might have been obtained if I'd been engaged
>>>> earlier.
>>>
>>> This is still true, things are in full mitigation mode and I'll be
>>> quite unhappy to go back with experiments at this point.
>>
>> Well, it very likely won't work without further experimenting by someone
>> able to observe the bad behavior. Recall we're on xen-devel here; it is
>> kind of expected that without clear (and practical) repro instructions
>> experimenting as well as info collection will remain with the reporter.
> 
> After looking at the situation and considering the issues, I /may/ be
> able to setup for doing more testing.  I guess I should confirm, which of
> those criteria do you think currently provided information fails at?
> 
> AMD-IOMMU + Linux MD RAID1 + dual Samsung SATA (or various NVMe) +
> dbench; seems a pretty specific setup.

Indeed. If that's the only way to observe the issue, it suggests to me
that it'll need to be mainly you to do further testing, and perhaps even
debugging. Which isn't to say we're not available to help, but from all
I have gathered so far we're pretty much in the dark even as to which
component(s) may be to blame. As can still be seen at the top in reply
context, some suggestions were given as to obtaining possible further
information (or confirming the absence thereof).

I'd also like to come back to the vague theory you did voice, in that
you're suspecting flushes to take too long. I continue to have trouble
with this, and I would therefore like to ask that you put this down in
more technical terms, making connections to actual actions taken by
software / hardware.

Jan

> I could see this being criticised as impractical if /new/ devices were
> required, but the confirmed flash devices are several generations old.
> Difficulty is cheaper candidate devices are being recycled for their
> precious metal content, rather than resold as used.
> 
> 


