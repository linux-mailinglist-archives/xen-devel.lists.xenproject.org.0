Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3416603AE3
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425584.673505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3lD-0007VH-Qm; Wed, 19 Oct 2022 07:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425584.673505; Wed, 19 Oct 2022 07:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3lD-0007T7-Nj; Wed, 19 Oct 2022 07:45:07 +0000
Received: by outflank-mailman (input) for mailman id 425584;
 Wed, 19 Oct 2022 07:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3lC-0007Sw-2K
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:45:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1f3af92-4f81-11ed-91b4-6bf2151ebd3b;
 Wed, 19 Oct 2022 09:45:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 07:45:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:45:03 +0000
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
X-Inumbo-ID: f1f3af92-4f81-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moBix3iTL+mkz6rmwQ8Lxjq+wqCwplriD7m1Wc2FBoP0Fd49C234W1baD8AbP2DQFUOx9JLE4ZYZSf5Ytd2T1gM/G4xAVDbBJcxdKJLZj2bLDNOLcKaYJw85eKT5o64bOuCofRCo4x1uSXOe/p6aUWr5zLlkMRjQgR5MwWSt5FbX5rB7GyngDvmeVuGb0KR58L6P47s+mZGGbBRQR/bB7B+JEp6ygL7R0+RRYwLmqjX0fIKw48nFKBy+QzPbw9uTva5Usp5KRLPfsL6mhZa58twkOpOtc7GFYa8pzCG3RHUQPkCYZlmdOfK+cm+4ew3ESVRIuk7w7loggLTRUAGCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eflRRB2jmPiyNvfvJoh4skvHiPaEH7JTca4Ol831Ug=;
 b=NmvinShEUZOBxVMoRUiskbK280RIZcc0sGk2t4Pk4Wd96tN17vMDnTBwh79kaZ1HJyMFIA4GVdNbOkArZ6PWWr+BsfZ60V7y2Ji0l3LiiQ1m5jz7BaDhMtEo825EiEg5KmLIuVYTsSq6Tsin67fojLuIUpg9Vcr571BvL4PoY92tcFsme3/c29JYNNvIM8MlwxoFR8wePhaCQzxpY7VSKHbnWZOZ2jwAW+QT5anz+1SpW2m2zpzUg9f48w8qJYcMmNoqfvecxRbjS9TKe1Ys3VfXf5cnfJ4TNmtvBncc1JwvS/piUWNyAzus1I8yfA5YvyXUPzcHM1czXy4FLUOxwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eflRRB2jmPiyNvfvJoh4skvHiPaEH7JTca4Ol831Ug=;
 b=dRwIuD6ggBCTjjcntzvnkiLV3hUFz6WVLqP3W2dFBfgtmh+M+ESCAfB+eMbE/xNCqQPFADQ+EeaiZiRYvOANNA2zqwFnuBcNmR6y4uysWRcqa91JmiS+H/FfQ8Tv9ZcmftaMpFHvG97frLHZ/J0/jX8gm8LVJssaOszoN3KohkokPIqAYD7bp9OwYAWfdTpfFu3VsBENmjjNnMCHzxT4Z2kj5A9HkIsjgWdgSGK1m6/pF+9+8acePWR1mWhCp+qnwnliyXx5Kz4KdNn+4US6nGR7jzPsU9oNAXZscaLpJZUMPjpn0WNrgOS4iEN97FO+CMBvEaeXTY5Uq0Vl/Mychg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f0d6cb31-4d87-78ed-cf21-8e508211fd00@suse.com>
