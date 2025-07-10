Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A5FB00DFD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 23:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039886.1411451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZyzf-0003x4-Ma; Thu, 10 Jul 2025 21:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039886.1411451; Thu, 10 Jul 2025 21:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZyzf-0003v1-Jp; Thu, 10 Jul 2025 21:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1039886;
 Thu, 10 Jul 2025 21:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noSJ=ZX=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZyze-0003uj-N3
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 21:39:50 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:200a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64de9559-5dd6-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 23:39:46 +0200 (CEST)
Received: from BN9PR03CA0356.namprd03.prod.outlook.com (2603:10b6:408:f6::31)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 21:39:40 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::8a) by BN9PR03CA0356.outlook.office365.com
 (2603:10b6:408:f6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Thu,
 10 Jul 2025 21:39:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 21:39:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 16:39:38 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Jul 2025 16:39:36 -0500
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
X-Inumbo-ID: 64de9559-5dd6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+mCwkpJQX/EU6zvHA9HwRDagDN4e4lnGfhmQpPg87dKD0gqqaHON5CY1+E87yAwrAD9jSCxZIXcnVg2XmSa3My30KfSkL2k3tTh3F1ws54ijLiwt3w9niUuLaZz9+2Gw2KikRFit+uBPVV+qSVgB/+LpVsQf/rNOtUkLIhvhtWwW66X0rQ7nPLep2mclTvyS3h8zFxZFK4J3uHyDyFXHIQmKu8lz2PuzteWcoy233wh4tjyNJQ/0CPXcHZNxfpw+/QQ3COSvJEbfh4Gh7DTmRRjNZd33+ZxRE14rVr6fR7/MZ7mKNG+Hhw02CPve/BzRNY8lvIUHi1Lxeq9O3M0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLUp/NiC6tbn6ZfxPF2GrFXvfsTMN2Bul4B986RlZ/E=;
 b=PoxEDv2B+0hXVfViKzmeQcUoKXMV6BFIF5koRtGVqQvs+sE8Y/Ht/oNjQL1w8VedNjFjgw0hoOq3X1JLwEYd6Qhau/m5n9gkCVCYvd1BLP7BfGU9CjvGEAHYivczSTXhC3glj7Vu1Pyu3DTRKmIMnSSHlW4Aoc4kO7x8rOs7KiImQV1rzk4XcBuI232OvtRkcrvb6WiKHVGxgynaIJWr7j5cFXaU/6PRILM26saMBAthlSe0Y73M231crakPONhATcF36S1YMSh84Juun5etSJram74dMToV0EeVcSfxziWVIUI2xEnl0VoliWWsnAQwJKF6RAzDqr+KNFPa1mcSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLUp/NiC6tbn6ZfxPF2GrFXvfsTMN2Bul4B986RlZ/E=;
 b=O6n7cnqBaxUaLpPpv/jDehomPR+HUYxzHlLSN1T4d76NFx2seIeAIBPWBQLO6cnO8XsMTbA9XzBv1IRT9M15/wnDA80pugTkyhcurZ9WDJ7109Ry5vYd59l4tiqA8uMH4bWozP0/0AFSIx1ULsUr5644LpokxWLTJA3trEVJIO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Thu, 10 Jul 2025 14:39:36 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, <Xenia.Ragiadakou@amd.com>,
	<alejandro.garciavallejo@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 0/2] Xen real-time x86
In-Reply-To: <979884b1-736d-46ee-9465-e432404c59be@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507101407500.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <aGzu4A_nk3dAScxt@macbook.local> <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com> <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
 <b81d7bf6-6254-4001-89f3-3ec06e03e21a@suse.com> <alpine.DEB.2.22.394.2507091736520.605088@ubuntu-linux-20-04-desktop> <aG9lh5FI8tKMJkco@macbook.local> <979884b1-736d-46ee-9465-e432404c59be@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-861914526-1752181731=:605088"
