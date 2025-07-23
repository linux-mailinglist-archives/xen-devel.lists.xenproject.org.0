Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A67B0F14B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053802.1422597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXkV-0001tp-B8; Wed, 23 Jul 2025 11:35:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053802.1422597; Wed, 23 Jul 2025 11:35:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXkV-0001rH-81; Wed, 23 Jul 2025 11:35:03 +0000
Received: by outflank-mailman (input) for mailman id 1053802;
 Wed, 23 Jul 2025 11:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmaN=2E=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ueXkT-0001rB-Qs
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:35:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1179a060-67b9-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 13:35:01 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45634205adaso32849715e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 04:35:01 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45863cd63f9sm29710455e9.3.2025.07.23.04.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 04:34:59 -0700 (PDT)
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
X-Inumbo-ID: 1179a060-67b9-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753270500; x=1753875300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ5zrd8zmRtlA6qwjhn+wOUlQHzsO188rAT2sv4XCrs=;
        b=fXe9F3XuyR5dqwQEX17zomX9idhTOAdYpI5h9SQBJEPp3vcPi6xh9BRFTFHXqHqpWo
         UwGolnkgXNoLcVba5twNlBVYADnpdmt9uO2h/ipkWMPoltUc2y/0QqTxO6DTNI3+fvsl
         ijQYoBwlrv7zeRK+PjDR94Zcfkennx4XxvXzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270500; x=1753875300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ5zrd8zmRtlA6qwjhn+wOUlQHzsO188rAT2sv4XCrs=;
        b=i5vWkgxvezXBKsF8r+1+Fl5BZnkGfMyC9rMFP+9TjxZlczoWWXjq4cUGHPN7M43Q5Z
         Pp1qCvTPhobNhv3pAqiUesG6VwW8dmalsMwaKxJ8GslEIeeZPQM8x6TP6DIAmoNKmPRq
         a82+QF8VHVX8sWMYccUjO98JK4JdzytAMkXMCdNA8PBMR8x7ETjSyIAUsesr8YmYUP50
         gNNpmz4FaORVLbrrRWUKMTdDLeKhfY+7U3tSyYfqXyIwxnKYXJg9rySW5g1Lsm+CywSM
         LNwnEi9BQBeouXt2F8jyGykGx36Rdcy+1qLhTl2iOEv9ex37ytF3Cyux2Mvaj0WD5TDK
         cZTw==
X-Forwarded-Encrypted: i=1; AJvYcCVipS5zpGcDhiadW/gyBN+DRs/o1HIzgbZpJIsawF0ohH5zb+gw0NDZe4tD/igMLKL9LMCPq3K0TVs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5HMyZBgU4TuuppeCsPtZsRZ6Xxl+E1vckBY8jWby6/eXX3WLZ
	NfahsBmYAGopZU+qhVHpz0/MWf3R8Sfr9Y3Wwle6+7K5I2/Hv4LnImWw2NpScnwxWe0=
X-Gm-Gg: ASbGncululqfkD69GvlQHc7Jw/wE0PrzIOHrruliv0c7JThRaPVgeNqDlLgX1qGEPD3
	OlxJB70k6fiJ6k7IKfqj0r8zaZyL7ZzBREvtscR59MMrsRpg+oQuiiLEWAKh5/uX9P7R9sn9R3x
	Bfu4j7C6NrME5+AcZzdcL/uR/U0UF19PjpMk5heY6GlSRkbCsz3DvJ/ASghPtaNS3fQ9k8UhvxM
	JSxBpjLJFECzYVwJpAjWtiDqwplI5Hy0g23BzWP11m5JNrO9yakklZtLKeCJtbrt4xhlAS9z+0X
	cEdXU9q3VnhALVLuOdBeiUwPX6lFdQqER3ClJiOuvoXwnxCvsftz8xhsLvhtPPFr81sHf4OT5rH
	RnfrNB9FUwupRsqKzdVxJhbW3jutPeCO+V9SHbhQFGMco2Q3OJLmDvRM+9dQ6rLeE1Rui
X-Google-Smtp-Source: AGHT+IFFugc9OmjMLLhoBmmKNeSw8zrrgnS4ynbpc6aAa6i53HHIvSAUamFZnq0QUizbDRq5d/DgKw==
X-Received: by 2002:a05:600c:c049:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4586954d4dfmr16739895e9.4.1753270500313;
        Wed, 23 Jul 2025 04:35:00 -0700 (PDT)