Date: Wed, 19 Oct 2022 09:45:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH 09/10] x86: introduce GADDR based secondary time area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 1350ba36-13f1-43cc-5d77-08dab1a5d51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9MplujuXHuxO5nfVn/J5+8mmUx7bS9K7YH/dp8ZUjz6nb+nUGoOaJMCwjBdRJwcZNTOoMlAXr6EwFtFjTqvBtbDDuOMYfCMrVA/qPKhgFxuZ0rYWSICdP+WESIB6dqAy5x8PCJjeJvNaydun+lqxS6tast1jhvzNsSTVvuJcy2T9Bm/MCOzex2mKGnQNKWXzMhw4NRYhzJllh3yUAo6u8zoCujt9/2IuTUBRwXf2Mm69wXOWPqmnqzEXLh1X9PgXCiHMozAF70DNyHuDQOG76yBavUu1U6DVsryTMxsvu7eMAh8LUnVQ0JqhfH+w+/Q3P7O4BTZQidxtj/7jTHpBqZXrdoEN+qfA5Kiag8ipvCz+Gtn//AeMSW+0uZd5XziMCBTib0I8HfcmS1g8qptfqEGqW1MLvEASu2qCKbSQ5T1CmRO29kyiC7m1TvAe2fvz2CWwRH2dvGguUCh6yJa4fHp9GgYepQrQD/YB2/fq7d56N2qUJ+mLn+R+zuwfTYZdj++cf2cdUtO10cZ3YqMEd7ALS6y14B0Zms3swu9Pl8Z7gbBJYFmvi0MkkANbUR97Nq1wdP7wW179P5/zE/O+vWHC9ZhkADlgK+2GtbZWWOxAWCm4ZDICpBiQCwGgygYgvEACVJJ0lD4GMXjwXJJtKTBnnfXV+z0exMcEHYjU4POiq9Zjx5B1T2g8GB8MKXifxtS6vBGR3T/gAaMmFzS7RAAqYtkEkupsUKZ0OuT2qlbqf4ilRZoi4z9fDkprXEeKVY1UXZUu0JSTrm1xz+EJmx2dwY8X4pPiDQzJtx3Bu+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(316002)(186003)(2906002)(83380400001)(31696002)(36756003)(86362001)(38100700002)(31686004)(6486002)(478600001)(6916009)(54906003)(2616005)(41300700001)(6506007)(5660300002)(8936002)(26005)(6512007)(4326008)(66476007)(66946007)(8676002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUNoWFFqcjUyR2NMOUlod2pWbXlZTjIwNzU2Q1V4T0pNaGorTkk5bG5tZWJR?=
 =?utf-8?B?Z3BJd1B5Y0tZOUUyRjNTY2xvSnpOK0JHT3l3WVZzUUVFbWdzVVF2K2plMTF6?=
 =?utf-8?B?cDNLekhnWEJoSFZ4enlBeWs1bnpBV1BCNkVEY3JDMlhFSVZZZks4eWZxTzlr?=
 =?utf-8?B?QTc0ejA3cU5nelZuRUw0eUE3SlRYUWhDdVRUSkEydXE3eWRUZWVTdmU3bVR2?=
 =?utf-8?B?NmVSYmxBam1BQVRyY2NaUThwa1F2dWo0dkdZYi9VU1lUYUtKaStrdDVMKzdI?=
 =?utf-8?B?a2l6TmxqekhyL2c1U2pYZUJzRDFLbk1XUERuNFFhS2h2Tjk1VWlXMy9tWGxu?=
 =?utf-8?B?a1o5aUs0TkhMdzFkMEdPcWVMVHYwT2lEUmpSUXFvbmNZcFUwenlXeG9WVG5v?=
 =?utf-8?B?RTgwTUFIeWFkY0w4R3VMR25ZOGdPT0lIaTRIRlFSbDliTjFad0RvK1NUVndU?=
 =?utf-8?B?Y2dsZ21FYXFhTjhDd0RnY0Rld0g4VWFwcis0ZVVzSDFNRlhFMWRabGR1N3hr?=
 =?utf-8?B?b0ZNVEphQnptQk5OSkZJV0ZEaEdJTm9ZTS8waGpHNlNMZ3ViT2U3dU9CcjZC?=
 =?utf-8?B?eDVuVmJ4S01EMGZHVXlqODhtN3FyWmtKemdBeFpPelVPQnFmdGYxdFh5cFl1?=
 =?utf-8?B?L3ltaTRKVU4yc1RDNVRvVndoMHJZYUc4akIrbElPdVFqRU00VlJHa2xsM0pl?=
 =?utf-8?B?RVY5V3p5WDBQcTkrUnF2WTNaM04wUjNFVDlnZ3A1cDhpaGpwRWtLU3hQVUxs?=
 =?utf-8?B?OFU3UVd1NXhEQ2VCS1BwUkVtQjBzdU1lT0Y3M3h6cFRGM1ltR29hTXV4cHlC?=
 =?utf-8?B?YzlkMThaZnVhK3Y3VEFvakNJaWsxQTlRQmhqUzNoRStHV2orVDRoRUQ2cTJY?=
 =?utf-8?B?cXZ0ZU0reEFPSXBPdTZSWThzRFVxTnErZ2hQQm9mNVlqUitNWUxLbUh0ZVBT?=
 =?utf-8?B?ZXJ3VTBzZ1VWMlA2bHAxRkRQQ0JleFFtenQ0WStnbXhybzFlVnFyZXd3eWs1?=
 =?utf-8?B?SGQ5RVRjelJmTzcxRytuYnBJNHlqZGN2L3JlTWFuQWFneStHVWR2L244clN6?=
 =?utf-8?B?KzIybTJDK2kwRnovbTM5UC91dk1GZjRLaThGUVdFdU9xa3RPY2dacU45MEF3?=
 =?utf-8?B?TFVtQXlCbUoxWW9zbHN4QmZabVdIclFYRVNHL3NEa2pOVTEvdnlTcnNNL29s?=
 =?utf-8?B?c1ZxSE1mTUlySzk2MUxXVXV6MUhKK1RlYUhBMHFteUZ2TVRLU1RNRFRLUGVB?=
 =?utf-8?B?d0RZNENRc3d5blRqSDN6bGZXdWFMZVFRc0ovSEI5L1Z4R0FDS1hybERxNS81?=
 =?utf-8?B?clFia3VBTkNBNExiZzk5YnMwOU9SSUtUY3RxSUhKcGYwNjV6Sko0dFhKOER3?=
 =?utf-8?B?Zmh4anRIRlhmN1NjNFFtL0Z5eWxhdHRnR2lqSERKL3MxakF1VlZueEUxd251?=
 =?utf-8?B?Y1hyMHpjengwSURPREFVYzVZeGhncXVya09PWGdka0tZMThGaUphRmhRVFFQ?=
 =?utf-8?B?MFNqelZ4WFRSNHBlUy80andhM2V1SVQ2RFhsVnZVaWRjT1R5MDlKQlp5VjV0?=
 =?utf-8?B?Y1B2SkNySUJpNGNFQmxFdW5ud0dvNlpqWXZrcGdmVGE0ek95MUQ1L0l3Y0Jw?=
 =?utf-8?B?dG15OFJjYjhlUUh0RUsyQzc0ZTZzYWJlTUZBN3haWEdaWU1SUE5hTHA5YklP?=
 =?utf-8?B?dEJoazZVNU1QWEtEMXJReWFBeU5aNUlLcGI1VFNBdWpHSzdhVnlRUFFmTURR?=
 =?utf-8?B?bGpjeU1JbmFLZFEyN2IzZC84aEpTYmdXWXB2UmpPTHkrRjErMytVTVBHOHBR?=
 =?utf-8?B?dXlYVGxKeGEwZ1FuQ2cwTmlCQXZoWVM5eUNPMHdjS05CeDAyZXIvL3FMNURK?=
 =?utf-8?B?bU5OVDlKUVlpa1pCUFY2OGhNcTNzYVVSMUFQNFJXZld2bHBnSm1SZFBiRkNw?=
 =?utf-8?B?NDBoOFk2RkhUZUNHczdNdmlscG1SYjlibHFjL0gzdnUxbktVUmZrVzdhWXNU?=
 =?utf-8?B?SHB1cUhwTXhvakZyVkZ0UVZFenBjY1lvaGY0dFZuSHFlVGZCdzNXY2RiZkRa?=
 =?utf-8?B?MjNwMklmbDBGQzNKQURZdi9XUXRIdXpIZEs2cmxkWFEzd2kreWNUWi9oQ2FB?=
 =?utf-8?Q?vU8WELX2EOMNkpVRO1r4rqziY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1350ba36-13f1-43cc-5d77-08dab1a5d51e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:45:03.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1F4PrKNus+XtsfTrp2xvWHMg25bdippVu7hh+UXefZ2C87cA/wVJWINKDBIdjL2CUvooMaqqJeUOLy/s1NsUhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

