Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFJPNho9ymnG6wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 11:06:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511E357CA9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 11:06:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267343.1556863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w78ZY-0004t9-Qs; Mon, 30 Mar 2026 09:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267343.1556863; Mon, 30 Mar 2026 09:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w78ZY-0004qs-ND; Mon, 30 Mar 2026 09:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1267343;
 Mon, 30 Mar 2026 09:06:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w78ZW-0004ql-Qe
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:06:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w78ZV-00DaBV-R5
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:06:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca3cf3-2eae-0a2a0a5409dd-0a2a450bc832-48
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 11:06:09 +0200
Received: from [52.101.53.11]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69ca3d00-ef63-0a2a450b0019-3465350bc0d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 11:06:09 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA0PR03MB5497.namprd03.prod.outlook.com (2603:10b6:806:b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:06:06 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 09:06:06 +0000
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
 b=l0lLYPAMCB8PxgjtGcWyf/hhPecK0FL+rSla2pVSMauKykIOAnYKDLDWruR3ZevAS+oJsbhFABact22Oj0vAQps7yUlbIJqT7MXnDdEJeyZFaaAgH8HvjQWFHp+rE5VLV/RnjQGGAdKaVi5EkMDcNi1F4sAGvn2TZUvL4r1Dz814QxhYXWz/XRYGjFsMSjDsGeJFcJhwamDrv0F8py01V0sZcwmQ7bdwqeFXR7dKs73MiwDe2odS9MbDgleDoemwzSWMJ9vR1jAxm3FOcJsqHsgW9YAS7MpQNwURjyfb6MxZTzpf0KJXHNRsxD5TCWY5ozLOId3zLKtF0EVtm6t0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4KWgcq2qbhLKGx8vdRuANk9N6HpmxdVZE8nIV7+vfc=;
 b=Op9t+JFsDeBO1DhoD1X4tCFmi6Tyd2Rcw2Mc5yUdSeaNTGLYs3aTpnX0mw/J6/X5CriwKDTCjkET3aNlMcsoUqLHoCGUCYsU/ChaEM88QJzRDpuKTTTq/U1yvWqKpV4yyAXIRv8BbnEAB1CdMxW7fLkcowRHjtsocXPbHbxgwcQYTxCMEBlQbN7Qfe3dfNcYO2sbjTlBHeBkIJRsJ+RgcvDmIq3sBx9GK3k9kOJPbgcimyNRFkIFs8iIPvOtLpqJZgXwVq+tgKDmPwMFmJiFezf/jv2qTItziiRNf9maK7AJ2H7LRpCvAAYqrluLhBbWVQokqAU7BQpRmis5Tws0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4KWgcq2qbhLKGx8vdRuANk9N6HpmxdVZE8nIV7+vfc=;
 b=F3l4zBarh4SzrSU5J+7sr6/tod7KGzybj9gmdhdtjMIBJ5N/B5aViVNNt+Cpt6sGSPcZLtRMXOMsCazf+zq8Uzp8FB9TEewv/N6XiR7qSRmLpTVP1dzrN2Bqo4eG8eGa61OLxuTQmCp2dMcfmqnfhMjQAaHTWSIDu9cCyCUB32U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 30 Mar 2026 11:06:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] xen/uart: be more careful with changes to the PCI
 command register
Message-ID: <aco8-8hc5xJCZeal@macbook.local>
References: <20260327135420.7246-1-roger.pau@citrix.com>
 <20260327135420.7246-3-roger.pau@citrix.com>
 <93a09dbb-0a8c-4eeb-b544-c9409b9f85ce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93a09dbb-0a8c-4eeb-b544-c9409b9f85ce@suse.com>
