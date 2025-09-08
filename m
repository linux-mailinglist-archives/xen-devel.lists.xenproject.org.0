Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17CEB49DA2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 01:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115766.1462261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvleb-0006bO-1p; Mon, 08 Sep 2025 23:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115766.1462261; Mon, 08 Sep 2025 23:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvlea-0006Zm-Uq; Mon, 08 Sep 2025 23:52:08 +0000
Received: by outflank-mailman (input) for mailman id 1115766;
 Mon, 08 Sep 2025 23:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snl7=3T=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uvleZ-0006ZN-D5
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 23:52:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2414::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc9c391-8d0e-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 01:52:01 +0200 (CEST)
Received: from DS7P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::7) by
 CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Mon, 8 Sep 2025 23:51:55 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::8) by DS7P220CA0005.outlook.office365.com
 (2603:10b6:8:1ca::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 23:51:53 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 23:51:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Sep
 2025 16:51:54 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 16:51:53 -0700
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
X-Inumbo-ID: cfc9c391-8d0e-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6+x4N2D6KVyvPw3c08CMuZl+7ghpZSmX7cQB+iWIRd+zvagXdsZJobKtf/BV2RhxXy27fut6bLsIG8yx8y/r67HOmI+YEe9tZKNRjULZ+e752gt1k93xvncDd+EfKuM2dQ47Wl5Q26abbBkEfahXu+BmvykSIT0HMnC6+IOmkxRHPYVccMbiafPj7Yk+RaXt8SA2w9SbQtBuifvUev3oHqPgg9xtsUFmc9Qh85rbmfor/J8QgrxZDJUpL5rjjKYJKOMmnCJ5HdbuiKytOJEfjN9PGcPwFcYQyBXQFtbgTLFZYUPOwj6vDn8Q9Ef1PtYnQRekK/rs8lKkCgq1BuUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxfbD5t4AAmavriFKCaj/6pnOKSAkpFeOYbctAmbv3k=;
 b=Po5d9S/9VVMY8ZMEjt2MzcycknpAyTVO0q1ckbVw1AtjmHkPcfa8ZQQgz1hEIZWA/J2Tf5GoPN8hBDy385IeI8TCHfTTzfWAwYNx2BoGMSVMI1vF7WZxkPRmz1bsDpAf7S3gdTEA/Ebdiy9sI9FbowO5kkjgqFND9wo/4hvIuJGliMsJzMvflypvJSm5i/vUyR+HxSlp36aql/llh9ZTTrkmvIopKX3akBtFUvGrZVavRon6+0P8ndIylZ04OKSluBWjI4/iGmWiWXn8ZT210ZQLyG5tgKyI24L4yckYR52KbvUTWyiWa6kaG2py1MMv8KDvUMTYFLhNyqQ2Lq9mpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxfbD5t4AAmavriFKCaj/6pnOKSAkpFeOYbctAmbv3k=;
 b=wagYQW/nI1242r/EnlU8XbaRMR/GufMWhIw00nt+UjOR/SwTW8JQm7MB6pNXMR1euS94+MGi7MpEDg02AbQ0AeViByYl5ie+nZMnvZzDrouAfJykoIBxL7UKcEj1vs1NJSVTNUOVbSkidqYL5tz6jCyftpAKaXJa1XRQV0FgqJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Date: Mon, 8 Sep 2025 16:51:53 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Mykola Kvach <xakep.amatop@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>,
	<andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <dmukhin@ford.com>, <dmukhin@xen.org>
Subject: Re: [PATCH v6 00/15] x86: introduce NS16550-compatible UART
 emulator
In-Reply-To: <fff47b95-6c3c-49d5-affd-3acbe933bc01@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2509081650560.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <alpine.DEB.2.22.394.2509051900200.1405870@ubuntu-linux-20-04-desktop> <CAGeoDV87bTaDiG=5xAvSGZXKTJ0zSRUz7Nq2JSenBqu8DnLe2A@mail.gmail.com> <fff47b95-6c3c-49d5-affd-3acbe933bc01@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-174628289-1757375514=:1405870"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CH2PR12MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f0d964-c8e1-42c5-f642-08ddef32b10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjJSQkNzdTZTMC9UUm4xYTE2ZTg0UUhLbm9GRnFRVm5ibHRCRDhqSzdjWURZ?=
 =?utf-8?B?ZnZFT1FldkpxK1A4SlBzRWtKQm5QVjNwRzZhYmhGOTZZbkh0TTdRVTNSY2Zu?=
 =?utf-8?B?OHQ3N3JnWHBDcDk0aDJ0anBIazFJRldiRzBoc0ovb1pTTEVRaXlqbGQ3SWFQ?=
 =?utf-8?B?OHl6OEhSbUlZSzh0c0FLd2pPWUVOS1lDeFd4QWhLWWlVemVvM3h1YTAwdzJq?=
 =?utf-8?B?WGFiWEQzMXBBZUEwNzl1REdJYTVVOFhCbEo0WDQ5Rkc3SER4azY2RmgwR3Ar?=
 =?utf-8?B?dE9LclltN3VaaHI5TTZKeUF4ZzhpcDJtYlNuNHpOYlVGMmxQS1Rxa0R1TGl3?=
 =?utf-8?B?MGRiYlFmTzk1ZnhzNXFTT0NhbFJlVE9aRW4zODZXSldsd2gzQnoxUnFmUWdh?=
 =?utf-8?B?M0QxQlZmTW9IbzZuVDhLdkhXZThWb0ZrN2NyWXhiK3FrU2cyUTFJTmhxQkEv?=
 =?utf-8?B?YURmSWVTbm9hWUFjZzMxc0plL1pGc1lYL0ZLWHFIcDc4ODZzTU9KUFFTak5X?=
 =?utf-8?B?NjlYVzc4eHZwUHFuSEpVSHNvZjBrS20rWjh4Y1FwSHNTcnZvWlk4S1ljdGVm?=
 =?utf-8?B?dEdqcitFaUNzT3RoNUwxS0F0RDdZNVJXd21TZ2lXMG5vQjRqWVJZc1ZpWWs4?=
 =?utf-8?B?UWJ0blNOckxXcVEyVC9tR0VCK0xxUDdRemV0RjZyYjdSNkx0aXlNTTRjem1U?=
 =?utf-8?B?c1NoaFd2SW8zaFFoZ2NLTUNRK0RYM1VDOEprU1JKUjJFK3ZuZ2VWSUIvTXFh?=
 =?utf-8?B?TWRtVWlaN3h1bnZ4MkFUQm05OVcxVG1CbWV4Tm5BcFh0cWVFQktrY0p4SDd2?=
 =?utf-8?B?ZE13UzUrY1lBZ21sTmJuOThJUG8xNkU4YnlERjB3OW1hOS9xOUFublVTQ1du?=
 =?utf-8?B?akxhbmdzRHhZYmk2TGJLTXF6cHYxYnNKVm01KzRDK1lnbVlCK0pCdzZhZXlR?=
 =?utf-8?B?bE1TRWFPR0pRN2lwSFBSN2VyYWJvMmg1THFiT0lnQ0QyMGN4NUk0bE5acXZX?=
 =?utf-8?B?Njd6UHVCbDRLNnl1S0RzY0Nnd0JHU2wzdXdNdlFmVHdXMW9KOFFrSkhYMk9n?=
 =?utf-8?B?K2svOVh4Ni9udWdYOWJsRk9hVEduQTQvakNYUG1PZnlRekJ4cmphWHhuYlRj?=
 =?utf-8?B?b0RpbVBobGdFeUdqWUhGNmRTZTk1UDNiNEE3WUlVNFEyS0xQaVpZN3QyVFBE?=
 =?utf-8?B?Uy81YStxQmljUkprSkxGNmg3eG1kREtxaisvbWhkeXppTU9KRFJJWWhaekZy?=
 =?utf-8?B?R21WQnAzeDh0WEx2YjRMT0N4MEtFQmZKbkdDaUg0L3UvTXlRa0pIUmxPeEJn?=
 =?utf-8?B?RXBrdGNON1EzU1FCR3pqK1NzWjFtZXFxeDFDbnNMZFBhLzd1WHkxSVhCNTU1?=
 =?utf-8?B?WThySmVpaVM0TnNqcmpiTjkvZUNlcTJ4OGtzOFNSKzY2eVVxL0UyWmxzMkNy?=
 =?utf-8?B?YVhtc1BZb2pjbVgwOWdySFZWbDRCUmkyWXI5aHFyNkZIYndRS3FTNUFsMGZ5?=
 =?utf-8?B?SVZCK3ZGMW5RaVRDLzZmaU1WSk8yV1dYa004Qjlrd0xieW85T2hFaWsxbE1z?=
 =?utf-8?B?RGVtbmsxTWFJUTRUblp4OW8xTmtTbGhoTWd5VW1uYm1BREZEcVVKVlVTZCtS?=
 =?utf-8?B?ZHFQUW8vTHNJWkdOcUxMOWhNVXZNWW01ZGdJUUdBZmVCVENIdXhQT2hWZzRN?=
 =?utf-8?B?YXg3YVdvaENUWWI5WlYrUDZyQVRuSm5jbWIwWTdpdkVsbkg1Y3dKQnZVb1lY?=
 =?utf-8?B?Qzhpd1pVRG41ZEY3SnBBbG03cDl6ZnhvSlEzUVNTYTY1Qkc4NU04V0xZQk9v?=
 =?utf-8?B?eHpGSlpndDU0MWtzTWVhNE12ZUNSKzNSL2RRL0hlRjRtQUtYNzA3RlAyamlv?=
 =?utf-8?B?Y0diL3NtSjFUNWVoWEpoWnYxcXAvcEp6MXVTME1yWk11TEcrQmxqSkhZMUJP?=
 =?utf-8?B?alNtUFkvV3FpYUg5RkF3NSsrRERlZnBCOGp3UVRSdHhEcFVxcmNsUUcyMXBX?=
 =?utf-8?B?OEtpYlJFcFIrelNONzEvSlQxUk5RRzVIaDJsSGxSYTc1d3dvbW5jK0Uxai9H?=
 =?utf-8?Q?N+SSVe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 23:51:55.3623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f0d964-c8e1-42c5-f642-08ddef32b10f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183

--8323329-174628289-1757375514=:1405870
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT

On Mon, 8 Sep 2025, Oleksii Kurochko wrote:
> Hello Everyone,
> 
> On 9/8/25 11:04 AM, Mykola Kvach wrote:
> 
> Hi Denis and Stefano
> 
> I’d like to acknowledge the significant effort that went into this patch
> series -- it’s clear that a lot of work has been invested.
> 
> On Sat, Sep 6, 2025 at 5:02 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> 
> Oleksii and all,
> 
> I would like to consider patches 1-12 of this patch series for 4.21,
> pending the few minor comments I made addressed.
> 
> Although I am neither a maintainer nor an official reviewer for this
> project, I have looked over some of the first patches in the series. In my
> opinion, the series is not yet ready for merging.
> 
> Even if my review is set aside, the changes are largely x86-specific and
> produce the most impact on this architecture. I believe that before
> merging, one of the x86 maintainers (or at least a trusted reviewer for
> x86, if available) should carefully review these patches.
> 
> I agree with this point. Considering that this part is being moved to
> common code, it would be helpful to get some input from the x86 maintainers.
> 
> Also, since the entire patch series is not yet ready, I think it makes
> sense at this stage of development to either have the whole series reviewed
> or postpone it to 4.22. (The last one is preferred at the current stage of
> development)

Even with x86 review, it would be difficult to get the whole series
merged now. If it is all or nothing, then I suggest we wait for 4.22.
--8323329-174628289-1757375514=:1405870--

