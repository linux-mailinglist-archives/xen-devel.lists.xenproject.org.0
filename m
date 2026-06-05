Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6rz7E+6CImroZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:03:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C06463E9
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:03:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="fK/pCzo9";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1329175.1593382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPWu-0007zA-7x; Fri, 05 Jun 2026 08:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329175.1593382; Fri, 05 Jun 2026 08:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPWu-0007wX-56; Fri, 05 Jun 2026 08:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1329175;
 Fri, 05 Jun 2026 08:03:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wVPWt-0007wR-F5
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:03:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPWs-00CSgC-Rh
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:03:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a2282de-bab6-0a2a0a5309dd-0a2a45078d86-4
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:03:46 +0200
Received: from [40.93.201.26]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a2282e0-229c-0a2a45070019-285dc91afc3d-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:03:46 +0200
Received: from MN2PR05CA0053.namprd05.prod.outlook.com (2603:10b6:208:236::22)
 by SA1PR12MB7245.namprd12.prod.outlook.com (2603:10b6:806:2bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:03:40 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::5) by MN2PR05CA0053.outlook.office365.com
 (2603:10b6:208:236::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 08:03:40 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 08:03:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 03:03:39 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 03:03:37 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig19ez+LbOANdHb8o3llFONJizPls2lRucvPAwMlcC9s4o/c7rD64PoLFhq3PSjsHP5yzuyLJCYkZDp/82jQaSU8Ng+0hB0gRRag872CAH2J00YDbr1wYuYCnMgK6n2qFFqX48QzjYrSyTptnDE6kzG3TXYA5br/4OBOMCltEZnQj9ppfekXeFe5LZk+u4lIn7Tg+6CqF0tzDrZA8ss1poKBL9HlqF/IhbnPp3Ljz+9uWSspr8wWWYEtwSJ4uqgnnplOSiQd26awzlcWU3SnXLvouyR+5xrpRCYLSNtUObqzNWl1Qyni73Qd3qVItSgeIhs7wy3D5+duRSZIzX8hNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crIk/1Ug3tHz/diqOfhC37MRtOb+gvk7Qt5G5LamFD0=;
 b=y98feWvCJ92s+JRVAw0h5kBdGyjxOTmRxDf0Y26nSqYuAPZPOboxeuYKvC5I4x4/9YrbNa6i8pr5sHulvUNnzG/bAf8smeR7c4xnSTyEuZrPuopmmBN07iFw2CfqIvoGUjogJC5Bpy5t1TKdBlnez7lfZ3sJOihDPYYcbwWj4nOFbyUaQ+XuQbfydi/o59etJNljFKsGquG878sZbX9WgFTLFYHQwHK78gCT65T262WU753GqbFrM0JweRZFqnEg/K0D15Up19AyUjC4A18lUJn3JDMuNd/I2f+J8F+owfuyo2yOhV2lrVLuPTI0UD3Mw+lf+eFt0JaTSNSuPBW25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crIk/1Ug3tHz/diqOfhC37MRtOb+gvk7Qt5G5LamFD0=;
 b=fK/pCzo9Q6gu2A3FwUySkTe6rCNT1lRYH/HsSTKbBgyFIGpC/0vV985vfGM8bBwLCufShTafH4Tmy/2r9DbmraC9TVu3JatO7/lyFI97jxH3qdpsbUI6o+qSKCifyxWBrVXe9AnznJgqq7XuGYPyaXgH7TJJrZXYUpZpvJ8U2bc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f9be2a2a-451a-47d3-9273-7cf5f242ad93@amd.com>
Date: Fri, 5 Jun 2026 10:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 0/2] xen/arm: validate hwdom first bank boot
 placement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Mykola Kvach
	<xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
 <6e35fc10-5281-4015-a5ad-78f8697aee95@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6e35fc10-5281-4015-a5ad-78f8697aee95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|SA1PR12MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 262c7192-25d6-439e-92c9-08dec2d8f446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|7416014|36860700016|4143699003|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	kSWCg4Gl8dnRi/vBrR/nsNQpuwqpfTOS26yiwhRPAmI7l3CM043gcSQbrCjgoQxrNWVQzQ/Rqk/RY+0xVm9SCiscIA3EXrH8lAKLN3IEtHtIXdWYIP0htXyZMXGp9clPuzrAQBRAsgA41SEQWnR/fpSArvpu23FWOZUwIL7M2FBEbqGII+mSkbApCUTV/Rcwwwq6DuVCZdpHKd9JgO4WMVA//+1dLAIlO3oqHBoqp8gGwglYTXo780SFYDk6DinoDBzxykr/csGIKRFBH9Ze8zWosR5gw/bRPaFULaRjSg11/tgLUhE18JNbBFESutHXRNzV02HLg26Ry7+0mXuxsJqwVE2dTWvDroLaw/h6q6KaugHsrVEfd4sk1SYzbQtwY/OeKnlKgptwsly1t/vtaouQcht7mOPta6hi8GR3zCVaUwLijRNNpWID+phzEE9/V5IWD1OSob8/3WEjkSIkPLndURb/zA7i7b4KREg6wLGTouqSBH80+CjFvBMvVZxm62AgkwRDjWg5pcaeynOU+6z5GgDRnk1b5dzl6xhJ+0YDVU2IvtTr+CaqpxXE0BRFitD0jxl8ZBRXq3p9iTqtUSrAUEVvsi3s5XBTlgKqU7dEb2SvdQ8AveuAobNt+KMPtHcWGM0NrDph2yUGqauN9a/s2BNu9agPlXiyiZrKs7ji9eJLOIOZfGeD9vSgieJH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700016)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9jOmZN1Ts1NSfywoj/QOhT/89NkbcZqRVXNevjmpKPdnGqf3bLJDlIKRFv0wzUDFpeX1SjaTcc4EbUDxzYLmkAUJP89jRKHAyON7eehqXwUUZqzUW+F38Gr8MOECVI+PYjUtkapQPQilpyknd507fUk9dVTjsShPJuvv2ghKZfJ6Q1oVRB/LNpQ0sMs+vh+SjiLLUAWsr/rFS5ljIZFQ3EgdYyPflujY9vE7rFab4kDw74E2CMiP4n05V3lTVn8e11OJJ4LaUT39090aPzKxrO3+UPuHD4DcquWRY4D1U1X2Ll2YiekkXsyo29qJtFVqIphXdPVkbIFnGvW85jMR1AVDk9R0lcaQnV5OL7V7KV0pQQLOXUo0cXs5iE4avrz08p0JoyfrFnPoQUyXWUR2YVzlc1aHb5ENIbTkIrHo4Z/ASx1FAjQo2uunTH06HGAf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:03:39.9822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 262c7192-25d6-439e-92c9-08dec2d8f446
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7245
X-purgate-ID: tlsNG-ef75cf/1780646626-22573C48-DFC7FC95/0/0
X-purgate-type: clean
X-purgate-size: 2055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksiikurochko@gmail.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:mid,amd.com:from_mime,amd.com:dkim,epam.com:email,patchew.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF3C06463E9



