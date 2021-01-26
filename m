Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13C3303F29
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75053.135043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofh-0002VC-1q; Tue, 26 Jan 2021 13:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75053.135043; Tue, 26 Jan 2021 13:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Ofg-0002Uf-To; Tue, 26 Jan 2021 13:46:16 +0000
Received: by outflank-mailman (input) for mailman id 75053;
 Tue, 26 Jan 2021 13:46:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nQkR=G5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l4Off-0002U9-WB
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:46:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3728ddff-a5b7-48ac-b4cc-c9cd671554d5;
 Tue, 26 Jan 2021 13:46:14 +0000 (UTC)
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
X-Inumbo-ID: 3728ddff-a5b7-48ac-b4cc-c9cd671554d5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611668774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=DWdcVR3IEqSnim3KsQpgClr5n6aBknLfX/6inMwx9SE=;
  b=VAPQ99xR5OdB1g9s5AA2R78kCoUVYkBiFysMpbCtKcE6mLqBGMRKM8YX
   7QWUOrOocbxNvykxBmpWa/1ItJmxEW2V1Lxi70d4pmIM+D3rVbv0ZbwqF
   9132bEiCUa22X/cpSXGyydO2kbwVSOfajzWKoLuxMsG3E92njaugEJ9/R
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1I1o0MRHHmIo27T7CpFCM+kxvb78QkbOvVEv0KemKdjD9Wn7Gb1CIegeGvVNoHiyx62POk+w31
 FvZP/TDjU57yAT26Ub6bYm17yadl8z4oS7sVYCAZAZA+gS/0PGaWzkj0Cl3s/d7km6KMiW/kf8
 Sm9DikMw6oiWy1Mhn8uIhdbkJT7+xZVwFII+1SPJVUx1T06VL4SHuG2Qq0nR628fWWqPlYgYsu
 XvHErenOspk0fyYJ8hWqfyvYJCziX8NyPuDC8KjVw7qFmxeVlaF2uPhNUNQSyX9S9zFgZWOTnU
 uYI=
X-SBRS: 5.2
X-MesageID: 36241608
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="36241608"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Alt0/j4ju1hiCWivRDHqubxRIHiItxRG4vPt1wwwflZ5oOse6UnaosA3YGQfRvJaEOvi+3NmUMfjrA/uxvYzLTZl19TAreEqbeQ6RCrWgxd1VNBoJQWwWjDr/cVYldRi6JivmaPnI6HiyS9bsqCJq/5cOX5z7zm0xMP5ZR3ZcDVfQgnI2jA+qQ53r102qtf+9QK8h3gGngzdpYrbXWkzwEBHuVrt9V2tqZDAfovvDT1Eh0PwPTYI5uGtnW/gb6lUl2xW5SUTS5xhtAZnhMm85om9DrhSwsvYinsbIVOmc0PZbjCrwvRLL3Vk9j1V0Q3eEsQXPsq3mBiM4VNvnWREMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nf2vo0SRD3R2LaShoNNJNHs097bPQ8mcbsO7gxjiRM=;
 b=UALr/fRrhEec5S8nu7t08noFFXKDh7LN20g1hhlT7eXbhW0Fo7hg2gO4hFJd6hTNZRmYKvNOZbcMbYt/5nyJ+FwrSoJ5fF9L6SfhCPX/s4y4VQYRr9N8sTMHwvu/+2N4Nr3YMVHm1boDEGwd+ecsajgNkP+UP8V+jInvs4H5E45prVMOdM1WVs9spbYiDslceKUsAYnXh2+IK9aaqGpxgWJaX+/ZTgfI/yOtO/oOiLr08eeCB9KIC7bRQClNMnwT0czAouSRHjQUmUDw7n3BfiMMlhJBCM6gnYeY5ryRSIo3AuL0OQu5gv3njCpSuWpvQPYfunXHINCStSdl48TzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nf2vo0SRD3R2LaShoNNJNHs097bPQ8mcbsO7gxjiRM=;
 b=uTEgOrJ1j/SKIhjkpFpdH806fwAUaxgyfB9vYBj//TlTqYF+Ys/ZYnGgowHswnVoXr0BPtKQgGTVgTvJJNmcv+dQoAA26mdORTfTNpZO5dK3SRlGfvlJ9b00mld9bMaOFbQywJoNAOij0wHARjFhNCJ7jFgIXOFCU4mdhPUHDtE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/6] x86/vioapic: issue EOI to dpci when switching pin to edge trigger mode
