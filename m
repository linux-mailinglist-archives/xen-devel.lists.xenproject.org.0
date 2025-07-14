Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D03B03B55
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 11:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042747.1412823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubFpp-0001uf-A4; Mon, 14 Jul 2025 09:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042747.1412823; Mon, 14 Jul 2025 09:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubFpp-0001sa-7T; Mon, 14 Jul 2025 09:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1042747;
 Mon, 14 Jul 2025 09:50:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaQv=Z3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ubFpo-0001sU-2Y
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 09:50:56 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2418::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05e35b59-6098-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 11:50:51 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.28; Mon, 14 Jul 2025 09:50:47 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 09:50:47 +0000
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
X-Inumbo-ID: 05e35b59-6098-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBnFv778k3A/W6DPnI+qBPXLbk/uoGa57O8dWfsw/3BdX6sBTPBrMSMfI7xp/XcbNXjJ7zLPBm8CdIwfk53ELY7LO+wicedzxqq6jxReosV+DtsYYtjXmvuIuPIkDow5R9yeDtGJiUWGzufF9lBEVAuhH/5oHqEEy3FcUbWwjZqe5EezDTM295DiLkO7p938X4oh5b1BUz6aN2HZziz33zU7L3Gz9kukBAZ3pfTQv/OKHKGdYkwoBFSghQzH2mg+J9WhJMJlWr1Ow4OlgIUbeXuq8hFwoJq6SaOUd5sSYp8/Le+/QOzN/gywYLH/2QC7gj7zirzw9APjmxgTokCubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/oEeY6aWZJx6YayY36tPApUdbPvkshMJXjaeNmwbYM=;
 b=kYFYBMpEciXhE82nX8NCIRZ5MIkJmMELPXIbRlAp7pM6PKoowe7PDL+fSed/Mm7Icvm0Cs9dswdh/ezNwrCnSgzUl7plu3pMtHmBEAyLxckXlAHN6/BCSjvDoLXyRtbAayf0puzkFf/r1sBZDaQeGUXYtMVf/+BRnZSlpjQXrQTLDVT/LbIw0fSPvZwNoJqqHGD2KVtbU1oqttB/rGXLnaGgckNDAL2NXddFClMstRkEheIr9MdFIuS2KXY5gCyIcSWfkvwdH2yekhBJHlE/DAz5ROf88Sd6fWg6CMj2xzl4Sk7NZc+872nMsL+4E/8rgHhXq8vzKWHI2uGnvLB01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/oEeY6aWZJx6YayY36tPApUdbPvkshMJXjaeNmwbYM=;
 b=lJaalQRFCghIHTIggSRwfxnIyVW1sjoubUbf3V5zkEK8bTE+ILlRsown5ALI890gULoIqLba3UtsxL7N3+dl5Pag8rf3wLXpFhvcD8wtHmQGuHkVabMycCSj1yyI4RMsaBqVz2ym+mvidAuwTfxg3TkZEPDOrqoU+MEgaqneUqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b10f4263-c01b-4a87-b2a5-9ad13dc343fc@amd.com>
