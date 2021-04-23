Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25D369238
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 14:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116274.221929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZv2S-0007TP-IW; Fri, 23 Apr 2021 12:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116274.221929; Fri, 23 Apr 2021 12:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZv2S-0007T0-F8; Fri, 23 Apr 2021 12:36:04 +0000
Received: by outflank-mailman (input) for mailman id 116274;
 Fri, 23 Apr 2021 12:36:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZv2Q-0007Sv-Sl
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 12:36:03 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 729c0ee4-b5fb-412c-a264-9c47c3d5ba39;
 Fri, 23 Apr 2021 12:36:01 +0000 (UTC)
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
X-Inumbo-ID: 729c0ee4-b5fb-412c-a264-9c47c3d5ba39
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619181361;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Rfc1denkeZVgxSQhXB4BJUgVfeefJB/UQ8Q+7eKNtNE=;
  b=Px0Ti/Anq/4cfgQqgfFF6ZkU7Q4Pf1QOCSN55ggjtActFy/xSH9JWX0s
   2y/tf013egpPK3j9fVwIwSLDYxSrm+UD3mE4aELvi77ATdQx+20K1itD1
   ewNLiIWk0CuhV+LSzYkzd834na/Ikx/az8/jJWb7c3Xw7eqHg0mj+gsUz
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8Y1ulFjG6P7RoyBPt9OTBxbZMIz88jgJG+wLykEt2BDn6lY0LNXVmK8mpN1jWffJkDnyNSVGkf
 Zxo+uTuUGfNeSgRbNIvxvKAhfKo5gTvRYoJke5rBf7oAfn55ngMjZUZzHMwnc6d8nsFZ1HXD2x
 3mav5d2v4XZtSczExCUWRiycsKBOLBT5QM7RLqKDDPNCr9sfbHD2wuTqhOyotocKsaYnVm5rKI
 30r/NWtwR2GeutEgvCoYf9k4gcwT5PZTyDH8BMSmn1cGDQMBz6IILvKs4wJ5uV/ovwmjAszTg2
 abk=
X-SBRS: 5.2
X-MesageID: 42271113
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:x0sl/KFZrKi0mKgkpLqFs5HXdLJzesId70hD6mlaY3VuE/Cwvc
 aogfgdyFvIkz4XQn4tgpStP6OHTHPa+/dOkOwsFJ2lWxTrv3btEZF64eLZsl/dMgD36+I178
 ddWodkDtmYNzdHpOLbxCX9LNo62tmA98mT6dv263t2VwllZ+VBwm5Ce2KmO3Z7TgVHGpY1fa
 D0jqArmxOadWkKdcP+P3EZXoH41rr2vaj7ah0LDQNP0njssRqU7tfBfSSw71M1SDVU2444/W
 zEiQDix6mqvv2h0DDd0nLe9Jhas8vaxtxPLsqKjcQeNzP24zzCWK1RH5uYsjgzoPKm9VYtl/
 jBqxotJN5L8H/KcnqrrRaF4XiH7AoT
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42271113"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEpLnxMYh6/SqAIc5xjHz6Lb8x+hbRsTcec2RoWLhX9Kh0v1Grl1R1IIdEYAEw/N0s4FeI7ocvunqB4YgaOrnYJey5tIsyfgjuR5c62qLnI+ENeEH9FPc6Dwh9YFMWXIsFkC6NgK2qhorASz+JThSvUpTT+2F65PPtc9GgEAMVVQw4WiV1J3VxKsvAAP3rpiLEiccG38aFADKLcTOBdErnnA7oAX5RNIpZz1EqKEEQB3M4Yv4X0II7XwZUXP6GRFl2nBkabqI2zhL8OPkfDN7yN92XehPykkcN6eao2ItobmcUouJTU9a8vt6wk0FU01uaJDml9ZyaqLAblKXdx+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZe+cT31ELMpAI5wRhUxQJ32tZ0HEcPvLlt0pK2KRTk=;
 b=N5u4ZVhyGZzdstP/svaWUWS03zMFSXsIRe8KC3yPb4QuxPgSeJUMY1siZaiqX8pI5h6KYBWAZolo993SOie1uBmAVl4x0DidpIsvyn6i+J87EeSlSdnM+AujxQR3dbcJfn9bcJ3gtYPUMxaPc9xz8ln4Xue5b13HidNLoA3kXx3MxAiDQToBiuOXolvTOBtrOjzqYqmiotzsREzQ2oRpajMM+DtIWABBypIT1/UPY+5HOm+oivY37U255hx8HITwxhtmjciAax8PrDSzrxCFqHKpWrQyiaPw94VgnhB1z7czlNZD+6MWc+9jv7OitiftRDv0s6glvbVEkaMpGHwsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZe+cT31ELMpAI5wRhUxQJ32tZ0HEcPvLlt0pK2KRTk=;
 b=cx7Z5rMnrS2l2Z0XQitr4FSQGPMsb07XjWeb0e4JC/IwwdBoM+dvn4D4HTO+sIrv0ibv5hj33q5x84zeoqE7gl9tTKGznAKJjFg91W8fpo6YSQFGfjQdjNo2kIw6mAJ5CZqrZ35zSESibEcNoIkbwmtXD4cx6D2OrRkjSyUPN1s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/oprofile: remove compat accessors usage from backtrace
