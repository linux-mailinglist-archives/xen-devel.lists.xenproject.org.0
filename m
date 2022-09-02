Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBC95AB143
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397604.638253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YT-0000hY-OG; Fri, 02 Sep 2022 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397604.638253; Fri, 02 Sep 2022 13:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YT-0000d6-IO; Fri, 02 Sep 2022 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 397604;
 Fri, 02 Sep 2022 13:17:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YS-0000AI-23
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:52 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2493900-2ac1-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 15:17:48 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E6F3B5C0100;
 Fri,  2 Sep 2022 09:17:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 02 Sep 2022 09:17:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:44 -0400 (EDT)
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
X-Inumbo-ID: a2493900-2ac1-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124665; x=1662211065; bh=P/446SguHG
	taplJg1g7ZVMbPb3ARpeZphSVBMP89Nyk=; b=juL0d31/WQdOxNE4NK5mXr2kC3
	f2OAWkKQQtBPdsSL51gjVFZRywbDkIiK39AizGRo6W7iYeqgvsfAYoUioOAQN+LJ
	1iTRdhLHdFq+//ThNDw7497c9PQqkIBo+y07/ca/W+uh9voAIxLBl5ZbNZbWTJhI
	k3/BgtvBBP12636kQcllczLaO3ULIuqjo/GDnOLtsYiA/UNbMyxEqWrm9N6a6isb
	jSBwe/SNQyYiJsmbTYAY0d5TDEhiaQToHaJqx05UR1YijvKEv6w17qi7tamFIay6
	LFjAsraf1RS7y3ZrkiC2x2lqnDsx1GAqAHJoWLezj4GnvK2qDbLEeIgpHTbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124665; x=
	1662211065; bh=P/446SguHGtaplJg1g7ZVMbPb3ARpeZphSVBMP89Nyk=; b=m
	t2z+hvunHDCLnxlwsQj7XmSOGuxtFQ1w9FmaK85z6Qh7abdSQcdBDfnpj52z2SUq
	iBM8V6DK7Dd6lb8g8Jy3pL51hv+lfzBY5KyzqPaMeK6mM50ZfHpO+OXmFUtqumnU
	oeKIgToHWhkqTIO196fnB+eufVgRTjDu/BqKhIjrFyTB+rMnpdLkzWfruD/j5qUg
	G5u1w3OOjp08xt/I1osi13xIwGkUBShmiTrnsCU1LEKEov5IBxuUKQ45NTIcq+Zf
	yvf1G0k2wQ2mfwmqwH75ks705BINWgCRDROsLfqjDCG2GgvPGZ1B7YJ9oqGI98OG
	pvZeJeghwDfvG0jsgnwzg==
X-ME-Sender: <xms:eQISY93Lkq-JcSAojFwFPE8T4_Hb7PDYKTMCDJXdiENRuvnyVC5Ewg>
    <xme:eQISY0F3W4L6VswEQ8VGD_loyT7_TQx4li3gW010EF6NK9LJI84q0zO9RVnk_sqDb
    0HMBMQbPqnw1g>
X-ME-Received: <xmr:eQISY96EYvO2Am4j5LtU42P4OKQMizlsII9VxEysf29S8sG7pjOiTguThl641msBJagDpnFv84BNYD_qgKD0EIWUiEVFlbbYqqG9KpO8sKHQPIp6NbrMjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:eQISY61y3WlCnQ1gnNSUIJ2JN9BKR77ONEbePzPSfR5L5sSbaLkgog>
    <xmx:eQISYwEGEQJAefxoQAoySNbR6THypeuyIaMIHPHUYzG6oMY6Fg6aBg>
    <xmx:eQISY78QdxQ7fk_VjAouRurjNGKZQOqICciJfH7_G-0C1nRnFHoBiw>
    <xmx:eQISY1P0_hfMUKwVO_g95eOz6OccXkVTuXF2u5P0UXT8p4NIy5AYvA>
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
Subject: [PATCH v6 01/10] drivers/char: allow using both dbgp=xhci and dbgp=ehci
Date: Fri,  2 Sep 2022 15:17:22 +0200
Message-Id: <f9c4f0df804ed406dea0e480614a033d5bd434c6.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows configuring EHCI and XHCI consoles separately,
simultaneously.

This changes string_param() to custom_param() in both ehci and xhci
drivers. Both drivers parse only values applicable to them.

While at it, drop unnecessary memset() of a static variable.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v6:
 - keep dbgp=xhci, but use custom_param() to parse multiple values
   separately
 - modify ehci-dbgp to use custom_param() too
 - change console=dbc to console=xhci, as 'dbc' doesn't appear in any
   other option anymore
 - update comment in serial.h
new in v5
---
 docs/misc/xen-command-line.pandoc |  6 ++++--
 xen/drivers/char/ehci-dbgp.c      | 15 +++++++++++++--
 xen/drivers/char/serial.c         |  6 ++++++
 xen/drivers/char/xhci-dbc.c       | 30 ++++++++++++++++++++----------
 xen/include/xen/serial.h          |  3 ++-
 5 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9a79385a3712..c8b07042f58e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -409,7 +409,7 @@ The following are examples of correct specifications:
 Specify the size of the console ring buffer.
 
 ### console
-> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | none ]`
+> `= List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | xhci | none ]`
 
 > Default: `console=com1,vga`
 
@@ -428,7 +428,9 @@ cleared.  This allows a single port to be shared by two subsystems
 `pv` indicates that Xen should use Xen's PV console. This option is
 only available when used together with `pv-in-pvh`.
 
-`dbgp` indicates that Xen should use a USB debug port.
+`dbgp` indicates that Xen should use a USB2 debug port.
+
+`xhci` indicates that Xen should use a USB3 debug port.
 
 `none` indicates that Xen should not use a console.  This option only
 makes sense on its own.
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 92c588ec0aa3..b1794ed64c7b 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1464,7 +1464,18 @@ static struct uart_driver __read_mostly ehci_dbgp_driver = {
 static struct ehci_dbgp ehci_dbgp = { .state = dbgp_unsafe, .phys_port = 1 };
 
 static char __initdata opt_dbgp[30];
-string_param("dbgp", opt_dbgp);
+
+static int __init parse_ehci_dbgp(const char *opt)
+{
+    if ( strncmp(opt, "ehci", 4) )
+        return 0;
+
+    strlcpy(opt_dbgp, opt, sizeof(opt_dbgp));
+
+    return 0;
+}
+
+custom_param("dbgp", parse_ehci_dbgp);
 
 void __init ehci_dbgp_init(void)
 {
@@ -1472,7 +1483,7 @@ void __init ehci_dbgp_init(void)
     u32 debug_port, offset, bar_val;
     const char *e;
 
-    if ( strncmp(opt_dbgp, "ehci", 4) )
+    if ( !opt_dbgp[0] )
         return;
 
     if ( isdigit(opt_dbgp[4]) || !opt_dbgp[4] )
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 47899222cef8..9d9445039232 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -311,6 +311,12 @@ int __init serial_parse_handle(const char *conf)
         goto common;
     }
 
+    if ( !strncmp(conf, "xhci", 4) && (!conf[4] || conf[4] == ',') )
+    {
+        handle = SERHND_XHCI;
+        goto common;
+    }
+
     if ( !strncmp(conf, "dtuart", 6) )
     {
         handle = SERHND_DTUART;
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index ca7d4a62139e..8da76282259a 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -245,6 +245,7 @@ struct dbc {
     uint64_t xhc_dbc_offset;
     void __iomem *xhc_mmio;
 
+    bool enable; /* whether dbgp=xhci was set at all */
     bool open;
     unsigned int xhc_num; /* look for n-th xhc */
 };
@@ -1058,20 +1059,14 @@ static struct xhci_dbc_ctx ctx __aligned(16);
 static uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
 static struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
 
-static char __initdata opt_dbgp[30];
-
-string_param("dbgp", opt_dbgp);
-
-void __init xhci_dbc_uart_init(void)
+static int __init xhci_parse_dbgp(const char *opt_dbgp)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
     const char *e;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
-        return;
-
-    memset(dbc, 0, sizeof(*dbc));
+        return 0;
 
     if ( isdigit(opt_dbgp[4]) )
     {
@@ -1087,12 +1082,27 @@ void __init xhci_dbc_uart_init(void)
             printk(XENLOG_ERR
                    "Invalid dbgp= PCI device spec: '%s'\n",
                    opt_dbgp + 8);
-            return;
+            return -EINVAL;
         }
 
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
 
+    dbc->enable = true;
+
+    return 0;
+}
+
+custom_param("dbgp", xhci_parse_dbgp);
+
+void __init xhci_dbc_uart_init(void)
+{
+    struct dbc_uart *uart = &dbc_uart;
+    struct dbc *dbc = &uart->dbc;
+
+    if ( !dbc->enable )
+        return;
+
     dbc->dbc_ctx = &ctx;
     dbc->dbc_erst = &erst;
     dbc->dbc_ering.trb = evt_trb;
@@ -1102,7 +1112,7 @@ void __init xhci_dbc_uart_init(void)
     dbc->dbc_str = str_buf;
 
     if ( dbc_open(dbc) )
-        serial_register_uart(SERHND_DBGP, &dbc_uart_driver, &dbc_uart);
+        serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
 }
 
 #ifdef DBC_DEBUG
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 4cd4ae5e6f1c..f0aff7ea7661 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -91,10 +91,11 @@ struct uart_driver {
 };
 
 /* 'Serial handles' are composed from the following fields. */
-#define SERHND_IDX      (3<<0) /* COM1, COM2, DBGP, DTUART?               */
+#define SERHND_IDX      (3<<0) /* COM1, COM2, DBGP, XHCI, DTUART?         */
 # define SERHND_COM1    (0<<0)
 # define SERHND_COM2    (1<<0)
 # define SERHND_DBGP    (2<<0)
+# define SERHND_XHCI    (3<<0)
 # define SERHND_DTUART  (0<<0) /* Steal SERHND_COM1 value */
 #define SERHND_HI       (1<<2) /* Mux/demux each transferred char by MSB. */
 #define SERHND_LO       (1<<3) /* Ditto, except that the MSB is cleared.  */
-- 
git-series 0.9.1

