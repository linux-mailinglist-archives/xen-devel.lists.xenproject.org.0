Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D451D01FDA
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197513.1515028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmnn-0001tD-Iu; Thu, 08 Jan 2026 09:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197513.1515028; Thu, 08 Jan 2026 09:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmnn-0001rf-Fh; Thu, 08 Jan 2026 09:59:35 +0000
Received: by outflank-mailman (input) for mailman id 1197513;
 Thu, 08 Jan 2026 09:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AIqS=7N=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdmnm-0001cy-0G
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:59:34 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb2fced7-ec78-11f0-b15e-2bf370ae4941;
 Thu, 08 Jan 2026 10:59:33 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB7032.namprd03.prod.outlook.com (2603:10b6:806:331::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 09:59:28 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 09:59:28 +0000
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
X-Inumbo-ID: bb2fced7-ec78-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3mZRfy9RqWZatSVpjdiLDTx5oTIz4XY3C1QuawO5t+66tdewV8VljIC1e0wovw78cRpehCvg/oQMF1qRtu5pl69y2/okwe56IE569IHkAhNRBcA/XJe5Xu05wEC/7+3IY4VMiFDQGBzHX6NbBnH04BDxAZgnyESBbBY9i9NU1K/Kuz3ZdSNrp6OIRGfg0vmCeuMrgkesCFEPGw/LHtnosWBqOwM2mY+4vGV5BsexBarwkxxGW8j6wWK/nJ2LXNx25ncIL/SMKIPKTe/0UEoZ6VDkVgg7/L8gOhXRPaD/HqM0PP4Bj9Zsjhmi92QczWTxYDv9Fw6ZrzEHLNYMbIhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClV0gkNON2xJyWUpmDrS5WYVzPvew+jnbBMKl4qeRug=;
 b=Uil6xX9kLbmOcAnRqJiSt0/XfYQC3dnCY9QpiDsoWWfyWcKEHQTHq6f0CRuuU1aqSU+lfCCI4HqSq/OhJzzzR0f2MaV8xOJoLdrtHzXZ0lU8KKk1LIBPnSlBJ0KXo6dst/uTz6fv5zzzWPPuQou6ZJa4MNAYkm49yn9f9FqpP36sbS6Db8XamZPXP8V4ospFV57dRg0u1Bg7SsiyuGWaVNwLzTYTHhKlZ+Q2QUClwMQevw8zKisASlUQGfx8w9g25MUEhG2n+NRZraXBdbFpGUsuKTjZ7atv9yyCeRMwhB2suGuBOolGFZDuNV9PXNvyh81lGX7Ia6Kzdm3BPs4/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClV0gkNON2xJyWUpmDrS5WYVzPvew+jnbBMKl4qeRug=;
 b=An+yGupsLYOuRoXqVE2kTbkYW5TAAouA3cNpKSPgKZtJw8JmdcqX4nNqtovriyju/SDGP32OVuveEukaFlkVjqr4Yhw+arUtCbooxK/2sNUpO1REQqnwfxvo/Okk9zoTEzvjCDYnWbdhA4IAAkFIt+r3TxbDPZjlsJkNgB5aL2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 8 Jan 2026 10:59:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/hvm: be more strict with XENMAPSPACE_gmfn source
 types
Message-ID: <aV9__PHSSFIJ19zT@Mac.lan>
References: <20260107203259.59369-1-roger.pau@citrix.com>
 <ce0282f4-2b8c-42cf-a53e-d74202b2ecc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce0282f4-2b8c-42cf-a53e-d74202b2ecc9@suse.com>
X-ClientProxiedBy: PR1P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 561cb7e8-dd07-4924-9b88-08de4e9c9ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFcwNkZJeEVRZTBrelNvM2cwNDdFOTVBRkdkdUt2U3VKdG4xQUdhUTE4YUQ3?=
 =?utf-8?B?Vkh3UFV4UXpjVmRGQjE0L1U4djAzb2cvdnNnL0dSY08yajRGcGgzQlhEV2ZU?=
 =?utf-8?B?WlhHNkc0R1poMUl3Y25YbUdnTkpJeXBDL0ozd2tHUWlIMmF0MDVKSHR6NVdx?=
 =?utf-8?B?aWVSNzV3K0duT295SjVVTGQ0c1RFT1Ezb0JJV1ZoRFNRVHlzVmRrK2gvRkFI?=
 =?utf-8?B?cUNuTVU2OGR6aWZkYUdTMTFveWFkbUVzZFhNM21KcHJvb1NuY0ZDb010cmlT?=
 =?utf-8?B?YkJDSWxhcDhmVG81cWVKV3hMM3YvZzluOVA5aWxBRHhGYTdqaWFGNHBJT1VP?=
 =?utf-8?B?TVRCTTNjSjNRdHNwTDdjZytaSVdtckhMQ1BpRTdXVFhYRzR2L0ROcWUwRkpm?=
 =?utf-8?B?dDhYRC9hVHdEODlRWE1EK0preHpTYVk3WWRvMlVpT01lcEpoSXU1THZGK1R3?=
 =?utf-8?B?L002UTlkczBwNEg2d1hGRlpBcXpHd3pMSEFWcHJ0NUNWLy8zU3N5L0l3czhk?=
 =?utf-8?B?aEpKTS9seERhaUcvSml4ODBTcFNseklsWjYrMzU3QngyUi9ITVFWZEdvQTRE?=
 =?utf-8?B?anFNVllOUFZLVFBDZzc4djV1M3NzQlJwbS9nVm1RNGpIMVVUcG0yVVlqUTIx?=
 =?utf-8?B?WS9KV0dCTndVVlBiVy9oQU96b2dEV2ZzeGxQZnBKdDhQcTdnWndBRXhxL1RD?=
 =?utf-8?B?Ty9vZy9ncXlLU1h1RTBTV0YrUnViL243OTdUQzFPd2QvTGNwUDUyOGhCNkpu?=
 =?utf-8?B?d3I2cktVSU5oaXRWZjg5QXpxS0RtTUp5SmlNc1M2eXNReFhUVktMSlcyMDZL?=
 =?utf-8?B?cThsSXdtTHlPMWUvb1luQnhFWUQzbFZHc1c0MWpCblNEc0lEY1ZLM3d5ZXkx?=
 =?utf-8?B?T1d1S2g1RVQzVFhHaDB1TlhKbUtSM1N5aDFqRXVHS2dUVVpIcU1vT2Vsak50?=
 =?utf-8?B?OUJRcGVnb3BwZitHWUdEQVZQN2UzcW43T3ZhT1I3T0hDdE1ibmh1RCs0anEx?=
 =?utf-8?B?MDdUWUVQM0kvQUhYcVZ0WGtndGlacnVROHBCVXdmNzcrazFvNFpoQjA2NnBo?=
 =?utf-8?B?MzlYVkdUSE4waTJnUWtqTStxQUlsS0ZuUnBJR0VpOUwxNkdQci9vSHgrWnlx?=
 =?utf-8?B?V0NpR0NXenFCSXdJeVM4WWNEY0FTSHBVMDE1QkhJVENPaTBYeFR3VkVHWmpS?=
 =?utf-8?B?UkpxMzk1ZXB2N1BGV2N3M1BpbWVJV1VVbjI0Wm1uVFk5U2hCamNDL2t4Q2ZP?=
 =?utf-8?B?SnZNZlhxd1BuT1BMOWJuZmxHR0lkeGJiYVpuZFNQaXA2OUgycVdlcjRkVG5W?=
 =?utf-8?B?U083Yk0yY2NYVTBPd0lIWlpZZ2JBczMzZnU1UFBZUDV6VjIwOFI5Wmd0eUEw?=
 =?utf-8?B?U282ZzVxeU8ydWo1aXppTEp5WnQwdTBCQXozTlg5OFM3K1plbzgrVC8vdHZV?=
 =?utf-8?B?ODQxUDNYNFlDeUU3ZGlsT3Z1RkVWNVVBaFVwak1mVkU0L0tUb3EzYStvaG80?=
 =?utf-8?B?Vi9oK2R0dlB6MDRLcGRuYzM4Z0x3UDF2QW56c3NXc1o3eFhOMlZ1UGJqNTdr?=
 =?utf-8?B?Y2xVcnJhNkRldzRzWW4vWW1FK2JkeXZ1M0FOZmZ3UnMyNmJsQUpNWWF5NnlQ?=
 =?utf-8?B?V25BTUFJYTcrdStZNnRGc2t6QlQ1bDJsQ1VxMGpxUU9CVWJBWjBNQmxtTVNV?=
 =?utf-8?B?c3JYTzVmMEdCVEVib0JjUERPcVM2bjArM0lTMkw0TVVDVFRRTUtIUDBuaXZC?=
 =?utf-8?B?VG1TMitXN3BaSU9HUDBrVVZ4VTk1MVNaMHpOdUtCTCtCaWFkV0VnRjhnTXA4?=
 =?utf-8?B?RzFKbTRKTzB2cXo2Z2piU2RLT3JPMVJLYlJlRkM5elpobllKRVE3NWJZV09O?=
 =?utf-8?B?NkUzNFFtZHA1UnljZEx2K0VxcXQzRkhta09qWUllcXNxQ09LeGwybmlkOUV6?=
 =?utf-8?Q?KTYqzWZ+MhOY9mJLvllyV1x2myfmrlA5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGU3eEo4bzZPaUlaOW1xdHBDazBGR3hxaEZmc0Z2MzZscjlQRkpoZDBVU3JX?=
 =?utf-8?B?OWNpYlRtOHBKUi9pdnVSNkNYUjRPQVVHRFlOTzFwRS9kbm9seUxWcmxGNUlp?=
 =?utf-8?B?V0JKK1hUamVUaHlRMFJ6T3k0TWtIQXZLdWNNL0R3K213OE5BVkJlYUhRTFY0?=
 =?utf-8?B?aW9xcW1SY2lZaW5NdVVaY3ZadXlTelNDM090aEorSkdiei9HdUYxU2ducWJh?=
 =?utf-8?B?VHJhT3haNnFLRTRPcXFUWTRZelRDUXExZE5uNWRlUERyWVp6UStWT2dQVU1K?=
 =?utf-8?B?VjEzNW4vRkg1RUd6eGpDSWhmQTdERkFWQk14N1l5VWZPTTNLV3hkV25jckpC?=
 =?utf-8?B?d2lpc01WbG5aNTRUdWNjNmtWeW56M25CV1RucVlDeEx3ZXQvNDB6Z3ZJdDh1?=
 =?utf-8?B?dDIwVzcwQzQ4QVdpTmljNnRQSk5jZXNUdEhNL3N5S3BXQklWMzlRREc5Ulgx?=
 =?utf-8?B?dlZLa0ZtVmhHaGNXNnlxclV3N2lBT3ZOc24yenU0TzY3MkJvWVRhVzV2TWU2?=
 =?utf-8?B?VmY1L1lvUnVwNVhWRWxvcGZ3azlubVN0NCtlQ0xNNVZXcmx1VUptQjV2My9S?=
 =?utf-8?B?VUNoZHZwSTkzaUU1bWtWMFFxWDAzWEE1cnUwKzI5TXNreWMxdkxybkJMM3ZV?=
 =?utf-8?B?dW4zQkFSWU1ubWNaMjZncTJpWmRDRHpvS1htdUtDSGNPd2ZHRDlIallLOVVD?=
 =?utf-8?B?WVFvazVKSU5yUWxDKzJTdXA0SlpzSndTTmVzcll6TUZlRFlNL25RYU1Zc0Z3?=
 =?utf-8?B?NEEzcEJyWW1STG9OT2sxbExyWW9WUlhhdGxNcXRrR1VkTzYwOE1EbzRWU0xv?=
 =?utf-8?B?Z3RyMVU1cjhrZ3VlUTR4MDI4M0lKZUV1ZEdaVkdQbUR4QkdtRlEzWk5KWGhk?=
 =?utf-8?B?NHZUbHo4VnFmN1dxK3hCZHNDQUNKRGZEcy9wT1FIZjZlRllnQXBmcStMcGxG?=
 =?utf-8?B?MUM2VWtsMGNPYS9vRmozT1BVdjBIbi9IaFRES3JqVEEraC9razBYWEF5V2o2?=
 =?utf-8?B?UEVnU1gwZElOcUxsSlNhTE14V2pPbGpsbjhVMVB6UE1PYitDSFpFLzVKeTgr?=
 =?utf-8?B?UFp3YTF3RVN0RkNzKzNJQjNHNUk4LytMTjBrWW9SejNXUERMMVBYZFRFTmNR?=
 =?utf-8?B?dTQveUYvcm5wblB6Vlh3UGNQNWdXUmJwdERpRlprNGYxL0FWZW5JZlFvM0NR?=
 =?utf-8?B?UVFoOUU5MUxvcm8yZkFwWm8vYUxyZlNxWndnZFIrd3RNNjRlTDIxOHBOTzFr?=
 =?utf-8?B?bFNMSnRrSitQZVhXTFZML213SXh6Y3YvVjJwZitTb0lwNm1LRjc4SGdXUXBp?=
 =?utf-8?B?TGJtbml2alV4Z3NxZ2RtYXpnbEU2S0U2MWYzVFpwTFBNTzg4Q21XOVlhY09q?=
 =?utf-8?B?QytSV0pXaTVZTERWaGdZZmlTU0JDK2VlSi9YMEV3YzBlc29SaTlZdUtUQjVV?=
 =?utf-8?B?dWd5SEliQWNtYVlMbXBzblNHYjhGbTdxNWFXNHFlMlllNWVlNlAvdGx3Zlhk?=
 =?utf-8?B?c1NCUjFNWi93UzFTZTR2ZUVZOHV4dlhoOHl2L0ZNS0pXaWpyWkVEVW9JVnFE?=
 =?utf-8?B?MUZOcXNVbkxwNkpRWGVJeU9qeWhLVzJWNm4zaGdldzgveEE2S1BOL2M4c1Qy?=
 =?utf-8?B?dm4rSnNxL1ZzTkY2VjY2WHRoeG0xVGhzS202RWR2U1ZDWnRsZEVjZENPWHlQ?=
 =?utf-8?B?bEtENEh5VG1PVTQ3QmViNlREa1kzbTF1RmpIZ3VKeXljWTBwN0k0SE52TTU4?=
 =?utf-8?B?TjZzNnl2RWdUcXNvdUVieGFxTXVOaUlndXJJRnYyT0p3R3p5L01SN3RWakQy?=
 =?utf-8?B?ZHNuWlhnZnBWOFdaMW9PVWlyQnFPSGl1T3JCRnBUSXNsdUxlTDIwKzhXblpo?=
 =?utf-8?B?QVdQTmE1T1dTOUxjbzNMeFJhanFWb09sdGhSYW9vTTZrUVZKaS96UnlkalJk?=
 =?utf-8?B?a1RGQW9xT1ovMnVFWHE4ZVJrbHFoaFVoL0YzQnRWSHVlN2YwRGE3dGJNRnNJ?=
 =?utf-8?B?enFHVUg4Ym1oMzR1c3FHTElveTRnRHQxaVpMbERtRU96QmwvTlVrY3dWYjdH?=
 =?utf-8?B?WEtha1Z6WHEvMHFnaERONmJScllkYW1DMWcwM3FXS243ZHp2UjFjMDg3TTRH?=
 =?utf-8?B?VmpET3ZXc0M3a1FCSmdLSStCK3ZWZExMNXRUVEdzVWo5eHZieldMbUg3Vi9O?=
 =?utf-8?B?SXl3cUtaVXhFT2hVbFkwek5JeWp5U2V5Y3NocXhZcVZ4eEcyUXdmS0lTTnFy?=
 =?utf-8?B?S1g0MngwTldiT2dpbVJGcDhvMDU1TXZZQ051cWZXcktrZzdqUnFYQUFoaGlr?=
 =?utf-8?B?UFI1anpMb1BubDFabWdxZTVlR3NFTy9BU1VWT3FmS1I5b2w0aDNHZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561cb7e8-dd07-4924-9b88-08de4e9c9ca7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 09:59:28.5195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxrrihcPDa4Gpq6NuTK+YwnUy8VEaMBg1KoXTajwXGPycWNYvqv4ae6pbFu006v0DksOxFUq5AtOi8k4fyEUFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7032

On Thu, Jan 08, 2026 at 10:26:47AM +0100, Jan Beulich wrote:
> On 07.01.2026 21:32, Roger Pau Monne wrote:
> > XENMAPSPACE_gmfn{_range} allows moving gfn around the guest p2m: the mfn
> > behind the source gfn is zapped from the origin and mapped at the
> > requested destination gfn.  The destination p2m entries are always created
> > with type p2m_ram_rw.
> > 
> > With the current checking done in xenmem_add_to_physmap_one() it's possible
> > to use XENMAPSPACE_gmfn{_range} to change the type of a p2m entry.  The
> > source gfn is only checked to be not shared, and that the underlying page
> > is owned by the domain.
> > 
> > Make the source checks more strict, by checking that the source gfn is of
> > type read/write RAM or logdirty.  That prevents the operation from
> > inadvertently changing the type as part of the move.
> > 
> > Fixes: 3e50af3d8776 ('New XENMAPSPACE_gmfn parameter for XENMEM_add_to_physmap.')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes since v1:
> >  - Also handle logdirty types.
> >  - Return -ENOMEM on failure to unshare.
> > ---
> >  xen/arch/x86/mm/p2m.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> Since this is now ready to go in, the question of backporting arises. You
> explicitly wanted the change here to only go in on top of what is now
> 98fccdf0ac7c ("x86/mm: update log-dirty bitmap when manipulating P2M"). I
> wouldn't have considered that for backporting, but I guess for these two
> it can only be both, neither, or said earlier commit shrunk to the minimum
> required for the change here. Thoughts on which route to take?

Maybe shrink 98fccdf0ac7c so it only contains the added
paging_mark_pfn_dirty() calls (not the clean ones)?  That would be
enough for the dependency this patch has on 98fccdf0ac7c.  I think
this would be my preference.

Otherwise we could backport just this one, and loose the correct
handling of dirty GFN, which TBH is already the case on all releases
(that don't contain 98fccdf0ac7c).  We won't be making the code
strictly worse, but we won't also be fully fixing it.

Thanks, Roger.

