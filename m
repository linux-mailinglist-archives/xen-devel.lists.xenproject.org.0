Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066129E1578
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847306.1262401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIO93-0007n3-Hm; Tue, 03 Dec 2024 08:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847306.1262401; Tue, 03 Dec 2024 08:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIO93-0007lI-EC; Tue, 03 Dec 2024 08:20:33 +0000
Received: by outflank-mailman (input) for mailman id 847306;
 Tue, 03 Dec 2024 08:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tIO91-0007ic-Fv
 for xen-devel@lists.xen.org; Tue, 03 Dec 2024 08:20:31 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 754d4705-b14f-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:20:30 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so50500911fa.3
 for <xen-devel@lists.xen.org>; Tue, 03 Dec 2024 00:20:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d0b7ce5584sm4515835a12.54.2024.12.03.00.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 00:20:29 -0800 (PST)
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
X-Inumbo-ID: 754d4705-b14f-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733214029; x=1733818829; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nctq/kz5JcX7M5aYFszmAP6iR+je2UNnsZFVhkU1lYc=;
        b=Ha4WzPhkhXo3jneiCLoz0KOp0e+s8O9+I/BAKg2k10fi4IEXkFvyuQtgp9iywxNmwy
         15Cmgl6h/8ItFmZyT+IUR82XNUKrOi0Al9DgLmZGtzACJlfwjc3K747so6a4q/VS4izo
         7Ji686jqcZNp51N9AN0UJKTRfJHMBtUZ2tAe2OYAtNhfvBp5iTQ+cgCIDsXMNJcisxuH
         a4QHQeIu6eUXQvDB1ucZUS3hj8LlUwVM3MJWoHatkS7ZimHOa6jfdh2Sx/Ry5ryD0A84
         maKqZHXrG8NSjo8uOcp5OeVrwwELbbpNxAzHFqp2cvPh6wca96XVZ1jZm6IohKBhlJVH
         k1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733214029; x=1733818829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nctq/kz5JcX7M5aYFszmAP6iR+je2UNnsZFVhkU1lYc=;
        b=uPpQ0hIRvqs4Q1ZzfWYylxlNB3/70DvYCFK1kknGed2sS1Oddr30OmhILAKTB/HtCt
         ib7oEm4Y8NHEjBnBDmyObZICDejOptlr8P+AsKB8B68jKdMqnc2eE+IWovvt3GsbevYg
         OoZNd1D9nF3imXk9Edj31HGKFipz4nbF2xdEyDKLxVoJckNFBdUi+ZiA92GycQvLao/R
         doYhRrhWhdms5SNetVLHNIKwz8HLoZQLDKcBe1oanWoumN6h3UzITrRfW0v8l4XWS1D8
         KukTU9HqmBfQB3dd0ZrO9mFa0UqkMHMiCn3tZstQnuN73kOvQsS0+ZzLU45vDG5bzZU6
         ux7g==
X-Forwarded-Encrypted: i=1; AJvYcCWwtn11DBhanYf0B6FtKx2Hase4iP3TmT45IOupDj3x5crpv7MgKzYuUJqoyTXi9CradRH/BffFjTQ=@lists.xen.org
X-Gm-Message-State: AOJu0YwSkqAqw2X79tkH1VXN1w4lwNwhupNnri/bGdd2WlgwH45gSnNH
	O1V1cC8ZoJDxVW5z8Oi5G8VLUnAKfiJBxjTAB7bcYYhOPkroWYdv3x19iIjY3g==
X-Gm-Gg: ASbGncv7d8cz0OoL6LbBbKOYo6QTwDXvt9+OR453AcKc8n6vY2nnNorMEXo0WRcxx48
	5880+YxlojikCZa+zgewgEwh/tVZfemOXJD9M/ReN8WYB8IBB7k+DNdZ8xlGeZIkphE2u5Wnq90
	8ZU32XZkx/p/BspHVoqGiLZwOBoUcGVVokSK1JC6xQxrzK0/5Dquhn0VykgI97jtLCYC8e2Ihxy
	9SQZSRsSBCe6jNmwyZ0aVV+cb5gXV14NmZ/JBl9A74HqSqzOKX3nO3qUDrd3W+BHrl2CfwMHdEv
	4Yiba0i2oOaVyNSL10lwz/sge/fGASb085Y=
