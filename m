Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FE6968FE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495292.765629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxw5-0004qK-Bw; Tue, 14 Feb 2023 16:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495292.765629; Tue, 14 Feb 2023 16:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxw5-0004oE-7l; Tue, 14 Feb 2023 16:13:41 +0000
Received: by outflank-mailman (input) for mailman id 495292;
 Tue, 14 Feb 2023 16:13:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRxw4-0004nx-0J
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:13:40 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe12::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89d5379a-ac82-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 17:13:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 16:13:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 16:13:36 +0000
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
X-Inumbo-ID: 89d5379a-ac82-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yktr3axx8Bo53bYH9AmnGi+1CSs9jE1AveqZoO1ztUCo4OdQcNvXoq/psQ71GkQhCFmP3dECvhjkNmA9RGIuZ4Hc1GIYrIwKCm3UZ9WCWkvqy7eTGEXiReSheJ8waR84T6rBTNX9QJEmOx0lgRLR1QiwmIJVHn85bReZDE1X9f7O0l3POK6iwr0oq9Hm8R/PJe5p2yaJPvLkmjFjIgtaT2lq4Kdi0ERayvSlPyDepocAVd/EjNEsQiUYVP7NWB7G0IIY4LFQ5Mc6QIFO0qLz9v47BoJ5BBcZ7ftFIelQKD6lt/U6SzCOzoudNWbQNfRKDvsfVX3y7jimCAEa/ogRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV1pzylMtiJbaf1DCMAdNM/POHYJ2+zwgryBLilgFJw=;
 b=di6OfBmhfou6ytaCxRPRqDG1ny8U88g8driL7OY2cY9NDjvINxJPMxIeYfMuO1e7jQNvnPCt1J7VvJFEplDErgxUSNJakbuqvC2PaVXXcmBi0gFIJlHfaNtZshfTa9/jg9sF8MbMkGxoWzxlKI0KkgRllxitm12/2HAdMlNGcspDCeWQBTcpLMyzodb3c9dJIj6f/cGTNz0w6+tKn2J8Choi1h/PIfektidsQEFPoP8hdVkiA0FHjEvsdv5vJ9/y+kcMklt10w1A2KC09dtV7Aeahm6P+KNcy+RoCGFoaF5GS4ToTtmQ5mTkfCGFYBFhoMrmIdVGSYlAaZhm53/uSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV1pzylMtiJbaf1DCMAdNM/POHYJ2+zwgryBLilgFJw=;
 b=IsAHu7vwqnbaAPR8PWze+qTrR29Pw3RnVdDpgm6WIbJ26bKBf77iMiTZbe8Z+0eqDtdi9T22cH60/lR+GR40WkD3bLsLA7LfSfC3mSEVoFU66MtIEXWmB0rxRRrK35bfk7Biu3dAGIUl4NJQGofjpnpbQJ/CljJj0M189sLj3HCDqmXO7gDwi8tnYFZrkKzp9d9aqT1v4w/hb9RcWOBFuvPyI+g9N8Df/mGHoWF6pLeY0ijpSpsgw2XJbC57ShFsb0nt0tKKjMG4RYTpJSsti8NfyXmc3Y8uG6Kv3iCP/kwhdPtak6FMhz/WgvEfPd+tAMfY3YI4WZTFn0Y8/x7+jA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
