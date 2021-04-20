Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8057E365AD8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113741.216761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3o-0000hH-VP; Tue, 20 Apr 2021 14:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113741.216761; Tue, 20 Apr 2021 14:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3o-0000gj-Qx; Tue, 20 Apr 2021 14:09:04 +0000
Received: by outflank-mailman (input) for mailman id 113741;
 Tue, 20 Apr 2021 14:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr3m-0000g6-Vd
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:03 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e54e0a4-29e9-46a7-9f2e-bbc73f449bda;
 Tue, 20 Apr 2021 14:09:02 +0000 (UTC)
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
X-Inumbo-ID: 1e54e0a4-29e9-46a7-9f2e-bbc73f449bda
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DKRwBa7N8gB43Hpd1vHxNflj8UqbpDUS3qFLF/JEgoE=;
  b=H4ORJ5u6lG9Pc0Pmrf63By9zfX7Fr5RZaGcx/LJOUU21jbRBa+CkSMRw
   HLWk4dcQwnJ5zzQELFNDh7vHYCL6qTf5/i/ZkF7ALHwBBAssuINkaQPkm
   5trGkn+k8dhI+aYFWPsKZt8bgxmFJ1rrLb89QLmPDWT/VHauqMtWAJPpl
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pyRF4Mckyy4RnQGpcwCwpPXvN9FRKhso+AniQ4H+wfscRWVkgJcqXjo5+fNmboec1AdjQZa6a9
 80bYEq0yULhyD36RynKVukMrBNeYbj4szaVndew+JwywFWpm0ukOlIGIbxcAuE/JLZk4DCoVYd
 4if4F/ykeXhPLXhKirnchwFiSQ4bY8uClaKZrFRBQ32xa+O2tMkMH94hISeK739JVEc3yeYggs
 1yHjvoY39Dl59BtbZXJK3QG0XN7nSLR9NNFLYXwIAvu2wFDk0cOCa/yGCmjulVj6ytSuN8H7Vs
 P/A=
X-SBRS: 5.2
X-MesageID: 41981482
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:smjW6qpIazpy3Em6tLhR9IkaV5vxL9V00zAX/kB9WHVpW+SFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex7h3LRy5pQcOqrnYRn+tAKTXeRfxKbB4xmlIS3x8eZByb
 xtGpIVNPTcBUV35PyU3CCWCNAlqePozImNpcPzi0hgVhtrbaYI1XYaNi++HldtTAdLQboVfa
 D92uN9qzCteWsaY62AbxFoY8H5q8DWj5WjWBYaBnccgzWmty+i67LxDnGjr3Qjeg5IqI1CzU
 H11zbXy4/mmPG9xx/a2Qbonu5rseqk8PRvLoihjsAULx/llwqnYp9wMofywQwdkaWUx3sB1P
 XKvhc8L+R/gkmhAl2dkF/W9CTLlBYo9nP4xleTjRLY0LPEbQN/MeVtr8Z9UHLimi4dleA56o
 1n9SalkqASKhX6kCH097HzJmlXv3vxm1UOu6oulXBFOLFuD4N5nMgk025+NowPJy7+4JBPKp
 gUMOjsoMxbdl6XdBnizw9S6e3pWnwyGyGPSVQZtvqU1CBLnGt4w1Fw/r1noks9
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41981482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqZ2ArlYLXm6A2lLux88pVzl7/lrfi0QOqyjzFFc7BHiXjwPDXEnQmuHh3IdfC3U8Nap+hZbKglHFXxcQkLNiOA5ddTmh24mkjufdEXLaOX4dphRznuDOCcbn4rn4bTmuRck7wdQzTEXMXC9Rq8J0oorxtFiAncuZE4NLQ4KfqX9lMNWH2kjGvWByg1R9NTHCYfop8LQezOOfib6t0pAHtP1zPNxEEg8TxpP26/udFxzkke4bpLygHWDYh5PTE/HR0GCVhdUlxj6IW1Jc0rd1XUpAQN6fdPTOVsd+n9tXnP0yln7ddg4ljttNI7TaXcpinrnzH3SqR1T31GDNxD8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W7J+sUzCMN7JZrGlfcB4U+CgJb8yL9z3xuBv1e4mPk=;
 b=FXmzNhbcmbGTL9s1majzjverbPlaLlqD5dXpqINb/hPyzxu7as75lFpGDPEKxtbrTNqthP2ru++omAtIJD2xQ3UMcsEuGuR/gIB1+sb4iewM11qDoPWCZkyi84U3tCkiJVDi7yPF7vSY2vtYdV5qaCc2UQHsrfEzgrCfq1puGvO/7JzZqsDLunNajCTh62wxlbsmJNU0KYxsoWeLVfwDeUKhoyHydU5y732F6jIq4jsmgMeI07ZTQa2zCqrrzeQkS0L/KlJv4Cz/mzwqBHxGvzuGwLY5Fepr4JxFX8+3ITAoLZ9rr9WhdgVVd1UyY1YWVGqNiTYBBadhYOviqQofaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W7J+sUzCMN7JZrGlfcB4U+CgJb8yL9z3xuBv1e4mPk=;
 b=TdcVbG7LtxJDl+fzWNzThxScjaZhK1FS8IicDWBOZvmFSfu9zrS4ddMcLTOTeFs6mWEa4c/GCx8ypXo+t2812EuH9rVtQRw6/e5CPqLAEsgADJM5+CSN8s9bEBz/i1KqTxa3OgOAiHLLAje2nOeRMGeDMZjtp4kWSprC1ldSD9s=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 02/12] x86/vlapic: introduce an EOI callback mechanism
