Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788382F7ECC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68235.122113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qbn-0006Q1-Uf; Fri, 15 Jan 2021 15:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68235.122113; Fri, 15 Jan 2021 15:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Qbn-0006Pc-Q2; Fri, 15 Jan 2021 15:01:51 +0000
Received: by outflank-mailman (input) for mailman id 68235;
 Fri, 15 Jan 2021 15:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Qbl-0006PX-Si
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:01:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31acbc8a-4034-4844-887a-52874d056499;
 Fri, 15 Jan 2021 15:01:48 +0000 (UTC)
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
X-Inumbo-ID: 31acbc8a-4034-4844-887a-52874d056499
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610722908;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=m/GpP1Qd0vBazhhzpoS+3mNDOzqUacvggH8IwXLbUHA=;
  b=g/Y2ohuYXG3YQkXfM8UbacXu2Un5YhhsWOP/lXglGJGPdY09sV0VV85J
   hG4RSSeYn93/MMOZ5tHFEYe5sFPLUvzVFV8UhEODhwg8LZWIHO46PVk1T
   SZRAsme/f6KrMhP56h/3sdSJ5DgsXnWc1VeYGGj1ml2GshjDC9PHJHmZO
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ky8z+JyekCDkVUfBcvWCVnlr3B95zXzJsU1w9RRFFWXYdJn9o6mGfWzMFARpvM81L5BXq9WSFr
 QeFU2vZwmLDFSVp6adFCvZedMAAFvqzjnKyq0BQ6zEgdJKSNHy3GTy+suYvykiHIVUbeQJxHfB
 U+O8oBK2S64o8ixO4z9qMT281Bl6QWY9cfgboM0CAP1EKaM7ruzMnwvGFIJNJko2RgVrWOKHcg
 vhNsL7WC1L8k0TEr3hkeckDzE5hf0zf8AzPQTpH8LvFtS5erHwc0ZVhP6st+SoKELiHqMOiSnj
 muM=
X-SBRS: 5.2
X-MesageID: 35550913
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35550913"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZHTZ/H7QOjRE5BdT+sywK9urRzwoLM68+Ov9wTBhT+vSDbrSqiuoSoGCF1rO+okdUTbOd5DFr+9u8tODFgRsbJVY1hqGHvx3GMsYqeiTCxBdUDJLQ9e7In6W4CvX0ShnV6G1E9ar4x6Z4yNS7Ky2+AXb53yXTK+Z0Gn347VZJ9xvAlUxFYi83yTDwWRPiuCh53RM+1dkIRYjEplarVwnR1xzGD8rQT0/PX3txZBWzsmLzUOhEAc9aJBYajBYLPNUavzrFlDjXufSppoI0OSOlEd6sH3XD8LjRnHWstEkX04RxGik1oHY3o3y1qb5lJOezWxyBzkxk1qvvHFCWqLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8a0oZZtkRzO4sGC69PGNOrswxQ3kIqY/+dQJSecbxY=;
 b=miSCLxtatulA9GwbO1gJzjXu9ePLuiBDxpNIZ5SIyVdXub/nz26hNJV691bSDk3lPAmAvAR3FTImyHtIAqovz0vt9J9dw7KpvOqUVuBgw+NHPgwJzasBH7ODE1XZovvXwKBbWpRmv0R2qCziKJ/Xd0O96C8YBkp2dqol+Yqy7rEZ7XG9vluE8nDlztkdZ8dop9x29cLcHarWpkU4+IiiR9qQ+VfEl8Ox6tA7eXwq1iy9lAfaW9IwlU2sLI0hCjHROB0onx3uG2JpQ4XEOX85vadY+aYspcwTFFe6/l3kUQ+EU6U/3C5qikeIIERUmu4M8H7JHtinjZ0iLWKpDNorGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8a0oZZtkRzO4sGC69PGNOrswxQ3kIqY/+dQJSecbxY=;
 b=H/fwtqvXoGmehQug0/+dttUjp5kH0e0qrlq6ZFhKgGw2TyMx42MBE+Axo8FrYUp/KcnSbdIzOpif/Y5ieorjYpU+G4d9JHVx9DrzoIdRzgCbxXDzhzcL9Q4hhQGuBczGlmEaGW0N6yDcP+wyQI8/pn2GKkIh2WjKFTlGfYiMEPU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/CPUID: unconditionally set XEN_HVM_CPUID_IOMMU_MAPPINGS
