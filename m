Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899A82DE76E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 17:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56564.99082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqIZw-0008Qb-Pz; Fri, 18 Dec 2020 16:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56564.99082; Fri, 18 Dec 2020 16:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqIZw-0008QC-Ls; Fri, 18 Dec 2020 16:26:04 +0000
Received: by outflank-mailman (input) for mailman id 56564;
 Fri, 18 Dec 2020 16:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FvXD=FW=casper.srs.infradead.org=batv+47c5e4db15a5ade07d01+6326+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kqIZt-0008Q7-TD
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 16:26:02 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77e883e6-9938-46f6-ac21-e1c71c94d5f1;
 Fri, 18 Dec 2020 16:25:53 +0000 (UTC)
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=freeip.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqIZX-0004Ba-AJ; Fri, 18 Dec 2020 16:25:39 +0000
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
X-Inumbo-ID: 77e883e6-9938-46f6-ac21-e1c71c94d5f1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Mime-Version:Content-Type:Date:Cc:To:
	From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=obycoBflX0G8n6e3Nf95BDIgacjxulKLFIrgPWEt6io=; b=KNdhvmNcFhLyz+KMb46+44/1kk
	jWMAzDBDs4xRJEbqP+raqO80deZwlNEp6CedB+z4D3k/UvvoLOkNQyJYL+AuVj8LXmK5OCsy7ffMn
	lJiF1gB/FckR6UdgQr+iCIwYfH0sO4kITK/X4aO8pcbjQ1kLY7EA/l7gndwnsoZ0dyG59qRx+vA1i
	FgdvOmF/qMDYkU1j/Uy0iGZWXd/tio+d9mlYh3ZzmoT4grV6OZJMJfg+Yy7frOCAnSma+vdO/Gzsj
	Yov6MP1HudyGYZtPOh3+iIwUikRDFuDGawe5DLygfFfmHKGmqKx/YNfaMHZ0i7hf/fPDw2vSsJmMh
	9nY51Pgg==;
Message-ID: <5ba658b2d8a2bce63622f5bb8ef8d5e6114276eb.camel@infradead.org>
Subject: [PATCH] xen: Fix event channel callback via INTX/GSI
From: David Woodhouse <dwmw2@infradead.org>
To: "x86@kernel.org" <x86@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Paul Durrant
 <pdurrant@amazon.com>, jgrall@amazon.com, karahmed@amazon.de, xen-devel
 <xen-devel@lists.xenproject.org>
Date: Fri, 18 Dec 2020 16:25:38 +0000
Content-Type: multipart/signed; micalg="sha-256";
	protocol="application/x-pkcs7-signature";
	boundary="=-YLrO5Z5kR+4+pEHI7e6u"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-YLrO5Z5kR+4+pEHI7e6u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

For a while, event channel notification via the PCI platform device
has been broken, because we attempt to communicate with xenstore before
we even have notifications working, in the xs_reset_watches() call
called from xs_init().

This mostly doesn't matter much in practice because for Xen versions
below 4.0 we avoid xs_reset_watches() anyway, because xenstore might
not cope with reading a non-existent key. And newer Xen *does* have
the vector callback support, so we rarely fall back to INTX/GSI
delivery.

But those working on Xen and Xen-compatible hypervisor implementations
do want to test that INTX/GSI delivery works correctly, as there are
still guest kernels in active use which don't use vector delivery yet.
So it's useful to have it actually working.

To that end, clean up a bit of the mess of xs_init() and xenbus_probe()
startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
case, deferring it to be called from xenbus_probe() in the XS_HVM case
instead.

Then fix up the invocation of xenbus_probe() to happen either from its
device_initcall if the callback is available early enough, or when the
callback is finally set up. This means that the hack of calling
xenbus_probe() from a workqueue after the first interrupt is no longer
needed.

Add a 'no_vector_callback' command line argument to test it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm/xen/enlighten.c          |  2 +-
 arch/x86/xen/enlighten_hvm.c      | 11 ++++-
 drivers/xen/events/events_base.c  | 10 -----
 drivers/xen/platform-pci.c        |  7 ++++
 drivers/xen/xenbus/xenbus.h       |  1 +
 drivers/xen/xenbus/xenbus_comms.c |  8 ----
 drivers/xen/xenbus/xenbus_probe.c | 68 ++++++++++++++++++++++++-------
 include/xen/xenbus.h              |  2 +-
 8 files changed, 74 insertions(+), 35 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 60e901cd0de6..5a957a9a0984 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -371,7 +371,7 @@ static int __init xen_guest_init(void)
 	}
 	gnttab_init();
 	if (!xen_initial_domain())
