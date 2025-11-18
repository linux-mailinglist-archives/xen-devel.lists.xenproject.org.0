Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC63C699E1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164702.1491628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsx-00056K-7i; Tue, 18 Nov 2025 13:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164702.1491628; Tue, 18 Nov 2025 13:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLsx-00055I-3d; Tue, 18 Nov 2025 13:36:43 +0000
Received: by outflank-mailman (input) for mailman id 1164702;
 Tue, 18 Nov 2025 13:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ey2=52=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vLLsv-0004PV-2v
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:36:41 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c6eb938-c483-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:36:39 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7650.eurprd03.prod.outlook.com
 (2603:10a6:102:1de::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 13:36:34 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9320.013; Tue, 18 Nov 2025
 13:36:34 +0000
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
X-Inumbo-ID: 9c6eb938-c483-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETM/dOLm/ghkkx0IULJbbSi2EHCdpTF5Zh6mtAVFLObyAPLrMA8rOyWyui3p1MfjD/KVMTVB1VZDGXbEXnFIozD0U38udW8tBqRTksQIWoSFP0Q5wejMxodO0qGRXL86aOHrOwh536dCZJc7uWqXar2UMg3poGP8kSh/WrnvIVjylAxZXCctE37Ts49Wu7PDXaVz9hXKg9WYKRTRjbpmG0i1yGitdFjpV272uWgG66Ghe3pN8DLVWv4geNPe2Af/XGJGOq1mRPsOF/VWck+MK2pwLR50hNQ0oy02W6ld8CwOYJDzwwu6+7GzUcRLMLBxpxjm0RrJSVPNrC98HpZU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwiFIXX4P610NqjFRS+PLIfG423P2YodlLBqgLz4QzE=;
 b=OUKo08fTM6gZkSY2LJpruQjLnzIl8uaOH5fHE4n6i0deq2PiedjmTRCqbhm5Gdk6ILGSTOHnfjiNmRFDDdrNmXuH5A3m397XyCrlhGb10/eIeX9ZBSciA8O/OxKYOWtIc0nJJynSPgGOj6mBtEbSpJlyJRPTyIDdpP3KrDBKV2mAeLVW+1J67o+KcVMhgK6ma1IaPHhE0H8xFnUxJgpzRlrNp5/CEkB4/7v69G+XwS8mqBw7dNArX4T9LmOgvxi1BssVkNflIlj/gFOy/yHsaBYZhkNIGurNaBXw0MbkiaZ+XGLTAeqx2CgDECmwbni+lcrp2s6Ui6lVWIKdrjFd+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwiFIXX4P610NqjFRS+PLIfG423P2YodlLBqgLz4QzE=;
 b=Sl0U8Ak74T6cpobpKSa3FIjjdTCB/p5OP0722ePagkUB9Hgo3gHpuzGsTrcwxmg5xo2BMi+mU20HIMX1g5XPvySdf6qO8gofs6Pu4xtsaMGoARCS0zruuPwq2BdiP06xCi5ECz7ATyWNAdsRHvUoKmX4J0dmWr2cmVexzngzrxc2e9iy7GYNS9TvaB/5mC4rAQlLE5F5D+EYO+SYpNp7h/1oPVBj48UrXIgsK7rk+QT0BxmXrzdPxKyptFi0wub+3JITFiVH9Nd186mGqTBv4iDPLYDoSjAGKDAD6t8yN9JQM5g3DTgPuzjUYX4QBGUMPYTrw68w7ui9PWM//sy1CQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <luca.fancellu@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v3 4/8] xen/pci: update DT for hwdom when it uses vpci
Thread-Topic: [PATCH v3 4/8] xen/pci: update DT for hwdom when it uses vpci
Thread-Index: AQHcWJBbokhYTBMFOESThWU0kpE72A==
Date: Tue, 18 Nov 2025 13:36:34 +0000
Message-ID:
 <e11028e291d0a43c9111323ce21fe35d92fc6695.1763462211.git.mykyta_poturai@epam.com>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1763462211.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7650:EE_
x-ms-office365-filtering-correlation-id: bc6ea9dd-73f6-49ad-b2aa-08de26a77dad
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HPl5DA8njYhc2pwC/lZsCrjfOJKRMxGEtOtIRnd9j1/rH+fKszUSq0G5GV?=
 =?iso-8859-1?Q?lvxFyt9v7x7Up25xUuP9sWqMCRiHI3FLn/XjuG1ZzEXK9c9QpcHNG/pVpZ?=
 =?iso-8859-1?Q?69xMQ+/D9soKKgLxPHlsQeZWjzq57Jl9RFUxvhcrx1f4aQfHrR32+b9UuX?=
 =?iso-8859-1?Q?YPfqUHIKTvNLt5JSHkWoG17lKkhhEfOxKOgj9gPE9OyXUkDht7EEvogJbU?=
 =?iso-8859-1?Q?W/31Ia3/kLLvjPqD7DgaM3uY6LYbLqI+MrRp2MI9gJXrt4G5+p+z9XS1PG?=
 =?iso-8859-1?Q?Ft5Fkfdo4C2eU1zGD6QnUR7YUnaniCdPsVKYu9hn0TnZOUlHeAuK1qdoKt?=
 =?iso-8859-1?Q?b+f8ghfvEETcogyOi3alOw44e6AEzyH6aR/kdbjBAmCAf/z7P7+Sws1Yw2?=
 =?iso-8859-1?Q?E9zjaHruh3IwzVTIqq/SMApCX80OMjgeUuMSoC4nOIYy0SaoboYs18vbgp?=
 =?iso-8859-1?Q?nL4GtRW4HoGcAHHd31z9EFGvXxqTfFrrWnvgOFFWJ6I1HxInsuwBYSWdKp?=
 =?iso-8859-1?Q?MKYeQM+dNBynVmz1qtAeKi36xpLZZHvfv9Ykg6cxaSZc7xOZb132IeHKb8?=
 =?iso-8859-1?Q?2H1pqCJCeMhXBspgarPWgd8RWXhX19PtIt/xS8VayBFv+3GSowyQYwo7Xy?=
 =?iso-8859-1?Q?zPnG7T5iL8OkWdeTaS1aAtgLPT54voT2kkCRAVm3204NzQup277Y/9QB+2?=
 =?iso-8859-1?Q?HDJMxWbgF39SStxonCLdAqFajg+t0vh1cmD8NPLPycMXm5mTj68TdjPhF4?=
 =?iso-8859-1?Q?7tNeqg0NJmqbklEsC+i74p06wOc7jHwx+tWklJ9HPp9GhbE9w4YQ8qeMCT?=
 =?iso-8859-1?Q?n86Ge1U6rGnLcL6ZRcdTb2w/zGvFDZhhXjwWtb5lvXcCOKST+PnORYlqAt?=
 =?iso-8859-1?Q?k4UuS2/tVuSMFjIfft/rDtVvmFhYeDnTErNrvInRUPfJBsboR8PLN9tddG?=
 =?iso-8859-1?Q?nAF/qVAgGqvw6XN3yaHgxeK2ue5bxAowUxUgkPyoI2yjdkxpdY9icxUnmC?=
 =?iso-8859-1?Q?BNoyUnqT5u8GmVoCMhaAJqjCO1jHPl4//cRLGL/LZw6VtqyAadJgJhmoWQ?=
 =?iso-8859-1?Q?01v7vClQzXFZ/l0Kg+OxU+H3tULePWG5hlhN8axoT569uGAHxYXaPwkYY1?=
 =?iso-8859-1?Q?Z2AaJcqYwHgLFcJ7ZlPxa57YT6tjN685te2oSSsO3E2db65pYAgYAi9ce8?=
 =?iso-8859-1?Q?/T4zWeacIqErN2vzGz6J+A6tyBl0/UQFLCiQzdqSCzRbMsX1bOZ64V6/FX?=
 =?iso-8859-1?Q?4wjriUtAjF6jMwnACVR3kIOgi/4UzO+qiYdAIaqW4YbB1zXVAuvSK5Eotj?=
 =?iso-8859-1?Q?OlRneMPKPumrDI0w4GnFPQta9HH3ZgWZlbnvZzbH4HiOBJ1NbhmVwO/9GC?=
 =?iso-8859-1?Q?x5BTQNy+Muj4EPmXcjM3QWHvSnEG03lBt7Mqg8lSI/CgFWqQqoe/GDVgc6?=
 =?iso-8859-1?Q?Uaw71ntCSTwf/MEbCv9Wh+h0Onjd+kq2OSjAlcGqEkK1ToiQFPKIT45Z5j?=
 =?iso-8859-1?Q?ubDRrmAP2RtcN+vuNCTIJq92lbd5Sm+2QXeZ/Ouz4opubicYNFSFImlT+K?=
 =?iso-8859-1?Q?bIof6/07r7DE+IlyYwYJ5DSebnQE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oM7vih9qJlk8VMwq89wswJyLpD+aGRTgZ1lC9n/gFFMa5m9MiNtOPbMtpP?=
 =?iso-8859-1?Q?nm+999QkF/np1TfCK6IT+4RU2LRNgc2AlCV96z2UZdG228gD9IsVD966QK?=
 =?iso-8859-1?Q?cwDSFTCg3wzQQuz4GZSJwEq5ywy2ftWs8xImzBUa6l8mvradLne35ORygP?=
 =?iso-8859-1?Q?sxMXAjwM4c9QTkNT/Rkd8LHMM6g2xpInjVlZJkJqhGZ+F/4seIDD96jV3e?=
 =?iso-8859-1?Q?TWtSm6NRcDxZ4BWm/IOboJ5iC9WZOabrGUg/mrn6UjVeoR0dbQqXfECqUs?=
 =?iso-8859-1?Q?qjLXJl6r0ayYKuuAAOXn8UPjGThOegPOxsL+PHxFgF1P7mpy4aDG7n+/Cx?=
 =?iso-8859-1?Q?OzCqtSKcDrx3g+i+MfzttQDvdgSO8mzTvxl6labFk4WX8WbrKQXZhbKlqH?=
 =?iso-8859-1?Q?ioAgQnvMvi4F+a5XcOPO1eJiUR25zuJyLH+cbu7Z6DtZtQRY7RIT64XVJg?=
 =?iso-8859-1?Q?9IUsZL+4B0I1rUE625vokepCEwH6gym9tZhJwRozovmK/5IcCiDkaMMaNc?=
 =?iso-8859-1?Q?TAbt2hRnsBmpReYsgNk9/W4EEwYhMgrY3BWR5L8ubeLCUBeCDj0AkOTcqN?=
 =?iso-8859-1?Q?YX4Qt7TrlutC5/C+bQj/BDO5IUZbG74O95bj6gF3TDDppmR91v2KZzk12j?=
 =?iso-8859-1?Q?pXDBeEt8C5M1oilLw0hI+vMBRqLDUkWBNCbK0f2xECSM7iNa4OW2CMBPzG?=
 =?iso-8859-1?Q?AizYnqPBEiqPXyaBxJoLJ0nu5S4G2XWR2rU4cDazitnT14cTxzXrmvjz62?=
 =?iso-8859-1?Q?fhg2Pkf667vdGrEbdR4N6dOxSTCnbx7Z0JsEPhkoz4vTn/6oRHpFVyhjtE?=
 =?iso-8859-1?Q?2o7LVTjCX9AMimIIJ5dUFoyMv5K2Jqjwi0TUxpxSExe8YEL6P0u4j3ZuWL?=
 =?iso-8859-1?Q?ZmHEDEWlCztZfHO0V37djQtPwDO41EQB9TtY34GornY1GXILLp0Zog57hS?=
 =?iso-8859-1?Q?whxB3kG6ZsPcRWZORypdS3+9LFyaCV/JA+z+tOMAKRtSMZSZgE7HzWcfbq?=
 =?iso-8859-1?Q?QdjwnYj+/A/H4/JqhvszbP0CyRG7T8rjPwaSz7fBSPzu/0MJOqzABOiKpc?=
 =?iso-8859-1?Q?EUD16Vmywz4yU+2ZXh3pGNwFTLopnkEb4ziWC7nHRNMtXFWLLFsc/lH9LP?=
 =?iso-8859-1?Q?FpKZIv7iAuhjnK2tD0rmXLNB1ZrxtezauH/fO6vP/5TtVnIOKeW20e/324?=
 =?iso-8859-1?Q?7o++fGh7Qgnne3SyVhn6kkfPMwlCEQn1wDYPr5UYqXMCFvwoqfmeZAl4cr?=
 =?iso-8859-1?Q?wpNYa/8yCg6D3dwGMNRJK833DVqLKZpIXPcntdIgXO0BcAJkLXblvtxpdZ?=
 =?iso-8859-1?Q?doDEgAp2e/4shFzvW9FA2jijrsMybQlaU303a3GQJrHazrTqx97vq3bSbm?=
 =?iso-8859-1?Q?SEVP7w/7fH96exgMzCQjZoaZL5RFrn3BndUE5HA+NtBaRpegrpWCqkviPj?=
 =?iso-8859-1?Q?4epsft+0wL7jW0zG2nCig6WWXHL66ns4RsJqI/RhSMpVXm8MiWhHngiiUg?=
 =?iso-8859-1?Q?OB1evvgQs7L11eBNlu4YJGTYq0e6MVGGxqwI9H/GMvCK/laxKotwvA0ydD?=
 =?iso-8859-1?Q?/JCzANxV2vDcuEo/WAwFwECUyX39fbMTm5/hoWzIFwu9ZNi4CCN2WYFNnc?=
 =?iso-8859-1?Q?Mqc3H7AKMfgN9uSBP/7jqw41icQ39W+hhbcvmRAdNZ/QjiQsD0MOrj9A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6ea9dd-73f6-49ad-b2aa-08de26a77dad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 13:36:34.3049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IUMGCYjrn0l9naYUM0DFJBbpdoqg0M1ExqHDg1sZEqG2spNtj1q4kDNFPcUgs0XFCUkfwdtzZCK32JLHgiBVmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7650

From: Luca Fancellu <luca.fancellu@arm.com>

When pci-scan is enabled and Xen supports vpci for guests, Xen will
scan the pci bus to find devices and emulate the pci bus, so the hw
domain must see the emulated bus instead of the real one.

A new helper function, hwdom_uses_vpci, is implemented and returns true
when pci-scan is enabled and Xen is built with
CONFIG_HAS_VPCI_GUEST_SUPPORT=3Dy. When hwdom_uses_vpci() is true, a vpci
node is created for the hwdom device tree.

Depending on whether the guest is using vPCI or not, and whether the
domain is using host layout or not, generate the appropriate device tree
nodes for the guest and handle the right MMIO regions traps.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v2->v3:
* use has_vpci_bridge in place of hwdom_uses_vpci

v1->v2:
* make make_vpci_node static
---
 docs/misc/xen-command-line.pandoc |   4 +-
 xen/arch/arm/domain_build.c       | 151 +++++++++++++++++++++++++++++-
 2 files changed, 153 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index e5f7275bdc..4a546f94a7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2084,7 +2084,9 @@ Flag to enable or disable support for PCI passthrough
=20
 > Default: `false`
=20
-Flag to enable or disable Xen PCI scan at boot.
+Flag to enable or disable Xen PCI scan at boot. When the flag is enabled, =
the
+hardware domain cannot have access to the real PCI bus, it will see the bu=
s
+emulated by Xen.
=20
 ### pcid (x86)
 > `=3D <boolean> | xpti=3D<bool>`
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4bbffdf535..7423605b61 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -41,6 +41,7 @@
 #include <xen/grant_table.h>
 #include <asm/grant_table.h>
 #include <xen/serial.h>
+#include <xen/resource.h>
=20
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -1557,6 +1558,142 @@ int __init make_chosen_node(const struct kernel_inf=
o *kinfo)
     return res;
 }
