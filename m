Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55E64459E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 15:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454981.712582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YwV-0007tH-6N; Tue, 06 Dec 2022 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454981.712582; Tue, 06 Dec 2022 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YwV-0007qT-2n; Tue, 06 Dec 2022 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 454981;
 Tue, 06 Dec 2022 14:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YwT-0007cz-HW
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 14:29:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20618.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55717727-7572-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 15:29:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9105.eurprd04.prod.outlook.com (2603:10a6:102:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 6 Dec
 2022 14:29:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 14:29:02 +0000
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
X-Inumbo-ID: 55717727-7572-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXbDsqyibzf+D08ZyLRop+Cex6nSYvHOEYkGjyMzXHffdpo1oSA5D6IxQlNynHHtfShRMaJVvcww0SbW23/j8oNeviGVoT3UQhMLFLRxz7EYslI9yzMd7tr8eXHXUf4EFz+//eckqbRuR2YcEmWIh/DhWmKihxGcaJPDqDPjhJMm9Z7f5dZmdg6NzcdY9nbXw8EjTCwjZ1qr0thupkPBoeT+oSb5quP0QdhtkusASc7KRvErOJEEtie4ThsZEa7LvrztTruufCezn/DWyiMyHaJTIYNCdsnouk8ALTRxi+VKB3oDE5HAVBOzFzMZy/t7ND8QohNWJD3F/aL7HkN8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyqpzDT7ddgLuTyJ8LCdvZqSXAQOB28REr3pHpSd2aU=;
 b=Gosa4eAIQ/Sl5f7uzo6ibfbsk8mdvWaDoBQCTouUYtSpnnnlZ6MbUURh7MVzJ0rloQ3OI9r+z0zdA1c18k1FZ7PkmCGFruMOovJMoWV5Ua4jupQB3IUORZVngE/bJio+85HWtHHycmNV+Iurv2YlcBJQaS4za0+ZXceUD6eFjxIbEFwMwtUK3jkTDgFDNNjDIK0zpK0lfhtWBWKf48MVsQwCVpJPwtCedGzH4+mPMB2g1zPr8dnbMe3BhuWFwWZYlRz3b85OVA/S8yflRppz6H7qmLH1vVofKAu47vMCDTrZnVDofG3Vq1fW+TFCiUfeKTX6JDgb363eqnj1nAB0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyqpzDT7ddgLuTyJ8LCdvZqSXAQOB28REr3pHpSd2aU=;
 b=hT0GXen303QdnAVFEanKWuaHNWCrQAUHvhorutlDtdi5LOBttP5EkgopxkFciX6vg8xTx6cVdKinn5JFiNUKBGgVIJBJFIjCad+5cl1AZbxssWwIr/SRYdcrtN84ZbFqNrjGg+9MSfE+BnlpbpbGguiTmn4pXCk5G20lL0IldbFb0XCXsDwEviuW5rbjzri5il8d6mLigRJrmEOBY+bB0/VEwXwFnSxHYrgsUG6HRAKtvujod38J3jq+3N/pYdFyieFCBEIggKKgOHQcGp/U4Cmgckmh57CRCaDQvV1c+IkbdM9ocqMsPOV1Bp94c6ISE70m6eESB9GQZVNW+VcYvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b00a93e0-9845-7d2d-0a5d-3b2afa41943f@suse.com>
Date: Tue, 6 Dec 2022 15:29:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 1/3] common: reduce PV shim footprint
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
In-Reply-To: <e5833b09-0ce3-b991-111e-07e64dfcc85a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: a146b696-144b-4f3c-7fa4-08dad79638c0
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+qmPSPE0jJmXC1QFB8+mC7bHE0pvSEtjoq2H1Fil0Lk1LNwCsaAg6zro7VGI2l/oAOTV9hgo6aBYy6LDMc4QRhNVYk95VBmH9Z/bLfirjCIeVe/akjAGIYthg0vqeZq56Wt2dLNZrfpRQQ+jtSkOIbjfPk/CL5ysCMj0LOO9bnhuwGO2d1TbDUB2QXLIZ+KtpPFeXU9nmiKBWFgZsHVjowWRCHsCGSvA+skXie+aDD/rqnBoZegt1isOIOkpPW2FL5ay1UgX6hlkQh/nIzgJ+Mh4VAIV4k57P0zxVlzZnwnykNpQ3n4RypP4dmtvKoNkUHPj6bGFaTgSKE9cXMMDGuoZqSR4ceDx31cQ1UlC0yxv/FFUoKTU3/LiQm6GDJ3OqL277GR4bRnZ4kZj054y5rm6kQ9svSNoOFi0QoQo29pzHSdcpfWFh0PBhHA+NiYwaQnszEagIkgtYFIvrbMzWn91vd3KHFRLPN9a+Cxg21VxFVC5XYgZgq2mrh6NNS9wlPajB051eGiUS15rXRvQzqYAUVW1Ik0M8adE1tL19oyYBx1xnUJzphmHAI/uNZx7eZSUUPzgQrUwbJQqAZ8L/wfDMfJGg//4hW+upXDkL0nU90TWwjeL9jB2g/TrWqRgQWzy9+qNN9Lpbg+S2/tCNa0FMiw5gnbGl5UJu5c8PZ5uTi8T/81DonScKzITOgHKiVKjZaW30bBcYNFUuRNEK+IbP2Dxhcp+//bHO4ujLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199015)(6512007)(6916009)(26005)(6506007)(36756003)(6486002)(83380400001)(2616005)(54906003)(86362001)(38100700002)(186003)(31696002)(66556008)(4326008)(8676002)(66946007)(5660300002)(66476007)(8936002)(41300700001)(316002)(31686004)(478600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alIxMm5NWm5OdjA5dzdDbDN4V3M3azRiYnlQRCsvTGo2aXdndVVkeCtyQUlj?=
 =?utf-8?B?cTIxeDVHZEdqRUp6ejNFcEtTWWRmTXZQUmZXQ3RuVGN6UTR3QTViRWIwNWds?=
 =?utf-8?B?RnJvZXU4VHYyazd4R3NVWnE5b3JXYjJZc2RhZCtHMVpNRGdJUGV6S0ZxMUxB?=
 =?utf-8?B?NkhNY3AzYmZiaFpPZEVkVXd6eGN6bEVzWU5FMEovRjE1eVFkeDBkSFQwRE5S?=
 =?utf-8?B?YlBjZURMNlBuTDVVbFFqdGhrK3RjN0w1UlJjUXNOTUJvVGo2eENKOXAydzFl?=
 =?utf-8?B?TFV6OUREemsvdHc4a1IydW5DUlB5cWpHRWhBL0wvSlNWQkM4V0VLNVpJRy9E?=
 =?utf-8?B?SzVKUDdPTnc2cWtsZnUvNUtKMmhzNTB3NENNeUVObjJJd1AwMkxqUExYdTRJ?=
 =?utf-8?B?SThrUEFaN2gyYjBMRmtBeDJCdFV2SVlTemNsdkRXN1ZTbVlkYjFTeTE3aUhv?=
 =?utf-8?B?d0IzcGhxaVIvQUNockFEVEh0Y3MrYWNOdUVXUXpuTXUzYU9CVVBCd2I0RURZ?=
 =?utf-8?B?QjhNL2V3U3lzYjJMcnBuZktSb01Qd0g1RldxV2J5N2xVaElYMVZuRHBHKzhK?=
 =?utf-8?B?N0t1a3o0dnQ1WCtiVFhaZ3VmOUIweG5xOFNwTW80NU93cWxwZ3hvbkxzVHlw?=
 =?utf-8?B?WS9xeFZKdGFaZGtmbTdkNzFITDBsU3pUcEJPM3B2MEljcnNHazI4RUVwTisw?=
 =?utf-8?B?UlpsSkpNM05nZFpLWmVhYlVzNkovNm8vMzNKaFcrNGsyL1FLTCtJU1lvQ1hN?=
 =?utf-8?B?VmgzTm01U0V2djNxdDJ4bTJvcDhwYW84WEN2cDN0REZOd2RqWGIxUVRZb1Zy?=
 =?utf-8?B?NXQxZE85disxMEJlWGpPRXc1YjNVNFF4d2NSNXlDbTJwN1Z4MnNDa2pHdUt3?=
 =?utf-8?B?dU5LL1RDMzRqQVRxdVFmQ2NEL0RoYzNQY0ZYaVI1KzVpbzdCVjJLUmU5YzJG?=
 =?utf-8?B?MVJjazZrMTlmc2ozZzFleWhJUUM0UjhNZ1NKK21HR08zWDl4QWpWNVpBMzNH?=
 =?utf-8?B?WklxeXA4dTRUVGJVTjBlYys4RzdjcjBIVVJoRlNXVEpReWk2UW5ocmVXblVV?=
 =?utf-8?B?Y0t1eUkxcE1WOEhFcVlPMjFrdHBhNUNCbEpVNUVuZzF5ZjB6RlhibzFGeFJs?=
 =?utf-8?B?b0oyMUh5Q3d0eFNxdFZ1UTVxU3Q4cUdXSVdLOTRtaUJ0M1V6dC8zNVc3NEtQ?=
 =?utf-8?B?dTJZV0k2S2x1Nkc0bzJORGN0SDhBbjFLdXRvZnJhUDQrUnFmZVNvcjRPVlN2?=
 =?utf-8?B?MVo1RmpMbVN0aklHMWlNaVg3T0pkNkRBRlhXYlBGZmNyVE1oYWJ2MzJzTFVj?=
 =?utf-8?B?YVJCQm1YQ0o4QWNYM2FrQVRLVC81RitvKzdMUFUvVmc0YjNGYTc0eG9Tem1k?=
 =?utf-8?B?b1E4SGFmWWl4aHhBbEYrVTJrMjlOcm5xQ3pDS0ZxZHRzbTUva09nMGV4QVFj?=
 =?utf-8?B?OUhDQ1ZGZngvbnVmRTR6Mnc5UUF3dXVkVEt3R2VVaEY2U1ZMVGVvU0tPeDZt?=
 =?utf-8?B?eHBQSFVUS1ZQTlA4S2dhWWsyN2dva0UvenBIK0VvZTRCS2M5UENYSEo1NXpr?=
 =?utf-8?B?eW51M0k0N2FHMVVpVDE1cWtxY3diVEVLcXpoMnBCZ0pqTDdORVI2REREQWpz?=
 =?utf-8?B?dkR2ZFZaR00wS3c3YklpZ0Z6LzlwNTltTzFONlh2Rld2YWZvME81Ylhwd2Rp?=
 =?utf-8?B?NjBYZEcyeXF6RHp6NW5NenhPMFBubmM3d04wOWd0OFVWbTB0MmM1bTY3Wmh0?=
 =?utf-8?B?Wlp4TStkUHY1WVhxSE5CY2RIbEt1YittQnZnUGNCcjdSckUxQnFwODdJZmxJ?=
 =?utf-8?B?aUNmVXZYZ21YZXppTitCeVBkcHhzWVJjME1uT1Y1MHNEa3pNZkFUVERDbVhF?=
 =?utf-8?B?RHBaTU43bXY1N0R4UHlON3BUVU0xUGtYQWc4UnY1MUJ5VGdRbDNVaXFDbXBa?=
 =?utf-8?B?dHc2eFlTYTVlRVRhSy9kcFdpdk1DeU5iVWdINXFGeGM4WER4RnFIT09BbUtx?=
 =?utf-8?B?MklqNkgrUnl4YmJyRXo1aGxZWEJqRG54LzhmMjBneTFtcjVPWnJFMWR3NzJV?=
 =?utf-8?B?QlY2VGN2cTZwbkFSTVlxMUpDNVVoTm5SUENKSDBiUzRpMitwOUh0VGpERjRl?=
 =?utf-8?Q?Bxv3nAAgcrGLgN8jjPaNIm3Mw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a146b696-144b-4f3c-7fa4-08dad79638c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 14:29:02.4958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDVAdnYpij4tZs2o1ZWWO0xPoORB5c/nWIL4EjxR96zKCu8OqIjervTe0H4JPu7MiJe4RwcY80i04EoEqC1WoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9105

