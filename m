Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMDZFRPey2lHMAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:45:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A6736B253
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 16:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269024.1558188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7aLR-0002yc-9E; Tue, 31 Mar 2026 14:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269024.1558188; Tue, 31 Mar 2026 14:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7aLR-0002x4-5d; Tue, 31 Mar 2026 14:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1269024;
 Tue, 31 Mar 2026 14:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frank.li@nxp.com>) id 1w7aK7-0002TF-DY
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 14:44:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7aK5-00FjaW-0n
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 16:44:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frank.li@nxp.com>)
 id 69cbdda7-bab6-0a2a0a5309dd-0a2a4504b2cc-34
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:44:06 +0200
Received: from [40.107.162.50]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <frank.li@nxp.com>)
 id 69cbddb6-c823-0a2a45040019-286ba23251b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 16:44:06 +0200
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10964.eurprd04.prod.outlook.com (2603:10a6:102:490::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 14:44:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 14:44:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=nxp.com header.i="@nxp.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdYsGRhqRDD4FOd4IEbXR8BfmHiufSGLIQP420ghXe32R4WwVUQTVClzJ/1+7BvKQlkKk1M5TmhQWdd7XTb0XdLWeCTKGkOtKoP9dZ9wIMtC0so8EOW554J0mjzqjYGTkgqluanYZJH5fg4L64I5iN2RihtTiN/Hxll0oFs2JsbsRo+UVOWMz9WT4Jf5rbXOR/dms1uzqugkILAO1eddPho6oho3IHrIm2+VJEz7mvKW9Y0eNq2gPmvraH6pGTHYwvEcGXF5WyBOZOtEPEhrrvEweLesv3BSCkQ0ewgxGq5ddFzXrTzQhOj+aDf5ye+LgXClFDDr1PtNJ6iQ0ja3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rjP5iBsy8kPlzbvdsL0bTiLtesZG/Q20ju5pr8bjOM=;
 b=JKB1te1GuyhYGbAB2/mjOavy3vmsXHwiuME8EBLDFxIUnR8S3v9hjNEC07E2YiOeuEgYgVX+kU0ZAH4Uj+MFdzLJfpInYkeqJFzpQMM/RBk0sJ4X9bM2GAgAd6rQil7tuep5aY6cOe2CJx0Ehh8gEW8VGiymsZq2j+J9eJHqdxSAtm4t2ApAzeda74PQle4LEfArJn6cl1Dt5DnuKv1NEqoGzYYtuQTXQjisPGsDSR7wg0c0DbVsBYrcUNyHA/jgkCxahwHIpYsdbdrYqwXldl0Wx8fB+dwv7c9KNGrE4HOfq5S0/3HWQIqru2QZrmn8fOutjN6Nqh3eRyVKH33Arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rjP5iBsy8kPlzbvdsL0bTiLtesZG/Q20ju5pr8bjOM=;
 b=XLm123qMbXdIcdERP9LJSClEFYgOIdUeYok6fwMk2NASndipY4t8+DWkE8m5wiUSnmExz8SKaRvcbInQr0KveVlZn+9M+psW0vtl/HJBXS8+5sCQVn72jr7UnjAOtOwqFv4okEC3clOsPGfxYwL+N3RSLDnk6xe/YBwJn6ABPVRwAVrG+IYK8IzQDVoGOBJyqWOZkLHOu/IOc3SV2YVEiGfbV4zmMeziG5/n+RWdnN298WrCq1QqVkvFjpQC4h2Fl5TItT0mkZX8VYWv5IlWgax3dRzusJe6xg+G4Ofx37lzAmo7Goac5oEMDf53m/R6QTAl9KhkWiG24s3MKxW5Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Date: Tue, 31 Mar 2026 10:43:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/3] of: Factor arguments passed to of_map_id() into
 a struct
Message-ID: <acvdqQvcitLTCZbm@lizhi-Precision-Tower-5810>
References: <20260331-parse_iommu_cells-v12-0-decfd305eea9@oss.qualcomm.com>
 <20260331-parse_iommu_cells-v12-2-decfd305eea9@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-parse_iommu_cells-v12-2-decfd305eea9@oss.qualcomm.com>
