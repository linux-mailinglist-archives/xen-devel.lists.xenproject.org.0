Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12A34FE22
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103834.198061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCl-0004oO-61; Wed, 31 Mar 2021 10:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103834.198061; Wed, 31 Mar 2021 10:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCk-0004nb-RW; Wed, 31 Mar 2021 10:36:06 +0000
Received: by outflank-mailman (input) for mailman id 103834;
 Wed, 31 Mar 2021 10:36:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCj-0004n7-NJ
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:36:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36f13894-7e30-4be7-b5d6-7f162e5a4861;
 Wed, 31 Mar 2021 10:36:04 +0000 (UTC)
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
X-Inumbo-ID: 36f13894-7e30-4be7-b5d6-7f162e5a4861
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=SAMetwL225xAPJrGDUL/huf4ma4jzM1uF1a4Ewpv1GI=;
  b=fmFkDtuxxqJTuYSGyA2G/qx8qYNb0C17Ek/zlQ1R1zbR+SH1LB4l96fM
   4rsqCbtNV6+UXHxs/PZ7GYKw3ixesZh2+G3u/wAFFU9l/Z/CwJU06ccDa
   f6qLCFLEc3jLm+NKlLIml30nER4CUqGFCIPfPSW7la/VfY6OGDF2Thge3
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mMzDO/UtqfEMR85hIoZGLRQ3Kir479SPvJtCWN1oKs3VaYJXFfY3VFlBJhwbr3a14m++TGZQXH
 5lQxI0mZyBX2xgT0wWdpNmfCHAs7UO9ISdWCCJFj3hKYG+C5dREjkDdLznq0LkVJzujhgATXOg
 lUx8WgENIUiOSP5K+/LACYNfBeyBS5n0ukYeMjFby6tiLM+R+qetV1LaS5bjLh0OHmBr8dNnxU
 Qpa5yRVW8poVoXujUPFjW/Seh394NS/bxymJc/ZkSxKEYF3YBuknzrmpxpCxI8uBbXOwqcoomx
 oAY=
X-SBRS: 5.2
X-MesageID: 40526842
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yz5w+6+g3WNDQYI+MSFuk+ECdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnb8oN45pRUAKe6UGDdyQ6VBaxBza+n+T3vHCXi6vVQvJ
 0LT4FSAMD9ZGIUse/U+w+9euxP/PCi0ISFwdjT1G1sSwYCUdAD0y5cBhyAGkN7AClqbKBYKL
 Om6sBKpyWtdB0sB6zWOlA/U/XevNqOrZr6YHc9bCIP0hWEjj+j9dfBYnul9yoZOgkv/Z4StV
 Lrvia8zaWlvvG9xHbnphXuxqUTovTN4J9uAMSNj+IcNznjjB25Db4RJoGqjXQOj8yErHosjd
 nQszcsVv4Dl0/5TyWOjjbGnynmzTo05HfpxTaj8ATeiP28fh0WIY5lp+tiA3/kwntlhv5Q+u
 Z3+ljckJxtARbJjE3GlqD1fiAvrGWYiz4fi+IJ5kYvNrc2WftqgqE02lhaK5sEFDKS0vFdLM
 BeSPvR4/tbajqhHhbkl1gqxNStW0I6FQudTn4DvdSI0yNXkGoR9Tpg+PAi
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40526842"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYFNRO2v9PQNta0i9/xKKWtOyUexGq4WJb15ZY3awq2ZmoS68E7k0nA4eVyDjPg9tySdeeZmNhiozWB10wX5D3a4Inny4pSUNnKrNuWT+7dwlgIP5Q9Z6g4Ekj/tPpgI0S7O5eHXd+9bH61Wzgda12X4DUbbDXs7N4TkbGxzufg61CctqBNw8F4uX9ZQjlIsEcaD1zQDIDtrkOxPbLqr7eovvTZFeNW796713lza+MI2TJ/UwgcKuo8FYfZO2tquRkqDc0mcLSf8y0BokOsTlju1Rc69gVJFdD3oL20cPyOnStX0jF/xRyRhjZ3zTSK5WVIWEfporiSuTxvukH1onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oExx38XePN+e7ZWQr4jQrYxJher8CBXgUSz66AMKv2I=;
 b=hsgtQ7cFnU5YYlHSP17fZ3F0+FgXNYY97fmI/k1wGINLuf1pXNO3cGzYjiIPIjN3IsgQnzO6Re/DdHnm09Q/xWK9esAlGWyr8LU0BrH0KGv4ky8m5EwN5ALHYpRNZrJ1zP/i1iOsJ/gjgA2abgONOXwkgjEqz+ezsIdIKfZybnEWbR9c4EC9rtG56Uzgv07fVRuTayZxJGjWDdefNuLJ0BJMMroiI8SpOraK8Z/a7erBxQ8EFAzNmtI6wia6sqG2JSCx9nQMLm3Pjs9wjEiYhqLIqpEuU0X5s+V+ty+9TVsjqL7B6Mxq295XGGoNP8leSIcFFgcciszWBOzvE5vOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oExx38XePN+e7ZWQr4jQrYxJher8CBXgUSz66AMKv2I=;
 b=wg62XuQn993CLgDTML37U2+AifsWMQQCrPu090gBmPGLgM/uVxVrATw6Cq6Hi8xxoEFFuESe6vBIpishrZGhzZLZOuyczzN4hOA9bQH8C9TQ1eVTxvlHktI0DgUQll/pRxL0QJra/jKSBYcb+qtxLBKMxgOcwhzcQUXvTAieZrg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v3 04/11] x86/vmsi: use the newly introduced EOI callbacks
