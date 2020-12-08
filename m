Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CB2D2C57
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 14:56:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47454.83948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmdTd-0007nP-2F; Tue, 08 Dec 2020 13:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47454.83948; Tue, 08 Dec 2020 13:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmdTc-0007mz-V4; Tue, 08 Dec 2020 13:56:24 +0000
Received: by outflank-mailman (input) for mailman id 47454;
 Tue, 08 Dec 2020 13:56:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KXXm=FM=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmdTc-0007ms-8J
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 13:56:24 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b810822c-be0a-41eb-a1b8-cf4f6314a290;
 Tue, 08 Dec 2020 13:56:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t22so19537155ljk.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Dec 2020 05:56:23 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z16sm3467677ljc.27.2020.12.08.05.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 05:56:21 -0800 (PST)
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
X-Inumbo-ID: b810822c-be0a-41eb-a1b8-cf4f6314a290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AEM4r0RQc1Iqs4XZv1K4qOyAXvA0DEIwLHJvd9HvmIk=;
        b=WvegLxUyhjkNVY952bMNMCGBtJeckA1Qa20HLKxPZS2hAR9SyTe2nGYCyPROHYtvhV
         LqRGcG4nhJsaZPKF6AvUKX1QN2dYK8BiuKI6989KQpQBxRxrJdxYK051W6w1hvuA9hCD
         W188nak1SKCCDkl+htCcwjbi2OMJI5hZZAlGMGTAoM389Ham2RdAyBPEVFgZw4LSwO5n
         /TpESx8/b3WbNVDbq0BrlYeT4Og9QJzuSt8iYplVaHMYTzavZkCgTTH9pp8WrxvhkMjt
         l5zP3fi6K2dT9DjwP+uSrYsE5DvfQZ/sOWnTZJM0LGwYcVby484NassSCCjsG3BIY43r
         3/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AEM4r0RQc1Iqs4XZv1K4qOyAXvA0DEIwLHJvd9HvmIk=;
        b=rhKzdtnKmwpVwxZxaCYj8HJeTAPqfPDweifkBLK/IAzzIZR9ARsmkKqraZOZeM56qN
         2SkELSKB0wkar/q0e1H9QnTay/PUivArziLHvqfCtR+clakBSuvyxYXyf3sxp3lXR0j8
         13cSJ/TXN5utxPqtLLXUfVufuPU3vfr+jRh4xNnBXIh9vf616iqiq5ol2RzwFMWaDlUC
         POmF/vT4FUtd+M2m49SNcGvP8q81Kp/dvCkN7xLYGyHkxzqfnSpZeB/622gyGLl0bonK
         gBQwKVbiN8WqDbns/I+bNNDEWJW1vcSYtLwcF2wG7RZD4upNdzapXqtEeuI7qwRCmULy
         3j2w==
X-Gm-Message-State: AOAM530iOQfI/+1vFELX/9QvNOHTegQhIRkQEOrecgIxEUq/P2Ep+Bl7
	k9Ti+o38mxwRf4nSGL7LNz+NdQoQ1SWFuA==
X-Google-Smtp-Source: ABdhPJw7FN0rfIvdVNrQvdBwbiaeRJPsY9a8LYf8zAGDvsmWUeYOkad8vtxm8Y4XoMcSmjo/HbONaw==
X-Received: by 2002:a05:651c:1027:: with SMTP id w7mr333275ljm.297.1607435782086;
        Tue, 08 Dec 2020 05:56:22 -0800 (PST)
Subject: Re: [PATCH V3 04/23] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, Tim Deegan
 <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-5-git-send-email-olekstysh@gmail.com>
 <d1fdebe9-3355-fece-e9dc-e6a7acc180e7@suse.com>
 <4a82d6f3-6b6c-566a-6ad0-36e22df323fa@gmail.com>
 <536b5e63-0605-f4d3-e163-dff67ec0422d@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8ee60a49-8e64-ae25-510b-42eb243ea3ae@gmail.com>
Date: Tue, 8 Dec 2020 15:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <536b5e63-0605-f4d3-e163-dff67ec0422d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 08.12.20 11:21, Jan Beulich wrote:

Hi Jan

> On 07.12.2020 20:43, Oleksandr wrote:
>> On 07.12.20 13:41, Jan Beulich wrote:
>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>> @@ -38,42 +37,6 @@ int arch_ioreq_server_get_type_addr(const struct domain *d,
>>>>                                        uint64_t *addr);
>>>>    void arch_ioreq_domain_init(struct domain *d);
>>> As already mentioned in an earlier reply: What about these? They
>>> shouldn't get declared once per arch. If anything, ones that
>>> want to be inline functions can / should remain in the per-arch
>>> header.
>> Don't entirely get a suggestion. Is the suggestion to make "simple" ones
>> inline? Why not, there are a few ones which probably want to be inline,
>> such as the following for example:
>> - arch_ioreq_domain_init
>> - arch_ioreq_server_destroy
>> - arch_ioreq_server_destroy_all
>> - arch_ioreq_server_map_mem_type (probably)


First of all, thank you for the clarification, now your point is clear 
to me.


> Before being able to make a suggestion, I need to have my question
> answered: Why do the arch_*() declarations live in the arch header?
> They represent a common interface (between common and arch code)
> and hence should be declared in exactly one place.

I got it, I had a wrong assumption that arch hooks declarations should 
live in arch code.


> It is only at
> the point where you/we _consider_ making some of them inline that
> moving those (back) to the arch header may make sense. Albeit even
> then I'd prefer if only the ones get moved which are expected to
> be inline for all arch-es. Others would better have the arch header
> indicate to the common one that no declaration is needed (such that
> the declaration still remains common for all arch-es using out-of-
> line functions).
I got it as well.

Well, I think, in order to address your comments two options are available:
1. All arch hooks are out-of-line: мove all arch hook declarations to 
the common header here and modify
"[PATCH V3 14/23] arm/ioreq: Introduce arch specific bits for IOREQ/DM 
features" to make all Arm variants
out-of-line (I made them inline since all of them are just stubs).
2. Some of arch hooks are inline: consider which want to be inline (for 
both arch-es) and place them into arch headers, other ones
should remain in the common header.

My question is which option is more suitable?


-- 
Regards,

Oleksandr Tyshchenko


