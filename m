Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDEAFD4DA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036930.1409484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZBqx-0002UX-Oa; Tue, 08 Jul 2025 17:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036930.1409484; Tue, 08 Jul 2025 17:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZBqx-0002T4-Lg; Tue, 08 Jul 2025 17:11:35 +0000
Received: by outflank-mailman (input) for mailman id 1036930;
 Tue, 08 Jul 2025 17:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZBqw-0002Re-1t
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:11:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2416::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96dbba86-5c1e-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 19:11:31 +0200 (CEST)
Received: from BN0PR04CA0004.namprd04.prod.outlook.com (2603:10b6:408:ee::9)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 8 Jul
 2025 17:11:27 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::ed) by BN0PR04CA0004.outlook.office365.com
 (2603:10b6:408:ee::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 17:11:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 17:11:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:11:26 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Jul 2025 12:11:25 -0500
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
X-Inumbo-ID: 96dbba86-5c1e-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1SiDVHRXQoZwXwDZ216f7EMlwXckCjFpA976XT6qXxWTEQJUPMHH9u7Kk0sqslG2Grr4e9C8JQeQf96DFAX5zOlYX2mFLoXB8ff7HvFvk/qN22qfE/JCV0r0v+yavZ3fq+UWle3Ly5AN2vNvCf1qBCdZuldCahVUWEDF1gR/wz/yPkGxfqJDiBj6EHsT5HmNBd+uxFPpUYTFoD0yEQfLTcbYdEe00RTyNLX+5BqQXyBjYC2S4nU/zCu/ONMDDDnDNwFT4spgjhsdt56Eq0Eb9Oa/YsYWxQ8VyY2bx46G4aPRvGZbmPlORpS728wUc1hAlP7Podc/4glodfZ+MVSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWOVwSpENCCtzgs6ii1Ee3qC0zEZuFwwEjJe25KXAMs=;
 b=ZRniAkTLWnlUpsAy0K7z2grmiJ9Qd+9lPVjawg2DmN284r52uXvV3eQJRvYeui1KMG1Zatrpb5ebvq1Va+F94RGuv1NXzYAHYRmaHgbbqQd8QPtJfwpZTlF0kUd/S2Qfs6arDXq5qfluhYaooPJQ1JH4sSHlERS6j2YjhjmwEN4LSptV3KSJ2+wDvbENHPFjb1MBUMVRtpn+erxOru4K0vHwiRQa1z4nBI0tJJqVFzAWyCjGib+d6z1w0QJH7Zr1V8B4i7yGlKhb8KAaZkZMNz+6Vx59vi17XdtwSr7DlNOpjKOjZf405b8kPvFyZ4LmlKgmFOmPaGit3X0LWu4Wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWOVwSpENCCtzgs6ii1Ee3qC0zEZuFwwEjJe25KXAMs=;
 b=sphuqLoLmjRJ+WcjoqTjZIIUsg6oote3bLXB9hgz1VYjOTkqNZJA5exeI3AwQ+ewS6xr6g/fJL7RYAMmXTf6GJc2rCHJbjFncblmfb/1Mv0f2nOh0uYylgCHQCyucBuJOKYLlyvVT8Wk2kp0Pro+tVW2cvUz3RVGsdsToQlS0A0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 8 Jul 2025 10:11:18 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, <Xenia.Ragiadakou@amd.com>,
	<alejandro.garciavallejo@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 0/2] Xen real-time x86
