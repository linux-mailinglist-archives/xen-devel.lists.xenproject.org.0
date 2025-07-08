Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE68AFD59A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036992.1409644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCJ7-00015J-6M; Tue, 08 Jul 2025 17:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036992.1409644; Tue, 08 Jul 2025 17:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCJ7-00012c-3V; Tue, 08 Jul 2025 17:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1036992;
 Tue, 08 Jul 2025 17:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZCJ5-00012W-H4
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:40:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7c106f6-5c22-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 19:40:37 +0200 (CEST)
Received: from MW4PR04CA0153.namprd04.prod.outlook.com (2603:10b6:303:85::8)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Tue, 8 Jul
 2025 17:40:33 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::86) by MW4PR04CA0153.outlook.office365.com
 (2603:10b6:303:85::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 17:40:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Tue, 8 Jul 2025 17:40:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:40:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 12:40:31 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Jul 2025 12:40:30 -0500
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
X-Inumbo-ID: a7c106f6-5c22-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEs+AY3memurK4kxpticd92YUsd6Z+RP/uq6EN9sEWoXj1dWvoYaycRzp0kkkMnXGZnPmeCK3QU76XS5v4eQXi71C/r5XA0IFKKlvIL6S/PhoZSE6tc24xRtQJoit2UKs6H9naUG7fbmls237ay5XrpvdNlcF2YO63XS4rmFtBOxBFRi5yfIeCZt4LNOuZzgPiieSQycfT0s6kS0KwonZXaX68IS/MpQMXmUNcrpi2vfH1G0jYOe1vUlUKs0p9uZQyWycRa0XowWvKWfP02qV6nTrU4uMmwWehjy4tDsZKJ3S4ctBeV0JBgl+MTo8BnDIRnJzs2hxvak34I6+zf0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnVr+62J6pm4+KjlU3cUBaXqsoRuLomUvfB/UoCYHLI=;
 b=BdW3UsX8T+ej2YWvabYBlbIS0heZIFnBTkkj8Pz7LEJDiJ3bssy7aeaI2fS2VbUsg2aT0ZmAOkvBlLZx87Ls+okJLVZkEZ92ewzO0e++jRlF52m5RsHmM/mGKTwQSYtvx+WDR7pjWKNVzmZa5bMdd644EkQDQGG8vbZErkhh/PB//r+XkZrYC0DCu0X1AxV4bXomXYgwRZrCNA4Sb1cTom6n0ITdHhQ5vXPYhSystBfU9eR0G0jIPHjk7vM4WotFQC/Y1qrro0zk/W0B5XL/s7LYcl2SK/OXKjF5BYhQpt1Cuv8RSP/hGDn45Ol31KVjPeuusBCrN6zxchHjbBlz7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnVr+62J6pm4+KjlU3cUBaXqsoRuLomUvfB/UoCYHLI=;
 b=NuqWko2ZA8dmy6X+MbL3Ir7VR3mq1RiTG8V8zQPrRwycLZdjuCdLLwL+TiPdruVnLGjHfcKO+k1/ovIfDFC+HOmKboonQX4hAB7j59bZPf2oACq4BPX5hhRWdyprp7FNojtzaE8QRRHPnIyFIT61oMxhFEX7o2ILQzCJX+o5Ym4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Tue, 8 Jul 2025 10:40:24 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
In-Reply-To: <DB6KZPEF7I24.3TZ8FA01MF8A@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507081016420.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop> <20250708000712.2731666-1-stefano.stabellini@amd.com> <DB6KZPEF7I24.3TZ8FA01MF8A@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 306b4bfb-a090-441a-6532-08ddbe4689d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EZNBC92wMyi65S4bI3M2payh6X8BvtEL9nIYqkY5K9NMyjLCWbdj8KXoD10+?=
 =?us-ascii?Q?3zX9MM+vA/S+Ke66tOJDqid8K87NWeVZ6GxQpvGI/y/6AaDXL8nVW8vZ5bpD?=
 =?us-ascii?Q?Ija/ZnlI/h6F/riE/hYaa7GsirEAZpQXbj+/xhzeAk/WJm0ljJSxPX3KoyZX?=
 =?us-ascii?Q?WmKpfAv8Kpcx3s22+6sL6dUrDz49+M0HO9YkcHTWCYx0Svbr1FmMoXP+Lcrz?=
 =?us-ascii?Q?ZZI6tn7ZPpdffeGRFPbXisTXdFqeiAe5SjUETeeha5vbyH8pROuQJPacEkUv?=
 =?us-ascii?Q?9mLiAQO928OCMFbCl2yzPIiB8guFyW4UtF2lGbXwUaNhd23/Erp7fMeB0/0H?=
 =?us-ascii?Q?wW3rEZaLneoppGoYEqL3nU2Eb+tmtOH8buA/U6mUU/ig8UHidVVImLTbJhhK?=
 =?us-ascii?Q?7hK23NB7T044DQDl9NKaCmYeYlRS76kSO98SB9KOvWMipcvffe8gDsGntbBb?=
 =?us-ascii?Q?W3zIJuB++GOq76/QQd6OGSztJDZXlMJTDySJIGsR88Rmda14OmLmqocCvWY3?=
 =?us-ascii?Q?8Fcaz7uN/EO8wRBbwldG+mumchCbZP/1xYv/e/zYYS3+F2gZX0gL3BcNe4r8?=
 =?us-ascii?Q?OKCIUeLvdi6xTZbybcwuRAVgxXDoieWVH4bMmdE+3dRVWSNGE7CBGY5Yts6K?=
 =?us-ascii?Q?opfmJPLNt6mgXs03OixJIeHbdSThz4wxC9rW/C3QA9OgPz1mrioQ6nKaA7Fh?=
 =?us-ascii?Q?6QkFRQaMOrQCyvTw62FN0DiYe9VxagAMz2XSVbV5YEBd7otupNsWlgGSv6VT?=
 =?us-ascii?Q?WhPo3FfdPrpAuYQi7dpAU7Y5g4o8Jt5CSjbAyn7PFxLM8AaywWXL90bw3P9K?=
 =?us-ascii?Q?5EdKnqXeXWFeuldlqucu+1d+i081aH35pijT7edzkHFPpxjoj/yPcN3ka4OL?=
 =?us-ascii?Q?2+9nCjIj3WkvjuZV51iO82x6i12VtGrdp7Ke9x8aZ/+O8AUdBNC9sxnXLyyJ?=
 =?us-ascii?Q?rvnZKUirXCq7zMCXkDO9UnJ6Q1H+tb0UdI8ST6PcexZ6XI1mEpOd9SV8hSYk?=
 =?us-ascii?Q?R9mi4kXSaJbshqEpOMwlax3AfVozbIMy1FSzN6gjKW8VImlfr66Y0+C2q/T3?=
 =?us-ascii?Q?D9Ha0Y2GcGjCpBA8xMDh+3YWS2dYhyWrtX8Ij2bGADhXkUAgSDEG0xSLWAuC?=
 =?us-ascii?Q?P0qQfLHhkR+No1E88sqFkqqprvzhPHwxk+aaHnqilUqQeY5a7nFoC4+0ZWS1?=
 =?us-ascii?Q?lr5LP16V9sxVpuZfVeDFDyIkmASxpKma0j5292R4Vvzi1CrQkooX1C2RkqWx?=
 =?us-ascii?Q?GDrpEErDPcaMlmPEdPDmIaq8cowwAxrki1jHrjc9DpdIECIYBOocGmvYthIS?=
 =?us-ascii?Q?q3Js4MqFMh05GktmPMpgitBsa+3LxtWxcBclE8EcXkQqrNWk+iqXUlNDNHWr?=
 =?us-ascii?Q?mEbnyAmwIt2sRix32XHTcWgHuzvWfdWo3rC5BaaBHM7T3im2Xs7kxcO7YjgI?=
 =?us-ascii?Q?6K74Aa2/0NU86fGmL3c6JA5D3ELV9zOaPm1jevKAZRxWvRxzfrowN1jccH4n?=
 =?us-ascii?Q?vtDbd5SDx1kEtD9i7SnHMo9Sp72FA0UDGn6K?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:40:32.4385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306b4bfb-a090-441a-6532-08ddbe4689d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527

On Tue, 8 Jul 2025, Alejandro Vallejo wrote:
> On Tue Jul 8, 2025 at 2:07 AM CEST, Stefano Stabellini wrote:
> > On real time configuration with the null scheduler, we shouldn't
> > interrupt the guest execution unless strictly necessary: the guest could
> > be a real time guest (e.g. FreeRTOS) and interrupting its execution
> > could lead to a missed deadline.
> >
> > The principal source of interruptions is IPIs. Remove the unnecessary
> > IPI on all physical CPUs to sync the TSC when the TSC is known to be
> > reliable.
> >
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
> > +
> 
> This should check "(tsc_flags & TSC_RELIABLE_SOCKET)" as well. The TSCs might
> still be unsynchronized across sockets.
>
> I'm still quite confused as to how Xen (mis)handles time, but wouldn't this need
> to go inside the branch above? If the clocksource is not the TSC as well the TSC
> can still drift with respect to the actual clocksource (PIT, HPET or ACPI timer).

I can move it inside the previous if


> If so, we could probably do an early return in the branch above ignoring the
> conditions (they are required for picking the TSC clocksource already, including
> synchronization across sockets).
> 
> Another matter is whether we could drop the "master_stime" write. Would we
> care about it at all?

I'll drop it.

Is this what you had in mind?


diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index 59129f419d..d72e640f72 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2297,11 +2297,7 @@ static void cf_check time_calibration(void *unused)
     };
 
     if ( clocksource_is_tsc() )
-    {
-        local_irq_disable();
-        r.master_stime = read_platform_stime(&r.master_tsc_stamp);
-        local_irq_enable();
-    }
+        return;
 
     cpumask_copy(&r.cpu_calibration_map, &cpu_online_map);
 


