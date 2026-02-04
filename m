Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D1JHCEFg2njggMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:36:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E45E3382
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220209.1528918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYN1-0000m9-Oz; Wed, 04 Feb 2026 08:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220209.1528918; Wed, 04 Feb 2026 08:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYN1-0000jU-M2; Wed, 04 Feb 2026 08:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1220209;
 Wed, 04 Feb 2026 08:36:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnYN0-0000jL-75
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:36:18 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e17cf0f-01a4-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 09:36:09 +0100 (CET)
Received: from AM6P191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::44)
 by PAVPR08MB8822.eurprd08.prod.outlook.com (2603:10a6:102:2ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:36:04 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:209:8b:cafe::c8) by AM6P191CA0031.outlook.office365.com
 (2603:10a6:209:8b::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Wed,
 4 Feb 2026 08:36:02 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 08:36:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAVPR08MB9625.eurprd08.prod.outlook.com (2603:10a6:102:310::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 08:34:59 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 08:34:59 +0000
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
X-Inumbo-ID: 8e17cf0f-01a4-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b2RXaxfoFPSzsRz1ZLf1iwQM2POBBfxVn00BM+4xgqNk2idDZ2eQvEs4ql91ZsKh1vrAAho0uqCaudHFGRfL0XzY3CDfRt3LmrA5OMBakLmltgq3nlvJWdOVtiYxH3xPD6Jy5qHx/adtjIMyXl7pkmxi6bMoHdNb5CIRaL9NARTsDvtPuUqL+WtdXVc4ONlYfHrddIPoI/fWbhNfCWA4bAdylbGs1cl/mAiztF2DwQetRCYnrhgnWUq2SzDK+52WfGqD4JulWjJ2hwgoFzfR9owwbPvtugqdLFZBKh2YSazEu7OQ2WPja+o6xapgGqRFBf3KfZgwVBna604Pp+UTYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLp6p/x+WMMVlG386HgFX8zvxq5M5ISiafLmRsagybY=;
 b=BtatWjH07S2MbXsPJWeO2zZrt7xJP525SlN5auQZfn9VECLBjeL64Z09dE57cJQA5ZDJM3moNX7nnUn7NebAY7AapUGzjCBuyY6QM/DfdGT9KwK7CbOqi4N6VgrblLM8PyEYaKs1u+bKpXd8YIeMNZjkBkAXm27dNzieqL4z29V+HpAwHsWiGr2DyWovJyAgQMuuiTPtUfdudTSiVlyfW//f4DqFp2cTaC5hu1nPRJIVad0TMyRekf13iR3W9u1tX/dckf08zjOeC+mg/sW9gNlgJesrdLVgi7RQCzgLtMLbkAmHu5PvBv/ryvktcrJurm/1YvvDfL7YJ+/FmTfMtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLp6p/x+WMMVlG386HgFX8zvxq5M5ISiafLmRsagybY=;
 b=mwXqijK6pf9YjZ8z9bJEKhKk0dWuheOSQwK+oU+6Zu6WZ8KZMNUAXemg/NrSQEmIT7sljDZvWuxlll8hDcYMuRaClWkEw9UdJUzk1HwUkgTR91sNLRqzRaTo7Y6aWaW7BJWvEZxpR8vOo/XBZFjGHdTkjxMUhutg8/Aiy9UZnao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrDzLaF4B/OK1g/eSJ/FCRJLZZWuX1RT/n/8PHNnU5iTVpO9/p4q1FJVAOPwe7zRg0PhujXR+yKHBW9PG11tpkZ7d4yu08wkdEpF/t6aXd9VsCRpVMiW1/S8kHLNrmsPL3wTXdFPIuvffzb9sRSXJ3YNbOyOu6cnPA7Agun0CgazW2ZfsXazD2hTwDGTH3iHQD4JWXD+8iJ3WvsRpGAEjZ4hg0EcIgrkd7akEnfwx5NwltbsBpQQmv8SeZpinJMlk1rDqFxCZuRq2BBHsyYepM6X86wDvB4UbThj46DMW2swfxrKNhBRBp52llFk2Ox2JC6oZuCinbEG8W1uxylYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLp6p/x+WMMVlG386HgFX8zvxq5M5ISiafLmRsagybY=;
 b=h2YYGf1TjU3yP3yIDYNAMP2h2paZJemp7Se9p8PMr9fl+F6IsMhxYDNNTxUCsbMVEP0E0us+/x4XwSOBOpwdpPcPYTUxaSxcu3qMIDENObuQ1Qc7v1GYAWFQsnoC7+gg7MDiaa1cylME27BJaDuQid6vOgIWe8R1EFc2/Foq4nK1b6fppAhX74sbvs76kQs3qYEZmfa+G34iodAHcblH68Z6TWJMwqk3xh3cLfCuc+UbXR0g2wo3feOh3CqH8zQYVNBLD8E4jKkpp0Mlo3542Quv8izu2rOWcQmcBthsjydr7XKsrra136wQKf7rBswHp4k9/y7a6jTfyW/f1/I/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLp6p/x+WMMVlG386HgFX8zvxq5M5ISiafLmRsagybY=;
 b=mwXqijK6pf9YjZ8z9bJEKhKk0dWuheOSQwK+oU+6Zu6WZ8KZMNUAXemg/NrSQEmIT7sljDZvWuxlll8hDcYMuRaClWkEw9UdJUzk1HwUkgTR91sNLRqzRaTo7Y6aWaW7BJWvEZxpR8vOo/XBZFjGHdTkjxMUhutg8/Aiy9UZnao=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH] build: avoid Paths.mk in hypervisor build
Thread-Topic: [PATCH] build: avoid Paths.mk in hypervisor build
Thread-Index: AQHchV6cHH8qTLh8YEa40ejcvCxMQLVyV4CA
Date: Wed, 4 Feb 2026 08:34:58 +0000
Message-ID: <41BA3E9A-19D7-42E0-A774-DB9CB5371564@arm.com>
References: <ab8a6f18-522c-4493-b46e-0f51c4350bc2@suse.com>
In-Reply-To: <ab8a6f18-522c-4493-b46e-0f51c4350bc2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAVPR08MB9625:EE_|AMS1EPF00000044:EE_|PAVPR08MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb0b75c-272b-4adc-7a96-08de63c86e15
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?ikCjy4Xgq21SRWX8yylISDO55sIS/hTwLWR3SPnMNRGc7bHT4WMpZSIrHz?=
 =?iso-8859-1?Q?Ewr/P7xMukvejoGi76Npf2AQr8cShPPYraAy0mMZUCW0O0gr4knfIlcaJh?=
 =?iso-8859-1?Q?a3NPbY7Gdj2w9McjaVENpzJla9Omp5BDSvGSCzFoTSKM4J176AiZelgRZM?=
 =?iso-8859-1?Q?xKciXkHrkewzOFxRtRLiv9ySp4/5+T7Vi+ck+epr9HOaiyST3mlyGBGYo5?=
 =?iso-8859-1?Q?aV7xE5kcdEqwakDxBOV4/Dz1d2PZV+Yzx4DWwy9z7yV+l5QnfrmlkdtkCM?=
 =?iso-8859-1?Q?5vTo5m33TuaF82MLyD2Kf3DKQWMmpTj3p9KiN9CbUUygX3xPVkTC9GTjQK?=
 =?iso-8859-1?Q?/1hZAeDjYRiuhmDUKjV6X+1hQay38X685MhCh740Ya+OaOCVW2e0vpVmSo?=
 =?iso-8859-1?Q?cOZ/TOpP0eCjUDHKf+h4tlMkHsqoM2j3acuCMQ1Vo0vNmbWWSQQ0yJuwVY?=
 =?iso-8859-1?Q?+U/9CY9tnm/2fpplaPpL3crlmYUjw2n8C51OBI/JnZp+4ebI0TvYcQJg6R?=
 =?iso-8859-1?Q?BzxD6TPgSGg/2JcpTRncQ0+UNIP4//gVsBREP+fJJWXLUtjn5nIAxFpU1t?=
 =?iso-8859-1?Q?f0oiYo0YqCirrny3LwAie7f4rub6Ev2qvQJusD7FErVQuIeCjahPS0wVXz?=
 =?iso-8859-1?Q?uO1FUeXev5efnjLgPL4DFhiqCk7Ts+Ep/Ls3pK+ODOr4AFuJsAcdVdBXeS?=
 =?iso-8859-1?Q?77uRWQ29kys0Pvdf4jpFVL+o9qrU1lzTfFGrQsi6ZjX63/oEgTiJhqfsZT?=
 =?iso-8859-1?Q?/wxup7PtQYwgzVHAOjIFOszICgDRaZ9pkkKye4UPFhf+6ppCSpqW3c3mET?=
 =?iso-8859-1?Q?PhKIzxacY3NxWR7bEUNXpdtxre4gwAQhRXLai1SfhlEBp+TyZLnOwXG360?=
 =?iso-8859-1?Q?mCf2sP6Mwtd+JCHoc4+erXdwDLh2XbxA8uLiEjyPM0Gu/BOjzRLMAE2hCL?=
 =?iso-8859-1?Q?cPwGNPWuWmNFyYZY2aEfAK1ltsRMHzEb0uLaCmy4nPpHIgJ3JK717adM1T?=
 =?iso-8859-1?Q?E154+nOZ/NQ6vqoIyXzrNz3uy5MRtItMq4vYVmKgY8JKs3uefG9gamev4G?=
 =?iso-8859-1?Q?qXsFQkdZBsOxiC+ivYaZaKNMpMrDn6kksa8VBSStPCPPJWsrxoDFXhj9qu?=
 =?iso-8859-1?Q?HysY52hqrHPS7irBILIRwhsepyeAKmIqhd9AcOfotWj7tPqWMXjs78UQTw?=
 =?iso-8859-1?Q?TY4Hqo8pyqFN5zEZVRv4mLdxjUu0jK6QkwOLoM8ZYnq6EQARbILrnG9byw?=
 =?iso-8859-1?Q?mGYtp8LrYO0H0Td7aJcHusmZsJXQNPudBAN2QRlMLppqKKBcBgKn6uQkOz?=
 =?iso-8859-1?Q?JxA6ZhQH5TVWuowkfvpIIxzcAijcbkxiVQKNMOUHUh+MLRiAqDjuqSa0+V?=
 =?iso-8859-1?Q?f02+VT+NPE16YSXRmunkFeaABfrkcNX0uHgAfhuRYOZ3NKd6t+5y2fH79l?=
 =?iso-8859-1?Q?shVjW1lAZxvZkvvDh9/c46B7FDkI8SrQEmz/ndya7EZ6uCwxKkPVGuGaTw?=
 =?iso-8859-1?Q?WDKatG6jNz0Jdf5V1FIciEn31HPECyt6abdILBMJXfpm9pp2+dRsumFBqP?=
 =?iso-8859-1?Q?Mhoo1l7/SxCWNfzxq9rAQ2buj4F8aNjVH04cCVcjXHeMNZVOkIxlAuRz14?=
 =?iso-8859-1?Q?oPesWkrZqyqQFKNQBY+rYuiMHyLgJ0fONm/wyFUj+gUMlUUNvtzeFkZ+bz?=
 =?iso-8859-1?Q?5yfyrgBKFLH2PbSK1mU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2EDA079EDAF70B47A13436823CC0BAAF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9625
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ad4bce6-ee5a-4010-38c2-08de63c8484e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?tEqofztpjkkExCLkVadgs3DAvy62u7PvXJWsiotVxRYUiM6wnEt62jvGEw?=
 =?iso-8859-1?Q?EYH9bDC9pae/0oKFQhMURJFw2rCZvCItyAsDuKFCPiOugvqlX3h2mOLunW?=
 =?iso-8859-1?Q?LRPdt8vT6h9Q4km5qZ6XK7LGaqT1a1WnroBFek/ikACv6Hm/3pGW7m+W4f?=
 =?iso-8859-1?Q?PjEH2olouU2UI236R8ETZMlEwDo9qvUoBtpQ/j7OI8wDKKiibqTYGeD4yy?=
 =?iso-8859-1?Q?7jrAW5keBVxprifzDnsEVWgpf+5fjYZOM1dkXI3JVyS4kb9Fzo87xkmZgi?=
 =?iso-8859-1?Q?sdMOlR51OjsOsP1gLinyr12Kb0eZkglaBS15hGTD55y/4mcdtpY1uykGYs?=
 =?iso-8859-1?Q?1Owpq5MY2sseeyvL97wRb+z0xXS9ifijYjRyW1cCOjKQaTMSv4aDeMCMTq?=
 =?iso-8859-1?Q?M5LDxBMkJt8QDosHhTr/gyELC1t12/N9nUJ5/niG/Bzodymko328oAFvzi?=
 =?iso-8859-1?Q?VfETPKOw66rqKYzRLvnG1Kk8VkdFmF1Bs/wBCybNCxfz++zFhAI/hOXvl+?=
 =?iso-8859-1?Q?hiGXFU87nF0FzLxBj0SzolzKYvk7PLI7bWL2ycW77tKq3Ra6VSQh60ERA6?=
 =?iso-8859-1?Q?Px+h/jiY9arhwxLSZdAxH+VUod3BKSl+m6RqKvfTpoQySAIqfdh0WN4HTh?=
 =?iso-8859-1?Q?pR0ve+//DwImU4BV51snLQj/qwKo1yiTGE/fWTjdkTeqPCHOlXTwj5V+FU?=
 =?iso-8859-1?Q?7BrfMDZcU2k0qjzCEMhaZ+ruwdNnsV8Ecg7dQtE+tvMHJJeqBeCFDiQVpj?=
 =?iso-8859-1?Q?IUzhaUF/PdSUMMenWW5I235VEpiWddFN3sJRNHsKOLykSrwvYBASlkQCsL?=
 =?iso-8859-1?Q?C6u0OVPS8H3UHgYSyDwrIG4BqJIGCi0732bjqlSHHekSqNDqEg0kGm4Llp?=
 =?iso-8859-1?Q?BgdBTNOUh+R3HCGtI6pg++9bmtT5OC3G3VFPG6GOlp9rvj+in9vpCgXtBG?=
 =?iso-8859-1?Q?O70xBCBnDQc+chEJ6gzT/HYRB/TizMj4dIdGqkFkmiV3rZDtfu9NCzLS0N?=
 =?iso-8859-1?Q?2nlB353uoICML0dH3I2OpjIHtQmGWU5kGbqlx3poelui2XGX9jCUMmHl7L?=
 =?iso-8859-1?Q?8vOb0s/0DXjC7pQ2aWrIw011jqaLW2l4LGN4A8dBgE5rytvc6GzKx7vpFw?=
 =?iso-8859-1?Q?2AaLQP2NXzmCUPyfQjDviamt/gUdYwy5jTtgYUzpDotbzr4NrBqYZQS+h1?=
 =?iso-8859-1?Q?JgMIPHw4uttNpLk9nKi1JIj1tHQockKo9N+l3vfa8TeSCDrZu1PYWU3xX4?=
 =?iso-8859-1?Q?4CAcomN0zR1oSYBHiVSrfAh3Xs6nh9Z2dCi7YcXkS3v+4Gaqa4hI5/Ud0E?=
 =?iso-8859-1?Q?ZiTt+qloP0ixdUXnAWFuAjxcr9c2nhdF0wkRHLpFDFNOaEmwF35DKmtEKr?=
 =?iso-8859-1?Q?K1/5Md+qCFBNO5AJjieIlzr7Fw2H5NBjZVfBP6wJfh12tlcuFXsDk0MP56?=
 =?iso-8859-1?Q?zVyBT5mHohHRQCMTZS/m9fOlL6H0C2CmknGCCs4iyklxvH107hQDgGa1Jy?=
 =?iso-8859-1?Q?DQXyWfNs7qZXdoSZTT50gx3EQVuEiD2GcW8w4sTI2Z+5nBzqVg7N1jG/Ym?=
 =?iso-8859-1?Q?muwXqaICr1VniRJj6+joVH7HcBkMJKeHClDSAJPZrlTVuYBxAoV2II0gTo?=
 =?iso-8859-1?Q?1nVTeBpiGQLUboi5fTUiJpwBzjJmaRC0QaGBl+c0ooVTDf4QHNBYbxXFNF?=
 =?iso-8859-1?Q?JT4JJ0lcZMpoesmxMY528pueGYxscCGYX1TJDdKN9l52hQzVZjRV/pZgCS?=
 =?iso-8859-1?Q?UODQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HNQnYbSZ3BbQeDLCDBDGKdt9pp8AIDP3dRPkP6FJfqQfGQl9r9JGpSIM6tHjAgX1l8Xe5bpjd3D7348u/GwlP35gawGJq+fBaWaPi/Y8dlKX2EyJm01ylCRQU1yFqFZ+JibPEoMtgnm0Py1jLqwjsXpD/rDHauWnkJ2XqIJ4EWHybv52riCVilzqv43yKpzoDIxTH27T5brk4+t7ymEJvJ7ZyBrFeBP7nmjO/ul8uaE5BjJA9w6seRB9fuQUBQfuNmlv2DvnuPqnLH1Bj4O4ravBw/7+5rS/juH91vBQ1NfC2LstpI3uwmDZaUS6iLJ4vUWsP0AyKUxZM53gLNx3W0OikIhpmdb5EzgEjQJBKv8FK4Rqzi4G1pqmtq8DQ2ifp4B6B9UJ9laM17m18Gh6OlzXXZCvvDv4cfKj4ovUmEEYHTy1Ydk0HVtWkwGi88H0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:36:02.3821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb0b75c-272b-4adc-7a96-08de63c86e15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8822
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,paths.mk:url,arm.com:email,arm.com:dkim,arm.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: A4E45E3382
X-Rspamd-Action: no action

Hi Jan,

> On 14 Jan 2026, at 15:03, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Its inclusion placed where it is, it affects the hypervisor build as well=
.
> The hypervisor build, in its _install rule, uses $(DEBUG_DIR), first in
>=20
> [ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)
>=20
> $(D) is an absolute directory (shorthand for $(DESTDIR)). $(DEBUG_DIR) as
> set by Paths.mk is, too. Both point into the build tree. The two simply
> shouldn't be glued together.
>=20
> Note that the earlier
>=20
> [ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)
>=20
> continues to be working fine, as BOOT_DIR continues to be controlled by
> config/StdGNU.mk. Its DEBUG_DIR isn't taking effect anymore, when for the
> hypervisor build it should.
>=20
> And of course behavior now differs between building xen/ in a tree where
> tools/ was built before vs in an otherwise clean tree.
>=20
> Fixes: 82b9cc04a7c7 ("build: add make macro for making file from file.in"=
)
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I did a bit more testing and checking and as far as i can tell this works.
As I am confident the cases i did not cover during my testing will be cover=
ed
by CI:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