In-Reply-To: <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <aGzu4A_nk3dAScxt@macbook.local> <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-348157111-1751994629=:605088"
Content-ID: <alpine.DEB.2.22.394.2507081010370.605088@ubuntu-linux-20-04-desktop>
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b9be27-d2e9-4344-3ce8-08ddbe4279a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWQ4TUtwV1pobWRYRlFUNFFiM1prQjgxL3BmazNNdXArRDFQRHMweWFOM0k0?=
 =?utf-8?B?cXA5LzZBZ3VOejJ2YmR3SktoL1Axa0hPWERFUy83UTJLWWNqVXdWZjMrOTNN?=
 =?utf-8?B?ZVA5Z3V1V1lxTXN6QlJnWEZxMzBzdmJhOFNZZk4vdWdNNzhkSGlQSHpUOStO?=
 =?utf-8?B?RVlVWnB0MW9KWTdtelNLeWVrZW9QcXY1WDdDNmdHMll2NEpvWHR2UGg2TFhh?=
 =?utf-8?B?cTFZWTF2YjhiMURBbVg3Qm5vS1U0d29IcVBNNlZzbG0vdXhhakJsT0hGL3hi?=
 =?utf-8?B?Nk5mNFBIYngzd0xkcUJNVGdpNkoyWHF2VS9SSmJPN0dab3lraEdzVVFTME1B?=
 =?utf-8?B?OG10OE1SV3d6MGNFN0Z6YjA2V0tXNW80MzVvb2IzOVprcXFKemp4V0k2bU42?=
 =?utf-8?B?NlE5S1FGVCttU0h2a21wem81eEI3TjR1RDVwYkZmeUcxVmJNV2tuQzZ6MTJN?=
 =?utf-8?B?bytNc29JTWtONlRNdVpKU1ZYME9rc0t6SWJrK1lZVE1sZENjWG9vM053cGdH?=
 =?utf-8?B?Mm9xRmxTS1VYM3BsbG1ScmhyNjY4S0tYN0E3ZkZNdjBiTG93bHFOVUhvOUw1?=
 =?utf-8?B?MmVTTFp2REkyQnRHVkVJdkZLbHloNldiMUJYSC9qcjlTVWxkcUYzRk0vMG12?=
 =?utf-8?B?QkhadU8wcHNORHJSeGg0Rm1KenJEa2pRZE1VVjBndnduT3REbnRmK3dqWkUy?=
 =?utf-8?B?WnpnbjFJK2tVeDhMZEZVQ29iNGNiQnpDNW1YSVRRazhPdFgyeDA0SnMzS2dx?=
 =?utf-8?B?QVZhRmNwcEZIK1BHdlMyRm81MUsySHZHSEljWHN2dHVIcnY3YjV0WCtWRnBO?=
 =?utf-8?B?OE5ZdXlJcnpOL3lSQlN3SjFCeHplNmVTKzZHd2hibEJyVlBJTUVvN20yMmVM?=
 =?utf-8?B?Y2lhaU10TlNzbUhNVER1Vk1qZHpVNTRRRFYxVnpDYzhhQzdYZmpRSStxSDNF?=
 =?utf-8?B?M09XdTE1c2xIQzF0eStrRmtNNk9iOFdhdjdxUGVpUWI2VkkrbUp4azN1cENN?=
 =?utf-8?B?bGx2VmI3amtjeEJ3dENyT05mK2ovNytUZTJmVi9oc3Y2YnE0eU80b3ZJMkZB?=
 =?utf-8?B?bWZpRkIrUzZ6WnNtWWJvMXp6eGx4R3BWek1HVFBwMU5sOHJ2dE8rTjBLWkV0?=
 =?utf-8?B?bUVOZmp5T3QrNi9qRHc3UkRBSDlHMnowdUYwTlBIYTVHNEhmTTVENmIxRkZL?=
 =?utf-8?B?TkJ4czc4MGxVNVR5RG9OaFROVGd4WjJDVlVrYU1kN1dJVGREN0x3QUVncUQ2?=
 =?utf-8?B?VmxqMmtGZ1p4SnBna2ljV0VHbEVFblRWbjdvWUxGcDVwelBtRGJtUk9qVyt5?=
 =?utf-8?B?YkVHOWozT3l3UU9VNzZoQUp0TTBCenRKOUh5Q2pGN05STlpsME1PYllxaGlK?=
 =?utf-8?B?bmxBcWVzakhZNXlBYzgwa20yRXFtVG05VmlwY1BsWm1pMXd2YnRyS2xHL3FS?=
 =?utf-8?B?bVl4ZnR3cmVzSHByTGJPU0tFbTBCL1FrSDVqaCs2eFNDdGR4TzhvbStQQlp3?=
 =?utf-8?B?R1RtbkY5RzljVmF4NGtWZlZPUk5ZTER1NlRYWXF6OGF0RUVCRi9ROXBtOVoy?=
 =?utf-8?B?VVJjNGVvbGhrSXd0U2syUmZVajNYck0vUHRnUHJ6TXZnUEYrck9nMEhHK3ZL?=
 =?utf-8?B?WkxBZ3dkQ2t5a2tKOXRyNlNZdElKbXBkNTZ4aGxBU3RDUHBLODZTMXJtOExT?=
 =?utf-8?B?L0ZVcHZ4d2VITEVocUNGL0tESERDbndwcktuaDIrZ1BMV3QwWFU4RlArb2Nk?=
 =?utf-8?B?TVdwR2FoNlE1VGNsNXpQOEFoa284Vzl6VER1TzNxTEpSR3U3eVNKRFZlSFFT?=
 =?utf-8?B?WDdFU2FPZlFkRkNNam92SVUvQUJSN09laThkZW45Vml5MnVoSG1hS0xqNGRx?=
 =?utf-8?B?WWx3UlFNR2xpMGJpNFBLT2tTWG9ZejdWYmYvRWdpd09Iam96MUs3d0hvcHpW?=
 =?utf-8?B?UzBhRGorb3BOS1pkVk00T2RBZ2lYdlRkR3FDcXdCMElvVk41WGRDcUhtT1Br?=
 =?utf-8?B?TG1EVGxrZURhRDV2cm9hc1NwMHlNTkphbExoR2hIUStFelg1NWQ5UUFuUG9m?=
 =?utf-8?Q?EI52gX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:11:27.3914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b9be27-d2e9-4344-3ce8-08ddbe4279a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601

