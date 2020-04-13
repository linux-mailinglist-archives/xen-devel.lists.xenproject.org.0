Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6A1A6336
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 08:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNswv-0007wW-3F; Mon, 13 Apr 2020 06:52:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n3x4=55=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jNswu-0007wR-0V
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2020 06:52:04 +0000
X-Inumbo-ID: 460f77bc-7d53-11ea-880b-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.92]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 460f77bc-7d53-11ea-880b-12813bfff9fa;
 Mon, 13 Apr 2020 06:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bcj9gA+uXzoIeibzmhDpzZYembPu4QViG2aE0iBiEDfYStEYHlmXN7JJqGqPSRSLGn8GdILElWpqQ0Kw0KydKh6emKCMn8AIT9U7FzTGqTVykt6ZTq8JuJS8qEZcjPX3lzzJ/LCwyaS+3t8WvcjKKPSFGbJp6CLWbuirkgyaBS8d1D4vcfPW6Wm1KbEUIro5m00qvia4Cxqo3NaCtoNs0svX13zFgSUcgK/DZ0lQTmp2LSw2q/cR6TDGaKtOzXuC6ACXd4eK3pTQFiQJ6kc+EzzxdEkSnvx7te7Wj9M4mfAbaVQRLhemjxI8WfJG8PxUQCcdHcUa+UOFQiMDzB5dgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QzEw+1BvDSeBTXaXGXByBYUrTmWqSehZ2H4OfyBOHg=;
 b=KVYjEkp47nTsBBb3EqZAFU0Q/mYyNhMnBYpb8Vy8g35HQMfHXRZtKID3iNZakrW2E/DJH4KDGi+RENNQPcKWYMikYG7rqwCT+Ti4uGes11sH9E1qR6zGoLjudHCuk92JS+7Ie2SaOi9qLAErhQRfXKHQm8GafWLYO4iETvCo20AX/wofsMz4YS7gvwBtOwBV1kVo7YSuKmjjklb/5ODNIAFSokcmwQ2KQ8t1w9BZlPbtqE4gZLxmTwrzU3MRVxMqHapZnyrqh/A35OTnJUb0xP/FPQtkf0DOG4AotYF5E4wnMJuRzs2fy/McTKhkMis2oBp2HidSitJUFQ8l+3qqVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QzEw+1BvDSeBTXaXGXByBYUrTmWqSehZ2H4OfyBOHg=;
 b=ZraW7d4Tmjyj33ALoHrArBP0S0NyCH8N5LISH/AYsoQZxOOCbd/SrACL7YBCGGmVkBJot0Kz8rMvc8ijpSRLt2o2BXSxaElGsn3VDQzIHmHRjtfJm7sUlCKTb6cFHLc0yXVcjpE7U/pak4K1GlrrMt8jEKjxghXwujRN5IKsWYU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (2603:10a6:20b:86::23)
 by AM6PR02MB4689.eurprd02.prod.outlook.com (2603:10a6:20b:35::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Mon, 13 Apr
 2020 06:51:57 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::b189:1c2:ea70:d208%4]) with mapi id 15.20.2900.028; Mon, 13 Apr 2020
 06:51:57 +0000
