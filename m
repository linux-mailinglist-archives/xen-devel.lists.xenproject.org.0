Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D9821A35
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 11:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660638.1030180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKcEf-0001je-0o; Tue, 02 Jan 2024 10:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660638.1030180; Tue, 02 Jan 2024 10:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKcEe-0001gz-UP; Tue, 02 Jan 2024 10:43:00 +0000
Received: by outflank-mailman (input) for mailman id 660638;
 Tue, 02 Jan 2024 10:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGpE=IM=gmail.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1rKcEd-0001fi-GY
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 10:42:59 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0b07097-a95b-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 11:42:57 +0100 (CET)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-42828505b96so3932051cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 02:42:57 -0800 (PST)
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
X-Inumbo-ID: b0b07097-a95b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704192176; x=1704796976; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTlbJfG49FXk96s4oJ9RThaa8t9INNDD3eL8LRERVLc=;
        b=E4dCvyaNjBs95xkexHl2map3UboEQNY601dp+vNO0TXoy29k4sW+VyLxsT0yWIgHZR
         NwPIF1trVp+brTKpvVMXyTSwqx4d5h4bhHITOHUJP3P5CYGvUuV1wW9HwESdNbDYH4cs
         aTl3UGJK2TvokvbUQdMwRWYF9D2ZgcfggVtCr/uYGLlDI1KTpxEmq+nagROU6mgzkfHV
         eXV4aloE/tTzQeqwGIytHabhm2z8Af9r+eu7xihoLZWBtemdnYC0ixA/o7IOi2EO8MLK
         hlfCLJtlfE0YMKXNFufiPgnoF28j41vH//YG+3l4zDpZsQ6+x3W1/GfVXtHs2LI5zfwB
         KeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704192176; x=1704796976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTlbJfG49FXk96s4oJ9RThaa8t9INNDD3eL8LRERVLc=;
        b=CxfxH8OcbhyMdQwdpvzWNDZXsT0+s7paxLej0iUpdb0tQeTb4k1w35oTPshmUILkCG
         OYRSX9pQSxhoXGSpXOJLqajUf0EqG1sjSQESub92hDNe2UyoF3jQtFHeMfCRQlSXGKdr
         t+c/ft9WzWCrs4s+toCddO8bJmbvW7rWsVUp8S9JF7W8QWzAcDnaN/IL4EZ+v9fY3ZCu
         8gu7++r4nRC3bv0FJjJcU2cHV30ouDQV7cE97cenVZud2SFwqYLZcn1lx8SXMJv4Ixi9
         oin1tR0ChCNCcLFNqtrBDF5ep3Kc7ndcegPN8I2w+d9kZ/J6Dpcmwix4J3EfwYAOygWk
         Rl4A==
X-Gm-Message-State: AOJu0YyIYik+Os0mQVCmMcngE/ykqNiUlHNbAHPMucBqAbXqu7CXpbqH
	0wVAnaKVo9cefdxpLlTde5B1dWR9Fku1i3T6C68=
X-Google-Smtp-Source: AGHT+IG+dGscGnQcQ2gYtf0pCV3DKsQ9eE3HvQS3itcI+yz2wtXVsk/iLEAUfGLvkZme1TcR2oyjULRqJRtAhKJddTM=
X-Received: by 2002:a05:622a:1646:b0:427:860c:40b2 with SMTP id
 y6-20020a05622a164600b00427860c40b2mr21410322qtj.49.1704192176122; Tue, 02
 Jan 2024 02:42:56 -0800 (PST)
MIME-Version: 1.0
References: <20231219075320.165227-1-ray.huang@amd.com> <20231219075320.165227-2-ray.huang@amd.com>
 <6adff6d2-7c58-4c78-93a5-5a4594a60d27@daynix.com> <ZYGe4GcFPt0k5PTM@amd.com>
 <CAFEAcA_=iedJw4BbNHrDALC4mL4g3ZEihsDbLkEzsy-1zAWFWw@mail.gmail.com> <af89f683-2b6e-4ca1-aa37-8bedd12a781d@daynix.com>
In-Reply-To: <af89f683-2b6e-4ca1-aa37-8bedd12a781d@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 2 Jan 2024 14:42:44 +0400
Message-ID: <CAJ+F1CJnanuw_VQ0DDwUMfRjwHwQAZ3yif4FANcKVHMZXH3dyg@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] linux-headers: Update to kernel headers to add
 venus capset
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Huang Rui <ray.huang@amd.com>, 
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
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 21, 2023 at 10:55=E2=80=AFAM Akihiko Odaki <akihiko.odaki@dayni=
x.com> wrote:
>
> On 2023/12/19 23:14, Peter Maydell wrote:
> > On Tue, 19 Dec 2023 at 13:49, Huang Rui <ray.huang@amd.com> wrote:
> >>
> >> On Tue, Dec 19, 2023 at 08:20:22PM +0800, Akihiko Odaki wrote:
> >>> On 2023/12/19 16:53, Huang Rui wrote:
> >>>> Sync up kernel headers to update venus macro till they are merged in=
to
> >>>> mainline.
> >>>
> >>> Thanks for sorting things out with the kernel and spec.
> >>>
> >>>>
> >>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >>>> ---
> >>>>
> >>>> Changes in v6:
> >>>> - Venus capset is applied in kernel, so update it in qemu for future=
 use.
> >>>>
> >>>> https://lore.kernel.org/lkml/b79dcf75-c9e8-490e-644f-3b97d95f7397@co=
llabora.com/
> >>>> https://cgit.freedesktop.org/drm-misc/commit/?id=3D216d86b9a430f3280=
e5b631c51e6fd1a7774cfa0
> >>> Please include the link to the upstream commit in the commit message.
> >>
> >> So far, it's in drm maintainers' branch not in kernel mainline yet. Do=
 I
> >> need to wait it to be merged into kernel mainline?
> >
> > For an RFC patchset, no. For patches to be merged into QEMU
> > the headers change must be in the kernel mainline, and the
> > QEMU commit that updates our copy of the headers must be a
> > full-sync done with scripts/update-linux-headers.sh, not a
> > manual edit.
>
> Apparently the kernel change is unlikely to be merged to mainline before
> QEMU 9.0 so we need to come up with some idea to deal with this.
>
> The release of Linux 6.7 is near and the development of 6.8 will start
> soon. So it was nice if the change made into 6.8, but unfortunately it
> missed the *probably last* drm-misc tree pull request for 6.8:
> https://lore.kernel.org/all/aqpn5miejmkks7pbcfex7b6u63uwsruywxsnr3x5ljs45=
qatin@nbkkej2elk46/
>
> It will still get into linux-next so we may retrieve headers from
> linux-next. Or we may add the definition to
> hw/display/virtio-gpu-virgl.c; the duplicate definition warning will
> tell when the definition becomes no longer necessary. I'm fine with
> either option.

The second option seems better to me, as it can avoid pulling unwanted chan=
ges.

thanks

--=20
Marc-Andr=C3=A9 Lureau

