Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066EB74C8FC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 00:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560894.877047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qId6N-0001zS-Ao; Sun, 09 Jul 2023 22:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560894.877047; Sun, 09 Jul 2023 22:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qId6N-0001x6-7C; Sun, 09 Jul 2023 22:41:59 +0000
Received: by outflank-mailman (input) for mailman id 560894;
 Sun, 09 Jul 2023 22:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ju4y=C3=epam.com=prvs=15548f96ac=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qId6L-0001x0-AD
 for xen-devel@lists.xenproject.org; Sun, 09 Jul 2023 22:41:57 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccd284e6-1ea9-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 00:41:54 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3698k7eb020285; Sun, 9 Jul 2023 22:41:42 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rqsnw0vcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 09 Jul 2023 22:41:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB7332.eurprd03.prod.outlook.com (2603:10a6:20b:265::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Sun, 9 Jul
 2023 22:41:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::c192:26de:9053:ab05]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::c192:26de:9053:ab05%6]) with mapi id 15.20.6565.026; Sun, 9 Jul 2023
 22:41:36 +0000
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
X-Inumbo-ID: ccd284e6-1ea9-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYdRKwNmKTRwOJkBUYA896IQRLc1T1kpA2lrTW3hB+0bW565NDMno9bEueM+taMq6wcyLdXzk/punzL1sGBCgJmSKKUQcwBRmtzhGV9nhgb8a4tFejwPN9FzWY2132FRWMtbtTmhzhOOGEPc4g2y4MmZLsd4RbuwYbsir9qkRdkQpzsovJQs2a+boJxn0Hx62faTtpD34hmMHG+g5ALRVX7VTgmJXbq6+SYCkEYQh+dzbpEAJJriqzr2W6/AXqvYMXviCdeAhvrQjCgpT/7C6vEEQeiXKJ0oVyCQOs/LAzhKVn+zttPtfXC79YxbQ90ZKMtQMVKiHyt4SmUcnKTdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aVYmq3QfeoquBHeNsvcVznrvM5fa/h/ux57WUL+Zb4=;
 b=Hanas4I0pCJBg4in52sPLMBMwoP6nN6BDacnaiASrktDnG37jvea4WvDNwOR6Uh5OGLIRPK8s5zYmpSB4D8oxiWAsHTgzHpp/3PXXEAiG1LAUShNfUSyaegsk8s4mAecq7RHqsE+5+pn0eT7jbGbqQkMFNBgL7G77CropG7nthSLEbCSTpN+KL+TAUz0WCFvotxQz66HrZ0QIQrFHx6n4+LPxI8VUGOtcdhWg3ioeTmIRRHRyCJD4VWeP9wy1/sbPGNOjRAAiSg2En/Lviadc1I2QiahwHfoUfy9V2RnnRiXDdhNcOqnwvzYS5Jw7RQ3fYqlIUn4xQDQrWkt339vQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aVYmq3QfeoquBHeNsvcVznrvM5fa/h/ux57WUL+Zb4=;
 b=ab/0r8WIyfy7/gqby3tYsF3r6P2eclkpmGrUtnB6CxQueH/5nrpWNS/6K9fNSUTTHYnbkm7bKdRf7PtwlsnVfmfJVxOFTjMXoAhA3tH2ohvM8np0Rn6BHjRDLMquJTSiJw1ZHMG0bWDJaPujuTEVJ9saoFAh1EYsaVDE9d/Du1HJUl2Ilgy4MNj42Gw1Pn1MsspEz4ofW5JecRjn/qGEmRIUdecQUKGD3PGR8zkfWFv00InBrj60taO/tPmh8ymM8ZPcJp7lmmDIBmVgln7S4IpZP9f3Ip2UjNX8N12zORIh3deSNmKNk2aKpkTbpDd9DvD485C9JW0/udOPYHUn4w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHZneJZdDE+HOoSO0y6VB9l0x1hDq+No9OAgAgqUACAALl2AIAAzUWAgADPAYCAEhJlgIAArbcAgAdCCQA=
Date: Sun, 9 Jul 2023 22:41:35 +0000
Message-ID: <87h6qchfn4.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <87wmzfmltd.fsf@epam.com>
 <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