Date: Tue, 14 Feb 2023 17:13:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
In-Reply-To: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8b2aa5-6fb2-4b64-02e0-08db0ea66d0d
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	79THX79eiVsPKVw3HF8aN8G01+L1e91C7dgNBneXSsA+W4Z46XrSdIz11fG8xxBxfZl60+FpIlDmTvC0B95rmE2YP1doT5Pj7i2EFpvlmi2Law9+RxZRvYMjrK3m6IUNgXVhl7pIMn40A5Ts0fwfctiyoQPpbDYCFSjnMcvfohJ3IQ0T4AieAYHURp4NHOTmGWtoQvLDrM7PWkX83UNjBdxolrOud79O6EiGBRaIs3B+ovtAsLVtR8Lb9e3WZtK6IoOTaIcbI1qmtXN0o4LGAUmWFNQbPCPV3/zwb3C02BXj0bC42RUJYErCxDjjIaP1TyKhfqQoEIcVvgPVA04TSuQoZvltYv41MjwFUEw8ckBznxiGt240W2PZtw4T3xkUyH2d6xPb1LjxFLu7YhBDjxVLX2NSWx86xbpN8q0AN49yUKsisrQkYxLckK9UVWdlfNhyv61Dp88fKHngG9x+Z2J71UCXlMKG8V0XEk7k8XsKoE/e/DbD2XVsQ3k0PDymKXf5STNNofi36Eoacbg6Nr0Q6p3uno0SYax7WhH5Sz+EVBKYeT+N1yWOyoHjb2w1srjy4hTt12KIZJHVNtI3ssmncH8Oq4uijkLgJqEj57Z6N8ExYEUoLw5uGT/lx2fqQZcnQbZtk18xO7ICzPg5Y1OTurBwtULjodU+llTVKrOnG9cZb8mX6KCsTk6zwzWYxJYM1I/83x4VFaamqT99WXQlIXo7GK7T9OTAnoUcv74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(6486002)(316002)(54906003)(83380400001)(4326008)(478600001)(8676002)(66556008)(2616005)(6916009)(66476007)(66946007)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(6506007)(6512007)(26005)(186003)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0ZHNjk3amNNNVc0bHVZU3JKWlBlRzlVVUdFWjh0bGs5Wkd2dy9aZFF4OEk3?=
 =?utf-8?B?YnBDd0VMTGo3b2d2MkJKWVBLcWdhOUt4SHVBN1JSQ3NIOWtGVjhrQ1JqbkZi?=
 =?utf-8?B?cStmck1JOFczVXA0RmxEaVA3SHYrdTlFdnp3b1VpMXQ4cmFHS2VQR04rV2NW?=
 =?utf-8?B?RUpRNEJyYXBlTGRYTkIvNXBzcU5YUjFJVy91UEF3K3lOUWxvWVh2WnZWSjV4?=
 =?utf-8?B?U2tDdTZicUhkdHRiYUVycVFIbWVTK0xaS1dFNlFwL004UDlvK00xZjVQWjAr?=
 =?utf-8?B?NTJFRXRIRUhBSThvWEYxTXU0VkpXdTVXNUIvb0M5TE9zWk5HR0V4QkdKSXE3?=
 =?utf-8?B?VUIvbjREdEtFRUxDanZRWTN6enU1WTI1OTdMc1h6VFVsZW1nOFFrVlU0aXY2?=
 =?utf-8?B?L3dGR295bGZVYkRiMnFkQTRnRW9qaElOK3NldDR2SXZzaThKeXZxMTQyWm1w?=
 =?utf-8?B?ZWxzQ3dCbE94ZmtBdy9iaTRyLy9Cd1dlL3VLay9BUUVLZHlhNU55UW4wRVYw?=
 =?utf-8?B?eG5yd0p1SEJjOGY2T2JUS0xsWHdvWCtDY2twL3RNd28yeitsVDhmbUk2ZkxN?=
 =?utf-8?B?NnE0NkNYSENzRmMvQ2l1aHdSR0lhcEVzM0RIODRncmF4eXhhVUt2SWpNaVBN?=
 =?utf-8?B?NzIxQisxY1YyQnM5OHNrZDg3WEMyV1YwUDNnRE1xaklyM0tSK0sxVFVCbWNp?=
 =?utf-8?B?RHgyWVh2ME9BTWVUdzN5eXRJbTZlaHlxaWQyeC9qblhoRFBTUHdOMDdIeEhJ?=
 =?utf-8?B?YllUUGUvenpIeC90b3hKdWQ4OVlzZ0Vidno0VFEwMkhQUk1lTHpTRmpGeThI?=
 =?utf-8?B?d3pmb3l1ZXhHVlUyNjQxQXV1bURLaGk4UDQvL3F0MzJXeTB1UEFLdkhkQkxO?=
 =?utf-8?B?akRGb1F5NUd5T3FmN1RFM0NXK09nZ3RLR0JScGNhNUxZaDIyNWg3OVhOeHBN?=
 =?utf-8?B?MmdkQ3FEOW1hMDNMWFZoSXZyRVRrTE1VbjExK3Bsd3VzZ2RlSWpPckg0NWxE?=
 =?utf-8?B?bDlRZm5POWYvTmRzeHdWWldOY2UyZG9TZEdVc1NCdXRsVHR2SjY0SzJJMldu?=
 =?utf-8?B?UHU4TUVQS1RJMDJXNUtmL1E2YVgrVmFLRHBrRlhVYzBZYms5ODBYMGM1MWda?=
 =?utf-8?B?bVNxUU8vWXc0RXJQR2lldU5MK0N6T3JBQ3B1VmpEaXJRNGNyc2w2MWQ4T01y?=
 =?utf-8?B?SzU3SlB1UlB0b1U1MW9wUXNLQytoVEQ4dXRaVnNvUVlDOTBJcmJ2TlA4NGdU?=
 =?utf-8?B?cEZxS1BMQ3ZzNm5XZ1g1Y2drRFBRWVNqQmJ5T0l4N2l6dk1tZXp2OENSYVQ0?=
 =?utf-8?B?U3JGVU1VRWtObGVza2pyRjZrdm96aTdXTDZ5ZEVYRVNid1d2dy80bnFUcHBJ?=
 =?utf-8?B?cUFscjR4S1FQeUFXU0pVb1dNMzV3QlB6b25YQWpGYUF4RHIzWCtBM2wvSWs2?=
 =?utf-8?B?UDRDeFMvSlIvYTFOMmFIUUIyL2RROTF2eHNJT0VUK0tYc2xEUkZ0cmRRc1Ix?=
 =?utf-8?B?YmJhVUpKa1JkUUdUUDltQ1Zhalc2RFZPdGkwU1ZManJQTnJYMUcyUXRNZWFN?=
 =?utf-8?B?bm5iQjF0YzV3eVVvemozYllWSk5jOVNpcUpHMVN4MEVLbVpyMlJZelBsK2dB?=
 =?utf-8?B?ckt5bVhDYkk3dEhrNVdOcSt2UWYrcFA3WGxibkJ6bjNUMkJ3eE5UTmM4OFpN?=
 =?utf-8?B?cDhiOFVwK0JZSXBCcjRNRWpqZjVGdGQySWtYYVhNa0RESVZMRjE2YXQ0emcr?=
 =?utf-8?B?Vmtuanc4em5YWXRETWpMekdnbGVTQkF5L3NYUFkyeEFOSlFHWEQxaFpYR2NB?=
 =?utf-8?B?d2UxZmE3ZUk0R05JTXdpNDZhL1FKSFY4NytucXN3czJ5Z1ViODMzWUJRV0VU?=
 =?utf-8?B?RWo1T0o1UFA2d29JNzd6V2hReTBqRllDUnRnNEhXakQ5N0FsNVZQUWZJK1dH?=
 =?utf-8?B?OTNEQVd3UjM0MGoxVnZOOUVvOE5mU25rSFRsQUF5TGZGOURDMlVpU1B1MTls?=
 =?utf-8?B?ekxhUXArazdyNFFYRVllOUk0akNwMFZUUFVYeDBkaUJOcEQ5QS84Z1FBTXB3?=
 =?utf-8?B?clpQRlhlaUt4ekVvcktXUG9HRnRGVXZsWDA0OUg5aURYNnU2a21MT09iS01s?=
 =?utf-8?Q?Vnujn2Gyv+bTukpUf+MhBHfub?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8b2aa5-6fb2-4b64-02e0-08db0ea66d0d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 16:13:36.2798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KYVhP7Srnk0YZDEIWk+r/vrNuQ6YhxlE4IF5Er2t8XADsEcqhYA8Fa1DV0M9we8zsreMfsJ3SrWdI1h5Dj0BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802

