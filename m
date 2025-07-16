Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23FB07EB3
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:18:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045663.1415868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8aA-0000dx-Tu; Wed, 16 Jul 2025 20:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045663.1415868; Wed, 16 Jul 2025 20:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8aA-0000cE-R4; Wed, 16 Jul 2025 20:18:26 +0000
Received: by outflank-mailman (input) for mailman id 1045663;
 Wed, 16 Jul 2025 20:18:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc8a8-0000c4-PV
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:18:24 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2416::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04acbbea-6282-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:18:22 +0200 (CEST)
Received: from BN0PR04CA0125.namprd04.prod.outlook.com (2603:10b6:408:ed::10)
 by DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.33; Wed, 16 Jul 2025 20:18:18 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::dc) by BN0PR04CA0125.outlook.office365.com
 (2603:10b6:408:ed::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 20:18:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 20:18:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 15:18:18 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 15:18:18 -0500
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
X-Inumbo-ID: 04acbbea-6282-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAbqKeEeRvr0GIWwEBIOm0C5J6jL66aRAAG80nFc7mTBaAm8hv+LT6ZzTEFgcoXEt06d5BkkCd4MfkmGx6G6iZK6EkTSO5Xk+Jg4AIJyg1n4iOyNOHhl4MR20QpBvOa3IZEeqamO7gr+6h3w803ooYylM9n5Qb7j/vXx38yZyn2SqQige8HMVVffPx6sWCW9Jtq3OBF5YU97mWgH3/zCQvV/dhQrdL9QeHz7KPUhgNhmOz5fYJlW8A85Kn4BePJ6syhhe7h68/ySzqNQjMTtxRRGIC+IIbhnfEL91E1LxFi6wRmoRxpx+649LgxOqF0UtxDYeF+G36E4U72bka1LCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfpBy0ftzUb0Va9clR4wpoRmjCkTqQeKmn4bgqGGnJw=;
 b=ZUbvl/TB7aYOgnEk5WnQFFOmig5E82ulyJ2WVkPNISfChic6TO53xeT7NN77pNb/aUKCwl67n+5AKbrBG7FIMDb8CP4Ekp0s3TlfmT8WwCNAx1C8HE4BOQv/g7y04p/BUdiU90ZrJK357XvCRDeB8D8wooL8awExmORDB/bX/XUiW+dycPzEoRktRDrKibBCxYS5SEObD7I5QtBr8+LVRXWwcm30aRXg4L43XbAlYxyzVdrN8XFv+FwXk3xa8ryp7SZfu2yD1dSSzPrjOtPqE3RjnnIE/vqRCPuwydIOg/Rvo84vsWYKgZKd81x/cE1wODLbvzXZs6Mt378psa2Wig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfpBy0ftzUb0Va9clR4wpoRmjCkTqQeKmn4bgqGGnJw=;
 b=O1ro67QmJnt7PtyGMiL3leD68ZzS59st39zuU5y0J3WBYTp2S6zM0xNBvvEzT9Kwq1B5DzdFn9N32colmjpGxFE7XCZOd4zmao49oxN+6wOVehE2Mw270YUYUpGjuvH90jVBJ9KBtLfssi13ECr1KGbtBTuwgOjMZ9GY0sHNsuE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b5c387fa-d5ba-4669-aa09-1b0c94201c83@amd.com>
Date: Wed, 16 Jul 2025 16:11:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] tools/xenstore: perform kexec for stubdom live update
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250702081305.14440-1-jgross@suse.com>
 <20250702081305.14440-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20250702081305.14440-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DM3PR12MB9416:EE_