Date: Fri, 15 Jan 2021 16:01:38 +0100
Message-ID: <20210115150138.36087-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bba29b4-608e-4123-2c43-08d8b9667943
X-MS-TrafficTypeDiagnostic: DS7PR03MB5590:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5590F93D94E474D3212E103C8FA70@DS7PR03MB5590.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aIfkwK+QmoWRR2pD1Y1QqFBfHVOaTyWCsJj/RmNli5xkswt+L1/CDn4Vf5Sx8O+JOr3Qi+5KrYwCrNdFAy002fxxcOXQNRnTNgM8yk3mdlEWDHm8HrszsjL5M3X0qXVgd544jXcUJdsxJFjbK04JPRlPR6QAIW3aat+fEmHhdD/U6lW0h0pQ/AjMRKTsWeufX3sfXqjT+wl/Lg3coSs1o/r1HP83npyBunBOYtC8R0QmwwbMtoOBAfSCCG6u46NuzVIII5/UaHOSj1bBe4+kGn2+1NuqpPHW3r+qWD3BS7+OC3qQvp3BcLYAgE/Eo/WQYTtZ4c5KSfz0OCZG/2qypWVAx217LFh+t+5qFjXVe9e4we3oXo2LSFYur6FdIyikmZHxhsiM70ZZ0oCS4eoi9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(956004)(36756003)(2616005)(5660300002)(6916009)(478600001)(66946007)(8676002)(4326008)(66476007)(83380400001)(8936002)(6486002)(2906002)(86362001)(6496006)(6666004)(54906003)(186003)(16526019)(1076003)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YlQ5SmZrLzVETWxHUmN0SERkRjRGOStJWkZ0VFI1UWdzcWNCL2ErNm9nb3Rt?=
 =?utf-8?B?R1U4RXFwaDgzbWwrOUVHdUQ0bEI3T2JaR0JPeTZSMU1vczUvblorcTBvc1pX?=
 =?utf-8?B?R1VFMEwwMml5UUpnNTI5ZWVjQjJ2L2Z0eG5HeEZ6dkFJTGhQOXJuUzBxM0tL?=
 =?utf-8?B?bUtDaHBGbFhzUGRLVTV4aUt6Rk8rVTRiUkExd3lOOWdhVzlZZml5MnBqTjUw?=
 =?utf-8?B?Z3pSNzJ3MmFGOVFsdTBFdC96dW5kRkM0cXhJZ2lRTDRXVi9La0g4TUR1OU5j?=
 =?utf-8?B?NzFRSHlpc3c1blQ4OUMwTm5jdmVTdVJrNXdXekVRSmc4WXdXekQ5ZlhEekRC?=
 =?utf-8?B?TGE4S0dncStoVjJyclZwZjhhWDNOelgwaEtrTGxJbGJPWlVmNkdwcHBlNVUw?=
 =?utf-8?B?Z2hYbEUzc2NFRmhUZlJpRTJoRDFCOWtKM3NjdUFkVC9CcWl3MUZ3bEVtK1dU?=
 =?utf-8?B?WmxJVWNMQ0xPYTFiOG1ZNnhFK1IzTS9wOHlZOHpqL0orN1Yybyt6MStDRjUx?=
 =?utf-8?B?TDZxYUtVUU1IaGlNM1BFT1YvVnd6M0ZzOXdmY2tIV3hBcXd2cHV5RWk1Q08w?=
 =?utf-8?B?SWFDbzB4WkRiMkdzRnRtb3BSN250MXA1MlBKSDgwbktOamU5NGVyNURGOEIr?=
 =?utf-8?B?TEtZVnRoS2ppaVY5Ylh0djdGWGlKTkk4QW8zVGFVYnNza0h6QVVpUUJ0UWVv?=
 =?utf-8?B?OGJnSkFqRUxUT0U4UUloMUpsa3kzd0J1U1JYd1U4djB3UE9SUlNveDFlVFpF?=
 =?utf-8?B?cHNJWUVUZS9vUGpHMnQvdWpnZFBqSVVJazNENE9sd0ljNDNYWDZlbGVMMmxB?=
 =?utf-8?B?cWNmNkRwWnhRditGbm10b0daUHpSR0FlVzJBZkdBaXN6V2Rvc2k3dGdSWVhs?=
 =?utf-8?B?cVpPK0psT1paTnEzK0pnbVlubXRMWTdjQzFkZWltZFJkMmxvcjhBbE9yYXBa?=
 =?utf-8?B?aEZDMzlsSFhhQWM4NlI5Wm81UlRsd056U1I5Z1NrcVh1dkRKRzdRck53cEYy?=
 =?utf-8?B?NHdmUDRzdDk0L2pCQTNvTmNGZUVFVmFDMmRETmhTRUJ4ZXYxbE5GVy95NFVh?=
 =?utf-8?B?N0J6MnFOOTN0S0xqZ2VrNE90NGgxQ3JDN1dob3BuUytLL2lUSmdjeURBdFZa?=
 =?utf-8?B?WUFTNE9talBpS0dxTjl0ZmpUUnVwOEJnRTlrK29Hclk3S21hcUJkOHo3djdw?=
 =?utf-8?B?SDBINDRSWUxkc1NSVS8rZ1BrWWZoMHlVVkgzSnEzOThLRlZZa01Qbk84UkZZ?=
 =?utf-8?B?VmpwcVNZN1V0eGlpa3dESW1udy83MVNhYlA0bnR3L1ljSDFiby82d0JYVmd6?=
 =?utf-8?Q?Gg5Y5khv2mS8+Vffs52/cTTBqXxtAshQGy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bba29b4-608e-4123-2c43-08d8b9667943
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 15:01:44.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15XTJcuHGkQKAO2MBKQn0Iv5o/p1odiCxKGrslBEwbsQK99qTRaKxcL/fBKf+ip5hO4fyB3UXtFN6oRJJbRshQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590
X-OriginatorOrg: citrix.com

This is a revert of f5cfa0985673 plus a rework of the comment that
accompanies the setting of the flag so we don't forget why it needs to
be unconditionally set: it's indicating whether the version of Xen has
the original issue fixed and IOMMU entries are created for
grant/foreign maps.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/traps.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4bd2cb6a1a..d491b1741e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1049,11 +1049,10 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
 
         /*
-         * Indicate that memory mapped from other domains (either grants or
-         * foreign pages) has valid IOMMU entries.
+         * Unconditionally set the flag to indicate this version of Xen has
+         * been fixed to create IOMMU mappings for grant/foreign maps.
          */
-        if ( is_iommu_enabled(d) )
-            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
 
         /* Indicate presence of vcpu id and set it in ebx */
         res->a |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
-- 
2.29.2


