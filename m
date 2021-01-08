Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135B2EF353
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 14:44:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63443.112649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs3x-00007f-EM; Fri, 08 Jan 2021 13:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63443.112649; Fri, 08 Jan 2021 13:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs3x-00007C-Ac; Fri, 08 Jan 2021 13:44:21 +0000
Received: by outflank-mailman (input) for mailman id 63443;
 Fri, 08 Jan 2021 13:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxs3v-000070-I6
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:44:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f5fbeba-269b-4ff5-a886-b002cad1461e;
 Fri, 08 Jan 2021 13:44:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 18150AD18;
 Fri,  8 Jan 2021 13:44:17 +0000 (UTC)
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
X-Inumbo-ID: 4f5fbeba-269b-4ff5-a886-b002cad1461e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610113457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=chrTV7r3JBqLRtbyF3C4gEimsBdtIdjuEhhRcOa9pYc=;
	b=T4CKjAr3DVsufDhUAAheIUxBogWx1UGZWnpODGh5tXXQPMkkMp4Fkz5EXAayx58t/vSPV/
	rAAwhdMGVIZ1iXXZMidaVUZcHgWgAEugF/H84G3y7dwxncXpbfG06e4NKrpXh9Vxv6kPcl
	vG3JUjwZFct0nVKtdRgSHEj0emPAoGY=