X-ClientProxiedBy: MA3P292CA0070.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA0PR03MB5497:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0b688a-fcf9-4bcc-e66d-08de8e3b938d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	EkYM2Z5BSvEOiYQXztzf+8ULvVDpcq+j2k69iTYDdcluyAF7EIDbzIj7WUFzUI6WOkIm3yzl2Kor1U4J61wHtPUfmgNDYy0SH+NJYIiRQg2xdjA2EzvexbkJMxsXHLUbLbh0QA+1Lmp3wScuRlyN2dEOmdZxQRSp/rV1wXXKQKDMGqJdIoWQJwx1G5Qxn+2cRNHxwDJeSsrZF/vHdGhuuwbri1epAgo4dNj9j4n7Wf8xzWT6MKovMVTzu4oHBux1ELvS2m8oxPXJPXG+nn0kV7oef3jSLxJPlJ5IT2CNxkAOOanQmecyQq7BYK/C9X1hp42WZQbUDJr0p0mKZcR7T5ISceL5dl7Y6db1cyG31dpSXduYRu4cAONEwRVvwXPBCFmU8DtSdvxHnvZoj8UIdSD7MfP07uGWat+JP/G2QKiNW5UTv8HFiX4o7mhig/GV7NL6D784WoFMtHcNmoq6hZdtxIw6QxfHpVBEfZT/OGJBKeUc19ALKbpV4aoipM/Tt7UCAj6UuskodEWj4XyWId2x8YgAdOQIrhMcz6C3RMMtqx4l+GUs4xQGK19CT1R8YQKJmrSU19DfrdHQxlImFmIw/iuaSY2ARph0tGPOazyWoFjq8yau7gEwAv8BY7wtRBEGS4VAWeRewWThyj82EaQZ93BJTK0+pZRgQxBwwjvZQtFAQTfWCssQtDK/2d4iI+F/oKSKMD9jwcKWs4SjvzbFJyLDnzLr1Qria71fQUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlprMFlQaWVkS01XK2twOFZRMUx0eDB5cldaeURRdFUxZEloRkltL3hVelhs?=
 =?utf-8?B?amE2eVFMcjBtV3EweHdPdVY0c2s0THR6L0I1UnV2TWM2V0MxajR0ZGpJQjl4?=
 =?utf-8?B?bTgwRlAxeis3Uzg3YWQzY21OaDk5MFp3YVZRbzVCV2NVb0VjcUxGdjFvRCtX?=
 =?utf-8?B?ZU9XL21tWnFzTzJ6ZTJKRHpDdDBIQ09xVHJWNFhrU1I4TDJFdnJ3SFFwWWxm?=
 =?utf-8?B?Sk1aQnRFZHJKR1JRdlYvUytqdkYxZEtiSHdWQVhhSU1TalZOMVgzdVRFcWZk?=
 =?utf-8?B?RGpudGtvWTlXQ3FhQ2R0R0l2SVBoTGRVMXhXb2JPQWVCZS8xNUVWZlJMVFRR?=
 =?utf-8?B?VFlzR3JBbzV0MEsvSEtIc1UxWVJ0bW9kMUJDSnV0elA0aVl3YkZqTXREWXNy?=
 =?utf-8?B?eDZYWW9HSXpVOEJjZysxblgrSDFBMVZvTUdrWXNqUnE0NWNWWTUwMEtoeFo2?=
 =?utf-8?B?M2lYbU1yMVVOaEhma3JVeEMxZUJ0aDJZQzRBa251dytlRmVRSkxVOXg2VXdz?=
 =?utf-8?B?ckt5SUNiTjZGc1IrRzJkZm1mRUpzeGFQVGZnUy9wSnBid3hRWjFGNnJ4elRC?=
 =?utf-8?B?QzZsRkhqRjFOM3NtS1UyQU94NlBQK2xERk9rSlpEQjZGWFB0OUFwZTlXTFVC?=
 =?utf-8?B?bkN0MDNNYUhiM3E3UGRLK01JR1RMNWhwMC9pWHJBd0lHZTViY21TeUkrbTdo?=
 =?utf-8?B?elZyOUVaN1hEd082M3FGTlo1TGhRVGZxMXRjN282b2ZIOVRvcU12dG1YTVRw?=
 =?utf-8?B?MStGdmxwYS9UbWVZYURONmVVS1J2YnBiMlhXMGE5eFl2R0lyNlkzcm41UEVL?=
 =?utf-8?B?L2ZiTlVlTWhWZkJWVTl4UGV5ZVh4cEdyWnRmcmV2TFBBNmJMa3FtWE04eWwr?=
 =?utf-8?B?NXpRZlVlaXVUa093TUZPV0R4YTNiR3JOcWZROHpsSzk0R0R2ZDVkKy84c2hY?=
 =?utf-8?B?eU41ZGF1Q0VVUU5VUXZ0QW0zd3VDbzd0Mk9uYWVKT0NTblFLVllIdmd1ZmZl?=
 =?utf-8?B?SXBleERhZmZVQ3dWL3crRWZKQnFQZXRzajFTL0FDdWxwaFZyS2NCV3RDemtH?=
 =?utf-8?B?ejRmSGo3eEVteFVaOG9VazcweklpbEFZREtFMzhXeklaTDJzZWVRL21PYU5V?=
 =?utf-8?B?R1FBdUV5K2hMTUpJUExBUzdpL1ZnKzdOWnJEWEgwcXBPMzVSdE40UzNqNVRv?=
 =?utf-8?B?R3JtelZDM3lYKzFiTGZhZmF2ZHJJRlNkTHhEUHRORHlmZ0J3RFlwRnIrTUJ6?=
 =?utf-8?B?N1JrQWR4WVlCTnRNbVM1bStUQVhEak1TZDZobEFjc2Fvb0J3K3BiSk0wTG12?=
 =?utf-8?B?U3VDeFdkWVdBNG1ZVXIyRm9URVRrWWdCM1ZBOUFLaHFPMFd5YS84VVp3V2Zh?=
 =?utf-8?B?WWJzZnFvN3RtcExSZXRZNFJjVC81SldJTnpyUERKdWVSZmlacmI3OFZMWVRC?=
 =?utf-8?B?NE9BbFNJZnhDTTEvd0dPUmhqN3krRzFReTRPMXZuMk5obHpoWitGTnBhOFlI?=
 =?utf-8?B?aGdaVm5YTXp6aEt4bnJ4SHpMZmt5Sm1PWUxlNEpxU0VpUkdMSmQrYkhiQmRD?=
 =?utf-8?B?endJTEtUMUthZWk0UFZXcVhMTjYzdzZuZ0N0bmhIcnpNRmZPZDNUVytvOFB1?=
 =?utf-8?B?ak1JK3NMbldSQ2VManQwQUpVUjlvdzBlc2xvcDZhWHdOeFp6cFVJYkZpbHFh?=
 =?utf-8?B?RDlwenFMd1U0d2Zhbm50SmVuSlFzbGNySnU3ZGsranZGRW1tSW9lVHN2OWZP?=
 =?utf-8?B?OUhHRUpKTWZqWDh5U2xrSi8vMzlhc1NHVEorN2h2SVdyZXlwYys5ZW9FTXg5?=
 =?utf-8?B?OUk5ZGh1Q2xwcTd1elpiK2puY082NjlhOFMvNEFMUXQxODRwbU4zdGtCMzBx?=
 =?utf-8?B?Snh6SlM1LzByTkd1YXNZVCt3TFV4eUw2YWZ2Z3laNG50dk1iYUhlR3dxZnBa?=
 =?utf-8?B?Vjlib1dvR3hpM00vNXZjTEI4UGFCUVRRWDRjUUFYWWdHTllrbVRjY1E3YXA0?=
 =?utf-8?B?VXJ5WGxQTTBvMGVGVkprNUN0UTRkcjVvZkpERnVTMHlneUp1UVhZM1llUFly?=
 =?utf-8?B?SnArSEUwdXFCTklRelQ3dmFkTHd2L0pudjdBc0diRnhXRkxOVmZpbFg4STR6?=
 =?utf-8?B?aVFtUEZRSDJUVHZaaGhwM01LY0htamkzTFhhamE5d0VYSVlBUUY0RVFWZ3hy?=
 =?utf-8?B?NDd6ekx3MjBtYi94STNiREovZUdGRVFSeUx0Ky9iRncvNzhoR1NGTmdXUlEv?=
 =?utf-8?B?SWdsYzI3YndsNC94RWpPWHMrdkxPU0ZxYTdDYXFvNFFmWDJKdmpvaE9PTERq?=
 =?utf-8?B?WmllOEJRYWN4dE9JZU44eDRDM1Rra3ZMdkE2U3BOOStZWFZkVHlFUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0b688a-fcf9-4bcc-e66d-08de8e3b938d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:06:06.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHoHJxZJd5ZlLzOsUjkUtAmcwkPAfzVMURoYiIfZkbJwwIrXofcECy/LuaEcFIiW0kjYbbylhoVu3ijYSHEV2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5497