X-ClientProxiedBy: SA9PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:806:21::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10964:EE_
X-MS-Office365-Filtering-Correlation-Id: 238e6cc5-6b23-42b7-8b74-08de8f33f3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|19092799006|7416014|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	s+KiA0MI42oQZjz97rmpPSQpWToS2IRv5hA0wHFEfQ66xgsjPtoOj9ZMmslrUM076pQAWJvYsHrvyebukhsQ4XAJM0x8O6BXX2ThzbrWO7mZoEH19gL6CoGyh0GlJFkpg6aua4BGZ6iexITGS74I7lVFSD8iryLffh+f3zIymaPL0VpY10HItZbSpNwUhBJMZrNw6jOUjQbf6rdChQYUsOtbHt7zZ6gq1tr4GqKrcP7brmUv9qY/aqXkJyZEZmRFrwBE+9qci02UHmSc2Dxb5vjbIUTDfmRYLD5DQv6J+4pQ+B7ybsJmamaaOyQySdUABFrxi39veWV7dRYlA1g3EKGxQUEy2VuGhori2AXujb41clpsUDX0ZC/LEvZv1KSeeVdE2WtYg3/775tjh6psWWIDeuWNAKXhJAlTaLgLmT772D7qNn5E9l3r8gBnwYfpd7j/Pg4Gw8+gNIw6dl+zhC7GsXYX2o0JYRYe1lHikufyEb0wf2kzwqGfaMIGu85m3JmIujt5iqX/41X5axuxKJ+Lr9HcXRXL7uS62awNx5kOmAfp+cA9mwgWxGeBgnkiRyI1dCGQQ6Y1iyDdJGWvWs1Fd2TnaCCd3jEcGgo31etGPcBr0rrZWjvLlK1S4s088ncYmX7jveSGvWeC22lnFigMWvlBl7Pv9LNo59jxDXG6JVKFYS0sMMrnGMwySLXlLo7oqTJe4CHXYAg4pNh0Vg2OxRx/xwZxX8msLiFnQPzh5UdBxoxRWGn2sRjE0QpirfG6FVA3eLQScmd8ttAH/wvXFKDHg9J203L5SbCpd10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(19092799006)(7416014)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2iT9OHtHa+9bxUiNicBG0P/R6shQ/HaKVFFsEx/BcChqdn2hP08875nETbBY?=
 =?us-ascii?Q?8YQXh8M+Lq/Dc9PmWbMKeS6gk3m76p9SutE/+pCFHdLq8eAXlwYkIhm25Yvb?=
 =?us-ascii?Q?3k01D2Y0O+idAWzrbaTOGf4djc9rR7Hco89NznpwSSrxN7zxnQ3o0qfEy2/O?=
 =?us-ascii?Q?ZfdmNyoV433YFVUn2gaobRCr/K2e7+etGyjEWyfbxude9W+zhDFy9vjADNW7?=
 =?us-ascii?Q?n+6bncInM9l+tq4QUE0qQ+MYwsluE6r1pV2WAnn7EFHC1nbEo4yL+CjlgdJF?=
 =?us-ascii?Q?LkMhcYkH6Gqnw+87spICB1Agvr8DMwBMTNcqAFcvYHErR/QFlC9dBKacUlOj?=
 =?us-ascii?Q?fexhAH5qjYnXRRGsu2qtsIlwPKxBXmdur6LGhqi2m3qA+F/h2up6ux+9GNGK?=
 =?us-ascii?Q?5MIcbSh2W+6BO/TGpIcyrrhA/RrCQ6RKLLod50qo+FJfnDT8S0lupzDCszhC?=
 =?us-ascii?Q?ca0g3wxK9v+5TzwRzyobZMtze/QsZLZeeSrSN/s1u+Xr1IZWQcLSkswEGxqD?=
 =?us-ascii?Q?dXUzom5siSa/hCgVDYPMbi1D7CySRMFO1bDfb7g5f4MyPMURfDkPJVTfrIbc?=
 =?us-ascii?Q?DySVh8F8KTTkTzzFco0S121SLcD7hEDYIinqZVA6YatZQvu21HKik85kgKCK?=
 =?us-ascii?Q?Qih0BGi1es8UjMnf6qVmkBjqPcGGbUt+Ab9QJ2PbuW98Bmsk1IR1qrCnU4pO?=
 =?us-ascii?Q?A+WVAVTHUrjm+YMbp6Vj+0sugzC2+FV+IEWfGoUdlLNR8gmGh3rPAVN0vgKU?=
 =?us-ascii?Q?x8J4l5K8tEHSDXVaAq5EFMIbuwvmdZhCkr3857r6id0jyqMYnJ+WlGOiz052?=
 =?us-ascii?Q?6G/P4THBPjglA5biZc40FOkgZskw3TA1TG0FhRBRcWI5lcI3LKGzR0/w9yQ6?=
 =?us-ascii?Q?PI4a/D3TL3uGVZAfSwSC7cl8hWmRdUsVg6qy6onXnCT2Gs660pFDeCIUta4R?=
 =?us-ascii?Q?UUtIrkSGnDajFE92f8sgjKndjCIs+YSeWzXsdGrEP/Mini730vGxoLmNhuxU?=
 =?us-ascii?Q?l7IpdFMhTWH9AJw4Aqu6esRNdRKjJda5K9QsTezbVze0MzD469dPxZmwou9W?=
 =?us-ascii?Q?DJDjt0WfDEZJZyeaOpgR2VY6S0uk3kEsgk60LLcNm+sjPDuFwuC7CYMhOWaS?=
 =?us-ascii?Q?RwZSO0N0YhqxRtEKbriw6UbxrJ59IIwg+d9BdhSGB3U5Omy3xTW9jANTeXvu?=
 =?us-ascii?Q?Lpqf0UCJFae2MKBtBPHMk92yum9q/LFrIviKQzxoWszSznZ/+ZU2eYhgaNRp?=
 =?us-ascii?Q?Nb+yFP5GsfRLNBiWCEeVeJoD+i+8qzI0z7fvN5xRV2Q7HiJGZsicyieNDR0W?=
 =?us-ascii?Q?PJAR4hs2scosJne9NJZOlsh6KhBlcPjOyU7FUUJiaiWMeEDGG9XZb0navxRL?=
 =?us-ascii?Q?qSkZ51JRPmtejfhBr9fknmjREAR0JyL7fqGK0idQkmeDkZ/P4ZDwR0RK6/P5?=
 =?us-ascii?Q?qnyQUUjmF3G9gtHRp+3CmSnF0wfOLaGOUcu61W/yAVm0FMG1xURayDls+1/i?=
 =?us-ascii?Q?XZ+8ApOEGspIXbvX2mIoP+EWiBw3XiGdx2aUm277x72oSIgOkl5PdzagQwww?=
 =?us-ascii?Q?NJF84rfOgLEIHW91NEasYiqsE8aP43OGoD1i5gyBL5IRCi7RqdEWhhMmnQKh?=
 =?us-ascii?Q?ezClV6M0/ZDd1lMN68+OUJjAdCQ0riWdwr9wIaCBg8jhw6axWXAMfTL9QNbQ?=
 =?us-ascii?Q?AnKeRtx67LOv7ATbuRAP9nH19A5GPWGmH4Ypw0eShktvT4y5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 238e6cc5-6b23-42b7-8b74-08de8f33f3ae
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 14:44:02.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bivlZCOpDITUUh4tp669044ekslH3QourhUFHd2mfBsju1B1zO8ghXCYuVQ+4SwORLuIHvnCqGNFkexd92bU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10964
X-purgate-ID: tlsNG-ebf023/1774968246-BA0839D1-90E44445/0/0
X-purgate-type: clean
X-purgate-size: 1834
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,nxp.com:dkim,nxp.com:email,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:charan.kalla@oss.qu
 alcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,nxp.com,pengutronix.de,google.com,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D2A6736B253
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 07:34:47PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
>
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
>
> Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
> to separate the filter input from the output. Previously, the target
> parameter served dual purpose: as an input filter (if non-NULL, only
> match entries targeting that node) and as an output (receiving the
> matched node with a reference held). Now filter_np is the explicit
> input filter and arg->np is the pure output.
>
> Previously, of_map_id() would call of_node_put() on the matched node
> when a filter was provided, making reference ownership inconsistent.
> Remove this internal of_node_put() call so that of_map_id() now always
> transfers ownership of the matched node reference to the caller via
> arg->np. Callers are now consistently responsible for releasing this
> reference with of_node_put(arg->np) when done.
>
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/cdx/cdx_msi.c                    |  7 ++--
>  drivers/iommu/of_iommu.c                 |  4 +-
>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
>  drivers/of/base.c                        | 68 +++++++++++++++++---------------
>  drivers/of/irq.c                         | 10 ++++-
>  drivers/pci/controller/dwc/pci-imx6.c    | 32 +++++++--------
>
> for imx part.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

