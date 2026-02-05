Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOqiE5e+hGnG4wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:00:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A276F4E49
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:00:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222166.1530197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1lv-0007IW-F4; Thu, 05 Feb 2026 15:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222166.1530197; Thu, 05 Feb 2026 15:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1lv-0007Gx-BH; Thu, 05 Feb 2026 15:59:59 +0000
Received: by outflank-mailman (input) for mailman id 1222166;
 Thu, 05 Feb 2026 15:59:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vo1lu-0007Gr-J1
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:59:58 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e5e318-02ab-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 16:59:57 +0100 (CET)
Received: from AS4P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::6)
 by PAXPR08MB6413.eurprd08.prod.outlook.com (2603:10a6:102:de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 15:59:39 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5da:cafe::d0) by AS4P192CA0008.outlook.office365.com
 (2603:10a6:20b:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 15:59:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.0 via
 Frontend Transport; Thu, 5 Feb 2026 15:59:38 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB8044.eurprd08.prod.outlook.com (2603:10a6:10:3e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 15:58:34 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 15:58:34 +0000
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
X-Inumbo-ID: b7e5e318-02ab-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rxCQXKCaXeYMpYnBAWV/Jg6g/USJl6GoaI6xOssFsBfiQBNjXFpPGbBBc74UzU1myTgA7tw1t3qMnFIEeFfPxHhscZe3MDNyLbN7+twQGTuP9RxBv8OIE5fiuqrLykW6IEP/D3QvMuY/4UjplE2g3ThsO3D5CdrYnfi1fydWIIHJ2FB1lKPSaOZK+jEtrotx9mFRLpck7+Z4SMya8rnzj3YBWsfdglzJuZaiR4WqCohQSx7NpZ71+eq3VA9XixSTqKdisWFIXsfZmGoKfuhlGFxxrwgbRezlqms8WYPh5eXha4criYdqH8zUFCQypA3LU7tAcMXsceHcptkB+xE/dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOQgdT734tyaQvnJPnVFeWkvKvV03eRV5SqxeUCQ0fA=;
 b=DjjV7ONdNZQcDx+dHTdcuHf/MPjiVKj3d+1MTftdqEUmmKkCB3YLaiU9zvJgWOU3zdMpsGzyvF+GMXIGk94Uf2eyhNcuDzIM85c/MXqSZDq6ZEYoagZ9obwCSWM8QFc4bzNHDXWuQ+nM/r/bPwKu/BdNv0EK5xF8lpItpzKUkSWCrtVhk+XTq9nojXtEgOzBIV9CQGeXDrzlqUK3UtrTPMEsqx4raqq6Af8TkhUqZ7wNnRqf0/RJdG0UVGYCPnBk55OPuOx+IqM7lAPdp3AaFMl20hevtXinSzhALD4Y4vPkOCydKkQ8/9P8YFgCm/F+pFVKtOQg6DOKYmRNiBD3XA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOQgdT734tyaQvnJPnVFeWkvKvV03eRV5SqxeUCQ0fA=;
 b=M+5J3HhRjSG4XUvsOcQ5dhyBxOTaH1EUsYo/W7GJtsI52tQpzj26TtQQfr69puNmnm/3qFIMUEJLRcP3Mzmfr9Y2/dfE8XHqHyAvC8MA+Za2Z72tJBLtFk0/WuojIHj/Sgwj4D7wrymmv0gSkKxxSdM2mddlo+MSUtx7w4GtmoE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uIC9C36/kaeGMc66zc8rhi3SeWNF6aKGHS7Kpbnjj/2TUd+iLAThboGAliEI1MrdJiqbATDi5UJJLF/vYEcJIUix7U/m41nWYPaWfhXwAcIO2Yf4TV6gNTJwMHkL6JXyZbyXcERlJ0arDt1TCMuMti82OTE+qzngzN7pWQoMnHNbc2sjH1M2g3v46hhfe1p7omtxTUJpFxNX0mjWKHC+m5zZc4tL2NolfQwAfE4vAHFI5l/a8/2ggiuEwg7TA4zDDPrY1bIZN50ySXB3weGYHnaKd7VXKMyt43VmR0eUV1LDMD7WFYIPBM6/+4AiuXwxJG2mV8rTHfJsQV2BZ04b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOQgdT734tyaQvnJPnVFeWkvKvV03eRV5SqxeUCQ0fA=;
 b=Vy+kzToZWJzNtt3+S5HL6cj9jJ7XrgZFLwsvRCIHenb6x3qiTClSusseHp5bKFcMWGsA7KleCACjX6RMOWgDG8A8UBDbYgQndWBOKdxf748q5cQb5sJVr+SDpyKTiEhcC3h9+jJAKVgJE+B8X4LTg8CxpW3l2tFM9hvQBUauacoJ3hPghR/8FPJwmj1Sic4ACLr3Wt2LROGrsBg6q+7cRrHw6mH6Qyyd/et4b5BetlfmdkQV1nWnvyeMVhtNdQLUh/kbWhdOQSFnkkaG69E2YIvGYmSiNAJk49HNqDCZuxdRoTa3XNtN3aqaUEcD0LNDgaQtmfsNw0TT7IA+DdsBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOQgdT734tyaQvnJPnVFeWkvKvV03eRV5SqxeUCQ0fA=;
 b=M+5J3HhRjSG4XUvsOcQ5dhyBxOTaH1EUsYo/W7GJtsI52tQpzj26TtQQfr69puNmnm/3qFIMUEJLRcP3Mzmfr9Y2/dfE8XHqHyAvC8MA+Za2Z72tJBLtFk0/WuojIHj/Sgwj4D7wrymmv0gSkKxxSdM2mddlo+MSUtx7w4GtmoE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Topic: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Index: AQHclpNk83RtAc43+U+zvyNqPofiH7V0CQWAgAAyjwCAAAOggIAABCkA
Date: Thu, 5 Feb 2026 15:58:34 +0000
Message-ID: <6AED68E8-CCBE-46AB-AFF0-9C87AAB770C3@arm.com>
References:
 <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <7bf2ee2a-177f-4d7b-9dde-ee43bc4311b8@suse.com>
 <2B5080FA-A0F3-491C-954C-A458C6CA2E93@arm.com>
 <a3cfd04a-c32d-412c-b352-b4a1e65cac52@suse.com>
In-Reply-To: <a3cfd04a-c32d-412c-b352-b4a1e65cac52@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB8044:EE_|AM4PEPF00025F9A:EE_|PAXPR08MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: ba48aa57-cadb-4065-1c4b-08de64cf90e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?yFY+XhvA0NsUu3Db6EmJjnsTh2ZSlvrwwZKjGvxkU+N9jnm/aoYPEwYgLW?=
 =?iso-8859-1?Q?IBN38iOdfzvVVG9mCUKnNwYPLk+Pq/aFNPDE7Ga4/z38rLnguSGSrwoaxR?=
 =?iso-8859-1?Q?r5gw5k2KYs/uKCzVGdwWZHi79g2kjYHZZwh6LPvo6cWhBEP0DCEgZYh1tb?=
 =?iso-8859-1?Q?aistQADQG9pOKlSiFC4rqrh40VvoO30bWSMCiUz1LRrs+4tj/ybAqxZExA?=
 =?iso-8859-1?Q?es+Dv1NUTvZAHs2u0CYlr2wg7/RpgIic8m7n39z9TUlcdxLZumtSlSDKfx?=
 =?iso-8859-1?Q?4JPnlPyLheoSB5/qrCZJfUz0g8m0njmATMghPSZ6JYM4iDgd8LF3/sopfP?=
 =?iso-8859-1?Q?YUiYRxR71f49zpWNDxXH3V9cWT9p3TUd1zg5gxrB7hUHdcowAw+mhltPmP?=
 =?iso-8859-1?Q?0NxiSp66WJV3+t+kHuFGKMLPpHWiFgL4qL8XfnC3QpMNZilkwdH0PzGNWx?=
 =?iso-8859-1?Q?YdzFDqA5MXuPDlUeYlPQyl3CyZfoIokQC7Xf7gY4htIbEaZIzIRghDQ/Nl?=
 =?iso-8859-1?Q?uWEDn5uFLgYkRMjFmNHZtQ8pUDz0sPHSoagiKrO7DGqU1sfi3ItoFtRkW4?=
 =?iso-8859-1?Q?cAnqT59wTMUKRL2YV+XmjolADT2bgm77wALi3Ptryi93A2wkDKDNG3RXUW?=
 =?iso-8859-1?Q?yA0TSeFTbESnYoFK0Mt6pnMecqN+R9TU+ispnM8a3gQIyrBYx2CeUUTle7?=
 =?iso-8859-1?Q?vRDxTt3dlFIyeLGmR1z1DTobXqzusfzUT9EieN/BuDJgiAIQtCK+umPxM0?=
 =?iso-8859-1?Q?/ts3UfBhdYPFALrYG6ltVxQQbgaOmukkPZT1Fm+YPhSbFbf+CH6Af8pxD3?=
 =?iso-8859-1?Q?L1PlmZnfU9nkaeC7fiP58bYEZO1cGdx38FEqG/itbHsjscB2fTUNb4HWZ3?=
 =?iso-8859-1?Q?NZM8Fj6XtYFqw9TyX6T76OFK4/UydbrPgCFFmU61Y8dgchI0GhZWi384oc?=
 =?iso-8859-1?Q?AWdvI0+jzZxRj+8FiDq+AaF3FrnMR7VXxZhd35Hd0tQUaKJm/ztFjLQX6/?=
 =?iso-8859-1?Q?IfasMP2wUfYsucXHdEsA1tLSDmxoYQ3vqh5Vz+QT9ztLCpxyNV2/O7eNIR?=
 =?iso-8859-1?Q?OqiBhopsAQkN/BuAkfRiRsOI4UMCLVPemmBRoYdMrvYwvVadCbYAwXoBDL?=
 =?iso-8859-1?Q?7yIeftiv+xG7kUIQtLnca64f4o/7Yi2KMmZkAutFXiFRhdBaQkgHe7p9Ll?=
 =?iso-8859-1?Q?YUqfMjCbg7zMAHsqskt1r+ZgeMbrUJVi5vDIWnHZ29jy+NYMuOskrFpeTi?=
 =?iso-8859-1?Q?6F96aY3HsE3bewwdn4e/XaOlOYcReVzgKGr3hwKRgT6Z92ehtDUWeFeELC?=
 =?iso-8859-1?Q?+c4K9Bxum5Hm0xxJqvakxlXRLGS89JRGRpgbr5coiV4b5MCfW0HRk9mtEn?=
 =?iso-8859-1?Q?1yc4ud4ffqe+74czkR6uhlA1Z9HHejeRBsoaqrLJNNjLVtcsxsRmSbOdtO?=
 =?iso-8859-1?Q?fjDIaXX76v3VmAAigub1F7a5nSvrPiX/03vTQekp4j5GdiHyZI1baJZtie?=
 =?iso-8859-1?Q?qjrRQhvivPqE0KsB0DG6u30LQymMfv06bTGFcmQQ4Q6qVupws7N5nwEWFW?=
 =?iso-8859-1?Q?Ow+OVg+7zq+0FPhw2Wt2ZLHuVev5UJ11zCbFmyZEtbeTLd8GZQlOqJyNwh?=
 =?iso-8859-1?Q?uC1UJHqmnr09IDfrBNQmUk404/OAFIcdR/vjkiPJxw0fV1RF1GnHdUx033?=
 =?iso-8859-1?Q?damfmB2ITWQpAtENJXg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <818FDF940F6CD14BAD015483D85C1860@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46be51c2-2789-4a9f-081c-08de64cf6aa4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|82310400026|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Cswm67Xrg9+VAzMSVFeUB/5bRCwEGG16T0HhtJ8Vo1qcdwcgxrzXR2C3Py?=
 =?iso-8859-1?Q?2gtpXvQMZo4BQ9MsrjPK2/ya+g+JpW6m2gZxahYLJ30y4BsGX79k9zeUlj?=
 =?iso-8859-1?Q?lJjtgoarg7YVQsjwF+JEMXPbEPZj7RX4Zco7Yi/hVsdUD2XhqBEe2MwVrs?=
 =?iso-8859-1?Q?HrmA/njZNibc+vupV2/FmMFUai7WZLpxYnjFhtYmt2yWdXUr7jkhIjrsyr?=
 =?iso-8859-1?Q?ozdG+35MH+V2RG81ABKvENON/kb9S0jCsTt0QUyn1Ku0pVYK9cFSh6c6EI?=
 =?iso-8859-1?Q?FZladB52k0MfIjM5WDciY0SEFKGPDvjvVWiEo2ERMMLqKBj+D7o60b0QT0?=
 =?iso-8859-1?Q?ft0ooBNfUCTH5LuTzI5KR8zCsiJRaKqYpHQNWfIycbVXAikIXV/OtlrQlv?=
 =?iso-8859-1?Q?9oI+SH9ILxs8u0F2FvYPEV0QcTCAvBv3VFA70bhahcvcTwkccgqKnnfEXQ?=
 =?iso-8859-1?Q?/NerRd4TXj6BICiBCbingbA8c6yqnGCtrn8ys9wchCzK8PG+Wt4/lwpEPc?=
 =?iso-8859-1?Q?91fpyjirtv+M0j6gou9RWXcqa8FxgE0V6BIb4p/pveBNsGF5IRnOY/0sx3?=
 =?iso-8859-1?Q?9gNRrIF5Ra0o7KhRv1onLF4CzCY55mu1j8MfjGplGciUdnwUHE5Z99Vu5V?=
 =?iso-8859-1?Q?tnFyWeQu/Q2oYSBluEONJ11lzLmkIRdVEkDq8zgT4I209CzPMX8ItVr5A8?=
 =?iso-8859-1?Q?ciQo/2fwVdtC2gbg+IudH3N24NNpLCdxmnKwJIHlC9+PzZN4NrHAEnS1EG?=
 =?iso-8859-1?Q?0kAiAxF6zHeBlInn1BUrkClbB56vqZ4F01yo7pynste/9FDYFBcrEYW6Zk?=
 =?iso-8859-1?Q?dpFaHyTTI1nXUAlK5FyhmzltpOEjTVxFQxC1HEx8rFRWjEZQI5LgmtP4nC?=
 =?iso-8859-1?Q?fLThNTTo3xR8bspomQijX6BpQwr71t5meoybPD+4An4mazYH/TQ/t62og8?=
 =?iso-8859-1?Q?7xkJflec934QZnPljJ6S+lr1bXa9RIZsVCxbdMBHnmUxQxtC4n7gKrRpQH?=
 =?iso-8859-1?Q?pDzFbjiDHnEAqmXSEHq7zk59GF296lMo41u/GF4bAfNKNCyhxpZUgcP/mc?=
 =?iso-8859-1?Q?Ysu8e4NUO4erl8+ZJ3+rLKF5Z7DUV2rNFd+IQfUHyGn4tGWqUPWOg+dsuk?=
 =?iso-8859-1?Q?PLxmjrzpDMdeRnenv96rIRn38XHqO/1RWr2vUpuFV27wE6t4SOn4D6bTSW?=
 =?iso-8859-1?Q?9UIb7uAzfGacUy7Yh1+jTo8Jlndp5sn83SUsGtVZJSKq7h/rtCmk6R+Yga?=
 =?iso-8859-1?Q?advlhwJEC+DgGIyOy04sFdhIsDcEPc+brwwzXGfwD87lm6LQfjxVTBLaGY?=
 =?iso-8859-1?Q?ji/EZXamRx505Mw7LrVygmsfqTaNmHJVOKifoBmMo/D6FaoYnw71pvXrwa?=
 =?iso-8859-1?Q?unFX1prDSOrt9fllJX/v5OvwCjcXhieQq8NW6BQK399LQ0Jkk3MKBcoPtS?=
 =?iso-8859-1?Q?dKcAqKlRzOwDEbi4p8/hLf+q0JFREkzCn4tfTkDQzgd9DU18SOVj/T0bT8?=
 =?iso-8859-1?Q?m67h0hUXp2rDCng+dg7BB1BLwKwujOaen/OlMxmZNghC22ox5NTh7I7OBH?=
 =?iso-8859-1?Q?CHrucGVub/ZYKvyqDVC1ChZ4+26gI9R1sdMJe4/zSk8sb7EYVhesRf4Fp1?=
 =?iso-8859-1?Q?/9VscfAAI8LkSW6MxDXovJxjgcpuhnQwQDNVpX5wizzN2WnTbSHhVo/7XJ?=
 =?iso-8859-1?Q?xPc6Ds/lQuo/hXKrkoPAfgnN6cJD7ue7jIbjte19gJ0/Yj1F0y8Tu0OQ68?=
 =?iso-8859-1?Q?AAbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r/CoR4VLX7srNsSGbBu81ZWwV7FL5HijvwMhPTbbhvF8xW7NXqSR+3T7gdWftxRwTsXBu7ZLQO0oX6EPTAejGYV0EW0miIdK+CdOkS8jU8yWgg+B3yuC0hP9K+b2iFoWXCsHGo1yF5k9NyzsUFbNHosFUmOBp2TKJ2dFMkoQByfSvlpcWBdbXvgyvMnGCjco/TytIXK7HRZg2Holk2vMkDe0mdciqShRDX7C3M8TlXnzcjVhrt0l7ozw5gZNtUCvLnYcM/zDAloti3vgvvilpderX6+bT5uf0f1zHGLWcfWa3wpAKOL/pebwf64+pOPDuB+yEfz73KuZFbMsI7Kwfi9VSyvS0t9s6PsFEICo9lkrznUh8mqnQFniIobdmcGLHa4qIGYdFQrfpC3drTqPMfB23ERNBdpT4P6K9sOLW/npyP17CmN9B0uM3ZPkRMzi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:59:38.4259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba48aa57-cadb-4065-1c4b-08de64cf90e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6413
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,darwin.mk:url,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9A276F4E49
X-Rspamd-Action: no action

Hi Jan,

> On 5 Feb 2026, at 16:43, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.02.2026 16:30, Bertrand Marquis wrote:
>>> On 5 Feb 2026, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 05.02.2026 12:33, Bertrand Marquis wrote:
>>>> Xen does not currently document how to build the hypervisor on macOS, =
and
>>>> there is no Darwin configuration for selecting a Homebrew-based GNU
>>>> toolchain. Native builds are not supported; the hypervisor must be
>>>> cross-built with a GNU toolchain and GNU make/sed.
>>>>=20
>>>> Add a minimal Darwin.mk which selects the GNU tool definitions used by
>>>> the macOS workflow and point to the build guide for required tools and
>>>> setup. Document the Homebrew cross toolchain and GNU tools needed to
>>>> build the hypervisor on macOS.
>>>>=20
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>> config/Darwin.mk            |  6 ++++
>>>> docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
>>>> 2 files changed, 72 insertions(+)
>>>> create mode 100644 config/Darwin.mk
>>>> create mode 100644 docs/misc/build-on-macos.md
>>>=20
>>> I'm sorry, I should have paid attention already on the RFC, but: With a=
ll
>>> other Pandoc files in this directory being named *.pandoc, do we really=
 want
>>> to have an outlier named *.md there?
>>=20
>> Right but this might not be needed anymore as the only thing needed afte=
r Roger's
>> patch is only a toolchain so brew is one solution but there are a lot of=
 others.
>=20
> Even better.
>=20
>>>> --- /dev/null
>>>> +++ b/config/Darwin.mk
>>>> @@ -0,0 +1,6 @@
>>>> +# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU=
 tools.
>>>> +# See docs/misc/build-on-macos.md for required tools and setup.
>>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>>=20
>>> Given Roger's consideration towards possibly using a more MacOS-native
>>> build arrangement as an alternative, I'm actually not quite sure this s=
hould
>>> then be the default mode here. Roger, what are your thoughts?
>>=20
>> Even with Mac OS sed and make working, something is still needed here to=
=20
>> compile on Mac OS.
>>=20
>> What would you suggest the default mode should be here ? Mac OS is not G=
NU
>> but everything used correspond to what is defined by StdGNU.mk.
>>=20
>> I am only forcing cross compilation here to prevent using the host toolc=
hain.
>=20
> That part is okay with me.
>=20
>> What do you think i should put there instead ?
>=20
> Using StdGNU.mk may still be okay, as long as the comment properly repres=
ents
> the overall situation.

Agree.

What do you think of the following:

Use GNU tool definitions as the tools we are using are either GNU compatibl=
e
or we only use features which are supported on Mac OS.

Bertrand