--8323329-348157111-1751994629=:605088
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2507081010371.605088@ubuntu-linux-20-04-desktop>

On Tue, 8 Jul 2025, Jan Beulich wrote:
> On 08.07.2025 12:11, Roger Pau Monné wrote:
> > On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
> >> Hi all,
> >>
> >> This short patch series improves Xen real-time execution on AMD x86
> >> processors.
> >>
> >> The key to real-time performance is deterministic guest execution times
> >> and deterministic guest interrupt latency. In such configurations, the
> >> null scheduler is typically used, and there should be no IPIs or other
> >> sources of vCPU execution interruptions beyond the guest timer interrupt
> >> as configured by the guest, and any passthrough interrupts for
> >> passthrough devices.
> >>
> >> This is because, upon receiving a critical interrupt, the guest (such as
> >> FreeRTOS or Zephyr) typically has a very short window of time to
> >> complete the required action. Being interrupted in the middle of this
> >> critical section could prevent the guest from completing the action
> >> within the allotted time, leading to malfunctions.
> > 
> > There's IMO still one pending issue after this series on x86, maybe
> > you have addressed this with some local patch.
> 
> Not just one, I think. We use IPIs for other purposes as well. The way
> I read the text above, all of them are a (potential) problem.

Yes, all of them are potentially a problem. If you know of any other
IPI, please let me know and I'll try to remove them. One of my goals
posting this series was to raise awareness on this issue and attempting
to fix it with your help. It is not just IPIs, also Xen timers and other
things that could cause the guest to trap into Xen without the guest
knowledge. Typically IPIs are the worst offenders in my experience.

On ARM, I have done several experiments where, after the system is
configured correctly, I can see that if the RTOS does nothing, there are
no traps in Xen on the RTOS vCPU/pCPU for seconds.

As I tried to describe in the email, typically the real time
application, which tends to be based on an RTOS like FreeRTOS or Zephyr
(think of them like Unikernels), has a very small window of time from
receiving an interrupt to accomplish a critical task. Nothing should be
disturbing the execution of the RTOS during the critical window. The
operation the RTOS needs to perform is typically on a passthrough device
without Xen interactions.

In general from the hypervisor point of view, the idea is that Xen
should inject the interrupt and then leave the RTOS alone and
undisturbed to do its job.


 
> >  Interrupt forwarding
> > from Xen into HVM/PVH guests uses a softirq to do the injection, which
> > means there's a non-deterministic window of latency between when the
> > interrupt is received by Xen, as to when it's injected to the guest,
> > because the softirq might not get processed right after being set as
> > pending (there might be other softirqs to process, or simply Xen might
> > be busy doing some other operation).
> > 
> > I think you want to look into adding a new command line option or
> > similar, that allows selecting whether guest IRQs are deferred to a
> > softirq for injection, or are injected as part of the processing done
> > in the IRQ handler itself.
> > 
> > Otherwise there will always be a non-deterministic amount of latency
> > on x86 w.r.t. HVM/PVH passthrough guest interrupts.  Haven't you seen
> > some weird/unexpected variance when doing this passthrough interrupt
> > latency measurements on x86?

While this is not great and I agree with Roger that it should be
improved (I'll try to do so), in a well configured system I expect that
there should be no other softirqs on the RTOS vCPU/pCPU so it shouldn't
matter much if it is raise as a softirq or not?
--8323329-348157111-1751994629=:605088--

