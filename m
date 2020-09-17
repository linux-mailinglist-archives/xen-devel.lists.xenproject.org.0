Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9292B26D569
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 09:58:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIonq-0001H8-G2; Thu, 17 Sep 2020 07:58:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yti=C2=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kIonp-0001Gz-HO
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 07:58:01 +0000
X-Inumbo-ID: 60fa22f8-f2be-4207-96d2-11bb845db6ed
Received: from mail-wm1-x332.google.com (unknown [2a00:1450:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60fa22f8-f2be-4207-96d2-11bb845db6ed;
 Thu, 17 Sep 2020 07:58:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id x23so999634wmi.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=jOHv+hmuvt/5uGoDjBobzg6bO/i4rDlHoi0pXt+cGLA=;
 b=oPuNTNNPUq9k7adNJ+MCxPO36a0TMaEGMwhQVoCdjEgN9Di/pFrH3R3Kg9uKvRWzDt
 LQtMj8yF7tVnUZfia/KsTwwUgajPbyrsrWhp15Rn2KCAWizUp2zKna0R1vNtGxfWIBs2
 lojSA+G2egiFwUux1JPYMh5hpKtzARQAXO7v4ar8607HWTWEdXCB/rIZBLrnsEhb4rLh
 DGZaCMAy52DDU/cCnlV852NTKhYLVXQV24fWYVTjMx5ZPKJ4kdMX6J0rm1IxSEv1XjhX
 2A/sebHgkgasZNFSfMgkMjkLT+Ij95fUmoj04h2GMWvg0Fm9J22XBvuazKaCh5G0zRTl
 GB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=jOHv+hmuvt/5uGoDjBobzg6bO/i4rDlHoi0pXt+cGLA=;
 b=QMkFGTdrqF+MLol3DR9n7dyMfqcaz42gvX9zZln/fRTv9BwENXWblLS3au/xpPaWJS
 ncIkEZ+uS9ZR5EJnLN9qXk3TpPJ+aWRH2qi4oaxnLWpbYOkOJpvScoq2MYqLg/lvE2Hb
 kYVmvEK+272Bec3bA18eBQ+A+u+nAxMQDIpni8kj7j0NPGpHsyshPw9Jsa910B9wyksx
 olGZVkxfs6p+76S1q8DTn4vFp2h6ePJQRjfovNdl3u51doPuxj2q13lULIIkTR2Q+AOp
 cyDZeQQ5nkno7pX5gOFJoiiBxONnlSPjL3Tk/AqXMo/oob1QdpjpXX402y1wXdilyM3v
 Kp2g==
X-Gm-Message-State: AOAM531sZFbZHAGmBXC27LU+aRVxkGQzqTECB2o+UujpB5WeCVtNg6Mc
 H0HXhHsGzciDIP/2UmbisuE=
X-Google-Smtp-Source: ABdhPJzQHj63BJvwI4Ax0bRAY0bsZ1LUdQRgxWWVc/7WDEEZAMcNeBimrLKSRS5wWJi+Aat/XxOGlg==
X-Received: by 2002:a7b:c44b:: with SMTP id l11mr8458780wmi.52.1600329479922; 
 Thu, 17 Sep 2020 00:57:59 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id c25sm9433892wml.31.2020.09.17.00.57.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Sep 2020 00:57:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Eduardo Habkost'" <ehabkost@redhat.com>,
	<qemu-devel@nongnu.org>
Cc: "'Paolo Bonzini'" <pbonzini@redhat.com>,
 "'Daniel P. Berrange'" <berrange@redhat.com>,
 "'Peter Maydell'" <peter.maydell@linaro.org>,
 "'Andrzej Zaborowski'" <balrogg@gmail.com>,
 "'Alistair Francis'" <alistair@alistair23.me>,
 "'Kevin Wolf'" <kwolf@redhat.com>, "'Max Reitz'" <mreitz@redhat.com>,
 "'Mark Cave-Ayland'" <mark.cave-ayland@ilande.co.uk>,
 "'David Gibson'" <david@gibson.dropbear.id.au>,
 "'Richard Henderson'" <rth@twiddle.net>,
 "'David Hildenbrand'" <david@redhat.com>,
 "'Cornelia Huck'" <cohuck@redhat.com>, "'Thomas Huth'" <thuth@redhat.com>,
 "'Halil Pasic'" <pasic@linux.ibm.com>,
 "'Christian Borntraeger'" <borntraeger@de.ibm.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, "'Fam Zheng'" <fam@euphon.net>,
 "'Dmitry Fleytman'" <dmitry.fleytman@gmail.com>,
 "'Gerd Hoffmann'" <kraxel@redhat.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9_Lureau'?= <marcandre.lureau@redhat.com>,
 =?utf-8?Q?'C=C3=A9dric_Le_Goater'?= <clg@kaod.org>,
 "'Andrew Jeffery'" <andrew@aj.id.au>, "'Joel Stanley'" <joel@jms.id.au>,
 "'Andrew Baumann'" <Andrew.Baumann@microsoft.com>,
 =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <f4bug@amsat.org>,
 "'Eric Auger'" <eric.auger@redhat.com>,
 "'Marcel Apfelbaum'" <marcel.apfelbaum@gmail.com>,
 "'Laurent Vivier'" <laurent@vivier.eu>, "'Sergio Lopez'" <slp@redhat.com>,
 "'John Snow'" <jsnow@redhat.com>,
 "'Xiao Guangrong'" <xiaoguangrong.eric@gmail.com>,
 "'Peter Chubb'" <peter.chubb@nicta.com.au>,
 "'Beniamino Galvani'" <b.galvani@gmail.com>,
 "'Edgar E. Iglesias'" <edgar.iglesias@gmail.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 "'Jason Wang'" <jasowang@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-block@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>,
 <xen-devel@lists.xenproject.org>
References: <20200916182519.415636-1-ehabkost@redhat.com>
 <20200916182519.415636-5-ehabkost@redhat.com>
In-Reply-To: <20200916182519.415636-5-ehabkost@redhat.com>
Subject: RE: [PATCH 4/5] [automated] Use OBJECT_DECLARE_TYPE when possible
Date: Thu, 17 Sep 2020 08:57:54 +0100
Message-ID: <007e01d68cc8$429bc160$c7d34420$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIelPz0+HUIa2jn7mxP/pozU40YBAGnf84ZqM8pawA=
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
<berrange@redhat.com>; Peter Maydell
> <peter.maydell@linaro.org>; Andrzej Zaborowski <balrogg@gmail.com>; =
Alistair Francis
> <alistair@alistair23.me>; Kevin Wolf <kwolf@redhat.com>; Max Reitz =
<mreitz@redhat.com>; Mark Cave-
> Ayland <mark.cave-ayland@ilande.co.uk>; David Gibson =
<david@gibson.dropbear.id.au>; Richard Henderson
> <rth@twiddle.net>; David Hildenbrand <david@redhat.com>; Cornelia Huck =
<cohuck@redhat.com>; Thomas
> Huth <thuth@redhat.com>; Halil Pasic <pasic@linux.ibm.com>; Christian =
Borntraeger
> <borntraeger@de.ibm.com>; Michael S. Tsirkin <mst@redhat.com>; Fam =
Zheng <fam@euphon.net>; Dmitry
> Fleytman <dmitry.fleytman@gmail.com>; Gerd Hoffmann =
<kraxel@redhat.com>; Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com>; C=C3=A9dric Le Goater <clg@kaod.org>; =
Andrew Jeffery <andrew@aj.id.au>; Joel
> Stanley <joel@jms.id.au>; Andrew Baumann =
<Andrew.Baumann@microsoft.com>; Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org>; Eric Auger <eric.auger@redhat.com>; Marcel =
Apfelbaum <marcel.apfelbaum@gmail.com>;
> Laurent Vivier <laurent@vivier.eu>; Sergio Lopez <slp@redhat.com>; =
John Snow <jsnow@redhat.com>; Xiao
> Guangrong <xiaoguangrong.eric@gmail.com>; Peter Chubb =
<peter.chubb@nicta.com.au>; Beniamino Galvani
> <b.galvani@gmail.com>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; =
Stefano Stabellini
> <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; =
Paul Durrant <paul@xen.org>;
> Jason Wang <jasowang@redhat.com>; qemu-arm@nongnu.org; =
qemu-block@nongnu.org; qemu-ppc@nongnu.org;
> qemu-s390x@nongnu.org; xen-devel@lists.xenproject.org
> Subject: [PATCH 4/5] [automated] Use OBJECT_DECLARE_TYPE when possible
>=20
> This converts existing DECLARE_OBJ_CHECKERS usage to
> OBJECT_DECLARE_TYPE when possible.
>=20
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DAddObjectDeclareType $(git grep -l '' -- '*.[ch]')
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: Paul Durrant <paul@xen.org>


