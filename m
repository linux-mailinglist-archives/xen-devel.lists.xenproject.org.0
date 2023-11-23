Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E297F5B12
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 10:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639468.996879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r661z-0004SR-Jm; Thu, 23 Nov 2023 09:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639468.996879; Thu, 23 Nov 2023 09:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r661z-0004Qa-G1; Thu, 23 Nov 2023 09:29:55 +0000
Received: by outflank-mailman (input) for mailman id 639468;
 Thu, 23 Nov 2023 09:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtUW=HE=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r661y-0004QT-15
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 09:29:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa74af9-89e2-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 10:29:52 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so4275475e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 01:29:52 -0800 (PST)
Received: from [192.168.13.100] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adf978f000000b00332d41f0798sm1133102wrb.29.2023.11.23.01.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 01:29:51 -0800 (PST)
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
X-Inumbo-ID: daa74af9-89e2-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700731791; x=1701336591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUwE7u3onPGssHGYPcJFRGaN2UI16fqtGIi4M3Ht1a4=;
        b=AGxvtSS0NfxkvxwyeQmkz/Cq72Yzep5m5cfmwXhZ0ARZQDBKsFGrEMkfcLlFW+mdC9
         1rHugvaGfVJI+T4NIVXkp3k0tPAtWqiN7jYtrkEKAvmFwYL9B2AqSBPGIKQGll3Zdc4L
         nd40XVwzLZnxl9Psjr0eZ6/T6Rdu64Df182fXUYtts+/cO2XNtOxjALdl/jiht9s5sXT
         BMqnuSah04GPulHB6qIkW7cDeeTOX87VsihMlZ/sJOHejm6RcJUWnbEOugx7XYzMMnao
         XzhbosmTOzK9BpyiyFcrsGyhiTBTSOd/OaY77ruSOzo35ws/0bLsGxzbMWTM8E0B/lWI
         v3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700731791; x=1701336591;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUwE7u3onPGssHGYPcJFRGaN2UI16fqtGIi4M3Ht1a4=;
        b=HZ8LeXeNDj/BR6bhlR4+k2rnC+dlcGnWbvp2fwl+OXgN54xDtTqaYFbmJdlgqOlEnv
         qPfp0KId0PGOEWbGljZCLokAdsuwMlFujA9t0oDOpDQdwov/NCrMCetPsgItSeBK6IFk
         EuCd4CXpQtRAp7inxR62NXgXcxJYWQOwVItx4rOHgLKoQyUlQnOzuCnmTemkVjwJC7of
         +7aLutvnBWIoz3psDekqMhiMvjTH0OK3sTYPAOwfkExAYxP500fhZqzNVvzcCVKotRWZ
         /8HMg6t84cTJKSsggbOFi1UTB8eDUPqW+eULKcgl+mhgGxZ66QSqx0CroA1j8Iui0iTY
         w+VQ==
X-Gm-Message-State: AOJu0YwZ+w/mjxELlaFCOH8rRaqDdbyPESlkrbf5BjPZNRhBsdx0AdnU
	aDZebKNj3vO79KAaMOfbA3U=
X-Google-Smtp-Source: AGHT+IFlygPZqpcnr3ZfDt4tmxZcvFNUOiDOTe0AZd7sdtL0/KrfYErVCG8BikAxQK6z7g+6mdxvPQ==
X-Received: by 2002:a5d:4bc6:0:b0:32f:b1ab:ee87 with SMTP id l6-20020a5d4bc6000000b0032fb1abee87mr3685763wrt.25.1700731791454;
        Thu, 23 Nov 2023 01:29:51 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <630819c4-4343-401d-8c7b-342cfd5f50c0@xen.org>
Date: Thu, 23 Nov 2023 09:29:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-2-volodymyr_babchuk@epam.com>
 <e1663064-247d-41e3-9a36-16f81303fb94@xen.org> <878r6p1jp2.fsf@epam.com>
 <67e06eae161072e05f4b0990dbde1da869241670.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <67e06eae161072e05f4b0990dbde1da869241670.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/11/2023 23:04, David Woodhouse wrote:
> On Wed, 2023-11-22 at 22:56 +0000, Volodymyr Babchuk wrote:
>>
>>
>> Paul Durrant <xadimgnik@gmail.com> writes:
>>
>>> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>> This allows a XenDevice implementation to know whether it was
>>>> created
>>>> by QEMU, or merely discovered in XenStore after the toolstack created
>>>> it. This will allow us to create frontend/backend nodes only when we
>>>> should, rather than unconditionally attempting to overwrite them from
>>>> a driver domain which doesn't have privileges to do so.
>>>> As an added benefit, it also means we no longer have to call the
>>>> xen_backend_set_device() function from the device models immediately
>>>> after calling qdev_realize_and_unref(). Even though we could make
>>>> the argument that it's safe to do so, and the pointer to the unreffed
>>>> device *will* actually still be valid, it still made my skin itch to
>>>> look at it.
>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>> ---
>>>>    hw/block/xen-block.c         | 3 +--
>>>>    hw/char/xen_console.c        | 2 +-
>>>>    hw/net/xen_nic.c             | 2 +-
>>>>    hw/xen/xen-bus.c             | 4 ++++
>>>>    include/hw/xen/xen-backend.h | 2 --
>>>>    include/hw/xen/xen-bus.h     | 2 ++
>>>>    6 files changed, 9 insertions(+), 6 deletions(-)
>>>>
>>>
>>> Actually, I think you should probably update
>>> xen_backend_try_device_destroy() in this patch too. It currently uses
>>> xen_backend_list_find() to check whether the specified XenDevice has
>>> an associated XenBackendInstance.
>>
>> Sure. Looks like it is the only user of xen_backend_list_find(), so we
>> can get rid of it as well.
>>
>> I'll drop your R-b tag, because of those additional changes in the new
>> version.
> 
> I think it's fine to keep. He told me to do it :)

I confirm that :-)

