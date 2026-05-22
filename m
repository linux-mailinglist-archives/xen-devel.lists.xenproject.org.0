Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFaGFzUvEGrIUgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:25:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A25B205B
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 12:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316575.1585957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN4Z-0003tI-QW; Fri, 22 May 2026 10:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316575.1585957; Fri, 22 May 2026 10:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQN4Z-0003qk-Nm; Fri, 22 May 2026 10:25:43 +0000
Received: by outflank-mailman (input) for mailman id 1316575;
 Fri, 22 May 2026 10:25:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wQN4X-0003qX-RU
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 10:25:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQN4X-006S5c-7n
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:25:41 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a102f18-bab6-0a2a0a5309dd-0a2a45078cf2-44
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:25:41 +0200
Received: from [40.107.209.64]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a102f23-229c-0a2a45070019-286bd1401e99-4
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 12:25:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6614.namprd03.prod.outlook.com (2603:10b6:a03:38a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:25:37 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 10:25:37 +0000
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
 b=CHMb86up75FdqZgxLzokSUFuL+g/vIJwZSdsJCvxB/KJA1Ak1hUccRNb+hy+uE3/LsV28i/FDvDv05vL43s0nf8ZUf0jEjoRIVZBEGmJe176sUqBYPyGZqn6GC713qEJ+IaZRJspf6ycckSGKUNjqPLGstF3u/brB1NXunGKGFLgI3HmN7dq20dnRv47K78pIiGvX6tPdhBolRQ6NCAyR0tE6gmFHixcHD2fjcUggW1l0Eriz2/n4DBdgF6so5Q03F+DAVHK3xVRO9GxfCGUUZILulyo3hrAWGu0QO+tdF+smeUVSZqZQIMZqzvB1mt00dWsn6r7SwBEP5pd91rZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSsPDKOQW+Fk7TeKXJ7o9yMs45onMPWtV4NkbToDHCU=;
 b=FRnKHWQj6wPBJBbbfRCxZdmvC8/RPuhULEQhUrWiw6eNNGEOjL4hFDg9QoHH2ykMKK7UpVgAZEr7vy2qVIO/JNu/72y8Vb7IY2kKU/z2mfE1iXZxcQsnVz/DhlEhtQ9Av74WkchBK4Z3rm7Uh5YmoFR+yZCBaF0UH63pHAjEgFOcjaNUVCRGhbnHIokO5ukU/cHntGbwHPe5RShTmmZ6gfbgEw0rii/sRG0Gh6gzAISljZFcOZYhEYiHB3CVbRyjv9aIBqIF2RPuzuHOsQ21DYpb5f0mv15wVJr3Lywr2h2iDA6Dmw8aMoah3LRv5SJgckgedu8ekFn3J3cbuZt4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSsPDKOQW+Fk7TeKXJ7o9yMs45onMPWtV4NkbToDHCU=;
 b=G2uKcMo/ghQiwzsoyrcv5JUsUsWOljS+MSE2/lkCyaCGPFUtsExjDeWQctj0baqBUIdXFURIJmp5vQD4iAqwAMdsH9TvhPciKAwA1BdkO2K/hfXhUrGU5TlmuwUrxZThEWoWVJUzuMu2gCJxehFMVlYfvwzgmbIrnhwqhiN7QZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <db7d3e72-160e-4842-8ece-ea7bc9e52b4b@citrix.com>
Date: Fri, 22 May 2026 11:25:33 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/5] x86/PV: rename a local variable in
 pv_emulate_gate_op()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <5eaaf72a-850c-4535-9f20-13b4feed38d1@suse.com>
 <871c0ca7-898f-4bc6-8115-d94d40b88301@suse.com>
 <ahAuwEqst5aCJSj2@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ahAuwEqst5aCJSj2@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0317.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ea4c42-9d98-492d-e6c3-08deb7ec7726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o5NXjSNZ4HRSSyEGCPSDnZrSzYboEfkpaN59O0J1ZM8mlHj8m0JyBfXz2mz85e95ptWj2T+6YSOJ5bDt24pseQ1ZyOw1SCNAsJwAG6Gj8zyQoZnssZIuvL+8ccpzKQFb3hftFqvGWip/2FLGEdjycMjirF5DEB0URI7jlbKU7I5eSPtqIdCApHu80TiBLJ3Y/smOxdMtgbGVzy9Yo+eSozu7TFebit8zxaAM4XWhSkl6S/LZKQVUuBBVCq7uq8stAE0n+maKLmJj3isXLrjXafRn+K41BcHz7tG76I+tgDJJu6Jf9SyMElMDPNjsXYIsHgylLBh9sV84x8vWOLRR0H9om0441UlhESQOlnQL9b+wGpkl1FbTM6Mi9OuJlG8gq9IdF8riWAXmBF9PN4ygt6ak48JpTZZqIQ2remUwsmliHCoI9MkhTqwCDCTdEG9QTZPlQRnvU+/yhQXl0316CUJ8UIKhHlIwDK5JWsdM7Wi+SkXjGUt2NSHWt3/Ey/bxVNgGv46RXNvBKtvZnuWumFD8yIVcJmnWs3WwSHELHPO5sSCgpRON6ORH2iNO/Axm3e2EOW40otr0UsPVSydcryzsZQQncNbopLywY33keKA/hUjDfvNn7T2z2bLjxdBdyiC0II3+bS001QGYO0ey8F5YmyzfwlSFLSNNWCxNIcewARdkV5AyceskbU8ejzea
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHo3WHM2VGFLWGQ0akdMTGQ3V0VPd1oyYXRZSlJhZUp0T1FKMzBFVEZraEVD?=
 =?utf-8?B?RWZOdkgzRG9iajRFeUhLMmtRZk90R0pLUldIZk16ZDlaTjFPcXp3eG1OMHJv?=
 =?utf-8?B?dEowUTJ0Vk16NEtvdzBOSWpLNjNZV0pvcEhBS0VaZFQ5UnFiMGZpbUE4K3Fq?=
 =?utf-8?B?alhZb2VvWHM4Wm9oRTdONm9HaW40bEhXTEtXZytaNld2U01RMDFJdzlFM0hs?=
 =?utf-8?B?Zlp4L3FKU2Vrb1FqU1NJdEpHUlFjc0JqVGd1Wk9veW1QR1R2bHNNNWJjMlVQ?=
 =?utf-8?B?WSsxR25RdkpIWTkyNFNBQVBTRGhpWEQxZ0dvNjVEZktHNWxYQmFQZlh5dlVI?=
 =?utf-8?B?VHN5cXprZGhPUTNpSmE0OE1zZHVVb3FnQ05QNW93b0hkTEtiVXdvMzJFRlJ5?=
 =?utf-8?B?ZXF4Z3dYcU81ODIrQkEzWFdvN2I0aEZycDV5SU90YlhGNnh0bDZESkhGMkNy?=
 =?utf-8?B?RjdzNk5WbGkyclNURFNxWUxNZFAyZzllSVlCYUo3ZUIySTJTWnVhQlZRSEI2?=
 =?utf-8?B?Q1dwYit4ZzB1L0E1WjJjSWowVWRhUTBpOG8vWFI5cm9md0JJZ0EwTWtWZ3c4?=
 =?utf-8?B?WXNzL3RtZ05xZUJsVE0wb3lxY2NYMVRoWHZzdnZwNjF3Um1odzV0bXE1SEpn?=
 =?utf-8?B?UitnVUhVTzRXYmN0MlVUOEFXN3A4YnF3OU94My9CdUdsbGFmMlc3azhVMDJW?=
 =?utf-8?B?Z2t1QklnZFBtS1lTTHhqUnFvT2ZmczFYUGlUOUhrc2xFRFFINEduckpLbDlP?=
 =?utf-8?B?bWh2MzdKejhpVU9xZ052SlBYb0pCVndDSUJKd2tTenlFRHVxYjRZbWlvVXBo?=
 =?utf-8?B?eVNPeHIrWS80OTdxZ3czazMwL2gvK2QrKzFsM0UvckZzSWUzdElqZEJ6Ti95?=
 =?utf-8?B?YUVNN2ptZGZMeFdyTDAwcUVJOVhFaDViVEJFeWJiMmttZUtHQkZ0RFNZNE5H?=
 =?utf-8?B?L2ZObE51cjZ0QVlIcHBiM0RCamo4VVZjMnR5US9sQmpMRkhnMGpGZndNWk1L?=
 =?utf-8?B?SVIxSnlvMVRBUVVPeEc1d3dnY3E4MlBVNlhnZGc5RElncGVLamZSM2pTQlBK?=
 =?utf-8?B?NElocHIyTy9iWW9YZ0pQcVVObUtGeGhaR1N2VHdZMittdmJLd1gxRVNMRmxG?=
 =?utf-8?B?THE4SmlpUVBheGM1bnJzQ25SckIwUUtsS25DQ2k5ZnFaRDU2aktrdTVtUldp?=
 =?utf-8?B?ek05NmRZeWVoZTFVNEgrYjN5bkZMaXlMY05TWjVPWWZKdDBHN0VPZ3pBUlJM?=
 =?utf-8?B?QjgvVzFPc1BjN1l5cDROT2VyY0V6TW8zSkZXSjBib2NITE5RYXRiREY4Zk9N?=
 =?utf-8?B?L0ZwZGEvWDhUZWFXbnJNYXNkeXRTOVhHcEVWUVdOM0w4UVZ0ckFlSkhsbHEw?=
 =?utf-8?B?VHJ6aDZ2Z3ZTRjdROHhKUUVyU0lVSldJcStFNUF2WmlCYUFjRUdDS0g1M0R0?=
 =?utf-8?B?ZDdWdjdBQ3JYUjRQMjcvSklBMjd3WEUrNmo0MUpoSEhYNlBWZXIvQnhCMW1o?=
 =?utf-8?B?Z0ZYV0FIanpZZW1yT1k1V1AySWFuQ3ZCUUtJRjhqQ2xqb0JJd3h5dDdhMndm?=
 =?utf-8?B?MGZtS1RRY1ZnUitSVjlTVXRBcWV1SjhyZTBZOFJjWllEL0JiVWRhd3V1WHRw?=
 =?utf-8?B?SStuNUNRbGZDN01kek5ibFdMVDZOTEhzdG1IeWtLVy9PeWVUcElOYTVPc2JS?=
 =?utf-8?B?SjdyZEppMkpoS1dqd0huUGt4aVcrQnE2SStLOGx4SkJrbTV1TU5zdTJIbVdO?=
 =?utf-8?B?QUNrUzAvbUVCNkFzTnd4MGRDRlNSTStCMnJVQkIyYWZqNXlJNHJMVDI2TjJP?=
 =?utf-8?B?ZEt2a1JNL0dPNjNneDVyaTNaZzhUakd4VytCMFpYK0xpUHY5eVFwZ2VyNVNs?=
 =?utf-8?B?cHBlR1FnaFBSZFMzME1XWU9RSFEvai9QK2ZmY0FENU9FR2F1ZGdhU0MrZ25I?=
 =?utf-8?B?VEpqRnhlemlxRzNRNUN6SnFia3pzbThsSHQzWkkrRFpyckt4Um1xRjBJaFl0?=
 =?utf-8?B?cUdmaFB6YjZYNDMrSFNuNTY3eDJ0U0JaNGxGNFlrdjQxNHVQZlpXb21ZUHlu?=
 =?utf-8?B?dFhueTIxTGQybTFkT1hxMEtUd285ckZBM1ZlaU12Zy81d255WWU2VnZ1eUFy?=
 =?utf-8?B?WCtsSUhLVDZPNlE5ejMyYUVlYjdIektaajRSQ28xZjdRWUdrM3ZERlZrOHBo?=
 =?utf-8?B?bGhNM2E4RFdvb0hBN0JpZTFtdWVuMVhyT282RWFnZVR2UngvdE9HMGVaYlM4?=
 =?utf-8?B?MngwRThhallXd3d0UzdLUmRoREluVFQzRGNYZkJ5b2RmZ0lYWTJ3WGdUSkJC?=
 =?utf-8?B?aXNCeVcxVU5qY1hKcFYxVzllR1FWMlBISitRNXdYc0lrOTZOUHQxUXMwTnY3?=
 =?utf-8?Q?1dMVAbQlJO9jA7Rw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ea4c42-9d98-492d-e6c3-08deb7ec7726
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:25:37.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhQO5M6RtMLM8+3LhXMjW4tvMB/AIIyC0a5gDs5B/TRA6BLOVrhWouH3WNjdzpU/p65UGLGU4Jiqr1/sqnyRQyun6NzD6kJWoSeP/i2L2dY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6614
X-purgate-ID: tlsNG-ef75cf/1779445541-20B60C48-DE0190E0/0/0
X-purgate-type: clean
X-purgate-size: 2193
X-Spamd-Result: default: False [-0.18 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A88A25B205B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/05/2026 11:24 am, Roger Pau Monné wrote:
> On Wed, May 13, 2026 at 01:44:47PM +0200, Jan Beulich wrote:
>> ... shadowing a function scope one, thus violating Misra C:2012 rule 5.3
>> ("An identifier declared in an inner scope shall not hide an identifier
>> declared in an outer scope"). No difference in generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Technically, as the outer scope "rc" isn't used again later, we could
>> simply drop the inner decl. That seemed more error prone to me, though.
>>
>> --- a/xen/arch/x86/pv/emul-gate-op.c
>> +++ b/xen/arch/x86/pv/emul-gate-op.c
>> @@ -286,16 +286,16 @@ void pv_emulate_gate_op(struct cpu_user_
>>      if ( !jump )
>>      {
>>          unsigned int ss, esp, *stkp;
>> -        int rc;
>> +        int left;
>>  #define push(item) do \
>>          { \
>>              --stkp; \
>>              esp -= 4; \
>> -            rc = __put_guest(item, stkp); \
>> -            if ( rc ) \
>> +            left = __put_guest(item, stkp); \
>> +            if ( left ) \
>>              { \
>>                  pv_inject_page_fault(PFEC_write_access, \
>> -                                     (unsigned long)(stkp + 1) - rc); \
>> +                                     (unsigned long)(stkp + 1) - left); \
>>                  return; \
>>              } \
>>          } while ( 0 )
>> @@ -359,10 +359,11 @@ void pv_emulate_gate_op(struct cpu_user_
>>                      unsigned int parm;
>>  
>>                      --ustkp;
>> -                    rc = __get_guest(parm, ustkp);
>> -                    if ( rc )
>> +                    left = __get_guest(parm, ustkp);
>> +                    if ( left )
>>                      {
>> -                        pv_inject_page_fault(0, (unsigned long)(ustkp + 1) - rc);
>> +                        pv_inject_page_fault(0,
>> +                                             (unsigned long)(ustkp + 1) - left);
> __{put,get}_guest() return -EFAULT on error, and hence the
> addition/subtraction here is wrong AFAICT.

Yes.  Teddy has a patch out to fix that, and this patch needs rebasing
over it.

~Andrew

