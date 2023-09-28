Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A9A7B1495
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 09:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609325.948364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllHf-0000pF-08; Thu, 28 Sep 2023 07:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609325.948364; Thu, 28 Sep 2023 07:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qllHe-0000mn-St; Thu, 28 Sep 2023 07:18:02 +0000
Received: by outflank-mailman (input) for mailman id 609325;
 Thu, 28 Sep 2023 07:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qllHe-0007vD-1U
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 07:18:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27434696-5dcf-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 09:17:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 07:17:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 07:17:58 +0000
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
X-Inumbo-ID: 27434696-5dcf-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPkMsnabufSmpbx6QIx/y3RCccc5Paton0OJnj41bAN3dXbHTFSqGkgYG3Qi4+PloxpwDoYGO/dbEF9egUO/C0d1E5IM0lxQE95p69cTcu8P4VjNDOVImzOVVnz5YAnSpLEljluTmQnL3PLZ2j+n7rZ3+kDvNBeo3OfWA52GsTc+DtTyr0SHtbzfa9alblHD3HNMLsZg63uMb8wVxTnTu4rBq9hh25js3Ca1dsxrAK34SSKISKvxTGKlTS5w7GN1sUOxdM6LRI9AYf7Fr5Eap3PPz2GtSAbToolwgwnSp/HQXM6WTWIKG0CYLKaG9CnRu0rET/IPoEpp8PFHydQ/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+OV0nhX0WwhrZMdhQwtKb70aws/RhTWdhHwFYCofOM=;
 b=mrhqEjHRXtJUxmNvp9wW1MEkvphEqWFqav8h2IB52p62ZHDI4UW9kSpYAyuVeXqPgaOHJJ8sY/x/kCmc3ZC5/JZruS+BYNTqvRXsKOzOr3XwUVijA8Ho9aK4wVqw/CwZJtUFAm6XXRxAMg4+t8TVse+lbbp1070ad/Wu2ALEvvS/O38TLhZp8UVHWZHXqtIRAOphaOOyvCKSW2LTa7ypAcWGttpOuLnm0+hF5xaoFk7lNoy6zTqmF+Z0HsNoFBjmlEeTorJEF4DOyiSmvCo5dxSFbaYZUoG19r7WdXHdEUQSWSDstG3oTGlibYI/v3tPBiYCDJ29EeLaccysfpS7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+OV0nhX0WwhrZMdhQwtKb70aws/RhTWdhHwFYCofOM=;
 b=Pmr6EypQ4XsfLWOElSTKZltr/62Zn0TLRMewjFu65Pq2x/s3iJWloW+PjKLCsqPZITw9LO/AR6LeTpX5Vuko8v8pnCJToVd5bOAXLJjU0esbuHBzoKEsDruJSv8+AdaTQQg+xzbdVJj2wAT6hK5UwRRDrDxzOK0lyZTJhhu3TvFsc9PoIQW2T39EFWIU1eb8Askmyib8AHJPd83m/7pmb/WwZZ3YYt2rx1cxG5/pug5I7rsE6jbfCAfknkvasxTOvLiTxFAoyYl32qwCFagQsxSo7Oucc5bqTdoaXKj+jazPhj6YRWKFIMvYij2i701wYjw0OuSXiCbN7bnrQC7WMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f28ae35-031a-461a-4be2-b24a057ea20b@suse.com>
