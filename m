Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D08287F8
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 15:24:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664660.1034736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rND1b-0004hG-FW; Tue, 09 Jan 2024 14:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664660.1034736; Tue, 09 Jan 2024 14:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rND1b-0004e8-Ck; Tue, 09 Jan 2024 14:24:15 +0000
Received: by outflank-mailman (input) for mailman id 664660;
 Tue, 09 Jan 2024 14:24:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a1E1=IT=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1rND1Z-0004d3-Mj
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 14:24:13 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2f9c68c-aefa-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 15:24:13 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so2890514e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 06:24:13 -0800 (PST)
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
X-Inumbo-ID: c2f9c68c-aefa-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704810253; x=1705415053; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/fxIqo+g5WwjavjYufA4hFi1cRbz34uO2PZEzQMCek=;
        b=bC2CpYFmShzcPmQtX0nQXKm5fumRkOUaFwiw16sVdsN+wKl/uSyaBeMt4+yO7zyZIp
         tj/+CQ81P8RTDWRRuUB7C7EtOkD9mXpg4iTAqysk2ZqUl5JWyeiX4tB8LbuEbx1O+Jko
         rLK8BbmHsE8Jyg+ksbx4kS1vHeLf6D/CfMeNo01eGYy360yV1lOI7dWDmQB99bDni72E
         hxgh/67atKQsy74fhvJXCD6RUi7/eqHTfbb2XO7Bp+iKnDEzmFVHePlM8J2SNgpfXS1g
         xScco2qtoNzMAgbfnc4FgwNy97leQY37V4O2LEUgbUV8EjozIesbz8PU9RvGxaLAnbmK
         FJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810253; x=1705415053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/fxIqo+g5WwjavjYufA4hFi1cRbz34uO2PZEzQMCek=;
        b=DUHTplSN7itJtmsZfSbs/ZfgYNbUwV8ms3dVZujGC3hlxsPK2yA5yYTHV1Vk6HzcaM
         lmuFtOnYvzw7TS26DEp0Rc/GBhZB5yaeUR/hkOm0F7xm1va9MpEPCn37dPPcXOURN/w/
         BafNZTG3fuJ2Wq3+dxtJHvQuOAp6gUFZW7Oo2Iwn69TPT/FYFS6GoCFLPacJ4GQr3D4T
         oECQCXYJ8ZvYhffjotiiXm0U6EfCZPYZmWeUN+64n76/74EfseZXKCuppKeHkzUmi4WI
         Gx/MXT8pbjLQcEPzaANYxllaKlNs1ZQfnOZUfuAjkGaKQ+c3BEKopwCArFmCRED2qfPa
         d9PQ==
X-Gm-Message-State: AOJu0YyWxmCP+6QLD9TIq30DIgxjWG616vRuNLqPu/ZfbtoXt1VOyOp+
	G+yoj57KKpO9xwzldeRnc1UJPHsXVMPqg+zaZEsrnm+WRVwSmg==
X-Google-Smtp-Source: AGHT+IFrVXvHsq1m1peP2eO+e72Pz8YdISUp+RIUUAo1aE+Zj9tZO0OThcNuGgpWww0VuL5fmq96NN7TJ2JIvwtuWz4=
X-Received: by 2002:a05:6512:2001:b0:50e:a923:4bb with SMTP id
 a1-20020a056512200100b0050ea92304bbmr1442148lfb.133.1704810252732; Tue, 09
 Jan 2024 06:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20240108163735.254732-1-stefanha@redhat.com>
In-Reply-To: <20240108163735.254732-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2024 14:24:01 +0000
Message-ID: <CAFEAcA_RYdGZRxOAD43phmj0WmHTbU01tiNTmC8CxHF2cpb6DQ@mail.gmail.com>
Subject: Re: [PULL 0/6] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org, 
	Alistair Francis <alistair.francis@wdc.com>, Max Filippov <jcmvbkbc@gmail.com>, kvm@vger.kernel.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, Jiri Slaby <jslaby@suse.cz>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Eric Blake <eblake@redhat.com>, Paul Durrant <paul@xen.org>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Kevin Wolf <kwolf@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, 
	Weiwei Li <liwei1518@gmail.com>, qemu-ppc@nongnu.org, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Song Gao <gaosong@loongson.cn>, Aurelien Jarno <aurelien@aurel32.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexander Graf <agraf@csgraf.de>, 
	Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
	Harsh Prateek Bora <harshpb@linux.ibm.com>, Hailiang Zhang <zhanghailiang@xfusion.com>, 
	Hyman Huang <yong.huang@smartx.com>, Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, David Gibson <david@gibson.dropbear.id.au>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, David Woodhouse <dwmw2@infradead.org>, 
	Cameron Esfahani <dirty@apple.com>, Eric Farman <farman@linux.ibm.com>, Jason Wang <jasowang@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Hanna Reitz <hreitz@redhat.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Jagannathan Raman <jag.raman@oracle.com>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Bin Meng <bin.meng@windriver.com>, 
	Fabiano Rosas <farosas@suse.de>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jan 2024 at 16:37, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit ffd454c67e38cc6df792733ebc5d967eee28ac=
0d:
>
>   Merge tag 'pull-vfio-20240107' of https://github.com/legoater/qemu into=
 staging (2024-01-08 10:28:42 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 0b2675c473f68f13bc5ca1dd1c43ce421542e7b8:
>
>   Rename "QEMU global mutex" to "BQL" in comments and docs (2024-01-08 10=
:45:43 -0500)
>
> ----------------------------------------------------------------
> Pull request
>
> ----------------------------------------------------------------
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   iothread: Remove unused Error** argument in aio_context_set_aio_params
>
> Stefan Hajnoczi (5):
>   system/cpus: rename qemu_mutex_lock_iothread() to bql_lock()
>   qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to BQL_LOCK_GUARD
>   qemu/main-loop: rename qemu_cond_wait_iothread() to
>     qemu_cond_wait_bql()
>   Replace "iothread lock" with "BQL" in comments
>   Rename "QEMU global mutex" to "BQL" in comments and docs


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.0
for any user-visible changes.

-- PMM

