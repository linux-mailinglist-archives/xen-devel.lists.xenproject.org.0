Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58028AA4372
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 08:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973401.1361538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1NA-0004j4-8M; Wed, 30 Apr 2025 06:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973401.1361538; Wed, 30 Apr 2025 06:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA1NA-0004gR-5N; Wed, 30 Apr 2025 06:56:48 +0000
Received: by outflank-mailman (input) for mailman id 973401;
 Wed, 30 Apr 2025 06:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZps=XQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uA1N8-0004gL-Mu
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 06:56:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2608::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43c42cd8-2590-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 08:56:39 +0200 (CEST)
Received: from AM6P193CA0130.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::35)
 by AS8PR08MB6661.eurprd08.prod.outlook.com (2603:10a6:20b:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 06:56:35 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:209:85:cafe::97) by AM6P193CA0130.outlook.office365.com
 (2603:10a6:209:85::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 06:56:35 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Wed, 30 Apr 2025 06:56:34 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33; Wed, 30 Apr 2025 06:56:01 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 06:56:01 +0000
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
X-Inumbo-ID: 43c42cd8-2590-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ar1K0lsgMoeeDwFoFy08uHLp1EIYiCoYQEMNC6o38lZGdmB9Bc3ci7b/XrV2/CAXhk3iyfVRFsQrQx4WunZSaHOKSBm5Kh5wXL6RYSNs7EiBLepb+pNIwsFlMCjZO/4OaPypOr0ptOH6/FasffH9DeJ8bagNw+4zX6qpZDDqSBpMjvfOjQdCFmxnATObtA8o/P6B8d6DEqST6zu/cWIKGuCci90fXuybIBkis+3G8+/0kBoI7PDGFQWUMFIMjsvTwl1M6dbkN/xGAUox677rZ+Sa9N5dCq+rWk4lLxEpefbs9Ojogw3FPgvja8PhBxqV0ndo+jn+MrQRyxvNsY0adg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SV+kIMnUPslIWXoOI6vmVh8nATVsvSEdmSrG+f1fDc=;
 b=ltcuJktrFvTLrt72MMjc9YYcE3eRcbBYo4zWvc9VFwiaWcnYVI/SLeaH2WBfqMa4z3qwOQHduBPVM3S/R/dh5uoLPTEnMgf3aKElMAecRgm7cgPMiCxpJTxkc4+Np0jxv4y1dl3hr62h2tVtzZ0vfFIVUMTcKBFYtajOUgEaq1xX3uXWeBRiitHldCUVTBKcKzhB0OB4Kp4vur9ggIslgaOJgrf8XOsROa/9jsVDrnUlGNwrG613QcjurgkhJlxLac1F6z1eJPFE7oFJ3yEbKsnrbcVWJhnUI+/IF698nFtbt7h7m8bfGjPNNcE3fuWr2T7SDPdu6qK8/bZt0dCDwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SV+kIMnUPslIWXoOI6vmVh8nATVsvSEdmSrG+f1fDc=;
 b=D2bqzNDddfIPWRwOVRhZimmETvNI7lB15Ur2FHo5TzD08nzqivqK2kKhNtC03PBvVXvnbgE4MOTw/eZ1kCvgQ63OdHl9yvdyqWxqs72k/LI5HMVMHzA1EhtD2ixoBteioCKkES9Erg9fZXpWZ2ANXh6eMc0/unGCtlqqS5df3QM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKtgrfgYbiJ7G8codUlLxBd2RHel0e33EjLQlPwhnks1IJFSeBjvSKnPWHAyOwR06PFnRLBKgMeH33fSVkVS4XTeHWhs8JsWDMJ6tBBowVOCqKGedJTLU6JZcwjEyAOlq+NukpozedsF3W+v7Qxsj6Se7R/eHtE9GofTo81fjZxSVVuDYnE0LMoGlF8x3p3+vPQcBCtv/vr2Ihz0ug/gOVT9907uk7jg2/TTy4J+97NuQgLpMEkTcWIj7OIuThkeBMUqZ7GE5GZ38V7mQNO6E+IrvWpamb8NJekns4ujzAbjC/ndz5HT3/1qSYbDkTinIGYrjWDcumVoxE1SJjZzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SV+kIMnUPslIWXoOI6vmVh8nATVsvSEdmSrG+f1fDc=;
 b=UX+FddLZPTCb9vV99LC5lV4TXBl6xJOHylS0VDc1rQgKOSciifpmJPLK40vIpoJKyhXTkKJJHJmT5OgKP4g9loQu+hHQnWZaid6DXvArnOpm2RmXqlqG0slDJEhT6PthUEbEocBnIrHZ4Dlfuw5j88wmUHS3QQGFLzHqmYpxQv3n3DA+dQowhbl14rbh+7CWR096x1mSIF2Kfnx6MvQSteAlmE0BpbhtNpHu30pTfOGSlZFusP2x4W/3AbPpBZILs1vg34h0XClX9ZDgIdsM4fCBivLTeOYnjvG8uCFHYNDnBBXRk/tedq2sqMHJSDMhG7TCIAUgZ6aVKTAzJrJebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SV+kIMnUPslIWXoOI6vmVh8nATVsvSEdmSrG+f1fDc=;
 b=D2bqzNDddfIPWRwOVRhZimmETvNI7lB15Ur2FHo5TzD08nzqivqK2kKhNtC03PBvVXvnbgE4MOTw/eZ1kCvgQ63OdHl9yvdyqWxqs72k/LI5HMVMHzA1EhtD2ixoBteioCKkES9Erg9fZXpWZ2ANXh6eMc0/unGCtlqqS5df3QM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/7] arm/mpu: Provide and populate MPU C data
 structures
