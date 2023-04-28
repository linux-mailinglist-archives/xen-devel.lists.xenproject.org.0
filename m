Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C286F124E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 09:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527172.819459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psIP2-0005yK-8v; Fri, 28 Apr 2023 07:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527172.819459; Fri, 28 Apr 2023 07:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psIP2-0005uy-69; Fri, 28 Apr 2023 07:20:24 +0000
Received: by outflank-mailman (input) for mailman id 527172;
 Fri, 28 Apr 2023 07:20:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ym/r=AT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1psIP0-0005us-L0
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 07:20:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2199f08a-e595-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 09:20:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D2331FF7C;
 Fri, 28 Apr 2023 07:20:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFE28138FA;
 Fri, 28 Apr 2023 07:20:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j5EdObJzS2SSUQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Apr 2023 07:20:18 +0000
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
X-Inumbo-ID: 2199f08a-e595-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682666419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/KmDUKAFfI5mfEPMJCpmv6BWERYYu6iB+QxiLTf4+w4=;
	b=f9/zHM3LrILg3k+gs0WZkR7HSECS3Gu8vX/3b+G+utnpq9Ut5u6jjQDa4VxdWqAdazDGlU
	3dIAD83o1VhNruUzb/C6Hm744RQHpk2Ljd9pJ7A40qq/x/l2hMTxlVGoaIrtah8+T/3za4
	x0OwkWI0J7CfsgpEdjQQ665CweBRSuo=
Message-ID: <cf8ce348-eb61-150a-1e5a-62b0b302cd01@suse.com>
Date: Fri, 28 Apr 2023 09:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-5-jgross@suse.com>
 <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
 <cb57a654-a766-5354-a122-989f43b440d5@suse.com>
 <89cbdd73-29e5-f158-4058-668048a0ca60@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 04/13] tools/xenstore: add framework to commit
 accounting data on success only
In-Reply-To: <89cbdd73-29e5-f158-4058-668048a0ca60@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CM8ISQ3LXKqmS3qHvDyzCXmb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CM8ISQ3LXKqmS3qHvDyzCXmb
Content-Type: multipart/mixed; boundary="------------DqPU2tTqAoprtjlYn5Xz70Z2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <cf8ce348-eb61-150a-1e5a-62b0b302cd01@suse.com>
Subject: Re: [PATCH v4 04/13] tools/xenstore: add framework to commit
 accounting data on success only
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-5-jgross@suse.com>
 <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
 <cb57a654-a766-5354-a122-989f43b440d5@suse.com>
 <89cbdd73-29e5-f158-4058-668048a0ca60@xen.org>
In-Reply-To: <89cbdd73-29e5-f158-4058-668048a0ca60@xen.org>

--------------DqPU2tTqAoprtjlYn5Xz70Z2
Content-Type: multipart/mixed; boundary="------------N62ZUYeOYAfm1hmPMyBDfT6y"

