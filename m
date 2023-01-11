Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A66665763
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 10:27:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475149.736703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFXNz-0006CM-Bd; Wed, 11 Jan 2023 09:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475149.736703; Wed, 11 Jan 2023 09:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFXNz-0006AS-88; Wed, 11 Jan 2023 09:27:07 +0000
Received: by outflank-mailman (input) for mailman id 475149;
 Wed, 11 Jan 2023 09:27:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvS=5I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pFXNx-0006AM-F3
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 09:27:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ba45e0-9192-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 10:27:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B9F51715E;
 Wed, 11 Jan 2023 09:27:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E60EC1358A;
 Wed, 11 Jan 2023 09:27:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mUbnNuWAvmOTZAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 11 Jan 2023 09:27:01 +0000
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
X-Inumbo-ID: 19ba45e0-9192-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1673429222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sC0uF9eGD69o848eLYrtexwMqzyMTiSrfsq2L3LBc6o=;
	b=OyjvChkMMyD2LS6IjAWh2I3qNttukzBbDcDJAtctZ3PdlMQH/UfvDd/tNRFJGfbYr58Q6j
	Arl3lpWMdFWeXE2pgv8Yc/juJmPMoUsrztRlCwzApQV+ZGeZ1zuN8kdrTRICA5VqD1gNQV
	A3j6wCCa2jPbMIJ0T2lf9qQr/RpCCgk=
Message-ID: <00c146ee-b0d4-55bd-3276-4894b26cd83c@suse.com>
Date: Wed, 11 Jan 2023 10:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-16-jgross@suse.com>
 <b7cfd35b-97ef-42eb-eceb-7f07cd72268c@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 15/19] tools/xenstore: switch hashtable to use the
 talloc framework
In-Reply-To: <b7cfd35b-97ef-42eb-eceb-7f07cd72268c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iFVyoi4bR64KLaI8CtSoZUfV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iFVyoi4bR64KLaI8CtSoZUfV
Content-Type: multipart/mixed; boundary="------------KWXXITPtJ1KDuGIb5mxLsr06";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <00c146ee-b0d4-55bd-3276-4894b26cd83c@suse.com>
Subject: Re: [PATCH v2 15/19] tools/xenstore: switch hashtable to use the
 talloc framework
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-16-jgross@suse.com>
 <b7cfd35b-97ef-42eb-eceb-7f07cd72268c@xen.org>
In-Reply-To: <b7cfd35b-97ef-42eb-eceb-7f07cd72268c@xen.org>

--------------KWXXITPtJ1KDuGIb5mxLsr06
Content-Type: multipart/mixed; boundary="------------TrpUY8kPg6koMLqXntZ3bvG1"

