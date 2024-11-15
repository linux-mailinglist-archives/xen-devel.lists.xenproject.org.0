Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981B59CD4CB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 01:46:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836856.1252758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBkTM-0006i6-CW; Fri, 15 Nov 2024 00:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836856.1252758; Fri, 15 Nov 2024 00:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBkTM-0006gR-9m; Fri, 15 Nov 2024 00:46:04 +0000
Received: by outflank-mailman (input) for mailman id 836856;
 Fri, 15 Nov 2024 00:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7N1=SK=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tBkTK-0006gL-Rq
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 00:46:03 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa3a323c-a2ea-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 01:45:57 +0100 (CET)
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
X-Inumbo-ID: fa3a323c-a2ea-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5My4xNDIuNDMuNTUiLCJoZWxvIjoiZ2Fsb2lzLmxpbnV0cm9uaXguZGUifQ==
X-Custom-Transaction: eyJpZCI6ImZhM2EzMjNjLWEyZWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjMxNTU4LjAwNTEyMiwic2VuZGVyIjoidGdseEBsaW51dHJvbml4LmRlIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731631556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmlctHEns5HH4kuTaBjX2JNcI1LzVOydASF++UAbmDY=;
	b=QOnTTM3upVgvLOqHHkULAR/Sd+IXv2/jwWShAxdu/d9Ou3VRQKwRFQcKkxYFlQbNCHuDKC
	qmtZIl1QGU9LvuaVEHVi6mN8leBtPwfqyHUmV8sQ4okR7sVQBV4nqtQqHtK44NZWa+achm
	KJtmcrXFernLrXFh8br79W+BBZcbUPnfW6G5ETbNxP5n4/wMMrok/VJbm/1lHIAX31JScD
	X4TbcxeFRb0UaQ4ZOxoYrise9V26pZtUHGM6uIGxT7DAWZfdtWm58X+EkXZorarJx6j3sJ
	jv7CYR1gtAzR1m3FucHfJnoCrMS9Ay9Ifg0KTixSjK7w1MQSxCZuE9xVfV0ltA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731631556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmlctHEns5HH4kuTaBjX2JNcI1LzVOydASF++UAbmDY=;
	b=B6FonATMAX4OxdtMR8JNBP8qWfBOIV1vFazP675PCOfWlXztCY+avvBu11Vcb9coe6V9WE
	q7IVbFH9tV+539Aw==
To: Philipp Stanner <pstanner@redhat.com>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dubov <oakad@yahoo.com>,
 Sudarsana Kalluru <skalluru@marvell.com>, Manish Chopra
 <manishc@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rasesh Mody
 <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Igor Mitsyanko
 <imitsyanko@quantenna.com>, Sergey Matyukevich <geomatsi@gmail.com>, Kalle
 Valo <kvalo@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, Shyam Sundar
 S K <Shyam-sundar.S-k@amd.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Williamson <alex.williamson@redhat.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Chen Ni <nichen@iscas.ac.cn>, Ricky Wu
 <ricky_wu@realtek.com>, Al Viro <viro@zeniv.linux.org.uk>, Breno Leitao
 <leitao@debian.org>, Kevin Tian <kevin.tian@intel.com>, Mostafa Saleh
 <smostafa@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yi
 Liu <yi.l.liu@intel.com>, Kunwu Chan <chentao@kylinos.cn>, Ankit Agrawal
 <ankita@nvidia.com>, Christian Brauner <brauner@kernel.org>, Reinette
 Chatre <reinette.chatre@intel.com>, Eric
 Auger <eric.auger@redhat.com>, Ye Bin <yebin10@huawei.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ntb@lists.linux.dev,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 11/11] Remove devres from pci_intx()
In-Reply-To: <49bb6fc9ebff3cae844da0465ceadeef8d3217c7.camel@redhat.com>
References: <20241113124158.22863-2-pstanner@redhat.com>
 <20241113124158.22863-13-pstanner@redhat.com> <87msi3ksru.ffs@tglx>
 <49bb6fc9ebff3cae844da0465ceadeef8d3217c7.camel@redhat.com>
