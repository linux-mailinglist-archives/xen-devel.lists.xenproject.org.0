Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3242FB63C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 14:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70365.126268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qk0-0006zR-Td; Tue, 19 Jan 2021 13:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70365.126268; Tue, 19 Jan 2021 13:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1qk0-0006z2-QS; Tue, 19 Jan 2021 13:08:12 +0000
Received: by outflank-mailman (input) for mailman id 70365;
 Tue, 19 Jan 2021 13:08:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jC7I=GW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1qjz-0006yt-5X
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 13:08:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bb3706b-add4-4b46-8b7f-bf5c8a46f4ab;
 Tue, 19 Jan 2021 13:08:09 +0000 (UTC)
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
X-Inumbo-ID: 9bb3706b-add4-4b46-8b7f-bf5c8a46f4ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611061689;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=nWWGNPelhmRYY/0YF2MA98R5A/f0Cmbbj2eElAqCaZQ=;
  b=I4TviDudeY2VAeYMC8xGaYVb8DDHZs7Z4SQS6NZ3XkuvYdEBLFHgbOqa
   C52XrNiyFjF2s+P4o89f77IcJpV/r7ao6hcV5CBK17JSq0jtAsF7oITz5
   N0VKABjHZWgj3VjSSUu7kC5cl1uFGZoTC/svJk3kIPxJhzTaae1k/kG49
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ldAoJ53U8Qx+5moKlP3s9BpYHrZ3ZLHnMhJB0+mLJcfBJIr1enAp6Q7MuM6QjNC7JiOMRouC7q
 g17qK2/jOxOTS9dmg/GvCI1dRq3zfFCNSapyuJf4wqIfNebH+E7tj8BtQyf+SvSzGUuw6doL1U
 637gLzemzDkiLw5tSHNxxZTTAjhdTN+3oylE3isHfmFlmRCWlUyGYcc9B6s3UZ1+An0FxEyMtN
 FuVp+ztPtxnrztpaKvqT8kGwcPJXuZfLCv/SvBHbQw/jOM0rtVI091TDoTtxKbRcXUQYwtAG1A
 J90=
X-SBRS: 5.2
X-MesageID: 36662776
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,358,1602561600"; 
   d="scan'208";a="36662776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEscXi4AZPztcDFRH8OIiSmfqdEOpfMgdD7JSItx6DkEoOE4ikS1IwHo2LxXv1Qzx2nGbq/dGiqFF9gCEAuAqZ4nLbC37HEUdYS6Yb/t3rVa50wuq7Cq0zyMSFCWhE+fpJ4sMHAii8EoekK72u1i4qnn3GKR/FnAK+WkNYcKoAfWIjZX7v2rufBU/29HsrNeIiG6YmUity4DHccjUT0Hh9k2ocIR7alZ/4V7nluncf9cuobxxNiq7i01yzg4vWOFfAgJ2mPjpkWtvQuhWSzdZ6h1YC5dqVTkf4SsIRg8TP6KQMBrSSrD8VO4SqZaEaN2MN3+vkw3MyztcktqZRIBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFna0gylKm6LftpF7LFT1HlbwT0SCRUUdEthkDBJJQM=;
 b=J6fUiRCFDiCB3pSCCBGeL5Y+wV0DTx/9eoKRzf2LdoDLUg7kBDzg75sSx50zvUmgamtcLGA+w0+4g0lMBsasorQCBoKIF4hsiTTeLJLnQqnhV45e4Dq0b0t+TMYJHLfQfCIYgxHmh54mOz+6+03zPz+hyyEBNmHwMMl+PJEmmHCsLpBLqIXHk+oISaEMT4Z1kCZOFSM1QkVs0+bCbpfN9K53Urn+8H65TlMbaNxu8Gr3hos3yezs2ZLdHp6whQ6cpJ2cSm9EdLsSkAfneUR0CKgy/p1iQJoDmL1O6aNxNgIPw+qaZ2qa/WDzkNGnQi8oiixqNX3JKTYoyDu2aMlqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFna0gylKm6LftpF7LFT1HlbwT0SCRUUdEthkDBJJQM=;
 b=Ksc9U2S3HAt2ZxAhZQ1X+lTwsPzV6sM7b49b3dzC1yTjF1EeIGfea84UHq2yckx9DZXvTnPOo32Td9uIIfCcgoqPkX0KNBjtY7jWsA+EhdEBqnnU3xZYR8duTEByFXC9/mqPXVCkFbDv07teS5SdvX9JHrI2msezbTR6YxO1BH0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/CPUID: unconditionally set XEN_HVM_CPUID_IOMMU_MAPPINGS
