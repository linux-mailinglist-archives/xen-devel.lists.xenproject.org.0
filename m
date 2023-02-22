Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9155E69F0B5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 09:52:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499278.770348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUkrB-0003Cw-9h; Wed, 22 Feb 2023 08:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499278.770348; Wed, 22 Feb 2023 08:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUkrB-0003B7-61; Wed, 22 Feb 2023 08:52:09 +0000
Received: by outflank-mailman (input) for mailman id 499278;
 Wed, 22 Feb 2023 08:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WsoH=6S=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pUkrA-0003B1-0Q
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 08:52:08 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e38481a-b28e-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 09:52:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF17A34871;
 Wed, 22 Feb 2023 08:52:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85177139DB;
 Wed, 22 Feb 2023 08:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id igIpH7TX9WO9SwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Feb 2023 08:52:04 +0000
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
X-Inumbo-ID: 2e38481a-b28e-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677055924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2fZOxYFQ1u6aa7nDSO4yeuD6e3R0gL3rSI4163pEb0k=;
	b=lXwk6c084L0qHl0qJDO3B8taOIWW4hpAvF3Cqs5jpVeEJ7Tdb1+Q2OuAfGBc5QuUurfZ3L
	rdV4h1zyxAgVuKpXKzS8ZWQVJmxzFu1D1uBn5XibThhXJrBWyPUZ2yUA186eHPff9drEUC
	D5zEShL8bNVJ04StQMt9q4cM2SNnnts=
Message-ID: <292847c2-02b8-b190-8439-75ddb9ff4cb0@suse.com>
Date: Wed, 22 Feb 2023 09:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-5-jgross@suse.com>
 <e35bb9f8-2bc8-66b3-6fd8-1b2473f9daef@xen.org>
 <66e2bbb2-b244-77c7-d6bf-21d037ddaac9@suse.com>
 <6b9b0afc-da89-6f6f-859f-c8f7ae0be972@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 04/13] tools/xenstore: add framework to commit
 accounting data on success only
In-Reply-To: <6b9b0afc-da89-6f6f-859f-c8f7ae0be972@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JK0uYwVuKsyI0qG7v57kzjh9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JK0uYwVuKsyI0qG7v57kzjh9
Content-Type: multipart/mixed; boundary="------------Lic0A12vVRH9JiiHOLbppMpq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <292847c2-02b8-b190-8439-75ddb9ff4cb0@suse.com>
Subject: Re: [PATCH v2 04/13] tools/xenstore: add framework to commit
 accounting data on success only
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-5-jgross@suse.com>
 <e35bb9f8-2bc8-66b3-6fd8-1b2473f9daef@xen.org>
 <66e2bbb2-b244-77c7-d6bf-21d037ddaac9@suse.com>
 <6b9b0afc-da89-6f6f-859f-c8f7ae0be972@xen.org>
In-Reply-To: <6b9b0afc-da89-6f6f-859f-c8f7ae0be972@xen.org>

--------------Lic0A12vVRH9JiiHOLbppMpq
Content-Type: multipart/mixed; boundary="------------iBztJC0Mqe83KYPBajkmGOjw"