Date: Fri, 15 Nov 2024 01:46:13 +0100
Message-ID: <8734jtl3xm.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCBOb3YgMTQgMjAyNCBhdCAxMDowNSwgUGhpbGlwcCBTdGFubmVyIHdyb3RlOg0KPiBP
biBXZWQsIDIwMjQtMTEtMTMgYXQgMTc6MjIgKzAxMDAsIFRob21hcyBHbGVpeG5lciB3cm90ZToN
Cj4+IE9uIFdlZCwgTm92IDEzIDIwMjQgYXQgMTM6NDEsIFBoaWxpcHAgU3Rhbm5lciB3cm90ZToN
Cj4+ID4gcGNpX2ludHgoKSBpcyBhIGh5YnJpZCBmdW5jdGlvbiB3aGljaCBjYW4gc29tZXRpbWVz
IGJlIG1hbmFnZWQNCj4+ID4gdGhyb3VnaA0KPj4gPiBkZXZyZXMuIFRoaXMgaHlicmlkIG5hdHVy
ZSBpcyB1bmRlc2lyYWJsZS4NCj4+ID4gDQo+PiA+IFNpbmNlIGFsbCB1c2VycyBvZiBwY2lfaW50
eCgpIGhhdmUgYnkgbm93IGJlZW4gcG9ydGVkIGVpdGhlciB0bw0KPj4gPiBhbHdheXMtbWFuYWdl
ZCBwY2ltX2ludHgoKSBvciBuZXZlci1tYW5hZ2VkIHBjaV9pbnR4X3VubWFuYWdlZCgpLA0KPj4g
PiB0aGUNCj4+ID4gZGV2cmVzIGZ1bmN0aW9uYWxpdHkgY2FuIGJlIHJlbW92ZWQgZnJvbSBwY2lf
aW50eCgpLg0KPj4gPiANCj4+ID4gQ29uc2VxdWVudGx5LCBwY2lfaW50eF91bm1hbmFnZWQoKSBp
cyBub3cgcmVkdW5kYW50LCBiZWNhdXNlDQo+PiA+IHBjaV9pbnR4KCkNCj4+ID4gaXRzZWxmIGlz
IG5vdyB1bm1hbmFnZWQuDQo+PiA+IA0KPj4gPiBSZW1vdmUgdGhlIGRldnJlcyBmdW5jdGlvbmFs
aXR5IGZyb20gcGNpX2ludHgoKS4gSGF2ZSBhbGwgdXNlcnMgb2YNCj4+ID4gcGNpX2ludHhfdW5t
YW5hZ2VkKCkgY2FsbCBwY2lfaW50eCgpLiBSZW1vdmUgcGNpX2ludHhfdW5tYW5hZ2VkKCkuDQo+
PiA+IA0KPj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFN0YW5uZXIgPHBzdGFubmVyQHJlZGhh
dC5jb20+DQo+PiA+IC0tLQ0KPj4gPiDCoGRyaXZlcnMvbWlzYy9jYXJkcmVhZGVyL3J0c3hfcGNy
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+PiA+IMKgZHJpdmVycy9taXNjL3Rp
Zm1fN3h4MS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2
ICstLQ0KPj4gPiDCoC4uLi9uZXQvZXRoZXJuZXQvYnJvYWRjb20vYm54MngvYm54MnhfbWFpbi5j
wqAgfMKgIDIgKy0NCj4+ID4gwqBkcml2ZXJzL25ldC9ldGhlcm5ldC9icm9jYWRlL2JuYS9ibmFk
LmPCoMKgwqDCoMKgwqAgfMKgIDIgKy0NCj4+ID4gwqBkcml2ZXJzL250Yi9ody9hbWQvbnRiX2h3
X2FtZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQ0KPj4gPiDCoGRyaXZl
cnMvbnRiL2h3L2ludGVsL250Yl9od19nZW4xLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstDQo+PiA+IMKgZHJpdmVycy9wY2kvZGV2cmVzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQ0KPj4gPiDCoGRyaXZlcnMvcGNpL21z
aS9hcGkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMiArLQ0KPj4gPiDCoGRyaXZlcnMvcGNpL21zaS9tc2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPj4gPiDCoGRyaXZlcnMvcGNp
L3BjaS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCA0MyArLS0tLS0tLS0tLS0tLS0NCj4+ID4gLS0tLQ0KPj4gPiDCoGRyaXZlcnMvdmZp
by9wY2kvdmZpb19wY2lfY29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0N
Cj4+ID4gwqBkcml2ZXJzL3ZmaW8vcGNpL3ZmaW9fcGNpX2ludHJzLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAxMCArKy0tLQ0KPj4gPiDCoGRyaXZlcnMveGVuL3hlbi1wY2liYWNrL2NvbmZf
c3BhY2VfaGVhZGVyLmPCoMKgIHzCoCAyICstDQo+PiA+IMKgaW5jbHVkZS9saW51eC9wY2kuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEg
LQ0KPj4gPiDCoDE0IGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9u
cygtKQ0KPj4gDQo+PiBOb3cgSSdtIHV0dGVybHkgY29uZnVzZWQuIFRoaXMgdW5kb2VzIHRoZSBw
Y2lfaW50eF91bm1hbmFnZWQoKSBjaHVybg0KPj4gd2hpY2ggeW91IGNhcmVmdWxseSBzcGxpdCBp
bnRvIHNldmVyYWwgcGF0Y2hlcyBmaXJzdC4NCj4NCj4gSGF2ZSB5b3UgcmVhZCB0aGUgZW1haWwg
SSBoYXZlIGxpbmtlZD8NCj4NCj4gVGhlcmUgaXMgYWxzbyB0aGUgY292ZXItbGV0dGVyIChkb2Vz
IGFueW9uZSBpbiB0aGUgY29tbXVuaXR5IGV2ZXIgcmVhZA0KPiB0aG9zZT8pIHdoaWNoIGV4cGxp
Y2l0bHkgc3RhdGVzOg0KPg0KPiAiUGF0Y2ggIlJlbW92ZSBkZXZyZXMgZnJvbSBwY2lfaW50eCgp
IiBvYnZpb3VzbHkgcmV2ZXJ0cyB0aGUgcHJldmlvdXMNCj4gcGF0Y2hlcyB0aGF0IG1hZGUgZHJp
dmVycyB1c2UgcGNpX2ludHhfdW5tYW5hZ2VkKCkuIEJ1dCB0aGlzIHdheSBpdCdzDQo+IGVhc2ll
ciB0byByZXZpZXcgYW5kIGFwcHJvdmUuIEl0IGFsc28gbWFrZXMgc3VyZSB0aGF0IGVhY2ggY2hl
Y2tlZCBvdXQNCj4gY29tbWl0IHNob3VsZCBwcm92aWRlIGNvcnJlY3QgYmVoYXZpb3IsIG5vdCBq
dXN0IHRoZSBlbnRpcmUgc2VyaWVzIGFzIGENCj4gd2hvbGUuIg0KDQpJIHJlYWQgaXQgYW5kIEkg
YXNzdW1lIHlvdXIgaW50ZW50aW9uIHdhcyB0byBmb3JjZSBhbiBleWUgb24gZXZlcnkgdXNlDQpj
YXNlIG9mIHBjaV9pbnR4KCkgYW5kIG5vdCBqdXN0IG9uIHRob3NlIHdoaWNoIG5lZWQgdG8gYmUg
Y29udmVydGVkIHRvDQpwY2ltX2ludHgoKS4NCg0KSSdtIG5vdCBjb252aW5jZWQgdGhhdCB0aGlz
IGlzIG5lZWRlZCwgYnV0IGZhaXIgZW5vdWdoLg0KDQoNCg0KDQo=

