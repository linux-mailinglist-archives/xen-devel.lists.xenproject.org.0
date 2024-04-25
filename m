Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EA48B1828
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 02:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711743.1111958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznGi-0001vv-9B; Thu, 25 Apr 2024 00:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711743.1111958; Thu, 25 Apr 2024 00:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rznGi-0001tV-5F; Thu, 25 Apr 2024 00:47:20 +0000
Received: by outflank-mailman (input) for mailman id 711743;
 Thu, 25 Apr 2024 00:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HNrt=L6=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rznGh-0001tP-4G
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 00:47:19 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d1678d6-029d-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 02:47:17 +0200 (CEST)
Received: from MN2PR15CA0029.namprd15.prod.outlook.com (2603:10b6:208:1b4::42)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Thu, 25 Apr
 2024 00:47:12 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::db) by MN2PR15CA0029.outlook.office365.com
 (2603:10b6:208:1b4::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Thu, 25 Apr 2024 00:47:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 00:47:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 19:47:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 19:47:12 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 19:47:10 -0500
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
X-Inumbo-ID: 5d1678d6-029d-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hx4y0cQkck54QKHno4dd1Pk2XOXtOYYBQejMIh691pdW0twuveKe1VfByJErrEyTimksgDY3m8LXAeJLcdI0Q3n5FZBtkxj3DfoljMp6YiJQSkWDidW7U4P92gR6zyszQdk3QV0z344WMg/Vyeq/thBb/JcJuIccYUIRltGDzELZcjIK8nQdnVnlrXwPe5juRHV8SBaWqeXydJmpYsqdxX7JFZpcVHd/sHDn8ntVN10HgghzdmM5QrM5dRWyQnn32+2LQOkUPaEhZLo8NwFFrtmOUSK+MB+xQ8P3k78N88YFVTzO93puyNGtZcbHit8/WVee0W3uZgIGLK/lJwCyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFfv8RZhkPH7G7E1cYGaOOgJXaCMxjk0ijb44sCWv+E=;
 b=HAJZYZ9OxwQZCwQsaW2BQKZpSo0gnycuIyarCMbytbvjPWO67+NQ7bBccLM4ArW54gY4TGM2509QzXm1hidJA1x2+2uO26061tFcGiYNA9ZChOLbJhOfanxmJKOdulm/cWHxpIfFvI+g8Jl9ZcXr//y4V2S9MeeVECJRPTciTWvSeuAy5unkYFt5sM/q9BVRAk93xIHlJlCRt6FQow502MO1syDzHUJ4GjXxxpwgyeIKDNaR+BjAgMo3NrN9T+/vg70U8JU0ghyr81hzIDDjPQ3soCMG+vujVBtH09LXKnHrrYHsoI3zUjBWvs+DBCujiUo1GZC2qnTrrWUmuNsjIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFfv8RZhkPH7G7E1cYGaOOgJXaCMxjk0ijb44sCWv+E=;
 b=R2kNXcREvpHsfowuzOehkMXt8PGE2KQ4wRA8fhOsNbeDxi05/cFXPXa2P2ixU/dNhKiLL6PsIX1BwVhOPTqbRJvY0bzt7gazJgKNBtBQbD+wtzq4swZ1SgHFmYfkr3I6Dfqtso8KB4MEt6chwuKsgXC321ahJdyYA5HRFsBCrHU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6c486645-4ec2-425c-9694-5bb381cf4ecd@amd.com>
Date: Thu, 25 Apr 2024 08:47:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] rangeset: Move struct range and struct rangeset to
 headerfile
