Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB68CA4EE
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 01:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726405.1130682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9CFe-0006j5-By; Mon, 20 May 2024 23:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726405.1130682; Mon, 20 May 2024 23:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9CFe-0006gb-8M; Mon, 20 May 2024 23:17:06 +0000
Received: by outflank-mailman (input) for mailman id 726405;
 Mon, 20 May 2024 23:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9CFc-0006fj-2n
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 23:17:04 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f156b19-16ff-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 01:17:01 +0200 (CEST)
Received: from MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35)
 by DM4PR12MB6544.namprd12.prod.outlook.com (2603:10b6:8:8d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.27; Mon, 20 May 2024 23:16:50 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::f5) by MN2PR11CA0030.outlook.office365.com
 (2603:10b6:208:23b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 23:16:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 23:16:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 18:16:49 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 18:16:47 -0500
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
X-Inumbo-ID: 0f156b19-16ff-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USfY+x4hKEmhAlpZihXdUije6QIq+gcJPe943VpabUmnAbjZit1xsLH7xudTOk9oQnQtLgud2yZImbHwOtINROmVwtgTeb1dztIO6zUIeK+vH5/fb90VbFZQK3GbY+zoykhXrrEcl1veMxqA0zCNvUVPb2X2/LuA0rJF4ZAHHhtWyb6dwmlIu0Wx0yD/zZMUtsAPvu8FVrIMbxvTgwuuUUqSJkiT5CI74wYhPblUOA54pAyHCK8Oh+O1GgfI8lC9kQd7Il4aei0I/Nn99XGQ/U9nRFJINxIO7Xp3+Qklhj1roGdFE+04zDxERYnwklH40RPuOkyFEq5+sU5DlUQBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akZ4jp/WdYcgcYndzHzWDNr2zMLdJ+e/qXQx01Jh8X4=;
 b=CsQIar/n6r2w5gVKtsfp+LmHGw37+SMiHVUL4za9hau1jTZF9iy+3VZLx+wxLVofWGmGtnFSP+RZDK64mbKQfBErf6NBETSH3sxvf3ZYU/vOPYe2AULKqda1f43dYh4wwtSOyXyHgSt93D5dMz0antRUzjQ78wtQWz6Gfjf085JwJqBBN6cBDUnTvH/TtYRTTaSKwQtsPMGQ9aNn/aSFfJubg4/CLykrraQrbyX6+9HmGecoq0aiRuT7xbAfdrBn2aenPnKe3+mjzJeeo1v6i0/SkXRwjdtQHD1wC9yG78xDYhq5WY63vV7pjMEUhHud7/5kziLVLHsRGt/vW6shYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akZ4jp/WdYcgcYndzHzWDNr2zMLdJ+e/qXQx01Jh8X4=;
 b=DeucdnaHwRsc4s6iRlNdTsEMOoEDTOvYxJI2mOKfrtA0gOfE/rI5jl1JHFEptgBtPJUSSFHLXSiEf8WwNe9ac2OBjrS1mJEQwl6zxU4vjdNVb6E8oO6/LNO9s7ukbtyBc7XH5vpczf47uqmHIasQIDqszDIc96YgSCMusYwl6MY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e53fbcba-f7dd-48a5-9481-a69bfb501cee@amd.com>
Date: Tue, 21 May 2024 07:16:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-2-xin.wang2@amd.com>
 <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
 <86c91b57-68b4-4271-87ec-b80525ed3373@amd.com>
 <f0342d7a-1275-4a28-9688-326f07334a71@amd.com>
 <c0b59ccd-b3b0-4495-bbb4-2855fa2d7d16@amd.com>
 <93336435-309d-4aa5-9977-9ce0d4725811@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <93336435-309d-4aa5-9977-9ce0d4725811@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|DM4PR12MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0540ef-305b-4980-eead-08dc7922ed57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHQ3eWtueWVZaTd0bGxYMmIza2VwUHNHNFovd2ZoQVlrdnMxbXZQc1dGVDRO?=
 =?utf-8?B?Wm4vOENXY2xDaGRDeDFlY3lENG1WQS93Q2dOSHd3WlFsekduWTJXRkZzblBD?=
 =?utf-8?B?MHVpR3hvWDdqUTFUQXRORmZQQ1RFQVBDUGgzU0VSVTMxQVNFUkdrKzRsV1kz?=
 =?utf-8?B?Y0l3Wm1kTURQblFoUTd5STA1ajBCbW56dmh5U1BudXZvT21LOVBNNTd4US9u?=
 =?utf-8?B?WHVqTGp6eWpkM3NRa3JhWkdyQ3E5YVFOd1B1cUVlYk51NkwxU1JQbExDT2dT?=
 =?utf-8?B?ZTYyUnBoeFA4M1E0OCtEWHpJWm9GcUIyNGNnclY3WnFOY1NrbE8rTGIzQk5W?=
 =?utf-8?B?eWV5MjRFbkZiNWIvSzFya3RBeHZqU3ZJWGw4aU1CcFBYYzlCc1hCNHo3QVpw?=
 =?utf-8?B?YXI3V0hxRzZSUXNPMzB5OTRBenA3ZXRxb2MzblRtMitaMVlpc3MzQ2dOalZs?=
 =?utf-8?B?NVVkVFVLRjdnbDgyckhETzAvOWdqL2UzZFhkVVdoTUlsbERIUTdNZUo1WENm?=
 =?utf-8?B?R295bEsrb2FwOENJUkRmQ2dpeVFiRFdLeWN0djNHTEUyRjByZU5uWXZ6bFJJ?=
 =?utf-8?B?ZUJxL1JZcXB4SUdhaEFoa0EvdS9aSVp6bmZUYmdTWHZhVkpES0JKeUY4bTJy?=
 =?utf-8?B?MEFuckRoK1NZOFZBNnZHc1NUSXlWWExiLzBJZTg1RXM5akVGMzZWc2ZrYW5i?=
 =?utf-8?B?bnlGWEdGWi9yOUFHYVJZTE9zOW5EMlhPMjFONGVkQlVLYTFtL3V2dXBpSXJ1?=
 =?utf-8?B?L2svWGZuWjlncUQyc0xzMFZKa3pTSFdDdTQwS212eGZ1NnV0Qk5veWlRaVZE?=
 =?utf-8?B?U3VvZ2VmamR4ampQL0UydzFMT3J0MFRMdzdXVUlKWERHSTF0WGpCcHUzN01O?=
 =?utf-8?B?RE9KVWR4R0JsdS9GYXhacnl0alEyU1ZuMlZycE13QlZ3RzgyUUJVQSswYjNY?=
 =?utf-8?B?Y3hrS2dwSzFCcnB3akpZeEsrMTRSSnE0SU1EbG5lYW9nMEtzVEdsMW1xM3pF?=
 =?utf-8?B?dUlEeFM4d2grRDF5RFpHOEN6RjM5Tlc4Nk90cFBxWkJWYkNqbldMTDdldnY3?=
 =?utf-8?B?OUZoSWJHWkdRekZyQ05uTlBIbkdOU3pMdk12VjM4dTkyWnA5eWc2REJKSnYv?=
 =?utf-8?B?NU11c1lXdXdNNklqUmd6SVh1aFhMM09oTlFpRThRdE1ZZHhBODdPOGlITk90?=
 =?utf-8?B?TUdIZlljNkVJRWFOSy9wdTFmM0luUU5Hb2Q4Tll3bmtJQjBjS3grUUI0bTBJ?=
 =?utf-8?B?bjB0VHpOSGgxcm40Mk42MHpZYW12K0VQaHM5ZnVSdEVYVXRWSG9tWjhwRFFs?=
 =?utf-8?B?MUZ1bVdaY3hmVU1ONVVpN1FWMVlHTGhoU050bjQ5Zi9TeVF2Z1dMUTdTL3Q5?=
 =?utf-8?B?cHZHbEZ5c01MajFhUXlvQWczSUhRaTl3dGJ6a25JUHdJZFJlN0dOTnB4YzI1?=
 =?utf-8?B?dnM3YWcwMm9EZjV1VlI5TURyVGczV2FiVXpOUk12SXduRzdWSjFnc1ZhV2Nk?=
 =?utf-8?B?bTJGbWNHcXhVbFcyVnF0RU4yZ0R1T2NjRlBvZDhyaFRGVFNiTGtia0VZcXpm?=
 =?utf-8?B?REF5UFoyc1ZTVXdJQkVHRTVtWWtXckFkSys5YXd6dTRoUzVFcGN1ckRtN3Vq?=
 =?utf-8?B?UlJ2em9KTnVXREs4YmFnZEt3MVJrZnFFdlZ4SDU0My9Gc0lidnBLWWplQ1hn?=
 =?utf-8?B?VHo0WnJiM0JOT3YvcDcwT3ZNcExNNGVDWWhjVVVLMUQ1SkhIZHUrdU9NNFp3?=
 =?utf-8?B?YXlPL1JHRHRsSHNsTEYxNWs3Z0JVZ082akdDYkNkN21wMkNQR2xodExlQWVD?=
 =?utf-8?B?aGl3eSs5MVhVOWpNRFFSMFozdC8zOHBuK0FtQ3J4STlCUFRVbis4VTVxMmlL?=
 =?utf-8?Q?pnHcyYhmAixf1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 23:16:49.7110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0540ef-305b-4980-eead-08dc7922ed57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6544

Hi Michal,

On 5/21/2024 12:09 AM, Michal Orzel wrote:
>>>> Thanks. I will take the tag if you are ok with above diff (for the case
>>>> if this series goes in later than Luca's).
>>> I would move this check to process_shm() right after "gbase = dt_read_paddr" setting.
>>> This would be the most natural placement for such a check.
>> That sounds good. Thanks! IIUC we only need to add the check for the
>> pbase != INVALID_PADDR case correct?
> Yes, but at the same time I wonder whether we should also return error if a user omits pbase
> for direct mapped domain.

I think this makes sense. So I will add also a check for the case if 
users omit pbase in the device tree for the direct mapped domain.

Kind regards,
Henry

>
> ~Michal