Date: Wed, 31 Mar 2021 12:32:56 +0200
Message-ID: <20210331103303.79705-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ff27b1-56fe-4a67-8066-08d8f430c62c
X-MS-TrafficTypeDiagnostic: DM4PR03MB5968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB59681FAD4E6488A01A74EC638F7C9@DM4PR03MB5968.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QE/xhWlPvdNviFTXrhyJYz09KJm+WG6fBc/zLhEBQwXxez6QSWlaL47RSrXUtZOxaG7xItKIcwJWSMasW5W4M25xb5yI5KgH5P3WiuyhQUVSsbvk834Ui7vEQ0rs4eP2L3VO70PSJfRxHJDdR61/bswqCvTKewVNUHwgHnDDsB58OoGYqnrVlMEyaYKp1bgftwdk9sD/UNEfnhhdnBlxeZOwXa5Vf0gz7h/YFETxVrwvaovdswxK/naoRY0RUkwqEo1NYb/uXINhUw7CrdWXD+o9n+BYt4muKnOKQAXNgHCqO5DX/nvurkUlcJMTDlFqFIPGGCCxm8Lk15i3umy0rSi6MSqZVYnFCcT7h4ugM3uXu79If/e7KXyJ63vZKBcRoFRG0TOaJNXswdfNeSZr6ekve/KpwsDJbamhj3+peQEao/tfCFxScOU9ioaPvuMemJaVSY8cUaihRZXRIyzUi81K4x0k26TBR/tcezaWi2N+iM0wxVfqsezB5huL1PoClfdTLa/E/XbISlT3elkkiY4fIuvPA9Cl428lsgZIWCG6zBOpeNKsNue+8scC3EXJWOEJjoiX//nMuawPorCcbUSU0MMbDEFQXSX8PEB8Bz+gpc7/dFRrWgU6Boz+yzbgiin/VzriFzgcPnH7AJ0BSy1uwwiGh3GlTS06nd7DOe8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(26005)(2906002)(6486002)(8676002)(1076003)(36756003)(38100700001)(8936002)(83380400001)(16526019)(86362001)(186003)(6916009)(6496006)(66556008)(66946007)(478600001)(66476007)(5660300002)(316002)(4326008)(2616005)(6666004)(956004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZGo4VWlpLzNwa2dsaGpCaHpwbktuS1dnakFmV3cxVEgySjBMdXkvZHFtN0dN?=
 =?utf-8?B?Ym9ZVHNFeHUzVE4rOVVlZm15L0NIVHR6aUwwcVhRcjBnS3VSclg1bHpCVlhh?=
 =?utf-8?B?V1V6RFQvR3YrLy9WMDdKNW04Zks1YnovNFU4SzhJUEkrL2luTlFJaUZEQm13?=
 =?utf-8?B?MWxjMTBla2kxYStkenBtbGRxNWsrV1NLTGd0NDFqNnRSTmkyTkZuRTFMSnd5?=
 =?utf-8?B?SktMdnRaa2trY3ZGeGFYcStrRTZOakljcG92Y0lzQmRPUU0vWEJpSXFzWVJT?=
 =?utf-8?B?K0t0Q0FUOU9pSDNGRG9SRlpwekN6QzBPbENqQWkzNE9iMjNMd2wxTGlJdm8z?=
 =?utf-8?B?Q3lsRmJ4USswRmdWNURHcnFRZXJKVVUwKzBFSDVFTEtkU0krVzhmUVVJQ3B6?=
 =?utf-8?B?VEo2TGJOTE4vK1h5VDNBamM2c1VZRFM4QWVTMk5hNWVTeGVzM2F5VHdZemp6?=
 =?utf-8?B?TUZJWTVuU3VCaFlXbTR0V0d6RUhSVHlkM3E5Tmt0U0hoaEI3WkFBUXBrNDIx?=
 =?utf-8?B?Q0xPdGFINzR2SjVaZGpWQkJ0K09oMWtwTWdGMlRjbStkYnFRd1g0UVBqMyta?=
 =?utf-8?B?OXI1S1Y0aHg3S1BNNTlibUZmWVNnOVp0U1JHK01XRk5IVkpMaHlhVzU4ckg2?=
 =?utf-8?B?bUl4VzVVeC9UT2lVb3JmR2dQUjZPdzhWQVorVjh2d0xYWFBGWFhqR2s5QzVQ?=
 =?utf-8?B?WFBxWE52Y0pnOUtpNGNuZEZZQU5meUdQYVVHR08reXJaQlVSVUpLSHBxelpT?=
 =?utf-8?B?aXYvZmpWeVlxV3FRaXdxQ3NOQ0Vyc0JvTUNNeXNDQUkyZXZndjdybVJTb29j?=
 =?utf-8?B?cmhSTXVid1lrOXFMWCtXS0MvZTZyb013dzdEV0tVWkNTbVpLSnlFNkx6Vmto?=
 =?utf-8?B?YVYxMkJ2cmZSeXNOYXpPYXdDajJmbFhqaGRzZzM1K1h2TW1xRFZORm5HNXpC?=
 =?utf-8?B?b2xMLzlJaWROblRWcDlyYlNlb09KQWhzZHl1dkZUdkZWd3UxYk5vamwzbk9Y?=
 =?utf-8?B?YkNJT2xlYjFDbEdrOTR5cVRmOFBvUkNMQUR6Q1A0NUNFOUljb0QvK3dlVWs4?=
 =?utf-8?B?N016UG5yWjRTRnRuUWMxaU5uVm1hMnA1MHBDR3p2T3h0R2RLR3l5NFEzUU1i?=
 =?utf-8?B?bVVWRWFDUHVmeW9ySWhzTXJFME9WZW1xQlRKa2hFRW81djl3TEVUN2RJdWpz?=
 =?utf-8?B?L3B6Wm1xdlFKRXVFSzlxNlBPSlpnM2NzNUFkMmRCRWxTNFlRd0R6SzNiZURW?=
 =?utf-8?B?U0t5UEMrOHo5eUFkZ2lHeUo1UE1QWm9qTzZvR3ZTYkR2eHBkTUVzL0dNR0hn?=
 =?utf-8?B?WC9PQ25UaXhwZUdQUUlxSDBiYkFUb3FkZEQzRngrSXdpYzcvMjhkcEtxMlh0?=
 =?utf-8?B?SU5KcG5FK21LYlFNbXJsSEZUdVNybTBuU2xHL0Rrc3o5dHAvS1VVTjdIZ2dH?=
 =?utf-8?B?a3ZSQlhTQVR1cWp5c281M1RvNE1nbk5iK2tUNjFYSmMwdmdoMmx3bk5tWU50?=
 =?utf-8?B?TmpjZXZjcjArVHhLSy8rREozSkFGbjdWaDUzczhHTEVUcW1WK0I2aG4xZXgy?=
 =?utf-8?B?bVFETUUvbGZtNUtvWkRWdEllWXp2NGs0dzVtUzdVb1k3WFBwdmVjTk1UQVhn?=
 =?utf-8?B?T1NXaXFoT2pPdGdYdGtJL0lUbHFrUkhVMDVWRTBFYTRmRWhDSjljM2pnMkly?=
 =?utf-8?B?eWkzMHJ0U2FaOGN4UG5rWmE1dU5nMzVrU21vbi9adXJxMThpeFJUZkZkOTdR?=
 =?utf-8?Q?Ng0cMppcc4jevI6OhcJGHun60fxIJDAa45hcWXc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ff27b1-56fe-4a67-8066-08d8f430c62c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:35:59.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHaqRcPZ7IXQIMl0WsxuGNv6e5Ct6+k4NQVuYVwumLEXRaaCJ7dK3w8+CgrvgCdOAQZrszudRRmmgvMBtTyLEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968
