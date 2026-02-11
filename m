Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGMVIt9jjGkFmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:11:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE38123C30
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227313.1533658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq87p-0003TA-7q; Wed, 11 Feb 2026 11:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227313.1533658; Wed, 11 Feb 2026 11:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq87p-0003QZ-4b; Wed, 11 Feb 2026 11:11:17 +0000
Received: by outflank-mailman (input) for mailman id 1227313;
 Wed, 11 Feb 2026 11:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq87n-0003QT-Iw
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:11:15 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6136e630-073a-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:11:14 +0100 (CET)
Received: from AM8P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::32)
 by VI0PR08MB10426.eurprd08.prod.outlook.com (2603:10a6:800:20d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 11:11:11 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::28) by AM8P251CA0027.outlook.office365.com
 (2603:10a6:20b:21b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.21 via Frontend Transport; Wed,
 11 Feb 2026 11:11:11 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 11:11:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB8039.eurprd08.prod.outlook.com (2603:10a6:20b:549::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 11:10:08 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:10:08 +0000
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
X-Inumbo-ID: 6136e630-073a-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yQUQZxC1wIbZ3ki83efr98N7dMlRi/K45JT4Ok1hhR7LLhuP+fwIeqo1As9b+G4TC3FaNRRbJyJssToUG+GcNqf3zGrQf6MYsCI428qRXiQRuqNhvlY+JlgeWcKE7Fbr4znZioeg2JIr8IJ1eaOucW/a/PkQiBtV7pKOZSujIrGx2GtxmgoTL8sRUQvpCYPm8E2BhQjGGoqFY+N5AYWFoUO5TktGJkppiK+NMTaHVmOeede6Vf853FjI1cwvAdzueMzw99WXZiam+sfgVL7W2wEKeRggqNdRAM1ogT7WpI5bQ/BpjIcJGDlxaBYuXsGRSuPNxJZF6XwElqNlzlyE+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqrd7dHyMuoz1ErKCQtcjAj5O9dkGWF9TMNVvZy/hvM=;
 b=MJeT4STwKQ3sloMT3I2nI1d2asdAjiAi32gd+7MoZvLFvGhSECY60fvwHVDs/a9YTS1tOX6G6IZSgMh+7ct3e6LXdtiDfFDuW2vbKm7MBsRw44iwlwLHAqX5Eyxg6fanDP2zcDExCMvn34+nNGBJAFAO5NKAyLKMzTqIkWO3ps5sEAfJOM9++OnYVyyepeqbibVidbeR8vSgZ50IxhCeUxPNs6bbY1oWnalFiDhh4t8TuHkW2r05gwBGDYOSO4ZBmPJE9go1lznH2U+q/s1UQiM5JVAk+UkkjS7I67862CodnEePdF0AJ8XDIpWp5UzqR0OA/TM/609ik5mo9HbR/Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqrd7dHyMuoz1ErKCQtcjAj5O9dkGWF9TMNVvZy/hvM=;
 b=U96mCDh4Yfk8hK0oAbSoqZlDrb2/adbxXM9leWWU9QJ/DECQNMNsqedT2b5ew/lKYSAlD07nYWGvEwIGCVTkHG9JVJgYLw3Y9TKbqcTSnm77bON/PZDS8JxqKpJES9wCeeVHjKFWjefmhuNN1Z2jYe59ZcLBWbZ1DKr/NllX4wk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6nQwDGPgZJMNi3qBlEFRYCk9HHGUxVtyZQp7CcoICKDN9jWvBoLRKszGtA90ol9z5wqoQ0GxelQXLb9hFCl6z1uxlqVRZsP0xP6IDrFNeTjvuSGSGeo/yc9lTug2+YEMRee0iXDb7QOdtYlfoGOV3xXSeGnB11FoWICaovLrGVj2wftCKPuIN6OTy9zkhXxVa/0F5s/Qd3eNx5WxVSNC+faxRIdRwlkgfpp/wOSSElOzlFQNwbjGg/V+G2tgA3RxW56BtM6qBZO3QTPERzoB2ID2yHM7sQTCYyebYoJBvqnAay2fsKbcR6vUGPlJWLw63rRaZ0BggjdEB2aMX/xOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqrd7dHyMuoz1ErKCQtcjAj5O9dkGWF9TMNVvZy/hvM=;
 b=IpvbUU+/L9iE4WPW4jqL5Q9n0Cma6y2v7MXtUrG6pYMpqh7RK1ba+s9w+psO35tSL9C063pGBKscEI0yaodfzgXL9MQrFqlV87OYXeu5lxzWqb5P2e2q9VZlKoslnL47R4lmtI3H9NyxDOrJAVPylpbBtM21g0mozGJvLy/f4xzzTMvavwhNpp70Co3gwge0v+RHQtcFCEeTKH6RXXNRQhre+CyTBC3tGxqTaimwMA8gGUrdDJIL4bnUDXHuJJioWhobCPesffnhBuBZplk1ZeI1SGV18oK+M0+F6JWchUNbPbGEwFZWCGKke1bdXeZ1KwAev5I4W0OSMjRzVqL45w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqrd7dHyMuoz1ErKCQtcjAj5O9dkGWF9TMNVvZy/hvM=;
 b=U96mCDh4Yfk8hK0oAbSoqZlDrb2/adbxXM9leWWU9QJ/DECQNMNsqedT2b5ew/lKYSAlD07nYWGvEwIGCVTkHG9JVJgYLw3Y9TKbqcTSnm77bON/PZDS8JxqKpJES9wCeeVHjKFWjefmhuNN1Z2jYe59ZcLBWbZ1DKr/NllX4wk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 3/5] xen/tools: fix grep reporting 'illegal byte sequence'
 in check-endbr.sh
Thread-Topic: [PATCH 3/5] xen/tools: fix grep reporting 'illegal byte
 sequence' in check-endbr.sh
Thread-Index: AQHcm0PFx+m8d43xIkWteImzrRY3yLV9V2MA
Date: Wed, 11 Feb 2026 11:10:08 +0000
Message-ID: <AEBC81DA-15DE-471C-A8B3-FC61F60ED656@arm.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-4-roger.pau@citrix.com>
In-Reply-To: <20260211104638.7938-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB8039:EE_|AMS1EPF00000047:EE_|VI0PR08MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9869fc64-6515-45d7-bbc4-08de695e4345
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Qy9RZXo5SG90TFlDN2xDRmpzeHQ1SXlOU21OcGtOUFQrc0s3c3Q4NGF3L2Ew?=
 =?utf-8?B?S0VUTlBrRFR6S0VCb3ZodjY5ZnJKSEx2dU9zRHJqRFV0WjkyMVVrL29pM0dm?=
 =?utf-8?B?UzFHM2YvVU54enJtTkNRdnNzUHhJK3FPNThlTzBZeW5qc2RBSWNjUXRuY1JD?=
 =?utf-8?B?TCtsQkFNMUcvWUwwRXRkWlVtRGhmRVprRUJWZFBIZnFqVGNOS00vV2lkR0FZ?=
 =?utf-8?B?SzZhWFZkWCtjYlFVM1NZYWZtRjRnUDlUUHRLekllK2VqSFRKWXJQd0pHSzBZ?=
 =?utf-8?B?OGF1dGpRNS9DMDNTMzJCWVZxOVhXbUdXUE94MjM4T1I4dXA4aEdSYWtPa0hS?=
 =?utf-8?B?Qm5SZ0RhR0Nzdm9QelVjWXdFQ3hmZFRvNDdsZXp2anZCd3hvQmw1U3JqNHhI?=
 =?utf-8?B?SDJGVkUzd3RZRERuZ1MvWFhJWXY0WlZ4b3R0NFVXNU9UbFJZVENmWm1vQTlo?=
 =?utf-8?B?NjE2Sk42ZGhUclpNOUtnbHRndC9STnNCZ0xOYjZDS3JXeUNFcjZSanlDS1Y3?=
 =?utf-8?B?QzVPaVZITzFSNlhYaGkrU3h4UVRMR3hHRDhEeVZWZ1V2bzlIUTdnNUczbGtq?=
 =?utf-8?B?cGprYmRzMDBSbE1nOHVRSHNCelIxdHFmVTgyN1lKaWFoL01RV1F4VDkydEVm?=
 =?utf-8?B?WkUvazE1VVhPL212YUFwWTEyclpFdWcyQlhHTEVkcktueFhScE5ZZWk0R05M?=
 =?utf-8?B?YUtQdkV3T0VSMUJXV3RWZXRIekwwSElQWHdBTnBqa09pdEwxbncybkZTUmZR?=
 =?utf-8?B?NDlnK2dEeU5rVE94Qkd4ZXgwVlhWTGFOSEpidGJXbzBRTEUvTFRzTDMwblA5?=
 =?utf-8?B?T1FpalpXSmhJTmJ3ZUE0YzlIMTViR2xyZkMvTDBRVmttbnBCNGZyOEtyanpl?=
 =?utf-8?B?VVppTHNhNjk0N1VvbThXa1lRSUZ2TDAzVFNOTFR1Q2JablBmeUwrVFF0TWtH?=
 =?utf-8?B?cGdDd1dDeC9Ob3ViR1hBVG5XTlZxYUtwTlBwb0F4TVJiM2tRS3l5a1hzdFUx?=
 =?utf-8?B?WkdmWXRwV3ZOdVhwTW5ZVC9FbmpkQ3FuMm81VytzUXA0Szg5bXloSWdwbndh?=
 =?utf-8?B?OGtGMmdhUG12STJ3TEtObGFoNDYvdkdyR2NYTlVxK3RTMGVmQTV0bmdaVUhX?=
 =?utf-8?B?MDVLdkg0aWVKalZtSHEzNjV2K0hKdUd3ZUd0VWxiSmN2UnE0UE8yYXNtS0Vj?=
 =?utf-8?B?VTBXbG1QR20zTXNhaWlFak82b2xCbVJraXFBSmdiZFpTZFREUzQ3b0NWMnZG?=
 =?utf-8?B?NDh2Y0FFMFp4NVJac05HUWZ6YldIOVpiQjJUZUNpbTZ5dHNQMTRtWGRVTXRO?=
 =?utf-8?B?MWhCNEpLdHVlRlhHaWN3aVZQL1VsbUlPYWkvLzNmOGFheTdLSzNrbEozWFk0?=
 =?utf-8?B?QjlMaUpxc3lyMitrakpUdWY4dTZSbUF5cHd1YkpuVnBBMlF4QlpRUXJnQnVB?=
 =?utf-8?B?WThPVUIxcDQzNDBUMHZTL0U0aEc1QjZ4MFcwMnQzN3gvc1NzMCtsa0xvN2Rt?=
 =?utf-8?B?NElDTVhDbmE0eGhSWW56a3lCNUhOdHgyRmJCcVp5aEZMMVNiMWlpcEExTFk2?=
 =?utf-8?B?V1dWNm43UjI3U2NJT0IrdVJrb1l2ZkxLdkdYOU1wSmRVd1NYaTN3OXd2NFU0?=
 =?utf-8?B?UXVBQkgvTmNmWmhZVDhpanMwMVdEVDBkL1JheGltL0JzWitBUVE5OHIrVTdx?=
 =?utf-8?B?RGVDbXRwdjJiSGpka2RCSy9RK3pBcldPMU8yL2ZwS1VYWXlsdVNubW1GbHZT?=
 =?utf-8?B?YmduSG9WdzlCdmVBVHFQMmVwVlhSUTQrVmhUWlQ2WTFuUU4xYWxHaEhjaG1j?=
 =?utf-8?B?dHN2am5BVnpDWDRJR1EvV2oxNXRJZ0lHUEtqd1Z1NXBtM2s3OHdPcTEvOVlY?=
 =?utf-8?B?ZEtObDNOWEYwdjk5SjlpaWFXMSsveU16b2R5UGVNWnNYaHdzTnB1MzFSTGZR?=
 =?utf-8?B?bFFRQks3Mnc0TlIvR3ZMdlVVTVRhajdzWlI2K2ZyMnNML3ROblpnb1d1MDVO?=
 =?utf-8?B?dDROSS9NQ2lVelY0MUoxaG5taFcrT2hCZlRoY28yaE5URmJyb1huZjB2OVhY?=
 =?utf-8?B?TmNpTElST1VST1BHaEVlWVg0c1d6bytQVkR1ejNjRFFhdTdJL0JtZ3BHVE5M?=
 =?utf-8?B?bGpxYkRSN2pSVkFBbm8zZFVMbWthRkZaay9xOFJacHVlOUFlbnlxaUZpSlU1?=
 =?utf-8?Q?yD1gZKKaJYqlGcvAQl0Hwmg=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <230CCE929672454D8CD264D19FA94E5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8039
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cba88ff5-e675-4835-5010-08de695e1e0f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|14060799003|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SityOXVXMkpKdkFYKzlEaHh0dElTM2thaXJkRndIODhkY1R1MnYvakdRNmJq?=
 =?utf-8?B?cGFFeiswVFNUQjNnREY0MjFIZ25qdUloNzFSVVRNR2xvS2gzaDFhTEl5Ymox?=
 =?utf-8?B?bDd5dUE2UmJqbUZYdUYxREsva1IyeUo0QTNYelAzcTBRUHEzQldHU2k4elE2?=
 =?utf-8?B?RVVJZGFlbkxxbHluaVlhakVMc0NyZnByM1BEWElMYm1IVlp1aGoxckNJWktF?=
 =?utf-8?B?Q3BkMmptMDJVNmx3ZkNOU2YvTU1QZFJSdkZlSXF1Q2U1WmJOSEZjMWJwWDNv?=
 =?utf-8?B?ejJUam4raVFTZ2dKcFZGTWttSnZBcHdBOGc2OFdGREh1L3NaMmx3bWFMa0E5?=
 =?utf-8?B?MUpqOFN3aDBLdEFoOTFnOFNOaGVSampNdWJCUmxvcnVocmZock0yUXpaYk90?=
 =?utf-8?B?c2JRYkNXN2VXWGpPSmk2ZXNnSHlZVnd3MFlrV0tiRUZzazJTd0pLek83U1Bt?=
 =?utf-8?B?QnBVMFlVZGZja0J3c1pTYmd0Q2VTQlNpcHBwSDJ3ZmtYR3lRaDdIWGJyeCtp?=
 =?utf-8?B?dWRLRk44YlIyanZuTmRNMHp2OGhMSFF1MWIwd0V6ajVjRWcvMEJ1NG1PWkxG?=
 =?utf-8?B?dnJ1VkhsUGdJSnViRW9Gd2tseFQ5NWNXZElBNmJ0aGw0aGgray9URDVMcFFC?=
 =?utf-8?B?S3N2cDk0dW55c0R2ZzdxazUvTGwrczlkcDdlNVppZ1QvRHdKY0FiYklxN2NY?=
 =?utf-8?B?MFAwYlhBa2dLQjBXNUk5RktYZTZUQk0zQ2V3dkFGOGR4RDVTYkg4V0hlblps?=
 =?utf-8?B?WDBhM3BPdU5QLzZRMm5iSHRSbHZyMGg4L0dxUm85TnJQRFcwRFZ2RlBGNTFQ?=
 =?utf-8?B?U0pvYXhyd1JPWHZMYjhVVGpmZHp4SVRSN203RjVGbUpaOGc1anZqbmFCc1Mr?=
 =?utf-8?B?aXdMNDN4Y0NTK2dBV25ZczMxRGtSR3RJNkVUNXZib1kzd05Zd2E2aVQzK201?=
 =?utf-8?B?NzFmUG1PMk1aRXRLcWJQZlMzTEpWRDRlMmVRSjYvMUZuM3lYVG9yLzc1OGww?=
 =?utf-8?B?b0NGZTZpNHMvcXI4VkxYM1R1MFBpZ1BLR2pJZXhiM3hyY3pmS1grcHl4TGxq?=
 =?utf-8?B?REVFcmFMWXVWWnN0RjcvKzRpVHJGRzZ0VVZQZk12ZFJGWjZ1emZlajBxckNt?=
 =?utf-8?B?TWludnhZM3h3TStrRG1YOUQrOHQrMkZMSVZicVdNR01YMy8xeTcwMXVEOXJF?=
 =?utf-8?B?OHEyZ2wxenYxaWFIc3JiMUxvMm1PVHN5MUovYVQyeU5VRFZWTU15cmtHQlJO?=
 =?utf-8?B?SkZXMy80dVg1WmxuQlRYNFNWeGMyNGtyb3BFeURyc0VyNS9wUGo1Nm5xcXBa?=
 =?utf-8?B?NlhIeW4rR1kyNjNrSmVKOU1yVGRxU3gwOG93emdnUHFZNmhpV2RiK1lFRXJa?=
 =?utf-8?B?Skhac1FEeG5BOHhuWnFDcGxHVkxnc0d2OGNKbG1WTjNNZHNJUGdmdzB2ZEhB?=
 =?utf-8?B?OVpzK2xVb2ZLYnBORjNUMVBPd25OeDUwVGlrbzJEeEpCNGYxNHl2N0J2V3NW?=
 =?utf-8?B?YWRGOHhoTlBkMDZHaWRnSkluTDNDeWVSVlhlVWZOa29GVDN3OWNuQ2pBMVk1?=
 =?utf-8?B?Vm5uaG83YXhNSWdKNGtOellHd1VpU3BBeXBxbEo0cmFkMCtZcGpFZ2JZdFBa?=
 =?utf-8?B?SVZUMmlCODVIbmw5YmhWVy9JOWtCOGdsWUVrMWQ1M3JMK2lFSldrSVFCZVBt?=
 =?utf-8?B?c3VRcTRURGtXZEh1Ky9rV3FjTnplL2pteTY2UjBwc3kzaC9icjFDc0p3dGkx?=
 =?utf-8?B?cFVrbm9ROVN0SDFUaFVxdkhHNm1NZEkrZEFOK1R2bEFBdlBKL2FjNitRQkJH?=
 =?utf-8?B?emJkNTBJQnJ6Qy85UE1FRU5sSVRJTThzZ1lCdHpydW1rWlVEMlh1OThRVzVG?=
 =?utf-8?B?MUplSElCZEFJeUt3M0NCdFFIOUV6VTlZT1UyMjJmVDZtMlBIYlZIR3I5d1p6?=
 =?utf-8?B?MS9aQ2JXNExSaTVrcnNwL25IOS8xUHgvNkc1dGNBcVQxOHVFOHFUdVJQUnVO?=
 =?utf-8?B?bVIrOUE4SVJqWVUxZVVtTDc3dFhmMzNUazBhbjB5Wm9vZnhXYkZHcHlQakJy?=
 =?utf-8?B?UlE0R1N2RWtYZ0FDS05KZzN0a3MvT3FKb1NrVWdPVnBST1N0ajdiTjJQQXJw?=
 =?utf-8?B?cnFQL1FQT3NiamlFcVd5YURnN2lDSmZIV2dXTTQ4ZFJIM3R0Q0xXZmFNbWhy?=
 =?utf-8?B?OWhSdjdpV20xSmpGMUVsdm8rbDIwR2Qxa2thSHhuRGF4Y2tSQktCeXVYQmNV?=
 =?utf-8?B?MklLalNFbHpwTWFZczh5dDJabDlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nBN+BUrL47a6mhxkqHlxfxo7m8CIhv0V9SykN18CgOlbPweP2nOG9nA6gOcnuBehXrBeSC1FglXw4KK5gSoHvhtwpKM2S5pMEJNM0LDX6xSNosckEv6TUa7QmcWxdc0tQm6cpdjxOYZgNZex1fhl59MJyso59IKulNIpMpdR4WGQG50weiKVvaNY2D7XsTg3mQFOOO3E7ke3GmeThh4KcKvZNHaVIfZ3wzDwpfLCMx9EtKrFK2dC/n489tzVJ17AECSsYD5bDQDaqqAiwU2TgKxna4DeRKR22zkJheQ3yMfc9OM/+18y4gTbJUzA3gmetsQrmaPP8WErTNwuN9S4ukUrA4+AKQUeEV5GQZg5dXxM8YW44HJOSsIZlPPXi+vwLnxFnOp22Vzwyfqt1hMXaCNNW3o5MEOjVVB8OhRcIdMw1YHtcQPRcrm2O4DCA/wm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:11:10.8870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9869fc64-6515-45d7-bbc4-08de695e4345
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10426
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim,arm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CCE38123C30
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gMTEgRmViIDIwMjYsIGF0IDExOjQ2LCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIG1hY09TIHRoZSBkZWZhdWx0
IGVuY29kaW5nIGlzIFVURi04LiAgVGhlIGJpbmFyeSBlbmNvZGluZyB1c2VkIGJ5IHRoZQ0KPiBn
cmVwIG1hdGNoaW5nIHBhdHRlcm4gaXMgbm90IHZhbGlkIHdoZW4gcHJvY2Vzc2VkIGFzIFVURi04
LiAgU3dpdGNoIHRoZQ0KPiBsb2NhbCB0byBDIGp1c3QgZm9yIHRoZSBncmVwIGludm9jYXRpb24g
dG8gdXNlIHRoZSBiaW5hcnkgbWF0Y2ggcGF0dGVybg0KPiBjb3JyZWN0bHkuDQo+IA0KPiBTdWdn
ZXN0ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoN
CldvcmtzIGFuZCBtYWtlcyBzZW5zZS4NCg0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMg
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IC0tLQ0K
PiB4ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2ggfCA1ICsrKy0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL3Rv
b2xzL2NoZWNrLWVuZGJyLnNoIGIveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNoDQo+IGluZGV4IDM4
M2Q3ZTcxMGE1My4uMGJlOTk4NmRkMzU2IDEwMDc1NQ0KPiAtLS0gYS94ZW4vdG9vbHMvY2hlY2st
ZW5kYnIuc2gNCj4gKysrIGIveGVuL3Rvb2xzL2NoZWNrLWVuZGJyLnNoDQo+IEBAIC0xMDksOCAr
MTA5LDkgQEAgaWYgJHBlcmxfcmUNCj4gdGhlbg0KPiAgICAgTENfQUxMPUMgZ3JlcCAtYW9iUCAn
XHhmM1x4MGZceDFlKFx4ZmF8XHhmYil8XHg2Nlx4MGZceDFmXHgwMScgJFRFWFRfQklODQo+IGVs
c2UNCj4gLSAgICBncmVwIC1hb2IgLWUgIiQocHJpbnRmICdcMzYzXDE3XDM2XDM3MicpIiAtZSAi
JChwcmludGYgJ1wzNjNcMTdcMzZcMzczJykiIFwNCj4gLSAgICAgICAgIC1lICIkKHByaW50ZiAn
XDE0NlwxN1wzN1wxJykiICRURVhUX0JJTg0KPiArICAgIExDX0FMTD1DIGdyZXAgLWFvYiAtZSAi
JChwcmludGYgJ1wzNjNcMTdcMzZcMzcyJykiIFwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
LWUgIiQocHJpbnRmICdcMzYzXDE3XDM2XDM3MycpIiBcDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIC1lICIkKHByaW50ZiAnXDE0NlwxN1wzN1wxJykiICRURVhUX0JJTg0KPiBmaSB8ICRBV0sg
LUYnOicgJ3twcmludGYgIiVzJTA3eFxuIiwgIickdm1hX2hpJyIsIGludCgnJCgoMHgkdm1hX2xv
KSknKSArICQxfScgPiAkQUxMDQo+IA0KPiAjIFdhaXQgZm9yICRWQUxJRCB0byBiZWNvbWUgY29t
cGxldGUNCj4gLS0gDQo+IDIuNTEuMA0KPiANCg0K

