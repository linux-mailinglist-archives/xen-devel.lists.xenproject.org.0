Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BEC51BF43
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 14:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322096.543298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmacG-0005z0-N1; Thu, 05 May 2022 12:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322096.543298; Thu, 05 May 2022 12:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmacG-0005w5-Jt; Thu, 05 May 2022 12:29:56 +0000
Received: by outflank-mailman (input) for mailman id 322096;
 Thu, 05 May 2022 12:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nmacF-0005vx-LC
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 12:29:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e97b601-cc6f-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 14:29:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90D9B1F8BD;
 Thu,  5 May 2022 12:29:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5BED713A65;
 Thu,  5 May 2022 12:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aMsBFUHDc2KuAgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 05 May 2022 12:29:53 +0000
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
X-Inumbo-ID: 0e97b601-cc6f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651753793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9vamwImk0t8OduVCZ2cH+IuqWspf5M+PUNeFEMyLaNI=;
	b=KydLLjdUXc+bdEOB98vmTITOIaYqH1torezgvR9N8HhPKldrE2xJAlXyYw4Vn+ejFmWcfe
	QIqq3qq9u2elAAvHFgopQCorTj2gZtKsjkN19+le/RzRp/SphVyaXuEg7BcyHZAO8751S5
	DvPR9yODj79FHHJD8NhCtiGyVqWEZqk=
Message-ID: <b19b0e49-d89b-7f94-0206-e85909fdc149@suse.com>
Date: Thu, 5 May 2022 14:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/2] xen: add support for initializing xenstore later
 as HVM domain
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
 <20220505002304.401417-2-sstabellini@kernel.org>
 <ca690076-dbbf-0f57-5e8b-af7bc6a9a14b@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <ca690076-dbbf-0f57-5e8b-af7bc6a9a14b@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------37AFpT5JzY4QS3SQBqr09ro7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------37AFpT5JzY4QS3SQBqr09ro7
Content-Type: multipart/mixed; boundary="------------sxuqtKRsG1hv02k5Rl6BxGyf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michal Orzel <michal.orzel@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <b19b0e49-d89b-7f94-0206-e85909fdc149@suse.com>
Subject: Re: [PATCH v4 2/2] xen: add support for initializing xenstore later
 as HVM domain
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
 <20220505002304.401417-2-sstabellini@kernel.org>
 <ca690076-dbbf-0f57-5e8b-af7bc6a9a14b@arm.com>
In-Reply-To: <ca690076-dbbf-0f57-5e8b-af7bc6a9a14b@arm.com>

--------------sxuqtKRsG1hv02k5Rl6BxGyf
Content-Type: multipart/mixed; boundary="------------zI0C7aImK9MvIQ74H35QFogn"

