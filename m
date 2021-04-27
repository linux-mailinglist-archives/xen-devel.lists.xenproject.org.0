Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F436C7AA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 16:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118575.224775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOab-0004yE-BI; Tue, 27 Apr 2021 14:21:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118575.224775; Tue, 27 Apr 2021 14:21:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOab-0004xo-6y; Tue, 27 Apr 2021 14:21:25 +0000
Received: by outflank-mailman (input) for mailman id 118575;
 Tue, 27 Apr 2021 14:21:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0mD=JY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbOaZ-0004xi-Qw
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 14:21:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1222ffe8-80fd-4214-8129-4e3536af62d3;
 Tue, 27 Apr 2021 14:21:22 +0000 (UTC)
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
X-Inumbo-ID: 1222ffe8-80fd-4214-8129-4e3536af62d3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619533282;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Zdo3fp5CvqsMMKr4CyeVT52LrHSl77tZNf5xxonG4Qo=;
  b=ZS7zg69lnrGIyoIu/I1D6TrG12FYWa1Fde9xKiRY5oOmwmWyzwEff8wZ
   ZfAmx7GcKG8gpMl/s+TF3NInNPkbt4Fkx3gcywReO1k4P1/VMQxcPb7JF
   HXwS/ztYH9VQXwEE6MWkgHuUpaCfAv9NYAlqY+BE3pOk12qIJhOBtT+Qt
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: P7HVEKNakn6aPiMbHT1sQ9yisEkyxsdU1++FhbsVV9tq7UFllDsqjwYJntwrFOc4LNd1h8rTYm
 9UX3I3hxZLNgkZSA/S/hlKHRgXa09mgwe/ifqgIvleCFdP7OA/76jf4ywW2kZ/3L+7xZb54x+U
 74DwtyAeVyM4FBcZg2waRyMOKuJTJxvXncPhMRKGY83aQFUgizhr8iEpCV6zNWxkk7WQqmS8dQ
 ybszTG/lERsbePZrHljciOPyWq/Zt0PJUSAZVkIiP06xxGH9CbVNZQu2dwUlEM3inMYQi2SiIl
 rb4=
X-SBRS: 5.1
X-MesageID: 42507873
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5iNmraG6MYLwcwCSpLqF6JHXdLJzesId70hD6mlYQxZYa9Hdss
 iokugS2xOcskd3ZFgLs7m7V5Woa3Xa6JJz/M01NbCtQAHptAKTXedfxKHlxCDtHDC7y/5F2c
 5bAtVDIfD5EFQSt7eY3CCWCNAlqePrzImJgqPkw25pXUVWbchbnmNEIyK6NmEzewVcH5o+E/
 Onl7Z6jh6tY24eYMj+JlRtZZmgm/TxmJjrYQELCnccgWHk5w+A07L0HwOV2R0TSVp0sNIf2F
 PIjhDj4eGbu+y7oyWsqFP71Yhcm9fq17J4avCkt8kPJj3gziauaYhxMofjgBkJofqi4Ftvrd
 /Uox1IBaVOwk7WF1vYnTLdny3blBcn8TvL1EKRi3qLm72BeBsKT+56wb9/XjScwUw6p9142L
 9MxAuixuJqJAKFln/l/N7DWwtxmkezunRKq59os1VPFY0EaLFQqoQD/ERaVJcYdRiKk7waLA
 ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613451600"; 
   d="scan'208";a="42507873"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofgk/kMociav3X2u8Xgv/yi7dwvo6TBB34bHNzOlueiF2P+1D5LCFSEPDucQw2Gce+ZU63eaTo5I7FAWFluexDIgMEW2K+30yDl7XPJl1hUoWZGGXmsU2Wtph0wsoGOELUsq8LAQ9OWP/25JCLnEpHi4frNsln7ggwAxpC/hv+QLTUyWqhJYqprN9+otb/5XvgZWguBhAZuMSeGgEQ1BCeMIzLOQ2MoZKQ8GhEKL8VGmil5WyTooKD4YfnVlnJN3RPUKJjCkrq/iirrQT9+FE1zv7cbJNlJ4uXFJv78SYLTpad7LlrBYbKZtYor60XCWQr4X00hAE+YuoHh7Drj+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykm6C/DdorPDyWCv/5zxEwbKtGIhtsjujRU+lqObAZc=;
 b=ZRu9LvebRasUav4/cQJU9R04gAy1kJZ1bqrtaomKTxpmHP3+d4EmPtfES1Z67Xk3wpycZ8bstVZVvLBpRjeaWDpBffpmhjRXSucwdt/rNtC+BSWEjikj30q6ubPr/CZKFjyzMf2v4a6YGG05e78JnXuM2Gp5huIYYALqp2kumAvF5aTSFqVrUrulA6mMa+jI/ZbDitEysutipYlRUolJ/f98tnmqu2nThjMBZ0r+LtUgCB6+1OuCPfXA9n79ki47DiYd4rcTMoNeX6rbOwGUXFdFCZJg5O8kbhifQx4TOUsjRyBzi4ScrApmiu++d019OFsWMtFPgJcCi+rxUbDErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykm6C/DdorPDyWCv/5zxEwbKtGIhtsjujRU+lqObAZc=;
 b=fmzYY8+PSrBoEEQYuhwMolPAB3WvzzLk0tPRRArh8qJ/5jOKXB2otIw6RwpGRjmtaJaAKQUNkMgHpIoby36KYi70+TzEi6Ar0dPc4SG2F8WCY7GUJ0k8SD/Z0L8LngfwEnRn2Ep6KuY+GdmmTAitYHEhZ+7VGHZRp+xD0THvt7s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3] x86/oprofile: remove compat accessors usage from backtrace