Date: Thu, 28 Sep 2023 09:17:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: [PATCH v4 8/9] x86: introduce GADDR based secondary time area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
In-Reply-To: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 264fa25e-f1c8-4ea0-23aa-08dbbff30ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ept45ednt5cbtDXb7ICCfhgIFUH+r7U7YPlm4uROa/5tKfzn/QiurLtb0tSYg3CEs8wyT+EvZm+534IbU+MpixjtbL6vruaKBZzkfs4GRYUI/n3JmGx3sf9sDT7KbH4dgRXyhvxgrL3i58d9ZZM0ggBtGzuo+bM7yjQgnJisIjoQxORzvWKJ4bOLM4Ag7dIOL4+m0OFOhj/DfvDhkb0wlUoYOwIclVD1eO7qpu9noOL9GIHLE/BWhV1gzRdJlVq9h8iTy5W39CHa+66ZjRoDF1RLUu9gj/H8pGSAN2BTnq0gy6lNrLmKS8J+ud3EwV8XuvzZA7TIBLv5BKZugy1vNAavgJ63EXQEQGHWIcBUMNc0LPaSYqy/h43baUeajoSWNmfe/La6QYLIRiW3FyG9/quCG6w58447VWO6iEZHPp8LEW6qNLF22w38QGNbABk+lqQRx2RB/Ntf/KVRnzw4EXv6RpVebLfB7ujK4GKp4vTiUEANYvboZ4SKDNA5hBuf6PKUGsCVGs4cK3KEyy+0izfX7YBGX1Cun0cHhvwOx0ME66TBie2U4JSEmAV+XGFcFKMw7jfcwnEGr0cJTJ20+3sD/psc6NQO/olfunkyG1Ul3toi+7PAE53TtSacNprvFK7eE8CLvy6sjxYXqK/tlg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2616005)(83380400001)(26005)(31686004)(478600001)(36756003)(6666004)(6512007)(6506007)(6486002)(66946007)(66476007)(316002)(66556008)(54906003)(6916009)(8676002)(41300700001)(8936002)(4326008)(86362001)(5660300002)(31696002)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkVBeWhuS1dDUEhZYUs5cWorWkJ3YW8rc2pVMC93Qkl2V1F5Mmlac09ZSldn?=
 =?utf-8?B?R2xpQW4rRTZRNWJtYkNoZGRpOC9BMi9FWUd2amlhNlJCK1JEeHZHUk9vRTE3?=
 =?utf-8?B?T1dkS1hMd1VxMzczYWtrVnlMKzNkQ2VsTER1RzdBTEVIL3g4TEtTSTBUYVRM?=
 =?utf-8?B?YUJaRXdqLzFMWHRFdkVVbnVyM0lCM3hwU0ZNTjVQMStFS0JIYjJHTXdqdDZo?=
 =?utf-8?B?RVZZNDQ2Sk9RRWx5T1ZCUGpENnVNQ1lqOGlPZ0xuN1pUbkxTazRZdVZidFZm?=
 =?utf-8?B?NWZPMkltWE5HUTZrVkxmVDVtdm1paVRObnhBY3JKWlYzTlRuK3U5LzYxWTJq?=
 =?utf-8?B?Mm5wc0VWTG1iSjIxbElxVVhFSHRVQWNBb0VrMDZPakxXNndHNFJ1THRYU0tB?=
 =?utf-8?B?dStac0hkTjFLckRjOUpPSkhTWjE4YnNhdGVZQjBFelI0ZWJkWXFMRW1xbHd5?=
 =?utf-8?B?c3pGRnVCWVhqcXRLL3hoVkd4WnMzSU8wYXpDcUlCaEFtaStCRDJ0a3hsRWZx?=
 =?utf-8?B?cGhqZ2RQVFJ6bXRabWVFYko3WEJIUDI3ZnZQUHY2OWhHSTlSWFFwTDJOVlNF?=
 =?utf-8?B?Tmp0YXhRMzIxc0xteWluN2E5cVhNQ1Q5U2QwZE9kNVEvNEx5QTdlTnVLaDVy?=
 =?utf-8?B?NkUxRnJnUWI4aS9ZYzduSjZvTjNGUm1oeXVKTU5UZnN4WFp1MloxZ1NMdVZ6?=
 =?utf-8?B?akFJSTF4bkl0SURvSnp1eUY0MTNRbDlrZ1R6U2V1WDFZM0xVenMrS3JJaXg3?=
 =?utf-8?B?S2J1TE5LMlZPRlRRT2tjek9zaEVyNEtWL3FOeFV3dE9wdHpqRURwUlRoM1F2?=
 =?utf-8?B?cHBWbTJKTFRDejNGUlpHcWRaMDlkaFJkNkRJQ2VvZ214VlVRZE9yTGVva3Fm?=
 =?utf-8?B?Rk5GRThCaUJFOTUwUVBxZ3gramlCN2gvRjVXSVNFaXNzNnBWWFR1SFVtQVNi?=
 =?utf-8?B?clVseEJxeDBZenE0WS9xTSszbDAvWk50aThpMHhYaS9JR21pZlQ2UUZPM29V?=
 =?utf-8?B?eExTZjgydEFGTVJ5S29vYXpreHNhbXdNVGNCU3dBSGVZWlZyVU1JQTJDeDRZ?=
 =?utf-8?B?TFVGTGF2VWlNUVBkcXd2am1Iajc5Z2U2NjNmNitnSng3bGpHVytYSlZxZDZN?=
 =?utf-8?B?ZWlWYWZicUJVYzlwK0ZIcWJyNUFURHBzYjE4Tk1ZbXduRk5FQSthUVhFRjJE?=
 =?utf-8?B?S3ptdlA0cVRabXlUL1N4SjFBOE1pREJ0YndQdlZqSmVwd0JyKytldEFlZHFY?=
 =?utf-8?B?N2VWV0xmTTdXQmdZbThLazEzOG9mbkhRZFV0VitJb2ZzSjhHWG5wMGtxK2pm?=
 =?utf-8?B?bEhqZ2JXVzNGM3VWa2FQMk5qVkUrZk15RllBSjY1SnJOT3ZERnc3cDVQdDZZ?=
 =?utf-8?B?MGowQmFpYmcybVFsQkpkeHphQW9nWm9zK2hWVi93b2ZuR3pKOU9HeHhIVXNB?=
 =?utf-8?B?OXhGaVZ5UmpETHpQSmNyKytMMzE4bmk1YnhBbWpVYmg4SnJEZ1doNUgrazZv?=
 =?utf-8?B?Tnc4R1RSMXM0aWxFYysya3ZEUWRxMjJDeEZTeTMvRzFxdjBuVGViQXo1bjlQ?=
 =?utf-8?B?Q1kyQTg2UEZndVZJTzVwUW54eUlUU3B3cjNsaFNRSWJRSjZ0R3E5VmtLdGlp?=
 =?utf-8?B?M3h2NUxxbG9QQzdIaEdhNENwWkhNNllqR09LT0JpdFg3bEI5VFYrTEJEbHdm?=
 =?utf-8?B?WnNsYmhNS24vT2tSend6NGdzc25sS1RlZStrQ1E4R29BNmw5WWJDTEY0ZEVr?=
 =?utf-8?B?RjR4WjBxK1YvQ290OXc2VGNQR2lmK0NHQ25mTlV2Mk1HMWRlMTNkOUx1ZWlK?=
 =?utf-8?B?cFpFUHk2Q0RMMlJOcm9VUzFGNUIrWXJubmNOdTNwM2dhYSsraHRHM1hFSUZ1?=
 =?utf-8?B?Z1MrczVFelRzeGRsa2d3V3VnM1MrODFPUnY0NE1WYk1jM2U1TFJmQm9BK1Rk?=
 =?utf-8?B?MjNsbldFbkM3Q09JUXBoRXpZRFVhR056SklicTZocXN4TkRYd2RDak55TjZO?=
 =?utf-8?B?ZkxkVndqS09nNTRVeGhoc1lDdTluUXhCNzIxdG9pUEFaT0JqWldHcko0TEhr?=
 =?utf-8?B?SFh6YmlyL0V6aXZxcFl1aUY3WXFlTVVpQW9qOXhOTVBtT1FZZ2ZBQWZoam1V?=
 =?utf-8?Q?nAFyjuRJ3gEnHSmBLxB08sQ+k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 264fa25e-f1c8-4ea0-23aa-08dbbff30ac0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 07:17:58.2340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zE0Oa4A0aBCKJbQ/T7En8QNEbcdI/pLyRESvOf5uR7byHXgr9WLhlZZBvr6avDMSYPT6X0yDfjU03E+HPBWRlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

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
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: Add xref in public header.
v3: Re-base.
v2: Forge version in force_update_secondary_system_time().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1529,6 +1529,15 @@ int arch_vcpu_reset(struct vcpu *v)
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
@@ -1566,6 +1575,25 @@ long do_vcpu_op(int cmd, unsigned int vc
 
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
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -692,6 +692,8 @@ void domain_cpu_policy_changed(struct do
 
 bool update_secondary_system_time(struct vcpu *,
                                   struct vcpu_time_info *);
+void force_update_secondary_system_time(struct vcpu *,
+                                        struct vcpu_time_info *);
 
 void vcpu_show_registers(const struct vcpu *);
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1628,6 +1628,16 @@ void force_update_vcpu_system_time(struc
     __update_vcpu_system_time(v, 1);
 }
 
+void force_update_secondary_system_time(struct vcpu *v,
+                                        struct vcpu_time_info *map)
+{
+    struct vcpu_time_info u;
+
+    collect_time_info(v, &u);
+    u.version = -1; /* Compensate for version_update_end(). */
+    write_time_guest_area(map, &u);
+}
+
 static void update_domain_rtc(void)
 {
     struct domain *d;
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -115,6 +115,7 @@ compat_vcpu_op(int cmd, unsigned int vcp
 
     case VCPUOP_send_nmi:
     case VCPUOP_get_physid:
+    case VCPUOP_register_vcpu_time_phys_area:
         rc = do_vcpu_op(cmd, vcpuid, arg);
         break;
 
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -209,6 +209,9 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_get_physid_
  * segment limit).  It can then apply the normal algorithm to compute
  * system time from the tsc.
  *
+ * New code wants to prefer VCPUOP_register_vcpu_time_phys_area, and only
+ * fall back to the operation here for backwards compatibility.
+ *
  * @extra_arg == pointer to vcpu_register_time_info_memory_area structure.
  */
 #define VCPUOP_register_vcpu_time_memory_area   13
@@ -235,6 +238,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_ti
  * VMASST_TYPE_runstate_update_flag engaged by the domain.
  */
 #define VCPUOP_register_runstate_phys_area      14
+#define VCPUOP_register_vcpu_time_phys_area     15
 
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 