--------------zI0C7aImK9MvIQ74H35QFogn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjIgMTQ6MjYsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4gSGkgTHVjYSwNCj4g
DQo+IE9uIDA1LjA1LjIwMjIgMDI6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+
IEZyb206IEx1Y2EgTWljY2lvIDxsdWNtaWNjaW9AZ21haWwuY29tPg0KPj4NCj4+IFdoZW4g
cnVubmluZyBhcyBkb20wbGVzcyBndWVzdCAoSFZNIGRvbWFpbiBvbiBBUk0pIHRoZSB4ZW5z
dG9yZSBldmVudA0KPj4gY2hhbm5lbCBpcyBhdmFpbGFibGUgYXQgZG9tYWluIGNyZWF0aW9u
IGJ1dCB0aGUgc2hhcmVkIHhlbnN0b3JlDQo+PiBpbnRlcmZhY2UgcGFnZSBvbmx5IGJlY29t
ZXMgYXZhaWxhYmxlIGxhdGVyIG9uLg0KPj4NCj4+IEluIHRoYXQgY2FzZSwgd2FpdCBmb3Ig
YSBub3RpZmljYXRpb24gb24gdGhlIHhlbnN0b3JlIGV2ZW50IGNoYW5uZWwsDQo+PiB0aGVu
IGNvbXBsZXRlIHRoZSB4ZW5zdG9yZSBpbml0aWFsaXphdGlvbiBsYXRlciwgd2hlbiB0aGUg
c2hhcmVkIHBhZ2UNCj4+IGlzIGFjdHVhbGx5IGF2YWlsYWJsZS4NCj4+DQo+PiBUaGUgeGVu
c3RvcmUgcGFnZSBoYXMgZmV3IGV4dHJhIGZpZWxkLiBBZGQgdGhlbSB0byB0aGUgc2hhcmVk
IHN0cnVjdC4NCj4+IE9uZSBvZiB0aGUgZmllbGQgaXMgImNvbm5lY3Rpb24iLCB3aGVuIHRo
ZSBjb25uZWN0aW9uIGlzIHJlYWR5LCBpdCBpcw0KPj4gemVyby4gSWYgdGhlIGNvbm5lY3Rp
b24gaXMgbm90LXplcm8sIHdhaXQgZm9yIGEgbm90aWZpY2F0aW9uLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEx1Y2EgTWljY2lvIDxsdWNtaWNjaW9AZ21haWwuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54
LmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2NDoNCj4+IC0gaW1wcm92ZSBpbi1jb2Rl
IGNvbW1lbnRzDQo+PiAtIG1vdmUgaGVhZGVyIHN5bmMgdG8gc2VwYXJhdGUgcGF0Y2gNCj4+
IC0gdXNlIFhFTlNUT1JFX0NPTk5FQ1RFRA0KPj4NCj4+IENoYW5nZXMgaW4gdjM6DQo+PiAt
IGNoZWNrIGZvciB0aGUgY29ubmVjdGlvbiBmaWVsZCwgaWYgaXQgaXMgbm90IHplcm8sIHdh
aXQgZm9yIGV2ZW50DQo+Pg0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gcmVtb3ZlIFhFTkZF
QVRfeGVuc3RvcmVfbGF0ZV9pbml0DQo+PiAtLS0NCj4+ICAgZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c19wcm9iZS5jIHwgOTEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUu
YyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYw0KPj4gaW5kZXggZmUzNjBj
MzNjZTcxLi4wYTc4NWQ1ZTNlNDAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlLmMNCj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmUuYw0KPj4gQEAgLTY1LDYgKzY1LDcgQEANCj4+ICAgI2luY2x1ZGUgInhlbmJ1cy5o
Ig0KPj4gICANCj4+ICAgDQo+PiArc3RhdGljIGludCB4c19pbml0X2lycTsNCj4+ICAgaW50
IHhlbl9zdG9yZV9ldnRjaG47DQo+PiAgIEVYUE9SVF9TWU1CT0xfR1BMKHhlbl9zdG9yZV9l
dnRjaG4pOw0KPj4gICANCj4+IEBAIC03NTAsNiArNzUxLDIwIEBAIHN0YXRpYyB2b2lkIHhl
bmJ1c19wcm9iZSh2b2lkKQ0KPj4gICB7DQo+PiAgIAl4ZW5zdG9yZWRfcmVhZHkgPSAxOw0K
Pj4gICANCj4+ICsJaWYgKCF4ZW5fc3RvcmVfaW50ZXJmYWNlKSB7DQo+PiArCQl4ZW5fc3Rv
cmVfaW50ZXJmYWNlID0geGVuX3JlbWFwKHhlbl9zdG9yZV9nZm4gPDwgWEVOX1BBR0VfU0hJ
RlQsDQo+PiArCQkJCQkJWEVOX1BBR0VfU0laRSk7DQo+PiArCQkvKg0KPj4gKwkJICogTm93
IGl0IGlzIHNhZmUgdG8gZnJlZSB0aGUgSVJRIHVzZWQgZm9yIHhlbnN0b3JlIGxhdGUNCj4+
ICsJCSAqIGluaXRpYWxpemF0aW9uLiBObyBuZWVkIHRvIHVuYmluZDogaXQgaXMgYWJvdXQg
dG8gYmUNCj4+ICsJCSAqIGJvdW5kIGFnYWluIGZyb20geGJfaW5pdF9jb21tcy4gTm90ZSB0
aGF0IGNhbGxpbmcNCj4+ICsJCSAqIHVuYmluZF9mcm9tX2lycWhhbmRsZXIgbm93IHdvdWxk
IHJlc3VsdCBpbiB4ZW5fZXZ0Y2huX2Nsb3NlKCkNCj4+ICsJCSAqIGJlaW5nIGNhbGxlZCBh
bmQgdGhlIGV2ZW50IGNoYW5uZWwgbm90IGJlaW5nIGVuYWJsZWQgYWdhaW4NCj4+ICsJCSAq
IGFmdGVyd2FyZHMsIHJlc3VsdGluZyBpbiBtaXNzZWQgZXZlbnQgbm90aWZpY2F0aW9ucy4N
Cj4+ICsJCSAqLw0KPj4gKwkJZnJlZV9pcnEoeHNfaW5pdF9pcnEsICZ4Yl93YWl0cSk7DQo+
PiArCX0NCj4+ICsNCj4+ICAgCS8qDQo+PiAgIAkgKiBJbiB0aGUgSFZNIGNhc2UsIHhlbmJ1
c19pbml0KCkgZGVmZXJyZWQgaXRzIGNhbGwgdG8NCj4+ICAgCSAqIHhzX2luaXQoKSBpbiBj
YXNlIGNhbGxiYWNrcyB3ZXJlIG5vdCBvcGVyYXRpb25hbCB5ZXQuDQo+PiBAQCAtNzk4LDIw
ICs4MTMsMjIgQEAgc3RhdGljIGludCBfX2luaXQgeGVuYnVzX3Byb2JlX2luaXRjYWxsKHZv
aWQpDQo+PiAgIHsNCj4+ICAgCS8qDQo+PiAgIAkgKiBQcm9iZSBYZW5CdXMgaGVyZSBpbiB0
aGUgWFNfUFYgY2FzZSwgYW5kIGFsc28gWFNfSFZNIHVubGVzcyB3ZQ0KPj4gLQkgKiBuZWVk
IHRvIHdhaXQgZm9yIHRoZSBwbGF0Zm9ybSBQQ0kgZGV2aWNlIHRvIGNvbWUgdXAuDQo+PiAr
CSAqIG5lZWQgdG8gd2FpdCBmb3IgdGhlIHBsYXRmb3JtIFBDSSBkZXZpY2UgdG8gY29tZSB1
cCBvcg0KPj4gKwkgKiB4ZW5fc3RvcmVfaW50ZXJmYWNlIGlzIG5vdCByZWFkeS4NCj4+ICAg
CSAqLw0KPj4gICAJaWYgKHhlbl9zdG9yZV9kb21haW5fdHlwZSA9PSBYU19QViB8fA0KPj4g
ICAJICAgICh4ZW5fc3RvcmVfZG9tYWluX3R5cGUgPT0gWFNfSFZNICYmDQo+PiAtCSAgICAg
IXhzX2h2bV9kZWZlcl9pbml0X2Zvcl9jYWxsYmFjaygpKSkNCj4+ICsJICAgICAheHNfaHZt
X2RlZmVyX2luaXRfZm9yX2NhbGxiYWNrKCkgJiYNCj4+ICsJICAgICB4ZW5fc3RvcmVfaW50
ZXJmYWNlICE9IE5VTEwpKQ0KPj4gICAJCXhlbmJ1c19wcm9iZSgpOw0KPj4gICANCj4+ICAg
CS8qDQo+PiAtCSAqIEZvciBYU19MT0NBTCwgc3Bhd24gYSB0aHJlYWQgd2hpY2ggd2lsbCB3
YWl0IGZvciB4ZW5zdG9yZWQNCj4+IC0JICogb3IgYSB4ZW5zdG9yZS1zdHViZG9tIHRvIGJl
IHN0YXJ0ZWQsIHRoZW4gcHJvYmUuIEl0IHdpbGwgYmUNCj4+IC0JICogdHJpZ2dlcmVkIHdo
ZW4gY29tbXVuaWNhdGlvbiBzdGFydHMgaGFwcGVuaW5nLCBieSB3YWl0aW5nDQo+PiAtCSAq
IG9uIHhiX3dhaXRxLg0KPj4gKwkgKiBGb3IgWFNfTE9DQUwgb3Igd2hlbiB4ZW5fc3RvcmVf
aW50ZXJmYWNlIGlzIG5vdCByZWFkeSwgc3Bhd24gYQ0KPj4gKwkgKiB0aHJlYWQgd2hpY2gg
d2lsbCB3YWl0IGZvciB4ZW5zdG9yZWQgb3IgYSB4ZW5zdG9yZS1zdHViZG9tIHRvIGJlDQo+
PiArCSAqIHN0YXJ0ZWQsIHRoZW4gcHJvYmUuICBJdCB3aWxsIGJlIHRyaWdnZXJlZCB3aGVu
IGNvbW11bmljYXRpb24NCj4+ICsJICogc3RhcnRzIGhhcHBlbmluZywgYnkgd2FpdGluZyBv
biB4Yl93YWl0cS4NCj4+ICAgCSAqLw0KPj4gLQlpZiAoeGVuX3N0b3JlX2RvbWFpbl90eXBl
ID09IFhTX0xPQ0FMKSB7DQo+PiArCWlmICh4ZW5fc3RvcmVfZG9tYWluX3R5cGUgPT0gWFNf
TE9DQUwgfHwgeGVuX3N0b3JlX2ludGVyZmFjZSA9PSBOVUxMKSB7DQo+PiAgIAkJc3RydWN0
IHRhc2tfc3RydWN0ICpwcm9iZV90YXNrOw0KPj4gICANCj4+ICAgCQlwcm9iZV90YXNrID0g
a3RocmVhZF9ydW4oeGVuYnVzX3Byb2JlX3RocmVhZCwgTlVMTCwNCj4+IEBAIC05MDcsMTAg
KzkyNCwyNSBAQCBzdGF0aWMgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIHhlbmJ1c19yZXN1bWVf
bmIgPSB7DQo+PiAgIAkubm90aWZpZXJfY2FsbCA9IHhlbmJ1c19yZXN1bWVfY2IsDQo+PiAg
IH07DQo+PiAgIA0KPj4gK3N0YXRpYyBpcnFyZXR1cm5fdCB4ZW5idXNfbGF0ZV9pbml0KGlu
dCBpcnEsIHZvaWQgKnVudXNlZCkNCj4+ICt7DQo+PiArCWludCBlcnIgPSAwOw0KPiBObyBu
ZWVkIHRvIHNldCB1cCBpbml0aWFsIHZhbHVlIGFzIGl0IGlzIGJlaW5nIHJlYXNzaWduZWQg
d2l0aG91dCB1c2luZyB0aGUgaW5pdGlhbCB2YWx1ZS4NCj4gDQo+PiArCXVpbnQ2NF90IHYg
PSAwOw0KPj4gKw0KPj4gKwllcnIgPSBodm1fZ2V0X3BhcmFtZXRlcihIVk1fUEFSQU1fU1RP
UkVfUEZOLCAmdik7DQo+PiArCWlmIChlcnIgfHwgIXYgfHwgIX52KQ0KPj4gKwkJcmV0dXJu
IElSUV9IQU5ETEVEOw0KPj4gKwl4ZW5fc3RvcmVfZ2ZuID0gKHVuc2lnbmVkIGxvbmcpdjsN
Cj4+ICsNCj4+ICsJd2FrZV91cCgmeGJfd2FpdHEpOw0KPj4gKwlyZXR1cm4gSVJRX0hBTkRM
RUQ7DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfaW5pdCh2
b2lkKQ0KPj4gICB7DQo+PiAgIAlpbnQgZXJyOw0KPj4gICAJdWludDY0X3QgdiA9IDA7DQo+
PiArCWJvb2wgd2FpdCA9IGZhbHNlOw0KPj4gICAJeGVuX3N0b3JlX2RvbWFpbl90eXBlID0g
WFNfVU5LTk9XTjsNCj4+ICAgDQo+PiAgIAlpZiAoIXhlbl9kb21haW4oKSkNCj4+IEBAIC05
NTcsMjUgKzk4OSw0NCBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfaW5pdCh2b2lkKQ0K
Pj4gICAJCSAqIGJlZW4gcHJvcGVybHkgaW5pdGlhbGl6ZWQuIEluc3RlYWQgb2YgYXR0ZW1w
dGluZyB0byBtYXAgYQ0KPj4gICAJCSAqIHdyb25nIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mg
cmV0dXJuIGVycm9yLg0KPj4gICAJCSAqDQo+PiAtCQkgKiBBbHNvIHJlY29nbml6ZSBhbGwg
Yml0cyBzZXQgYXMgYW4gaW52YWxpZCB2YWx1ZS4NCj4+ICsJCSAqIEFsc28gcmVjb2duaXpl
IGFsbCBiaXRzIHNldCBhcyBhbiBpbnZhbGlkL3VuaW5pdGlhbGl6ZWQgdmFsdWUuDQo+PiAg
IAkJICovDQo+PiAtCQlpZiAoIXYgfHwgIX52KSB7DQo+PiArCQlpZiAoIXYpIHsNCj4+ICAg
CQkJZXJyID0gLUVOT0VOVDsNCj4+ICAgCQkJZ290byBvdXRfZXJyb3I7DQo+PiAgIAkJfQ0K
Pj4gLQkJLyogQXZvaWQgdHJ1bmNhdGlvbiBvbiAzMi1iaXQuICovDQo+PiArCQlpZiAodiA9
PSB+MFVMTCkgew0KPiBObyBuZWVkIGZvciBicmFja2V0cyBmb3IgYSBzaW5nbGUgaW5zdHJ1
Y3Rpb24uDQoNClRoZSBjb2Rpbmcgc3R5bGUgc2F5cyBvdGhlcndpc2U6DQoNCiAgIFRoaXMg
ZG9lcyBub3QgYXBwbHkgaWYgb25seSBvbmUgYnJhbmNoIG9mIGEgY29uZGl0aW9uYWwgc3Rh
dGVtZW50IGlzIGEgc2luZ2xlDQogICBzdGF0ZW1lbnQ7IGluIHRoZSBsYXR0ZXIgY2FzZSB1
c2UgYnJhY2VzIGluIGJvdGggYnJhbmNoZXM6DQoNCiAgIC4uIGNvZGUtYmxvY2s6OiBjDQoN
CiAgICAgICAgIGlmIChjb25kaXRpb24pIHsNCiAgICAgICAgICAgICAgICAgZG9fdGhpcygp
Ow0KICAgICAgICAgICAgICAgICBkb190aGF0KCk7DQogICAgICAgICB9IGVsc2Ugew0KICAg
ICAgICAgICAgICAgICBvdGhlcndpc2UoKTsNCiAgICAgICAgIH0NCg0KDQpKdWVyZ2VuDQo=

