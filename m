Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ARpNSs7BGoqFgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:49:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD0D52FEB4
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 10:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307689.1579272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5HL-0007An-Gi; Wed, 13 May 2026 08:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307689.1579272; Wed, 13 May 2026 08:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN5HL-000789-Cn; Wed, 13 May 2026 08:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1307689;
 Wed, 13 May 2026 08:49:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wN5HK-000783-Bs
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:49:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN5HJ-00HB6H-Iv
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 10:49:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a043b02-5cb7-0a2a0a5109dd-0a2a450182e6-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:49:17 +0200
Received: from [52.101.52.60]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a043b0c-c1f2-0a2a45010019-3465343cb590-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 10:49:17 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB5968.namprd03.prod.outlook.com (2603:10b6:5:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Wed, 13 May
 2026 08:49:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:49:14 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuUPVzJ/gJLCqc8YZudhbRd2j3h5nNb5TZxAmgULzD4rW6A6ZiZxyKNxiKPHHxRFX0aEryg9WXf4yoG9I+T/ERjsuEwTbOxmJMoHCWkqKrJIYADuKkc3mETJuoJ6Z2Ta16/G4/w8ErOZUDL31G4Gdztmz6moFNj9kFyepmFkqVl8f6T2s4VYpFRVoBGth7fhh8Rv4zX3jHqRMPo4lruEoGsC9lJM21SgxlT6xurlsc6eX5LmIVxVWhECwb0By2eweaMYohfa9N58bSrYajnqo7pJlf4E/z4XU4Uc7zx40mWtfREAphmCX/lV/rhVE4nurkZMmg9YJNTAKSNfe4iWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W49FHZbHPmFrpLjGvbUyOWxlZojt27IdOfJ48Y8esuA=;
 b=N4BJNGCpxe9LR70ebCbdIWSnrTDuV2oHBwbPzaW5WsVXgNXPSy3mWZaWb4UxNQxm3o3bKBpR1WoFjkcI4GM9rYRspZmBfSDcVFEbY8pSoUNDSTHmG9Y/CaCXC+wQIZgzWzsAU1eeBUF0NkPnnE9SRlDs92IaSMvV+EtUQVeH5A61ch0zESk6tJ2NMx18qiLT/e18lBPCnWjfOI8wJhn/I/PVbgHRRhfUsPPZHCHCxpbX21nQEtqXjcB1/rz39BP0r3wm77lPIGQeFkSmZJ1D/ZjfJ6/5juUU0o8jBvF3xJ7MiVNorRq3jxAEbiZBzwz3UKKKyG7ZhhRJoQSSQNTi5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W49FHZbHPmFrpLjGvbUyOWxlZojt27IdOfJ48Y8esuA=;
 b=V5xbmQMNYBDcWmkTHBfpZBxAOIOpH24P9vfosnTJzHp8S8PKHjYAEG3K02VZoqShJnGH1PnPLIQ9A3JiLyEVBV6slH8M9h/DZWWBSbzcIbQkSvMMxCAsfdRFOoHGBwtagqFkcnrbEXHeFYFMYwY6DF478RrOgD/OjTimJ1WjsSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 May 2026 10:49:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22 1/5] x86/time: use RTC century byte when
 available
Message-ID: <agQ7B0JQqisZ55jp@macbook.local>
References: <b36b6f2f-2b0e-462d-9846-4a1b4d7edef9@suse.com>
 <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2723456f-5d8c-4a2a-9876-e65d35579936@suse.com>
