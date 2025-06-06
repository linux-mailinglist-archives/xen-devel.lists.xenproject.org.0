Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1310AD01A2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 14:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008465.1387742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNVoe-0006of-6i; Fri, 06 Jun 2025 12:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008465.1387742; Fri, 06 Jun 2025 12:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNVoe-0006mE-36; Fri, 06 Jun 2025 12:04:56 +0000
Received: by outflank-mailman (input) for mailman id 1008465;
 Fri, 06 Jun 2025 12:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r11P=YV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uNVob-0006m2-Oa
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 12:04:53 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20615.outbound.protection.outlook.com
 [2a01:111:f403:240a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71f265ff-42ce-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 14:04:50 +0200 (CEST)
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 12:04:46 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::5c) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 6 Jun 2025 12:04:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 12:04:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 07:04:45 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Jun 2025 07:04:44 -0500
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
X-Inumbo-ID: 71f265ff-42ce-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIgamSVNy/go73t3KWs83YbHQWVO5EbZ9LfDLFPN/Hs8goSBqaISIRRoTfP+vb+iAD8GHjeb1dXEH9JhVVXfXra0vpunNHlThl1H8U6yDptRf/QcL4LGuytCtqWL3dQwxJQl8dBemQ56ZHo4tMyzUYB+a+1ghjJxxxjb8P+50fY3QDRHVtU35HD0ozfIo9MN4DNdlr3cvy8pJPvqJIPp2nCcmVkB+uuYVEpoL1ft5HFN43dXbVo+B6sQ/MwyqedxZSDAVxmSOWFqTMh7C8kj3GbU3UWqYN2j2AVvik13dZlHSMRvTS1GxinbOIPK8Sbh6pkIjt9/xnlYg6gUXYS2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDHgc0Z1OVo3mN5DyXW2eRyjhMEoj80iTby6hxyWtOM=;
 b=DEfQEVq/j3yW0+Y9qGUmWWXZ5aLQUCmZ2TTIe6nUkpZgiEBwfPJauA951YMoYpjb94G7jVtJDNIIbQkVam7k97CIy2E1aIhdouKUKd0RKpIAmaKR1UwImEqQW7ybgM1QBUBM45NT4l8Fd322qqwZealApfrxP3D6KrE/MriJdxdTUN61Kp2Ju4aIc5lEcn5L/ocGSB9Yo3kW3zsPfPr71fTIgNPiAZY0ja8J1d1PL4/zKcS0NtQfXCJwYfzbg6QrvR0HggBhCg9SrMRCsBqluNiFzSQB7NRmQ5uIg9RPGZljUWsz3d2fOy8Y7XwiL7xdTG2ClWAWaY9dbE+DjXjxMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDHgc0Z1OVo3mN5DyXW2eRyjhMEoj80iTby6hxyWtOM=;
 b=Ml69vi+h/g53ZiWBB28ef1BM4qJ6VQBjfdv4SGYpxD/gVUKE+atbYxDSlpwI2w/cKXHDNwnE8HAD3tmiER8W3GE2SiGC0zl8v4CF57Sno5oyF5YtYm29luzXsWT4dbQt1/oLao1cHvdX5F43acqcsRkyJM9zAknm6xmWBYAr/B4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <eeb2d2a4-4098-466c-aed0-f789f0eeaa51@amd.com>