Content-ID: <alpine.DEB.2.22.394.2507101408550.605088@ubuntu-linux-20-04-desktop>
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 615742d7-2cd3-4b99-af4c-08ddbffa4645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmt6U3FvdHBhaWlvNUVRZkNQL2pqTmt3Qnd6UHl5RTg1d0QrTmhWNlFhTnJy?=
 =?utf-8?B?UG1zc2pyejVJQmtETEd4dzBEZnpkdys1VzFuaFFSS2xEZlVmcTFsblY1cWhH?=
 =?utf-8?B?QmJIT0JqL2Y1RjBQQVd6L1N3TW5Jb2ZZRGVMNXM3V1E1OGtjVXYxd3RmbXQv?=
 =?utf-8?B?SU5pWUZrdjZXbzVxOTFyMEdreEtQZkxkS09uQXdUbWU4QU1MaXFGT2V6dVRK?=
 =?utf-8?B?Yk5BTDgyYVJ5K2NyYU9Wd2NzdXZXaXhuQkZlWW9tL0E1aXlNWldsemhXaUEy?=
 =?utf-8?B?Ymw5N0xZRitOZkM1M21FTjNLcFFFZTg4K2hmSFdBZUk1WVRQVS9OaER1UWJO?=
 =?utf-8?B?YjB2dzhyODdpNTBJUmJrSUMyU200UUxoeG1aTXdLU2tKMlBiRE9zeDFTWTJH?=
 =?utf-8?B?QU1GODhldmJBRXlUeXQ2bEF6LzAzY3E4c2tZckhYOGNQZW5YSUNXLzd3TTkr?=
 =?utf-8?B?T1J1bitXakZ3QmZIZVoxdjIyM3Vldk4rMTRZSFM5NmE3aVEvS1l2S1d2R1oz?=
 =?utf-8?B?Yy84MVFWM2h3RVdFZGVvSjdjQ095Si9oSm9JMTd5ZzZldVJUbWlTK0laQUxB?=
 =?utf-8?B?aDI0WTg1STFtWFI0VG1aOWErOCtUNkNTdURyem10b2RTMEllWnFCTTRWY1Ew?=
 =?utf-8?B?blZYSjJWdVMzWnJieGNJenAwS2hPV2xVRnRnRndmdnVvTGVQVXpXb1pxaTIv?=
 =?utf-8?B?a2VadDhzbkUrRi9wTmUzT01mM1hiZU43bzRYaUZ5RXhjZU9oWXZNdkZzbllt?=
 =?utf-8?B?aDBtaDFndHVjV0ZLbkFIeUNBaEplb3ZyYUs3Qm9mbmFvSExMOThLL2dvYjJm?=
 =?utf-8?B?d3lydnQ4L1BIeFlCMmx1YUp1K3lJeVU2UlZGUnRtZThscXl3UkNVeVhIM0dy?=
 =?utf-8?B?S1VDYVo5aXIyak5OeERQNHh0dmFsVVEyOUh1clZPZkVMRlFPYmdkdzlpNkVm?=
 =?utf-8?B?dUF6WFQwQnd3Ri9tNnJGNkorNUVvcW85eTN2UXNyRVBEMDExdlZQRzVOdVBK?=
 =?utf-8?B?cDRmNUpvSEFtRjVUYlJQT0VNUWhHM1Fza1d6d2xUMXpGNVJ2eUF5dmpEWmw2?=
 =?utf-8?B?YXZIa0lwemt6S0k1M0Y1WXdpeEJQeWFhbWg3aHJoUlVUd2hRakd4OElINjFS?=
 =?utf-8?B?cWkyZmN5cjVhVCtrd0xRQ2dmbTdYNjcva0pBZklTa1VZMmQxb3hJOHRNQ1hX?=
 =?utf-8?B?bW5hWGFoTnhialNpOTRsazh4VitWMHdGRi9Mb3Zqb00vRmpQYVJLMGkyeTVU?=
 =?utf-8?B?azdmamVFZ003Rk8wb094VTNoWkdDaDBNNmNpcXVwZ0luUTVNSmFmQzMxbVRm?=
 =?utf-8?B?R2d1aStCWEF4b05GU1RBNzhpeDkwbjhiNjY3VTcwbmV5MWtCV24rZVVPSG1p?=
 =?utf-8?B?Q2o1SWcrUzJpS0pURnBYaE5rbmt4RHVjQ2pTQzBzR2c0N09BTDJLWnBCREQ5?=
 =?utf-8?B?cU1hNGxwTGRYYUc3S0djSjJwc1Y4R3lQVkxrODdhODgzT2UrS0xsWUpYaHA2?=
 =?utf-8?B?MmlDNE5DaGt4YkM1dGFPbDVFVGRGSGtKanNEc2tNL051ZkF4U3dvN3hCNjgx?=
 =?utf-8?B?ME9BTmt3SkhPMWZvcGJMYkljZFlBd1ozNWZleWQ4SjMzMlF0NDJzdkNRSWNR?=
 =?utf-8?B?M0pmVVE2UDVheEx1WmhDdWlXdSs0MFRNdXdIV2x4OU5PME1WVy9naW5CZTdm?=
 =?utf-8?B?R01uOXRkbVNYdEVyRTJZRXFMMUZ3MkNJY1ZtOGwxdStia0RBYXBCWnFlenRt?=
 =?utf-8?B?Mm5KK2lSTmxNM3BWbkdoaTNweVgxQkl6SWVnMzFxcjg1K1pQT0xZME5yQlhP?=
 =?utf-8?B?ZzBQZjU2Q0h3NlVwVmVTYUdTaEU2L0g2N0c2blNJa1lmdCtSbnltWkpIc3VE?=
 =?utf-8?B?Q01FN29VVko0OUZGTFJZMUppOHYrZzhuSGMxNmJLUk9vbDJMeWZ1RXhkL2xY?=
 =?utf-8?B?eVJzY0k5RHh0dEJ1YVY5QThXcmRGa01hVURXN2xsOEhVSGsxNGthL3lJTkt0?=
 =?utf-8?B?V3BCRVdjNEZ6cDA0bi9mWjF4MDdIQ1pqNjh2TGUwV1NQY3A3VE53cTRBVHFL?=
 =?utf-8?Q?HX+4WD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 21:39:39.7633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 615742d7-2cd3-4b99-af4c-08ddbffa4645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969