From: Alexandru Isaila <aisaila@bitdefender.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH V8] x86/altp2m: Hypercall to set altp2m view visibility
Date: Mon, 13 Apr 2020 09:51:13 +0300
Message-Id: <20200413065113.27744-1-aisaila@bitdefender.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0021.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::31) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aisaila-Latitude-E5570.dsd.bitdefender.biz (82.77.232.39) by
 VI1PR0602CA0021.eurprd06.prod.outlook.com (2603:10a6:800:bc::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17 via Frontend
 Transport; Mon, 13 Apr 2020 06:51:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [82.77.232.39]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8c8f5f-608e-4e17-a7a3-08d7df77289a
X-MS-TrafficTypeDiagnostic: AM6PR02MB4689:|AM6PR02MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR02MB468999B2C607A478F6717D4AABDD0@AM6PR02MB4689.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-Forefront-PRVS: 037291602B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(7416002)(6916009)(6506007)(2616005)(956004)(54906003)(52116002)(1076003)(30864003)(2906002)(66556008)(6486002)(498600001)(66476007)(66946007)(8676002)(8936002)(6666004)(5660300002)(186003)(26005)(16526019)(86362001)(81156014)(6512007)(36756003)(4326008);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYZMv6BmDK3AbNuq8d0SMrDUapeuCLXBHSyLTKQFpba8QuNnDPuhb1TNIvdZZudmfhSqZxeuxqQU6ooWYxyv5ZKPZFuKBRfx/sUuewG3Rt7GrxKYiJ4frW/X2Fn8LfWGkSqhuiH1EgtiLgWtmub5heepJIkjkCzt397Hn1u9kXUGhgD02FJtpdnK/1zh/l8zvTt6/FoTYBg1sB4nH7+J3v97+WRIKfgX/GBFpgmtOsHoP/iFP/lcaWkbw81Fj4+lHeV8oYKtzSo8AB8jvqvqiAIRl6eRjBKS0Xy2WxYSaMwI0i63SsyrdJ6fP5HPxxoHxc/talSWLzmIVCsT+gKVkMtYw5a1CqtmiFsDHtQlKZbLTPOK0poRkYc2QnuTmCScJhnzmVwhaLYFXzSRCGs5x2WgJ/Zf2dHyux87qnDZObAmzo0zLqOqT0mWIT0DSwG5
X-MS-Exchange-AntiSpam-MessageData: U3fUp0HCWWuOb2+Oj2uTe2xxSOLbkold5K046vn/paMWt4/ej2TOICoHBfBxm0H9oG/X83+uUu9nUTDPN/hiG6Ejh3UXGFWcKc/GVVEcj21lHZmxl7jZS8bi5ZzJ4R3CIf6Gfq7/q9HXT9PoiIpiOQ==
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8c8f5f-608e-4e17-a7a3-08d7df77289a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2020 06:51:57.3259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm4O3U3gnubf4XDWSVVZAGMZqaMKLrLM6SCZXjwR3LTbMk8/j3mMF5Vl/dfHadV2p664Nh7nLbsjZPylMud+WZ/ejzKvJLOokViDuZKLg2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4689
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At this moment a guest can call vmfunc to change the altp2m view. This
should be limited in order to avoid any unwanted view switch.

The new xc_altp2m_set_visibility() solves this by making views invisible
to vmfunc.
This is done by having a separate arch.altp2m_working_eptp that is
populated and made invalid in the same places as altp2m_eptp. This is
written to EPTP_LIST_ADDR.
The views are made in/visible by marking them with INVALID_MFN or
copying them back from altp2m_eptp.
To have consistency the visibility also applies to
p2m_switch_domain_altp2m_by_id().

The usage of this hypercall is aimed at dom0 having a logic with a number of views
created and at some time there is a need to be sure that only some of the views
can be switched, saving the rest and making them visible when the time
is right.

Note: If altp2m mode is set to mixed the guest is able to change the view
visibility and then call vmfunc.

Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
Changes since V7:
	- Change altp2m_working_eptp to altp2m_visible_eptp
	- Rebase.

Changes since V6:
	- Update commit message.

Changes since V5:
	- Change idx type from uint16_t to unsigned int
	- Add rc var and dropped the err return from p2m_get_suppress_ve().

Changes since V4:
	- Move p2m specific things from hvm to p2m.c
	- Add comment for altp2m_idx bounds check
	- Add altp2m_list_lock/unlock().

Changes since V3:
	- Change var name form altp2m_idx to idx to shorten line length
	- Add bounds check for idx
	- Update commit message
	- Add comment in xenctrl.h.

Changes since V2:
	- Drop hap_enabled() check
	- Reduce the indentation depth in hvm.c
	- Fix assignment indentation
	- Drop pad2.

Changes since V1:
	- Drop double view from title.
---
 tools/libxc/include/xenctrl.h   |  7 +++++++
 tools/libxc/xc_altp2m.c         | 24 +++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c          | 14 ++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c      |  2 +-
 xen/arch/x86/mm/hap/hap.c       | 15 +++++++++++++++
 xen/arch/x86/mm/p2m-ept.c       |  1 +
 xen/arch/x86/mm/p2m.c           | 34 +++++++++++++++++++++++++++++++--
 xen/include/asm-x86/domain.h    |  1 +
 xen/include/asm-x86/p2m.h       |  4 ++++
 xen/include/public/hvm/hvm_op.h |  9 +++++++++
 10 files changed, 108 insertions(+), 3 deletions(-)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 58fa931de1..5f25c5a6d4 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1943,6 +1943,13 @@ int xc_altp2m_change_gfn(xc_interface *handle, uint32_t domid,
                          xen_pfn_t new_gfn);
 int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
                                uint32_t vcpuid, uint16_t *p2midx);
