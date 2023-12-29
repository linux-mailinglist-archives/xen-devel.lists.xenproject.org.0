Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D214081FEC6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Dec 2023 10:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660247.1029811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJ9W3-0002iU-Df; Fri, 29 Dec 2023 09:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660247.1029811; Fri, 29 Dec 2023 09:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rJ9W3-0002gF-Af; Fri, 29 Dec 2023 09:50:55 +0000
Received: by outflank-mailman (input) for mailman id 660247;
 Fri, 29 Dec 2023 09:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3jkC=II=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rJ9W1-0002ft-6a
 for xen-devel@lists.xenproject.org; Fri, 29 Dec 2023 09:50:53 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be9e17d2-a62f-11ee-9b0f-b553b5be7939;
 Fri, 29 Dec 2023 10:50:50 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C1EE5C013B
 for <xen-devel@lists.xenproject.org>; Fri, 29 Dec 2023 04:50:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 29 Dec 2023 04:50:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Fri, 29 Dec 2023 04:50:47 -0500 (EST)
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
X-Inumbo-ID: be9e17d2-a62f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1703843448; x=1703929848; bh=SgYlradmGw
	/uy51fJCWRH4SKeV000a0rZhH6j/UlL/M=; b=rKwpLUjBgJBtIlCHN6l6z1GcPM
	BuR9/KumSptfte0BZqqHNhGuFmIev4dEHbhBUaHXR3wXYn1R4kO0qqXAcOJQTKPL
	ZX16oRoq6AVlATpX4gQIOrhGmjkdeJYAgqDxm8v8jEM33sI3GWRE+77Zpi1PR9l2
	TDSbKHdrwvYpCzANkxFUkZSpR7FmFiNs2rO+C0R8xPhTmFGlRFHk8t4f3zTL4iAP
	5tYZQ6io2eKw32yc/d18BmuwIziWKH6DIrz+HmnkW8IbrPij5Y4LVUUDh8YWUS0g
	5PiI4gRLS9KginPKaG+CqSHNCgA4fPy6noC50LV74DccKmbGQR3PrmjggTYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1703843448; x=1703929848; bh=SgYlradmGw/uy51fJCWRH4SKeV000a0rZhH
	6j/UlL/M=; b=1bUDhoLBmwSmNS0/IL0dluuBZCsDwWiT6UY1Akgwsr9m6uoZnM+
	/lNbSx1mEKSN2+mU0SNprtth3MB8dd2OjcrxUEaSsfhz+hsLBoy8jCV2jHuvMWvL
	fYUvIgl+oQid59C91yDHIzwnipG0nnd2wz3r5FDwHzEtE4dXTAkMUs/2m3gSG4J9
	yCjeFL0f06MfAgc68pyrw8il10Wr7lMjrd24BZUPfWwVC4k5h3rnHwF4c94sWT5m
	UO3GqKxw+h1LUCr4EKXig5jl60/zfKlDSWDl/Y5cZ6OXCWY9Okgg35jiMFhN1BdS
	KKq/P9ttEw/1jX3o+AKpgKas3ca2LMPbzXg==
X-ME-Sender: <xms:d5aOZecdAbf0f2iJbgGXr8OZUzAK9XUk6uXi6dFQffA8xAJqvWhQtA>
    <xme:d5aOZYNhQRcJRNIHcyJ81RgAroC0UCJW8u33ZEaoOk58bjB1jbGdlRNs5chNZHa6V
    JzjgoZNBCqW7Q>
X-ME-Received: <xmr:d5aOZfiOlhrZmo9U3gsqSNJzV3WmX9dLT50cAoizsdZOwnfV-bZT00f74kJM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeffedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepvddviefgjefhvddvjeduueeihfdvvdffjeevieektdejueei
    ffetffefieethfefnecuffhomhgrihhnpehquhgsvghsqdhoshdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:d5aOZb8bEbhK43SX_qOEmtYvQpv8M0fl2D5zOwc0NCutUDEQuLsyVA>
    <xmx:d5aOZasujjBP95Qa7-j8OTBd83XAVxbzkmTZNWthH6T1JgSHj4f3Vg>
    <xmx:d5aOZSEdAjsNBtP49KOc6tJumbjaqqISNWCEvLIhO14Nmf6W0WwftQ>
    <xmx:eJaOZY6-aqDL4P8YI771VQ8Z-alniinQHLFQPqXYf1qws-Dz5oCTEA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 29 Dec 2023 10:50:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Serial console stuck during boot, unblocked with xl debug-key