Thread-Topic: [PATCH v4 3/7] arm/mpu: Provide and populate MPU C data
 structures
Thread-Index: AQHbuRprYh16Ok81YUq8WQ3ZmeL+z7O7x4MA
Date: Wed, 30 Apr 2025 06:56:00 +0000
Message-ID: <54913278-3076-48AE-950F-D036B830EB8F@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-4-luca.fancellu@arm.com>
In-Reply-To: <20250429152057.2380536-4-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|PAVPR08MB9038:EE_|AMS1EPF00000049:EE_|AS8PR08MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 287838c5-8c7d-42f5-c1e1-08dd87b42570
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?0PPDjBMRyr44HHcPpOIzAqnfVp+h8AcWPwrdpa0i5OwZW4WrsXGinjdAswUe?=
 =?us-ascii?Q?Xwmli9poDZtM/bEqQ52q1mkviWDPRspIDxdf8I6ch/kTorWokpjSPBn0vrPu?=
 =?us-ascii?Q?x8Onu0ykRSK2oiPz5dTuZEa8syTCYiSbXrNj5QWh9zg+T7/pZUbQIxS2Io+9?=
 =?us-ascii?Q?LDD+bxhmbqA8gRfJZyWmvRPzo25NMXIia9t3at/WNuKxEr2o9cSYzl9VHdZa?=
 =?us-ascii?Q?8nemquk75RVL2qd1V1Y72/q25P+xt1ro4WNKHfAImhGPN6c8gfh14DuTa78+?=
 =?us-ascii?Q?oRDDfZa5FoF+htUXz+bDSiu7SzcqnJIbqmvVYSzTF4CKzHqX6LGcNU+U2GoE?=
 =?us-ascii?Q?dCY7U6XNUiubn4l25f3FRNJ+HRLj/MI79/TlAm3P68imv3c+HzG3yB6hPpER?=
 =?us-ascii?Q?67mUm6ww1oglJLzkskhCgYeIEnk4GJpAF4a0gNZun3ct5QoTOGhyB4K53b93?=
 =?us-ascii?Q?Bkbn2DNqdw7YKdEp/YThFN+c3DhBLcjfZ/w04YBnehAJrb26O0PtrITWl7d4?=
 =?us-ascii?Q?bXCPyB8toaoxOa923voUEMjadEE4h9OwTSQdzCqLr2f1Sma6zuI5EOuPEDsw?=
 =?us-ascii?Q?QH7pD2wsZywXFCibb10YiKvgZaIWN3YfOBm7nwWat+QSe0MtDO22+rmfzDJq?=
 =?us-ascii?Q?lShrTAk/e1UWjyJRxBi+2ACnU/aEyHPBtDeZOe4fIkMNjFjXoF/iWwF5Xz5k?=
 =?us-ascii?Q?AhLJ1TkjmbZN0pvi8xI6RBLTVz5DfIhQzE6JcLXpz2dyUsUJY1lOvwWZOE/E?=
 =?us-ascii?Q?JEyLcIUBmOLfyHwek0h/6c4xGBOPT4W0h/AcCK7SGJUPFKOuxTmFCR/lDpKC?=
 =?us-ascii?Q?8iEiwOOJBndOytNqphgZfrHniyNQyEn6hc8nhOZ3zZUgJtagnZH4wfNbJmj1?=
 =?us-ascii?Q?Ikz6LrLLUU8B1z3ej5oCupdRMwdyrKPzQsOzvVRkwH4tFiqM0JerTgRmqB/z?=
 =?us-ascii?Q?TGRmrceO45kZ9Qiy2UXjWErQS5M82W0/9sjkEGa9g5lGawlxdVYi18i44pD1?=
 =?us-ascii?Q?FQs0ck5/486Yg0Q1thTS4Tls7JnvgwaF/SUOfsKqf9kMJniwGfAOiKs39Z7P?=
 =?us-ascii?Q?8cpngayg4GTmO8fz4ESF8VJ4uUEnRHahn3JkczNwCo2Q80gQIDs/Lv3K0P8R?=
 =?us-ascii?Q?SqOw6QAskUFwwHcoFjIxv4tVTFm8ps9Z003k9qu2+MHt6RGX+8e+17rSf7yV?=
 =?us-ascii?Q?pfuyN0JNzKXFXeLJYU9EeXPNC5rf+niwoBH18XcFOeDGzDvVW93EjMQE0pM7?=
 =?us-ascii?Q?QMzuQyf6fupoRoYVyuh2CFWObOUzG3jkICY4XIJEXtEnzPhzS3gZYeEC9CMD?=
 =?us-ascii?Q?Dk7R173GGI/tOhK4aa8hp0/B5WRv8F/JgRNYRC2A0CYthd0YZHclPma0yGlE?=
 =?us-ascii?Q?OFFf1GSl4oiYX+J6isMKORcfCmJPRTl0EZJesLiagNSdc3vwTMR+L2PBUYDq?=
 =?us-ascii?Q?qoy10INMxnjpv9A/pd9sWPQR1UoYhGDuHs/Rte2nyxtD20Qrk7T2Jg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85F336FAB5E5F949A52A304440A81CDA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68c9ab8b-fd75-46e6-f3a9-08dd87b41136
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|14060799003|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ms8x1pQLfuzRl65QYg4a9rHB/X2kKT8rwu2QS3d06/PM/YwSdI2XfJ9WuC2j?=
 =?us-ascii?Q?PtSwEHlKJpVf8MaRn5c5EAeI8JDwHMLFV2umVVuEhUuA0cCN53Q52cbLuTEu?=
 =?us-ascii?Q?PU75SkNvZW70H1HN2SelT68P2s4mHFo2LVbW2zPBTVp+gK9gKK/+35lgmGWA?=
 =?us-ascii?Q?Af+AKzUrXMve0mpSRKa9JFiZRNB0ktHtzq1XVEP0Ca3hYa9EkqOxGgtDkYBN?=
 =?us-ascii?Q?F2leAk8PoZbALuYd1pZl6ITq+sAdoYnHMW22WJIWX0dAlxkHNfmeHJg2IJRh?=
 =?us-ascii?Q?G5ubbM6A4lBMOhZaVv1RpzQT6aNHuGCzgOwyDedg0Ttnfc/B4QefehVHNZ16?=
 =?us-ascii?Q?Fq6irJThX44AbJz8Wz48h68D/ow3iXuFB6Vyhp49Ky8xM5SP3PkQw2Nyoet4?=
 =?us-ascii?Q?KyJ1/EvCICLeZF+EPOSpEIkY7fS+Z9vWxAbgS2ICjW+1ha1hWdVvouP9gV6A?=
 =?us-ascii?Q?nLP+FtODNevgJTjuVF41hyGbbovpOZXUMSWNX9TDpNTKGWWPC3ABQh/j1CU5?=
 =?us-ascii?Q?hU8P3Ry3ahfK9qfQyF7v9sDw4rl2z3ICedKFnJr7kKp8s1/ncGpJcZ4OOPq1?=
 =?us-ascii?Q?1eL2aedsfQVvV5h2w55mU4FoCoUbBKJgRhEDana3zYNsWl7ROGo3JIoM65Ud?=
 =?us-ascii?Q?I4obIZmiXlOvM0Fm8Iym4+nOlmEvnu7a3JjZGjnSRj+W/PGMi+RxXK+3ox99?=
 =?us-ascii?Q?z11rJs1J5Kit8EeKxBTuNM0Hopy3PeMWeItBrsoVbS3lErm/Ej1URfmpyOKp?=
 =?us-ascii?Q?f67QrPuzVMDx/yU2EGmqpazs+WiPLdzPNOccCy5ug/owHhseuKA118dwq8v9?=
 =?us-ascii?Q?KrlM71iHaOW99CmToTxcFInAdELeDl6cvMT/cHCTKY168ic0HxGqk9jXejxk?=
 =?us-ascii?Q?z1pzMWBEe+ky/Bv0plJ0FAo9kX0Q/DdYuv8h82XmD/IChZJc+8P8SYTInoPp?=
 =?us-ascii?Q?1X5g1QHQLBLdILUT38rWRmBBeEqF2/uiTxavwFWvpo4XQ2t4zWeqTicNjDhu?=
 =?us-ascii?Q?bRIw5wUrRZvCAyLyb4kzYuoXznGaEFt/lT9ywq0C+yywRwB2LhXSFnn5aq3f?=
 =?us-ascii?Q?zZ32lflhRjbW6vWbCOSRHfCUhldguoURM+vNwxKPgF+ksuUzbG7F1Y5IJ3VQ?=
 =?us-ascii?Q?hqFGauWSguGJqwq2NN58Se8NyJAT3QMoOlw7mpvHIUHYxDzJp0bY2w5jU4wQ?=
 =?us-ascii?Q?L9MdxKBRi79hgAvK2XjWeaP1KFQ36huNpxt7yUobRbRGiNaCLL7GpEvwug8d?=
 =?us-ascii?Q?qvJzuolOK/Us8VYa3PnlqL68OwHgMfN6DxM5rsHgfBokFk1mBHoB3R+WkVb6?=
 =?us-ascii?Q?+/7lX40CkUKbdlLuLnod8eV/g8ldH5/ooXjKsmCsvh2XWe4MznAZeGcuSOE5?=
 =?us-ascii?Q?+KPvI86tnitYdKjnmNSyjNuFXsmm9tuZGEX2o95L5PB6Bei2ytfcFD5DW0hm?=
 =?us-ascii?Q?bI6KFdhbh3mBBopozPVWfWtIqzMnVm+x1AnKaB8AVqWkWJQg9UdSapVaVgV+?=
 =?us-ascii?Q?ulCzRoG/OSZcin/IMxKHJcPbMFZ6xsVoiGSo?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:56:34.7663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287838c5-8c7d-42f5-c1e1-08dd87b42570
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6661

