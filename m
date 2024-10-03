Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA998F28A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809572.1221971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNkQ-0006QR-U6; Thu, 03 Oct 2024 15:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809572.1221971; Thu, 03 Oct 2024 15:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swNkQ-0006MR-QP; Thu, 03 Oct 2024 15:28:10 +0000
Received: by outflank-mailman (input) for mailman id 809572;
 Thu, 03 Oct 2024 15:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ein2=Q7=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1swNkP-0006L5-Cq
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:28:09 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16c8cdce-819c-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 17:28:07 +0200 (CEST)
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com (2603:10a6:102:26b::13)
 by PR3PR04MB7340.eurprd04.prod.outlook.com (2603:10a6:102:93::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Thu, 3 Oct
 2024 15:28:04 +0000
Received: from PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709]) by PA4PR04MB9565.eurprd04.prod.outlook.com
 ([fe80::d8ae:2e16:5a97:1709%4]) with mapi id 15.20.8005.024; Thu, 3 Oct 2024
 15:28:04 +0000
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
X-Inumbo-ID: 16c8cdce-819c-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtSehHTJmFGsXKome+4tE5UGrWvMqVkAYCNEwj36FqunnWDuvPoPlxr5FRyY8YYuS6Lbh5SAQvTsbDkYuQJ6ZpSdjlMdUehYS7Oy0rM4WGQGr8MWHCl+yw0e/badKSAzHCXjVha6AlnH816qhZWbK0AWMyuj6MSzfInOnCLsUX2rW+d4sStqD/g8gpl7ou8X8RAiN2LHSZzSax4gtWE+hzcm619T1SCZHm7JdtJcaGqNTIELo+oIZDMFVB7v61E19NsB6rzLuViYl/ik8b2BAe3jX7zVFlQK94VhkQDvau47WlwMjAZhQntZOjK1++NSVUTNn/us33HT2hqhPrk66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWeTAWnT8kf7baVCJ5SjmKDkHcd2sDY90XEk6NlA1lg=;
 b=dlnnyEW510j6ewB+n07UuWMisDy6pg+lUaCnqiP11GYoCIerbaOIm35WFPciBvSntlGzFyNw5cLdRaGlHPAUrT3vXO7oOVyAZHlnjrscTUz1a5s8Hk7EyINc3eA4Gop5jw6SzMObjxlPqrf1CYV2l1tF8HqOMW5kYhbJdeZOIf7ycgXjCU7V5s/2rwFYuiZsq1UrqDqrHDxwe2cpzaINfZ/0boImg+UKxnnskQX8j7vdlKpLeb8K0/Vq+pG4KGWsM9E+OMTIdn7Qog0uoSpSXZM7XhDS51MQKwumIi1r8RcBjl8DeAm/tRdH8C66xpxvmh82k39UuizM3fY2zyiuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWeTAWnT8kf7baVCJ5SjmKDkHcd2sDY90XEk6NlA1lg=;
 b=AnrmGOYa1l9fnQLdGe3QNXJlErOnhTTZUAYWbsN+Yan5Z3MLcdPZ+cHGpL6RtOKHebEmjXScyf8srE5ekDjjbR2IQ0Q66E/0Ut9Fp/gIeEIQa4z0rthehhWYi29BqW+/hozPJjx2ae0sviNBXV/aFr4fcOBAbfHfcPbyVdIRowYy7KqyrMLdtmjYcLpwlI+7MSNqvqZmlDOOwjH8aDuWdA6zp/TsDsUW8bLNCCj4yu2Ka+V7GFY6TC/2hXES1NB18JrSGrSoPq2mo0+6674l8kmOar5TKL389VgfUOU4c71VzFQ9eVeVl206RUl5fysL0HM9XN7lqekjnEa7vWiIMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <3092497c-8626-4e86-b28a-16594eb2a4f0@oss.nxp.com>
Date: Thu, 3 Oct 2024 18:27:37 +0300
User-Agent: Mozilla Thunderbird
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
 <e713ae46-104a-4414-8ad3-02ca8b0a521d@xen.org>