To: Jan Beulich <jbeulich@suse.com>, Vikram Garhwal <vikram.garhwal@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-7-xin.wang2@amd.com>
 <5bb872fb-9973-4ed9-a463-1b1a873d4a46@suse.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <5bb872fb-9973-4ed9-a463-1b1a873d4a46@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA0PR12MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: ac552022-4110-4721-47c0-08dc64c13ef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400014|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WE9pNW5ENkdaTUlJZzJ5Q3FXWjVjNW54Y0hCU2k0WWU1bm9VWThQWHpMSWJB?=
 =?utf-8?B?UzhoQ0lNLzUrRVJFUW93bGVnOFZsVExDYmRZSUZwdWJrTEtCdUQrcEN5VUc4?=
 =?utf-8?B?c1FRUXZOQTlEK2w3TnhaNWFXeDF2M2pUVW1HWkY1cXpuYytqWWNJNW04bXpt?=
 =?utf-8?B?K1FQRVd4aWlJa21aZGNzMktZTjM2d0dkZWZma2NnaFRJVnAwckpMaEZRaWFz?=
 =?utf-8?B?M2FjT0VERlNRN2xvbkNib0dURDdQOGxZVGhLY2d2SDQ3VjlQQ1N1SzYzYkFp?=
 =?utf-8?B?Z2hXSU16bXgvdFFQOXlUb3FqeWFRQ2lKeTYwL0Rwd2FCWWo2Y29wdk9TZVpC?=
 =?utf-8?B?NXlld0I0VlI1bit2cWJvUHFyMUI1Q3YzUFdpa21Hb1JuTTkxRVVTWWlCb0NR?=
 =?utf-8?B?MTJkWWRMajBNNXNDdHYrMDNEdWE3VE5FTkNWQUlybUJyWTQ0TlRWZTFqYTdD?=
 =?utf-8?B?L3FoRjBSc1M5Z1FqMmlUb3NJbFR1SUVaeUJqbzRtSVRhRnc3WnZoQ3pkSGlD?=
 =?utf-8?B?TTg4NEYrVnpISFpQUitGTHFYMWJNd2JPN1ZCU28vQWVGR1hQRXJQUURTalB0?=
 =?utf-8?B?Z1p4RWUvVWdWQ2J6MXBYYW1FU3EzVElJSU1WbDg5WHJWNjBmcXpIRlE0MXNV?=
 =?utf-8?B?cXFvRncwWFNoYlZJQ1VZR0RWeHdteVJSaUFNUDVZUWJQUU1mQ1JKQVZ0UGlQ?=
 =?utf-8?B?VmxTeDV6OS85VzZYc3NpNUpQeDl4N2JOOFlwU1R2UnBjTlp5bmZ1ZjZ4U2lk?=
 =?utf-8?B?dEtWRHAxdWJSUTRQMHN0K1g3alBYSFZ3eldLVXNIMWZyU3FmQ0RWV29hWU1x?=
 =?utf-8?B?UUpKTWRrZ0ZPSW1lZXlSK05hZjBpcmRTMzA4ZGN1K3VjWHVoYzNFWkpvaHdU?=
 =?utf-8?B?c2lLc2c5ZGVVM1VMcWdQMGVzcHhPRjJoZ3pDVlNVSDFIRXVRQVRwRUVXMm9Q?=
 =?utf-8?B?TlpvZmpITHZJK3FURlllQ3l3ZHBkMjhiMHFlZE9ESVVHMVpiN3FBSU1qSFRa?=
 =?utf-8?B?RFdrSjNzYWcyTktNeForaW5uZ05lcnUwRWsrOXQ3REwrWnZZTHF1aEJYRkpK?=
 =?utf-8?B?LzNYeFpTbGcrWTdqY0lsZENmbG9rbW53S3NkejIyYUFwczhsMnc0V0NWYW9z?=
 =?utf-8?B?LzZQMUk2YmxJUDBLa0h1cVViQkFZOXltSHJnSzBreERHTGR6bVRYOWRZZlQ4?=
 =?utf-8?B?U1pnM0YzVGpCMWxremV4Uk9FUldWdkJNRVA3cDdrQ0Q1eU9uZGJaYklUNWhC?=
 =?utf-8?B?bkxkV1M2Y1dFTWpUR2FadnZjUlJiUFFjMlRoN2lETWhCTXdlWWVOQkJuR1Bj?=
 =?utf-8?B?RE9mbHVHbFRia3NINWY3U2t3a09lMHBRL1ZVL0RZQ1h3VmJiUlY4dGZBVnlk?=
 =?utf-8?B?TVFKREZOQlJiNnZiVWw2VlBNSTh2dkFDVEl6NjRqVDduQTY5bkd6R1dFQlho?=
 =?utf-8?B?R0ZneEZhWkRpbTJPbFNwNFBUVmVnY0w2RTg4dDBSR01JcE9Ja1VOOTJ5Sm9k?=
 =?utf-8?B?WFNlejlBRS9SSVJpaCtlZVJ1Q0hHTjdjUkpKbHluZ2xwbllQOHRLS2lFbWZZ?=
 =?utf-8?B?dEVRbTZRWkNScERaSVV1QTJ2VXo2SVlRV0tnRDFFeG5pL1B4amN0RFNJWE8v?=
 =?utf-8?B?T1F5YnV1RGpWa0dTTGYwUE1ldW00aHpHaEVPc1V3dXhtZWpabWhhclBSckdi?=
 =?utf-8?B?MGl2eCtJZ3NZb2lHVVp5djNNbXl1dDhYTUgyekYyRUwydkdnK3Y5U3E4OSti?=
 =?utf-8?B?RklhR2hpT2IwbTJQbHFIa2REbHhxa0lpSERWdjZIOHptR1psQ1VZZ3c1Q1B0?=
 =?utf-8?B?UE9hRm5IMFlBZVp0WUlHelE3d1I3dkN1QThFZmc3UTdCYTFhMUZmS1p4clhp?=
 =?utf-8?Q?t731sbuqSBMly?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 00:47:12.6830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac552022-4110-4721-47c0-08dc64c13ef2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698

Hi Jan,

On 4/24/2024 2:22 PM, Jan Beulich wrote:
> On 24.04.2024 05:34, Henry Wang wrote:
>> From: Vikram Garhwal <vikram.garhwal@amd.com>
>>
>> Move struct range, rangeset and removed static from first_range and next_range().
> NAK, for going against what we do elsewhere (limiting exposure of internals).
> At least as long as the justification isn't any better than ...
>
>> IRQs and IOMEMs for nodes are stored as rangeset in the dynamic node addition
>> part. While removing the nodes we need to access every IRQ and IOMEM ranges to
>> unmap IRQ and IOMEM from the domain.
> ... this. You're aware of rangeset_report_ranges() and rangeset_consume_ranges(),
> aren't you? If neither is suitable for your purpose, can you explain what you
> need in addition?

I understand your concern. I will check if I can refactor this patch 
using the suggested helpers. Thanks!

Kind regards,
Henry


>
> Jan


