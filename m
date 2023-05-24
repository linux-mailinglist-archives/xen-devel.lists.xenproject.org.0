Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311927101D6
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 01:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539257.839949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1yGJ-0001nS-1V; Wed, 24 May 2023 23:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539257.839949; Wed, 24 May 2023 23:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1yGI-0001ki-UE; Wed, 24 May 2023 23:51:22 +0000
Received: by outflank-mailman (input) for mailman id 539257;
 Wed, 24 May 2023 23:51:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDQD=BN=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1q1yGH-0001kc-Qh
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 23:51:22 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff569f3-fa8d-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 01:51:17 +0200 (CEST)
Received: from BN9PR03CA0316.namprd03.prod.outlook.com (2603:10b6:408:112::21)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 23:51:13 +0000
Received: from BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::3f) by BN9PR03CA0316.outlook.office365.com
 (2603:10b6:408:112::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 23:51:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT104.mail.protection.outlook.com (10.13.177.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Wed, 24 May 2023 23:51:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 May
 2023 18:51:10 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34 via Frontend Transport; Wed, 24 May 2023 18:51:09 -0500
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
X-Inumbo-ID: dff569f3-fa8d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UG1uQHf1PS6aFhM68Cz+ovRWYTp1o7KBU0gWE5szrB/v0i7Bgm2Fgw+a8S75IBMaAR86Vwu+5KVe1JSzGCb1NUG/fP5BnUHDiwfCOsRXNb385O2fm0QMu01dXWu8G11lv+3Woxvw7Dkf1sh4+a7M8njUbOiwYYCeDNqGla6Fr5p9tCIh38YI0JQ3y1FMh/hIhdYZ9A1pBEFAHYDcL+fYtwnTgwMvf5ymfg5ixe1NIvlbnoG343/46mkMTj7AyVnnjoXY2ZfcYJ8eXtsmqPBY3eRFIYG8pqU1Uo8P03r6t6vkShVXi0lMJcIsbcc0tJlGp6ga3N2omJIPsu679p1skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA7i5SpS5XOBzknTlY79r/o2KC7fLSJ3ksCljteN7JY=;
 b=XMnVA2t49t0AXh7GFL1EvZSKzKObSwwkMSxAcvqw7GhKzKwsErCMnWOUY2LupuWiB+N7XHBGqnCBDubkiyj12kS7J9kT3qDfVsuizpuTzQFPh1cD0QBn5f3Wsr6qGbdGOnP2I8Drm61uT2AP2BICNUQ/SF6canhs208Gs4JaHM58qad8w7kmIF1icMNqzrY38R4y6+H7ykdvF/bznPhiVyScC0sfWLsBePfgRGontwHO+CmixMiGNdWdYV1ohE60VXw0qFjRMg2lG1myFg42K96QI4+sF4B07UJGNX0pLOqZnXYP8HKf10+qdx9xB5Sfb6g0UmnA4b0EY5l3oglbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iA7i5SpS5XOBzknTlY79r/o2KC7fLSJ3ksCljteN7JY=;
 b=DgT/Pfu3bSgcU4q5Rk7IiqnajJ9lyepMOSIez412BZAQ3nuc8mj9CbWhU2C2CHhwla4mzm2THC+bLILeuaNWEg3STNZej5l6A9HYIazPD7GrPMGFczyU3fYu8kvkOd/O+1YRlSmwltOb0aye+o2Q4npFRgZFpwOcyaJn0p1eAzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Wed, 24 May 2023 16:51:03 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <xenia.ragiadakou@amd.com>
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
In-Reply-To: <ZGzSnu8m/IqjmyHx@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305241646520.44000@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop> <ZGzFnE2w/YqYT35c@Air-de-Roger> <ZGzSnu8m/IqjmyHx@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-690127031-1684972061=:44000"
Content-ID: <alpine.DEB.2.22.394.2305241648030.44000@ubuntu-linux-20-04-desktop>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT104:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee378bb-6a7e-42d3-9be1-08db5cb1c1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ntsjOlHpzUNnsb1EXmISaVJYIAZJXOMHgRCjkPGTV57UUEYY9zV3o1eMN//3obTAunyI2BoYLNmlvibMgTgetUmteGTm/qFIDGH9kJc5yxxRPtcSgOGrMxbPJOaW2g+F+o2RyoHGX7b0tycApDivGZAixVKNtAI2hmGFFvTzxLP1/mSJoqcz/RZ8TmP9hDvchaXu3thSHy0vtkUvqWvj12U47ODrPZPW6unMa7ULWMrWyYt9FV02FvfvEurpXKmIrLDFABAMnTEdW062OxWBhKfjMxF7udOGGzGkI6bnKHC3U6J49zkI8y3EFrfEKOU1fTwrwbRroVYivzt34hsqHtYS8HIdzov9Oo/D5C97Ra7zlgcP5dUYJGzD8WDMYlhTrXnegyC10kYz8WWEA3wx+tQKY8jK2J6X9jEEIxec7z/7chYtfvlyFQyIvLJ3W0iuugb+LRvpyICpkStp33EZCDPeRAvIbTiWTD7JxVNS+BO4N/rczI+Zt4mLsxh6fPAH8q0VIn7M7x5pTR+3tgMeYVGRxgs+yIYOpkvqZ4U0hr+sVQRnPiBHDAgj90wo42t64f6IEW3ntb8HzeamW4LM8aNiNzqTFJdBHKPQlf8y3TBqnjw09wqowBPvA//CEWKutvds5Xrg0E1soQiBKBN/V08/6COWCwY+whMS+IuH4UxN+iibtsBB3cOFvN1HCTLPw9hmj1bPPWF34ZeXRXgBjvdNtkJcM0Q6OfR5OlqPB1ooYCWzlT7Du9WTDfQGueP6ZitQj8KXaW9EAntaAVVGFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(478600001)(33716001)(4326008)(6916009)(70586007)(70206006)(41300700001)(33964004)(6666004)(54906003)(316002)(5660300002)(8936002)(8676002)(86362001)(44832011)(81166007)(26005)(9686003)(356005)(82740400003)(186003)(40460700003)(15650500001)(426003)(336012)(40480700001)(2906002)(83380400001)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 23:51:13.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee378bb-6a7e-42d3-9be1-08db5cb1c1e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

--8323329-690127031-1684972061=:44000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305241648031.44000@ubuntu-linux-20-04-desktop>

On Tue, 23 May 2023, Roger Pau Monné wrote:
> On Tue, May 23, 2023 at 03:54:36PM +0200, Roger Pau Monné wrote:
> > On Thu, May 18, 2023 at 04:44:53PM -0700, Stefano Stabellini wrote:
> > > Hi all,
> > > 
> > > After many PVH Dom0 suspend/resume cycles we are seeing the following
> > > Xen crash (it is random and doesn't reproduce reliably):
> > > 
> > > (XEN) [555.042981][<ffff82d04032a137>] R arch/x86/irq.c#_clear_irq_vector+0x214/0x2bd
> > > (XEN) [555.042986][<ffff82d04032a74c>] F destroy_irq+0xe2/0x1b8
> > > (XEN) [555.042991][<ffff82d0403276db>] F msi_free_irq+0x5e/0x1a7
> > > (XEN) [555.042995][<ffff82d04032da2d>] F unmap_domain_pirq+0x441/0x4b4
> > > (XEN) [555.043001][<ffff82d0402d29b9>] F arch/x86/hvm/vmsi.c#vpci_msi_disable+0xc0/0x155
> > > (XEN) [555.043006][<ffff82d0402d39fc>] F vpci_msi_arch_disable+0x1e/0x2b
> > > (XEN) [555.043013][<ffff82d04026561c>] F drivers/vpci/msi.c#control_write+0x109/0x10e
> > > (XEN) [555.043018][<ffff82d0402640c3>] F vpci_write+0x11f/0x268
> > > (XEN) [555.043024][<ffff82d0402c726a>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> > > (XEN) [555.043029][<ffff82d0402c6682>] F hvm_process_io_intercept+0x203/0x26f
> > > (XEN) [555.043034][<ffff82d0402c6718>] F hvm_io_intercept+0x2a/0x4c
> > > (XEN) [555.043039][<ffff82d0402b6353>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5f6
> > > (XEN) [555.043043][<ffff82d0402b66dd>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> > > (XEN) [555.043048][<ffff82d0402b7bde>] F hvmemul_do_pio_buffer+0x33/0x35
> > > (XEN) [555.043053][<ffff82d0402c7042>] F handle_pio+0x6d/0x1b4
> > > (XEN) [555.043059][<ffff82d04029ec20>] F svm_vmexit_handler+0x10bf/0x18b0
> > > (XEN) [555.043064][<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> > > (XEN) [555.043067]
> > > (XEN) [555.469861]
> > > (XEN) [555.471855] ****************************************
> > > (XEN) [555.477315] Panic on CPU 9:
> > > (XEN) [555.480608] Assertion 'per_cpu(vector_irq, cpu)[old_vector] == irq' failed at arch/x86/irq.c:233
> > > (XEN) [555.489882] ****************************************
> > > 
> > > Looking at the code in question, the ASSERT looks wrong to me.
> > > 
> > > Specifically, if you see send_cleanup_vector and
> > > irq_move_cleanup_interrupt, it is entirely possible to have old_vector
> > > still valid and also move_in_progress still set, but only some of the
> > > per_cpu(vector_irq, me)[vector] cleared. It seems to me that this could
> > > happen especially when an MSI has a large old_cpu_mask.
> > 
> > i guess the only way to get into such situation would be if you happen
> > to execute _clear_irq_vector() with a cpu_online_map smaller than the
> > one in old_cpu_mask, at which point you will leave old_vector fields
> > not updated.
> > 
> > Maybe somehow you get into this situation when doing suspend/resume?
> > 
> > Could you try to add a:
> > 
> > ASSERT(cpumask_equal(tmp_mask, desc->arch.old_cpu_mask));
> > 
> > Before the `for_each_cpu(cpu, tmp_mask)` loop?
> 
> I see that the old_cpu_mask is cleared in release_old_vec(), so that
> suggestion is not very useful.
> 
> Does the crash happen at specific points, for example just after
> resume or before suspend?

Hi Roger, Jan,

Unfortunately we are all completely blind on this issue. It is not
reproducible. It only happened once. We only have our wits to solve this
problem. However, looking at the codebase I think there are a few
possible races. Here is my analysis and suggested fix.


---
xen/irq: fix races between send_cleanup_vector and _clear_irq_vector

It is possible that send_cleanup_vector and _clear_irq_vector are
running at the same time on different CPUs. In that case we have a race
as both _clear_irq_vector and irq_move_cleanup_interrupt are trying to
clear old_vector.

This patch fixes 3 races:

1) As irq_move_cleanup_interrupt is running on multiple CPUs at the
same time, and also _clear_irq_vector is running, it is possible that
only some per_cpu(vector_irq, cpu)[old_vector] are valid but not all.
So, turn the ASSERT in _clear_irq_vector into an if.

2) It is possible that _clear_irq_vector is running at the same time as
release_old_vec, called from irq_move_cleanup_interrupt. At the moment,
it is possible for _clear_irq_vector to read a valid old_cpu_mask but an
invalid old_vector (because it is being set to invalid by
release_old_vec). To avoid this problem in release_old_vec move clearing
old_cpu_mask before setting old_vector to invalid. This way, we know that
in _clear_irq_vector if old_vector is invalid also old_cpu_mask is zero
and we don't enter the loop.

3) It is possible that release_old_vec is running twice at the same time
for the same old_vector. Change the code in release_old_vec to make it
OK to call it twice. Remove both ASSERTs. With those gone, it should be
possible now to call release_old_vec twice in a row for the same
old_vector.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/irq.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 20150b1c7f..d9c139cf1b 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -112,16 +112,11 @@ static void release_old_vec(struct irq_desc *desc)
 {
     unsigned int vector = desc->arch.old_vector;
 
-    desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
     cpumask_clear(desc->arch.old_cpu_mask);
+    desc->arch.old_vector = IRQ_VECTOR_UNASSIGNED;
 
-    if ( !valid_irq_vector(vector) )
-        ASSERT_UNREACHABLE();
-    else if ( desc->arch.used_vectors )
-    {
-        ASSERT(test_bit(vector, desc->arch.used_vectors));
+    if ( desc->arch.used_vectors )
         clear_bit(vector, desc->arch.used_vectors);
-    }
 }
 
 static void _trace_irq_mask(uint32_t event, int irq, int vector,
@@ -230,9 +225,11 @@ static void _clear_irq_vector(struct irq_desc *desc)
 
         for_each_cpu(cpu, tmp_mask)
         {
-            ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
-            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
-            per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+            if ( per_cpu(vector_irq, cpu)[old_vector] == irq )
+            {
+                TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
+                per_cpu(vector_irq, cpu)[old_vector] = ~irq;
+            }
         }
 
         release_old_vec(desc);
-- 
2.25.1
--8323329-690127031-1684972061=:44000--

