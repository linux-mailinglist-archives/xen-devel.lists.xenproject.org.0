Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F592EF506
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 16:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63658.112992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtur-0006sB-7F; Fri, 08 Jan 2021 15:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63658.112992; Fri, 08 Jan 2021 15:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxtur-0006rl-2U; Fri, 08 Jan 2021 15:43:05 +0000
Received: by outflank-mailman (input) for mailman id 63658;
 Fri, 08 Jan 2021 15:43:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mh2R=GL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kxtup-0006rg-B2
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 15:43:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fe9f5ec-85cf-4428-9039-6ba052aff971;
 Fri, 08 Jan 2021 15:43:01 +0000 (UTC)
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
X-Inumbo-ID: 4fe9f5ec-85cf-4428-9039-6ba052aff971
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610120581;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=WsJ3R8q1Abzlwfy+PdIyuVuydrWf3tcHCXWVi7aeHcI=;
  b=iSY1zHhOlwEvkf3mwEjMR6ZBw5/LZkqZRWt1PfPbozQh7CPeL1ajedKH
   8eP/VeFVt+aU2cbKFr8cpTHyD0sEQ7XXS8PIqM84U6I8yEEpTqMREfWcc
   uawu83ai9F7uPhCUU4MoYWxJfG6JRDZJxwvl3PBA5XFbOvI5ikqWMNsvW
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JjGHQIxNuPDdRCZSpBaIPnet1/VdDZbFA+05YDXmrAkooj13g9OxxV4YNXRX6ZiUAj6d9PiqRK
 +VRiYN6xI7OVanWWoHpZsOOBoa3JCaLiFIq8+Y3zlEY8LGSE+gZ8CMnHc6BQQrUHx9pibU5hr1
 U9ZU8tch83DFCeDSGrheTdqF5Xyqrbh2Cuegqkt8TZhthALsdgAcDWoNm68kNbyWfd74S74DEG
 B4b2ADbAM0+Stg5biqYsYSRGWTRuyJ/K1HahbGH/dPDuvnYq0M4pojlnLCyvLa5SEte0cPZMs8
 ins=
X-SBRS: 5.2
X-MesageID: 34710529
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,331,1602561600"; 
   d="scan'208";a="34710529"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CM79NhvrqSHcreiMv4ZUxrz5rj1Qh8gxCrd5S79HIWbfbe2RaAq2TUyTmX5eiLKoooK4p+V+hHsr/EG6KUA85va1yjyjNKMHtbp4Rm3BWI2EcDFNmkMbXFcg5IFdovRMr3Q/PQP3aZW8nW+bztRQEeGySC8uAH6Fpr6ctZUgRWrLpdPNoMIxII/WZuKAXGYOqxxEumCZov6lhDpT+QHUxB1Cb00flPTp6npmlcj70RmRpMMN0VGmy9VOyP9GGnbA1W6dbbvqLoFn/cN9PoTZfyO+dfCiyWibYgV/T/Ykf1s/vqvF1koO9+9YLCgjCuNl6w5k8IQL+mV5aCbDjuEjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioQvLmuZDFBIvpdNm1+N34wjN2JNIwr0H4alDw1pBkY=;
 b=eKYP1D6SuwdouLznHHQqR5r6ZLBzwT+4XX5isiIO66xkVBiNk8OL/KZsKMtyezYiHXFOKymMvuNO4SzjLgDM7vO2sXsucHsUpP8uPpgcJX/rTs0inG0r7MR6ootO3L0ofaA2hqhppg0ii89D6gXiXgA+6kTa08Q6BFf7H/BojN04ckUN5pnJcDZUXPRhtk0bXRYew0kpfvyFzly77jl+jwII6aWtHGl+fDvXh+vVlHEMxG6ohgXyIw0wLMs9noiZkkOmwGfPYJjRaX5mOkFMPKwv0V/PBdfv1ax805dwpyleysqASc4Fjpq4BaOV7UuohuTl6owWOffZ1ITxasDIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioQvLmuZDFBIvpdNm1+N34wjN2JNIwr0H4alDw1pBkY=;
 b=LB6eNdoAl/XiBQ6ci+h8ugR2mILdxxtSIOlLrpFdLFYsaE6sphhw4p3oax0ZgQ7FcNroip4ntidL5LqNZOeuvwzGSckY1RuD+PbWnahB0x5WWUpLS1pSms4AICiwckWZklo2rCZRczVUVkb8rWbgzivOD3FrEZJah5wrr2hUiUU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hypercall: fix gnttab hypercall args conditional build on pvshim