Hi all,

> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/incl=
ude/asm/mpu/regions.inc
> index 47868a152662..dc0306f8c5fc 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -1,22 +1,50 @@
> /* SPDX-License-Identifier: GPL-2.0-only */
>=20
> +#include <asm/bitmap-op.inc>
> #include <asm/mpu.h>
> #include <asm/sysregs.h>
>=20
> /* Backgroud region enable/disable */
> #define SCTLR_ELx_BR    BIT(17, UL)
>=20
> +#define REGION_DISABLED_PRLAR   0x00    /* NS=3D0 ATTR=3D000 EN=3D0 */
> #define REGION_NORMAL_PRLAR     0x0f    /* NS=3D0 ATTR=3D111 EN=3D1 */
> #define REGION_DEVICE_PRLAR     0x09    /* NS=3D0 ATTR=3D100 EN=3D1 */
>=20
> +#define PRLAR_ELx_EN            0x1
> +
> +#ifdef CONFIG_ARM_64
> +#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */
> +
> +.macro store_pair reg1, reg2, dst
> +        stp \reg1, \reg2, [\dst]
> +.endm
> +
> +.macro invalidate_dcache_one reg
> +        dc ivac, \reg
> +.endm
> +
> +#else
> +#define XEN_MPUMAP_ENTRY_SHIFT  0x2     /* 8 byte structure */

This should be 0x3, my mistake!=20

Cheers,
Luca=

