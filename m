Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5AA74FA2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 18:41:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931063.1333542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDhp-0007Eh-FY; Fri, 28 Mar 2025 17:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931063.1333542; Fri, 28 Mar 2025 17:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDhp-0007Ch-Cc; Fri, 28 Mar 2025 17:41:21 +0000
Received: by outflank-mailman (input) for mailman id 931063;
 Fri, 28 Mar 2025 17:41:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NUbA=WP=desiato.srs.infradead.org=BATV+f878977c41f865a1c0ff+7887+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1tyDhn-0007CY-2c
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 17:41:20 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d77f84d0-0bfb-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 18:41:13 +0100 (CET)
Received: from [172.31.31.145] (helo=u09cd745991455d.lumleys.internal)
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1tyDhB-00000006DLq-300h; Fri, 28 Mar 2025 17:40:41 +0000
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
X-Inumbo-ID: d77f84d0-0bfb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JPnCPVoECrVtgQmaLfb1ZqnjBAKnYw/LBS5xfH/Kzww=; b=mIpcsHT9ueH/HTYaC3UUPeUmB8
	cYLPyUP2/NMHkSmxzWU5Y9B8nle6J9YPQwHUgwr3k7PLnKveWOECAW0NUCdR+OXz9MgUuCROON7XO
	WrTVDstuDkFk/XrX3L+e/Buyd18RDzTGVKJfkNcdEZhh4WelFGwV1LLboes5efY2KI93y30wB2Urt
	HdCNYv3YAsve/Ijqffij5xONnCURved7MXUT6bVa1B8uGqwX3uAJPLBLsldQb/+z29Okofw0Q6NUs
	TCwhxsjyrNiFX46HZN+Yf1HKLrzVBeVoIgzDh5I2bNlstzI6mGCIjxrapftKzNhZbukPZlojelKnr
	vJkyxH4A==;
Message-ID: <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
Subject: Re: Using Restricted DMA for virtio-pci
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>,  Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>,  boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, heikki.krogerus@linux.intel.com,
 peterz@infradead.org,  benh@kernel.crashing.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org,  sstabellini@kernel.org, Saravana
 Kannan <saravanak@google.com>,  xypron.glpk@gmx.de, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>,  Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, xen-devel@lists.xenproject.org, Thierry Reding
 <treding@nvidia.com>,  linux-devicetree <devicetree@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Boichat <drinkcat@chromium.org>, 
 Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jim
 Quinlan <james.quinlan@broadcom.com>,  Robin Murphy <robin.murphy@arm.com>,
 hch@infradead.org, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, virtualization@lists.linux.dev, graf@amazon.de
Date: Fri, 28 Mar 2025 17:40:41 +0000
In-Reply-To: <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
	 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
	 <20250321142947-mutt-send-email-mst@kernel.org>
	 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-bs5xdYihL7ybWVIuw5hf"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-bs5xdYihL7ybWVIuw5hf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
> On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > > This series implements mitigations for lack of DMA access control o=
n
> > > > systems without an IOMMU, which could result in the DMA accessing t=
he
> > > > system memory at unexpected times and/or unexpected addresses, poss=
ibly
> > > > leading to data leakage or corruption.
> > >=20
> > > Replying to an ancient (2021) thread which has already been merged...
> > >=20
> > > I'd like to be able to use this facility for virtio devices.
> > >=20
> > > Virtio already has a complicated relationship with the DMA API, becau=
se
> > > there were a bunch of early VMM bugs where the virtio devices where
> > > magically exempted from IOMMU protection, but the VMM lied to the gue=
st
> > > and claimed they weren't.
> > >=20
> > > With the advent of confidential computing, and the VMM (or whatever's
> > > emulating the virtio device) not being *allowed* to arbitrarily acces=
s
> > > all of the guest's memory, the DMA API becomes necessary again.
> > >=20
> > > Either a virtual IOMMU needs to determine which guest memory the VMM
> > > may access, or the DMA API is wrappers around operations which
> > > share/unshare (or unencrypt/encrypt) the memory in question.
> > >=20
> > > All of which is complicated and slow, if we're looking at a minimal
> > > privileged hypervisor stub like pKVM which enforces the lack of guest
> > > memory access from VMM.
> > >=20
> > > I'm thinking of defining a new type of virtio-pci device which cannot
> > > do DMA to arbitrary system memory. Instead it has an additional memor=
y
> > > BAR which is used as a SWIOTLB for bounce buffering.
> > >=20
> > > The driver for it would look much like the existing virtio-pci device
> > > except that it would register the restricted-dma region first (and th=
us
> > > the swiotlb dma_ops), and then just go through the rest of the setup
> > > like any other virtio device.
> > >=20
> > > That seems like it ought to be fairly simple, and seems like a
> > > reasonable way to allow an untrusted VMM to provide virtio devices wi=
th
> > > restricted DMA access.
> > >=20
> > > While I start actually doing the typing... does anyone want to start
> > > yelling at me now? Christoph? mst? :)
> >=20
> >=20
> > I don't mind as such (though I don't understand completely), but since
> > this is changing the device anyway, I am a bit confused why you can't
> > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?=C2=A0 This forces DM=
A API
> > which will DTRT for you, will it not?
>=20
> That would be necessary but not sufficient. ...