Message-ID: <ZY6WdQlbdQxb1UR2@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0DeuvKst/ScPt4Cs"
Content-Disposition: inline


--0DeuvKst/ScPt4Cs
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="BQxSafAm748++qfm"
Content-Disposition: inline
Date: Fri, 29 Dec 2023 10:50:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Serial console stuck during boot, unblocked with xl debug-key


--BQxSafAm748++qfm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

This is continuation from matrix chat. There is an occasional failure on
qubes-hw2 gitlab runner that console become stuck during boot. I can now
reproduce it _much_ more often on another system, and the serial console ou=
tput
ends with:

    (XEN) Allocated console ring of 256 KiB.
    (XEN) Using HWP for cpufreq
    (XEN) mwait-idle: does not run on family 6

It should be:

    (XEN) Allocated console ring of 256 KiB.
    (XEN) Using HWP for cpufreq
    (XEN) mwait-idle: does not run on family 6 model 183
    (XEN) VMX: Supported advanced features:
    (XEN)  - APIC MMIO access virtualisation
    (XEN)  - APIC TPR shadow
    ...


Otherwise the system works perfectly fine, the logs are available in
full via `xl dmesg` etc. Doing (any?) `xl debug-key` unblocks the
console and missing logs gets dumped there too. I narrowed it down to
the serial console tx buffer and collected some info with the attacked
patch (it collects info still during boot, after the place where it
usually breaks). When it works, I get:

    (XEN) SERIAL DEBUG: txbufc: 0x5b5, txbufp: 0x9f7, uart intr_works: 1, s=
erial_txbufsz: 0x4000, tx_ready: 0, lsr_mask: 0x20, msi: 0, io_size: 8, ski=
pped_interrupts: 0

And when it breaks, I get:

    (XEN) SERIAL DEBUG: txbufc: 0x70, txbufp: 0x9fd, uart intr_works: 1, se=
rial_txbufsz: 0x4000, tx_ready: 16, lsr_mask: 0x20, msi: 0, io_size: 8, ski=
pped_interrupts: 0

So, I haven't found yet why it stops sending data. I'll continue adding
some debug prints etc, but if anyone has some ideas what is going on,
I'd appreciate hints.


Full `xl dmesg` of a broken case can be seen here:
https://openqa.qubes-os.org/tests/89100/logfile?filename=3Dserial_terminal.=
txt
Similarly, example working case is here:
https://openqa.qubes-os.org/tests/89099/logfile?filename=3Dserial0.txt

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BQxSafAm748++qfm
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="console-debug.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 5bbed3a36a..39ad935266 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -354,6 +354,8 @@ static struct page_info * __init alloc_chunk(struct dom=
ain *d,
     return page;
 }