-		xenbus_probe(NULL);
+		xenbus_probe();
=20
 	/*
 	 * Making sure board specific code will not set up ops for
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 9e87ab010c82..a1c07e0c888e 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -188,6 +188,8 @@ static int xen_cpu_dead_hvm(unsigned int cpu)
        return 0;
 }
=20
+static bool no_vector_callback __initdata;
+
 static void __init xen_hvm_guest_init(void)
 {
 	if (xen_pv_domain())
@@ -207,7 +209,7 @@ static void __init xen_hvm_guest_init(void)
=20
 	xen_panic_handler_init();
=20
-	if (xen_feature(XENFEAT_hvm_callback_vector))
+	if (!no_vector_callback && xen_feature(XENFEAT_hvm_callback_vector))
 		xen_have_vector_callback =3D 1;
=20
 	xen_hvm_smp_init();
@@ -233,6 +235,13 @@ static __init int xen_parse_nopv(char *arg)
 }
 early_param("xen_nopv", xen_parse_nopv);
=20
+static __init int xen_parse_no_vector_callback(char *arg)
+{
+	no_vector_callback =3D true;
+	return 0;
+}
+early_param("no_vector_callback", xen_parse_no_vector_callback);
+
 bool __init xen_hvm_need_lapic(void)
 {
 	if (xen_pv_domain())
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_b=
ase.c
index 6038c4c35db5..bbebe248b726 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2010,16 +2010,6 @@ static struct irq_chip xen_percpu_chip __read_mostly=
 =3D {
 	.irq_ack		=3D ack_dynirq,
 };
=20
-int xen_set_callback_via(uint64_t via)
-{
-	struct xen_hvm_param a;
-	a.domid =3D DOMID_SELF;
-	a.index =3D HVM_PARAM_CALLBACK_IRQ;
-	a.value =3D via;
-	return HYPERVISOR_hvm_op(HVMOP_set_param, &a);
-}
-EXPORT_SYMBOL_GPL(xen_set_callback_via);
-
 #ifdef CONFIG_XEN_PVHVM
 /* Vector callbacks are better than PCI interrupts to receive event
  * channel notifications because we can receive vector callbacks on any
diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index dd911e1ff782..5c3015a90a73 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -132,6 +132,13 @@ static int platform_pci_probe(struct pci_dev *pdev,
 			dev_warn(&pdev->dev, "request_irq failed err=3D%d\n", ret);
 			goto out;
 		}
+		/*
+		 * It doesn't strictly *have* to run on CPU0 but it sure
+		 * as hell better process the event channel ports delivered
+		 * to CPU0.
+		 */
+		irq_set_affinity(pdev->irq, cpumask_of(0));
+
 		callback_via =3D get_callback_via(pdev);
 		ret =3D xen_set_callback_via(callback_via);
 		if (ret) {
diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index 5f5b8a7d5b80..05bbda51103f 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -113,6 +113,7 @@ int xenbus_probe_node(struct xen_bus_type *bus,
 		      const char *type,
 		      const char *nodename);
 int xenbus_probe_devices(struct xen_bus_type *bus);
+void xenbus_probe(void);
=20
 void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
=20
diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbus_=
comms.c
index eb5151fc8efa..e5fda0256feb 100644
--- a/drivers/xen/xenbus/xenbus_comms.c
+++ b/drivers/xen/xenbus/xenbus_comms.c
@@ -57,16 +57,8 @@ DEFINE_MUTEX(xs_response_mutex);
 static int xenbus_irq;
 static struct task_struct *xenbus_task;
=20
-static DECLARE_WORK(probe_work, xenbus_probe);
-
-
 static irqreturn_t wake_waiting(int irq, void *unused)
 {
-	if (unlikely(xenstored_ready =3D=3D 0)) {
-		xenstored_ready =3D 1;
-		schedule_work(&probe_work);
-	}
-
 	wake_up(&xb_waitq);
 	return IRQ_HANDLED;
 }
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_=
probe.c
index 38725d97d909..876f381b100a 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -682,29 +682,63 @@ void unregister_xenstore_notifier(struct notifier_blo=
ck *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
=20
-void xenbus_probe(struct work_struct *unused)
+void xenbus_probe(void)
 {
 	xenstored_ready =3D 1;
=20
+	/*
+	 * In the HVM case, xenbus_init() deferred its call to
+	 * xs_init() in case callbacks were not operational yet.
+	 * So do it now.
+	 */
+	if (xen_store_domain_type =3D=3D XS_HVM)
+		xs_init();
+
 	/* Notify others that xenstore is up */
 	blocking_notifier_call_chain(&xenstore_chain, 0, NULL);
 }
-EXPORT_SYMBOL_GPL(xenbus_probe);
=20
 static int __init xenbus_probe_initcall(void)
 {
-	if (!xen_domain())
-		return -ENODEV;
-
-	if (xen_initial_domain() || xen_hvm_domain())
-		return 0;
+	/*
+	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
+	 * need to wait for the platform PCI device to come up, which is
+	 * the (XEN_PVPVM && !xen_have_vector_callback) case.
+	 */
+	if (xen_store_domain_type =3D=3D XS_PV ||
+	    (xen_store_domain_type =3D=3D XS_HVM &&
+	     (!IS_ENABLED(CONFIG_XEN_PVHVM) || xen_have_vector_callback)))
+		xenbus_probe();
=20
-	xenbus_probe(NULL);
 	return 0;
 }
-
 device_initcall(xenbus_probe_initcall);
=20
+int xen_set_callback_via(uint64_t via)
+{
+	struct xen_hvm_param a;
+	int ret;
+
+	a.domid =3D DOMID_SELF;
+	a.index =3D HVM_PARAM_CALLBACK_IRQ;
+	a.value =3D via;
+
+	ret =3D HYPERVISOR_hvm_op(HVMOP_set_param, &a);
+	if (ret)
+		return ret;
+
+	/*
+	 * If xenbus_probe_initcall() deferred the xenbus_probe()
+	 * due to the callback not functioning yet, we can do it now.
+	 */
+	if (!xenstored_ready && xen_store_domain_type =3D=3D XS_HVM &&
+	    IS_ENABLED(CONFIG_XEN_PVHVM) && !xen_have_vector_callback)
+		xenbus_probe();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xen_set_callback_via);
+
 /* Set up event channel for xenstored which is run as a local process
  * (this is normally used only in dom0)
  */
@@ -817,11 +851,17 @@ static int __init xenbus_init(void)
 		break;
 	}
=20
-	/* Initialize the interface to xenstore. */
-	err =3D xs_init();
-	if (err) {
-		pr_warn("Error initializing xenstore comms: %i\n", err);
-		goto out_error;
+	/*
+	 * HVM domains may not have a functional callback yet. In that
+	 * case let xs_init() be called from xenbus_probe(), which will
+	 * get invoked at an appropriate time.
+	 */
+	if (xen_store_domain_type !=3D XS_HVM) {
+		err =3D xs_init();
+		if (err) {
+			pr_warn("Error initializing xenstore comms: %i\n", err);
+			goto out_error;
+		}
 	}
=20
 	if ((xen_store_domain_type !=3D XS_LOCAL) &&
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 5a8315e6d8a6..61202c83d560 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -183,7 +183,7 @@ void xs_suspend_cancel(void);
=20
 struct work_struct;
=20
-void xenbus_probe(struct work_struct *);
+void xenbus_probe(void);
=20
 #define XENBUS_IS_ERR_READ(str) ({			\
 	if (!IS_ERR(str) && strlen(str) =3D=3D 0) {		\
--=20
2.26.2


--=-YLrO5Z5kR+4+pEHI7e6u
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAx
MjE4MTYyNTM4WjAvBgkqhkiG9w0BCQQxIgQgUt5IoVGf+4lgbTi6cdNZW0AJ1UtJngWnujuTCtPl
5B8wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAEl01WQ3Jn3tZC5C3LeFBt4iXZIeJax61/E2uBaqYtmia1gCh5r+m62CgwYGB8CO
2jmfvgOkCYGcG46P6pxcIzDREVfym0GkDrv+to6fT58dtHVsVA3IatlRCtY3aslw+ddlBsBXALMq
px6zz1Z2PTRZF1JnDy2rrcb4a2IzfkTizQdXeYFKDHr1XwvwNeyYltXdu6wItHz4Q+IYyfuDVE2L
mig0WTo14H180JmbKI7ZNYnoPsLpFyrvkpeo5ovDHdKxlUJT7HSVpQn4OJxoW1GulhCHLwYgYDIR
KtZFDi6NBxGa2HWe9iLx4zFCJ5t5sEbcfZSJhjSvmmkM4z4gH+QAAAAAAAA=


--=-YLrO5Z5kR+4+pEHI7e6u--