Date: Tue, 19 Jan 2021 14:07:59 +0100
Message-ID: <20210119130759.98296-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::42) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8267ec4a-01b8-422d-3a6d-08d8bc7b4278
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB560859FD2BD0511FB18D72208FA30@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mS+tqKYW6ca89QjQDFfMWw5V6BkIQyD988W/MgXdp2IA8K98G7NTvjPmUK9y5tQYUNJQY43zrHAOetJDFdw2j8olT4IfpVwcGU8lmaNKh66pApGCxjLiXcXmvNSsRqIYuLKMBXWSgKvSOTSitomyk0UrRBHgXUQOTEG05Rj7P1dXZIJWvDhN0nY85bIrwCZ3IHo1WDY1MY/m+5GVpIUeb6fFtFB+zepf5bzUvMrGFtHJsa5MKoeWfdq0rdHVJTJIPCM0+mRzFwzHG9Un8uNoCWmYVDHX9ef6cO700QSYF/kdyP8Rf35ti4ctBnXnKLRZhmwWGk2bbfDcudxngZ1L996EesW/+xxju72Pq2KS/xQQyn4faQchwwgPx58h28vi2J81mBlDTzXSua/KZwSYbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(86362001)(6496006)(4326008)(186003)(16526019)(54906003)(5660300002)(6666004)(66946007)(1076003)(66476007)(8936002)(66556008)(316002)(6486002)(8676002)(36756003)(83380400001)(478600001)(6916009)(956004)(2906002)(26005)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFM5ZVZxNHgyREU0ZmZudEVlZDVqS0thZE5wVzloNkZ0WUg5cFVkQzZUVFVq?=
 =?utf-8?B?N1FWb2p6N0FvSFdvV1o1SDlNeEhUQ005U0t6SEhMNHZGNTVWL1VBOHh2UCti?=
 =?utf-8?B?ZVl4MGViSjMrc0lRN25ZUzBiOTFQenQxck9KL0hzUVdiOXNpN2wrcHdsUzlZ?=
 =?utf-8?B?S2FJaWJXL0ZMS2ZqTzI3TVowM1RsMjZmN0ZUNW0xWWtyRG5tUXRDb2lKVGVU?=
 =?utf-8?B?cmQ1ZHVkbFlMZ2o3NU9MdThlZkZlVDlxZ0VmeS8rMmVBenJsc2dDU25DY0hZ?=
 =?utf-8?B?QjZBMEp3K0dQRTZHQUlmUElHdnVrTG1tK1YzdWFReFZmNEplV0ZySWhJdkU1?=
 =?utf-8?B?MTlBUk83UnphWHpCM3dLS29vaFJENW4wWUI0ZnFYNHBjelhUYWZTRmVGR3Rt?=
 =?utf-8?B?V1oxamQzRG1JWkR5YmorNFhEQlFWNHpvdUY1clpEZUpaL2YwVlJkQXVGeWlx?=
 =?utf-8?B?cjd0dEFTc0FmeVdKY3dZWTVvNmJKWDNtT2QrY1Z4QVpRRStGVnU5a1R5clRO?=
 =?utf-8?B?NENaVGM2K1hFRGx4RFVQOHp1QXo5WmFGQXUrTmZCM09meHg3bDdLZzFrN2dQ?=
 =?utf-8?B?UzNnTlVsd3JXZFUvVjhscEZTWjlKMWpOYjRIVkszMzd1d3crelFBb1ZNZkR6?=
 =?utf-8?B?Nm1ob3BPampScDJnLzJsY0xhY0hoSzlQOC9jQ1EzUlErRUI0bWV2a2FDYjBM?=
 =?utf-8?B?OThpQ1ZTVm5NVUhwcVFiNkxyVWlxcmkzbTcvWkhaa1huRzVHckNpUDZwcTRM?=
 =?utf-8?B?Y0lJQjhaaHRKY1hxME5VbXRpT1NNenVtRFZGSnRPR3lsMmN0TU9NRkNLTXBk?=
 =?utf-8?B?ZXVBRTVHRVdvb250eHNsNlRvaGNkdnJxMGszUVlmeks3bENXM29jTkVSb2ta?=
 =?utf-8?B?K0EwbERNTnRWTTVTd3BWSStETElURjZXbVRQb094dFV2WG5OK01pdW1TTTVP?=
 =?utf-8?B?OUtpSncwVEJMbzZ6Z1NuNkZPSW5pMG53TEswMzhlNHA2bDlFUHFvSUR6RlMr?=
 =?utf-8?B?dElVU2FIeEN6a1VkMjVPcVZTOGxqWTNKK0FKYVd3S1lvMjlUTi9PcDZaaXRl?=
 =?utf-8?B?N0JRK1JkMHRIVnd0WHE0dTE1ZzZCeGF5UTdPTzIwSWYwS0YvTm1rM1QzVmtO?=
 =?utf-8?B?M3dxUS9HSEdURFB6QTloYnZCRStvS2Z3ZGk1L3RZMW1oRlA4MFZsUDg5MlRh?=
 =?utf-8?B?bnVsUmEvYnZhaS9WTnJnaVNzb0ZPeEhibW1pOEhkSFI4aFNCYU95ekZSUnZE?=
 =?utf-8?B?b0tNYUw0NUNvS1hxOFRGODhXeEFYSmlDTU9rbmlGUjV3T2xkZkhPamtDeDB3?=
 =?utf-8?Q?+e2nifUeCECEtBo0n3MmwE9kUWTLlIptl9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8267ec4a-01b8-422d-3a6d-08d8bc7b4278
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 13:08:05.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39YnOQjEm5Xxcvss5GIiq0m48xFZ8x925r8vjI0wWAh7or4XV9IDNIKWqdPLJccHDhDUduG/X7G0BYvDHU1Dqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

