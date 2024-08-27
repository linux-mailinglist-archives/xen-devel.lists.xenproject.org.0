Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4696092E
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783878.1193178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siucO-00041R-Rg; Tue, 27 Aug 2024 11:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783878.1193178; Tue, 27 Aug 2024 11:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siucO-0003zP-Or; Tue, 27 Aug 2024 11:44:12 +0000
Received: by outflank-mailman (input) for mailman id 783878;
 Tue, 27 Aug 2024 11:44:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQW3=P2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1siucN-0003zJ-2v
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 11:44:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e88::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab04859b-6469-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 13:44:09 +0200 (CEST)
Received: from DM6PR07CA0095.namprd07.prod.outlook.com (2603:10b6:5:337::28)
 by CH2PR12MB4056.namprd12.prod.outlook.com (2603:10b6:610:a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 11:43:42 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::e7) by DM6PR07CA0095.outlook.office365.com
 (2603:10b6:5:337::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Tue, 27 Aug 2024 11:43:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 11:43:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 06:43:41 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 06:43:40 -0500
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
X-Inumbo-ID: ab04859b-6469-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xabVmuHK+kZirVZuWTFlrZ26j37VOmBrCs1P3jWwVVVG8od/kHv+8kbD4sS9vG0q9wTOd1T7Cbp/fdnwOkTufU9Fn++Txwnu3BYMtO5ACP8yMIo8CE2TwHrVSn3JOJDjHhbYpirQrlfEFrw+wjVaAe7GWn5bpRptxk5esG4ZrpXmyiBJVM/QNvxXqe1vOua0Q2tLlvSHI2lHLPJjhfXdhJCP4CxSqHIgPJ71IZfnuNRqyVzTHBuI2/oB9x52sngI4zFBPKUX0w82U/LuGo4RtDgK9hRiJBrUFXCa94L80yOKtz2X/CwMBnAEYiyIdq2xK7kNVd17O599iJy0EDVN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gYf+V770eo7RYxzdFJUCd6Kmq0u27sksEwZ7Q8mss4=;
 b=eb0t2O6WDQcc41OOx8A1aRLPxfrrHA1AMCGBWESzaCGJFjdmTET5uYVmIL+K+7huWqRSXWOZOgEJB31K65uxIeCO3Mcyn0ufJMWhnUSl4qkd+XUNhrRWrs9oWUxIIsPP0/ivd7QAmymVisfnTZ006dnBXR+r3KWIoXdTMfLlo/iaXw1Nh3MRVankN/KXPuwpeOPl4TvIHQRsKCs158G6abaFmP2W/jK6/4E/DUh63RmDew24nQW5c91yMk6UhDdnDuTqpM/CNd0I34W83ekoasF7Oz1EMcKpMS5WPM3Aw3ev0LUzkpQ5WrjkcNCXA4BsZUM1GKeUa+tjNdma+mTbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gYf+V770eo7RYxzdFJUCd6Kmq0u27sksEwZ7Q8mss4=;
 b=yM2Ssz2C8hap2g60xi7myu8kw3jybFBYc06xKOjKOFEX2S7ae2CqtJezSX2kbC4LH6P1iPgGBHh4CmuhgPQ3e+uPiVoNTdyFDZJ9NwcvHvpdVFfMpV/ToXucJ6etl3FmZWBzf6g9JnIpQqsAnkz27efxo/nhy6iLoRfXFXhzVlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b0307587-7980-4180-9ce8-2f76b6bdd0ae@amd.com>
Date: Tue, 27 Aug 2024 13:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Use for_each_set_bit() in
 vgic_check_inflight_irqs_pending()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>
References: <20240823230045.1581050-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240823230045.1581050-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|CH2PR12MB4056:EE_
X-MS-Office365-Filtering-Correlation-Id: 0385cef0-20d1-4c4f-1524-08dcc68d806d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blUvbnBjUVlnY2NZNHU3bXMvQTJmdFhaNGJydlN1UG1GcnVDOTkxYXFETUMz?=
 =?utf-8?B?SDRVM0NaZ2RINnpqb2VldXU1WmFSQlhaL210S1g4LytmMmNSVGRVb3hXZFhv?=
 =?utf-8?B?RlcxSGhMWDdqQis1UGR3M1NQd3ZpVHc3OUFmNGRZT3lQOEdFc1RDVVZmamNV?=
 =?utf-8?B?N2xtMGI4UnF1MFJUZWViQWNKKzk2UG4yT2hMd003bFhjWmo1L1F5MEFhNXBV?=
 =?utf-8?B?cE0rMDVubUFYaUZPNzdTVjh4RGR4ZTBhNTNxSWZmSVN5aHc2YVZ5ZVc5WnUr?=
 =?utf-8?B?MkhhbmR0cXVOQ2xkUG5DbmFYTkVGZHNsKzFnYkh3Q2hzZFJDTElDRWQvclNp?=
 =?utf-8?B?dFl2c1JpVFR0ajBGZXFxT2pzTTBVT2dtbzBPU242V2JYdW91WURZdUExcGlB?=
 =?utf-8?B?OVlRdzVtNGJXdWhoRktIL3JJMkl5MytxZnh5SlEvQkR0QnQyRk96MTFUR3Bp?=
 =?utf-8?B?QUJzeFFtOURORDduSjBrdE91UFQ5aDVjRTBiRmNzb3V6cGszbzB4VDhGTzkw?=
 =?utf-8?B?S1BPclFXNFkwcG82VEhyY2ZETnNlQWtmQWN3S2dNdHJlbkFlSUlTakJyVmdl?=
 =?utf-8?B?L05Ga3BvaGh1bUJjemgzNEVsQThuMGlrQjVKTlJnb01GRkZoRWRjNWpZbVdo?=
 =?utf-8?B?Z2pOaGN1b3EwY0Z5aE1MYi84Z0VFclM5ZzZPTDFySkZHa0d5ODNvYXkzdU53?=
 =?utf-8?B?VTZaWkVrQjdpa3gwL0RDc21vSU84dUs3TUcyRUpQNkRvWERpSkcyVCtaaGRQ?=
 =?utf-8?B?T2ZUMDRpRjVZSjhKRGNBYzRBNkFVczlzeVdxc0V3S2lwYU5SOTN5VU40WnFr?=
 =?utf-8?B?eTZxZm12aHFFSkhQellwK0NZNklGYkNNNFBTci9jZ3FDUkFKa3FlTHZtNFJV?=
 =?utf-8?B?bmwyQy9QSVpaVVdkSjNUWDJPajYyL2FQSm0xdDN4V2JNTUIrRlBGbnZhUk1h?=
 =?utf-8?B?WG9CaXR6Tk1naW1IU3V6cGpsY2JTOGNRWFk4SWNZM0FKdDBGdmF3OUtjQ2pX?=
 =?utf-8?B?dnBWSDZzMlpqTktqV0E0N2ZyeXppTWlSV1YzdjVGQnpVNS92NWoxUTNOa3ky?=
 =?utf-8?B?eWdlVXlFTmRxeE44L3kzZDEyYW9hZ2pmNnU0eXhTU0h6N01qcnBPQjN6dzFL?=
 =?utf-8?B?L2xyWDhlTit3Nk0zTWlrQ1NwMXNYRTlMbUtWaWZ1RnpXdjJ1elpGaitQNkoy?=
 =?utf-8?B?NzYzL21yWHNwZEVwYjNQU01zcmNjWjNrMUpVUzBidm4vZnZqWkxLWCt1cmI1?=
 =?utf-8?B?NHovUzBueXQ3dll1M0NyM2RBTDFpTU9MdW5qS3ZQN2FaOCtaZ3RJaWJ3b29s?=
 =?utf-8?B?QVJKdjVFNTlkQXNUNTBCSng0UUlleW5ISmkxdGhKZUxIdnp6NXhVQ0FjdFJP?=
 =?utf-8?B?T0JxSzZLZU1IRmorQ0QzYzRtSTdNZEg1TGVOYS9jQUgvcnYvbGRHbXN5Z2lY?=
 =?utf-8?B?aDFmYktBUzhFckFQbzNkMk9scXlTQzd5cFBJZVRYTTBSdXNXNXMyWmt0d0VR?=
 =?utf-8?B?K3RBYk4vV3Z2aWhDVGJMd3lHTU1XaXdOa1B6TlJkV1NSQW9qeWxCK2s0S2tx?=
 =?utf-8?B?UEVYNEEzSzZqOU5NZ3BTM2NQT255MUF1Nk9GQzJ6bDhQZWw3YnhkN25sM28r?=
 =?utf-8?B?RFlYVzVKcnFMd1FPRlFrTmxKdFpTczNvZEZWYzdXMXh4RDAzdjFaN244SXhX?=
 =?utf-8?B?OU03SEZUaW9YTnU4U1I3Qnc4eERBem9NVzZYSEZWSXVtejFIbmxhbzlsWEd2?=
 =?utf-8?B?VzNOeVFzT3pEcFlibW16VnAwNnVVMUo5Mkt4VU1xeTNtQVRtTDFTZzRpcVFL?=
 =?utf-8?B?RW1OOUE1SmtYZzk1eTIrVFJzaXE5YWowZjZ1TDFJbHc4Mk5sdDc5T0RmWEEv?=
 =?utf-8?B?VlpUU1dRSCtldlFjSVFNblJCMGgxNmFKNi9rVEFsSGRqTmJoa1htbUVwem8r?=
 =?utf-8?Q?hjbzmYkzIProipSSbfmKVDWLRfiQ7iVh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:43:42.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0385cef0-20d1-4c4f-1524-08dcc68d806d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4056



On 24/08/2024 01:00, Andrew Cooper wrote:
> 
> 
> ... which is better optimised for scalar values, rather than using the
> arbitrary-sized bitmap helpers.
> 
> Additionally, unlike other vgic helpers, this takes both a domain and vcpu
> pointer.  The domain parameter isn't used, and the callers pass v->domain.
> 
> Strip out the domain pointer.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