Date: Fri, 6 Jun 2025 08:04:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/arm: exclude xen,reg from direct-map domU
 extended regions
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20250513195452.699600-1-stewart.hildebrand@amd.com>
 <20250513195452.699600-2-stewart.hildebrand@amd.com>
 <2491389a-cd47-4917-9ade-7082f1ebc678@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <2491389a-cd47-4917-9ade-7082f1ebc678@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH8PR12MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 889fcc9f-cca8-4914-9686-08dda4f25443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1RmN0trWUtaYTcrOUt0ekZwNHpQczVTK1VaK3JGK1oxa3Rqd05aMFp0NWN3?=
 =?utf-8?B?WXdpdkhjRTViWG9zNmZXNFJlbGMrY2Jwc1ZwSDd1SER6Wm9GaHNUYUdDbEZG?=
 =?utf-8?B?U25UVU1pSC9IemNLak9SdEJiRmhhb285YXMxK2Z1VlZMc21DeXpTd0hmallt?=
 =?utf-8?B?Tm5hT05FVktrSWxaRS9OT1J6VUQrMTAwbEJoNnB1NXg1Tng0QzhDa3FTeFdN?=
 =?utf-8?B?VHhCSWVMNUpURC9YR1J4R01lVFZGLzlqcldra3V3cnJ5bHI3YmNLN0tWS2dV?=
 =?utf-8?B?STVQT21jT0ZUV2IxY3MrbSs0bzM3SDJWU1J0K3kwQVpBMDVrTDRpRFkrbkdW?=
 =?utf-8?B?cTRuT0cvZG9aNldTV2pFTlpzY1dJdlNNcjdxNzhNNTdnYkc1NUhmNnlaTHdp?=
 =?utf-8?B?VnJHc3IwTjhNaiszRlh3MmhnUFltWnF2ZXZGUEYvU2gwN3lKOXdUVE5WVE5u?=
 =?utf-8?B?TmhJS2dKcXF0a01zbDVpMUVSM1B4Q3hiNGFZU0U3RHhKYmlZaHRNVmo1VzNt?=
 =?utf-8?B?cWhLYlZtcllWR2RQWE5yc1ZKRHVoSkQvb21aUnFkR3NYQUNWWFFLWWJoWTJ5?=
 =?utf-8?B?NUJJUTIyTTVrV0FqYkVHTUtwWjkwdUFad2V6T3VEdmJReWx1SU92bmVnRDdy?=
 =?utf-8?B?TTlNOEtrd3pPWUVkSm0zUGIwQThpcDFHSENKQWsrTkVPUENCa0F5RTV0bjNn?=
 =?utf-8?B?N3lFOVRyNXVPN25IT3BBbTMydXU2aGtOTFFCQnJkZUtaSjBjZlBQUzFyTWJi?=
 =?utf-8?B?THNjdjY2WTQ1ZU5RVVcyT21PRThHeTdKZEp6MWNRTEJmRllWQWR4UldtOUF4?=
 =?utf-8?B?dTZOVVlvemtiM3NGNi9pbW50bEJaeUFRNk0wNS9sOG1NWFhIazgxVVlLZE9o?=
 =?utf-8?B?bDZ5NnBhS0FFcG9LRS9Vak9mWHhzc1p4YlBhWEFrRXlWdVc0MUNQMHlQdjFa?=
 =?utf-8?B?VVBFUTJxUENjWEp4TS9Nc1FUUzh1RXh1cDdIWkNKaTVtamxpcFRQd0VIOEpu?=
 =?utf-8?B?czQyVm5IclM5aU1UbzlGTGN1YkF0ek9HV0cyUkJLN05aNVNjbFlGQzBUMkQr?=
 =?utf-8?B?WllSSEtSc2JBWWw1dDlZRFdpT1VrR0RBdDI0WDUyRXl1MjJ1YjZqU2NGd0hz?=
 =?utf-8?B?UTNEbHdIdE5BOXRsN3ZocVk2aEJpZExXa2dKTzBkUWNYS2F1cGRPYngza3BJ?=
 =?utf-8?B?bWNXa2NMZFdEV2tBbXlsSVhkLzRCbTVjU1hQMDVlank3VVRxMUZwUjh4d1NQ?=
 =?utf-8?B?Nk45a1o1end5eGZQMjRMWnpxejBjckJydm1IMGdoZnNOdmVGWTVRSVRUUENa?=
 =?utf-8?B?MytCWmNqNkJ4Vy9Cc0Ewck9UckN2V2FGYzFjWFJDZmxsU3Z4eFFxU1cydVNt?=
 =?utf-8?B?T200OVJva2hDVlJEMTRwNThJZm9wUExzSWpxYXd5RXVYeVpRWFFXS2RqR0U1?=
 =?utf-8?B?TGZMMy9lMUdYbjV2TVBSbFRIRFBXTldDbHRmYU1obFZiUndlYTN4bnZJKzNO?=
 =?utf-8?B?N0ZMWU5WdnNHbFpXNHA5dkhoZ2ZGNVRQZStyRWR5d25yRmlEbS9iQ2tpVUdM?=
 =?utf-8?B?c0ZjSVJwVTdRbzljd0QyZ0FPQUtZSWVPZlUwSnM2MEUyeW9yaHZwODBRSitU?=
 =?utf-8?B?c0ZEdlBJeFFhdit5b2czTXFrYlNkQndua1c1MnNNanAxbHo0L1RReG9pTDVj?=
 =?utf-8?B?VDNJVk5uRWdUT3UycUNwdmxqeTNDOUdKTGFTbDR3UTdlVHNRd01FdFNEb081?=
 =?utf-8?B?eXlRMHQxTDlPc3Y0M3NiNGZQNnJxSWYzM1hhRlZiVSt5cEI5aUpjSEpzT1NK?=
 =?utf-8?B?RDBSUGNpeUZFUU50S3FaQkNpMHhHT3czYzRublVpQm5NTGlSazJmMzZlUjZn?=
 =?utf-8?B?cWljY052VWVYc1Z4WU5CcTBML1FlV0FERUc4aTlBVlZ0V1ZtakYvS1lxSGhX?=
 =?utf-8?B?c0J0T1Eyd1FJNmVza0NSZVlmWGl2blR2eVVaSHBXaXorZnFoZ0RBb0Y3VG9S?=
 =?utf-8?B?UlBCUWlDUEhzZmxBVDF2S3d2SlRGUitVaVg2KzVjaWVnZWMyWVkvY1ZPZmJ6?=
 =?utf-8?Q?/sT9ot?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:04:45.8495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 889fcc9f-cca8-4914-9686-08dda4f25443
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890

