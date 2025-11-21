Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88ADC789CE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168695.1494748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtb-0000HP-Gr; Fri, 21 Nov 2025 11:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168695.1494748; Fri, 21 Nov 2025 11:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOta-0008Uf-SJ; Fri, 21 Nov 2025 11:01:42 +0000
Received: by outflank-mailman (input) for mailman id 1168695;
 Fri, 21 Nov 2025 11:01:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3Zd=55=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vMOrg-0008Dv-Fq
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:44 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ebd016b-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:42 +0100 (CET)
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com (2603:10a6:10:18::24)
 by AM9PR03MB7202.eurprd03.prod.outlook.com (2603:10a6:20b:268::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:59:40 +0000
Received: from DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365]) by DB7PR03MB4603.eurprd03.prod.outlook.com
 ([fe80::7eb2:6a9b:fddb:6365%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 10:59:40 +0000
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
X-Inumbo-ID: 2ebd016b-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekG4XZGGWmL+SzsevWPGCrXkCmKvPeBYZ6ag9H0O29BXh1oeswnPRsmjIgWNtSjua68U6UE38BQuglL9jIOhpYh8Q78fH9M6zoaaXqQVg3GrIIt7gbdyMVqMLbjcB2AY4Siwd+yf3erIBRMDxomwht6HI7ghzRBuQGkmg5TxVG6ISAo8DyUDbgWEaq6vYF7tZEXl6e+pBSlJuz0SJ+NLfPeKHnLBlc3g8l9sO6D63FF25F24XLjDwTpZgBsTc/oJvOejq7/FWOR5PoXuUdym36v7ZDrXj8w6KPWGL5whQ+ripaLUSlEZUIjM42ylTpuwGL3VM1VBaqNWwfyq5SqRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4tC2GMrtJkMNkvOMYxL61qeZ8+Dt2rgTa8JqEiYuDo=;
 b=o99xzyp4Jtk9tt/HO6PVsGA5QlC9GMbbJpRLEvdhqxY1+Mmh5iNvYQuCmnKSs7ES8oqff5fE9E0rnZXroVP4GaUFzd9nz3Gj22d+guwgyhdSgVjn2qRx2oVwfubE1Gh2Ep3Obt+sSEjYdXBF6+R7bBbylSG9DrDfllX/Wzk9bagonDWkyI/MHJzEvgkx3VT8HHtXYnJrEh1ZCOe3h8ZEv+8rSkHx6bfe7MJ2gq1BdRIIk1SsbgG/mhPnJJyqe3KTeNGABlkT0NIxsZUBWY5nklQaT7fdqbbPQqhob9be8uvzOcKbw2iUG0tGk0hUghiDcht9z0vTDEQummbx0iAtsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4tC2GMrtJkMNkvOMYxL61qeZ8+Dt2rgTa8JqEiYuDo=;
 b=uelRtXzvuaSBEjL4oJSm2k4C3oO4yadJkK6aLtpyg1hwtBNylO+cYGvSXJE0vikfW8fFCdXq+HcQ7gRKhD56CQIM6dra8hu/GQF/mRWuxt/OG73z3yJ4Tih0L5dMjQotGpnQOcDxW8BXVPobnTCZYT3x+WSOHfiGrSu8VadjHlX1KjSpH2CWZjwPiTC4NXu+3KwCobatpXvuqYaKESVt2ApwHYvzaxQsjqOkqo1YiCgqvugKGnkI6FboidGp2hPNI2NECIDVDaJ5wpBqsC2yE1AFzLXPjXYD07ffM+FmxyN0p7V7UtqvQrXUg+h6oMMo0NiJAZ5GXfGF3GlQGWvVzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <aec6b5a2-4e53-411c-be2d-9bdb27d883aa@epam.com>
Date: Fri, 21 Nov 2025 12:59:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
 <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
 <991e0324-98af-4264-a527-703c72439780@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <991e0324-98af-4264-a527-703c72439780@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::6) To DB7PR03MB4603.eurprd03.prod.outlook.com
 (2603:10a6:10:18::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4603:EE_|AM9PR03MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: d96f653e-8bd0-4fff-254d-08de28ed117d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXY5b0kzSk5rNDFhTUdNa1paL2w5TkRmb2ZYVXdyNEZ0K1VUeVNhcHdFV1dG?=
 =?utf-8?B?aURmaFVsdWszWGJjT2M2ZHQrUERCQ25jc3RQT0Fha255bGxNTUpmTmN4WHpl?=
 =?utf-8?B?bDExK21ONHNNY1RXQ2lRQ25YUFNKSFpDemdBQVVZWnF0VHNaRWVQaFpRa3RK?=
 =?utf-8?B?TjF5YWs4bnIrbEJDM3J6d0JmQnlheVJLcnZVYlNkOHd4bWtDZXVKMHlqRGMr?=
 =?utf-8?B?Wld5aGtscksvSEQ4NDNqakEvN2JwQXh5V2g3T2R1c0FLWndlZXpYaHFzWXZF?=
 =?utf-8?B?bzZoeGs3V2gxeEFiaXFkVGdaYTEvQmpxRCt1TUlyVmFjbVduNWVzZExrNHJC?=
 =?utf-8?B?dXZ0UHBmay8wT1NoTUVlOTdBUmphclBSbElLTzZSeXY3eTR1SzNtUVhERGdY?=
 =?utf-8?B?VjhyL2tmOUFjUUJJMThJWi9Sa1RsL1h0c25ROWtZd2xhUVpZWTJsVkZmT2Ur?=
 =?utf-8?B?MkNzY3QvRTh1aFhhY1NOdDI3MVdVclQ2T0lhbWZ4Y01RTGpuZ0ZWN2MyRnVi?=
 =?utf-8?B?L25hcEpPNnVMUk5FdHJnUTZEWE1NcTRnM25SSzMwTUFLdGovYVpVSU5SeFpv?=
 =?utf-8?B?OGJqTkhQUmxCdi9iU1JRZk1XTTBldTZHNjdxWnU2bVlnckRpeUpoU0hUSFZ3?=
 =?utf-8?B?WUZJdHp3REdOQmJWL2hoaFhJZTZyZldyNUhTenJKWDhTcVo5L1NvUWhlRmF4?=
 =?utf-8?B?ZU9TMGxUcXlUNXF0dWxrdmdmMXl4TW9FejVGYmZPTGlsTGlsUDgwTXVpM3NQ?=
 =?utf-8?B?NHV6QWgrZFZuODk5ZU5OZEEySERPNEZKSDZsczg4Tnl0MlhoL2dCV0k1dVQr?=
 =?utf-8?B?aWptS0RKNVZtMnlHSzh1RFUvKzd1R3g5ZW9HTmFWMGhrc0xMNE92ZlZXL242?=
 =?utf-8?B?dk9PR1pESGx2TWJVUWR1WUNrdjQ4cjg2MTRzQ1pBam9wSTlQVy9nVkpETDd0?=
 =?utf-8?B?bnNKblorVTgzczZjRStRZ1J3ekhHWnBrazB2cytRZ24wQ1gvUDZkRUF6MXF3?=
 =?utf-8?B?NVUxYUtIK2JBbmRNU3k4ZWpzQjFPckppQStxUS9zZmM5emI0UHljTm8xb1R5?=
 =?utf-8?B?cmd6VmpJSHR2THM2aE5aS1dJcUNoWlNaZFMva2x0WlZPdmFZeDFFdHM0cUdj?=
 =?utf-8?B?WG5JQS82Qk1JcTJqUEx6ak5jYmluSmxwWCt0NFM5aGdFdVNFSUM5czYxcUE5?=
 =?utf-8?B?QWlpWXFuUXprOGFhM2JmUW5WeklaVDBWdVp2dUE4QW1DbitWcXFjL254SDRO?=
 =?utf-8?B?alJ3K2pzemNYQjl6eklzTXFpQmNld3BlaDlCMmpOOWNQTlZBdTJsSTRHOHFG?=
 =?utf-8?B?MzMxTkoyVy9OeUMzbURZWEVZdmxsUzc1ZmdVbWhGdVZDVVNJTDZRbG1PQXRx?=
 =?utf-8?B?MTNoWjFaL2J1SDhoYVU1QktzTDFHZ2RDekM3SjgrQXoxTyt1WEthU0s1ckZE?=
 =?utf-8?B?NmttZldBR2pnVys1NmJGTjJwRGpma3J5cERwZVpqeGZjM2w4czhtSHdsRlEy?=
 =?utf-8?B?cDBxRzgwOFBrNkRDTk0wNi9NYkphUEE4Mjh5ODhRVjNOL3BRZm1ncStTN1Qr?=
 =?utf-8?B?SGd0bTBkOGk4TXRjbUl3bHY0M2xzckJYREJYZzMxZjIranBuR1Izd2EwSFRy?=
 =?utf-8?B?U1N3a3NUdWRrLys1UXM1TGZaYndDL3FvMmtJYkdINXJYTnp1d3c5dUFQYkht?=
 =?utf-8?B?NkVmUnJvYmhoNExyU0s5dHRMcHpqVFB0anZUeFEwTmdiQzRvclUxWXdyeXJK?=
 =?utf-8?B?RFppSGRaZ093OFpKTGJHejRuVk5YL0pkT1VwWkV3SmFZOU5acTRoOUtGcnUx?=
 =?utf-8?B?dUxRYXF5SHMvSmhaa1BYSGJmZ3ZEaHRyeWRjaGFHa3pieFMxWnZOVWdxWm54?=
 =?utf-8?B?dWRva250QU10OVJQMks2MEJNZ3VxOVdadGpYeERRdWhPMUhoc3BDNlNpZlIy?=
 =?utf-8?Q?We6cqpv1W7RxuORxLPzms45lgfIxKBMf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGtJWmkxMHJsYkFuNHZ1TDBzODdic1pQWXE0MHVNTDBWZlQzUEFJck1RYUhm?=
 =?utf-8?B?UzJ5QUtyZHcrOFY4SWt6WW5PQmN3V2s2Wm1YcE02bmRhYTJPdkpScHJ3dHlE?=
 =?utf-8?B?blpiNmFneUlQeVlNZFRUS3l5SFlUM1VXb2NKTnEraEZsZzFuK21JajR6RjNC?=
 =?utf-8?B?OXZlUy9TQ1ZmdHpFSDJmVCsxd1U5cmFNNmx0QzUrWVRmTWxKMnpoZDd3U3Ji?=
 =?utf-8?B?T1lhc2VLdXZGN2Y0OEtLRXdpZE5kYTRDRUdYa1FLR0ZUdm5aME5jTGlHMm83?=
 =?utf-8?B?QnBsRktkamQ2cVJaNy9oY2krU1VTV3lJTk1VSmduMWpvZUNkYTd0NTVkRHR6?=
 =?utf-8?B?T3FyUFpITVQ2VDhxOERLRjlsS2FZbGtjNFNjdC9rS053Q2pQOFRNWkVrK0FU?=
 =?utf-8?B?aWFGeHROK05ZVFpGMHhDeVZMUFlPSHZpN3NabDNLVXdtMTlBRG15U1NlbjlY?=
 =?utf-8?B?bWZzYlpnajNOVzFBQmFOUWc4TTFsMWRXSEFZaTVQWVViL2NWNGVQd2FzRk9x?=
 =?utf-8?B?alFmSE9QQ1hGQUc4SlJNSEVNbzJpMnM3V3JnUFpDQk5lVjZZOWQzMlBCcWwz?=
 =?utf-8?B?RGNKZExCUnBoVVJzQTlLZE9kRHZ2QzVVcDgwaUowM2FYbTUyVEdrYmUwSkI3?=
 =?utf-8?B?ZUoxc1lJa0RDT1JTSWphUjV1aDdoZnRDVlNFOXFLQzNqQU90ODFIaVF4Y0pw?=
 =?utf-8?B?NjdLTXZ3WHJ6a2gwUFNsK1BMQnRIdHY3bFVhaWtibkIrRjBFNWp5QkRmdC8r?=
 =?utf-8?B?ZEx3MVBXSlNXcHZYYjJXV2xhVlc5OG16cit3MUl5eW5zcE5PUVJXMENublJP?=
 =?utf-8?B?QVk2SFRKSU5udnR3dnlXRnQxQ3ZUeC96UUw3bzhHUHpJWW5OYWk2ZVFFRlln?=
 =?utf-8?B?QmlmOTc3R01ML1F4NitXUlVhRjNOMEI1MjI2UnBLN3ZqcnNhV1AwR3dUTzN2?=
 =?utf-8?B?THg0Z3p1R09BOW4wV1ZoakloNVE0Yy9KTm1oV1BDT2RTRFhBY2FTcVZEM3ZQ?=
 =?utf-8?B?MlpIcHJnS1JsRks2T1MwV2NVakJ0WXNTSTRKUFM2MWwwOEdkblFSemR2SkFB?=
 =?utf-8?B?Z0J4UWZBVWU1aysvbjVPR2RaRTUxZDhEb24vUGZHV0ZWMXh0TklkS3pGN2tt?=
 =?utf-8?B?QWROMTVaNkJmd3pidnR4ZGxmK213VmwvTDAxQlhoV0UzMEJKK3VzV0czUlVn?=
 =?utf-8?B?R3JZVXJBMFZYMm51bm8zVTAwcjdHcXdWei9wOVQ1VlNja1RLZkxBckVHbEZE?=
 =?utf-8?B?U2VvOFJkM3phRTdDVURrSnFZbXpDVzNPNXgyc29EWFFJV1ZqU0wvb3BORGli?=
 =?utf-8?B?R3FRczdUQmRhUSttcGJ6L1VZSXhaVm45c2dzNlhLakcrZUNIMkkxTkFOR1dp?=
 =?utf-8?B?UmZkd2FSakhjRFFONEM5MkZtbWlsMGxTRWZIQXJmZTNjU1NTM3FBaEpnOUZm?=
 =?utf-8?B?NjQ5WFhOTTNGSHR1NHc5Ujh1K2x3eXNXNWtQZXJCMWI3ZGdITERRekJyaTNU?=
 =?utf-8?B?cjRwbk9RTUpkbXYrV25BL0c0QXBWL2NMTFVMMWZGbVlkS1FicFhWREtXRGUw?=
 =?utf-8?B?RUNmbHdpbUtvK0syU0JvTzc2L3R5NEl5MGJwS1JaM05xaGlFVklUV3A3V2xp?=
 =?utf-8?B?YVRHRnBOTm43SE51aEozYUpCeWNDaVdCQ3JIV0V6K2w2OXA5VlkwV1VzNkxn?=
 =?utf-8?B?QjN2ZE5taW5ONGVUbVBKMTU0RXZLR2hGU0FHdENlakNOa0R1NzBjZHRURVN0?=
 =?utf-8?B?RDRYSkhmUXgzVC9zRkxlK29KcUxIdmRONzhITTZqYjNLZmF5UTUwcTVKQlVl?=
 =?utf-8?B?UGI0UGFGMEtiOHFOWG41N1lzU1lDdEZwZmJ6ZGRoVTlHOUZ5akloRHYvWG80?=
 =?utf-8?B?VEltMDRFQW1md2FzVDdFUUFPckpFVWRhMzZpa09vVGgrWTluTkRZU3ZPOTRm?=
 =?utf-8?B?di91WVFPbEdYd3MzYVBWR3FNZ2dmQVZSS0dqT1VyMjJVVVBIMXM4alI2N0c1?=
 =?utf-8?B?bkFNUzdXMXFKTDdTUVhuMFBJejBxcUVlWnVzR1p2cjlrMjltaVJOTENZeGdj?=
 =?utf-8?B?cHdCQUFVUFNUUmE3TE9VamcySi9RVUNyZUMyN2YyN3MzdEw4ME5tbkNzeTc3?=
 =?utf-8?B?VGNuVUxzWjhOSTI0TlFSZHptdnVNTldkMlF1Ni9rQnF4SHplbmtGbUNjRWUw?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96f653e-8bd0-4fff-254d-08de28ed117d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:40.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cv19yZohzPWaM2MyTcssYU0Ep6UPxP6IFJh6j8Mklmye4kfT7dhq7vUWZEA/U7ZXto6v+wqpVJCZL3NzcT0pmf/Nk5/KlOiKZUXvEcRgIYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7202



On 17.11.25 11:34, Jan Beulich wrote:
> On 17.11.2025 10:31, Jan Beulich wrote:
>> On 14.11.2025 19:01, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Now all libfdt features are built-it unconditionally, but...
>>>
>>> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
>>> nodes, so full libfdt is not needed in this case and minimal, RO
>>> configuration can be used.
>>>
>>> ARM - situation is more complicated:
>>> 1) ARM reads Host DT (fdt.c RO)
>>> 2) ARM reads passthrough DT (RO)
>>> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
>>> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
>>> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
>>> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
>>
>> This goes too far, imo.
> 
> The more that, unless OVERLAY_DTB=y, all code and data moves to .init.*. Is
> coverage in in .init.* really of as much concern as runtime code/data?

It is less priority, but still is. Any way it is unnecessary build units (build time) and
increased binary size.


Actually, I see interesting behavior - when build with CONFIG_CC_SPLIT_SECTIONS=y (CONFIG_LIVEPATCH=y)
the libfdt code is not moved in ".init"

0xa000027aa10 T fdt_ro_probe_

0xa00002c0000 T __init_begin
  

-- 
Best regards,
-grygorii


