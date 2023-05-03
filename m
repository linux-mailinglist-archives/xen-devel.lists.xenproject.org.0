Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431836F5BA7
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529342.823676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puErs-0005JK-Fj; Wed, 03 May 2023 15:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529342.823676; Wed, 03 May 2023 15:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puErs-0005Fz-9S; Wed, 03 May 2023 15:58:12 +0000
Received: by outflank-mailman (input) for mailman id 529342;
 Wed, 03 May 2023 15:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puErr-0004ZO-Ar
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:58:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cfa37bf-e9cb-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:58:09 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:58:03 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:58:03 +0000
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
X-Inumbo-ID: 4cfa37bf-e9cb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWQ3OkdIcWpnojaH7W+ucsbUWR1ZTeRXk5MK8lmHmASi3pmiabuGpCVVT8WhdErXDqBa4BxJCJ1Alt17mH8fg248Xic8TrMIJ++LrScAGsEwlll0b6TfeOOaLY01SA0PS5k2iVMN18pKgOIzCwdmULN3hBwcdh0EuFYxWKen9PRoixnOkv1nOOGWlQRY04I1ShT2hEXzgbRDQsCixQt4+rR5vfeFZ0mjS6tfqwMez3mMqH0HiAL6oOqD3V5K4Zg7m8Gv4P4sxaaFRdSePHnvsvTXHGqFt54HS6WQvZWHaGPXmmXnpNUPOR0GPGiaTkp6jdEw2CCIMgb3BTcNJoygJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IQwYv9j9TS5s8pPI31juObfMSOZTWBzzVzQE/pCSAE=;
 b=JezfK0d/OwXAuSHXH42UrRKDhCwMCqcO7K2vS5uJyVBzBcwnKpxZvQ8D1eIlfGjAHsYzegb/2g8p/GuIckjqP/B5jNCywu/riXvX5Ngwqv7Ssdv5N7wum62mSKsPv7pc+TrAmBVrHTDL8EkPeYBd30evFQgys4vE7PjEnqJ/pGrepvThyoudQ/Gq3q+duZaxXbu9oU+jwijYWDxyIk/PdOXv1OhJfR2s/EVsF8RQOpV7+RRzmqK+wpP4a7dx5kEyqnOMebC7VSnmrC+MHhqOsaG70oubSciRIfv8w2M3LMYJTlqxP/Tpc+umpMfhNw0FvexYy+VIINgj8PwFLHhF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IQwYv9j9TS5s8pPI31juObfMSOZTWBzzVzQE/pCSAE=;
 b=0YW3mguoNtsxk604tYbrugzbScH4vqZrqMg1kaVOUPjNZArkBc8pAhDEoTDdtodKMCe5LtlzaZHttuoPb8apcOUbYMT0Wnc86JwxNaJLlHiUaelFOFVCRNdtS+Mq3Y2ySaR7AWXjDceYgc5zkcDojgW4osb8kCcPe2qBv1AsnOWNaRkxEwXLL/vn1hX/NOd3KXRKC+2TwcILbIx3VFaUqlD2jkr/5wUzaw3ni3NUfgx7UJvNci+tCVmmeW8BrR+oOlRfUjLlFNKqaPOHMuMxhMdXNc5pWltg5l/Tzmms7WErcg/UN3/hYb6aHchx/KRVgy8OCQwdiNFRteQdm1MgMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77218fb0-5e96-4ecb-c2b0-4fe8c3ba683f@suse.com>
