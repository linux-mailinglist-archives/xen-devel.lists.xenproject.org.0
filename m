Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2538AD3B06
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 16:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011004.1389281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzpJ-0002Ej-CI; Tue, 10 Jun 2025 14:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011004.1389281; Tue, 10 Jun 2025 14:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzpJ-0002CS-9a; Tue, 10 Jun 2025 14:19:45 +0000
Received: by outflank-mailman (input) for mailman id 1011004;
 Tue, 10 Jun 2025 14:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghGr=YZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOzpH-0002CM-Tc
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 14:19:44 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f27a07c0-4605-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 16:19:42 +0200 (CEST)
Received: from MW4PR04CA0134.namprd04.prod.outlook.com (2603:10b6:303:84::19)
 by CY8PR12MB7634.namprd12.prod.outlook.com (2603:10b6:930:9d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Tue, 10 Jun
 2025 14:19:38 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::b3) by MW4PR04CA0134.outlook.office365.com
 (2603:10b6:303:84::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 10 Jun 2025 14:19:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 14:19:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:19:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 09:19:36 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 09:19:35 -0500
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
X-Inumbo-ID: f27a07c0-4605-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKbDpDFpa0LB3lpXOQoGv2ssPFknT1IepbJdN9V8TjrjT6t9MBiErdVe/qbvSuro6t6WM65hsjVogZqeI1TwN430VFnB3vKqFNLIOXUUyPOReggqPLfZF2j3dYH3m/Q8+7/2jLTKF/N0k6xwzFB+Dx8ZM+az7s3KwEnLeui0oAJ6mfn7XB5MimlondfpYBz/5YpLZOZkjrgav193dJxA7hTdOU2b+K1VYiIeKIurGhx8JVXjnUugqKRW78OqbcMvSN8YkGGQyR8faIC6F4es5F1dobutxkey6E9zj6Ch4aLxXikvgBCKpd3dV7uGpreXNK/S6Jk/UfY6AQOOa8s8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdhbKJJ0w+OYpWulNbyiqaGhEat653rrXsmKv12Sbt0=;
 b=RKC/8Nh2Tr4Ti78aYcrYsqD1Pe5sMO4QPqzu9A1OYbOWC6ispNDzyVqzoxxajL3cJc+elx6JqeNX9wVPkIANrWzoF0ecU6k2MPs7ULOYfvk7fMubTeffwGV7kMIvUOMzDFC4AvURHmJbk+eOPSZvxV+KPskqXYU5crB4kjghGjXZ31iZjPaGnH6D2cdx6iXaO3l40Dm/zb805djcFyfaMc3/8ThojzHJxh8B6hYndbodDp2jtM/9vgavys5TUsZP2bqHUa07nXSrQ1zihKAbjjt+ltzVx30i1ohvuYnhCarFpO4eAOKB7sUoVcA/viMIJI/D8Qg2lr5ptuO33FPedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdhbKJJ0w+OYpWulNbyiqaGhEat653rrXsmKv12Sbt0=;
 b=SnEGnY+0av645IO/MisfrvF9J70VOt7FFrZHbYT+zGua1tz9jbwJtJhTaUUcD8L6Rt1sQXdVE3eEgUGImWjRBE6RCb8AJ+v11ZA3OwikagsXvTfc+xax3SUSULvNsOH0beWOV1wics1JeO1ljMawnHQFRGE9QYLux5OjHw638gU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6339d154-cb92-417e-b2ce-ef91ebbb52eb@amd.com>
Date: Tue, 10 Jun 2025 10:19:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix build with HAS_PCI
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20250609205422.180717-1-stewart.hildebrand@amd.com>
 <cdaa3471-047d-4c79-9b4f-b57b776bfc34@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <cdaa3471-047d-4c79-9b4f-b57b776bfc34@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|CY8PR12MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: ba07c1c8-eb9c-479b-d9fc-08dda829d50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm9sNy9yK3Q1U05iY0RISEtmc3Jia1U0cFh4VzNwODZpMkJZb3MyZUdjbE5B?=
 =?utf-8?B?Q3dKM25sbzBZNFZ1ZGZoakVtTTFmNXBVYXhzSVd0RUdyaENDc1BTc1d2c2NE?=
 =?utf-8?B?TzlRMnZZWFB5cExVcG1ZRnUrVXQ1NFFpRXEzMWljUlJRYTRRRjlHWVdkb25P?=
 =?utf-8?B?YjE4dEs5VEtYd2NZemdXY1BHZTRUVHJVU0poSjlraUJDSGNwOWwzVHdpZXdk?=
 =?utf-8?B?SCtuaEQzOWJpWlc3MVFQNnl2U24zVjhodjMvOHR2R2tVM2ZTcUVJUjgyZjZs?=
 =?utf-8?B?NnhvVGNtZVFPVi8zZWx2cWN2RUNCbmRLbndMZHJLWk56SjY0bXAvaEMwSDYw?=
 =?utf-8?B?cjQvNktnd2htSEh1amZTcnhLSk84VmY4TlVjd0poYllMNC9tSWZ3NHczYWFP?=
 =?utf-8?B?TjNzSUJmNnc4QVR4Qm5IczBPSFcwblRoVEcxc1E0Yk1pMFc5cHgzdEw0TzhN?=
 =?utf-8?B?VFRRTHh6VGdzYW4zUHVPWTNHUXdxblZaV3VESFExY0ROWjRSZkZnVDZGQVVM?=
 =?utf-8?B?cVJONC8zZjlWTitPNWlRam4yMnJ0UmVOcFNKZ2lmY09ac0pWcjJRcFpFcXRU?=
 =?utf-8?B?eVRhaC9uSi8xM082SUdwb3RIVWZMZ3h3QUZOUjhudnZjSnROV2VXKzZZcDJr?=
 =?utf-8?B?WEx2SUdjUHQ2UTlQY3l4QzdLUnhnT2d1V0V5K1ptcm0yRjBtSzAzdWNFSldq?=
 =?utf-8?B?N3pUc2pRajY3Mnc5OTk0WS9tditZVkI5Zzljay9vRFVQcVN3Z1lHU1o4UXNs?=
 =?utf-8?B?SXhFT2VrNm9kRE13KzM0RXpNUUlOaEFjUzNoY254T3JPOXpmSTIwTnZXdlkx?=
 =?utf-8?B?bzFTS1dyRTJZWm1Ibi9PWklTN2FQVlBuaSs2MW5xRnR5YTNTTG1NWmt2VmVt?=
 =?utf-8?B?V281eDVoalZsc21LOGpHZ3R6aUxGMHNJdWs1NzB6SnZkZk5iU0VnUUxBaldU?=
 =?utf-8?B?WjZOL1BHOHhUUmttOWlybTdZSktvUHd4N0hVWjU4dUtqNUppR3Fma2FiOHNC?=
 =?utf-8?B?TU9Mei94QXZIT0w2OEhzWWI4UGlwdnNKclF5ME8vY3V6MUVNS3lYZml2ZWtk?=
 =?utf-8?B?QVRmVTFxR0RKdnVHNDNhL1V5czFLSXQ2bGlvOFhZVHEwRFdIdVpscjZkRFo4?=
 =?utf-8?B?NExhMExjM2h3ZnBpWkVmNGxRQnlMRzhmV2tIbjV1ZEpHeFllVlZ3M05CaHM1?=
 =?utf-8?B?eEFYRVRwcHNja3N5QjBmbFU5MFpMWkJaeU1Ia09rb2Q5RnFGc3kvb3VJaWxU?=
 =?utf-8?B?bTFzWHZ4aXp1WlJPOFJpbDhKSmxRWDk3OG0xTWRWczJINkt2L0VRNEtUUnVL?=
 =?utf-8?B?WWdLcitTbmhSNjg5VDJyL0xiMXFlUHVuaWJSMjNTeGgzWnN4VSs4MkFWUDQz?=
 =?utf-8?B?d01HNytNOGJFdFptVm84RlRlaEc2SmxQSlZvUnZsbnZMMHlKTXBROFg4ckxF?=
 =?utf-8?B?QmphdittTnFpWTJxaVNYUU5EeisreUxnUXlZK3BKd1RyM1o0U1JSK0pLTHd4?=
 =?utf-8?B?YmlVeVJvUjBBZmNEeVdvUjJNdnBBcWFDQnBYRWoxNW8wNXJhSUdHWCtZTEVW?=
 =?utf-8?B?SDdWUHlsR1NjTWw4NGVKd3lwaUE5T3M0dEtxT0xMNGtHQ3IxOUd2am9JdVlr?=
 =?utf-8?B?cVFPR21OOTVwT1JIMG5qRm5heUJZSTJjOGdmY2d4VThBMTd1blRPMk91WmFa?=
 =?utf-8?B?MEZQSDN1bU4rZThLbEZESFlqSWh6WEUvZzlsOTIrMUJNVHd1cDRpNHZwWGUv?=
 =?utf-8?B?WGI1M0RKdFJGUTBkU25SNk9SemN6MHFWL0NJM1F6RGRyRDVIZ3dwdzhHWldR?=
 =?utf-8?B?WkxJMlFXQjRHV3lIaGxKQTg0ZCtkRzJmRll4N1FuNjRsN3BhdkF1VUVNcXFW?=
 =?utf-8?B?Y0xqaGo3WkZ0eXh4dytZdzJHVFVUMDlKaHg4U0ZLdno5VDJQQ0xDaXdpNmh6?=
 =?utf-8?B?ZGc0eDVNWFJCd1lnb3ZEUVJoRVJ1ZE5iTTlRNm9MbDNUQjZvSStjSTBoVEVT?=
 =?utf-8?B?R1JqbnlEd3pIRDlCaTJhdjJ0MFRhYmlqUUxMQXQzVXNISHdhUHZTcGJQRnV4?=
 =?utf-8?Q?F7QNKD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 14:19:37.6857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba07c1c8-eb9c-479b-d9fc-08dda829d50e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7634

On 6/10/25 02:42, Orzel, Michal wrote:
> On 09/06/2025 22:54, Stewart Hildebrand wrote:
>> In file included from ./include/xen/pci.h:72,
>>                  from drivers/pci/pci.c:8:
>> ./arch/arm/include/asm/pci.h:131:50: error: ‘struct rangeset’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
>>   131 | static inline int pci_sanitize_bar_memory(struct rangeset *r)
>>       |                                                  ^~~~~~~~
>> cc1: all warnings being treated as errors
>>
>> Fixes: 4acab25a9300 ("x86/vpci: fix handling of BAR overlaps with non-hole regions")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>>  xen/arch/arm/include/asm/pci.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
>> index 1605ec660d0b..1bbb9d780193 100644
>> --- a/xen/arch/arm/include/asm/pci.h
>> +++ b/xen/arch/arm/include/asm/pci.h
>> @@ -17,6 +17,8 @@
>>  
>>  #ifdef CONFIG_HAS_PCI
>>  
>> +#include <xen/rangeset.h>
> Just for the struct, I think it would be better to forward declare it (at least
> this is what we recently started to prefer). Especially given that rangeset.h
> also forward declares it.

Forward declaring it does seem better. I'll send v2.

> That said, I don't find it mandatory, so with or without:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal

