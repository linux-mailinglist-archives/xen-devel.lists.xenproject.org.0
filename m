Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6386C690C7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 12:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164633.1491547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJn8-0001Qs-0M; Tue, 18 Nov 2025 11:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164633.1491547; Tue, 18 Nov 2025 11:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJn7-0001Og-U1; Tue, 18 Nov 2025 11:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1164633;
 Tue, 18 Nov 2025 11:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLJn5-0001OW-Tk
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 11:22:32 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db416e6e-c470-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 12:22:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5296.namprd03.prod.outlook.com (2603:10b6:208:1e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 11:22:22 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 11:22:22 +0000
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
X-Inumbo-ID: db416e6e-c470-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvvouXBMTC4ZiATq9wZZYxkhnAMpsxJ1K31mF/rEEVqHIoYMHOiFbvNF0UFkHwTfPnbsOjcFf+ENA8zdrF8P4OoHN3ZAtbigaouNM5zgF/y3I49fqWswpFlORsoE9bLXytAkz6+MsqxTZ0Z4wAkGgQ/xS8ykmO/hgUykTW5nhzp45/FMAR9TknAsA710YGLQjGtGKcUnGsnFRgmAAMsfJyEywaqCVy3kRvZ8+5sFZRi0GLNT828MSWGpjCASTxzuvyJh3JNiTwEOwd9M4il/Qy9HR0EEjP7mFGRPLw5SVjq3HF382thp82E7HWrOyYqQ6XY96oYywE7kyuY6HvS14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgDFj/25KmJgR3KOsjti5byDhHZussCcQ7HUkUMULjo=;
 b=lbTHbISdSoO/v7WM20KhHp1/lGstGvhd8rxfpmVMoMu9+TRm0FrX8Ct56CZoMKenvpL7QbmETh1zaWrX3NXlUHJk0YchuMhMAXC97REB+oXoJcWArKLnkbBVOcWb+58c/sc8Vcrhf93ayQI76rJrHDFY/443NNURlLTcLdL65Q+QGPSpyQ8XE2lpm4wD4+hOioBneu+GbLXkPE9gInCI5OzJACQQTj+r65zOHzKNMoyGG7WXFBbsAGGH1yEvLHIFGFBKhCFm5eSlNpWSgGqWGvvUVfgGZLK4VD4S0Ky9El2kFN69uW6j4ij4mmi4MbuTR/z1Y/0rrbs2/ix8QBHErA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgDFj/25KmJgR3KOsjti5byDhHZussCcQ7HUkUMULjo=;
 b=CQk22piD/ngK+NMOwWwXviskAhopwVarlhd1/qwLq9PuNS8n97pMwMEglBoIsmekm8rnYvMekoHQABhxULHwQFpCFDYoah7ogn9pF/Fbu9gLnEG0BA6qeu8BqMDnfsC+2a9As/obvhP7GKgmPQwn9nMN1yCcqA/dWW3qgLpXP8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d3056c90-8497-41f7-b571-fd598bef3238@citrix.com>
Date: Tue, 18 Nov 2025 11:22:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
 <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
 <035a9514-9a7f-44ab-86a7-61deab37f7c7@suse.com>
 <DEBQTGUHGDTP.QF2PFIK6CKUZ@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DEBQTGUHGDTP.QF2PFIK6CKUZ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: 6402e2c6-dc05-4dab-c593-08de2694be1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OE5DNW44QXJuQ0F5NmljREZncmtKVXJMZWFBNFRJV0pSKzlFbVdFbGtDc0o3?=
 =?utf-8?B?V3pJN0hKT3pBcmtSV1dmbWZOZzVwNmlpN3VWNVBBSFFVWU5zYlg4M280U0Fh?=
 =?utf-8?B?T1ZCV2RoK3UzNi9TdHFSSEZZT1VqdUxwZ0R0MlBvTU1ET21KdVZmTXBqYkps?=
 =?utf-8?B?RitBOEhDMmh0UTY4NXdoY21KMU5QaE11R0V3SnNWeWRnNXN0bVVoc0kyVmky?=
 =?utf-8?B?ekJORGw1eHVQYlhLZ1R1N0E1b2JrU1VtVWs0cllyS2ExS3hyaHJhSXozY2l5?=
 =?utf-8?B?OUlGTDF0Yi9ZS0IvSzhYbzdKQzNpUlo1czJrUStMU3A5WXc4QkhzU29KR0VJ?=
 =?utf-8?B?bkFnWnZNLzQ2YkNiZGtLeEx1T1ZSZS85RVNrWTh0dk1rRDlpcENJa0IrTXdR?=
 =?utf-8?B?Y0NkK29USVI2elBFLy9qeVVzZHdTbWFuWHZRWURBUTFMdWhMcDJIS3ZDZmNG?=
 =?utf-8?B?dmlSQ1AwVUNkL2djQzVRR2FCQS9SL0JHN1UzMzlzZWdCV21qbkppU1VRc0pH?=
 =?utf-8?B?Z2krVytrUkJJelJzY1dxTEpCVjhBT2tHNmdvR3JnOHZxNTFIZzJSUVAyeDFh?=
 =?utf-8?B?ZXd0a3hmRlg2UkgySDM1MnNTS0ZzQld2T3ZML1o0aVlzeEt1eU9sOTVCSnlH?=
 =?utf-8?B?Z1lwRDkzQ3dKWUgvYXU2ei9UamZjcWVKMFcxTEV6VmY0WWt4ZCsvWXh3eTAr?=
 =?utf-8?B?bHVLWWFXUFZ5ZTVFaS8vM2sxMjBhSGoxb2EvY0NLRWV2ejJCTXl1VXJCVmR1?=
 =?utf-8?B?TWZVWHRkVFNPdkJzWVF5UWdmSXlSNGVHODRPNUlVc2FndnJQNU5QWVptZ3ky?=
 =?utf-8?B?c0lOZW1pcGU2dkNWSUFYdk5ZVkVCcXhGNG1vazJPMGdmNHBGNWpDR3ZKU3NF?=
 =?utf-8?B?MFN5N3hqWUZGZDVPY3ZjVWN1VWZiN2lhbGQrcFNZbEVKajVEeTBEamVsSmZY?=
 =?utf-8?B?Q09rRTl3TWpjdTJmTlNoWVNtb3M1SStOMXdCMGVZa2dFNTc1dnFldDRIeFRJ?=
 =?utf-8?B?TGM3RXhsaGpzVU83UWdLZFpLbFlXVFB0QWVkNCs4eWg5VFdZb25IcDIwZGJw?=
 =?utf-8?B?S1IwK2JjdUJ3N3dSMGttT2FvTUxnSnRvWndqNFN6RzgxdmhNbFdxNlpreVkr?=
 =?utf-8?B?V3prem53STdQVjhJSElvdnpkaE1tUEdEMFY3T3NVdHVSSC9sT2hBSStpSzNK?=
 =?utf-8?B?VG9YSzVlWDM3Vjd4MU5WSUo1ZHg0S0g5MlZhaHlFNDg5NER2YktkcDE1UCtD?=
 =?utf-8?B?T1BCN2FwK2ZOdGszYTk0eXNlV09JSVMvUi9jWFFPNlV0NmNqcE5PQmhXcXBY?=
 =?utf-8?B?MWZvaHdFYkNDenlhN2VBY3hOcW9UT09DNDFrZm1BUDJ0c1NHK0RKSW5YVm1X?=
 =?utf-8?B?ampYODdSQjE5WEpYbUxqR2oxa3hFNTZCUDM5WEx2ckJrWjkyZi9UdlJDRnVY?=
 =?utf-8?B?N0w0VXpkN29LVHFpUmxPTk96V2ZMZkt3R2hkSDQ4WWFEOVRtY1FSUTNzSjNO?=
 =?utf-8?B?dFA2cm0yM1VJZVlOb3ZSaHZsdVRkMnhxb2wyOGhDR0ROTk1IdHVtcWcyZjBv?=
 =?utf-8?B?UXNMZys2MU5PMm5nVXdmcFVwNFRxSjlRQXlTUm51czE5Ynp2YmhLTVM1Tkgr?=
 =?utf-8?B?TWxTNE5QSDNGTGF2eFZGaVRSU01iT3EvLzROck9rRjJzaUdtdmg0ZGlUQTR4?=
 =?utf-8?B?SzNrUS8zdXZyUnRuMzVrREZ0OUIxMlRCa3BjV1VZUk1WbDQxTjlPaHVMS1lm?=
 =?utf-8?B?TGF5ZTlubVVhN3pXMktqalNVSFk2UFg3Y1YrdzAxdktBcFR5Nm1rRUFSdEhw?=
 =?utf-8?B?MHlWSDFPVVhBRkc3eWZ6eHhBTzAydWd4OVR0OE8xeHByclk0SnNNR21xYUxy?=
 =?utf-8?B?NC9JeDNKelU3V3lFMmtkZE01dDFxalRqby9Vc3NoMC9qVFRpSWNEOUZHZ216?=
 =?utf-8?Q?k4xdPbCMHLjOz7xuVpZiu2yy6QB9Ki+g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk55V3V0b24yMGVEckJZWmR4WFpNVERsVnk5dnBQanBaSGFkVlJNRXgvbE5J?=
 =?utf-8?B?eGJHSEZ6RTlBMFlzZWk5L0NhbVlpQk5PcHlSWkJ5TTg5b3BWUUFOc0dPRFhz?=
 =?utf-8?B?UFdyL2tJdTkvM3VRTmdyRXY5VWpGaE5VaU10ZHZNTmMzU3hZQ1l2cTFTTHI5?=
 =?utf-8?B?Y1grcS9tdE1MN1duUDExMitDOVVtOUlrRXVHQ0FkaFkxK1VNOWNVYndGc0FM?=
 =?utf-8?B?eFE2VjZKdGpDQmRxaG1VYTBDQjlZS0IxQk4yUlBDMUZ2UEhMZFZHc1lma29q?=
 =?utf-8?B?MVpRWkl3dFVQUFNpdTA0b3pEOUFrOU01TjlKc2dsaVJtVmtnTmFJeEF3OFor?=
 =?utf-8?B?NjM2U3Y2ei9mb3VRMFRJSHg5ZWNnZ1o1THhwY2pLYmNkZWdPM1NqVkhUNjZV?=
 =?utf-8?B?MnJyaHUzOGVIenJhUHNlS1B3d1lrLytPSVc0S1pPVGF6T0VDZU1ESmNNaWlP?=
 =?utf-8?B?a3BydDJFMUdVTktkNGczRFBaYTR1dWMrb3Z1Z3dBNGllWWtYSWJLQmNZSTlX?=
 =?utf-8?B?NWR1ZDRLMSt5SkJ2WW5CdHl5ZEhVYVFtMXJ6Z0dEWERrd0NvQjA3a1ZGbDUx?=
 =?utf-8?B?RkozZVc1YWV3MVg3ZjJvWU85TkVIUGxLaHZmSys5K25ZRWZCKzByRDJSNUdO?=
 =?utf-8?B?MzE4QlRhUVBSWUllMFZZeE5oNzNWZGJDaElCK1g0K09jL0F4TXRHRS9HU0JU?=
 =?utf-8?B?S21rMXdtcGhUcFIzWFgybXdodzNVL1MrcWw5V3FVcGxja1JKUVg4L3ByUDRO?=
 =?utf-8?B?UDlBdXVNVW9URkRtK3R4bFhDL0hocnIvSU1heWptSzNMVHZxS0VxL2ZpaFhO?=
 =?utf-8?B?N1R6ZDdxK3QzTE11M1BoTGhka1c3ZnhUcmxmWkJHRDBQT05WMjJQYnRpa0JC?=
 =?utf-8?B?dW9RSmlqYjVmN2hlT3ZocUtvbG5rT2piZDh1d3NmR2xPa2cwbngxbitrTUtk?=
 =?utf-8?B?OFMybmkyeEFZNEZON2ZTSzI5WDFxZlk0ZnBSK1dkcnVxT1dqQVlHbFoxYkxr?=
 =?utf-8?B?NWkvQTJyREJ1R2NFK0NUcUNrS05heEIxQlRFdlYzTU9RNXFYV1ZiZlZZaW9R?=
 =?utf-8?B?Tk1JcjIzaTJZd2xDRlc4cng1WVd5TVhueFM0THdxQkxOWlZYa2I4RTh0WEIz?=
 =?utf-8?B?Tzg0WHZQOTdabXdWZlRsdW45YzZLamNvSTdRYzhFOG1HTnRhTWtVbllDc0o5?=
 =?utf-8?B?Qm9JZm43Vnl2dmUxdG03L0l0UTlLUkdGemViWE4vdnJlWi81WHpRelh5Wmkv?=
 =?utf-8?B?OWxGd1B5ZVlFYWQrMVpIcG85cnRBR1duZVhGSWJmZDEvSWw1aXdTTUxmaGhv?=
 =?utf-8?B?cjJsT1Q1azFpdmx1a05RdU5zRFozVmVPU2VaaDI4bUpBYXl2TnZnZU5DeW5a?=
 =?utf-8?B?YXpUZVVRVjVWNjFQdEpycHJtWDZxdlpocDVZU0Q2OTg0cXEwS1UxZWg3ZVJR?=
 =?utf-8?B?azNFTXgzNU53eUl2WXNqNHMydTBIVkVnRVdsNGc1OVVMV3NTbXBGYzVhVEI5?=
 =?utf-8?B?V3BSMEpLdHZwcGorMEdKOW1PVVNGZ2dmNkprbHpZcDQvTFh6NTN1NHh1RGhE?=
 =?utf-8?B?U0Nxb1BoeTZZZEI2UE93em5PU3VSVFU1aU9acmo0d1FWVXRlYnFrRFM0bSth?=
 =?utf-8?B?TjBrTHk2YWF4N2ZuL3pkNkV5SGIzS2JUaU9STWZsclNtWXFaZ2h2OXlFSjY5?=
 =?utf-8?B?b0poSFNIZEJGRldzejNWN0lvYmM3ZFBlUzhaM3BBRVUrVlY5R2ZtS1Q2OElT?=
 =?utf-8?B?djhxVmdtRzBhWFA0KzVWdVhIZmhMNjN1am55aHdkNkhMa3Y5amhXYVFLSmts?=
 =?utf-8?B?eXkzZmowbW8rZ2tqQXZMWHBDcUdxOEFQMDYvZzFVV0VxTHVZUFdxTFRUYUsx?=
 =?utf-8?B?RjE2OXVIeDZYZEU4ZTdlOERoZ3plNW1BaHhWM3RFaFcrclp3a21xdHA3Z2NZ?=
 =?utf-8?B?Q2FvakFQWmlqckpIN0RvU2d6QzZETkJGM08yUVRVZjJETnI5Tks4eEE2VnRn?=
 =?utf-8?B?OWtXQUtmenF4d0dzU3ZBSHIrdGZjaGdzdEtnRkt4YnZWb0x0SCt3YmVzemRq?=
 =?utf-8?B?US9Bek1sekNMQXVSeTVQQm40WmtsdVNHdHFKV0ZXSDB3VGNIdTc3VU1RNTRP?=
 =?utf-8?B?YTdDSjJTVDMrLzZoMG5IRyt5Q2ZZMTNzdzZzVUl2RFllU1lqeHpJYis1eEFl?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6402e2c6-dc05-4dab-c593-08de2694be1d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:22:22.0832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWKcnYXv8loRST0MNLALQtxkntjTN4HVx454XTHStCQpf/5RcU1BoXuI2hB9tu6KAv4/5+cLdA20EnhGVz7XCXiXcB0dfi1WnxP/T+SpLDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5296

On 18/11/2025 10:19 am, Alejandro Vallejo wrote:
> On Mon Nov 17, 2025 at 5:55 PM CET, Jan Beulich wrote:
>> On 13.11.2025 09:50, Andrew Cooper wrote:
>>> On 12/11/2025 4:22 pm, Alejandro Vallejo wrote:
>>>>  xen/arch/x86/Kconfig                    | 12 ++++
>>>>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>>>>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>>>>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>>>>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>>>>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>>>>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>>>>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>>>>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>>>>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>>>>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>>>>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>>>>  xen/arch/x86/platform_hypercall.c       |  2 +
>>>>  13 files changed, 259 insertions(+), 158 deletions(-)
>>>>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>>>>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>>>>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>>>>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>>>>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h
>>> This is awfully invasive for something that ultimately drops only a
>>> handful of lines of code.
>>>
>>> First, it should be CONFIG_MICROCODE_LOADING.  We're not getting rid of
>>> all microcode capabilities.  Also, of all the places where UCODE needs
>>> expanding properly, it's Kconfig.
>>>
>>> Next, annotate the functions that you conditionally don't reference in
>>> {amd,intel}_ucode_ops with __maybe_unused, and dead code elimination
>>> should do the rest.
> I've done a few tests to see how something along those lines would pan out for
> our needs. Our coverage tool correctly ignores ellided functions, so I'll be
> sending a v2 shortly.
>
>> Are you, btw, sure this would be Misra-compliant? Right now we solely
>> deviate __maybe_unused when used on labels which may really be unused,
>> afaics.
>>
>> Jan
> Rather than appending an unconditional __maybe_unused (that's, imo, a bad idea),
> I'll be creating a local __ucode_loading attribute in private.h that maps to
> __maybe_unused when CONFIG_MICROCODE_LOADING is not set and to nothing when it
> is set.

__maybe_unused literally exists for this purpose.  See it's comment.

Wrapping in another condition just adds complexity for no gain.  This
case is unlike livepatch_or_$FOO because it's not choice between two
different things.

>
> However, I'm tentatively keeping the movement from core.c to base.c, as there's
> just way too many functions with external linkage to ifdef. It'd be an utterly
> confusing file otherwise.

There are 4 functions with external linkage, only one of which you can
fully elide.

(I think) you can do everything you need here with 4 IS_ENABLED()'s (two
in do_platform_op(), one in early_microcode_init() and
microcode_update_one()), one ifdef around ucode_update_hcall(), and one
__maybe_unused for ucode_update_hcall().

I'm going to save you some time, and insist that core.c is not split;
I'm not willing to take that kind of disruption into logic this
complicated.  The result is far nicer not split than split.

>
> Plus, I'll be conditionally getting rid of earlycpio.c too, which is something I
> neglected to do in v1 even if it's only used for microcode loading.

This is fine, but cpio should be lib-ified like sha2 so it's simply
dropped if not referenced.

In fact, the one ifdef mentioned above could be dropped if someone were
to get --gc-sections working, but I suppose that is a task for a
different day.

~Andrew