Content-Language: en-US
In-Reply-To: <e713ae46-104a-4414-8ad3-02ca8b0a521d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0030.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::18) To PA4PR04MB9565.eurprd04.prod.outlook.com
 (2603:10a6:102:26b::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9565:EE_|PR3PR04MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7fa984-a297-4d67-6971-08dce3bff960
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmF3amlmYXR4djRKdGFkU3EwUDhKbnpxZjZHQWdvcFBkK2lKbjBvTXpSYWlF?=
 =?utf-8?B?b240NzAwb011cWQ4VHBFK3k4QUUrNnR1YjF4RmxNRVBGQVJGMHBqcVpJa1ZQ?=
 =?utf-8?B?dlNnek5VSUNOUGsxR0ZBejhKRUdyTVArZTh4akdmeUFZRWxXR2t5UENQNWZm?=
 =?utf-8?B?RDNTeUp3UlRpNm9YQ2RNdGZZSmtLdFdiMlE4ZXozdVZ6U1VUeHFmelN0dzVM?=
 =?utf-8?B?TkNtWEZvTW0vTHFad2c2NGZxbk56NGFFbmFjUkVuUFV4TEpob0J2VklqOElw?=
 =?utf-8?B?ZDhPZzE1Q0xkUmRYd0dOWExoeHpna0Q4MXFVaTZVY1RzK1plcXdlL2xFWkpT?=
 =?utf-8?B?WjB1alpoNG5FeU9kZDFIRXMrQkNBa2dteXc3dTBnWG5VeUY2OVJnbEthbGpW?=
 =?utf-8?B?WnJUQ0M4cFJUT1BGZjl4V3N5NkdGQ2FjSFo4THNRdElGOEhKcnErMDVSWUVG?=
 =?utf-8?B?VXNmMEhpalplWUw1aU54U3M5M2ZuZWFCMGx4MGppUjRzVFkwSFRMMXJUSFBq?=
 =?utf-8?B?dEc1NTZHdlVITElFS2pCVXNROFYwUENpb3VsRGN1TytQcXVtSkd6RFAwOHZP?=
 =?utf-8?B?ajFrYVRjQklHWUtibTF6dkt5eTRBbTk4V0Y2TzRLazI0eEVkcDVoNDJqdVJ1?=
 =?utf-8?B?K0RzYWxUMVUvSlFnUTJ4b3RFVnR5b05HeTIyYzRjQllDK1JoNC9ydmhuMUdP?=
 =?utf-8?B?Y3BFU0pYSG5VOWF0Z2d3NEt3aENkdzhFY1pHZHUwSW5kTjZUcmc3M0l3ejVv?=
 =?utf-8?B?UUd0ZS9aNUM2QmRhTXMvNzVDT3NubUZwQjk0aFlmeGpLOGRYcTFkYm8zMDMw?=
 =?utf-8?B?dndHWjFIbDFyZktFS0lvYlR5cTlQYkdyWGY0YUM3cE9QeDhRSU1nS3pUTStM?=
 =?utf-8?B?NjBCMStKbUM0WXRFekdqNHFkMis0ZHpsc1BzMldSRHFncHBGSDVIRFZCdk5F?=
 =?utf-8?B?SUZyc05zbzQvTmdlNndrNkN6dUtpY3h3bmZPQ0FxRzBvQmNLdVpHQTZGK29i?=
 =?utf-8?B?UlkxajJHQU93SzZ1WDFSZCtWYThUZHE2YURnZmxXNDBGajJqM2VzR1YzNTZ1?=
 =?utf-8?B?Tzh0UWZ5RldDV2l5Y2x2bkJIdjhjTUVjS3JZZWxEMUFzUFlRdWRac2h5V205?=
 =?utf-8?B?UVd0MzIreTRSYVExVXJFQm12ZXpnM0dUWGJSbnlrYWZnZ1RqT2l4Qi9VSWxM?=
 =?utf-8?B?dTZjYjE1eGxZSWFveDRjQmhmOU9NUk1GeksvZDVPWmp6RGxzaFlNaDliRkJZ?=
 =?utf-8?B?RkgrK21xK3gvMFJvc1paL0FxcUduUDQ5NEJpM2ZSWUdaSDVzNGNOUXp0WTFw?=
 =?utf-8?B?Vk10NStlSDRzUUZTcVNyLy9FK1phNE1WamJkek9XWjdMNXBwWXpScEdZT2sx?=
 =?utf-8?B?NSs4Ly82Tm9XeWhwMW9haHZJOXdHbEVyaEsxZnZud2JOMkoyVG5hTndCdnky?=
 =?utf-8?B?NG5td1RvQ2Q4WkNXcDlUUkcrKzZEaTAxZWRpOVhNRzArQUVYeldQcGtab1dh?=
 =?utf-8?B?d1p5ZXNzeU1IalNDQmdGMGpUZlNIMGs3TWlZVFpKdGFKaSs3V1Zab1B0alVm?=
 =?utf-8?B?WUg0NVpQbFlwQncyY1FLaHV1blk5aVk1bytyWnlaS1U3ZHhqL1JiT29FaGtL?=
 =?utf-8?B?SEtjbnlaa2loMUpIcm91ZFcvVjZ0aFg5cUdKOU54Kys4aGNlTWtQRXJOV2xB?=
 =?utf-8?B?bVBFeFBXWnJadC8zVGcvTjY0cmxHSEtYWDdTbTFWNWpJZWFFcE9UMy93PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9565.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGErZkxBZU91UlgrUGlrTzU0YzVoeU9ESWNoMVJhWEpKSWt2K0lHR0VPbXdC?=
 =?utf-8?B?ODlFTEptazVSV2xPZW82NHJGbkxYUVh6eDFYczBRbnFpbFREall3R01PdXQx?=
 =?utf-8?B?eU1MemdncXovQVliWllIdk5SU0NZRXB2dUlTV2EvSUlvMUU3czN4eVR2ZnAx?=
 =?utf-8?B?akYyVW5zaDNsbWZWNEU2d0dGTTRHV0t4T1ZEMkJDcjgyTGJmc2FCT2hmMUp6?=
 =?utf-8?B?aDlMakRjUVFVTjM2ZGp5YXd5WTZReFpRU25QSjVxbzhCK2RRWFhENGRWN2w4?=
 =?utf-8?B?Z25VSENGWWZrb0lndlcvRGJBTDdYdjdFcHRDVVllYWtPR01DVWlCS2dlcVBo?=
 =?utf-8?B?RDRCNlRWSXBBbGM2MHBSSzEyMzh5eDNSWTc2Y2lnaW9ZQlU5YUk4ajdMN0pG?=
 =?utf-8?B?T1R1Y0FadFJPNzQ3dnJCaW9yZmh5S0psWDJ2eHBXWmMzL3krVFdxWkx5U2dI?=
 =?utf-8?B?bURNakhnNVJwaXNoTTV3bUFzTlZsdlJwbEkveVQwbjFCQ1B6aWhTWXd0M2Qr?=
 =?utf-8?B?TDRJTGdXck5OQzVLZUYzU3pLNENaOWFDV1BIc3NDVVBTYmEyWlRHSVdRVnNp?=
 =?utf-8?B?SzloeURHUGZRYWFqMmlhcHo4d3VuUkVlcm1idjgwME41dTRVMDZkOGJ3QjJT?=
 =?utf-8?B?ZDZvY1lmTXk5ZUx5czRleHBSUlhRei9lS0pXS3V3eW0vWWtkSjhsZEhuR05K?=
 =?utf-8?B?U2ZPYVE2Sm1MRTc4NXAwM3creFRGQXdzcnFrSkJRZGxyMDlCUlkybkFIL1E5?=
 =?utf-8?B?N0dyajlrOE54RnRHWWdrY0JjNmFGMHNNRWNIQmUzMjNFWkpCbytMY1lsRC82?=
 =?utf-8?B?QnJ4aDMvMXRtYityOGpLaUtiTzNCR0ZtRm04cWpDVFBkT0g5LzY3MjBmZVRm?=
 =?utf-8?B?YldqZlo2L2F6eFBLSnVrOFhDKzB1amQyT3BVWXlSTHFxTEVucGdqYnZNQW9x?=
 =?utf-8?B?dHBRZlFtRE1FVVFZMmphVzJ2Z3IvUG9KYlVFbThGeDJLWEJRejVVTWpYbkpm?=
 =?utf-8?B?ZWtIYkI2ZGFONms0RGFqTkNENFdNRXR1YnNkN3Jad1JVWG1yUGE3NDF5RDhB?=
 =?utf-8?B?WFJybkI2eW1lZW1nOVVkeVoyU0QvOFhaQTU3dFdNQzNFeXBmMy8wNzFJUjdj?=
 =?utf-8?B?QmFhRS83TlludDV6c21SSGpMVzhwbkQrRTU3MGFVMHcyUHlZNERzcGVoMmgw?=
 =?utf-8?B?aUE4WkwyZjRKKzlFenZzZFRoZXd4QU1yMHl5WUFVNThISktKVFh2dnd1SHEz?=
 =?utf-8?B?cHlwcmEzWlYwTzNCWldNU2RzdUh3b01JT3VSOEY5TXJmWlFpcDZYdDh0bXFy?=
 =?utf-8?B?UVRCbnJWNjl2SUUrcXhyemFtakhzcUNham9ValBzTlEzV29OU1VWQ2tRWDVz?=
 =?utf-8?B?dlBXL00zcHl0VGc3VUVXdHFlQkZackRxT1JJLzZaUm1UVkRCWm1zMG5UcTZq?=
 =?utf-8?B?V1RLekt6V2VFV0JQaWJMTWlZbUVFbmNQZU42SjFCWlpIa1hVd05HUStBNlJs?=
 =?utf-8?B?TjkrL0ZzQnBGa1NnTElNWlE0Vi8rODBZbGVGL1ViWnVLM1dyajdPdG1vV0tL?=
 =?utf-8?B?Tk5xRzVJTzhaYzk3cENHRjZUN2J5MXZseHhnM3oyYVRreG12OGZJY1Q0Y0hz?=
 =?utf-8?B?dkVLVWtFWU5wVTg2bTJPK3RuQUtVKzlEeFhwWFpSMTBzYVJMbjNpVnAzdmxQ?=
 =?utf-8?B?cFFlVTIxL211S2hQemN6bVo2SHRnQnFoWDlmTDcwb3dWNWJ6QmwxM0RLeFVP?=
 =?utf-8?B?NHVaTnZSZUVMMlVFaTkzMmNybUJYaXBnVHhiVHBVdnhTclJDVUZqekFjQUpl?=
 =?utf-8?B?OTcyckZxUXlVM0V0S29qWjU5V1laYUp6MFB3NGxBVkdkRU5oazl3V2lCanVx?=
 =?utf-8?B?aGUzNnhXWXFaMW5WTHMzOWh1NEtVYjhaOGQzZ0hkTXNkc1g3Szc1TjltU00r?=
 =?utf-8?B?TWdOOS84bG8zb043NGNiaXRvR1YxTGQ3Z1BudTcrRVBMenJmU0JIL254Y2Zx?=
 =?utf-8?B?SmNvQSs1OXMwM01IQ0Q0Rm4wQUtKaTVLTU1EUnB1VXRHOS8zRzZNb3dRQ2xS?=
 =?utf-8?B?QXg1WWZqYlBROEJPZEZLODZzaVFvb216YWxmZGNSTjYrckpsN1JGZUFiNUwx?=
 =?utf-8?B?R0FtU2RzbGtPcUsyWk8xckZRNENQYXJ4cTlXemd1dzlHeEZQekUzVTM5TG0r?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7fa984-a297-4d67-6971-08dce3bff960
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9565.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 15:28:04.3848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Oruouf2Kch0ylGMEjDPK4cRFcRARYnzySlcxuE48VkLhOYN2tA11ZrAbUX4dL8NM+x5I05CZH1eT0YHP0yWgpLPeaLlBr0jDZH6zgbLFxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7340

Hi Julien,


On 01/10/2024 12:35, Julien Grall wrote:
>
>
> On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Introduce the SCMI layer to have some basic degree of awareness
>> about SMC calls that are based on the ARM System Control and
>> Management Interface (SCMI) specification (DEN0056E).
>>
>> The SCMI specification includes various protocols for managing
>> system-level resources, such as: clocks, pins, reset, system power,
>> power domains, performance domains, etc. The clients are named
>> "SCMI agents" and the server is named "SCMI platform".
>>
>> Only support the shared-memory based transport with SMCs as
>> the doorbell mechanism for notifying the platform. Also, this
>> implementation only handles the "arm,scmi-smc" compatible,
>> requiring the following properties:
>>     - "arm,smc-id" (unique SMC ID)
>>     - "shmem" (one or more phandles pointing to shmem zones
>>     for each channel)
>>
>> The initialization is done as 'presmp_initcall', since we need
>> SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
>
> presmp_initcall() should only be used when we really need to initialize a subsytem very early. But it is not clear why this can't be called in initcall. Can you clarify?

Right, I will change it to __initcall(), as there's no specific reason
to do it as a presmp_initcall().

The commit message was meant to imply that PSCI initialization is
a prerequisite (because it also initializes SMC capabilities,
which IMO should be decoupled from PSCI).

But of course there shouldn't be any hard deadline to initializing
SCMI, if obviously we're doing it before Dom0 starts booting.

>
>> If no "arm,scmi-smc" compatible node is found in Dom0's
>> DT
>
> You are checking the host device tree. Dom0's DT will be created by Xen based on the host device tree when the domain is ceated.

Indeed, I will change it to Host DT.

My choice of words came from the train of thought that Dom0
is the closest to a native Linux, which would have the SCMI
firmware node as part of its DT. And Dom0 basically gets
most of the original host device tree by default, except
some special nodes. But I will change it.

Thanks for the suggestion.

>
>> , the initialization fails silently, as it's not mandatory.
>> Otherwise, we get the 'arm,smc-id' DT property from the node,
>> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
>> are not validated, as the SMC calls are only passed through
>> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
>> running.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> ---
>>   xen/arch/arm/Kconfig                |  10 ++
>>   xen/arch/arm/Makefile               |   1 +
>>   xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>>   xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++
>>   4 files changed, 226 insertions(+)
>>   create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>>   create mode 100644 xen/arch/arm/scmi-smc.c
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 323c967361..adf53e2de1 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>>         not been emulated to their complete functionality. Enabling this might
>>         result in unwanted/non-spec compliant behavior.
>>   +config SCMI_SMC
>> +    bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
>
> Strictly speaking you are forwarding SMC from the hardware domain. For Arm, it is dom0 but it doesn't need to.

Well, SCMI is Arm-specific and so are SMCs, but I agree to change
to "hardware domain" / "hwdom" in order to keep the language generic.

Will update everywhere.

>
>> +    default y
> > +    help> +      This option enables basic awareness for SCMI calls using SMC as
>> +      doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
>> +      compatible only). The value of "arm,smc-id" DT property from SCMI
>> +      firmware node is used to trap and forward corresponding SCMI SMCs
>> +      to firmware running at EL3, if the call comes from Dom0.
>
> Same here.