--------------zI0C7aImK9MvIQ74H35QFogn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------zI0C7aImK9MvIQ74H35QFogn--

--------------sxuqtKRsG1hv02k5Rl6BxGyf--

--------------37AFpT5JzY4QS3SQBqr09ro7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJzw0AFAwAAAAAACgkQsN6d1ii/Ey9/
8Af+KFHWc8MW9qDR1heCY0rrSOwDTk2yMGiFmXInyCjHBAXj5PhbgY593/7IlPpK0k4LGJfoKRID
a1MOFVSNsIv1GZkIdReEgcTBHmn432bI12ZiYFlcQomE80EXBgBxrJFdD+e4qhslqohm55CUTC5U
XIR+h+4hjNKU+4S8Xhb1LU5VDck9ckMqHKyWBEEN1WA5p3cuPlOSVD+KywdxEVYf9Ab/ksZTMIGk
mBFr25EOQWhHxTnDWyN+2QSlyBcnqO8eKD7dOnl4hUBGiVWbiEBlxOGdZcdmc2kgHiWWdc5hLnsx
4gRwIfa8e9vJ7uXCly6o530Xcw4uqJDmb0uoaZha1Q==
=D/Fk
-----END PGP SIGNATURE-----

--------------37AFpT5JzY4QS3SQBqr09ro7--

