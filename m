Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 384922F7E29
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68152.121941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q65-00016d-3a; Fri, 15 Jan 2021 14:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68152.121941; Fri, 15 Jan 2021 14:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q64-000167-WE; Fri, 15 Jan 2021 14:29:05 +0000
Received: by outflank-mailman (input) for mailman id 68152;
 Fri, 15 Jan 2021 14:29:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Q63-00014z-6p
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:29:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d4c452f-d9c1-4c49-a6c1-00213c58b261;
 Fri, 15 Jan 2021 14:29:02 +0000 (UTC)
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
X-Inumbo-ID: 4d4c452f-d9c1-4c49-a6c1-00213c58b261
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610720942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=W1FdMa76DvAStvTIi5yNGho1mMSuZzpKNi3EbdkEW6M=;
  b=SGBSkiiW3NgWgbnt1gNn0Xjcyapxi6zSfG9q2BAKudSIy3kRaeGwyTM4
   XriTlHNS0EAqLSTcFcU9h74IcseNfJfRjCyJgHuzG3DFatRVQ3Gw5asfW
   t5JyCrtTe8ID6tyYsncTCeKe9Wj1iw7k3TP8NLQnKl5oV62Ih/rOQK00B
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qhP9+PSfc8bnjA9vdI4fR7FnTzveOWmHAxuTINkpXQ1DYBPRnPOWrhS1j5aKpMdBFGxoS7n+q2
 g3dv7g8/FgK7wv9P7Gk0si3Moj/G0V6pXLcOz83SaMNNPrb0ct7ZWLZOzNtRBo97SWor/ZNMcg
 4qEz1dndlv/v2eAnPKKzS16NCWukI9ptiZhmCHs30HEUKokGobK20eZm/mNjndiAZkT0RLx1WP
 mKPXr3JHnDXs8Nepk65HFsoULakZOMJP74wB6K41VfgeQzxyq2+Yr2tMgIn1tEdz+iEKunKWsn
 Z0E=
X-SBRS: 5.2
X-MesageID: 35547553
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35547553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgpHciDVM8+VgIEzXZAiKxCe4/7Str4arneY43Qt50BnmeAGymxO77fJPDWHlp/9XDOCrqguMvKfuHzZQigcrtbk1AJneld+hP7ZSyOfjnDnhK/kk/YxWUUKVYcxICZIinibgfVHOi4nvhyxQE6k5lU8RbFo8Yj4cKnSHCvqVS2GC+xTMBsxrOwZWs9RzDgrltb4hRVt7H2NGwtLya0qiDsj/q6DI8J18LEp5wdXce9/04w+ZryXJKWMTQBcRzEUsYQhvioPIOQmhry6I51Nz789ABBUvETPtaaUEBKGf41qa3oQkSFyT+F3r2CQiZFeTFFdBihdAsyHv0VHp6Yh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k3qiWlCgjl2Pt63ZLKagV8c99uNypFBX57XttI3SoU=;
 b=RRyXtH3Ri21e7O60goz2VmnoG/nT0pl7twZkrEa+QZwci7w42FrIVth+PVZUIm9P7I+QMCB7bgnLbIbta57AFQtufMZ3kjj4NOuRnRVw5M/i9erCshGKWDMaZqCU8D66/hFG1ugxQPVeTEMWELyOmVBaXvrMhRbADGItaC+9uK9qvSCDQzeTWHv3+EfEAUkmQWukB6a5TlWqffQGmCKalm4GzZ8XfhowiBiq7CejED8wQC1hMs0t79IVi1oPx9CVxHYe9f8BmiJaNGOmvSFJ35Oq0KvQFsxXjMCndPHYYEwl08kDxsTt8XWmZpXch+kFtIzD+/5ASchwPr41Ebqtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k3qiWlCgjl2Pt63ZLKagV8c99uNypFBX57XttI3SoU=;
 b=RZAdns0ixBw/AoSKxwjztMFgbsUtp6GMhmc2ERdHPqkHxa9e+GdoEYKaJN+1jR+2Jy3LZk6BrotmlUTMj6FPR3BVTyZhd3XGnrA00ZX3qGDKAXmKqPi+9SVYBA1kOZOKqRJGpURNHJoBYYYr1/sdVXDjBOpLi5axRCqmysRnf7Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/4] x86/vioapic: check IRR before attempting to inject interrupt after EOI
