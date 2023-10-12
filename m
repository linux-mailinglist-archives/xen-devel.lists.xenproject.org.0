Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA57C794C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616078.957915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sI-0005B9-E2; Thu, 12 Oct 2023 22:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616078.957915; Thu, 12 Oct 2023 22:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3sI-00056p-8V; Thu, 12 Oct 2023 22:09:46 +0000
Received: by outflank-mailman (input) for mailman id 616078;
 Thu, 12 Oct 2023 22:09:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3sD-00016s-SX
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0971534a-694c-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 00:09:39 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqPBh007501; Thu, 12 Oct 2023 22:09:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8ed-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8758.eurprd03.prod.outlook.com (2603:10a6:20b:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Thu, 12 Oct
 2023 22:09:27 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:27 +0000
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
X-Inumbo-ID: 0971534a-694c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzqoB+T0mOkj9SjaXkk2OjtfC2eAIEXu+1BeNHtk3BrnFBo7ItIB0nId9nnnok/41bLscA+VP1XQb4hgqsgRPCXnkf7kXmQ7NngD3tsT9UfNIUPD/mJ4Pdmw8xDZ4hJX8Rz3uyMgn+yjXniA1XALDKP0Gj1o4ZpNDB/lAPCSNy4a0kzlsOqjPVSL64YbKneei0kcAAaOUtvUx5BGcT8YsBkaFG+N02XI6nKI6CTXbjPXquGqxKJwurgp/e8eG1FF+LouSqMFGomSUMYcEFFsUBLIdK2EK7QIwKF6m3bBXpiDbZIPm97LsQ5KB0tjXnIRbemJGhz4aQllQPj95gUFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cvt5808hHcwhF44p0mrt1sssUp8SRDE7SeZ89SeYcE=;
 b=DXq9tgR8B4jl0AcqqXKu2v/f0HFK2zkaGEeLRhDT5C3P+RpKV/WI8Oz75XfefTckeQfPdq9B+NgKnwy4dERg1PdT+NWRnQl2ie8NPuM18rBvzNYy6mlW5yFfjmLipxQ93seTa1Dn8dKw52TSvZlYWsOr59Zvj7w9wVEKdFWj+6oWdzFq7XHNYtQsgHQ85YE3T7D9smTnllKWnGPZpgEJ7qK7ULWwQV5qfURwZC0uGa766wcN/WZwwcbsBdPSw7kKszhC536sUDTnKECFD6g4Z+9aq2fLjKFRZuvUADTIUf3vfOHH99sDkfkFLkhHTvZRIMJhJyAi2/eIqme0vvdeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cvt5808hHcwhF44p0mrt1sssUp8SRDE7SeZ89SeYcE=;
 b=RoIi/u6HSuztALBaP1VdZaqOCM59eZ6Ez2DtpPjUKd3FmvBlA98tNKyLOnue8CVYLq8UiPvlm+7WEq8m4WyKEKiiucD1H23CyB2OmCkFRHc2KZ0Fhi8pvJRp9J95MDuJKZDPzHzZuUs8GvNUyTjSjjmnuOF1QOJIG85YvbwZoG9Hh/odpNOzZNKv+OXFdb5xSqk9RzG0X8z75izm6AwnwsMd1izCcUPabKuU5hh54uN8yqcgJXo0Zs5uqQw8zf855SF6k2zBc/e0vQzr24vDHLGRAhxq1OlRng8HndMSJUj6tznfwsjQyAQha9HO6zdvA2iqjKki+BaRPE6bQm0B/g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH v10 14/17] xen/arm: translate virtual PCI bus topology for
 guests
Thread-Topic: [PATCH v10 14/17] xen/arm: translate virtual PCI bus topology
 for guests
