Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFEAFD59B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036993.1409653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCJI-0001UE-Dv; Tue, 08 Jul 2025 17:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036993.1409653; Tue, 08 Jul 2025 17:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCJI-0001SY-Aa; Tue, 08 Jul 2025 17:40:52 +0000
Received: by outflank-mailman (input) for mailman id 1036993;
 Tue, 08 Jul 2025 17:40:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZCJG-0001RR-Fx
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:40:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac99f312-5c22-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 19:40:45 +0200 (CEST)
Received: from CY5PR15CA0124.namprd15.prod.outlook.com (2603:10b6:930:68::13)
 by IA1PR12MB6114.namprd12.prod.outlook.com (2603:10b6:208:3ea::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 17:40:41 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:930:68:cafe::bb) by CY5PR15CA0124.outlook.office365.com
 (2603:10b6:930:68::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 17:40:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 17:40:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:40:40 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Jul 2025 12:40:39 -0500
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
X-Inumbo-ID: ac99f312-5c22-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEczkEEzjH3y2Ftw+443VNHlL2mE9k9AombOVUCGq/NvwA+aB6sBStH/K2VM5XhCX1FbCOpIiwRnrqmsESWhyh6f6EwCHQJkxxC/P6cNChKFatPTDKVQdWqroMIVeJ6f7Ngmppl0ehOyzahjXjPAHbBBuHhBe9jPYsDcZwzSEwt8L/zpERwaZF0cn7EWyXhKInl438747S79V+hO5DoqXpqaQ2/EJiAElcJK/rL70HONL5B6pprCdRH4w02rmlHxZzE5l00mKa3VJVEUt+wkzQeewuY/x9871V7trkMP4Cb5Nxl3jlRjqCE12MBJmSizbU8zimiqiRSYXQZjJ0lncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNqYgtXWp14219vyBDb7vk+riCM5keptKtC84Kx68zw=;
 b=bfK0GQB7T/z+UdvaIjaUC1Ebe/zOwey0q9jvhXwqm5gMKMzxevCjP42iXSDM27SQ80H0huXSDLTHKhLoz6zSGXojW1uRc1l9j3S4vhITs8he4rSxp3xjcNpj+664t87YpCWdfqS8asejNXbOpglcOe1O+HgR4xIJnPcEZOZSWFR8iFKSGwDvnduJBosEy0SbU5qe4M6ccHc3w6GSFzoIds1XVv5PFWuRqgNEsWUyA94n90ACaw07m8170+azHhQmYOpaxQRR9Sil6Vh6vf04vBBjiasqKNsW4SaU2s0FCcgeNRMKYJQyMrBcGbxXYvoGTA8krmX0nJd8b+/ndJHYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNqYgtXWp14219vyBDb7vk+riCM5keptKtC84Kx68zw=;
 b=4jcewIyXPoLMXwAeC0yWPwbdMH2noJDGg6OtZAfnCrZNHRQVup3iVJOryAx7PyN82qqCSTjedrOgj+bMvCKscHSazt5UTBQWvPuygEh+vMgfk+ELTQAEMF0bysngjBADy1xySHqq8xZbZvbZD6RMJlorKckaY9G8TB+3Y0W4KMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 8 Jul 2025 10:40:38 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <alejandro.garciavallejo@amd.com>,
	<Jason.Andryuk@amd.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
In-Reply-To: <e677f691-f158-4c7f-97bf-13bd157fcb54@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507081020560.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <20250708000712.2731666-1-stefano.stabellini@amd.com> <e677f691-f158-4c7f-97bf-13bd157fcb54@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|IA1PR12MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: ff13a64a-5f94-44fa-e1f9-08ddbe468ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x/7CcTtHc3FthdU65GUnstphHb1fpx9Ov0EdhvpNxIpwdrBIpUxDJxj2O2cE?=
 =?us-ascii?Q?RVjUAFRsbExo9Ehk1KA39o7N/5mng3pIklPhkxFvPYLIXLbLJmTDSe2QcVdC?=
 =?us-ascii?Q?hL8Bz1VkUftJzoF7VO2puFTElH9YlrAkBxvivoKip0pJxh8GpnMHunvCJjJI?=
 =?us-ascii?Q?s7QMTfR6ZtRsjdWeKKv8jNTt8zb4yS2kuAGuq28ZSfnOJNerEp6MwuoykX0C?=
 =?us-ascii?Q?nWgsbu1k6GCOZgY9CigcvwSNArqoRLbdoHU+n09Noxe7fVHuabPwp/vBbRQX?=
 =?us-ascii?Q?F/mgyEaRSMOGhT63VFY3v2TSqkFM4l+YNmwPK7nliFtfyzYXz8HrsPoPqczl?=
 =?us-ascii?Q?h1jI/7yQOwtQvCuabuI+CmHhYukKryCUf1lWkXgaq8vU9IxkRL3ilFUin9wP?=
 =?us-ascii?Q?J+R3yA9kNU+B//rtDhnC/3uXOGmA5c3mkiisOZRXOH5DyEu3Z3ktTG0Na5RS?=
 =?us-ascii?Q?8SL6Xv2nOay3P43h+uUS37BLSu+9iQKB3H3SUIF/lv8yX/l46AmZ3zYHaHHc?=
 =?us-ascii?Q?kAlnorlks8TlFvni5K1V/iMylWsAbJet8o4xPGGwaKG7KhMH0UPFL/cbuDAr?=
 =?us-ascii?Q?AkxR3opOxpDd6NClyn1zh9qsveyHtzQQNAh9bkBizaLFEPlSYF5vQI2AzJ9c?=
 =?us-ascii?Q?pO1p9i33OVtIFWC7vybwoLawJK5wnXtA/ds2sgwES00WXkQwgxQrjxVwuIFP?=
 =?us-ascii?Q?MAy/m7R+YfFUfm1G3VXiVdqnywCwX44FkpEJLwiAfmMzJ2cMWmi8PZy/0pGs?=
 =?us-ascii?Q?WFTWvPwcvry6Mk1Z6DZgy2nU1Pm1zwhamGsncC9Kv2ZTUR7atQ7MncPn0fIx?=
 =?us-ascii?Q?3c1NImRwXB1cmFnY/8Ky0kKYQtk9FqCz1ZJ5JpznZWgXo6oK8H+I/QJe5eRe?=
 =?us-ascii?Q?YD8bLWx6vK4uOVUakMf/3bv0Zowy4mL8nWi1PkupoVMKBgdfLlXBj/D6NQQa?=
 =?us-ascii?Q?BSPssbq6z8HVuqN4pZH+6RQ7pRm7je/TwE4QAUJOHzR3Y6qN2IAxtHIZbjay?=
 =?us-ascii?Q?Xy4YmE6nB2133CorM/ba4D7JmgIpPVUU8wB4S+HTw442n7zWbfm1P7opsHgC?=
 =?us-ascii?Q?o6hhMKbehdVc/VKUgXoWTeHz7MXnRWisQeZhNLxsijaGefm45zq0Vm9PfAf2?=
 =?us-ascii?Q?LF6ibXfvc5TLf0FIENN7uIEnbtSYhzSZ/ehx3CMQx3N/M2KRotTwaCdgn+Ls?=
 =?us-ascii?Q?PkPgQRBBp1oXYc/VkrdwxpfiZcg+Dn00DRv+Wa7jodT7Vm8nPUEZzjdZ6fwI?=
 =?us-ascii?Q?P+TCljGlsM82ww/N+WoUD2HjpYnRSnXFMAOMCzHBnODt4Cykvu9DbE5l7hqS?=
 =?us-ascii?Q?twdG4oFwCaEOPcH15Ug2gx1pY7XNpvxttBQ57gxToMizCi4hmXa+eHJTbsSH?=
 =?us-ascii?Q?JNb4G46ZLFKNEGo0+liIegd13szfw8NoWk8SuFRXv/re6p4oBpkFXwNqe8B9?=
 =?us-ascii?Q?UFxJLAWXpSUbhf32fFvN4Wzh3RDF7iBcQpGOdcpw8vSjTpPOCctEoZuE+xGD?=
 =?us-ascii?Q?v5TwsHicXbFEsLPdrXHZQ32fhvMQZ8wbsp2x?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:40:40.9550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff13a64a-5f94-44fa-e1f9-08ddbe468ee5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6114

On Tue, 8 Jul 2025, Jan Beulich wrote:
> On 08.07.2025 02:07, Stefano Stabellini wrote:
> > On real time configuration with the null scheduler, we shouldn't
> > interrupt the guest execution unless strictly necessary: the guest could
> > be a real time guest (e.g. FreeRTOS) and interrupting its execution
> > could lead to a missed deadline.
> > 
> > The principal source of interruptions is IPIs. Remove the unnecessary
> > IPI on all physical CPUs to sync the TSC when the TSC is known to be
> > reliable.
> 
> If it had been truly unnecessary for all the time, I'm sure someone would
> have suggested to get rid of the overhead.

I am not so sure someone else would have suggested it given that Xen on
x86 has been mostly used on the datacenter where real-time is not a
requirement. 


> IOW I think there is more to be
> said as to this being correct / safe, including in any corner cases.
> 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> >  xen/arch/x86/time.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> > index 59129f419d..bfd022174a 100644
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -2303,6 +2303,10 @@ static void cf_check time_calibration(void *unused)
> >          local_irq_enable();
> >      }
> >  
> > +    if ( boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
> > +         boot_cpu_has(X86_FEATURE_TSC_RELIABLE) )
> > +        return;
> 
> This would render the (first of the two) invocation(s) of the function from
> verify_tsc_reliability() (largely) dead; it would then be only r.master_stime
> which gets updated (see also Alejandro's reply), which surely wouldn't have
> required that call in the first place.

I'll follow Alejandro's suggestions

