Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82953A931FD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 08:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958726.1351402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5fEK-0002jx-5E; Fri, 18 Apr 2025 06:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958726.1351402; Fri, 18 Apr 2025 06:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5fEK-0002gw-25; Fri, 18 Apr 2025 06:29:40 +0000
Received: by outflank-mailman (input) for mailman id 958726;
 Fri, 18 Apr 2025 06:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiI7=XE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1u5fEI-0002gq-7g
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 06:29:38 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c7d93c8-1c1e-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 08:29:32 +0200 (CEST)
Received: from DU2PR04CA0076.eurprd04.prod.outlook.com (2603:10a6:10:232::21)
 by PAWPR08MB11158.eurprd08.prod.outlook.com (2603:10a6:102:470::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Fri, 18 Apr
 2025 06:29:21 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::b8) by DU2PR04CA0076.outlook.office365.com
 (2603:10a6:10:232::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 06:29:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 18 Apr 2025 06:29:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB5PR08MB9998.eurprd08.prod.outlook.com (2603:10a6:10:489::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 06:28:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 06:28:47 +0000
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
X-Inumbo-ID: 7c7d93c8-1c1e-11f0-9ffb-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uS36tgwddZ+Gyof3qT58gl4eHEXLB2ABLGsUGo3jqCcGX0hn5epg9CZWUU9/bEtRIvDPAWfhlM+MJABMD//lzQP4URenC4Rp1peKamWRjIAiDos4/8hjADFvHzyO41jCsoTVqUz6+hknjCOJGqoH1YCwCfDWesAIzdpQEipTHU3p/AA35rKjyvknj+4hE4xn7Pis4TXVidvFwPMjVnAyCH4mdYv/+Q2MItyaL3jY+PjwEoyKdd25w9bRIfjlaIvM1/z8pSG6uBSkjyQ82mY9sL1c9wkQAFyr1ugpfSpapbOCMGHZlRx2UL4pJflJJOnqLojGQcnG1WJqJ+7K9S8Kag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68SCY0sBged/spZfHPqBp3vV09Aagu7hHMxl46ryxRQ=;
 b=oF5zLhOQMc7BF8UA5duAPhtp8xoCJ9/cGbxAM9p2w9+ALsBrQboJ9IUN9AiTzJ0rvDWDmCKYKFhCrbVJCFSABIBixhgb4K0wkzUIXX8JvZpNwITiY08CmD2zvrOGK+mOG+zzHKixeRTIAZOhTYXl2lEN8Rg7sOCneLUye5GjAj1fiOZy/Jbko7kDiIj8wzkE2Swhmnrx12ijhTt+3XmE6M1uenidxTrwDP4jGXnrMN6ALBQ2WdWj70j9V2vb9cErkMiIwz5gGPQBClGxuxEKdlnxkyPUhokYSsX0WuBkpULnRcIw4VcLm6Vw79HHKvZzCMKo2DBHmObGxquNO7H8IA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68SCY0sBged/spZfHPqBp3vV09Aagu7hHMxl46ryxRQ=;
 b=W9sc5ln0RaOuBdNr3euxT90trZMpMz9BJcS2+vHFay0WDsOWyIHguuVyEUMwKVgOfQIhLy0SGwZ5jCdj7Z0y/VGyPhmEZNvxW9NWFhqfSiQ33Hl7UdciSZrXivkn05RuxAAN6WXa5vnI2UpaWWPkjHFQnvZ2iEjwtj3OZSmNjLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdRO13vRCkJXMFJNjMg7WX46BQ/PsRuQt5D0lePAftoWCtJN12a9i/HfpR55/NSK+haDvVYK68Bwrg1TxgROQZghOIpxOMaw3aS9Rl8aWPXZesN0iJ9zfEmmkgSQ1FwNzqwafA2Ppo/oMBNldT+so4lis0Vp6XCWjFrtEhhIXHAL2RBT6v1HrmNxyJvQyL/mHjsiuRhV1C9zwXWyxM3/yVZWfP/+rzQAYClkud4XEsqSFog70HIvJF0whinno3hk88H1jgxWuZHud3hoi5k+9oLDphrr18iEYAj/SU260WDx25N2h5jt5GYcrrFs2ltnQFe95oE7UN77VJcEpg1JPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68SCY0sBged/spZfHPqBp3vV09Aagu7hHMxl46ryxRQ=;
 b=ZXvV+1/DuPv3BwZF+Ir+JXCQjiRB/8pWWKDG/s3inkBWp7boTJALFvZlgOhzRuOE33+J1I3cqsHvVB4ydWSVEzR0R1LcJ+s1LwjfMznfkhes5c1U1DFyUcfOGft7V9JqXnJ6MXfTIOsCOEUPHGmWmSYsA30LjDF4a1vB5ks8MdNFb+InmII9B0RwpX/qPNOwiiex6kbF2KrbqSbmHcMV8sGkTu5rBNPhflZa47EvngIjTHP+72oTbEMkmRNJsxb7DtPdmpMIcKPyjiuYAPPSm0ddrjl0CeEHpdA7YfdSQrI+qKVzKn5XJhRMg01qcswES89c5kJ3eNOD1kyVNox89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68SCY0sBged/spZfHPqBp3vV09Aagu7hHMxl46ryxRQ=;
 b=W9sc5ln0RaOuBdNr3euxT90trZMpMz9BJcS2+vHFay0WDsOWyIHguuVyEUMwKVgOfQIhLy0SGwZ5jCdj7Z0y/VGyPhmEZNvxW9NWFhqfSiQ33Hl7UdciSZrXivkn05RuxAAN6WXa5vnI2UpaWWPkjHFQnvZ2iEjwtj3OZSmNjLA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Lin Liu <lin.liu@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v6 02/15] drivers/smmu-v3: Fix impending MISRA R20.6
 violation
Thread-Topic: [PATCH v6 02/15] drivers/smmu-v3: Fix impending MISRA R20.6
 violation
Thread-Index: AQHbrsb4h7zxEPTLGky/jys+D4v1IrOo+KwA
Date: Fri, 18 Apr 2025 06:28:46 +0000
Message-ID: <68C8B349-3A28-469F-84C6-D0E5416E5525@arm.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
 <20250416115900.2491661-3-andrew.cooper3@citrix.com>
In-Reply-To: <20250416115900.2491661-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB5PR08MB9998:EE_|DB1PEPF0003922F:EE_|PAWPR08MB11158:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ca9d75-cc93-4082-4939-08dd7e425a15
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Mjg3VUxBRHAxVGhudm0xdWdkSkRXOWJ4dHpGNlBINzl2Z1VFaElxbkV6SzRi?=
 =?utf-8?B?N3NjTDBQSFdFK2dUb2w0M2ovTE5TMGcreXREOTZEbXdaSUhRWElsUnlmdjBa?=
 =?utf-8?B?MXlRYWFsdElxUDlOU1N1TVpSc2RLNDF4WFdFQ0xtOTNGSEpzd3VmSnQ5WjZu?=
 =?utf-8?B?dldhUk1ocUUraGhmeVRXdllaN1MvaHhaYXFyT0wyNFd5ZHljdnVsN3FIWENl?=
 =?utf-8?B?bTU1a01KYXpGaUR4U2lYNys5Sk1pYnVEaHY1S0w1WjkxcEFCcXlPdE51N0V5?=
 =?utf-8?B?Q2Y1aDZ6dnZoM3dPYU9mem5QZTJ4QWZ5QVFyRXhxbnR1ZnptUnFwQW1yS0Uv?=
 =?utf-8?B?U0d2aVV1aHY3L0dFdk5MZ3B5Mnd0a05qYWJDTDlnUkNBYlBtUFd6UjR0OWMy?=
 =?utf-8?B?TkJVYWdvajEzdStYcVozYjRLTmhtOEUrdG9MbG9SQ3Zkbm0yME5JODdjS1Vy?=
 =?utf-8?B?QXBYVjVHU2ZtOUVTNnRFZEVPNVZMNjg2RzlkSmM5cVZ6V0NKekI5SjFnWlVX?=
 =?utf-8?B?N3h6aFJCN0pQeENuSHBVZklCTTJGZFZVaEZBU0JSTlo1ZG16TVF2QWlPYktk?=
 =?utf-8?B?V3hXWG5MZEt3SHhIc01GTlFJK1FiR2FCMXdTSnliR1krQW9MTzcveFR5V1FU?=
 =?utf-8?B?UlRDa3p4RGl5TmpnZ3lNZSswUUFqczFiK3I5T2w4S05uTW5MM2ZyNnlWOFhL?=
 =?utf-8?B?WVYyclhBZWR1VWNPbWc1RS9BQkhQNEdGcjcycVFJbm96ZzFWQTVpVjI3WDBL?=
 =?utf-8?B?bWZzd01HRW54dngrUGxDd25TT2lGZ1NFeGdlUmhxS3U2YmdmbXMvK0xFRWdo?=
 =?utf-8?B?Qm1Ec1RpaG5hUHJGN3BmbjdTZXVBT3ptek5zVW5JOE9tV3lVb1dCMzE3RXNs?=
 =?utf-8?B?aDhLV1lSbmJ3cEdaN2tTM2VzcTExRFIxVGpDMHVEUmJKNTU5MDg3RFVJRjRB?=
 =?utf-8?B?c3VUS0Z1NElKRjdlakg3bTVmNEhJcTJqYXhGL2VLLy9oZWV0SnhXbUpxMndW?=
 =?utf-8?B?VExLYjB2M3VCWW1vOXFBc0xyWUhacVF3VmhCQ1Y4U2hQQ0l4dTFzRjI0OGN6?=
 =?utf-8?B?Uk10TDd5T1p2TEVlbDZlVGl2RVM0T2RIYStVcGJoUGwyS2NVR2pIL2tHNXZx?=
 =?utf-8?B?bGt2SmVWdnFDSUVOaTZjR042bngvYXZUeDBtYXVsc2tLRGYyQk9KNStoVkdn?=
 =?utf-8?B?cWNYK0hNbUVHaGpTRFQrbEZja1lGQ3VaWEhCcjJOWWpJa05halRMMzN5MkJT?=
 =?utf-8?B?Q1p1dlRzbS9VOEdyM2tETDlrY3AwMHZxZ01JV0FKdmxtR3lDTTc2NlcxL1Yy?=
 =?utf-8?B?VTQ3SnFNclFSbFdBNmp1emZCR1NOSWtJckExTG1xUVZyWU14K0V5NFZsekJI?=
 =?utf-8?B?MmJ5cU0vV1VWNER3Y3ZHeTdHU085RzIzSDQ2eE45YkMweGZUZTZ6d3A2Y0Nw?=
 =?utf-8?B?WTNNNlpuR3I3dVBoUUNvZ0pud285eEg4V2xLbmNPbnFhamgrRktXTDZkSURT?=
 =?utf-8?B?ekxad2RHUGN3TndxUUl1aXM5NEFycmJTNGxISk1Rc25CYld3V3pBaVA0Q1ZF?=
 =?utf-8?B?c29XR1RRVm9nT3RiOVhrQnNBU3cxTzc4YURkdmZVUHByMTZXRVJ3endtK0R3?=
 =?utf-8?B?YzdjUWtnZ2lmSmFTS1FGVUFEN3VzL3p6Z1F0dXU0QVVTYWpvamtuREE0VlQw?=
 =?utf-8?B?eE9KQzFIaGFlS3dPKzk0R0lSeEFFc09VdGZYU1B5SmJuaTMrYWZMMld4MnV0?=
 =?utf-8?B?Z1NNcEFMUWJVWUlCUnVuR3R2MC9LWUVhdzhIVHJRVnFjdlVCNVNFeDFmQStj?=
 =?utf-8?B?U0Q1c05kcFA5TlZYQWIyeDRQUjhoVER2U1RJbDMydEI4QlYvbXlCb3JRV0NG?=
 =?utf-8?B?RWtuTVJSVm52QWlVWFkwdlFyTklmQStJK3g0elhWbEdOWFJRTVdSU0dESHJV?=
 =?utf-8?Q?buGdu/uE/S8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48C96FAD0A4CD64BA133C7A83BB5BFC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB9998
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fdb8ae4-3d33-4526-2296-08dd7e424657
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700013|14060799003|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHBuTWlLbEJNVDl4UFU3bllrV1QvbGhFYnh5REZZdmtmbS82VTdZQ0R4RnBz?=
 =?utf-8?B?S05TcVJGUTFwM2VVWE9TUHBrSURRZWJVQ2V4MS9IL0MxdHhWait6L0dSUEhQ?=
 =?utf-8?B?Tnlacis4YktVWlZ3dkN1RDd1RXlqZTZCNW9ZQlBhOHI2eG50S1FxUEczcGxV?=
 =?utf-8?B?eU1YN0ZFdTl2ZHFLdEhvaVE4ektoRjRGdk9BaHZXNHZCSzhBVXNSOUIzOS9k?=
 =?utf-8?B?YzB4T2Z4UVBWTm15bGlVSkFvMWk0emUzYlVSbnRqUFN6MThvYmVLUUNuSzI2?=
 =?utf-8?B?ek9qMnFHMUM2NFl4c0w5QjJRWUx2bHFUdlQzN0tjWWZ5eXdSWURVUi9vL3R2?=
 =?utf-8?B?QUt4UmlwYlJMVW1CdUVVZUNjOEM0U1lKdEVUWEZyajZJMmNCVG8zVGdnNDJE?=
 =?utf-8?B?NDczNGVMYXFWMHdOSjZHd2VuMXB6SlY4Y0l5WHpPRENrWjM4b2tPTmJJRHhx?=
 =?utf-8?B?ekk4YkN4bUcyUkh3dk1VK3pDU0tvQXZGay9yQTNORTJTdjRmcGhsMEdSTCto?=
 =?utf-8?B?bHB1YnNLNU1oL2RQVjc3Q2xmK0trVzVzZjM5VGdHbElXTXhITWpoSG1zTkJX?=
 =?utf-8?B?a3pJYjg5NC82OUhiLzRWd0FTUjMrSlF4ZUt6dklhKzQvY09DWDFQUnQycGQr?=
 =?utf-8?B?NWpjRmFEL1BkYjVXN1pLcVVoVFFXdEhJN2pDSmJKcW5JUDVEQWcvVm03SDJJ?=
 =?utf-8?B?RTM1bGNKRnZkb2p6KzEyeW9uK0tDL2hJc0J6K2xnbzcraG83MFdsYlRzV2xk?=
 =?utf-8?B?ZENsUU1aRTd1S3VRd2Y2bGdJZmhSMmN3cEZsRUlnRVZKUWtnT0dCZEZuRFh3?=
 =?utf-8?B?Skk4UGxDT1dnWTNKdzFydjRmNXZ3UFBWSlVFQXl2eFQrRG1tUGYzRUk2VExJ?=
 =?utf-8?B?Z1NzQmVGU1FKTGZEUWtrUk1IWU5LVHdVejBtRC9kQk50Z1Mxcmt5M0ZzV0d2?=
 =?utf-8?B?QlNVdkxkWnFGMFByd09DN1hPUVdtSUVDUFFaZGwySG10OGsyTVh2TnVtOXZs?=
 =?utf-8?B?c3h0Q215bXpDWHo0c1g1czU5TlIxM2JCY2xVSmNmTGZlVkJIeGU5VEtRbFNn?=
 =?utf-8?B?aytHSFRxUDJNSXpRN05rTUZnbllPUWxGdndQeFdUakcwMkkwcHM5eFB5OFdM?=
 =?utf-8?B?WXR4NXBtNzhaTFArdVhYTHVabktuV1pQeUZJbkJMSk1YOEo5czZ0Y1VmcXR0?=
 =?utf-8?B?VTRFY0J6NU9yZDlkOVlYVU1QYmxwUFRjTU9FSTVBUjJPMFpFdkxhZTRpSDR4?=
 =?utf-8?B?UlpzKy9VeFBHb2Y5ODNlaTNjei9oMWVFZDlZQm0rUStvUldXajBycTgvcHVU?=
 =?utf-8?B?QnJMN1lCdVJNK2JrL2xNTVV3R0kzZjkxSlZld093MjdkK0dPSzNZSDVycERD?=
 =?utf-8?B?RjNvRDFWeEFDa1pIb1l1Q2tVWDdHSmJCZ2VOcndDTzJpNnE1N2dGZEJ3QUov?=
 =?utf-8?B?cnhadlZsL2RLdERiNytIRjYzaUZQMVdxVE1HRzJ0TFFmb05TRlAxVGpvMXRk?=
 =?utf-8?B?eEt3VmJ1VDE1MzNiL0pnaTFxbEo1RW55cXRKZytwdUpnaWgvMyswNk9PMHVF?=
 =?utf-8?B?RUl3WlBvaUJNNFhFdEVuVHZRSVRiRWxmS2FmY1JaeHZiYWxtZk1wc1hpRDdj?=
 =?utf-8?B?akZpSzJrdkk5dTIwODkyWVdtUnJrbXUyaDhOTkdyT21raXlTNENHb2RtK0tO?=
 =?utf-8?B?MmtlSVQ0WjEwdzhrRDJzb1hPTUFrNFdZUjBaQUVzTExicVNYY3FxOUN1V1Rj?=
 =?utf-8?B?dTIxb3pYR0ozeGIwU0pib3VHVEUwKzM5VXhhVXZaQW02TGpVb1hyMzY2UDBn?=
 =?utf-8?B?c0JFajQ2TG1ZMHU2ejl2b21nSFhZUDh5TVk2N3I2VDlaZ3BuNU9JSHA2eXJ1?=
 =?utf-8?B?cTBTTzl3VXp2enB4b2FyWEFIcTl6YlZVS1U1QXBlSk1NTXh6L3RwanpaRUNl?=
 =?utf-8?B?OTdQN0dYUysrdkZxQ3pGZnFMYXl2WllwQmlaQjJEOE9DUFFiMEV1bEdTdkF5?=
 =?utf-8?Q?LsXIDIrAnFR6EKZVr1NWIqWoJHdVDo=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700013)(14060799003)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 06:29:19.9670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ca9d75-cc93-4082-4939-08dd7e425a15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11158

