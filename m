Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483B8C9FCF8
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 17:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176912.1501361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQpNj-00047K-P4; Wed, 03 Dec 2025 16:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176912.1501361; Wed, 03 Dec 2025 16:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQpNj-00044c-Lg; Wed, 03 Dec 2025 16:07:07 +0000
Received: by outflank-mailman (input) for mailman id 1176912;
 Wed, 03 Dec 2025 16:07:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy6P=6J=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vQpNi-00044W-Fm
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 16:07:06 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1aeeafe6-d062-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 17:07:03 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by BLAPR03MB5604.namprd03.prod.outlook.com (2603:10b6:208:29a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 16:06:58 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::c0cd:bcd1:5235:66f0%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 16:06:58 +0000
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
X-Inumbo-ID: 1aeeafe6-d062-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vo7bGGq71+Lpw5gyBCe78cOUb0WVmC5ffMN9MZwp0YYYl7TE1I9grROW/oI8OIOy49zAlp8vSUdfwrqwZjk0/PD4fvlzh5ivmYjqOZtzfrpH2mcYejlyLtVmvA8DiygGpvKMJ5PMsy8holqGGmEKObPH9zZcmOOe6occ+bURsHmT5uVzCtjdmANLIcSPIrdpV1Mx3agrHYBHaWozXtk1Gfp7Ix3xnb3aMRuVXqFl8HVjNoIzEBI4V+uLdoqsElWcbYe3aP+6X0M0N3lKhYSBkAVKwx6nplO4iRJH3SYBPafjrFXJjrnZ4o6R8iL2unVZonWD6qvuV275q5FLoGYKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REWVNpdysv7KaSa1XUg6pNxY7LrRMxapyE56yZ5LTjY=;
 b=fC4lp4SJ63LG63w2rSL5+n/zHA9YFrlqKCy6k8A6SAZhhPwnx236f7Qx5wZ0YoZVRdq4VF4GjzZEeyjdj+pyo+xrOXI0jZE4hQD+kD55x3eKjWyma9L200Hdn6EdzzteOFcO2rD7bzzZqYVk6szG3Ji3YEzo4t0Kf6YktdSdvbVbIOHfC+fDeSo5byNmOi4E29pM4PQ92MVDQ27O3U0useZWS6yMHAZQkDSOX87H3Z/jR+qyuMMVKO84VfV1N1nnWgZdKu2aXkshCGFk+EDSUGXgm3pbFBBaiYJIQDTnwfPoI4KmGYjxrLPQDIfA16F4nYncRhuh/eAiHrNIlCi3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REWVNpdysv7KaSa1XUg6pNxY7LrRMxapyE56yZ5LTjY=;
 b=tiFLwO6kEHe1eSWZ8QL2FmtHD/rZWM3DbetfgeDIfZTALu4iZKlUyP2PQi0Gwvvy/k/QFePtqptD8xjLGsNliEsZrPORU1B4NZEspiZ9NiiNE77clp02Oqrp83qMCKTWzbGPUG6XryqxE/taexBb0s7G2aIJz+3UGOtwnRmD1Aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: Limit the non-architectural constant TSC model checks
Date: Wed,  3 Dec 2025 16:06:18 +0000
Message-ID: <20251203160618.91883-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|BLAPR03MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: cd79498c-2a9c-4b23-d971-08de3285fc70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y+xJ0b7DoCdU/AFDuav8NOo1jFWNfwDL0Jo9jiddCuGDzwAa6Dt6k679Mzk8?=
 =?us-ascii?Q?/M1cZAaUkAm9fqOQDhkdwOAHHZHwYkd2evdMJn6mQ4yYKoFebgoUXp+4IFwW?=
 =?us-ascii?Q?03v5TKLAU5DDLL9LJKS+P8aLO1Y9lP3VrkP1dTMgAiFrVe+VNqW3Ta6Yu+z1?=
 =?us-ascii?Q?hw93tkvOySxcWoiWWxiqdQfiEhc+BTZoG1B6kfBicZCLHo6fjUMGGrmrDnYX?=
 =?us-ascii?Q?0Yof2lzdJfVxgV+6P3qZ4RpiAIl5DSVz8uTtRGwLJfYnXD4G/y/j6aS0C8tn?=
 =?us-ascii?Q?jdIHA7YmBw028BUkcQku4/JX7vE/ZyAkveRzYZQYRm7FleXe9Nepyb/fj7+Y?=
 =?us-ascii?Q?zGZgNPdBVwEYgApPHJ7bzxnr3e19wqeHvUKVix6ILMZQR9lZYyDbhJc1qHF+?=
 =?us-ascii?Q?0CQ9KfeDMrX32UGOJpDWJ/TwqgFLSbpJZZS1Cln3Z6zCaKYlTfBH8AdfjiUP?=
 =?us-ascii?Q?znhYZ3xF/G9SUJstmH7fySvwqYKFF67qlMCt1FJj2QmEbHWKbUmG4U87kQHW?=
 =?us-ascii?Q?tZ2R3HDQAePyW16FeOt/wasTtcS/KpC9Y1xjNoGLwqG7uPKyl/l8I/OzZxHz?=
 =?us-ascii?Q?4bxOvzFGeqQZqSekFAJyMH17OfG2oXGxe0iyuKi+6aDWxbjIp+cBium1vS6U?=
 =?us-ascii?Q?hmywV8p52tDJJ/2xuwWWC9q7c3l541XqvBJIh6/tX0UInFTXnsjgIsIfx1QI?=
 =?us-ascii?Q?zGvHBzK4aV3niByKTw+rFYCMEDDU9zHnV3TiF6j8tlIAVEf3mTM0VcZdizK0?=
 =?us-ascii?Q?z7rnjRz4QX+pqqwmA6uAg2rReaf7KLt1ruQUAOWItGD5N1CVaXDY6ojESEpT?=
 =?us-ascii?Q?Arw5foIyBwl2qj+hG31npB4uVxUDzULxUTUTCIJ9gc2vAbJRItUyMAJbSFq+?=
 =?us-ascii?Q?rhSCad99DAPVRH87DYwZNlN5kMr+BRgRN7QeD/b2NhvAWb9r1XuIkOT5Ka2N?=
 =?us-ascii?Q?U21iNDPDSsPaylXht3d8YmMp8HOeyuhJR335FuzMfeIGCUMcHrZIGeuKiqE9?=
 =?us-ascii?Q?uaNRhJZeQPHAklirQKxARcZvT6MsE7On+wvU8mKPVgr9QhozN85o+ox4xLYp?=
 =?us-ascii?Q?57cZzqhA2TVSYZrtSzJwdTp7THFdqq/KsbDxC2mk6rkjZrgdKJtPJJlUiu0M?=
 =?us-ascii?Q?aoxCg6HXV+MpmgJa5vZTe7LsadBvu3Hjuxsr+0ANNZ9XGyLTmHoF0UezgOX7?=
 =?us-ascii?Q?BPJvn6hUHTtc+pd2Lf27ptqk7iKtGaxhel3g/Qkwn1tRqliHGaso3B/8hhlK?=
 =?us-ascii?Q?DSI6GpQEar7g71b+ncAIp2P1nTs1fd6ulLwMlElaoXFToy8LSovs4xSF+FmY?=
 =?us-ascii?Q?bUMEg/syioENb48+lN4ds9mk2dNBFPezeRFoCUWT1vQg2LX3RDq9oVCJxKy3?=
 =?us-ascii?Q?jaCUgczRnjrHfuZOFdVe4aRwR7TUyb2miylewQ1eTxHG/7cBqt0YYkFFjHvX?=
 =?us-ascii?Q?VFEhzmkXnzmlkE1Js4BCKYtgqCEA91OH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3MdXFPYYQiM1UOmj634wXHHt3TsI5geazdKg+GGNZCUTfJZrdh4SEfUtpQ0Z?=
 =?us-ascii?Q?XnQDojfZtKXkLsUT7Uy6VBg2zy6iAj3UPg6KxlD40I3mVoRXkXhiwkNFsKY0?=
 =?us-ascii?Q?VCmNyxaJP2FVPDtim9H5Fp4QPB/f5i/xICogflyeoA4AT7A2fPg3TvcLm9Gf?=
 =?us-ascii?Q?yRwjadhtPjHxnyt/LXO0pLQAUn52++Nri5xHRYfMOY/xx/rUhHTyAlb0FjjW?=
 =?us-ascii?Q?9yUUbanobF/vS9bVad55gDcBbdewCnyqGE+UR2UaPlXoeXhPGXK8UU5Xy4bS?=
 =?us-ascii?Q?PV3yVAJZEYnarKFC+rgglNb4+5yXVmtFBvyQgJCZqXDOj0FHnzwxBe+8zJ9+?=
 =?us-ascii?Q?G2KfwSe5itlYgCc879uNNSwpAm5QAxr0gUHA+uil6RpReLLY7tQr1v68C8nm?=
 =?us-ascii?Q?bF5DF1cZid7uxeIqJ/L+NPOXBZAyzm5D9nIWzN34ym7+S21XnXP2JBFaIcfG?=
 =?us-ascii?Q?smy1MzENAvpNERhnZ0nCoHxWgDrLX/eFJtEplPrJCvc+T+hTl17EjaVPl1sl?=
 =?us-ascii?Q?LVbXrOOAKKRx8OA6eCmMlGVRAdQgbHQ0IRAyQ5un69yBlz2gHLcxl2qGKSxB?=
 =?us-ascii?Q?IeVWzjiVVS6hB6h1B7efZWslP0SnvLFqXyqSWghbyXrdNUmaqDCt6Z6RqNUb?=
 =?us-ascii?Q?HjWE03JWxChTO8JAM+8KKzWXk+MNMHM+SKq0rZpv3CVY7rsIatuclMMYo0VU?=
 =?us-ascii?Q?fAZIPaSuMX+AQ4EgmtIQhU35IAQbrgjko5i7ZHOhyLHCgtbZ++mUqh5MfStg?=
 =?us-ascii?Q?m02p4lofUD4FdLWRvTF4LZskqKP+gpUcTQeaJ5H2wyq0orhZoMf2Aul7VkEQ?=
 =?us-ascii?Q?qMu2X9Z6RHcILZhhSZkos35mjrUs6Yh87VWMZo3cZ2C9hTeABBhfmkVFl8Fl?=
 =?us-ascii?Q?LGYlRpFxIXrK3Knvr0x5Q8uXBiUdUUXNWmKr/XC3e6mSmCr6O3+p+Ah0zFOr?=
 =?us-ascii?Q?H2JuK0/F2xScCcmgsJMgmwoWtr07AoWl+B7GqnEzPYcNyvk3NPNtmbzev5T7?=
 =?us-ascii?Q?5BAlI2BM7wfCeiyWm6HHHx/8QPTqjSDj3r1UUeVHRAEtAHm9qFj83l5k+SjS?=
 =?us-ascii?Q?DNXKPO8cqSS6Zs3vRU9T7LLg8l9G3ORm3y7xQaCsgbKp9ecoHeMIAQBlAXxE?=
 =?us-ascii?Q?pFQcZilU3PmxY12O/l9k382JM2DbDekvApgsk0Gghz75T0SIFiuJ/WkCRNEC?=
 =?us-ascii?Q?W6RcCR30lQyhnsiBGmucV/PcXx3J3tOzSJKLEgbgArKaGmSZ+CtrDZv7SBHR?=
 =?us-ascii?Q?pa1cuZhrsMw36kOagGKA4ZR2CH0NEtT91QTX1p90pz0Uj/azc7QI1VpeBUSb?=
 =?us-ascii?Q?PWZoAvPOWZ1DjQI2r/qDpEtdH04asfK37InJEtPiANUG7inUyVV6dhj/dq+i?=
 =?us-ascii?Q?V6IwZTiVX6AR4ywnRhFLOZbdZ3YgYs59eOw735JZpfPKgoB5m18cZiSkVBml?=
 =?us-ascii?Q?gOVi8SzOEsip5vBXDkEWia0nPDv6N8QQnu/0EYFJEgka1b4VYci2Idu5CCDT?=
 =?us-ascii?Q?fk7d0EBY8+eeKn6nqLlMUgNPh56sEFHnRm4A5bLeYDWMfozwjPJQ1vcBrRXQ?=
 =?us-ascii?Q?c1gtEKTNKYwfd+E6RF21ujCMumFJsxZ4UC797WA6rvgU6IwKyUFcBMgYPpCk?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd79498c-2a9c-4b23-d971-08de3285fc70
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 16:06:58.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: INmB+HEQd9SftCHTINFg6NOx+uE94mfJevsrfS5O3IgmMDvCqIqoir7lnvq3LjXEwMEJzyKsqPUxaVZ82I+cbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5604

There are some older Intel CPUs which have CONSTANT_TSC behavior but
don't advertise it through CPUID. This change replaces the previous
open-ended check with a definitive range to make it clear that this only
applies to a specific set of CPUs and that later CPUs like Family 18+
won't need to be included.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/cpu/intel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 2bb9956a79..1c37179bc5 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -673,15 +673,15 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
-	if ( ( c->family == 15 && c->model >= 0x03 ) ||
-	     ( c->family == 6 && c->model >= 0x0e ) )
-		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
-
+	/* Use a model specific check for some older CPUs that have
+	 * constant TSC but may not report it via CPUID. */
 	if (cpu_has(c, X86_FEATURE_ITSC)) {
 		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
 		__set_bit(X86_FEATURE_TSC_RELIABLE, c->x86_capability);
-	}
+	} else if ( ( c->vfm >= INTEL_P4_PRESCOTT && c->vfm <= INTEL_P4_CEDARMILL ) ||
+	            ( c->vfm >= INTEL_CORE_YONAH && c->vfm <= INTEL_IVYBRIDGE ) )
+		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 
 	if ( opt_arat &&
 	     ( c->cpuid_level >= 0x00000006 ) &&
-- 
2.51.1