=20
+extern void serial_debug(void);
+
 int __init dom0_construct_pv(struct domain *d,
                              const module_t *image,
                              unsigned long image_headroom,
@@ -412,6 +414,7 @@ int __init dom0_construct_pv(struct domain *d,
     /* Machine address of next candidate page-table page. */
     paddr_t mpt_alloc;
=20
+    serial_debug();
     printk(XENLOG_INFO "*** Building a PV Dom%d ***\n", d->domain_id);
=20
     d->max_pages =3D ~0U;
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 324024c29a..d6a4d62a07 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -71,6 +71,80 @@ void serial_rx_interrupt(struct serial_port *port, struc=
t cpu_user_regs *regs)
         (*fn)(c & 0x7f, regs);
 }
=20
+#include <xen/console.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/timer.h>
+#include <xen/serial.h>
+#include <xen/iocap.h>
+#ifdef NS16550_PCI
+#include <xen/pci.h>
+#include <xen/pci_regs.h>
+#include <xen/pci_ids.h>
+#endif
+#include <xen/8250-uart.h>
+#include <xen/vmap.h>
+#include <asm/io.h>
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <asm/device.h>
+#endif
+#ifdef CONFIG_X86
+#include <asm/fixmap.h>
+#endif
+
+#define NS16550_PCI
+
+struct ns16550 {
+    int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
+    u64 io_base;   /* I/O port or memory-mapped I/O address. */
+    u64 io_size;
+    int reg_shift; /* Bits to shift register offset by */
+    int reg_width; /* Size of access to use, the registers
+                    * themselves are still bytes */
+    char __iomem *remapped_io_base;  /* Remapped virtual address of MMIO. =
*/
+    /* UART with IRQ line: interrupt-driven I/O. */
+    struct irqaction irqaction;
+    u8 lsr_mask;
+#ifdef CONFIG_ARM
+    struct vuart_info vuart;
+#endif
+    /* UART with no IRQ line: periodically-polled I/O. */
+    struct timer timer;
+    struct timer resume_timer;
+    unsigned int timeout_ms;
+    bool intr_works;
+    bool dw_usr_bsy;
+#ifdef NS16550_PCI
+    /* PCI card parameters. */
+    bool pb_bdf_enable;     /* if =3D1, pb-bdf effective, port behind brid=
ge */
+    bool ps_bdf_enable;     /* if =3D1, ps_bdf effective, port on pci card=
 */
+    unsigned int pb_bdf[3]; /* pci bridge BDF */
+    unsigned int ps_bdf[3]; /* pci serial port BDF */
+    u32 bar;
+    u32 bar64;
+    u16 cr;
+    u8 bar_idx;
+    bool msi;
+    const struct ns16550_config_param *param; /* Points into .init.*! */
+#endif
+};
+
+int skipped_interrupts =3D 0;
+
+void serial_debug(void)
+{
+    struct serial_port *port =3D &com[SERHND_COM1];
+    struct ns16550 *uart =3D port->uart;
+    printk("SERIAL DEBUG: txbufc: %#x, txbufp: %#x, uart intr_works: %d, s=
erial_txbufsz: %#x, tx_ready: %d, "
+            "lsr_mask: %#x, msi: %d, io_size: %ld, skipped_interrupts: %d\=
n",
+            port->txbufc, port->txbufp, uart->intr_works,
+            serial_txbufsz,
+            port->driver->tx_ready(port),
+            uart->lsr_mask, uart->msi, uart->io_size, skipped_interrupts);
+}
+
 void serial_tx_interrupt(struct serial_port *port, struct cpu_user_regs *r=
egs)
 {
     int i, n;
@@ -85,8 +159,10 @@ void serial_tx_interrupt(struct serial_port *port, stru=
ct cpu_user_regs *regs)
      */
     while ( !spin_trylock(&port->tx_lock) )
     {
-        if ( port->driver->tx_ready(port) <=3D 0 )
+        if ( port->driver->tx_ready(port) <=3D 0 ) {
+            skipped_interrupts++;
             goto out;
+        }
         cpu_relax();
     }
=20

--BQxSafAm748++qfm--

--0DeuvKst/ScPt4Cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWOlnUACgkQ24/THMrX
1yx6UQf+MQfxGeP87TfFA6Q7LbgukKQjsnfmvg/xv43pV57ggZOsSIkr+TPh95oC
7nw4C2ZZc7CeJeZ0kLoz1ygua2TStS4ILFqxaylmf+iLz+dOMUlK/AYte3PVG0yZ
GL/VEM8/jMdA5C+T+oAESC7hNO4OmBSg3gZU7gdnVaMFAGd9PlpHChoFOmJcCzAI
RGFzkht4SpbIaAKWJqVvL2YlV8p9fhyyoJUnFaqvQhdrVQwL4oQ/2sSUEx0vfYiX
7znnl4QoLjftcWvxcgyk54nT1q0610spAH75VpsbYPFTMSknoKQVcYUd3K1FBTS2
fbIYPLf8ggll2K5dRsuYBZUec7/QzA==
=d5fn
-----END PGP SIGNATURE-----

--0DeuvKst/ScPt4Cs--

