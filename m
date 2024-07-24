Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DC693B7F9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 22:24:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764495.1174954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWiWt-0002ue-GK; Wed, 24 Jul 2024 20:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764495.1174954; Wed, 24 Jul 2024 20:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWiWt-0002t0-CK; Wed, 24 Jul 2024 20:24:07 +0000
Received: by outflank-mailman (input) for mailman id 764495;
 Wed, 24 Jul 2024 20:24:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i70y=OY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sWiWs-0002su-9o
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 20:24:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9f9b1c-49fa-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 22:24:03 +0200 (CEST)
Received: from CH0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:610:b1::10)
 by PH7PR12MB9203.namprd12.prod.outlook.com (2603:10b6:510:2f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Wed, 24 Jul
 2024 20:20:55 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::6f) by CH0PR13CA0005.outlook.office365.com
 (2603:10b6:610:b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19 via Frontend
 Transport; Wed, 24 Jul 2024 20:20:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 20:20:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 15:20:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 15:20:54 -0500
Received: from [172.23.111.139] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 24 Jul 2024 15:20:53 -0500
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
X-Inumbo-ID: aa9f9b1c-49fa-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdex6aqGwqsVMLmIGMA080hxDmM7SmLRc3wqAbrGi9znHcFxEB9VDe3lYjaDdIAfjhqFpzu59r37rFgBqXwF80mdBl6mtrAj6bn4wEesUuC9Ib1wecNtYfadV+YLmScQ8hlqEDDvkPe0IV5hm6zb13SbsjbfKiH3/Eni1W4TPiXo49w0kFktwQhpsrTx1X+uLuO5qb5sujI30xTKSpWIvz7BYcqIcLAxrVPg31goU/7INXhovC4ATWToNu2fZ8IDZYXaGi/hWsA3C1ylGIe+ERjYmdPYO3q2H9GnH3nYJocfjy3Tlf5npctedJ4RRX3KXBkTBmQ/klAfvh+uD0SR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qt8PFUHR0NGaLcUJDI79oVJqQ29PrPLiklg/4GNIWLQ=;
 b=SKW1TymZthpa06nbiTvXYjPgbI0LFVUW17glAKsk2nf2HorkgA7ErcK2r7mrJkzBQyxbLFGhtqPzw2znhDnMVAshDLddQOE0Era8oMfUnBw6cSQY5RJM4P2Qms5hLwhr6fQrfKP3Va5k/voeCh1rO5aGRd8Z+eZ5xbPxTdh8KaS/W9721AA+/p0b1U0F7YaqCQY8NEY55ska9dP8PWRFLvuZN0QdM7ttEOGfo2u/38/ziCua9dGjJOg7PlGBtWR63s/GUHd75y4h8POMoRjJwVbLGon2lGLHmvW9IXv2K0jlhlXd7g5Ma82iM3JyeodFifgbFyqindNI6Q+455u/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt8PFUHR0NGaLcUJDI79oVJqQ29PrPLiklg/4GNIWLQ=;
 b=oEfs6AIlTG3R4ZlTeWvQoC4C+3Vzep4MJ5d4MUllGkXc1xNyQAAHgb47D4t9kXkp/9BTnS5xcWKlbTfG+tuQoHucxYp3REwyR5y7CPUk7vi40CORiQ974snAmF5KSLVkyN75mDLS3le2SK3XUrtvHNqW5h1cn9Sj1YOus/vPL/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9be5b78a-211c-4859-a56e-30ab414c99fb@amd.com>
Date: Wed, 24 Jul 2024 16:20:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] automation: add linker symbol name script
To: "Lira, Victor M" <VictorM.Lira@amd.com>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	<roberto.bagnara@bugseng.com>, <consulting@bugseng.com>,
	<simone.ballarin@bugseng.com>, <xen-devel@lists.xenproject.org>
References: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
 <4468a02f-4d8c-4b94-8af6-cd1751cd0a89@suse.com>
 <8fa38784-ba85-4675-9fad-39dd97652bb6@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8fa38784-ba85-4675-9fad-39dd97652bb6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|PH7PR12MB9203:EE_
