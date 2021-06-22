Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730603B088F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145898.268362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviA4-0007ID-L2; Tue, 22 Jun 2021 15:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145898.268362; Tue, 22 Jun 2021 15:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviA4-0007G8-Hv; Tue, 22 Jun 2021 15:18:00 +0000
Received: by outflank-mailman (input) for mailman id 145898;
 Tue, 22 Jun 2021 15:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviA2-0007G0-Ho
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:17:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b8ddb81-b846-47de-a8ff-f1fbe46eb514;
 Tue, 22 Jun 2021 15:17:57 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-aivuLulkPmu8ZRcb5NoxNg-1; Tue, 22 Jun 2021 17:17:55 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 15:17:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:17:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 15:17:52 +0000
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
X-Inumbo-ID: 1b8ddb81-b846-47de-a8ff-f1fbe46eb514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624375076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSjrFG92yCM/r3hkNcHh022+l3pV9APtRcoqPp/lD/Y=;
	b=IkEjoS6lCOeRUxmeBCxGgXARVvBsQ5TFn8KlS97wRgl9mawNAu0Q0M82CflV9IddfcBkls
	5l8yhYikdXKBu9L4RvlKtuJrRVMIxJ/7BG/GccOep5XmkNaCr+fTw9KSR3n+lwl+Lxo3SO
	0tMUOci+GO1XT/lxd6pMNySpCo9/H50=
