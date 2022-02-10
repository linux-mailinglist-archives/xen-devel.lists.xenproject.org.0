Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A04B09CE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 10:45:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269737.463819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI60J-00013B-3j; Thu, 10 Feb 2022 09:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269737.463819; Thu, 10 Feb 2022 09:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI60J-00010u-0h; Thu, 10 Feb 2022 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 269737;
 Thu, 10 Feb 2022 09:44:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=227Y=SZ=epam.com=prvs=404006422a=oleksii_moisieiev@srs-se1.protection.inumbo.net>)
 id 1nI60H-00010o-U6
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 09:44:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10962d61-8a56-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 10:44:40 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21A9gnBb024521;
 Thu, 10 Feb 2022 09:44:35 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e4yy882r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 09:44:35 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AM0PR0302MB3393.eurprd03.prod.outlook.com (2603:10a6:208:11::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 09:38:55 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::c1c:f98:9dd:86e0%6]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 09:38:53 +0000
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
X-Inumbo-ID: 10962d61-8a56-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEnuQopIOWEqKnp1FruWnO14TdNe8VjX49wOO4x+6MbDnmHGEGjuFAyPQzfyKaZj2IBAwpv8S59HlyqSNbWtoChYIVCYZdI0mZZsjqfsdRyJOSz/oFRhri6iwPaaL9+5ZqS7hUKvPpl4uw7JkvVa96v/NVCVCfa16kxtrcku2EbuLPZJjNebY9RIDjHum5uKH5Fq5dxutZ7GMKRpmfL9lrLDS+GurcaorNK7ITQnUP071TAFp72cBzd+7VmgSQYl9R2LaWuWs8QHkusG6g6ZvzbLcgPGDHeif2gqACkeF/Hlf3RsiX+vfA0Ag+5lJaCJwRM4VZiMU88w3tBBDBWrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEqkvuJ5/4V8NnvZAKxYIs6jlIia3JW/ziM1jfYuOUA=;
 b=lCPaHpjzIWUk75jGCHgrX1UPegRKr4Y2HIlDRmXC83px35SYjt7LInSWs5XEnXUeLYhmZl5ZcY3lC3HlVdJeFpWxJCyv8jKC0yZBFyJc4r1Y+s9uc7BnXLfIwzgVFAlVz0TRTtKXbwEztA4A0dsf+jKf4GZAo+21KORRbrqSggCXtg/DCU1Obai8tzNx3b6z/8j8GiBo1L4De1V9HPdsCxqHsyP/RkhYZwMmswxyYYO2kJOjXLr9r79ARFGYn9H20LgEH/WG3lwtrvuEpamrrfbjpiiHdLfboUfTF3NW7V8nf3Ui2h8+YCJBIgf550iHKv5Y+sHFRz6bNEhf/JXxVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEqkvuJ5/4V8NnvZAKxYIs6jlIia3JW/ziM1jfYuOUA=;
 b=XcLDnHpuxCZFdc+s2oIfmdOizqNlhPTzjP+ZGyb11V+f36URjSc9WhCi3vldd52c+V/CqjwJ2hnMhDOTZx1c3dPSezsqC2m78MVF5vDwtY4If3UzYW9HjCGRIFTe56DQr6Agb6eECDuRpoxjLLFDWSi8go5mFZZl1A/RN3lF3E8Qtv8lB26DoMYkv4TLKX++TCqwGnrt2Bhur/7CS65fJihCpKpg/sOWE4AIcmvaeSRPf51nmWF1wjNihddztOi1hm3VF8kIMynKx3dZ2HDo9zGB/2RcptMThfkKD3LC7O1NZXV1UfIPDFwBsG7aefRrVNJshSW4+NMdTlgxblSF7w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Juergen Gross <jgross@suse.com>
Subject: Re: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Topic: [RFC v2 3/8] xen/arm: Export host device-tree to hypfs
Thread-Index: 
 AQHYHRW1S717SraA0Ui+K6wc2/TNAKyJ+LkAgAEKd4CAACCZgIAAbkMAgAAMBYCAAOvKAA==