Date: Tue, 27 Apr 2021 16:21:13 +0200
Message-ID: <20210427142113.31961-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef59c822-c52e-45bb-3c6f-08d90987b9d8
X-MS-TrafficTypeDiagnostic: DM6PR03MB4298:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4298F186DA0F9078BFEAD9B98F419@DM6PR03MB4298.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sG+uTBOpuO3/4CkCYg4IHUyehrMlhJPSktg0I0nDm/8oThZQtx7/dgZCZLFE0kMHuiGp2nD3xZ69OH/LOi8QTEUn7VEuTp95ZKN44oORyMmy8kTQE0jW9bQd80rukXll+be1RmuB9j+r/ZoZKBvb70HHOBMhULW9eX9Ycr7kYo7YPLu9NPvCGRvgUXhurxy71PtH3OCUfY5YhiDP15Ut7kOgsFWDB5SbKXXck89kMxQrqIgA8OcruArt0x0YBSuzuIPwl9icQ76mmnaddiGeykDRee2H2uQs7tFF71Djzz2vy2E9OfEapXE6+UWz5IaqqMgzp/XLpvsrdKUs3IKUgiZueyXMIq9CegWFpLJ7EfP9QMzL5MUYKB+Ee8qhfLKpnzupNHwaTzSk4/VMKiacFwV266PLj1XlydPNEOJ75fOs7zrRZ8ZopIfSJ1N1RJIyPUxxmgvbd0QwZhCmAOmU4BunonQXhTv2NP1wyEpvPl8w4Mz/KryPFX3i23dSCMq6s9FTuPcNoLk6ieumvdwX12FSFN8hSzAcw17s+HxWfrcL3fQ0YQn/arJZyuwJTaGxBkj06CjRwaWDlmYJ0DKAvX6GfHod9hi8lmmFWXN3/mw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(66946007)(6496006)(186003)(66556008)(16526019)(83380400001)(8936002)(478600001)(54906003)(316002)(26005)(6916009)(36756003)(66476007)(4326008)(2616005)(956004)(1076003)(6666004)(86362001)(38100700002)(6486002)(8676002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cXZsRytVWk9tTk50U0pPU04xZXBOVk9kOWJZeEp0WkVzd1FJb2t5NlJBcXJN?=
 =?utf-8?B?TGdrVXJ4YkdrK1l3akpjZFBha1dPbnJ2VlowdURUKzNwOFVFRHVudTVzUjZn?=
 =?utf-8?B?K3l2aSs0UG52MzBnS2VNSWRuQVpoSjJCZ3RtTzV2SUJpZ01oTGkzQ2JXc1pX?=
 =?utf-8?B?YlBnTGdoZzhvY3d1WCtHbDI5RURMSURZVS9GV2VvNjIzd2RsM3RibXNxTVdD?=
 =?utf-8?B?Y0drbG1tVFVTdC9SblBCaUZ6N1hwYmZVMFlNQjFjS2h3c2FzN3R1dkVyYmp5?=
 =?utf-8?B?a0tqeDVlZUp0b2t6QkJMYzRWb3JMK1VKd3lPbU5BUFVMNnplQUVEclRPazZK?=
 =?utf-8?B?czJld1p6Si9yUkJWQWxZclV6RzNJTWVIdFgrYTQ4cGptcFhGcTZhOTZVRFFN?=
 =?utf-8?B?VStTbWZzRjk0aHdFTWpvNXpDVXNMaGFxK0ozY3cwSEtlMEpZRUxyaWk0L3Bh?=
 =?utf-8?B?Y2lyM1VZb0kwVTF1USt5ZWprbG13SUk0SmFubkx4VUY5eVA2cGlTRUZmd3FG?=
 =?utf-8?B?dWZITUs5RVFQeW1CQmp2ZEQ3VzQrbDBuUEk0RkJhVmxGSDdONXBEMXBsdWlC?=
 =?utf-8?B?YTRoSlc1d0dqei9sSnR5SmJIVEt2WVhkQkNZblRIV0FUQXZXdU5rb2grUk9x?=
 =?utf-8?B?NlZuaGQ5MGxSckRHaUNKR3lKYzczdGRNVVVaa0VoaU0wdUZRdzhNNzVPSUli?=
 =?utf-8?B?TGlwVWdQNzdWREFuTTJlVE9yVGJHQUxDa0VXVDZTRHdDeE1EN2lNenBSOFF2?=
 =?utf-8?B?L205MFpkQ2JpcENSZnlXVWxHekhlK04xemM1WXVUNytVbExxb01lTklnQy93?=
 =?utf-8?B?OTdMaEoveVpkbmpRTWdnSWtHQ1k4SUtwUkt1UnlDYU1WYW5lek1kb1pvRkhV?=
 =?utf-8?B?RHRVRmE4VzJ4K04ybDM3dUdZQm5VRnEwS2tVRENLeVkvYkNsYUgyNVluLytK?=
 =?utf-8?B?dnpVK2M2V3BuTWpjNHk5bGZOWjRCbGV1bEpXYndhRkZFUmpjYk12eXB1bGZ3?=
 =?utf-8?B?clh4N2V6SHcyclVGaXdrYVB2eXUwWko4WXkxMDFFK01tOFpuWlp1TUN6NlhE?=
 =?utf-8?B?U3ZNRm1yQ3hvaCtUMVZTbXVicWw4VVlWVjBjdEw0cFg5T3pTN2ZZbllhS0JP?=
 =?utf-8?B?M3VMcmhVL2ZDbkY3bnVGMGtpZk05VGNaNGJGOWM0eHJjTytCenNVZ1hrYTdE?=
 =?utf-8?B?ci9acXJ5RmdkRE8vOXdqcTVKaG1YampTR0NmQkNlQXZxLzNFODIva2ZHWjZB?=
 =?utf-8?B?bktyWW5EOHhiYXBjQ25EQmMwREhjZDkzTlVobDFVMmFSNXZPZVg4MlRETG5H?=
 =?utf-8?B?dlJveHUyeERhRDMzQ0tWdTYvdkkrUUh0Y2lpcEwyVmdDbkh4b04rUVNjNndw?=
 =?utf-8?B?ZmhYck05cnJidmtMeHN6QXdEbDlZL09MVWNKMTRSelRMV0VhQjdVaHNaVVVU?=
 =?utf-8?B?TlRPRFRLM2s5WEdMS2M2eWl0RVMxWWNrNnFjQUlESVZRWTVIenlMK2dORXNP?=
 =?utf-8?B?ZzBOUkh5OW40Q1Q2Q0dPcFo1YStKdWZvNmZrQVdFM21KbjlYeWpBZUJoM0pS?=
 =?utf-8?B?MFpicW85SU55Uzh6Rm8ySjdJeG1QZ0lHNEpiUFBVdldXMlR0SmZldG5UMjNG?=
 =?utf-8?B?MnZjWlZQdzR4TzJBSW5lc3laUTc5UFcxYktVK2loa3MrbzZacXN3Sk5ITkNL?=
 =?utf-8?B?dEV3UVFJRmc4RG1PN29QRFlvVEkwc2JUemR5bTZHTzJSNDRxc0I1c1U2OHVI?=
 =?utf-8?Q?9lDPg1g9yPehs9YUKH9iC8RrcwF8oj5R3Znloye?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef59c822-c52e-45bb-3c6f-08d90987b9d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 14:21:19.4569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWqB8+bK3zY6ZIcsO8l3/QIgen7AmQaBp8fvrC90uf75TUdm8A1BLMJriwbiy6sHwwu4oKzYcGlZKQ54yUXBig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4298
X-OriginatorOrg: citrix.com

Remove the unneeded usage of the compat layer to copy frame pointers
from guest address space. Instead just use raw_copy_from_guest.

While there change the accessibility check of one frame_head beyond to
be performed as part of the copy, like it's done in the Linux code.
Note it's unclear why this is needed.

Also drop the explicit truncation of the head pointer in the 32bit
case as all callers already pass a zero extended value. The first
value being rsp from the guest registers, and further calls will use
ebp from frame_head_32bit struct.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Keep accessibility check for one frame_head beyond.
 - Fix coding style.

Changes since v1:
 - Expand commit message.
---
 xen/arch/x86/oprofile/backtrace.c | 41 +++++++++----------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/oprofile/backtrace.c b/xen/arch/x86/oprofile/backtrace.c
index bd5d1b0f6ce..21b14f63bdb 100644
--- a/xen/arch/x86/oprofile/backtrace.c
+++ b/xen/arch/x86/oprofile/backtrace.c
@@ -20,7 +20,6 @@ struct __packed frame_head {
     unsigned long ret;
 };
 typedef struct frame_head frame_head_t;
-DEFINE_XEN_GUEST_HANDLE(frame_head_t);
 
 struct __packed frame_head_32bit {
     uint32_t ebp;
@@ -43,7 +42,6 @@ dump_hypervisor_backtrace(struct vcpu *vcpu, const struct frame_head *head,
     return head->ebp;
 }
 
-#ifdef CONFIG_COMPAT
 static inline int is_32bit_vcpu(struct vcpu *vcpu)
 {
     if (is_hvm_vcpu(vcpu))
@@ -51,52 +49,35 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
     else
         return is_pv_32bit_vcpu(vcpu);
 }
-#endif
 
 static struct frame_head *
 dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
                      int mode)
 {
-    frame_head_t bufhead;
+    /* Also check accessibility of one struct frame_head beyond. */
+    frame_head_t bufhead[2];
 
-#ifdef CONFIG_COMPAT
     if ( is_32bit_vcpu(vcpu) )
     {
-        DEFINE_COMPAT_HANDLE(frame_head32_t);
-        __compat_handle_const_frame_head32_t guest_head =
-            { .c = (unsigned long)head };
-        frame_head32_t bufhead32;
-
-        /* Also check accessibility of one struct frame_head beyond */
-        if (!compat_handle_okay(guest_head, 2))
-            return 0;
-        if (__copy_from_compat(&bufhead32, guest_head, 1))
-            return 0;
-        bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
-        bufhead.ret = bufhead32.ret;
-    }
-    else
-#endif
-    {
-        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
-            const_guest_handle_from_ptr(head, frame_head_t);
+        frame_head32_t bufhead32[2];
 
-        /* Also check accessibility of one struct frame_head beyond */
-        if (!guest_handle_okay(guest_head, 2))
-            return 0;
-        if (__copy_from_guest(&bufhead, guest_head, 1))
+        if ( raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)) )
             return 0;
+        bufhead[0].ebp = (struct frame_head *)(unsigned long)bufhead32[0].ebp;
+        bufhead[0].ret = bufhead32[0].ret;
     }
+    else if ( raw_copy_from_guest(&bufhead, head, sizeof(bufhead)) )
+        return 0;
     
-    if (!xenoprof_add_trace(vcpu, bufhead.ret, mode))
+    if ( !xenoprof_add_trace(vcpu, bufhead[0].ret, mode) )
         return 0;
     
     /* frame pointers should strictly progress back up the stack
      * (towards higher addresses) */
-    if (head >= bufhead.ebp)
+    if ( head >= bufhead[0].ebp )
         return NULL;
     
-    return bufhead.ebp;
+    return bufhead[0].ebp;
 }
 
 /*
-- 
2.30.1


