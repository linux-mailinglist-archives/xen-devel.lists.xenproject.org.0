Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481787D913
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 07:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694155.1083081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlNh6-0007gx-H4; Sat, 16 Mar 2024 06:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694155.1083081; Sat, 16 Mar 2024 06:39:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlNh6-0007ez-EQ; Sat, 16 Mar 2024 06:39:00 +0000
Received: by outflank-mailman (input) for mailman id 694155;
 Sat, 16 Mar 2024 06:38:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rp5O=KW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rlNh5-0007et-1F
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 06:38:59 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd9e848d-e35f-11ee-afdd-a90da7624cb6;
 Sat, 16 Mar 2024 07:38:57 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so392098866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 23:38:57 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 dl19-20020a170907945300b00a44b90abb1dsm2388520ejc.110.2024.03.15.23.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 23:38:56 -0700 (PDT)
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
X-Inumbo-ID: dd9e848d-e35f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710571137; x=1711175937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dibU6A4pQqcGS1XBDohuVXartAdYLZDKoYkxrmE8mQI=;
        b=QlVFIVMlwV1+6wvvgqRWiyLyGioqVxrwC0B9Tlngc+iaiopp+87RbluHHQ2pHAuvdw
         0YNAw1iwb2pKB1LIGJKiCI7rFE+bqWdYDmIj7SYYJp4k7KmFQkHCvg+J1cQ9eEDskfVk
         qxrKZGzBhC9gQo/STY+g9TtpAtrB21WLHCNb2E2uET/J7JjpdeY64mZ14VPzrhfhUTgV
         MbfNDJz6k7O0HmUhSOOJWjae2FSMGzBJ9BZxkd71idtxegKxEUuBtppmX28yutPqQUcW
         4k8915yU3eeSvJQDyQF+CkeQaBLAJHXERnvYArRD5ldTEfXBZjTf7CnPzo5kCOKIc37z
         Ay6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710571137; x=1711175937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dibU6A4pQqcGS1XBDohuVXartAdYLZDKoYkxrmE8mQI=;
        b=TxQBh0WdjrshEe2IE47X48euPbu29oQZLwum+Vu0b+Bq/6o0PMu0ADNScQpp2ocG7G
         S3eb55sZAiJh8FHtp0FSlM5lSvJB7tRuQxV12B0Bk+yUjwo8YfX6C4dKRUHvh/EAfoYH
         07nFkAHYcC3pY/djTw2Qa3a259SoNa96ZBVq71cUXxfsp4L6GB1N0Q+bjj3ENlIxK7a0
         JsXWCi0qj0chun1xmNGjcWQjzFYf9SjZzv04or9OnawOrXmiqeAa3H8aEwdcsC1ikE2s
         hobe6uI/jNwH+dCbYX7oQ8r6cyZxSfYFNGeb25Xh20fK3NneEJ+63bPiN0TjbGreLWIU
         Nhyw==
X-Forwarded-Encrypted: i=1; AJvYcCUwdrUAVu3riIvpJq0mN4PhdbFa7s59c8b0UmXYtxpNh9PK6dj1yEhzuvEiP2jzc5jEQxLM3nEftR6K4Z5HhzblaMQ4vYob4W/HOxotRBc=
X-Gm-Message-State: AOJu0Yw4BbHjf4+O7wmvwruasWjFXPXnZ8eCAug7qIZ7tECNWI1+RgD4
	icSvCDq4ecqiU5oKFkYCs99vRDQYzOmbd/0AEdHy3kP2jh1OkSVLxS2P/jLRvIs=
X-Google-Smtp-Source: AGHT+IGiwv3UFvsYek5BnhkOJtbU7oB70fzMMpUd6kK0qN+U5vhqbtNhtI6UyLcDMtLfMCYPz8DJTA==
X-Received: by 2002:a17:907:7a93:b0:a46:74fe:904f with SMTP id mm19-20020a1709077a9300b00a4674fe904fmr4362642ejc.26.1710571136966;
        Fri, 15 Mar 2024 23:38:56 -0700 (PDT)
Message-ID: <77b77bf7-f7ae-4f74-976a-9a591be1997f@suse.com>
Date: Sat, 16 Mar 2024 07:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IMPORTANT - : Need help on USB port virtualization with Xen
 hypervisor
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 LARRIEU Dominique <dominique.larrieu@thalesgroup.com>
Cc: Julien Grall <julien@xen.org>,
 GOURLOT Francois <francois.gourlot@thalesgroup.com>,
 GRUO Nicolas <nicolas-n.gruo@thalesgroup.com>,
 Cc <xen-devel@lists.xenproject.org>, Kelly Choi <kelly.choi@cloud.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 WILLEMS Louis <louis.willems@thalesgroup.com>, vikram.garhwal@amd.com,
 Edgar.Iglesias@amd.com
References: <d2de4ae9ecb34efc962dea7f8b4e7cbd@thalesgroup.com>
 <bb2485e5-7818-435b-8d9c-dda88100979f@xen.org>
 <a46ac2e14fa2410eafc26a37a00a442f@thalesgroup.com>
 <427d2ecb865648b7a459c592c208c0be@thalesgroup.com>
 <673b2bc630d748e8af0a15d4b553906e@thalesgroup.com>
 <3ee3659afff645cabed86bcc22c44686@thalesgroup.com>
 <4778822e-582f-4e0d-9933-86d8d49ea3a5@xen.org>
 <8f2a2bbaf29e41709eeab695efe48f17@thalesgroup.com>
 <acf5d91425f34721b496cd49f3883ac9@thalesgroup.com>
 <2e53bd839f904d8a97ee5645ee9e9361@thalesgroup.com>
 <alpine.DEB.2.22.394.2403151558480.853156@ubuntu-linux-20-04-desktop>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2403151558480.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.03.24 00:32, Stefano Stabellini wrote:
> Hi Dominique,
> 
> You posted this configuration:
> 
> device_model_args = [ "
>                        "-device","nec-usb-xhci,id=xhci",
>                        "-device","usb-host,bus=xhci.0,hostbus=1,hostport=13",
>                        "-device","usb-host,bus=xhci.0,hostbus=1,hostport=10",
>                        "-device","usb-host,bus=xhci.0,hostbus=1,hostport=2",
>                        "-device","usb-host,bus=xhci.0,hostbus=2,hostport=2",
>                        "-device","usb-host,bus=xhci.0,hostbus=2,hostport=1",
>                        "-device","usb-host,bus=xhci.0,hostbus=1,hostport=1"]
> 
> It looks like you are using QEMU-based USB passthrough. Basically QEMU
> (independently from Xen) is accessing the USB device in Dom0 and
> exposing a corresponding device to the guest. I am not sure if there is
> anything that can be done in QEMU to support USB 3.0 with high speed,
> people in CC might know.
> 
> There two other alternatives to this approach. You can use PV USB
> Passthrough instead. Juergen (CCed) is the original author. I am not
> sure if that supports USB 3.0 either.

PV USB doesn't support USB 3.0.

Instead of using device_model_args= in the guest configuration I'd rather
use the usbctrl= and usbdev= items (see the related xl.cfg(5) man page).
I'm not sure this will really make a performance difference, though.


Juergen