X-OriginatorOrg: citrix.com

Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
and instead use the newly introduced EOI callback mechanism in order
to register a callback for MSI vectors injected from passed through
devices.

This avoids having multiple callback functions open-coded in
vlapic_handle_EOI, as there is now a generic framework for registering
such callbacks. It also avoids doing an unconditional call to
hvm_dpci_msi_eoi for each EOI processed by the local APIC.

Note that now the callback is only registered (and thus executed) when
there's an MSI interrupt originating from a PCI passthrough device
being injected into the guest, so the check in hvm_dpci_msi_eoi can be
removed as it's already done by hvm_dirq_assist which is the only
caller of vmsi_deliver_pirq.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Expand commit message.
 - Pass the domain as the callback data.
 - Remove the check in hvm_dpci_msi_eoi
---
 xen/arch/x86/hvm/vlapic.c         |  2 --
 xen/arch/x86/hvm/vmsi.c           | 35 ++++++++++++++++++-------------
 xen/drivers/passthrough/x86/hvm.c |  8 ++-----
 xen/include/asm-x86/hvm/io.h      |  2 +-
 4 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 851a1f5bd6c..10b216345a7 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -499,8 +499,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(vector);
 
-    hvm_dpci_msi_eoi(vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[index].callback;
     vlapic->callbacks[index].callback = NULL;
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b43..3da0a2261fd 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -44,11 +44,9 @@
 #include <asm/event.h>
 #include <asm/io_apic.h>
 
-static void vmsi_inj_irq(
-    struct vlapic *target,
-    uint8_t vector,
-    uint8_t trig_mode,
-    uint8_t delivery_mode)
+static void vmsi_inj_irq(struct vlapic *target, uint8_t vector,
+                         uint8_t trig_mode, uint8_t delivery_mode,
+                         vlapic_eoi_callback_t *callback, void *data)
 {
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "vmsi_inj_irq: vec %02x trig %d dm %d\n",
                 vector, trig_mode, delivery_mode);
@@ -57,17 +55,17 @@ static void vmsi_inj_irq(
     {
     case dest_Fixed:
     case dest_LowestPrio:
-        vlapic_set_irq(target, vector, trig_mode);
+        vlapic_set_irq_callback(target, vector, trig_mode, callback, data);
         break;
     default:
         BUG();
     }
 }
 
-int vmsi_deliver(
-    struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
-    uint8_t delivery_mode, uint8_t trig_mode)
+static int vmsi_deliver_callback(struct domain *d, int vector, uint8_t dest,
+                                 uint8_t dest_mode, uint8_t delivery_mode,
+                                 uint8_t trig_mode,
+                                 vlapic_eoi_callback_t *callback, void *data)
 {
     struct vlapic *target;
     struct vcpu *v;
@@ -78,7 +76,8 @@ int vmsi_deliver(
         target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
         if ( target != NULL )
         {
-            vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
+            vmsi_inj_irq(target, vector, trig_mode, delivery_mode, callback,
+                         data);
             break;
         }
         HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "null MSI round robin: vector=%02x\n",
@@ -89,8 +88,8 @@ int vmsi_deliver(
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
                                    0, dest, dest_mode) )
-                vmsi_inj_irq(vcpu_vlapic(v), vector,
-                             trig_mode, delivery_mode);
+                vmsi_inj_irq(vcpu_vlapic(v), vector, trig_mode, delivery_mode,
+                             callback, data);
         break;
 
     default:
@@ -103,6 +102,13 @@ int vmsi_deliver(
     return 0;
 }
 
+int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t dest_mode,
+                 uint8_t delivery_mode, uint8_t trig_mode)
+{
+    return vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode,
+                                 trig_mode, NULL, NULL);
+}
+
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
@@ -119,7 +125,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 
     ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
 
-    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
+    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
+                          hvm_dpci_msi_eoi, d);
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index a9256e7ef51..2331af896d4 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -796,13 +796,9 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(unsigned int vector)
+void hvm_dpci_msi_eoi(unsigned int vector, void *data)
 {
-    struct domain *d = current->domain;
-
-    if ( !is_iommu_enabled(d) ||
-         (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
-       return;
+    struct domain *d = data;
 
     spin_lock(&d->event_lock);
     pt_pirq_iterate(d, _hvm_dpci_msi_eoi, (void *)(long)vector);
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 4f294232fb7..9ac3e4f48f6 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -142,7 +142,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(unsigned int vector);
+void hvm_dpci_msi_eoi(unsigned int vector, void *data);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
-- 
2.30.1


