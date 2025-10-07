Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A55BC159A
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 14:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138726.1474349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v66gG-0007B9-UP; Tue, 07 Oct 2025 12:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138726.1474349; Tue, 07 Oct 2025 12:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v66gG-00078g-RZ; Tue, 07 Oct 2025 12:20:36 +0000
Received: by outflank-mailman (input) for mailman id 1138726;
 Tue, 07 Oct 2025 12:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAy5=4Q=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v66gE-000776-Py
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 12:20:34 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f84766-a378-11f0-9d15-b5c5bf9af7f9;
 Tue, 07 Oct 2025 14:20:33 +0200 (CEST)
Received: from CH5P221CA0007.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::15)
 by DM4PR12MB7526.namprd12.prod.outlook.com (2603:10b6:8:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 12:20:25 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::7e) by CH5P221CA0007.outlook.office365.com
 (2603:10b6:610:1f2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 12:20:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 12:20:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 05:20:24 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 05:20:24 -0700
Received: from [192.168.178.136] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 05:20:24 -0700
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
X-Inumbo-ID: 04f84766-a378-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJwjV/AZU5y3tQ+w6pVvu0wDSrxFkhzrgH1UOb496Zu3oI8BQ4657fsd0cVUJelD4sZ5UtUpfiS4fSJV0EI/j/LkgVo+a8rjoAi1mepEJNRJ98ALZNXgBsABr9Zkn32AvTgQx2qZfiXOrfvMW+TPxhBhDyT5GQHQBMaJ3WK3xMJaQUK/cKYgtNIYuphz/QWRrxuDr0ta+5C6feqzFtr/jwr2aytu943XEzqTQLbwOAVWKKbysvZfpPZ73zwRVjxNqCi34/YqFlN5cMg9/iPFEmu7iK4uIa7uFmojlPE2Slkb+gJWwnnkfYPBrJJN2g8YhZo91pK8Jn5qJwbTRjuRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kq/iAHI1Bxpklh5EIETLcC+sujxXJLQTOKNOuizR3lA=;
 b=p+5bfsbiwNLMTHNz0IXY0eG4yXNhIbiWfWGtwgNh6mREcz7VW743m7AxOPZtESMW4m0YkUN7AfeKTa9ROTP/m+qqqsWQRB3iM8k8jP0b5LjcleSCYidG9OlfjkmHXwLk4rjm21OzuCHVlpZzoJfX/AeKChRNuOQbnux2FCxPQ5uFvlYMGtDub372Ce7rR5Wh2ymrO4ic3SPGX4m/iWrzjI9Xqzqc3sIxNp2fLrhCmg/3MIlxGVGXjrR40PQyuWUrr9uNVP9/pXnH43HD5AsGVJd5apEt/nZTICaGEHPqaceKUUEowR1ll+wcFexYumkt9BlHyDDPrQYF4J3npZOsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kq/iAHI1Bxpklh5EIETLcC+sujxXJLQTOKNOuizR3lA=;
 b=mhV/PTVIwCIU1fwco3Q3Zg8mRbmfWFPWvatsSTzpsRoGo+WsSxS1rPyYvqskTbg4HBi0dhzI+zvwI68EAEgDyoMRwHqE2gQ9dVEi7DTDmgiRCqTuQ521wW6D+9C6vTXmYTHMbqx9QFzn/0IUXLQnvs8X8Ez6RAl7IxTbG4Ua0dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <85fba38e-78ad-40ef-b8e2-91a8287e5b5c@amd.com>
Date: Tue, 7 Oct 2025 08:20:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools: init-dom0less: Replace err() with more
 informative messages
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20251007062656.4254-1-michal.orzel@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20251007062656.4254-1-michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DM4PR12MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dbb0ba-458a-4ce1-b205-08de059be4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWFTMmg3c3VuL05ua0IyTHpIVTB0SFl0alFoZWsrMXA4bGs5bTFnTXFYRzlB?=
 =?utf-8?B?YWdmT2lHMHR6RkgwQ3lFS1A3Nm00N2lZOU5qc0c0eFBYVHJXZGxyajlQdm94?=
 =?utf-8?B?K0tEUC9WaFVuODF2RzJLQlp5MjMrTnlUSHRmeFNqRlhSZnB3VlYyK0IyZlZI?=
 =?utf-8?B?cTJ1ZTBnMDR5TjhwNkJzMEtIa3c0d1hoTU91Z28yTVRuNzVsNHUxOHhYelA3?=
 =?utf-8?B?d2xXejEzVUcwMVNqK2taUjVOQ2ZVY3hObGtxbzIzeWlNSklWYndOQTJJeXhF?=
 =?utf-8?B?QmNaOUpqZU5VZzFRb2Nxc3FKU3NCQXdhYkdrUFBMSVRXOXRoekMyVVNGWU84?=
 =?utf-8?B?ZzVUR0h4SXR6eFFhbFZMd2s0VWNYNm9hbm9HRzhPVVpIOVpSNWUxVXNkWWkv?=
 =?utf-8?B?MzhLQ0NPcS9JL3pCaU14bFg3R05uc3JjWFBnUk1iSGh6OWl1d2xlNVI3d0sv?=
 =?utf-8?B?c1dPVGprMVZqNUVoUU40bVlVVjZtcE9sbEw2VC9SOGIzU0R2aDNFS0p6aGR6?=
 =?utf-8?B?YlVSYzFjTlpMSEhMdmtQSUtLZFdjQjNYbC91Y0w4YnlZSis2dWlmU2lvSnZm?=
 =?utf-8?B?Yy9iMEpDL1FNMEk5bWg0YUR1bXBRNHhjREJSL20ycWQ4NW5wZnN2bkd2b2tY?=
 =?utf-8?B?MWR0dE1ydkozZW1KS2U0SmRydGcybktQV2ZCak5jU3VCU2ZDaGZBQjdxK3NN?=
 =?utf-8?B?a1BRajBxVSsvaU50aXNySnYyUGFHVUJvUUUxb3NWUXR2Uk05eEZnZW1KQW1a?=
 =?utf-8?B?bitMVGdKeHBvSVJnZW8zT0VnMFhHZUs1dHVQN2VybWtpWkd0d1hJN2ZNckpS?=
 =?utf-8?B?WEpIY2Z1T2d4SHZ6eE1UVWpsaUVlTDAzc2hDTGxVdDQ3L1hsVzR4RktjcE9R?=
 =?utf-8?B?WkRNa2pqRWhIZXlXNUZFUmlZRkc3azQweWUzNFZiRy9xQ0VHcFpQbnptZ3g5?=
 =?utf-8?B?Ym54V3c5ZTMvVlNOQXFONkRkU2Y2cmJuSmsyd1RTQy8zcXc1Y2F2YnNXQUw2?=
 =?utf-8?B?WDVjM0ZraEFCZ3NHK3BjaUlKOTBFa0lMUGNBbzRkWjc1UGdNdE5kWWdHSEx5?=
 =?utf-8?B?TTJEVUxGSE13MWQ4OVN2bStUeFBTVEpOMk5XVjFVT2FZMXh2dmQ5dDN6a0lM?=
 =?utf-8?B?RWg2ZVZBajA5U2dXMVZlNUk1NzhZNHZhYmNSSzRnT1cxQnErNGZOdnpIZzIy?=
 =?utf-8?B?QUpzQWpiYWhJbzJkT3hXYkRVUG93N3NDUWo2bWhMUlovK09zU0JVdG85QWs4?=
 =?utf-8?B?TEhxTDJaWEJDWldQOVgyeTI5Wm9SMDJ2a2syS3cyUDI2c3JWSmtDLy9RSlZa?=
 =?utf-8?B?UHhpU1BuMmM1c0ppNjYxQzFjNys1MjRRaVZaakJCT0pRSDhLY1MzQVVMaHlE?=
 =?utf-8?B?RDBTUHVLVGxqZWdZbVNxaGNucTZOSTFoQlZjcWxQd3QzeVVReFJaeUdyeWhn?=
 =?utf-8?B?MFJiVUZKQS85WUhqRHpXalIvL2RuZXo3ai9RNkZ5aFlvMW5wY2hwdFNMU010?=
 =?utf-8?B?SzMwQTl4T1V0aGNBYzlwUThJUlh0MFNCcWEyMi9peU1jRHJsZ1l2cmdrNG92?=
 =?utf-8?B?VFB3dzA2VytucEtYbVVUcjlORGlEN0U1S042d211cTY0U1FoZ3gxRTVkY0JF?=
 =?utf-8?B?bklnUDlzcU43RjlMMkR4UVdTRkpIcUplakhnZGREY0lHSjVtQS9SbGpNbTFR?=
 =?utf-8?B?emdFTzhRRGdRK3NxNnpCSGxSMm5oNGlDQlFCbEJKdHFhTDFiSHd5U0V1YytF?=
 =?utf-8?B?WXZEV1ZiNzA0YVZnM2hnVXpiOVFDc21Tdkd6Y0VlMjIzazVEcHEwZUxWWWZu?=
 =?utf-8?B?dVZsZXNoZTRUMEtkMW9MUFQxS05JeEhEUm9EVzZrM0dNSi83L1laR3dVdTUv?=
 =?utf-8?B?SE5jZ1BLNTdQbE16TWFhLzZacjJ1V2ZqYTM0YTk1UEZuUTc0ek50djRKQzRm?=
 =?utf-8?B?OW8wVnBFMEpwSld3M2RENDIrWW5FUTBZUHUrNGJ2VHpac0Izb0xQVDFGTmtk?=
 =?utf-8?B?b3NiRWlUYm85SnUzNXNzNi96WmQySGx4L28vTWZCZE14Wk1HbE4vNXdYZVlP?=
 =?utf-8?B?VXVPbjhYZ0N1R202WTh5dGY4a21XV0NXcjZoYS9rNEJEUnk1Qzd6OE41dXZ2?=
 =?utf-8?Q?6q9g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 12:20:25.2464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dbb0ba-458a-4ce1-b205-08de059be4ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7526

On 2025-10-07 02:26, Michal Orzel wrote:
> Current use of err() has the following issues:
> - without setting errno, on error it results in printing e.g.:
>   "init-dom0less: writing to xenstore: Success"
>   This is very misleading and difficult to deduct that there was a
>   failure.
> - does not propagate error codes to the caller.
> - skips "init_domain failed" message by exiting early.
> - early exit prevents setting up any remaining domains.
> 
> Replace err() with more informative messages propagating rc when
> possible.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