Date: Fri,  8 Jan 2021 16:42:51 +0100
Message-ID: <20210108154251.59952-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f877c3ec-c1db-4ccc-b55b-08d8b3ec125c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5322:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53227CB47CA2960D3D71692A8FAE0@DM6PR03MB5322.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJjo2DGRP8CMlDX9zwLMGWq9n0AbA923SsqlgIsgOfml+HKOkCe38foZFaY2Hnjdv6sO6oXR/Sjnv97+8ewz4zFmyA5dV0QSYRdi66lnP60J2+Sp3s00O9noqnDdQ5UBTpVvAAj3rF6D44UXztWNwFH1x30o/zRiqRedVmnToRlU1dMDlJizBKqYG5c+5k4jBO/ZtRwyRgbR4Ed0HbtyZy4dhI1q5TK/YXtmipUZLKIMWOy+6vGU3GaWyWwFK9JHFSTBQScCtFuaCpw6htIUScMuzRaUhpYElJfAOCw4iLxMyWVqxqDwgEFjS4fPK8vROMUcVmjeEArn1+YJ8Xdy5AXjDDupU8AREVH79FCLl5QocwTarzA3UhzoJwefYgCYHq+8wzDEUJWRL3hmyI1f2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(54906003)(86362001)(5660300002)(2616005)(36756003)(6666004)(478600001)(83380400001)(6916009)(956004)(26005)(1076003)(316002)(8676002)(66476007)(8936002)(6486002)(66556008)(4326008)(66946007)(16526019)(186003)(6496006)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YXVuV1k0UWRtNU83NXJQVEJnK3dWU2FRb1ZHY1NXcFN3RlRaT1VuTVF4RWx0?=
 =?utf-8?B?YjNMM2pLeXR3OC8yZ2hBZ1MydUhmUkFENFJ5MU5FK1gxbm9UbFcwU3JMVXF6?=
 =?utf-8?B?QXFEWjFvd1BBSVVnK2R5S0xnVzU5djMySjE2SzZ6Ly96SEVVTHNkanorSzlN?=
 =?utf-8?B?cllxMFN3b01RdzkwajVhODVBY2VRS3NHdENVOWtxbTA0bzFGcWdmeWVoWXlZ?=
 =?utf-8?B?T3M3aGlLRXlBTjVROTJHUzdwaDNzaHRjejlvR0pleTBjMnpuRHgzeEU1Rklo?=
 =?utf-8?B?WU03T0pnU2xoaGdsQnZOck9sU2srdWZOWExZNjFNZnhBbk1BaEtNYml0VS9j?=
 =?utf-8?B?enExUFowdUJzdWI1NjlYY00zUitQdGY0SG9XcmpQcmRob1ZWeWk4NUwwM01y?=
 =?utf-8?B?emdnZ0NjSFA0OHdFNC9zd1lpNmJOelErZzh6ajRyZFpnU2VSVnJxT05zdm03?=
 =?utf-8?B?cDFvN2JEditRN2pscUMvZlhzNi9xVzNiUmh1N2ZGQ0VzTzhZNVRLb05MUHow?=
 =?utf-8?B?RGpIMnhqOGMrMVpqNEhYbVNST0VFaW9HdEVqREZydVZVNEhUd1QxSjcrejhS?=
 =?utf-8?B?K0dLK05UV2RMdnhDUHBLcS9kcjFOQlIxTnE3QXlaR0gyREl5bDQ3YW41OXcv?=
 =?utf-8?B?aEdrMDhndjEvblRoMzBsbDZDd0Z4Tk9MZ1g5VU1yZXRLT2Zjem82ZDlBaVJ4?=
 =?utf-8?B?TTRLODVSWE9zd2FKK1kzYm94UkxwM1luam5NS29PWHF5OWxiWTlFc2lNeEQz?=
 =?utf-8?B?Rjdqb1dZZWxwSVBLN2R1SFlXODlJbkhhN2c4eEgwQ05UOGJYOHAxSDQ4cnRG?=
 =?utf-8?B?VVlaaFc0WDdnWEkxcjZWU1RlL3BOZFBKN01iOVJSWSttRENQSmJHK3k5YUxU?=
 =?utf-8?B?K05WZEVVbUpLZlZ2NE9oU25TdVhteHhJWEtOeWMzekY2NFJqYWNQU1RxVURV?=
 =?utf-8?B?d3F4Q3B5WWlDSHd2OWZwbVpZRFhiRExqNHN3ZHZ5OVVqN2VLMU8vVE9SVmVL?=
 =?utf-8?B?T093YmdlVEFDRzdLL3ZQcFpCTUFSai9LdEhFVWZWbE42VW1ERjRsd2JzK2pZ?=
 =?utf-8?B?SkJkVVBmUW9XQUdHcm0rTzJneHF2SXhxaGVvREx4STk1aktkWlR2QzQ4bVBL?=
 =?utf-8?B?bndQd2ZPMEtXbC9lTGdHQnp2dm94bUt1c0JGNkUyREQxWFpZSDViZFVvMTVS?=
 =?utf-8?B?SmFpRThRMlFhY0hZZE1rQXBBVnRqSTBRRWRmZnR5dnphcm53M3EyS0JYR2NB?=
 =?utf-8?B?ZmptTFY1T2dZbkxNeGY5VXN2ZXN6cWMzVEJxbG1yUnhZcW1HQXBac1haelox?=
 =?utf-8?Q?4rk6IIhKmXjyGYERWBITNOZ7ZkJfaPCw9I?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 15:42:57.3181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: f877c3ec-c1db-4ccc-b55b-08d8b3ec125c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCVE6/t3uSCa4BSowpbNFyrgnVFuE7n0dyjGviQlm6B0CXyJxFLENT53nGdK7TkGWUbnBS5jH4gF9tOc+8MNig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322
