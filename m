Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FC27D5083
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621927.968870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvH06-0006zW-4a; Tue, 24 Oct 2023 12:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621927.968870; Tue, 24 Oct 2023 12:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvH06-0006xC-1Y; Tue, 24 Oct 2023 12:59:14 +0000
Received: by outflank-mailman (input) for mailman id 621927;
 Tue, 24 Oct 2023 12:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvH04-0006m9-J4
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:59:12 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe6edaf-726d-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 14:59:10 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40906fc54fdso12821085e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 05:59:10 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b004054dcbf92asm11888555wmb.20.2023.10.24.05.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 05:59:08 -0700 (PDT)
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
X-Inumbo-ID: 1fe6edaf-726d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698152350; x=1698757150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fv2AY0PfohaOR9XcU+8ZQ81rKPOWLOMFyddNbcLYLA=;
        b=A58cjce9fVpWaUY2H+czZk7Is12WgZcKBNmpnwdyveZPQJ3sMNPOrnH6rMCRsFWKbI
         D+HjacrsXvM8bb1icSXkmrdQP30roKvmPvks4ctPCTRxP8iOLqAdYke4aA1tVbLwdLvs
         tTU1/ke+6RXk7acXz6XsKNHsvcsmdKX2OUYKE4xs3ayiB0Ko3l7hPi8XZiGi5SYVIwhD
         HfXBaUsSnDuS0WOJGzHdMb6BLfdJ+U6As9G9TithHaLI2g0Ea8793yX/2d7Nk2gLJE9h
         BIH/ktcIe9UZfjDbjlfUYiQXBT0Rw5nftOY7dSGRjujRQwHWspA+64MiZXAL1NO2+YTu
         vEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698152350; x=1698757150;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fv2AY0PfohaOR9XcU+8ZQ81rKPOWLOMFyddNbcLYLA=;
        b=iygf1rJqeH/Oxqlo19pIGf0dtKiOBd3GzwNNXjUbvZtM9bf0/f1XRjuIDFNj83vZHg
         GzEYmS+nDkN6y0X4z196KyuUNiF8Vdt8H2Ih/QPcjsjU6UCGfKrWHoqMJrKhDfLqEE+p
         aC3zjNManclizYHSGGvRor8yxC9txcTFagEIwaJ8c9pR9S7qZfkpn9ltNDSfmNWDwQ1B
         h5PsuvByUxpxaSbPk3mNghrKYG339raTFDMjR9x2f72CVLKX5RdIPDIBSey0N1rBcjYW
         uFz9SV+uJo0UTQ0YxJGpPm5Odo0WfIkV9q2/hwRsky/Ky9EPOq9BTHhZ4xEKibaz4iX5
         NdlA==
X-Gm-Message-State: AOJu0YwlJfyzy04ZzR9Owtlxe+ifK4lbIKmHnNSWSuKQzFGZ727Hgmv7
	gGk2loSuT5I8C1/syux1yHI=
X-Google-Smtp-Source: AGHT+IHO2khmsIcOqOzMGxdA5Ej9PMASd96m2EkszFQX+E0xL93HsityPlswigSIsmJsJG7LwrKmlw==
X-Received: by 2002:a05:600c:5252:b0:408:389d:c22e with SMTP id fc18-20020a05600c525200b00408389dc22emr9189363wmb.25.1698152350138;
        Tue, 24 Oct 2023 05:59:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <55bb6967-9499-45ef-b4c8-00fbfaccef0d@xen.org>
Date: Tue, 24 Oct 2023 13:59:07 +0100
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
Organization: Xen Project
In-Reply-To: <d43b900a6c7987c6832ceeede9b4c5ab65d5bacd.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/10/2023 13:56, David Woodhouse wrote:
> On Tue, 2023-10-24 at 13:42 +0100, Paul Durrant wrote:
>>
>>> --- a/hw/xen/xen-bus.c
>>> +++ b/hw/xen/xen-bus.c
>>> @@ -711,8 +711,16 @@ static void xen_device_frontend_create(XenDevice *xendev, Error **errp)
>>>     {
>>>         ERRP_GUARD();
>>>         XenBus *xenbus = XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
>>> +    XenDeviceClass *xendev_class = XEN_DEVICE_GET_CLASS(xendev);
>>>     
>>> -    xendev->frontend_path = xen_device_get_frontend_path(xendev);
>>> +    if (xendev_class->get_frontend_path) {
>>> +        xendev->frontend_path = xendev_class->get_frontend_path(xendev, errp);
>>> +        if (!xendev->frontend_path) {
>>> +            return;
>>
>> I think you need to update errp here to note that you are failing to
>> create the frontend.
> 
> If xendev_class->get_frontend_path returned NULL it will have filled in errp.
> 

Ok, but a prepend to say that a lack of path there means we skip 
frontend creation seems reasonable?

> As a general rule (I'll be doing a bombing run on xen-bus once I get my
> patch queue down into single digits) we should never check 'if (*errp)'
> to check if a function had an error. It should *also* return a success
> or failure indication, and we should cope with errp being NULL.
> 

I'm pretty sure someone told me the exact opposite a few years back.

   Paul