+/*
+ * Set view visibility for xc_altp2m_switch_to_view and vmfunc.
+ * Note: If altp2m mode is set to mixed the guest is able to change the view
+ * visibility and then call vmfunc.
+ */
+int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
+                             uint16_t view_id, bool visible);
 
 /** 
  * Mem paging operations.
diff --git a/tools/libxc/xc_altp2m.c b/tools/libxc/xc_altp2m.c
index 46fb725806..6987c9541f 100644
--- a/tools/libxc/xc_altp2m.c
+++ b/tools/libxc/xc_altp2m.c
@@ -410,3 +410,27 @@ int xc_altp2m_get_vcpu_p2m_idx(xc_interface *handle, uint32_t domid,
     xc_hypercall_buffer_free(handle, arg);
     return rc;
 }
+
+int xc_altp2m_set_visibility(xc_interface *handle, uint32_t domid,
+                             uint16_t view_id, bool visible)
+{
+    int rc;
+
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_altp2m_op_t, arg);
+
+    arg = xc_hypercall_buffer_alloc(handle, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->version = HVMOP_ALTP2M_INTERFACE_VERSION;
+    arg->cmd = HVMOP_altp2m_set_visibility;
+    arg->domain = domid;
+    arg->u.set_visibility.altp2m_idx = view_id;
+    arg->u.set_visibility.visible = visible;
+
+    rc = xencall2(handle->xcall, __HYPERVISOR_hvm_op, HVMOP_altp2m,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(handle, arg);
+    return rc;
+}
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 827c5fa89d..6f6f3f73a8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4509,6 +4509,7 @@ static int do_altp2m_op(
     case HVMOP_altp2m_get_mem_access:
     case HVMOP_altp2m_change_gfn:
     case HVMOP_altp2m_get_p2m_idx:
+    case HVMOP_altp2m_set_visibility:
         break;
 
     default:
@@ -4786,6 +4787,19 @@ static int do_altp2m_op(
         break;
     }
 
+    case HVMOP_altp2m_set_visibility:
+    {
+        unsigned int idx = a.u.set_visibility.altp2m_idx;
+
+        if ( a.u.set_visibility.pad )
+            rc = -EINVAL;
+        else if ( !altp2m_active(d) )
+            rc = -EOPNOTSUPP;
+        else
+            rc = p2m_set_altp2m_view_visibility(d, idx,
+                                                a.u.set_visibility.visible);
+    }
+
     default:
         ASSERT_UNREACHABLE();
     }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 1c398fdb6e..869339062b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2140,7 +2140,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
     {
         v->arch.hvm.vmx.secondary_exec_control |= mask;
         __vmwrite(VM_FUNCTION_CONTROL, VMX_VMFUNC_EPTP_SWITCHING);
-        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_eptp));
+        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_visible_eptp));
 
         if ( cpu_has_vmx_virt_exceptions )
         {
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 814d0c3253..052ae35c6f 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -492,8 +492,17 @@ int hap_enable(struct domain *d, u32 mode)
             goto out;
         }
 
+        if ( (d->arch.altp2m_visible_eptp = alloc_xenheap_page()) == NULL )
+        {
+            rv = -ENOMEM;
+            goto out;
+        }
+
         for ( i = 0; i < MAX_EPTP; i++ )
+        {
             d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
+            d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
+        }
 
         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
@@ -527,6 +536,12 @@ void hap_final_teardown(struct domain *d)
             d->arch.altp2m_eptp = NULL;
         }
 
+        if ( d->arch.altp2m_visible_eptp )
+        {
+            free_xenheap_page(d->arch.altp2m_visible_eptp);
+            d->arch.altp2m_visible_eptp = NULL;
+        }
+
         for ( i = 0; i < MAX_ALTP2M; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i]);
     }
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index eb0f0edfef..293f3e9419 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1368,6 +1368,7 @@ void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
     ept = &p2m->ept;
     ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
     d->arch.altp2m_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
+    d->arch.altp2m_visible_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
 }
 
 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index b8727e267d..4c1507d3a4 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2533,6 +2533,7 @@ void p2m_flush_altp2m(struct domain *d)
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
+        d->arch.altp2m_visible_eptp[i] = mfn_x(INVALID_MFN);
     }
 
     altp2m_list_unlock(d);
@@ -2652,7 +2653,9 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
         {
             p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
             d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
-            mfn_x(INVALID_MFN);
+                mfn_x(INVALID_MFN);
+            d->arch.altp2m_visible_eptp[array_index_nospec(idx, MAX_EPTP)] =
+                mfn_x(INVALID_MFN);
             rc = 0;
         }
     }
@@ -2679,7 +2682,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     rc = -EINVAL;
     altp2m_list_lock(d);
 
-    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
+    if ( d->arch.altp2m_visible_eptp[idx] != mfn_x(INVALID_MFN) )
     {
         for_each_vcpu( d, v )
             if ( idx != vcpu_altp2m(v).p2midx )
@@ -3163,6 +3166,33 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
 
     return rc;
 }
+
+int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
+                                   uint8_t visible)
+{
+    int rc = 0;
+
+    altp2m_list_lock(d);
+
+    /*
+     * Eptp index is correlated with altp2m index and should not exceed
+     * min(MAX_ALTP2M, MAX_EPTP).
+     */
+    if ( altp2m_idx >= min(ARRAY_SIZE(d->arch.altp2m_p2m), MAX_EPTP) ||
+         d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] ==
+         mfn_x(INVALID_MFN) )
+        rc = -EINVAL;
+    else if ( visible )
+        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
+            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
+    else
+        d->arch.altp2m_visible_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
+            mfn_x(INVALID_MFN);
+
+    altp2m_list_unlock(d);
+
+    return rc;
+}
 #endif
 
 /*
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 105adf96eb..4192c636b1 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -327,6 +327,7 @@ struct arch_domain
     struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
+    uint64_t *altp2m_visible_eptp;
 #endif
 
     /* NB. protected by d->event_lock and by irq_desc[irq].lock */