Date: Tue, 20 Apr 2021 16:07:13 +0200
Message-ID: <20210420140723.65321-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59c981db-aec3-492f-400f-08d90405d6e8
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB600009EA5EB3B56B208FB8008F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:506;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RnLLev71UKDoOGS4aeCKdRQw5f6o4IlqeIwaGvGrl3m7I5PxUQJ6x+6StgvxFkr15Jpm0RWWjLORiXuYMINuC4ryFrZhfuKxlHFa3rbUYSN/xRgJTz/WajV0Ul23dDuYtF1kSpKZT9AQE7U6N1a5gvT6i17ke73DLWtsjtppugzlWbeVcOaCNfRO+GT3Kx0SEjQJt472hE/01wGG03C+K9VksyZalpF0rU30Na4lt/Vd8fxUCThIzuHId8GikYQGGhu1LqtDgs7dlOKWICCo7TIKhJwEHftkzhp42LThFc4gX25MLea9sIp3hjUSodbwuTfJoQIV4pxkWO46mkGNvyqNEXbx2/MmgKpyX3nxLLtLCgJuaWSSVH2TuywseK2S2CyFjeV0G28a2ZGrpJK8Tp7nAWeYfT9LXu4cgFzxP/C+JggBLjF78G1Mx3PblQSrfFoa9hH7tAiF7Co6MAhxoVTGmEMrENRKHEJxsuaBeK8xEH8+t2EZhO+klCdSLe+avLfHh+3XPc6Cj2cWTp5dFHLlmLWcWyb5bU4CtwxmwKiPXbw5czlZr1tim132EtB9J3rSd6S/IwATazy6tNMJWvrHz/FJErmSZmOYPyQPFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGQzdmdEOC9udUU3N0dodkJZcDJGSE1oNENXMnhmSjJqNnhDcVl0WHQ1d1E2?=
 =?utf-8?B?Nml1dzRScXVpR0M2bllEV0M4YUVSYXBLeXJKQ2dkNlJzWW1FQnU4Z1cwN1BG?=
 =?utf-8?B?dU5KVC9iMTljTCs2NkZsdy9BNDFnYjdFa2ZMOWxNVDB2S2JYTVU1RldCT0dI?=
 =?utf-8?B?cHhmQkVHV29td1NHOFRZdW9oZFk3K1p4SW5tK0lwd1pKajFsaVNKVm9kT2k3?=
 =?utf-8?B?TmVaZWMxelZscWtBLzhhUS9qWkcrREZWcXpMeHRzSGdBUGt2TnphQzk1clcy?=
 =?utf-8?B?dFMxa3QxTDRXY1ZHMFp3RXhrZ3M0RU1EYnBVNFVKdkpwa0hId2hlZ3NsVnA3?=
 =?utf-8?B?ck1GeWVpODcxU2FIdTUzdk01dlkvUVU4eGUvMUpFWUVscDFlQnBhdEJKUmJy?=
 =?utf-8?B?MUsvUklKRG0wVDV2RWx5TEFCNng1cjJMaDBtY3E0aEZuY1lDYjgyaUY2SmZ5?=
 =?utf-8?B?N3ZLVlpQa0hGdi9peDBtTG5hVkhES29JNG5BNzdDNVJpeG1FNHFkOVZGRnp1?=
 =?utf-8?B?OW94LzhJQXNmUHhWNDJYZ25sRnVkaGVnNnZMZTdmRm1zTFpwMm9NcTNBVVdi?=
 =?utf-8?B?UVJrVndIeExjLy9iOUs5OVh2NktlSFVEVE5INmJyYWQyUFFvNStMUG1MMzBt?=
 =?utf-8?B?TVlBeDlubStmaVUvVVIrQmxrN1o1Nmx6S1FNSkVTdllQd2JjeW82VWYwVnEy?=
 =?utf-8?B?ZUI4L09WS2liMitrMU1sVmJ3SUxuN21vSlZuM1p0dWUvTHJhRHEzdU5RNHhU?=
 =?utf-8?B?VVd0ZjQ1a1pZZEEyOFJ4K3pydERGSlI0Wk84UllBVXM5WWVZYVowTGtRUS91?=
 =?utf-8?B?NFJOcFB6cndGVXhPdUIrdnFTWE5IMHJITDAzVUJSeFNZaEpIeG5MMVJLdWl4?=
 =?utf-8?B?eno1TVpvQjlpam5zY01ScVhYWlJMUUlVVHZMdS9JZWJNWWNMQUQrcGlZQ2pM?=
 =?utf-8?B?dFN0aEFib0NnZ2FUaEQzWlpQMnVTZFdKREdnM0NLbE40L1FSVVJxZFNZSTBI?=
 =?utf-8?B?dE9Ec1pDWmdLcUM1M0UzUllRU2dMelh5NWplQWFMZEhzRTJqbVp4UDZ2T01y?=
 =?utf-8?B?eHRjU2NwRXd0NDhoeFRDSU9lN2hkNTV6VEgwc1htVTFCUmU3eEljRGNVRit2?=
 =?utf-8?B?RDd2NGI4YlJzUU1GaldCWFpPOGVzOXcxVnVmakRWaU1KNlJRQ0N5SVIzWkhE?=
 =?utf-8?B?VTA2TzRCV2tsVEVYMHl5NGlHdWhLRXF3ckwvZHdCU05SeVkwYVJucTVhdGpK?=
 =?utf-8?B?VmR2Z3VoamtOUmo1VC9jMFpYWndTd1pDZWxUV0ZySk90NDlSMFBtZXN2bEl4?=
 =?utf-8?B?NWIvWExtZ0pTc0NEMmpvRWRBSFloWWF4dEJvQi9QOHdnTzVRVDFWY2toekVD?=
 =?utf-8?B?ODh1UnZRTjdXSzlDNlllNnY4Z3ltYktrdkdkQ2RQZllwYTAyY2srRDRWLzVP?=
 =?utf-8?B?OHlUQThXQkNxaVBTbGdPbk1rRlN6aGhjbGFZRGJOUkdCcHJPbjJtRndXWm5T?=
 =?utf-8?B?M2hZclR3bXVUSXZ3a3NPRGFuSXhrcTQ1dVN6WHRlNkpEY1NzRmlTR1dUaVND?=
 =?utf-8?B?ZitYZmdqSVVISjJUMGprRnlBZ0JKRnNVTHpLQnVBQnA5YjRpVGdLK1pXYVIy?=
 =?utf-8?B?UmJIWEc4SW9XSDM0YXYrT0NOdW9rNGNkMEgzbW1wMzdwWC8vRUtwSzJKeWxU?=
 =?utf-8?B?bElpREd4QWlpdXNCVCtrRDMrR3JJdjVHaG00bGNXZDhadEJ1WjVoSFNVOXVM?=
 =?utf-8?Q?db28ZC2yN/lpRabv8z4P1lkubT5wxL6LhocInkI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c981db-aec3-492f-400f-08d90405d6e8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:08:57.7344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eVR66nzhXfqTRonEsSbQ+5DlN4SOQ5WTSvlsIy8GJT4gr7yvvY2x88W4gdbrNZHg0kV4slePprsf0padSXgOdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