Thread-Index: AQHZ/Vi/w/6hIJcad0KQMXZM3sEAgA==
Date: Thu, 12 Oct 2023 22:09:18 +0000
Message-ID: <20231012220854.2736994-15-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8758:EE_
x-ms-office365-filtering-correlation-id: a86bb6c9-fc02-422b-6e86-08dbcb6fe6ab
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OH72IzH+dD0Z8WBsT4/MFDWdg5Cq0iBxgqhMP10ci6iyCVaxKHSER3R3ZnX2d8WtVTUXYO66nrGOGqgU1AxpWpVT8xvRsf3QMx8mXka9QPFkVxtSjtbad19YkLupwpaD8oxs9/efdA4rMgkBg+2il8aiOQILCnSbIPqBr5olmMVoWN7VwBHZaMYXvkDh60RMmjX836NxtwpVSri+wU0VUo7bEniaP9DgSI60xcdfpM401cbF8xhlQeKKYNMsfvAtNekltwBNkcMToi54cZzyWv1LVTuURlubKAaEA9d3ZdFTdEco1FhN8JpEdENKofBqifYV9Kc0OLmW455z/cO8dTx3nyjXO28cBtw/nbsyIUEvut4l4sFNwOzCEZwMSs+tGiwSAFrPzrGO4s3Ek0UriJ6ESi0eHCeXLQOwbX0qQkqbLYYZ2RlAnHIBeP3bIZU2bCfONwSipxkTIdrAAvV/tw+4HF6PCN9auk871Rx+MnMPE4B36RA2l5JJv1zY+OL9fWYDLXpoUiBgMEZTmDINsGV+ZvJN/IzmuOxXpZpWT9sAvUWe5hAJi6x865uYj7UzzoKete48YPj8X7e8IS5d3ItRmItlAutnAgyzu/emE+ug0/prAmLSaSkmmHvV7Mfc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700005)(6916009)(5660300002)(41300700001)(316002)(83380400001)(86362001)(122000001)(38100700002)(66446008)(71200400001)(6486002)(26005)(1076003)(2616005)(54906003)(478600001)(76116006)(66556008)(66946007)(66476007)(64756008)(91956017)(2906002)(8936002)(8676002)(36756003)(6512007)(6666004)(55236004)(6506007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6drs2tRmmXLL2G8k/BWKX2ebmVXQeWtHZHlD6J0CUVijEN5RcY1wz0BYoy?=
 =?iso-8859-1?Q?0j8ryXb95+z/zOZaEVpS9ZL7DXkRiX+5rFUTqZEAkqOEdESagDVAPNYv4y?=
 =?iso-8859-1?Q?CO9eWCFLVNlfShzqG657jMvFfdoGim/zrFr/oys5jK91kTOTfafgg67Jl0?=
 =?iso-8859-1?Q?NHUB6bNEelbztmbTnbBGTslMWRYV4ttwhT+HIg2JSeLimjapGuoWixOxzA?=
 =?iso-8859-1?Q?PbQ4XcGX4lsaCxTAaegcwAnQyjLuTEZryEMhPokNQIHmOy5uPetV+FIl1r?=
 =?iso-8859-1?Q?4rYj3rcBZi8Sde5Lmm5kE9onfDy1h3PRZZtl/z7SUKHwQT6nDGbXWh1NsF?=
 =?iso-8859-1?Q?Xuh9FWUREgdtqiOm5bwkakNL5j1yAizUARvN1fgPltYCMVA0maM5B1Lm1D?=
 =?iso-8859-1?Q?Q9FMkPEstLXEcLOSphqVO8LsTxYC02YZp2Vvd++pRRjcfxT6XV2z4JDRp2?=
 =?iso-8859-1?Q?m769EixIpg8gCYhDGTlg3pXsTwTCYT1UyHGf5W8k2bZ44kVP7zilrxGRCX?=
 =?iso-8859-1?Q?mQLka/6Bz6Z5HCahT72XyJAHtXtMkedU+FWn9fOfq9bejaMGOWWfM21Ivt?=
 =?iso-8859-1?Q?1fkUvjcH4Idxz1jnfx0og9YoJ/dIvY2i6fQXmN7cXFZVRf/Hjqt62IF1rA?=
 =?iso-8859-1?Q?/BzBZjWVd6Gbemq0FWzTZKjtrVHQ+otKGi9SOE2ge+h7zfHtmSDYl5G1yV?=
 =?iso-8859-1?Q?W0qimKGA1lm638be2n+CLkGpIwm9H8E28RXgiyK5kK4fnxfAS65faU4vVH?=
 =?iso-8859-1?Q?+dMzGPYvR5XGIv6llHGL/qNdJ/SufP99aKdR2CgzC9H2y2B8nnPhEGivO/?=
 =?iso-8859-1?Q?v1ym2QH5OpIa2LSyQm1nJJBGfDkIrq9P1/1ku7ATpA74klbc9Vcc4Sy3sg?=
 =?iso-8859-1?Q?ankVIVXEe0K4A+wQbwlgqxGnHRKn/dRPVoma2gfcHmnaI2LFzBwVTfKo3E?=
 =?iso-8859-1?Q?e2xbWTDpGoxb1V4qyhC9n1FtT76TLlhr0VyzxBuASIGeHh/gYLBsrYAySY?=
 =?iso-8859-1?Q?nc/zgkha5gO5difca6abRiZTMlvumg0dJk6brqfQGyv/rPAZLM13iDE4Lx?=
 =?iso-8859-1?Q?BR2/pDBq4qkrVGzfdM9U+4DboQr7399MAyGD3KnycHG83RGngy1zY+q/tI?=
 =?iso-8859-1?Q?8nOoggp65VH068SRNdV2EFIipjgCoK4EkzaKkSzM1lX8z5pjm3aMIzWzyC?=
 =?iso-8859-1?Q?+BC+mpkJHprKTidcFAmfdnbn6w2sxFwcURz66a0x8NqMXNe/2+a/P+At5N?=
 =?iso-8859-1?Q?VlX22GSrfgWlZJfynJ8RRfNa3R6ldKuERURkgaQrTbmRDyCRwPAn+Cs7p/?=
 =?iso-8859-1?Q?wHEmnH3/+L3g4D+S+XVz2GbpaNg1iLTRMTGZ5OmRKblSlXmzESw3/p6o13?=
 =?iso-8859-1?Q?a1u1IADEKqdRKdRdeITNjkxL7NTeDMa2b93+I5V+2hsY4affolmXwSvbps?=
 =?iso-8859-1?Q?N6ik34VcLSal2K1S3tZa3x5hfTTYU+h8vqWayGHc6OnDYSRNl4uUuCP8OC?=
 =?iso-8859-1?Q?vhkOPXwzXd8fcvrEZFQFTWIvnN0V9OJOidgrpNqJ+bTAB543JXzJVsJrdl?=
 =?iso-8859-1?Q?uVx6zjxcKpJgM/7XYIBxPIOZm9H4UTE6I6Devdda1uXCYDKMSqSXpA6ljn?=
 =?iso-8859-1?Q?mJz8qaeuEdw7Ey/6a/pxpgL+3SDepSLzXluXlzFoXV4wBuYKZUZsRJZQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86bb6c9-fc02-422b-6e86-08dbcb6fe6ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:18.8303
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3lKaamBaJSTixOYuvdI+p9ZzO9sKymESFgNPo9KRRRm6yoxLEmO7MxANmPTyWGp27fZgN3x+B7jTPWkEeXunxXw9l2ESMbhVHdJff6HyrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8758
X-Proofpoint-GUID: bnRiCwm7jn_N8h9kqXU1LIMOfxUjw53P
X-Proofpoint-ORIG-GUID: bnRiCwm7jn_N8h9kqXU1LIMOfxUjw53P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Since v9:
- Commend about required lock replaced with ASSERT()
- Style fixes
- call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
Since v8:
- locks moved out of vpci_translate_virtual_device()
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPO=
RT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 51 ++++++++++++++++++++++++++++++++---------
 xen/drivers/vpci/vpci.c | 25 +++++++++++++++++++-
 xen/include/xen/vpci.h  | 10 ++++++++
 3 files changed, 74 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb5508..58e2a20135 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,31 +7,55 @@
=20
 #include <asm/mmio.h>
=20
-static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+static bool_t vpci_sbdf_from_gpa(struct domain *d,
+                                 const struct pci_host_bridge *bridge,
+                                 paddr_t gpa, pci_sbdf_t *sbdf)
 {
-    pci_sbdf_t sbdf;
+    ASSERT(sbdf);
=20
     if ( bridge )
     {
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
-        sbdf.seg =3D bridge->segment;
-        sbdf.bus +=3D bridge->cfg->busn_start;
+        sbdf->sbdf =3D VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        sbdf->seg =3D bridge->segment;
+        sbdf->bus +=3D bridge->cfg->busn_start;
     }
     else
-        sbdf.sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
-
-    return sbdf;
+    {
+        bool translated;
+
+        /*
+         * For the passed through devices we need to map their virtual SBD=
F
+         * to the physical PCI device being passed through.
+         */
+        sbdf->sbdf =3D VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+        read_lock(&d->pci_lock);
+        translated =3D vpci_translate_virtual_device(d, sbdf);
+        read_unlock(&d->pci_lock);
+
+        if ( !translated )
+        {
+            return false;
+        }
+    }
+    return true;
 }
=20
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
=20
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r =3D ~0ul;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -48,7 +72,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *=
info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge =3D p;
-    pci_sbdf_t sbdf =3D vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge =3D=3D !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+        return 1;
=20
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 7c46a2d3f4..0dee5118d6 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -80,6 +80,30 @@ static int add_virtual_device(struct pci_dev *pdev)
     return 0;
 }
=20
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbd=
f)
+{
+    const struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+    ASSERT(rw_is_locked(&d->pci_lock));
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf =3D=3D sbdf->sbdf)=
 )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf =3D pdev->sbdf;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
=20
 void vpci_deassign_device(struct pci_dev *pdev)
@@ -175,7 +199,6 @@ int vpci_assign_device(struct pci_dev *pdev)
=20
     return rc;
 }
-
 #endif /* __XEN__ */
=20
 static int vpci_register_cmp(const struct vpci_register *r1,
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 4a53936447..e9269b37ac 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -282,6 +282,16 @@ static inline bool __must_check vpci_process_pending(s=
truct vcpu *v)
 }
 #endif
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbd=
f);
+#else
+static inline bool vpci_translate_virtual_device(const struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    return false;
+}
+#endif
+
 #endif
=20
 /*
--=20
2.42.0

