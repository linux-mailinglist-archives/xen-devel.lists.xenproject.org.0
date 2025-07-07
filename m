Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CA5AFAF84
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035409.1407692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1z-0001qv-Sr; Mon, 07 Jul 2025 09:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035409.1407692; Mon, 07 Jul 2025 09:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1z-0001nq-PD; Mon, 07 Jul 2025 09:20:59 +0000
Received: by outflank-mailman (input) for mailman id 1035409;
 Mon, 07 Jul 2025 09:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd65=ZU=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uYi1x-0001Ri-Kt
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:20:57 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b016e524-5b13-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 11:20:56 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6305.eurprd03.prod.outlook.com
 (2603:10a6:20b:157::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:20:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 09:20:40 +0000
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
X-Inumbo-ID: b016e524-5b13-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYPxnTFCnbMQhG6dXjPynwMnVa0dl0kPvIfEf0apgNUvOZbFS6DJ1vcxYiaVWT/jJBEpq4VSbLL0lGOm9cmis24BfVJ5SxaXVrnHjEEcPjbow5iRxLrfMuTOrXHkER1fm5rIYbVReMDU/Dp0UYPRd7jbk6L1aElLVCc9jZFoHi/iZzyomDxbsA6YB/iqs9n8KE5fhB+Ht6p69b7tHGDkY5VLUf9EWTsrxOe1jA1b1EMPihHaQDIItxrLGrEFdONN4zDlIbcp7ajTdZRn2zQcWfm7m7hqmx35Im6nYgIYc3Y6oUTl5kjwKjolK4zCW5AK0GxSkIVFTj0LTjZs/6Kumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTENjK7DePGFpBf+qOVwkXl+er7/iccfAIg/6eqNWo4=;
 b=MTlq5XEd6N5sjioC11YR8C1NeQOqXu98DxVN5II36D848FDv/oyKUBjAhvlLOGY1Bv+IaJuD2V9q/8CvHWUR2BQehPXfV7SbhdZR1sOyqCp00kNDW5Gw7RPX5kY5YmwaSlEBNHRrj7HuD3cVBjeZkYEKnFuveSz+hY0GK3CQIIJ5R8V9zfYnbJRL0P49dKDsLhFyoTmPGWkJxxYCtYPdnxgHsVKtO2n9ojky8fVO8oNJIUaSsVK7CceSJGWo0DucWFfwi9DvvE+UG4X+GkZ5g133HS7EbufiJp3rmlDGctAgiaOrRMlCyPbm8z5ifnOKUM5aDBpxQOzOZllXNVQ/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTENjK7DePGFpBf+qOVwkXl+er7/iccfAIg/6eqNWo4=;
 b=A9AGtDdkdqEhxvRPNHaeWWknESLvMBFccjZuSaCZVeomGLlwZVFRmFSJ2X3wpu48PR2pEH44w8Sab80HANxda1QtoSD3jiOS8h0nmcvGrTQT9FnNuSrz3j799sv9JrWvlkNfq19nQWdRhMUcWh5c+kNaRAQOUbqQ+sMHAv7C0UYwuTM6xNE77T3yNFY9PiKJqw2ueemiJ3h+dxCv3TUXWyxjjSKhUC3X9xV5AiV9b+ZuNSZDQMlD5XzcU5etWl0rk388B1RZWQIMmYAJrPS3lPpIWFa8u8TEgAveoOnMEayliiTm7YKdIGo6vKazCbyGNVxXlxbTJVPIU8RhzaxlSA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/3] pci/rcar: implement OSID configuration for Renesas
 RCar Gen4 PCIe host
Thread-Topic: [PATCH v1 2/3] pci/rcar: implement OSID configuration for
 Renesas RCar Gen4 PCIe host
Thread-Index: AQHb7yBoXFwmP3nV1kCE0zaBoehFqA==
Date: Mon, 7 Jul 2025 09:20:40 +0000
Message-ID:
 <4a7c0fbe82b10ca7c6a6a703fec6d114880d0285.1751874601.git.mykyta_poturai@epam.com>
