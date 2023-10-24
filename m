Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E763A7D51F8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:38:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621976.969000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHbH-00080d-1V; Tue, 24 Oct 2023 13:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621976.969000; Tue, 24 Oct 2023 13:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHbG-0007xw-Ug; Tue, 24 Oct 2023 13:37:38 +0000
Received: by outflank-mailman (input) for mailman id 621976;
 Tue, 24 Oct 2023 13:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvHbF-0007w3-Ip
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:37:37 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d7ded41-7272-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:37:35 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso13123655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 06:37:35 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b004077219aed5sm16673519wmk.6.2023.10.24.06.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 06:37:34 -0700 (PDT)
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
X-Inumbo-ID: 7d7ded41-7272-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698154655; x=1698759455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9rxO3yi9gLObbLJi9rghTRfPCV/QR8/fM1S9i4WEuI=;
        b=j0jdOx67UYttN4NyBkNFwGBPjuS2HcHy+enVx7IgCvCeCGVuUmSh9UKqPyNnE29Ej9
         4PDM00U36/XzfT/9RketC04PpiQCqvGNGfS5Ggkwm8Kd9KRbCASV+tCb1/N4bkK1paw2
         74wtG3YOMUWcb6x12qg3+gX1W20q2uL3916JRiRoSCR9rO7LZOd3vxkayWbYkdHgftqY
         wiDv/b+fbyoZNccvR9x1rSRqHgAtFbUMSL42qNsXkD31Pj3sHvBpgMAVeJi/rPsdpncD
         qij4Ms+eAgOTGnNecOyPsCzZDx1lqrsltOzciwlqUdgIoSGk1i+z5tAWVaawW83VvvKx
         HBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154655; x=1698759455;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9rxO3yi9gLObbLJi9rghTRfPCV/QR8/fM1S9i4WEuI=;
        b=IsrDOC3Nbd0gM0x5v4PUvgv+vCgxrgSlaEH+nIygAzjfM9LVyl7QeMjFyy5pXvHE+r
         z2S/HtBhwtxnINiIaWwGUs3Y4/KUFo9PQ2q8cp2FaGlJjbTvj2iEzyWi/xUfqBY4KX4T
         psNhgPyotCDUfT0jq0QhRYc6TTj95HXOa/9TJ/ijFHDbtRcqYdgIHqclUFc4bcD8Em0F
         d7KGfwR3qLitqaKFAT2FknGBEfBLPwkH7W38Pufhi0vieAVC2YbkWXHjNvudJ2QXOF7+
         7WD+iVEeaa0CNIciAQo1pfrKe7Zpt+KYwQgT3r0+FSA0LhzYAsrr6TwZ9sU5ur2prkUT
         eX1A==
X-Gm-Message-State: AOJu0Yxtcw9VzfndXtsNXv3AneV48lLD8YldRg4zjt573nd12lTsRI+2
	Lmb42TgaryU2PGPO507A2/0=
X-Google-Smtp-Source: AGHT+IFCwR5Zipko4S5zjbV/abnJStyPGZ1/DwAYuPk2b3wwXjk/TEZ1ExZWj50RRXVedONgMthJkw==
X-Received: by 2002:a05:600c:4588:b0:409:7d0:d20b with SMTP id r8-20020a05600c458800b0040907d0d20bmr3231221wmo.24.1698154654600;
        Tue, 24 Oct 2023 06:37:34 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ea38b980-14dd-4442-96d4-699ee39a0d27@xen.org>
Date: Tue, 24 Oct 2023 14:37:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 06/12] hw/xen: add get_frontend_path() method to
 XenDeviceClass
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-7-dwmw2@infradead.org>
 <5ef43a7c-e535-496d-8a14-bccbadab3bc0@xen.org>
 <d43b900a6c7987c6832ceeede9b4c5ab65d5bacd.camel@infradead.org>
 <55bb6967-9499-45ef-b4c8-00fbfaccef0d@xen.org>
 <4d059cb96a92004fe25fdb140a6c0b12e91b4d7e.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <4d059cb96a92004fe25fdb140a6c0b12e91b4d7e.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/10/2023 14:29, David Woodhouse wrote:
> On Tue, 2023-10-24 at 13:59 +0100, Paul Durrant wrote:
>> On 24/10/2023 13:56, David Woodhouse wrote:
>>> On Tue, 2023-10-24 at 13:42 +0100, Paul Durrant wrote:
>>>>
>>>>> --- a/hw/xen/xen-bus.c
>>>>> +++ b/hw/xen/xen-bus.c
>>>>> @@ -711,8 +711,16 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
>>>>>      {
>>>>>          ERRP_GUARD();
>>>>>          XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
>>>>> +    XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
>>>>>      
>>>>> -    xendev->frontend_path = xen_device_get_frontend_path(xendev);
>>>>> +    if (xendev_class->get_frontend_path) {
>>>>> +        xendev->frontend_path = xendev_class->get_frontend_path(xendev, errp);
>>>>> +        if (!xendev->frontend_path) {
>>>>> +            return;
>>>>
>>>> I think you need to update errp here to note that you are failing to
>>>> create the frontend.
>>>
>>> If xendev_class->get_frontend_path returned NULL it will have filled in errp.
>>>
>>
>> Ok, but a prepend to say that a lack of path there means we skip
>> frontend creation seems reasonable?
> 
> No, it *is* returning an error. Perhaps I can make it
> 

I understand it is returning an error. I thought the point of the 
cascading error handling was to prepend text at each (meaningful) layer 
such that the eventual message conveyed what failed and also what the 
consequences of that failure were.

   Paul

>      if (!xendev->frontend_path) {
>          /*
>           * If the ->get_frontend_path() method returned NULL, it will
>           * already have set *errp accordingly. Return the error.
>           */
>          return /* false */;
>      }
> 
> 
>>> As a general rule (I'll be doing a bombing run on xen-bus once I get my
>>> patch queue down into single digits) we should never check 'if (*errp)'
>>> to check if a function had an error. It should *also* return a success
>>> or failure indication, and we should cope with errp being NULL.
>>>
>>
>> I'm pretty sure someone told me the exact opposite a few years back.
> 
> Then they were wrong :)