--------------TrpUY8kPg6koMLqXntZ3bvG1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTIuMjIgMjI6NTAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEzLzEyLzIwMjIgMTY6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBA
QCAtMTE1LDQ3ICsxMTcsMzIgQEAgaGFzaHRhYmxlX2V4cGFuZChzdHJ1Y3QgaGFzaHRhYmxl
ICpoKQ0KPj4gwqDCoMKgwqDCoCBpZiAoaC0+cHJpbWVpbmRleCA9PSAocHJpbWVfdGFibGVf
bGVuZ3RoIC0gMSkpIHJldHVybiAwOw0KPj4gwqDCoMKgwqDCoCBuZXdzaXplID0gcHJpbWVz
WysrKGgtPnByaW1laW5kZXgpXTsNCj4+IC3CoMKgwqAgbmV3dGFibGUgPSAoc3RydWN0IGVu
dHJ5ICoqKWNhbGxvYyhuZXdzaXplLCBzaXplb2Yoc3RydWN0IGVudHJ5KikpOw0KPj4gLcKg
wqDCoCBpZiAoTlVMTCAhPSBuZXd0YWJsZSkNCj4+ICvCoMKgwqAgbmV3dGFibGUgPSB0YWxs
b2NfcmVhbGxvYyhoLCBoLT50YWJsZSwgc3RydWN0IGVudHJ5ICosIG5ld3NpemUpOw0KPj4g
K8KgwqDCoCBpZiAoIW5ld3RhYmxlKQ0KPj4gwqDCoMKgwqDCoCB7DQo+PiAtwqDCoMKgwqDC
oMKgwqAgLyogVGhpcyBhbGdvcml0aG0gaXMgbm90ICdzdGFibGUnLiBpZS4gaXQgcmV2ZXJz
ZXMgdGhlIGxpc3QNCj4+IC3CoMKgwqDCoMKgwqDCoMKgICogd2hlbiBpdCB0cmFuc2ZlcnMg
ZW50cmllcyBiZXR3ZWVuIHRoZSB0YWJsZXMgKi8NCj4+IC3CoMKgwqDCoMKgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgaC0+dGFibGVsZW5ndGg7IGkrKykgew0KPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgd2hpbGUgKE5VTEwgIT0gKGUgPSBoLT50YWJsZVtpXSkpIHsNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaC0+dGFibGVbaV0gPSBlLT5uZXh0Ow0KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmRleCA9IGluZGV4Rm9yKG5ld3Np
emUsZS0+aCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaC0+cHJpbWVpbmRleC0tOw0KPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKg
IGgtPnRhYmxlID0gbmV3dGFibGU7DQo+PiArwqDCoMKgIG1lbXNldChuZXd0YWJsZSArIGgt
PnRhYmxlbGVuZ3RoLCAwLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIChuZXdzaXplIC0g
aC0+dGFibGVsZW5ndGgpICogc2l6ZW9mKCpuZXd0YWJsZSkpOw0KPj4gK8KgwqDCoCBmb3Ig
KGkgPSAwOyBpIDwgaC0+dGFibGVsZW5ndGg7IGkrKykgew0KPiANCj4gSSB1bmRlcnN0YW5k
IHRoaXMgY29kZSBpcyB0YWtlbiBmcm9tIHRoZSByZWFsbG9jIHBhdGguIEhvd2V2ZXIsIGlz
bid0IHRoaXMgDQo+IGFsZ29yaXRobSBhbHNvIG5vdCBzdGFibGU/IElmIHNvLCB0aGVuIEkg
dGhpbmsgd2UgbW92ZSB0aGUgY29tbWVudCBoZXJlLg0KDQpJJ20gZmluZSB3aXRoIHRoYXQs
IGV2ZW4gaWYgSSBkb24ndCBzZWUgaG93IGl0IHdvdWxkIG1hdHRlci4gVGhlcmUgaXMgbm8N
Cmd1YXJhbnRlZSByZWdhcmRpbmcgdGhlIG9yZGVyIG9mIGVudHJpZXMgZm9yIGEgZ2l2ZW4g
aW5kZXguDQoNCj4gDQo+PiArwqDCoMKgwqDCoMKgwqAgZm9yIChwRSA9ICYobmV3dGFibGVb
aV0pLCBlID0gKnBFOyBlICE9IE5VTEw7IGUgPSAqcEUpIHsNCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGluZGV4ID0gaW5kZXhGb3IobmV3c2l6ZSxlLT5oKTsNCj4gDQo+IE1pc3Np
bmcgc3BhY2UgYWZ0ZXIgIiwiLg0KDQpXaWxsIGZpeC4NCg0KPiANCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChpbmRleCA9PSBpKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwRSA9ICYoZS0+bmV4
dCk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBlbHNlDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB7DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICpwRSA9IGUtPm5leHQ7DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGUtPm5leHQgPSBuZXd0YWJsZVtpbmRleF07DQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ld3RhYmxlW2luZGV4XSA9
IGU7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4gLcKgwqDCoMKgwqDCoMKgIGZyZWUoaC0+dGFibGUpOw0KPj4gLcKgwqDC
oMKgwqDCoMKgIGgtPnRhYmxlID0gbmV3dGFibGU7DQo+PiAtwqDCoMKgIH0NCj4+IC3CoMKg
wqAgLyogUGxhbiBCOiByZWFsbG9jIGluc3RlYWQgKi8NCj4+IC3CoMKgwqAgZWxzZQ0KPj4g
LcKgwqDCoCB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgbmV3dGFibGUgPSAoc3RydWN0IGVudHJ5
ICoqKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWFsbG9j
KGgtPnRhYmxlLCBuZXdzaXplICogc2l6ZW9mKHN0cnVjdCBlbnRyeSAqKSk7DQo+PiAtwqDC
oMKgwqDCoMKgwqAgaWYgKE5VTEwgPT0gbmV3dGFibGUpIHsgKGgtPnByaW1laW5kZXgpLS07
IHJldHVybiAwOyB9DQo+PiAtwqDCoMKgwqDCoMKgwqAgaC0+dGFibGUgPSBuZXd0YWJsZTsN
Cj4+IC3CoMKgwqDCoMKgwqDCoCBtZW1zZXQobmV3dGFibGUgKyBoLT50YWJsZWxlbmd0aCwg
MCwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChuZXdzaXplIC0gaC0+dGFi
bGVsZW5ndGgpICogc2l6ZW9mKCpuZXd0YWJsZSkpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIGZv
ciAoaSA9IDA7IGkgPCBoLT50YWJsZWxlbmd0aDsgaSsrKSB7DQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmb3IgKHBFID0gJihuZXd0YWJsZVtpXSksIGUgPSAqcEU7IGUgIT0gTlVM
TDsgZSA9ICpwRSkgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmRl
eCA9IGluZGV4Rm9yKG5ld3NpemUsZS0+aCk7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmIChpbmRleCA9PSBpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cEUgPSAmKGUtPm5leHQpOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UNCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICpwRSA9IGUtPm5leHQ7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZS0+bmV4dCA9IG5ld3RhYmxlW2luZGV4XTsNCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXd0YWJsZVtpbmRleF0g
PSBlOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9DQo+PiAtwqDCoMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDC
oCB9DQo+PiArDQo+PiDCoMKgwqDCoMKgIGgtPnRhYmxlbGVuZ3RoID0gbmV3c2l6ZTsNCj4+
IMKgwqDCoMKgwqAgaC0+bG9hZGxpbWl0wqDCoCA9ICh1bnNpZ25lZCBpbnQpDQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgKCgodWludDY0X3QpbmV3c2l6ZSAqIG1heF9sb2FkX2ZhY3Rvcikg
LyAxMDApOw0KPj4gQEAgLTE4NCw3ICsxNzEsNyBAQCBoYXNodGFibGVfaW5zZXJ0KHN0cnVj
dCBoYXNodGFibGUgKmgsIHZvaWQgKmssIHZvaWQgKnYpDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIGVsZW1lbnQgbWF5IGJlIG9rLiBOZXh0IHRpbWUgd2UgaW5zZXJ0LCB3ZSdsbCB0
cnkgZXhwYW5kaW5nIGFnYWluLiovDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaGFzaHRhYmxl
X2V4cGFuZChoKTsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoCBlID0gKHN0cnVjdCBl
bnRyeSAqKWNhbGxvYygxLCBzaXplb2Yoc3RydWN0IGVudHJ5KSk7DQo+PiArwqDCoMKgIGUg
PSB0YWxsb2NfemVybyhoLCBzdHJ1Y3QgZW50cnkpOw0KPj4gwqDCoMKgwqDCoCBpZiAoTlVM
TCA9PSBlKSB7IC0tKGgtPmVudHJ5Y291bnQpOyByZXR1cm4gMDsgfSAvKm9vbSovDQo+PiDC
oMKgwqDCoMKgIGUtPmggPSBoYXNoKGgsayk7DQo+PiDCoMKgwqDCoMKgIGluZGV4ID0gaW5k
ZXhGb3IoaC0+dGFibGVsZW5ndGgsZS0+aCk7DQo+PiBAQCAtMjM4LDggKzIyNSw4IEBAIGhh
c2h0YWJsZV9yZW1vdmUoc3RydWN0IGhhc2h0YWJsZSAqaCwgdm9pZCAqaykNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGgtPmVudHJ5Y291bnQtLTsNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHYgPSBlLT52Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKGgtPmZsYWdzICYgSEFTSFRBQkxFX0ZSRUVfS0VZKQ0KPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlKGUtPmspOw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZnJlZShlKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFs
bG9jX2ZyZWUoZS0+ayk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YWxsb2NfZnJl
ZShlKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB2Ow0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwRSA9ICYoZS0+bmV4
dCk7DQo+PiBAQCAtMjgwLDI1ICsyNjcsMjAgQEAgdm9pZA0KPj4gwqAgaGFzaHRhYmxlX2Rl
c3Ryb3koc3RydWN0IGhhc2h0YWJsZSAqaCkNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgdW5z
aWduZWQgaW50IGk7DQo+PiAtwqDCoMKgIHN0cnVjdCBlbnRyeSAqZSwgKmY7DQo+PiArwqDC
oMKgIHN0cnVjdCBlbnRyeSAqZTsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGVudHJ5ICoqdGFi
bGUgPSBoLT50YWJsZTsNCj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGgtPnRhYmxl
bGVuZ3RoOyBpKyspDQo+PiDCoMKgwqDCoMKgIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBlID0g
dGFibGVbaV07DQo+PiAtwqDCoMKgwqDCoMKgwqAgd2hpbGUgKE5VTEwgIT0gZSkNCj4+ICvC
oMKgwqDCoMKgwqDCoCBmb3IgKGUgPSB0YWJsZVtpXTsgZTsgZSA9IGUtPm5leHQpDQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZiA9IGU7
DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlID0gZS0+bmV4dDsNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChoLT5mbGFncyAmIEhBU0hUQUJMRV9GUkVFX0tFWSkN
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZShmLT5rKTsNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFsbG9jX2ZyZWUoZS0+ayk7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaC0+ZmxhZ3MgJiBIQVNIVEFCTEVfRlJF
RV9WQUxVRSkNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZShmLT52
KTsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyZWUoZik7DQo+IA0KPiBBRkFJVSwg
dGhlIGxvb3AgaXMgcmV3b3JrZWQgc28geW91IGxldCB0YWxsb2MgdG8gZnJlZSBlYWNoIGVs
ZW1lbnQgd2l0aCB0aGUgDQo+IHBhcmVudC4gVXNpbmcgYSB3aGlsZSBsb29wIGlzIGRlZmlu
aXRlbHkgY2xlYW5lciwgYnV0IG5vdyB5b3Ugd2lsbCBlbmQgdXAgdG8gDQo+IGhhdmUgdHdv
IHNlcGFyYXRlIGxvb3AgZm9yIHRoZSBlbGVtZW50cy4NCj4gDQo+IFRoZXJlIGlzIGEgcmlz
ayB0aGF0IHRoZSBvdmVyYWxsIHBlcmZvcm1hbmNlIG9mIGhhc2h0YWJsZV9kZXN0cm95KCkg
d2lsbCBiZSANCj4gd29yc2UgYXMgdGhlIGRhdGEgYWNjZXNzZWQgaW4gb25lIGxvb3AgbWF5
IG5vdCBmaXQgaW4gdGhlIGNhY2hlLiBTbyB5b3Ugd2lsbCANCj4gaGF2ZSB0byByZWxvYWQg
aXQgb24gdGhlIHNlY29uZCBsb29wLg0KPiANCj4gVGhlcmVmb3JlLCBJIHRoaW5rIGl0IHdv
dWxkIGJlIGJldHRlciB0byBrZWVwIHRoZSBsb29wIGFzLWlzLg0KDQpXaGF0IGFib3V0IGEg
Y29tcGxldGVseSBkaWZmZXJlbnQgYXBwcm9hY2g/IEkgY291bGQgbWFrZSB0aGUga2V5IGFu
ZCB2YWx1ZQ0KdGFsbG9jIGNoaWxkcmVuIG9mIGUgd2hlbiBfaW5zZXJ0aW5nXyB0aGUgZWxl
bWVudCBhbmQgdGhlIHJlbGF0ZWQgZmxhZyBpcw0Kc2V0LiBUaGlzIHdvdWxkIHJlZHVjZSBo
YXNodGFibGVfZGVzdHJveSB0byBhIHNpbmdsZSB0YWxsb2NfZnJlZSgpLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------TrpUY8kPg6koMLqXntZ3bvG1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TrpUY8kPg6koMLqXntZ3bvG1--

--------------KWXXITPtJ1KDuGIb5mxLsr06--

--------------iFVyoi4bR64KLaI8CtSoZUfV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmO+gOUFAwAAAAAACgkQsN6d1ii/Ey+v
uQf+P5XFFJu4NP1Mq53Wvtwy8CyWDF2MCfNCX9ie51bqX/q8N/+KFNfHYdU1r0qybpGvcntcFhhM
tN571xBmd9SDFAmGUJ3m9G8ldVzY39zmXk2MXuDJ4YBw6g4BzmVPuTtUyv5yByVR9I5mo1CYpeN1
O/aCwC2OGZ/K3ThxQVBMchSAnELZgbSBFWnT7sSWEgduoEBIfI68RyqT3QoXYwD/2/9ixdo5JrYM
Pn+rYDjb0rdra8I0osBUSG+s6B9+GNxtrupkXfqfybhXf315jMlpTXVyEkbeGVaziTOQJGvc96r+
Z2ymWKtiapHPL372dgjUxKe4YGQxKskYSNJgXfZ3Bg==
=0rXS
-----END PGP SIGNATURE-----

--------------iFVyoi4bR64KLaI8CtSoZUfV--

