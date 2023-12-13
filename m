Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4649C812378
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 00:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654254.1020948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYuk-0003iA-Ce; Wed, 13 Dec 2023 23:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654254.1020948; Wed, 13 Dec 2023 23:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDYuk-0003ez-9V; Wed, 13 Dec 2023 23:45:18 +0000
Received: by outflank-mailman (input) for mailman id 654254;
 Wed, 13 Dec 2023 23:45:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVP7=HY=epam.com=prvs=67111d5ab2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rDYuj-0003eo-9j
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 23:45:17 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a967eaf6-9a11-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 00:45:15 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDJ2iKW012660; Wed, 13 Dec 2023 23:45:02 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3uy0y4vams-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 23:45:01 +0000 (GMT)
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8666.eurprd03.prod.outlook.com (2603:10a6:20b:54c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 23:44:57 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 23:44:57 +0000
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
X-Inumbo-ID: a967eaf6-9a11-11ee-98e9-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6DQwe66U3SwrXOqtVQYC4Gy9syTXVyPFNTEWnalKLwEIRdov8WXQJ+AaltvjBbqS6cVYVv+h6w8HRDumOlB31glcxR8ur5dgMLrARfcBycAqJLvB/Gl96DyMGI6rumgyTIGg1oJsIWY5aFEjT8fHvad537nbesHIHzIeQzlR6j+wZe+Xy1yk45VvEOivOuWwdMP4Vastx69OB7LgkM788pMMNlDiDu6/gQk//sov2LAn4zPq9oh1cfVv6F3mG69rkx+B32dbMkHPPOjOfy7asewHbqCkuSKRxAz5ABS16STORu6NRjYWv20TuwBheRbKqGYsuji4SivKEIfcSb7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwOLHmt/xVQKtVQ7dFIiwMzlKRmuQ+IjFFkVQYwTpbE=;
 b=kCbpnkHRUCGXnEJ9edKwrzP1XcWZH/2D8IgXyxd7CJxmH4WuidUGtADIeKVvOBQWtAGnSSurbGFKF9fCLNtVuKoTvvazu6qXvycJYh0cfeRaB0D6TMDQfGx1qOHLs85KEtWVPbOIFrLp9fla7QOLCuB7GmANCNax3ujb/2BsWhS7SvrSf9Sjryq+hRK2i8jf5ZXCzaNJzCz7ryq9x8WvG4WjTZEiS38zTuKqQDNSB6/0xsEggL0MWgBobuDuoSfvckLrYeMEMI1m0gavM3XVfEuMVF2RJzYltQqSjhEuD/bJvzdCqxxaEU5P9BEAmgJeOUfx841XMAXxCW7EbXKOMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwOLHmt/xVQKtVQ7dFIiwMzlKRmuQ+IjFFkVQYwTpbE=;
 b=rqsjj3bEp6fzB+vPTJemzRmPex1AvoJE6X/J3yDzfnTUE8e4pTEsAbMSMD4Zl593KBmkkX1S1zr28tFo7vcenA3vRT86Ztk3oeQ5+Xk+caRJN891prj/ljKxzemLwohMuEXU+dQzsrNak8/xuo3loonD38Bs1W5RR2TRnVEiCyTwEL9Qdkupwa7/8tH1Dhc6LxQoCm8zlGqoCIH+YjHyQPlDhtJ0Lu+Iteau5v8vAtoVY/oiEylFzEN7U077MJZFJW2GIANd/PKBufv3l/Mnrp7VkOCM3O2wezfhFY9PlIUnwowRrDhGDyioSWKxhEPZSCZqvPYgAkhhzecftEn5SA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
        Anthony PERARD
	<anthony.perard@citrix.com>,
        Juergen Gross <jgross@suse.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        Christian Lindig
	<christian.lindig@citrix.com>,
        David Scott <dave@recoil.org>,
        =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [RFC,FUTURE 0/3] Make vSBDF configurable by toolstack
Thread-Topic: [RFC,FUTURE 0/3] Make vSBDF configurable by toolstack
Thread-Index: AQHaLh5gqP9om/bdnUuJG4CQUapQdQ==
Date: Wed, 13 Dec 2023 23:44:56 +0000
Message-ID: <20231213234345.779722-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8666:EE_
x-ms-office365-filtering-correlation-id: 3d17fa42-7f18-436a-1956-08dbfc358343
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 H+uVTkZ+H5p67ftzYdLEoL0Ja40q0O+H6kHv9fMuypktwSWH76DJN9U1XEgN2biUrn8RzEOLjRQfaUWSwWuxVlrd6mtf8ekB5Ss0FZHzTaUivD9jimReFGLMV4SyezjkS9upnO9PTbn5YC45Vo2dYgC9aCwKDVmPJgjWFlTS6iEFVnjHinF+kuKLqxhRxe5tKwzEEzeZM3jpNudfjBU0mSh43GeH60C53+xaUPhXaIiBTVjo8AIMhDq7VnIVoShQfapIFLDOLtTjloavKRq3Qav7luBiNjw/vHH+ZjykjdcmeLoEDvTMIoQHG7X2HhQZmtX0zwkOz2KWmrOadWtIMQTa91YyW6jK+xgNHSpgv+2ImiA98iiEtNtSlk103oIBDtzWWrC75l2ZM6pD/5RtMfUM7y98aPQChxWI0SnspjQl5ePbcudhxGYJn3/1aNXH7GEzzbH/XGi/vUnabNcSi+BBQD+9+Ddt0kfXgp4R/PauWAW59gWL0dUjuJ0IILXjqWInFYZLbYrNTZZDt4B1Ni72a9Et9HAjHrd9IgTkKiMBNL2eq9re2hhg5z56uCHmuGIha6NeDGCie7kC1QXkMAieHXml3bLZFCkxpbMu39Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(26005)(2616005)(71200400001)(6506007)(6512007)(55236004)(83380400001)(5660300002)(7416002)(8936002)(41300700001)(2906002)(4326008)(478600001)(6486002)(966005)(66556008)(8676002)(76116006)(66946007)(91956017)(316002)(6916009)(54906003)(64756008)(66446008)(66476007)(86362001)(122000001)(38100700002)(36756003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3o/rOBUCL3+rGJYffQvq9P7uVhaEY3UeqppqKlJkFxyhpk6DJyTQHW7JTt?=
 =?iso-8859-1?Q?ymmm0MKq8yLK0ffkc6m1UFC26Cir30XWAGnHXQX7VPDhU7/jr7jcSvVQVj?=
 =?iso-8859-1?Q?aE+bzsDOtoRY5OJlcBV1DUIJ5vXZAI+vw4I5mFAgpTGXUIa4edUZxQWOXg?=
 =?iso-8859-1?Q?+LfFmFYZ/VU/V1PBxhMotOtEiHUdaVs7hvApXYEeksIK39XBiKDpoC+mlf?=
 =?iso-8859-1?Q?5xUQucnnDQ4pMChpVwSV5s3wJRnu2+oTvznnpn3f0LybjYFjLBfItA5B3f?=
 =?iso-8859-1?Q?6HHKG7rMTxdtpLgdc6gIoWTZ+2RiLbyMqSUQmESpltJilUd1zN3O45Jy6C?=
 =?iso-8859-1?Q?nfjsLlPEsnnekEbfDnfkb01bHXgP8AMTpdWwoLt9rVQQndO7+iL4r9nCKx?=
 =?iso-8859-1?Q?aSMxqVwJjGoFcUBrdslP1b5I/0lD+XP6wpmVzGP9rJR9vhPjDVfPZRZ3Pr?=
 =?iso-8859-1?Q?8xfUBlqeZTIKjewb1AYsK9np5wPmaLEircKEvpT31Rs4/MxqIVsIsiDFJJ?=
 =?iso-8859-1?Q?bzbtIOVxOvtGKhSg2pRiVtaih4Zy0Tu/f9I+rRnWC9WNnfoJBXmDLUEzKY?=
 =?iso-8859-1?Q?U8ZpgDklDYCwpcj5BnNCgVVBi6Rt908F8jV0wh6ERA/CT4QwyPpqq+XmAu?=
 =?iso-8859-1?Q?nnUt+lTxcDjlmF2AQ4C9wChKY0EYfi+BcCEC244ErPI888yzK2DBBrud/r?=
 =?iso-8859-1?Q?doYYZ4LvXUSXhxz+WQsPxkXsHqX71z3y+iVjGn/zFHfw+yBK5QwpkVL734?=
 =?iso-8859-1?Q?X58h44RSiSm8yxHURtZfcqqdLd3HDr1XtzT7OO5u2UlvrmXcv42bmTT3bA?=
 =?iso-8859-1?Q?t1q0DdEseUNOzf+crZzE/8AZ+KW7vjZ7n9x5TbvRXQlJTDYT/rZMLOb+tG?=
 =?iso-8859-1?Q?xcqFDRDIBMJ13ZHOsPKlwj5m0HR/WygCyWZC+4PUDrG8cpodyEhjXRNTz/?=
 =?iso-8859-1?Q?7JulDZ0ZUNM/j6jQMafaGBZpI7dd6iuzw9/t+wXwT4rLIDkfZ3D/0W43jp?=
 =?iso-8859-1?Q?qZUbHzbMwcYFpuOTdSwpTRkxcaHb9qqocohHjxDESGHscR5w1ea3EJsuSX?=
 =?iso-8859-1?Q?RR/sOikwCF4ldYEwrt+pqdEn31ei0LxGKOWaowTWYrYuDm4XCJrPMbUhC4?=
 =?iso-8859-1?Q?bntpiOAcPGvK7kdMGuZL2V89v11J99BUL1sZEsM3qiFTVMu/bSVVza1uMb?=
 =?iso-8859-1?Q?qYaRLz3XgBw0YlKDutOM/WmoPHNcPOg6+YOTOfkYegQJi8OSvb3MPILcRR?=
 =?iso-8859-1?Q?5seQrWkUmUV3Lnv2pRbC8OJo111RyUeeL5/XWGfd73u8BcRNwuD6ENkNd+?=
 =?iso-8859-1?Q?KU1JtQhminTdZ6+NQHKEjQm8SBbC36xUtTvup6ZZzKLNT/JWHPWtw0vxEy?=
 =?iso-8859-1?Q?ZmdtFirtYXhOUu1I/J9t7uMltGpwxW4i76HacjL/Zcjyk/Qcm6BtU7kjUC?=
 =?iso-8859-1?Q?siE4AmNaGi1s2OXTMf4WhxxOUvPTWN1q8DYYLFtDuUCFJqPU2ELUv/XBut?=
 =?iso-8859-1?Q?UOoE/WakgCG1ctg8LqynNwtqdST4l91JYrlyCiZJEKAY4h0WKtYNYbEJal?=
 =?iso-8859-1?Q?d34kBvb3cftYyEFAXme3Oxhxr7072qYh3Yl0Bjb4mHZ51w4ezIQycrtCO9?=
 =?iso-8859-1?Q?wKCo1gS8zsX8hRvPhpRzriB1kTLSKMtNn72s5bnQ9HwkzRF4sFgU8Qjw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d17fa42-7f18-436a-1956-08dbfc358343
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 23:44:56.8674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SmPnDhMJp+B7mVkDrSwiaBuTSwwykX/j85XCMLFBIjcxBsCjOpfCy82F4hTC/F3o9BQshrsSZLjRcvmVKsV7oaVM48ZrX2ztn0xs2e3UFYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8666
X-Proofpoint-GUID: wLneGQ2sNluAE_XUS8cx3v-VZ9Z4XQmh
X-Proofpoint-ORIG-GUID: wLneGQ2sNluAE_XUS8cx3v-VZ9Z4XQmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=587 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312130168

This patch series is a follow up for the dicsussion at [1].

It adds ability for toolstack to chose Device part of SBDF for a PCI
device when passing it to DomU. First and last patches are quite
straightforward, but the second one ("tools: libxc: add virtual_sbdf
parameter to xc_assign_device") changes API of libxc, which is big
no-no, so it is just a starting point for a discussion. What is the
best way to do this?

Another topic for discussion is the first patch ("domctl/pci: add
ability to provide/request a virtual SBDF"). It extends existing
domctl for assigning devices, which is fine for this use case. But we
also discussed use case of virtio-pci devices, for which we want to
allocate/request vSBDFs as well. Problem is that we cant't use
assign_device call for this because there is no physical device which
can be assigned. Probably we will need another domctl - specifically
for allocating vSBDFs. But then there would be two domctls that are
capable of allocating vSBDFs: assign_device and this new call... So
yeah, I am open for suggestions.

[1] https://lore.kernel.org/all/d6a58e73-da51-40f1-a2f7-576274945585@xen.or=
g/

Volodymyr Babchuk (3):
  domctl/pci: add ability to provide/request a virtual SBDF
  tools: libxc: add virtual_sbdf parameter to xc_assign_device
  tools: libxl: use "vslot" parameter when assigning a PCI device

 tools/include/xenctrl.h             |  1 +
 tools/libs/ctrl/xc_domain.c         | 13 +++++++++-
 tools/libs/light/libxl_pci.c        |  9 +++++--
 tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
 tools/python/xen/lowlevel/xc/xc.c   |  2 +-
 xen/drivers/passthrough/pci.c       | 17 ++++++++-----
 xen/drivers/vpci/vpci.c             | 38 +++++++++++++++++++++++------
 xen/include/public/domctl.h         |  9 ++++++-
 xen/include/xen/vpci.h              |  4 +--
 9 files changed, 73 insertions(+), 22 deletions(-)

--=20
2.43.0

