Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOCFD9E8tGk/jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671C2871F3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253919.1549963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tp-0000at-UL; Fri, 13 Mar 2026 16:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253919.1549963; Fri, 13 Mar 2026 16:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tp-0000TO-GJ; Fri, 13 Mar 2026 16:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1253919;
 Fri, 13 Mar 2026 16:35:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=poTc=BN=bounce.vates.tech=bounce-md_30504962.69b43cb9.v1-27f9226dc476489280796f4f05794d27@srs-se1.protection.inumbo.net>)
 id 1w15Tm-0006Ek-Nl
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:14 +0000
Received: from mail179-36.suw41.mandrillapp.com
 (mail179-36.suw41.mandrillapp.com [198.2.179.36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98d2f523-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:08 +0100 (CET)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-36.suw41.mandrillapp.com (Mailchimp) with ESMTP id 4fXVT53gDVzlfjbT
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 27f9226dc476489280796f4f05794d27; Fri, 13 Mar 2026 16:35:05 +0000
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
X-Inumbo-ID: 98d2f523-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419705; x=1773689705;
	bh=peVzH/RSknOHNSKTQdaYXevRTD3ymuxiEuHEUoR9BgM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E4iTtJ8OJ+U52Jcmqe6F4/4D2tExf3Njg8tyNOGH/opfEnDxh4V3DdqBHFlkE2BkT
	 LNYjx8uVG2RpsNDlUdo6RktLw3fuNAZlP7nkOPh2vnMIJFJo3BoLlkI271XT+iovI4
	 oCP8cbVbTTVMNS68tAfUPjPjkZh8/3NWoJj+bGnfGOsrBnXalIyP7RucDl18QeCpf6
	 JQ5dMlNeIVaxbWXBrK5Dqjl/8xEfXab206rcNjXzuv82YpKAFBgkktTNEAdB+KAq9V
	 KLLpSnwv+mMAFWIAyjV0J7lRFp0KidcGh0+B/F1mLIM0HBp94ZoSNzDBizIQNOZdLT
	 zpD/7qWCutmZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419705; x=1773680205; i=thierry.escande@vates.tech;
	bh=peVzH/RSknOHNSKTQdaYXevRTD3ymuxiEuHEUoR9BgM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IAG8VVPYvK2e73qkhrFw4a55QbxAeF4tgwa1P3vkuEuENpJbMTUKozO2PM2rHpPWe
	 NtNq6i8c/u1K4AvnIrMwYrlM5IeZCfkw+I5plnttlBYUfwPzs9UJ5/vonOUBG9/Hbn
	 84tP8B+6d/sz7oPhyTK1yR0cypIQ8M4pfuKl719qIhIEuQAIihJlB6IDMQI5pTte8q
	 ayILS8tgVK9exOEJ9E5vc0m2vqOeVHSDpkjaTp2uBzankU3oqKN9smZ+yS17x0cNcX
	 Pyl6zjDo8lB1hwBs4wtKmPHaoTItPAP55A/gMmQMAccVlyxVPHCeHud6AgBG09O6zS
	 JFF3QHCCPpK5w==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2004/17]=20hvmloader:=20add=20ACPI=20enabling=20for=20Q35?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419701560
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-5-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.27f9226dc476489280796f4f05794d27?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,citrix.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.116];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3671C2871F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to turn on ACPI for OS, we need to write a chipset-specific value
to SMI_CMD register (sort of imitation of the APM->ACPI switch on real
systems). Modify acpi_enable_sci() function to support both i440 and Q35
emulation.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/hvmloader.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index 626cc53649..f6cc3fa4b9 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -258,9 +258,24 @@ static const struct bios_config *detect_bios(void)
 static void acpi_enable_sci(void)
 {
     uint8_t pm1a_cnt_val;
+    uint8_t acpi_enable_val;
 
-#define PIIX4_SMI_CMD_IOPORT 0xb2
+#define SMI_CMD_IOPORT       0xb2
 #define PIIX4_ACPI_ENABLE    0xf1
+#define ICH9_ACPI_ENABLE     0x02
+
+    switch ( machine_type )
+    {
+    case MACHINE_TYPE_Q35:
+        acpi_enable_val = ICH9_ACPI_ENABLE;
+        break;
+    case MACHINE_TYPE_I440:
+        acpi_enable_val = PIIX4_ACPI_ENABLE;
+        break;
+    default:
+        /* Not likely to happen */
+        BUG();
+    }
 
     /*
      * PIIX4 emulation in QEMU has SCI_EN=0 by default. We have no legacy
@@ -268,7 +283,7 @@ static void acpi_enable_sci(void)
      */
     pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     if ( !(pm1a_cnt_val & ACPI_PM1C_SCI_EN) )
-        outb(PIIX4_SMI_CMD_IOPORT, PIIX4_ACPI_ENABLE);
+        outb(SMI_CMD_IOPORT, acpi_enable_val);
 
     pm1a_cnt_val = inb(ACPI_PM1A_CNT_BLK_ADDRESS_V1);
     BUG_ON(!(pm1a_cnt_val & ACPI_PM1C_SCI_EN));
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


