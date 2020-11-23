Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D552C05D4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34182.65040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB93-0002Ql-Jh; Mon, 23 Nov 2020 12:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34182.65040; Mon, 23 Nov 2020 12:40:37 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB93-0002QK-GE; Mon, 23 Nov 2020 12:40:37 +0000
Received: by outflank-mailman (input) for mailman id 34182;
 Mon, 23 Nov 2020 12:40:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khB92-0002OQ-Cj
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:40:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a14cf33e-5462-4b5e-b240-2c95284fbd29;
 Mon, 23 Nov 2020 12:40:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 943D8ABCE;
 Mon, 23 Nov 2020 12:40:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khB92-0002OQ-Cj
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:40:36 +0000
X-Inumbo-ID: a14cf33e-5462-4b5e-b240-2c95284fbd29
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a14cf33e-5462-4b5e-b240-2c95284fbd29;
	Mon, 23 Nov 2020 12:40:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606135230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVkCF63cSzSDN2HfqCHv8cKlqji3PTKbOSNyrWOJa6o=;
	b=gbIT+V0AFH7qMN6Ub5jgkUvEvx8DXDNRxGyOWXzKF/Bx2OUqxpU2HIwp7y3Vv4nbkBz+zL
	LRqV+jYO/NhD1Y8zDaW0nizoEzr4nnkme5v7mqHFqEUy9RdBG98ngzFM3wgVZ3Fddmkhae
	HroC8qSqZTCOrVfpbv103VIajGMpLkk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 943D8ABCE;
	Mon, 23 Nov 2020 12:40:30 +0000 (UTC)
Subject: [PATCH 3/4] x86/DMI: fix table mapping when one lives above 1Mb
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Message-ID: <53cd4ae3-d806-c3ad-02fd-317a09f15a24@suse.com>
Date: Mon, 23 Nov 2020 13:40:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Use of __acpi_map_table() is kind of an abuse here, and doesn't work
anymore for the majority of cases if any of the tables lives outside the
low first Mb. Keep this (ab)use only prior to reaching SYS_STATE_boot,
primarily to avoid needing to audit whether any of the calls here can
happen this early in the first place; quite likely this isn't necessary
at all - at least dmi_scan_machine() gets called late enough.

For the "normal" case, call __vmap() directly, despite effectively
duplicating acpi_os_map_memory(). There's one difference though: We
shouldn't need to establish UC- mappings, WP or r/o WB mappings ought to
be fine, as the tables are going to live in either RAM or ROM. Short of
having PAGE_HYPERVISOR_WP and wanting to map the tables r/o anyway, use
the latter of the two options. The r/o mapping implies some
constification of code elsewhere in the file. For code touched anyway
also switch to void (where possible) or uint8_t.

Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -12,8 +12,6 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 
-#define bt_ioremap(b,l)  ((void *)__acpi_map_table(b,l))
-#define bt_iounmap(b,l)  ((void)0)
 #define memcpy_fromio    memcpy
 #define alloc_bootmem(l) xmalloc_bytes(l)
 
@@ -111,9 +109,32 @@ enum dmi_entry_type {
 #define dmi_printk(x)
 #endif
 
-static char * __init dmi_string(struct dmi_header *dm, u8 s)
+static const void *__init bt_ioremap(paddr_t addr, unsigned int len)
 {
-	char *bp=(char *)dm;
+    mfn_t mfn = _mfn(PFN_DOWN(addr));
+    unsigned int offs = PAGE_OFFSET(addr);
+
+    if ( addr + len <= MB(1) )
+        return __va(addr);
+
+    if ( system_state < SYS_STATE_boot )
+        return __acpi_map_table(addr, len);
+
+    return __vmap(&mfn, PFN_UP(offs + len), 1, 1, PAGE_HYPERVISOR_RO,
+                  VMAP_DEFAULT) + offs;
+}
+
+static void __init bt_iounmap(const void *ptr, unsigned int len)
+{
+    if ( (unsigned long)ptr < DIRECTMAP_VIRT_START &&
+         system_state >= SYS_STATE_boot )
+        vunmap(ptr);
+}
+
+static const char *__init dmi_string(const struct dmi_header *dm, uint8_t s)
+{
+	const char *bp = (const void *)dm;
+
 	bp+=dm->length;
 	if(!s)
 		return "";
@@ -133,11 +154,10 @@ static char * __init dmi_string(struct d
  */
  
 static int __init dmi_table(paddr_t base, u32 len, int num,
-			    void (*decode)(struct dmi_header *))
+			    void (*decode)(const struct dmi_header *))
 {
-	u8 *buf;
-	struct dmi_header *dm;
-	u8 *data;
+	const uint8_t *buf, *data;
+	const struct dmi_header *dm;
 	int i=0;
 		
 	buf = bt_ioremap(base, len);
@@ -301,7 +321,7 @@ typedef union {
 
 static int __init _dmi_iterate(const struct dmi_eps *dmi,
 			       const smbios_eps_u smbios,
-			       void (*decode)(struct dmi_header *))
+			       void (*decode)(const struct dmi_header *))
 {
 	int num;
 	u32 len;
@@ -335,7 +355,7 @@ static int __init _dmi_iterate(const str
 	return dmi_table(base, len, num, decode);
 }
 
-static int __init dmi_iterate(void (*decode)(struct dmi_header *))
+static int __init dmi_iterate(void (*decode)(const struct dmi_header *))
 {
 	struct dmi_eps dmi;
 	struct smbios3_eps smbios3;
@@ -370,7 +390,7 @@ static int __init dmi_iterate(void (*dec
 	return -1;
 }
 
-static int __init dmi_efi_iterate(void (*decode)(struct dmi_header *))
+static int __init dmi_efi_iterate(void (*decode)(const struct dmi_header *))
 {
 	int ret = -1;
 
@@ -433,10 +453,11 @@ static char *__initdata dmi_ident[DMI_ST
  *	Save a DMI string
  */
  
-static void __init dmi_save_ident(struct dmi_header *dm, int slot, int string)
+static void __init dmi_save_ident(const struct dmi_header *dm, int slot, int string)
 {
-	char *d = (char*)dm;
-	char *p = dmi_string(dm, d[string]);
+	const char *d = (const void *)dm;
+	const char *p = dmi_string(dm, d[string]);
+
 	if(p==NULL || *p == 0)
 		return;
 	if (dmi_ident[slot])
@@ -629,10 +650,10 @@ static const struct dmi_blacklist __init
  *	out of here.
  */
 
-static void __init dmi_decode(struct dmi_header *dm)
+static void __init dmi_decode(const struct dmi_header *dm)
 {
 #ifdef DMI_DEBUG
-	u8 *data = (u8 *)dm;
+	const uint8_t *data = (const void *)dm;
 #endif
 	
 	switch(dm->type)


