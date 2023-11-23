Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF407F5D6E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639612.997142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67ZN-0002Pa-BQ; Thu, 23 Nov 2023 11:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639612.997142; Thu, 23 Nov 2023 11:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67ZN-0002N5-8l; Thu, 23 Nov 2023 11:08:29 +0000
Received: by outflank-mailman (input) for mailman id 639612;
 Thu, 23 Nov 2023 11:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVVO=HE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r67ZL-0002Mr-CN
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:08:27 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f4a7067-89f0-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:08:25 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4094301d505so4441275e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 03:08:25 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b0040a5e69482esm2293456wmq.11.2023.11.23.03.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:08:24 -0800 (PST)
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
X-Inumbo-ID: 9f4a7067-89f0-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700737705; x=1701342505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DN382QkUJ69D2CQoBtu2915ppA7PpRypiKZPj/jJy8=;
        b=m0lfvhn/joGtCf0QlE6Ws1ZT+w+vAGVs0BzPdnStCLeoOlgmG0LXP1o3KqccUYpc5g
         alkFyxxBtHY+iFUn1G2Y99bic3n1mxvqYe4NRbh7Cd2ohJKPg4VXKFVBxYge2+y3w+m/
         w8TWHpOfmXUvHQW9dR8/xQi1WDQUQ4pB+61u4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700737705; x=1701342505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DN382QkUJ69D2CQoBtu2915ppA7PpRypiKZPj/jJy8=;
        b=m92NusJp6McTqDzlDEv/rBDv76zJQgwBgaJUS/oR74zfB1x9X293pK5nrzgUDufli9
         134Ecmdv37qlJ5FRKuXcZWVrQVuvnjxerkTE825Whyq8qQ3wP9eKUhlfElG3cXaz5o9z
         HHSFEPfS3q7zPcjZBHSSu63Bj9eJocGjIySvd/7enHPDy0jQlJ4MIcK0FV5TahADTt+Y
         vYuHFN1ZCeKgtw8Z6R669eLuVEmKsQDlvEL37ZMghSOjFHCvB5rLqCwbp+9+W2ROzX3C
         XZolkLi96W726rbITBW+F2o/jfLjM8DcK+2AfnUv30sPJK6vGrCavuDKS/Kzyi07CIL6
         IauQ==
X-Gm-Message-State: AOJu0Ywgbe0cZWoktxKWocWVaPPZIYyfRSpOsBMM+WhsRMOOhTIQbsSx
	oxGxKTnklcMlPtM9AbLMoLpDgQ==
X-Google-Smtp-Source: AGHT+IEqQv8namtQV/MQ6znq+Ief48oKRKuMymOwFN4Eo6YIoT0WF5It96xxV3Baq8oMXKLYx8BLAQ==
X-Received: by 2002:a05:600c:3144:b0:404:72fe:ed5c with SMTP id h4-20020a05600c314400b0040472feed5cmr3971790wmo.29.1700737704826;
        Thu, 23 Nov 2023 03:08:24 -0800 (PST)
Message-ID: <47ee1d58-0862-4e9b-9177-a213615864d6@citrix.com>
Date: Thu, 23 Nov 2023 11:08:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: limit upcall vector related verbosity
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <8efe0fed-8533-474c-9893-e6fcb38b93ca@suse.com>
 <ZV8tueH53FROk86e@macbook> <f52395ef-5995-46fa-8dc2-6b49b3d79ccc@suse.com>
 <ZV8xAJjVH5hxz9VV@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZV8xAJjVH5hxz9VV@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/11/2023 11:01 am, Roger Pau Monné wrote:
> On Thu, Nov 23, 2023 at 11:50:41AM +0100, Jan Beulich wrote:
>> On 23.11.2023 11:47, Roger Pau Monné wrote:
>>> On Thu, Nov 23, 2023 at 11:25:34AM +0100, Jan Beulich wrote:
>>>> Avoid logging all-identical messages for every vCPU, but make sure to
>>>> log unusual events like the vector differing from vCPU 0's (note that
>>>> the respective condition also makes sure vCPU 0 itself will have the
>>>> vector setting logged), or it changing after it was once set. (Arguably
>>>> a downside is that some vCPU not having its vector set would no longer
>>>> be recognizable from the logs. But I think that's tolerable as
>>>> sufficiently unlikely outside of people actively fiddling with related
>>>> code.)
>>> Maybe we could consider printing unconditionally for debug builds?
>> Indeed I was considering that, but it's primarily debug builds where the
>> unnecessary redundancy is annoying me. (After all I work with debug builds
>> much more than with release ones.)
> I did find the message useful when doing guest bringup in the past, in
> order to know the guest was correctly setting up the vector callbacks.
>
> I guess there are other ways to figure that out, or the message could
> be added when people is doing bringup themselves.
>
> I find the save/restore messages during domain create much more
> unhelpful and annoying that this.

+1  I delete them in every debugging branch...

As to this message, we ought to do something.

However, the reason it's on every vCPU is because on Windows, there's no
ability to request the same vector on every CPU, and it often does end
up slightly different.

I think the logic added is fine, although it could do with a small
comment explaining why.  Debugging of weird bugs by dmesg isn't helpful
anyway - things like "did it have a vector upcall" should be answered by
tools in dom0.

~Andrew

