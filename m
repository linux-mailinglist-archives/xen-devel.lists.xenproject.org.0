Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2339A55C10
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904410.1312297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLiG-0000xd-PA; Fri, 07 Mar 2025 00:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904410.1312297; Fri, 07 Mar 2025 00:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqLiG-0000vH-Kk; Fri, 07 Mar 2025 00:37:16 +0000
Received: by outflank-mailman (input) for mailman id 904410;
 Fri, 07 Mar 2025 00:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqLiE-0000ud-NY
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:37:14 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4db8d2a5-faec-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 01:37:09 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-390edaee0cfso930911f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 16:37:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c10437dsm3594819f8f.99.2025.03.06.16.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 16:37:08 -0800 (PST)
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
X-Inumbo-ID: 4db8d2a5-faec-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741307829; x=1741912629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lNSmcC9cwulJQZbP2E9WoIGrj1u7xT5HyS9CA8lqHnE=;
        b=u9r5ISr6TjT4h0CWlMwcFH70FAryRhwO8QLvIcto8Vu4pmv8ws+6Dg1FmxJBPDN4BI
         lMa1xAKRJPgCdXhcnV16wV64mMhUNu8diPOqzCiZJsbgwsgYKl55v5865xkpyImq3tu5
         C01wZmVsj1x3WmkNFYAlGCR1yzk5evTYXA2/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741307829; x=1741912629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNSmcC9cwulJQZbP2E9WoIGrj1u7xT5HyS9CA8lqHnE=;
        b=j/8fM779ycjcRPNgwMIQxs4kEaAja0MHsOxHCCJkm8oIaMZcY8Y8DKLvf8MzaTBRaW
         9djlixJkdSMy5bFYoLjDT5MGXdqi/blOYvfbV/ZWJ83NMSqFIRJlJCn9vL2CWLj09nTB
         5FMpw+g/7iLzAHVzvsC7SO3USFuA9oROgZzk9cOPOX54WpC+2HZxzigN9ITX9sCpoJyh
         kXMfnzMYaplXWuq7OxuJSGizAgt5Wtr3Z35+jZDFBOgRrlIW3PT+u+f4glXurrzJzb4v
         DFGexmWt9dBZFUZQ9cOCEOANTnudE2OEfmcoM9TO/h3wrtiwhJGIeCdGqjumCckziagE
         8fQw==
X-Forwarded-Encrypted: i=1; AJvYcCVPCN4UN8WTQ8d29uF2T0GFWGLhC1esW8voL053d7XgypU8utbLf2WV3VY5v5qzm2sF5asvRKnWucY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwU9PD/psBsETnFYBBvZyANPChFL1Zp4gMhLrRTdg8C73FP3/wb
	ZO0m0+KbBXDDF6u9ojd9EbS8NaFRcz2r7D/oB7OtioiV824eqXKye6um1G9uwxI=
X-Gm-Gg: ASbGnctwbZXVFh/PjDBfGSZpYUK/Xn18xuctFvmZcBR0xlvie+OSyBToDb6DcPsmSJg
	7IwMVW2DQrQzG6Lu95P2RIx1YXE5HKp2sZcsSPtR/xE7OIaDsViPrm01C8dXzajvJwMlsyWh2HC
	pCC+RQkvn+NLaWb1KRHdzG/gBO6nWarD+Buyrl0QC9KVKz2uZJqI6NohlIMbLqWLDYpFPBAMq4c
	PsdN7fkyXim3+WWPs7li3Ewc1dHdsn41Jf+i4d//HspYlJ8VMT3UeJNfsGVzv3sDpmqB798Jm+a
	BVZms5gkQkjhSmswaY+PLfi62WICRHt0RWuLUHolLy1UpZAkT3If7sbkIaZHGC/hWA24vJKljoN
	ghNzxmmVp
X-Google-Smtp-Source: AGHT+IEQCVUQrtj3zHiWfmkaezngeZqEhCtNBCnDefz+DHaV18+GszrnCRzYkKo4r/8JQKiWhAKGrQ==
X-Received: by 2002:a05:6000:2109:b0:38f:4b15:32fc with SMTP id ffacd0b85a97d-39132d06e30mr610610f8f.8.1741307829073;
        Thu, 06 Mar 2025 16:37:09 -0800 (PST)
Message-ID: <0a3db119-11d2-4f25-bf50-f84b79a6a246@citrix.com>
Date: Fri, 7 Mar 2025 00:37:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250305085201.14258-1-jgross@suse.com>
 <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
 <3f6f680d-3be7-41d8-a599-49521766aa62@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3f6f680d-3be7-41d8-a599-49521766aa62@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2025 7:09 am, Jürgen Groß wrote:
> On 05.03.25 23:57, Andrew Cooper wrote:
>> On 05/03/2025 8:52 am, Juergen Gross wrote:
>>> The description of the Xenstore INTRODUCE command is still referencing
>>> xend. Fix that.
>>>
>>> While at it, make clear that the Xenstore implementation is allowed
>>> to ignore the specified gfn and use the Xenstore reserved grant id
>>> GNTTAB_RESERVED_XENSTORE instead.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   docs/misc/xenstore.txt | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
>>> index 38015835b1..d894d24d11 100644
>>> --- a/docs/misc/xenstore.txt
>>> +++ b/docs/misc/xenstore.txt
>>> @@ -286,7 +286,7 @@ TRANSACTION_END        F|
>>>   INTRODUCE        <domid>|<gfn>|<evtchn>|?
>>>       Notifies xenstored to communicate with this domain.
>>>   -    INTRODUCE is currently only used by xend (during domain
>>> +    INTRODUCE is currently only used by xen tools (during domain
>>>       startup and various forms of restore and resume), and
>>>       xenstored prevents its use other than by dom0.
>>>   @@ -299,6 +299,10 @@ INTRODUCE        <domid>|<gfn>|<evtchn>|?
>>>       for example passing a high-bit-set 32-bit gfn as an unsigned
>>>       decimal will attempt to use 0x7fffffff instead (!).
>>>   +    Xenstored might ignore the <gfn> value and use the reserved
>>> +    grant table entry GNTTAB_RESERVED_XENSTORE instead for mapping
>>> +    the Xenstore interface page of the guest.
>>
>> I'd suggest making a stronger statement than this.
>>
>> ---
>> The <gfn> field is used by xenstoreds which use foreign mapping to
>> access the ring page.
>>
>> Alternatively, Grant 1 (GNTTAB_RESERVED_XENSTORE) is reserved for the
>> same purpose, and is populated by the domain builder on behalf of the
>> guest.  This mechanism is preferred because reduces the permissions that
>> xenstored needs in order to function.
>>
>> Both <gfn> and Grant 1 need to agree, because implementations of
>> xenstored will use one and ignore the other.
>
> Fine with me.

Are you happy for me to adjust on commit, or do you want a v2 sending out?

~Andrew

