Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54043A15A0D
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2025 00:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874351.1285070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYvxw-0006Mg-Tl; Fri, 17 Jan 2025 23:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874351.1285070; Fri, 17 Jan 2025 23:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYvxw-0006JX-R4; Fri, 17 Jan 2025 23:41:28 +0000
Received: by outflank-mailman (input) for mailman id 874351;
 Fri, 17 Jan 2025 23:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHvT=UJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tYvxv-0006JR-Um
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 23:41:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 903a99ad-d52c-11ef-a0e2-8be0dac302b0;
 Sat, 18 Jan 2025 00:41:25 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so28712845e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 15:41:25 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438904084e7sm48317705e9.6.2025.01.17.15.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 15:41:24 -0800 (PST)
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
X-Inumbo-ID: 903a99ad-d52c-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737157285; x=1737762085; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7G+q7+YNodUeSCykRUjbKao1Cp6MRoZwAU9NzKs+V2Y=;
        b=fhy8Aka7FZ9cFtHYwDjJKS+FECbDjOv0kZEQI1EQE+x3P5+/9F6FSxU8MdBZaZm8y8
         uJdxIVGiChE4M6b2iAtjVdQ7vMwFJQZlp/KwPNuh9yfKjoTn74+ZeTEM5Fk6Ub7T6fMt
         En3tqw8ZPThBuuEod4+Yrp8HOFE8e1dEwhdgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737157285; x=1737762085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G+q7+YNodUeSCykRUjbKao1Cp6MRoZwAU9NzKs+V2Y=;
        b=KbkjqJBTRffsEvDutA+PwXAZTZ38YpAK2cWkNSpgCf4b3a58xzP8jQ5/L5xvi3a1pz
         WuRrnWIXLb+D2hFF12ZBgFct75cyzNAHmw3+F3JEZVvHgCO4fbzgOVUHcN1FLtKzX1N0
         WvU3fJgVfRCMuWgTY9w4TFsTmd/wOUQUwAYPrGbG97V0BT6kEXFrsNM9S4399YJTxYpv
         X+oRmYubpvpfo4RE75Y0RqoVhxH7CdHeOdVyYNy4t1l/GF7SYrAx7fUUye2W/UOzoXZH
         zYBQIldjwYxxDN4gJLlLw0FJJV34t63CZcgYfxtuk/fkfZcTnzpnnbSVdvOaEfsmE3Es
         rMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTeFCu2pBtKnKpjDXT1m432xSjOka4DEvahuTKeVincxU6VnEBaBx6yZsRYGz+3EzpSpbA3xvCWbY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznaBKFxMvVSpJO3Pbc+MGb0MAnfa7EHl0QRXWkFiXrrtE4m+96
	vYvdXBL60Efj2xOZvy/AYid9kUdafOa8WnGSoSM9AWNhzFY0KtjhTqrIqh4MGBQ=
X-Gm-Gg: ASbGncuB5wEYoTyoByTyMZx/AeJehJufFHp5FbHIKycFbZ3TGqUhPqXoAdVes1G1t+b
	hEgWaOHNCQGjoG+EvjRWq/RVNYhnxM7vDAinvKsoDGSdPC9MmEvWlkkQTEW7Z0iqBFeYZJz2hVK
	tvx55/Ls5SP30zol68QLb5Z+/HC5SvhCgf8wGA8Hj5ukFTD1Ib9wXqae22MvuGKufm2yp8yiGcJ
	nbag6Ez25g2n2250xs5JHQnG5+TycvfKGPM39OVVCAREb0cyI4N+KLWE/+cdGlK3Pe+w6uXzmFC
	F97Jm41QfVe0GlwYAgmY6m/LCVdGD/TfaQ==
X-Google-Smtp-Source: AGHT+IHe/sgsUcek+Vt3Nw04aT02txb4V9vNV2R/6qTKuS/gvdVvsjV+LIMdtfyg/XFfOpBWB9KFmg==
X-Received: by 2002:a05:600c:3ba7:b0:435:172:5052 with SMTP id 5b1f17b1804b1-438913becb8mr36689365e9.1.1737157284922;
        Fri, 17 Jan 2025 15:41:24 -0800 (PST)
