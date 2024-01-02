Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22A82234D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 22:37:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660866.1030522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKmRr-000296-0x; Tue, 02 Jan 2024 21:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660866.1030522; Tue, 02 Jan 2024 21:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKmRq-00026y-UM; Tue, 02 Jan 2024 21:37:18 +0000
Received: by outflank-mailman (input) for mailman id 660866;
 Tue, 02 Jan 2024 21:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwBk=IM=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1rKmRp-00026n-SN
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 21:37:17 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18ccf019-a9b7-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 22:37:15 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3367601a301so9586896f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 13:37:15 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-091-072.89.14.pool.telefonica.de.
 [89.14.91.72]) by smtp.gmail.com with ESMTPSA id
 p34-20020a05600c1da200b0040d8b4ebd55sm252596wms.0.2024.01.02.13.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 13:37:14 -0800 (PST)
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
X-Inumbo-ID: 18ccf019-a9b7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704231435; x=1704836235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
        b=gFH2EDqpSGxAYr7aZ2Oi3Xw7WftiluMIQEY3cu3akD6P0KRkduWDLZHEblbaWJYV8n
         wnlFS+e8c7vNUWnUufahnWXvxNd3DpCYuLzc18Ti6LMygDrXiFqx6zNvvoQcL+eDwm6w
         7Eiaf3yjXhGa0Rs3jODVa8TxZBV166Y/Py9wU5AxvYl3nLWZ+w5e0LszrDHlqv1288j/
         wku+AezAagAXZ5xcKgIyZcfG/ieFbRc4IdIx+S1Rj2LupW/eUFwS2WEJr0aQHTV2wntZ
         PcJkvWZ/Ff2kgrFeGtmy8oRASDJY6V0qE87HAR0/1iv0Lem3z2P/a16/qz2M+ooYfwGz
         kCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704231435; x=1704836235;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/j7/rdcZmoVQjecAI6/HxXOPJUcRBJCUvX9qQzCAcW8=;
        b=Z1g8dRwlMaOg3Rt89sLW6fGKNpnMMY2Wm0qwGfN3Ric4H2tOXvFY7tNiQ+T2N0etdB
         QbOj5eOk3jv5YoIgMBmpIMrIG95z5uMYFGlGJxYRXLmeAoz1xFcnyBzeKLViflQ7Hxx7
         RPO64SX99Jzk3iCmsyKIvcZAXlhmiDKKaGWbXGiLSCP2W7zMJPf2nT9q8Zg1PQ02qSHp
         NPh9pn5xdBIO6p1tfxsYN7sG0BkILXMkBimraZxNeHnytI9tpDKgmQN0az2dV0Bl2qGP
         IC00binP7NcOHS+FhX6U+I+MfK4XH8uWHHgPT7ItY/Vgd00B8KhOUs2//JHFMWdTJZUm
         nRWQ==
X-Gm-Message-State: AOJu0YwMYGms6o0XIIKHKhAJ+jcmE7lOgV5c7jnJ4UyC8p7cH1jiL86u
	IzUbb8f2cLfS/5ZCz6EmD/Y=
X-Google-Smtp-Source: AGHT+IFrz+8G4XaufDC1u0mAfvhOGqc3F19J3DroZasFggdJGsufr8PGV5ZiaTqLN5DOoVoj9N8dAg==
X-Received: by 2002:a7b:ce13:0:b0:40d:6f34:5c13 with SMTP id m19-20020a7bce13000000b0040d6f345c13mr2971570wmc.231.1704231434891;
        Tue, 02 Jan 2024 13:37:14 -0800 (PST)
Date: Tue, 02 Jan 2024 21:37:00 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paul Durrant <paul@xen.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander Graf <agraf@csgraf.de>, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Fam Zheng <fam@euphon.net>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Leonardo Bras <leobras@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liwei1518@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Stafford Horne <shorne@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Eric Blake <eblake@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Halil Pasic <pasic@linux.ibm.com>,
 xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/5=5D_system/cpus=3A_rename_?= =?US-ASCII?Q?qemu=5Fmutex=5Flock=5Fiothread=28=29_to_bql=5Flock=28=29?=
In-Reply-To: <20231212153905.631119-2-stefanha@redhat.com>
References: <20231212153905.631119-1-stefanha@redhat.com> <20231212153905.631119-2-stefanha@redhat.com>
Message-ID: <CFD7EE4A-D216-4CE8-B963-0CCEEA623E53@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 12=2E Dezember 2023 15:39:00 UTC schrieb Stefan Hajnoczi <stefanha@redh=
at=2Ecom>:
>The Big QEMU Lock (BQL) has many names and they are confusing=2E The
>actual QemuMutex variable is called qemu_global_mutex but it's commonly
>referred to as the BQL in discussions and some code comments=2E The
>locking APIs, however, are called qemu_mutex_lock_iothread() and
>qemu_mutex_unlock_iothread()=2E
>
>The "iothread" name is historic and comes from when the main thread was
>split into into KVM vcpu threads and the "iothread" (now called the main

Duplicate "into" here=2E

>loop thread)=2E I have contributed to the confusion myself by introducing
>a separate --object iothread, a separate concept unrelated to the BQL=2E
>
>The "iothread" name is no longer appropriate for the BQL=2E Rename the
>locking APIs to:
>- void bql_lock(void)
>- void bql_unlock(void)
>- bool bql_locked(void)
>
>There are more APIs with "iothread" in their names=2E Subsequent patches
>will rename them=2E There are also comments and documentation that will b=
e
>updated in later patches=2E
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat=2Ecom>
>Reviewed-by: Paul Durrant <paul@xen=2Eorg>
>Acked-by: Fabiano Rosas <farosas@suse=2Ede>
>Acked-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Reviewed-by: C=C3=A9dric Le Goater <clg@kaod=2Eorg>
>Acked-by: Peter Xu <peterx@redhat=2Ecom>
>Acked-by: Eric Farman <farman@linux=2Eibm=2Ecom>
>Reviewed-by: Harsh Prateek Bora <harshpb@linux=2Eibm=2Ecom>