X-MS-Office365-Filtering-Correlation-Id: aabf3a5e-76b7-4b31-6722-08ddc4a5e772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bERoRUFMZTl2UnlmVkloZ1NKSjZBTmF4MmFBZG95L3VUQWtWYkVxV0NyQjho?=
 =?utf-8?B?UnkveDFDVEREZkg1eC94Tk1TZWVJc0hGdWowMU91VVNmV1B3MExUZ3laZVVv?=
 =?utf-8?B?SDBzWlNwaTdMNHhneE9WTmREQndqYlBXdjlQbGxlRmNMV2ZGR0Z0b3hKN3Mx?=
 =?utf-8?B?N1lkRlI4dUQyMk5LdEhQd3ZVTUtsVllDV254dEJ2dXYvVnYyQW9ReHRLVW5Z?=
 =?utf-8?B?eFlFQzA4TDNWU0lnUmZ6TCtVTW1TdXFJZngzMTIvbzNJdFUyT2hNZUR3ME92?=
 =?utf-8?B?L056SWNPYW1LM2VHcFBOdmplcUVhRk11KzBod0FoOURwRS9OczRqcURMOE1x?=
 =?utf-8?B?V0s5MlYrY2hPS0JVMHMyMWwycVozMGg1aGpSRlphRDFpMk12TWFEL3J2cHFm?=
 =?utf-8?B?RTJ0cHYzYURoWVlid3dQdVNBOEw2MUR6eGMyNkNtVzVpdWlHVDg0TVhkQ0pp?=
 =?utf-8?B?S3ZIZ3Nsb2VSSHlYSFNDMEtyUE9vQUNCVDdPMXJSVzlBQXM3UU9KWk1pb2Zx?=
 =?utf-8?B?aHNtOHJoRjlTR3pZSVA5eVpyUFF4RUxDdE1PNWRha256OUJHa3ViOWJXZy8x?=
 =?utf-8?B?dDcwcmFxZXhBczJyTEozR3ZrcThtZFQrbmVhZUJRZi8xZGJIZkRTYXdSUFRh?=
 =?utf-8?B?TWdudGJEOGQ2QVI4WklNSCtCb09Oalo5ZWc3L2NxdFc1OG5EbGdGOEU3OEVs?=
 =?utf-8?B?Y0owWVFPNFRpQzcrcEtUcGRkdXZ0aFdjWUJPbU5FaWJ3d3EyaU0rNzVsS0xt?=
 =?utf-8?B?TG9oTmN1RTJhUmhReHlxbjFHWHlLeU5ZK3RhUCtpWDZyclVkV0NiK0NXRnEz?=
 =?utf-8?B?b3RmS2txeWdrVE1XMFBqR2FTVHArWUdCZHppMmVjM2RBdDR5Y1c2Y1FOV09k?=
 =?utf-8?B?VS9EaDhVeWkzUldRT09BSUNnYUlDYlVTZmdPOGNyeDhkVVJDZGR3MElrTTVJ?=
 =?utf-8?B?MXFMVno5dDkySzdrY3hkN3N0UFhmUkE3VzIyU2U3VVdnOFpudFR3cHZUMmlr?=
 =?utf-8?B?ZGtGQ2R6RDV4UTBINGthS2p1YkdJeFpXUDNHQzUxNTM0VGF0NWZGMmpNTGtK?=
 =?utf-8?B?MVJtN2FQdVNGMlZqWXg5SEJqdDNnRi9QR011bmEwMGlLd2ErcmNOazFjQTVF?=
 =?utf-8?B?Tm9vcDYxTHZBMXcvckpLdDd5OVlYQVdnZnIzR0lLM3dyTXhEQk9QeWkvWjJQ?=
 =?utf-8?B?cTNhNkdNSjhJc3lTditFRUZUWi9RWUhwY2dIdThXZmVOdXpIWU5TRlVWU0Vz?=
 =?utf-8?B?NVNDRGZDOWxBc0JaRlNJYVk1ZldWV3Z0WEFzcGFONXl1TGdacnFSc3IrMldE?=
 =?utf-8?B?bDUzTlFRelJrd2NiWHkxNzlYbGtyUk5hb0RyVnNpL2VZUkNkeXc2RDVSVTVT?=
 =?utf-8?B?d2J6eURVZlpUcnhWcnl6WE1uc25ISXlGRHJVMjFka3hHTDR4ZUhVTXR2QjJW?=
 =?utf-8?B?ZEZPZVo1YVlXRndDbTl3REpRNXNPUVlDTXN3b3Y5VEgyUUo0eFNkNjRCdnlB?=
 =?utf-8?B?TDZTSTM4eThvNUdXSHdoSzlyR0NHems5TTdWTHNOTlpkck5tZXY5bHhkckdH?=
 =?utf-8?B?WjBtN3o2Uk9qUHlnNG9heEtqNVRZaVFMcFZWMzlnczJ5TG5VSnRpMnlyeDI4?=
 =?utf-8?B?cXFpcTRTVjA2WHRJaTJzbC9FQUd2cU9rMTMrSEs3bHhHWkR0MjAwaWRaL0dN?=
 =?utf-8?B?K0dpVEZOTlpZQW1UN05PVHhUYXM0bEMzWVhNbDFLc1VoNlBQRUcyZTQ2NE8x?=
 =?utf-8?B?WXNpWmtvSlFrZ1ZlMWJaNldacGRRNk9pRzZNRTZCM3dPNStKYVB0dWpLU0RI?=
 =?utf-8?B?Y3A3eklDUEJ5OXliaytmMkdYdjVwcDVyWm1xV3U3bGVIbFBLdWM2Q0ZGU0ZE?=
 =?utf-8?B?bzFLSjZRYUJqK3dPMEFVL0pjdUs4b01JNWJPZDdwTm85SUkyRmx3VG83YXk1?=
 =?utf-8?B?ZDZqRWthNmd4REVOZEMzWml1akxTRWpVMUdCTFhqRURUZldrNjZaYUJKemsx?=
 =?utf-8?B?TWZsT2lvOEh6VDFNTXZSbVBvTnVNcjJaOGZTSExsTjR1VXpyMDgyb1RQNi8r?=
 =?utf-8?Q?zIetgM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 20:18:18.7733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aabf3a5e-76b7-4b31-6722-08ddc4a5e772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9416

On 2025-07-02 04:12, Juergen Gross wrote:
> For the final step of live-update in stubdom, call kexec().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