X-Google-Smtp-Source: AGHT+IFllXZfN/kjblGorxONRg19GDBG3pXy1jTgrJpowm/fdpUyx2On2DYdHBLZsdaTbOCQOlnFrA==
X-Received: by 2002:a2e:bcc1:0:b0:2ff:c3a2:f42d with SMTP id 38308e7fff4ca-30009c92be7mr8482261fa.30.1733214029345;
        Tue, 03 Dec 2024 00:20:29 -0800 (PST)
Message-ID: <0cd6a440-6039-400f-a2aa-ed460a3878c1@suse.com>
Date: Tue, 3 Dec 2024 09:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: stable-4.18: reliably crash network driver domain by squeezing
 free_memory
To: James Dingwall <james@dingwall.me.uk>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xen.org
References: <Z0iMxP2gah9Ky4Pl@dingwall.me.uk>
 <6614df33-e383-44dd-aebc-a238ad82f398@citrix.com>
 <Z03YL1KHwE1fO98g@dingwall.me.uk>
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
In-Reply-To: <Z03YL1KHwE1fO98g@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2024 16:54, James Dingwall wrote:
> On Thu, Nov 28, 2024 at 03:39:07PM +0000, Andrew Cooper wrote:
>> On 28/11/2024 3:31 pm, James Dingwall wrote:
>>> Hi,
>>>
>>> We have reproducible issue with the current HEAD of the stable-4.18 branch
>>> which crashes a network driver domain and on some hardware subsequently
>>> results in a dom0 crash.
>>>
>>> `xl info` reports: free_memory : 39961, configuring a guest with
>>> memory = 39800 and starting it gives the log as below.  This is intel
>>> hardware so if I've followed the code correctly I think this leads through
>>> to intel_iommu_map_page() from drivers/passthrough/vtd/iommu.c.
>>>
>>> The expectation is that we can safely allocate up to free_memory for a
>>> guest without any issue.  Is there any extra logging we could enable to
>>> gain more information?
>>
>> For this, you really should CC the x86 maintainers, or it stands a
>> chance of getting missed.
>>
>> Do you have the complete serial log including boot and eventual crash ?
>>
>> -12 is -ENOMEM so something is wonky, and while dom2 is definitely dead
>> at this point, Xen ought to be able to unwind cleanly and not take down
>> dom0 too.
>>
>> ~Andrew
> 
> <snipped the original crash report since it is also in the attached logs>
> 
> I've attached complete serial console logs from an Intel and an AMD dom0
> which show similar behaviour.  The dom0 crash originally mentioned was
> resolved by updating a patch for OpenZFS issue #15140 and no longer
> occurs.
> 
> During the capture of the serial console logs I noted that:
> 
> 1. If the order that the domains start is different then there is no crash.
>    Restarting the domain later will lead to the driver domain crash even
>    without a configuration change.
> 2. If the domU memory is closer to free_memory but still less than the
>    domain fails to start with libxl reporting not enough memory.
> 
> So there is some undefined range for (free_memory - m) to (free_memory - n)
> where it is possible to crash the driver domain depending on the guest
> startup ordering.  My (perhaps naive) reasoning would be that
> free_memory is the resource available to safely assign without having to
> allow for some unknown overhead and if I do ask for too much then I
> get a 'safe' failure.

As per the earlier reply I sent, this isn't the case. "free_memory" isn't
adjusted to account for extra overhead. As per Marek's reply, you need to
leave some spare, at least as of how things are right now.

Jan

PS: I've dropped security@. We're now firmly into discussing this in public,
irrespective of possible security angles. I don't think that's what should
have happened, but it also makes no sense to further pretend to attempt to
first assess the full scope in private.