X-OriginatorOrg: citrix.com

A pvshim build doesn't require the grant table functionality built in,
but it does require knowing the number of arguments the hypercall has
so the hypercall parameter clobbering works properly.

Instead of also setting the argument count for the gnttab case if PV
shim functionality is enabled, just drop all of the conditionals from
hypercall_args_table, as a hypercall having a NULL handler won't get
to use that information anyway.

Note this hasn't been detected by osstest because the tools pvshim
build is done without debug enabled, so the hypercall parameter
clobbering doesn't happen.

Fixes: d2151152dd2 ('xen: make grant table support configurable')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changesa since v1:
 - Drop all preprocessor conditionals
---
 xen/arch/x86/hypercall.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index dd00983005..14da9bc4ad 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -47,9 +47,7 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
     ARGS(xen_version, 2),
     ARGS(console_io, 3),
     ARGS(physdev_op_compat, 1),
-#ifdef CONFIG_GRANT_TABLE
     ARGS(grant_table_op, 3),
-#endif
     ARGS(vm_assist, 2),
     COMP(update_va_mapping_otherdomain, 4, 5),
     ARGS(vcpu_op, 3),
@@ -65,17 +63,11 @@ const hypercall_args_t hypercall_args_table[NR_hypercalls] =
     ARGS(sysctl, 1),
     ARGS(domctl, 1),
     ARGS(kexec_op, 2),
-#ifdef CONFIG_ARGO
     ARGS(argo_op, 5),
-#endif
     ARGS(xenpmu_op, 2),
-#ifdef CONFIG_HVM
     ARGS(hvm_op, 2),
     ARGS(dm_op, 3),
-#endif
-#ifdef CONFIG_HYPFS
     ARGS(hypfs_op, 5),
-#endif
     ARGS(mca, 1),
     ARGS(arch_1, 1),
 };
-- 
2.29.2