SGkgQW5kcmV3LA0KDQo+IE9uIDE2IEFwciAyMDI1LCBhdCAxMzo1OCwgQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBjcHVfdG9fbGU2NCgpIGlz
IGFib3V0IHRvIGJlY29tZSBhIG1hY3JvLCBhdCB3aGljaCBwb2ludCB0aGUgI2lmZGVmIGluIHRo
ZQ0KPiBtaWRkbGUgb2YgaXQgYmVjb21lcyB1bmRlZmluZWQgYmVoYXZpb3VyLg0KPiANCj4gVXNl
IGEgbG9nY2FsIHZhcmlhYmxlIHRvIHByZXBhcmUgc3RydGFiLCB3aGVyZSB0aGUgI2lmZGVmIGlz
IGZpbmUgdG8gdXNlLg0KPiANCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KUmV2aWV3
ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IC0tLQ0KPiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQHZhdGVzLnRlY2g+DQo+IENDOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29t
Pg0KPiBDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBDQzogSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KPiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPiBDQzogVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29t
Pg0KPiBDQzogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiBD
QzogU2hhd24gQW5hc3Rhc2lvIDxzYW5hc3Rhc2lvQHJhcHRvcmVuZ2luZWVyaW5nLmNvbT4NCj4g
Q0M6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KPiBDQzog
RGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPg0KPiBDQzogTGlu
IExpdSA8bGluLmxpdUBjaXRyaXguY29tPg0KPiANCj4gdjY6DQo+ICogTmV3DQo+IA0KPiBFY2xh
aXIgbG9nIGZyb20gdjU6DQo+ICBodHRwczovL3VrMDEuei5hbnRpZ2VuYS5jb20vbC9ES1h6cWJX
aDZGT1Nlc19OLUdTNGtWclJvM3M4enhMfmdJd20yOC12eWtpbmVIOTAxX3h0WHBobFJoSGxUWUlI
V1dINl9TNzRaVFhhfk9KMW9lOERXUzBXQWdwT1MxQk9GSHR4WDJqUjZVLX5WUDMxSkRqWjQwaXRH
OHgzY2haflBCbjkzMWlyZEhORG5LdHhJTEh4S19GdlI3d3hGNjNLZFRadEhVYU92Q1dydEs0a19p
VlhWOS1IOW5YZkRVZF9xMWk5ZDYtcU9ZcEpCWjlOdnVsWHZPV2tIcDZZRHZQcUhNTER1YmN1cnIz
WnI2MHlRM3ZyYzhHRGdmU0VnYmtNNkNtejlRbUdxRW1fcXlFcU0xTjJyeXM2MjJybVZOZXQ2aFBw
SS1YbTZTSlJVZWVwSHB5bFZ1SzRmbFg0OEpwZjBqT3FIejRHYVRqb3V5NG5SQzAxN2ggDQo+IC0t
LQ0KPiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jIHwgOCArKysrKy0tLQ0K
PiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jDQo+IGluZGV4IGNlZTU3MjQwMjIwMy4u
ZGYxNjIzNTA1NzhjIDEwMDY0NA0KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
c21tdS12My5jDQo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYzLmMN
Cj4gQEAgLTcyMiwxNSArNzIyLDE3IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X3dyaXRlX3N0cnRh
Yl9lbnQoc3RydWN0IGFybV9zbW11X21hc3RlciAqbWFzdGVyLCB1MzIgc2lkLA0KPiB9DQo+IA0K
PiBpZiAoczJfY2ZnKSB7DQo+IC0gQlVHX09OKHN0ZV9saXZlKTsNCj4gLSBkc3RbMl0gPSBjcHVf
dG9fbGU2NCgNCj4gKyB1NjQgc3RydGFiID0NCj4gRklFTERfUFJFUChTVFJUQUJfU1RFXzJfUzJW
TUlELCBzMl9jZmctPnZtaWQpIHwNCj4gRklFTERfUFJFUChTVFJUQUJfU1RFXzJfVlRDUiwgczJf
Y2ZnLT52dGNyKSB8DQo+ICNpZmRlZiBfX0JJR19FTkRJQU4NCj4gU1RSVEFCX1NURV8yX1MyRU5E
SSB8DQo+ICNlbmRpZg0KPiBTVFJUQUJfU1RFXzJfUzJQVFcgfCBTVFJUQUJfU1RFXzJfUzJBQTY0
IHwNCj4gLSBTVFJUQUJfU1RFXzJfUzJSKTsNCj4gKyBTVFJUQUJfU1RFXzJfUzJSOw0KPiArDQo+
ICsgQlVHX09OKHN0ZV9saXZlKTsNCj4gKyBkc3RbMl0gPSBjcHVfdG9fbGU2NChzdHJ0YWIpOw0K
PiANCj4gZHN0WzNdID0gY3B1X3RvX2xlNjQoczJfY2ZnLT52dHRiciAmIFNUUlRBQl9TVEVfM19T
MlRUQl9NQVNLKTsNCj4gDQo+IC0tIA0KPiAyLjM5LjUNCj4gDQo+IA0KDQo=

