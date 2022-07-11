Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A109C5701FC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 14:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365087.595149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsTn-000355-KF; Mon, 11 Jul 2022 12:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365087.595149; Mon, 11 Jul 2022 12:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAsTn-00032k-Gi; Mon, 11 Jul 2022 12:25:35 +0000
Received: by outflank-mailman (input) for mailman id 365087;
 Mon, 11 Jul 2022 12:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=twA/=XQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oAsTm-00032e-6T
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 12:25:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8efef755-0114-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 14:25:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 873911F8EF;
 Mon, 11 Jul 2022 12:25:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D21B13524;
 Mon, 11 Jul 2022 12:25:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SOh2EbwWzGLZEAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 11 Jul 2022 12:25:32 +0000
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
X-Inumbo-ID: 8efef755-0114-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657542332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GtViWUb8mkNm214gAIMTZGJNECGSz22IjiSDElrHzXU=;
	b=gwMLQ9CoUcSjGbsisAbD3wqM/kAmRNERKXGFW4LYXRWMK3xBhfn6TAXDmxNreEzE4owMWX
	QyHCF/I97Ieg3goBCbEFhrA1sO9fJsdMyfyRftNL43oXajv55ZvSGvy0jZzKG9D+seOUmo
	4RCJeIR+VyV+whRuaZviPPTw6ntISDg=
Message-ID: <458e3626-a6ac-6e58-29f2-ec669a71baf4@suse.com>
Date: Mon, 11 Jul 2022 14:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] tools: allow vchan XenStore paths more then 64 bytes
 long
Content-Language: en-US
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20220709101035.2989428-2-dmitry.semenets@gmail.com>
 <7e32d853-a1e4-f828-7c27-dbd2e3595d5f@suse.com>
 <CACM97VUqyG66XHO__+8v6F4Uq=oVi_-_8R=B8STjgOzCb9kmaw@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <CACM97VUqyG66XHO__+8v6F4Uq=oVi_-_8R=B8STjgOzCb9kmaw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JRYTzRSY0rS2OmSe01ZsEnwC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JRYTzRSY0rS2OmSe01ZsEnwC
Content-Type: multipart/mixed; boundary="------------ky4l10Hw2ZsYNNNldyCf0wp6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Dmytro Semenets <dmitry.semenets@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Dmytro Semenets <dmytro_semenets@epam.com>
Message-ID: <458e3626-a6ac-6e58-29f2-ec669a71baf4@suse.com>
Subject: Re: [PATCH 2/4] tools: allow vchan XenStore paths more then 64 bytes
 long
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
 <20220709101035.2989428-2-dmitry.semenets@gmail.com>
 <7e32d853-a1e4-f828-7c27-dbd2e3595d5f@suse.com>
 <CACM97VUqyG66XHO__+8v6F4Uq=oVi_-_8R=B8STjgOzCb9kmaw@mail.gmail.com>
In-Reply-To: <CACM97VUqyG66XHO__+8v6F4Uq=oVi_-_8R=B8STjgOzCb9kmaw@mail.gmail.com>

--------------ky4l10Hw2ZsYNNNldyCf0wp6
Content-Type: multipart/mixed; boundary="------------yvkmly6i7qpmbUHvmFggB55w"

