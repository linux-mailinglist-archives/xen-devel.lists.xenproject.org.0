Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE71B3F714
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 09:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105771.1456612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLpC-0004oK-Cu; Tue, 02 Sep 2025 07:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105771.1456612; Tue, 02 Sep 2025 07:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLpC-0004mW-9S; Tue, 02 Sep 2025 07:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1105771;
 Tue, 02 Sep 2025 07:53:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvP2=3N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1utLpA-0004mQ-MB
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 07:53:04 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f403:2413::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9a5c65f-87d1-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 09:53:01 +0200 (CEST)
Received: from CH2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:610:50::16)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:52:57 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::eb) by CH2PR16CA0006.outlook.office365.com
 (2603:10b6:610:50::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 07:52:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:52:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:52:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 00:52:56 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:52:55 -0500
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
X-Inumbo-ID: d9a5c65f-87d1-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYuq3wZC+7Gh+Rbfe+Q+3nmkF1ijA3LvjA6buSig1yXm3A1KudYHFnHMKWqPp/YE8Plu4YS/4Ck1fWNQKVCxjfL94RXGuOZnrofnCbydBq9BSxxGZKSWo8rH8HS0QTDrwGd1ODrWZy6VkRM9jcMJ9LDc9OKls31dB9L291loKVW1LsLj7bD6YMfyHicM+rc9I0XipUUXlYEWmBPwpTkj8PXf2+w3bB4A2Z7NCtJblVTzvJJII1se1ma2Bj96ynvtKgr7l9UsHW5WIU8xMG8q81XZuLAK9WOTEimilbOPzxJedkGxF1QO0pUR1HnB34Mda9TKhDJDB+ZbJeqXdGFPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJkkMhGXzvEg6x4kLTMWfsdi7Qal39hBqTeP/nXE5rI=;
 b=p0QcZ0IBrHbPvaUjKiy0WEIOpeMPVEjTPeXUZwVuh0QjqCOQOnU07sN4XRpj4T0XjbzcNZe9zIFfm+rlK6at6mnXX2zVB3NdQIzve6G77ifOp4P7wUIGfM6iZng/SnolDHILtgEeX8gT0a6NIb+XMtCOALaEzWEsuxMMvy5PsgXeQJdHdo1hTBIB/ZI+Fn97mFrdHfTKHVVPBrCnWKi46qRn9zJ6qz96bZc9d/p5YTwESUxCilJCFFLbokkGv8FV3blDGH1vG/poFX+GU8zxHJSrglaobVCn1otrooUaXnmlyEz/I22M4fqca3+f18+15QRTxY0VNoM9B2TlD0qimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJkkMhGXzvEg6x4kLTMWfsdi7Qal39hBqTeP/nXE5rI=;
 b=ldu2cFXN6hNGwmduiAelCNMK1GQs2X56wnw9q5mXFzblOiUno4vuG+zAS7dut99c/bsKijf7EsTxO9R/5W+jCBhJUz9C7m6toUYP8feQEtLqmWB+5PQhlOgho87+uMHqJJulpY55OkaCFD0+SBnHr8iUYgndFPOwlqwnmZx91iI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e7c99116-f6a9-43e1-80ae-b3a4d44857b7@amd.com>
Date: Tue, 2 Sep 2025 09:52:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/sending-patches: document "Amends:" tag
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <92b2d76e-2434-4606-94b6-93774a74fc87@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <92b2d76e-2434-4606-94b6-93774a74fc87@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 8731cc21-a4e7-44ab-17d5-08dde9f5bb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3RSYXFSWjNNZzJDZmFZRzE1Zmt2dk1KbHlTeTgvRFdNYThXOGp1YUpVY084?=
 =?utf-8?B?OHFzNDBseUY5ZHRFTDdnTUFoRWNmOE54MWkrdVRHdlo1MzBBaml0SzlKaVcv?=
 =?utf-8?B?Vk5xY2N0c1ZqWWI0dTZ4aEV2TEh5anNxd01PNSsvVVIrald2NWxoRW1PQnl0?=
 =?utf-8?B?SVFPdy9odjRmdllHdi9HS2JLY1pEbFdSaXduRjVYVWQxUWxQakV5TzIzVnB0?=
 =?utf-8?B?bzBEZ2FROVErRmJtaHU4Qk5XQVJOZzVja09LamJVeiszOVoxTW9QRmZIY01Q?=
 =?utf-8?B?bUZXNnc5ZHkyUlQ1dndpbCtMcHh5RG9Pb0VYenlhNnZyRTdCeG5Jb3JweFgw?=
 =?utf-8?B?dTFlazRXVXdPYS9yTVdnOWhOSFp6Y1JHWllmTXdQTDJhMjVyWTNjMERNWWhO?=
 =?utf-8?B?VnFuWWZ2emtLQVRNUzhIRnY4ZUorQzdsQ1hGSzcwelRCczg4K0s5OXZEblVP?=
 =?utf-8?B?dTJyQm9GbUUzalh1QXYxZHJNanFoQWxkYStycUJEdHI5ZlBoWWV4RXpjME5X?=
 =?utf-8?B?QUFraTJRemhNZ3lUbGlPSFdnWEV6Q3RNUEFaOEliL3dxaDVvZHNTOUQ4cER0?=
 =?utf-8?B?Rkk2QVVFYlpJZzd1SlkvbzBJdkx2Z0lZWHNEUndnM3hIck5oOVBNbXEyc0s5?=
 =?utf-8?B?eXp5VXpBckFFL2pjTUZRZnhnNnFXRnJKdmhpajVnYXpIdXVSOWF0ZUYvaGgv?=
 =?utf-8?B?TTJPUzNoMmlYT0FaT3RPcllHcS9qV3FqeDlWd2xsUjVuQWZyWURFVUNvVS8v?=
 =?utf-8?B?SGxWMXBXRWdZYkRhcytIQnhPSlN6d1RqVWVUMnlpWGtNcjMrV1Fta1dDLzJJ?=
 =?utf-8?B?NTZjTUxQRHBkTUVXbG1uOUZsaEU2K2lINVIzdFBTVmFNTlpqKzZIb2FLa3Fw?=
 =?utf-8?B?YVJTNDJUUXBGZzFQNlRsUzdUOWR1Q1VvZlFRNW1nYUk0TVdUZk1sZnp2TnFm?=
 =?utf-8?B?R1FOQy9pWnh2WDBFaWZjSkVWYlAyeEl1VUhnY3VvcCswdVI0K2hCdytXcFpH?=
 =?utf-8?B?WllNMXFKcENsclN6akl2Y2JyUlJ4V1pCQWVXQWpmQmQzSzFSa0tnSG5GQUVz?=
 =?utf-8?B?bThqR2R3OVFUK3phdWJpMUx1M1puTjVyU244NDV0dDVaeUJvdmdRbjJTSFMz?=
 =?utf-8?B?V2FORXAvQnNZdi9rSmtuQlE1bERnTjRpMklyWDVDcFJpMmpvZktBajk3dHlE?=
 =?utf-8?B?R0gzU0dRbk93bDNYMFpxY015c0JwY2daWVpTTDBUQ0YvWlpMUU9sNW1XOXNB?=
 =?utf-8?B?TmR6S1hXTXhaSGxrNThwanZzRTBWaklvZTRRSlRLWHg3bGhpa2VyT2s0WXBs?=
 =?utf-8?B?dmUxcnF0STNkeUIrOHVpYVpZcUc3WE81eG56NWRhekVvdVBiUnU1bVFHSlFh?=
 =?utf-8?B?MlVhRDRYcnFyRUNxbi9SUi9CNEdaNXp6ODZZZXduNUF6bFZyaCtOVTg3NkxW?=
 =?utf-8?B?dlBvaGY3SUVsd1ZNaUZyQ200YWVmMTVDU1d2bDRxc1RZSzVxbnJ2RVlRZHZq?=
 =?utf-8?B?VEt0OHA1YnF1Rm1venhUaDFGYU5VVlFGQ0VTMzBmL000cEtSQ2FhMHkrenZr?=
 =?utf-8?B?MU5ROXFrbWRKWHNJV1lrZzBOOStKUTlQWUlzVXhsNlVqM0ZXNERxWFFMZlM3?=
 =?utf-8?B?aXBFSHpVYW9wdXdENkFuNkM0N3gzNjB5TUFINzJBL0Rob0YwaGlxUERRM2R3?=
 =?utf-8?B?UWdGU2xxK21jVnBudS8vcnJ5cmhLNkk2a2VyYjZwK0R5VTBLTm50QVYrSWJ1?=
 =?utf-8?B?Q0Z5aUtqK0R6K003OEY5ak1SNnB6dEN3YWdubTFheklKZEsyZXZsTWtpbWdp?=
 =?utf-8?B?VVJHWVM4ZHJSYTNQM1dMTDV3c0xGN2FtRFphWEpxOHhPV0ZtcUFaMDg1WjJQ?=
 =?utf-8?B?ODZESDduV3N6WllFdGFoenpBc25sb2M2Mm4rc3p6ZkY2R0NPWENDandXNnhC?=
 =?utf-8?B?b2dyTzZJL21CbHB5VStXL3o4T3FWaTBUeDVZa29rVklqU240eU5PYjR4bVZ1?=
 =?utf-8?B?U3ZHRFBPTXhQZStyY0lzVC81R0xOZko2NXgxTU5OdzRRWFhlZmtsem1Gdisv?=
 =?utf-8?Q?M02sks?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:52:57.0580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8731cc21-a4e7-44ab-17d5-08dde9f5bb10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219



On 01/09/2025 11:00, Jan Beulich wrote:
> On rare occasions Fixes: isn't quite appropriate to use, yet another
> commit still wants making a connection to in a formalized way. Such could
> e.g. happen if a pretty obvious optimization was left out (which isn't a
> bug, but still a shortcoming). Formalize Amends: as a tage to use in such
> a situation.
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
LGTM.

Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


