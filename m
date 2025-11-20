Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C404AC73070
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 10:09:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166618.1493108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fQ-0000n6-FF; Thu, 20 Nov 2025 09:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166618.1493108; Thu, 20 Nov 2025 09:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM0fQ-0000lB-Bb; Thu, 20 Nov 2025 09:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1166618;
 Thu, 20 Nov 2025 09:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vEGo=54=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vM0fP-0000ko-7E
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 09:09:27 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b660b1a-c5f0-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 10:09:25 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5072.namprd03.prod.outlook.com (2603:10b6:208:1a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:09:22 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:09:21 +0000
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
X-Inumbo-ID: 9b660b1a-c5f0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY3pp3KGq2x5i530EyvJPlUOEY9Ql9q8yyecWEhUvSLDXRMshLa+zG8myR9gADzCn6JQcqk2H3PLagLmtU1wFjs67GSBGZt7SMYRNdEv0RikyprjNeTK8KQDPPdRPZBMvxhyBiUNTangL+2GeH8UYtA4nyIdak029jbzVag9o91TG5TpgmKaRSMINM/2JJfTTG50fLXpKzJM/bdbmqGdBTETc1l2yMpdUxHA+d69s/or6jkSnpcA8adDoCwE0UVgW9Ztcu4vUdDVliGBmi7tLnevq9v2qD8nzHchNrnaTL2db2sD5EQacEs1nHFgDhkHSY663gvpHLHY0XuXUvyDRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+3Za9LyGvxYALLsg1XgahqG2nvkE8DL7H3BT/GA2ww=;
 b=CDV3lOVpfTnH76E7KGr72V/LsoUuhy/+1EocokOLOTfA/a1AEttgbtNyEr18xEPaf6PVe/i3UQ8BqiVLOL2FmxBoXI8CBsxqO7GueJLuSr1fFPgVEw3AiiDRoliSP2HZgYsQ4pBWtghy0hpZkI28iiiydU0vowWYj1Utr4onUSmji+G/zBezvRqZsXyxsX/WTMkZG8f4fp0eD/QW+MKnZMrEGRAVRq5ygKnaFvQ2OS6nRd0qW0eivoYnkhlg8bGgMnmP0xhYrpzaSSl8RVKuYuiKklgFoNGRGP5S/Fbbq+qGNUMZylR8LTYAjtaqPyy0vBlgI6oe3NjHeS7GIl0nIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+3Za9LyGvxYALLsg1XgahqG2nvkE8DL7H3BT/GA2ww=;
 b=uso4raBSc6TlWKTQ5oR7y1gPj5r4W5pX+HEctwfQU6Ue6twSAchbfVAp+ieJ1Y6chKouLtqCDECEAMbMnWIHa2/S4LAe6dAidGgAKOOcafjC4V9gPDhkO8Dc0W6ukWueYPpabLWK9qmLWakEef5Rb+z8jDt6emoWSluY4DaG0QU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 01/12] x86/apic: remove cpu_mask_to_apicid hook