X-OriginatorOrg: citrix.com

Add a new vlapic_set_irq_callback helper in order to inject a vector
and set a callback to be executed when the guest performs the end of
interrupt acknowledgment.

Such functionality will be used to migrate the current ad hoc handling
done in vlapic_handle_EOI for the vectors that require some logic to
be executed when the end of interrupt is performed.

The setter of the callback will be in charge for setting the callback
again on guest restore, as callbacks are not saved as part of the
vlapic state. That is the reason why vlapic_set_callback is not a
static function.

No current users are migrated to use this new functionality yet, so no
functional change expected as a result.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use xzalloc.
 - Drop printk on ENOMEM.
 - Add vcpu parameter to vlapic EOI callback.
 - Check that the vector is pending in ISR or IRR when printing a
   warning message because of an overriding callback.
 - Fix commit message regarding resume mention.

Changes since v2:
 - Fix commit message typo.
 - Expand commit message.
 - Also print a warning if the callback data is overridden.
 - Properly free memory in case of error in vlapic_init.

Changes since v1:
 - Make vlapic_set_irq an inline function on the header.
 - Clear the callback hook in vlapic_handle_EOI.
 - Introduce a helper to set the callback without injecting a vector.
 - Remove unneeded parentheses.
 - Reduce callback table by 16.
 - Use %pv to print domain/vcpu ID.
