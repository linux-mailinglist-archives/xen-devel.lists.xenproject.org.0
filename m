Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 627ECAFF619
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 02:45:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038820.1411010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZfPD-0004qz-84; Thu, 10 Jul 2025 00:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038820.1411010; Thu, 10 Jul 2025 00:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZfPD-0004ns-4p; Thu, 10 Jul 2025 00:44:55 +0000
Received: by outflank-mailman (input) for mailman id 1038820;
 Thu, 10 Jul 2025 00:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noSJ=ZX=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZfPC-0004nm-4M
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 00:44:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13dceaa0-5d27-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 02:44:48 +0200 (CEST)
Received: from BYAPR11CA0099.namprd11.prod.outlook.com (2603:10b6:a03:f4::40)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 00:44:41 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::d8) by BYAPR11CA0099.outlook.office365.com
 (2603:10b6:a03:f4::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 00:44:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Thu, 10 Jul 2025 00:44:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 19:44:35 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Jul 2025 19:44:34 -0500
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
X-Inumbo-ID: 13dceaa0-5d27-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K90zlSnwDxuFYZBqBSHXUROyMm09+7i7BqQy3BQsg/NW0z99sFFZHLyhLduqp7DHBYsvXt/ScV8pHZ/7AMuCbwARAxUnmlk42MJjRSorvq1+f6s2Tbzvjne+zpZdcDmMEv/qNCVQzwmNmYL6SbK3ngPUkW4nzY7U9SVNKRbt2kJpbbhJox40yTuQPvTNxpdY4RHoVDFz7T7CrKJlGsb/G5DOOBNlmUs7bl3XvGuPtIYLZUSCoazjqM7dnDuRv27N8b57M7w2/qvbzfSdW9xw4hyPsNkeIKQX3XFwOhCohOrNJYnndW+m6pUgg4FqLx6hlVLo0sTfvnDIDQLP4fr5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCfy0EXIafx1MzqJ7NGPfOKmlnRjSlLShl0UjTFHOgQ=;
 b=xsIhg85NZzjG/mQPUy0QaUj3zyzAz+OdztZBwk9fRbENu9I4hXXe+8dCuunFziARpstUQ5dvaRpaC5dmU67m3jUcJy0GizltwRyCcS0Im52bWpo/8ltxoMktci98qb1GNulIqQosnfeTmxazAaqgXk9ak4WgaMaiWU9n8AJ5OH3OgZ3+JE1l0ylKjMMDfpXULkMC9rm0p7j6wo5OGCo74MdEZJCzysWAAIWPIdS3k+NRYFeC/AAxnhixdRrdKLVNKeIldVW19mLpMWRN+VaFCcG7FB6trwdZo4hAPQiTceANx1j2RgcUBoJyTyUWHIEQiBTRee18DakNlRW3C6aAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCfy0EXIafx1MzqJ7NGPfOKmlnRjSlLShl0UjTFHOgQ=;
 b=EXciMz3fbGs+J5gFTBuO4IvZSRJm8YiHpIxV6QZ+O3Hrz4VsOvJDYQhMy8wxMOs23BMBLFYAaoDWbUPNBt6ZXpcICt/zwLuWSisQa3MQFfLQvcEAldrAbramv2HvRD0jQewjY7tD10LqX5X406IibcrflthhSmJSeabWsSyL4z0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Wed, 9 Jul 2025 17:44:33 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <alejandro.garciavallejo@amd.com>,
	<Jason.Andryuk@amd.com>
Subject: Re: [PATCH 0/2] Xen real-time x86
In-Reply-To: <b81d7bf6-6254-4001-89f3-3ec06e03e21a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507091736520.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <aGzu4A_nk3dAScxt@macbook.local> <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com> <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
 <b81d7bf6-6254-4001-89f3-3ec06e03e21a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-770006580-1752108275=:605088"
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f721c0e-f663-48f9-0bd0-08ddbf4af4b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aCtHMm5pNlZOdE5aeHNId3NpNThnWE5BOE12SHpnK2pVTkJuRWNyajV0RHdi?=
 =?utf-8?B?Qjg3MjNTRFRqalpUWkRlMU43UkE1ZmpSZ1BoSmpJb2h2eEFzWnd4K1FMQzQ2?=
 =?utf-8?B?NW1tR2cyazVVUllaUHVrZDJnMzVPT0REbHBJNTRJMGVlS3lIK2dBUDVISEg3?=
 =?utf-8?B?MnBLYzVMSDhBY28rak9mZkN6Q3d5STU4aC9NcFFpR2xSRDZpa0k2cVB6MVh1?=
 =?utf-8?B?bjRvTm9iMHk5MTYxSFpSU01WejdUelN2cVdxWDhTZEVCV0lPNDdnSVc5RGVS?=
 =?utf-8?B?Q0h3bFdBVm1GbW5Ud0tPUHFDRjJjYVNBYlR3VmRNVTBuSXJiTUoyTmdyeHF4?=
 =?utf-8?B?RWVnMld4amJReWs1Vkk0TkhvN1dnYllTU2dLeCtPeWxyclFMN1ZXMDEyWTdZ?=
 =?utf-8?B?eUhxWkluQ2tudTdGaEVkdmVNc2E2V2R2VEZxQVBQOXlVREd6ZVZuQ0tYM0pQ?=
 =?utf-8?B?UnRDMzNJTmlQeHdjNlVGZjZ0M040bnhoeCs1clN5MTYyditVb0c2WVdUS0l6?=
 =?utf-8?B?YWZkTGF3SEpYTyt6TlROcGR3UDhlSmVNQTVvSmxQSHlJVlBhUnU0MVdCUVdh?=
 =?utf-8?B?OCtOVmVkNEZSbnZyOUVSSXVLRitLZlk5d3dlYnNnaXhtTiszZGhKYk9Pc2dP?=
 =?utf-8?B?YnEwczFqbFhZRklqQlpLZVZEdVllOGxSWnovWk5rendkbDByMW5TTE4rMldZ?=
 =?utf-8?B?NlhvY1ExSEFoVmYwdVNrSG1HRjBVSnlJbzFrSjZrdHNmeFlhdGY5QnE0L0ZR?=
 =?utf-8?B?ak45QzNPQ3FQS0VGWVJDbnFHSWh6SDc2WSthUlhMLzduSy9wdGdkUkhHalo3?=
 =?utf-8?B?MFJkanZCZmVNazI1dU9IVlhMeHZOLytuRDAyNWdlRjhIQjltZFRmN0J5WXJS?=
 =?utf-8?B?NVBUMXBxeDFFQWtIOFArNG9VamZkQ3huNzZpK2daSk0rU0wxT0QxT296OGIy?=
 =?utf-8?B?TzNOYnFVa3Y5eEFkUWxHL2FLc3kwZUpFK3JEVkFyY3pOcXBoREpOR1I0UjF0?=
 =?utf-8?B?R0o3MlJRRStWVDhIcEp5U1hqUVVHaWg5Sko3OEZUbE9LbStQbEgvK0NJd0Uv?=
 =?utf-8?B?VWRSQjNQWDhxK2taeE1CZkJ6Wng0bG10MEpPUU5UNXlVYWV6dDhTSTFOVlRo?=
 =?utf-8?B?QkY2REszUU5ENUswZjFKWTlpQ0NVUU54Njd0UWdhM2d3TVFhQ1JENmFnVG0y?=
 =?utf-8?B?ZlpMK3VKRkQrM2pqelpsYmlYR3BNc1lPbEtTV1hUVDdmTVFqbGE5UHZ5UXo0?=
 =?utf-8?B?aGJDd2dtdnpsSk11bWhSVm5JbDhjbDRwQStNRmswMjVkZmc3RW1aOHJKd1pq?=
 =?utf-8?B?ejdQakZJdzB6QVdkNXl3QW4zZ0ZzTWZadTBGZWRSU0JVSkRRRTdUZmVZanF1?=
 =?utf-8?B?THl1eTdoTnZSbkVxNVF0bXVuNDBPZE1XcWpUWXgvYndqaFpqSGRnVEVoVjUw?=
 =?utf-8?B?Ylg4ZElIai9yS2FNNVJmNDNrYmx6dUhSM1BIN1NIdklTRzF5NDZEZ20zRTRH?=
 =?utf-8?B?QjVuMmlTS3hSd1k4bjZpUHpTUnY4aXk3Y2N2VGNQRU1rYlNDYVZzenNoSk9r?=
 =?utf-8?B?cXJuL0lRRGxjVndWcGREVnkxRGtpblM3SzNjMlJuOFp6RE9xbk9aOGhXZFJl?=
 =?utf-8?B?d004L052TWdvNDd2cFFMQWEyVDhLYzNrV0E4K25STHNpdVdwUkEwWHQxMHQw?=
 =?utf-8?B?NDU4MWd6WlNXdXNwU05Ydmk4cld4a3JXUm8rdk9ucmJlQXFlR01VdUNPRDNi?=
 =?utf-8?B?RE1Cd091d3ZOOWdlOTBDaTNhV2VXbnlOOHgvS0p2VXA5akZ2TlBMdENKSE1o?=
 =?utf-8?B?UG1iekUwcG51eXhYK29UWTd5clhsSWRHK3RUSnNPZDVRa0dUa1ZyUnNudSth?=
 =?utf-8?B?MFNnOWJZbWk1Zk1ZM1VENkdsTjJaU1hqclJZOWxRNXhFTFliWVhCb25ObWha?=
 =?utf-8?B?a0dmbTMyWXQ1djNhaWdCNGcwWE1nbkk3T1RBdDREcEdTb0trS0JqUFBaYmNp?=
 =?utf-8?B?T0drNitOLzBpTFMrR2RWbG4zZjJaZjFZTE9aNDB1ZUZ4ODVPWS9VRHF4MDZK?=
 =?utf-8?Q?EPRwvb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 00:44:40.9184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f721c0e-f663-48f9-0bd0-08ddbf4af4b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835

--8323329-770006580-1752108275=:605088
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT

On Wed, 9 Jul 2025, Jan Beulich wrote:
> On 08.07.2025 19:11, Stefano Stabellini wrote:
> > On Tue, 8 Jul 2025, Jan Beulich wrote:
> >> On 08.07.2025 12:11, Roger Pau Monné wrote:
> >>> On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
> >>>> Hi all,
> >>>>
> >>>> This short patch series improves Xen real-time execution on AMD x86
> >>>> processors.
> >>>>
> >>>> The key to real-time performance is deterministic guest execution times
> >>>> and deterministic guest interrupt latency. In such configurations, the
> >>>> null scheduler is typically used, and there should be no IPIs or other
> >>>> sources of vCPU execution interruptions beyond the guest timer interrupt
> >>>> as configured by the guest, and any passthrough interrupts for
> >>>> passthrough devices.
> >>>>
> >>>> This is because, upon receiving a critical interrupt, the guest (such as
> >>>> FreeRTOS or Zephyr) typically has a very short window of time to
> >>>> complete the required action. Being interrupted in the middle of this
> >>>> critical section could prevent the guest from completing the action
> >>>> within the allotted time, leading to malfunctions.
> >>>
> >>> There's IMO still one pending issue after this series on x86, maybe
> >>> you have addressed this with some local patch.
> >>
> >> Not just one, I think. We use IPIs for other purposes as well. The way
> >> I read the text above, all of them are a (potential) problem.
> > 
> > Yes, all of them are potentially a problem. If you know of any other
> > IPI, please let me know and I'll try to remove them.
> 
> INVALIDATE_TLB_VECTOR, EVENT_CHECK_VECTOR, and CALL_FUNCTION_VECTOR, maybe
> also others in that group of vectors (see irq-vectors.h).

Thanks Jan, I'll look into those.


> > One of my goals
> > posting this series was to raise awareness on this issue and attempting
> > to fix it with your help. It is not just IPIs, also Xen timers and other
> > things that could cause the guest to trap into Xen without the guest
> > knowledge. Typically IPIs are the worst offenders in my experience.
> > 
> > On ARM, I have done several experiments where, after the system is
> > configured correctly, I can see that if the RTOS does nothing, there are
> > no traps in Xen on the RTOS vCPU/pCPU for seconds.
> 
> Being quiescent when the system is idle is only part of the overall
> requirement, though?

Actually being quiescent when the system is idle is not a requirement.

The only requirements are:
1) quick interrupt injection into the RTOS
2) the RTOS must be undisturbed while executing the critical region

1) mostly means that the physical interrupt should be delivered to the
same pCPU running the RTOS vCPU. Otherwise the extra IPI causes unwanted
delays.

2) means that the RTOS must be undisturbed when executing the critical
section, which is typically right after receiving the interrupt and only
last for less than 1ms. In practice, it means the RTOS should absolutely
not be descheduled and there should be no (unnecessary) traps into Xen
while the RTOS is executing the critical section. It is expected that
the RTOS will run the critical section with interrupts disabled.

That's pretty much it. If we get this right, we have solved 99% of the
problem.
--8323329-770006580-1752108275=:605088--

