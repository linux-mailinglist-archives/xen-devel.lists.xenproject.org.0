Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D0B2F7E2B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 15:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68155.121966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q6E-0001DQ-0b; Fri, 15 Jan 2021 14:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68155.121966; Fri, 15 Jan 2021 14:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Q6D-0001Ca-RQ; Fri, 15 Jan 2021 14:29:13 +0000
Received: by outflank-mailman (input) for mailman id 68155;
 Fri, 15 Jan 2021 14:29:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Q6B-0001AY-Su
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:29:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6959a196-1a2a-4cfa-8c81-db009698e49b;
 Fri, 15 Jan 2021 14:29:10 +0000 (UTC)
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
X-Inumbo-ID: 6959a196-1a2a-4cfa-8c81-db009698e49b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610720950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GU9dL0zxqIeWWpZ5/K50XudLh3nTdJgz9dbcS5yqfwE=;
  b=MIn8A25dllMRrN7ixdMV/IkMxhBytvya401ESW3efAMo16SHYlyOp0jh
   t3FL2ObrjRG2E007N/CI04Efcc0yqEDOLdMJcKMn3WuZCIFE7JCYghYfd
   OirTFA05/v+W1B873MubqxVPEd6qNkAncdLQcyzRA+m9vjvXxghpDY9os
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SGmcXL20sqmwaljJqK9smOwOKgZubMQtc4xZk0j9WUcjIZ7h5U/KJH+M/Ox5V8jgQwB2NHwKtu
 NK9mLMO1Q5WR7Z2EbJLpSa/HPISVXYHxSXwFaCAGZ+rYQy9t8fXM/SqMJy+XoX6DKDogy0ga4R
 pgNdPGtKEL/bFC5aXjry4D0Mz5U6U07WsLthw+ZfinLjHw5vDRE4OvjIV9tc2DMywdqau1fdx/
 wvwX6YSNIhZOTO3yjb2LLeHovFoJaS8RJvG7Sqj7dxAA1SKyDZq0uHvopjuagDMn9gUlvMImNx
 ZCY=
X-SBRS: 5.2
X-MesageID: 35392910
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35392910"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgkxYW4Pz86SXB29q3ZLvpd4f7Ol50XI1y3f4fr7tQMbXyAxS1rmhMwKU5dIL3aBSakGYQ9njegJLHT0rxXwAGbpYpKJ+/Qbax/OPs7ym+ArcfDL+cJGzZJ0fxpEFE7SOQlFqIA1w9pqzrwKMU7VuH7l7LVh7bB2o8eh13LZFfMbHCVqr9GrooL1Ab3b9QRcyqK6sEvUESUMS7O5xM6GLF7eavR/sj6qQow4IHBVnLgIb4xT/P1lXKuaXFjJDrK+3Ehhd25qBDoVhqGoT8l2y8Br0i9p3+wYVrTB5vLGb6La/tU+Oaz6UCsOMxADTAJvlqBFoBLh7F7q9Of9KfoEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gb2pmxF+aMeLd7tJRs/LNeeBQ4qY8d0Asrdtw+zUKBA=;
 b=Cr70kmjG582tbpMVct/gX6HsutZuMNN2mD0HIjxzsyT0Er3Pbc04UO2xaMD6TKd6x6gtWhY1f6k6AXoroCLlQ3l08PMMWCOpaEs8yGCXiKxVJjfYbXAUACsyb93pSvcPZq8oXAJPyuuT/ZstEELwiCQusnk3+nCW3kzk/SwzRw4vqAkjPQyGM47KlBbWimFV4G/0Z+ZZfnIhPvs+FZNfmJE9vTQkB7p2E75pmWf1qhI4au4tk1pH/of3TNCxz1w2BbwUzuqlWhZTACIy0jaSg4Gy268HWtzlc+e5pAeaLD1qp1+AVAIEITsCNoCIFBxeawzQu0OOcHD7OZyLqSq+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gb2pmxF+aMeLd7tJRs/LNeeBQ4qY8d0Asrdtw+zUKBA=;
 b=KHLO+YqMYF4XG4otabAxrWwpJJSJg7fPvWYEo0b972lR31lonsBRmqV9EOyoz1Iz9fC2SOgILPz0CxDkUhBAp+/nowXxpzlysl33ySVrnJ5kzPalNNYF6lhmqUy8OG18VIU/UIC8WewTT3rCfOujHMC84nUZ8DroPD9n1OBNoJ8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] x86/vpic: issue dpci EOI for cleared pins at ICW1