My first cut at a proposed spec change looks something like this. I'll
post it to the virtio-comment list once I've done some corporate
bureaucracy and when the list stops sending me python tracebacks in
response to my subscribe request.

In the meantime I'll hack up some QEMU and guest Linux driver support
to match.

diff --git a/content.tex b/content.tex
index c17ffa6..1e6e1d6 100644
--- a/content.tex
+++ b/content.tex
@@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feat=
ure Bits}
 Currently these device-independent feature bits are defined:
=20
 \begin{description}
+  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
+  provides a memory region which is to be used for bounce buffering,
+  rather than permitting direct memory access to system memory.
   \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
   that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
   flag set, as described in \ref{sec:Basic Facilities of a Virtio
@@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Fea=
ture Bits}
 VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only phys=
ical
 addresses to the device.
=20
+A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
+then pass only addresses within the Software IOTLB bounce buffer to the
+device.
+
 A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
=20
 A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
@@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Fea=
ture Bits}
 A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
 accepted.
=20
+A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
+provide a Software IOTLB bounce buffer.
+A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
+
 If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
 buffers in the same order in which they have been available.
=20
diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..23e0d57 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{se=
c:Virtio Transport Option
 \item ISR Status
 \item Device-specific configuration (optional)
 \item PCI configuration access
+\item SWIOTLB bounce buffer
 \end{itemize}
=20
 Each structure can be mapped by a Base Address register (BAR) belonging to
@@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{se=
c:Virtio Transport Option
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
 /* Vendor-specific data */
 #define VIRTIO_PCI_CAP_VENDOR_CFG        9
+/* Software IOTLB bounce buffer */
+#define VIRTIO_PCI_CAP_SWIOTLB           10
 \end{lstlisting}
=20
         Any other value is reserved for future use.
@@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virti=
o
 The driver MUST qualify the \field{vendor_id} before
 interpreting or writing into the Vendor data capability.
=20
+\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Software IOTLB bounce buffer capability}
+
+The optional Software IOTLB bounce buffer capability allows the
+device to provide a memory region which can be used by the driver
+driver for bounce buffering. This allows a device on the PCI
+transport to operate without DMA access to system memory addresses.
+
+The Software IOTLB region is referenced by the
+VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
+range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
+capability, if negotiated.
+
+\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virt=
io
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Software IOTLB bounce buffer capability}
+
+Devices which present the Software IOTLB bounce buffer capability
+SHOULD also offer the VIRTIO_F_SWIOTLB feature.
+
+\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virt=
io
+Transport Options / Virtio Over PCI Bus / PCI Device Layout /
+Software IOTLB bounce buffer capability}
+
+The driver SHOULD use the offered buffer in preference to passing system
+memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
+feature, then the driver MUST use the offered buffer and never pass system
+memory addresses to the device.
+
 \subsubsection{PCI configuration access capability}\label{sec:Virtio Trans=
port Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration =
access capability}
=20
 The VIRTIO_PCI_CAP_PCI_CFG capability


--=-bs5xdYihL7ybWVIuw5hf
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDMyODE3NDA0
MVowLwYJKoZIhvcNAQkEMSIEILaExtDESalMeFyIU2xg64vA50PsSQye7UMm5La4Np80MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAlgN9cFuRR7gt
l9Q424/euwCZUGEArW6YxaaPwuUG0NgoQSK+5qZs3K5KtEW3vbsNqX8r3LEWywSgZhSRBvQB164W
U+U0Qu8u65Sei/HSEJXXuKCohAEuuL35I1VSmQcx4/9wkVuyddaTOyq+pdHSsXodR8qke2wQlTKv
qipXg9lMdqv2M83jXMHl+nmfZ8nyUTFWhVZzNax80WgmDSF7Q39VG7NMsg6yj2nVBtOfEtci9n3v
DtGSjKbYGl0TzX6kIk7W23IVOMRdSUZMdPS4xCjRo6Wnea4MqBRkXxfZ4/g99W576bjRkOjtzWal
H7ilg+Dr4KRG06rpraec4eEGHQ1MvGn2FbGV9Ux2kILdvYQTiIp9GPFj2s3w+VITZN4IPo7CCOoG
Kk7XfsebF7XX3JSr5OEcPNmY3YiPiKrsTRiIcDSrdyAORQ/6gIjJOJT1V0u8r9yEMrgtXUyFp7b7
PO9p6+cHUAhWMkManMs1zrZUf4O2q+lXIWxCefWDEj/tA+En4PMIrQZ7thYE1N19mjvUM5tl1V52
jcl+woTy37QthLb1tcXTLCSXfXiTizdPqCzMFzgiFpRM444c2BPEz2AgLVwY9aIV0laWaawdXMA0
ie/24PNYZh5n9ixcckBNH8iGVqgpWxlkV+Yt9sxJlBTo/VRCJnwI1BKY5UXeHzoAAAAAAAA=


--=-bs5xdYihL7ybWVIuw5hf--