--------------N62ZUYeOYAfm1hmPMyBDfT6y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDQuMjMgMTg6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyNi8wNC8yMDIzIDA4OjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjUuMDQu
MjMgMTk6NTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMDUvMDQvMjAyMyAwODowMywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gSW5z
dGVhZCBvZiBtb2RpZnlpbmcgYWNjb3VudGluZyBkYXRhIGFuZCB1bmRvIHRob3NlIG1vZGlm
aWNhdGlvbnMgaW4NCj4+Pj4gY2FzZSBvZiBhbiBlcnJvciBkdXJpbmcgZnVydGhlciBwcm9j
ZXNzaW5nLCBhZGQgYSBmcmFtZXdvcmsgZm9yDQo+Pj4+IGNvbGxlY3RpbmcgdGhlIG5lZWRl
ZCBjaGFuZ2VzIGFuZCBjb21taXQgdGhlbSBvbmx5IHdoZW4gdGhlIHdob2xlDQo+Pj4+IG9w
ZXJhdGlvbiBoYXMgc3VjY2VlZGVkLg0KPj4+Pg0KPj4+PiBUaGlzIHNjaGVtZSBjYW4gcmV1
c2UgbGFyZ2UgcGFydHMgb2YgdGhlIHBlciB0cmFuc2FjdGlvbiBhY2NvdW50aW5nLg0KPj4+
PiBUaGUgY2hhbmdlZF9kb21haW4gaGFuZGxpbmcgY2FuIGJlIHJldXNlZCwgYnV0IHRoZSBh
cnJheSBzaXplIG9mIHRoZQ0KPj4+PiBhY2NvdW50aW5nIGRhdGEgc2hvdWxkIGJlIHBvc3Np
YmxlIHRvIGJlIGRpZmZlcmVudCBmb3IgYm90aCB1c2UgY2FzZXMuDQo+Pj4+DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+IFYzOg0KPj4+PiAtIGNhbGwgYWNjX2NvbW1pdCgpIGVhcmxpZXIgKEp1bGllbiBH
cmFsbCkNCj4+Pj4gLSBhZGQgYXNzZXJ0KCkgdG8gYWNjX2NvbW1pdCgpDQo+Pj4+IC0gdXNl
IGZpeGVkIHNpemVkIGFjYyBhcnJheSBpbiBzdHJ1Y3QgY2hhbmdlZF9kb21haW4gKEp1bGll
biBHcmFsbCkNCj4+Pj4gLS0tDQo+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9j
b3JlLmPCoMKgIHzCoCA5ICsrKystLQ0KPj4+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29yZS5owqDCoCB8wqAgMyArKw0KPj4+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+Pj4+
IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaCB8wqAgNSArKy0NCj4+Pj4g
wqAgNCBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
Pj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUu
YyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+Pj4gaW5kZXggM2NhNjg2
ODFlMy4uODQzMzVmNWYzZCAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvcmUuYw0KPj4+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29y
ZS5jDQo+Pj4+IEBAIC0xMDIzLDYgKzEwMjMsOSBAQCBzdGF0aWMgdm9pZCBzZW5kX2Vycm9y
KHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBpbnQgDQo+Pj4+IGVycm9yKQ0KPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IH0NCj4+Pj4gwqDCoMKgwqDCoCB9DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBhY2NfZHJvcChj
b25uKTsNCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKgIHNlbmRfcmVwbHkoY29ubiwgWFNfRVJS
T1IsIHhzZF9lcnJvcnNbaV0uZXJyc3RyaW5nLA0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RybGVuKHhzZF9lcnJvcnNbaV0uZXJyc3RyaW5nKSArIDEpOw0KPj4+
PiDCoCB9DQo+Pj4+IEBAIC0xMDM0LDYgKzEwMzcsOSBAQCB2b2lkIHNlbmRfcmVwbHkoc3Ry
dWN0IGNvbm5lY3Rpb24gKmNvbm4sIGVudW0gDQo+Pj4+IHhzZF9zb2NrbXNnX3R5cGUgdHlw
ZSwNCj4+Pj4gwqDCoMKgwqDCoCBhc3NlcnQodHlwZSAhPSBYU19XQVRDSF9FVkVOVCk7DQo+
Pj4+ICvCoMKgwqAgY29ubi0+aW4gPSBOVUxMOw0KPj4+DQo+Pj4gQUZBSVUsIHlvdSBhcmUg
c2V0dGluZyBjb25uLT5pbiB0byBOVUxMIGluIG9yZGVyIHRvIHBsZWFzZS4uDQo+Pj4NCj4+
Pj4gK8KgwqDCoCBhY2NfY29tbWl0KGNvbm4pOw0KPj4+DQo+Pj4gLi4uIHRoaXMgY2FsbC4g
SG93ZXZlciBpbiBjYXNlIG9mIGFuIGVycm9yIGxpa2UuLi4NCj4+Pg0KPj4+PiArDQo+Pj4+
IMKgwqDCoMKgwqAgaWYgKCBsZW4gPiBYRU5TVE9SRV9QQVlMT0FEX01BWCApIHsgPiBzZW5k
X2Vycm9yKGNvbm4sIEUyQklHKTsNCj4+Pg0KPj4+IC4uLiBoZXJlLCBzZW5kX3JlcGx5KCkg
d2lsbCBiZSBjYWxsZWQgYWdhaW4uIEJ1dCB0aGUgZXJyb3Igd2lsbCBub3QgYmUgc2V0IA0K
Pj4+IGJlY2F1c2UgY29ubi0+aW4gaXMgTlVMTC4NCj4+Pg0KPj4+IFNvIEkgdGhpbmsgeW91
IHdhbnQgdG8gcmVzdG9yZSBjb25uLT5pbiByZXdyaXRlIGFjY19jb21taXQoKS4gVGhlIG9y
ZGVyaW5nIA0KPj4+IHdvdWxkIGFsc28gZGVzZXJ2ZSBhbiBleHBsYW5hdGlvbiBpbiBhIGNv
bW1lbnQuDQo+Pg0KPj4gSnVzdCB0byBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIHlvdSBjb3Jy
ZWN0bHkgKEkgaGF2ZSBzb21lIGRpZmZpY3VsdGllcw0KPj4gcGFyc2luZyAiU28gSSB0aGlu
ayB5b3Ugd2FudCB0byByZXN0b3JlIGNvbm4tPmluIHJld3JpdGUgYWNjX2NvbW1pdCgpLiIN
Cj4+IGNvbXBsZXRlbHkpOg0KPiANCj4gSG1tbS4uLiBOb3Qgc3VyZSB3aHkgSSB3cm90ZSAi
cmV3cml0ZSIuIEkgd2FzIG1lYW50IHRvIHNheSB0aGF0IHlvdSB3YW50IHRvIA0KPiByZXN0
b3JlIGNvbm4tPmluIGFmdGVyIGFjY19jb21taXQoKSBpcyBjYWxsZWQuDQo+IA0KPj4NCj4+
IFlvdSBhcmUgc3VnZ2VzdGluZyB0byBtb3ZlIHNldHRpbmcgY29ubi0+aW4gdG8gTlVMTCB0
byBhY2NfY29tbWl0KCkgYW5kDQo+PiB0byByZXN0b3JlIGl0IGJlZm9yZSByZXR1cm5pbmc/
IEknbSBmaW5lIHdpdGggdGhhdC4NCj4gDQo+IEVpdGhlciB0aGF0IG9yIHdoYXQgSSB3cm90
ZSBhYm92ZS4gSXQgZGVwZW5kcyBvbiB3aGV0aGVyIHlvdSBleHBlY3Qgb3RoZXIgY2FsbGVy
IA0KPiB0byBiZSBpbiB0aGUgc2FtZSBzaXR1YXRpb24uDQoNCkkgdGhpbmsgaXQgc2hvdWxk
IGJlIGxvY2FsIHRvIGFjY19jb21taXQoKSwgYXMgY29ubi0+aW4gYmVpbmcgTlVMTCBpcyBh
DQpyZXF1aXJlbWVudCBvZiB0aGUgYWNjX2NvbW1pdCgpIGhhbmRsaW5nLg0KDQo+IA0KPj4N
Cj4+Pg0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+PiBAQCAtMTA1OSw4
ICsxMDY1LDYgQEAgdm9pZCBzZW5kX3JlcGx5KHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBl
bnVtIA0KPj4+PiB4c2Rfc29ja21zZ190eXBlIHR5cGUsDQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9DQo+Pj4+IMKgwqDCoMKgwqAgfQ0KPj4+PiAtwqDCoMKgIGNvbm4tPmluID0gTlVM
TDsNCj4+Pj4gLQ0KPj4+PiDCoMKgwqDCoMKgIC8qIFVwZGF0ZSByZWxldmFudCBoZWFkZXIg
ZmllbGRzIGFuZCBmaWxsIGluIHRoZSBtZXNzYWdlIGJvZHkuICovDQo+Pj4+IMKgwqDCoMKg
wqAgYmRhdGEtPmhkci5tc2cudHlwZSA9IHR5cGU7DQo+Pj4+IMKgwqDCoMKgwqAgYmRhdGEt
Pmhkci5tc2cubGVuID0gbGVuOw0KPj4+PiBAQCAtMjE5NSw2ICsyMTk5LDcgQEAgc3RydWN0
IGNvbm5lY3Rpb24gKm5ld19jb25uZWN0aW9uKGNvbnN0IHN0cnVjdCANCj4+Pj4gaW50ZXJm
YWNlX2Z1bmNzICpmdW5jcykNCj4+Pj4gwqDCoMKgwqDCoCBuZXctPmlzX3N0YWxsZWQgPSBm
YWxzZTsNCj4+Pj4gwqDCoMKgwqDCoCBuZXctPnRyYW5zYWN0aW9uX3N0YXJ0ZWQgPSAwOw0K
Pj4+PiDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFEKCZuZXctPm91dF9saXN0KTsNCj4+Pj4g
K8KgwqDCoCBJTklUX0xJU1RfSEVBRCgmbmV3LT5hY2NfbGlzdCk7DQo+Pj4+IMKgwqDCoMKg
wqAgSU5JVF9MSVNUX0hFQUQoJm5ldy0+cmVmX2xpc3QpOw0KPj4+PiDCoMKgwqDCoMKgIElO
SVRfTElTVF9IRUFEKCZuZXctPndhdGNoZXMpOw0KPj4+PiDCoMKgwqDCoMKgIElOSVRfTElT
VF9IRUFEKCZuZXctPnRyYW5zYWN0aW9uX2xpc3QpOw0KPj4+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaCBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmgNCj4+Pj4gaW5kZXggYzU5YjA2NTUxZi4uMWY4MTFmMzhjYiAxMDA2NDQNCj4+
Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaA0KPj4+PiArKysgYi90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oDQo+Pj4+IEBAIC0xMzksNiArMTM5LDkg
QEAgc3RydWN0IGNvbm5lY3Rpb24NCj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFk
IG91dF9saXN0Ow0KPj4+PiDCoMKgwqDCoMKgIHVpbnQ2NF90IHRpbWVvdXRfbXNlYzsNCj4+
Pj4gK8KgwqDCoCAvKiBOb3QgeWV0IGNvbW1pdHRlZCBhY2NvdW50aW5nIGRhdGEgKHZhbGlk
IGlmIGluICE9IE5VTEwpLiAqLw0KPj4+PiArwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgYWNj
X2xpc3Q7DQo+Pj4+ICsNCj4+Pj4gwqDCoMKgwqDCoCAvKiBSZWZlcmVuY2VkIHJlcXVlc3Rz
IG5vIGxvbmdlciBwZW5kaW5nLiAqLw0KPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hl
YWQgcmVmX2xpc3Q7DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmMgDQo+Pj4+IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5j
DQo+Pj4+IGluZGV4IDMwZmI5YWNlYzYuLjE0NGNiYWZiNzMgMTAwNjQ0DQo+Pj4+IC0tLSBh
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYw0KPj4+PiArKysgYi90b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMNCj4+Pj4gQEAgLTkxLDYgKzkxLDggQEAgc3Ry
dWN0IGRvbWFpbg0KPj4+PiDCoMKgwqDCoMKgIGJvb2wgd3JsX2RlbGF5X2xvZ2dlZDsNCj4+
Pj4gwqAgfTsNCj4+Pj4gKyNkZWZpbmUgQUNDX0NIRF9OIChBQ0NfVFJfTiA8IEFDQ19SRVFf
TiA/IEFDQ19SRVFfTiA6IEFDQ19UUl9OKQ0KPj4+DQo+Pj4gQm90aCBBQ0NfVFJfTiBhbmQg
QUNDX1JFUV9OIGFyZSBmaXhlZC4gQ2FuIHlvdSBleHBsYWluIHdoeSB3ZSBuZWVkIHRoaXMg
bWFnaWM/DQo+Pj4NCj4+PiBSZWxhdGVkLCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gZGVm
aW5lIGl0IGluIHRoZSBlbnVtPw0KPj4NCj4+IEkgY2FuIGRvIHRoYXQsIG9mIGNvdXJzZS4g
SSBqdXN0IGRpZG4ndCB3YW50IHRvIG1ha2UgdGhlIGVudW0gZXZlbiBtb3JlDQo+PiBjb21w
bGV4LiA6LSkNCj4gDQo+IE15IGNvbmNlcm4gaXMgdGhlcmUgaXMgYSBkaXNjb25uZWN0IGJl
dHdlZW4gdGhlIGVudW0gYW5kIHRoaXMgbWFjcm8uIFdoYXQgd291bGQgDQo+IGhhcHBlbiBp
ZiB3ZSBpbmNyZWFzZSB0aGUgZW51bSBwYXN0IEFDQ19SRVFfTi9BQ0NfVFJfTj8NCg0KVGhp
cyBleHBhbnNpb24gaXMgaGFwcGVuaW5nIGluIGxhdGVyIHBhdGNoZXMuDQoNCj4gV291bGQg
aXQgYmUgbmVjZXNzYXJ5IHRvIHVwZGF0ZSBBQ0NfQ0hEX04/DQoNCldpdGggdGhlICNkZWZp
bmUgYWJvdmU6IG5vLg0KDQpXaXRoIGluY2x1ZGluZyBpdCBpbiB0aGUgZW51bTogZGVwZW5k
cyBvbiB0aGUgdmFsdWVzIG9mIEFDQ19SRVFfTiBhbmQgQUNDX1RSX04uDQpBQ0NfQ0hEX04g
bXVzdCBhbHdheXMgYmUgZXF1YWwgdG8gdGhlIGxhcmdlciBvbmUgb2YgYm90aC4NCg0KSW4g
bXkgY3VycmVudCBWNiB2YXJpYW50IEkndmUgYWRkZWQgaXQgdG8gdGhlIGVudW0gd2l0aCBh
IGNvbW1lbnQ6DQoNCisgICAgICAgQUNDX0NIRF9OID0gQUNDX1RSX04sICAgLyogbWF4KEFD
Q19SRVFfTiwgQUNDX1RSX04pLCBmb3IgY2hhbmdlZCBkb20uICovDQoNCg0KSnVlcmdlbg0K
DQo=
--------------N62ZUYeOYAfm1hmPMyBDfT6y
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------N62ZUYeOYAfm1hmPMyBDfT6y--

--------------DqPU2tTqAoprtjlYn5Xz70Z2--

--------------CM8ISQ3LXKqmS3qHvDyzCXmb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRLc7IFAwAAAAAACgkQsN6d1ii/Ey+8
BQf/df6oIzkpy6uXxLOXSCre/QKZPk8at2iA7saka3G61ghi02S39inyNAd8W3g4xvYl8GXy/kWd
052LUDlMc40kudk1/TNfeFfXWe/huR2n7k7dZp7zmNkmfaPPPytfkV+ZjoP6SDBGi7nlN9pOxjMf
TxQYSXnju8UvdTr6tfT5aDxyDjjQQmvUQ26rHKCXf2exfZ4wIP5dvLjvVrUr5hGLY2lZ/tIm1hI/
+3oSfLGjMefJtffqWPswK/zBGtu1VMwH+ww16mlgMoA9Z27sJixrfdbykv8z1TBThXtspi1eftLa
+F4Thvob6bkCjMJ5S3BmKBeJSBAYIV+Pv5yPnBJPpg==
=GdZd
-----END PGP SIGNATURE-----

--------------CM8ISQ3LXKqmS3qHvDyzCXmb--