Message-ID: <6af98da1-81b6-46cf-a78e-4313c2bc1022@citrix.com>
Date: Wed, 23 Jul 2025 12:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
 <20250722001958.174294-2-jason.andryuk@amd.com>
 <481a415a-7992-42bf-a890-a7b40b4aac84@suse.com>
 <b7cf7835-c3e3-468d-8625-5cc147861737@suse.com>
 <fb860d51-56ee-455a-bbaa-81ee0e94b0d1@suse.com>
 <b33a1b88-dca1-42f1-874a-5681eea53336@suse.com>
 <d0081137-7eef-4866-8261-1148cf53db99@suse.com>
 <62ce197b-5e80-4605-84de-4257936d472c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <62ce197b-5e80-4605-84de-4257936d472c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/07/2025 8:29 am, Jürgen Groß wrote:
> On 23.07.25 09:04, Jan Beulich wrote:
>> On 23.07.2025 08:55, Jürgen Groß wrote:
>>> On 23.07.25 08:43, Jan Beulich wrote:
>>>> On 23.07.2025 08:34, Jürgen Groß wrote:
>>>>> On 23.07.25 08:28, Jan Beulich wrote:
>>>>>> On 22.07.2025 02:19, Jason Andryuk wrote:
>>>>>>> --- a/xen/common/domain.c
>>>>>>> +++ b/xen/common/domain.c
>>>>>>> @@ -195,6 +195,14 @@ static void set_domain_state_info(struct
>>>>>>> xen_domctl_get_domain_state *info,
>>>>>>>             info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>>>>>>         if ( d->is_dying == DOMDYING_dead )
>>>>>>>             info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
>>>>>>> +
>>>>>>> +    info->caps = 0;
>>>>>>> +    if ( is_control_domain(d) )
>>>>>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
>>>>>>> +    if ( is_hardware_domain(d) )
>>>>>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
>>>>>>> +    if ( is_xenstore_domain(d) )
>>>>>>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
>>>>>>>         info->unique_id = d->unique_id;
>>>>>>>     }
>>>>>>
>>>>>> This being a stable sub-op, don't we need a way to indicate to
>>>>>> the caller
>>>>>> _that_ this field has valid data now? When non-zero it's easy to
>>>>>> tell, but
>>>>>> getting back zero is ambiguous.
>>>>>
>>>>> The hypercall sub-op was introduced in this development cycle
>>>>> only, so
>>>>> there is no released Xen hypervisor without the capability setting.
>>>>>
>>>>> In case this patch doesn't make it into 4.21, the case you are
>>>>> mentioning
>>>>> must be handled, of course.
>>>>
>>>> Hmm, yes, this way it's on the edge. As a stable sub-op, someone
>>>> could have
>>>> backported the change, though. IOW (and in general) I wonder
>>>> whether for
>>>> stable sub-ops we shouldn't be pretty strict about functional
>>>> extensions,
>>>> not tying their addition to releases at all.
>>>
>>> Should we really care about downstreams backporting not yet released
>>> functionality?
>>>
>>> Using your reasoning this would mean we'd need to issue XSAs for not
>>> yet
>>> released hypervisor issues of stable interfaces, too. I don't think we
>>> want to do that.
>>
>> To me, the latter doesn't necessarily follow from the former. But
>> anyway, I'm
>> not going to insist, but I wanted the situation to at least be
>> considered. In
>> particular also forward-looking, when we may gain more stable
>> sub-ops. At some
>> point it may turn out necessary to backport such even into upstream
>> branches.
>
> I think it is fine to discuss this situation.
>
> I'd suggest not to support any potential downstream backports of not yet
> released functionality. Consider a new interface being developed in a
> larger
> patch series. In case the series is not being committed in one go,
> would you
> want to support backports of only a part of it? What about fixes of that
> interface in the current release cycle, e.g. due to the use cases
> having been
> committed only some time later uncovering the need to change the
> interface
> to make it safe?

Interfaces cannot be fixed until they're in a RELEASE-* tag.  Anything
else would be absurd position to put upstream Xen into.

Downstreams backporting a not-yet-fixed interface is equivalent to
taking a private ABI into their patchqueue.  They get to keep both
pieces if it goes wrong.

(and I say this as someone who frequently walks this tightrope in the
XenServer patchqueue.)

~Andrew

