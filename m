Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080769421BB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 22:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768069.1178815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYteC-0004VL-P9; Tue, 30 Jul 2024 20:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768069.1178815; Tue, 30 Jul 2024 20:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYteC-0004T5-Ly; Tue, 30 Jul 2024 20:40:40 +0000
Received: by outflank-mailman (input) for mailman id 768069;
 Tue, 30 Jul 2024 20:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jiA=O6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sYteB-0004Sz-DI
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 20:40:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa5dc8a8-4eb3-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 22:40:38 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4281e3b2f72so21481145e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 13:40:38 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427fb7bdfa0sm258990045e9.14.2024.07.30.13.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 13:40:36 -0700 (PDT)
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
X-Inumbo-ID: fa5dc8a8-4eb3-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722372037; x=1722976837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bydnm9uuY6+8KZl9W1OMHbSauv6isBLhyHeiQbRtl6M=;
        b=TWNjOMdQxLfMmSaaI2wX19DS3jJA6IGNnfh0E/BR10dtcA0n1vU5FoptB7Ro5eX0UB
         ruzywSWQb83GIUJLb4J+uBFoWLlB+skY5ia4/NUYXT7HtDLYiItTOSIStSCr6siH0ZvD
         K6cPhtUIzTtqa6DweWoVVAS4cPGU9SEdSlhRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722372037; x=1722976837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bydnm9uuY6+8KZl9W1OMHbSauv6isBLhyHeiQbRtl6M=;
        b=iqGdquSkHdyZObEWjSXPjlG39Mh0SOJFu+wSsNF6SxV9ks80vtOfGWL6MdSQqFjYdT
         xNvN+gR61btpAOYyZXFAhQbsh8MaczvNau2T3Nl/Ptela8E5zde1Y14mnOPT+11ngMHl
         C7EHo77QU93J0UnF3t/Pi4lK5JBga+q7XNPjlNmcAHXk6CoQp5WiLnxGclsku37ry9DB
         ztjhIT1wfKacoGGDVyrW5GrDkgoysQ4CRmxIBxQZj6DEuf8t/h5TG83exOowrC2wRu40
         mH2LjMNXdDz62wnB6B5LdurEIg1GoJYcHvECUs/RtbYo2ppEiXKw5HdfQTyTjaRdZAdW
         ZlHA==
X-Gm-Message-State: AOJu0YwzCHeNty/W3kEHyTSTwtgXKtr1uMV6XIHQxIyjvYp1m6QUgDGj
	ZXcleGdUiZL4NntkkEBaH+CrBezZqyQmnMAqjCHkkXjk2gpUcvhTj5S+x6PAQ28=
X-Google-Smtp-Source: AGHT+IG1gAQ/x30HKttfGCBofvDFLaxaZ25sup/tBnpi1+9ORE4uT0Zxkm/xDNrN4IVaiktrxhB+Bw==
X-Received: by 2002:a05:600c:a49:b0:426:623f:34ae with SMTP id 5b1f17b1804b1-42811d8a865mr81576545e9.16.1722372037333;
        Tue, 30 Jul 2024 13:40:37 -0700 (PDT)
Message-ID: <dceb52ce-407f-4c41-924e-9e122a0eaf3a@citrix.com>
Date: Tue, 30 Jul 2024 21:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Stack checking on Arm
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
References: <20240729142421.137283-1-stewart.hildebrand@amd.com>
 <2cfb4a5c-dff8-4202-80dd-c546d5d6bc6d@xen.org>
 <alpine.DEB.2.22.394.2407291333550.4857@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2407291333550.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2024 10:37 pm, Stefano Stabellini wrote:
> On Mon, 29 Jul 2024, Julien Grall wrote:
>> Hi,
>>
>> On 29/07/2024 15:24, Stewart Hildebrand wrote:
>>> This series introduces stack check instrumentation on Arm. This is
>>> helpful for safety certification efforts. I'm sending this in an RFC
>>> state because I wanted to gather opinions on the approach of using
>>> -finstrument-functions.
>> This looks ok for an initial approach. I wonder if longer term we want to
>> implement stack guards on Arm. We would need to allocate an extra "virtual"
>> page per stack that would be unmapped.
>>
>> The advantage is this could be used also in production and doesn't rely on any
>> support from the processor.
>>
>> Any thoughts?
> I think we need both. We should implement stack guards on Arm. In
> addition, it is also beneficial to have -finstrument-functions for
> profiling, debugging, and also so that we can retrieve detailed call
> graphs from execution runs. As an example, -finstrument-functions can
> help with offline analysis to prove that we don't have unbounded
> recursion, on both arm and x86 too. On the other hand, stack guards help
> with protecting the stack in production.

x86 unconditionally has stack guards.  It was easier doing it this way
than to have conditional stack guards and conditional shadow stacks
(hardware CET stacks).

In most cases, the #DF handler will recognise hitting a guard page and
panic() with information about the stack overflow.

The one case where this wont happen is on AMD hardware in HVM(SVM)
context, because the SVM designers and the AMD64 designers didn't talk
to each other when developing the respective features[1]...

In this case, Xen will take a clean[2] triple fault and reset on stack
overflow.

~Andrew

[1] The Task Register isn't switched on VMRUN, and while this was fine
in 32bit CPUs, it wasn't fine when 64bit CPUs replaced Task Switches
with the Interrupt Stack Table mechanism.  It should be fixed when AMD
implement FRED support.  For current CPUs, we can in principle fix this,
but at added latency to vmentry/exit, which is why we've not done so. 
If someone feels like adding a debug mode for it, I'm sure that would be
acceptable.

[2] If you can call such a thing "clean", but it won't execute off into
the weeds.

[3] (tangent from another thread).  14k of stack!?!.  x86 has 8k and
we've only ever hit that in error cases...

