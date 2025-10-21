Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D820BF7078
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 16:21:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147327.1479651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDF3-0007ni-97; Tue, 21 Oct 2025 14:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147327.1479651; Tue, 21 Oct 2025 14:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBDF3-0007m2-6O; Tue, 21 Oct 2025 14:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1147327;
 Tue, 21 Oct 2025 14:21:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBDF2-0007lw-6x
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 14:21:36 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee39414-ae89-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 16:21:35 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by DS7PR03MB5623.namprd03.prod.outlook.com (2603:10b6:5:2cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 14:21:31 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 14:21:31 +0000
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
X-Inumbo-ID: 3ee39414-ae89-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rU2phMCLVBYrJXoatzgYk8nCQ4eThBUs8YMMau7blz/LfZsRfmmdhXVLHHvcH7cMPkQmfDnw468z3VZmY17JHVLhhL0fWpB32pRE2vo4AJPoY1jF6GlFT4U00Bz9SIkXNuKkQyACwgR9TRaOgEZvK7zKfz8NHfGgajMIsrQ65DhlQEvQ7o/iF9581btBPzdrd/w+boKuJGAZ6YSwduIQr6isCq1gscQV/+7vRyoOew6hrcbMKSRcGY2tAN2cW21iGBYsTe77LuOqOGax/WxGLbfiDc8iO2VRbsuUmArzn5x9FFWUrGGBJQ1+LjeODl1BOUbANr9v4Dy0XINu1gQOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OxUF/0kD7ZEzjMOi1Zx5DlVrHK0lK5HxUg+S0vDjAQ=;
 b=ghMnwZZQC0QgxOdlvWpApvguIjj9e7RFBAJd5J1j3chRC8Cn6T5bp6sneiowwA4GfT63M1pvH2/hhcSL+LeofIqQlgDddBv4F+Hp2kabcx8gZWS8TaiAhaNjEYjOX02HbHCMKd9CL5gT3/sZ6r6Iw5tqeTcuXAQCzLwRW2QsS+pDv1jjbbuCbrweMrukV7JSylgaIfkUBJ6TpZ+2fMZwMsUZsxkAOYBVo1nbhSOBsKcti16lqENQxyiczSHG4aX2IwIx4CBCHil2osngIKoXqXz24IGYvOViciXhTAf7GZUorgQes/Dqd0+ms46vWxhTOtdruMrFQPaDz3PenV9pWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OxUF/0kD7ZEzjMOi1Zx5DlVrHK0lK5HxUg+S0vDjAQ=;
 b=Mg5XOabby2nYA4EPDMEb+P6mWP28F/9ufyLnhwQxZXPJveHzou3FJIzqGE8dU/6PlHYos1KHzgqsKg7kdaCDweqUmQktCf/cTAqzfYRDiwsyRFzcy+EySwfhO0/2Ih8/QZCZvdLDimXiSBeHsOu07Hz4r6NId5k2g4R2T1Acgo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Oct 2025 15:21:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.21 8/9] x86/HPET: don't use hardcoded 0 for
 "long timeout"
