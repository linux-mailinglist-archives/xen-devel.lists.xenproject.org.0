Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930521974C1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 08:58:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIoKC-0007bS-2g; Mon, 30 Mar 2020 06:55:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFsW=5P=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1jIoKA-0007bM-EN
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 06:55:06 +0000
X-Inumbo-ID: 628ae5da-7253-11ea-92cf-bc764e2007e4
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.124]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 628ae5da-7253-11ea-92cf-bc764e2007e4;
 Mon, 30 Mar 2020 06:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1aNqFQqKNjEKKDrFMmpsOboRkUmIQ39tRw92KhhltnFzkeuqtsCbK7geG+5zPWF0D0EZgKDzTC7Fwm8aZ8Zkdc12ImMjoQfUDry5q9OX7iLFzr7Cdm4HFITlTM0djG6F3+FS7XuilcU3LIA4jRZ64UGZeVU68j4gJNV/mJOQh2ug86jYV+fojFy82MilK+vEYtz0CtI9GkRjopFn8rvtvK3toJj9YVwjXJsmjoDdZGXnNNvkwMLBFwn0JUwobYe8DUppUmJSrdSnaZk2IgGsgHKqU/bbsm33ylPsxsa078R3oSk3ecnqIraKiLgBzhcIOaw7q633WDg/iMhJxa2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8hdiZUtzhi3zXmeHr6KNT7k6MfuhlzlvAf6wFBrOcQ=;
 b=V4pT+ov3j6HhFgQ6tksNEG/2cos9h8MrUWJt8ZFQnhWkKS3WKKFO9O0SPpRs/0AnXEiZilsxSR42rhA22WqmiPjWke2FrE6gY2VSGvsrQC29BB09J5SuXUlNjM/fwiKy25TpnNfjfdo+bgRzlw9OvSphYwNosNF2LAS70sufAFrpudo/n9oUKrQC0XZNg1iWeYrlMaBqT/fLIxLChg0hlK4q3UFDHnv35/c6r8t8I4cnKRnPr2riicuSysdAXBbydq+8PPqOjwJexIvhKvIr2Rg5214QlVlDg4ZJKdeggzj8JxCEyvXf09+PxAdrOZspSwTtv3RqOUvOGkmanAD7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8hdiZUtzhi3zXmeHr6KNT7k6MfuhlzlvAf6wFBrOcQ=;
 b=R5stPUc2dhBGvM/AZMgdTjjAl5scYk/QeaeIfZRH/92LFmBb+8bJI3OgXyqtqOLFJKl7fWmrjrO9ulZC6n1WxefSXeJy1+8P3x7eSbCmGcYi3d8BHFuoXWvTlMFnE7lDwPkT77Bta2HkRMYUL7MgBl74cYLhe28Y+iyd54keRp4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com (20.178.89.87) by
 AM6PR02MB4803.eurprd02.prod.outlook.com (20.177.118.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Mon, 30 Mar 2020 06:55:03 +0000
Received: from AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005]) by AM6PR02MB5223.eurprd02.prod.outlook.com
 ([fe80::4101:6057:7eb0:e005%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 06:55:03 +0000
From: Alexandru Isaila <aisaila@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 09:54:34 +0300
Message-Id: <20200330065434.5952-1-aisaila@bitdefender.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::29) To AM6PR02MB5223.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from aisaila-Latitude-E5570.dsd.bitdefender.biz (188.25.208.5) by
 VI1PR0102CA0088.eurprd01.prod.exchangelabs.com (2603:10a6:803:15::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19 via Frontend
 Transport; Mon, 30 Mar 2020 06:55:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [188.25.208.5]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 483fd499-9d79-4df3-44be-08d7d47745cc
X-MS-TrafficTypeDiagnostic: AM6PR02MB4803:|AM6PR02MB4803:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR02MB4803D2F4953B8D7CDE4EE444ABCB0@AM6PR02MB4803.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-Forefront-PRVS: 0358535363
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB5223.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(39840400004)(366004)(396003)(376002)(136003)(316002)(8676002)(81156014)(81166006)(8936002)(6512007)(54906003)(6916009)(6486002)(478600001)(16526019)(1076003)(2616005)(186003)(30864003)(956004)(26005)(36756003)(6506007)(52116002)(66556008)(66476007)(66946007)(2906002)(6666004)(86362001)(7416002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wmcKhk2W17xFs2wdE3e5NZRwXs55jc2t2tGLDbOQXx4SENx2b4Xz8PuXGdKTTkRmBlmfvHNFXG1dZBxRifh6Egk4Iok2ddFIhmXnjj0FYo02+hvB6ZYINyg4XTTO+Psqma6BWmV6ANQCi/+oasFZ1KQsrZ5scmOq/CC8eWt0qjlS1VKXSMszBhc7tN+Dg3d4rzrfZlFIw43eQate78MwEFBmctVpJKk0IOJYYJohr6CpH+pbhFiFC0TNHuf5tpABvCmeDlvWVCUHqUxKgvrJ64Igg2T58SIjJYYxXSeCqKfc2hOQX5+X2n8eBAFna+5wR9lryfDYbgRiYgpMFD5+1WniEq7SteHWehwUsCt6zUg57SXRRgSxrmL0mdF0FXNCNhGAS0BDJfE5h4f24Vt0PFf3+C5raQHmSrDkeunoMWWAKnDqixCqt0lAGXN8chI
X-MS-Exchange-AntiSpam-MessageData: KModcIkUaDBsTaJmeOz4Qgjdm8LwZrjdzhWAHyVA5rKBeUkS/J6qC9yun+np0JSJP4hLdwo9CXsKS8QsMQUPFKfn+LuVc4WAmyKibOeohVQDyJt8kgF2BRcB3Dt9BCau2Nz0U8yt9z8xBhWP86lR5Q==
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483fd499-9d79-4df3-44be-08d7d47745cc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2020 06:55:03.5504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOTI0STlT+0H39gFSyl+6Tp278RO5h/BvTfK7vDsk0IDWjSEALqiFCImDGmm+VYMXK2/u4HBTG2VRY/3IhQefgGCnvWYOSGiMXzCZ34JrnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4803
Subject: [Xen-devel] [PATCH V7] x86/altp2m: Hypercall to set altp2m view
 visibility
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
---
CC: Ian Jackson <ian.jackson@eu.citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
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
index fc6e57a1a0..2e6e652678 100644
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
index a3d115b650..375e9cf368 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4511,6 +4511,7 @@ static int do_altp2m_op(
     case HVMOP_altp2m_get_mem_access:
     case HVMOP_altp2m_change_gfn:
     case HVMOP_altp2m_get_p2m_idx:
+    case HVMOP_altp2m_set_visibility:
         break;
 
     default:
@@ -4788,6 +4789,19 @@ static int do_altp2m_op(
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
index d265ed46ad..bb44ef39a1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2140,7 +2140,7 @@ static void vmx_vcpu_update_vmfunc_ve(struct vcpu *v)
     {
         v->arch.hvm.vmx.secondary_exec_control |= mask;
         __vmwrite(VM_FUNCTION_CONTROL, VMX_VMFUNC_EPTP_SWITCHING);
-        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_eptp));
+        __vmwrite(EPTP_LIST_ADDR, virt_to_maddr(d->arch.altp2m_working_eptp));
 
         if ( cpu_has_vmx_virt_exceptions )
         {
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index a6d5e39b02..372c84da9b 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -493,8 +493,17 @@ int hap_enable(struct domain *d, u32 mode)
             goto out;
         }
 
+        if ( (d->arch.altp2m_working_eptp = alloc_xenheap_page()) == NULL )
+        {
+            rv = -ENOMEM;
+            goto out;
+        }
+
         for ( i = 0; i < MAX_EPTP; i++ )
+        {
             d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
+            d->arch.altp2m_working_eptp[i] = mfn_x(INVALID_MFN);
+        }
 
         for ( i = 0; i < MAX_ALTP2M; i++ )
         {
@@ -528,6 +537,12 @@ void hap_final_teardown(struct domain *d)
             d->arch.altp2m_eptp = NULL;
         }
 
+        if ( d->arch.altp2m_working_eptp )
+        {
+            free_xenheap_page(d->arch.altp2m_working_eptp);
+            d->arch.altp2m_working_eptp = NULL;
+        }
+
         for ( i = 0; i < MAX_ALTP2M; i++ )
             p2m_teardown(d->arch.altp2m_p2m[i]);
     }
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index eb0f0edfef..6539ca619b 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1368,6 +1368,7 @@ void p2m_init_altp2m_ept(struct domain *d, unsigned int i)
     ept = &p2m->ept;
     ept->mfn = pagetable_get_pfn(p2m_get_pagetable(p2m));
     d->arch.altp2m_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
+    d->arch.altp2m_working_eptp[array_index_nospec(i, MAX_EPTP)] = ept->eptp;
 }
 
 unsigned int p2m_find_altp2m_by_eptp(struct domain *d, uint64_t eptp)
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index d93c418bcf..0526bff5b2 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2515,6 +2515,7 @@ void p2m_flush_altp2m(struct domain *d)
     {
         p2m_reset_altp2m(d, i, ALTP2M_DEACTIVATE);
         d->arch.altp2m_eptp[i] = mfn_x(INVALID_MFN);
+        d->arch.altp2m_working_eptp[i] = mfn_x(INVALID_MFN);
     }
 
     altp2m_list_unlock(d);
@@ -2634,7 +2635,9 @@ int p2m_destroy_altp2m_by_id(struct domain *d, unsigned int idx)
         {
             p2m_reset_altp2m(d, idx, ALTP2M_DEACTIVATE);
             d->arch.altp2m_eptp[array_index_nospec(idx, MAX_EPTP)] =
-            mfn_x(INVALID_MFN);
+                mfn_x(INVALID_MFN);
+            d->arch.altp2m_working_eptp[array_index_nospec(idx, MAX_EPTP)] =
+                mfn_x(INVALID_MFN);
             rc = 0;
         }
     }
@@ -2661,7 +2664,7 @@ int p2m_switch_domain_altp2m_by_id(struct domain *d, unsigned int idx)
     rc = -EINVAL;
     altp2m_list_lock(d);
 
-    if ( d->arch.altp2m_eptp[idx] != mfn_x(INVALID_MFN) )
+    if ( d->arch.altp2m_working_eptp[idx] != mfn_x(INVALID_MFN) )
     {
         for_each_vcpu( d, v )
             if ( idx != vcpu_altp2m(v).p2midx )
@@ -3145,6 +3148,33 @@ int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
 
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
+        d->arch.altp2m_working_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
+            d->arch.altp2m_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)];
+    else
+        d->arch.altp2m_working_eptp[array_index_nospec(altp2m_idx, MAX_EPTP)] =
+            mfn_x(INVALID_MFN);
+
+    altp2m_list_unlock(d);
+
+    return rc;
+}
 #endif
 
 /*
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 105adf96eb..800e12eae5 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -327,6 +327,7 @@ struct arch_domain
     struct p2m_domain *altp2m_p2m[MAX_ALTP2M];
     mm_lock_t altp2m_list_lock;
     uint64_t *altp2m_eptp;
+    uint64_t *altp2m_working_eptp;
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


