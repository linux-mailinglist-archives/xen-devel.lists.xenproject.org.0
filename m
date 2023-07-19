Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D374758D6D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565577.883818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0Kp-0002bw-PZ; Wed, 19 Jul 2023 06:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565577.883818; Wed, 19 Jul 2023 06:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM0Kp-0002Z2-ML; Wed, 19 Jul 2023 06:06:51 +0000
Received: by outflank-mailman (input) for mailman id 565577;
 Wed, 19 Jul 2023 06:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyro=DF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qM0Kn-0002Yw-OU
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:06:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72252027-25fa-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 08:06:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEE38218E3;
 Wed, 19 Jul 2023 06:06:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D81F1361C;
 Wed, 19 Jul 2023 06:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kXcCJXd9t2QhNQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jul 2023 06:06:47 +0000
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
X-Inumbo-ID: 72252027-25fa-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689746807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YwbQk5NFbT84RF9nF2OD8KaMAwDuXLV24OxHqWNksxY=;
	b=s/7LnC4NBZSZ65xm4p2OYJdLcbrP302s0ogmizcqHsrDNBy3Neb+v9NgrKPsVs18/ecVim
	rmmOtKu/a4oMI2YDTI1dhpq5qzoqB2eof6gevfCaxzFzCcARlWQRcTmu4j1Cxx0meZX5Xv
	jXxmosDkrP6C8bees5JT4eK1vC4bx4M=
Message-ID: <9e273267-e823-8b59-01db-769b9ef5b1dc@suse.com>
Date: Wed, 19 Jul 2023 08:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/18] tools/xenstore: move copying of node data out of
 db_fetch()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-15-jgross@suse.com>
 <e68b7364-545b-ff31-3371-3a682603ead7@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e68b7364-545b-ff31-3371-3a682603ead7@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SggibFRGBc6ufwBw96RvKyEP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SggibFRGBc6ufwBw96RvKyEP
Content-Type: multipart/mixed; boundary="------------MNqDDeG9A4yqcLtPwvyW7hMr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9e273267-e823-8b59-01db-769b9ef5b1dc@suse.com>
Subject: Re: [PATCH v2 14/18] tools/xenstore: move copying of node data out of
 db_fetch()
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-15-jgross@suse.com>
 <e68b7364-545b-ff31-3371-3a682603ead7@xen.org>
In-Reply-To: <e68b7364-545b-ff31-3371-3a682603ead7@xen.org>

--------------MNqDDeG9A4yqcLtPwvyW7hMr
Content-Type: multipart/mixed; boundary="------------nAsMwegkqgemdjBbXymipi3w"

