Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1967424FB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 13:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556796.869563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEprZ-0007qy-0k; Thu, 29 Jun 2023 11:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556796.869563; Thu, 29 Jun 2023 11:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEprY-0007pI-UG; Thu, 29 Jun 2023 11:31:00 +0000
Received: by outflank-mailman (input) for mailman id 556796;
 Thu, 29 Jun 2023 11:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3M7h=CR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qEprX-0007pC-N4
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 11:30:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ad7ecdf-1670-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 13:30:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F4341F8BF;
 Thu, 29 Jun 2023 11:30:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60EF4139FF;
 Thu, 29 Jun 2023 11:30:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4IzKFXFrnWR9PAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Jun 2023 11:30:57 +0000
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
X-Inumbo-ID: 6ad7ecdf-1670-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688038257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJvLg1c3gBa+SVJTFINlkKNejeqAgP1aQiyvJTK+crE=;
	b=XoO6fsvKIXPkIA8Xl5uFsOMW8palD9GA+DozgScjdcVdpUAAx2kx6F7grBJjQCUJr7ILjp
	gTUQU9InXRVCl7N8OzWV5grkWG628Jm5EcJL4y/bsWtPpQTGjm8k3QTkRvZx/6ex/674m1
	xoS941kckew2tQqBcOrVwGfRXOKSsM8=
Message-ID: <5ad21b11-2ed3-8c6f-f206-90bbda5ca9fb@suse.com>
Date: Thu, 29 Jun 2023 13:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
In-Reply-To: <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9u6renJFc9RdOVgz1pe1VTfy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9u6renJFc9RdOVgz1pe1VTfy
Content-Type: multipart/mixed; boundary="------------ds19vdV40vgIo3Jo69wssR77";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <5ad21b11-2ed3-8c6f-f206-90bbda5ca9fb@suse.com>
Subject: Re: [PATCH 10/11] tools/xenstore: drop use of tdb
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-11-jgross@suse.com>
 <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>
In-Reply-To: <e7e5d74e-9a74-2147-cd4d-e8e359742406@xen.org>

--------------ds19vdV40vgIo3Jo69wssR77
Content-Type: multipart/mixed; boundary="------------ktCg8aWSccVcjtJc9khwfjUb"