Date: Mon, 14 Jul 2025 11:50:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/arm: Skip loops in init_pdx() when no PDX
 compression is used
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
 <20250704075428.33485-3-michal.orzel@amd.com>
 <a6ad4ea4-8eca-47f6-b814-84aeedd1ac3e@xen.org>
 <037ebff1-7e78-4170-a636-989e534dc11a@amd.com>
 <6b89c55b-3aa1-49e6-8ee4-0761234aa7bc@xen.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6b89c55b-3aa1-49e6-8ee4-0761234aa7bc@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bb879f-5be6-4461-fde5-08ddc2bbe851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFdlNFVHWGM2VUlGbFdvUU5rZklNVFNPRmdVSXFHVGxaYWhMU1NPM05sdWhP?=
 =?utf-8?B?TXhCUG5rTkR6QVo1UnpvTlpLZ2tobGpGTjFyUC9NR2wwQVlDcDNFY0YxeW5l?=
 =?utf-8?B?WGNVNEtzNkVxQnpjSU1ISDY2R2krUjFYNzFCOEhBNU01OERra0JvMGZQV1Jv?=
 =?utf-8?B?My9ucWhpazNXMkhsK3d5RmFKV2lvMnNISTdvek9mZXBTSzhlS3F2cktIMEl6?=
 =?utf-8?B?WjJLWkE2bzgzem5yMnh2dnZuRmNQNEp0SFZCU0lEcmFKRjFZSWZnVnFCNThQ?=
 =?utf-8?B?TkN0YysxVUZZNDY1ZlJMaWo3UElzTlNEY0hObWN0dlUveXB6eUt2Z2lOYU1t?=
 =?utf-8?B?SHpPWjBJakM2eDVSbW44OFVhU3M5NUpIUm8zZTdCdEMxOEdqT2FVL1dEcytY?=
 =?utf-8?B?SGNlMnhJcDBZSFNwK2dKK0Q2Qm5RVVNNZjROS0JIa0V2ZUZEaWhQS0JGRlRU?=
 =?utf-8?B?aTZuaUgrcmhTWVFqcitsV0p1d2J2TEgvS3U1R3FkYSt2Zk1yK0c1bVhiRHRw?=
 =?utf-8?B?U2NFT202bC9LWS8wcEs5VmUrU2dBOTBLVi9oTlErZTk2dmV6QTkwZVBQaG00?=
 =?utf-8?B?L0hvTFdqMGJMeFo4MVlQOWlyMEZnb3pGR091RlhsbStvcVdwS3IwbGNDYmdm?=
 =?utf-8?B?UytUU0lyUUNZbkUyMG1KVXZhWHdnczd4bGU4OEVwWkJrMFo3cHl0eHFXQ21j?=
 =?utf-8?B?SktVeDg3cE9MLzdRTzNGN3ZqaURTOGFTbml0OWNLWVRrV1NYbGluZGxXRWdG?=
 =?utf-8?B?aC9kcjMrd0dGSVZweUdmYjZSdU83Qm9OL240SDhZWDZGaXJ0YTRKQjA5S3ox?=
 =?utf-8?B?Y0l6WVh0bjVwRWN2WXRpMGJGY1drb1pNejBwa01OQWRKL284bUxBQ0NuSVg5?=
 =?utf-8?B?NU9DSGVaYVpYem9IRTdYWTBCemY0dW8xejNvMXlycEhDWk9GSTNyMEU5clJE?=
 =?utf-8?B?NE5ubkFhaEF0TFNDRDlacGNaV09DMmx5V3pyV1dJdTh0azZldHhPd1lKQ1BX?=
 =?utf-8?B?ZHgrekVOYktWTTltMWZHV2xmQnVaQXMyMStjVkg2SjVzZEpsVEhIN0FyNEtG?=
 =?utf-8?B?dlNZS09IM1hkdC80SnlUWjA3WlZtazkxQXdFcjNmelBUR3h6K0dOV0dITmlP?=
 =?utf-8?B?NWJDS0hRTFV3TzdzVVBxZEcvMWp0WG15RnU1TU1mbnJONjQ1bE9RT1FST1ds?=
 =?utf-8?B?ZEk5TFJCcU1MOUFDcjM3VmVsZFBZSjk4dVlXSWhsVm8vRHFIdTFvZUQ0T1hY?=
 =?utf-8?B?SVR1bEdaeURWd1R6Ykk4Z1EvL1pQTmZHUnpzNGZFQUtoUzdtTEQrRkZEUmNG?=
 =?utf-8?B?cmdwL2xkWUh3NnlBb284WkNnb1I0NnJEdUNta1FVeE5mTkVVckxpQVE5UElh?=
 =?utf-8?B?V09iUm9QbHJxdzc3R2JON0EwSDcrakVENFRQR044bEVHV29VdnFVYUpxbWRh?=
 =?utf-8?B?U21sc1J6eWg3Ny9vK3pMdHoxb1B0UDA2NHNFZzJwZXh6OGoyMDZmM0ovbHYz?=
 =?utf-8?B?aUZCZjFadkhjS29jZ0tHWkt3TjB6OTBHU3BEbzJMUjdwYUpUU25ocVVlMzhz?=
 =?utf-8?B?c2lOZUp5R1oxMkhxazNMSnhIRit2eVkxMkVnUitUKzU3ZDF1aW41djZhWnU3?=
 =?utf-8?B?TTJXczUveXUrY2lnY1FaTG1DQVFnY0J0QWZ1TG1QbnZkZFhNVmtSZHpBcW9V?=
 =?utf-8?B?QmhpdU9oc05Pa0dWNUZEMENkT0NjNzI0c2ZRdVphY2JHVXIrbWt0d1pEdENE?=
 =?utf-8?B?cWRhSXloOW9EL0tGemZPVzFkbFZnRDBKWENwNTRtckd6dFVlYVhlczNLKzNQ?=
 =?utf-8?B?RklWbUwxVGZwZHBLcURVeDZVVlpLWnNYMjBJZXBFRytlbmRZTGtwcjZpaGxV?=
 =?utf-8?B?ZjlUdDVPdmY1dkwrWU04R0QvSlUwMlpwYklKQW96OTlWNUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWtMUjl0TlloY1FHNWxVVlNzejNDaTB1MUZQTlE0N0xpOXI1c2kvdHFNdWtB?=
 =?utf-8?B?OTNEYWp6cDZ4c1R3Y3N1R25pdHdmQmRwUEI5QVdIYWM1RlY3VXNvTkhYZzJM?=
 =?utf-8?B?QTRHZ2plTHdiRnlSY2l2MmxGSnEzVWtkMWNNMHlvSHNqK0xES2Y2UWxhamU1?=
 =?utf-8?B?VVBXb3kzd2d0d2ZldDFEOGh1MVVENGNuelVCc2VWY3Fud0k5TlZGZTl2NEZZ?=
 =?utf-8?B?andjeS9jT2lrUThsdmU1bkpNMGE0RDVrYUVCSTJiWi9JMzFndlFKUTFydmpM?=
 =?utf-8?B?amZPMTRIZWJEQ1ZNZWZIRktGRVJSSm16YnpKU1NmcHVRalUxc29DTnZIUjdR?=
 =?utf-8?B?UzFhRnRINmJzMkJlVEZXLzJkVkdQWkZpc3pEZkUzWmNvckNTeTA2ZGl5Zk9q?=
 =?utf-8?B?SXJtbmd0eVdpYVBQdFZ6dWtoNWFWK1VSTnlyVVI5MDBFMWd6KzUxWHYwR09q?=
 =?utf-8?B?Sjcwc2pRL3F0M2hTdWx0bFRMMTV6Y3lURUpYYVFoSkN3V1BzNDRzMVdzQzFQ?=
 =?utf-8?B?TzZMcmRrS1NaQTRVZnBBYUxrcjc3Kzl4NTFMWUZHWDFKUFpXdDYxQkZjZzdR?=
 =?utf-8?B?NjRab3FIaHpreHF4RGZGdTFuOVZpcWxVY3hOUW1zem0zb3VmNk9XKzF2RUU0?=
 =?utf-8?B?RnVQb0F0WnFRQjU0UXZDeXdqa2xDaVd5aUNRKzNxWFJoT2VWKzVLZmxJWWJ5?=
 =?utf-8?B?MDBPYWsxZnBwQlJBQm1IVEhxcHh2U0puTkxkdHEwS3lGMzlHTHpyOXN0ci81?=
 =?utf-8?B?TnhjNVNDZlNwU1lkQVZLd0VYNCtQV0xoakJMekdmWnlkM1hQNGtjaXc1L3Vw?=
 =?utf-8?B?N1c3YVFTWGxreUhNNktUUmZtdlk2aEtmait3MlBmN20vaGtwMjdNVElVcUFI?=
 =?utf-8?B?WjFRVVhscFBlc2RxRGh6MXVGVDBFTGZha3VWVFZpQ3BXaEkvc0VnVkIvMDFs?=
 =?utf-8?B?NXJkT0RWSjF3UGRJOElvaWE3S0daaEl2WXlMZVFUQ0tVdHBSb3Z5Z0lmNjEz?=
 =?utf-8?B?RjdZWVEwU3JJbzkyUng3enJid0k1emsydmkxYXRoRFZDK0ZscUJtSHBBK29O?=
 =?utf-8?B?RGdzRHZibTdTR2hBRENlS3BJNml2WXA0VjFhakhxNXBHUmRHeGxIeG9nK2R2?=
 =?utf-8?B?R3JTcVR5RHZOby9SY05vb2s2QlJqWjVuTENpWisrSjBJYmFpU1VYNHNuMFZE?=
 =?utf-8?B?eWVuTWRKSitiUUpDVWhkK3BvZzVjYVRBWXNVaW9xV1dNMVF1NHdRNjZsODRm?=
 =?utf-8?B?dVFqa2Z1TFN5TzYxeHdJUG5XTUh1YXdJd1VvYnVuektsdXZib2dKK2dFQW1p?=
 =?utf-8?B?MEttdHUyaFVIOXlZWFJMUlJVUndoQ3lWUG9ZY1d1NmRhMlg1WEw2cnA1Q1d6?=
 =?utf-8?B?RUYwYzB5S2dBYWViaTJmUkhwak9oMmNJVzU3ejkzd2ZTWHpLK0FBWmJLektk?=
 =?utf-8?B?WTNhcTlMNFBQZXljZWpuVUVyQTFWNHRremNvODMrdzBCNEZEZmxWeXh4L3J6?=
 =?utf-8?B?TVJLbFZZNkZ0RlY3WlZra1dVVjhQaGlqZkwxSFArSVNiZWp3YndEU2tEODJW?=
 =?utf-8?B?MXhseDJ6M1liVExESEs4eTFNSXJOdnRIWmY4VGNNck9NWW85a3VCazJpZlhF?=
 =?utf-8?B?K0pWbC9aaHppbXRRZkxPNDBWaGpOZ0N2WVZqTk1wRDFpV3l5UGRXRTZBcXhI?=
 =?utf-8?B?VU9LUzdDTGt5V015eENzaVRydmcwRzgrOXBvYnJkZmNFRWNMaXNRTzJ4NkNT?=
 =?utf-8?B?WlBCL3FyTjllSi8wTkNFQnVMcDhPMEtWMFY3bTJaVFBybXVteGpiRW9OaDF3?=
 =?utf-8?B?NnJCRzJRNzlkejNJMU12ZmNrazJyWklLallhdEI2dWMvdnowZ1R3cjFvWDEy?=
 =?utf-8?B?Rk5Lc3pRMmNQQ0VaMHIyNnRYRnR2Q0hvZXI1VW9wVkFtbXRRMytKVUd5KzE0?=
 =?utf-8?B?U2RSaUJ4aXZ4OFQyKzZmWDVOTlNwWHdaN3dnb0t1S2E0N2pVV243djJjdXdk?=
 =?utf-8?B?TEt4Ni90MmpmRFhGUTk3MHJBT0JPdWRVcmFwcjBHR1RXRjVLbVNmVWVQb0lj?=
 =?utf-8?B?Ym84dit1RnAwZXQvS1Nza3hOdFVqR1hWeG9pWlVsNVdCZWJLY0VRMUM5bUFH?=
 =?utf-8?Q?V64O3JGip0dbT4PTtSSKTpSNl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bb879f-5be6-4461-fde5-08ddc2bbe851
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:50:47.1197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqbxDyvNNnrhMMHzf1N5Ze7F7N7N6DtrbqiXUXCQtUTh5Dbu0lU/elWxo5jTn9w7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191



On 14/07/2025 11:45, Julien Grall wrote:
> Hi Michal,
> 
> On 14/07/2025 08:37, Orzel, Michal wrote:
>>
>>
>> On 12/07/2025 12:29, Julien Grall wrote:
>>> Hi Michal,
>>>
>>> On 04/07/2025 08:54, Michal Orzel wrote:
>>>> When CONFIG_PDX_COMPRESSION=n, pdx_init_mask(), pdx_region_mask() and
>>>> pfn_pdx_hole_setup() are just stubs doing nothing. It does not make
>>>> sense to keep the two loops iterating over all the memory banks.
>>>
>>> I saw this was already committed. But I have a question. Wouldn't the
>>> compiler be able to optimize and remove the loops? Asking because we are
>>> trying to limit the number of #ifdef in the code hence why we have stubs.
>> Before submitting a patch I did disassembled init_pdx() with and without my
>> patch and in the latter case the compiler did not optimize out the loops.
> 
> One more question. Was this in debug or non-debug build?
It was in debug build.

~Michal


