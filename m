Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D685677E7C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482973.748816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyFF-0007Kc-Cv; Mon, 23 Jan 2023 14:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482973.748816; Mon, 23 Jan 2023 14:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJyFF-0007HS-8P; Mon, 23 Jan 2023 14:56:25 +0000
Received: by outflank-mailman (input) for mailman id 482973;
 Mon, 23 Jan 2023 14:56:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJyFD-0007BS-Oo
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:56:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062.outbound.protection.outlook.com [40.107.104.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19d9b1c3-9b2e-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:56:22 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:56:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:56:21 +0000
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
X-Inumbo-ID: 19d9b1c3-9b2e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUYbCZqUooZtUB5YodunRk27zv62PW646tNw5KgD5K6H8gTfDR7msNXifAFc0SndPlfu1oniUsnWKnvg6xN9AqouWyZ15v6yUSMmjky/ZrTPKQ/UoE+8giXyJznyaPQjELemw4p2qiSaDBaRDlne0/nH29jqM6iICm2RBte6aa32j3RTVdWau8H8lhA4rMtX7XibsqumGGgtvDDV82Bav3SsmYYg79vbxvaKEO6e4ZWlrdvG+ceMME2fk7ItwC184sQ77St7O5QW/lCZ9DhHG3fcu+x3xKAA2B9QvMEHo9LtBsoCImpwQtxFJ1SESdRSgKi/Jlilb+z4un6qxbECDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fluMR14yPGtt1MEzvUXmnvLOAxRzJWqVCDdd15B6Z4=;
 b=dbnoMzSWC+4eWlIOSS9vvWJWSEMfj+fWsE7rat10qxMwXQ3NefCX3DDIRc3qmB63iPN5cocnHDlT5kcMQChzbXuXIaPcqIcIu2IbYXX87f5OlbW+SPsJSEf2JhhHpNibnLQIfSXkWeA9YEAgAujbGOTwZ1shcVChTHIuwA7GA7xmGHkImpHw72O4jN/3YzctlMzoWSXF/opycOhAFv70HEs/qNxiYGD3/pdNwqVXT4TIy15breVW12ps6lKex5dbrO+ni3O46B9X1yKyzU2vUfChXSQZaLlRSeuy1gcAP9EoBDApBJa176huCt9VnDAvxxzguFaBso7rEc5NCYFSLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fluMR14yPGtt1MEzvUXmnvLOAxRzJWqVCDdd15B6Z4=;
 b=l/+qPrcOO6Xg5Wxh0yptKE0JiGUUPek//MwpraJgP1Isyo8PKsi2mosmG1AV0eu3ECrloWRHmhR6P0iqvIraqyjO/8qf8h7W8X2RBY1FOdd51gT+I1rfaG7eODDzJGUwySdJ8S7RuRshisqnUxla+3msNBe5hj5xUJ5rNhwOZGguWd0RiN1xZ3O0LmIPhMKG3FmN3Cyg5KppU4Q4vcDweyde8KBe6Rn6nUQgcSRPgFHlVkq9+b9qx3Zf/CZ+ZQfx89QP+EVPg2MCJjWv7CIYgdqObUHjccTaHDElgM/aSPSb2wjqstIqIKgw4G5CbbmVViMyqs9UAL970a7Nat+JJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97fe3de2-a647-ede6-1831-1e301976b83e@suse.com>
Date: Mon, 23 Jan 2023 15:56:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 6/8] domain: introduce GADDR based runstate area
 registration alternative
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
In-Reply-To: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c0268a-90b4-4562-ff05-08dafd51fd3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TjFcoZBjhsLCQDkM+4WZssqtmE8aESLJyXjjlauAXK3gx4ZDiSDhNjSObQDravJPLHu5BgoKAYvro1lR0OOZeTKQ6voNg3t6H6rW3JGjdz7ah0x7eLuDrpkOMJDdLNMsE9kjFkWHsqnz0bryTt7HkHRTMDprk2IneWW/crRACIDxvrW6FfPjTXTlh5HBmWV7j/s9tOhXm3QynipWXqzpOMOs/tbRP9r9fZZd43NJ8XM+QHplztPAUGtNvOuep1L49kBvdiaGY35HvyhpFlPBwmrIJ6gFDAvO8s5Wn7exOnOa2Gcbj089LCqsM6wgOSnCCBGXqnwFB3UXFNXSSbxMp3yPxaQ6bd3eGMpweOufhvjH5ujeKPNzsjHqlV7Z1DLGZEeL6z/sS4Nx8jyv07tkp50qMY5HQPvICwyYmcBYxHo5l9KOzZNtL540xxAOLYFxDF3j3psaDh6ayTeLFQu+GjiBv9gYUjgnMkBu5mPCkpnT1DaffsTPL3rtTDIKxLqTC5MIHLSXTxFgCxyVYdPKtZlcL13xjjtZINCLtOp/JaOua9m/B8pqBycgE+ERORVMGeEIfIIHJhV/IZayuzorIg197l4JD/lK//lGbEZccgeDuocxlBNVMePh4UPpHWGzAkmldabDdqR8lU50XB+tYGVV79th8p38T7gv6eEXLoNNZxYHAm2y/tMlS1MxkQo+yPpNjeVIzkd7nYxDTVx7mXmKmPa+LqiegpHzHwTcHOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(39850400004)(366004)(346002)(451199015)(31686004)(2616005)(38100700002)(31696002)(41300700001)(2906002)(8936002)(5660300002)(4326008)(8676002)(6916009)(6506007)(316002)(54906003)(36756003)(83380400001)(66556008)(66476007)(66946007)(86362001)(478600001)(6486002)(26005)(186003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBOUHhyOUlEOUprKzJvL0FyUkxkZVZlUTNZSERLZ1hiaWM3amlkZFhrMjY2?=
 =?utf-8?B?ZzNzV1ZLcTlXT0c3MjFxa2NjY2ZmQmdBdEVWV3QzV0ZWWW5tcXdUWjl4WWRB?=
 =?utf-8?B?bnpTZnZKbVMrRkRCVXh4c002U0plZXU4QXRkUGxDbWlOMmlXcTNROEdEWllz?=
 =?utf-8?B?K2ExUm04TFJaZ3FyY1ZEc3B2VEFxamJpeUw0M0JrbitSNHFOaFpBektSVG1G?=
 =?utf-8?B?SHl1VDRDTjR3ZFBIK0NMNXVXL2M4RU1KYm82empwQjBEMjB5MElGWmx4dlRF?=
 =?utf-8?B?enFDWmVpY251RHpiTUN6LzVuTklWaXNKVWQySXpLUWFJQ09uc0pkSWJWMndF?=
 =?utf-8?B?ZVd4eDhNUUI0MDA5cmtiZi82STVtd0V3cVZ1VklPVjRiYTFnUDJkUnRpL3h3?=
 =?utf-8?B?blZCNldyUGgvNDRDazZFaE9pR3did1VBRFJIS3VNTkpwOUw1VHdtUU15T3JF?=
 =?utf-8?B?UGZlcm5wQTNWMUJXaHVCOTZzWVdGVlRJVURocVc4cmh3Y21hdCtORUdZYkdU?=
 =?utf-8?B?eFVvUi9mSmlKQTVkTzVTci9aNHdTMFc0NnR6ckt1OUJqZTR4TDlhOTlxbVZL?=
 =?utf-8?B?SDR3Sjlla3pKNS9qQVhhQWd6T2xXQlJXaUJZSWN4Y0pnZnVkQWw1YU5iMG5Y?=
 =?utf-8?B?Y1FZQnB5dVBCbmQyYzAvMHQvNEgxVXpYWlFycXJmNVFRdkFyVHdvN3ZDRlMv?=
 =?utf-8?B?d1lMbDRJTWVscllVeWsrYjRPSjRGRXVRS05WcDFmeWR6MXBuT2VvUDhpZHow?=
 =?utf-8?B?NFVLSWYvdG9CKzErNU1UaFJBbkhtU3UrWkp3eGQ1M3lGTHBET1BFVklDUW44?=
 =?utf-8?B?bkFtcDMrREYvL2JQVmNmazF1SnV4b0xZREtUejRtM0VXMjJIbkE2RWE4Sk5t?=
 =?utf-8?B?aHRvYUJiZld5NHkyS2w5YnF4Y25qcnVOcjRCbGN4TmMrajh2MHFCeDF3T2NT?=
 =?utf-8?B?VXBYWHJCT0ZBTm1BeFMxR0twc05SUzc2Mmp1SnYrUzliSDRXRjdiWkNXekh6?=
 =?utf-8?B?YS9rbENkNUI3WHpyWGJoLzRSTCtORWhTWVNmR2RLamd3akJxODZwUmJmWXhB?=
 =?utf-8?B?b2IvNnhIN2lmZGVWNEtCQy9WUW1NU0Rjb05aQ3pIUVEwbng3MDdUZGg5dlc3?=
 =?utf-8?B?ZWhldHJ6cFpWNzBDa2JMYkxoWTJsbjErekZobzRMc1N3WnN3bERaQ2JOREVj?=
 =?utf-8?B?Q2FKb0VWakJmbTVjQzV0RFFuekU4WVN4RFQvWjlLNTBmaUNkdmdPNkZENkxF?=
 =?utf-8?B?UjFnRTc2QnFzQlZOTEFjcWpLa3ViRjd6S1FjZnRha2tNY1ZaUEkyaGFIUGVK?=
 =?utf-8?B?cUdIT0o2Rjg4T3czV1ZEdUd0TG1JejFLVUFhTUN1WWV2K29EMENKc3NWUHBs?=
 =?utf-8?B?dzEyQlNtR3F0RG1Pc0VRUHpNOXptQWJaMVpZRG5XRStZY1V6NzBsV2gzQTFK?=
 =?utf-8?B?SGRXWjhKaWQxV2prQ2VqSEJxdFBmazNDcHBUS0dNa1dlWVBqamYrbWlDT0gw?=
 =?utf-8?B?djNCM052VWkrNXlrNVY5c1NiUDU4aHMwN1N4eWRIV1JwTFBKVmdteHUvaTJi?=
 =?utf-8?B?aEZoL0RISmkvZ3pHWjBwaXlwUUsrVDNLWkFIaER6R0Y2NURPbVRibXMxY2s3?=
 =?utf-8?B?cENPSmozck8rVGRMUmpMRTJ5UXpiUEJSU0J1SHFhM1RQTjJ6OEcvMFMzd2NR?=
 =?utf-8?B?ZTZHVGNMdEF0OTFPYmdPcEFHTHFLUndkWHhHVWNoSkRBRksrMkRzZG5IQW44?=
 =?utf-8?B?QUNVdW1Fclk4TVBBY1BsQ1NUdU1aK1g3RTdQZXVObDV2RjNEM3dRVi85aU5R?=
 =?utf-8?B?Z25KM2tRYmM4bXFsczVYVDdHV0RGZnk1bXNxWVdMRzZ5SGZNM2d5Q09jT1Bu?=
 =?utf-8?B?eEd5Uk5GYmNFUXcxNFNqcFozQjhnSERaYkt1bVpqVVVkNVFwYTlaYXBzc3l2?=
 =?utf-8?B?Qm15c09FMmRvTTFGRUtpVWh2R1hTZ24vaXl3NFdtcFNZU21mSFp6NTljcTgr?=
 =?utf-8?B?VjRDaFB0cllvN21TWVJDMWs0SEV1ZFhhR1BZU0l0QW1oZ2JINUtBNjMydklO?=
 =?utf-8?B?WGNZTkJMY2Q2bENKRlJ1L0hPa3JMWFZtQWR3dUE3bXEzN0k3QVhUdW1yNno3?=
 =?utf-8?Q?nsBNBwSlEnWR+EeeUz1Y+w2y4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c0268a-90b4-4562-ff05-08dafd51fd3f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:56:21.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpjL5HXUBmS6BTOABqsxSM5R2W3orsmx8uxX45BOTCQbGF5QiPXSmKtwim++UxUF6y4V2rXP6YEu/JGv3K9bSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