X-MC-Unique: aivuLulkPmu8ZRcb5NoxNg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVZDEdr8mieCB4Jwfs3AvNwXJwzL8vthjqfImqvJPFXMM1zrVHsTelDFWWE6Z2u3mL1a4qnNMIv7klZ/4oNV+7dZ53tOmIpDM33W/lwmzow3uQbNlJNy8yLWgHn+uJvA4tIhu93flmkVvJyRFtB5S4wLM4W11nNqk6P4gJyTWAKGIVQs9g4v6Pwq9QfL7BLnBOHVmmgOplsXOu7WLx66hcPiDgErWTZQaNCHs1DjazhM9m2XmOPgE5S+VSQv1fls5Sb4Davc9BOGFA4LIw0RT8uaGsOV4MuZTxTISrgzH6CScwMZwPeY99aV5XJT40hrbLarwqrAIsX0J1XEZduvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSjrFG92yCM/r3hkNcHh022+l3pV9APtRcoqPp/lD/Y=;
 b=FOKLzwF3Ojlz16x4m5P0IwDsBQIsjZs4cSmKyO4VGNUY9y0avxQ4m/FR5aOqV5/UDhVPY8R0vD7SZFL+8gedHTsTkpHtpce10lSdN2V+84YOhH+t+a6pQxVtWQB9PrbBrGFD7TwGvPKkLgMXzLmphDfXzTR77R9H5G7rboU29lagg0HFkaTJja5mETjbMluyVF5ChnfOQAfp6ovLDGc3WgN0tOab99035xv0iZDdcl8yLQp/dTRw4l1d2FxClYaul8nMEKA23BWKAOhhPMHxRl060Sok/uH1JZFVCaukd7tpSchLungiFz8pI7Ur20clHrNNx5a0thRpvAXRzwpHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 1/6] x86/HVM: wire up multicalls
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Message-ID: <a96ff7d7-f594-4b86-e9fa-6b1a99edc992@suse.com>
Date: Tue, 22 Jun 2021 17:17:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f37d13f-1e4b-4364-dfa0-08d93590e7df
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244593A8373E27A07ACAE81BB3099@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LuJxCbLLbTKPVs4vUXAyavKerV0mbZFm5QhOGhF5TpWlzY+WcwMXVgyrURlO4xek773Ob3Al1ysqqeIJGo+QIx6VnGaDwoWP2K8ZzdL4lla8X/VWcy8cSZl02yYeuLmQyhXV2DJS1Uf+binZupKi0DVzkHOVZD9XBP26tqEnbJx/UraSGpZ08RYVaRWf0p0dLgyOtdP4wRhiUJOH3ceuepC5PXuEe9hm/npyhpjuwcbIhUOzVFvN7BkX795fmQdwhCcrmnwlgUQtZzzVBtS6bdCoS87rC3ajBUDISZS9pI/vgzBH7DrAEBkzrk2cGislOvjebstynPlDiRtMsYNq9zZKn2nxWBATMZGPhhpWgq59FjajkfWCcqDnBwhUb0lqpBVSafnhWC1/pYlQMV282RynQ0lsZkXh7OkQZAKhi+0y/ovesrKNkAQvVCcN/nr8VwMsGbhcaIWOSkZ3QJyN5jx6w7Onck4JYJi6k1XqIvR2H5NPq1LS17gcXmqamEnpBHf4VjJZRGgAF5sICba1e1YnWD/hD2jvfMLsdFy5wFzDk4rszpd5IqSD4wgG/sWqp0m8qeLHKvKlWOapmGqs8+G8o9puP8KGLQIarXT8EvAdGenBTiRgGDQMslA5EE7IL3snB1v4tGwAuZeEDrxWoUKUk6cbdHUaiXxaOfr3KBHSuLB95IKDa595Iygt7mhY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(376002)(346002)(396003)(366004)(136003)(54906003)(2906002)(5660300002)(66556008)(66476007)(66946007)(186003)(4326008)(26005)(107886003)(16526019)(6486002)(478600001)(31686004)(36756003)(8936002)(6916009)(8676002)(86362001)(31696002)(83380400001)(2616005)(956004)(16576012)(316002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amN5R0x1NFQxMjBiZ3EzcThaanhTMnBCVlVRSlNpdi9qYlpHV0RhQ0E5UXI3?=
 =?utf-8?B?VFdheDN6NlhkUlFaL2MxbVp2K3VEdnFCNjQ2VFlaRGRGTVoyL2x2a3JFWWZi?=
 =?utf-8?B?Rll6QzU1ajJJZnliYllmT3pjdTk0dDdGNVpYcDV2NVB1bEM5eGcxekNOM3BN?=
 =?utf-8?B?bW93ZG9QUUpESVU4V0hTeFFpN2s1ZldVY3Vtdmk5RnJCNGgxQTFIR0RKVnBj?=
 =?utf-8?B?TDNvQmtvYXJhTVN2cU9ZVFJBUzBTT2VwT3VnVlFvUERBb2hXRzVKaXJTRmtw?=
 =?utf-8?B?MzF2KzNpZ2VRdFo5dmRlRGFiZyt5Ry8xbjlkNTNvK1hpQ2plSkVCZ3BKMXZT?=
 =?utf-8?B?VXNEd1g5S0FubTlUbkVBUjNxWFczTGtQNGFDUnlWeW1vcVR0andac3B0OUQz?=
 =?utf-8?B?OGJQRXhrRFY5Mjl4VXl1dmpFNTV4Q3lVVitteEYxSE1qMEUwZzA1K0FLRjVU?=
 =?utf-8?B?THRxRW1nUXRKemhqQ0w4b0hGSDNNcnZqNkhZWFY3TlRodzhOdjlUUXFHS2x0?=
 =?utf-8?B?ZjVDY20ycmpCVklQL1hZbzJhcUVzNnlyenphSEptYkEyTE0ydFV2bTFETy9k?=
 =?utf-8?B?Rjl3K2RpZ0Erd3U4aUJ0NHg5c1czY2hvZFVWM2kxREJxYk5zWGJwak0waXJN?=
 =?utf-8?B?a1NJT2V4YWxPYkNLZUhqcXhYL01HcEsyWGFBZkJqYlhjWWNuQTJxVm8vQ0w2?=
 =?utf-8?B?L001RzVpMkZmbGdQTkJSRzE5cXQzQ1ZGdmI0TzZxTzU3eEw3Z1JYQUlKandp?=
 =?utf-8?B?enQrY2lqSGh4RmJWWElmblR1ay9CMkw5N2tNNEUvU0NlY0cvWmhoMEpDZVVT?=
 =?utf-8?B?bklXNmxKS3g5NG9EUmNhQXdkMDBqdENjUmsvM1NROXdtNENPdlF6SGhmVXFZ?=
 =?utf-8?B?aXVXR0djcHE5a21mYXNuR2p3L1BROWRoa0tvZDV0cEFBazRlbXdSZUlaekp4?=
 =?utf-8?B?TWJ6VlFLMXNIK20yWHgrMDdGdVU5Qm1DWFRJcjAzRDN3MFZld0R1ZUdiRmFO?=
 =?utf-8?B?VEhKenFhaDU3d1lvQldUeXNBSnRPT1BjRjgzTDdZWm5lMit2aXU4cHpucGE4?=
 =?utf-8?B?RFNvQnhqeThSRUJKQWl3eGFscEw1ZjdDandCSVF1VnZ3Tm4yZEg3OTBjaHVQ?=
 =?utf-8?B?eldSVEZ6OUpFUHBWaFlrYWNobzdMOGhjK3pzMjY3L1RwdXYzTVRBLzEwN3kx?=
 =?utf-8?B?bHRES3FLRzkrdmx3VDduMW9jdHB3emxhdnc3Q1RBUTY2L0R3N0tXcEFNa3Vt?=
 =?utf-8?B?anM1bVJ5YlpENnlhSkhpRW5oaTZUbzUvNDlURDkyUnVac0MyREJTVTQxTUFT?=
 =?utf-8?B?ZmFXUFBQZjVDa1Bhb0M1YzhZREdZR282czJQdms0SFdGTWNaaDRUVHRCa2Nk?=
 =?utf-8?B?ZTdGTm5BcDRMZUVtSEJnZXkwS2h5b2NIeDIwQWhXUHY2UTYvWnNkY1lPcVRY?=
 =?utf-8?B?M2phTUZkZEJoUExmNUszUGdNcXg5ZUd4UVJrZmh1NTRyU2tkYmdUMVFwN2VO?=
 =?utf-8?B?RFJmQkI0N3FoVFFaeDBlek9XOFpZa1N0em9GeG9QYkJkR04yMWlrY3k0NFBI?=
 =?utf-8?B?Tk14Rm5iVUZadHZ3SlBHTUVUZGk4NFFKN3ZuelBqNmVZL0JSai81REhDK3Jt?=
 =?utf-8?B?bDlBbEdmZ0RDbWFSdS9VdDFoZVBVTmtCT3dhZ1kvTGJQUnkrMU5SVTR6VGFG?=
 =?utf-8?B?S1o0cjRKNTZIclV6cDVyS0czMnBwYUNBK3FlMVlta2FyTEk5K3hkRUJwRklr?=
 =?utf-8?Q?XS1dwwg4YAKeh5hjKwwP5UJkNh3+glFGmN1qZc5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f37d13f-1e4b-4364-dfa0-08d93590e7df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:17:53.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v+jbFkIYEiJgdK063B+qRuVF90l/23xtsqgGAQFChQxMQwh/nvvzkEwYx1FOV9x5ThkIpsLf7e1nFUPy1NODg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

To be able to use them from, in particular, the tool stack, they need to
be supported for all guest types. Note that xc_resource_op() already
does, so would not work without this on PVH Dom0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Begrudingly acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Ian Jackson <iwj@xenproject.org>

--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/viridian.h>
+#include <asm/multicall.h>
 
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
@@ -125,6 +126,7 @@ static const struct {
     hypercall_fn_t *native, *compat;
 } hvm_hypercall_table[] = {
     HVM_CALL(memory_op),
+    COMPAT_CALL(multicall),
 #ifdef CONFIG_GRANT_TABLE
     HVM_CALL(grant_table_op),
 #endif
@@ -334,6 +336,39 @@ int hvm_hypercall(struct cpu_user_regs *
     return curr->hcall_preempted ? HVM_HCALL_preempted : HVM_HCALL_completed;
 }
 
+enum mc_disposition hvm_do_multicall_call(struct mc_state *state)
+{
+    struct vcpu *curr = current;
+    hypercall_fn_t *func = NULL;
+
+    if ( hvm_guest_x86_mode(curr) == 8 )
+    {
+        struct multicall_entry *call = &state->call;
+
+        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
+            func = array_access_nospec(hvm_hypercall_table, call->op).native;
+        if ( func )
+            call->result = func(call->args[0], call->args[1], call->args[2],
+                                call->args[3], call->args[4], call->args[5]);
+        else
+            call->result = -ENOSYS;
+    }
+    else
+    {
+        struct compat_multicall_entry *call = &state->compat_call;
+
+        if ( call->op < ARRAY_SIZE(hvm_hypercall_table) )
+            func = array_access_nospec(hvm_hypercall_table, call->op).compat;
+        if ( func )
+            call->result = func(call->args[0], call->args[1], call->args[2],
+                                call->args[3], call->args[4], call->args[5]);
+        else
+            call->result = -ENOSYS;
+    }
+
+    return !hvm_get_cpl(curr) ? mc_continue : mc_preempt;
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/hypercall.h>
+#include <asm/multicall.h>
 
 #ifdef CONFIG_COMPAT
 #define ARGS(x, n)                              \
@@ -273,13 +274,18 @@ int hypercall_xlat_continuation(unsigned
     return rc;
 }
 
-#ifndef CONFIG_PV
-/* Stub for arch_do_multicall_call */
-enum mc_disposition arch_do_multicall_call(struct mc_state *mc)
+enum mc_disposition arch_do_multicall_call(struct mc_state *state)
 {
+    const struct domain *currd = current->domain;
+
+    if ( is_pv_domain(currd) )
+        return pv_do_multicall_call(state);
+
+    if ( is_hvm_domain(currd) )
+        return hvm_do_multicall_call(state);
+
     return mc_exit;
 }
-#endif
 
 /*
  * Local variables:
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -23,6 +23,7 @@
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 #include <xen/trace.h>
+#include <asm/multicall.h>
 #include <irq_vectors.h>
 
 #ifdef CONFIG_PV32
@@ -245,7 +246,7 @@ void pv_hypercall(struct cpu_user_regs *
     perfc_incr(hypercalls);
 }
 
-enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+enum mc_disposition pv_do_multicall_call(struct mc_state *state)
 {
     struct vcpu *curr = current;
     unsigned long op;
--- /dev/null
+++ b/xen/include/asm-x86/multicall.h
@@ -0,0 +1,12 @@
+/******************************************************************************
+ * asm-x86/multicall.h
+ */
+
+#ifndef __ASM_X86_MULTICALL_H__
+#define __ASM_X86_MULTICALL_H__
+
+#include <xen/multicall.h>
+
+typeof(arch_do_multicall_call) pv_do_multicall_call, hvm_do_multicall_call;
+
+#endif /* __ASM_X86_MULTICALL_H__ */