References: <cover.1751874601.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751874601.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6305:EE_
x-ms-office365-filtering-correlation-id: 6fa20a9e-6366-4c75-db35-08ddbd378a8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?rRv8sFrh7KuEZ7vbqT714J2TYcedBmZg6QQpRuLA7OjaqM+CPiQhVdRWHt?=
 =?iso-8859-1?Q?kX9WrIQx/w3yTI3TVDBLIGANcW9I2DoqzspcW5piQgLbFtQbq8CPg0M6xN?=
 =?iso-8859-1?Q?NnnMyBDzRcJHCukUtZNyunDs+9Y/m7a9Ioi5lCzpqw6kDIvWejj8Y4KQtd?=
 =?iso-8859-1?Q?OOxddsxquFnEtD9Wkrqc5FqmWI3vgCDmRF/SpyoUTsslxtjYc9FfH6zRGp?=
 =?iso-8859-1?Q?MhSFLaQN+/WsQiiBozzfEIfbfAdkDyeyfj4nKEiPPrxJLuE4uMQiO6tqPl?=
 =?iso-8859-1?Q?VV1uhOHQyZvQz0ZPrbvyTazinW1+XjXyvp7liaZGJONG4LfgjZV/+L3X0t?=
 =?iso-8859-1?Q?DdLo1hHY7SUC4/WOV1rFOa74igL4LoZMP4J061CvvzcJz0jiSK7wKko0zX?=
 =?iso-8859-1?Q?d2iQcs6YLhJGH5/Djx9jBmwBJZ0p89rHqXz/ZdeO8US0VJrW7VcH65xvEX?=
 =?iso-8859-1?Q?htYB8gKvdevAuYnMSFh7AAK/DpkYdiNUDqFrK7cHSUS3BuZ4cXE82G/XjK?=
 =?iso-8859-1?Q?V3IgXqe7cvvi0ZBaoXqMC37QQuif6vw0+9J8QZ0aSwubuTtvGcWvRsA285?=
 =?iso-8859-1?Q?riMXV/96IYaBgAnXA1ulOjghIA3f43j7In2/OE92zcJT4iI9Qv8mbSyENo?=
 =?iso-8859-1?Q?PgOGWZdovHtwZTD1CtHvaBs3WsnmhQI4DAw/bxqw3BcNHL6chwVFl1rkqs?=
 =?iso-8859-1?Q?IBCysjHUlSzOpjnGkgKCcfK69uxvuRYvJTXPE75R2go54j1YvyDEU76jGP?=
 =?iso-8859-1?Q?pe1KZxnjhGZscUc0mUEwmw42nFH4kWgG0IMsKxZlxROowemCGZappdT0Kp?=
 =?iso-8859-1?Q?q7OIu62Bi977+tFhmAr3ZCCN55R5f6jPB29510kJDWRANKPwrX45Kp5lvz?=
 =?iso-8859-1?Q?sxglxrQqF8/5dCBmFuscEyjWmKr5U6H3Q8PAi6kflofI9lFhkqEV7x3rni?=
 =?iso-8859-1?Q?ejEHNTq+hDFMSEuPCeiD7VtVjDHiGUB5+yeDKOa8BFlGSPhvxczmPibu4/?=
 =?iso-8859-1?Q?YJKLYF3B+mGAb74Juwkx9TrDDtCQGu9Q8Y7amlKisrevQt2j8oldM9aAWc?=
 =?iso-8859-1?Q?3QHzJ8ArAnztuctF/yF03ptbQ99SimeJCo3VXEFTi03Zq+vjOXBpUH3/Z3?=
 =?iso-8859-1?Q?AmkBoFDIyZptPndSZMgYkKhyLa/YsaVTk77tNppU0WbfH+Uzg53Uk0HYqJ?=
 =?iso-8859-1?Q?xD/UBye9rFPImmXL9QO1er6btnLUvTxr+K8vEdeL1wuANp+5q3iLFjEh5h?=
 =?iso-8859-1?Q?J0SOnH8rguRO9GnWzSl15fqP2Xy2vLRiN4OWkPc+m1CR4pYIiflcnvKUTD?=
 =?iso-8859-1?Q?RNYI1A7uT+cWJcuu+Y3nTU9xjyxSAx27m88SVE7wwB4SoE3L9aMS1YbTSX?=
 =?iso-8859-1?Q?kB52ktjDAN7NMf4Fg098+A1EKHJYg0WfSupN259S9yqtX38s0ZTIxS6IvJ?=
 =?iso-8859-1?Q?Phgo7CSvqDlyL6T4v8hT8UP+EXX0ukWAjLwWM1rMBggSLcAeIpBFmDTZuU?=
 =?iso-8859-1?Q?N7tqPvBq9DR2Tj/RkDxgGIeg0CTcg06p73V7ErR9IPgA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mw1y4G9Ck/4MtKlviLLyTwykNvs6MkZM/jFKjaQCozcuxmW4jiSLkxaWvu?=
 =?iso-8859-1?Q?OOyXqE7Wl43pq520OioPGoeCNwvkH0bzNrW4KibYg4Gx3ZBweLOHiYRobb?=
 =?iso-8859-1?Q?PVRIuXAlNOa3VJ2rNHu0uLl29UN+1ixdIzIreoaIjNwsxGITkIIN+rHlMK?=
 =?iso-8859-1?Q?sb2x0+IfrOh31hWuxSbmLAcie059NXRDKyTp3spWCmSJMl4vigAXMrVQ79?=
 =?iso-8859-1?Q?ApTWSvEr2uGOUbkf+435HuolaHYs3whQEUCpkxQmD5pS161sa1GF6lbfoH?=
 =?iso-8859-1?Q?SFYRIzhM9IH8JN2SmvM//UWxRgw9rKIlr2S4uv4AiA1nXecKcjJmZCvCPW?=
 =?iso-8859-1?Q?1ZwAlWXGZZ0IHZEOYza2O0git3B05wW0bOjpof+J/dSWZaX6qiQZgBRWLw?=
 =?iso-8859-1?Q?ktO/GaA9UvQ+BU4uiuv19LNRKSYOtpKUTUlC5EvdQVtBLcH+bsc6c4jS2o?=
 =?iso-8859-1?Q?YA0u7J8us4cnTLzdWP2hk03zXSOD2QaJohfExr3wW3DhbRF7mLisThnMwO?=
 =?iso-8859-1?Q?M/P2BEqlIYK9etSI20H4R+qRvmtmBaBklfpNf+hDKNV/hWmt0L/lbccAiM?=
 =?iso-8859-1?Q?Yerx95s1S9LMVsTMuffvdoKtOX+D8GzihfeRVe03e6nlVrsboUtZ2mrE79?=
 =?iso-8859-1?Q?AhO6tEZBs9D+WnkoLa5F6uEGEBhe3epKoN7pSL25cxmqK0epSWE0u5dKPz?=
 =?iso-8859-1?Q?xafH399zX4TcPQGNtuyMc2FdlmY4eNhXDYhayqXqMdzgk828Ge/Q89qSrn?=
 =?iso-8859-1?Q?WRzhEY+pFfNcYfBi0Z941xWabVLUpFuIbb2jWRAXDdkqM/fS7FZqzz6fh3?=
 =?iso-8859-1?Q?SrbDp3Z8uzwfzllt6QR4TaCjoNDa4nogJEQ9MMOxHOf2RzI/kV+wRMhl65?=
 =?iso-8859-1?Q?nNDXfkxQJ/D/CvZ0nai6j2dwXhgfu190SCbT+3cR+ARhl/EQv6gDMOf13T?=
 =?iso-8859-1?Q?I5bKaWfYshvqlQ17NIS/7AXubmsbHwxQCiqzyOeTVcooClyOlO/5xgKMKO?=
 =?iso-8859-1?Q?IUIer7xMO0OjqHJCqGs8OB+jHWZMNre8/WtioSPnxlkUssMSOONub1wtJI?=
 =?iso-8859-1?Q?cZwvHc9S62tX+RUhcYyxKtP2dZqHc4V0vekQKvYCpk/K06LqURXmIMJHTH?=
 =?iso-8859-1?Q?2stRxf5DWW4NUT1BFs6DgXYEB6A6Neh/fzoppPbpIVbaKR01gF/tMRlmSY?=
 =?iso-8859-1?Q?lgMB3yFldLZApOBjYhmyu59elYaq4ABpuzLUIxGnD016Tid+RSXeL1YnHD?=
 =?iso-8859-1?Q?KdnuOk0LrRi4akSLorKH0iUuZVXOlf51jhb+pRDN+qqrcef2GvAIrbNKPe?=
 =?iso-8859-1?Q?EeyCeyHOOSHZh9uR/uylxtMP/taRFf7/4J8Nf81MSJ/BxAHEn9jeusJggU?=
 =?iso-8859-1?Q?3yINkmX4bOXzCov76HVqR9qN8f8n+Wg0AwKb/TN7ms538ysm9pKPvzpOnk?=
 =?iso-8859-1?Q?AcT1SrfFBsxYenfdoo/UY88FKoADZ2Gs4FHa/fd5EjXjcaHJogoNeTGaxt?=
 =?iso-8859-1?Q?4Niq9bjif8Pk6bsOOUf4hzCFOVo/K6qj8NP4Ll+D4A3vsU2J2fgYtId6pY?=
 =?iso-8859-1?Q?M8cVTBt8FEZDTKcsQ6x7QY59OmrjLDdJP+yMKpdibxbUmb0TmHP8aA4Brt?=
 =?iso-8859-1?Q?/Fr6VEg6IdHL2ZJpCuDHi8nO/3asXu29QcHKgVTR9xVNMw5URKqxauPA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa20a9e-6366-4c75-db35-08ddbd378a8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 09:20:40.1596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9HOGeYE4DGzS+oHHho9l7x70qOZSOISZ8zt/1ExBUyQTNKXK5bc4R+VV9m3lPmn5z/L0fNa/7cCnKQgXSwAiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6305

