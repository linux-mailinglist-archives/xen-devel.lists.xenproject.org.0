Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ECC2EF349
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 14:43:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63437.112625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs3G-0008Np-SY; Fri, 08 Jan 2021 13:43:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63437.112625; Fri, 08 Jan 2021 13:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs3G-0008NQ-PN; Fri, 08 Jan 2021 13:43:38 +0000
Received: by outflank-mailman (input) for mailman id 63437;
 Fri, 08 Jan 2021 13:43:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxs3F-0008NL-05
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:43:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74bde652-d674-4ea0-af3a-cf9ed572f704;
 Fri, 08 Jan 2021 13:43:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E922ACAF;
 Fri,  8 Jan 2021 13:43:35 +0000 (UTC)
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
X-Inumbo-ID: 74bde652-d674-4ea0-af3a-cf9ed572f704
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610113415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPdDWl3VCjV69DiBf2Wsbox4q7gJTV0XZaT8VVVC3yE=;
	b=sdfpvHAWtkyDC7TR+XfqdZgJmLrLW9ChKz3HxLz9WE/H/O/RgCllhzPaWcru3RCUO4REk7
	eyED5VC8x1DsRVkG17Y86LxxxryXP9juK5EY/Om0oMfZYLRhRRpbr4E72gSFXCtruSi3F1
	5zwhgdDhdFaI/GXoRmHxzo/4kr0Qib0=
Subject: [PATCH 1/4] ACPI: reduce verbosity by default
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Message-ID: <31c8b569-a10e-6cbb-ce12-c6d8571d7d8f@suse.com>
Date: Fri, 8 Jan 2021 14:43:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While they're KERN_INFO messages and hence not visible by default, we
still have had reports that the amount of output is too large, not the
least because
- the command line controlled resizing of the console ring buffer
  happens only after SRAT parsing (which may alone produce more than 16k
  of output),
- the default resizing of the console ring buffer happens only after
  ACPI table parsing, since the default size gets calculated depending
  on the number or processors found.

Gate all per-processor logging behind a new "acpi=verbose", making sure
we wouldn't unintentionally pass this on to Dom0.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative might be to make the SRAT logging more compact.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -75,13 +75,10 @@ of Boolean and String.  These are noted
 ## Parameter details
 
 ### acpi
-> `= force | ht | noirq | <boolean>`
+> `= force | ht | noirq | <boolean> | verbose`
 
 **String**, or **Boolean** to disable.
 
-The **acpi** option is used to control a set of four related boolean
-flags; `acpi_force`, `acpi_ht`, `acpi_noirq` and `acpi_disabled`.
-
 By default, Xen will scan the DMI data and blacklist certain systems
 which are known to have broken ACPI setups.  Providing `acpi=force`
 will cause Xen to ignore the blacklist and attempt to use all ACPI
@@ -97,12 +94,15 @@ which requires this option to function s
 Additionally, this will not prevent Xen from finding IO-APIC entries
 from the MP tables.
 
-Finally, any of the boolean false options can be used to disable ACPI
+Further, any of the boolean false options can be used to disable ACPI
 usage entirely.
 
 Because responsibility for ACPI processing is shared between Xen and
 the domain 0 kernel this option is automatically propagated to the
-domain 0 command line
+domain 0 command line.
+
+Finally, `acpi=verbose` will enable per-processor information logging
+which may otherwise be too noisy in particular on large systems.
 
 ### acpi_apic_instance
 > `= <integer>`
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -78,6 +78,7 @@ unsigned long __read_mostly cr4_pv32_mas
 /* "acpi=force":  Override the disable blacklist.                   */
 /* "acpi=ht":     Limit ACPI just to boot-time to enable HT.        */
 /* "acpi=noirq":  Disables ACPI interrupt routing.                  */
+/* "acpi=verbose": Enables more verbose ACPI boot time logging.     */
 static int parse_acpi_param(const char *s);
 custom_param("acpi", parse_acpi_param);
 
