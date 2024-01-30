Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E754842781
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673540.1047904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpfM-0003LA-FX; Tue, 30 Jan 2024 15:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673540.1047904; Tue, 30 Jan 2024 15:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpfM-0003JB-Cc; Tue, 30 Jan 2024 15:04:48 +0000
Received: by outflank-mailman (input) for mailman id 673540;
 Tue, 30 Jan 2024 15:04:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5qC=JI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rUpfL-0003Gj-3D
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:04:47 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e80f19d9-bf80-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 16:04:46 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso54107005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:04:46 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a05600c1e1a00b0040f22171920sm1861532wmb.0.2024.01.30.07.04.44
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 07:04:45 -0800 (PST)
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
X-Inumbo-ID: e80f19d9-bf80-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706627085; x=1707231885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=srBUpj5mtWKVMwhfQnmolZbYFz8tBY3OlYTrbe6JAZg=;
        b=W6r2OVhOeAjEZ3kIUwIpya1JPyJbkF/8SaJ9h/qJmbwNHTV4Q6bPLCWnJmPbypmhg+
         uUntXsSXw+mKMzFll5gU2aRan2Ae9GS4BBZg5yk3KhxBsX2jkDqHN1wKSaUELE3Pt8Q3
         z8olZe3udCywhZv+sCmGn48FQ5RAB14TsE7fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706627085; x=1707231885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srBUpj5mtWKVMwhfQnmolZbYFz8tBY3OlYTrbe6JAZg=;
        b=HNAgoXgK+y68JyXN+11PDV1hSdkeRntoKBSviI3Nk+P6YlIbPVO6yOGOixRLAFz6PA
         WFTOITgNEPEKJSGgSQ6euDtc0hLiKE0vxRoN4IjcfknxcwpPKuYa4i7Qp1O/7prbX0D8
         22yHX4NvtiBO1oP0cV2xY4wLAMo7pqoUdBy29cElNYeqwfL3PE2mP8yTNQfml/7Ho8H7
         sDLgDUnitmpMEBHpUcqWgtf3CYHcUBoOAR50SVtS38UhrT7R0T0TiHRM0nQsZGYUeKAI
         8WxkY8EKIkcpr9qT/hsPJdDgTrkvomFL3XjYVQ+LS855sxNKVZouu10KP6ZbhgbNCFBh
         1isA==
X-Gm-Message-State: AOJu0YyU9b7Brm/1fhc58wHB21UMAzt6z3SOLsA0QAHET9L0aOSlXeT5
	z0zzu1536XXhxkYBrHtj02zw8pzTvr+bdoEyzQADBEXtSuhqUKdcxrSJh7jrZlSlG3E8IcBTdcK
	n
X-Google-Smtp-Source: AGHT+IHJPAwG02DcThrP0vdVGu36kwthxF0lZKZel5bj7o2OHG5qlLHkOT4eOrLdYD3j+Te+qjMC2A==
X-Received: by 2002:a05:600c:1d1b:b0:40e:d332:bb8f with SMTP id l27-20020a05600c1d1b00b0040ed332bb8fmr6878229wms.5.1706627085458;
        Tue, 30 Jan 2024 07:04:45 -0800 (PST)
Message-ID: <505377d7-e105-4a76-b24a-a52698185836@citrix.com>
Date: Tue, 30 Jan 2024 15:04:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] XTF: tests SPEC_CTRL added bits
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130102719.51150-1-roger.pau@citrix.com>
 <7f514c59-dbf1-44ea-a589-dbc43f0b4ee4@suse.com> <Zbjhica05LIMB9zX@macbook>
 <2ded2ffa-70cb-4d91-8c52-d36bc2ee3705@suse.com> <ZbkPf0Ji4LRHBwOz@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZbkPf0Ji4LRHBwOz@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2024 3:02 pm, Roger Pau Monné wrote:
> On Tue, Jan 30, 2024 at 01:55:56PM +0100, Jan Beulich wrote:
>> On 30.01.2024 12:46, Roger Pau Monné wrote:
>>> On Tue, Jan 30, 2024 at 11:42:43AM +0100, Jan Beulich wrote:
>>>> On 30.01.2024 11:27, Roger Pau Monne wrote:
>>>>> Dummy set/clear tests for additional spec_ctrl bits.
>>>>> ---
>>>>>  docs/all-tests.dox  |   2 +
>>>>>  tests/test/Makefile |   9 ++++
>>>>>  tests/test/main.c   | 100 ++++++++++++++++++++++++++++++++++++++++++++
>>>>>  3 files changed, 111 insertions(+)
>>>>>  create mode 100644 tests/test/Makefile
>>>>>  create mode 100644 tests/test/main.c
>>>> I'm puzzled: Why "test"? That doesn't describe in any way what this test
>>>> is about.
>>> That's just my place holder for random XTF stuff.  I don't intend this
>>> to be committed.
>> Could have been said then one way or another.
> Yes, realized later when speaking with Andrew that I had forgot to send
> the test I've used, and then didn't adjust the message when sending to
> note this wasn't supposed to be applied.

I've got a local test with some of this in, which I'll extend.

But as with many other things, it's waiting on fixing the test-revision
build infrastructure so the OSSTest Bisector doesn't break when adding
new content to an existing test.

~Andrew

