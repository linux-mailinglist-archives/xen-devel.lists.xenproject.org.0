Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150FBC5CEBA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:47:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162546.1490157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsGk-0006vF-Rn; Fri, 14 Nov 2025 11:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162546.1490157; Fri, 14 Nov 2025 11:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsGk-0006su-OO; Fri, 14 Nov 2025 11:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1162546;
 Fri, 14 Nov 2025 11:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJsGj-0006so-Dl
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:47:09 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a589cb3e-c14f-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 12:47:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8390.namprd03.prod.outlook.com (2603:10b6:408:368::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 11:47:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 11:47:04 +0000
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
X-Inumbo-ID: a589cb3e-c14f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0ebIRlId0d0qk20ttNsGgiKU6TYVy/oU8Im2JygfMxlKexURigWSkTBkbNbH+a/qQT0APEL3epi8J+wrPUICi6/TpED51iGHjw2tvrqWzuRkFvi/7fInMjGD8oppb6SNPuC8/QnnT8lVZCCspsDq8hxPMBi1WRESZdVZrIRIyxwCIxf1WK+RreHXtBdMIOv4zezzi99Mu4fQMV/Krh+zU7W2YL6sVyVRSwuVmYcrjrcxcLzUrKZg81/bp9Ycs2Y1zOqq3lRCu6PI5iQuC8DDlPC09KV8S2YsJo1mqbFIuoUCyZs635QgRVTfKDuXHlW5llyU//Zpj2eLrEmiE0aJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//3Cw1zm8tiFh7nO01MCCvux3kJmKaMDO96UPonjgww=;
 b=g0slRliZehcoDpT79REe/I6dwA2Vbo7hWFChRvCmd3s+LVIgi89xsg4McNaKdDxRQFvDrugkf4nUWSqd4AvrySF7x3zgh9Bv416lmI5DA+Yc+VrIuYz5FqczUWH8WEn/W6Zv7SZVrm2j0ZQdocvPMlp7XDasv+KCbxUy+t5myez6ebRoJLyzAOarfvozwyt9JvW7TqofwaQmgCpt3f8gjqWgFWHGm2d0YZVNGtnN+3wsh38b+8iZkg1Osa1/PCNLAB5t68U3yDnlaJ3UVkMHHAKj9k6xmWUYz+OQfKcWMvwen/J2GdQHDjQGaqWw6D61eFdvayrb5CtX6UHjSq8hOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//3Cw1zm8tiFh7nO01MCCvux3kJmKaMDO96UPonjgww=;
 b=F1rETwVb7iWAfriYeLtkGItsytjd1JLmog/H6CIAvthndq94Pf1pRtxvnrzCsA3o297i3v94PiFsrhH7Bd85LMA6qaOT4DPDF/qaWf8AwhT5kOOO3lvdg9C7pgeN7mPpZWk+d9ht1VLH+pp9JlpUfs4lhNs4kajf2JbKuzRoKHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed64037e-99a6-4059-9ebf-92402e78ded7@citrix.com>
Date: Fri, 14 Nov 2025 11:47:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] config: remove unused paths from
 config/Paths.mk.in
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-4-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251114113238.9279-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8390:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e690f4-f244-4b9a-8df4-08de237387c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d01ZelVKemRLZGR3ZE0rWFNlWWVXc1puM0hGUFZEcExWZFhNNlZVQ3BvdEk2?=
 =?utf-8?B?OGRwSTlJbjRRT081U2ROS0ZYdXh4TzZHYTlzaEQwNFR5VGlTd2w3aDNtL01h?=
 =?utf-8?B?b1kzL2xZdDVDZjd5aXNaUW05SlQxYXBKRzlBRGtmL0FwWS9CSXBQNmorNE5s?=
 =?utf-8?B?SnRKajhuUG85ai9vUy83Mk0wa201SS81ZTZXVGpHR3FTb041SCsrbURVVmw4?=
 =?utf-8?B?SVJyNmtjMDJyanhad2JBNkZHVnh6NnM5anh2YjFtSVZPWVlRV0FUd0pmMjkw?=
 =?utf-8?B?ZHBhYk1Odk4zeGxvTUI1WENtM2puZ3d3ZFVtSEhkZ2hFTmxmVVRITzNWMTVa?=
 =?utf-8?B?S0V2cUdxN0c3RG04L0tXRmVVMTNvdmI5ditKVzJKcVJJa1VsK3RHVDZndkhK?=
 =?utf-8?B?TjIrTUQvNS93M0tWU3JwSGRjREphd2RQeFV3RXUwaVVNaS81WjRCWlRLZzlJ?=
 =?utf-8?B?L0NYWW9ZeVdoMWZjRTFLMCtZVTVoRVBWc1NjS2x4VmVxZDlXZ2VDN3U1VDZQ?=
 =?utf-8?B?OXBDdmlhWkwzaVhCckpqTm5PQWhtNHJlNG9wdFRQcG5KRnZzQS81U25aVWFD?=
 =?utf-8?B?V3c4NVdpWGt0Vm1zdUM3cE5uVmUvNzRiREl3ZDNXVVJ2SmZZNm54KzVzajBl?=
 =?utf-8?B?dW1nOUtxa2lYWWdUVkZpcmpCblJiSzRQZDRZbkZxeG5jNHJubjZRMzNEMVFS?=
 =?utf-8?B?RHBMaFh3dVdGZmJ4bWRKOWFyV2lqMktDSEJEcFlEMVFRNXdEQkc4LytlTWNO?=
 =?utf-8?B?aUh6di83YUV5RWdIMk03TEdGSzcrS1NUZHhPd2k0U1lQeWo4R0R3WGZtV3ZE?=
 =?utf-8?B?UHBEaS9idG9VRXU4Ym9ORGRKR0xzdVNIRmFianU0UFNJZDUwOTBDVGM4aHhu?=
 =?utf-8?B?cFo5WW0xcWs0RkMwZENJbWVFMmQrU05pMzVETXc4UkIwY2RaUElTbUExblhW?=
 =?utf-8?B?dHQxVWFweU12a3FzMUd1VXUyNEFkcEtHU2doRHRZRnNldzFxTXYyaytTRWxL?=
 =?utf-8?B?QmRBS0N6UE5mOGxkMWIvS0t6eTVDQ0FneWhGSld3d3RvNHJvTmU3blltNk91?=
 =?utf-8?B?T3AzbkNJWVVIclpKZGkwTXIyM2orME5reEpvY0d6LzBJQWVuMmpYMWtpdzNi?=
 =?utf-8?B?K1FjYUtkV2ZBdVRReHo0SDdUOFlIcVhqeWNVMHBnM1lST1BwZ0R2S0xJQk5Q?=
 =?utf-8?B?TVFqWGtESHpFK3lrMVA4cXlTN3VrZ3B0TzBFUHVBdmRlTEdPYWZpSExzWUhX?=
 =?utf-8?B?RG5sMnNTTFIxUzZGVzJUUTQ3cGVmckpRazNBUG1jUFI1MDRaU1AxSkRZeEU1?=
 =?utf-8?B?TGcybnRKSmo2N2tlL29pWXZiZ0EwK1p5VE56SldFTTNOYUhvVFVxQnNuc2pa?=
 =?utf-8?B?aDBLKy9WQkVIZWR4STZQY3NhTnBnR3hBa24zdHpzMDI1ZHFqaTBnTGxNNURU?=
 =?utf-8?B?bmFrWlFhcmZDZnZxRUc0L09wSllZZDM3MFBIMnA3eENlRCs4MVhGSDNsWFhX?=
 =?utf-8?B?TDA2S2Rmd3llQk1ybkpHblhZbXo0a1FKSEIrcGFSMG9MNnZ1cGVUbElLSFh1?=
 =?utf-8?B?SFY4Qmd2SFFiQzFCYUs2Z3pXSmVRbUNIb3RCL3JYa0VqMzE1OTYrb2pmNlVp?=
 =?utf-8?B?UTFiK3B3VWVycEtjclVDcnozL1lwSmtnUmdZaHRNVjJFekhXcHhISGpSNGFk?=
 =?utf-8?B?V3lnV2RheXc1Nlc5bWlEVlZCUldXNEdPRnMxdmdRWEdpY0Z3Vzh5RGd2YVhC?=
 =?utf-8?B?T094TEVmREt3VkJIN013ZWdJM3BKdVp2STBpZVB4SE0zeFRyN0dTZ3ZXaHZU?=
 =?utf-8?B?V1F0TElWMk1YNE5UV2w5ZGkrZ1UrbWpMYXUrdWxGYjRmTUxmaDY4SkhiV0NE?=
 =?utf-8?B?Y1lRcjlRQ0w2LzloeisrSlRWRzJyV29ZMEE2aTgxdUczSnJoaXMrbHMva3dV?=
 =?utf-8?Q?UP6kET5XF5tIBSgE28IH+cr4AG5+Q24L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3hxVW1YKyt4bndVU2F6V0c4bzJxTXBWK1pRMUx1RWRFWHExYVJJcVpkWVRR?=
 =?utf-8?B?Tk41K29tdWF4YnNUVnNLbUdVWGo2Sm1ldzV0YWlmNUhFUUxWZVdlc1dwcGVa?=
 =?utf-8?B?QVJWSFMyaDhnc0tQcXpaeVMrcHhzcy8zaFFRVDhtT251V3M1amR1TjFwQURD?=
 =?utf-8?B?ajBzNDM5QUgyVGhlWHdUdHFpcVhscTRFY2w1U1hzNG9rWEJkaE1na0RvemdH?=
 =?utf-8?B?QVQ4MTl4K0l6TVJERUZoYVhqWlI0ZUZzMGN2dm1BL2I2TG9KM0JuVUtJUVlS?=
 =?utf-8?B?djZLZktKbnJ3SzYxcXNiZTM0b2wzNURjVk9DVk9jS1FzU1dFQ1dLR1VHa2Ev?=
 =?utf-8?B?WVA5L3BtUFp4b3YzMzdLY00wMEZwS0ovazdVeWV0enZtTE02WlJObzNkVEwz?=
 =?utf-8?B?QWw5S2hHR1BTajhtaXFPeFBTUWFWRjJyNSswb1lJOE4vN3NYVXRNSlk4Qnh2?=
 =?utf-8?B?cXYwSTRocW1XSW1oVTR5ZmRzN1lKdEI2RkMwS2RKSmZZd0JTL1U5YkNaS1FR?=
 =?utf-8?B?cFRYcTJTSmh1akNGeE5YQzF1MnNMaDkvdm5kK090RUxyNTNRanVReUYwdGtY?=
 =?utf-8?B?bys5TllyUjU1YzFCWlFtaTRTUmNHYUdHSEU4RXVXY1V5ZERSa3lhZG04Nkc1?=
 =?utf-8?B?dHFjc0R2TkN6OFlOb0Y2QzhoZWRXNWFOajFzZkkwb0FvN04ycVpGdCt2KzYv?=
 =?utf-8?B?RHVTK2x4dFpTMnY4dGdCY0tmblhUUWJtOCtPQ0VvVG9mQ1FiaGwvcHFtWWxr?=
 =?utf-8?B?T0ZqUWFudHFERnhzVHliVmVqM1FrUm5sZW5qZlJSZ2daYVNGK1NnOW9NUXli?=
 =?utf-8?B?ZU9XTXM2ZGhwRnlXVm9pNU9YQkx4OUs2eUpObVNEUFdWUTJkbzNFNFhCcjBx?=
 =?utf-8?B?VWVYcFNTcXpFeThXV1kzd3dHZm1MQ1NPaS9DMTFBeUE0Z0ROYWFXK2w2bVFi?=
 =?utf-8?B?YmR2ZXFqRTFucHN5aHhWQzIvNmNpVTZ5Mll5YkNzM2plblR2Y3B6MkJNK1FP?=
 =?utf-8?B?Y1VwTTA1RGs1bXQvNjFvZ1ZxUVZCeGszTTN0aGR5b0xDNXJ5SmUzY1Rpcjli?=
 =?utf-8?B?b0NsNytBcE16c3N3L2ltZ3Z3QUdKSlhRUTlWY0dIWHEyM2FxK1UzdXlCQjhp?=
 =?utf-8?B?U2ZtV2FJcnpzczJ1ejF1Y0s0Zk1UdjhKSytpNVdpSWJ4TXNlb2E0OE9aV05k?=
 =?utf-8?B?VGtWMERnMTc1Nk9vai82RWhCMmdJVDJ3WHlrczdla2pZTCt6NTk3ZmlvYm1m?=
 =?utf-8?B?ai9Gdi9zWFB5cjRBOW9XSmxZV1hidWpJOFNuVkp2YzhSRitXcjB1K0tpSkVq?=
 =?utf-8?B?d1V1Q2pmZm9DREVYWmhSVE5iV0EyVlFjSktNOFRUZDNhd29nK3M4U0hicGl4?=
 =?utf-8?B?dGdaR0h1V2lQeWpkY0R4cFYvYWFOYTgwTFQxcENYM0lBSEZmNEVNZVpRS3Fh?=
 =?utf-8?B?MHJIY0hScXRlTSt5cG9EM2h4RDhTTCtKWEhZZjBKUmJyZ1ZaeTdwVWtkYU04?=
 =?utf-8?B?RXFmalNVWmsvMmYyWmdXWkZ6eDhnSHlycGttbi9nRVIwYjFIRTlYNGFmdkF1?=
 =?utf-8?B?OE9OalFFeFdaTkZ1WmQ3ZkJrUXlXY014UDFaNG9lZk5pY09EV2FlVEdVUUd4?=
 =?utf-8?B?SUpsejV6WXZhUXV3cVRRWnBESEljY1g4N1FPZHVsN3ZuUm1IRS9WZ09hVk5a?=
 =?utf-8?B?dC9KVFlaMDNWNGtCSHZkUCtsVW1jVVY4bEVQSG9yeDUva0EyNWVYN3RPekxi?=
 =?utf-8?B?dXdNczREU0gvckZsc1M1MnQ3Zkp1RDZVdmpKVjcyalJYK2s4TXVTMndSdjFK?=
 =?utf-8?B?bEFhYmxXSi9aZ2J1SmREYXE5ZGdFWlhhSTNoOWlxZHp5R0dYVERWaWg1NEph?=
 =?utf-8?B?dTI2eHhKdnhud2VoYzlWeFpvbW9ORk1Gb3NXOXA5VDE1QnFkQ2wrUTljODBO?=
 =?utf-8?B?MlFxeGU1R1lBd3p5cHEzSGJLN0NFTDNJLy9HS0xPaHQzdzFrNXpFQ0dlL2Qy?=
 =?utf-8?B?N0ozdFRYV3g1RGNodmJhOVArSFpNUmphK290Q2dwTnRKTVRnK0xxdHJJeHJs?=
 =?utf-8?B?Z0tEZnJWMlRzSmsxTFNnZmtHUC9XMldtSEpGaFcxOGJlb3ZLMmhHRm1DVXM5?=
 =?utf-8?B?WUg1aDhsdm81ajlpTVg0MXZJN25Qdm9tTHpXa3RPMjFtQ3FpNjhUTEJiOENj?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e690f4-f244-4b9a-8df4-08de237387c0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:47:04.0442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeVedGbj9gto5W/VPf7SMyl33Wra4gJyHb/3GHArqf7g6QuoK4DhfN9o68qkk8OlVQsYTf5oi/+Z/Un5FdgrwFKhYsDLUhySmpbltiRSbpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8390

On 14/11/2025 11:32 am, Juergen Gross wrote:
> Some paths in config/Paths.mk.in are used nowhere, so remove them.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  config/Paths.mk.in | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/config/Paths.mk.in b/config/Paths.mk.in
> index bc42748b7a..668545be2f 100644
> --- a/config/Paths.mk.in
> +++ b/config/Paths.mk.in
> @@ -20,10 +20,7 @@ libexecdir               := @libexecdir@
>  datarootdir              := @datarootdir@
>  mandir                   := @mandir@
>  docdir                   := @docdir@
> -dvidir                   := @dvidir@
>  htmldir                  := @htmldir@
> -pdfdir                   := @pdfdir@
> -psdir                    := @psdir@

The point I apparently didn't make very well was this:

We generate both HTML and PDFs, yet use neither of htmldir nor pdfdir. 
Whatever is done to one should be done to the other.

Leave just docdir, and let whomever tidies up the mess in docs/ adjust
the paths as necessary.

~Andrew

