Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506417E8AFC
	for <lists+xen-devel@lfdr.de>; Sat, 11 Nov 2023 14:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630970.984131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1nct-0001A1-8C; Sat, 11 Nov 2023 13:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630970.984131; Sat, 11 Nov 2023 13:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1nct-00017U-4q; Sat, 11 Nov 2023 13:02:15 +0000
Received: by outflank-mailman (input) for mailman id 630970;
 Sat, 11 Nov 2023 13:02:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OdqC=GY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r1ncr-00017O-9t
 for xen-devel@lists.xenproject.org; Sat, 11 Nov 2023 13:02:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87607d79-8092-11ee-98da-6d05b1d4d9a1;
 Sat, 11 Nov 2023 14:02:12 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so21801955e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 11 Nov 2023 05:02:12 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b004053a6b8c41sm2121212wmq.12.2023.11.11.05.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Nov 2023 05:02:11 -0800 (PST)
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
X-Inumbo-ID: 87607d79-8092-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699707731; x=1700312531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TK40/DnAJocUT8Bp+wE1qqmqpbObZXdyY458hJnOjW8=;
        b=QzrHmAaFc7h/5o7G1Ax0QInn7NtUU0zFLP+PvZdPZpsZ3CE/1mheVPeQhSP9eZjyok
         BKyrOotAlBXHk4xFioMfYyZV3AaAzknnPbzE3SMeIrAhg7oZEEfBe1zB2hjQcFfGHYhO
         B+QejN6moQTP0HcKRNjUFwUPnjzS2kkcvVTxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699707731; x=1700312531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TK40/DnAJocUT8Bp+wE1qqmqpbObZXdyY458hJnOjW8=;
        b=RZ73DP6wRTSfZwaR9G+TuEvxRgR+2kQOyL/W6KRWyOrIgy4vtPERm/dRYtPfvM3YwE
         ErWSRcZsEVORFCuNf6k4T/FOLOYqhkyhGFpVa4f0FsMIMFGvHqK8D9Gbzq8sj/foTd/s
         gsf9WXHXFnTTUEY32RkIbsH/iExhbfyi5uToCAnLEIfIfcd30JzMWpPzUIR2stzK5rtQ
         19rRSGW9dGikiXW3/aliHQdzpYE8fZDBig1x6Fud+38E9AZRpwqVeGEe8ghQYMmGJttv
         B45vCQrQCcuVFzt1Ae9rZg6hF6e2JhJYFlARNRNn2TBDrD8ElzFLJtXQD7qegVkbSk/8
         XUsg==
X-Gm-Message-State: AOJu0YzOVwBPXT8B9qek8qxOKX673fHKfE/XSreVFE5YkbDoEn9OzTTZ
	sY+qiodXqvLwdtSkm/kjETp6hw==
X-Google-Smtp-Source: AGHT+IGMSOIdkoVslJBW7COPMk/3zktP5wmhPkz74HKc3d7xnBim0NsXk1oSFxutFk7XCbqpx+QW+w==
X-Received: by 2002:a05:600c:3b13:b0:40a:4c7e:6f37 with SMTP id m19-20020a05600c3b1300b0040a4c7e6f37mr1020286wms.20.1699707731503;
        Sat, 11 Nov 2023 05:02:11 -0800 (PST)
Message-ID: <a3d18a04-6ffc-48ce-aa9c-db221c372c94@citrix.com>
Date: Sat, 11 Nov 2023 13:02:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
 <20231108152727.58764-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2311091601420.3478774@ubuntu-linux-20-04-desktop>
 <0a168232-ea32-4aa1-b270-961782fec9dc@citrix.com>
 <alpine.DEB.2.22.394.2311101546100.3478774@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2311101546100.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/2023 11:49 pm, Stefano Stabellini wrote:
> On Fri, 10 Nov 2023, Andrew Cooper wrote:
>> On 10/11/2023 12:07 am, Stefano Stabellini wrote:
>>> On Wed, 8 Nov 2023, Andrew Cooper wrote:
>>>> diff --git a/docs/index.rst b/docs/index.rst
>>>> index f3f779f89ce5..22fdde80590c 100644
>>>> --- a/docs/index.rst
>>>> +++ b/docs/index.rst
>>>> @@ -53,17 +53,18 @@ kind of development environment.
>>>>     hypervisor-guide/index
>>>>  
>>>>  
>>>> -MISRA C coding guidelines
>>>> --------------------------
>>>> +Unsorted documents
>>>> +------------------
>>>>  
>>>> -MISRA C rules and directive to be used as coding guidelines when writing
>>>> -Xen hypervisor code.
>>>> +Documents in need of some rearranging.
>>> I understand the need for an "Unsorted documents", but why taking away
>>> "MISRA C coding guidelines" from here?
>> You can't have it both here and in index.rst without breaking the indexing.
>>
>> Also because in it's current position it breaks the navbar.  MISRA is
>> part of the developer guide, and what should be at the toplevel should
>> be a general section on safety certification, which cross-references the
>> developer guide amongst other things.  Nevertheless it will stay visible
>> for now at the top level because of how the toctree.
>>
>> It's in unsorted because I have thrown the index together with the bare
>> minimum effort in order to fix Sphinx errors in time for 4.18.
>>
>> This is also why I'm not changing any text.  There is 0 time between now
>> and this needing fixing for the release.
>>
>> Someone else can find some time to polish it - which is far more work
>> than just in the index - and we can backport it when its done.
> OK. I don't mean to make things difficult so if you don't think it is
> easy to keep "MISRA C coding guidelines" here in docs/index.rst then so
> be it. Can you at least add "and related files" to the text in
> docs/misra/index.rst?

Ok.

>  Can be done on commit. Anyway:
>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

~Andrew