Will update.

>
> > +>   endmenu
>>     menu "ARM errata workaround via the alternative framework"
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index 7792bff597..b85ad9c13f 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>>   obj-y += physdev.o
>>   obj-y += processor.o
>>   obj-y += psci.o
>> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>>   obj-y += setup.o
>>   obj-y += shutdown.o
>>   obj-y += smp.o
>> diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/include/asm/scmi-smc.h
>> new file mode 100644
>> index 0000000000..c6c0079e86
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/scmi-smc.h
>> @@ -0,0 +1,52 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * xen/arch/arm/include/asm/scmi-smc.h
>> + *
>> + * ARM System Control and Management Interface (SCMI) over SMC
>> + * Generic handling layer
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#ifndef __ASM_SCMI_SMC_H__
>> +#define __ASM_SCMI_SMC_H__
>> +
>> +#include <xen/types.h>
>> +#include <asm/regs.h>
>> +
>> +#ifdef CONFIG_SCMI_SMC
>> +
>> +bool scmi_is_enabled(void);
>> +bool scmi_is_valid_smc_id(uint32_t fid);
>> +bool scmi_handle_smc(struct cpu_user_regs *regs);
>> +
>> +#else
>> +
>> +static inline bool scmi_is_enabled(void)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline bool scmi_is_valid_smc_id(uint32_t fid)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
>> +{
>> +    return false;
>> +}
>> +
>> +#endif /* CONFIG_SCMI_SMC */
>> +
>> +#endif /* __ASM_SCMI_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/scmi-smc.c b/xen/arch/arm/scmi-smc.c
>> new file mode 100644
>> index 0000000000..373ca7ba5f
>> --- /dev/null
>> +++ b/xen/arch/arm/scmi-smc.c
>> @@ -0,0 +1,163 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * xen/arch/arm/scmi-smc.c
>> + *
>> + * ARM System Control and Management Interface (SCMI) over SMC
>> + * Generic handling layer
>> + *
>> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include <xen/acpi.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/sched.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/scmi-smc.h>
>> +#include <asm/smccc.h>
>> +
>> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
>> +
>> +static bool scmi_support;
>> +static uint32_t scmi_smc_id;
>
> AFAICT, the two variables should not change after boot. So they should be marked __ro_after_init.

