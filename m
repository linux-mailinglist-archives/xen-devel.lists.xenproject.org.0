Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F232A365AD9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 16:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113742.216772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3u-0000m5-FW; Tue, 20 Apr 2021 14:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113742.216772; Tue, 20 Apr 2021 14:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYr3u-0000lR-AV; Tue, 20 Apr 2021 14:09:10 +0000
Received: by outflank-mailman (input) for mailman id 113742;
 Tue, 20 Apr 2021 14:09:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYr3s-0000kS-O2
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 14:09:08 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07a2cb89-bb58-4469-a59c-7f88cc2d5cf3;
 Tue, 20 Apr 2021 14:09:07 +0000 (UTC)
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
X-Inumbo-ID: 07a2cb89-bb58-4469-a59c-7f88cc2d5cf3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618927746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=vpcN02cyzKID1HjeTihBXBv2NdWgJ2yP5FtMABZCCQk=;
  b=MRUAgkJk+CKpzCD0209jdxvocP5W4i+M6C/XR93iLL23t0KXariv6Jxn
   oEKmbJqtf5WzUH7BrFgNpjLL49jdLQyJ2keJi7RBaXHwvFsvRn9+7yON2
   B4z5aDRfWCJu/bw1nRgOLYDEylOTS7vZy0pXP9cSlyKgtOWbBXJyXVrKG
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +5x+J5rIseA6HcAiGBM14IgKx4J6im0TqjO2/hpo0JP8Prh5tyDvsNRtNtOSCuC5EsXUl8frk+
 I0nNB1rIRkTL7ZP5QtcmKIJ3xGbad1Oy/WDsVOPAWIVNyC2txZ6VjU4E4I4RfxeCJ6DbxEKNer
 9jPVpMMXKT97B8rBdxBl8+yIDlYdU77KSsJPjqlSIF/NqeGL9knHsZO+hiWzGEjHdjMTMY7kBp
 YhKxEUdPL8pSmzCeVGkecCjuJmXi6LbBiQw+Oy4cF1p/cuPy8abDkJyAmXNi7I3X4ctxwWLm1g
 acM=
X-SBRS: 5.2
X-MesageID: 41988218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/7/lL6mdoUn1aQkqT1s+bGz6jWTpDfP2imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMWOqqvWxSjhXuwIOhZnO7f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf4LmRTSBNdDZQ0UL
 qwj/AmmxOadX4abtu2CxA+NoCum/TxmI/7ehlDPhY76WC15g+A0qLwEBSTw34lIlBy6IolmF
 KlryXJop+Nntv+4R/a2m/V4f1t6aHc4+oGPuOgoIw4Lj3tjyyheYhuXaaT1QpF3d2H2RIRv/
 Tn5zsmIsRv+1PdF1vF3SfF6k3b/xsFr1/k1FOCjnPoraXCNU0HIvsEv611WF/9ySMbzbVB+Z
 MO5U21nd5rKCmFuyLH693BR3hR5zKJiEtnq8E/pThiS4cEAYUhyrA3zQduP7orOjn104wjGP
 kGNrCm2N9mNWmXaH3UpQBUsbqRd0V2Gh+HR34LsdCO3w5Xm2hkz1AZyNZ3pAZ4yK4A
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41988218"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRrWBIH6ojGpu/aPPKeCaXHz2CYAspnQdAKXScak5jETzLSjrG0nGQV33oHaada9Koo269j4dPivxK49LdHciHLpTZdOjkHqg64nyxVTXxA02lH7SOWZstPMGc55bGHrYnjlhpqvg7pc3Il8V+ujm/oxLlpkLHbwJHFaNcyb5GTK/QKp3fZfed8ETzEFW8Y4Z3+k5toN/ITlG/fu8zIBLWlMvQ+kaq27skOOrCgd2/gmuya7g6NxDArGbGiug7VKvz8r2t/O0jzgY2N+cPM2MZ2FpZh44f9ALw9nbDyfMnM4zyA4t1PuYGvLgtCa8W/srxFEhYf3SxGYAEdJ1zCkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTznuj7Tf1xHDE+jz1fFRYaGylN7zYTwaHIzddWA0R0=;
 b=DebQwbQ7f4DYZeBKaUKQUS2uFv8TX7MsTaui0lh+JaVMI8p4xezElCLn3towVI6k5Tat6lJIhSf7vRopUXlDXEqQPiu8Xffb13J7ble05eDL+5Ilt1Azaa+B8WQoMh/86E7xkJhJ0U3j2IShbWmNc5qLPIxlA61c117oc/jqzt+5zshnbmdkjk4nmlPVKa/8QqdVx0Rv4+fDdab79cTCoW8dQ4GwUVH0ne2STq9LxlkED2osdtYpw/LxDysmmd+U0pfCOB/0q/+UY/6qcgJnH7pGUuwdfuryn2KfN0Mz0e7olwY9bjYeB9wMPluNMUt9snmsmOt8Ga4ieyf1b+b/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTznuj7Tf1xHDE+jz1fFRYaGylN7zYTwaHIzddWA0R0=;
 b=bGqPax/egN9/2wWECbsMbLG/WuHVmHGydPpdT9Va3e1BChBlqEpD8jBYckdCw04oTmDLsk+7ueIJ00ovNeT+IKvLmkJGmYe6rFUMwkn0aLL9zNWwMUObS8tNkgISAvdBQawP+WEte5JTTNjzNO3fFFLZJDw7Rlh5tIgSa4ypRWg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v4 03/12] x86/vmsi: use the newly introduced EOI callbacks