If this VM assist is available (to PV guests only), use it to
- avoid issuing an IBPB ourselves upon entry from user mode (which the
  hypervisor would then have to emulate, as the MSR write traps),
- suppress the IBPB in the hypervisor if we don't mean to have one
  issued.

As there's no good place to have xen_vm_assist_ibpb() as an inline
function, make it an init-only out-of-line one.

While adjusting the Xen public header, drop the unused and no longer
applicable MAX_VMASST_TYPE (instead of modifying its value).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -43,6 +43,8 @@ static inline uint32_t xen_cpuid_base(vo
 	return hypervisor_cpuid_base("XenVMMXenVMM", 2);
 }
 
+int xen_vm_assist_ibpb(bool enable);
+
 struct pci_dev;
 
 #ifdef CONFIG_XEN_PV_DOM0
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -18,6 +18,8 @@
 #include <linux/pgtable.h>
 #include <linux/bpf.h>
 
+#include <xen/xen.h>
+
 #include <asm/spec-ctrl.h>
 #include <asm/cmdline.h>
 #include <asm/bugs.h>
@@ -32,6 +34,7 @@
 #include <asm/intel-family.h>
 #include <asm/e820/api.h>
 #include <asm/hypervisor.h>
+#include <asm/xen/hypervisor.h>
 #include <asm/tlbflush.h>
 
 #include "cpu.h"
