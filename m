Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJuDLotvc2kwvwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:54:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110C76095
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 13:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212266.1523517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjGfX-0007OK-OM; Fri, 23 Jan 2026 12:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212266.1523517; Fri, 23 Jan 2026 12:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjGfX-0007M9-Kq; Fri, 23 Jan 2026 12:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1212266;
 Fri, 23 Jan 2026 12:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=btvB=74=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vjGfW-0007M3-LK
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 12:53:42 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8968d4a8-f85a-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 13:53:39 +0100 (CET)
Received: from DS7PR03CA0022.namprd03.prod.outlook.com (2603:10b6:5:3b8::27)
 by DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:53:34 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::5e) by DS7PR03CA0022.outlook.office365.com
 (2603:10b6:5:3b8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 12:53:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 12:53:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 06:53:34 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 06:53:32 -0600
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
X-Inumbo-ID: 8968d4a8-f85a-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJjmO2zqb46//thrPxx9RhcPZfo3Q3egXrTyaOGn3AsBJp3n0v07p35dORBhqBJc94Q7+vHkumJ49Es2imL8BcnR1U39ly/M+lIYaYAaVGHfw5HETeMV0c3v9ZA4ma+gIu5V2lpYL0ikLQTozDZ+ukKFzziayAwh5Xd7qbUoRxHSneINmHEPGZU8bDyG77BviS8azzMOKOEaW1jxpR/lv6gh4JLBUaZlNlueI/BXky2GQ+0oRfzEE7TT+Qdu7vkO6OMO5jdsP7FcCgnK6YdJ2SIjscMLmkwteQ8CRWDkAWtQgKsqSsHY9vNxe2MJxhcC9lOaviRRWndXg+KNnlDa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW35XvlIx+S/Jd949buxSvZ9DPei6U3vMT8XhIBiezQ=;
 b=BORGl8x81ccboXC7iGWSnqS5qOzeHvHSH8hiru33ElmPbJB6/pRFqmG9xQ4uCRAo00gvkLIfNspqPIglUPYZUNbwCBvBfkjjRYqHFoVET9t3HdseDq4IgfUZPbn3AOK19hJ0LYL7gHoD4YNUV4AEkIhSaxH8O3g94tgs8r83lrSBRMCDHLhzgtwk2ec+Me+DJxqAV6AgSx+ML1Z//+Be2i+wXeQr2JL8MxDpK3fNKZZQf+INb/vtNiSgBjs29x6ywfcb/1tYGdqCA9rv7leGKONqKVekD+TQxOY0SmnXwfxJNzjybMLurpk4uvCor0xtsQ1XXnuUVG2iGYU0j3oC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW35XvlIx+S/Jd949buxSvZ9DPei6U3vMT8XhIBiezQ=;
 b=Zjx4EvfekGV/6WyOw+OjCe9P8wPRC9/u1EMgPgUAd4qPBDyKdOlp0dicDbUDVuUnf/PJ4eBFZWcO508bzY7JB1EBGYAA8dwX2KSGZXzLbkpVHIIb3M5nR2uPdNp8s5lEoKpdi3o3seyJubeGhWe22frvYKibSypWG2Vv9bLwRc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0e3e6d33-c0a9-44a4-a7f0-3456c9d8d77e@amd.com>
Date: Fri, 23 Jan 2026 13:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
 <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
 <7024dd52-b209-4daa-94a4-8b966aed4499@amd.com>
 <a4dc1cd1-30a0-414b-a2b9-686d30f69f8d@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <a4dc1cd1-30a0-414b-a2b9-686d30f69f8d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|DS2PR12MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: fed8c37d-ceb0-4e75-c693-08de5a7e6b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1dMaEdVMm9mSXdrd0hocGQ1R0FINFZNcWUwR1VoZ1I1UThUdnVqM3RZWUhN?=
 =?utf-8?B?M1lKei9ETVRQVk9kcWtydWgwejZSbTN4SDBMRERQZ2VkZmE2ZzZtSjlGdGRj?=
 =?utf-8?B?T09rSUNEd05KWmU3Rnl1RHVtbktlelliUU5NSkxKa0p2Qm0xTEdFR29WVmRp?=
 =?utf-8?B?L2FDTGhJbkVKV1JJQ014bGN2b0tldzdqYXhNdWNZd2x6UU9zdXBjelk5WnNG?=
 =?utf-8?B?ZDlQM1NFUlppSTZrc1Y4cnN3VHFONlcrR0pnaHJxOHozYUhTUURpWEVyamt5?=
 =?utf-8?B?RDFRQ0p4eGJzOUYrM2VUdjlFUlFGU2dmRUdJaEplWDBBSitYdlhZN3lVaEYx?=
 =?utf-8?B?NjFLclV5MlV5QSsxZlJJSU83MDVoUm9sblk3Q08wWTB5c3JkSzV2RGFZbjRz?=
 =?utf-8?B?OGRuMUk0OVRoTTJyS2VJSERyempLcm42WFdyck5WeGdTWkpuSkFueXJsWVFP?=
 =?utf-8?B?cGxJRmlUZDAvQlVFdVJzcUZpMlUyc0VRMElEV3dIOXZjMkQzTG1DU1gzZHFW?=
 =?utf-8?B?dkdqRWZSU0ZIbSsrdTN6UFBzV1JUSmJSbzExamZhYzJGWnVZdmhoQTJ6c3c1?=
 =?utf-8?B?c1crcU13R3B6SFMwa01yUHpSTkNlUVFWNjJCMVEvMHZiNkNOU0hXUC84djcv?=
 =?utf-8?B?d0F6SmluUjY5Zjh0dGRRSDY5NjNZTG8rTlpwa1E4Y0JFLzZudlhWUHlpRldK?=
 =?utf-8?B?cjFzVWpncWdTU0lpWktKQW1ZMXNocm5pYmh2QWxtc2lKTzNqbkM3NW9VcUNM?=
 =?utf-8?B?UDdXcVo0T0FHYWVsSGZ1L1hsTkkwZlluVlNoR3h0MUlKYlh5VGtpVGNMeWxj?=
 =?utf-8?B?aGV2Uld2VXJkNVc5Ti9aNEJiL2J2RDB2WVBsQnJNOXErMno5Y2o0RDMzcFJZ?=
 =?utf-8?B?dnFKZ1pzeS9EQlU2MHRzMzllYnlNZmZJZDdSaytkalhBdzVSMWYvMWI4V09v?=
 =?utf-8?B?SzNzQ0ZmWVlVM3IwbUhrMVc0QTlPdmorMkt5amVlbkVNMGpmUWxwbExISTVk?=
 =?utf-8?B?THA5cmsxczh2d0hEWlZBclNzYVNyVk1ya2IxRkpuUExkSlZ3ZVJ5THFveUhB?=
 =?utf-8?B?dTIvcUJpV2pBdngwWWpuVXBOY3VTNk5oWDZJTlJwemJ0WUpjNnJ2L3ZkQktm?=
 =?utf-8?B?eDhKUXVlUGY4L01GUTJpNUxwSWhsNVpjWGU5VzRTKzRhRjZUOEMxMDBxUHlB?=
 =?utf-8?B?blkzdXlYMzd3WGh6RWpnS1B5N3M1TlpxRy9xTVRkeEFaVVI2V3p1WlhQZGZL?=
 =?utf-8?B?S2pIUmx6WXZyMjd4dS9qQVZ6NFpsejQydWFENXJneWt1RFdlUGF3amxVQ3lO?=
 =?utf-8?B?VkdDOEJGVGtpYmhSZVlZRFJ6cGhRWXo2RVZLUklZWC9Sc2tQR2tBeDRLYnor?=
 =?utf-8?B?dXp0WGdyVFZSbVR4T3VjeW0wZmNQREcvNERsclNIL3Z1Ukp2YmdOaHlmZTRl?=
 =?utf-8?B?V2xuZUFHRU5SVGNYMnlBODVCME9wcysyaVVCckFZSkhxYlYvSzN1WHAzQXRm?=
 =?utf-8?B?aEVzZXcrYUdrdC85OEUvZFBmWG9ZSmhoVVNhclI0R1pybUxYcStwaGNrbkxB?=
 =?utf-8?B?MW5iQWMwTWx3aXRjQVk5SmZ3eVN2RHlvMGQ5WTdVenJOVlpEWWMwcVZpem95?=
 =?utf-8?B?aGI2Y3VnU05UbGtiNTZkU2JPY3V4OGt5RDd2WS9XWkx4Q2RHNmRnYmptb2hZ?=
 =?utf-8?B?MUxUMzZaMlJwTXVaSU55SnBualAxR2x2TzczOWF3aTVZSkFhVmsyOGFNenh0?=
 =?utf-8?B?V1JGYnFyeVRPSGdkaE9wZStTMFBGZjYvVVVRM3pmVmM5OVhjYWN2MzZIRlJD?=
 =?utf-8?B?WHZwbElRMHVtekcwZmlWUWYxV29sQmRIK3NmTUNDOVBnRHdld25EYlFTQ3NC?=
 =?utf-8?B?Ym1ob1EycTIvY1k3RHppNXNIMmlXd3NhT0JQNnA3ZnVKTFBVcHhVOHZkeGdm?=
 =?utf-8?B?K2h3M3RSRW44K3UwQTNyWjBLZVIwNG9ZL2VuUlUxSTNnZGljTGd5STRJQUI0?=
 =?utf-8?B?QStaYWNYQktMMCtpbS9nckQvREpsd09GaDlYWFZMcFQ3SDZ5SlpyZ0VmOWJ5?=
 =?utf-8?B?Q1FRcXE0TFNjNysxRVVOdkM3b3E1UTFadGNJRFFqcjE3aktGbWNkWk1GbnlJ?=
 =?utf-8?B?aFZ2SW42SXI0UVRnZ1F1VTFKYTRLQkxxSFNWZG9aYXltY2FObTBjNDlrUjZo?=
 =?utf-8?B?RUtpWHZXWWtOVkNmR1B0c2NlWVFpVVIxUWJENXlIbkdmMWN4b3lBendRdno0?=
 =?utf-8?B?b2VQREZhTGsvRmlzNHBDeWlVTnhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 12:53:34.6390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed8c37d-ceb0-4e75-c693-08de5a7e6b5d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.824];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 2110C76095
X-Rspamd-Action: no action



On 23/01/2026 12:37, Jan Beulich wrote:
> On 23.01.2026 11:56, Orzel, Michal wrote:
>> On 22/01/2026 11:01, Jan Beulich wrote:
>>> On 22.01.2026 10:49, Jan Beulich wrote:
>>>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>>>> There's some assumptions as to which targets may be init-only. But
>>>>> there's little reason to preclude libraries from being init-only.
>>>>>
>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I can't tell (yet) what it is, but as per CI something's clearly wrong with this
>>>> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* fail with
>>>> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting it may
>>>> be an early assertion triggering.
>>>
>>> Or an early UBSAN failure. I think ...
>> I did a test and it looks like the problem is division by zero in
>> generic_muldiv64. At this point, time is not yet initialized on Arm, so cpu_khz
>> is 0 in ticks_to_ns.
> 
> And division by 0 is otherwise benign on Arm64? (On x86 it raises an exception
> and hence would be a problem also without UBSAN.)
From the ARM ARM spec:
"A division by zero results in a zero being written to the destination register,
without any indication that the division by
zero occurred."

~Michal


