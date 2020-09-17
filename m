Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6626D56B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 09:58:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIonT-0001FI-60; Thu, 17 Sep 2020 07:57:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yti=C2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kIonS-0001FD-4q
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 07:57:38 +0000
X-Inumbo-ID: c7d896a9-5541-4955-8f1e-d6c1122494ba
Received: from mail-wm1-x32a.google.com (unknown [2a00:1450:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7d896a9-5541-4955-8f1e-d6c1122494ba;
 Thu, 17 Sep 2020 07:57:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id s13so995595wmh.4
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=0dCsAB7sgvO3ijWAYy2/up8BNNwtjUjyvJiAJ0hrsQw=;
 b=Q4g0x1/IsGREWR0kbKpY2l8DwkxU+dS4gTBbw0CpOlamuknmRuFWE9lVdDWmsCGsHY
 JjPlYSAGVJJxZ/ug9VaBt/H4WqVmuid2Bd6fGItVIfgk/OkTjFvymQAns7fsIwqubg18
 7V+K4H4Nskpy1G7d9nzhV0yu9mopqqOcaddrtsllP3Hq2SBL3XQzTS8QgX5YhDLUMtu8
 SSEcignZB2aUctHKk21XskeVp/fFvCN3SU75mo/BaupV11nzsqipxZoprq3y/bFlmTEa
 wJtpEELAZLJWuJ072ECkX6OufwippgFlr3ichq1Ni/2+cT1/wox16G8yHIF0LvBXuv39
 jxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=0dCsAB7sgvO3ijWAYy2/up8BNNwtjUjyvJiAJ0hrsQw=;
 b=PApmX/Ur/0DnWa4oE8PszkfNJe1Ey4YiaD6wkMR+cqrc/44CCJgbyGHXPAPKnmJO1w
 iEJSBZe7rm5wTqzuH8nHitwyE0lwaU2oJdTUof4F8M5eIddFUSlceRKE0h+YGho+EepJ
 5dlv6/1RueSrJ7mRE9DQxDFwUXquAeMQbQqtCIQAeEhLk4wNRi4L4I6YQP8wnqwM7i8d
 vIJdoKBa7nU6qHDKhFyrCF1J0pR2aveijcnx1OhkCfW97HNispaLmSOIESgXNcBCClH4
 daTrCvHYDZd8SnhEehj82PYz4F7EvMbx/If5+brq6Z1Pc7quLNzBwk4hAvvBtYPB75Xj
 rayA==
X-Gm-Message-State: AOAM531oXSxbmlArX3nmAJUJYly4Rsg0D4O3s20J7GkMs4KD9ahoAAvU
 Svl8lIz4OH7u2BU+JBjjkGQ=
X-Google-Smtp-Source: ABdhPJwEFP1IvlYvUVQzkk2Mche6UC+K5+G3jqaxP/E6EJ12vTu81AGm1S9kC3+lb5YcGOXL+ZDd4g==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr8635606wmc.100.1600329456159; 
 Thu, 17 Sep 2020 00:57:36 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id g14sm9401272wrv.25.2020.09.17.00.57.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Sep 2020 00:57:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Paolo Bonzini'" <pbonzini@redhat.com>,
 "'Daniel P. Berrange'" <berrange@redhat.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 "'Gerd Hoffmann'" <kraxel@redhat.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>,
 "'Peter Maydell'" <peter.maydell@linaro.org>,
 "'Corey Minyard'" <cminyard@mvista.com>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 "'David Gibson'" <david@gibson.dropbear.id.au>,
 "'Cornelia Huck'" <cohuck@redhat.com>, "'Thomas Huth'" <thuth@redhat.com>,
 "'Halil Pasic'" <pasic@linux.ibm.com>,
 "'Christian Borntraeger'" <borntraeger@de.ibm.com>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 "'Alistair Francis'" <alistair@alistair23.me>,
 "'David Hildenbrand'" <david@redhat.com>,
 "'Laurent Vivier'" <lvivier@redhat.com>, "'Amit Shah'" <amit@kernel.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 "'Fam Zheng'" <fam@euphon.net>,
 "'Gonglei \(Arei\)'" <arei.gonglei@huawei.com>,
 "'Igor Mammedov'" <imammedo@redhat.com>,
 "'Stefan Berger'" <stefanb@linux.ibm.com>,
 "'Richard Henderson'" <rth@twiddle.net>,
 "'Michael Rolnik'" <mrolnik@gmail.com>,
 "'Sarah Harris'" <S.E.Harris@kent.ac.uk>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 "'Michael Walle'" <michael@walle.cc>,
 "'Aleksandar Markovic'" <aleksandar.qemu.devel@gmail.com>,
 "'Aurelien Jarno'" <aurelien@aurel32.net>,
 "'Jiaxun Yang'" <jiaxun.yang@flygoat.com>,
 "'Aleksandar Rikalo'" <aleksandar.rikalo@syrmia.com>,
 "'Anthony Green'" <green@moxielogic.com>,
 "'Chris Wulff'" <crwulff@gmail.com>, "'Marek Vasut'" <marex@denx.de>,
 "'Stafford Horne'" <shorne@gmail.com>,
 "'Palmer Dabbelt'" <palmer@dabbelt.com>,
 "'Sagar Karandikar'" <sagark@eecs.berkeley.edu>,
 "'Bastian Koppelmann'" <kbastian@mail.uni-paderborn.de>,
 "'Yoshinori Sato'" <ysato@users.sourceforge.jp>,
 "'Mark Cave-Ayland'" <mark.cave-ayland@ilande.co.uk>,
 "'Artyom Tarasenko'" <atar4qemu@gmail.com>,
 "'Guan Xuetao'" <gxt@mprc.pku.edu.cn>,
 "'Max Filippov'" <jcmvbkbc@gmail.com>, <qemu-arm@nongnu.org>,
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 <xen-devel@lists.xenproject.org>, <qemu-riscv@nongnu.org>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-4-ehabkost@redhat.com>
In-Reply-To: <20200916182519.415636-4-ehabkost@redhat.com>
Subject: RE: [PATCH 3/5] qom: Remove module_obj_name parameter from
 OBJECT_DECLARE* macros
Date: Thu, 17 Sep 2020 08:57:33 +0100
Message-ID: <007c01d68cc8$347614f0$9d623ed0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIelPz0+HUIa2jn7mxP/pozU40YBAMHPXtoqMQrdLA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Eduardo Habkost <ehabkost@redhat.com>
> Sent: 16 September 2020 19:25
> To: qemu-devel@nongnu.org
> Cc: Paolo Bonzini <pbonzini@redhat.com>; Daniel P. Berrange =
<berrange@redhat.com>; Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com>; Gerd Hoffmann <kraxel@redhat.com>; =
Michael S. Tsirkin <mst@redhat.com>;
> Peter Maydell <peter.maydell@linaro.org>; Corey Minyard =
<cminyard@mvista.com>; C=C3=A9dric Le Goater
> <clg@kaod.org>; David Gibson <david@gibson.dropbear.id.au>; Cornelia =
Huck <cohuck@redhat.com>; Thomas
> Huth <thuth@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org>; Alistair Francis
> <alistair@alistair23.me>; David Hildenbrand <david@redhat.com>; =
Laurent Vivier <lvivier@redhat.com>;
> Amit Shah <amit@kernel.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Anthony Perard
> <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; Fam Zheng =
<fam@euphon.net>; Gonglei (Arei)
> <arei.gonglei@huawei.com>; Igor Mammedov <imammedo@redhat.com>; Stefan =
Berger <stefanb@linux.ibm.com>;
> Richard Henderson <rth@twiddle.net>; Michael Rolnik =
<mrolnik@gmail.com>; Sarah Harris
> <S.E.Harris@kent.ac.uk>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; =
Michael Walle
> <michael@walle.cc>; Aleksandar Markovic =
<aleksandar.qemu.devel@gmail.com>; Aurelien Jarno
> <aurelien@aurel32.net>; Jiaxun Yang <jiaxun.yang@flygoat.com>; =
Aleksandar Rikalo
> <aleksandar.rikalo@syrmia.com>; Anthony Green <green@moxielogic.com>; =
Chris Wulff <crwulff@gmail.com>;
> Marek Vasut <marex@denx.de>; Stafford Horne <shorne@gmail.com>; Palmer =
Dabbelt <palmer@dabbelt.com>;
> Sagar Karandikar <sagark@eecs.berkeley.edu>; Bastian Koppelmann =
<kbastian@mail.uni-paderborn.de>;
> Yoshinori Sato <ysato@users.sourceforge.jp>; Mark Cave-Ayland =
<mark.cave-ayland@ilande.co.uk>; Artyom
> Tarasenko <atar4qemu@gmail.com>; Guan Xuetao <gxt@mprc.pku.edu.cn>; =
Max Filippov <jcmvbkbc@gmail.com>;
> qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-s390x@nongnu.org; =
qemu-block@nongnu.org; xen-
> devel@lists.xenproject.org; qemu-riscv@nongnu.org
> Subject: [PATCH 3/5] qom: Remove module_obj_name parameter from =
OBJECT_DECLARE* macros
>=20
> One of the goals of having less boilerplate on QOM declarations
> is to avoid human error.  Requiring an extra argument that is
> never used is an opportunity for mistakes.
>=20
> Remove the unused argument from OBJECT_DECLARE_TYPE and
> OBJECT_DECLARE_SIMPLE_TYPE.
>=20
> Coccinelle patch used to convert all users of the macros:
>=20
>   @@
>   declarer name OBJECT_DECLARE_TYPE;
>   identifier InstanceType, ClassType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_TYPE(InstanceType, ClassType,
>   -                    lowercase,
>                        UPPERCASE);
>=20
>   @@
>   declarer name OBJECT_DECLARE_SIMPLE_TYPE;
>   identifier InstanceType, lowercase, UPPERCASE;
>   @@
>    OBJECT_DECLARE_SIMPLE_TYPE(InstanceType,
>   -                    lowercase,
>                        UPPERCASE);
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>