For IPMMU to be able to associate a specific PCI device with it's TLB
the BDF to OSID mapping needs to be set up in the host bridge. The
configured OSID is then emmited as a sideband data on the AXI bus during
PCI DMA transactions. OSID configuration registers are located in the
"app" region of the host bridge.

Map the "app" region on init and implement methods for setting up
BDF->OSID mappings

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/arch/arm/pci/pci-host-rcar4.c | 148 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-rcar4.h |  18 ++++
 2 files changed, 166 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index 62d2130a63..9290c6cac5 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -16,6 +16,32 @@
=20
 #define RCAR4_DWC_VERSION       0x520A
=20
+/* PCIE BDF-OSID assignment */
+#define CNVID(n)             (0x700 + ((n) * 4))
+#define CNVID_CNV_EN         (1U << 31)
+#define CNVID_OSID_MASK      (0x0F << 16)
+#define CNVID_OSID_SHIFT     16
+#define CNVID_BDF_MASK       (0xFFFF << 0)
+#define CNVID_BDF_SHIFT      0
+
+#define CNVIDMSK(n)                (0x780 + ((n) * 4))
+#define CNVIDMSK_BDF_MSK_MASK      (0xFFFF << 0)
+#define CNVIDMSK_BDF_MSK_SHIFT     0
+
+#define CNVOSIDCTRL                0x800
+#define CNVOSIDCTRL_OSID_MASK      (0x0F << 16)
+#define CNVOSIDCTRL_OSID_SHIFT     16
+
+#define DEFAULT_OSID    0
+
+#define NUM_OSID_REGS    16
+
+struct rcar4_pcie_priv {
+    bool init_done;
+    void __iomem *app_base;
+    DECLARE_BITMAP(osid_regs, NUM_OSID_REGS);
+};
+
 /*
  * PCI host bridges often have different ways to access the root and child
  * bus config spaces:
@@ -65,17 +91,139 @@ static const struct dt_device_match __initconstrel rca=
r4_pcie_dt_match[] =3D {
     {},
 };
=20
+static void rcar4_pcie_writel_app(struct rcar4_pcie_priv *pci, uint32_t re=
g,
+                                  uint32_t val)
+{
+    writel(val, pci->app_base + reg);
+}
+
+static uint32_t rcar4_pcie_readl_app(struct rcar4_pcie_priv *pci, uint32_t=
 reg)
+{
+    return readl(pci->app_base + reg);
+}
+
+int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t val =3D rcar4_pcie_readl_app(priv, CNVOSIDCTRL);
+
+    if ( priv->init_done )
+        return 0;
+    priv->init_done =3D true;
+
+    val =3D (val & ~CNVOSIDCTRL_OSID_MASK) |
+          (DEFAULT_OSID << CNVOSIDCTRL_OSID_SHIFT);
+    rcar4_pcie_writel_app(priv, CNVOSIDCTRL, val);
+    bitmap_zero(priv->osid_regs, NUM_OSID_REGS);
+
+    printk("%s: Initialized OSID regs (default OSID %u)\n",
+           bridge->dt_node->full_name, DEFAULT_OSID);
+
+    return 0;
+}
+
+int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    int ret;
+
+    ret =3D find_first_zero_bit(priv->osid_regs, NUM_OSID_REGS);
+    if ( ret !=3D NUM_OSID_REGS )
+        set_bit(ret, priv->osid_regs);
+    else
+        ret =3D -EBUSY;
+
+    return ret;
+}
+
+void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
+                              unsigned int reg_id)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+
+    clear_bit(reg_id, priv->osid_regs);
+}
+
+void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
+                             unsigned int reg_id, uint32_t osid, uint32_t =
bdf)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t data =3D rcar4_pcie_readl_app(priv, CNVID(reg_id));
+
+    data &=3D ~(CNVID_OSID_MASK | CNVID_BDF_MASK);
+    data |=3D CNVID_CNV_EN | (osid << CNVID_OSID_SHIFT) |
+            (bdf << CNVID_BDF_SHIFT);
+    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
+}
+
+void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
+                               unsigned int reg_id)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t data =3D rcar4_pcie_readl_app(priv, CNVID(reg_id));
+
+    data &=3D ~CNVID_CNV_EN;
+    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
+}
+
+void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int r=
eg_id,
+                            uint32_t data)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+
+    uint32_t val =3D rcar4_pcie_readl_app(priv, CNVIDMSK(reg_id));
+
+    val =3D (val & ~CNVIDMSK_BDF_MSK_MASK) | (data << CNVIDMSK_BDF_MSK_SHI=
FT);
+
+    rcar4_pcie_writel_app(priv, CNVIDMSK(reg_id), val);
+}
+
 static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
                                        const void *data)
 {
     struct pci_host_bridge *bridge;
+    paddr_t app_phys_addr;
+    paddr_t app_size;
+    int app_idx, ret;
+
+    struct rcar4_pcie_priv *priv =3D xzalloc(struct rcar4_pcie_priv);
+    if ( !priv )
+        return -ENOMEM;
=20
     bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
                                 &rcar4_pcie_child_ops);
=20
+    app_idx =3D dt_property_match_string(dev, "reg-names", "app");
+    if ( app_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"app\" range index in device tree\=
n");
+        ret =3D app_idx;
+        goto err;
+    }
+    ret =3D dt_device_get_address(dev, app_idx, &app_phys_addr, &app_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"app\" range in device tree\n");
+        goto err;
+    }
+
+    priv->app_base =3D ioremap_nocache(app_phys_addr, app_size);
+    if ( !priv->app_base )
+    {
+        printk(XENLOG_ERR "APP ioremap failed\n");
+        ret =3D -ENXIO;
+        goto err;
+    }
+    printk("APP at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", app_phys_addr=
,
+           app_phys_addr + app_size - 1);
+
+    dw_pcie_set_priv(bridge, priv);
     dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
=20
     return 0;
+err:
+    xfree(priv);
+    return ret;
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-rcar4.h b/xen/arch/arm/pci/pci-host-=
rcar4.h
new file mode 100644
index 0000000000..8ac6626a22
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/pci.h>
+
+#ifndef __PCI_HOST_RCAR4_H__
+#define __PCI_HOST_RCAR4_H__
+
+void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
+                             unsigned int reg_id, uint32_t osid, uint32_t =
bdf);
+void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
+                               unsigned int reg_id);
+void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int r=
eg_id,
+                            uint32_t data);
+int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge);
+void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
+                              unsigned int reg_id);
+int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
+
+#endif /* __PCI_HOST_RCAR4_H__ */
--=20
2.34.1

