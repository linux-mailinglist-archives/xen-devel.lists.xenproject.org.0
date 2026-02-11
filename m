Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMxJLNhhjGmWlwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:02:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A9123B4E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:02:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227292.1533638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7zF-00011C-3V; Wed, 11 Feb 2026 11:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227292.1533638; Wed, 11 Feb 2026 11:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq7zF-0000zE-0h; Wed, 11 Feb 2026 11:02:25 +0000
Received: by outflank-mailman (input) for mailman id 1227292;
 Wed, 11 Feb 2026 11:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vq7zD-0000z8-6p
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:02:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 231c1c25-0739-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 12:02:21 +0100 (CET)
Received: from AS9PR04CA0165.eurprd04.prod.outlook.com (2603:10a6:20b:530::25)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Wed, 11 Feb
 2026 11:02:16 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:530:cafe::c7) by AS9PR04CA0165.outlook.office365.com
 (2603:10a6:20b:530::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 11:02:14 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Wed, 11 Feb 2026 11:02:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBAPR08MB5685.eurprd08.prod.outlook.com (2603:10a6:10:1ad::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 11:01:13 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 11:01:11 +0000
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
X-Inumbo-ID: 231c1c25-0739-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rMKB+CcH4H5v0R2gVSsVVLQxbaJKt0OS4sy+lOiDUlgE6y5p2a6EF3dbDD0bVIEBP1wYKwMw9fm0ab3+x2hWR0aJmReRfK/YUJYSB0a6e5ece8HUa7JpMozR6trZgiHujAj3ilG/4Eh03DyZu8jzNlCn/6QSHCRs+Ttg6o6WHFCLVVasNAf1uSxL9/QYi+yDGy6Ji7MOrene6jSY/Lf/zd0FYk0Kie5nF7FxaoUt1rumQU/TGWU3LHPG4xq5WCGy6UFhCwSrUfF7Q4Ntyt2gqfD8hXsj/ngv+biBT8EwwBEEt8uQQ2kaJR9IUGlc/s/N7eEnrKnh7ACa2McgHvyMRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KboDKz3+vXTC4i8lWnodIs3UqoGQ1nkdDkYcbc7kPDI=;
 b=dH0Hy45aMNGkB0/OcGs13a3YEZFM5R3PdgDerfz/LUV2ppiSwNZHoPUY/IjyqllqXUJzpWxtlUy+jaIQLWkkdD2vdr4RQlclUou4/2g+FAkQmh7lgflb1NzZFum6yI84Axoyz/S8K5LQ6pHPdRHgElixoYUWhjj2IxT73wSXZqOg5kiMQkft9tZ7ZfhtaoFCj0NoL74GSoaxCa9HZCI7BRH1fdKvYAh7eNjKeQvPU5lULdig9/kjvzYgj+UTwtuyEvfMw0HMWw4q5FXmgmA8uGInrHWj5JojqP0X4hzlY5revTffPVhDSo6WoPK01MWeWkYKNiL/i8ZI6l5EDdTXPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KboDKz3+vXTC4i8lWnodIs3UqoGQ1nkdDkYcbc7kPDI=;
 b=Kl46mHKMkYJc7/WzgLET8dZ806XgofwlGvwPpMOMsBEq15W8OfRMgWqeP4Cc9rWWLh+tmbxDjBzT2zvhn4OM6JdJWG1EiuUYQ2TWCwNP4NfAiDnzEMyLj12wDId+1nnbIXiuJSQZzR35B4r36mC9EDUE0MsEb++KO4JCo0SZkJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fet6GCTU42F0OjWjoK7SOby8JzIMD3360dhrgyC42GBJ00BkKJbSqQY9PtKv+jDC4gWGtfwYsj/AHMzG+2E1ARTtB10mNM3AG7yDdUDAmcmUVFC4TaaJ4UmndBAuLOnlhftBLovQn/DIaSnWK2DG4dpHmWY3ZGUkCJXH+080uz/1a0BqsUdk776aKhoRC2Y3VLCyNXxo2p6J3HbRzbh6oGpNnCllGGz7FW7FK4TrjqC1OOV0YDN6fARyz4ajwxPHNO5ypWd8E5RTCt0j+pFOMmzraQyBFLLIUbfDnE3vdghiq4PBonYB7YisDqt+ln0m34HHIxLLMaE4/AAhouQCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KboDKz3+vXTC4i8lWnodIs3UqoGQ1nkdDkYcbc7kPDI=;
 b=j/aitXf22VU6+SSu7EnjXw/THW6mqETL2wMhlzrA3Gd1yzi8FSXvcMhQebjJae2FzuznwuTDvQNageohd4fg0oqr00bbos4t6ker7NsHnrrywT/vubAcBFPKxGmaJSOMDZ0pHIrugQ/UZTGlWefgrfCcD4Ulrw/wrkzJQbZJ9qB9U1hZsmRuOJKEhGPwUhwCoTip4gKzkvI0oezGaGMH8wtrDC+ru7qWEBoYGrxF1k43eUJ9N887y8kZc8k0TrtyewmTaiz5RBX6QMZbY0Gz4tafO7nT6LqQwUZacfAoFMFiKgUyvVbN3xIBq+zsZVDjRUS6+HRxVZQ3gsv+2ladgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KboDKz3+vXTC4i8lWnodIs3UqoGQ1nkdDkYcbc7kPDI=;
 b=Kl46mHKMkYJc7/WzgLET8dZ806XgofwlGvwPpMOMsBEq15W8OfRMgWqeP4Cc9rWWLh+tmbxDjBzT2zvhn4OM6JdJWG1EiuUYQ2TWCwNP4NfAiDnzEMyLj12wDId+1nnbIXiuJSQZzR35B4r36mC9EDUE0MsEb++KO4JCo0SZkJE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] xen/x86: always consider '/' as a division in
 assembly
Thread-Topic: [PATCH 1/5] xen/x86: always consider '/' as a division in
 assembly
Thread-Index: AQHcm0PRpWbQ66MnpUKRg8FXLXanDLV9VOKA
Date: Wed, 11 Feb 2026 11:01:11 +0000
Message-ID: <A8CC5B43-5E20-40E5-A55D-07C44851B18E@arm.com>
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-2-roger.pau@citrix.com>
In-Reply-To: <20260211104638.7938-2-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBAPR08MB5685:EE_|AMS0EPF0000019B:EE_|AS8PR08MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fc330e-0332-4b5a-8578-08de695d0498
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R3ZoVkpwVENvT3FIdGdzOTM3U3dldHJRU1JnaUZod3BTSG9GVS93SmZEWU9u?=
 =?utf-8?B?MFVGU1gzRXdWYTJ1bmNoenhKYkJWUWZpUGNubzYwWlpMUk9ycGlMM094R0R5?=
 =?utf-8?B?YkFsdldTZHlnWkljb1lEK2FvZ3Y1VFFLZTU2dXRNTG9hU2Zlenh4d01mQkFE?=
 =?utf-8?B?QWl6Zm9RL2w0dS9jLzB1NVBGd1JndURCQ0lhOVZ0Y3YvbnZqZndFb3pEdHpt?=
 =?utf-8?B?THZzeTJHeG1mVFlSSzVMR0xySnFFQnRxblkxNDlTZTc5SE0rR3lOemVCc3lK?=
 =?utf-8?B?TWVFTGxVN2sydk5mVlFkd1FVcW9XdFIzS3V3Nit0YmF6T2FISHhjeVRCdVdG?=
 =?utf-8?B?K28rWk5GNS9tcmlMUmlnbkJlQ0VHMUVhV0FzUVdGNjI4MmVPMHFkOThGTnJv?=
 =?utf-8?B?eHlibVNLTHNkRGE4REc2R1ZWZWtCMTdGVlZJelBHTEtmYmlYbjVBNmtHZDJM?=
 =?utf-8?B?ZjA4RjRaZXJ0aklGcGl6Mlp1dWExTDYwYitBQ3NGa2pJUlAvUElCSFUvU2JV?=
 =?utf-8?B?NzV4RExnUXhmTnZxSjg4OUUyZmM0azVYL1JtT3BhZXBhNWNxazJwSUVVTnE2?=
 =?utf-8?B?V1ZLYVEwaHFSWnZHZk1FUzJOMVZIa3ZMUUMyTDZxWGdrRjlnYURIUDJLV0d2?=
 =?utf-8?B?bjhLVjJDWStGckhNUXU2bndaaHRDTnZzc0ZJWTlTaS9mTFZPOE9rRWNkY1dl?=
 =?utf-8?B?TU90emhubVRrcC9DWDJycHFMSHNtM0NzcE1xdEVYRWhXM2RoYWhXK0hibTNO?=
 =?utf-8?B?WDlQaU0vVEtSWHBzTUtTSVArem83TTlJN2R5QUlvNGJhWUNKSFFSM1JUYzNj?=
 =?utf-8?B?aVZHampMMlA0bm8zdDNuTm8va3lBR0pTeE1HcjFzdER2V0NBUlFMcnl3Tzdz?=
 =?utf-8?B?QWJLUVhmSkszbGorN1lHcmpBZ2xCcWw0MG1EN3NrQnpscWxXbk1wT2VkNjM4?=
 =?utf-8?B?d0pQN1hMc3RGbGs4Y0FNemdTcG8vSzU3YjRZdjBtb0M2alVzL0FMNXdRTzB5?=
 =?utf-8?B?TkYwWGV2QmdHTFAyVEZIS245Z2xpeDFsZkVzVy8xSDZPZ28rT1JxRXdCNzFp?=
 =?utf-8?B?THdpMkpQTDU2UmgyRXJLT2l0ZWZMUEw3NElwbnhtWnZ0cVBreHNDV3NSVmFm?=
 =?utf-8?B?cTRpWEtiMzRmTVY0OUVSOHlDUGNlTnhycUZMRFJUVnk5bGxacGM4Y1Z5K2VC?=
 =?utf-8?B?RmIrZG00Ky9qVXI4ZWJ3WW0vTFRHS1FtZGE1Nkpja05tcWI4WnA4cDArMmNl?=
 =?utf-8?B?dndtOWswbFdTaEtyd00vZDlrSkhyWW5vQnhvd0NwRzB3eWQ1ZCtTbHJySFhz?=
 =?utf-8?B?eUVhVEE3aWs0czc1NXZDUHcrbVlPd0IrMERYMEQyeVNPTTFjakRoLzZnTFVQ?=
 =?utf-8?B?VHl3a0FDMkVLSjM4dnVFdmZpUHNhNHhuRk8yelExNVJNSnZwSDI5UDJqZFFU?=
 =?utf-8?B?dUsvT1BiV1dSYW1YSEtGMjlZN2lob0hRUnFpZ1hvMmdhOHZMRnptcVpJS3dn?=
 =?utf-8?B?Nm02TGlLUEIrZEVuNGR0Q0IyUWdwakw3R1NaNnJPVTJoTXlwcU9YNEt4WlBS?=
 =?utf-8?B?a3hJSEFQcFFiam5PQWdmRFlteGRFTFl2VEV1WW5kakZnYU9BcHhWUWZLOTFm?=
 =?utf-8?B?ckwrbDVmVVhMWXdmeVE3Z0Uvb2dJOHR1QWJ3Z2NpaG15dkFJYTZLaEZOdk5o?=
 =?utf-8?B?S2hEK09udUM1NHJDTkprU3grS0VNa1U0S2ZYcVMvRlZrMFFjYThKbUFVVXRH?=
 =?utf-8?B?Qm5zMkJBYWttVEVvdWhveWExYkpzcEJrcjd3dFVMT3VJZCt1RjcwUXFIVXNI?=
 =?utf-8?B?YWtTZmUxS3FHY0x4TFdMWFBxbWlhMCtRdjBVamM2YUI3aW12OWdaZ3pqY2ZJ?=
 =?utf-8?B?U2ZwRTZ1TGhNd2VzcWY5bjQyVHQxWTR5ZEFQM3E4dkh3SmFHY2k3dEZUNGhK?=
 =?utf-8?B?NWt1ZGkvbWczVGs2clFpMHJmWXlORHNWS2RDOTAvemVFM000eFd6dVBWWDB3?=
 =?utf-8?B?Z1dMY3Q4Y0o0RlVsUUtvZEs3WlEzanN6bTRoZS84ZHl6eERTVEJwdEFKcGJh?=
 =?utf-8?B?c3dtZDVwKzNvbm80RC9LRHRqSHlRcTg3MlI0MlJMenAwUGxoN0FOS3VWdFl1?=
 =?utf-8?B?UzZVUEtISktybUJ5SmlRbkdiZWJnWFFCSm9QWkcvSUlVMExkanh1dThZWHJ2?=
 =?utf-8?Q?CEV2/yFMnokX+m8PNGbz1yI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8218C883F6AC384790EA11E70F58FB7C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5685
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a578a867-9e5c-48ca-c7fe-08de695cde2e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|376014|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWkzL2NsaU1kZHcvWTdINWFkM0ZGOHJTaTAwWjFiWm1OcHB1OXluaFUzaXlo?=
 =?utf-8?B?c0hTVmMvcWIxZE9oZzVRcW5ubGl1Zld4amZiWGRZZFB5dG5CS3JHb0lkeGov?=
 =?utf-8?B?WDB2Vy9wTklGQ0hhNE9UdENWaVpYaE1BUlFFMDhOSXYxbkV0ZmQyWTNqemxT?=
 =?utf-8?B?SUsrVnJHaTVVam5GeWN4Q01WdjF6Q2FqT3RkSDgyOS94UTNZbmQ3T1c2cU1R?=
 =?utf-8?B?WThRUUcxVjFHYlZPR21mL1JLeXJESG81MS95Q0J4WHpXdlYxSjNLSGZpTjVm?=
 =?utf-8?B?ZWEzSGdabmxtcTlBM24zTDdOYVFhWURlL1pMdER4ZC9BWXB0bjdNVm9jdmM0?=
 =?utf-8?B?SFBiTnJrUWZmMXRUZHQwOHlFRVR1bU45a29aV1VKNGVtRG9WbWJseDNnRDhY?=
 =?utf-8?B?MVo4THd3QXhaanA1M0paZm5jSkd6TE9qSmRNU2lzYWlLYjRsZWx5Mk5od3NP?=
 =?utf-8?B?Sitwa01rUkR3SnduOFNrNFYwYVQvOFB6N1N2SzZPcklKYmdwWVpaMzBkV09m?=
 =?utf-8?B?SHgvamlLUkpzWWszNzdoMHNLYnpGWnk2eng0NVdPb2dVLy9RV3R3YVF6MERv?=
 =?utf-8?B?VytUQWpMZTBxODVpb29NMkw2MFBsYjZ1aXV4eVVzV0wrNjFUZ0RpNHAxdTdX?=
 =?utf-8?B?TnhGWlRCbzVDMG5WZ0kzOUVaaS8zR3VzWkt0cEZmK3M1Y1NsMGdGdXhQVC9J?=
 =?utf-8?B?SHNZMHJRYVdPU3ZRWTA4QWJodkVVanpMZ2NLZ3pDWG1lRE9IT1JsalhLSzVO?=
 =?utf-8?B?dGRDQ3U2NGQyNG9PR0NGSDdVWU1mZE9qRWgvQTA5RkoxR2taY3BpVXU5VDVw?=
 =?utf-8?B?dUNNM3ROTWExYjdDaVpjVHVxR1VnVWQweUhHQStCWjQ4OWJ6aG1wTE9OOXZp?=
 =?utf-8?B?Mm03MEh3QmRFbnRFQnBtK2tldjc1bHFRMVVUV3FNeDl4Y1k5UnBkVEUyNDkv?=
 =?utf-8?B?a2piWkJ5MkFob0E5VEs2MFN4U1NsMnVITjV3dTdTNDNDUzhZUFM1Zm5aVVBU?=
 =?utf-8?B?QUYxZjF5SjdDbCs3SmVyVW5qL2pWMFNTMmFGNWJ2WUlnbkxQN1F6MjlmbXNK?=
 =?utf-8?B?VmlIZHhGV0VkVUNhQ2ozd3QzZWVHMm0wdGlQNFpIQ2h0Mi9LWXVmMEdBYUpN?=
 =?utf-8?B?M1NQMnM1cVVIbEhqM2dWM3ZObUI4NWpJSGZneERuSWIyWVpFdFlYdW8rQzNQ?=
 =?utf-8?B?VWdOVmxsRTZKQjU4UzE4eEtzUzVMNEY4bGNqa3NtWEdpOWt3aHF0T0orNHBP?=
 =?utf-8?B?cHlPMURRM1A2aEs2QjJvU09WUjhKUDV6clBGajhkaW1NSWZ5bTNIZitneFNH?=
 =?utf-8?B?aFdldk55ZkRsNUMwRldRdmkxOHNHVWFESFR3NDkwU1BWVjlkbXlkNlZpbkFQ?=
 =?utf-8?B?dEkrVS9jQU5nVHovaGtjakl3d01YRm5zZUtoRWxKQWd5VkVTdDcrZkRrMys3?=
 =?utf-8?B?aE1tNWhSOGlUc1U5TndPb1V2TzAyT01FZHpzbEZQamVPSlc2Q1RBWFdvcnRn?=
 =?utf-8?B?MnkxV0JpbFpOVkNOWERlY05CbHBDODlMS1UrQk1Cd0R0NEE4bjk0QW0vNThI?=
 =?utf-8?B?WVNzRW85TzI5YzZ3UVJmbVBjeWMwRFBPcCs5emdkZStkOGdFL01vNGU4czhy?=
 =?utf-8?B?cGluYUJNa0RvRE01WnBUMVh1dmNEQS96UUFBZ1RPM1Bsa3ZhQ3RHdENWNTAr?=
 =?utf-8?B?ZDJLSXYzTkkzTmJtRVhObkR2bXhoZHVvZ3lUeXhBUlV1QXo3eTFXVnVWUEZx?=
 =?utf-8?B?SkR4QWJ3SGFodzArOVM4QVZZOGJjNlQrUVVRSFVOeDFKVmx6enJQUDhEL2RE?=
 =?utf-8?B?bEplVlFLRTMxTTBzZ21ZbktHOG0xMlhkQ3c3MWwwbmttVnZsT0FvU3lMR2pX?=
 =?utf-8?B?RlhvVGZ0YlZxZ2Ewc1dSSWFLdXdGT3p2Qy9UT1dHdk5rVjJienJrN1J5MDMw?=
 =?utf-8?B?dHJRb3RlZ0hpSzFvYmtiTk94VHN5THJjU2w0WEYrZlVlMTFxLzMxclhiVnls?=
 =?utf-8?B?RWt0cStBSnVYR3dSZHoyK25TWGduTFhzNUxjNjUya05iMHh4VUVhL2NCZmdK?=
 =?utf-8?B?a3ZjYmVKWHBCNW9rMjlxUlBUaXBSMUcwajg2a0xiYnBPS2xkTXpLM2wrR1gx?=
 =?utf-8?B?RGZ3M01UbUNtVEJJQXNENXF6UlBVRmpwNW5PMXMzVUJYOVUybVA5dkFEN3RC?=
 =?utf-8?B?UWxyeUI2am45dVNOWVJxRW8zSkpxd1JFWG1mZFZ3eDZZMU1sVHhMTm5XRXFX?=
 =?utf-8?B?d0RDVVNZUytoeVFWRlJ3R2dkN2xnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(376014)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XTacxbKjatqpxby8yqS3MVrjXNqeVZoEesLKEc8ohI5eLkKuIfhfGfshc27Ifibxz18yV+JUwkrEQRx1U/X/1Nuck+G3w1KYuAcE0fxNK7RnpcmfGjyc9uoeaaeBjeZbsOwd4iKH0F4U5/H6scbyL9KevBUglrPcNNAKn1x5K8SAlh228zTWPdnPzj8F1ruVTB/55a+iNWBJ/rteCAFjZfkomUv320v5EwTEiAtrpJ6o9iV7Bd9HPlpDSQkuoo+oVCR7Vap75h3k91VomegwqNgOIEpM2m85cBE8LzIprV9fxDZhRhyts2KSTXwb2qtLauzoL8w1CS/V9Dfsbhu5I4P6dxmpZCq7Qns/0wXgeLZ8pwLtIGc+/+Lv3dA2t7SbTmit266ukpJLJLfC2bkQwmEp1lD4By6AXDW5tXwX3p0s1Yf/YwDwMyRCpi+7F0vt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:02:16.2231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fc330e-0332-4b5a-8578-08de695d0498
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,citrix.com:email];
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
X-Rspamd-Queue-Id: C01A9123B4E
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gMTEgRmViIDIwMjYsIGF0IDExOjQ2LCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIHg4NiBHTlUgYXNzZW1ibGVy
IHdpbGwgY29uc2lkZXIgJy8nIGFzIHRoZSBzdGFydCBvZiBjb21tZW50IG1hcmtlciBmb3INCj4g
c29tZSBFTEYgdGFyZ2V0cy4gIFRoaXMgaXMgaW5jb3JyZWN0IHdpdGggWGVuJ3MgdXNhZ2UsIHdo
aWNoIGRvZXMgdXNlICcvJw0KPiBpbiBhc3NlbWJseSBmaWxlcyBhcyBhIG1hdGhlbWF0aWNhbCBv
cGVyYXRvci4NCj4gDQo+IFRoZSBiZWhhdmlvciBvZiB0aGUgYXNzZW1ibGVyIGNhbiBiZSBhbHRl
cmVkIGJ5IHBhc3NpbmcgdGhlIC0tZGl2aWRlDQo+IG9wdGlvbjsgdW5jb25kaXRpb25hbGx5IHBh
c3MgdGhpcyBvcHRpb24gd2hlbiBhdmFpbGFibGUgdG8gZm9yY2UgdGhlDQo+IGV4cGVjdGVkIGJl
aGF2aW9yLg0KDQpXb3JrcyB0byBidWlsZCB4ODYgYW5kIGFybSBzdGlsbCB3b3JraW5nIG9uIE1h
YyBPUy4NCg0KPiANCj4gUmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQoNClJldmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFy
bS5jb20+DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSB2MToN
Cj4gLSBHdWFyZCBvcHRpb24gc2V0dGluZyB0byB4ODYgb25seS4NCj4gLSBBZGp1c3QgY29tbWVu
dC4NCj4gLS0tDQo+IHhlbi9NYWtlZmlsZSB8IDcgKysrKysrKw0KPiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL01ha2VmaWxlIGIveGVuL01h
a2VmaWxlDQo+IGluZGV4IGEwNTQzMTVmYTRhMi4uNGM4M2UyYTQ2NDc3IDEwMDY0NA0KPiAtLS0g
YS94ZW4vTWFrZWZpbGUNCj4gKysrIGIveGVuL01ha2VmaWxlDQo+IEBAIC00MTMsNiArNDEzLDEz
IEBAIGlmbmVxICgkKENPTkZJR19DQ19JU19DTEFORykseSkNCj4gQ0ZMQUdTICs9IC1XYSwtLXN0
cmlwLWxvY2FsLWFic29sdXRlDQo+IGVuZGlmDQo+IA0KPiAraWZlcSAoJChDT05GSUdfWDg2KSx5
KQ0KPiArIyBUaGUgR05VIGFzc2VtYmxlciB3aWxsIGludGVycHJldCAnLycgYXMgYSBjb21tZW50
IHN0YXJ0IG1hcmtlciBpbnN0ZWFkIG9mIGENCj4gKyMgZGl2aWRlIGZvciBzb21lIEVMRiB0YXJn
ZXRzLiAgUGFzcyAtLWRpdmlkZSB3aGVuIHdoZW4gYXZhaWxhYmxlIHRvIHNpZ25hbCAnLycNCj4g
KyMgaXMgYWx3YXlzIHVzZWQgYXMgYW4gb3BlcmF0b3IgaW4gYXNzZW1ibHkuDQo+ICskKGNhbGwg
Y2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVdhJCQoY29tbWEpLS1kaXZpZGUpDQo+ICtlbmRpZg0K
PiArDQo+ICQoY2FsbCBjYy1vcHRpb24tYWRkLEFGTEFHUyxDQywtV2EkJChjb21tYSktLW5vZXhl
Y3N0YWNrKQ0KPiANCj4gTERGTEFHUy0kKGNhbGwgbGQtb3B0aW9uLC0td2Fybi1yd3gtc2VnbWVu
dHMpICs9IC0tbm8td2Fybi1yd3gtc2VnbWVudHMNCj4gLS0gDQo+IDIuNTEuMA0KPiANCj4gDQoN
Cg==

