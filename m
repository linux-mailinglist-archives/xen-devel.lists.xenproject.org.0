Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yONgNKKNd2m9hgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 16:52:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7038A544
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 16:52:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213787.1524236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkOsR-00056y-AC; Mon, 26 Jan 2026 15:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213787.1524236; Mon, 26 Jan 2026 15:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkOsR-00054f-6x; Mon, 26 Jan 2026 15:51:43 +0000
Received: by outflank-mailman (input) for mailman id 1213787;
 Mon, 26 Jan 2026 15:51:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJHa=77=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vkOsP-00054Z-04
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 15:51:41 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e61409c2-face-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 16:51:39 +0100 (CET)
Received: from MN0PR05CA0010.namprd05.prod.outlook.com (2603:10b6:208:52c::19)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Mon, 26 Jan
 2026 15:51:33 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::15) by MN0PR05CA0010.outlook.office365.com
 (2603:10b6:208:52c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Mon,
 26 Jan 2026 15:51:19 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 15:51:33 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 09:51:33 -0600
Received: from [172.29.134.248] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 09:51:30 -0600
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
X-Inumbo-ID: e61409c2-face-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jv3BErBdXJoukMwxE8hZRx3wIgEwya8ZGSEVT4XU5JryAxznKWzpegDkGCh8LbsCuhslviFmtg0qTbdNfPKaW+pI5YG6KOTS6AVMk4SGv+mULJDozlQaqqqYPMUcm22QTimvN/ae8SMDCcCCalMB8Zcd0MCDQmPjnjSAnc87EaQCk+Rvc+j7Scl1Q5hsXD1GM31O8FX+ESZ9q00Ife+IQb5Cya7Zs95Ax/+3UIYTkxaxJWk4PeBXAPeIN5EMjMQ9aibvbkSWczKuoucDojEyTrykJZ8xv4Z/krZozFh3iFAC0RS2cNXyuoRGhOMRUdlU7VtN9aFRH0Pcjsqj9GkVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF3kGXb5vInHmjHIiUJVTuTrd+vq74gKzrDM85Nz2oE=;
 b=Z93E5KV8pktJXSUIvkZrpL/b3ss5Vxl4b8MVqpryWIP7fwUA/ewGMjcWuz7oDZtGmleAuAvJFHo3LgFvqmznukSl6U4/mqcFdHg1kLhigj/G01cVtr203wsrVL8s4HLYZ5l/JdIuJuTVESOS0xHX+pvxRuRBlkqVUTKv41ZuIXshWXJmehOf+gokfnrWBSDaL6XZXKw8CqEffcRp67r5puLC6WY61HPvI7FV6tCbtMr7Y4oYzRBHhbomi4/gtffTwaqLVg1tlxKYbFsisT865f4gFBA0GbCYYgbSa7BtlSqJgJe5vcu4ExptPPxAyl1PRBpJ4kpCTLC+vDoUjIxqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF3kGXb5vInHmjHIiUJVTuTrd+vq74gKzrDM85Nz2oE=;
 b=N9sWD7+YXFlU1FjeH7sGkdpkAViHobMEiuH56FWLjG84wEsy89488iFZRZMQTeIN9+1mq3ZoPsI2Q4atwzYJI/8Lvgcj4Ci67xGknnIfae81deacaqszWGy/oxLav/8euXAepLUXjEb4LVOc82tUJGWNCKKch8TpruV5csFD1YE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <29dac091-5f9a-49a6-acee-96632a1ebf7c@amd.com>
Date: Mon, 26 Jan 2026 10:51:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] PCI: don't look for ext-caps when there's no
 extended cfg space
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <133c1cb0-bdb6-4c9a-bea8-c50f42ce58d7@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <133c1cb0-bdb6-4c9a-bea8-c50f42ce58d7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: ab70d58b-d777-4af4-d337-08de5cf2c79f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGpzK1ErUnRoNHdRaEJURUhFRXZaUC9ZZDUwVHFUY3N2dDVzTVVyYWZRaXRG?=
 =?utf-8?B?cDQ1M3dTcHc4bkVCdlpEYlNJWTcyamMzNEV1TU1kL1lKZHZYejc1RTdDWkla?=
 =?utf-8?B?U2c2eGhPTHNKR1UvQUs2WlA5alFpQWUrTW1qY0VPcHhkUi9GbWhLNElWL0xM?=
 =?utf-8?B?RGxWbml1T0luRm96ZXdzd0xBUGxqRzZDdFc5SEdzYlVMNnQ1OG1iMlJpZS8z?=
 =?utf-8?B?MmJ1RUMzL0VRUmF3OVFwdHQzWmJOeUNIQ0tGU1gvUEdxWFBNdFlwQVROTkZ4?=
 =?utf-8?B?R1JBZExCL2lyNXlsVkc4M1FxOEkzczR4cU9ldG0rbkQrK0wvVzBHQ3hCckxl?=
 =?utf-8?B?UWZtUkd3K0svWGZGZFlsZjcyMDFMMklyNzRVTjM3Vm5kVlJEWUlmV1h5N0xM?=
 =?utf-8?B?L2QxbzFUaHBUYnd3b1pZMjZmR3pOYU9pR1pVRUtkVFY3WHYrelQ4SE5vcG05?=
 =?utf-8?B?TngvamJsdmdQMG5ZRTZvV3MzM0NWOXhkMy9Za1ZuYUtQNm44NldRUVRSZU9w?=
 =?utf-8?B?d1ZwT2xGSXRoSVM3Sk9BTVh6aUhhUmpReDhwbTdUV0xIcWhmZExvNG93V01a?=
 =?utf-8?B?cUVrYUtTeXpjbjBXSnZTT1V0Q1kxK25DNm5VS0JnTytRQVZYYXA3M25JSjFn?=
 =?utf-8?B?QTdYd2pGbmMwN1FHV013cERQOS9aSE5jei9TZWx4OHBLRFRCV2w2MDBlYms4?=
 =?utf-8?B?bitXWWVIbi9RMUJyVEdOUTdxbVZjYkRza3NNM2xlNjRXbDBqY3M5VmhYZlVR?=
 =?utf-8?B?K21GL0ZCbUR3cmJGME50cEtEb29FT1lLVUMxZm9pUzFSSkpaL2tteGhzNkgr?=
 =?utf-8?B?bmI2VEpiajlxUnBVSE5yb2xoSGVpbjJkV2R3TVdSR3RpMmlGNnlnRG9xWEUv?=
 =?utf-8?B?aTJrQU5yZU9CZC9YMTRVcnVkd1hCbTBabUVZUnFrZkFmQmxleFo2VklyWC92?=
 =?utf-8?B?dkF4Skl3R1lhdVB1VFQ3TTJ1ZGVBZDd4VHNWZDlMVGFCRjNSMjdzYytGTGd2?=
 =?utf-8?B?dUsxZjZ4cEVOY0RrWUFBaHRTZ3NHdDhvcHg4MXgrQmwzK1ZkS25RQUV6K3E5?=
 =?utf-8?B?L0MrY3huZUcxaW5icmgwUFhCYjA3VUY1WlEzY2Y0VUE1aUdoWkNUeHpDVm5o?=
 =?utf-8?B?aTRSMjdhWW5QaWZ5d3Ztc3J4SkdiMEdnTG1xdjY2MFgzWHRkSWR5aDFnVm02?=
 =?utf-8?B?K3dkZjB3N3hQdEo1S3AwbzFmWFlWN2JzRHdMb3V2OGdpMVJVK2hCdE5GaFk5?=
 =?utf-8?B?WERwekFFT2pJTkpxdk41T1AzVSs5WVlqVEppaVhxVXNia0puYnpHTWo4ODho?=
 =?utf-8?B?dmRUbDZKTVFPZnV0ZWFmcXV2N1NUMFFRWUVHRkJhWkdQclJyNDJ1MktHd0l4?=
 =?utf-8?B?aWo1ZW1VejFMb2dFdGVCc2VjNjgxUXp4ZVdVVllwZHFTTzFGYndjNFRmbHN1?=
 =?utf-8?B?NVd6eUs1eW1mcjF5a1Z1U01za0VzZk5iM2FrYTFHd1RQSmE5YmNjeW9aa1Vw?=
 =?utf-8?B?RTlsSWY1SjRLeWxvZ1ZvMzRXcWtRZXF0eFMvZlY0Smdpd0RKVG9xd1dualF3?=
 =?utf-8?B?SURxeXJ3bisySm10RFBsdUVqVWZoSHc3SEJnOS9RcDVFM01PKzJRS1hWaUp2?=
 =?utf-8?B?QXhWVk9MRWNON2lOblVzQU53UmxrZWRPZkhTaEM1K0g1MFdQRnJPOEJDRy9x?=
 =?utf-8?B?bmQ2QVU4V1Q1azlsTnlKeFRudXl0UnUvL1AzWEZteFhOUWFTTHh3RGhCc09i?=
 =?utf-8?B?aVIzaWdzMDZmWTRjTUJ6Q0RjUjU5Z2lLVnhjNTJSemJiTEcwS0lHRVpkWlpr?=
 =?utf-8?B?cy9UT01CZ1FLeWVvRlJuOUMwdEpZcENiNitNSW9sZVpPcS9iUUZ2RUVVdnBh?=
 =?utf-8?B?SW5XOXN0bmRIbmlDYnE2MjBybmIrOTRkYkhqejVMQ1U4YTIrVFUyL01lMURq?=
 =?utf-8?B?NU8rY2ExRUxObS9zcUhyUGRLVHFtWWpzL05pRjV4cXVIM3hvQjhOUlpUVFYx?=
 =?utf-8?B?QmVodDliVEJmeW5TRUgwcUEvWnB2aUdOajNSdlBXUE8vYU8ySnpXaUt1eCsz?=
 =?utf-8?B?aUhBZXZzb3B4SERVR2c0bzBKRHhhZFRjYUZPKys2M2dQZVo2N0FWQjhQZHZp?=
 =?utf-8?B?c3RZUVlBcERGRGFqclAzd3dkYUNBZ3hkNllPWXIyNWFTcytCK2lGNDJSMEhi?=
 =?utf-8?B?TmFyWldsdjhKM3lLU1ErL3dLYjgwNkFoSytpeG43VzBIbDdSMzBIcC92aUZr?=
 =?utf-8?B?VGYrUkwvb2FvOUxkZkdoRzdWbWdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 15:51:33.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab70d58b-d777-4af4-d337-08de5cf2c79f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3C7038A544
X-Rspamd-Action: no action

On 1/19/26 09:47, Jan Beulich wrote:
> Avoid interpreting as extended capabilities what may be about anything. In
> doing so, vPCI then also won't mis-interpret data from beyond base config
> space anymore.
> 
> Fixes: 3b35911d709e ("Enable pci mmcfg and ATS for x86_64")
> Fixes: a845b50c12f3 ("vpci/header: Emulate extended capability list for dom0")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> ---
> Because of the multiple prereq changes, despite the Fixes: tags I'm not
> quite sure whether to backport this. (I'm leaning towards "no".)

I'm also leaning towards no, given that the ->ext_cfg change has grown in
complexity.

