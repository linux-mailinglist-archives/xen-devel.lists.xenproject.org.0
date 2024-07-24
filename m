Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F693B1B6
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 15:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764230.1174591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc9i-0003pa-D6; Wed, 24 Jul 2024 13:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764230.1174591; Wed, 24 Jul 2024 13:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWc9i-0003nb-9E; Wed, 24 Jul 2024 13:35:46 +0000
Received: by outflank-mailman (input) for mailman id 764230;
 Wed, 24 Jul 2024 13:35:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i70y=OY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWc9h-0003nB-4K
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 13:35:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f533bdc-49c1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 15:35:43 +0200 (CEST)
Received: from BL1P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::23)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 13:35:39 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::b4) by BL1P221CA0011.outlook.office365.com
 (2603:10b6:208:2c5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Wed, 24 Jul 2024 13:35:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 13:35:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 08:35:38 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 24 Jul 2024 08:35:37 -0500
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
X-Inumbo-ID: 9f533bdc-49c1-11ef-bbfe-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/eBxhTshMpT5Kq6VsOqAjBc+/IC+6AbqM+u2BJzxY9K3Nz59GwyGzwh2zp0TxRKl5c9dYDmBEqvA6TZNK5SwF6sBMxOLU+rSiv9hXEI8RmWWb4wbDWPbvKJmu0P9sEHlLKlw69yFSteCVKCB7bcB3pxJXgBBLvnakPD9nlwmdkivilQzZmRSexHj87AElEXvwyfHdo8VhufcAEZOmkuUpV6+FqJqMos5wnUX8fok2q/NVyiDaSyn5LxVNjO5l20Xe0S0f4nWTkA7FPy5ZQUYVpGiigNslrB2NTwtZd0gLkkxOaiE7CBzfQdcCy3OEhXgRsLUG/5HcAVTNJS95+srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opazuiMa3MEJlGARPBRbOaInCWrVby0T5oXoADeSrJ4=;
 b=RWm5jGnpmqChDCiUbAPASrE9RMM3k75RdlAVJ4QXStUIK3z6Ba5yL6g5xjzYOdHee0YIX9cDhJxyAiwZp4LjeExV3p09UmkD6wRRzNuMg2VF4NE4ekOBWfLS9ec/RsLnLpCfYrGIeUkzd1wvbu4z9Yyg1og0xNcyDGWKENPz3tvlP3pLSTFQ0BaKikjB5uBl8JMM+SUCJSNcNk+JNPdnHlYSGOSfXpE7wmfHnA30XccJ1xZq+2t+P15kAYG2uGvS4UcrxQgznYEZJ+3LG/ZC2Ib3QKKevKB6DljV91ekr9rGkIa9YTVdFTIeyTYzqOUcGqua1s1MNJvuTsb4WwGC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opazuiMa3MEJlGARPBRbOaInCWrVby0T5oXoADeSrJ4=;
 b=qdJWZx57HyVVcTVNn5/7hngFx/G4ziSVDOGU7PtSidv4ZrmdQQeu65kUbQDKY2Oq5wxmvNeWADtlYUMn4bqrwid9B3IBbYSDtRklHGdCh9kpbOOsb+Xn8+R6mT6nuRKm2VVdPuMUPe54iQrlHxkEkC6eu5/uml/yBSf9OryqOf8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <50cc16d8-2811-46db-9482-fda88fda3d9e@amd.com>
Date: Wed, 24 Jul 2024 09:18:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] hotplug: Restore block-tap phy compatibility
 (again)
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>
References: <20240715234631.4468-1-jandryuk@gmail.com> <Zp/GcCUVPX/d/7qx@l14>
 <e65e7307-7955-4427-9a10-7bfc1e1b7d59@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e65e7307-7955-4427-9a10-7bfc1e1b7d59@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a457b1-8fc2-46af-5593-08dcabe5815d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cE9lT09IbzdNK3JobktlaTk0ZVMvOTBlZ0cwMGZRUTFsU3VTLzJFVDBQRHdB?=
 =?utf-8?B?ZDhUaktaVnJtRVE4SVVuUXNhdkpiVWR1QjZ6SFlwM3JHcjZMVVNHbW94M3pQ?=
 =?utf-8?B?WDVqZXhWaWZTa2ZOSFE5RFJ5djhLUXoxRW5NNWVBRHV0cFcyYVRKMElFRU5W?=
 =?utf-8?B?a0x5ZXNDSkw4aHlsL0U2TjNHQi82T2xlSmEyQ3pxL1dScTVKUWVydGVZWlVU?=
 =?utf-8?B?RVZHYzRwaWdUOEVMZ1RJd0dZU2VsZGEvSG9hbG5mbDhqZm9Oa2taNWV1Y0NK?=
 =?utf-8?B?Zk1SMGllQ0FUenR3RmM2NnVCTzVZWkh6cTMvTWIrQ2Q4ZkZ4Sks2dEl2WVVH?=
 =?utf-8?B?Um5YUXQvKzRyaklQSnpOb1JmN3lvS2J1WUNWbFJ4MU05akdaNFlhZHErTllW?=
 =?utf-8?B?UDhldjNIVzczeG0wM2dTR2tseEpzZnI1aG9yY3hQbW9BMWRqUDg3NFZQZkdE?=
 =?utf-8?B?RW5GalRjUVB0SHdnbU1jcDlFaUNWc1Vab2dURW1nbUZZWnpiR3M4VnNkWnFw?=
 =?utf-8?B?NTA0R0VJTGNJWUZnZ2tUSTBKWU44KzFua1FBcmJGb2xoY1V1dU1vdEQvU2V5?=
 =?utf-8?B?M3A1WVBzVDc3RFJRazJUNzcyUnVNSzU3NG5MNEQwV2RiVmxzT1Mxckp1MHgx?=
 =?utf-8?B?dnY4R0NtWXArNWJsdEdnTVhlVmwyTFJOaUhmQlJpWlB4YmNQUUgwOHpidXJ4?=
 =?utf-8?B?Mkt2MjN0aDhvTjlSdnZXZ25tckJzU1BCdEZBdHk0L1JvVEgySUVIZ1JSR25Q?=
 =?utf-8?B?aHhDcDVBZll5TVlZZUg2aXNYQ3NzUzRraGpiWUlPV25UN3NkUWVhZ25oWGQv?=
 =?utf-8?B?aTdIWGo3aThtclZRMzROaEZUMERiVitjekhQYVV4V0tTcG12QmM3c1l3Wjhl?=
 =?utf-8?B?TVFxNTA1WDhra2JtT01KT0xTQTdNYjBHQjIvMSt0eEZmWi9semw4V0JibmNj?=
 =?utf-8?B?YmNQN0Z0cTVNOHRWdUFiVnVxMGdTY0dQYUprM2oraVJpSU9LaForckJqR3p5?=
 =?utf-8?B?WUFzaUZZUlE3NVhoRnZacm1ORnA0OHpKdmg0WC9KS1FTazJ4ZDQ2OW5xajg4?=
 =?utf-8?B?Z2Q5SkVjT2ZTVEhwWUh4L0JGcEtzLzcwTC9jalB4WXNRZE5LWFVqQ0J1akJZ?=
 =?utf-8?B?VFlXeU5TM2kwODVUZWZvdnloQWc5NXJjQnJNVnpzYlByLzBzd0d3NTNreWJp?=
 =?utf-8?B?QnNBcmp4bFhqOEpScTM5N1VFL3N6OUdINnMrZEplM1hldGxDUnYyaDNFNFNz?=
 =?utf-8?B?NTVjdlhIT0ZmbzVSM2dSdE9ISnBONm1QemZLaXIwNDNKbGsvaWh4YVJqZmNS?=
 =?utf-8?B?ZlM2VFZZQ0Z6eHg4T1cvTFBTNTJZWndZWUZBdmM1TWVZSFRNSUNHdlJtZXk4?=
 =?utf-8?B?cDhGa1VPY0ozZ1BwUnJjK0orL2g1bVd0aUk2RjdHUTAyaWpNMG9tYnh0U1FR?=
 =?utf-8?B?SGE2TjMyZ0dxbXRaWUdIaUV0QjRHM3B3S25nUnExTS8wNkg4NGdralVnSy95?=
 =?utf-8?B?QTlTMC82eVZhRFVaeXhBb2ExRXBFRHk5T2kzK1FLQnZKTHlScU40TlNxbHlF?=
 =?utf-8?B?akhsbS94cG1tNXc0UFRQTkhLWnA4TkVMNUdXR3NCSlJ3TjlaRUxHcFlvQ2VY?=
 =?utf-8?B?Yk1KOWxzZmNKYzRjMUJXbEdSWDRwQmg4ejJRcVp0ODF4N0NQRlZsZHZPdG5Y?=
 =?utf-8?B?NVRjWHVacDdwcFhudlV5Z1RSK1hBY0N4cXErRHhYUXdUSkM0bFRyTGNrQUZl?=
 =?utf-8?B?NDRUNUtlK3p6S2F2RGVZYkJnR01zUGZtdHUydkl6Vml6MEhqb3VmWm5nN0Fi?=
 =?utf-8?B?cmJMTE5UeHdJV2M1Q2dDTmVOR05GOGlMa2UvMlhLSlk4N0J1OTNoVlV4VFV6?=
 =?utf-8?B?dE9FV0lialpicGpaUENFSUlMMkpoV08wNjVwRTRvOWJZbnAweWFNTWhsZzA2?=
 =?utf-8?Q?XLTT6Bx/wzZxnOFgIHAn/sQfuhMUJZhF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 13:35:38.5224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a457b1-8fc2-46af-5593-08dcabe5815d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130

On 2024-07-24 08:41, Jan Beulich wrote:
> On 23.07.2024 17:04, Anthony PERARD wrote:
>> On Mon, Jul 15, 2024 at 07:46:31PM -0400, Jason Andryuk wrote:
>>> "$dev" needs to be set correctly for backendtype=phy as well as
>>> backendtype=tap.  Move the setting into the conditional, so it can be
>>> handled properly for each.
>>>
>>> (dev could be captured during tap-ctl allocate for blktap module, but it
>>> would not be set properly for the find_device case.  The backendtype=tap
>>> case would need to be handled regardless.)
>>>
>>> Fixes: 6fcdc84927 ("hotplug: Restore block-tap phy compatibility")
>>
>> Do you mean f16ac12bd418 ("hotplug: Restore block-tap phy compatibility") ?
> 
> Which, when replacing it, made noticeable that the above and ...
> 
>>> Fixes: 76a484193d ("hotplug: Update block-tap")
> 
> ... this hash also were too short. Please make sure you use 12 digits, as
> indicated by docs/process/sending-patches.pandoc.

Sorry about that.  I'll make sure to use 12 in the future.  Thanks for 
catching and fixing up.

Regards,
Jason