--8323329-861914526-1752181731=:605088
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2507101408551.605088@ubuntu-linux-20-04-desktop>

On Thu, 10 Jul 2025, Jan Beulich wrote:
> On 10.07.2025 09:02, Roger Pau Monné wrote:
> > On Wed, Jul 09, 2025 at 05:44:33PM -0700, Stefano Stabellini wrote:
> >> 2) means that the RTOS must be undisturbed when executing the critical
> >> section, which is typically right after receiving the interrupt and only
> >> last for less than 1ms. In practice, it means the RTOS should absolutely
> >> not be descheduled and there should be no (unnecessary) traps into Xen
> >> while the RTOS is executing the critical section. It is expected that
> >> the RTOS will run the critical section with interrupts disabled.
> > 
> > What about other external interrupts?  While the guest runs the
> > critical interrupt handling section with interrupts disabled, an
> > external interrupt from a device targeting the pCPU could cause a
> > vmexit.
>
> For interrupts to be handled by the guest, we may need to finally gain AVIC
> support (albeit I'm not sure how close that is to VMX-es posted interrupts).
> For interrupts handled in Xen the only way would be to allow the guest to
> announce such critical sections to Xen. Which, besides being a security
> concern, may of course itself represent unacceptable overhead.

In the past, I wrote a patch for an ARM user basically to do what you
suggested: "announce such critical sections to Xen". It is easy for Xen
to know when the critical section start: upon receiving the critical
interrupt. I added an hypercall so that the RTOS could tell Xen when it
ends. This is the kind of dirty patch that is very effective but
difficult to generalize. As an example, you can pause all other VMs
during the critical section to make sure the RTOS has full bandwidth on
the bus. The critical section is much shorter than a scheduler slot
anyway. I did not try to upstream the patch.


> >  I'm not aware of a nice way to solve this however, as for
> > PVH/HVM Xen doesn't know when the guest has finished interrupt
> > processing (iret).  Maybe this is not an issue in practice if you
> > isolate interrupts to different vCPUs (you might have to do this
> > already to ensure deterministic latency).

Yeah, that should be solvable by moving around other interrupts to other
pCPUs.
--8323329-861914526-1752181731=:605088--

