Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE908579DD9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 14:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370613.602461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDml0-0004Ni-4V; Tue, 19 Jul 2022 12:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370613.602461; Tue, 19 Jul 2022 12:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDml0-0004KE-0u; Tue, 19 Jul 2022 12:55:22 +0000
Received: by outflank-mailman (input) for mailman id 370613;
 Tue, 19 Jul 2022 12:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDmky-00040J-KE
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 12:55:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150050.outbound.protection.outlook.com [40.107.15.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a8a159a-0762-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 14:55:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2616.eurprd04.prod.outlook.com (2603:10a6:4:31::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 12:55:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 12:55:18 +0000
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
X-Inumbo-ID: 0a8a159a-0762-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kee+KzCvOLUAQesxG6oVa3RdJueFyQ1xQFHawcY9gLhTC0A7l8bbVz6m8jfaZVr9fs7XNrh25goXGzCWST6bW8xNYZZc4tgd6PRqSPnJ7eOvB5hNVcBNjsJofZAds3M2zHHuCywI0ol1cvmLaYZJPbhXGhUaZoLP9CK78n3fIuxCg2CtGACteOuEGtyHvNb858jz8nybElS3zx6tGjccJdQ43d2p3usTU7AvJnO3jTOqNeY05H3j+ipSHzKCvRZQs3UuZ+pQgxL3FI01vWPPidsnufDbqsn+gyXQG4T0y6JAA2y5WbWiohBcfY5/izzKLWaUFLQb8yjx9o8qWwyWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIKUVCNislRgAc5Hk4ifVRBpK6kd9oa3qSRRPckftEg=;
 b=iMwd/9Trj5/OfhnW8hgIR9V9F+SpCjzmXHbPvZxzcvg35CuBm4ziELXeRArL1ctwJ6/nuMWKyM539eLmAr7Lo0Kk9i0CLA2p0w0uumb5DDTTkoSECub4OVFkz/QEUhK0WmPMS8AP8UQ0IFqPEdxW1kBftTGXhN8ceRdMZUXD8n0tRilQmO+1rcUyi8TkeNixVDFwZo3ZdgM7xei07BOLHpFGrs7PK6AxPLKJeIhKJjv8YJfrXi3+5pKkbzx1BrmQxUsQg876YcWQBslMBNFreHNvzTKYDcdQ8MbiVI5qIciWQxQZ2vucRZsbHYIBqwpNbP10mKEq+VUMKh492oomsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIKUVCNislRgAc5Hk4ifVRBpK6kd9oa3qSRRPckftEg=;
 b=Nl0ngKN2RzLzAKNN+Bea1wHHv3mqIdLJWShNxL6GUfGWucNrQQIaH65ZehkppUf19uS2ZoAwE+RqffpRe8DUBHixUB9WUfB0/500l2EFT2XEF0dt19LpToB2YrY6ctfIMqSPJDitB8Kmnc33T1lG2VRWbd9yzsHlYjXq59WUlJJl4jOdzShLlBZ3ITGneMjxaD55oEtz43FGg8Dk0DoHf29OcFi68lVcqIyX4QZULrvXHdPgpPqLZN6w3vgGcH9wH4AHJf/ibIiqeYB5qt/PeujqX95hRXx17zyBbNuHF8O10F1rAUN4kkal6G+BITtj1+YW98c1t62aJUw8gk3f2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e687a2ef-780d-edb9-938c-7cfa4237dde4@suse.com>
Date: Tue, 19 Jul 2022 14:55:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/PV: issue branch prediction barrier when switching
 64-bit guest to kernel mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52308178-3c9d-4b89-62cc-08da6985eeac
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2616:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLq2SmRCBjTkHbJ2E7wgE8dwPkHKL4by9CxTtVcOPseXxNNlnRtdBEQ6T2AvuUPo15uUdvUowA3C5rYMgFOGx7d+Zz6YHEiZY9w+1gLu4h+gFYO6vJVJm6uRQPR5sbdEJrWeYxhcHjLjg87TQewWvJAk2wekPnBZdC2ned+rlzVjiDL79aipkkD9tm9/epUHQyJfBSlL0cQpztbELV4kTFL3G3LtEpZuevZhtt0xLuVT3wiH1T/W7Ky2PCYEvxURjdspwCuINkE5KQs0mYJ1fFjNwbKCUILIPwA+ezYs1V6KZYf8eOImYnKUeGzrNdAYjQv2ETt+owPu6Dx7tQEHRSePTSp4mQpRvssH3qzBVWa87yifAyraTF40OFMrtOT16CNOS8jak+TPy08/nUYfCH/689bEWBmrBsNaK6Ez7rMLgnP9xnbIW/gBednG3HHsZFYqHDAIEAXcmPXNNTqD24GQN66BAg0YVYnC4mCXFcnjcYAOVtJK6+LnZ8c6Wf2mmmCKi+NfmFgs3/Umi3843GDu29yL9VLkVHsZrGmzwOurNgmlGZckobaa4onoZAm62gEtg9EkShtu2nWlDD5sAd2wVTPSCuCnVB7u4PWEpAdfXnYJuPrfpbGFBfOGO1GnS9Qi0WwRj9nLm0jg1JWqWlx2TtcspK8z0AmGn0Hw21Y3bnPLayXr5hgva5vUHav+qoCYcMbGskvDmEQIje/5I/2VM0fTREfFk27b04zHdzfF4tftiJti4HIGT2E6G0moxvlfyxFRxXIEIV/o30+WXCrGyXrx6qFY0rV2Vd8YARxV2W/AG2qgpdpA5T5xScjIniKU3DVZfFZyDUl/c2Dcnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(376002)(396003)(366004)(478600001)(2906002)(6512007)(83380400001)(41300700001)(26005)(186003)(6506007)(86362001)(31696002)(2616005)(5660300002)(6486002)(8936002)(38100700002)(316002)(36756003)(6916009)(4326008)(54906003)(8676002)(31686004)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzlJWnBXcWdTZG5zMEFQMy83ZmNaYmJZbXRRMmJrNWRuTHphakZzdVNFOVZ3?=
 =?utf-8?B?eStDbDU0TVJ2U0h4d0xZRHhkR3U1QW56UlIyVFkySUg2Qm14MGRVNUVQM0FU?=
 =?utf-8?B?QVNHQnFQMlFURWlDWHhkUU9hQks3KzRsaFo1UUFDdEJ3emtMMlVIeFNselVz?=
 =?utf-8?B?MXAyN2p5ZG5YTVdiSllqN2kxT0dkUXNRZStlNVc3U1l0cUhnQ3JtRHhQOU1k?=
 =?utf-8?B?dGwzbXdWdVJaV0h3cjdBUTdQQ2RHNlo2NE5RU1pBNzJLaEErL3JxUFlwMXZC?=
 =?utf-8?B?clA5ZTZqTjQ5ZU1DeC9ERVkzSlNjeE9xOFJFR0xTcXBvZExmU05DemcwS3ls?=
 =?utf-8?B?Z2Q5bVk4OVdlS0M2VjJYQ1diVEVVV0l6Z3RDbWVFbm9lcGdDZHF5Wjl5RlJk?=
 =?utf-8?B?RU5mZWRDeWdHbUtueEdJa3R6d1Z4UGNwRkxpVEtWc0Fta1M4cWZ4Vm5sVzlL?=
 =?utf-8?B?ZmEyOFZxeGYxTGltWmdYaFZJTVhBazZHWmtkWElaKzlweSt0aE9QQzRTOEZT?=
 =?utf-8?B?MXprTUFrb050azQrV0wxZjVLaExoRG9mVDEwbytYQjMzdHUwL3M3NFpSOVI1?=
 =?utf-8?B?YXFjakY5RmRwZGZQM0JtUFhJWERleWJ0ekhobUJqSWEzbzFQNU1MVGRKSzJh?=
 =?utf-8?B?TFduSTVCUktRbjduZGN6TWVRdkZTYUwwS3d2RnpESHZyekJKSVEwc0lNdFRm?=
 =?utf-8?B?c1hxekcydGNsLytTT3FabWJ1dmd4ellnT2FNQW9TcmZHZE0wQmp5UkZ6Yy9r?=
 =?utf-8?B?L29FeWRJQXFKd3drVU9EdjByQmFBYmNFaXVvRThWZjBoM3dCUEVNQUpUcFlZ?=
 =?utf-8?B?UHZpU0hqTnlUNGdqaGVZWWgzUjBGbnRkYjlkQkR5ZEFEYUVjdjh6dSsyTUdN?=
 =?utf-8?B?T1kxVGxZYVhiZnJFMmxkQUhyRUlzTDFmWXg4dUN1ay9XekVWWlIvTXZ3WFpB?=
 =?utf-8?B?aGI3K0hHM3lha2paT0xIR21vbEZZbklqbzRuV3BDVG9DWVg1U3k0UVIxTjVQ?=
 =?utf-8?B?WDU2TVREaEM4aUVqbDA1cjNBdHk5bXRjcDZFKzlOUU90R09aUFpLV0xwRTU4?=
 =?utf-8?B?Wk5SbTVSaW11T0k4K2kvQ2I4NHZ3UlVKVWRTYkJXZmMvZE05eHpvZDc2R0RW?=
 =?utf-8?B?TU96NVRzUDU2N1U5bmRaUmFRZjlFS2lHbFVld09sbjAwNTF0ZkFZMEVXWU5q?=
 =?utf-8?B?S1ZtTDFKYUJZK29tS0NFdllnZmtWZzVkSm5yWEdvNTFoZmNyMlZqbWZSb0tC?=
 =?utf-8?B?T1lvSk5xdmNoZGpNdG1IY0FudTlpRVNmSm9zMEltSUhlWjRYVlV3WEtFcjE3?=
 =?utf-8?B?Z2RWWjBGYk9KQWpsZnlja0NHK1luSDdRV25RRFB5bHdKN1FXMysycmhqdjBU?=
 =?utf-8?B?b3pjOXcrU0dBMjVzUmpzd2NZdERDZjZ6bStKWTBOaEdJclZvSlNEMHZzS0M2?=
 =?utf-8?B?U3ZOZ3RFZVBhM0k5a2MwVGlTVnovejYvL0pEcVhKV1VQOWVSRjE1ZlRybzVV?=
 =?utf-8?B?T2NmQk01NnorYXR0UFoxQkVSYXJhZWhGWFNFWlBTelBMeTJLOWlwTjVqZElt?=
 =?utf-8?B?Y28yQ2hXaXVqQjUrSGhteTYyVmxwaWlXNkdLa2drbWxuK0dxaThCbG5MNDVD?=
 =?utf-8?B?enlZQmlsU0RUUkgwZy9tUytpR2VuN01FdHJDWlJoOFBQb1ZCaFRQWG84ZktT?=
 =?utf-8?B?SlBRaHlmVkFRODRBOXp3SUxZQlpZMkMyNStycFkrQ0h6cGdFa0F5L1dzTEZm?=
 =?utf-8?B?S3ovaytZcXFEZzF5dGRzNExvTDFueFBvRnYzei9xOHZVYktTLzQ3MTgrK21y?=
 =?utf-8?B?dzFubm85aGR2eW1oclR4UHJqUzFRM0dRd2krM3BvNUtVZTYvMDBXR0xaaHQ1?=
 =?utf-8?B?L2ZNbVBUcTBETktqenNjN3JXdW5pSElDMitHck9JR2xnRllCcUJqQ0g1WFRV?=
 =?utf-8?B?a0FISzVpYUc5b05VNHVTVmUwL0paZlhwUkZ2TDdqenFXaEoxZHgvVlN3Y2hO?=
 =?utf-8?B?MVFGMWh0TURlYTQyOHpjUzdyWW9uV3hEQi9VVWt5V0tzREtseGtZOVBUUkhM?=
 =?utf-8?B?RitLUDFOVGxrWXBpTExKWXdHaXZNbGdPRTR3dktRZFh4Wm1lWThTMGZLM1Uw?=
 =?utf-8?Q?Z7jVOeQuQGj3HnS55dH1VlSG0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52308178-3c9d-4b89-62cc-08da6985eeac
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 12:55:18.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tX1PRRlTHTBhBVseBKdmF6P6kNSBCwbWKWWf7uNGYDkUNSHXokFnH2kT84Ef4vNTdDcaiVga83xNNBskcCLnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2616

Since both kernel and user mode run in ring 3, they run in the same
"predictor mode". While the kernel could take care of this itself, doing
so would be yet another item distinguishing PV from native. Additionally
we're in a much better position to issue the barrier command, and we can
save a #GP (for privileged instruction emulation) this way.

To allow to recover performance, introduce a new VM assist allowing the guest
kernel to suppress this barrier.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Leverage entry-IBPB. Add VM assist. Re-base.
---
I'm not entirely happy with re-using opt_ibpb_ctxt_switch here (it's a
mode switch after all, but v1 used opt_ibpb here), but it also didn't
seem very reasonable to introduce yet another command line option. The
only feasible alternative I would see is to check the CPUID bits directly.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -757,7 +757,8 @@ static inline void pv_inject_sw_interrup
  * but we can't make such requests fail all of the sudden.
  */
 #define PV64_VM_ASSIST_MASK (PV32_VM_ASSIST_MASK                      | \
-                             (1UL << VMASST_TYPE_m2p_strict))
+                             (1UL << VMASST_TYPE_m2p_strict)          | \
+                             (1UL << VMASST_TYPE_mode_switch_no_ibpb))
 #define HVM_VM_ASSIST_MASK  (1UL << VMASST_TYPE_runstate_update_flag)
 
 #define arch_vm_assist_valid_mask(d) \
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -467,7 +467,15 @@ void toggle_guest_mode(struct vcpu *v)
     if ( v->arch.flags & TF_kernel_mode )
         v->arch.pv.gs_base_kernel = gs_base;
     else
+    {
         v->arch.pv.gs_base_user = gs_base;
+
+        if ( opt_ibpb_ctxt_switch &&
+             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
+             !VM_ASSIST(d, mode_switch_no_ibpb) )
+            wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
+    }
+
     asm volatile ( "swapgs" );
 
     _toggle_guest_pt(v);
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -571,6 +571,16 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
  */
 #define VMASST_TYPE_m2p_strict           32
 
+/*
+ * x86-64 guests: Suppress IBPB on guest-user to guest-kernel mode switch.
+ *
+ * By default (on affected and capable hardware) as a safety measure Xen,
+ * to cover for the fact that guest-kernel and guest-user modes are both
+ * running in ring 3 (and hence share prediction context), would issue a
+ * barrier for user->kernel mode switches of PV guests.
+ */
+#define VMASST_TYPE_mode_switch_no_ibpb  33
+
 #if __XEN_INTERFACE_VERSION__ < 0x00040600
 #define MAX_VMASST_TYPE                  3
 #endif