In-Reply-To: <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB7332:EE_
x-ms-office365-filtering-correlation-id: 695d0b31-2111-4a53-dcb8-08db80cda6f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dAt5Snm56mDKA5B+1N9UU9+j+yttnAMcgqwgc6N7xfXxY4Djg6pkYMR4eJH9xlF5Sq4vDjmD2yeioOCgPKIKMGuz0IlfUzgPVnRiVSZ2DwNUSS1s2nJbXppdthvOeblIXRmRjYfV33g4KuY2saFWu9jxQQMvS3/XQBG+IlggZT/onhZDeAvAt/woLDG61APIXOwLtPtHuBHX42Cn483oF8iAxMyX+2C91tk01fNEG2gkn6d5BiIeBzXJrk5c+F7HPB7PMNbjul6a+WJzq5ond/I3Cdvl94q831DEpeuffonsaXIF6xHgOAIZQVWBJlKJPvKYjgc+ztbJ0dYkDF634dUgY8f0QUpfhtjJXjhT/Jrc/+gRxOuzqjQeAk5GXbeLA2Axe+tujpX5c2Bhsj+8tjb2X251rQH+ecAa4/8XA3rnRrpctms+rejVBnJu6tQqJwaOy/9x2S3G2jCF5+xw9uNa5oXqcj58cfjy2Y4h6wO9/c4JVmYXdrwW9pvGKVsZ0Tnoq4eX6pyvGrSWUhdoA3fNfxaWdd8HE07TpkROFtojsuCzyN+NJMy+iESMijsmv3OfJcwEDXJr8HLopRxJ7+yjwZsskcElYDD4RKKH80BcOIP/2doDb6lLm8FUwPZb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(38100700002)(38070700005)(36756003)(71200400001)(6486002)(54906003)(76116006)(91956017)(122000001)(26005)(6506007)(53546011)(186003)(55236004)(6512007)(2616005)(5660300002)(316002)(2906002)(66556008)(66946007)(478600001)(8676002)(8936002)(66476007)(83380400001)(4326008)(6916009)(64756008)(66446008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?p8RFrXsL//CEAsBN0LTEHh/TgwS8xp9TNPWTYXvZHUZMMi7Gk5dbr3/28z?=
 =?iso-8859-1?Q?b7ljiTSaXOkefPY5Yqvi6gfAzebeRgSYzQR66ITnn2a2FiIx0IvsV0utfu?=
 =?iso-8859-1?Q?ZPhZ/CM/LPpEEZ25nDgM0fDq5p+ahrDZs9kXCTgCZ9PuerSS1AAhLBTWj9?=
 =?iso-8859-1?Q?6jtLNSdugHusf2IA9rle3+6GVl3x2Gvr9/oAI/xbftqnomlmUbmVqSQiUB?=
 =?iso-8859-1?Q?EErA5X/t42J5fstet5x/mufTgUomWi0ML+/KV1BSZzbDgA2IaP75slg4KL?=
 =?iso-8859-1?Q?AztAZ6pOja4nY9DxBJ2BwiFFByAy+r0YvKcYnL9bIzzmZdAjjFXC6e6GsL?=
 =?iso-8859-1?Q?5as6bA68NB2ZtUlEbbfteOzweqarTAmEK8MJi1hWp1Fy0hKLbIdsucIDVn?=
 =?iso-8859-1?Q?a7H8JKIe0IoCDpbP5NeTZLvBh51ayhBe5rXLCNetPWAYcoIs8wiGdQv5tT?=
 =?iso-8859-1?Q?9nEMbySyKqNtSFhh2TYtqS8IQ04/FBTfxsQsH6dM+We1as2zrb1dawUWPO?=
 =?iso-8859-1?Q?9Ki4yHS6Hek0ZmIzhabBXgzmr30slTDmTQbEMOutbRmV2WbCs+Xo7qeMf9?=
 =?iso-8859-1?Q?heGP0PTYVGmolheQ2kW/+Fv4OVr5mPuh4h32W9SPnvYtqcauS6y50mFQou?=
 =?iso-8859-1?Q?LeFyew1od0PweJ5+GzENnnEuRVUMcixo2bvpRlKqr8MvtINmYhsom8AuX+?=
 =?iso-8859-1?Q?cM37AxikV8aydM6ig53x1/z6VKmK1/G4dd+0u5WFti/rHZKA/AV5Bj7pBu?=
 =?iso-8859-1?Q?PiQ+N0gtCegYM0aNHr9JcskE2nPiHdd/fuWHn4F33VYAJXQJ0CuNhAXDKK?=
 =?iso-8859-1?Q?FtyWOXaEj5SrPQ+0Uo2TwbuinSxJsij2ciiDGqUUlbKVCg/qHUHhWqC6Hm?=
 =?iso-8859-1?Q?x/TeDPz7xwOKCDdqSa1sbVwrO6kJHgczxDWHXxqESMyyXwGpMF2j3IIA/J?=
 =?iso-8859-1?Q?2r34vNc/6AZTrtkEnU4P1lq0DikaXXEPrJ5wY1P4XbbdYaEJ7ZFhQhYZoP?=
 =?iso-8859-1?Q?gs9mp3kxqnQz1meU3Z6jlZe/xRPwDlTcYc/XHrR8PBGCQP4RUZXnJoHk5q?=
 =?iso-8859-1?Q?KRYrqCISoZx4BdTcybVSQhHNvdzr9vtHVkTt13yWelCE310CmeGomKuXt7?=
 =?iso-8859-1?Q?j0dg/9jiOBAMZkTcurm/cJ2K4hCoEurZXtaA0ccB7b3NZJvnzLqUmiyAvI?=
 =?iso-8859-1?Q?2xswJz3XuysAHUr+1w4lDiEjq2bWjp58PQt9Iyi69KsiS5JwrBvm71keqB?=
 =?iso-8859-1?Q?Pwz2awdi3BYLm+y+LXRFxVE+bXNpojS4x8nZhKV1LWo3m1AaqvO2GmWbOi?=
 =?iso-8859-1?Q?8A0vjgbwt/89n6F/iUibgWd1ynqTzz04/kqHSnjK2saVUnblP/UHUjvOct?=
 =?iso-8859-1?Q?Z4g6tiM64QDOp6nVNEoY8AOCrazanZNqaZtfry51Iq3WZe6QsraD4XkvaM?=
 =?iso-8859-1?Q?wkNsYxGzjrh+SQgQ5YGUCmOYNltDJQOvL2nyaKbgK9/sYD+cSEdx3hwYFo?=
 =?iso-8859-1?Q?A3Eu/AgRLBChM9EaVsljFmU0wV9KuxTtYwVJ0vX/53iTPOl7OFeZMLifP6?=
 =?iso-8859-1?Q?u+9SZ/P2Jzb359hPW3astlEdXW0E50EUkbEiQyoOmGxVIYfuXbd9ytBV2e?=
 =?iso-8859-1?Q?8TzCY+6EYJ4OzWSYGttJlgrKqAv5zlE4ornjiiXkbO1mTGYI8pyAW5mw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695d0b31-2111-4a53-dcb8-08db80cda6f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2023 22:41:36.0840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSbjr8LyM/NiODWxLGkvGAfC1ZRbQEG6+39BL+Zuaj2m/cjknutpsuejGGT86CZlbT5ja4J+/uoqtu+bXJsRxvPGzn6lFw0vrEhk3moNwn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7332
X-Proofpoint-GUID: jQncOV4S2-MJrKwUXSpEzi3OPPMc9eia
X-Proofpoint-ORIG-GUID: jQncOV4S2-MJrKwUXSpEzi3OPPMc9eia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_16,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=990 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307090214


Hi Jan,

Jan Beulich <jbeulich@suse.com> writes:

> On 04.07.2023 23:03, Volodymyr Babchuk wrote:
>> I am currently implementing your proposal (along with Jan's
>> suggestions), but I am facing ABBA deadlock with IOMMU's
>> reassign_device() call, which has this piece of code:
>>=20
>>         list_move(&pdev->domain_list, &target->pdev_list);
>>=20
>> My immediate change was:
>>=20
>>         write_lock(&pdev->domain->pci_lock);
>>         list_del(&pdev->domain_list);
>>         write_unlock(&pdev->domain->pci_lock);
>>=20
>>         write_lock(&target->pci_lock);
>>         list_add(&pdev->domain_list, &target->pdev_list);
>>         write_unlock(&target->pci_lock);
>>=20
>> But this will not work because reassign_device is called from
>> pci_release_devices() which iterates over d->pdev_list, so we need to
>> take a d->pci_lock early.
>>=20
>> Any suggestions on how to fix this? My idea is to remove a device from a
>> list one at time:
>>=20
>> int pci_release_devices(struct domain *d)
>> {
>>     struct pci_dev *pdev;
>>     u8 bus, devfn;
>>     int ret;
>>=20
>>     pcidevs_lock();
>>     write_lock(&d->pci_lock);
>>     ret =3D arch_pci_clean_pirqs(d);
>>     if ( ret )
>>     {
>>         pcidevs_unlock();
>>         write_unlock(&d->pci_lock);
>>         return ret;
>>     }
>>=20
>>     while ( !list_empty(&d->pdev_list) )
>>     {
>>         pdev =3D list_entry(&d->pdev_list, struct pci_dev, domain_list);
>>         bus =3D pdev->bus;
>>         devfn =3D pdev->devfn;
>>         list_del(&pdev->domain_list);
>>         write_unlock(&d->pci_lock);
>>         ret =3D deassign_device(d, pdev->seg, bus, devfn) ?: ret;
>>         write_lock(&d->pci_lock);
>
> I think it needs doing almost like this, but with two more tweaks and
> no list_del() right here (first and foremost to avoid needing to
> figure whether removing early isn't going to subtly break anything;
> see below for an error case that would end up with changed behavior):
>
>     while ( !list_empty(&d->pdev_list) )
>     {
>         const struct pci_dev *pdev =3D list_first_entry(&d->pdev_list, st=
ruct pci_dev, domain_list);
>         uint16_t seg =3D pdev->seg;
>         uint8_t bus =3D pdev->bus;
>         uint8_t devfn =3D pdev->devfn;
>
>         write_unlock(&d->pci_lock);
>         ret =3D deassign_device(d, seg, bus, devfn) ?: ret;
>         write_lock(&d->pci_lock);
>     }
>
> One caveat though: The original list_for_each_entry_safe() guarantees
> the loop to complete; your use of list_del() would guarantee that too,
> but then the device wouldn't be on the list anymore if deassign_device()
> failed. Therefore I guess you will need another local list where you
> (temporarily) put all the devices which deassign_device() left on the
> list, and which you would then move back to d->pdev_list after the loop
> has finished.

Okay, taking into the account all that you wrote, I came with this
implementation:

int pci_release_devices(struct domain *d)
{
    int combined_ret;
    LIST_HEAD(failed_pdevs);

    pcidevs_lock();
    write_lock(&d->pci_lock);
    combined_ret =3D arch_pci_clean_pirqs(d);
    if ( combined_ret )
    {
        pcidevs_unlock();
        write_unlock(&d->pci_lock);
        return combined_ret;
    }

    while ( !list_empty(&d->pdev_list) )
    {
        struct pci_dev *pdev =3D list_first_entry(&d->pdev_list,
                                                struct pci_dev,
                                                domain_list);
        uint16_t seg =3D pdev->seg;
        uint8_t bus =3D pdev->bus;
        uint8_t devfn =3D pdev->devfn;
        int ret;

        write_unlock(&d->pci_lock);
        ret =3D deassign_device(d, seg, bus, devfn);
        write_lock(&d->pci_lock);
        if ( ret )
        {
            bool still_present =3D false;
            const struct pci_dev *tmp;

            for_each_pdev ( d, tmp )
            {
                if ( tmp =3D=3D (const struct pci_dev*)pdev )
                {
                    still_present =3D true;
                    break;
                }
            }
            if ( still_present )
                list_move(&pdev->domain_list, &failed_pdevs);
            combined_ret =3D ret;
        }
    }

    list_splice(&failed_pdevs, &d->pdev_list);
    write_unlock(&d->pci_lock);
    pcidevs_unlock();

    return combined_ret;
}


> (Whether it is sufficient to inspect the list head to
> determine whether the pdev is still on the list needs careful checking.)

I am not sure that this is enough. We dropped d->pci_lock so we can
expect that the list was permutated in a random way.


--=20
WBR, Volodymyr=