X-ClientProxiedBy: BN0PR04CA0161.namprd04.prod.outlook.com
 (2603:10b6:408:eb::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ab6cba-914a-47a3-1ddc-08deb0cc825e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	LmwCKCeS3X76TUZMhrqvvJan9yvh3rDSdm3aZBECVERty6qfqxMXgclq8MnnAbAnrKAnENF8nWzjOlg+1zkdF2Yn+lgX09HGz8O+SPVOV8Zjwu8CgP0pm5T/v/vIUSxc8UQbyHLDUvEXrfDOZAtIAvDl/F5oLCmwwjb7q1y4cvfhdQNzP8wzhdnzy9zoU8Zt572xfqqgJumsDJm9j525siI+ONkUGaqCbIq+RICbNdb8ZUxnBCCH+IGMcXGQvEiNBkB4pOBENI4GF2g0M38EFXU1AA4PxUb2vX7gDDQfKO9JLR5xK6WATicLRqaEjG7aMnPOT95SfaVFW9wGmEOyNw0lG+Z28sP8b0meDI6v6M1nBSBunng19rt7kadGyLHbhDfKbxUmzKMZ3Sj5PRmIBwwu9Ud7WjCuhlMu5j6rpm4UYbzzdxuf3N+1T7U4KjSoDtqUwog79PX7Smoz4CNp7oRHwGnH/+aIXLghVhXE/KevnaAFduwHvFltDki38WxGLUBzsjGkzcQtp3OuWPT6CGhyocML0r4zCkkD3er0fzXv/LcZjT9AqknEFvRf1n5ceNvKaJfHiBY5clcq6WKqmr2fTr5NyZmHq7AIPYLGsCf3mREQSsVnLf2vAkAzVdfJVNNg4VHYZeo2cQ8mnZsop8ZSAXudlcLuhw9w3PG5DTREjB0gvixjvF/iAQ349Jkq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXpucmZ3ajFjbVVudFNISXA5TXgvUnY5d1VtSmJLeUJDblU3VHdxaVQ5dUZO?=
 =?utf-8?B?NGs0UlRHR2lEaTlTREZzODY3VlkxRWlYbnlvR3pJY2RBRzRqbnNhQWJlU1hW?=
 =?utf-8?B?VXBlVldERG53NU9pbzVwT3ZwV0JGYTdOd0QxYkJUVzFiVXNCVWJ5bldtQ1I2?=
 =?utf-8?B?eE55VmNLd0NLcmlPaTF5emJiVVdDRkxqSm9LamFLb3hGbVpZM0c2U3hmbkpq?=
 =?utf-8?B?Y1BjdHJ6K1pEb1I4aXpWcmdLR0JTQ1BEMzluRFdiaU1iczZOeUluNXhMbHMr?=
 =?utf-8?B?OGdjRWx1Z20yRFVVenU1Wit5ZXI1SXdhTkxqSVN0THhSN3U3UjQ1QXJEK2wz?=
 =?utf-8?B?UThOdWpXbU1KeENVc1RkRGtuKzBwV05qeDJqQmh3L0VGRFFSSk94eHlXMmxv?=
 =?utf-8?B?ZTRqY2tnMnhURXo4YU9ZSXl6dUpUWUN0UUNWUDN5NUtvUVlSa09Wa3pHTmhl?=
 =?utf-8?B?dXlGNkRqZDNleHNPVjQvVDhDN3VQSlZKaUo1eEhFUkl1OXJLWkhTa0laVnAw?=
 =?utf-8?B?NFVSRFdwcXlaRTk2Uzk1dnNISTZacjV2dmh6MEwwQ1VsRVIrMmJQbFdVQjM3?=
 =?utf-8?B?dmhUNkxiU2xLbk9ZNzY2L1duYk9KRGZYZ3UzWFBEYi9ZMWROaVdZcmViMm1K?=
 =?utf-8?B?c3FoNGJYR1oydXFUdXV2VTVaR2JLNzdiM1lzY1NnckNMd1NtL2FZSzR5SFJz?=
 =?utf-8?B?SGR0SDBwVXpKbGlid1MvcHJhNXBoTm1Qa1lGOVRqSnJZZUZFMHNROHIyUVBo?=
 =?utf-8?B?WkNTNDczVTB2cnNjb1lOSlJzK2Z5akdNcHFNRmNTbVNoekUyVDlXTndZL3k4?=
 =?utf-8?B?dGNaL3hSYmdQd1NXZjFIMHlEOVdTRXdwWGphUVVGK2FVODhRb2NkckRkQ2VQ?=
 =?utf-8?B?Q1ZzbHprVXBnTlVLY2hVelZwRnB5UHo0TzFIZ0E5a0NERnYxYlk4WlRvcm1u?=
 =?utf-8?B?eFRaa3hnTUdURnFuVXdHOFRSM2tJWFhXNWQ0dC9QUnVOR0t6ZWdCaXZkL1RY?=
 =?utf-8?B?eGFpSGRJZ1JHZ21pRi93RWIrTmJZRVdRcGJ0WHZESmRrYjhqVHhnZzF4Slpk?=
 =?utf-8?B?TGw3YlNMNDBEQXdEMytzWXU1eFBQVVZEaGFqWC8ycFh1ZGRkUWRvbU95aFNu?=
 =?utf-8?B?YzFTM2R3ZEp6TmY4VFlvRVZnYkZQSzNtUjExV2orYWwybDE5czBiVTYzaEI4?=
 =?utf-8?B?WmJDMU5OTGJ4UGZ4Y3p2L04yNWpOWm5wM21OUWo1T0dPbzB5TXV3Z3Rtd3dx?=
 =?utf-8?B?Rlh0YTkzNTZqcHJ3VEVNUGtlMENhbkZXMGZTQXlXbHdCbXRpeDVuT3U5dTE5?=
 =?utf-8?B?KzZaL3FuRFRPMHMwdFA2M1J0Z3pZME82R0VFcXFQejE0ZEpqYXh0bDlFOHFx?=
 =?utf-8?B?dDhKT05ieUt0SlZxV05Ib0UyMldBYTErbnBFSFR6SmgzSGNTN3Rwb1VDYTR4?=
 =?utf-8?B?aisrS3dVcHdodys3bHVsL1hkMHFqMnMzeU8ySHNRd3pMR2E1RWRWbUVQTVZ4?=
 =?utf-8?B?eHBqNCt0UXNoZkxrNlNPMlRneDZqOWV2NmdIWlVjMklVcVEzcStUckx0UFRO?=
 =?utf-8?B?ekxSa3Z4VC9uVDVWZm4vZURqbnBMSHdXRkJVQkx4U1M2SkFLV3pmeVgrcER4?=
 =?utf-8?B?QVFmcUVuZXY4YVhtbFhoNnZid0pxQS9GdGlVTlJsYmF4SFpTRW81Z092NWZX?=
 =?utf-8?B?bkNVSHhqR3Y2ZEd2cmp1SnZQeW96Y2dLUEZFck5WN1pBQlhXdS93Uk9SL2FT?=
 =?utf-8?B?MkNWalJySHdIWm1Nazk3YUg5cWkvVi9wNGtLd2ZTMXIxZEN6WmgzNDJxL0ND?=
 =?utf-8?B?L0RNMU1JMTVuOXBNdXYyZjFhRTJZNW1OalhpaEhhbXVCalBUZUJXeGlwWUV4?=
 =?utf-8?B?NlNuZjlrczZVN3NteUFWTEFoNlU0OXY2RmFIZlNRMkhLUnVuSEIrZ2RoeGNl?=
 =?utf-8?B?eVFsd1V6NEdaaHYvV0s4bzlycXcydUNVNUEzSnRYbVhUN0d6SHNSZytVbmo3?=
 =?utf-8?B?ODZoSFNRemxuek0rVlZKUlMveVFYN2FQS3VoRXl2MEwvUDF5N05jVStNeDJQ?=
 =?utf-8?B?S2hzaXVwdFRXMVZUOXBBSmhKUW5WNlNENkhKcnBTQmtPVmRUdHZsczZrSEcw?=
 =?utf-8?B?QmVQWjJxblJ2c0tlRGhqOURybnlES09ka1ZqUkpoSm1VUkdGYzV5Y0xuUzRv?=
 =?utf-8?B?RFdheTNBTm5maThYb2czSVJ3QTMrajErTzBWTmRmSE5HeUpJenVJNTc3OHFt?=
 =?utf-8?B?MXhMSXZtUWo5MDBuVlpBWnhpQWFWeThCQTNNc2VlNS9ydzEvTXdSVXRobEhi?=
 =?utf-8?B?M2V3NEJUL3k1UUU0cDRjS3pPUkdSbzIxMUY3RG82MjhEbTZjUENUUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ab6cba-914a-47a3-1ddc-08deb0cc825e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:49:14.2554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FRZmNA94dCEUn4rpqigI6g5Raa9nuctJAVu08KbYkDGoRn/y9FFUGz/kr21cuKgoK6feHlbWnpVnTTiLhnBFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-purgate-ID: tlsNG-d62444/1778662157-B695FFF4-62B5DD3C/0/0
X-purgate-type: clean
X-purgate-size: 1269
X-Rspamd-Queue-Id: 4AD0D52FEB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,macbook.local:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:58:43PM +0200, Jan Beulich wrote:
> Without this the present logic will misbehave from 2070 onwards.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1257,6 +1257,7 @@ struct rtc_time {
>  static bool __get_cmos_time(struct rtc_time *rtc)
>  {
>      s_time_t start, t1, t2;
> +    unsigned int century = 0;
>      unsigned long flags;
>  
>      spin_lock_irqsave(&rtc_lock, flags);
> @@ -1280,6 +1281,8 @@ static bool __get_cmos_time(struct rtc_t
>      rtc->day  = CMOS_READ(RTC_DAY_OF_MONTH);
>      rtc->mon  = CMOS_READ(RTC_MONTH);
>      rtc->year = CMOS_READ(RTC_YEAR);
> +    if ( acpi_gbl_FADT.century && acpi_gbl_FADT.century < 0x80 )
> +        century = CMOS_READ(acpi_gbl_FADT.century);
>      
>      if ( RTC_ALWAYS_BCD || !(CMOS_READ(RTC_CONTROL) & RTC_DM_BINARY) )
>      {
> @@ -1293,7 +1296,12 @@ static bool __get_cmos_time(struct rtc_t
>  
>      spin_unlock_irqrestore(&rtc_lock, flags);
>  
> -    if ( (rtc->year += 1900) < 1970 )
> +    if ( century )
> +    {
> +        BCD_TO_BIN(century);

Don't you need to move the BCD_TO_BIN() translation with the rest, so
it's not done unconditionally?

Thanks, Roger.