On 05-Jun-26 10:00, Oleksii Kurochko wrote:
> Hello Mykola,
> 
> On 6/5/26 7:19 AM, Mykola Kvach wrote:
>> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Just out of curiosity, is it okay that the email address listed here 
> differs from the one you're using to send patches? (By the way, nice 
> email address ;))
> 
>>
>> With LLC coloring enabled, the hardware domain memory is allocated by
>> allocate_hwdom_memory() instead of relying on the fixed direct-map
>> layout. Since de99f3263555 ("device-tree: Improve hwdom memory
>> allocation for DMA"), the allocator prefers lower host regions, but the
>> first-bank filter still only enforces the old 128MB heuristic.
>>
>> A low candidate bank can satisfy that heuristic while still being
>> unsuitable for the Arm kernel/DTB/initrd placement rules. Split the Arm
>> placement logic into reusable helpers first, then validate the candidate
>> hardware-domain bank 0 against those helpers before allocating it.
>>
>> Changes in v2:
>> - Split the previous single patch into a behavior-preserving Arm
>>    placement refactoring and a separate hardware-domain first-bank fix.
>> - Rename find_module_placement() and place_modules() to use DTB/initrd
>>    terminology.
>> - Pass ramend to find_dtb_initrd_placement().
>> - Update the stale tools/libs/guest/xg_dom_arm.c reference.
>>
>> Link to v1:
>>    https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/
>>
> 
> I would like to clarify whether my understanding is correct.
> 
> With LLC coloring enabled on ARM, the allocator could assign the 
> hardware domain a bank 0 that passes the size check but is unsuitable 
> for kernel/DTB/initrd placement. As a result, the hardware domain may 
> fail to boot or could silently corrupt memory if the images are placed 
> in an incorrect location.
> 
> Is my understanding correct?
Yes, Xen would fail to boot such domain. On Arm we carry a lot of placement
logic we need to deal with...

~Michal