Having CONFIG_PV_SHIM conditionals in common code isn't really nice.
Utilize that we're no longer invoking hypercall handlers via indirect
calls through a table of function vectors. With the use of direct calls
from the macros defined by hypercall-defs.h, we can simply define
overriding macros for event channel and grant table ops handling. All
this requires is arrangement for careful double inclusion of
asm/hypercall.h out of xen/hypercall.h. Such double inclusion is
required because hypercall-defs.h expects certain definitions to be in
place, while the new handling (placed in pv/shim.h, which is now
included from asm/hypercall.h despite the apparent cyclic dependency)
requires prototypes from hypercall-defs.h to be available already.

Note that this makes it necessary to further constrain the stubbing of
pv_shim from common/sched/core.c, and allows removing the inclusion of
asm/guest.h there as well. Since this is actually part of the overall
goal, leverage the mechanism to also get rid of the similar construct in
xsm/flask/hooks.c, including xen/hypercall.h instead.

Note further that kind of as a side effect this fixes grant table
handling for 32-bit shim guests when GRANT_TABLE=y, as the non-stub
compat_grant_table_op() did not redirect to pv_shim_grant_table_op().

A downside of this is that now do_{event_channel,grant_table}_op() are
built in full again when PV_SHIM_EXCLUSIVE=y, despite all the code
actually being dead in that case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Sadly I had to restore the two "#define pv_shim false", for Arm to
     continue to build. Originally I was hoping to get rid of that
     #ifdef-ary altogether. Would it be acceptable to put a single,
     central #define in e.g. xen/sched.h or xen/hypercall.h?