Right, will update.

>
>
>> +
>> +/* Check if SCMI layer correctly initialized and can be used. */
>> +bool scmi_is_enabled(void)
>> +{
>> +    return scmi_support;
>> +}
>> +
>> +/*
>> + * Check if provided SMC Function Identifier matches the one known by the SCMI
>> + * layer, as read from DT prop 'arm,smc-id' during initialiation.
>> + */
>> +bool scmi_is_valid_smc_id(uint32_t fid)
>> +{
>> +    return (fid == scmi_smc_id);
>> +}
>> +
>> +/*
>> + * Generic handler for SCMI-SMC requests, currently only forwarding the
>> + * request to FW running at EL3 if it came from Dom0. Is called from the vSMC
>
> s/dom0/hardware domain/

Will update.

>
>
>> + * layer for SiP SMCs, since SCMI calls are usually provided this way.
>> + * Can also be called from `platform_smc()` plat-specific callback.
>
> I am not entirely sure I understand the value of calling the function from platform_smc(). I also don't see any use of it in this series, so probably best to remove the sentence for now.

Will remove. It doesn't need to be called from platform_smc(),
since it's a call chain.

>
>
> > + *> + * Returns true if SMC was handled (regardless of response), false otherwise.
>> + */
>> +bool scmi_handle_smc(struct cpu_user_regs *regs)
>> +{
>> +    struct arm_smccc_res res;
>> +
>> +    /* Only the hardware domain should use SCMI calls */
>> +    if ( !is_hardware_domain(current->domain) )
>> +    {
>> +        gprintk(XENLOG_ERR, "SCMI: Unprivileged d%d cannot use SCMI.\n",
>
> Please use %pd instead d%d. With that you can simply use...

Will update.

>
>> +                current->domain->domain_id);
>
> ... current->domain here.

Will update.

>
> > +        return false;> +    }
>> +
>> +    /* For the moment, forward the SCMI Request to FW running at EL3 */
>> +    arm_smccc_1_1_smc(scmi_smc_id,
>> +                      get_user_reg(regs, 1),
>> +                      get_user_reg(regs, 2),
>> +                      get_user_reg(regs, 3),
>> +                      get_user_reg(regs, 4),
>> +                      get_user_reg(regs, 5),
>> +                      get_user_reg(regs, 6),
>> +                      get_user_reg(regs, 7),
>> +                      &res);
>> +
>> +    set_user_reg(regs, 0, res.a0);
>> +    set_user_reg(regs, 1, res.a1);
>> +    set_user_reg(regs, 2, res.a2);
>> +    set_user_reg(regs, 3, res.a3);
>> +
>> +    return true;
>> +}
>> +
>> +static int __init scmi_check_smccc_ver(void)
>> +{
>> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
>> +    {
>> +        printk(XENLOG_ERR
> > +               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");> +        return -ENOSYS;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int __init scmi_dt_init_smccc(void)
>> +{
>> +    static const struct dt_device_match scmi_ids[] __initconst =
>> +    {
>> +        /* We only support "arm,scmi-smc" binding for now */
>> +        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
>> +        { /* sentinel */ },
>> +    };
>> +    const struct dt_device_node *scmi_node;
>> +    const char *smc_id_prop = SCMI_SMC_ID_PROP;
>
> NIT: I would remove smc_id_prop and use SCMI_SMC_ID_PROP directly.

Sure, will update.

>
>
>> +    int ret;
>> +
>> +    /* If no SCMI firmware node found, fail silently as it's not mandatory */
> > +    scmi_node = dt_find_matching_node(NULL, scmi_ids);> +    if ( !scmi_node )
>> +        return -EOPNOTSUPP;
>> +
>> +    ret = dt_property_read_u32(scmi_node, smc_id_prop, &scmi_smc_id);
>> +    if ( !ret )
>> +    {
>> +        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
>> +               smc_id_prop, scmi_node->full_name);
>> +        return -ENOENT;
>> +    }
>> +
>> +    scmi_support = true;
>> +
>> +    return 0;
>> +}
>> +
>> +/* Initialize the SCMI layer based on SMCs and Device-tree */
>> +static int __init scmi_init(void)
>> +{
>> +    int ret;
>> +
>> +    if ( !acpi_disabled )
>> +    {
>> +        printk("SCMI is not supported when using ACPI\n");
>
> NIT: Can you use XENLOG_WARN in front?

Will add.

>
>
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = scmi_check_smccc_ver();
>> +    if ( ret )
>> +        goto err;
>> +
>> +    ret = scmi_dt_init_smccc();
>> +    if ( ret == -EOPNOTSUPP )
>> +        return ret;
>> +    if ( ret )
>> +        goto err;
>> +
>> +    printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
>> +
>> +    return 0;
>> +
>> +err:
>> +    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
>
> In the commit message, you said the SCMI subsystem was optional. But here you use XENLOG_ERR. Shouldn't it be a warn or XENLOG_INFO/XENLOG_WARN?

Well, SCMI is optional, in the sense that if we don't find the
SCMI firmware node in the host DT, we exit silently (-EOPNOTSUPP)
and we return right away (no error printed).

But if we do find the SCMI node, it means that we should initialize
the SCMI subsystem, right? And if we're trying to do that and we
find that the DT node is not correctly formatted (i.e. the
'arm,smc-id' property), I think we should print an error.

However, I think we shouldn't print an error if we return
with an error code from scmi_check_smccc_ver(). And the print
inside scmi_check_smccc_ver() should be a XENLOG_WARN.

So, I think we should print a XENLOG_ERR only if we figured
we need to initialize, and we started to do it but it failed.

What do you think?

>
>> +    return ret;
>> +}
>> +
>> +presmp_initcall(scmi_init);
>
> See my question above about using __initcall.

As mentioned, will change to __initcall.

>
>
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>
> Cheers,
>