Date: Tue, 20 Apr 2021 16:07:14 +0200
Message-ID: <20210420140723.65321-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210420140723.65321-1-roger.pau@citrix.com>
References: <20210420140723.65321-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0135.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0c21fc-f40d-4908-1426-08d90405dab4
X-MS-TrafficTypeDiagnostic: DM4PR03MB6000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB6000D0746CC5893DA3F872088F489@DM4PR03MB6000.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mSPRB/4y9lgb6gZRHBCKCj+aR4quO6VZ5RGnsyHTfR+E9/+Ne8H/zxRTNIJ493w3t+mp/6UBt5qEd0FcTdjtNcPF04Bj/yCavwWl7SEkDp8caJ91BV9RTbHF2VcSGVVbQnMdZdG1zrgu/Iy6BNjb5TkSkzOe46FlTzmRHI0x0LF9+4+/ZN0/6yeOPABl9iVuq7Wbo1OCVUS4SMWq/WinlEiYd1Zdxb5LGppJ8CO4Il0BaXh9OJXyvpHsWNQKpdHAuWqMZpwvPol2ArEPLUCZrcKTHRdqmHlUD66oV6lzb91WT1fmqzQiQLOKl2q4/1674YVM+c1nN/J9u1ImhP1Cpa5gy+FdQj461H+RYwXCvxlWq/kBNyNvBwZ/6k3UCCslAe3/tnWmSODvk4+0rGUr3VI9nccB2JigmiT8uvXoYr+fBnY6Btmq7iJO91ryD85vzFJ7RG07ytVXSL8H7uNJnDAZnh9rRuTaFbu2tbYYXBdIYEKg3zFvT4CeFNtjIUL+aV/lDnQgkKEPffywFlQtfVaMz85l2TaFvoYqAhUFLupyfDLtFX/SQiFyOZ/06twnLU4h+LvNmFqr/4nU7SpqNygkt+glzKMGuO6IwnHhhpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(6916009)(83380400001)(4326008)(38100700002)(16526019)(36756003)(316002)(956004)(6486002)(2616005)(6496006)(478600001)(8676002)(26005)(186003)(5660300002)(8936002)(54906003)(2906002)(6666004)(66476007)(1076003)(66556008)(86362001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHh1TnYvT2NGRDJtaEhOVHVGU1I0by9PV1ErVkdUVHdRTUdkNTFVaXR2Uk5H?=
 =?utf-8?B?UWpOM1ZKWmg2MGllNk5nQVh3YXdBL2hWTGl4OVh4MGFYYVY1WXpwMzd5MFk2?=
 =?utf-8?B?UlNKN2syb2xmMWxFaHltWlI4bi9UQjlwb1JBNjQvblF4Z29Jb1hZQUxXUS80?=
 =?utf-8?B?N29kV0p6UG8rTW9RdnlBVnp1ZFJiRmR2MWh4dnpZZDR3Z1ZvU1NoSFlVTXJD?=
 =?utf-8?B?MHdJeFR4b0ltazNVaENYTzU3TjZJYTlwREZzd0xVRXhHWDNtUis5a29LK1Ju?=
 =?utf-8?B?THNFU3FhY0hTNEpoQ25oZDQwVUo3aU45alZkSEdxNXRkMDZ5VlVSTVBURXJp?=
 =?utf-8?B?L1gvRnl3Vi9nMnNmWXJKanpYcTVINnVQKzVWT0RvL2J5N2luS3lqNEpkMDN4?=
 =?utf-8?B?NDhubjk3UHhIUW5TZUptZHNWYkVVQnRhcHlTOFFMeXFzb2YvaWRLeGozNGxv?=
 =?utf-8?B?K211VW04U3pub0ZjSmFsemVYc1pWSXFPcGJiZms3SUtNaUFyajBIbW5MekIz?=
 =?utf-8?B?djErWDVqNXUxZFFPUzRZMUNjL2VLTGViQjVSUm02MHo2WnJtUWh3N0J4Rkh4?=
 =?utf-8?B?WnZpdGtIZERxS3JHcENjaG9jZVZjcllDdTM1a0lMUUtRc1d0N2ptaDZVVzNP?=
 =?utf-8?B?ZGpwRmJsZzFpZDMvSVpkS0NEUzNJRlhkeXBPMkdURDNsdnIzTmJnL1Azb1U1?=
 =?utf-8?B?MmR4bjNIcDJsUUd5VnIrUGZDT3UzRzVlUFF6S3FEUFE4bkVtRzg2Y25OQWdp?=
 =?utf-8?B?dHM4ZDJCdktCb3RJZVQ5b3NPMTQ1cDJOa0hZSytEVlZDcVhqeWFYcDRkSjdG?=
 =?utf-8?B?WlpVSUlraXBKQUFiaVZMelhubFkrUkJ5V2lsOE01N08wUWhiSWlVTGxnQ2l0?=
 =?utf-8?B?R092MEljc2FlUCsydnBDL3luNWVNb3RBZGJsUm1jNG11NTkvT1VIbzZ6clRB?=
 =?utf-8?B?RTVKVGpGeHI3VDFVQU5tdzZFcEdnbkJ5cEtxbGNldk9YTW8zZHFLSUJnNjVu?=
 =?utf-8?B?UmJ1ZVROWldLTDJ3aVJQdXErdGV3VGlNU0dBZWlURUtTUUJzamFuL0t1K2Z1?=
 =?utf-8?B?c2U1elJQMWk2c1VzWk5iTFlhQmg5U0pZVmVkdGJieElaY2RMeStIaWpGQmtu?=
 =?utf-8?B?L3ZsOHVWaStWZlFONThJNzRRUW9SWEc2eWhsRDNoOUQ1cjR5cjg5dUNGWlVN?=
 =?utf-8?B?azZDVXlneXN3YVZydDJPWCtaenpVVXA3VXlGcFA4V0M3SlZBTmJpOWRxRjQ0?=
 =?utf-8?B?N1VyNXQ5NTdUamVIQzQ4ajFjWXdidGkzVHh5bit5MkN3aVk0Qi9JMG1VZjBP?=
 =?utf-8?B?bjRYQ1JLM0ljMjBkTnNXdFBMeDdIRUJpVHlTb0hhOW1ZYXJmMFAwNHVzSSs2?=
 =?utf-8?B?L0NlLzRsSnQzUFlUdFJrSEhXOXVsRk5EUkFFbmpINEgyM3U0NERyWTZsTnlk?=
 =?utf-8?B?dkFwdENESGkzSnJtSVJ1dklYQ1BSdWxPd2pweUZnMHRBVTRFeVJBamxlVzA3?=
 =?utf-8?B?VDZrZ1FXc25ibTkxVC8vTEc3d1o0cmdLbnlNY1hSWlpGWkorSnZ3U1g2OVZx?=
 =?utf-8?B?K0dIRFlUZWhHWFBtc0djSzlDa2xhcXJFaGxDRkdxOHVxWlE5UXR6clNnRVlY?=
 =?utf-8?B?N0o3bnFYRFBtM3QvWFNZUWJXd0pwQU9BTHc3MElyYko2dkpPbllFZE4wK29Y?=
 =?utf-8?B?OGtqMFM4V25Rc0UrVnJzUnl0NDVJTE5QNkI2blJVSzlIRHByaSt3L3VldVJt?=
 =?utf-8?Q?NPWGFjFKVvwm9820OSr2aike6C0XP67HrC6ec6e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0c21fc-f40d-4908-1426-08d90405dab4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:09:04.1134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LCOWktncox3jELgWl5IjRr7f65D+6UspiDMbdMPqJ/XiBKwEvdUui2N4EzIWs1Ej1WDbXRgIk9frvcQRG0g6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v3:
 - Fix the callback to take a vcpu parameter.

Changes since v2:
 - Expand commit message.
 - Pass the domain as the callback data.
 - Remove the check in hvm_dpci_msi_eoi
---
 xen/arch/x86/hvm/vlapic.c         |  2 --
 xen/arch/x86/hvm/vmsi.c           | 35 ++++++++++++++++++-------------
 xen/drivers/passthrough/x86/hvm.c |  6 ++----
 xen/include/asm-x86/hvm/io.h      |  2 +-
 4 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 4465beaeec1..cfcbd732b16 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -503,8 +503,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(d, vector);
 
-    hvm_dpci_msi_eoi(d, vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[index].callback;
     vlapic->callbacks[index].callback = NULL;
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 13e2a190b43..03ae0dfb3c5 100644
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
+                          hvm_dpci_msi_eoi, NULL);
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 351daafdc9b..8f78c0935b9 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -796,11 +796,9 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(struct domain *d, int vector)
+void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *unused)
 {
-    if ( !is_iommu_enabled(d) ||
-         (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
-       return;
+    struct domain *d = v->domain;
 
     spin_lock(&d->event_lock);
     pt_pirq_iterate(d, _hvm_dpci_msi_eoi, (void *)(long)vector);
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 54e0161b492..7f30dfa7fea 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -142,7 +142,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
+void hvm_dpci_msi_eoi(struct vcpu *v, unsigned int vector, void *unused);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
-- 
2.30.1