--------------yvkmly6i7qpmbUHvmFggB55w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjIgMTQ6MjMsIERteXRybyBTZW1lbmV0cyB3cm90ZToNCj4gSGVsbG8gSnVl
cmdlbiwNCj4g0L/QvSwgMTEg0LjRjtC7LiAyMDIyINCzLiDQsiAxMDoyNCwgSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPjoNCj4+DQo+PiBPbiAwOS4wNy4yMiAxMjoxMCwgZG1p
dHJ5LnNlbWVuZXRzQGdtYWlsLmNvbSB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+
PiBDdXJyZW50IHZjaGFuIGltcGxlbWVudGF0aW9uLCB3aGlsZSBkZWFsaW5nIHdpdGggWGVu
U3RvcmUgcGF0aHMsDQo+Pj4gYWxsb2NhdGVzIDY0IGJ5dGVzIGJ1ZmZlciBvbiB0aGUgc3Rh
Y2sgd2hpY2ggbWF5IG5vdCBiZSBlbm91Z2ggZm9yDQo+Pj4gc29tZSB1c2UtY2FzZXMuIE1h
a2UgdGhlIGJ1ZmZlciBsb25nZXIgdG8gcmVzcGVjdCBtYXhpbXVtIGFsbG93ZWQNCj4+PiBY
ZW5TdG9yZSBwYXRoIG9mIFhFTlNUT1JFX0FCU19QQVRIX01BWC4NCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNo
ZW5rb0BlcGFtLmNvbT4NCj4+PiAtLS0NCj4+PiAgICB0b29scy9saWJzL3ZjaGFuL2luaXQu
YyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0NCj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS90b29scy9saWJzL3ZjaGFuL2luaXQuYyBiL3Rvb2xzL2xpYnMvdmNoYW4vaW5p
dC5jDQo+Pj4gaW5kZXggYzZiODY3NGVmNS4uMTc5NDVjMjRhMSAxMDA2NDQNCj4+PiAtLS0g
YS90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPj4+ICsrKyBiL3Rvb2xzL2xpYnMvdmNoYW4v
aW5pdC5jDQo+Pj4gQEAgLTI0OSw3ICsyNDksNyBAQCBzdGF0aWMgaW50IGluaXRfeHNfc3J2
KHN0cnVjdCBsaWJ4ZW52Y2hhbiAqY3RybCwgaW50IGRvbWFpbiwgY29uc3QgY2hhciogeHNf
YmFzZQ0KPj4+ICAgICAgICBpbnQgcmV0ID0gLTE7DQo+Pj4gICAgICAgIHN0cnVjdCB4c19o
YW5kbGUgKnhzOw0KPj4+ICAgICAgICBzdHJ1Y3QgeHNfcGVybWlzc2lvbnMgcGVybXNbMl07
DQo+Pj4gLSAgICAgY2hhciBidWZbNjRdOw0KPj4+ICsgICAgIGNoYXIgKmJ1ZjsNCj4+PiAg
ICAgICAgY2hhciByZWZbMTZdOw0KPj4+ICAgICAgICBjaGFyKiBkb21pZF9zdHIgPSBOVUxM
Ow0KPj4+ICAgICAgICB4c190cmFuc2FjdGlvbl90IHhzX3RyYW5zID0gWEJUX05VTEw7DQo+
Pj4gQEAgLTI1Nyw2ICsyNTcsMTIgQEAgc3RhdGljIGludCBpbml0X3hzX3NydihzdHJ1Y3Qg
bGlieGVudmNoYW4gKmN0cmwsIGludCBkb21haW4sIGNvbnN0IGNoYXIqIHhzX2Jhc2UNCj4+
PiAgICAgICAgLy8gc3RvcmUgdGhlIGJhc2UgcGF0aCBzbyB3ZSBjYW4gY2xlYW4gdXAgb24g
c2VydmVyIGNsb3N1cmUNCj4+PiAgICAgICAgY3RybC0+eHNfcGF0aCA9IHN0cmR1cCh4c19i
YXNlKTsNCj4+Pg0KPj4+ICsgICAgIGJ1ZiA9IG1hbGxvYyhYRU5TVE9SRV9BQlNfUEFUSF9N
QVgpOw0KPj4+ICsgICAgIGlmICghYnVmKSB7DQo+Pj4gKyAgICAgICAgICAgICBmcmVlKGN0
cmwpOw0KPj4+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+Pj4gKyAgICAgfQ0KPj4+ICsN
Cj4+PiAgICAgICAgeHMgPSB4c19vcGVuKDApOw0KPj4+ICAgICAgICBpZiAoIXhzKQ0KPj4+
ICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+PiBAQCAtMjc4LDE0ICsyODQsMTQgQEAg
cmV0cnlfdHJhbnNhY3Rpb246DQo+Pj4gICAgICAgICAgICAgICAgZ290byBmYWlsX3hzX29w
ZW47DQo+Pj4NCj4+PiAgICAgICAgc25wcmludGYocmVmLCBzaXplb2YgcmVmLCAiJWQiLCBy
aW5nX3JlZik7DQo+Pj4gLSAgICAgc25wcmludGYoYnVmLCBzaXplb2YgYnVmLCAiJXMvcmlu
Zy1yZWYiLCB4c19iYXNlKTsNCj4+PiArICAgICBzbnByaW50ZihidWYsIFhFTlNUT1JFX0FC
U19QQVRIX01BWCwgIiVzL3JpbmctcmVmIiwgeHNfYmFzZSk7DQo+Pj4gICAgICAgIGlmICgh
eHNfd3JpdGUoeHMsIHhzX3RyYW5zLCBidWYsIHJlZiwgc3RybGVuKHJlZikpKQ0KPj4+ICAg
ICAgICAgICAgICAgIGdvdG8gZmFpbF94c19vcGVuOw0KPj4+ICAgICAgICBpZiAoIXhzX3Nl
dF9wZXJtaXNzaW9ucyh4cywgeHNfdHJhbnMsIGJ1ZiwgcGVybXMsIDIpKQ0KPj4+ICAgICAg
ICAgICAgICAgIGdvdG8gZmFpbF94c19vcGVuOw0KPj4+DQo+Pj4gICAgICAgIHNucHJpbnRm
KHJlZiwgc2l6ZW9mIHJlZiwgIiVkIiwgY3RybC0+ZXZlbnRfcG9ydCk7DQo+Pj4gLSAgICAg
c25wcmludGYoYnVmLCBzaXplb2YgYnVmLCAiJXMvZXZlbnQtY2hhbm5lbCIsIHhzX2Jhc2Up
Ow0KPj4+ICsgICAgIHNucHJpbnRmKGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLCAiJXMv
ZXZlbnQtY2hhbm5lbCIsIHhzX2Jhc2UpOw0KPj4+ICAgICAgICBpZiAoIXhzX3dyaXRlKHhz
LCB4c190cmFucywgYnVmLCByZWYsIHN0cmxlbihyZWYpKSkNCj4+PiAgICAgICAgICAgICAg
ICBnb3RvIGZhaWxfeHNfb3BlbjsNCj4+PiAgICAgICAgaWYgKCF4c19zZXRfcGVybWlzc2lv
bnMoeHMsIHhzX3RyYW5zLCBidWYsIHBlcm1zLCAyKSkNCj4+PiBAQCAtMzAxLDYgKzMwNyw3
IEBAIHJldHJ5X3RyYW5zYWN0aW9uOg0KPj4+ICAgICAgICBmcmVlKGRvbWlkX3N0cik7DQo+
Pj4gICAgICAgIHhzX2Nsb3NlKHhzKTsNCj4+PiAgICAgZmFpbDoNCj4+PiArICAgICBmcmVl
KGJ1Zik7DQo+Pj4gICAgICAgIHJldHVybiByZXQ7DQo+Pj4gICAgfQ0KPj4+DQo+Pj4gQEAg
LTQxOCwxMyArNDI1LDIwIEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xp
ZW50X2luaXQoc3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+Pj4gICAgew0K
Pj4+ICAgICAgICBzdHJ1Y3QgbGlieGVudmNoYW4gKmN0cmwgPSBtYWxsb2Moc2l6ZW9mKHN0
cnVjdCBsaWJ4ZW52Y2hhbikpOw0KPj4+ICAgICAgICBzdHJ1Y3QgeHNfaGFuZGxlICp4cyA9
IE5VTEw7DQo+Pj4gLSAgICAgY2hhciBidWZbNjRdOw0KPj4+ICsgICAgIGNoYXIgKmJ1ZjsN
Cj4+PiAgICAgICAgY2hhciAqcmVmOw0KPj4+ICAgICAgICBpbnQgcmluZ19yZWY7DQo+Pj4g
ICAgICAgIHVuc2lnbmVkIGludCBsZW47DQo+Pj4NCj4+PiAgICAgICAgaWYgKCFjdHJsKQ0K
Pj4+ICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPj4+ICsNCj4+PiArICAgICBidWYgPSBt
YWxsb2MoWEVOU1RPUkVfQUJTX1BBVEhfTUFYKTsNCj4+PiArICAgICBpZiAoIWJ1Zikgew0K
Pj4+ICsgICAgICAgICAgICAgZnJlZShjdHJsKTsNCj4+PiArICAgICAgICAgICAgIHJldHVy
biAwOw0KPj4+ICsgICAgIH0NCj4+PiArDQo+Pj4gICAgICAgIGN0cmwtPnJpbmcgPSBOVUxM
Ow0KPj4+ICAgICAgICBjdHJsLT5ldmVudCA9IE5VTEw7DQo+Pj4gICAgICAgIGN0cmwtPmdu
dHRhYiA9IE5VTEw7DQo+Pj4gQEAgLTQzNSw4ICs0NDksOSBAQCBzdHJ1Y3QgbGlieGVudmNo
YW4gKmxpYnhlbnZjaGFuX2NsaWVudF9pbml0KHN0cnVjdCB4ZW50b29sbG9nX2xvZ2dlciAq
bG9nZ2VyLA0KPj4+ICAgICAgICBpZiAoIXhzKQ0KPj4+ICAgICAgICAgICAgICAgIGdvdG8g
ZmFpbDsNCj4+DQo+PiBZb3UgYXJlIGxlYWtpbmcgYnVmIGluIHRoaXMgY2FzZS4NCj4gTm8u
IGJ1ZiByZWxlYXNlZCBpbiBsaW5lIDQ3NC4gY3RybCBsZWFrcyBpbiBmYWlsIGNhc2UNCg0K
ImdvdG8gZmFpbCIgd2lsbCBnbyB0byBsaW5lIDQ3NiwgYW5kIHRoZSBjYWxsIG9mIGxpYnhl
bnZjaGFuX2Nsb3NlKCkNCndpbGwgZnJlZSBjdHJsLg0KDQo+Pg0KPj4+DQo+Pj4gKw0KPj4+
ICAgIC8vIGZpbmQgeGVuc3RvcmUgZW50cnkNCj4+PiAtICAgICBzbnByaW50ZihidWYsIHNp
emVvZiBidWYsICIlcy9yaW5nLXJlZiIsIHhzX3BhdGgpOw0KPj4+ICsgICAgIHNucHJpbnRm
KGJ1ZiwgWEVOU1RPUkVfQUJTX1BBVEhfTUFYLCAiJXMvcmluZy1yZWYiLCB4c19wYXRoKTsN
Cj4+PiAgICAgICAgcmVmID0geHNfcmVhZCh4cywgMCwgYnVmLCAmbGVuKTsNCj4+PiAgICAg
ICAgaWYgKCFyZWYpDQo+Pj4gICAgICAgICAgICAgICAgZ290byBmYWlsOw0KPj4+IEBAIC00
NDQsNyArNDU5LDcgQEAgc3RydWN0IGxpYnhlbnZjaGFuICpsaWJ4ZW52Y2hhbl9jbGllbnRf
aW5pdChzdHJ1Y3QgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwNCj4+PiAgICAgICAgZnJl
ZShyZWYpOw0KPj4+ICAgICAgICBpZiAoIXJpbmdfcmVmKQ0KPj4+ICAgICAgICAgICAgICAg
IGdvdG8gZmFpbDsNCj4+PiAtICAgICBzbnByaW50ZihidWYsIHNpemVvZiBidWYsICIlcy9l
dmVudC1jaGFubmVsIiwgeHNfcGF0aCk7DQo+Pj4gKyAgICAgc25wcmludGYoYnVmLCBYRU5T
VE9SRV9BQlNfUEFUSF9NQVgsICIlcy9ldmVudC1jaGFubmVsIiwgeHNfcGF0aCk7DQo+Pj4g
ICAgICAgIHJlZiA9IHhzX3JlYWQoeHMsIDAsIGJ1ZiwgJmxlbik7DQo+Pj4gICAgICAgIGlm
ICghcmVmKQ0KPj4+ICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+PiBAQCAtNDc0LDYg
KzQ4OSw3IEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiAqbGlieGVudmNoYW5fY2xpZW50X2luaXQo
c3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsDQo+Pj4gICAgIG91dDoNCj4+PiAg
ICAgICAgaWYgKHhzKQ0KPj4+ICAgICAgICAgICAgICAgIHhzX2Nsb3NlKHhzKTsNCj4+PiAr
ICAgICBmcmVlKGJ1Zik7DQo+Pj4gICAgICAgIHJldHVybiBjdHJsOw0KPj4+ICAgICBmYWls
Og0KPj4+ICAgICAgICBsaWJ4ZW52Y2hhbl9jbG9zZShjdHJsKTsNCg0KDQpKdWVyZ2VuDQoN
Cg==
--------------yvkmly6i7qpmbUHvmFggB55w
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yvkmly6i7qpmbUHvmFggB55w--

--------------ky4l10Hw2ZsYNNNldyCf0wp6--

--------------JRYTzRSY0rS2OmSe01ZsEnwC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLMFrsFAwAAAAAACgkQsN6d1ii/Ey8A
lwf7BJYBg8CoupjoEbuQteu50wsebLWKcV2RD3V1xPzAwJk5EsTssS603y1aApZaQijQEV51kkrl
P9BfDriLZg55CEneYBljoVVvE09vHsi01DxLdLsB/E8eB1Lb4YyQgGg5hVJPKJBAQuHkXkWj93LK
SY2qeAb8ziWmH+mtSWLecE+avEGbn5IAoek88gaCnMDEpfUqpWzMbyk1Jw9j6UnvHWhE7edN3kVM
FEXQEF/QVB7CGhYcJxI3l7DaXXIXdDW58IXfNP4R5zBaa3os0ERxhWBQEezO6tRe8jwmStTrNLAj
ifkQdzlLBcAHoqHcC7tgFFTyrywutS4VfKutpjCLNg==
=P37F
-----END PGP SIGNATURE-----

--------------JRYTzRSY0rS2OmSe01ZsEnwC--