Date: Tue, 26 Jan 2021 14:45:17 +0100
Message-ID: <20210126134521.25784-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126134521.25784-1-roger.pau@citrix.com>
References: <20210126134521.25784-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::18)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cd27306-c1dd-46b9-910e-08d8c200be46
X-MS-TrafficTypeDiagnostic: DM5PR03MB3209:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3209AAD15CE790B3A96858668FBC9@DM5PR03MB3209.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfT3nLDghJ6O7C0AWUcZQECsPXTlSzSty0N1t1/NgYKFi0A0m6nRETK5XSANepLAu1xiTJDHlOqqxv65JSDmbagKUCz71jy7Bq8j0hUK3qc7ZtZCmZ5gIEysgEUyS7EyJ4tLS/gDSXa+9qthUkJYr9Xa8vtbVQtOAzbgO9dtdyYxnJOBPnXHvxfnSL9o91n4iHrMwjhjzHDuHpIKBn/TRWJ6OzanIqpmE6GgNpD9m7pupI/PssguVrPW3jrDFqu+gYdJotvd/JfiflVdGNIoQMaynKyiqKhq8R6lfTSJ8ESA/VJlIhb/UGyDlE0Ec2lFOTtWZ7vChp+Ufjx0VFRyfSwG0QMdWW7shkgd5h/RPWhqL1IWbloxe2CD1EIb5FM9N/h/5eZ0latiwpVUhss23esuSv0fUX60eM0zggSvTKquN9K80/wXtop5r1t2TENQvMMYNFjgKP9fGiyTPIjKWZFQ81LpHza5CLVuw9bu9Enl+OvDaKTHKsOrjpBYcuR9euNyMngrxwGQ7wTFPWOEvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(6916009)(66946007)(8936002)(956004)(86362001)(36756003)(478600001)(2616005)(8676002)(83380400001)(4326008)(6486002)(186003)(6496006)(54906003)(16526019)(2906002)(1076003)(5660300002)(66476007)(316002)(26005)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TjZOeTh0S0kwZkZTQUwzL1E5MDIxa2pEcDFXWU92S0V1a2RLVVluRUZ4YWxO?=
 =?utf-8?B?Mm1VSVkxUHdoc25sSytrNkZnZ1RGMU5YM2V1RTNCWHRSNDlMK3N5SWxqMnVX?=
 =?utf-8?B?M2IwaEhrM2FCS21SMG1MTmNFSzVYL0NDQXpqaFpHdGphTG9DSktiRkpmMWs2?=
 =?utf-8?B?UDlJbVlmREluTGY2L2IvSkFUWjRxUHE3OGhNdnhYTzIrSlEyS0NUdHAyWlRW?=
 =?utf-8?B?RWF6OGRodXEyWWlGL2lSQXNYTTBGRHJtQzFVbk00SHhyK050VnNHb2cxaUJl?=
 =?utf-8?B?VmtPdlp1dEsydXZpZW9RUnVZdVE3Wis0RktCNC9IYnBKcTdaNlMxQjA3ZGFP?=
 =?utf-8?B?akl4VlloSXAwMXZMV2RMSzBYcGQyVCtZZ3JSbmtvbmNCUTFJd01Db2w0a1cz?=
 =?utf-8?B?WGZzMjVUZTRsUit0bDhpNTBkQ2RMZ0N5YmFMZGE1TGF0YitNb0QwNTdnS1BK?=
 =?utf-8?B?Q2lpQ2w0Y0xmWm16ZmdSY3hUVXd5MExxdndMV3E1NmJtSXExWDJDSm1Pdll6?=
 =?utf-8?B?Q1FyUG40bFlRcE1LT3JsN0d5MlpmallJQkxtRmtGVk1wNlJwTnQraVdYMlZa?=
 =?utf-8?B?N2xpWVYxZ3FMV3hUOWdRRlpETXBhdkM4ZksrTktWcVlMaG4wUWRZZTMwZEdC?=
 =?utf-8?B?R1lVSjZYV2xabzI5ZitHU3o1b3lDQ0k5Szh0ZXlkNHllUmduajdUWkdZVEdV?=
 =?utf-8?B?NnJwcU1VVnRRRUp2ZVE5dXNSTnkxcXZuMXRhNngzRDZUTEpTYlNRY2M4Zk0y?=
 =?utf-8?B?MnRlREFRenZWYnFuQkgxeDJPWk80QTZBZlk2emd0Q3JwY0U2U0d1L1o1S3FI?=
 =?utf-8?B?ZGFNVHZZYm5kMER4VmRvek1HcVByRmhaSWRZWDI1WklKS1F4d3dIQ3d6bEND?=
 =?utf-8?B?V1pOSEdFOGdrekFWODhLLzNIQnVRNEJhdDdiOVR0eERmWkRXMDU4eC9vLytS?=
 =?utf-8?B?OGdiOW80MlQzbXNMZ01rWGtjclNxclhmdjVQK09zNk1pMHZQRFNJVklrWGw5?=
 =?utf-8?B?c3pURlZqend2N2ozM1ZSeERwK3NxblJrd2FwUDdaTGVPaFFNY1kzWXgxVmlN?=
 =?utf-8?B?QTA4aFFZMjVnWC9PSXJMbm1lK1YxTStDdkp1U1JzY2YxUnhtRW13MUZQb2tJ?=
 =?utf-8?B?V0dETWFNWlFHZTlLUUhWdG1TVHdjR1BORTdPSnU4R05NeSs4SGZUSU9NN053?=
 =?utf-8?B?cDk0WWJHMk5XcmpJS0FYV2RkOTU5ejhGeTh6WlpJeWtSWFgyOXdsMGRBa0hP?=
 =?utf-8?B?blFmaHR0emRVazNCMVBUVW9QNXA0QmJJa3VvOTFLK2pVcWUrRk5jbmh6NU1I?=
 =?utf-8?B?U1I5ZndwbFBXcSsrd0pwRVdvYm1QYkFQQ3RVeWZlNkd5WnV2TzdWTkNyUWVT?=
 =?utf-8?B?am82YVpORVRNR2F3eGZpejhqZ3VsMERpdjQ1dm1MbjNSYjVTQ0NBSWo4cGY2?=
 =?utf-8?B?eXpTSVJzclJoQ2ljZkhGb1JRcGovZEFUNlg0aWNRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd27306-c1dd-46b9-910e-08d8c200be46
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 13:46:12.3418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgYe4HVf0M0EbsIy56IVdhzvUWgZBkz6dg+ylGMDr4iMontBmLQCiMnQRvl0Cow1NIlxbRJ5QIde8w3YUXHroA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3209
X-OriginatorOrg: citrix.com