Date: Fri, 15 Jan 2021 15:28:17 +0100
Message-ID: <20210115142820.35224-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115142820.35224-1-roger.pau@citrix.com>
References: <20210115142820.35224-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0174.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58abbd67-e2ad-4a02-8bbc-08d8b961e522
X-MS-TrafficTypeDiagnostic: DM5PR03MB3147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3147D154B83D1A07827BEFBC8FA70@DM5PR03MB3147.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: okjluIkKoJSJEa5wsevBI39+vAe+ndu7hRfaA5h21EIGEAPfKB2J+4/9MfKIb3mYdUuR9Lmvm3pboQvL9pUAfrKQ/vOzjF/W6+cPb7YfDMb8NrChcnfyKMNdCH9oHST+u6tsLLac8+mUA7o4bBufGAQpRutlqs/JdtxPnP3I7oYRN22+VoPwmuDWoU/YAwVx+ZRdggxijPOrGqZJAFO58vSkylpHGitpOexf6sMwexiJxegAHSMCnkgm3xh97XVkxY+aIav4ksXCiY4q3Jotkj+IHXaW1T2Mgjbp8luo2aavVpnJg5SrppzO2VTzATjSmj5QGrHFhEkv0iKbrys/kiqcwKpnNrA65NojDl5c7cIEJ+NxWVwU9UpB2P/fEVSBIr+qM0Uq7fL9n2jQqEqgBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(6486002)(316002)(86362001)(83380400001)(4326008)(66946007)(6916009)(54906003)(1076003)(36756003)(6496006)(66476007)(66556008)(186003)(5660300002)(8936002)(2616005)(16526019)(478600001)(8676002)(956004)(4744005)(2906002)(26005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnBKbVZLNDVodXA4OEM1S0hSRUJSK3lORlU5SWZ0bkRrZkRCcWN5UklHMmhJ?=
 =?utf-8?B?T2t4ak9GQUF2Q2ViaDdWa01CK2hJVnJGQ0RYVUhkWlRRQ0xZMlo4SXpZcTMw?=
 =?utf-8?B?ekRGZUZLeEtKcVdBMHBWejFLdFZ2dEE1MERpVEVFTFZ0dTFyVWx5TWYyR1VH?=
 =?utf-8?B?NjFBdHY0RzVwN1dQWE4wSitOaU00UFpBN0pPclFTRzFtTCszWmx3ZU0rYm55?=
 =?utf-8?B?QWJGZVkvMWJSd2UzT2RhVVBLelpUTkJYVzBwQWtiR3h4NW16eTRhNVg3V3pq?=
 =?utf-8?B?YXZHTnhINnQzMldkbjVtbUFKQlQ4QkMrR21OM1M3ZGFnU24zYi8rWlVhWmVw?=
 =?utf-8?B?UDV5U05ocjU0aXJpOXhxanhIeVhMV0lUN2c5RElmQkNVNDNwNC9oVW1DcDZV?=
 =?utf-8?B?T2Q5YndxL245TmZ6MGVsZmxleDlobzlCbG1ZMjdYUjlaQjUzLys0ZWozMjlY?=
 =?utf-8?B?SVhYTFYvMU5Hb1JkdFlBVnRtVTU4UXMralJrM2VCZlZoN1REWmpFa1NlR0hn?=
 =?utf-8?B?ZG5FZmtLRDhXSmJwMDdqVXFyVWNxU2VIbVkwWGlmVkUvMjB5NDNackU4c0Fl?=
 =?utf-8?B?WllKeVZmeVcrcTd0SzNHcE1kaU4xdG5hMWRiaWl0dllnYmRhd1V2enByczBO?=
 =?utf-8?B?bWZYWFJVRXJncCswLzNENzZUelhNMW5tRVZ4dnNXRmE4SytTaUZHNnFkek4w?=
 =?utf-8?B?dDVhcndRVFZqTGZGUlFaVGpRb0M2eTIrM1FoYXgzcnFpWVhoL0UxZVNxRW02?=
 =?utf-8?B?ZGFBb29idUJyZElUSG4xUWRFdVd1dTZPMlZQQ0dVSnNIZldEZFZndlB1cGdR?=
 =?utf-8?B?TldiaTBzNHFNSlpmWnRMUU9lQk12WFkxSjlyTms5V1F1a1lXV3pKRW9MSms2?=
 =?utf-8?B?UGtOS0o5dG5HTXVPK2FveDBpUEYwdzNPbm1lOU0rZnFXaEw2ejd6UkFVMHor?=
 =?utf-8?B?NTdiOE1TTmp6UXJIWDZ0ekNiaUdWZ0QrV1Bjd05yWmtLWkwxdnRCaTBBRHg0?=
 =?utf-8?B?Q1E2MURDOGcrY1hhQzFyaDZWaEREN0tnbEVQS3ZuNERkS2Q4eHIzT0ozb0Zm?=
 =?utf-8?B?TytqTGVKMkgxZjdHVHBqaHR0RmprYlphNFo3ZWg0Wk9ZWDB0Z1VyYUNMZmtr?=
 =?utf-8?B?OG5wSjQ1VVZGQU1NcldrQm1xODFSY0NQZFdnOWQvMlpMZnBzQzRPT1VyVWt0?=
 =?utf-8?B?ZXFZV21lZkVEQ01YYVk3U2cvbm9aUVozY01abVJNOEZOckpQMFdtdjFLU01u?=
 =?utf-8?B?aDhoUDducXltQ1FaNWpMWFZ1SlpVQWRpWUJmSFc3VFpVdnlPdlk1ZHNWaUZv?=
 =?utf-8?Q?R5mYY9l6hO4FUBlbCGrBmMmkRMIvZN4x5B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58abbd67-e2ad-4a02-8bbc-08d8b961e522
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:28:58.2168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rLYvaqc/0G6uO4LCOyYxyo/dZBJq9iG+FxlDV23XkktdKfXpY31IqVsDOHaQyAjmQFhyIxIqi8tv1p4CkNY9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3147
X-OriginatorOrg: citrix.com

In vioapic_update_EOI the irq_lock will be dropped in order to forward
the EOI to the dpci handler, so there's a window between clearing IRR
and checking if the line is asserted where IRR can change behind our
back.

Fix this by checking whether IRR is set before attempting to inject a
new interrupt.

Fixes: 06e3f8f2766 ('vt-d: Do dpci eoi outside of irq_lock.')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index eb6c143f74..804bc77279 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -526,7 +526,7 @@ void vioapic_update_EOI(struct domain *d, u8 vector)
             }
 
             if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
-                 !ent->fields.mask &&
+                 !ent->fields.mask && !ent->fields.remote_irr &&
                  hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
             {
                 ent->fields.remote_irr = 1;
-- 
2.29.2