Message-ID: <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com>
Date: Fri, 17 Jan 2025 23:41:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, sergiy_kibrik@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
 <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
 <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
 <Z4oxZSUQ6VARiR0H@macbook.local> <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
 <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
 <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2025 10:43 pm, Stefano Stabellini wrote:
> On Fri, 17 Jan 2025, Jan Beulich wrote:
>> On 17.01.2025 13:24, Alejandro Vallejo wrote:
>>> On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monné wrote:
>>>> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
>>>>> On Wed, 1 Mar 2023, Jan Beulich wrote:
>>>>>> While we want certain things turned off in shim-exclusive mode, doing
>>>>>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
>>>>>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
>>>>>> a result. Yet allyesconfig wants to enable as much of the functionality
>>>>>> as possible.
>>>>>>
>>>>>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
>>>>>> C code using it can remain as is. This isn't just for less code churn,
>>>>>> but also because I think that symbol is more logical to use in many
>>>>>> (all?) places.
>>>>>>
>>>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>
>>>>>> ---
>>>>>> The new Kconfig control's name is up for improvement suggestions, but I
>>>>>> think it's already better than the originally thought of
>>>>>> FULL_HYPERVISOR.
>>>>> I think the approach in general is OK, maybe we can improve the naming
>>>>> further. What about one of the following?
>>>>>
>>>>> NO_PV_SHIM_EXCLUSIVE
>>>>> PV_SHIM_NOT_EXCLUSIVE
>>>> IMO negated options are confusing, and if possible I think we should
>>>> avoid using them unless strictly necessary.
>>> The problem is that the option is negative in nature. It's asking for
>>> hypervisor without _something_. I do agree with Stefano that shim would be
>>> better in the name. Otherwise readers are forced to play divination tricks.
>>>
>>> How about something like:
>>>
>>>     SHIMLESS_HYPERVISOR
>>>
>>> That's arguably not negated, preserves "shim" in the name and has the correct
>>> polarity for allyesconfig to yield the right thing.
>> Except that a hypervisor with this option enabled isn't shim-less, but permits
>> working in shim as well as in non-shim mode.
> First, let's recognize that we have two opposing requirements. One
> requirement is to make it as easy as possible to configure for the user.
> Ideally without using negative CONFIG options, such as
> NO_PV_SHIM_EXCLUSIVE. From the user point of view, honestly,
> PV_SHIM_EXCLUSIVE is a pretty good name. Better than all of the others,
> I think.
>
> On the other hand, we have the requirement that we don't want
> allyesconfig to end up disabling a bunch of CONFIG options. Now this
> requirement can be satisfied easily by adding something like
> NO_PV_SHIM_EXCLUSIVE. However, it would go somewhat against the previous
> requirement.
>
> So we need a compromise, something that doesn't end up disabling other
> CONFIG options, to make allyesconfig happy, but also not too confusing
> for the user (which is a matter of personal opinion).
>
> In short, expect that people will have different opinions on this and
> will find different compromises better or worse. For one, I prefer to
> compromise on "no negative CONFIG options" and use
> PV_SHIM_NOT_EXCLUSIVE. Because it serves the allyesconfig goal, and
> while it is not as clear as PV_SHIM_EXCLUSIVE, is still better than a
> completely generic FULL_HYPERVISOR option, which means nothing to me.
>
> I cannot see a way to have a good and clear non-negated CONFIG option,
> and also satisfy the allyesconfig requirement. So I prefer to compromise
> on the "non-negated" part.

Debating the naming is missing the point.


The problem here is the wish to have PV_SHIM_EXCLUSIVE behave in a way
that Kconfig is not capable of expressing.  Specifically, what is broken
is having "lower level" options inhibit unrelated "higher level" options
when the graph gets rescanned[1].  That's why we're in the laughable
position of `make allyesconfig` turning off CONFIG_HVM.

Jan, you want "echo PV_SHIM_EXCLUSIVE=y >> .config && make" to mean
"reset me back to a PV Shim".

Kconfig spells this "make $foo_defconfig" for an appropriately given foo.


There should be:

1) an option called PV_SHIM_EXCLUSIVE which does *nothing* other than
making the boolean be a compile time constant.

2) a pvshim_defconfig target which expresses what a pvshim ought to look
like.

Trying to fight against the behaviour of Kconfig is not a good use of
anyone's time.

~Andrew

[1] default to unrelated symbols is also broken for a related reason. 
The result you get is sensitive to the order of processing of symbols.