X-MS-Office365-Filtering-Correlation-Id: 77267993-06e4-4423-96cf-08dcac1e1f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWlpWTRlN05XdFZRNHdKSlhlcFVQZEJUQ1ZyQlQ3K1JFU05pUkZYNHFHSEtJ?=
 =?utf-8?B?b1JELzZRM2F6N0pHWkw5QXlOYzFKd1dlaWpUbDE5dDJXcHdpRG83RDF6bEV1?=
 =?utf-8?B?Q2tEa1BBUW9ERVhsK3EvcENEbEdkVUV4MTJyS0U5aTkxZnhVOXJ0UnlJSytu?=
 =?utf-8?B?M1d3Qmk1ZGp0Z1JlbkcyR0lKRWlnNm9yQTRoTXJlRmx6M3JtWFJDWjJ1K0xW?=
 =?utf-8?B?WklUT2htb25QVFp2cW4xQXRuWkpjYk1ZcVpLSGJmY2t0T3Y2NER1cU5POUE0?=
 =?utf-8?B?ZGlNQ0ZCWVNDekpidFNoeVJ5NmRrbnUzVExFcGs0cWEvMTlCWVd4cHFhZThZ?=
 =?utf-8?B?NFJ4VW5ocWRuaDRORTBaNENZREpaY096L1llK1VqUUZRSytTQVY0aXBscUEv?=
 =?utf-8?B?U3YxNjMzYndjbjlZaXF1clNZVC9vdU5BbkcvUzNwMitoc0pvenRVeExIa1dN?=
 =?utf-8?B?Y1FvTm0zb0wrYm1EV214YURmQjkwcDVsU2tkR0luaUFwTVVCcHNCZ3g5VmxK?=
 =?utf-8?B?QW9NZVhjMlRydTJRYWdwajZMNlBFYi9VYlBDREZxcXBySCtMZVVhaDBVWFlr?=
 =?utf-8?B?RTAyc3NOTVN4TGpIYThNeEZBM2xnK0RNMm0rd05VSlBXenAvSlZzelMxYVNt?=
 =?utf-8?B?NE5PQ2ttUHN3aUJLeGF0Zml5a2FHeGtyVERJVkN1K3IzSlk1bG9JS3Q1UDho?=
 =?utf-8?B?MFNPVStCRlQ2M0ZFNWdMVWdEUVlUNXhyK01ZRHJ0NlRWcVE4K21IcnZ1Y0xQ?=
 =?utf-8?B?ZDVUUlhJR05HRUNWNzhYbUpzcTNBRXRsWEJROEVKYlhCSmgycXBvaXhkMFlW?=
 =?utf-8?B?YkJ1Q0NBaHdWSmtQUEk0bzhkMkM0M2ExcVVYeE9ZeUZUOFZwT2tEalQ4MVM4?=
 =?utf-8?B?YWFINE9vUGg3L1JTVjVBdysyaGh5TEFjUUJCaXJkT2pscE1TZnhycEVwWE9M?=
 =?utf-8?B?SSt4cmhQL0Z0R3BmQlk4d2tmYmpRSnViQUtzb21OVzUyV1pEbDZTYlRUdENi?=
 =?utf-8?B?b3hMSnl6UUtxc0g3UVZpM2pQa29pbnNtSFc1RjZZQm5kMzdyOWtMVENHdUFV?=
 =?utf-8?B?NGlXbERFVkVPbk0yOGV4SUZrVUpqTDgyQTBuTWJyS0tCaEFkT1FmaWw3TDlj?=
 =?utf-8?B?SmIyaE95YVdJa29YdURaNXZXY0hTYmR4LzA3UlFvTVErU1VRK2g0emxYaDNn?=
 =?utf-8?B?YTBrcWh2ZVB2Z253SVRVanNqSGhvZnd6ZXNIV3gwTWdmZUROUkJ1WnJhVVov?=
 =?utf-8?B?ekZwRnMydVoyMnJZdGdDY3lMU0tuVnJzREY3MG8zV05KNHVrSDRxUzUyMklj?=
 =?utf-8?B?eWlENHgzaytMY01tdytCTzArR3haZDEvZnVtTG5tVUNnU0doMGlnazhKQzRY?=
 =?utf-8?B?OTd5eStaeFFhVVRFa0VmRFl2by9DSlVacTlQa3RjbjVBaTIzWnl0QTRhQjh6?=
 =?utf-8?B?YjdmMlFndkNDK0F4amhYL1FRclVSS21BWUJUbmZyeVI5NXE3ejVmc3BGaEox?=
 =?utf-8?B?L1FQZkUrajZ6WWtHbW9Nbk9XUDJuQzhaWkpsQUNzVlc1SDlOamh0eGs5dXZw?=
 =?utf-8?B?WUgvUVE2M3hsVERXbC9wa1JJUnNhSGQrMjZFVEZTYzhqVXR0WHJoMnU4YXNy?=
 =?utf-8?B?UDBEdlA3STA5ZldpSlpIOWtaUEJmUkxIUjhhckJGeENHTXZqc25XcS8wcWpQ?=
 =?utf-8?B?WXlHU1BiWnhVOFdEeGRacTcvY0lSZCt5YkpuMGp1aVN5MGM0QkVMKzFldXh3?=
 =?utf-8?B?cEErZXI2Q0wyWjdIQ1lxTlFTL05HVTIraXpmWE56NExBcVd0dHN4d29MbFNR?=
 =?utf-8?B?aHdYNjNHZDZmOC9McTlaZ2QvVm41R2JkakppTWtDeWJZOWptQ2M3TDAyQXFL?=
 =?utf-8?B?REFQWnZ2MHpWWHp1N0pyMXQzaVYrUVY1b0JxeCtuVk56Wm5YZ3hnV0JWdFp1?=
 =?utf-8?Q?czznVLB5+B4tg4xqxGgu6OmT8xoxB5bO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 20:20:55.3569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77267993-06e4-4423-96cf-08dcac1e1f58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9203

On 2024-07-24 13:48, Lira, Victor M wrote:
> 
> On 7/24/2024 12:44 AM, Jan Beulich wrote:
>> Nit: In names of new files we prefer - over _.
>> +script_name=`basename "$0"`
> I have fixed the above comments in v2.
> 
>>> +#!/bin/bash
>> Can we rely on bash to be there and at that location? As you using any
>> bash-isms in the script which cannot be avoided?
> 
> Are the automation scripts required to be portable? Can you please point 
> me to a resource where I can learn how to make the script portable?

Hi Victor,

You might want to check out `checkbashisms`:

$ checkbashisms
Usage: checkbashisms [-n] [-f] [-x] [-e] [-l] script ...
    or: checkbashisms --help
    or: checkbashisms --version
This script performs basic checks for the presence of bashisms
in /bin/sh scripts and the lack of bashisms in /bin/bash ones.

Since your script has '#!/bin/bash', you'd run it with -f to force the 
bashism checks (or change to /bin/sh first).

Regards,
Jason

