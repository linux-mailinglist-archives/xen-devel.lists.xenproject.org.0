Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937175837C8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 06:08:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376262.609456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGuoJ-0006v7-W4; Thu, 28 Jul 2022 04:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376262.609456; Thu, 28 Jul 2022 04:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGuoJ-0006tJ-Si; Thu, 28 Jul 2022 04:07:43 +0000
Received: by outflank-mailman (input) for mailman id 376262;
 Wed, 27 Jul 2022 15:21:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R1ee=YA=purdue.edu=lei56@srs-se1.protection.inumbo.net>)
 id 1oGir5-0007ln-NN
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:21:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2093.outbound.protection.outlook.com [40.107.93.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2835a5c-0dbf-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 17:21:45 +0200 (CEST)
Received: from CH2PR22MB1926.namprd22.prod.outlook.com (2603:10b6:610:5f::21)
 by CY4PR2201MB1111.namprd22.prod.outlook.com (2603:10b6:910:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Wed, 27 Jul
 2022 15:21:39 +0000
Received: from CH2PR22MB1926.namprd22.prod.outlook.com
 ([fe80::d0ab:e499:78b1:6e87]) by CH2PR22MB1926.namprd22.prod.outlook.com
 ([fe80::d0ab:e499:78b1:6e87%3]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 15:21:39 +0000
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
X-Inumbo-ID: d2835a5c-0dbf-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iImqCGDk7AoSLWQnXV9FzrfCCK7Rxxwd/8mXmjf0C3K92lBoUG6rFoa7IFWzp+XnrFAcGYR9/u1X3EGJS0wLRKBEthAk6fd6CWPAJSbdy+jLHcLWlB/KX3mZ6JnrdahTTzatAimSKDGvQ946ckwaE74Z4fedi1b0ZlRBrTRnkVvO5IBGtGzTWvI5P/q+7xnv/dxCDAcSJ3fMr/0S0h9P8LfsM3qKCpmdxc7lYVSv93XcPcHWRCzXYmb5j/+mMpiICIhrf/CHhKEZXpHjZOwTpaKyq1El7k2MDbTGrEduD5R38G3Udo1hvMjQaawPY8ePxlGF4i1Cm7zhLbgc8UuuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQSEppn7nPi0ogDwjER+B1GKslGgEmav8cGFc6aJF4k=;
 b=dSCPtpT2UqA716AyWA2J2oVNx+t/IzW/zNMhP2kUB9FIA8S2SGlgdFUj30rwqcA/X1Avu6whxdlVOVPrY5yR6VlZ73MrIqF8t+MQ4243DNt4B3321RO+hnKJ+0P9UZ4SZHRvPcx8k6L4nerD+CvFtinB+Q6nqJWsV3TyXbfXCRxboBYLGmUUn0AJP+SSrL59bhWbPV+GcXc4VP+Msd3+zBzHCSHVCi14vJkhtaW/H/UVwd3wwW0n1trn+QyNEucsTJszXOcRKDd16f4eSuXdgbwT2d5yXcgo28TQ+3SqvtwdyZ2JxGSioFrpvwObWOwnDcg7FsmslClY5YJYuNljYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=purdue.edu; dmarc=pass action=none header.from=purdue.edu;
 dkim=pass header.d=purdue.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=purdue0.onmicrosoft.com; s=selector2-purdue0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQSEppn7nPi0ogDwjER+B1GKslGgEmav8cGFc6aJF4k=;
 b=OQd8LV5LdczRhImp/8MVYjDLK3Wc9Oo/iy2WMIndxADr+bmCwGUTrNdOVcfkx9TL8fFfVXf7xHBXe1Onns+CZM1XYL/egyXQ1X095q2sx6DDLo6tZ/ROr5pqRAv3/46XCbixJ54vaCoymIRXP1ZwHQYIvBR9rONDYcmxKAZiRuY=
From: Jason Shuhua Lei <lei56@purdue.edu>
To: "Smith, Jackson" <rsmith@RiversideResearch.org>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
Thread-Topic: [IMAGEBUILDER PATCH] uboot-script-gen: allow fit generation with
 no dom0 kernel
Thread-Index: AdigP3XkakTWEwukTeurpU94cGpQzABDr/uAAB0Pf2AAAb+csA==
Date: Wed, 27 Jul 2022 15:21:39 +0000
Message-ID:
 <CH2PR22MB1926F1B6BAAD46C9FD4E6341C0979@CH2PR22MB1926.namprd22.prod.outlook.com>
References:
 <BN0P110MB16423592266085271C069BA7CF959@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <alpine.DEB.2.22.394.2207261713020.4648@ubuntu-linux-20-04-desktop>
 <BN0P110MB16420524ED9A79C52C86629BCF979@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To:
 <BN0P110MB16420524ED9A79C52C86629BCF979@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=purdue.edu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 801d349a-f803-4616-232c-08da6fe3b3db
x-ms-traffictypediagnostic: CY4PR2201MB1111:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SJOdA2P2a2KenvEKlkypHPmvfz9DEECpDfnpOM4M4PUT7sohpgyGpeXkuLE26WXKAqeO0Ua9w+IJwkwniIOKZR8OQcKOaFOzkU+uL/7iU1O+Ts7R0iKq/F9q4uXf0aVAv0RXqthElFQ5YANlPs2nzGKb0JzZLqX3Py6EKIsJecasNymeawpQllhfiJP/M4I7iU5+sn1ylgUSoOWUavCS32PHh6vZ8Bj7TF0LFe6MYWONDd+qePmi+3ABZ4TEiZnhsdSjf51WR56Qyo3t6tUyOUOdDmIT9GEoXwsDh0UjTqYOIVlnz3SXCyzVPjf+Hn8lhUmlTInF+vgfN0zQK+HZHqnLjiaARaBOadmzs9FisLuCJZYhVoiMTkrW+GNQ7cR4e0HV+6b1KPDUpx3Cs2LAkZVsiWQ08oQbDybdtN6Kco2QJB52yvVcHdmUmFM8ImWWG31KY0LNDRHPWigE7C8hVXhLACbF4CKuctuILfh2ZFvAPn27Fd0sH0iI2wg1BbxJOxCwn5hmFVMu11CdlaDaw6cjr13BQILvglt2cAFAu46vhPqZklVaVa8BvK0ent/1ALczNmSuWdheKQqeimq8awzUs4x/ownxc7+6ljTWEIkqmgAnx75DCWMN5cp1eSYNIiTQY2AAzuYzrt0hRzeN5eA9oQ0BEuFnKPHwbWt3x/j6kSe2ahKdVMdgZWn0fzwi20OJwszVqQ9zKp5zz6JNW00K6F/Anf2LxcZv+yklpmwvtm3JYx/RQfZGP74CbIuOYFaY9LWqQXGU0U4hDJk0bJD3lVOrEAgSgLA3Wj4+6EbFp2PVHQQY2DkIWw4LhdMl3obZOYJsPGvrTgJ44Bh2vg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR22MB1926.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(75432002)(41320700001)(316002)(41300700001)(83380400001)(55016003)(9686003)(38100700002)(6506007)(66556008)(71200400001)(38070700005)(26005)(64756008)(110136005)(122000001)(186003)(66946007)(4326008)(66476007)(66446008)(478600001)(8676002)(52536014)(8936002)(2906002)(786003)(966005)(7696005)(33656002)(86362001)(76116006)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VKP6ucwY0NBlxoJhtmYE2I0/1ePDx2chZEo+9Jc6JmAfLGWin8I+as4XGmUq?=
 =?us-ascii?Q?S3INAYWyAwgpHlfJNwYpuZ9L6EsRY4fdWm6CTLLB5YsNQGXVsrXJ1GrSnrM7?=
 =?us-ascii?Q?deD1bbu0i3LZC3RzPWHC+KF1wREUX+ONLPKjICdUgeforDn45J2NJR7Eb77R?=
 =?us-ascii?Q?ufy8bGJogVHK4r2vQRpSUvW0jF2w1BwkWe4DifaC+ktEFFWo0AOv3DiJToFx?=
 =?us-ascii?Q?7bDsPRr8aeKsuH0/R41oSxVHafAdGtnpV3IlLjaYHJIzGENt2Kel5oeVokBa?=
 =?us-ascii?Q?tzxnEj4YIWQ5Mpp0GNKuDWAMO5hEszrFMTKdtsJbkKWpaeIPzEDl5ly35tH0?=
 =?us-ascii?Q?qupa6Eav4ChRz7cU6NP8pnrplytdETkn+HwlAxkdwzsSAY09sFh2Na/SN+Z9?=
 =?us-ascii?Q?KDWRWdVKAd/Z+dHDP56HNeI0DH2iItRiyQb98ZKan9vX2Y/seePVnW+Vjee6?=
 =?us-ascii?Q?OvXRVb16i40vrrFhOqGQuUr8wohhYNfhaP4pzsqazwluaVLyKnlB/RSItQ6K?=
 =?us-ascii?Q?RhlvG6oy5zLyP026sZ1dB//S8IOFdtTF4rLI0tiuiDGytbVjq164Hc6xr7jV?=
 =?us-ascii?Q?M8BEJ1JggrjwpX8jH9YPuxQ+OTtVlHPLU+0ZwWUhoYiK5Jex27bUJd+HYFco?=
 =?us-ascii?Q?zhpqU0cxuipTyaWJP6j+jDieUJBololkqt7II1EEDfu+gzbZamsq7oPiwFV6?=
 =?us-ascii?Q?d7QtDREu4xmjumMc9taeyeIu5HYO1+zd3y8Yi6lefT/TK3RlnD2Ke8Wotz/u?=
 =?us-ascii?Q?tgXJDJjiIaclIG4azTTzqTD9svQQI5X+1cJR8X9EZdIkO5nkjLLxLkrHqA0q?=
 =?us-ascii?Q?u3JR8CGKy4CjmAlPag2hi9WcrKKmPCPiZKlBAb2GQnYjbJexkH0LizhNsnfP?=
 =?us-ascii?Q?SB23ISiBWkTRtSaEYZfYF0DZtliOjtu2VUEW1IrrHJGiIodDo4tf7zO8lKme?=
 =?us-ascii?Q?vaztud4cwNCi7J5JfvYYKXo32nM7/MvLeglMGxYYrjW5DUDD7io4qq6DrRiE?=
 =?us-ascii?Q?opUbbWyr4Kuavf8dMvtpsASaJ97eYzqXtUZMgCcK1uKEgvloLg/5SNsJmOKl?=
 =?us-ascii?Q?bPiusdZUkhLOMEZhRbV1syMa18HmZPA7KffbGm1qyRHR5JAWCibHeh4ATcLU?=
 =?us-ascii?Q?AMUeb7rMX09uY50JvBIAie6KKxtlmR8APERyq6irLZE5zGqdeghRDmOeblzj?=
 =?us-ascii?Q?WD3boKQpzkSyw89v0GOvO1/42z7YU6wqq35Pao6Wac9Wfo8TOm6Lja8eEYR4?=
 =?us-ascii?Q?9pVAslFTCQXYgzjIEsnsO83pE/LvRNLmS5/k1QzH77LicRc6qpLBMJJDeVrT?=
 =?us-ascii?Q?8fp0DZFbETFQcY0yOyN/2uvhSAz5YwBzjeVFNbV1h8coh+MLeWRSoDpbmOsn?=
 =?us-ascii?Q?B5sKlqVgSbMQFLiH+ljm1AqWwURLpZOma+fSU7qNBsRs9IMrdMXidbYFykQN?=
 =?us-ascii?Q?HSo2pkyKXYbyw9GAYFXGYhPdrRhGBJ1f4R1P3pkYTcbG14AiT3+KCzwyxsOZ?=
 =?us-ascii?Q?Cp//78uiCvB9wpoNARTh/BrQRtTQpsuWxzhhIS+xIpk4gIQdJ1EnMoC/UVuh?=
 =?us-ascii?Q?LdXtwbmrwd1K2p0ahbo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: purdue.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR22MB1926.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801d349a-f803-4616-232c-08da6fe3b3db
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 15:21:39.1607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4130bd39-7c53-419c-b1e5-8758d6d63f21
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: drM1ELMd09aHvIDgrUvrNqpwl0Y4uLnNjL8GrlrmH/kM5niF/LVtLrbZ75VWrZ9Nxjya7v8fv7vGq+Tcj80aUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1111

Hello,
> -----Original Message-----
> From: Smith, Jackson <rsmith@RiversideResearch.org>
>=20
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> >
> > On Mon, 25 Jul 2022, Smith, Jackson wrote:
> > > Hi Stefano,
> > >
> > > My colleague Jason Lei and I would like to submit a patch to imagebui=
lder.
> > >
> > > It seems that generating a .fit with a true dom0less configuration
> > > fails
> > because an extraneous comma is included in the its file.
> > >
> > > We believe this change resolves the issue.
> >
> > Hi Jackson, thanks for your contribution!
> >
> > Yes, I see the problem: the code assumes there is a dom0 kernel. If
> > there is no
> > dom0 kernel then load_files will be wrongly starting with a ","
> >
> > I would be happy to commit your patch. I assume I can add your
> > Signed-off-by to it, right?
>=20
> Yes, that is fine. Could you also add Jason, as he worked this out initia=
lly?
> I've added him to the message so he can give his ok.
>=20
Yes, I would like to be signed off on the patch as well using this email.

Thanks,
Jason Lei
> >
> > Signed-off-by: Jackson Smith <rsmith@RiversideResearch.org>
> >
> > Signed-off-by is the "Developer Certificate of Origin" which means:
> > https://developercertificate.org/
> >
> >
> >
> > >
> > > Remove extraneous comma in generated its file when no DOM0_KERNEL
> is
> > specified.
> > >
> > > diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> > > index 8f08cd6..6f94fce 100755
> > > --- a/scripts/uboot-script-gen
> > > +++ b/scripts/uboot-script-gen
> > > @@ -676,7 +676,12 @@ create_its_file_xen()
> > >              i=3D$(( $i + 1 ))
> > >              continue
> > >          fi
> > > -        load_files+=3D", \"domU${i}_kernel\""
> > > +       if test -z "$load_files"
> > > +       then
> > > +           load_files+=3D"\"domU${i}_kernel\""
> > > +       else
> > > +           load_files+=3D", \"domU${i}_kernel\""
> > > +       fi
> > >          cat >> "$its_file" <<- EOF
> > >          domU${i}_kernel {
> > >              description =3D "domU${i} kernel binary";
> > >
> > >