--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -6,14 +6,23 @@
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
 
-#ifndef __ASM_X86_HYPERCALL_H__
-#define __ASM_X86_HYPERCALL_H__
-
 #include <xen/types.h>
+#include <public/xen.h>
 #include <public/physdev.h>
-#include <public/event_channel.h>
 #include <public/arch-x86/xen-mca.h> /* for do_mca */
+
+#ifdef CONFIG_COMPAT
+#include <compat/arch-x86/xen.h>
+#include <compat/physdev.h>
+#include <compat/platform.h>
+#endif
+
+#if !defined(__ASM_X86_HYPERCALL_H__) && \
+    (!defined(CONFIG_PV_SHIM) || defined(hypercall_args_pv64))
+#define __ASM_X86_HYPERCALL_H__
+
 #include <asm/paging.h>
+#include <asm/pv/shim.h>
 
 #define __HYPERVISOR_paging_domctl_cont __HYPERVISOR_arch_1
 
@@ -33,10 +42,6 @@ void pv_ring3_init_hypercall_page(void *
 
 #ifdef CONFIG_COMPAT
 
-#include <compat/arch-x86/xen.h>
-#include <compat/physdev.h>
-#include <compat/platform.h>
-
 extern int
 compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -49,6 +49,22 @@ const struct platform_bad_page *pv_shim_
 typeof(do_event_channel_op) pv_shim_event_channel_op;
 typeof(do_grant_table_op) pv_shim_grant_table_op;
 
+#ifdef CONFIG_PV_SHIM_EXCLUSIVE
+#define REVECTOR(pfx, op, args...) pv_shim_ ## op(args)
+#else
+#define REVECTOR(pfx, op, args...) ({ \
+    likely(!pv_shim) \
+    ? pfx ## _ ## op(args) \
+    : pv_shim_ ## op(args); \
+})
+#endif
+
+#define do_event_channel_op(args...) REVECTOR(do, event_channel_op, args)
+#define do_grant_table_op(args...) REVECTOR(do, grant_table_op, args)
+#ifdef CONFIG_COMPAT
+#define compat_grant_table_op(args...) REVECTOR(compat, grant_table_op, args)
+#endif
+
 #else
 
 static inline void pv_shim_setup_dom(struct domain *d, l4_pgentry_t *l4start,
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -822,9 +822,9 @@ long pv_shim_grant_table_op(unsigned int
     return rc;
 }
 
-#ifndef CONFIG_GRANT_TABLE
+#if !defined(CONFIG_GRANT_TABLE) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
 /* Thin wrapper(s) needed. */
-long do_grant_table_op(
+long (do_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
@@ -834,7 +834,7 @@ long do_grant_table_op(
 }
 
 #ifdef CONFIG_PV32
-int compat_grant_table_op(
+int (compat_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -56,7 +56,7 @@ CHECK_gnttab_swap_grant_ref;
 CHECK_gnttab_cache_flush;
 #undef xen_gnttab_cache_flush
 
-int compat_grant_table_op(
+int (compat_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) cmp_uop, unsigned int count)
 {
     int rc = 0;
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -32,10 +32,6 @@
 #include <public/event_channel.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_PV_SHIM
-#include <asm/guest.h>
-#endif
-
 #define ERROR_EXIT(_errno)                                          \
     do {                                                            \
         gdprintk(XENLOG_WARNING,                                    \
@@ -1222,15 +1218,10 @@ static int evtchn_set_priority(const str
     return ret;
 }
 
-long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long (do_event_channel_op)(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
 
-#ifdef CONFIG_PV_SHIM
-    if ( unlikely(pv_shim) )
-        return pv_shim_event_channel_op(cmd, arg);
-#endif
-
     switch ( cmd )
     {
     case EVTCHNOP_alloc_unbound: {
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -45,10 +45,6 @@
 #include <asm/flushtlb.h>
 #include <asm/guest_atomics.h>
 
-#ifdef CONFIG_PV_SHIM
-#include <asm/guest.h>
-#endif
-
 /* Per-domain grant information. */
 struct grant_table {
     /*
@@ -3563,17 +3559,12 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARA
     return 0;
 }
 
-long do_grant_table_op(
+long (do_grant_table_op)(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     long rc;
     unsigned int opaque_in = cmd & GNTTABOP_ARG_MASK, opaque_out = 0;
 
-#ifdef CONFIG_PV_SHIM
-    if ( unlikely(pv_shim) )
-        return pv_shim_grant_table_op(cmd, uop, count);
-#endif
-
     if ( (int)count < 0 )
         return -EINVAL;
 
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -40,9 +40,7 @@
 
 #include "private.h"
 
-#ifdef CONFIG_XEN_GUEST
-#include <asm/guest.h>
-#else
+#ifndef CONFIG_X86
 #define pv_shim false
 #endif
 
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -24,6 +24,9 @@
 /* Needs to be after asm/hypercall.h. */
 #include <xen/hypercall-defs.h>
 
+/* Include a 2nd time, for x86'es PV shim. */
+#include <asm/hypercall.h>
+
 extern long
 arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -19,6 +19,7 @@
 #include <xen/cpumask.h>
 #include <xen/errno.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/xenoprof.h>
 #include <xen/iommu.h>
 #ifdef CONFIG_HAS_PCI_MSI
@@ -38,9 +39,7 @@
 #include <conditional.h>
 #include "private.h"
 
-#ifdef CONFIG_X86
-#include <asm/pv/shim.h>
-#else
+#ifndef CONFIG_X86
 #define pv_shim false
 #endif
 