The registration by virtual/linear address has downsides: The access is
expensive for HVM/PVH domains. Furthermore for 64-bit PV domains the area
is inaccessible (and hence cannot be updated by Xen) when in guest-user
mode.

Introduce a new vCPU operation allowing to register the secondary time
area by guest-physical address.

An at least theoretical downside to using physically registered areas is
that PV then won't see dirty (and perhaps also accessed) bits set in its
respective page table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1520,6 +1520,15 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
+static void cf_check
+time_area_populate(void *map, struct vcpu *v)
+{
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.pending_system_time.version = 0;
+
+    force_update_secondary_system_time(v, map);
+}
+
 long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -1557,6 +1566,25 @@ long do_vcpu_op(int cmd, unsigned int vc
 
         break;
     }
+
+    case VCPUOP_register_vcpu_time_phys_area:
+    {
+        struct vcpu_register_time_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(vcpu_time_info_t),
+                            &v->arch.time_guest_area,
+                            time_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
 
     case VCPUOP_get_physid:
     {
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -115,6 +115,7 @@ compat_vcpu_op(int cmd, unsigned int vcp
 
     case VCPUOP_send_nmi:
     case VCPUOP_get_physid:
+    case VCPUOP_register_vcpu_time_phys_area:
         rc = do_vcpu_op(cmd, vcpuid, arg);
         break;
 
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -684,6 +684,8 @@ void domain_cpu_policy_changed(struct do
 
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
+void force_update_secondary_system_time(struct vcpu *,
+                                        struct vcpu_time_info *);
 
 void vcpu_show_execution_state(struct vcpu *);
 void vcpu_show_registers(const struct vcpu *);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1524,6 +1524,15 @@ void force_update_vcpu_system_time(struc
     __update_vcpu_system_time(v, 1);
 }
 
+void force_update_secondary_system_time(struct vcpu *v,
+                                        struct vcpu_time_info *map)
+{
+    struct vcpu_time_info u;
+
+    collect_time_info(v, &u);
+    write_time_guest_area(map, &u);
+}
+
 static void update_domain_rtc(void)
 {
     struct domain *d;
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -243,6 +243,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_ti
  * linear address based area will not be serviced (updated) by the hypervisor.
  */
 #define VCPUOP_register_runstate_phys_area      14
+#define VCPUOP_register_vcpu_time_phys_area     15
 
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 


