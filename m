Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04630938CB4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 11:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761595.1171580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVpnx-0006do-UL; Mon, 22 Jul 2024 09:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761595.1171580; Mon, 22 Jul 2024 09:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVpnx-0006bp-RB; Mon, 22 Jul 2024 09:58:05 +0000
Received: by outflank-mailman (input) for mailman id 761595;
 Mon, 22 Jul 2024 09:58:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVpnw-0006bj-Cq
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 09:58:04 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2a61bc8-4810-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 11:58:03 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7b237so3329220a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 02:58:03 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a709a74169sm2170921a12.95.2024.07.22.02.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 02:58:02 -0700 (PDT)
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
X-Inumbo-ID: e2a61bc8-4810-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721642283; x=1722247083; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVm7DrMqU9plQyYdsy1qD8Kio2Ve2OM55PL/ZaCLVRY=;
        b=tWB65NauZKmbpVoW3n6NwKfsGhRSKKrOdAQE1y/b1h86J0jHuSKxP8NgWWkbK3bp7E
         dLgdHoXNXoYZNr4D9OoPiNaVeYSwCYzTcGusoX30ZoEWleSzIVihj0q1e9li7fmBGWFn
         uY9m28qORA39CrVjVUNxbMHupsClGNFKX0EHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642283; x=1722247083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVm7DrMqU9plQyYdsy1qD8Kio2Ve2OM55PL/ZaCLVRY=;
        b=nYeR5RoG2mXRiUppDTzOr+cyX/VPbDw/ERKTc+QjpPAsiLS4sYAaSMhWrzUHM4T8kg
         lKFRG8pEHQpRyuy9nOQ7q7/+ablF+7YUNj14Re1HZpwfqk7SOprjrU624lpwqM/bQL6o
         KWlNxHkP3VPr+a6xHf+E6la3l+mNTJFuuCFaIGMmqq0r8CKFziyx4pXONuDx+Ov4CKm5
         RCWIUgBMDhZOTC+xyUyYkCfExHJPjszinGW62EWGrIXG4GuNi7lOXL9o9P8J/LdU4hh1
         zGJUrh7gKDs4F6xwqXTiQqBfLuvbz5oVzGaweat9KoGVXIs7ivQStkdWyV3q5zC7JbBy
         LzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXttoAZ2qtOcf0EL6MKGW2ZPif96yjFzeeHdJh05jHhLR3lXCOwvqNokGWxlB5/vJtiklPUshwPDUSBvi1t5g/HwRgCNTPuiJPPj5Qgu3A=
X-Gm-Message-State: AOJu0YxkXHXalcOmht3deiQKhvS13sVJLbVcGct2FxTGMmrOGwKl9qFb
	vFLVlImAREi7ymtdqW6YHqaG1KuIzrgZ1ISSLYefeiurlFHAb2Cf0cZUuuxsv1Y=
X-Google-Smtp-Source: AGHT+IHhJD5dTk0k/2bSBfBkLNvwjeagNv/1oTbU4UuXfFbvjyoxSFIP+a1DPzQjfZ6Ci1v30xzVOg==
X-Received: by 2002:a50:9fc5:0:b0:59e:f6e7:5521 with SMTP id 4fb4d7f45d1cf-5a47ab0dcd4mr3678205a12.19.1721642282610;
        Mon, 22 Jul 2024 02:58:02 -0700 (PDT)
Message-ID: <1cc4b233-adc2-4b57-babe-5a738821e642@citrix.com>
Date: Mon, 22 Jul 2024 10:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tools/libxs: Fix length check in xs_talkv()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20240718164842.3650702-1-andrew.cooper3@citrix.com>
 <20240718164842.3650702-2-andrew.cooper3@citrix.com>
 <78c73bac-deb9-4e6e-8027-fb78369f695a@amd.com>
 <7d278c21-e966-4c72-9955-63287f422f79@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7d278c21-e966-4c72-9955-63287f422f79@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2024 10:19 am, Jürgen Groß wrote:
> On 19.07.24 23:14, Jason Andryuk wrote:
>> On 2024-07-18 12:48, Andrew Cooper wrote:
>>> If the sum of iov element lengths overflows, the
>>> XENSTORE_PAYLOAD_MAX can
>>> pass, after which we'll write 4G of data with a good-looking length
>>> field, and
>>> the remainder of the payload will be interpreted as subsequent
>>> commands.
>>>
>>> Check each iov element length for XENSTORE_PAYLOAD_MAX before
>>> accmulating it.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Anthony PERARD <anthony.perard@vates.tech>
>>> CC: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/libs/store/xs.c | 17 ++++++++++-------
>>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
>>> index ec77379ab9bd..81a790cfe60f 100644
>>> --- a/tools/libs/store/xs.c
>>> +++ b/tools/libs/store/xs.c
>>> @@ -571,21 +571,24 @@ static void *xs_talkv(struct xs_handle *h,
>>> xs_transaction_t t,
>>>       struct xsd_sockmsg msg;
>>>       void *ret = NULL;
>>>       int saved_errno;
>>> -    unsigned int i;
>>> +    unsigned int i, msg_len;
>>>       struct sigaction ignorepipe, oldact;
>>>       msg.tx_id = t;
>>>       msg.req_id = 0;
>>>       msg.type = type;
>>> -    msg.len = 0;
>>> -    for (i = 0; i < num_vecs; i++)
>>> -        msg.len += iovec[i].iov_len;
>>> -    if (msg.len > XENSTORE_PAYLOAD_MAX) {
>>> -        errno = E2BIG;
>>> -        return 0;
>>> +    /* Calculate the payload length by summing iovec elements */
>>> +    for (i = 0, msg_len = 0; i < num_vecs; i++) {
>>> +        if ((iovec[i].iov_len > XENSTORE_PAYLOAD_MAX) ||
>>> +            ((msg_len += iovec[i].iov_len) > XENSTORE_PAYLOAD_MAX)) {
>>> +            errno = E2BIG;
>>> +            return 0;
>>
>> return NULL;
>>
>> With that,
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>
> With the suggested change:
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thankyou both.  I'd not even spotted the mistake when just rearranging
the logic.

~Andrew