This is a revert of f5cfa0985673 plus a rework of the comment that
accompanies the setting of the flag so we don't forget why it needs to
be unconditionally set: it's indicating whether the version of Xen has
the original issue fixed and IOMMU entries are created for
grant/foreign maps.

If the flag is only exposed when the IOMMU is enabled the guest could
resort to use bounce buffers when running backends as it would assume
the underlying Xen version still has the bug present and thus
grant/foreign maps cannot be used with devices.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Expand commit message.
 - Add slightly expanded comment from Andrew into the code.
---
 xen/arch/x86/traps.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4bd2cb6a1a..a6f1d45e77 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1049,11 +1049,17 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
             res->a |= XEN_HVM_CPUID_X2APIC_VIRT;
 
         /*
-         * Indicate that memory mapped from other domains (either grants or
-         * foreign pages) has valid IOMMU entries.
+         * 1) Xen 4.10 and older was broken WRT grant maps requesting a DMA
+         * mapping, and forgot to honour the guest's request.
+         * 2) 4.11 (and presumably backports) fixed the bug, so the map
+         * hypercall actually did what the guest asked.
+         * 3) To work around the bug, guests must bounce buffer all DMA that
+         * would otherwise use a grant map, because it doesn't know whether the
+         * DMA is originating from an emulated or a real device.
+         * 4) This flag tells guests it is safe not to bounce-buffer all DMA to
+         * work around the bug.
          */
-        if ( is_iommu_enabled(d) )
-            res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
+        res->a |= XEN_HVM_CPUID_IOMMU_MAPPINGS;
 
         /* Indicate presence of vcpu id and set it in ebx */
         res->a |= XEN_HVM_CPUID_VCPU_ID_PRESENT;
-- 
2.29.2