Subject: [PATCH 3/4] ACPI: replace casts by container_of()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Message-ID: <4e7f9c14-74c9-b7cc-b788-86cbb7404a58@suse.com>
Date: Fri, 8 Jan 2021 14:44:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The latter is slightly more type-safe. Also add const where possible,
including without need to touch further code. Additionally replace an
adjacent unnecessary use of u16.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Intentionally not paying attention to line length in acpi/tables.c, as
adjacent code violates the limit already quite heavily.

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -63,9 +63,8 @@ static u64 acpi_lapic_addr __initdata =
 
 static int __init acpi_parse_madt(struct acpi_table_header *table)
 {
-	struct acpi_table_madt *madt;
-
-	madt = (struct acpi_table_madt *)table;
+	struct acpi_table_madt *madt =
+		container_of(table, struct acpi_table_madt, header);
 
 	if (madt->address) {
 		acpi_lapic_addr = (u64) madt->address;
@@ -277,7 +276,8 @@ acpi_parse_nmi_src(struct acpi_subtable_
 
 static int __init acpi_parse_hpet(struct acpi_table_header *table)
 {
-	struct acpi_table_hpet *hpet_tbl = (struct acpi_table_hpet *)table;
+	const struct acpi_table_hpet *hpet_tbl =
+		container_of(table, const struct acpi_table_hpet, header);
 
 	if (hpet_tbl->address.space_id != ACPI_ADR_SPACE_SYSTEM_MEMORY) {
 		printk(KERN_WARNING PREFIX "HPET timers must be located in "
@@ -471,7 +471,8 @@ acpi_fadt_parse_sleep_info(const struct
 
 static int __init acpi_parse_fadt(struct acpi_table_header *table)
 {
-	struct acpi_table_fadt *fadt = (struct acpi_table_fadt *)table;
+	const struct acpi_table_fadt *fadt =
+		container_of(table, const struct acpi_table_fadt, header);
 
 #ifdef	CONFIG_ACPI_INTERPRETER
 	/* initialize sci_int early for INT_SRC_OVR MADT parsing */
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -55,8 +55,9 @@ void __init acpi_table_print_madt_entry(
 	case ACPI_MADT_TYPE_LOCAL_APIC:
 		if (acpi_verbose)
 		{
-			struct acpi_madt_local_apic *p =
-			    (struct acpi_madt_local_apic *)header;
+			const struct acpi_madt_local_apic *p =
+			    container_of(header, const struct acpi_madt_local_apic, header);
+
 			printk(KERN_INFO PREFIX
 			       "LAPIC (acpi_id[0x%02x] lapic_id[0x%02x] %s)\n",
 			       p->processor_id, p->id,
@@ -67,8 +68,9 @@ void __init acpi_table_print_madt_entry(
 	case ACPI_MADT_TYPE_LOCAL_X2APIC:
 		if (acpi_verbose)
 		{
-			struct acpi_madt_local_x2apic *p =
-			    (struct acpi_madt_local_x2apic *)header;
+			const struct acpi_madt_local_x2apic *p =
+			    container_of(header, const struct acpi_madt_local_x2apic, header);
+
 			printk(KERN_INFO PREFIX
 			       "X2APIC (apic_id[0x%02x] uid[0x%02x] %s)\n",
 			       p->local_apic_id, p->uid,
@@ -79,8 +81,9 @@ void __init acpi_table_print_madt_entry(
 
 	case ACPI_MADT_TYPE_IO_APIC:
 		{
-			struct acpi_madt_io_apic *p =
-			    (struct acpi_madt_io_apic *)header;
+			const struct acpi_madt_io_apic *p =
+			    container_of(header, const struct acpi_madt_io_apic, header);
+
 			printk(KERN_INFO PREFIX
 			       "IOAPIC (id[0x%02x] address[0x%08x] gsi_base[%d])\n",
 			       p->id, p->address, p->global_irq_base);
@@ -89,8 +92,9 @@ void __init acpi_table_print_madt_entry(
 
 	case ACPI_MADT_TYPE_INTERRUPT_OVERRIDE:
 		{
-			struct acpi_madt_interrupt_override *p =
-			    (struct acpi_madt_interrupt_override *)header;
+			const struct acpi_madt_interrupt_override *p =
+			    container_of(header, const struct acpi_madt_interrupt_override, header);
+
 			printk(KERN_INFO PREFIX
 			       "INT_SRC_OVR (bus %d bus_irq %d global_irq %d %s %s)\n",
 			       p->bus, p->source_irq, p->global_irq,
@@ -108,8 +112,9 @@ void __init acpi_table_print_madt_entry(
 
 	case ACPI_MADT_TYPE_NMI_SOURCE:
 		{
-			struct acpi_madt_nmi_source *p =
-			    (struct acpi_madt_nmi_source *)header;
+			const struct acpi_madt_nmi_source *p =
+			    container_of(header, const struct acpi_madt_nmi_source, header);
+
 			printk(KERN_INFO PREFIX
 			       "NMI_SRC (%s %s global_irq %d)\n",
 			       mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],
@@ -121,8 +126,9 @@ void __init acpi_table_print_madt_entry(
 	case ACPI_MADT_TYPE_LOCAL_APIC_NMI:
 		if (acpi_verbose)
 		{
-			struct acpi_madt_local_apic_nmi *p =
-			    (struct acpi_madt_local_apic_nmi *)header;
+			const struct acpi_madt_local_apic_nmi *p =
+			    container_of(header, const struct acpi_madt_local_apic_nmi, header);
+
 			printk(KERN_INFO PREFIX
 			       "LAPIC_NMI (acpi_id[0x%02x] %s %s lint[%#x])\n",
 			       p->processor_id,
@@ -135,12 +141,10 @@ void __init acpi_table_print_madt_entry(
 	case ACPI_MADT_TYPE_LOCAL_X2APIC_NMI:
 		if (acpi_verbose)
 		{
-			u16 polarity, trigger;
-			struct acpi_madt_local_x2apic_nmi *p =
-			    (struct acpi_madt_local_x2apic_nmi *)header;
-
-			polarity = p->inti_flags & ACPI_MADT_POLARITY_MASK;
-			trigger = (p->inti_flags & ACPI_MADT_TRIGGER_MASK) >> 2;
+			const struct acpi_madt_local_x2apic_nmi *p =
+			    container_of(header, const struct acpi_madt_local_x2apic_nmi, header);
+			unsigned int polarity = MASK_EXTR(p->inti_flags, ACPI_MADT_POLARITY_MASK);
+			unsigned int trigger = MASK_EXTR(p->inti_flags, ACPI_MADT_TRIGGER_MASK);
 
 			printk(KERN_INFO PREFIX
 			       "X2APIC_NMI (uid[0x%02x] %s %s lint[%#x])\n",
@@ -153,8 +157,9 @@ void __init acpi_table_print_madt_entry(
 
 	case ACPI_MADT_TYPE_LOCAL_APIC_OVERRIDE:
 		{
-			struct acpi_madt_local_apic_override *p =
-			    (struct acpi_madt_local_apic_override *)header;
+			const struct acpi_madt_local_apic_override *p =
+			    container_of(header, const struct acpi_madt_local_apic_override, header);
+
 			printk(KERN_INFO PREFIX
 			       "LAPIC_ADDR_OVR (address[%p])\n",
 			       (void *)(unsigned long)p->address);
@@ -163,8 +168,9 @@ void __init acpi_table_print_madt_entry(
 
 	case ACPI_MADT_TYPE_IO_SAPIC:
 		{
-			struct acpi_madt_io_sapic *p =
-			    (struct acpi_madt_io_sapic *)header;
+			const struct acpi_madt_io_sapic *p =
+			    container_of(header, const struct acpi_madt_io_sapic, header);
+
 			printk(KERN_INFO PREFIX
 			       "IOSAPIC (id[%#x] address[%p] gsi_base[%d])\n",
 			       p->id, (void *)(unsigned long)p->address,
@@ -175,8 +181,9 @@ void __init acpi_table_print_madt_entry(
 	case ACPI_MADT_TYPE_LOCAL_SAPIC:
 		if (acpi_verbose)
 		{
-			struct acpi_madt_local_sapic *p =
-			    (struct acpi_madt_local_sapic *)header;
+			const struct acpi_madt_local_sapic *p =
+			    container_of(header, const struct acpi_madt_local_sapic, header);
+
 			printk(KERN_INFO PREFIX
 			       "LSAPIC (acpi_id[0x%02x] lsapic_id[0x%02x] lsapic_eid[0x%02x] %s)\n",
 			       p->processor_id, p->id, p->eid,
@@ -186,8 +193,9 @@ void __init acpi_table_print_madt_entry(
 
 	case ACPI_MADT_TYPE_INTERRUPT_SOURCE:
 		{
-			struct acpi_madt_interrupt_source *p =
-			    (struct acpi_madt_interrupt_source *)header;
+			const struct acpi_madt_interrupt_source *p =
+			    container_of(header, const struct acpi_madt_interrupt_source, header);
+
 			printk(KERN_INFO PREFIX
 			       "PLAT_INT_SRC (%s %s type[%#x] id[0x%04x] eid[%#x] iosapic_vector[%#x] global_irq[%#x]\n",
 			       mps_inti_flags_polarity[p->inti_flags & ACPI_MADT_POLARITY_MASK],