Date: Fri, 23 Apr 2021 14:35:09 +0200
Message-ID: <20210423123509.9354-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::32) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13f503c9-087a-4083-43a3-08d9065458d5
X-MS-TrafficTypeDiagnostic: DM5PR03MB2634:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2634CE87D3FE8B7747EB4A088F459@DM5PR03MB2634.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXhajx4H6RhcgjPPwqOL4rNgU+J4iEwBfjg90oL8TcGM3EKgUSuiGN/6T31OEhFsVeQxaWxO7Chh9DlXsoKpe6OrlY6nkuadD6GEu+9Ma9BFYNdpS9a3u0B7btdQP0DVSoJymfzMv8VOzreEb9yMtkEEZ5oFs1LcN8IurM6romwRgcsRfiMQZgEC4SjEAv7dOliuCuKKo8oNQaRBiqZTMR8RFtCF3pBwDzCJqyk+JNLQ1T7WNzobaeOEsGFm/E5lbiPEfBA2D6v9nr9Zp2+P77eQScaH3FpF2iRXBh2eRfrgXb7+ljqgNHrCF6uX/7+hfqUaHwWT/qer5x9dRplPlIMlFExee2b+Vpn9c0K00ilDvu9rewoIGdNhy9vsvq1fUw0qT4DHRhhrhdWyVaGPoTa2St7lYOGeXXbOoP2GZSN8OGTOen5RmQW8ChzYU5O1TQAoxO2j4Uh5yl1r1mwJVvc1Rk8XIWPxzRIin9tYa0mOADBipEosJpNlS/4b0U9qB89lExamo0AlGqyPJm3XYvJml4n3m6ibzANkFBItKtfyeBeGMKrfWbgcYX8xJ6qjwHvFcE1JHcWw+kxoIapttQbLuSAs9+SEVI8p1VHutXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(26005)(316002)(956004)(16526019)(5660300002)(1076003)(6666004)(66556008)(38100700002)(8676002)(186003)(2616005)(2906002)(54906003)(4326008)(36756003)(66476007)(66946007)(6496006)(83380400001)(6916009)(86362001)(6486002)(478600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TmlFbVBkT0VyNG1DZzBOMDk4c0FpNVJ1ajlUNGlzeEJ2ODIxcXNiYktWS2FZ?=
 =?utf-8?B?bkR6UXI3MTdqTEdYTGE2Z1N5bTZsdEhpRXI5UVAzN0Jad0JxMkloN1FmODFH?=
 =?utf-8?B?OHNuVTBEcnB5RityQUFhTjJDMUVmRHBYSy9WMDgra202YzBOWTlSbE1TN0xi?=
 =?utf-8?B?VzBtM3d2NEFTR21KUGdjcHRSNTBzZUVYVDZMRU1qTy9sVnhvem9QR1l2Wmhw?=
 =?utf-8?B?TlRoVVZ2K2pxRFJ3NUtXUU8xY3BkSU9GemcrVjZVMFBGcjRLSndPSWV1cUZl?=
 =?utf-8?B?RGIrL1FuL3plcWg0MnRzN3JSUHEvaFlJSjk3Z0NTK0luSmJjY3BZYVJWeXQv?=
 =?utf-8?B?RGl4L1lJbXQ3SERCV2FqWXVpNndaYmNpbUJwc1VINXdheHVKVUZIN1EzQWtE?=
 =?utf-8?B?Vldoek9TcVVJTWxUOWtFaUwxRmhFbkt6WDdFOWQySmVOV0R1UjUxejJNaFB5?=
 =?utf-8?B?ZDFLNHJPcUNqRmhKc2M3NlJEdkJDNTBsVmdvT3ZlZVdjOEx5eFZOT0UvbFNt?=
 =?utf-8?B?Q1EzaUE4WTVoK3diL0hSemxBclBodWxubi9CRzRIb1NjU3dXeEx4b2Q0ODBz?=
 =?utf-8?B?ZDRmVGVJZ1FQelNEempnUmk2a0h2OUtENVJMZmRsWG5kVHF1UlBIanJ6RzRS?=
 =?utf-8?B?amxKVUxYdjRDc29IYU4ybXNFUkw3VW9HbjRqRC9TU0FwaWc4TURvTWsvSUZy?=
 =?utf-8?B?R3JvdUwyc3lEcmN0eHlQaExVbkZrTHU5Tm56eVZEWFhzWXprT1RpeTBVMmVM?=
 =?utf-8?B?NkRFbXdWZVhhN0JvczJEcm1xYk0rcXpsZmVmWnBSRDN4TDgweHFFS1JGYVRZ?=
 =?utf-8?B?VUNscnVlQklSVjNFS0Jwa2NOdHZ2alp6TTdEUmM3R0ttM1lEZFg0Nkw3bGh4?=
 =?utf-8?B?WC81THlJRXJuajJzRjJ1WnQydnZJZTVaSzhRbzZlS1lIOXA2YjZacGRodmoy?=
 =?utf-8?B?VWRRaTNraTVQdU9lZlVSTWdoK3gyT2dtMjJoWDcyY2Z3aUpLYXBid1FGS1NU?=
 =?utf-8?B?dU9odnlIUFJOVG44ZUg0a0hSUWhGQUxhS3lScVBmRW8wNWFqOEx0TjhST2Rm?=
 =?utf-8?B?bitoUWtQZHhqVGVaSEJDU3lhOGNRWkk2eDBxbjRxdEpWS3J2b3VreDVja2ZN?=
 =?utf-8?B?Z2tkZzZHL1E4VFFCOTFxcW1yRWNlSHVOam9sZEsvRG9NaEdvdVRkdHIrZHd5?=
 =?utf-8?B?WllFYmdKUmVieGlwWGpWS0lKN3JBdlV0RnNQNnB3RCtpdEoxRnRvS3dJSGZP?=
 =?utf-8?B?ZDdsZEJkSi8wekRtZ0prS0QrWTdBL1NkVlVzOUJqVE9zVUZZVzZRMFIxNkdZ?=
 =?utf-8?B?UjloVjlmVFYvR0dQM1VBSjdxYmFKRXd2bHIvRGdsWGdaeFNVaHlPbjNCZDJB?=
 =?utf-8?B?cEJSdVVURFNvTEIrSFpmZnZMQ3pIV2NCSk5VOEVVUlpIeXIzdk9nZnNDcHhT?=
 =?utf-8?B?N1h6Sk1FQ1FRTnJBaVhSN3lMUWRmdHBIb1N4elR2dzBGbmhOODg5eTFuaHYz?=
 =?utf-8?B?YzY2N1FadkVXM2pCSTg0dFJmaG4xR2owSUZuemZnZ3Y1MjdqQlRnbzk2R2lr?=
 =?utf-8?B?RHAzd1lySkY0MDhEN2FyNDc4RENmY1gvWFRPeG10dC96d3B1elQxQTczSVJl?=
 =?utf-8?B?S3oxNUs3eWdyR2d0TWpRbkd2MWlPcnNVNGJLak9ONmlJMjh1RGRNZEJldmsx?=
 =?utf-8?B?Ky9qbUtWL2pmUFlPaUQrZ1IxVzc4Zjg4a05wR0ZOVU1RUlRiK2U5L0xqRW4v?=
 =?utf-8?Q?Eob/Ec/UcE3yKh2eaNTKsdnblD38Ptim+iifXwQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f503c9-087a-4083-43a3-08d9065458d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 12:35:58.8988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4k3kCSy6j+X/Pb2mlwccQrLqEnc/d61nwW3I94TtNGHgy1jcdYgxVt3ETI67tDqZ4S/QjzTNVNj38qb/g8BRwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2634
X-OriginatorOrg: citrix.com

Remove the unneeded usage of the compat layer to copy frame pointers
from guest address space. Instead just use raw_copy_from_guest.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Just build tested. Note sure I'm missing something, since using the
compat layer here was IMO much more complicated than just using the
raw accessors.
---
 xen/arch/x86/oprofile/backtrace.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/oprofile/backtrace.c b/xen/arch/x86/oprofile/backtrace.c
index bd5d1b0f6ce..45f7fb65fa2 100644
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
@@ -51,7 +49,6 @@ static inline int is_32bit_vcpu(struct vcpu *vcpu)
     else
         return is_pv_32bit_vcpu(vcpu);
 }