X-purgate-ID: tlsNG-42698a/1774861569-A1401112-2E3ABB9D/0/0
X-purgate-type: clean
X-purgate-size: 1654
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4511E357CA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:00:05AM +0200, Jan Beulich wrote:
> On 27.03.2026 14:54, Roger Pau Monne wrote:
> > Read the existing PCI command register and only add the required bits to
> > it, as to avoid clearing bits that might be possibly set by the firmware
> > already, which might put the device into a non-working state.
> > 
> > Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I would have preferred if the description mentioned the particular case,
> turning this more into a workaround than an apparent bugfix. 

It turns out that the console does seem to work fine, even with memory
decoding disabled on the device (as expected).  I've updated the
firmware in the meantime, so I'm unsure whether that update has
changed the behavior of the device, or it simply was some other
instability that was causing the issue in the past.  This SOL AMT
device is not reliable at all I'm afraid.

> As mentioned,
> us driving the device generally means we're free to do whatever we want to
> the command register, as long as resulting device state is consistent
> overall (or else we may indeed have a non-working device). Having to keep
> memory decoding enabled in order for I/O ports to function is pretty
> clearly a bug in the device, and hence us "violating" that requirement
> isn't really o bug of ours.

I think given the fragility of some of those SOL devices it's best to
limit the number of bits Xen changes, as to having a bigger chances of
getting output working.

Thanks, Roger.