Date: Thu, 20 Nov 2025 10:06:26 +0100
Message-ID: <20251120090637.25087-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120090637.25087-1-roger.pau@citrix.com>
References: <20251120090637.25087-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0018.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 033ef387-be79-4a73-43a6-08de28147e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ym1XeVE1cG5UYWxWTWdjYkZ5eEZNMWhMMzhXVXVEeDJjVFVSVWVzdm9aRmVt?=
 =?utf-8?B?b2YrZEZkOGFiYWpjWjV6elZ5Z0lwRy82bUNtcHFsK3VnNFpsUGVQVklkdHN0?=
 =?utf-8?B?Um5Wekt4aG9OQ0VsTDNJenV3Y3ZvQWQ5VmJWa1NXQUtadVQ1VU1wOUp3UXhx?=
 =?utf-8?B?UnZuYWZxOG81WUtxbnZtdUYvVzFoY3dOSlZHVTJsbVlPUlJFcWFTM1BnODht?=
 =?utf-8?B?VTFkamdRS1Z0VVc4bGZOZHUxVmFaT2JLQWU5L0JURGwyZTVOODkyZXNVd0xx?=
 =?utf-8?B?Z0dERWxmbnByR1A2UG5sL3AyaXBEV2l1WTNpSGhxcE9NRENPWkRiV2FPRytI?=
 =?utf-8?B?b0dUa2pLeWtVUXJtNlIrb2RoWmpwZWJDd3dWU1EwSzBHejgwSnRPUXNEaUdV?=
 =?utf-8?B?S1JFeUhoT3VDc0hiV0tnQk9zdHNxMzd4NGVRbmhGQWNuZ1cvWWZEZzh1ZkhK?=
 =?utf-8?B?cWhXS01GNkVRVFhEQndkOHRTeWgyN1c3QWtTR05LalBOdlQ3d2ZDU3JVSHZK?=
 =?utf-8?B?blFqcXhES3pnb0pvTzllTE0xTENkTDNkYm96UzZRUlYveEdvQVJ3ZEVZcyt6?=
 =?utf-8?B?RURySEdWOTVHY05Oblh1YnRTVG9hWkRDVFd6MVZOR3ZYY0NDQjdNVzMxTGF6?=
 =?utf-8?B?emVvQ3J2M0tnVWY1dVlXVmxsaCtsaFFWQ2U4VEJ4TWxTOXVpUHhhcXZJSGdz?=
 =?utf-8?B?a01wakc5aC9jRFQzSDZhNmhCWVdxeWtZbDlPQkEzRDczVmp5M0tjWG1GSnly?=
 =?utf-8?B?K2xIRzc5N0lmT3drcTRJM2hlQ0NxZVBYUi9FN3NaNlZVeUxtTklndHJkYVBG?=
 =?utf-8?B?ckYzVUhSVXpjZ2YrMUk4VXdzUUg1SVd1ak9PSjc1eExQd3J6MWdPRG8zQS9S?=
 =?utf-8?B?dVJBcDZlbGlxS0J2ZlFnc0lpbHc0ajhKd3B5MjdvdzBpYnE5WUVlMWFKTzNF?=
 =?utf-8?B?Uitpb1hpVjZhMVFPSzZyUG5Cd3RvNmswbERyOWI5cXZlRmw3N3p4SVdVeGRV?=
 =?utf-8?B?Vk9XY0ZKSHE3UUxEdGJuY0dKSjlQMSt4TkF5U0RyWnN4TlRsaGpnL1dkWDZ1?=
 =?utf-8?B?NFRxS0xRdHh5RW5Ia0I5OER0WXMyekR6MnJTdFdCNXRxWTAzcjFpMTYxaDBY?=
 =?utf-8?B?em9HVUZoNWQ2M1pkdmFNejY5YlM4Y09RcE1HOWlHa0ZCcDdCUnkwYktjVjV5?=
 =?utf-8?B?Yno0YWIwSi95aDRyRXpKdzAvOHpkVXVUdFVCcmROb09ITUZybEdUK29KQ1hn?=
 =?utf-8?B?UExRNGdBQ3lVQXBFV0tWTEtrc3l6MDhtWWVVMUhUME1VTjhqWEFHaUVJM0Vh?=
 =?utf-8?B?dWpuVnBYdFNjSnZrTXJWbHhIR2p0dS9INWJFN3FvQU9TbnlJZUY4eW9Nek8w?=
 =?utf-8?B?UFZHZTc4RHB0d1UrTU4vaTA0c3h3K1dWeGdhalVxK0J0S2R4WGlRQVBrMEQz?=
 =?utf-8?B?MUlNTm1NYTROVEMvaVZHUnVHRGFveFptaU96eUVmbklQaGMzVlo5bnRRRWwy?=
 =?utf-8?B?UW5lRFcrRStyQ1FnWWllUVJ0OE5QRk9KMjVQZEJYcTBGdU05OGZudk5oWEVq?=
 =?utf-8?B?YTBsRU5ORmM3dmpJbnRlc3Y4RDlmME9ITlgyUXMvNkZaSWVUVnFMaTgyVFpY?=
 =?utf-8?B?L01Bdk1PcTQxeDRqUFFtb0Vvd2c3VUp3Sm8wRE95dExqSGlyYXBGZW9SUUdH?=
 =?utf-8?B?UjZNdkNIdkFLc0xYNmdLdzN2NG1IZjMzQXdsTjhha1hqc1ltZ2NPR0Yydmp3?=
 =?utf-8?B?MGdVcUx2YUFreS9WcTAxYlR2UnBSNlZqT3c3czd2c2NaTzFrQ1VaTUF5anlP?=
 =?utf-8?B?dTdjdGYvODdOcjRBY1BnWnl4MHdjeHo3TVZDRnBOR1VGQnJaUzB5T29wTnRW?=
 =?utf-8?B?THpERkM2SnlOWUhoYmUwSituSE1Wa3pIdmpKRmEvc1c1UVJhT1RRbHBuSEhB?=
 =?utf-8?Q?WEbzQ/moflrPrMafMbkPJypKRXIkThmU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2lYZVRHMjdLWXVibzBKVnZLdmtJd2VkUFJlTEhEOWY5UURiZkJGRmZmRFlQ?=
 =?utf-8?B?Z0JCMEFVSThGV1dFZWZvRmRBMFFUOXhvS1pYb3VUU0llR3NYL1pqZUhWSTBY?=
 =?utf-8?B?d050aHBPV0k0aEtoaGFXNGtBcDYwd2VITkxzSVZtOWN5dDZCd3d3OHY3SVJV?=
 =?utf-8?B?ZS9QczNKYTlyVmdub3J2eklqd0ZBTmhoZ1lBbDMrWXNVMXZvT2tDSjN5UzNm?=
 =?utf-8?B?TjNZTDhOYjV0S3JseFA3QXNLQ2UxWDBKcEJCM0JmUUVuZHdDQUVCb3N1NnJr?=
 =?utf-8?B?MmJIN0hSQ0ttTFJCUWRsUDVqQ0FBUko1Um5aenFTQk5SV3UrUmlDdUIvMmJm?=
 =?utf-8?B?YkFZN2IwK2JOL3l2VFJrbHBncTRaVjY2b1BqYTh5bmR5anVPVXRzQ2h2VWgx?=
 =?utf-8?B?UTdxRnEwTDI3WGdZRDRaKzUvQS96d2x5NFVwOTJrMGwybUgzd1hrZ0V3NjRn?=
 =?utf-8?B?ckcvbXUrbDFwQm5VYUlxN083RWM2UDR2OHJHekEvcXlxZ21YVzFzejhheFUy?=
 =?utf-8?B?MGlrckdhTTExdUFtRWtya1ZCa0NvMlVXQ3luSDN5QmtTVjY0Y3I3RUlUWEh5?=
 =?utf-8?B?UjFUNHhIM1E3eW1JZ0wyRUpmbjlDWjNrajRHUFNxNWovUkJLMlNCM3lMRVpR?=
 =?utf-8?B?aDhtaUtFSkozVUxlRDFHK0NPaEJNN292QVdNV3I4cENZUHQ5REkvOXVaNklu?=
 =?utf-8?B?YmVjcDNIdGhQMDBqTlNzQ3k2M3FrYmRBbG1IK00vM1gwdTV5NFd5eFYyTmJr?=
 =?utf-8?B?UUNUMUVYb2lHbFBqUnNyTXJMZkt4NkQxK1AyUUZBWlIxNjRLYXZ2b1k1UlZH?=
 =?utf-8?B?YVNhdUlWL0c4TnNycXpwcmd2SHdSdGdxTmFIZFdkSjY1VCtQREo5L2REQTZm?=
 =?utf-8?B?aGQrRDBFeldjNnB5Sk1ZYW10NDlNNTMwWEtqcWd1dmJVczVUTEtaZTBPUXl4?=
 =?utf-8?B?MDRVSXgwdXFGTHM2SjFncnV3ZmZuRmYvaGFTU1RmUjZ1VlQ2cDFpYW4vcWVx?=
 =?utf-8?B?NVJnWlRpV2ZQRnRWZG5WNnRLSmJKM0p2b080T3E3Y0I0UktsbEE3VW05UFNM?=
 =?utf-8?B?MXlsTy9lSEtMbGNvTndHbnpKRzVpYmpIdllaYXJhbXlBdjduUCszaXE3N3dX?=
 =?utf-8?B?OVMzRnZUNDdqYUxEOGg4NUh3T0I3ekN1cVlxOFJXVHNTZWZTeE1aQ21XM2JR?=
 =?utf-8?B?R21aYWF4MmtwcS9Xbk1hSTN3aWdHQnliTVE5ZGc4Q0FldlRMUGhXZVEzQmRz?=
 =?utf-8?B?ZGpKMmJMNzYvWlpvdWgyQTQzUVRQeW52TEhwL0xZZ213bWdWQnlQRnRIWHNO?=
 =?utf-8?B?UzZJdEg4WmlpMU1VcjRlR0VSMmZ3MnZ1ZnZ5aVRldjVualJESTJHTitWUllK?=
 =?utf-8?B?Yi9qc2NRY3JLSDZTLzhkdjZaUVVmTEhKK1B2ZnMyYk5vVjFndFoxeWRUMjBh?=
 =?utf-8?B?MjA2cGtaUUY3ZXE3N3Q2Z1FhOVhleVFMTDI0bzZVR1ZtTlNiZDI2anBRdjBh?=
 =?utf-8?B?TUIwTXZ2QURVYXd5UCtKTEkvVUFuN3NmMU12cmw0YktuR21WTndoSDBWSDBT?=
 =?utf-8?B?SFd0bjk0VjhGRmI2YTUxc3RtT0w3L0NjZ3NjRndXL0ZHcGZldmZVaWpQZlZw?=
 =?utf-8?B?WHlZNU9pK3prZnVzVDR6WktRa3N5Z2VFWGxuNkVTbS9YdTZhR0xGczBtQWM4?=
 =?utf-8?B?M0J6YzZqRytMOUM4bWtMQlJUUHczOEwydmhGUjlsakM1ZlZqc3FDNDVvcytk?=
 =?utf-8?B?dUd1ZzlrMGl2ZDJqdVlFb3k4UXpYN0xUMmkyOUlnOWJkQlI1Rjg1VG9FbHAw?=
 =?utf-8?B?ZWlZRWNvc09ZWjlBekE4eGNmRjZkMlhUV2VqTDd0R2ZYSCswL2NjS0VGdjVy?=
 =?utf-8?B?ZjNYelM2WS9HZDVBYllVQ0pZSjBaWkw4b0NsTU90R3k2M2JVVEpZYzVYa3dG?=
 =?utf-8?B?eEVtVGhnaTN4WGxhS2F2N2J5YVdrQTB4SDN6bGhsWGw1SGI0cFZtWHRXWmJy?=
 =?utf-8?B?Nlp6VGJmYUk0ZmtxRGNiZTRxelJibDNuaDlMY1FjS0wwZURYcDEwNWVORUMy?=
 =?utf-8?B?b2I3V2pYOWI3WDJZcnhwVE1TdFlOYkhSdGxTRXA3TVZQcjJKTm90UHhxY1J6?=
 =?utf-8?Q?c6gUWrQ5sujwUcAJ2qzEWtJkG?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033ef387-be79-4a73-43a6-08de28147e3d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:09:21.7137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DgPSVGKeoA/xB7v9KZ0pnMcftCfgFHETVgfkQaJN7L0n/qZjHxq+pBDGQE2wHda//0xN2p7fi+DlM1Uv0mByQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5072

