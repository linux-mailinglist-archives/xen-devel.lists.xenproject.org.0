Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC6582917
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 16:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376240.608882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGiQW-0002t9-H2; Wed, 27 Jul 2022 14:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376240.608882; Wed, 27 Jul 2022 14:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGiQW-0002qe-Dk; Wed, 27 Jul 2022 14:54:20 +0000
Received: by outflank-mailman (input) for mailman id 376240;
 Wed, 27 Jul 2022 14:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+zX=YA=riversideresearch.org=rsmith@srs-se1.protection.inumbo.net>)
 id 1oGiQU-0002qY-LJ
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 14:54:18 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0119.outbound.protection.office365.us [23.103.208.119])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbb12767-0dbb-11ed-924f-1f966e50362f;
 Wed, 27 Jul 2022 16:54:17 +0200 (CEST)
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::22)
 by BN0P110MB1611.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:187::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 14:54:13 +0000
Received: from BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27]) by BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
 ([fe80::5c73:fd8e:2a33:be27%4]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 14:54:13 +0000
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
X-Inumbo-ID: fbb12767-0dbb-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=AacsjLrjIhxanx5m3a2JTlbPRI9Ux36awgIooz3vV54bCFEwvW3nHZXCFhb3QjMq/xEbJkkokSXx5jcQjaJNPlsWf1GbGgfy0VL34sDJ/RzgG0Vo1Vt5rfGwRDE0H90ep0nLIoHYSfeLkxVusvWqCITVe3YOIoXDTcTpU0fROC2A+KWLuUftGd6KJ9YpLpGYaC6du8xTaGDLI8Qg+66nacMEyiFPSD77kNpQjNXmDCFkms9XCwIDSHLIboW+vB42W/UJ6JiN8ynaq0AJwpNGerpBBhKfPomC4PAT9F1tCYqRlBSiCkT8pIMy8U/8+g5qbqv+nG44BYFfH1rQUxqQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mws4yGJ0axrAhY3l1tCcfs8haik85+aRQB1niqx8sQw=;
 b=kM3Juu10S0OokPOigP39O3zLtOB0QswCTv866WjtHid8NEBYjlUhIZ8TUEwPawIp83RJUnHpFLEpuzhLycddTwThvh6v0jYFChjkEfyXr48HNjgmGqK6IDgPVoMMBS5AiS5lcTnZuohAl2GBTAP23a3XI/WE8sKlbb+nBIhV0BrHtS9rMTqXkvKbaYxmBCQBxGu1d0tJD3K/tbVqdGQKM3+O8gMakNDpE6Zr+9mU5miwmFVuTpdetjBQi/pckPaxZqaiLEdF97hfdb+RWI9oZ7sh9QIOIUX51WkoLobyT5KXPlLa/97BiuN6aYV8XS6kaGr+KCyDBaKIXvFPhTRgzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=riversideresearch.org; dmarc=pass action=none
 header.from=riversideresearch.org; dkim=pass header.d=riversideresearch.org;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riversideresearch.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mws4yGJ0axrAhY3l1tCcfs8haik85+aRQB1niqx8sQw=;
 b=NxnvwjpO0hp34OuA44fWqng/26z1XHKGF/O7UnUiX4quaiJOZITenEAtuNUp+s0A1naNoDzHpxuXEzadBIG7ssEEqN25xkDRBQSt57qXzTS5Cvfu7HZa6cxFZEP0dmZ2CBWF1PFE6fbNztfFyiNfLUlw/mFOV78/ZMKfAQAqf7eWqvbYK/o9DA8cIpg86Q5mR2i2UYAh7GbBzdo8W43atnx5F084hs9RdFzoPVBnYLbs7ryFxvK+xyAFbY7oh/O3s+CodoBbU/7KFtKYy37qDrctTNqkYTDF9AWUTNS47E5A5km4KGpr/Fz5HkD1ROZRiY0YlktWZ4OmSv9+HuZCxQ==
From: "Smith, Jackson" <rsmith@RiversideResearch.org>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "lei56@purdue.edu"
	<lei56@purdue.edu>
Subject: RE: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
Thread-Topic: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
Thread-Index: AdigP3XkakTWEwukTeurpU94cGpQzABDr/uAAB0Pf2A=
Date: Wed, 27 Jul 2022 14:54:13 +0000
Message-ID:
 <BN0P110MB16420524ED9A79C52C86629BCF979@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
References:
 <BN0P110MB16423592266085271C069BA7CF959@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <alpine.DEB.2.22.394.2207261713020.4648@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2207261713020.4648@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=RiversideResearch.org;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 256a1f76-63b1-4be5-14fe-08da6fdfdef7
x-ms-traffictypediagnostic: BN0P110MB1611:EE_
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ZNfRry73CEazHqKPiasVedsujKzzkV3BpL8UluKpH1Mwr0ffL7WnLNqdaOlh7NOJoorL8ExH4bIEM2B3Pqcl94MUgMxhOMHHlwBkx6zoJQX4GVUWb+5JcTg0toczNVRzrZV0k8JWJ316JUg4qgAN0s4cJeIS8kv/RsFQpKBGiznodSrYLbKp5BAZ9KuD+C8NdFXZVi23xxxJ7KweWEbMgLzS0lnIXuAXA83mZ9BTX4S009qI2xU0+UH5vZ749cvGbNhZXWVogT5y7K4nzu32PorAIMtUnljjNAF8RTWKKOiogZybhHFTLbxJDJGroIvIs3uBDVwUAOxx5vicSnTOb3zx4yOJWaSoO5G+jrSPOmVZ6auhnSTYV7GobBQ/dMUYpUPaCLQm3fVZ84RUyNin99y2vWwcSBCm8SAkqhKsR1ZXP5LL8FW1gPpKCSUzMq6lDhn7ufFSgIg457hVECENZi+z3+9dJfubmpCbMtiarNN9m/GFFGMLKUDTVlRWsrPQ+xyQf+z4MER9tMKmYuXSMmRrEIXJOH0Gkhts7C13HTFG8TJvd6Ybujqva2UmcKCCNFSSt85abzmJHAPLhHUKsSh+VyolhTrYmQfBFe0BTFtwdWmJx9PXMmgpT4CoV5PmXroW36Xa/0tbxqgq/+g1/xfGq5cM9kO6mdORJEcO2h+w0pfS/r/aHvno/ZqFl86SFlQ4vDutyHbRHpyh/iL+9oCzUCpskHoDW9yWshoW00EEF1Yig+LIZfQyxdIK0zHFmvqNu2ETL58pcu/O6RXkGQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(5660300002)(52536014)(33656002)(8936002)(38100700002)(2906002)(6916009)(54906003)(66556008)(66946007)(66476007)(66446008)(64756008)(55016003)(76116006)(4326008)(8676002)(26005)(7696005)(9686003)(6506007)(86362001)(966005)(186003)(498600001)(71200400001)(83380400001)(82960400001)(38070700005)(122000001)(85282002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 obRkT1K5MfZJyCEYj6xkInkGb24T/1RUs5TMcb3RX8GLxMsbv6/6p8c36ujsjqVyXYLQuRBkvsMn59DgHzH8oy77AUulyjf31Nfg93IVd0OBRNi7cMFyl+kM4pswNCTrDdXcz8yu9menaUpgfIcK9Ps6suI+/nOwB9U4T2ZiLJx4tgtUnhVssEh3yZfH08hc426ztXB9RxUsS75Hoxztt1ynfJb/Q+8Z2SVwh2cu0n4/+urORLbLdd9K3HXZqK8Ro7kGTUqU5p/y0i8KZ+F4Sy/P9MyO/Erqqz0Pmcw7970JI0wtO3F+eH3/l3XkJD3RLIGJU7quqzYJO0pDmvy+jjJvg4EVUeJgwzPiwrbAVYZ1zf6Wy5SBLMlZWUeowvJOYKIomAAB8fcx04cMIousSvcYIiStHOqb0wTJCpLvKRg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: riversideresearch.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 256a1f76-63b1-4be5-14fe-08da6fdfdef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 14:54:13.5002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bfc64a8d-9064-4c64-91c3-9d10b44c1cb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1611

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
>
> On Mon, 25 Jul 2022, Smith, Jackson wrote:
> > Hi Stefano,
> >
> > My colleague Jason Lei and I would like to submit a patch to imagebuild=
er.
> >
> > It seems that generating a .fit with a true dom0less configuration fail=
s
> because an extraneous comma is included in the its file.
> >
> > We believe this change resolves the issue.
>
> Hi Jackson, thanks for your contribution!
>
> Yes, I see the problem: the code assumes there is a dom0 kernel. If there=
 is no
> dom0 kernel then load_files will be wrongly starting with a ","
>
> I would be happy to commit your patch. I assume I can add your Signed-off=
-by
> to it, right?

Yes, that is fine. Could you also add Jason, as he worked this out initiall=
y?
I've added him to the message so he can give his ok.

>
> Signed-off-by: Jackson Smith <rsmith@RiversideResearch.org>
>
> Signed-off-by is the "Developer Certificate of Origin" which means:
> https://developercertificate.org/
>
>
>
> >
> > Remove extraneous comma in generated its file when no DOM0_KERNEL is
> specified.
> >
> > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen index
> > 8f08cd6..6f94fce 100755
> > --- a/scripts/uboot-script-gen
> > +++ b/scripts/uboot-script-gen
> > @@ -676,7 +676,12 @@ create_its_file_xen()
> >              i=3D$(( $i + 1 ))
> >              continue
> >          fi
> > -        load_files+=3D", \"domU${i}_kernel\""
> > +       if test -z "$load_files"
> > +       then
> > +           load_files+=3D"\"domU${i}_kernel\""
> > +       else
> > +           load_files+=3D", \"domU${i}_kernel\""
> > +       fi
> >          cat >> "$its_file" <<- EOF
> >          domU${i}_kernel {
> >              description =3D "domU${i} kernel binary";
> >
> >