On 5/14/25 02:49, Jan Beulich wrote:
> On 13.05.2025 21:54, Stewart Hildebrand wrote:
>> --- a/xen/common/rangeset.c
>> +++ b/xen/common/rangeset.c
>> @@ -433,6 +433,20 @@ bool rangeset_is_empty(
>>      return ((r == NULL) || list_empty(&r->range_list));
>>  }
>>  
>> +int rangeset_count_ranges(const struct rangeset *r)
>> +{
>> +    int nr = 0;
> 
> Ehem - this and the function's return type want to be unsigned.
> 
>> +    struct list_head *list;
>> +
>> +    if ( r == NULL )
>> +        return 0;
>> +
>> +    list_for_each( list, &r->range_list )
> 
> Nit: Either you deem list_for_each a pseudo-keyword (then a blank is
> missing) or you don't (then there are excess blanks).
> 
> Further I don't think this is valid to do without holding the rangeset's
> lock in read mode (irrespective of the function return value potentially
> being stale by the time the caller gets to look at it, which is no
> different from other functions, i.e. falls in the caller's
> responsibilities).
> 
>> +        nr++;
> 
> And then, if already abstraction is wanted, wouldn't this loop better be
> yet another helper (macro?) in xen/list.h?
> 
>> +    return nr;
>> +}
> 
> Finally: If this is to be commonly used in several places, having such a
> helper is likely fine. As it stands, the sole caller is an __init
> function, and hence this is unreachable code post-init (which while not
> formally a Misra violation in my eyes effectively still is one). Aiui
> the same can be achieved using rangeset_report_ranges(), with a new
> (__init and static) callback function.

Moving rangeset_count_ranges() to rangeset.h might change the situation
slightly, but I'm not aware of any other potential callers so I'll just
use rangeset_report_ranges().