All implementations use the same hook.  No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/genapic/bigsmp.c      |  1 -
 xen/arch/x86/genapic/default.c     |  1 -
 xen/arch/x86/genapic/delivery.c    |  2 +-
 xen/arch/x86/genapic/x2apic.c      |  2 --
 xen/arch/x86/include/asm/genapic.h | 13 +------------
 5 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/genapic/bigsmp.c b/xen/arch/x86/genapic/bigsmp.c
index ddb3a0b5d727..066feb4a1755 100644
--- a/xen/arch/x86/genapic/bigsmp.c
+++ b/xen/arch/x86/genapic/bigsmp.c
@@ -48,7 +48,6 @@ const struct genapic __initconst_cf_clobber apic_bigsmp = {
 	APIC_INIT("bigsmp", probe_bigsmp),
 	.init_apic_ldr = init_apic_ldr_phys,
 	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
-	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
 	.send_IPI_mask = send_IPI_mask_phys,
 	.send_IPI_self = send_IPI_self_legacy
 };
diff --git a/xen/arch/x86/genapic/default.c b/xen/arch/x86/genapic/default.c
index 16e1875f6378..ab9a292464d6 100644
--- a/xen/arch/x86/genapic/default.c
+++ b/xen/arch/x86/genapic/default.c
@@ -18,7 +18,6 @@ const struct genapic __initconst_cf_clobber apic_default = {
 	APIC_INIT("default", NULL),
 	.init_apic_ldr = init_apic_ldr_flat,
 	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
-	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
 	.send_IPI_mask = send_IPI_mask_flat,
 	.send_IPI_self = send_IPI_self_legacy
 };
diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
index 15100439be05..5d105e848502 100644
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -35,7 +35,7 @@ const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu)
 	return cpumask_of(cpu);
 }
 
-unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask)
+unsigned int cpu_mask_to_apicid(const cpumask_t *cpumask)
 {
 	/* As we are using single CPU as destination, pick only one CPU here */
 	return cpu_physical_id(cpumask_any(cpumask));
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 58157c217ee8..f4709ab92950 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -142,7 +142,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
     APIC_INIT("x2apic_phys", NULL),
     .init_apic_ldr = init_apic_ldr_phys,
     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
-    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
     .send_IPI_mask = send_IPI_mask_x2apic_phys,
     .send_IPI_self = send_IPI_self_x2apic
 };
@@ -162,7 +161,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
      * hence are set to use Physical destination mode handlers.
      */
     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
-    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
 
     /*
      * The following fields are exclusively used by IPIs and hence are set to
diff --git a/xen/arch/x86/include/asm/genapic.h b/xen/arch/x86/include/asm/genapic.h
index 04d3f1de7a1f..6d979279bd2b 100644
--- a/xen/arch/x86/include/asm/genapic.h
+++ b/xen/arch/x86/include/asm/genapic.h
@@ -25,7 +25,6 @@ struct genapic {
 
 	void (*init_apic_ldr)(void);
 	const cpumask_t *(*vector_allocation_cpumask)(int cpu);
-	unsigned int (*cpu_mask_to_apicid)(const cpumask_t *cpumask);
 	void (*send_IPI_mask)(const cpumask_t *mask, int vector);
     void (*send_IPI_self)(uint8_t vector);
 };
@@ -36,16 +35,6 @@ struct genapic {
 
 #define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
 #define init_apic_ldr() alternative_vcall(genapic.init_apic_ldr)
-#define cpu_mask_to_apicid(mask) ({ \
-	/* \
-	 * There are a number of places where the address of a local variable \
-	 * gets passed here. The use of ?: in alternative_call<N>() triggers an \
-	 * "address of ... is always true" warning in such a case with at least \
-	 * gcc 7 and 8. Hence the seemingly pointless local variable here. \
-	 */ \
-	const cpumask_t *m_ = (mask); \
-	alternative_call(genapic.cpu_mask_to_apicid, m_); \
-})
 #define vector_allocation_cpumask(cpu) \
 	alternative_call(genapic.vector_allocation_cpumask, cpu)
 
@@ -59,7 +48,7 @@ void cf_check init_apic_ldr_flat(void);
 void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
 
 void cf_check init_apic_ldr_phys(void);
-unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
+unsigned int cpu_mask_to_apicid(const cpumask_t *cpumask);
 void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
 const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
 
-- 
2.51.0


