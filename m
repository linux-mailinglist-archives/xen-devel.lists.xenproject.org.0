Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D6981AEF6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 07:55:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658497.1027668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGCxh-00085J-D9; Thu, 21 Dec 2023 06:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658497.1027668; Thu, 21 Dec 2023 06:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGCxh-00082N-AT; Thu, 21 Dec 2023 06:55:17 +0000
Received: by outflank-mailman (input) for mailman id 658497;
 Thu, 21 Dec 2023 06:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGCxf-00082G-Ua
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 06:55:16 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c34997-9fcd-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 07:55:14 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-28bc20cb501so1188599a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 22:55:14 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a17090a840f00b0028bad9b220fsm954956pjn.37.2023.12.20.22.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 22:55:12 -0800 (PST)
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
X-Inumbo-ID: e3c34997-9fcd-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703141713; x=1703746513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLzY5PdrM7K/wmvGqA4vWKhQk+AYxpxkLmOBtyv7qaE=;
        b=rG4PKqO3F8y1hgHj0K7JZTdWKExBAFuz55xo1uFJ5s60x6t1wQffe7uwZs++zy402N
         L0+4zVcNW8Lu9xljHKhW0Yy+BNU6830077AdZOwYzfdvO8wx61yUg4nir40Y6SDflMjs
         M9LptbJ9mm7yZNb2jHML3yGBzUK5hL5suhb2cLxJQ5oNDiyU485GtaCuf7I9QMpwf/hu
         Og4GR6BIPoP/nuPczfMk43Z18Rm9ngQdlDUxyA0CINfBpYdjEuvE6wbcOzWdVxeMTGmk
         cZA2bM3qx8BUISt1fsgDJGieGvqNupEDp9cXFp2ObHf/DkcH+Nfn8okktvaKwIYcD24R
         kLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703141713; x=1703746513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLzY5PdrM7K/wmvGqA4vWKhQk+AYxpxkLmOBtyv7qaE=;
        b=R6XtnaqK73yaA6MtPVduRLzkAArJ1mcYA5K4uEq5xNlQn4kpLhzmXAw3R8jr02CACH
         f/UP/RhuKtzS9LLfYAL1YLV6NMZUlUi6yMLYMSIO2m3jNpjGMnrTOtElBSoFwlXSIuV+
         Mqfz0b+zakedEusc5xr5LouRS9k3cqrc1IHg7aLQS+EA3qopB5I3SCpEhzHO9Cp2cIQW
         or7mRrE2qcTevqjSgYZEFk0ELg1RO9LS7EPkzz7vfxiW2xAevY9IUzkyopmKfozPwFBB
         hTsieOXC+rQX4GpJqn2k0s+PRL9vNrJ/tc4NlI24VcK8h0o7Hq86ds/0ToKcHnufKA/G
         drwg==
X-Gm-Message-State: AOJu0YzWQdzqTQkzCUBrglEiN2pxGT5PNduZVdbMoqU0RK0HkF4cT/Rf
	GDVxM/yDyTFjf6htgqMvpT+MAw==
X-Google-Smtp-Source: AGHT+IEbwVl9Gzb6AFc1cuiyAWrCzGB+Iuh7dB4wVutX8k4xc8tuq+dN41LEMJ8tq7KTcYtz+FhJXg==
X-Received: by 2002:a17:90a:cb15:b0:28b:eed2:5990 with SMTP id z21-20020a17090acb1500b0028beed25990mr290395pjt.15.1703141712760;
        Wed, 20 Dec 2023 22:55:12 -0800 (PST)
Message-ID: <af89f683-2b6e-4ca1-aa37-8bedd12a781d@daynix.com>
Date: Thu, 21 Dec 2023 15:55:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] linux-headers: Update to kernel headers to add
 venus capset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-2-ray.huang@amd.com>
 <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com> <ZYGe4GcFPt0k5PTM@amd.com>
 <CAFEAcA_=iedJw4BbNHrDALC4mL4g3ZEihsDbLkEzsy-1zAWFWw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAFEAcA_=iedJw4BbNHrDALC4mL4g3ZEihsDbLkEzsy-1zAWFWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 23:14, Peter Maydell wrote:
> On Tue, 19 Dec 2023 at 13:49, Huang Rui <ray.huang@amd.com> wrote:
>>
>> On Tue, Dec 19, 2023 at 08:20:22PM +0800, Akihiko Odaki wrote:
>>> On 2023/12/19 16:53, Huang Rui wrote:
>>>> Sync up kernel headers to update venus macro till they are merged into
>>>> mainline.
>>>
>>> Thanks for sorting things out with the kernel and spec.
>>>
>>>>
>>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>>> ---
>>>>
>>>> Changes in v6:
>>>> - Venus capset is applied in kernel, so update it in qemu for future use.
>>>>
>>>> https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com/
>>>> https://cgit.freedesktop.org/drm-misc/commit/?id=216d86b9a430f3280e5b631c51e6fd1a7774cfa0
>>> Please include the link to the upstream commit in the commit message.
>>
>> So far, it's in drm maintainers' branch not in kernel mainline yet. Do I
>> need to wait it to be merged into kernel mainline?
> 
> For an RFC patchset, no. For patches to be merged into QEMU
> the headers change must be in the kernel mainline, and the
> QEMU commit that updates our copy of the headers must be a
> full-sync done with scripts/update-linux-headers.sh, not a
> manual edit.

Apparently the kernel change is unlikely to be merged to mainline before 
QEMU 9.0 so we need to come up with some idea to deal with this.

The release of Linux 6.7 is near and the development of 6.8 will start 
soon. So it was nice if the change made into 6.8, but unfortunately it 
missed the *probably last* drm-misc tree pull request for 6.8:
https://lore.kernel.org/all/aqpn5miejmkks7pbcfex7b6u63uwsruywxsnr3x5ljs45qatin@nbkkej2elk46/

It will still get into linux-next so we may retrieve headers from 
linux-next. Or we may add the definition to 
hw/display/virtio-gpu-virgl.c; the duplicate definition warning will 
tell when the definition becomes no longer necessary. I'm fine with 
either option.

Regards,
Akihiko Odaki