Message-ID: <aPeW5RZgFKKF15hw@Mac.lan>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <2e140536-6e24-4de7-a5f6-0c0e19951f13@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e140536-6e24-4de7-a5f6-0c0e19951f13@suse.com>
X-ClientProxiedBy: PR3P191CA0053.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::28) To CH2PR03MB5223.namprd03.prod.outlook.com
 (2603:10b6:610:9c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|DS7PR03MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a99d8e-1814-4dce-afd7-08de10ad20e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWlHbVJxY0g0VVhFMEVDWWtiYXZ1NXIwa015WWYzWWovdkQ4dC9mUDdNdGxQ?=
 =?utf-8?B?SUNtM0FNN2NBcnp3eDJieVdwUFQzWGMvSlU2QTMrMXFTZDFpdk9BYXZ1WXdL?=
 =?utf-8?B?VUVHU2lQZ1djNlJ2STQ0TDBha29RQ3V6ZGNyNGlwd3hnSndHdzBZSlhtOU1o?=
 =?utf-8?B?Tk9WaHA3bmZMbXBKZE8zTXNkVVJiV2FaREl5dDZaekNZVEVISHluY0FVWG1M?=
 =?utf-8?B?WmpOekdpWG1XN3ArNk51U3UzUU54OExVYXBrK1hzQXk0MGh4WmRXL1VuUXY5?=
 =?utf-8?B?blNJMXlCYUgzWHROK0k3aGlkaTVCMTJYNlpZdHcyTEVNb2VwMWFUYUtITW1I?=
 =?utf-8?B?S1FjczU0OGJ5Ukp6U290bkllaUVhT0UxRVZ5ZG9ZL3lDQlNVcGdhOEQwYWN1?=
 =?utf-8?B?VVZ5RjRDbDd5Q3M3NjJMUHgwKyszTjJZVFhsQldyc2pjRnBhcURWMlNRTmJC?=
 =?utf-8?B?UDIzUHhSTkNsTnRHVzRielhLbk1QaVkwSGJZTWNjK0FuR2hmNFJnWVFTNUdB?=
 =?utf-8?B?ekJLWjNFbHFWdkprbTFmdG5EbmRDZFcxWHZRdFliSDdqTnRxOU8wd2dmMC9r?=
 =?utf-8?B?MWphbXlyTkFDK3lBMGtyQkZFRjVRTUFQZngwR0RUSHMrdVV4OE8yd1dLcHBE?=
 =?utf-8?B?K05ycVB4S1d0UDVVSnp6ZXBDY2J0S2lTdno5OE1YN3EvY0p5T2JSQnpYUlFu?=
 =?utf-8?B?NzEvU3J6OE8zY1BaNFFxRVErUHhPQ0pJQWpvakdMT2VHbmlFU3lBbUNlaHFi?=
 =?utf-8?B?Qmh3c1VabFJGL1JQYnRlYjZyQy9Rd2pKYXhYdk9lckhlMFp1c1p6MlpoSUtp?=
 =?utf-8?B?Yy9tMldxVjlPZmkwbk5TZzlRaUtNc2FRV1BNVzBubkpPUFZDR09IcnZ4NzNl?=
 =?utf-8?B?aUJIU25KOHR0elorTkk0L1RzL1FsWlovb1F3Yi84bnVDWFdNZU1kSDQ5ZzJw?=
 =?utf-8?B?MGtjVWszNzBzMzhwR1pjOXRxSjNLbUNrUUo5YlpCczNlR2Q0RmR4eGRrM3py?=
 =?utf-8?B?aTRDNlV2L0tmV0l3NlY3YVpNWkdJRE9WTXJsNXBwUWRDLy9naE1sajZSeGFw?=
 =?utf-8?B?YittSUVoWHd6b2g2NXYvZmJ4ZGphTDFBRGFQTjlHWFFJeEVXdG5pMDdHeXdJ?=
 =?utf-8?B?emRXUjJPbFY5OThyZXdIdXRVSXFjcjVCeTd1VEhvaFpFV09ySEpoTG8rYUd5?=
 =?utf-8?B?WkVnS081UlBFcVdFdEdHTE4zdXoyaVVaWmxNUWd4bnNtL1dMNzROYmVIMW5a?=
 =?utf-8?B?bTFGOWNPQWt3SjFMckRHTVpMb2FoUS82YlJUTXYxRHd6cWhIajNYWndIeTAr?=
 =?utf-8?B?RDVkd2ROb3A4WWZOU2JrU3c1Q0g5TFh2NnBwWG5mVGVBNzB3ajd2bEwvRzRN?=
 =?utf-8?B?dldyUFpYOTVmaWRNYkZQQ1RNUWkyS2ZhMC8rYjV5dG9oUStjS2JnZ2t1dThm?=
 =?utf-8?B?bDFWb3J5a3FKWlE5NmVKQ0g0a2F3T1BDdmMrSngzRXo4WFV6TzhpQkFZeXRj?=
 =?utf-8?B?MHNRYm43c002dVdXVDJ4a1VyckFXeEpQUHNWV0lwdFo3WW9ySTFBZFVoUGtX?=
 =?utf-8?B?Y2E2Nyt3dFB6cGg1RVozcEkyTkNXa1JWSlBvVUhKV29ob0k4V21BbmxacXY0?=
 =?utf-8?B?b2MwNnF6NU1GZlp3UGNqZEp5V3JiTjN2Y3RKNVNQS0RnbmIydXR4VEM2cFFq?=
 =?utf-8?B?NllZTUdoZXpONTEyVWxmU1NSc0dXc1EwcEpEUktmUUZXb1BMY1MwSktHbDJ0?=
 =?utf-8?B?SEd2TXV0ZlhRbUV6Rk85RXgrMHdGSFBCTEJqVkhvcGRVbjZNc1NZc3dneW82?=
 =?utf-8?B?a2ltcVlDZU9BdUdsdUY4SEdrRENvQkFTSi83ODh1SlBRWUtsUFhTZEpJcEt1?=
 =?utf-8?B?K205Y3ZGMHA3TW44algyR2FwaXYrcjBGNWZrc0hCVEs4cmJaUGFFRFJiODBz?=
 =?utf-8?Q?/OgtK7onmuVx4CVmwQvlAvOi4fxGCASO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW5QVCt1aEZuYnBiWlhWWkF2L3RBc1lBUjVkc3UzTjRXbXE2bktBbkNreWQ2?=
 =?utf-8?B?eENwKzVwcnR6UU5UQnlDNzUrWFhRbk42ck9aTFVIMWl4bm1hUjZUQTVxUnZm?=
 =?utf-8?B?U1VQajZBK2FZRDdmZEVxazFIa1ZpdTl4VEFJcXBrYTlEaFIrcldVL3lHMEk4?=
 =?utf-8?B?Tm4vNEk4eVQrU3JwMW82ZjlhajZSbGJhaURpc1hMM3JSRVp0NjE0Um9ER3o2?=
 =?utf-8?B?cEtQV2t1SGpXV1NJcU82a3BRSmN3ajBxZ3Q4d2NsWnp3SGNvb0lFVFMxMWRs?=
 =?utf-8?B?STU0cEhQdDVJMVRFWjh4T0tDU0NYc1hYc3NLQkNMVFVHcWdoWENUQ3hPd1ps?=
 =?utf-8?B?ZGxuT29adnlBaUR4VUtPbk96R3hBQ0p2cEptU1Nobndvb0hBVHducUdBcVQy?=
 =?utf-8?B?VXRGN1dwTzY1V28wdTRGZ21FZlVsRUxISTlUSzhoWDFSOXZFcWpFbHdVRnFm?=
 =?utf-8?B?bjBPbXlpVVZDWFoxL1NyZ2VEL1ZNRFVNT0tvOUFybFcreWEvVVZDeEt4M1BI?=
 =?utf-8?B?ZlV6czJoSjdzNGZ0WHRUTUNvK3M5RUw3ZmxQQU90UWdBUEdNcTlZTFdYc1Ex?=
 =?utf-8?B?MVJPWkd0Rng1RDZ6MVl2SitWSkJSQitYTW1mYnByeVZoNW9zVThlN2lZN2ZK?=
 =?utf-8?B?SXVlTGRhTGlwWjBlaGxMY0FIcmgrVU1uZVhkeWRhV2trZFJHMHhQQU1TQTV1?=
 =?utf-8?B?YnVMMTFWcUM3UzJuYkdMT1ovRjR2UnhFTXBKdEYySExSMkx2TEFFWFRESVRh?=
 =?utf-8?B?VUJCQi9sdXk4RkdiQnNzVEJFcUUyOG11cXZjaTRwSUU3UHJNRmFxRGpsQmRw?=
 =?utf-8?B?V2hyOVVqeGFzK1QyZ2l2TGQ4bEpkUCtUSEp2SlcvZThHT2hncU5HOXB1S1ZL?=
 =?utf-8?B?VGo5dnZnZGlFNlRacWxmL1c0OEx3TitNU3VoVmI2NDlGdHNyWVJPZG50ek03?=
 =?utf-8?B?dlppbmgyc3lpL3JGS3JIQmRZTjdRa09RaXJkNzlkaVJnYUxNYlQ4SHhrSTZL?=
 =?utf-8?B?R0VnWTU5UTdTYmRyVnJXOXRxT3JjZm5nU2o2elFpMFp3QnlSMjNGTU95bklF?=
 =?utf-8?B?VUlzZVprejVwbVNVOUdKQjllVE1HMExTbFF4Z0hyVXJ5QzlnUmdBaVZHblRF?=
 =?utf-8?B?aDlvZGRYTVB0T1FValVVY01xNlNtUkkxZlJpV3A1MTQxWWFxcm1HQVFoYjRH?=
 =?utf-8?B?M3dqOTdEaHNPbkdsMHNucTJBUUF0U2pUeHU3dldMUHEvTm5zWGxoYVVSMzlk?=
 =?utf-8?B?UWJUWm1XVnJkNFF1NEUyK1M5Qjl4NG5iV25iZmh1Nys0VHV5QW9MT242MnUx?=
 =?utf-8?B?aWhlWU5zSlQ4V2pjTndhOEREQUcrRzVFK1QwdmlaN1lRaE5NS093WERyQTBq?=
 =?utf-8?B?L1gxNkZTSm5zTUZwYTBEN2tUWGR6U1FRT1V6VmxHaFMzQ3YxZ21XaXZ1TXpt?=
 =?utf-8?B?YVRTbVgwUUpDZWxQQnEwTzg0RjlYbGJYTlI2WWFRaktKUGYxaXpxYU9LdnFt?=
 =?utf-8?B?WStBNnFIZ1doeVpRaXM0emhwRy9kck01V2Fqcit3Z1FpNEtLR3ZBUnZUNEhS?=
 =?utf-8?B?MHgrVGg5ZmZmOHAyL1UwRTEwR3ZhSEF2bFNkc1dkUm9JMHpHOXkzK3FwQ2Yw?=
 =?utf-8?B?SzhZZ252VEdqTGNmdFdjVWpMTndjcEgvNTZncGNadGpEMVRFS3JuanIvR1Vh?=
 =?utf-8?B?ZkxvVzVDcXQrZER1UHYyRklTZnV3bG9vdDFOTjIwZ1hOM2hWUE5XMjNTdjNV?=
 =?utf-8?B?TkpmdWUvY3VKWThIQ2dpYW1nU0dLZFRaUk1jWmV1MFRpNytWdmp5WExybi8y?=
 =?utf-8?B?ZWRWT29QTkNXY2N5bkduSFVDdExsQ21ZcGlVTWIreXNCekVtU1QvOHNuUExn?=
 =?utf-8?B?L0NoSU5HU1hlQUR5a3lnL3NaVGVLa2dLYlhwc2UvOGxtTTZtekpRVEpycnpF?=
 =?utf-8?B?TS94ZUNMS1JQQmpzMFRVcHVMY1c0blF0U2UwMmRjeGpYZU15V3ZRbU9ZbkJ4?=
 =?utf-8?B?WTJ6U2FzajFubWdoSzJocTNYQ2N6d2I0MVZhOWZiZWIweW9PMG9DTzdZeHJv?=
 =?utf-8?B?YUk1dHIzd1FjMGkxMjA3RlRpYTNNZ2prd2ZIakxHLzFISVQ2R2ZlOEpJaE5H?=
 =?utf-8?Q?LXas7wEm8vbqdSOkFcxIoYYvC?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a99d8e-1814-4dce-afd7-08de10ad20e5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5223.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:21:31.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwoxA+/KYoG3TZGZ7P0GxTYutneL9dRig7UvsyGvjUDRZQuS2Lgph1LbLCVdjhqPh7gVLPhzvStNEJnO4hJzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5623

On Mon, Oct 20, 2025 at 01:21:18PM +0200, Jan Beulich wrote:
> With 32-bit counters, writing 0 means on average half the wrapping period
> until an interrupt would be raised. Yet of course in extreme cases an
> interrupt would be raised almost right away. Write the present counter
> value instead, to make the timeout predicatbly a full wrapping period.
> 
> Fixes: e862b83e8433 ("CPUIDLE: Avoid remnant HPET intr while force hpetbroadcast")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Maybe I'm missing a path, but are there any callers that still pass
STIME_MAX to reprogram_hpet_evt_channel()?

hpet_broadcast_exit() no longer explicitly passes STIME_MAX like it
did in e862b83e8433, and then the per-cpu timer_deadline variable is
not set to STIME_MAX either in timer_softirq_action().

Thanks, Roger.