---
 xen/arch/x86/hvm/vlapic.c        | 62 ++++++++++++++++++++++++++++++--
 xen/include/asm-x86/hvm/vlapic.h | 19 +++++++++-
 2 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937d..4465beaeec1 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -144,7 +144,37 @@ bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
     return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
 }
 
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
+void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
+                         vlapic_eoi_callback_t *callback, void *data)
+{
+    unsigned long flags;
+    unsigned int index = vec - 16;
+
+    if ( !callback || vec < 16 || vec >= X86_NR_VECTORS )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    if ( vlapic->callbacks[index].callback &&
+         (vlapic->callbacks[index].callback != callback ||
+          vlapic->callbacks[index].data != data) &&
+         (vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]) ||
+          vlapic_test_vector(vec, &vlapic->regs->data[APIC_ISR])) )
+        printk(XENLOG_G_WARNING
+               "%pv overriding vector %#x callback %ps (%p) data %p "
+               "with %ps (%p) data %p\n",
+               vlapic_vcpu(vlapic), vec, vlapic->callbacks[index].callback,
+               vlapic->callbacks[index].callback, vlapic->callbacks[index].data,
+               callback, callback, data);
+    vlapic->callbacks[index].callback = callback;
+    vlapic->callbacks[index].data = data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+}
+
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data)
 {
     struct vcpu *target = vlapic_vcpu(vlapic);
 
@@ -159,8 +189,12 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
     else
         vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
 
+    if ( callback )
+        vlapic_set_callback(vlapic, vec, callback, data);
+
     if ( hvm_funcs.update_eoi_exit_bitmap )
-        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
+        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
+                          trig || callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -461,11 +495,24 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
     struct vcpu *v = vlapic_vcpu(vlapic);
     struct domain *d = v->domain;
+    vlapic_eoi_callback_t *callback;
+    void *data;
+    unsigned long flags;
+    unsigned int index = vector - 16;
 
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(d, vector);
 
     hvm_dpci_msi_eoi(d, vector);
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    callback = vlapic->callbacks[index].callback;
+    vlapic->callbacks[index].callback = NULL;
+    data = vlapic->callbacks[index].data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+
+    if ( callback )
+        callback(v, vector, data);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
@@ -1623,9 +1670,19 @@ int vlapic_init(struct vcpu *v)
 
     clear_page(vlapic->regs);
 
+    vlapic->callbacks = xzalloc_array(typeof(*vlapic->callbacks),
+                                      X86_NR_VECTORS - 16);
+    if ( !vlapic->callbacks )
+    {
+        unmap_domain_page_global(vlapic->regs);
+        free_domheap_page(vlapic->regs_page);
+        return -ENOMEM;
+    }
+
     vlapic_reset(vlapic);
 
     spin_lock_init(&vlapic->esr_lock);
+    spin_lock_init(&vlapic->callback_lock);
 
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
@@ -1647,6 +1704,7 @@ void vlapic_destroy(struct vcpu *v)
     destroy_periodic_time(&vlapic->pt);
     unmap_domain_page_global(vlapic->regs);
     free_domheap_page(vlapic->regs_page);
+    XFREE(vlapic->callbacks);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/asm-x86/hvm/vlapic.h
index 8f908928c35..db71fa38b0b 100644
--- a/xen/include/asm-x86/hvm/vlapic.h
+++ b/xen/include/asm-x86/hvm/vlapic.h
@@ -73,6 +73,9 @@
 #define vlapic_clear_vector(vec, bitmap)                                \
     clear_bit(VEC_POS(vec), (uint32_t *)((bitmap) + REG_POS(vec)))
 
+typedef void vlapic_eoi_callback_t(struct vcpu *v, unsigned int vector,
+                                   void *data);
+
 struct vlapic {
     struct hvm_hw_lapic      hw;
     struct hvm_hw_lapic_regs *regs;
@@ -89,6 +92,11 @@ struct vlapic {
         uint32_t             icr, dest;
         struct tasklet       tasklet;
     } init_sipi;
+    struct {
+        vlapic_eoi_callback_t *callback;
+        void                 *data;
+    } *callbacks;
+    spinlock_t               callback_lock;
 };
 
 /* vlapic's frequence is 100 MHz */
@@ -111,7 +119,16 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
 bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
 
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec);
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig);
+void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
+                         vlapic_eoi_callback_t *callback, void *data);
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data);
+
+static inline void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,
+                                  uint8_t trig)
+{
+    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);
+}
 
 int vlapic_has_pending_irq(struct vcpu *v);
 int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack);
-- 
2.30.1


