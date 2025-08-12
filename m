Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80CB22F2F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 19:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078989.1439982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulsu7-0007kj-Ki; Tue, 12 Aug 2025 17:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078989.1439982; Tue, 12 Aug 2025 17:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulsu7-0007j2-I7; Tue, 12 Aug 2025 17:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1078989;
 Tue, 12 Aug 2025 17:35:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eVr=2Y=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ulsu5-0007ir-SB
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 17:35:17 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20625.outbound.protection.outlook.com
 [2a01:111:f403:2408::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b503081c-77a2-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 19:35:15 +0200 (CEST)
Received: from BN9PR03CA0141.namprd03.prod.outlook.com (2603:10b6:408:fe::26)
 by CH3PR12MB8547.namprd12.prod.outlook.com (2603:10b6:610:164::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 17:35:12 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::a4) by BN9PR03CA0141.outlook.office365.com
 (2603:10b6:408:fe::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.23 via Frontend Transport; Tue,
 12 Aug 2025 17:35:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 17:35:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 12:35:06 -0500
Received: from [10.71.195.192] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Aug 2025 12:35:05 -0500
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
X-Inumbo-ID: b503081c-77a2-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMcl+n0nbWd7yJJqA/EPlN2h3EJRWhQ5CBKwAya0PvUSdvOAfDf0RZ8bKovcjBQ9l6/Cg1QyOc6vZgyQisGW+G0AkMQfxNTceXK5aou592r17uA5VM4AyGluAaz4xG6Xc9tXdvDkH6HXUqCUtQRXuQLzR7eAiWpg+k+VuYK61MS/4oY5roJp0tGXi5GK5EHhVIpZKjb7q81ANG4nOnJK9zEH4ATjomuoeboADpPVCSzNqJzEKwI1jGNfEOOQc22LFHFbGdfMA7kvkosyhAnoIHOulxzx1Xs3/k2K5d9CQcMau0S7QjWE2vwUkE+o2CAmaoCLovJwI21pq4fScaZLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE+WDBFdkOTTKLb5YGL7lXIYeIyHTEfZAeWs0p4Tdtw=;
 b=miv7i0HhSZiwq/tDg4e8X83O9TN5BCl6yweSdIF5oYyb/awE/gHT1Bd7ZqjCZ3350TppRz1La6vCUcZKdos7oRRfpgcGg1kXRVzoK/6vAG8Dblqe7G66GvhObkqwFUa8nDSO7Z/0oN5bYBwcwRPBpiY21SC9VzYUZx30VuY+uUjzdhvYJY0tnHnCHhO73+LpfnKKs6F5NGAZz04zUWps9uabQEToovibezbI9dX09hR8OIXBXN5EAggo0vtcKJP0DMotn4Zgx/NNtoOe0/Su2VOcuhWa2TjsGK/n07lYPDTUlTxojMhFclP8jjksIlyoJiDgyV6Hm+5Ufu/aZCywtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE+WDBFdkOTTKLb5YGL7lXIYeIyHTEfZAeWs0p4Tdtw=;
 b=eNJg2x2q44vGDjW0typBMPoztaWOAvV1yxPv2XTCrhYf60cT7f/mRQ5bXd1kBFNWypP8XpCvIjxBgulCfK/M4/tQSoaFv6Sr1jNLstJJWa6b9E6zQnmqt8kTPF83z5gw4iK10ERt8GZ14zjnz9c597p5uaN5zLhthQyhG1lsOC4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <91ce3b22-3eb8-44b0-989c-6acae1b79992@amd.com>
Date: Tue, 12 Aug 2025 18:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder] Make DEVICE_TREE optional parameter
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: <xen-devel@lists.xenproject.org>, <michal.orzel@amd.com>,
	<andrei.cherechesu@nxp.com>, <dmukhin@ford.com>
References: <20250807154614.456654-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2508111447010.2883419@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2508111447010.2883419@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: ayankuma@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CH3PR12MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 143b23af-aef6-44fb-09db-08ddd9c69703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDNocDVTQzVycTM4YW5RVmFEVEhUWWtoUzBrYmpEdVJPUVE4NE44emZPdUlw?=
 =?utf-8?B?SnlRUEp5VHJlZnY1azI4cW5FbWQyYUVzZTZMYldVRi93MStTaGlTUGhqSHVX?=
 =?utf-8?B?QjMwQy90TUZlSThkMlhQZFYrQVZuVUh2aWRRa3hSUk1taFo2SGdDWW84NGt3?=
 =?utf-8?B?R0h3UFhYRFNJMnFvVk0vUVNKUk9hQ244YXl1aGhBKzhXRThoYU1kamtXSWxN?=
 =?utf-8?B?Rlc5SVkvN2JuZnpjV3FCZTF0ZkJUSXdMQUpNdEgzdm1QUUJyMWVBWHZXSXdq?=
 =?utf-8?B?ZWZHclorbGFwVEJGQkt0NzdiV3A4UnBuVUU1ckZiRHhwZlJRVTdHMWpJMzZT?=
 =?utf-8?B?U0xHOThCZTdjbDhpWDlHSTVXcGx5K0JwMHZzd3FTVGo2b1dYU2djdk1aaGEr?=
 =?utf-8?B?M2dRcmhrVFY2eWVScmtMcjArNGJ0OFJKRWxidXdTakM0ZTZBNmIvcG1rclhs?=
 =?utf-8?B?RDBqdVJzbWNETkk3OGFSQXNOOXNhMXBaa3VnR091TEV5bTVzak9JWm4zZ3hW?=
 =?utf-8?B?aDFCR2RGK1l6ekpSZFVsYTRCanNVenNLalo5ZjhicVZ2SzVvcG84WCtFOXJS?=
 =?utf-8?B?dnYrTElJNHh4OHNWcllWT3J0eVZ6RzI5eW9scjF5bGVKc1VHbzRsUHFpbkcz?=
 =?utf-8?B?eEd3b1oxcUFQRWlvQmhLNXBtNjV0UTIyblUrTFRZVUZOWDhNbUZVSzBES1hz?=
 =?utf-8?B?U3FWVTVTNXZINzhCakJ3Q3lHVllrdlN5UnBtM1lyWGpyT09tNkZFN3czQlN0?=
 =?utf-8?B?NHFKbHg3RlFXWWlUcys1L2VjdFhZTzAxT2pyZCtNRU0wN1VaYWlFQ1Zra0VM?=
 =?utf-8?B?b2JLYktmNlVqVFFGYkpqS2VWUTZ0UHpsZGRZNVozMW95dU8wSEVZRHByenYr?=
 =?utf-8?B?L1lybE9vdENYVVNsbWpocXVrUUVrS2FxZ3FVcTJ1dlJEY2lJekJCeW9vUUJX?=
 =?utf-8?B?L2hqMklNUDFGWXRPL2U4NFZzVEtSNFZGb1hSSXN5SzJTT2VheUlOWnJRNWJT?=
 =?utf-8?B?b08zeUhzVjd4ell2MWcreTBoakQ5c0xUNm40aHVEc1VkSXVkUG85MDNzUFYw?=
 =?utf-8?B?TGUvK052bmFTVUpSdW4yck1FN0ZjbXplc2JlRzF6Z25OYmsrYTJ5YThPNURP?=
 =?utf-8?B?Z1paOHhneXNldUVoYmlaSXl2c2RFMTRYR1QyTFVyL3dCZUNvcmMrRFE5bVhl?=
 =?utf-8?B?L3pxZG5OOFZYTGliWitpd2VITFNaazFuc0xSMWF2UldzU1ZpQzJMTkF6cDBM?=
 =?utf-8?B?WGVaWmszVlR4MTNNWDl6bi95YVJkNUpPdFNUVTV1ZXEzaEpCVVVCRWI1WDRI?=
 =?utf-8?B?K0FienpmSzA0cTBWZGI1VFRYK0l1dkcrbysycGpGcHNqUlBac3lnY1hBR0pk?=
 =?utf-8?B?dlFLREo4b2hicGdNeHdRbmlTeUY5c3o3Q29yTWtVKzRURUtXeGZKWlBDRmxU?=
 =?utf-8?B?bVorQWRRWVgzTHQvREF0VmQ4WGZhN3JxTTBIN0c5bkZTa0RkTmtuNXE0aFJn?=
 =?utf-8?B?bkNBUFo2Z3BJSGxOT1piLzFMbXE2M1RvYldFYk9OTWFJMlFPekx4S242clp0?=
 =?utf-8?B?ZUFRU2FiTHUyZS9yNXExdk5iNjlnYlhIbmFsODVWVDBkK3lFcnR4QkpPSmNN?=
 =?utf-8?B?UGhodUpmZklycjNFOUhXUTBZZC9tZDJpWHNkUjMrS1pFbVVhSUp0VmZHalNy?=
 =?utf-8?B?YzVPZjZ2cWo0Y0NqaFEyeW00WUI2QWdtWkw4aXlVMElqMFN6a0FzbWFDNXZB?=
 =?utf-8?B?N1laQXlzUEJsNlR4MUVDVUNLUlJOUzFQQit4TGZkRVpOQkNqUGJHZk0weVFi?=
 =?utf-8?B?RXE2MmVMbGJ2cndhaURJZEZSMmxCV0J2Vy9FNEFIM1g3QzNtcXJmZ0Z3L0RO?=
 =?utf-8?B?WmlBNEdZS2dRTlVNcW1nT0o4ZS9rVWlIZ2dFYi9aTm1tamRXK1h1S3hqb3Nk?=
 =?utf-8?B?QWtreDRWRU5uN3ovMXJFOTJjV0NvcDErK3VYSXhQMlVvV0tWSG1Eb3R6Rnhp?=
 =?utf-8?B?L3dyakFEaXpzQklxZWc1NDFzZUpxTlZnU1ZISjlFeXg0Ry9nQTUzOXFDNUx2?=
 =?utf-8?Q?CXSKEL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:35:11.6329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 143b23af-aef6-44fb-09db-08ddd9c69703
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8547

Hi Stefano,

On 12/08/2025 00:13, Stefano Stabellini wrote:
> On Thu, 7 Aug 2025, Ayan Kumar Halder wrote:
>> There are systems where device tree binary is passed by the U-Boot as
>> $fdtcontroladdr. In such cases, no external device tree binary is provided
>> during uboot script generation.
>>
>> This is an enhancement on top of the following commit:-
>> uboot-script-gen: Dynamically compute addr and size when loading bina…
>>
>> When DEVICE_TREE is not present, $CALC is set as the addresses and sizes should
>> be computed dynamically from U-Boot.
> I would prefer if we did not automatically enable $CALC. If it doesn't
> work without $CALC enabled, we could add a check for it and print an
> error and exit. I would prefer that then enabling $CALC silently.
Ack
>
> Also I don't think we should use the check ${DEVICE_TREE+x}. I'd prefer
> to stick with the existing checks based on test ${DEVICE_TREE}.
Ack
>
> The rest looks OK.
>
> It might be possible to simplify this patch down to this (untested).
> The last chunk of the diff is actually an unrelated fix, it looks like
> we didn't test BOOT_CMD="none" when the -s option was introduced.
>
> What do you think?

Slightly changed the chunk. With that it works well.

I have sent "[ImageBuilder v2] Make DEVICE_TREE optional parameter" for 
review.

- Ayan


