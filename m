Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D594259C2AF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391469.629321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9Kw-0003WX-53; Mon, 22 Aug 2022 15:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391469.629321; Mon, 22 Aug 2022 15:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9Kw-0003TN-1Y; Mon, 22 Aug 2022 15:27:34 +0000
Received: by outflank-mailman (input) for mailman id 391469;
 Mon, 22 Aug 2022 15:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9Kt-0003Dm-VS
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:32 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee1133b3-222e-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 17:27:28 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7D1DA320099F;
 Mon, 22 Aug 2022 11:27:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 22 Aug 2022 11:27:27 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:24 -0400 (EDT)
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
X-Inumbo-ID: ee1133b3-222e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182046; x=1661268446; bh=sEQP7E6J6N
	sdiYDQ6i1IvqeCjtQRZXD8ynCmZHPXkuc=; b=nxvfjo0HIRZhWc4LS+bDDzczYM
	QBG1lXo2KdJM1WUBFKAR/Qli52fbGcqujbr1WA5uEsN/QzomxkbbGbqFQbAYvJx7
	BPsy+JEUTmf59hsQYCBOmhvlZkXJbAGLexv0vkYYRY2UywF3kLy38k6iOfHdnFYc
	Je16lTKIvAbY5TUY3eBQU7j4oVA8SLyThcqshkakBnCP+yzXDwCgwL3g8oieODfp
	d1nxHw3N25ZsFNvINBJ2Bqfkbl0z2RCvqibUt96MYhboMwbqu+zh67/v4DvwryXv
	+aZSIIZqTmqskqQedPY6jitVtkVVNvO8ad6hlBclS2hTk1kMZ07fOYGg9sgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182046; x=
	1661268446; bh=sEQP7E6J6NsdiYDQ6i1IvqeCjtQRZXD8ynCmZHPXkuc=; b=L
	N0CRPxm5qcATgIdFxsAS/KBvSnBjajZcqRvnqtf1zQMJFq17ihjaljKT0mjjGZm9
	Jk4TMay7TfKmDtv/dmNEyW4gY6vFI51RSNEx3YHMB/D5LU0yqWk7HAwNx6BFslpY
	sim4VFZHH3VA7gTH4Q6vhTi1y+4psVy+m7Fe7xIp0OdqXhzWHdQSsOZDpR7fKGCc
	mPm74eFmTr+WUKoUuxPjK5HQs2JWgt1meGLNgA1rvQIE8cZHeAQ4DWdigQSMrW2s
	Ge69Qzd8d6lQjrkfCTZm5eeHV7GyMCxnlJbHdtIkxnMRmZ9CmT+K9DxIkrctSgpy
	KXrDKjyshMwxt1N3gT9+g==
X-ME-Sender: <xms:XaADY97p-jWdSoGr-skLK45laG3pUVzgX0NHUZ1C6UYCLxdkAA9EVg>
    <xme:XaADY64jkc7E52ZVS45mkVEixGDW4M0vrhItWE2uaG7n3wVX0E8f8le9kPoE9qwrR
    Qh9B16c_tlYkA>
X-ME-Received: <xmr:XaADY0fdohkKm2BlDW4RcjkEjRz3jySI8nxM4spcc22y2BzIL7UOMmOE1yjiY_Cjq_-3cuw-Wn87ez9Hotge0ZmSjLSTpJ7qeRKYrn2_L7bc3ELbDLO53w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:XaADY2JtfRFELidzZxUFy_6BVWQQ8czxJHuV1lRLCelhnGDYjUZYpg>
    <xmx:XaADYxJjSTGFH16LztiTAmT3rQmldP2a5C0m2fP-zNeOqAsKMx3LmA>
    <xmx:XaADY_z2v1wUDDQZM5dlqz3xQcdMyUm-wi_f6lrxK6I20-zETj_v7Q>
    <xmx:XqADY_gA6Zg0gPU7-_IvMMC9WMaIS12occUomnnPUDQvvbd5tdH4jw>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/9] drivers/char: separate dbgp=xhci to dbc=xhci option
Date: Mon, 22 Aug 2022 17:27:01 +0200
Message-Id: <edff5ba0d286a41b94a6b4bb332b63228f7faebe.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows configuring EHCI and XHCI consoles separately,
simultaneously.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
new in v5
---
 docs/misc/xen-command-line.pandoc | 18 ++++++++++++------
 xen/drivers/char/serial.c         |  6 ++++++
 xen/drivers/char/xhci-dbc.c       | 20 ++++++++++----------
 xen/include/xen/serial.h          |  1 +
 4 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9a79385a3712..0d07f0c75990 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -409,7 +409,7 @@ The following are examples of correct specifications:
 Specify the size of the console ring buffer.
 
 ### console
-> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | none ]`
+> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | dbc | none ]`
 
 > Default: `console=com1,vga`
 
@@ -428,7 +428,9 @@ cleared.  This allows a single port to be shared by two subsystems
 `pv` indicates that Xen should use Xen's PV console. This option is
 only available when used together with `pv-in-pvh`.
 
-`dbgp` indicates that Xen should use a USB debug port.
+`dbgp` indicates that Xen should use a USB2 debug port.
+
+`dbc` indicates that Xen should use a USB3 debug port.
 
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
@@ -721,14 +723,18 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
+
+Specify the USB controller to use, either by instance number (when going
+over the PCI busses sequentially) or by PCI device (must be on segment 0).
+
+### dbc
 > `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
-Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability (output
-only). XHCI driver will wait indefinitely for the debug host to connect - make
-sure the cable is connected.
+Output only console. XHCI driver will wait indefinitely for the debug host to
+connect - make sure the cable is connected.
 
 ### debug_stack_lines
 > `= <integer>`
@@ -1174,7 +1180,7 @@ virtualization, to allow the L1 hypervisor to use EPT even if the L0 hypervisor
 does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 
 ### gdb
-> `= com1[H,L] | com2[H,L] | dbgp`
+> `= com1[H,L] | com2[H,L] | dbgp | dbc`
 
 > Default: ``
 
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 47899222cef8..7daaa61361bb 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -311,6 +311,12 @@ int __init serial_parse_handle(const char *conf)
         goto common;
     }
 
+    if ( !strncmp(conf, "dbc", 3) && (!conf[3] || conf[3] == ',') )
+    {
+        handle = SERHND_DBC;
+        goto common;
+    }
+
     if ( !strncmp(conf, "dtuart", 6) )
     {
         handle = SERHND_DTUART;
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index ca7d4a62139e..eb35e3a2ee4f 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1058,9 +1058,9 @@ static struct xhci_dbc_ctx ctx __aligned(16);
 static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
 static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
 
-static char __initdata opt_dbgp[30];
+static char __initdata opt_dbc[30];
 
-string_param("dbgp", opt_dbgp);
+string_param("dbc", opt_dbc);
 
 void __init xhci_dbc_uart_init(void)
 {
@@ -1068,25 +1068,25 @@ void __init xhci_dbc_uart_init(void)
     struct dbc *dbc = &uart->dbc;
     const char *e;
 
-    if ( strncmp(opt_dbgp, "xhci", 4) )
+    if ( strncmp(opt_dbc, "xhci", 4) )
         return;
 
     memset(dbc, 0, sizeof(*dbc));
 
-    if ( isdigit(opt_dbgp[4]) )
+    if ( isdigit(opt_dbc[4]) )
     {
-        dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
+        dbc->xhc_num = simple_strtoul(opt_dbc + 4, &e, 10);
     }
-    else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
+    else if ( strncmp(opt_dbc + 4, "@pci", 4) == 0 )
     {
         unsigned int bus, slot, func;
 
-        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
+        e = parse_pci(opt_dbc + 8, NULL, &bus, &slot, &func);
         if ( !e || *e )
         {
             printk(XENLOG_ERR
-                   "Invalid dbgp= PCI device spec: '%s'\n",
-                   opt_dbgp + 8);
+                   "Invalid dbc= PCI device spec: '%s'\n",
+                   opt_dbc + 8);
             return;
         }
 
@@ -1102,7 +1102,7 @@ void __init xhci_dbc_uart_init(void)
     dbc->dbc_str = str_buf;
 
     if ( dbc_open(dbc) )
-        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
+        serial_register_uart(SERHND_DBC, &dbc_uart_driver, &dbc_uart);
 }
 
 #ifdef DBC_DEBUG
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 4cd4ae5e6f1c..186afbed9c92 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -95,6 +95,7 @@ struct uart_driver {
 # define SERHND_COM1    (0<<0)
 # define SERHND_COM2    (1<<0)
 # define SERHND_DBGP    (2<<0)
+# define SERHND_DBC     (3<<0)
 # define SERHND_DTUART  (0<<0) /* Steal SERHND_COM1 value */
 #define SERHND_HI       (1<<2) /* Mux/demux each transferred char by MSB. */
 #define SERHND_LO       (1<<3) /* Ditto, except that the MSB is cleared.  */
-- 
git-series 0.9.1