@@ -934,7 +937,8 @@ do_cmd_auto:
 		break;
 
 	case RETBLEED_MITIGATION_IBPB:
-		setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
+		if (!xen_pv_domain() || xen_vm_assist_ibpb(true))
+			setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
 		mitigate_smt = true;
 		break;
 
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -294,6 +294,17 @@ int xen_panic_handler_init(void)
 	return 0;
 }
 
+int __init xen_vm_assist_ibpb(bool enable)
+{
+	/*
+	 * Note that the VM-assist is a disable, so a request to enable IBPB
+	 * on our behalf needs to turn the functionality off (and vice versa).
+	 */
+	return HYPERVISOR_vm_assist(enable ? VMASST_CMD_disable
+					   : VMASST_CMD_enable,
+				    VMASST_TYPE_mode_switch_no_ibpb);
+}
+
 void xen_pin_vcpu(int cpu)
 {
 	static bool disable_pinning;
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -940,6 +940,13 @@ static void __init xen_pvmmu_arch_setup(
 	HYPERVISOR_vm_assist(VMASST_CMD_enable,
 			     VMASST_TYPE_pae_extended_cr3);
 
+	/*
+	 * By default suppress the hypervisor issuing IBPB on our behalf.  In
+	 * the RETBLEED_MITIGATION_IBPB case the VM assist will be disengaged
+	 * again in retbleed_select_mitigation().
+	 */
+	xen_vm_assist_ibpb(false);
+
 	if (register_callback(CALLBACKTYPE_event,
 			      xen_asm_exc_xen_hypervisor_callback) ||
 	    register_callback(CALLBACKTYPE_failsafe, xen_failsafe_callback))
--- a/include/xen/interface/xen.h
+++ b/include/xen/interface/xen.h
@@ -413,7 +413,15 @@ DEFINE_GUEST_HANDLE_STRUCT(mmuext_op);
  */
 #define VMASST_TYPE_runstate_update_flag 5
 
-#define MAX_VMASST_TYPE 5
+/*
+ * x86-64 guests: Suppress IBPB on guest-user to guest-kernel mode switch.
+ *
+ * By default (on affected and capable hardware) as a safety measure Xen,
+ * to cover for the fact that guest-kernel and guest-user modes are both
+ * running in ring 3 (and hence share prediction context), would issue a
+ * barrier for user->kernel mode switches of PV guests.
+ */
+#define VMASST_TYPE_mode_switch_no_ibpb  33
 
 #ifndef __ASSEMBLY__
 