Date: Fri, 15 Jan 2021 15:28:19 +0100
Message-ID: <20210115142820.35224-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115142820.35224-1-roger.pau@citrix.com>
References: <20210115142820.35224-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0029.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::17)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0fb6cd7-47a3-4c8a-ba79-08d8b961eb5b
X-MS-TrafficTypeDiagnostic: DM6PR03MB4137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4137AC5E680A5F2075B14F988FA70@DM6PR03MB4137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHCURbleg5KSPiR9Qt4unsjRVUscAAiolaIQ1bqstxNE+1DEs2d1rVpaQPe3WA6Z4KK9bMXFbuKCBmMDa4gN4YoT/4nzNlJg09XsEigWQFNq+oGFuutt4YZvau4jstZbXeNKHNsoDIoGDGYpzONTYA1fEzfuqjQ4XJvk/1692XWetT+YLXLoipXqrgz1u1Wdn+u6WKUOgh+LueKcEXU31RS2C1q+o74lkNplJz5Uu5KAECKUruH1ftcx1aGjH/9bqpjGlS3r51TMzWsyVGylaMEgoWvOiPaR+dbBiOxb42GMHF545WCf8mdeIhuKxVMDDdvwgSToxvtX47GxbU2Xe15BGERXEzia/u0OR80HSpxai8ypUcDdhAcprxoGQZWXB5TyPKYCA9wjYxL7yUgViA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(83380400001)(66476007)(66556008)(2906002)(2616005)(6666004)(54906003)(6496006)(956004)(8936002)(316002)(66946007)(36756003)(6486002)(186003)(4326008)(478600001)(5660300002)(86362001)(6916009)(8676002)(26005)(16526019)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TzVxYnZjUWRhbkVnK3ZMM21OOE9zcCs3SGVSaG1odEh4ZGJhVGNZWVZ2OFJq?=
 =?utf-8?B?dTlVZEFUOFJ5NHVkVEtiM0tvR3JKNGFwZFdjZ1prYkJncTFscGoxOHhsMm9u?=
 =?utf-8?B?UWZtS25ZWE14ZU9VNDBHSjJsclRiMkJTbHp6elluYjd4K2FyTU0vQURBN2xn?=
 =?utf-8?B?Zm1sNzY2cDdEUTU3UnR1UUNyZjhnT0c3L2VKOFIydWl1Q0hoSTF1RWFQaUJN?=
 =?utf-8?B?UDQ3TGVTZmVRMVIzMmVYQm8vbWdvdVB4Y1REVW1jR1NPR2ZiYUE5ZThDbFU3?=
 =?utf-8?B?cU1BMyt3ZlJvT1owcDE0QTJPdmlua0VBbmtza0xibm90K3cvYVNLeWFiMlhX?=
 =?utf-8?B?R3BYVXVPQWpXaEY5b3RlYXJhZFdWclQxaGR4czFzWWhzUk81elFQMXBHVmRV?=
 =?utf-8?B?ajdKN1kzd2RhRG8xNEJLbDZvNXN2dWpCT1dwL3FDc2E3VTdRWVJmZHB4RWFh?=
 =?utf-8?B?ZVpGL0NRak1yZTM1YnVsU0RTZWZiVUdnYklpNGF5bFBRWWZNWElzUy93RE9G?=
 =?utf-8?B?b2xQaFZxSVlyUis2OWtpd1B5WFJYWCtJVU9SUGFPbEJrOVdhNjNLdEZUUmw4?=
 =?utf-8?B?dkxNM1J6dFhMZXNTWlFJVHRlYnNPMkdaY0VtNXBwSklTVHlWTHhmZWlRTGQy?=
 =?utf-8?B?ZzEreURLRzlHQno0MUY0QjRPRStNd2kwbkJRc1JOa3ZsNjR3eWwzbEZab1E0?=
 =?utf-8?B?ZnJwazl6UFY1WGFwZkl6ZkZDZUtjVzFwWWlIQUVkMm1xRWRqMzFINldZdGEv?=
 =?utf-8?B?dzhEejBxandyZWJPYTNaaEgvNHdITzZCWGpwb24rcHk0dFducnBNYVExdzdl?=
 =?utf-8?B?dDFRQ2FjY0xKaUVVTUtpaGRrN0VWa2Rta2gxbzhFTHZDODByR2ZDQU1YV0tD?=
 =?utf-8?B?Z1pRb3VQUllBM2VtTEJOQ1lNS2l1U29mSUYrN1NTeW13VExGMWVpTmhrc3Jh?=
 =?utf-8?B?WjJaNlJ4SitMNmlxbjVMZWVtUWpzbTB3QndodjZNTFBKSEhFYmFzZTgxb3Vl?=
 =?utf-8?B?U1k4bXZYVTRkeXFhV0RFRi9tc0pjZHgraU9RclhWWlc4am1va3lNM1RIdk1m?=
 =?utf-8?B?N3J0d1lDR1o4TnJZaFdMVW5QZ0pUT0Y4bHNzcGMxYit5OGRwNWVNZXVCdHY4?=
 =?utf-8?B?WlRVOEt2eFhSaEc4VDVRMjVLS3NrRTI3b3ErS3ZsRTdUZi9ZN1VBY2JvS2ls?=
 =?utf-8?B?ZUdoUnozWUJ5OHhkMnJHOUl1QjhwZzhOUWVxWkt6MlNXVEtaUys1d3JGNUJL?=
 =?utf-8?B?TUk4UTZHZCtEUEJnM2NNQU10dGhTTzhpUDA1dWxpVmk0R2hBalI3RlUrVTUz?=
 =?utf-8?Q?rqsZndfiHesd0tzoqqubdgAl0pQ2JAj/ZJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fb6cd7-47a3-4c8a-ba79-08d8b961eb5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:29:08.6669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIY7d7vr4ZXOR6+BQsuOXVGb3zNRi/kAceoODDubUFFgSawWaX0GLdrcQPRoF0CWiKjS4O1v6PjWT14KZfKAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4137