--------------iBztJC0Mqe83KYPBajkmGOjw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDIuMjMgMjM6NDIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIxLzAyLzIwMjMgMDg6MzcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMC4wMi4yMyAyMzo1MCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiArwqDCoMKgwqDC
oMKgwqAgbGlzdF9kZWwoJmNkLT5saXN0KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHRhbGxv
Y19mcmVlKGNkKTsNCj4+Pj4gK8KgwqDCoCB9DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK3Zv
aWQgYWNjX2NvbW1pdChzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubikNCj4+Pj4gK3sNCj4+Pj4g
K8KgwqDCoCBzdHJ1Y3QgY2hhbmdlZF9kb21haW4gKmNkOw0KPj4+PiArwqDCoMKgIHN0cnVj
dCBidWZmZXJlZF9kYXRhICppbiA9IGNvbm4tPmluOw0KPj4+PiArwqDCoMKgIGVudW0gYWNj
aXRlbSB3aGF0Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgY29ubi0+aW4gPSBOVUxMOyAvKiBB
dm9pZCByZWN1cnNpb24uICovDQo+Pj4NCj4+PiBJIGFtIG5vdCBzdXJlIEkgdW5kZXJzdGFu
ZCB0aGlzIGNvbW1lbnQuIENhbiB5b3UgcHJvdmlkZSBtb3JlIGRldGFpbHMgd2hlcmUgDQo+
Pj4gdGhlIHJlY3Vyc2lvbiB3b3VsZCBoYXBwZW4/DQo+Pg0KPj4gZG9tYWluX2FjY19hZGQo
KSBtaWdodCBkbyB0ZW1wb3JhcnkgYWNjb3VudGluZyBpZiBjb25uLT5pbiBpc24ndCBOVUxM
Lg0KPiANCj4gSSBhbSBjb25mdXNlZC4gVG8gbWUgcmVjdXJzaW9uIG1lYW5zIHRoZSBmdW5j
dGlvbiAob3IgdGhlIGNhbGxlcikgd2lsbCBjYWxsIA0KPiBpdHNlbGYuIEJ1dCBoZXJlIHlv
dSBzZWVtIHRvIHNheSB5b3UganVzdCB3YW50IHRvIGF2b2lkIHRlbXBvcmFyeSBhY2NvdW50
aW5nLg0KDQpJdCBpcyBiYXNpY2FsbHkgZGF0YSByZWN1cnNpb24uIFRyeWluZyB0byBhcHBs
eSB0ZW1wb3JhcnkgYWNjb3VudGluZyBkYXRhDQpsZWFkaW5nIHRvIHRoYXQgdGVtcG9yYXJ5
IGFjY291bnRpbmcgZGF0YSBiZWluZyBtb2RpZmllZCBhZ2FpbiBtaWdodCByZXN1bHQNCmlu
IGVuZGxlc3MgbG9vcHMuDQoNCj4gV2hhdCBkaWQgSSBtaXNzPw0KPiANCj4+DQo+Pj4NCj4+
Pj4gK8KgwqDCoCB3aGlsZSAoKGNkID0gbGlzdF90b3AoJmNvbm4tPmFjY19saXN0LCBzdHJ1
Y3QgY2hhbmdlZF9kb21haW4sIGxpc3QpKSkgew0KPj4+DQo+Pj4gTklUOiBZb3UgY291bGQg
dXNlIGxpc3RfZm9yX2VhY2hfc2FmZSgpOw0KPj4NCj4+IExpa2UgYWJvdmUuDQo+Pg0KPj4+
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsaXN0X2RlbCgmY2QtPmxpc3QpOw0KPj4+PiArwqDC
oMKgwqDCoMKgwqAgZm9yICh3aGF0ID0gMDsgd2hhdCA8IEFDQ19SRVFfTjsgd2hhdCsrKQ0K
Pj4+DQo+Pj4gVGhlcmUgaXMgYSBjaGFuY2UgdGhhdCBzb21lIGNvbXBpbGVyIHdpbGwgY29t
cGxhaW4gYWJvdXQgdGhpcyBsaW5lIGJlY2F1c2UgDQo+Pj4gQUNDX1JFUV9OID0gMC4gU28g
dGhpcyB3b3VsZCBhbHdheXMgYmUgdHJ1ZS4gVGhlcmVmb3JlLi4uDQo+Pg0KPj4gSHVoPyBJ
dCB3b3VsZCBhbHdheXMgYmUgZmFsc2UuDQo+IA0KPiBZZXMgZmFsc2Ugc29ycnkuIFRoaXMg
ZG9lc24ndCBjaGFuZ2UgYWJvdXQgdGhlIHBvdGVudGlhbCAodGVtcG9yYXJ5KSB3YXJuaW5n
Lg0KDQpTaG91bGRuJ3QgdGhhdCByYXRoZXIgcmVzdWx0IGluIGRlYWQgY29kZSBlbGltaW5h
dGlvbiBpbnN0ZWFkPw0KDQo+IA0KPj4NCj4+Pg0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoY2QtPmFjY1t3aGF0XSkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkb21haW5fYWNjX2FkZChjb25uLCBjZC0+ZG9taWQsIHdoYXQsDQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNk
LT5hY2Nbd2hhdF0sIHRydWUpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB0YWxs
b2NfZnJlZShjZCk7DQo+Pj4+ICvCoMKgwqAgfQ0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgY29u
bi0+aW4gPSBpbjsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiDCoCBpbnQgZG9tYWluX25iZW50
cnlfaW5jKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCB1bnNpZ25lZCBpbnQgZG9taWQpDQo+
Pj4+IMKgIHsNCj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gKGRvbWFpbl9hY2NfYWRkKGNvbm4s
IGRvbWlkLCBBQ0NfTk9ERVMsIDEsIGZhbHNlKSA8IDApDQo+Pj4+IGRpZmYgLS1naXQgYS90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmggDQo+Pj4+IGIvdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2RvbWFpbi5oDQo+Pj4+IGluZGV4IDgyNTljMTE0YjAuLmNkODViZDBj
YWQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4u
aA0KPj4+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmgNCj4+Pj4g
QEAgLTIwLDcgKzIwLDggQEANCj4+Pj4gwqAgI2RlZmluZSBfWEVOU1RPUkVEX0RPTUFJTl9I
DQo+Pj4+IMKgIGVudW0gYWNjaXRlbSB7DQo+Pj4+IC3CoMKgwqAgQUNDX05PREVTLA0KPj4+
PiArwqDCoMKgIEFDQ19SRVFfTizCoMKgwqDCoMKgwqAgLyogTnVtYmVyIG9mIGVsZW1lbnRz
IHBlciByZXF1ZXN0IGFuZCBkb21haW4uICovDQo+Pj4+ICvCoMKgwqAgQUNDX05PREVTID0g
QUNDX1JFUV9OLA0KPj4+DQo+Pj4gSSB3b3VsZCBicmluZyBmb3J3YXJkIHRoZSBjaGFuZ2Ug
aW4gcGF0Y2ggIzUuIEkgbWVhbjoNCj4+Pg0KPj4+IEFDQ19OT0RFUywNCj4+PiBBQ0NfUkVR
X04NCj4+DQo+PiBJJ20gbm90IHN1cmUgdGhpcyBpcyBhIGdvb2QgaWRlYS4gVGhpcyB3b3Vs
ZCBhY3RpdmF0ZSB0aGUgdGVtcG9yYXJ5DQo+PiBhY2NvdW50aW5nIGZvciBub2RlcywgYnV0
IGtlZXBpbmcgdGhlIGVycm9yIGhhbmRsaW5nIGFjdGl2ZS4gSSdkIHJhdGhlcg0KPj4gYWN0
aXZhdGUgdGVtcG9yYXJ5IGFjY291bnRpbmcgZm9yIG5vZGVzIHRvZ2V0aGVyIHdpdGggcmVt
b3ZpbmcgdGhlDQo+PiBhY2NvdW50aW5nIGNvcnJlY3Rpb24gaW4gdGhlIGVycm9yIGhhbmRs
aW5nLg0KPiANCj4gSSBhbSBub3Qgc3VyZSBJIGZ1bGx5IHVuZGVyc3RhbmQgd2hhdCB5b3Ug
d291bGQgcmF0aGVyIGRvLiBDYW4geW91IGNsYXJpZnk/DQoNCkhhdmluZyBBQ0NfUkVRX04g
PiAwIHdpbGwgcmVzdWx0IGluIHRlbXBvcmFyeSBhY2NvdW50aW5nIGJlaW5nIGFjdGl2ZSBm
b3INCkFDQ19OT0RFUyAod2hpY2ggaXMgMCksIGR1ZSB0byAid2hhdCA8IEFDQ19SRVFfTiIu
DQoNCkF0IHRoZSBzYW1lIHRpbWUgdGhlcmUgYXJlIHN0aWxsIGFsbCB0aGUgcGxhY2VzIHdo
ZXJlIGluIGVycm9yIGNhc2VzIHRoZQ0Kbm9kZSBhY2NvdW50aW5nIGlzIGNvcnJlY3RlZCBh
Z2FpbiAodGhlIG1lbnRpb25lZCBlcnJvciBoYW5kbGluZykuIFNvIHdlDQp3b3VsZCBoYXZl
IGJvdGggZXJyb3IgaGFuZGxpbmcgbWVjaGFuaXNtcyAoZXhwbGljaXQgYW5kIHRlbXAgYWNj
b3VudGluZykNCmFjdGl2ZSBhdCB0aGUgc2FtZSB0aW1lIGZvciBub2Rlcy4NCg0KPiANCj4+
DQo+Pj4NCj4+Pj4gwqDCoMKgwqDCoCBBQ0NfVFJfTizCoMKgwqDCoMKgwqDCoCAvKiBOdW1i
ZXIgb2YgZWxlbWVudHMgcGVyIHRyYW5zYWN0aW9uIGFuZCBkb21haW4uICovDQo+Pj4+IMKg
wqDCoMKgwqAgQUNDX04gPSBBQ0NfVFJfTiAvKiBOdW1iZXIgb2YgZWxlbWVudHMgcGVyIGRv
bWFpbi4gKi8NCj4+Pj4gwqAgfTsNCj4+Pg0KPj4+IFRoaXMgZW51bSBpcyBnZXR0aW5nIGV4
dHJlbWVseSBjb25mdXNpbmcuIFRoZXJlIGFyZSBtYW55ICJudW1iZXIgb2YgZWxlbWVudHMg
DQo+Pj4gcGVyIC4uLiBkb21haW4iLiBDYW4geW91IGNsYXJpZnk/DQo+Pg0KPj4gSSB3aWxs
IGFkZCBzb21lIG1vcmUgY29tbWVudHMgdG8gdGhlIGhlYWRlci4gV291bGQgeW91IGxpa2Ug
aXQgYmV0dGVyIHRvIGhhdmUNCj4+IHRoZSBsaW1pdHMgaW5kZW50ZWQgbW9yZT8gc29tZXRo
aW5nIGxpa2U6DQo+IA0KPiBJIGFtIGFmcmFpZCBpdCBkb2Vzbid0IGhlbHAgdW5kZXJzdGFu
ZGluZyB0aGUgY29tbWVudC4gRm9yIGluc3RhbmNlLA0KPiANCj4+DQo+PiBlbnVtIGFjY2l0
ZW0gew0KPj4gwqDCoMKgwqDCoMKgwqDCoCBBQ0NfTk9ERVMsDQo+PiDCoMKgwqDCoMKgwqDC
oMKgIC8qIE51bWJlciBvZiBlbGVtZW50cyBwZXIgcmVxdWVzdCBhbmQgZG9tYWluLiAqLw0K
PiANCj4geW91IHdyb3RlICJwZXIgcmVxdWVzdCBhbmQgZG9tYWluIiBoZXJlLiBCdXQuLi4N
Cj4gDQo+PiDCoMKgwqDCoMKgwqDCoMKgIEFDQ19SRVFfTiwNCj4+IMKgwqDCoMKgwqDCoMKg
wqAgLyogTnVtYmVyIG9mIGVsZW1lbnRzIHBlciB0cmFuc2FjdGlvbiBhbmQgZG9tYWluLiAq
Lw0KPiANCj4gLi4uIGhlcmUgdGhpcyBpcyAicGVyIHRyYW5zYWN0aW9uIGFuZCBkb21haW4i
LiBTaG91bGQgbm90IG5iZSAiZWxlbWVudHMgcGVyIA0KPiB0cmFuc2FjdGlvbiI/IEFuZCBp
ZiBub3QsIHRoZW4gd2h5IGRvbid0IHdlIGhhZCAicGVyIHJlcXVlc3QsIHRyYW5zYWN0aW9u
IGFuZCANCj4gZG9tYWluIiBhYm92ZT8NCg0KVGhpcyBpcyBkdWUgdG8gdGhlIG5lc3Rpbmc6
IHRoZSBvdXRlcm1vc3QgbmVzdGluZyBsZXZlbCBpcyAiYWxsIGFjY291bnRpbmcNCml0ZW1z
Iiwgd2hpY2ggY292ZXJzIGV2ZXJ5dGhpbmcsIGFuZCBpcyB0cmFja2VkIG9uIGEgcGVyIGRv
bWFpbiBiYXNpcy4NCg0KVGhlIG5leHQgbGV2ZWwgaXMgInBlciB0cmFuc2FjdGlvbiIgKEkg
Y2FuIGRyb3AgdGhlICJhbmQgcGVyIGRvbWFpbiIsIGFzDQpldmVyeXRoaW5nIGlzIHBlciBk
b21haW4pLg0KDQpUaGUgaW5uZXJtb3N0IGxldmVsIGlzICJwZXIgcmVxdWVzdCIuIEEgcmVx
dWVzdCBjYW4gYmUgZWl0aGVyIHBhcnQgb2YgYQ0KdHJhbnNhY3Rpb24sIG9yIG5vdC4gVGhp
cyBkb2Vzbid0IG1hdHRlci4NCg0KDQpKdWVyZ2VuDQo=
--------------iBztJC0Mqe83KYPBajkmGOjw
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------iBztJC0Mqe83KYPBajkmGOjw--

--------------Lic0A12vVRH9JiiHOLbppMpq--

--------------JK0uYwVuKsyI0qG7v57kzjh9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP117QFAwAAAAAACgkQsN6d1ii/Ey/C
dwf+K9LbYuW5F+0WLs9RLTCpoJq08q6uN0+TKPHW/F0amLPEgvAWZ3hboB9uUZuxRI7MceYzNZnw
vumVWDSt2K2/kJirv8bpYTTXLfM1dkejtkhDpP/2Ll6qrHo+BbrJy1kuQrP65krNgHOy3dOj539F
gkhYwGw3S6MPYJm9v54i+IeaRF7WdgBuZ3fxeCcZXHQm+D0iySqKromw4qSvm0Mdsz2ablaGL5Au
GKE//1LhxbJb0gsIkS7kannLg6hiq29ASHDtZ+VPB29tEy4dXPevs9q3nUyZ37qb3U/wGRkdG1Nz
r8XluoDgBg0sN8O+IrWqCHz8NPCR7tGn4IPUjKP/Qw==
=XEE8
-----END PGP SIGNATURE-----

--------------JK0uYwVuKsyI0qG7v57kzjh9--