diff --git a/xen/include/asm-x86/p2m.h b/xen/include/asm-x86/p2m.h
index a2c6049834..ace3573ae8 100644
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -898,6 +898,10 @@ int p2m_change_altp2m_gfn(struct domain *d, unsigned int idx,
 int p2m_altp2m_propagate_change(struct domain *d, gfn_t gfn,
                                 mfn_t mfn, unsigned int page_order,
                                 p2m_type_t p2mt, p2m_access_t p2ma);
+
+/* Set a specific p2m view visibility */
+int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
+                                   uint8_t visible);
 #else
 struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
 static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
index b599d3cbd0..870ec52060 100644
--- a/xen/include/public/hvm/hvm_op.h
+++ b/xen/include/public/hvm/hvm_op.h
@@ -318,6 +318,12 @@ struct xen_hvm_altp2m_get_vcpu_p2m_idx {
     uint16_t altp2m_idx;
 };
 
+struct xen_hvm_altp2m_set_visibility {
+    uint16_t altp2m_idx;
+    uint8_t visible;
+    uint8_t pad;
+};
+
 struct xen_hvm_altp2m_op {
     uint32_t version;   /* HVMOP_ALTP2M_INTERFACE_VERSION */
     uint32_t cmd;
@@ -350,6 +356,8 @@ struct xen_hvm_altp2m_op {
 #define HVMOP_altp2m_get_p2m_idx          14
 /* Set the "Supress #VE" bit for a range of pages */
 #define HVMOP_altp2m_set_suppress_ve_multi 15
+/* Set visibility for a given altp2m view */
+#define HVMOP_altp2m_set_visibility       16
     domid_t domain;
     uint16_t pad1;
     uint32_t pad2;
@@ -367,6 +375,7 @@ struct xen_hvm_altp2m_op {
         struct xen_hvm_altp2m_suppress_ve_multi    suppress_ve_multi;
         struct xen_hvm_altp2m_vcpu_disable_notify  disable_notify;
         struct xen_hvm_altp2m_get_vcpu_p2m_idx     get_vcpu_p2m_idx;
+        struct xen_hvm_altp2m_set_visibility       set_visibility;
         uint8_t pad[64];
     } u;
 };
-- 
2.17.1