Date: Thu, 10 Feb 2022 09:38:53 +0000
Message-ID: <20220210093852.GA1700852@EPUAKYIW015D>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <e440e4f16a506ecc87078635dbb3fda2ebd45346.1644341635.git.oleksii_moisieiev@epam.com>
 <b88f6a50-6e9e-5679-8d25-89e26031e88e@xen.org>
 <20220209102037.GA1025795@EPUAKYIW015D>
 <316bd101-af8b-d2f0-1db5-ea6c583acd59@xen.org>
 <20220209185156.GA1475048@EPUAKYIW015D>
 <6fcf1e16-0c9d-c871-76b7-59d9311e9db4@xen.org>
In-Reply-To: <6fcf1e16-0c9d-c871-76b7-59d9311e9db4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fbd6a43-28b2-4621-5436-08d9ec7926b9
x-ms-traffictypediagnostic: AM0PR0302MB3393:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3393E840FD5D04DB28DB1873E32F9@AM0PR0302MB3393.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FQikJ/3zTqfAmH0LrwPp3ZlXHtYGUidujtZ+4sDuqYmlN8Pss8wWSKlt3ZXTUGt0KDeOSZJQZkoCBpjroKsWOYCNMLrya1as1PX8Z21noTIu8YXZ/NWGDuXKWomsdOe0FC4Ufvm0w9yRNzxsFox+N7lVVz+m0aRrfneEJKG3AHTIqjcgzwRdjospzyYxBBKtAJt98RQxYpQz3hkG2tZotEpPk+mWDnS75p+O8xzeKbkCHN4pO1o9ia7Eanpb8GuqyLZhQR0Zp/54q+PoqhRxu/Rv2MU6lBmYdPj1wyFelQpYniuBGDF0zzt9WaotP/Gw9cRP6RMIHHLqvuCB3cYRnnD4tnhUO2Qhwd5VY25KT0vHnALmQEnrtxRIMvfarrqVPRQ5JZAjQUWZ3mfqXAoEllnSTtjxP3bH0riBXXMQERWBI71IiJEipn5P+yDyT2kbSLrWgbnb8b3BvNWrFto5zzDc0qdPgFd+OHkS5jpxu5fn4AFb1ahNpJNX0CipzEqB8zltoe0eDcOgEnnC3lhrKC6IlgwI02EAsvw02kNp3at0ao1k12Avu75dDfY/nUL9Y73IVmFAqdSiy7xxyevwqaRaD55xo608JfDGU2pXh2kRtigmD5kaA+OADPxjMfrakRKNnd8Clc/qMLsQhjy9UlueOmlhKJAl0sU+64rAOK9P2A2kz7eqZaGT/1NUJlKOHKR+BlhIER2htPMpiDuPJQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(33656002)(8936002)(71200400001)(53546011)(186003)(83380400001)(2906002)(38070700005)(66446008)(54906003)(38100700002)(26005)(86362001)(508600001)(66476007)(6486002)(6512007)(91956017)(122000001)(9686003)(66946007)(76116006)(6916009)(64756008)(8676002)(6506007)(316002)(1076003)(33716001)(66556008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gO+PdyjdI4r0FMMjljk6FvwzLYP3RB4/ntn3YzMIwCHg6Rr9QyMctJlocTw4?=
 =?us-ascii?Q?55xmAiQ9jzp52LiMC7UOUcEL452SHHra7EYW6MStg7LUbuEGkTjvrdAOV/E5?=
 =?us-ascii?Q?tPV5rE9Rgob9lkWgeSYX8F3kdrJbnOzzn3pKs161mKMDeuDJ16feTadVBb6Z?=
 =?us-ascii?Q?V1D89eFCcjtPosPFMjEEE/pkusmS/iFNJY1XkF/XGVl8l2Xpfja6b2PqdIRw?=
 =?us-ascii?Q?mgtlmnEK185YTiPDG5uBnHh+OnE1fo8sVH9gOg4wF6PkVysE/qDamwgdeK90?=
 =?us-ascii?Q?HEZUr8O9tk9e6tgAlQZmUAxCO0dLGS9t879J9FJymqphKtBuFtsejNW5iF30?=
 =?us-ascii?Q?7KPrVGeyBHjwqzjVxvpGA/CnIXKmdPATbfKVHLsEZxdkkuSK7f20vrGY9XPt?=
 =?us-ascii?Q?BzYgV4WD5WIbRDmLpXweexFzMFNzjOFsrDcIBrvZKwXbLc7RkNLh/koP83gZ?=
 =?us-ascii?Q?f/zfaNJemm49EHpZGBi+NwgFLZA7m7hhhAL/Ae2uEKOpSe/jqv4QFS99Hzq1?=
 =?us-ascii?Q?mmTBaIw34bzC9C1sMTHM74APjETFSVG0t1pb8wPWBEfIpwCcOTlwTWw8p+25?=
 =?us-ascii?Q?8JeqLKsjbFPlVwdfzU2AJI9hErG8r4znfZdOmNP5qR5zu5bOBD30A9DiKchg?=
 =?us-ascii?Q?vpKcLuvElUa4eLCKcEs7AgKvBz74/R7zfVE+3RydVKX0TXybm1afyolIkdKf?=
 =?us-ascii?Q?VepPm0PyNcU03tUDtZmrncqI2PI217AzSA+0rUsrL7mzFN8n+sHKf7lck6El?=
 =?us-ascii?Q?mEaEI9yQVhceveEjZJ1zw5fYv5tDc7trHKqFthpZG71erpPczRIxIPRvxoX4?=
 =?us-ascii?Q?9+lta71oNAMxmT5eU39oEWuBRb+YFFy6L/N1LB6F2ba56Nx/5Y1IYSGrFQ9h?=
 =?us-ascii?Q?goj5F1/LT/e3aACU5JIsTLMJud96jf32UU5aBfHlRspaxzHtwmZVIwq8hQsJ?=
 =?us-ascii?Q?Ej8rWtKhPHTKo3g97dFnInyQYksnZpN4fJc7MeR+TQCpMep1VDETczL8we5a?=
 =?us-ascii?Q?BIPz/nJvPEoaxnCnx4YgDDIA8/eOw+Vi3Nhfdy4PUcClvJSRp2+0g8rueNPF?=
 =?us-ascii?Q?uhxuMeGMnu2jgWZpg7MqVa3ELjW78hC00eXtNQ2NDF5cGx1PUvaVHbgjlOB1?=
 =?us-ascii?Q?dI6QOxHvXkwOSvNst5JHp+batT9ZNmk8a9K/vvfUcMJV8+nv8zkmayaPrhKy?=
 =?us-ascii?Q?I1zHly7iRtASB3kvQOq3i4i5Gxl9CxrVBLlUkkxMPptf6QQPO7ELdevSBxkh?=
 =?us-ascii?Q?dOqcXyADXTOkCnbJo1ANwIBorSyBk8sPKNOLOO8TcYGDmvioyWgOMHQkt1fy?=
 =?us-ascii?Q?oCu/NIaXqouvQ6gSxOpPGOVxy5dNDIu43ztL8ukXWCaV7U1q/pPhscmJioh+?=
 =?us-ascii?Q?oIXDKq9wxfuK7BnYGqFTFiK4AHA3WRowTxqs2PL69XK+WgiDlzAftWjaOTg0?=
 =?us-ascii?Q?iG+2mlalVeq0APyDBtldGmAhV72bVOZurd64/32yR940ZVIZ5cZBiLqmGFGX?=
 =?us-ascii?Q?uPUZ2NTUzElYtkuoz8aJS7viUOS0Uz42jV0dz7GO6ivkpbvkVkB2wCuqt0JW?=
 =?us-ascii?Q?p6EmhBovqpz/9Mbs6A+aQTBZPpP92OiDPsxLtZZkZ32HVrtP/ytr5qgf2V86?=
 =?us-ascii?Q?XqeSVm33OO7LAM5N8yMEqqnavW4mhWuUyLCnVjN2G5oli5HN4Tt8okFVxNvi?=
 =?us-ascii?Q?6l9k7m0IfqSURanhcMORnHlWJFU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <66310011DCA2F742B83C58314735CEB3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbd6a43-28b2-4621-5436-08d9ec7926b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 09:38:53.3419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHO3FIyX9lJI9F2GnU9SctvhoPJJxrNh097Wb8Jt4TydsT/lNuSEWNoU1UFTjZZxgYxLk9Jz9KUelncAPgYeEe/Zc9Y49+CyaBVek0cgN6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3393
X-Proofpoint-ORIG-GUID: MppZuS-fdiCYsI5JUgNhKk4toNc11nF9
X-Proofpoint-GUID: MppZuS-fdiCYsI5JUgNhKk4toNc11nF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_03,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100053

On Wed, Feb 09, 2022 at 07:34:57PM +0000, Julien Grall wrote:
> Hi,
>=20
> On 09/02/2022 18:51, Oleksii Moisieiev wrote:
> > On Wed, Feb 09, 2022 at 12:17:17PM +0000, Julien Grall wrote:
> > > > > > +static HYPFS_DIR_INIT_FUNC(host_dt_dir, HOST_DT_DIR, &host_dt_=
dir_funcs);
> > > > > > +
> > > > > > +static int __init host_dtb_export_init(void)
> > > > > > +{
> > > > > > +    ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
> > > > >=20
> > > > > dt_host can be NULL when booting on ACPI platform. So I think thi=
s wants to
> > > > > be turned to a normal check and return directly.
> > > > >=20
> > > >=20
> > > > I will replace if with
> > > > if ( !acpi_disabled )
> > > >       return -ENODEV;
> > > >=20
> > > > > Also could you explain why you need to check dt_host->sibling?
> > > > >=20
> > > >=20
> > > > This is my way to check if dt_host points to the top of the device-=
tree.
> > > > In any case I will replace it with !acpi_disabled as I mentioned
> > > > earlier.
> > >=20
> > > dt_host will always points to the root of the host device-tree. I don=
't
> > > think it is the job of hypfs to enforce it unless you expect the code=
 to be
> > > buggy if this happens. But then I would argue the code should be hard=
ened.
> > >=20
> >=20
> > Hi Julien,
> >=20
> > Unfortunatelly I can't use acpi_disabled in host_dtb_export_init becaus=
e
> > I've already moved host_dtb_export.c to the common folder.
>=20
> I am sorry, but I don't understand why moving the code to common code
> prevents you to use !acpi_disabled. Can you clarify?
>=20
Sorry, my bad. I thought that acpi_disabled is defined only for arm. Now
I've rechecked and see I was wrong.

> >=20
> > As for the host->sibling - I took the whole assert:
> > ASSERT(dt_host && (dt_host->sibling =3D=3D NULL));
> > from the prepare_dtb_hwdom function. And this assertion was added by th=
e
> > commit b8f1c5e7039efbe1103ed3fe4caedf8c34affe13 authored by you.
>=20
> I am not sure what's your point... Yes I wrote the same ASSERT() 9 years
> time. But people view evolves over the time.
>=20
> There are some code I wished I had written differently (How about you? ;)=
).
> However, I don't have the time to rewrite everything I ever wrote. That
> said, I can at least make sure they are not spread.
>=20

I'm sorry, I didn't mean to be rude. I've just tried to tell where I
took this assertion from.

> >=20
> > What do you think if I omit dt_host->sibling check and make it:
> >=20
> > if ( !dt_host )
> >      return -ENODEV;
>=20
> We used to set dt_host even when booting with ACPI but that shouldn't be =
the
> case anymore. So I think this check should be fine.
>=20

Ok, thank you. I'll do the change.

Best regards,
Oleksii.=

