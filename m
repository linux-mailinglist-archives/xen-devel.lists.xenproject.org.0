Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D231F6F5BA9
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:58:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529341.823670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puErs-0005Fg-6q; Wed, 03 May 2023 15:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529341.823670; Wed, 03 May 2023 15:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puErs-0005Ct-2G; Wed, 03 May 2023 15:58:12 +0000
Received: by outflank-mailman (input) for mailman id 529341;
 Wed, 03 May 2023 15:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puErq-0004ZO-Aq
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:58:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ca49550-e9cb-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:58:09 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:57:41 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:57:41 +0000
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
X-Inumbo-ID: 4ca49550-e9cb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwDh4Py+rBePb7bAhR8XAK5SQklMGxSoM4B60GiysjRoNhVdXIIETeqIdIpwB4liBRnZOqrtK8te8JS5PdF/Vme+5E6fNBAPbQZsHIkWbp5e8S3APn5D2At8H1WkMUGURTnUdjJ2BYc/eDX4wJb/qActLI+rm+kw03V/bICqBxW6iLNLYj54V4rtHSxXWCvgOfjvJowc8oIact7ZoRZKeP3qkAMWrioHp6AvMG7k1omCGG83fUHn8coO3oaPNzGWn7wLOA0jvQHVrTu48Jf8aYzEo7Heca8OGpsqFMGP6ZEHmbpAsqxk3bnEoGdFMLSi+Hzd63yoEtzRbwj9Pwunmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHmrg8DCDjzc3gUkSKqzrnriTYYYSioIWkI/FbXeWW0=;
 b=TNCmdZWVx1dDyeiANy/VoLyhhx4gNPzIlEsCmK/aZ2To0EKw2fN6Jv0Xokp3jeB8PY9BgchcJ/WfuQVKkJVhXQ52zk+oDKxB09cVzml+e1Qv+nxnthIDIeOtlGMeLbqFTIjqoudqrQaKC5NbV8iWwBxtYEXyjn8q99rVyjjpPu3VRJ10QsFPAXhmEpbbeFff2RbNNPBsYBET74EsoUIJ5p9K0ujtu4s1H8gRASPyji/rY0SdIxLRUJNOXkFgHhbcPhwHRJJ+ZFpAXqOD6cNxpJYskOXtDpTu/B3bvJYqEDaG87EUCY0nCuY6mGkiv/k+oQV0E7Txzgs6yz1wWnhh3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHmrg8DCDjzc3gUkSKqzrnriTYYYSioIWkI/FbXeWW0=;
 b=CKhfH78q8lFOPOEj5ms4DACcQP8x9I6T9pIspJRMAuWHJEHR+Xn1XLvD/7H8HAxLHCGvWlXSyh9wU2xm6J8bnIu8pOwvq+k41n1ACpTd4oT4KeLWMl1MQVMJV15i/Fy5FyOOmccQWD64GGcVjfYLBOaDBAAL/tHQE+o87loAjIFi55ZgPM/SbgwRdB+gy4bYDNgDzLsjQZwudhvUFR3g9+fS0DXSD7C+zsCq7y1tk9+9qWFjgU9P2u7E0mmeMGk8Q4NNwJ5CVDjZtTn2em3FnkdMLtPSLGwiQTzmevR3ICAhLlMsaYStj8NOBvEmMEIGh4pZnxkFsViQg3RSGlo1kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb902943-c139-ec6c-66f9-284ceff3995d@suse.com>