=20
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+struct vpci_param {
+   uint64_t vpci_ecam_base;
+   uint64_t vpci_ecam_size;
+   uint64_t vpci_mem_base;
+   uint64_t vpci_mem_size;
+   uint64_t vpci_mem_prefetch_base;
+   uint64_t vpci_mem_prefetch_size;
+};
+
+static int __init handle_vpci_range(const struct dt_device_node *dev,
+                                    uint32_t flags, uint64_t addr, uint64_=
t len,
+                                    void *data)
+{
+    struct vpci_param *vpci =3D (struct vpci_param *)data;
+
+    if ( !(flags & IORESOURCE_MEM) )
+        return 0;
+
+    if ( !(flags & IORESOURCE_PREFETCH) && addr < GB(4) )
+    {
+        vpci->vpci_mem_base =3D addr;
+        vpci->vpci_mem_size =3D len;
+    }
+    else if ( flags & IORESOURCE_PREFETCH )
+    {
+        vpci->vpci_mem_prefetch_base =3D addr;
+        vpci->vpci_mem_prefetch_size =3D len;
+    }
+    return 0;
+}
+
+static int __init make_vpci_node(struct domain *d, void *fdt)
+{
+    /* reg is sized to be used for all the needed properties below */
+    __be32 reg[((GUEST_ROOT_ADDRESS_CELLS * 2) + GUEST_ROOT_SIZE_CELLS + 1=
)
+               * 2];
+    __be32 *cells;
+    char buf[22]; /* pcie@ + max 16 char address + '\0' */
+    int res;
+    struct vpci_param vpci =3D {
+        .vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE,
+        .vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE,
+        .vpci_mem_base =3D GUEST_VPCI_MEM_ADDR,
+        .vpci_mem_size =3D GUEST_VPCI_MEM_SIZE,
+        .vpci_mem_prefetch_base =3D GUEST_VPCI_PREFETCH_MEM_ADDR,
+        .vpci_mem_prefetch_size =3D GUEST_VPCI_PREFETCH_MEM_SIZE
+    };
+
+    if ( domain_use_host_layout(d) )
+    {
+        struct pci_host_bridge *bridge;
+
+        bridge =3D pci_find_host_bridge(0, 0);
+
+        vpci.vpci_ecam_base =3D bridge->cfg->phys_addr;
+        vpci.vpci_ecam_size =3D bridge->cfg->size;
+
+        res =3D dt_for_each_range(bridge->dt_node, handle_vpci_range, &vpc=
i);
+        if ( res < 0 )
+            return -EINVAL;
+    }
+
+    snprintf(buf, sizeof(buf), "pcie@%"PRIx64, vpci.vpci_ecam_base);
+    dt_dprintk("Create vpci node\n");
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "pci-host-ecam-generic"=
);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "device_type", "pci");
+    if ( res )
+        return res;
+
+    /* Create reg property */
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       vpci.vpci_ecam_base, vpci.vpci_ecam_size);
+
+    res =3D fdt_property(fdt, "reg", reg,
+                       (GUEST_ROOT_ADDRESS_CELLS +
+                       GUEST_ROOT_SIZE_CELLS) * sizeof(*reg));
+    if ( res )
+        return res;
+
+    /* Create bus-range property */
+    cells =3D &reg[0];
+    dt_set_cell(&cells, 1, 0);
+    dt_set_cell(&cells, 1, 255);
+    res =3D fdt_property(fdt, "bus-range", reg, 2 * sizeof(*reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#address-cells", 3);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "#size-cells", 2);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "status", "okay");
+    if ( res )
+        return res;
+
+    /*
+     * Create ranges property as:
+     * <(PCI bitfield) (PCI address) (CPU address) (Size)>
+     */
+    cells =3D &reg[0];
+    dt_set_cell(&cells, 1, GUEST_VPCI_ADDR_TYPE_MEM);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_base);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_base);
+    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, vpci.vpci_mem_size);
+    dt_set_cell(&cells, 1, GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_prefetch_b=
ase);
+    dt_set_cell(&cells, GUEST_ROOT_ADDRESS_CELLS, vpci.vpci_mem_prefetch_b=
ase);
+    dt_set_cell(&cells, GUEST_ROOT_SIZE_CELLS, vpci.vpci_mem_prefetch_size=
);
+    res =3D fdt_property(fdt, "ranges", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+
+    return res;
+}
+#else
+static inline int __init make_vpci_node(struct domain *d, void *fdt)
+{
+    return 0;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1615,7 +1752,12 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
         dt_dprintk("  Skip it (blacklisted)\n");
         return 0;
     }
-
+    /* If Xen is scanning the PCI devices, don't expose real bus to hwdom =
*/
+    if ( has_vpci_bridge(d) && dt_device_type_is_equal(node, "pci") )
+    {
+        dt_dprintk("  Skip it (pci-scan is enabled)\n");
+        return 0;
+    }
     /*
      * Replace these nodes with our own. Note that the original may be
      * used_by DOMID_XEN so this check comes first.
@@ -1766,6 +1908,13 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        if ( has_vpci_bridge(d) )
+        {
+            res =3D make_vpci_node(d, kinfo->fdt);
+            if ( res )
+                return res;
+        }
     }
=20
     res =3D fdt_end_node(kinfo->fdt);
--=20
2.51.2

