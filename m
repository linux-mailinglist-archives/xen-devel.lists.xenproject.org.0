Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPzXCh1qg2l+mgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:47:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4ECE9604
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:47:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220946.1529352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnf5v-0007CV-VG; Wed, 04 Feb 2026 15:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220946.1529352; Wed, 04 Feb 2026 15:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnf5v-0007Ak-R0; Wed, 04 Feb 2026 15:47:07 +0000
Received: by outflank-mailman (input) for mailman id 1220946;
 Wed, 04 Feb 2026 15:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=THT1=AI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vnf5t-0007Ae-H4
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:47:05 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8b652c4-01e0-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 16:46:51 +0100 (CET)
Received: from DU2P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::26)
 by AS4PR08MB7926.eurprd08.prod.outlook.com (2603:10a6:20b:575::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:46:37 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:231:cafe::71) by DU2P250CA0021.outlook.office365.com
 (2603:10a6:10:231::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 15:46:36 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 15:46:37 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB9924.eurprd08.prod.outlook.com (2603:10a6:10:3d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 15:45:33 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 15:45:33 +0000
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
X-Inumbo-ID: b8b652c4-01e0-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sr3mDDa9abJJqnZR/hAC2ID0kuOg/hvw1jaX62rR7TbSkcDgZq6yyKkPZGUFQ/hRlzdxYo1IA6dVQcpZCWga8d8+R88r8b/ccIVIl6yJLrFGPvCYbjwPcYN8MQbM0lyX4A6/wn1LtqKYnjRzKGTKj6ujzmMHuSbIWhmqHRkY0SRN4hJfSoiXwCefkenYAszgdMb5+pe8rtot5V+joWjT+Nnzi2NjrIV95ihJFlD1VfO48EhLtogN/y9AnNNPOChfX6wsMLAoPGbIfSYdCzviaRHdySpbHQvtyhAeyRDlAE5WMMCJw9xLzvssNHXXS/hcXuYoVgxGQl9bYLZx77xzfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FFbh+npZy9Vu52M0Se5EutoZFbtw1TYlWHYunbpRME=;
 b=ZWDaT9pAlT3kQnzOPWNb7sphxKwg/QSniAd8bnxOQivFEvoEWyZWuox/Lyxvp0fB11fBXPRZpeOMAvnpcrq8TX5lKaBJE2Z5MDJ+CYueUH+0qE8PzMyxtrDLEmLawjPJBeWPJ+JdH7K1Eq7TrbBi/RMs2NfrUYF5nGrAU1xkmpgLmIcyOoig//HZc3/C+MZ0T7Nc7xuISwX4hnt4mOKcIYhRy3rgq+taqnC2lQFjtXIEWpBH7j09mqVrX1Gs3WsL9EXhhGaWkHV0EDsNVnUP+0gbRPNosLVSBVoaTLtv1e/4BFNpuBmgwMkbPA/HGNHbbewgykF/LPgFW9EigRwjvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FFbh+npZy9Vu52M0Se5EutoZFbtw1TYlWHYunbpRME=;
 b=DvxTVfKzjmFRypOVSUDjsod88+D/gzm+LirzYtab0GkbDDw1Flbn/W3//gKSdymzM/TyDlS9iGVKNB0IXR9++SRsDGY6aVsArZPRLNLMuJ4DI6H8uZDXasQ52K2EeQcTsyfc3RLeqIh47T/PZ/mJEtxM9vRgG2R+QkIQhFMkSRY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOmD38a4vmLdH75a+y79hAaVbdrZBn3VBpyx9Dy1/nVS70Fy1NLMZpzGDPnQdPI59WibtjD1TPh+IoM5XHPdJoWh2oL3zt3a8NKKOenAU+QH+KpBUpCNrQzGNYL8rb7AwZCUfw/bpPCFTiYe6pvc5qfx69ljSWqhq1kRqVn9eFhK3VdLerl2q7lRCldrwv3JbRl+CrKN4sde5wqGFXCqA6eXvWDdHP/drXxFc32Yr8kx0JHquDjwdil0zjYQh52TB2InQprO/rC/QQmf/4DPhqJF7Vhhy4dwZp0f001+xB4WkeY5BHZ34400CwXyXuCKZtCJ1PhOpaiwgcvxYeMHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FFbh+npZy9Vu52M0Se5EutoZFbtw1TYlWHYunbpRME=;
 b=elAnTp8pjaq9VWCcwdsoPVytJ9jVocdgnl8sm5DVl9OZxTCmnvpsAS40SrxD6Lo03SBErmzRaJO+1/8P2sP9uX7TMD8JOOMcWHUtva9Q7p80NmeVFldo2PSsaDJAhQCR9FpLBycuJahB14LHmXKULgRUpVv4nXVuOFnQDa+9hcdyX5+nYbfs3An4yd7Ml/IgPHtbxZ+K4ijlWFpB2vAROKenbqGblp9tgVlR2/0DUF/rVqvuDoCpMZ0xKv8Mf38+IKVB8qNNt08K8M983u9jGME1ZVBe7lRMkmscjnQikzVu5wIymXI/VXoQO1RkGEliCxe5e16+FD4qbCQ4FFbUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FFbh+npZy9Vu52M0Se5EutoZFbtw1TYlWHYunbpRME=;
 b=DvxTVfKzjmFRypOVSUDjsod88+D/gzm+LirzYtab0GkbDDw1Flbn/W3//gKSdymzM/TyDlS9iGVKNB0IXR9++SRsDGY6aVsArZPRLNLMuJ4DI6H8uZDXasQ52K2EeQcTsyfc3RLeqIh47T/PZ/mJEtxM9vRgG2R+QkIQhFMkSRY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Topic: [RFC PATCH] xen: Add macOS hypervisor build support
Thread-Index: AQHcldiTYCc32vRyb0mp6O53Aox8PLVyquQAgAAD9QA=
Date: Wed, 4 Feb 2026 15:45:33 +0000
Message-ID: <5062E1F2-D023-4BF9-A829-BB996686B04C@arm.com>
References:
 <d923a50ff7870087347ef783516f3c2d2764dc6e.1770210872.git.bertrand.marquis@arm.com>
 <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
In-Reply-To: <a3637eb3-ff0d-4a69-aa7e-e86be92b062b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB9924:EE_|DB1PEPF000509E8:EE_|AS4PR08MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 323ac4c7-0487-4159-6db5-08de640494f4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?fjoRdUVV5p6Z8F5/TpazNNwAYxdcqANVYLUAvPgqerfq4uC1aXRLXrJPBz?=
 =?iso-8859-1?Q?IzeWF/Eqc1JbQ59jhJ4fKXLm77XfzdAlvN6UCrVFVJknvuMQuViIS6MV4T?=
 =?iso-8859-1?Q?YxA2vA7O9skZtGNbgUzNLWj5rgqLQGPKvUYPpvAPBy7MROurf7T0JqmLLG?=
 =?iso-8859-1?Q?y2LqinT7QgTPnSMHgpJ3IQIpq2SNZ/XC9i7eVio7+2znkcuj5GExY8/Up/?=
 =?iso-8859-1?Q?4lWnZWCvNgt8bMvxU7GlDpIXCnGJC9UGFXGaLvfNblOw99Lk5nasSzGYy1?=
 =?iso-8859-1?Q?ZvigICe0E2KfT8/l8EeyIUviY7iFCxm1DmRaWsScaVHfj0Gwgqj5WnO+/I?=
 =?iso-8859-1?Q?RdLUZ991hR/8AzFAJ8OpaS5FeTG+IeCQxitDeUttWEoQc96x2IMSsv2M0z?=
 =?iso-8859-1?Q?MckWIOVWGix8hNSuYW857ouMzR6QQoaXs2SgqAuLY66pzYEk6nZMa4rcCN?=
 =?iso-8859-1?Q?zXy6CgAkL6HtwRRqeOonV+ladJpEqgrb6Lm71sN1gevisJ58EgXD6e3DFw?=
 =?iso-8859-1?Q?yN8qBGVhQGVoaxToRIBptneYprhMMlh9A2+RsuEFAmv0pEjfpDa2P9K5t/?=
 =?iso-8859-1?Q?YdSubI12tZpxG8gagd9xLJL1TH9j19id+8mZED92otE4YYZY8oTOb34oGL?=
 =?iso-8859-1?Q?NiylfbcRtyxnxs2do/1n56+/ZZLffw82WWRhqVSdbUJNBK7lReaRkWEnOR?=
 =?iso-8859-1?Q?WLrJR0/MDMv6pbHLGeA7b2yfEL/sI+jwRH+Zdy2FiU5WL0Y6i9HMDZDi/Q?=
 =?iso-8859-1?Q?0pgS1zyk0Gtj5OH8HQoi4CXIPgQRTLGS6WSmbGC2jIruc5xuIWNvQAy/hS?=
 =?iso-8859-1?Q?/4V7oGMES4p+RL++BcOzk9CxAeR+o1PBUoXTKMbxW4pXWFlQybhtPeJBad?=
 =?iso-8859-1?Q?ECVc1Mf+m/sWeSThLgfxV2xPyjufpkrMWTezy5v3s3CP7MRBCBqn7s+9Y/?=
 =?iso-8859-1?Q?0XRZnLOiUrMErxNtWre/QYFquEE0Nzm397xOwvZJhlWtS92DtpsX89jrLw?=
 =?iso-8859-1?Q?AGQA4Dm6gZulsy40WdQOPZjgyrHhfOGax2RURGCp4cXyUefTbEuJ11oFWB?=
 =?iso-8859-1?Q?kJbEtSVnfmU2+Vn+14YgiCVIHD56mEt8QNQWJYRl2UqxegE21jKodpkehL?=
 =?iso-8859-1?Q?4EBCoI4AhThyVXBZxEtXzV3x/F0kKRHWLTQUPeLQ3j5/17YF16CXGKRhJ/?=
 =?iso-8859-1?Q?F6U36ONtSBGKPBiYZiHsLbSIp4wbXTnPYF9oPLm9MLb372PcWPUMIZSBha?=
 =?iso-8859-1?Q?ItgT51RHXdbrxobFgDxp7Ehj8Mrfb5h49vp3MaTQmCzzEFNLp4BDLtYk5n?=
 =?iso-8859-1?Q?fNoaseEdwMwR9CrNXzLUZoIAhwFo92O9rTQQRSzfzquCOblw21HxP3ndAI?=
 =?iso-8859-1?Q?dnAEmtTjv49jdpvSKXAWebUwtBr+JUkS3JMBgNfmQJq3aGfTBBiMUoSEuz?=
 =?iso-8859-1?Q?ZC9NR7xoBKnGXu9ucA7tjiJal1OVVGuNMaI4W/VYwQjXXbpq+J4758Q2E5?=
 =?iso-8859-1?Q?WQRexQfYa08m+NWwOTaZO9wXSErDvuoNTksip/rtGrE2LcvY3xe6aMlBum?=
 =?iso-8859-1?Q?sWdRQiQW+MAXU8n20atcII7HUN7Pzd5FVHoOagKStW1lmPU0553PkA7XmM?=
 =?iso-8859-1?Q?IPscNhca76rfeXLBMLOCl+rr+QNVNFcDhmPbuYMaVIaiuiOXwtShvR8e83?=
 =?iso-8859-1?Q?0P1IwJg771jBVnPDP0g=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DED4601DB8581349A283F5232F35F4FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9924
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce98c7d4-c188-4024-12b0-08de64046e9c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|14060799003|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ZKISLFjlgO7L22jKckSC3lu3/lQVTdRQ89Hqx9WJRZ+KS36IlF3gEcdPPR?=
 =?iso-8859-1?Q?Z7dLwWpqn1649EAH1F7DdtcfJhLwgG3Sm0eKH92mYMpP15XH8kWZJKzGcd?=
 =?iso-8859-1?Q?iAH2kGf3fIhDeEa/cljM63ltGlTid50Rm7WsGtIiE3z6FtFstl6Yu5hkhm?=
 =?iso-8859-1?Q?mpxLkcw8a/4ZCoTnsYqZZCIP/SyCewu4co/HtsXVN6gzZXv9mRtrwrESzH?=
 =?iso-8859-1?Q?BZThTNqNOy/qcXowDdvhj2nBoaXsY/NIjFm6lfxdUQHfbzs5tTGQlhx5tT?=
 =?iso-8859-1?Q?GPfH/ZiZTi3vrCBbY09zP9za0V2dU5ACa8TTxW+/EFtDF92kO2YIJR3HL0?=
 =?iso-8859-1?Q?usWM8DNlAR2ysSn2S+1M9fM2GBi8AKrNREfoJgQjaSPz2fOMEIgJprkmEu?=
 =?iso-8859-1?Q?AOcCCbCX/RFpwxpNnnMX6upU+pV3qnA3UFgNA3eh0DaM/ALkvyFPDtZnhY?=
 =?iso-8859-1?Q?pStxH7qSaFJfK3ZXtW88FnVlXsAbHSAwqtfxI9zHYiszOIpzXrcGBExiJD?=
 =?iso-8859-1?Q?AXnkNSDb5Gjhx/fsgPCFogz7h7QZ6tCjeRHIFR73GOiWpupPT0ufSMJ2S7?=
 =?iso-8859-1?Q?fdUq41N9UbtKHMxqw0nPnMuM5W+ne9J7TTRyFIxVQTAQITykd//IKFEfdf?=
 =?iso-8859-1?Q?nPbQd7Vn164WvpYmTglgqLlIrP5U/ocQMF+J38SId47vAQVm2vwYpK2Jxi?=
 =?iso-8859-1?Q?9ULDDd7yW1Q7AJ0p2t/zXg2Exv93Mr8iaKNF5BpQnNllHTjrNxc07UIdqs?=
 =?iso-8859-1?Q?tVNvs1+dH69kVlz5DvuQbPRdPQyrFxgCKnot73rcDh/HF1rV5ljFfg6xVd?=
 =?iso-8859-1?Q?asZE8pwwppZ1pBm9AI+EeC0dT1qQe4IV6yvNkJ/d83BE7lo1QI9E73DzJ5?=
 =?iso-8859-1?Q?YmD15gGlQ70vDvHa60G2+x1OGwplvAfIsBg+2Ia2fhRuq6oCBjRPamS5cV?=
 =?iso-8859-1?Q?r3i55mgMQVJcouY30oRpUiL4mu42ftykx+wcghxJSHk+v/cyCMPJ1HcmzE?=
 =?iso-8859-1?Q?YMl1ZyFtMQjDquwQ6EdWb/0VlOTh5pKm6cQ+STtUyyXkhiOkdfAV8dYn0f?=
 =?iso-8859-1?Q?gsHbvRoVvug0MtM+zJuuSRmj6gDWreBsgMiBqaLZG+5PXRfZz3JCXyNZ8B?=
 =?iso-8859-1?Q?pQ6QYXBMi2qg5UKeVKB3cxfAX72KHhFlq0qitCSTQq0Rg7bc2gsGyDYyz6?=
 =?iso-8859-1?Q?0kv3AQpHVfWSTXaEVd1CsZQQNvPdGeywSloukoYAZUkfcUFr6wKh/MLv+3?=
 =?iso-8859-1?Q?6PMQdopvh+sCkRUgHPtU9ZBWiqcG6qeVlOad3o/401MGIOs9PYGPaY1E5t?=
 =?iso-8859-1?Q?+Fr3KYH7GCofirNxtZiLPXcmJW02/eldp+g2Rr1ukassPTNE/7txRBjg4v?=
 =?iso-8859-1?Q?kGNbAbSYevoRh1ONiAbPf8dcKmVzGpHFchqVdB2Kfyh8ZOB+hhcrgN8rcH?=
 =?iso-8859-1?Q?yPiQjMxYtwJjABPDAb9baMatQ2DA1xf3nTCZrsvlkVtZ2g+yyMBGN8ye/K?=
 =?iso-8859-1?Q?kpiTLD/OoQY73FysQITVvmmmL6jcVZh1/8eqMqURyZ97bJmVZkQw0B2OWv?=
 =?iso-8859-1?Q?rMSHojay8x1Yh2Uqd3zqHG9rSZboPZVPQdjnI2mWV3lK9hQl07GszHWdXp?=
 =?iso-8859-1?Q?+Gre89sbAzWJT49qHsle83IE4o4jVGz4Yp3eBKxQ0TfUSPpuu5UgLFxfsj?=
 =?iso-8859-1?Q?4rQwxq7Ao+GXwFL2Tb2Sqj2AUMrCCQCZQ5/lWgFJnta2kpEbKzQJT1/T4J?=
 =?iso-8859-1?Q?S5fw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7wMlFuusfmV6EovOieHPWqM1QwTdHp0vZIn4sXp4RpKZ2C3oT6xRDpkNfR4kvucsjHFCSBpZqhZGbPPPDpk8FytrpoUWB0t/RNXj6BflR0ERnrMrVkBnR4PnIdSU9qS/Xxqa8BmIcTQf4kkfFpRQRuAg0Rlk+FNqL7wEaVTdNtoBZRtOZr39WSIr/NfXbcNXhSpkFmXZHrZin/0mAHIxFDew/B/01AUAhjbqsurKLAnLfczOyHbjtuBc68h1vH1e7+4+n/sIFREqmKq8IF9d2V5s2eqoNKxwr9vdckoyDeoGZmBepS5dBTEZGNvFZSTke/+ssBA9xc858eSWD05XWnStQqVW7XwMIabRjWQxuJ0GxBYZB8BQLBJ3MGMr1BWSOXwou8qkRa6fzZSSBn1dIITY89Z8yVqjiqiWJwBB6hFCVxUKsDgV+SPcpmRju22a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:46:37.3810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 323ac4c7-0487-4159-6db5-08de640494f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7926
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 6E4ECE9604
X-Rspamd-Action: no action

Hi Jan,

> On 4 Feb 2026, at 16:31, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 04.02.2026 14:16, Bertrand Marquis wrote:
>> Xen does not currently document how to build the hypervisor on macOS, an=
d
>> there is no Darwin configuration for a Homebrew-based toolchain. In
>> addition, the Makefile silent-mode detection can be tripped by -I paths
>> that contain an "s", which hides build commands unexpectedly.
>=20
> This wants submitting as a standalone fix, so it can be backported. But s=
ee
> also below. I don't, however, understand how -I could be useful here - ou=
r
> build system is self-contained, so any include directives used should be
> satisfiable without any -I.

This is added automatically inside our Makefile if you build out of tree:

MAKEFLAGS +=3D --include-dir=3D$(abs_srctree)

which ends up being -Ixxx when tested.

I was not thinking as this being a candidate for backport as the only
consequence is that if you have a s in the full path to the xen tree your
build will be silent even if you pass V=3D1 or Q=3D to make but things will
still build.

But i will split that as a standalone patch.

>=20
>> --- /dev/null
>> +++ b/config/Darwin.mk
>> @@ -0,0 +1,4 @@
>> +include $(XEN_ROOT)/config/StdGNU.mk
>=20
> Darwin isn't really a GNU environment, is it? The definitions in that fil=
e
> may be suitable, but perhaps a brief comment is warranted?

Yes this is only valid because we use brew in that case.
I will add a comment.

>=20
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -116,7 +116,7 @@ endif
>> # If the user is running make -s (silent mode), suppress echoing of
>> # commands
>>=20
>> -ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>> +ifneq ($(findstring s,$(firstword $(MAKEFLAGS))),)
>=20
> While probably this would do, assuming make isn't going to make drastic
> changes to how $(MAKEFLAGS) is set up, how about
>=20
> -ifneq ($(findstring s,$(filter-out -%,$(MAKEFLAGS))),)
>=20
> instead?

Yes this is a solution that should work to, making the assumption that shor=
t
arguments are kept at the beginning like they are now is possibly to strong=
.

I will test and check that and submit submit 2 independent patches.

Cheers
Bertrand

>=20
> Jan


