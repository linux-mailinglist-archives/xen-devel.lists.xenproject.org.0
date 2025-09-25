Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927EDB9DE19
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 09:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130078.1469715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gaQ-0008L5-91; Thu, 25 Sep 2025 07:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130078.1469715; Thu, 25 Sep 2025 07:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1gaQ-0008IU-6C; Thu, 25 Sep 2025 07:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1130078;
 Thu, 25 Sep 2025 07:40:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1Y2=4E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v1gaO-0008IO-Pk
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 07:40:16 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0173e79-99e2-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 09:40:16 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SJ0PR03MB6533.namprd03.prod.outlook.com (2603:10b6:a03:386::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 07:40:10 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 07:40:09 +0000
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
X-Inumbo-ID: e0173e79-99e2-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/jKWvZt+Ozz7NkF50R6zA+j6iz1G4Q4Y/8BBAFMEcd14C/hlxsC1+d0WeE8GQBjfXI03gnvzIOACGMt9BLB5T40fVMJ5GEx0zpam6Nn2iVqt/LvhmsHQta8xypAlhBp1C0vtc4JtIxSJdlmy9i/fCppf54K8as2JAXUip3bWPWCjKV8gpUHXaFXCmYx39dF3SFfZq8LShvPhegM6bFkcH7LmzNDKiz1W8q0L4OoK16RIjXjA4kh0L+VHB9xJNsO+jUaRdq+5EPb4ek8f9rxn6vQT/nqsA6q+lR+8Y0OhDH9sdLo6rgBsssuWMu1j4gSN2qLUOapvPFgyPxOfcq3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5COQ8dcTyJJGWWOqKjJlSNFbCc+dGX+wai3hyaQme30=;
 b=uYAonev2KJoZzHgbMaGI4C2eqJcOk4bVyBUsieB/AKszOTyYdpzAJFdSTkPl72Gq3g/sDtpf/B3/iXpFq/4EOW53OpPZXaE5EstHDlwEH0Qfni6y0L/Ev7cNOh7P3mnOoVxV1A/CBGgiNUIRJFl2dtuDxKCtkJJ88yJ7T2etlxSvdX5/fx2a+8RGBg3G3+f9+gujhgxhbbzI55K1MGjduJHZSlPPtdloU7hIWfYypQ9X9RGYJuIz4sZY+aT2ontG7nYLkkel2mesWZH5GyUQA4MumoTNLdW9l9bRe1XS6pIDbqW7S6cbQLjublemW9G0XxG4cL/yZP7AkcldFiSCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5COQ8dcTyJJGWWOqKjJlSNFbCc+dGX+wai3hyaQme30=;
 b=XGPLfEB8s00z5MOPaTy5FVmET159a8SNag24d8E43SPIq6+eBRSqWCtkCedfcsXZkVoR7q4mNfRY2Jh8pcReRkt8Jj22BTrqVTlS+QQreMW2C88yD/jHnWQFBRddBJ1y0vt4M+D2ZoVJdL6FjIdTc343u28EsVQ1C8fXEEDsb3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 Sep 2025 09:40:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, oleksii.kurochko@gmail.com
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper@citrix.com>
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
Message-ID: <aNTx1DuSIRvj7eqv@Mac.lan>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan>
 <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
 <aNTwlR02jijpwYeC@Mac.lan>
 <1083faae-d565-48ab-8e41-3a5a12178a9f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1083faae-d565-48ab-8e41-3a5a12178a9f@suse.com>
X-ClientProxiedBy: PR1P264CA0064.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::16) To CH2PR03MB5223.namprd03.prod.outlook.com
 (2603:10b6:610:9c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SJ0PR03MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e09975-b712-4c33-4642-08ddfc06c0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHJsNTlWUzZaTVduQ3ZVL0xpQW05L21vV2RiZEQ5SVhQNStTVVZlMVE4ZnZI?=
 =?utf-8?B?WTBpZHp0WFJLRnMyMW1xcHFrTEo2R1ZjRElTdDFEQ3ZMT1pWckczQzdrOWsw?=
 =?utf-8?B?L0xhN3p1RFI5OXhjbG5pdEpGM1FVU1FseWo0L285bFpQdmpNSUVTMmhHNlVi?=
 =?utf-8?B?a0JBSG0xQW5adHB0SlJidHd0M3Z5cGZSUGJXeUc3cHo5dlgwZnJ6c2tCSldx?=
 =?utf-8?B?SjJyQmcvYUdJVzUySkQwbEFDVDloT0QxUzBLcnZNT1EzNzJiWUFDS0kvN2NY?=
 =?utf-8?B?c0J2WjNja3Zkb2pSajRtSmNxcDdoMDkxd08zNWp5eHRxWUJDTmMrV0pmbHV0?=
 =?utf-8?B?dis2U1BwR0YwUW9pZldMckI4Skg0SEVST0JFNDRXc2hKTGc1dFI2MUcvNmNY?=
 =?utf-8?B?cHpQZm9zK0pHNStwTnNyc2diL2RCNEdza05wQU8yOXNTVSs0emRFaFY0MHoy?=
 =?utf-8?B?a2g1aElLbUtyVHFQWThjQm9vWENpaEFSNlI2NkdiK204Q1lBUG8zd3Bka3RZ?=
 =?utf-8?B?WnVUcVE0eGRBekZrdm0wOW9IY1k0Mm5hdC9mdUlJOEtxMTJRV01PQ0VGNDI5?=
 =?utf-8?B?Z0FMUXhyZkl1MmFyVU9tdUUwV0xGYkdxemFKZ3BIUFJYYWFGdjU3cjZyaGlU?=
 =?utf-8?B?YnBleUN4Vkt2VGZhMFZyTFAyblVORGhsNmpvdlNXVlhJTHBlaVRINDZ0aWQr?=
 =?utf-8?B?SitjTTR0aTR6S0s1UzViRElJRURZR0E4R3pHNUVVZ1lTMkkvc2I3UDBMdzZC?=
 =?utf-8?B?ZUxZVGVSeVJDbkZDSWc4VGdIa3hkMTM3OElZOXhpdnBvVzFDL0JDdDlTY0VN?=
 =?utf-8?B?S2RxZG56azZRQ1c1Q0N2TjVWLzkxUkNXMHRyV01ZQ0p5NlAvL2k2ZEU5UHlt?=
 =?utf-8?B?dlNLMTVzd3pOeGZGeFl4N3FXWDZKK2t3a2cxOEU0alB1MDVtZ1h0Ky8zMko3?=
 =?utf-8?B?RUZaTG1qSTN3NVppMkk1TVRwSHV6c24rZFdBa0t5SDZ4ZDRpcHc4VzBSQk5o?=
 =?utf-8?B?enFjR0tTdzJ1NmVQVWc2RXJ4dmpDbko1cWZqbGtpUVF0MElZM1BzZDdoMGtF?=
 =?utf-8?B?TklIdDhjUjBxblpmeXFIZVBpR3ZrWFNlN2Y3N2dUdVdRalowK3JlV1lNVXMr?=
 =?utf-8?B?WjQzQXo0ZzJJYXJHZ0R2M3FxR0R3NkpIVlhaZWhFSW1LUjhXTXY5OWZHc0Zq?=
 =?utf-8?B?U3JTUGVuNDdXcklaYzZGdWduR3NQbmVpWkxWMU5xUDhNODRBai9ZQ0NEVzdR?=
 =?utf-8?B?b2UyU3dzNHJYV293WlBiemRSb3NUV25JeUJ2Y2pURGNwV01IWFJ1ZEF1bitF?=
 =?utf-8?B?Tmhzb3FaVzZneDNESEhib0puMnZjdW8wNysrUDBITHZiM3V1RERrR0luT3Bm?=
 =?utf-8?B?SnRoNGZFVGxtVjNRcWYwSEJRejk0WE5TRTFZdjM2dy9kdWx5VG95Z2tadFdF?=
 =?utf-8?B?emJ3WkZkbTkwSFcrOFoxTThmdmNKd095R0ZWSVRDbWJlWVVMZjNic3NrQ212?=
 =?utf-8?B?a2dkOWh3amQ2bkZ4bkF6b3QrSFpGZWJQeXhhcjVJeExIclRISTdSNVNsNHZj?=
 =?utf-8?B?UkU3TjB6NWFPaXJtNnFJWFI2Mnl6TzVkaGI1MU9nWWF4cTJjTE9WL3hUQVEv?=
 =?utf-8?B?RUY5ZU12RXplbXEyTFU3Qlp6Y2c4Vm5pVFZVK1JYT1VEYnZobmpadzh0ZTRS?=
 =?utf-8?B?OHZUQ0lKSGNvZXZBQ2xYS2IvRlR6WXlHa2VwRjh6dCtHcUFyUjFTcVF4dVNv?=
 =?utf-8?B?dXNaaW1nZFpRdmYrYkxmSHhKOXc2Q0ZSQUpQczNBdVdNdDJuRkRTU2JsMnJi?=
 =?utf-8?B?K3Z1SjJpZWszaFVuVXlpVGNuTGhxQUhlR3p6OHFhL1R2VVA2ZkVpZFdSTkkv?=
 =?utf-8?B?cGpGTDl3RFdsM0tpNmNTeTNPV09LQlRmMTJyejM4M1pBemV3QTNFanAySkJj?=
 =?utf-8?Q?Lotgc3X3NX0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEF2YmYvNnA3NFZvb216N3B6ZGVHVExSbHhiRUEwRFJVdWRCSmNPNEJqR25I?=
 =?utf-8?B?ZkZuZWRsMmU5OVhFK1AyUExJMHZuRnkxZzRldFBhSWtKaTRvZFJQTmtwcTlL?=
 =?utf-8?B?c1hiZlJKRktYWHR4VnNzelNXeUlWbjFLRXN5N3F1ZUNKWEp4bmlnRGtCTWRH?=
 =?utf-8?B?dXNsZG5rSVR6TklaeGxtWXlCSTdlVm9XeEJBWXRVWHM1WkxzbXpUTFBkaEdj?=
 =?utf-8?B?cWcxSWMxalltMTAzbFg0Q01tSEZ2QThkamc4WjdMdmR5VEZzRnRSK0hPNnli?=
 =?utf-8?B?ckRjWmZsQmcwQ3JxckhkWW00d1ZJNlkzS1VmS0ZOWkhEcU1NSGwxRk55azRI?=
 =?utf-8?B?R1B5K3lsNnd1T0pYeVNCZHVFeFRVVGlUZGUxNGcrdUYvMGtDRWN5aWhxbyto?=
 =?utf-8?B?b2pSa3NjbGpWODZBeTFwTE1yaFZMbTZwTGhoMnJCL2ppY3ZhVFh6NmtCdnR6?=
 =?utf-8?B?REZ0MGc4SzV6OXkwMXpmcU92OGh5TG9nYTFncndlSUtZa3pnK1NRdk80ODJr?=
 =?utf-8?B?MGlEM2N1b2pFOE9VK2lQZzlxeWtMTXI3TVdSNzJIU21iV0FmTDd1OWFjWDQ0?=
 =?utf-8?B?b2YzV3RQWG53YmxzcWcrcFoyc1M0ZjlrelJMaXUrcU9yWi9xaWprSzhyUEg2?=
 =?utf-8?B?V0wrd1ZpWVJ3TkFjUmlQQmxLRjd1NzQvaml5MUVJbjRYT0M0Q3c1OVdrUTVx?=
 =?utf-8?B?RHBwU2lOZHVmcnlFclRRZmQ2anZnbTBkT2J1VjhUQVRwSE5oWmJkbnZGT2VP?=
 =?utf-8?B?bHluYnVSam5nN1RVYUc5ZWhoQ2JLUnFwb1F1QkIyN1hQWnQxSGhmalk4WExV?=
 =?utf-8?B?UU0rRDgydE8zbElSc21Ob2RKZUZ4T0V0T1A0eVVVSFJXTjFnR2JFV2Jwczhj?=
 =?utf-8?B?dnh5eVNRR1VHcEtyRFZxMldsT1BwazN3R2R0bWlzVGxHSHovRWRBOThTNFQ0?=
 =?utf-8?B?QVlCd0hHTU1UM1FGVlB2L2Z1SWdHSktpREx5c3I5bFZqQ3p0ajMyampaU1RI?=
 =?utf-8?B?OTlMajFyU0hVZkdieDhPbFhzS1EyYTRoMi9FdlZqcldoamRkamFvaVpJalVM?=
 =?utf-8?B?VFpCc1hpWS9IVkRyVFhvSmhhVDcvYnAxdlJ0Qm5nSm11OGVXd21LMHlXR1BK?=
 =?utf-8?B?NlM1NHVsSFFjRWJXalQxaFBJSXJIWkhRQnNPcFB1bEM2QVN1eUVGNTB0dW8v?=
 =?utf-8?B?L1FGMVI3U0h2ckNMZEYxOTl2NDB0NVhldmlScCs2eHpCOGJZaG0vNkRKNy92?=
 =?utf-8?B?c1JCVU1Na0pvMXpxZEs2aFZtZU9ZMzJaWjM4RERqUmMrN1BuZGdVanJQeUdk?=
 =?utf-8?B?aGpNWW5PaWdaTHQvaCs1Z3hUTHUzOHprcy9TSHpaWWJ1YjR5ZWtqSFErTXd3?=
 =?utf-8?B?TURYNVhQdmlSM3pOVFVXeE9SVENHektvZzYwblh0a2NBLytTQ0ZqcCs2ZnlJ?=
 =?utf-8?B?bTBOT21vbkZ4SkwxbnN6akFHTU1SSVFEK2tuNVYzZVZyMlhkQ0prV2tnRk9j?=
 =?utf-8?B?TjdhbUVDV0FKYWwwUUgxVmhpbUIzM281cmt0OUJ4K3NDU0hhR2tmbmtLVGNR?=
 =?utf-8?B?VmZYZ0hndkx0Qjh3MnZUZGNaNmQyZ1Yxa3VoU29VbDIzbzc3Y280QS9VTVZu?=
 =?utf-8?B?SndGbVNmNEJPclZRQWx2b3M3TWN6MnJzWFBybkNuZzF0Mlpjcnh0OVN5bVAv?=
 =?utf-8?B?K0krSWMrSUVDZkZzZXlrN09XUFhIOHZ4VURnb3NuVjZBQUFBMHhmWTd3dSts?=
 =?utf-8?B?WFlKVUd1QjU5L0dKUktvVmFRUEw4aURFTmdpRU5udHZmNHBBMW0rcS9KOCtH?=
 =?utf-8?B?VUJDUWdBcFVYNkFyaHl4K3FZQ1RCOFQ3UkFxSGZzNmFDUUgxU2dNMFkwUUg1?=
 =?utf-8?B?U3hacUlnZEFHTGZ2TXVzSDU4N3VkNVFzSzY0U2pyYmF2VE9QOGlxTUFWcDhV?=
 =?utf-8?B?djJYaVpJWFBxam1TejFhTytEbW1jY2RlK1gyWFE3NGg0NTNUK04vRXRtWkRW?=
 =?utf-8?B?ZXpSZ1RHM3R0MXRFNUVzOHJYdk9DdDN2NVA1ME1kNVlqOUdFWHRBWTd6REJy?=
 =?utf-8?B?Q1J5Sm4wZGlzcFZsYjBkTFpqMGVGM1I5MVN2YTNlRXRTbHZZSkNRWDJXdVNM?=
 =?utf-8?Q?aE9Yaye7PVbrx7H/TdnPDWQhA?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e09975-b712-4c33-4642-08ddfc06c0ed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5223.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 07:40:09.8970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUoNoCBVXuNJz8PUthGKHyB+mczLZ8WgJuCLb2WCNRnmbCbGGGhi0+SlqhC3T1n0f0xv5qzuQ76bOnoAmAnCew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6533

On Thu, Sep 25, 2025 at 09:37:46AM +0200, Jan Beulich wrote:
> On 25.09.2025 09:34, Roger Pau Monné wrote:
> > On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
> >> On 24.09.2025 15:40, Roger Pau Monné wrote:
> >>> On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
> >>>> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
> >>>>> Otherwise the check for the SS feature in
> >>>>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
> >>>>> X86_FEATURE_XEN_SELFSNOOP never being set.
> >>>>>
> >>>>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
> >>>>> identify_cpu(), because SS detection uses boot_cpu_data.
> >>>>
> >>>> Doesn't this, mean ...
> >>>
> >>> Well, that's the reason for the rant here.  The reset at the top of
> >>> identify_cpu() has been there since 2005.  It's arguably to make sure
> >>> the BSP and the APs have the same empty state in the passed
> >>> cpuinfo_x86 struct, as for the BSP this would be already partially
> >>> initialized due to what's done in early_cpu_init().
> >>>
> >>> The underlying question is whether we would rather prefer to not do
> >>> the reset for the BSP, but that would lead to differences in the
> >>> contents of cpuinfo_x86 struct between the BSP and the APs.  In the
> >>> past we have arranged for leaves needed early to be populated in
> >>> generic_identify(), like FEATURESET_e21a, hence the proposed patch
> >>> does that for FEATURESET_1d.
> >>>
> >>>>>   However that
> >>>>> creates an imbalance on the state of the BSP versus the APs in the
> >>>>> identify_cpu() code.
> >>>>>
> >>>>> I've opted for the less controversial solution of populating FEATURESET_1d
> >>>>> in generic_identify(), as the value is already there.  The same is done for
> >>>>> the AMD faulting probe code.
> >>>>>
> >>>>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
> >>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>
> >>>> ... this Fixes tag is incorrect?
> >>>
> >>> I think the Fixes tag is accurate; the code was OK before that change.
> >>> Nothing in c_early_init hooks depended on (some of) the x86_capability
> >>> fields being populated, which is required after the change.
> >>
> >> I agree. Hence:
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> I wonder though whether while there we wouldn't want to also store ecx if
> >> we already have it. (Really there is the question of whether we haven't
> >> other cpu_has_* uses which similarly come "too early".)
> > 
> > Yeah, I was about to do it, but it's not strictly needed for
> > c_early_init, and it's done anyway just after the call to
> > c_early_init.  I can set that field also, but then I would need to
> > tweak the comment ahead, something like:
> 
> Sure, i.e. fine with me.

Thanks!

Oleksii, can I please get a release-ack for this to go in?

Regards, Roger.