--------------nAsMwegkqgemdjBbXymipi3w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDcuMjMgMjM6MTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzA3LzIwMjMgMDc6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSB0aGUgbm9kZSBkYXRhIGlzIGNvcGllZCBpbiBkYl9mZXRjaCgpIG9uIGVhY2ggZGF0
YSBiYXNlIHJlYWQgaW4NCj4+IG9yZGVyIHRvIGF2b2lkIGFjY2lkZW50YWwgZGF0YSBiYXNl
IG1vZGlmaWNhdGlvbnMgd2hlbiB3b3JraW5nIG9uIGENCj4+IG5vZGUuDQo+Pg0KPj4gcmVh
ZF9ub2RlKCkgaXMgdGhlIG9ubHkgY2FsbGVyIG9mIGRiX2ZldGNoKCkgd2hpY2ggaXNuJ3Qg
ZnJlZWluZyB0aGUNCj4+IHJldHVybmVkIGRhdGEgYXJlYSBpbW1lZGlhdGVseSBhZnRlciB1
c2luZyBpdC4gVGhlIG90aGVyIGNhbGxlcnMgZG9uJ3QNCj4+IG1vZGlmeSB0aGUgcmV0dXJu
ZWQgZGF0YSwgc28gdGhleSBkb24ndCBuZWVkIHRoZSBkYXRhIHRvIGJlIGNvcGllZC4NCj4g
DQo+IFRoaXMgcmVhZHMgYXMgdGhlIHJldHVybiB2YWx1ZSBvZiBkYl9mZXRjaCgpIHNob3Vs
ZCBiZSBjb25zdC4gVGhpcyB3aWxsIGF0IGxlYXN0IA0KPiBtYWtlIG1vcmUgb2J2aW91cyB0
byB0aGUgY2FsbGVyIHRoYXQgdGhlIHZhbHVlIGlzIG5vdCBzdXBwb3NlZCB0byBiZSBtb2Rp
ZmllZC4NCg0KVGhpcyB3aWxsIGFkZCBzb21lIG1vcmUgY29kZSBjaHVybi4gSW4gdGhlIGVu
ZCBJIGV4cGVjdCB0aGlzIHRvIGJlIG11Y2gNCm1vcmUgc2FuZSwgdGhvdWdoIChlLmcuIHRh
bGxvY19mcmVlKCkgdGFraW5nIGEgY29uc3QgcG9pbnRlcikuDQoNCkknbGwgbG9vayBpbnRv
IHRoYXQuDQoNCj4gDQo+Pg0KPj4gTW92ZSBjb3B5aW5nIG9mIHRoZSBkYXRhIGludG8gcmVh
ZF9ub2RlKCksIHJlc3VsdGluZyBpbiBhIHNwZWVkdXAgb2YNCj4+IHRoZSBvdGhlciBjYWxs
ZXJzIGR1ZSB0byBubyBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgbm8gY29weWluZyBiZWluZw0K
Pj4gbmVlZGVkIGFueW1vcmUuDQo+Pg0KPj4gQXMgZGJfZmV0Y2goKSBjYW4ndCByZXR1cm4g
YW55IGVycm9yIG90aGVyIHRoYW4gRU5PRU5UIG5vdywgZXJyb3INCj4+IGhhbmRsaW5nIGZv
ciB0aGUgY2FsbGVycyBjYW4gYmUgc2ltcGxpZmllZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+IFYyOg0KPj4g
LSBuZXcgcGF0Y2gNCj4+IC0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2Nv
cmUuY8KgwqDCoMKgwqDCoMKgIHwgNDEgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+
IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jIHzCoCAzIC0tDQo+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5j
IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gaW5kZXggMTFkYTQ3MGIy
MC4uZDVjOTA1NGZlOSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+
IEBAIC01NTcsOCArNTU3LDcgQEAgc3RhdGljIHZvaWQgaW5pdGlhbGl6ZV9mZHMoaW50ICpw
X3NvY2tfcG9sbGZkX2lkeCwgaW50IA0KPj4gKnB0aW1lb3V0KQ0KPj4gwqAgc3RydWN0IHhz
X3RkYl9yZWNvcmRfaGRyICpkYl9mZXRjaChjb25zdCBjaGFyICpkYl9uYW1lLCBzaXplX3Qg
KnNpemUpDQo+PiDCoCB7DQo+PiAtwqDCoMKgIGNvbnN0IHN0cnVjdCB4c190ZGJfcmVjb3Jk
X2hkciAqaGRyOw0KPj4gLcKgwqDCoCBzdHJ1Y3QgeHNfdGRiX3JlY29yZF9oZHIgKnA7DQo+
PiArwqDCoMKgIHN0cnVjdCB4c190ZGJfcmVjb3JkX2hkciAqaGRyOw0KPj4gwqDCoMKgwqDC
oCBoZHIgPSBoYXNodGFibGVfc2VhcmNoKG5vZGVzLCBkYl9uYW1lKTsNCj4+IMKgwqDCoMKg
wqAgaWYgKCFoZHIpIHsNCj4+IEBAIC01NjksMTggKzU2OCw5IEBAIHN0cnVjdCB4c190ZGJf
cmVjb3JkX2hkciAqZGJfZmV0Y2goY29uc3QgY2hhciAqZGJfbmFtZSwgDQo+PiBzaXplX3Qg
KnNpemUpDQo+PiDCoMKgwqDCoMKgICpzaXplID0gc2l6ZW9mKCpoZHIpICsgaGRyLT5udW1f
cGVybXMgKiBzaXplb2YoaGRyLT5wZXJtc1swXSkgKw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGhkci0+ZGF0YWxlbiArIGhkci0+Y2hpbGRsZW47DQo+PiAtwqDCoMKgIHAgPSB0YWxsb2Nf
c2l6ZShOVUxMLCAqc2l6ZSk7DQo+PiAtwqDCoMKgIGlmICghcCkgew0KPj4gLcKgwqDCoMKg
wqDCoMKgIGVycm5vID0gRU5PTUVNOw0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxM
Ow0KPj4gLcKgwqDCoCB9DQo+PiAtDQo+PiDCoMKgwqDCoMKgIHRyYWNlX3RkYigicmVhZCAl
cyBzaXplICV6dVxuIiwgZGJfbmFtZSwgKnNpemUgKyBzdHJsZW4oZGJfbmFtZSkpOw0KPj4g
LcKgwqDCoCAvKiBSZXR1cm4gYSBjb3B5LCBhdm9pZGluZyBhIHBvdGVudGlhbCBtb2RpZmlj
YXRpb24gaW4gdGhlIERCLiAqLw0KPj4gLcKgwqDCoCBtZW1jcHkocCwgaGRyLCAqc2l6ZSk7
DQo+PiAtDQo+PiAtwqDCoMKgIHJldHVybiBwOw0KPj4gK8KgwqDCoCByZXR1cm4gaGRyOw0K
Pj4gwqAgfQ0KPj4gwqAgc3RhdGljIHZvaWQgZ2V0X2FjY19kYXRhKGNvbnN0IGNoYXIgKm5h
bWUsIHN0cnVjdCBub2RlX2FjY291bnRfZGF0YSAqYWNjKQ0KPj4gQEAgLTU5Nyw3ICs1ODcs
NiBAQCBzdGF0aWMgdm9pZCBnZXRfYWNjX2RhdGEoY29uc3QgY2hhciAqbmFtZSwgc3RydWN0
IA0KPj4gbm9kZV9hY2NvdW50X2RhdGEgKmFjYykNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGFjYy0+bWVtb3J5ID0gc2l6ZTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFjYy0+ZG9taWQgPSBoZHItPnBlcm1zWzBdLmlkOw0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIH0NCj4+IC3CoMKgwqDCoMKgwqDCoCB0YWxsb2NfZnJlZShoZHIpOw0KPj4gwqDCoMKg
wqDCoCB9DQo+PiDCoCB9DQo+PiBAQCAtNzMxLDMwICs3MjAsMzIgQEAgc3RydWN0IG5vZGUg
KnJlYWRfbm9kZShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgY29uc3QgDQo+PiB2b2lkICpj
dHgsDQo+PiDCoMKgwqDCoMKgIGhkciA9IGRiX2ZldGNoKGRiX25hbWUsICZzaXplKTsNCj4+
IMKgwqDCoMKgwqAgaWYgKGhkciA9PSBOVUxMKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYg
KGVycm5vID09IEVOT0VOVCkgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZS0+
Z2VuZXJhdGlvbiA9IE5PX0dFTkVSQVRJT047DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlcnIgPSBhY2Nlc3Nfbm9kZShjb25uLCBub2RlLCBOT0RFX0FDQ0VTU19SRUFELCBOVUxM
KTsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm5vID0gZXJyID8gOiBFTk9FTlQ7
DQo+PiAtwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGxvZygiREIgZXJyb3Igb24gcmVhZDogJXMiLCBzdHJlcnJvcihlcnJubykpOw0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJybm8gPSBFSU87DQo+PiAtwqDCoMKgwqDCoMKg
wqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgIG5vZGUtPmdlbmVyYXRpb24gPSBOT19HRU5FUkFU
SU9OOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGVyciA9IGFjY2Vzc19ub2RlKGNvbm4sIG5vZGUs
IE5PREVfQUNDRVNTX1JFQUQsIE5VTEwpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGVycm5vID0g
ZXJyID8gOiBFTk9FTlQ7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcjsNCj4+
IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCBub2RlLT5wYXJlbnQgPSBOVUxMOw0KPj4g
LcKgwqDCoCB0YWxsb2Nfc3RlYWwobm9kZSwgaGRyKTsNCj4+IMKgwqDCoMKgwqAgLyogRGF0
YWxlbiwgY2hpbGRsZW4sIG51bWJlciBvZiBwZXJtaXNzaW9ucyAqLw0KPj4gwqDCoMKgwqDC
oCBub2RlLT5nZW5lcmF0aW9uID0gaGRyLT5nZW5lcmF0aW9uOw0KPj4gwqDCoMKgwqDCoCBu
b2RlLT5wZXJtcy5udW0gPSBoZHItPm51bV9wZXJtczsNCj4+IMKgwqDCoMKgwqAgbm9kZS0+
ZGF0YWxlbiA9IGhkci0+ZGF0YWxlbjsNCj4+IMKgwqDCoMKgwqAgbm9kZS0+Y2hpbGRsZW4g
PSBoZHItPmNoaWxkbGVuOw0KPj4gK8KgwqDCoCBub2RlLT5hY2MuZG9taWQgPSBoZHItPnBl
cm1zWzBdLmlkOw0KPj4gK8KgwqDCoCBub2RlLT5hY2MubWVtb3J5ID0gc2l6ZTsNCj4+ICsN
Cj4+ICvCoMKgwqAgLyogQ29weSBub2RlIGRhdGEgdG8gbmV3IG1lbW9yeSBhcmVhLCBzdGFy
dGluZyB3aXRoIHBlcm1pc3Npb25zLiAqLw0KPj4gK8KgwqDCoCBzaXplIC09IHNpemVvZigq
aGRyKTsNCj4+ICvCoMKgwqAgbm9kZS0+cGVybXMucCA9IHRhbGxvY19zaXplKG5vZGUsIHNp
emUpOw0KPj4gK8KgwqDCoCBpZiAobm9kZS0+cGVybXMucCA9PSBOVUxMKSB7DQo+PiArwqDC
oMKgwqDCoMKgwqAgZXJybm8gPSBFTk9NRU07DQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBl
cnJvcjsNCj4+ICvCoMKgwqAgfQ0KPj4gK8KgwqDCoCBtZW1jcHkobm9kZS0+cGVybXMucCwg
aGRyLT5wZXJtcywgc2l6ZSk7DQo+PiDCoMKgwqDCoMKgIC8qIFBlcm1pc3Npb25zIGFyZSBz
dHJ1Y3QgeHNfcGVybWlzc2lvbnMuICovDQo+IA0KPiBJcyB0aGlzIGNvbW1lbnQgc3RpbGwg
cmVsZXZhbnQ/DQoNCkkgd2FzIG9uIHRoZSBlZGdlLCB0b28uIFdpdGggeW91IGFza2luZyB0
aGF0IHF1ZXN0aW9uIEknbSBoYXBweSB0byByZW1vdmUNCnRoZSBjb21tZW50Lg0KDQoNCkp1
ZXJnZW4NCg0K
--------------nAsMwegkqgemdjBbXymipi3w
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------nAsMwegkqgemdjBbXymipi3w--

--------------MNqDDeG9A4yqcLtPwvyW7hMr--

--------------SggibFRGBc6ufwBw96RvKyEP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS3fXcFAwAAAAAACgkQsN6d1ii/Ey/+
MAf+LPqEdM/A3wZ6RO2fXFC5cjmhn35O3PPfNgGw0eD9SZ5Lx1Pk8JzEFh7qecNcs6icTNCkEOsK
EqUqqTMGhY7vUlw1nJ4neTkHAWrjHrXfUCasVXCJIInWYZ0k3QFEsjHF3MB9X7AcnmHcf57eafFk
7bCkzaAfzU7ZSo9NzZsk8lTuWJGg3MBTQ0qhnIaZmtLAlh1Efy8K/2s5J2Je+/S+o+qg3kTK+wl1
pSdytvVn+Emy4W15GuPqHqt6vHp6a2MEXj32jTiZRw+vERKw6xcWdBDPqkXb+1LSCPRQVM3MJjOV
JvzT90dbDbY33LmBfpUakB5rF3y4rbAYS5U85tx/dw==
=ptuf
-----END PGP SIGNATURE-----

--------------SggibFRGBc6ufwBw96RvKyEP--