Date: Wed, 3 May 2023 17:57:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 6/8] domain: introduce GADDR based runstate area
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
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 884b6d8d-6959-4ce3-f2d8-08db4bef2063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90rUOQXzqh4HlIWA+xbpGtmpMbfcpg6+OyFNPMGlDpOacSeJS/0+0cIpDtjQHNxni+VsmvfdQmxtUIfspCqipZE9wiAgVCIL63S3susurwondSPqjzvHL0s0mp+09T/m3bAp/wU5q/ClzBGsJRg2a7gOk/tJPVxvzQunAYsKYc3gMY0ube73QLba28FCG0oBFuZDwGXOPHOLvcTKEBTEqQuSGNRmSy2EfdpVe5NlxFEwK2vXvID0zxNZ5Gq5Kbao3wtxSdaK5SO9/K2LoYPzW4Qn8jv+5sm9vnUAO1cFIf2v8AyXovyFZ04XnG2HiZ/zTkHasuxzTKqNMC6g/rAKzSVWuTvynktvsYmJcuoIGPCPv/vp4OiFSQQDsEi9xSYZrX+F74o5qag2Ln38oDKHeQq6llhqnTAEPmsJ3pJUKcTMCunzzcwad0CDsMr2lkOLvG415ITI72VLbQduRi0Sv6X9zuJuFVKIrOYrUSQ28q1Hia0tU8IVRuXvcTsLHMssOhfy184CQWqgdJ3TbXgibeL5Ogoep3tCvJYSDJ3/mCnp0nBBLE64WW7ETXP7yix+CCUEvv4zec4FixLR4bPXJf4qS3QkA6Nx6G9XFPchOINDYpbziRZzaomDz3dJdw+QZmJ+A5rYGHmGtsQahoKFrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(2906002)(38100700002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6512007)(26005)(6506007)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkF1Z0pGNTBkT3QzMjE4cEdOS01HNllxM0U0cEM5WEt2RkxheHVDVVVrZTUr?=
 =?utf-8?B?L2dZRHRyeDQ2VzVFdnpxYkI0QUFRQnd2UWpjYXEvbUZ4QWRsUDRCYW10RkI1?=
 =?utf-8?B?Y2tJWGU5Wjh1Wml5Z21RV1NENUh1QmgvYngwbEVlSGwwa0xHdHVOaFhOV096?=
 =?utf-8?B?bWZpdm54ejJvVGRaWDJxMk1LOXcyMjNqbkptRWNvR1crdnpqNVlCL0YrR05a?=
 =?utf-8?B?MndKTWZyWmtKOEcza2dXTFIrTk43M2xycmg1K1Z6SkZyVGxCaUJ2SldmODhT?=
 =?utf-8?B?dHNsa1VaSWgrb2lMVGk1cTZhSEV5cG85QmNsN05sdFVMemFsYlFvUkNtSHNr?=
 =?utf-8?B?OW9xVzBEYXB2YTdvSDFCQTZuTnczcUU3bThWZG5HbDF0MnByMjVUOEk5aC8x?=
 =?utf-8?B?MEhTNTZqUzkxbUp1Tkd0eUwrNGtqVS9DQ1ZFZkFsTUhmOUIrNjNhOHF4dGlK?=
 =?utf-8?B?TXVsWlo0cCtSOE1QOWVVc1JCcnJSWGJIRW04YzZpWXZXVnppV0J2Zk1yK3ln?=
 =?utf-8?B?UTFHY2xjeHE0b09YT0MvNU51dlg1SlFaejBnUUlybkd3Q1l2SUQrcTNKQ2J6?=
 =?utf-8?B?blJGd3dmd2NzeG5Od2Vtb2FmRFlpdUpoWmlNRUxKTlIvT0tkaC9yMWQxN1Vt?=
 =?utf-8?B?bTJEMFJkb01ZTkg1M3B4QTNHL1U4UG1MWUlqVUxyL0FMSGtSczFBVmlvSzN3?=
 =?utf-8?B?OW9iN1BVM1ZWQyttMDFlREg1elhFZmV2WWREbVF0N0FsSnZIRStNOXpnRlpt?=
 =?utf-8?B?cHZYWVo2WnN4eXNVY2kxM2tqdEJlMDgxcjdaYWFqVFIxbkZ5T1VrcGdnRGFt?=
 =?utf-8?B?Yk93UVh6OHFLWFVuMXRTQ2VaNkw5Z2E3SzRHaVdMcmc1eHhJVW1Fb2Q1UWtN?=
 =?utf-8?B?ZlV6ODFCN201ZTY5SVkwbjBLU1Y0cEpiNFdaMEV4MXhteUZiaWMvTDZ3SFdO?=
 =?utf-8?B?aVRZNGNDRGhwZVk2UHVROVp6VCttQk5kNTZOYW1aNWlqeWxGazV1R0ZMalIw?=
 =?utf-8?B?bVNxaEEvWEtKMEIxVHptbjgzMHF4ZThZNmxLUXEzTVVncHlHaFZOOHQyd3lv?=
 =?utf-8?B?SHJuek9qbGV4QmRZeHpRbW94U3h5Z3ZTY1VsV0g0TVNSaEMwZTFlRmJNNkZv?=
 =?utf-8?B?RnptbVREaE51Uk8vN3cwNnNnU1ROSnNMZi9MU2c0dExrajQzdFpyTEllZ0RL?=
 =?utf-8?B?RkpWbHJQQ3RiU2RTTEJpU09sajN4OFBmUW93WC93bDkvRGVtSkc1MUp4L25u?=
 =?utf-8?B?RXZ4RTBYYnZTeWNway9wU1NaRFE1V0dMTWg1UFR3anBXUmFNTnV2Y2VKdnU1?=
 =?utf-8?B?dG5hUHhOTVlPVHN4OTVxUElvODhzODk5M2lsWmd3MWt4Smk1NUtWVnNVaFhV?=
 =?utf-8?B?WlUyVVNyT3FKMjNzdXZHMHRuWStrWVEveVZlaDJvWGpVYkR4aFpxWUNlcjJM?=
 =?utf-8?B?dVBha3BaTUZEL1FnVzdYdHlCVzBVTjNBMG9QenFkSGtrM3NCYWlzSVBCUGZn?=
 =?utf-8?B?eXdJanZNWmtLeHNaUnBvVUxaZWs3OStER3RxSWxuc2ZWbHJUUlhxZU4zcU9L?=
 =?utf-8?B?TmtCRnVhTGp4R3I4ME1zNWE3ejhmMlN6SHNRRGljbjZlZmQ5OUZObU1oR0VM?=
 =?utf-8?B?S0xDcTNQU05kTkJrcFhmSllmWURiQkRnTngzVmhXU2pMbFFud1V4djRLdW91?=
 =?utf-8?B?YnZaYnF6UXZqMXhIZ1B6SGVJRHdrVEpDRUZXYmpDMlE4a1NWYWtIcGFJOXhk?=
 =?utf-8?B?QTczb3pVSXlvd3hlWlhmZVVYcUIxU091SS81NVNyK0paSUNIZmNjM1I5VzVK?=
 =?utf-8?B?WnVYdzBJRGUzZFc0YmNjN2kxWXYwYUUrRjU0QXFJL1pxSW5GM3VtSGJ5RUhn?=
 =?utf-8?B?QitHZS9oTGdETjRacHpEcFNyNWxRSU9GMVBwSE5TY2NkTjYydksreEJKMTdv?=
 =?utf-8?B?SzMyQTNxZm5aU1FRVTJpdkpGdHZiekhKa3RTc2thbUphOXBiYUZHWkFkVSsr?=
 =?utf-8?B?MEdJTElrd0ZQcXZQYlNFN2JIT2kzMnlVU1UzZGU1dUhwWWV5eEN0NDFZMlZp?=
 =?utf-8?B?TzdLS3Z2b1E3aFplYWpqZkN1SHl6TFNKdzRJZCthZlhmdXFsQTNLRFNRcFJU?=
 =?utf-8?Q?IqcBH3knkketuzJfsnl8IkDxJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884b6d8d-6959-4ce3-f2d8-08db4bef2063
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:57:41.6601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 708Gqe18ZRlBelGpJLvdT/lrx4D3F5jxQ4pq5jCfTGM1tHxQTcLoYubFkPry1Y4pf/5aEteWWAVrJt26SBoYKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

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
@@ -1801,6 +1801,26 @@ bool update_runstate_area(struct vcpu *v
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
@@ -1982,6 +2002,25 @@ long common_vcpu_op(int cmd, struct vcpu
 
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
@@ -221,6 +221,19 @@ struct vcpu_register_time_memory_area {
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