-#endif
 
 static struct frame_head *
 dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
@@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct frame_head *head,
 {
     frame_head_t bufhead;
 
-#ifdef CONFIG_COMPAT
     if ( is_32bit_vcpu(vcpu) )
     {
-        DEFINE_COMPAT_HANDLE(frame_head32_t);
-        __compat_handle_const_frame_head32_t guest_head =
-            { .c = (unsigned long)head };
         frame_head32_t bufhead32;
 
-        /* Also check accessibility of one struct frame_head beyond */
-        if (!compat_handle_okay(guest_head, 2))
-            return 0;
-        if (__copy_from_compat(&bufhead32, guest_head, 1))
+        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
             return 0;
         bufhead.ebp = (struct frame_head *)(unsigned long)bufhead32.ebp;
         bufhead.ret = bufhead32.ret;
     }
-    else
-#endif
-    {
-        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =
-            const_guest_handle_from_ptr(head, frame_head_t);
-
-        /* Also check accessibility of one struct frame_head beyond */
-        if (!guest_handle_okay(guest_head, 2))
-            return 0;
-        if (__copy_from_guest(&bufhead, guest_head, 1))
-            return 0;
-    }
+    else if (raw_copy_from_guest(&bufhead, head, sizeof(bufhead)))
+        return 0;
     
     if (!xenoprof_add_trace(vcpu, bufhead.ret, mode))
         return 0;
-- 
2.30.1


