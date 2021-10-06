Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51AC423B73
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 12:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202695.357693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY47K-0005Ei-P2; Wed, 06 Oct 2021 10:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202695.357693; Wed, 06 Oct 2021 10:25:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY47K-0005C6-Lc; Wed, 06 Oct 2021 10:25:42 +0000
Received: by outflank-mailman (input) for mailman id 202695;
 Wed, 06 Oct 2021 10:25:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=13oh=O2=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mY47J-0005Bu-5x
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 10:25:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::601])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aa5d701-ad6e-49e1-a90e-f3305cc8a59f;
 Wed, 06 Oct 2021 10:25:39 +0000 (UTC)
Received: from AS8PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:20b:31e::34)
 by AM9PR08MB6786.eurprd08.prod.outlook.com (2603:10a6:20b:305::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 10:25:36 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::2) by AS8PR04CA0119.outlook.office365.com
 (2603:10a6:20b:31e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 10:25:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 6 Oct 2021 10:25:35 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Wed, 06 Oct 2021 10:25:35 +0000
Received: from bf358820dc3b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2544AC5A-C5B9-4CFB-A199-222B23AF10B4.1; 
 Wed, 06 Oct 2021 10:25:26 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf358820dc3b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Oct 2021 10:25:26 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6776.eurprd08.prod.outlook.com (2603:10a6:20b:350::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Wed, 6 Oct
 2021 10:25:23 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 10:25:22 +0000
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
X-Inumbo-ID: 8aa5d701-ad6e-49e1-a90e-f3305cc8a59f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae3FB2rpyT/4lXZBaiyLZGMGbJpTMT8SoEC62EmGOYE=;
 b=gTIVm1BOGra4kcF2cdylK0ZNBAx6HY375v0hZ0KurkeltxR6PJ3mSWmlf2+qMmSLJ5s5+sBK1+tJEl6tHbmc2J+J2dAJfqJlacB7AuegGtmEZqwyu/O97ePd7SiMhypzmiCyhXqMrsqDV5q6dcFRBjkMBrxmtD0b45CzHzGOBjM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7498e8dd08b00839
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyQe2kOZGRf45ZnJkJXDOXE+HL1X1qqe/qFNYHYMxOLQ2+0KTOxCDdEIMEdcnlfssAHHzioRGQqIbMa4+1x18M2oOezhyLESiP+HNVPYOpxzlCBqNGYaLoKfCoeZ/dCv3ThH8HmCSGMMgOAKa/gyJzhvTZI2X7pWu6Fgpj8w57p0mTIUUhfq9W2BQDjnvYq9CkF2t1OWMwlB/MICmbW0oQcLiYL7QT8R1bema8Q/bfE5FX5OZAmVBQhI8UP7Ufj95Toc8W6xynauE6GZ9Wv4PC5sF8v88B3uSdagSXk0TWLSCAmWyi19xisTikE4K9Ds+0Ew5Inex4lwpjViB5myPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae3FB2rpyT/4lXZBaiyLZGMGbJpTMT8SoEC62EmGOYE=;
 b=kpbNkb1leFYUODLWOCFyQoKqvzNWtD83cder6F06y7Xjdrd1r7HPWxIwjPJxJLXYOrd8XGC2PpXS1I37yIAuzYVNc2a9S1DJtjUHm/74qvWKa4f0s1ZdjdyJKuZ+N/+egE0XcAPH2Lvri/7Qt8PNQzv8LBC1tn6p1+myYTVyjTl6gSZYYCa5lDz2c6ZKco1iIk9KzlMgQZy3CP19QMs2tuzMbaxrm2PjfYacyqCeX4e10xwxOO1Ggz0wfEHNzyraSoa7cZ7LSeS1ivVLSVA2xjSBrP9flJT+RBzSDbclUjvh8KymeFpqeMfwfeegBz82PZjXmSDCSYYa2kQExrnpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae3FB2rpyT/4lXZBaiyLZGMGbJpTMT8SoEC62EmGOYE=;
 b=gTIVm1BOGra4kcF2cdylK0ZNBAx6HY375v0hZ0KurkeltxR6PJ3mSWmlf2+qMmSLJ5s5+sBK1+tJEl6tHbmc2J+J2dAJfqJlacB7AuegGtmEZqwyu/O97ePd7SiMhypzmiCyhXqMrsqDV5q6dcFRBjkMBrxmtD0b45CzHzGOBjM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "volodymyr_babchuk@epam.com"
	<volodymyr_babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, "paul@xen.org" <paul@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Ian Jackson <iwj@xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v4 07/11] libxl: Allow removing PCI devices for all types
 of domains
Thread-Topic: [PATCH v4 07/11] libxl: Allow removing PCI devices for all types
 of domains
Thread-Index: AQHXuSndFv+e6OSIekuaKFO6u9L6m6vFxpwA
Date: Wed, 6 Oct 2021 10:25:22 +0000
Message-ID: <2C987D26-9566-4F5C-B10B-4C5C74E2B269@arm.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
 <20211004141151.132231-8-andr2000@gmail.com>
In-Reply-To: <20211004141151.132231-8-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5ed95c9f-c060-480e-3dfa-08d988b3a2ad
x-ms-traffictypediagnostic: AS8PR08MB6776:|AM9PR08MB6786:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6786C3F0CB9922DD03DBBD5BFCB09@AM9PR08MB6786.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1728;OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DPwrm6x4Ks+jVLAbDHz+ylfM0FZzp1bj7Jwehim5gg+MPS2ETdlO61i9w40xHJFdFQ6Yp/Z1zTbFJT4Kx9ixWFB4maqdbYx2Fg0ULeFdvbaQBh3vc15BTptecuvaNnEtneyyRl9CDy1KW9SzIaianSW8o7SlOnRk3jEIOYM67FUwPSI89cMLnVnwIqc2tFzLLdBfiLgW20z8HOR6SBFeycpkyYiP/C1LhCEHS4qEMuZuitwljanB3IkT00IgsXng/G0BFFGQhDKHoEDOTVJJ7QJrNOfCZPpfcdpbI4aOypzKD+zxRdKuSCn5DVhgsKgmC4KRX99NP9X1PJAo3JGTImvqiusWz7yIWbnpNt+0hzWldibtpzO3mkX4xvp3JdI3cDdh7rIUNYLlF9gtAm2CA1Nmznw4LWi+F8yne5STGeAZ3f4TloNXyzDGo0pGY0hWc8XWxQiA/0vu1VMQRbHVBBEw9N1WadhCFhBRdIa4YS3XhfGxDAsA8kbjjk816NA8ab+BcQE+xWHkR365M0WZb14f4/lcqXyuRMgRsNzpd/D/pMLg7pjtvXlUPghbjxohfJRskQC9nGvGPr41AjTuu+3W/LqHb/AloPP7f0sdaJCf9Gd6ud6VueQihTd2eHxeZt+0nAlKdSIbsX0YU6Tgygu5w3sKXuHS/odSkPEjdBnGsyF0JydXPaqUEhqMa0LE2Q9erT2UsvKGNR7FTHaXsJOSVrS/RobalHXp45dnbmg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(316002)(38100700002)(66446008)(71200400001)(6916009)(53546011)(4744005)(33656002)(5660300002)(508600001)(6486002)(6506007)(2906002)(86362001)(7416002)(91956017)(26005)(66946007)(6512007)(83380400001)(66556008)(2616005)(8676002)(76116006)(4326008)(64756008)(66476007)(38070700005)(8936002)(186003)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E4FD7D0FDCAEE548932570548C6CEAE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6776
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6aa60418-acec-4b5b-5068-08d988b39af4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LZ/7tcZ3O9CPPxM2p8aZRQyBh3KgD1k5iCVrlxOr8rhAi4CqR1jlVoogQ2S/Fo3Und7Gu6692Xl75xg9TC1d6C0U7DtEROdayUzHzrp0rPUFCLGQjXGhMR8UW5dP1QOLg4HrAHu3Y0N0gnnah7EKxGWq9YWjnSnKKWsqbOw2QztMtifleDiPPUGcsbFtH/z25x3NjjmtAA35tkr6N2H6sYMRB20A3bJ86Uhjyz5bRjtiO+S7xlYL10o9ILD5HIW0TAnRFM0dGlKER/RaWYh4ZWPsGv4GJ2r9Nb46kOm2SfAXO/509bgZTIDU5t9dRGgIXNdRlgTqz3OUn4VOYfcg8lfChZCkB5FtefVmu010CxaaLjtnJTp9nyXtUYhw0xC+eC3zoGmHJ7xZQUPKLYfmuVWF7bNJD0BqPMNIvwhGTcTnPE3JrNthfmt3GvrPQ/9E813l0sVchQDjKOFg7Wij4cG9ELI3mwobux9d8Izi4vW7x5ok//KWoq5Bev2lDsNCjkOq1/lgjHA3IRBrYUAD572hW6BKNWsf5zktlB5T4zCMgb8iW6LTWMC6Q+lrMusEHA0f/mvo0E9VyPzPGXnaVGQJklN5D3cLgvwOInp9HsWyZ8rSkYOuSFsskdmzdPSbAtq+OZjuPEuwonWzqjqr0vNJrIP9WKbsXGRGKS4A+MHzMJF5CYZSXjYKmaFbSuHgV5MI81K6L33/UZFkxYqURA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(2906002)(81166007)(336012)(36756003)(8936002)(356005)(70206006)(54906003)(508600001)(86362001)(186003)(316002)(8676002)(6506007)(107886003)(6512007)(5660300002)(70586007)(53546011)(4326008)(47076005)(83380400001)(2616005)(36860700001)(6486002)(6862004)(82310400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 10:25:35.8332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed95c9f-c060-480e-3dfa-08d988b3a2ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6786

Hi Oleksandr,

> On 4 Oct 2021, at 3:11 pm, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> The PCI device remove path may now be used by PVH on ARM, so the
> assert is no longer valid.
>=20
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> tools/libs/light/libxl_pci.c | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 1a1c2630803b..59f3686fc85e 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1947,8 +1947,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remo=
ve_state *prs)
>             goto out_fail;
>         }
>     } else {
> -        assert(type =3D=3D LIBXL_DOMAIN_TYPE_PV);
> -
>         char *sysfs_path =3D GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource"=
, pci->domain,
>                                      pci->bus, pci->dev, pci->func);
>         FILE *f =3D fopen(sysfs_path, "r");
> --=20
> 2.25.1
>=20