X-OriginatorOrg: citrix.com

When pins are cleared from either ISR or IRR as part of the
initialization sequence forward the clearing of those pins to the dpci
EOI handler, as it is equivalent to an EOI. Not doing so can bring the
interrupt controller state out of sync with the dpci handling logic,
that expects a notification when a pin has been EOI'ed.

Fixes: 7b3cb5e5416 ('IRQ injection changes for HVM PCI passthru.')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpic.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index c1c1de7fd0..522cacdc4b 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -193,6 +193,8 @@ static void vpic_ioport_write(
     {
         if ( val & 0x10 )
         {
+            unsigned int pending = vpic->isr | (vpic->irr & ~vpic->elcr);
+
             /* ICW1 */
             /* Clear edge-sensing logic. */
             vpic->irr &= vpic->elcr;
@@ -217,6 +219,24 @@ static void vpic_ioport_write(
             }
 
             vpic->init_state = ((val & 3) << 2) | 1;
+            vpic_update_int_output(vpic);
+            vpic_unlock(vpic);
+
+            /*
+             * Forward the EOI of any pending or in service interrupt that has
+             * been cleared from IRR or ISR, or else the dpci logic will get
+             * out of sync with the state of the interrupt controller.
+             */
+            while ( pending )
+            {
+                unsigned int pin = __scanbit(pending, 8);
+
+                ASSERT(pin < 8);
+                hvm_dpci_eoi(current->domain,
+                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
+                __clear_bit(pin, &pending);
+            }
+            goto unmask;
         }
         else if ( val & 0x08 )
         {
@@ -306,6 +326,7 @@ static void vpic_ioport_write(
 
     vpic_unlock(vpic);
 
+ unmask:
     if ( unmasked )
         pt_may_unmask_irq(vpic_domain(vpic), NULL);
 }
-- 
2.29.2


