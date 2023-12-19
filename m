Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1D818989
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656865.1025369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFarr-0005c0-So; Tue, 19 Dec 2023 14:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656865.1025369; Tue, 19 Dec 2023 14:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFarr-0005Yy-PD; Tue, 19 Dec 2023 14:14:43 +0000
Received: by outflank-mailman (input) for mailman id 656865;
 Tue, 19 Dec 2023 14:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzmM=H6=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1rFarq-0005Ys-J8
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:14:42 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f30a621e-9e78-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 15:14:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-553a45208ffso801207a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:14:40 -0800 (PST)
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
X-Inumbo-ID: f30a621e-9e78-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702995280; x=1703600080; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrVQU/xjd9KQVh7NuWIHyvOYXWE/j1hmbmx4pHhV9I=;
        b=tI39A8Z8vVcz/87YRc2sWjAHA5EbpCNlO7eDaBJ5QsbbZjCq90om8sm4ngPnw5KoSv
         PWcZdhY2xgQZ2nfZMztx6mX50IJzimsZRkMpkA3riujv1VBQMFgltVwdvqB9mywMMGpu
         +qFusZswmw2cWhot2FxtRp8ovqTXnq6OpoMhOT4tOUosjZAhIuSDoYv5GI1ti0dxfGn/
         S+G3SsNPowwqZikoexHFisQtTLzEiY0vCbqbuCYob753tmBeP2zi3RsCdN9PxaAkmb5P
         jEAt1y7vGoRxhdjW423ms0MZj8bvg5VnqXUDaEM1eKinI6LwQTxlKGIhgACvQCIbqHIV
         bIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702995280; x=1703600080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZrVQU/xjd9KQVh7NuWIHyvOYXWE/j1hmbmx4pHhV9I=;
        b=BUQRmrWS1rO0YevWSkVxCTlWNt/nZme2vNWK0L8js/CW5BLQEHaoegpcr9GHq48y1a
         eifxLH7e9b1ng6/U5PAX7x2UmkeFsGKoKxABtg4oC6fPins9s2djPF/DEqEDJ44WuPXF
         nYvQerabjzseBqGgCOw035ljrbxMpaDF7qDbCzTrBjitjf06QV9evnt9+7VXCw/zxxD9
         PSaHRb+3hPZhjeBv7K2966osA5xjvl/wA+SdvuscqWv1fT436NxxnpWnDiLvd/bJJiUu
         JtcslJ8G3+7Ya40fldOL0qTD44URnCLiB1Orr1iNrUveTPMGbPPmZeXYB+C/7Ge3SmdK
         Ybcg==
X-Gm-Message-State: AOJu0YzxerC7fQclBRoviDBoE84yzMchwl5+KoL3IdZumEi9ztbRlk5s
	lE0/HoWmJDTh85LGeCBzrkJsai9kgQFhrc6Q/uOuOw==
X-Google-Smtp-Source: AGHT+IFoIAEbqofqhy4721zESdE0+CFNnJQliL+b/I13sftgzhzrNkoJ6Q+Mhi/PaWdAQPcN0Xxyu+UY1l2GSHt5eBE=
X-Received: by 2002:a50:c082:0:b0:552:e74b:6412 with SMTP id
 k2-20020a50c082000000b00552e74b6412mr1850187edf.10.1702995280123; Tue, 19 Dec
 2023 06:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20231219075320.165227-1-ray.huang@amd.com> <20231219075320.165227-2-ray.huang@amd.com>
 <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com> <ZYGe4GcFPt0k5PTM@amd.com>
In-Reply-To: <ZYGe4GcFPt0k5PTM@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Dec 2023 14:14:28 +0000
Message-ID: <CAFEAcA_=iedJw4BbNHrDALC4mL4g3ZEihsDbLkEzsy-1zAWFWw@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] linux-headers: Update to kernel headers to add
 venus capset
To: Huang Rui <ray.huang@amd.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Antonio Caggiano <quic_acaggian@quicinc.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	Robert Beckett <bob.beckett@collabora.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, "ernunes@redhat.com" <ernunes@redhat.com>, 
	Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, 
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
	"Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>, 
	"Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang, Julia" <Julia.Zhang@amd.com>, 
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Dec 2023 at 13:49, Huang Rui <ray.huang@amd.com> wrote:
>
> On Tue, Dec 19, 2023 at 08:20:22PM +0800, Akihiko Odaki wrote:
> > On 2023/12/19 16:53, Huang Rui wrote:
> > > Sync up kernel headers to update venus macro till they are merged into
> > > mainline.
> >
> > Thanks for sorting things out with the kernel and spec.
> >
> > >
> > > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > > ---
> > >
> > > Changes in v6:
> > > - Venus capset is applied in kernel, so update it in qemu for future use.
> > >
> > > https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@collabora.com/
> > > https://cgit.freedesktop.org/drm-misc/commit/?id=216d86b9a430f3280e5b631c51e6fd1a7774cfa0
> > Please include the link to the upstream commit in the commit message.
>
> So far, it's in drm maintainers' branch not in kernel mainline yet. Do I
> need to wait it to be merged into kernel mainline?

For an RFC patchset, no. For patches to be merged into QEMU
the headers change must be in the kernel mainline, and the
QEMU commit that updates our copy of the headers must be a
full-sync done with scripts/update-linux-headers.sh, not a
manual edit.

thanks
-- PMM