@@ -216,9 +217,6 @@ static char __initdata acpi_param[10] =
 
 static int __init parse_acpi_param(const char *s)
 {
-    /* Save the parameter so it can be propagated to domain0. */
-    safe_strcpy(acpi_param, s);
-
     /* Interpret the parameter for use within Xen. */
     if ( !parse_bool(s, NULL) )
     {
@@ -240,9 +238,17 @@ static int __init parse_acpi_param(const
     {
         acpi_noirq_set();
     }
+    else if ( !strcmp(s, "verbose") )
+    {
+        acpi_verbose = true;
+        return 0;
+    }
     else
         return -EINVAL;
 
+    /* Save the parameter so it can be propagated to domain0. */
+    safe_strcpy(acpi_param, s);
+
     return 0;
 }
 
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -230,8 +230,10 @@ acpi_numa_x2apic_affinity_init(const str
 	apicid_to_node[pa->apic_id] = node;
 	node_set(node, processor_nodes_parsed);
 	acpi_numa = 1;
-	printk(KERN_INFO "SRAT: PXM %u -> APIC %08x -> Node %u\n",
-	       pxm, pa->apic_id, node);
+
+	if (acpi_verbose)
+		printk(KERN_INFO "SRAT: PXM %u -> APIC %08x -> Node %u\n",
+		       pxm, pa->apic_id, node);
 }
 
 /* Callback for Proximity Domain -> LAPIC mapping */
@@ -263,8 +265,10 @@ acpi_numa_processor_affinity_init(const
 	apicid_to_node[pa->apic_id] = node;
 	node_set(node, processor_nodes_parsed);
 	acpi_numa = 1;
-	printk(KERN_INFO "SRAT: PXM %u -> APIC %02x -> Node %u\n",
-	       pxm, pa->apic_id, node);
+
+	if (acpi_verbose)
+		printk(KERN_INFO "SRAT: PXM %u -> APIC %02x -> Node %u\n",
+		       pxm, pa->apic_id, node);
 }
 
 /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -36,6 +36,8 @@
 
 #define ACPI_MAX_TABLES		128
 
+bool __initdata acpi_verbose;
+
 static const char *__initdata
 mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
 static const char *__initdata
@@ -51,6 +53,7 @@ void __init acpi_table_print_madt_entry(
 	switch (header->type) {
 
 	case ACPI_MADT_TYPE_LOCAL_APIC:
+		if (acpi_verbose)
 		{
 			struct acpi_madt_local_apic *p =
 			    (struct acpi_madt_local_apic *)header;
@@ -62,6 +65,7 @@ void __init acpi_table_print_madt_entry(
 		break;
 
 	case ACPI_MADT_TYPE_LOCAL_X2APIC:
+		if (acpi_verbose)
 		{
 			struct acpi_madt_local_x2apic *p =
 			    (struct acpi_madt_local_x2apic *)header;
@@ -115,6 +119,7 @@ void __init acpi_table_print_madt_entry(
 		break;
 
 	case ACPI_MADT_TYPE_LOCAL_APIC_NMI:
+		if (acpi_verbose)
 		{
 			struct acpi_madt_local_apic_nmi *p =
 			    (struct acpi_madt_local_apic_nmi *)header;
@@ -128,6 +133,7 @@ void __init acpi_table_print_madt_entry(
 		break;
 
 	case ACPI_MADT_TYPE_LOCAL_X2APIC_NMI:
+		if (acpi_verbose)
 		{
 			u16 polarity, trigger;
 			struct acpi_madt_local_x2apic_nmi *p =
@@ -167,6 +173,7 @@ void __init acpi_table_print_madt_entry(
 		break;
 
 	case ACPI_MADT_TYPE_LOCAL_SAPIC:
+		if (acpi_verbose)
 		{
 			struct acpi_madt_local_sapic *p =
 			    (struct acpi_madt_local_sapic *)header;
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -53,6 +53,8 @@
 
 extern acpi_physical_address rsdp_hint;
 
+extern bool acpi_verbose;
+
 enum acpi_interrupt_id {
 	ACPI_INTERRUPT_PMI	= 1,
 	ACPI_INTERRUPT_INIT,