--------------ktCg8aWSccVcjtJc9khwfjUb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDYuMjMgMTU6MDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDMwLzA1LzIwMjMgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSBhbGwgWGVuc3RvcmUgbm9kZXMgYXJlIHN0b3JlZCBpbiBhIFREQiBkYXRhIGJhc2Uu
IFRoaXMgZGF0YSBiYXNlDQo+PiBoYXMgc2V2ZXJhbCBkaXNhZHZhbnRhZ2VzOg0KPj4NCj4+
IC0gaXQgaXMgdXNpbmcgYSBmaXhlZCBzaXplZCBoYXNoIHRhYmxlLCByZXN1bHRpbmcgaW4g
aGlnaCBtZW1vcnkNCj4+IMKgwqAgb3ZlcmhlYWQgZm9yIHNtYWxsIGluc3RhbGxhdGlvbnMg
d2l0aCBvbmx5IHZlcnkgZmV3IFZNcywgYW5kIGEgcmF0aGVyDQo+PiDCoMKgIGxhcmdlIHBl
cmZvcm1hbmNlIGhpdCBmb3Igc3lzdGVtcyB3aXRoIGxvdHMgb2YgVk1zIGR1ZSB0byBtYW55
DQo+PiDCoMKgIGNvbGxpc2lvbnMNCj4+DQo+PiAtIFhlbnN0b3JlIGlzIG9ubHkgc2luZ2xl
LXRocmVhZGVkLCB3aGlsZSBUREIgaXMgZGVzaWduZWQgdG8gYmUgZml0DQo+PiDCoMKgIGZv
ciBtdWx0aS10aHJlYWRlZCB1c2UgY2FzZXMsIHJlc3VsdGluZyBpbiBtdWNoIGhpZ2hlciBj
b2RlDQo+PiDCoMKgIGNvbXBsZXhpdHkgdGhhbiBuZWVkZWQNCj4+DQo+PiAtIHNwZWNpYWwg
dXNlIGNhc2VzIG9mIFhlbnN0b3JlIGFyZSBub3QgcG9zc2libGUgdG8gaW1wbGVtZW50IHdp
dGggVERCDQo+PiDCoMKgIGluIGFuIGVmZmVjdGl2ZSB3YXksIHdoaWxlIGFuIGltcGxlbWVu
dGF0aW9uIG9mIGEgZGF0YSBiYXNlIHRhaWxvcmVkDQo+PiDCoMKgIGZvciBYZW5zdG9yZSBj
b3VsZCBzaW1wbGlmeSBzb21lIGhhbmRsaW5nIChlLmcuIHRyYW5zYWN0aW9ucykgYSBsb3QN
Cj4+DQo+PiBTbyBkcm9wIHVzaW5nIFREQiBhbmQgc3RvcmUgdGhlIG5vZGVzIGRpcmVjdGx5
IGluIG1lbW9yeSBtYWtpbmcgdGhlbQ0KPj4gZWFzaWx5IGFjY2Vzc2libGUuIFVzZSBhIGhh
c2gtYmFzZWQgbG9va3VwIG1lY2hhbmlzbSBmb3IgZmFzdCBsb29rdXANCj4+IG9mIG5vZGVz
IGJ5IHRoZWlyIGZ1bGwgcGF0aC4NCj4+DQo+PiBGb3Igbm93IG9ubHkgcmVwbGFjZSBUREIg
a2VlcGluZyB0aGUgY3VycmVudCBhY2Nlc3MgZnVuY3Rpb25zLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gwqAg
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuY8KgwqDCoMKgwqDCoMKgIHwgMTUzICsr
KysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmjCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICstDQo+PiDCoCB0b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfdHJhbnNhY3Rpb24uYyB8wqDCoCAxIC0NCj4+IMKgIDMgZmlsZXMgY2hh
bmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgOTcgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBpbmRleCAxMmM1ODRmMDliLi45YjQ0ZGU5ZDMxIDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gQEAgLTUzLDcgKzUzLDYg
QEANCj4+IMKgICNpbmNsdWRlICJ4ZW5zdG9yZWRfZG9tYWluLmgiDQo+PiDCoCAjaW5jbHVk
ZSAieGVuc3RvcmVkX2NvbnRyb2wuaCINCj4+IMKgICNpbmNsdWRlICJ4ZW5zdG9yZWRfbHUu
aCINCj4+IC0jaW5jbHVkZSAidGRiLmgiDQo+PiDCoCAjaWZuZGVmIE5PX1NPQ0tFVFMNCj4+
IMKgICNpZiBkZWZpbmVkKEhBVkVfU1lTVEVNRCkNCj4+IEBAIC04NSw3ICs4NCw3IEBAIGJv
b2wga2VlcF9vcnBoYW5zID0gZmFsc2U7DQo+PiDCoCBzdGF0aWMgaW50IHJlb3Blbl9sb2df
cGlwZVsyXTsNCj4+IMKgIHN0YXRpYyBpbnQgcmVvcGVuX2xvZ19waXBlMF9wb2xsZmRfaWR4
ID0gLTE7DQo+PiDCoCBjaGFyICp0cmFjZWZpbGUgPSBOVUxMOw0KPj4gLXN0YXRpYyBUREJf
Q09OVEVYVCAqdGRiX2N0eCA9IE5VTEw7DQo+PiArc3RhdGljIHN0cnVjdCBoYXNodGFibGUg
Km5vZGVzOw0KPj4gwqAgdW5zaWduZWQgaW50IHRyYWNlX2ZsYWdzID0gVFJBQ0VfT0JKIHwg
VFJBQ0VfSU87DQo+PiDCoCBzdGF0aWMgY29uc3QgY2hhciAqc29ja21zZ19zdHJpbmcoZW51
bSB4c2Rfc29ja21zZ190eXBlIHR5cGUpOw0KPj4gQEAgLTU1NiwyOCArNTU1LDI5IEBAIHN0
YXRpYyB2b2lkIGluaXRpYWxpemVfZmRzKGludCAqcF9zb2NrX3BvbGxmZF9pZHgsIGludCAN
Cj4+ICpwdGltZW91dCkNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqAgfQ0KPj4gLXN0YXRpYyB2
b2lkIHNldF90ZGJfa2V5KGNvbnN0IGNoYXIgKm5hbWUsIFREQl9EQVRBICprZXkpDQo+PiAt
ew0KPj4gLcKgwqDCoCAvKg0KPj4gLcKgwqDCoMKgICogRHJvcHBpbmcgY29uc3QgaXMgZmlu
ZSBoZXJlLCBhcyB0aGUga2V5IHdpbGwgbmV2ZXIgYmUgbW9kaWZpZWQNCj4+IC3CoMKgwqDC
oCAqIGJ5IFREQi4NCj4+IC3CoMKgwqDCoCAqLw0KPj4gLcKgwqDCoCBrZXktPmRwdHIgPSAo
Y2hhciAqKW5hbWU7DQo+PiAtwqDCoMKgIGtleS0+ZHNpemUgPSBzdHJsZW4obmFtZSk7DQo+
PiAtfQ0KPj4gLQ0KPj4gwqAgdm9pZCAqZGJfZmV0Y2goY29uc3QgY2hhciAqZGJfbmFtZSwg
c2l6ZV90ICpzaXplKQ0KPj4gwqAgew0KPj4gLcKgwqDCoCBUREJfREFUQSBrZXksIGRhdGE7
DQo+PiArwqDCoMKgIHN0cnVjdCB4c190ZGJfcmVjb3JkX2hkciAqaGRyOw0KPiANCj4gQUZB
SUNULCB0aGlzIGNvdWxkIGJlIGNvbnN0Lg0KDQpZZXMuDQoNCj4gDQo+PiArwqDCoMKgIHZv
aWQgKnA7DQo+IA0KPiBwIHdpbGwgcG9pbnQgdG8geHNfdGRiX3JlY29yZF9oZHIsIHJpZ2h0
PyBJZiBzbywgSSB0aGluayBpdCBzaG91bGQgYmUgDQo+IHhzX3RkYl9yZWNvcmRfaGRyLg0K
DQpJIGFncmVlLg0KDQo+IA0KPj4gLcKgwqDCoCBzZXRfdGRiX2tleShkYl9uYW1lLCAma2V5
KTsNCj4+IC3CoMKgwqAgZGF0YSA9IHRkYl9mZXRjaCh0ZGJfY3R4LCBrZXkpOw0KPj4gLcKg
wqDCoCBpZiAoIWRhdGEuZHB0cikNCj4+IC3CoMKgwqDCoMKgwqDCoCBlcnJubyA9ICh0ZGJf
ZXJyb3IodGRiX2N0eCkgPT0gVERCX0VSUl9OT0VYSVNUKSA/IEVOT0VOVCA6IEVJTzsNCj4+
IC3CoMKgwqAgZWxzZQ0KPj4gLcKgwqDCoMKgwqDCoMKgICpzaXplID0gZGF0YS5kc2l6ZTsN
Cj4+ICvCoMKgwqAgaGRyID0gaGFzaHRhYmxlX3NlYXJjaChub2RlcywgZGJfbmFtZSk7DQo+
PiArwqDCoMKgIGlmICghaGRyKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgZXJybm8gPSBFTk9F
TlQ7DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+PiArwqDCoMKgIH0NCj4+
ICsNCj4+ICvCoMKgwqAgKnNpemUgPSBzaXplb2YoKmhkcikgKyBoZHItPm51bV9wZXJtcyAq
IHNpemVvZihoZHItPnBlcm1zWzBdKSArDQo+PiArwqDCoMKgwqDCoMKgwqAgaGRyLT5kYXRh
bGVuICsgaGRyLT5jaGlsZGxlbjsNCj4gDQo+IEFGQUlDVCwgdGhpcyBpcyB0aGUgc2FtZSBj
b21wdXRhdGlvbiBhcyBpbiB3cml0ZV9ub2RlX3Jhdy4gQ2FuIHdlIGludHJvZHVjZSBhIA0K
PiB3cmFwcGVyIGZvciBpdD8NCg0KT2theS4NCg0KPiANCj4+ICsNCj4+ICvCoMKgwqAgcCA9
IHRhbGxvY19zaXplKE5VTEwsICpzaXplKTsNCj4+ICvCoMKgwqAgaWYgKCFwKSB7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgZXJybm8gPSBFTk9NRU07DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIE5VTEw7DQo+PiArwqDCoMKgIH0NCj4+IC3CoMKgwqAgcmV0dXJuIGRhdGEuZHB0cjsN
Cj4+ICvCoMKgwqAgbWVtY3B5KHAsIGhkciwgKnNpemUpOw0KPiANCj4gSXQgd291bGQgYmUg
YSBnb29kIG9wcG9ydHVuaXR5IHRvIGV4cGxhaW4gdGhlIHJlYXNvbmluZyBiZWhpbmQgcmV0
dXJuaW5nIGEgZnJlc2ggDQo+IHZhbHVlIHJhdGhlciB0aGFuIGEgcG9pbnRlciBvbiB0aGUg
REIgZW50cnkuDQoNCkknbGwgYWRkIGEgY29tbWVudC4NCg0KPiANCj4+ICsNCj4+ICvCoMKg
wqAgcmV0dXJuIHA7DQo+PiDCoCB9DQo+PiDCoCBzdGF0aWMgdm9pZCBnZXRfYWNjX2RhdGEo
Y29uc3QgY2hhciAqbmFtZSwgc3RydWN0IG5vZGVfYWNjb3VudF9kYXRhICphY2MpDQo+PiBA
QCAtNjIxLDEyICs2MjEsMTAgQEAgaW50IGRiX3dyaXRlKHN0cnVjdCBjb25uZWN0aW9uICpj
b25uLCBjb25zdCBjaGFyIA0KPj4gKmRiX25hbWUsIHZvaWQgKmRhdGEsDQo+PiDCoMKgwqDC
oMKgIHN0cnVjdCB4c190ZGJfcmVjb3JkX2hkciAqaGRyID0gZGF0YTsNCj4+IMKgwqDCoMKg
wqAgc3RydWN0IG5vZGVfYWNjb3VudF9kYXRhIG9sZF9hY2MgPSB7fTsNCj4+IMKgwqDCoMKg
wqAgdW5zaWduZWQgaW50IG9sZF9kb21pZCwgbmV3X2RvbWlkOw0KPj4gK8KgwqDCoCBzaXpl
X3QgbmFtZV9sZW4gPSBzdHJsZW4oZGJfbmFtZSk7DQo+PiArwqDCoMKgIGNvbnN0IGNoYXIg
Km5hbWU7DQo+PiDCoMKgwqDCoMKgIGludCByZXQ7DQo+PiAtwqDCoMKgIFREQl9EQVRBIGtl
eSwgZGF0Ow0KPj4gLcKgwqDCoCBzZXRfdGRiX2tleShkYl9uYW1lLCAma2V5KTsNCj4+IC3C
oMKgwqAgZGF0LmRwdHIgPSBkYXRhOw0KPj4gLcKgwqDCoCBkYXQuZHNpemUgPSBzaXplOw0K
Pj4gwqDCoMKgwqDCoCBpZiAoIWFjYykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBvbGRfYWNj
Lm1lbW9yeSA9IC0xOw0KPj4gwqDCoMKgwqDCoCBlbHNlDQo+PiBAQCAtNjQyLDI5ICs2NDAs
MzYgQEAgaW50IGRiX3dyaXRlKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBjb25zdCBjaGFy
IA0KPj4gKmRiX25hbWUsIHZvaWQgKmRhdGEsDQo+PiDCoMKgwqDCoMKgwqAgKi8NCj4+IMKg
wqDCoMKgwqAgaWYgKG9sZF9hY2MubWVtb3J5KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRv
bWFpbl9tZW1vcnlfYWRkX25vY2hrKGNvbm4sIG9sZF9kb21pZCwNCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtb2xkX2FjYy5tZW1vcnkgLSBrZXkuZHNp
emUpOw0KPj4gLcKgwqDCoCByZXQgPSBkb21haW5fbWVtb3J5X2FkZChjb25uLCBuZXdfZG9t
aWQsIHNpemUgKyBrZXkuZHNpemUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLW9sZF9hY2MubWVtb3J5IC0gbmFtZV9sZW4pOw0KPj4gK8KgwqDCoCBy
ZXQgPSBkb21haW5fbWVtb3J5X2FkZChjb25uLCBuZXdfZG9taWQsIHNpemUgKyBuYW1lX2xl
biwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9fcXVvdGFfY2hl
Y2spOw0KPj4gwqDCoMKgwqDCoCBpZiAocmV0KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogRXJyb3IgcGF0aCwgc28gbm8gcXVvdGEgY2hlY2suICovDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKG9sZF9hY2MubWVtb3J5KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZG9tYWluX21lbW9yeV9hZGRfbm9jaGsoY29ubiwgb2xkX2RvbWlkLA0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2xkX2FjYy5tZW1v
cnkgKyBrZXkuZHNpemUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgb2xkX2FjYy5tZW1vcnkgKyBuYW1lX2xlbik7DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoCAv
KiBUREIgc2hvdWxkIHNldCBlcnJubywgYnV0IGRvZXNuJ3QgZXZlbiBzZXQgZWNvZGUgQUZB
SUNULiAqLw0KPj4gLcKgwqDCoCBpZiAodGRiX3N0b3JlKHRkYl9jdHgsIGtleSwgZGF0LA0K
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChmbGFnID09IE5PREVfQ1JFQVRFKSA/
IFREQl9JTlNFUlQgOiBUREJfTU9ESUZZKSAhPSAwKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAg
ZG9tYWluX21lbW9yeV9hZGRfbm9jaGsoY29ubiwgbmV3X2RvbWlkLCAtc2l6ZSAtIGtleS5k
c2l6ZSk7DQo+PiArwqDCoMKgIGlmIChmbGFnID09IE5PREVfQ1JFQVRFKSB7DQo+PiArwqDC
oMKgwqDCoMKgwqAgLyogZGJfbmFtZSBjb3VsZCBiZSBtb2RpZmllZCBsYXRlciwgc28gYWxs
b2NhdGUgYSBjb3B5LiAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgIG5hbWUgPSB0YWxsb2Nfc3Ry
ZHVwKGRhdGEsIGRiX25hbWUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IG5hbWUgPyBo
YXNodGFibGVfYWRkKG5vZGVzLCBuYW1lLCBkYXRhKSA6IEVOT01FTTsNCj4+ICvCoMKgwqAg
fSBlbHNlDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gaGFzaHRhYmxlX3JlcGxhY2Uobm9k
ZXMsIGRiX25hbWUsIGRhdGEpOw0KPj4gKw0KPj4gK8KgwqDCoCBpZiAocmV0KSB7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgLyogRnJlZSBkYXRhLCBhcyBpdCBpc24ndCBvd25lZCBieSBoYXNo
dGFibGUgbm93LiAqLw0KPj4gK8KgwqDCoMKgwqDCoMKgIHRhbGxvY19mcmVlKGRhdGEpOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGRvbWFpbl9tZW1vcnlfYWRkX25vY2hrKGNvbm4sIG5ld19k
b21pZCwgLXNpemUgLSBuYW1lX2xlbik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogRXJy
b3IgcGF0aCwgc28gbm8gcXVvdGEgY2hlY2suICovDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKG9sZF9hY2MubWVtb3J5KQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9t
YWluX21lbW9yeV9hZGRfbm9jaGsoY29ubiwgb2xkX2RvbWlkLA0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2xkX2FjYy5tZW1vcnkgKyBr
ZXkuZHNpemUpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGVycm5vID0gRUlPOw0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2xkX2FjYy5tZW1v
cnkgKyBuYW1lX2xlbik7DQo+PiArwqDCoMKgwqDCoMKgwqAgZXJybm8gPSByZXQ7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycm5vOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiAt
wqDCoMKgIHRyYWNlX3RkYigic3RvcmUgJXMgc2l6ZSAlenVcbiIsIGRiX25hbWUsIHNpemUg
KyBrZXkuZHNpemUpOw0KPj4gK8KgwqDCoCB0cmFjZV90ZGIoInN0b3JlICVzIHNpemUgJXp1
XG4iLCBkYl9uYW1lLCBzaXplICsgbmFtZV9sZW4pOw0KPj4gwqDCoMKgwqDCoCBpZiAoYWNj
KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogRG9uJ3QgdXNlIG5ld19kb21pZCwgYXMg
aXQgbWlnaHQgYmUgYSB0cmFuc2FjdGlvbiBub2RlLiAqLw0KPj4gQEAgLTY4MCw5ICs2ODUs
NiBAQCBpbnQgZGJfZGVsZXRlKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBjb25zdCBjaGFy
ICpuYW1lLA0KPiANCj4gQUZBSUNULCB3ZSB3aWxsIGFsd2F5cyByZXR1cm4gMCBhZnRlciB0
aGlzIHBhdGNoLiBEbyB5b3UgcGxhbiB0byBjbGVhbi11cCB0aGUgDQo+IHJldHVybiB0eXBl
Pw0KDQpHb29kIGNhdGNoLiBXaWxsIGRvIGl0IGluIGEgZm9sbG93dXAgcGF0Y2guDQoNCj4g
DQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBub2RlX2FjY291bnRfZGF0YSB0bXBf
YWNjOw0KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgZG9taWQ7DQo+PiAtwqDCoMKgIFRE
Ql9EQVRBIGtleTsNCj4+IC0NCj4+IC3CoMKgwqAgc2V0X3RkYl9rZXkobmFtZSwgJmtleSk7
DQo+PiDCoMKgwqDCoMKgIGlmICghYWNjKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYWNj
ID0gJnRtcF9hY2M7DQo+PiBAQCAtNjkxLDE1ICs2OTMsMTMgQEAgaW50IGRiX2RlbGV0ZShz
dHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgY29uc3QgY2hhciAqbmFtZSwNCj4+IMKgwqDCoMKg
wqAgZ2V0X2FjY19kYXRhKG5hbWUsIGFjYyk7DQo+PiAtwqDCoMKgIGlmICh0ZGJfZGVsZXRl
KHRkYl9jdHgsIGtleSkpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBlcnJubyA9IEVJTzsNCj4+
IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJybm87DQo+PiAtwqDCoMKgIH0NCj4+ICvCoMKg
wqAgaGFzaHRhYmxlX3JlbW92ZShub2RlcywgbmFtZSk7DQo+PiDCoMKgwqDCoMKgIHRyYWNl
X3RkYigiZGVsZXRlICVzXG4iLCBuYW1lKTsNCj4+IMKgwqDCoMKgwqAgaWYgKGFjYy0+bWVt
b3J5KSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG9taWQgPSBnZXRfYWNjX2RvbWlkKGNv
bm4sIG5hbWUsIGFjYy0+ZG9taWQpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGRvbWFpbl9tZW1v
cnlfYWRkX25vY2hrKGNvbm4sIGRvbWlkLCAtYWNjLT5tZW1vcnkgLSBrZXkuZHNpemUpOw0K
Pj4gK8KgwqDCoMKgwqDCoMKgIGRvbWFpbl9tZW1vcnlfYWRkX25vY2hrKGNvbm4sIGRvbWlk
LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC1hY2MtPm1l
bW9yeSAtIHN0cmxlbihuYW1lKSk7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIDA7DQo+PiBAQCAtMjM1Miw0MyArMjM1MiwyOSBAQCBzdGF0aWMgdm9pZCBtYW51
YWxfbm9kZShjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyIA0KPj4gKmNoaWxkKQ0KPj4g
wqDCoMKgwqDCoCB0YWxsb2NfZnJlZShub2RlKTsNCj4+IMKgIH0NCj4+IC1zdGF0aWMgdm9p
ZCB0ZGJfbG9nZ2VyKFREQl9DT05URVhUICp0ZGIsIGludCBsZXZlbCwgY29uc3QgY2hhciAq
IGZtdCwgLi4uKQ0KPj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgaGFzaF9mcm9tX2tleV9mbihj
b25zdCB2b2lkICprKQ0KPj4gwqAgew0KPj4gLcKgwqDCoCB2YV9saXN0IGFwOw0KPj4gLcKg
wqDCoCBjaGFyICpzOw0KPj4gLcKgwqDCoCBpbnQgc2F2ZWRfZXJybm8gPSBlcnJubzsNCj4+
ICvCoMKgwqAgY29uc3QgY2hhciAqc3RyID0gazsNCj4+ICvCoMKgwqAgdW5zaWduZWQgaW50
IGhhc2ggPSA1MzgxOw0KPj4gK8KgwqDCoCBjaGFyIGM7DQo+PiAtwqDCoMKgIHZhX3N0YXJ0
KGFwLCBmbXQpOw0KPj4gLcKgwqDCoCBzID0gdGFsbG9jX3Zhc3ByaW50ZihOVUxMLCBmbXQs
IGFwKTsNCj4+IC3CoMKgwqAgdmFfZW5kKGFwKTsNCj4+ICvCoMKgwqAgd2hpbGUgKChjID0g
KnN0cisrKSkNCj4+ICvCoMKgwqDCoMKgwqDCoCBoYXNoID0gKChoYXNoIDw8IDUpICsgaGFz
aCkgKyAodW5zaWduZWQgaW50KWM7DQo+PiAtwqDCoMKgIGlmIChzKSB7DQo+PiAtwqDCoMKg
wqDCoMKgwqAgdHJhY2UoIlREQjogJXNcbiIsIHMpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHN5
c2xvZyhMT0dfRVJSLCAiVERCOiAlcyIswqAgcyk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYg
KHZlcmJvc2UpDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4cHJpbnRmKCJUREI6ICVz
Iiwgcyk7DQo+PiAtwqDCoMKgwqDCoMKgwqAgdGFsbG9jX2ZyZWUocyk7DQo+PiAtwqDCoMKg
IH0gZWxzZSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgdHJhY2UoInRhbGxvYyBmYWlsdXJlIGR1
cmluZyBsb2dnaW5nXG4iKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzeXNsb2coTE9HX0VSUiwg
InRhbGxvYyBmYWlsdXJlIGR1cmluZyBsb2dnaW5nXG4iKTsNCj4+IC3CoMKgwqAgfQ0KPj4g
K8KgwqDCoCByZXR1cm4gaGFzaDsNCj4+ICt9DQo+PiAtwqDCoMKgIGVycm5vID0gc2F2ZWRf
ZXJybm87DQo+PiArc3RhdGljIGludCBrZXlzX2VxdWFsX2ZuKGNvbnN0IHZvaWQgKmtleTEs
IGNvbnN0IHZvaWQgKmtleTIpDQo+PiArew0KPj4gK8KgwqDCoCByZXR1cm4gMCA9PSBzdHJj
bXAoa2V5MSwga2V5Mik7DQo+PiDCoCB9DQo+PiDCoCB2b2lkIHNldHVwX3N0cnVjdHVyZShi
b29sIGxpdmVfdXBkYXRlKQ0KPj4gwqAgew0KPj4gLcKgwqDCoCBjaGFyICp0ZGJuYW1lOw0K
Pj4gLQ0KPj4gLcKgwqDCoCB0ZGJuYW1lID0gdGFsbG9jX3N0cmR1cCh0YWxsb2NfYXV0b2Zy
ZWVfY29udGV4dCgpLCAiL2Rldi9tZW0iKTsNCj4+IC3CoMKgwqAgaWYgKCF0ZGJuYW1lKQ0K
Pj4gLcKgwqDCoMKgwqDCoMKgIGJhcmZfcGVycm9yKCJDb3VsZCBub3QgY3JlYXRlIHRkYm5h
bWUiKTsNCj4+IC0NCj4+IC3CoMKgwqAgdGRiX2N0eCA9IHRkYl9vcGVuX2V4KHRkYm5hbWUs
IDc5MTksIFREQl9JTlRFUk5BTCB8IFREQl9OT0xPQ0ssDQo+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBPX1JEV1IgfCBPX0NSRUFUIHwgT19FWENMIHwgT19DTE9F
WEVDLA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDY0MCwgJnRk
Yl9sb2dnZXIsIE5VTEwpOw0KPj4gLcKgwqDCoCBpZiAoIXRkYl9jdHgpDQo+PiAtwqDCoMKg
wqDCoMKgwqAgYmFyZl9wZXJyb3IoIkNvdWxkIG5vdCBjcmVhdGUgdGRiIGZpbGUgJXMiLCB0
ZGJuYW1lKTsNCj4+ICvCoMKgwqAgbm9kZXMgPSBjcmVhdGVfaGFzaHRhYmxlKE5VTEwsICJu
b2RlcyIsIGhhc2hfZnJvbV9rZXlfZm4sIGtleXNfZXF1YWxfZm4sDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSEFTSFRBQkxFX0ZSRUVfS0VZIHwgSEFTSFRBQkxF
X0ZSRUVfVkFMVUUpOw0KPj4gK8KgwqDCoCBpZiAoIW5vZGVzKQ0KPj4gK8KgwqDCoMKgwqDC
oMKgIGJhcmZfcGVycm9yKCJDb3VsZCBub3QgY3JlYXRlIG5vZGVzIGhhc2h0YWJsZSIpOw0K
Pj4gwqDCoMKgwqDCoCBpZiAobGl2ZV91cGRhdGUpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
bWFudWFsX25vZGUoIi8iLCBOVUxMKTsNCj4+IEBAIC0yNDAyLDI0ICsyMzg4LDYgQEAgdm9p
ZCBzZXR1cF9zdHJ1Y3R1cmUoYm9vbCBsaXZlX3VwZGF0ZSkNCj4+IMKgwqDCoMKgwqAgfQ0K
Pj4gwqAgfQ0KPj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQgaGFzaF9mcm9tX2tleV9mbihjb25z
dCB2b2lkICprKQ0KPj4gLXsNCj4+IC3CoMKgwqAgY29uc3QgY2hhciAqc3RyID0gazsNCj4+
IC3CoMKgwqAgdW5zaWduZWQgaW50IGhhc2ggPSA1MzgxOw0KPj4gLcKgwqDCoCBjaGFyIGM7
DQo+PiAtDQo+PiAtwqDCoMKgIHdoaWxlICgoYyA9ICpzdHIrKykpDQo+PiAtwqDCoMKgwqDC
oMKgwqAgaGFzaCA9ICgoaGFzaCA8PCA1KSArIGhhc2gpICsgKHVuc2lnbmVkIGludCljOw0K
Pj4gLQ0KPj4gLcKgwqDCoCByZXR1cm4gaGFzaDsNCj4+IC19DQo+PiAtDQo+PiAtDQo+PiAt
c3RhdGljIGludCBrZXlzX2VxdWFsX2ZuKGNvbnN0IHZvaWQgKmtleTEsIGNvbnN0IHZvaWQg
KmtleTIpDQo+PiAtew0KPj4gLcKgwqDCoCByZXR1cm4gMCA9PSBzdHJjbXAoa2V5MSwga2V5
Mik7DQo+PiAtfQ0KPj4gLQ0KPj4gwqAgaW50IHJlbWVtYmVyX3N0cmluZyhzdHJ1Y3QgaGFz
aHRhYmxlICpoYXNoLCBjb25zdCBjaGFyICpzdHIpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKg
IGNoYXIgKmsgPSB0YWxsb2Nfc3RyZHVwKE5VTEwsIHN0cik7DQo+PiBAQCAtMjQ3OSwxMiAr
MjQ0NywxMSBAQCBzdGF0aWMgaW50IGNoZWNrX3N0b3JlX2Vub2VudChjb25zdCB2b2lkICpj
dHgsIHN0cnVjdCANCj4+IGNvbm5lY3Rpb24gKmNvbm4sDQo+PiDCoCAvKioNCj4+IMKgwqAg
KiBIZWxwZXIgdG8gY2xlYW5fc3RvcmUgYmVsb3cuDQo+PiDCoMKgICovDQo+PiAtc3RhdGlj
IGludCBjbGVhbl9zdG9yZV8oVERCX0NPTlRFWFQgKnRkYiwgVERCX0RBVEEga2V5LCBUREJf
REFUQSB2YWwsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICpwcml2YXRlKQ0K
Pj4gK3N0YXRpYyBpbnQgY2xlYW5fc3RvcmVfKGNvbnN0IHZvaWQgKmtleSwgdm9pZCAqdmFs
LCB2b2lkICpwcml2YXRlKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaGFzaHRh
YmxlICpyZWFjaGFibGUgPSBwcml2YXRlOw0KPj4gwqDCoMKgwqDCoCBjaGFyICpzbGFzaDsN
Cj4+IC3CoMKgwqAgY2hhciAqIG5hbWUgPSB0YWxsb2Nfc3RybmR1cChOVUxMLCBrZXkuZHB0
ciwga2V5LmRzaXplKTsNCj4+ICvCoMKgwqAgY2hhciAqbmFtZSA9IHRhbGxvY19zdHJkdXAo
TlVMTCwga2V5KTsNCj4+IMKgwqDCoMKgwqAgaWYgKCFuYW1lKSB7DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgbG9nKCJjbGVhbl9zdG9yZTogRU5PTUVNIik7DQo+PiBAQCAtMjUxNCw3ICsy
NDgxLDcgQEAgc3RhdGljIGludCBjbGVhbl9zdG9yZV8oVERCX0NPTlRFWFQgKnRkYiwgVERC
X0RBVEEga2V5LCANCj4+IFREQl9EQVRBIHZhbCwNCj4+IMKgwqAgKi8NCj4+IMKgIHN0YXRp
YyB2b2lkIGNsZWFuX3N0b3JlKHN0cnVjdCBjaGVja19zdG9yZV9kYXRhICpkYXRhKQ0KPj4g
wqAgew0KPj4gLcKgwqDCoCB0ZGJfdHJhdmVyc2UodGRiX2N0eCwgJmNsZWFuX3N0b3JlXywg
ZGF0YS0+cmVhY2hhYmxlKTsNCj4+ICvCoMKgwqAgaGFzaHRhYmxlX2l0ZXJhdGUobm9kZXMs
IGNsZWFuX3N0b3JlXywgZGF0YS0+cmVhY2hhYmxlKTsNCj4+IMKgwqDCoMKgwqAgZG9tYWlu
X2NoZWNrX2FjYyhkYXRhLT5kb21haW5zKTsNCj4+IMKgIH0NCj4+IGRpZmYgLS1naXQgYS90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oIGIvdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2NvcmUuaA0KPj4gaW5kZXggZTkyMmRjZTc3NS4uNjNjMjExMDEzNSAxMDA2NDQNCj4+
IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+ICsrKyBiL3Rvb2xz
L3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+IEBAIC0zMyw3ICszMyw2IEBADQo+PiDC
oCAjaW5jbHVkZSAieGVuc3RvcmVfbGliLmgiDQo+PiDCoCAjaW5jbHVkZSAieGVuc3RvcmVf
c3RhdGUuaCINCj4+IMKgICNpbmNsdWRlICJsaXN0LmgiDQo+PiAtI2luY2x1ZGUgInRkYi5o
Ig0KPj4gwqAgI2luY2x1ZGUgImhhc2h0YWJsZS5oIg0KPj4gwqAgI2lmbmRlZiBPX0NMT0VY
RUMNCj4+IEBAIC0yMzYsMTMgKzIzNSwxMyBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGlu
dCBnZXRfbm9kZV9vd25lcihjb25zdCBzdHJ1Y3QgDQo+PiBub2RlICpub2RlKQ0KPj4gwqDC
oMKgwqDCoCByZXR1cm4gbm9kZS0+cGVybXMucFswXS5pZDsNCj4+IMKgIH0NCj4+IC0vKiBX
cml0ZSBhIG5vZGUgdG8gdGhlIHRkYiBkYXRhIGJhc2UuICovDQo+PiArLyogV3JpdGUgYSBu
b2RlIHRvIHRoZSBkYXRhIGJhc2UuICovDQo+PiDCoCBpbnQgd3JpdGVfbm9kZV9yYXcoc3Ry
dWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IGNoYXIgKmRiX25hbWUsDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5vZGUgKm5vZGUsIGludCBmbGFnLCBib29sIG5v
X3F1b3RhX2NoZWNrKTsNCj4+IMKgICNkZWZpbmUgTk9ERV9DUkVBVEUgMA0KPj4gwqAgI2Rl
ZmluZSBOT0RFX01PRElGWSAxDQo+PiAtLyogR2V0IGEgbm9kZSBmcm9tIHRoZSB0ZGIgZGF0
YSBiYXNlLiAqLw0KPj4gKy8qIEdldCBhIG5vZGUgZnJvbSB0aGUgZGF0YSBiYXNlLiAqLw0K
Pj4gwqAgc3RydWN0IG5vZGUgKnJlYWRfbm9kZShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwg
Y29uc3Qgdm9pZCAqY3R4LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29uc3QgY2hhciAqbmFtZSk7DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX3RyYW5zYWN0aW9uLmMgDQo+PiBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90
cmFuc2FjdGlvbi5jDQo+PiBpbmRleCBjNTFlZGY0MzJmLi4yMTcwMGMyZTg0IDEwMDY0NA0K
Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0aW9uLmMNCj4+ICsr
KyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jDQo+PiBAQCAtNDAz
LDcgKzQwMyw2IEBAIHN0YXRpYyBpbnQgZmluYWxpemVfdHJhbnNhY3Rpb24oc3RydWN0IGNv
bm5lY3Rpb24gKmNvbm4sDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgPyBOT0RFX0NSRUFURSA6IE5PREVfTU9ESUZZOw0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqaXNfY29ycnVwdCB8PSBkYl93cml0ZShj
b25uLCBpLT5ub2RlLCBkYXRhLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplLCBOVUxMLCBmbGFnLCB0cnVlKTsN
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFsbG9jX2ZyZWUoZGF0YSk7
DQo+IA0KPiBJdCBpcyBub3QgY2xlYXIgdG8gbWUgd2h5IHRoaXMgZnJlZSB3YXMgcmVtb3Zl
ZC4NCg0KU2VlIGRiX3dyaXRlKCkuIGRhdGEgaXMgbm93IGVpdGhlciBvd25lZCBieSB0aGUg
aGFzaHRhYmxlIGVudHJ5LCBvciBpdCBoYXMgYmVlbg0KZnJlZWQgaW4gZGJfd3JpdGUoKSBp
biB0aGUgZXJyb3IgY2FzZS4NCg0KDQpKdWVyZ2VuDQo=
--------------ktCg8aWSccVcjtJc9khwfjUb
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ktCg8aWSccVcjtJc9khwfjUb--

--------------ds19vdV40vgIo3Jo69wssR77--

--------------9u6renJFc9RdOVgz1pe1VTfy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmSda3AFAwAAAAAACgkQsN6d1ii/Ey9D
CAf+LCy/pBomDrZqOsAExqTCEIFH9vDWoBk44+NxTyW6WztjDtsnzB3CpxirAmWT18sDGZz9ZAy+
OJXOfui2BpLuw9sOPXgjsC/zhNksjmKJznk/Kq9MQe29ok7t+XDGVfxDFXOiKstvokMn2eG5FM/O
meysQ038RVItCaWRlYG1ZBA/V/dYtQvZfq1CuULvHdJCAFPWTE6PvLq0xh9/9crPAVMSzwE9Nlas
zDP7KLIyf3qr612Xu7naveLvavAIjRmt4MJJr8k3ni7StTTB6gowfVqOibrnXF09KkRZTEwte4Tw
/bQFUlUbIU5UBANGkcEigOkwT/ytKcIsii1xcnegPA==
=DOx9
-----END PGP SIGNATURE-----

--------------9u6renJFc9RdOVgz1pe1VTfy--