Date: Wed, 3 May 2023 17:58:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 7/8] x86: introduce GADDR based secondary time area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::24)
 To AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adacc83-d5b0-4ccc-3c71-08db4bef2d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nA0ZLjq39ztusNsD3W+n4YXi02q0iFsSXGG607E1IlXbU/vEiyXEfcd6er3qAZhnjj6EAul0hlyYTuFV27y538Qc1q7kCt78VSVA8G/d1R5xNZxBazrtKc4/0KeECMujJYaN88m8yKE3LsPLGiDPPTjltj8wEQgO53lhW86RcS094EcgOsFtKlANBGyAQmbdp710a27VeAmCPFCoIMU/xbJzBs6uNgeG6N7Y4iZ8t3Mxxl2enZ+/p0ILnUimMJrRBfx67u4AY+o3RbJ65nTdTaN2CP+2XsBaH4ckc6bdL941/LhsK1us2oQCMM1yWS98U+P3EOvkeoQWm92wYjwmUK3GwNo3+8w0rTv3hRRkm4xw9vp6gA64aSQtT9eiQi3LlJ60MBsrs6mfGy40ckVxkB1VKuv2Wg9fWXsKDJMtNFsfkBDR4WRATn9hO5AAt5gbrEehI0DGny5NvYnJT1WP5nW/TQOsTtx/tDwnZDnLrkGshhwIUER0jdAKT40qG824G/iR7N3kTNVqG7qShTmlnJNmqAef4U9XcNMc3V7/iPjevo+ShXe55sJov5e+CBcuT36nUGkFL5Qal/fkRmcErRUbGe4KUUjTN1JrvqicOLouQ9+Bm3PCx7fKzUgZgZ5l493G++OhciqIzjc1UK91+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(2906002)(38100700002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6512007)(26005)(6506007)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z25FQ1Q5M2hJTDFWMWxSZWtOTysxZlNBbEJ4MUFLK1phNmhTYVhlZ3NaWUlG?=
 =?utf-8?B?ZUlxb0JIdzU3RUlRNFF2UzZ3a3h2dy9PbDNTbDkza0grYUNHQksxZENWSXpr?=
 =?utf-8?B?R21tRURVYnVTVkhwSWhYdHJmRnJBTmNXLzRLZys3TVhJTUN4TW9MLzJWMGNo?=
 =?utf-8?B?dWdHNmxrTHYwMXVrTTN1M0FRK1FON0ZlSlZpM1ZwMFVSd2pXK3lZOVFlUlA2?=
 =?utf-8?B?UVVmakR1VUxyV1FvSVRtcEZHdzNYdCtXRkZRRkorcHRpemo4b25TeXNIYm9h?=
 =?utf-8?B?N0o0cnNhS0pCdjVIN2swbFNMSnlpSkRHVTJRNjVVQlhxcDMwSUgrRjY0SlFh?=
 =?utf-8?B?UTVaejk4QS8rdDExNnFjakY0WVpMWWpJM2NOUEVwVFVsZ05RdXEvb0loamgz?=
 =?utf-8?B?bGpHd0NGTGJTWkg5OWc4MXFJYjNoS1hlMGZXaHdCYnd6QjZPRWtLQVFSZGxr?=
 =?utf-8?B?NmI4eXdyY0cxb1RKaTVvcGR5cFF0Q0dTcnl1S1h6dlV3UDFHZFVQNWR0WFp6?=
 =?utf-8?B?eE5sMGhuL0VxczhDb29MMXVvVS9rVGZQMXd2YUl0dXhQdGU0LzhqbVhJRksy?=
 =?utf-8?B?ZS8zY1pwcWZFL1MzNXhrRndTOThLUDI4L2hUbkdPaEF0YTlMQlY5bnc5UmY5?=
 =?utf-8?B?ZWJCazdZTXFmUHRKYjNCa1JTM0hEaVlCblcxa2RIakN1TzIvSUViaDlpZG9h?=
 =?utf-8?B?SGM2cDA2eEpaSG52WW1oeHBCeFg0UkNsR2pLZHZ1b3B3cHdJWjJPcis1Yk9Z?=
 =?utf-8?B?TmNQT2xKUCs4bXlKVCtuREtLZDZhNU44bWpydWUrRzhaamJ5aVFtQ29tbWxI?=
 =?utf-8?B?SUcyZlRQSHdjTkFGdm9BeXdwT3pXZkgzRzFuK3kyYnVNVWwzRGpaYjREOUl1?=
 =?utf-8?B?QlJCd3N5ZWZWTlRlcm1vTjJTbUw4N0JyWnlJMWNYR24vZ1d1YmFucGJMRDFs?=
 =?utf-8?B?MU1rKzBNNkU1M1A5SkovVmxRSzNTNWZnWWE4VHNxZjA3NGhROTVFV09WMWEx?=
 =?utf-8?B?MUkzWUtmV1IrRUREa2JXcU02SVRMTVpPV3BqdFFjOHh1SmRSQWF0RkQzdmF0?=
 =?utf-8?B?OUZPTnAvV0RxeG1LTkEvUnNzWVJraVlueHpBSStMaHQ4QzZKd1JFN2tkZUJY?=
 =?utf-8?B?NDZGNkFrL0NGdDBSbk4zVGoyd3JsUzFxZHlocms3MVhCNjBiTEpiY0pNMGRz?=
 =?utf-8?B?L0xRRHlvWTBSWXE3UytCMUZZeHd1QitvMnYwc1pqUW10Si91ZFlOcVVhZVE1?=
 =?utf-8?B?TG5KSVNmTEdISGIrb2lxb0RGU2U3cGRvTFBaSnJxTEhEY3R3NWpuL1JRTFNK?=
 =?utf-8?B?ckdzMVdsME5PWHFIbGVxQUd6dWFTMDdieDlGSDA5UW1wNzFyM0FzNCtCSGhQ?=
 =?utf-8?B?cS9EQ2RlOXAvakVWSjZDR0R5amJRcXV5N2tXeFNVSGFoR0VNdTh2ZFkvS2tx?=
 =?utf-8?B?OThXQ1NFTHF0VEZKd0UzNUthV0hwZWlkRjNqdERYMnZQQTdHUEw4Wk92S0VM?=
 =?utf-8?B?c05GUEFaMG1zbEZ5WWh0ektxSEpIbkJUdmNlNlJxWGFLVU9DR1ZxRU01ZG1X?=
 =?utf-8?B?L0JycEpUNjRlQUJ1SWk3Z0l6SWp4ZjVPSGdqMHN2UVFZbnNzbUppMkk5YkE0?=
 =?utf-8?B?bkNFNHRyWmdYOW5tTHFHTmZzR0FyK1VxN09DSHBBQVJ1eVNXdFNQTTh4eGVG?=
 =?utf-8?B?a1c4ejViOVZxeTk0SVM5aGkvdXU0bnJ6TmZvTGhUTE5KZ3RRVjFuOG9WTWYz?=
 =?utf-8?B?aHk4NUI4bGprRTF1RDN3cmg0Z29KRmdrZDRjYnNMVzlsRlBRK2E5a1haMzhM?=
 =?utf-8?B?SWpiRTB3Rld3dWlIN2lud1FCRUNEVGhoWUhZcjQxbWg3ZzB4U1kvNmR4MUlU?=
 =?utf-8?B?NFNtVVpaZ213bnJHeDdDQjRZYlJDeU54Q3FBQlJSRWhvNWI4NldrcGN4dHNr?=
 =?utf-8?B?MThvY0hMcUoxbzlMdUUyeFQxWVZzOVRiRmZUMFUxWGpuMXIwMTZGQ1cyV3Rv?=
 =?utf-8?B?Tmxub01xNG4wUU1uK29rK3RNZ1BiSmJkZ3NYRENLSGZjV0NqYnpVNlY1SVVZ?=
 =?utf-8?B?MDBBQWtBMWxOZytnUWdvOHJGQTQ2MlM3RmtaRHFJbUl4L3hFc3IxMFlOemVx?=
 =?utf-8?Q?XIuaRkbVaIWiyqxtnUYQ4tp74?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adacc83-d5b0-4ccc-3c71-08db4bef2d0e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:58:02.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeKTkZKAXxPcnWAwQHiplkpt2tWBC3ott9VQCqULVr/4I+nw8db2Y0Y2YBBXEDzEnjkTaTxz7vFA7+37YSJmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

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
---
v3: Re-base.
v2: Forge version in force_update_secondary_system_time().

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1504,6 +1504,15 @@ int arch_vcpu_reset(struct vcpu *v)
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
@@ -1541,6 +1550,25 @@ long do_vcpu_op(int cmd, unsigned int vc
 
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
@@ -1633,6 +1633,16 @@ void force_update_vcpu_system_time(struc
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
@@ -233,6 +233,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_register_ti
  * VMASST_TYPE_runstate_update_flag engaged by the domain.
  */
 #define VCPUOP_register_runstate_phys_area      14
+#define VCPUOP_register_vcpu_time_phys_area     15
 
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 


