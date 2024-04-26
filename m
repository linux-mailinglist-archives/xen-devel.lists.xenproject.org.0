Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A488B3755
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 14:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712773.1113611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Kps-0006Fx-Nq; Fri, 26 Apr 2024 12:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712773.1113611; Fri, 26 Apr 2024 12:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Kps-0006D3-K9; Fri, 26 Apr 2024 12:37:52 +0000
Received: by outflank-mailman (input) for mailman id 712773;
 Fri, 26 Apr 2024 12:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2iYl=L7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1s0Kpq-0006Cx-CK
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 12:37:50 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9d2f56a-03c9-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 14:37:49 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1e4f341330fso19385705ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 05:37:49 -0700 (PDT)
Received: from [157.82.202.162] ([157.82.202.162])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a17090320cc00b001eab1258197sm3094392plb.144.2024.04.26.05.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 05:37:47 -0700 (PDT)
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
X-Inumbo-ID: c9d2f56a-03c9-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1714135067; x=1714739867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84KvDHn/TfmhiUjTSsZnlfjC1UfE24BmSKedho87RP0=;
        b=WFrPJyzQB6lJse6Vz4loG/mPp8IkVE9xdfuvB4Ztpga6UZRkLW98ItB6EkF1AU0fP6
         ckUJW0V8y3W5OZvD52W8uLklkGqFJbEIEVbDI+L/AaMR4Zf4POiyhzQ+kOzyYbasaa+p
         PgDEUlHkasRdFpuOBi0DqjRUET0nora60KO54HFmnWJ4jU7yspAIO5xM33ZY3qw/AtVs
         BjkQj5on8m+1q8IAHapiZj+Eqqh/mrnJ7j6gIfmfUQLkEvDEfat85Eb+OIwsjWALD//w
         hQ9komngOREGu+q+kqjG1znhCvLRW5pkZ0htv7jLgGihg0jG7rnz9ebTRi904vwtX0so
         I9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714135067; x=1714739867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84KvDHn/TfmhiUjTSsZnlfjC1UfE24BmSKedho87RP0=;
        b=a7tKhg8bgqKpR/ow86Jg0mhQ4L4XnCGkWXakEg/H4BzOvZpUipEjPi61jXDjY9QyV6
         YH/P7kYGJ75KHy1WcO9zLcTrEZ4f4CrFvbHUTCtw2I8bkME0oatEUCVdDSbftTQpw8Np
         480AMk305//0S31oc9nIV4c2SRGsN0MvCO3DqZTw2e2SwxXHVb7ocpYhWPYy4XFJ29HN
         qPwjZ9dWxxJpMjjkdcfOOIVTGc07Dzk5Vu5aNEY2K5zFqbQ6lhzv4r03/TYQA0e/yyiO
         tgbBCb071PpQkX3erW5uXAJR7xiK2LGwqsRno6zjDhoGiLoQXN/8SYtNSbyI0ueuVQfC
         f6gg==
X-Forwarded-Encrypted: i=1; AJvYcCX4K72x+eFduwtKJQMC7v7KoHw2POIntRi6fpt0Fnu7ereNFzWUvdzKwAzx18Q+IllOZo51aHvuTLla2hY2eaDR3vC6wMlL2dPE17dgeS8=
X-Gm-Message-State: AOJu0YwlyCWXvTlaUzl0Tp4cJEzvIw0N/NP9dONrCRA8rX6ZR7cVOLuU
	Tk9kzptOjtDMj2OQn5lcx0d/CjQd0Bn+2CxbAkc7dbkx81xKFDqKhE8PWGKf+go=
X-Google-Smtp-Source: AGHT+IEyT5+5NC0mcxV26KEz5S9fudbXBjcluopxMfaMvGQxS0Dqj/XJD2ZWeXZVN6sWHZa68+NcyA==
X-Received: by 2002:a17:903:11c3:b0:1e5:5bd7:87a4 with SMTP id q3-20020a17090311c300b001e55bd787a4mr2751334plh.16.1714135067327;
        Fri, 26 Apr 2024 05:37:47 -0700 (PDT)
Message-ID: <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com>
Date: Fri, 26 Apr 2024 21:37:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
Content-Language: en-US
To: Thomas Huth <th.huth@posteo.de>, Prasad Pandit <pj.pandit@yahoo.in>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
 <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
 <1497808863.2030924.1713955286878@mail.yahoo.com>
 <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/04/24 21:32, Thomas Huth wrote:
> On 24/04/2024 12.41, Prasad Pandit wrote:
>> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe 
>> Mathieu-Daudé wrote:
>>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>>> Recently MemReentrancyGuard was added to DeviceState to record that the
>>>> device is engaging in I/O. The network device backend needs to 
>>>> update it
>>>> when delivering a packet to a device.
>>>> In preparation for such a change, add MemReentrancyGuard * as a
>>>> parameter of qemu_new_nic().
>>>
>>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>>> any clue?
>>
>> * CVE-2021-20255 bug: infinite recursion is pointing at a different 
>> fix patch.
>>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
>>
>> * And the this patch below has different issue tagged
>>    
>> -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>>    Fixes: CVE-2023-3019
>>
>>
>> * They look different, former is an infinite recursion issue and the 
>> latter is a use-after-free one.
> 
> I assume the eepro reentrancy issue has been fixed with:
> 
>   https://gitlab.com/qemu-project/qemu/-/issues/556
>   i.e.:
>   https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3

I agree. Commit c40ca2301c7603524eaddb5308a3 should be what fixed 
CVE-2021-20255, not this patch.

Regards,
Akihiko Odaki