When an IO-APIC pin is switched from level to edge trigger mode the
IRR bit is cleared, so it can be used as a way to EOI an interrupt at
the IO-APIC level.

Such EOI however does not get forwarded to the dpci code like it's
done for the local APIC initiated EOI. This change adds the code in
order to notify dpci of such EOI, so that dpci and the interrupt
controller are in sync.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Fix comment message missing 'edge'.
 - Add asserts that previous triggering mode was level and it's not a
   top word write.
---
 xen/arch/x86/hvm/vioapic.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index e3ee747b7d..87370dd417 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -219,6 +219,7 @@ static void vioapic_write_redirent(
     struct domain *d = vioapic_domain(vioapic);
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     union vioapic_redir_entry *pent, ent;
+    bool prev_level;
     int unmasked = 0;
     unsigned int gsi;
 
@@ -234,6 +235,7 @@ static void vioapic_write_redirent(
 
     pent = &vioapic->redirtbl[idx];
     ent  = *pent;
+    prev_level = ent.fields.trig_mode == VIOAPIC_LEVEL_TRIG;
 
     if ( top_word )
     {
@@ -270,6 +272,21 @@ static void vioapic_write_redirent(
 
     spin_unlock(&d->arch.hvm.irq_lock);
 
+    if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG &&
+         ent.fields.remote_irr && is_iommu_enabled(d) )
+    {
+            /*
+             * Since IRR has been cleared and further interrupts can be
+             * injected also attempt to deassert any virtual line of passed
+             * through devices using this pin. Switching a pin from level to
+             * edge trigger mode can be used as a way to EOI an interrupt at
+             * the IO-APIC level.
+             */
+            ASSERT(prev_level);
+            ASSERT(!top_word);
+            hvm_dpci_eoi(d, gsi);
+    }
+
     if ( is_hardware_domain(d) && unmasked )
     {
         /*
-- 
2.29.2


