Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA5F4D8C44
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 20:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290428.492527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqGp-0001JF-Qd; Mon, 14 Mar 2022 19:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290428.492527; Mon, 14 Mar 2022 19:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqGp-0001GS-NX; Mon, 14 Mar 2022 19:22:19 +0000
Received: by outflank-mailman (input) for mailman id 290428;
 Mon, 14 Mar 2022 19:22:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxqh=TZ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nTqGo-0001GM-MA
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 19:22:18 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f80256b-a3cc-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 20:22:17 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id bi12so36373431ejb.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 12:22:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm7117295ejm.115.2022.03.14.12.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 12:22:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0921D1FFB7;
 Mon, 14 Mar 2022 19:22:15 +0000 (GMT)
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
X-Inumbo-ID: 0f80256b-a3cc-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=tycv6HJZUTnQM7on2TavcKhNCFhbcZz1vxyWXIQR71o=;
        b=A0oYLouNRVTZ4V9w3HZxOkB6cJW9hiI3hbFyTqQMx9TKG2yR59woJojs96yqxoBIuC
         YUMI4L32csrMTrJ97Quu8vYBMDdCkobHf+Ilop8Mi2A98XMYLmS6xUm59zLvi0olWvPO
         epYH0BSvosR26pLIH2BGasEfulC8lnKJcQI5bMuiy0mk3M9L7uraIExkoDhzQ+YH/Qiu
         wf7HJSEQuk606ZD7pnYWZGLuoUahygOlfF++b9QAxAvINlDfnwldYbX0i0mMsTl+PIPZ
         X4cBbVK210OAe7WBg8X3EeM3L2anNSTnuu/JTD1/Av9oTe1rBpyrU9Wnoq81+J1uK0F+
         fZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=tycv6HJZUTnQM7on2TavcKhNCFhbcZz1vxyWXIQR71o=;
        b=ujHVPLdyfqdQ7M74z5S8kYHneufd0IlFukjnX4LNkFqQIsDqB0Qrbyu4vt/TUt3Pax
         vhfBKyDDcIVQTBsfTwV5xM4bwBqyvqVpBNrzFE5RzWenzGu8tE1NNvfk62/7KgRSLP5G
         sl/NjSYj1lxpPgJXiaqHH/eDzrCMp9PaVfHOsO2AuDplagSu6Py8v81RQF4mkGhCv0EV
         7sRZ3SWr3jVlhyn01+fTWfTv6O50RbwWSpQoj9u0QHgs29mWMg1Qmz82nKY05QfiO2kx
         CblXCDIxLFut2viQtSNecY5GFKOweaXSGgARQSAk5FFYe9CctYXMwlMc6A5+UZ7bdk/j
         yxhg==
X-Gm-Message-State: AOAM533Yo/LofDIGNSSDsLAM3nELsxatjwUH3NMp06IWBW0tcXyG9w5f
	2SrEWx3V9OkHqBg4K2BK1Fa9lg==
X-Google-Smtp-Source: ABdhPJzkkqh2Xbgzr0Voz+O2btuSoaFXnwIpWuwZz7MTY1zqLt/vbXJsWFBor8uL64fKWDLfruKO9g==
X-Received: by 2002:a17:907:3e1d:b0:6d7:1031:7e0 with SMTP id hp29-20020a1709073e1d00b006d7103107e0mr19280967ejc.580.1647285736651;
        Mon, 14 Mar 2022 12:22:16 -0700 (PDT)
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-2-armbru@redhat.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Gerd Hoffmann
 <kraxel@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent
 Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>,
 Patrick Venture <venture@google.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Jean-Christophe
 Dubois
 <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic
 <frederic.konrad@adacore.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth
 <michael.roth@amd.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, David Hildenbrand
 <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu
 <colin.xu@intel.com>, Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk
 <reinoud@netbsd.org>, Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia
 Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, haxm-team@intel.com,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH 1/3] scripts/coccinelle: New use-g_new-etc.cocci
Date: Mon, 14 Mar 2022 19:22:09 +0000
In-reply-to: <20220314160108.1440470-2-armbru@redhat.com>
Message-ID: <87ilsg5ogp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Markus Armbruster <armbru@redhat.com> writes:

> This is the semantic patch from commit b45c03f585 "arm: Use g_new() &
> friends where that makes obvious sense".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