The registration by virtual/linear address has downsides: At least on
x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
PV domains the area is inaccessible (and hence cannot be updated by Xen)
when in guest-user mode.

Introduce a new vCPU operation allowing to register the runstate area by
guest-physical address.

An at least theoretical downside to using physically registered areas is
that PV then won't see dirty (and perhaps also accessed) bits set in its
respective page table entries.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Extend comment in public header.

--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -12,6 +12,22 @@
 CHECK_vcpu_get_physid;
 #undef xen_vcpu_get_physid
 
+static void cf_check
+runstate_area_populate(void *map, struct vcpu *v)
+{
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.need_update_runstate_area = false;
+
+    v->runstate_guest_area_compat = true;
+
+    if ( v == current )
+    {
+        struct compat_vcpu_runstate_info *info = map;
+
+        XLAT_vcpu_runstate_info(info, &v->runstate);
+    }
+}
+
 int
 compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
@@ -57,6 +73,25 @@ compat_vcpu_op(int cmd, unsigned int vcp
 
         break;
     }
+
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct compat_vcpu_register_runstate_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct compat_vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
 
     case VCPUOP_register_vcpu_time_memory_area:
     {
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1803,6 +1803,26 @@ bool update_runstate_area(struct vcpu *v
     return rc;
 }
 
+static void cf_check
+runstate_area_populate(void *map, struct vcpu *v)
+{
+#ifdef CONFIG_PV
+    if ( is_pv_vcpu(v) )
+        v->arch.pv.need_update_runstate_area = false;
+#endif
+
+#ifdef CONFIG_COMPAT
+    v->runstate_guest_area_compat = false;
+#endif
+
+    if ( v == current )
+    {
+        struct vcpu_runstate_info *info = map;
+
+        *info = v->runstate;
+    }
+}
+
 long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
@@ -1977,6 +1997,25 @@ long common_vcpu_op(int cmd, struct vcpu
 
         break;
     }
+
+    case VCPUOP_register_runstate_phys_area:
+    {
+        struct vcpu_register_runstate_memory_area area;
+
+        rc = -EFAULT;
+        if ( copy_from_guest(&area.addr.p, arg, 1) )
+            break;
+
+        rc = map_guest_area(v, area.addr.p,
+                            sizeof(struct vcpu_runstate_info),
+                            &v->runstate_guest_area,
+                            runstate_area_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
+
+        break;
+    }
 
     default:
         rc = -ENOSYS;
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -218,6 +218,19 @@ struct vcpu_register_time_memory_area {
 typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
 
+/*
+ * Like the respective VCPUOP_register_*_memory_area, just using the "addr.p"
+ * field of the supplied struct as a guest physical address (i.e. in GFN space).
+ * The respective area may not cross a page boundary.  Pass ~0 to unregister an
+ * area.  Note that as long as an area is registered by physical address, the
+ * linear address based area will not be serviced (updated) by the hypervisor.
+ *
+ * Note that the area registered via VCPUOP_register_runstate_memory_area will
+ * be updated in the same manner as the one registered via virtual address PLUS
+ * VMASST_TYPE_runstate_update_flag engaged by the domain.
+ */
+#define VCPUOP_register_runstate_phys_area      14
+
 #endif /* __XEN_PUBLIC_VCPU_H__ */
 
 /*


