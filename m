Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19800BE3206
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 13:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144472.1477862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MNU-0007Ag-Gg; Thu, 16 Oct 2025 11:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144472.1477862; Thu, 16 Oct 2025 11:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9MNU-00078V-E7; Thu, 16 Oct 2025 11:42:40 +0000
Received: by outflank-mailman (input) for mailman id 1144472;
 Thu, 16 Oct 2025 11:42:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIav=4Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9MNS-00078G-9H
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 11:42:38 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35e4761f-aa85-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 13:42:37 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DM6PR03MB5163.namprd03.prod.outlook.com (2603:10b6:5:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:42:32 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:42:32 +0000
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
X-Inumbo-ID: 35e4761f-aa85-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsOguVFh3RGcwveneXBX8xObwUf8ZtS+haBfmUBrf7s1Kd1oW0WxnWA58ZSaESrDv68scPba2nxUELQuEv37baudclvoq2vZdSlicx90MJLIEKRAZ7OZPDk43WTfnbqYsSufVTkF4FccX2Vxnh4KOfmP1eNFX29rV7lyh+BHOC5MV2d6pIZsjBIFx4SEKNsRis2coLtKsdJnZY36BXo+fdvIX7RCY2fKfXpLZyximhbx1GwOwTce9Gvfa94kR/AaJbEYIp3y8okKDVsSXNjDEoh9Umy08ivavy2wv+8y8H2CtAz7ezk0LDdRxvvyiZxnnO2fayAhzvqI96dzwySgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQTRCyFqq75d3Ak+pfY1aL9k/GP4dLpmN1yAqIWm7vw=;
 b=Q5VCKg4P9Z5D7Nd43jNdow2YXDAru/nQcnduA+KEk8imoxvYRGvvMcH+gvDMOsoHzwD9mDi1BJHNfoGBwGaAUwXmnJLrfUiRleguayH5XWZrmLblDs+4YkhktjlVrTfMrTS62HqYKDjIoh1djo4u4J0WLr51ToyNTAOPts7sQoJSwLQrPprQgqT66w+spYigdukmN1JYN5Bv8Ed/qU4BNEfcKLaHNtOn2IW7wS8aoi7QB0iyWqXwNvMoVAFxm6sKNgi89iHalKGk/WVvPg0PBpiBKQxRgvmTnaBACTV26U8ZVzEBmBRAEklcLODRUxsQSGrQ4XHiMmD7oMSWXAljpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQTRCyFqq75d3Ak+pfY1aL9k/GP4dLpmN1yAqIWm7vw=;
 b=jRGjVJwv9F43CTATHa/83lGj6kQ/wWtkXMBdNdNbuBoTw33n+uVWPTQv3eDCaqwzP+1TaWCyXjCw6OJ6O3mZXBSTfUW4ca1YImBEjftBu58mmWaAfQOOQxBxa34+0/neu3zJA4jOdKIWz7U6XiORlcNca6XZkQmPny06J3zxXac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Oct 2025 13:42:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
Message-ID: <aPDaIssJOFh00-W7@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com>
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DM6PR03MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: c27414df-f130-416f-6e89-08de0ca9163e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVN4NklWbWF2bDZ4OGNZSXU3ZDF5Zll2OHVUY0I2OExYZnJVeFhQR3hvRUdq?=
 =?utf-8?B?c1F6UGh2eS9WT1pzbGNZV1c1R2ZVTG5aTlF4KzUvZWdBeEhTNmxaa3dYald0?=
 =?utf-8?B?SzhwV3Z2TEROTVpKM0E1Slp1dVFrdzBlbXN4RXc4MFRvKzkrWVZBcjVjZzU1?=
 =?utf-8?B?cHRkNmo5VHRNU0NUR0NiSURyMjhZU0pYci8wYW0zQzNjSDRIdTI2NEZTa1Nn?=
 =?utf-8?B?cGRjOGtkY2E5Y3F0SERsU0xsT2M5M2hzK1NaekNVY2RBcEJ6ajQvQ2owMzRp?=
 =?utf-8?B?RWdrMk8rdG55K3AvcDVHaXg0MFpMTDVOejVWeC93RHptTEdEVFhJYVAvZHh0?=
 =?utf-8?B?NFZ5VXNFWFp4VW5zWHM0bm9xUnpmS2hzK1R6UHIrZkpUUzhLWEJWSFh1akUy?=
 =?utf-8?B?QXl0TlRHU3hWYWduMVZzUXNEdTIzT20rSnhxOXhuWlZkb3pPSDViZTYvY2dt?=
 =?utf-8?B?REkrYTBzV2hWMDI2SFhLMUtybEc5K2Uwdzhvc3VpQUwyYm5nZ3lyWTZQWkdG?=
 =?utf-8?B?d1NhRUVZQ1JsWExoWEkxU3lhTUZZNUI1SCtZM2tBU1ovUVdkdmRYeGkrdER4?=
 =?utf-8?B?ZVJZbENUQnBtVldQK3B0d3pqUXJnQVBKMFJSTElOR3RYTXFnYjJORWFjMFBo?=
 =?utf-8?B?eEhiYWNRbWo5SjdTOVgrYktndEQrUHk5Zkk3UG9TSFJVbEhnY0pjYVJTUFhC?=
 =?utf-8?B?TFhHNTg5MUNUczFLdmcrY3ZhRDFQYXZEZGlxTDB1bFBoVmtDblNRL3pYUi9G?=
 =?utf-8?B?cGg5YUtHVXdTWmJUNGkzYktzdlZxY3BsNW0wd3dwU2g5OWlwK3kxc3c4YkVS?=
 =?utf-8?B?T1I3VjRXdHJPQllTVm55N2oyMmo4QXV4bDc4SlJvcllTZTNkdU51NzE2R3RO?=
 =?utf-8?B?VThFWkk0S3RhN21oSDBqRjFJcDVQM1JITFNnQzV0UlRtQzE1bVhOUjZEdVhz?=
 =?utf-8?B?aHgyWWtvaW5jTTlQaXlaQTVNWDBuKysvWHMyMG9ZMlVXY1FUK1BHZnp3Mkhk?=
 =?utf-8?B?cDV6UnZxbXVRU2s2cW1UK2xlR1dhMWQzT1dIcmNmYktESkh5M0xkMmEzblVt?=
 =?utf-8?B?Y01mNXVXMmJBOFB3endaZWpsb0lCUkgyN282d0ZxeWJaTnUxODdHaTJaWFJW?=
 =?utf-8?B?N05CNGcxMENocVFhdEdZbTJHWjBEbCtDMFpPZmtQdmkwaUE1Rkk1aExKNEtY?=
 =?utf-8?B?bmJtTnlRTDRNc1hYbVVETExqQjl0Y29KSEhicjlIM1Z2YWNhMnF0TVZHZzhG?=
 =?utf-8?B?bHU0Y3JxNEtFT3Q2N01ZZWhEdnZDUlNWNXA3azVtaTl6bjZGVXJSd3JTdkti?=
 =?utf-8?B?OElLb2wzQXRjaE0vTXh3dmo0MzM2QmJ6MjFWVGp0SUJmb0hVRWJabUJTMnov?=
 =?utf-8?B?aTNqOExkbml3T0xBY1BNU1lKSUVnb1p1UE10cElUUDFsUDY1dlBQS0V1aVVU?=
 =?utf-8?B?UmpFV3oza0s5Mk1sK0FSMHBqdWpaNDdQbUR3TkxqUCtGV2p5T1BKS3dHeG94?=
 =?utf-8?B?alc1VUFZc2t4ekhPTVhxSHdsdWxKUDNXNjd6SllnZ3VQaFlRb0dXQmwwQllp?=
 =?utf-8?B?Vi9Wa2dmRlg2cVI2Ymo1eDd1Q0U5eVRHQlZwOU9MSTFGQU5YbXZ6ektaMFRq?=
 =?utf-8?B?YTZNRjBaemF1aTF5bkZ1S214a1JtSDh3a0ZyVzE4ZDR0WTFJZ05LaUE3Q3Vm?=
 =?utf-8?B?akQ0VFM4dzh4ditCbzFlY005TGgwandrMXlicEo0WUppYm15MTdEZHRZK01X?=
 =?utf-8?B?N0l6N0puR2ZNaE9lbzNBR0NESEFHY1hOOUlPWGxTK1hEQmxCTk9BallacGlh?=
 =?utf-8?B?MG5zNExwMlFYQkZ3bENDZXhwclkrRDFwUWh0bE1McXIxcEgySk1zRUJGaWN0?=
 =?utf-8?B?Z0NTZ3EyWndhSC9ydnVJak55cWdVUXpodnc2MFNGQlV0aVJycndrVDVNYjln?=
 =?utf-8?Q?hmCQtCECJy6oVavy1bzZmLGDw09cA9zk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVHb3ExMXpObEZNK3Q1RjlqR2VTaFhDYStaTnZZbWJuQU1kUW50WUFHckVv?=
 =?utf-8?B?RUJVSW5yZkRlSGhwK0lMTVduVTZtY3o5cGNiUExDUGcwWWdQQ3EwRHpON085?=
 =?utf-8?B?dTRSSklMa1c1QlNONGp3MytXQnR3MjZoVXQ1Zk1Qdzd6b3FOT2tYZkRWMjkz?=
 =?utf-8?B?bUtsZFhxY0lFa0J5K1N2MU15a3BMTDhXVVZTN1htSkM5aEVOY0RuRlpQRjNi?=
 =?utf-8?B?bjRGeE1JUHdrbGtIZWlzZDBrWE5nRVpJNWNnbi9nMXJnY1FWQ1hZOWJoQ00x?=
 =?utf-8?B?RWQ5VVlpdG95TnllL1ZjR3p0WGYrckswTXUxdXViWE5XOW1ZMDhJNnk3Si9T?=
 =?utf-8?B?ajloZHNvbDNSZ2VrazVkWStsK01nRm91UWFxb2NHczZ4czZ6QkJjaW1ER1Z6?=
 =?utf-8?B?dzVKUVpNYURzcjVvMU45dkwxYWd0WXZGUGVXcHVYd3NCZXFRcE5hZ3FPR3Z2?=
 =?utf-8?B?dDd6RmtMZzFCY1pJSEs1NGp5ejN3MEVSMERMZFR0LzVrMVpPL1FFOWJqb25I?=
 =?utf-8?B?S2ZNejZHZUJSNjRCelBRZ0x4Q3F5UlNibTNIaWFvc05LejVWSzNlUEk5alB3?=
 =?utf-8?B?RHh2MWtVeUkwOUd1VkNyYkN4dCtzcHdCNkNXeCtzZmtIb3lVS2pJZlI1Z0R6?=
 =?utf-8?B?VjVGMHZ3bnFZc3hlNEhrTTkvYVM4cW84UHR5UFhBUHNKOWhZejRUNG5WQUta?=
 =?utf-8?B?NzVqMzhaQy9PNHZPbGxQTzNnbjFya2FMdjZrVW1FK0xsb0ROWnFmRGUyK2pZ?=
 =?utf-8?B?M0ZPUTFjelBiQ3RPbkxJdmVaS2dITTQvSHVyV0hjOWxac0luRHl4NFRUSEdi?=
 =?utf-8?B?U0JzM01SL3FyL2VlTHc1Um1hZHczM3RETldKbjJZZDFwNVFDSkFXVmIxaGgx?=
 =?utf-8?B?dDcwVWtyUm9OOTk0SjNTVWtST1FJYUE1NDVialNrZEJKUlYxdmg2MklzWU84?=
 =?utf-8?B?bkJtbitGR0VxcGNVNzlMUFZpbUNzOWVOZkpzdzZhMkx2V0pqKy9IVmduSlJU?=
 =?utf-8?B?aHVLYXhwd3pvdTZjRWlPZXdIQ1JMYUZtOHFUL1pZckRVV2h4WUFYT016Z3Jv?=
 =?utf-8?B?WUNiQTlwM0d4QndoRzhGc0srSVF3S2FFVkRFS0tKUW5TaTF6ZFhVNzZtdGcr?=
 =?utf-8?B?eGhaOGFKdXd3QnN6R2ZVTmVNcjhwbWhpbi9YVCsrb0pzZ0hvQW5ScFlaelFv?=
 =?utf-8?B?RnMrZCtsMmdub09xQmhhckpJQ0JvMjh0c3VyQkhXTVJWYkpmQjZVN1p2Y2Mz?=
 =?utf-8?B?eUV1bWxMYmYzMzZaVVJhNTBiUU5OcllDL3RDZFh1SEJUV1ZzRWFUUFI2bEtz?=
 =?utf-8?B?OTRLd3E3a1picjUydWlVUGNTM3ZWVmZNQUdCNXFERnRpbXhzQzJ0SGxCcU9L?=
 =?utf-8?B?dHZjRjBvU3RXMkFVWFNPeHRiT1dsQlg3R0JJUmpmU2JzWERtbHBxWW9oRzg0?=
 =?utf-8?B?NERJZWJSRUNyWW1DUE5ocmtnNUNZaEVidDRRU1FvV2dGOVdoa3NHUExacnVS?=
 =?utf-8?B?VEoxVzZMMnJIbFlUYXE0THpxaS85OUFoRHVDZ0w4V3Uwbm9OaXB3VWI0c2pZ?=
 =?utf-8?B?WXdnYk9XOWZVcDl6RVVzNmtDUkFCZTgxbjZTejN3Nng4SEVxYUxvMTdJelVG?=
 =?utf-8?B?UVgyUkdXRFRHWDBGVUp6SDMxTGNDSmduK3ZQUWVPQWY4RzlHSk5tbENpWis3?=
 =?utf-8?B?L0FFcTRyZG9aSnNKRXpJTFFVS0xBeWFEZjJNaGk1SDhrWjV0L0hER1BBb2Zw?=
 =?utf-8?B?S3lscW96R3RRY3BaQWRMWlBRNVhvOXJtZEhBaWVjbnhIc1kvL1JoeEdoekZt?=
 =?utf-8?B?WHFjemcydHRqbTJYUjdhSlpxM1JaYlFWRmYzUlBzamJlbmFJN2U0NmwxYlJ0?=
 =?utf-8?B?SmpKSFdjeFUyZytHb25DK0taYzBXSWgyR0hsM1cwWFI0WUYwcGxkd3RySENL?=
 =?utf-8?B?SGhuSytWQktLRWpMUWV5VVFUTmVWd3E2aWpnSHJ0bkt5UGYyN1kyZFJ4Q2d3?=
 =?utf-8?B?eUR4U2pHWVA3S0RrVThyWnZxMXZGRy9lMk1MajVJd1dsZSsxR1NlUlpzTHFH?=
 =?utf-8?B?UWlzc2d6YzZxVUZ3bmJITGtjMVV5cWpHN09jSzRyTU83N2grZCsyYVhHMEwv?=
 =?utf-8?Q?MlyiblQin+TakjUnhCMvbwyLc?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27414df-f130-416f-6e89-08de0ca9163e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:42:31.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To9gMTFRo+BvtKdTyA/b1usTYVLdFXxxEWiDE0mMQvf12a3xQnpFFCCuvc4/F5Th3S7rI9ZXHSlszIddTVX4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5163

On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
> Keeping channels enabled when they're unused is only causing problems:
> Extra interrupts harm performance, and extra nested interrupts could even
> have caused worse problems.
> 
> Note that no explicit "enable" is necessary - that's implicitly done by
> set_channel_irq_affinity() once the channel goes into use again.
> 
> Along with disabling the counter, also "clear" the channel's "next event",
> for it to be properly written by whatever the next user is going to want
> (possibly avoiding too early an IRQ).
> 
> Further, along the same lines, don't enable channels early when starting
> up an IRQ. This similarly should happen no earlier than from
> set_channel_irq_affinity() (here: once a channel goes into use the very
> first time). This eliminates a single instance of
> 
> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
> 
> during boot. (Why exactly there's only one instance, when we use multiple
> counters and hence multiple IRQs, I can't tell. My understanding would be
> that this was due to __hpet_setup_msi_irq() being called only after
> request_irq() [and hence the .startup handler], yet that should have
> affected all channels.)
> 
> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> A window still remains for IRQs to be caused by stale comparator values:
> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
> Should we also write the comparator to "far into the future"?

It might be helpful to reprogram the comparator as far ahead as
possible in hpet_attach_channel() ahead of enabling it, or
alternatively in hpet_detach_channel().

> Furthermore this prolongues the window until "old" vectors may be released
> again, as this way we potentially (and intentionally) delay the ocurrence
> of the next IRQ for the channel in question. (This issue will disappear
> once we switch to a fixed, global vector.)
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -262,10 +262,9 @@ static void cf_check hpet_msi_unmask(str
>      ch->msi.msi_attrib.host_masked = 0;
>  }
>  
> -static void cf_check hpet_msi_mask(struct irq_desc *desc)
> +static void hpet_disable_channel(struct hpet_event_channel *ch)
>  {
>      u32 cfg;
> -    struct hpet_event_channel *ch = desc->action->dev_id;
>  
>      cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>      cfg &= ~HPET_TN_ENABLE;
> @@ -273,6 +272,11 @@ static void cf_check hpet_msi_mask(struc
>      ch->msi.msi_attrib.host_masked = 1;
>  }
>  
> +static void cf_check hpet_msi_mask(struct irq_desc *desc)
> +{
> +    hpet_disable_channel(desc->action->dev_id);
> +}
> +
>  static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
>  {
>      ch->msi.msg = *msg;
> @@ -295,12 +299,6 @@ static int hpet_msi_write(struct hpet_ev
>      return 0;
>  }
>  
> -static unsigned int cf_check hpet_msi_startup(struct irq_desc *desc)
> -{
> -    hpet_msi_unmask(desc);
> -    return 0;
> -}
> -
>  #define hpet_msi_shutdown hpet_msi_mask
>  
>  static void cf_check hpet_msi_set_affinity(
> @@ -326,7 +324,7 @@ static void cf_check hpet_msi_set_affini
>   */
>  static hw_irq_controller hpet_msi_type = {
>      .typename   = "HPET-MSI",
> -    .startup    = hpet_msi_startup,
> +    .startup    = irq_startup_none,
>      .shutdown   = hpet_msi_shutdown,
>      .enable	    = hpet_msi_unmask,
>      .disable    = hpet_msi_mask,
> @@ -542,6 +540,8 @@ static void hpet_detach_channel(unsigned
>          spin_unlock_irq(&ch->lock);
>      else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
>      {
> +        hpet_disable_channel(ch);
> +        ch->next_event = STIME_MAX;
>          ch->cpu = -1;
>          clear_bit(HPET_EVT_USED_BIT, &ch->flags);
>          spin_unlock_irq(&ch->lock);

I'm a bit confused with what the HPET code does here (don't know
enough about it, and there are no comments).  Why is the timer rotated
to a CPU in ch->cpumask once disabled, instead of just being plain
disabled?

Thanks, Roger.

