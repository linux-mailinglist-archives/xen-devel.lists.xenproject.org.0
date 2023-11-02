Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0865C7DEE20
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 09:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626755.977278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qySz5-00087w-04; Thu, 02 Nov 2023 08:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626755.977278; Thu, 02 Nov 2023 08:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qySz4-00085Z-Tm; Thu, 02 Nov 2023 08:23:22 +0000
Received: by outflank-mailman (input) for mailman id 626755;
 Thu, 02 Nov 2023 08:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WoC4=GP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qySz3-00085T-GO
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 08:23:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13fe4efb-7959-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 09:23:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4552A1F896;
 Thu,  2 Nov 2023 08:23:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1678C13584;
 Thu,  2 Nov 2023 08:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5pyHA3ZcQ2VnSgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 02 Nov 2023 08:23:18 +0000
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
X-Inumbo-ID: 13fe4efb-7959-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698913398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oaSkCnCRdpHN4pcqGIPdSB/jLgcBxKgU/xpR++reEP4=;
	b=WVeJTA8mL8OzmJNw0vPnggwmvAF1xZ5rq7FzLsASnQVwdBEL3A+oBE3XxWGCPIq1YAJg0g
	Vp8ti7mikx3yIN10bTItyMbFRImNcRiJwJT8iUZ/M3IOD/SdOAf56a5afOl0xTIC97r8uI
	rnZwdvlZg5bCbKG1+bFzMuvTD3706To=
Message-ID: <30b8cb38-ecc8-4d4e-bf18-512e893de153@suse.com>
Date: Thu, 2 Nov 2023 09:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/29] tools/xenlogd: connect to frontend
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-4-jgross@suse.com>
 <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mW0my37LWUFI7uzcWUig3KYI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mW0my37LWUFI7uzcWUig3KYI
Content-Type: multipart/mixed; boundary="------------zj5kvRivBLxpe3X2H03nXHiz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <30b8cb38-ecc8-4d4e-bf18-512e893de153@suse.com>
Subject: Re: [PATCH 03/29] tools/xenlogd: connect to frontend
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-4-jgross@suse.com>
 <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>
In-Reply-To: <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com>

--------------zj5kvRivBLxpe3X2H03nXHiz
Content-Type: multipart/mixed; boundary="------------K6XDtvQmGHhHiWBGQE4tsv3e"

--------------K6XDtvQmGHhHiWBGQE4tsv3e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjMgMjA6MjEsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNTozNOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSBjb2RlIGZvciBjb25uZWN0aW5nIHRvIGZyb250ZW5k
cyB0byB4ZW5sb2dkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4NCj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVubG9nZC94ZW5s
b2dkLmMgYi90b29scy94ZW5sb2dkL3hlbmxvZ2QuYw0KPj4gaW5kZXggNzkyZDEwMjZhMy4u
ZGEwYTA5YTEyMiAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbmxvZ2QveGVubG9nZC5jDQo+
PiArKysgYi90b29scy94ZW5sb2dkL3hlbmxvZ2QuYw0KPiANCj4+ICtzdGF0aWMgdm9pZCBj
b25uZWN0X2RldmljZShkZXZpY2UgKmRldmljZSkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVk
IGludCB2YWw7DQo+PiArICAgIHhlbmV2dGNobl9wb3J0X29yX2Vycm9yX3QgZXZ0Y2huOw0K
PiAxLj4gKw0KPj4gKyAgICB2YWwgPSByZWFkX2Zyb250ZW5kX25vZGVfdWludChkZXZpY2Us
ICJ2ZXJzaW9uIiwgMCk7DQo+PiArICAgIGlmICggdmFsICE9IDEgKQ0KPj4gKyAgICAgICAg
cmV0dXJuIGNvbm5lY3RfZXJyKGRldmljZSwgImZyb250ZW5kIHNwZWNpZmllcyBpbGxlZ2Fs
IHZlcnNpb24iKTsNCj4+ICsgICAgdmFsID0gcmVhZF9mcm9udGVuZF9ub2RlX3VpbnQoZGV2
aWNlLCAibnVtLXJpbmdzIiwgMCk7DQo+PiArICAgIGlmICggdmFsICE9IDEgKQ0KPj4gKyAg
ICAgICAgcmV0dXJuIGNvbm5lY3RfZXJyKGRldmljZSwgImZyb250ZW5kIHNwZWNpZmllcyBp
bGxlZ2FsIHJpbmcgbnVtYmVyIik7DQo+IA0KPiBMaW51eCB1c2VzIDIgcmluZ3MgKFhFTl85
UEZTX05VTV9SSU5HUyksIGFuZCBpdCBkb2Vzbid0IGNvbm5lY3Qgd2hlbg0KPiBtYXgtcmlu
Z3MgaXMgbGVzcyB0aGFuIHRoYXQuDQo+IA0KPiBtYXhfcmluZ3MgPSB4ZW5idXNfcmVhZF91
bnNpZ25lZChkZXYtPm90aGVyZW5kLCAibWF4LXJpbmdzIiwgMCk7DQo+IGlmIChtYXhfcmlu
Z3MgPCBYRU5fOVBGU19OVU1fUklOR1MpDQo+ICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0K
PiBuZXdfZGV2aWNlKCkgd3JpdGVzIG1heC1yaW5ncyBhcyAxLiAgU28gdGhpcyB3b3JrcyBm
b3IgbWluaS1vcywgYnV0DQo+IG5vdCBMaW51eC4gIEknbSBub3QgcmVxdWVzdGluZyB5b3Ug
dG8gY2hhbmdlIGl0IC0ganVzdCBub3RpbmcgaXQuDQoNClRoYW5rcyBmb3IgdGhlIG5vdGUu
IEknbGwgY2hhbmdlIGl0IHRvIGFsbG93IG1vcmUgcmluZ3MuDQoNCj4gDQo+PiArDQo+PiAr
ICAgIHZhbCA9IHJlYWRfZnJvbnRlbmRfbm9kZV91aW50KGRldmljZSwgImV2ZW50LWNoYW5u
ZWwtMCIsIDApOw0KPj4gKyAgICBpZiAoIHZhbCA9PSAwICkNCj4+ICsgICAgICAgIHJldHVy
biBjb25uZWN0X2VycihkZXZpY2UsICJmcm9udGVuZCBzcGVjaWZpZXMgaWxsZWdhbCBldnRj
aG4iKTsNCj4+ICsgICAgZXZ0Y2huID0geGVuZXZ0Y2huX2JpbmRfaW50ZXJkb21haW4oeGUs
IGRldmljZS0+ZG9taWQsIHZhbCk7DQo+PiArICAgIGlmICggZXZ0Y2huIDwgMCApDQo+PiAr
ICAgICAgICByZXR1cm4gY29ubmVjdF9lcnIoZGV2aWNlLCAiY291bGQgbm90IGJpbmQgdG8g
ZXZlbnQgY2hhbm5lbCIpOw0KPj4gKyAgICBkZXZpY2UtPmV2dGNobiA9IGV2dGNobjsNCj4+
ICsNCj4+ICsgICAgdmFsID0gcmVhZF9mcm9udGVuZF9ub2RlX3VpbnQoZGV2aWNlLCAicmlu
Zy1yZWYwIiwgMCk7DQo+PiArICAgIGlmICggdmFsID09IDAgKQ0KPj4gKyAgICAgICAgcmV0
dXJuIGNvbm5lY3RfZXJyKGRldmljZSwgImZyb250ZW5kIHNwZWNpZmllcyBpbGxlZ2FsIGdy
YW50IGZvciByaW5nIik7DQo+PiArICAgIGRldmljZS0+aW50ZiA9IHhlbmdudHRhYl9tYXBf
Z3JhbnRfcmVmKHhnLCBkZXZpY2UtPmRvbWlkLCB2YWwsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOw0K
Pj4gKyAgICBpZiAoICFkZXZpY2UtPmludGYgKQ0KPj4gKyAgICAgICAgcmV0dXJuIGNvbm5l
Y3RfZXJyKGRldmljZSwgImNvdWxkIG5vdCBtYXAgaW50ZXJmYWNlIHBhZ2UiKTsNCj4+ICsg
ICAgZGV2aWNlLT5yaW5nX29yZGVyID0gZGV2aWNlLT5pbnRmLT5yaW5nX29yZGVyOw0KPj4g
KyAgICBpZiAoIGRldmljZS0+cmluZ19vcmRlciA+IDkgfHwgZGV2aWNlLT5yaW5nX29yZGVy
IDwgMSApDQo+PiArICAgICAgICByZXR1cm4gY29ubmVjdF9lcnIoZGV2aWNlLCAiZnJvbnRl
bmQgc3BlY2lmaWVzIGlsbGVnYWwgcmluZyBvcmRlciIpOw0KPj4gKyAgICBkZXZpY2UtPnJp
bmdfc2l6ZSA9IFhFTl9GTEVYX1JJTkdfU0laRShkZXZpY2UtPnJpbmdfb3JkZXIpOw0KPj4g
KyAgICBkZXZpY2UtPmRhdGEuaW4gPSB4ZW5nbnR0YWJfbWFwX2RvbWFpbl9ncmFudF9yZWZz
KHhnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDEgPDwgZGV2aWNlLT5yaW5nX29yZGVyLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZS0+ZG9taWQs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZGV2aWNlLT5pbnRmLT5yZWYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFJPVF9SRUFEIHwgUFJPVF9XUklURSk7
DQo+PiArICAgIGlmICggIWRldmljZS0+ZGF0YS5pbiApDQo+PiArICAgICAgICByZXR1cm4g
Y29ubmVjdF9lcnIoZGV2aWNlLCAiY291bGQgbm90IG1hcCByaW5nIHBhZ2VzIik7DQo+PiAr
ICAgIGRldmljZS0+ZGF0YS5vdXQgPSBkZXZpY2UtPmRhdGEuaW4gKyBkZXZpY2UtPnJpbmdf
c2l6ZTsNCj4+ICsNCj4+ICsgICAgaWYgKCBwdGhyZWFkX2NyZWF0ZSgmZGV2aWNlLT50aHJl
YWQsIE5VTEwsIGlvX3RocmVhZCwgZGV2aWNlKSApDQo+PiArICAgICAgIHJldHVybiBjb25u
ZWN0X2VycihkZXZpY2UsICJjb3VsZCBub3Qgc3RhcnQgSS9PIHRocmVhZCIpOw0KPj4gKyAg
ICBkZXZpY2UtPnRocmVhZF9hY3RpdmUgPSB0cnVlOw0KPj4gKw0KPj4gKyAgICB3cml0ZV9i
YWNrZW5kX3N0YXRlKGRldmljZSwgWGVuYnVzU3RhdGVDb25uZWN0ZWQpOw0KPj4gK30NCj4+
ICsNCj4gDQo+PiBAQCAtMTIyLDYgKzY2OSwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqYXJndltdKQ0KPj4gICAgICAgaW50IHN5c2xvZ19tYXNrID0gTE9HX01BU0soTE9HX1dB
Uk5JTkcpIHwgTE9HX01BU0soTE9HX0VSUikgfA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgTE9HX01BU0soTE9HX0NSSVQpIHwgTE9HX01BU0soTE9HX0FMRVJUKSB8DQo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICBMT0dfTUFTSyhMT0dfRU1FUkcpOw0KPj4gKyAgICBjaGFy
ICoqd2F0Y2g7DQo+PiArICAgIHN0cnVjdCBwb2xsZmQgcFsyXSA9IHsNCj4+ICsgICAgICAg
IHsgLmV2ZW50cyA9IFBPTExJTiwgLnJldmVudHMgPSBQT0xMSU4gfSwNCj4gDQo+IEFyZSB5
b3UgaW50ZW50aW9uYWxseSBzZXR0aW5nIHJldmVudHMgdG8gZW50ZXIgdGhlIGxvb3AgaW5p
dGlhbGx5Pw0KPiBTaG91bGRuJ3QgdGhlIHdhdGNoIHJlZ2lzdHJhdGlvbiB0cmlnZ2VyIGl0
IHRvIGZpcmUgYW55d2F5Pw0KDQpJIGRvbid0IHJlbWVtYmVyIHdoZXJlIEkgZ290IHRoaXMg
ZnJvbS4gUHJvYmFibHkgSSByZWFsbHkgd2FudGVkIHRvIHVzZQ0KdGhlIGZpcnN0IGxvb3Ag
aXRlcmF0aW9uIGFscmVhZHkgZm9yIHByb2Nlc3NpbmcgdGhlIGZpcnN0IHJlc3BvbnNlLg0K
DQpJIHRoaW5rIEkgY2FuIGRyb3Agc2V0dGluZyByZXZlbnRzLg0KDQo+IA0KPj4gKyAgICAg
ICAgeyAuZXZlbnRzID0gUE9MTElOIH0NCj4+ICsgICAgfTsNCj4+DQo+PiAgICAgICB1bWFz
aygwMjcpOw0KPj4gICAgICAgaWYgKCBnZXRlbnYoIlhFTkxPR0RfVkVSQk9TRSIpICkNCj4+
IEBAIC0xMzQsOSArNjg2LDI2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
DQo+Pg0KPj4gICAgICAgeGVuX2Nvbm5lY3QoKTsNCj4+DQo+PiArICAgIGlmICggIXhzX3dh
dGNoKHhzLCAiYmFja2VuZC94ZW5fOXBmcyIsICJtYWluIikgKQ0KPj4gKyAgICAgICAgZG9f
ZXJyKCJ4c193YXRjaCgpIGluIG1haW4gdGhyZWFkIGZhaWxlZCIpOw0KPj4gKyAgICBwWzBd
LmZkID0geHNfZmlsZW5vKHhzKTsNCj4+ICsgICAgcFsxXS5mZCA9IHhlbmV2dGNobl9mZCh4
ZSk7DQo+PiArDQo+PiArICAgIHNjYW5fYmFja2VuZCgpOw0KPj4gKw0KPj4gICAgICAgd2hp
bGUgKCAhc3RvcF9tZSApDQo+PiAgICAgICB7DQo+PiAtICAgICAgICBzbGVlcCg2MCk7DQo+
PiArICAgICAgICB3aGlsZSAoIChwWzBdLnJldmVudHMgJiBQT0xMSU4pICYmDQo+PiArICAg
ICAgICAgICAgICAgICh3YXRjaCA9IHhzX2NoZWNrX3dhdGNoKHhzKSkgIT0gTlVMTCApDQo+
PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgaGFuZGxlX3dhdGNoKHdhdGNoW1hTX1dB
VENIX1BBVEhdLCB3YXRjaFtYU19XQVRDSF9UT0tFTl0pOw0KPj4gKyAgICAgICAgICAgIGZy
ZWUod2F0Y2gpOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBwWzFd
LnJldmVudHMgJiBQT0xMSU4gKQ0KPj4gKyAgICAgICAgICAgIGhhbmRsZV9ldmVudCgpOw0K
Pj4gKw0KPj4gKyAgICAgICAgcG9sbChwLCAyLCAxMDAwMCk7DQo+IA0KPiBDYW4geW91IGp1
c3QgdXNlIGFuIGluZmluaXRlIHRpbWVvdXQgYW5kIHJlbHkgb24gdGhlIHNpZ25hbA0KPiBp
bnRlcnJ1cHRpbmcgdGhlIHN5c3RlbSBjYWxsPw0KDQpZZXMsIHByb2JhYmx5Lg0KDQoNCkp1
ZXJnZW4NCg==
--------------K6XDtvQmGHhHiWBGQE4tsv3e
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------K6XDtvQmGHhHiWBGQE4tsv3e--

--------------zj5kvRivBLxpe3X2H03nXHiz--

--------------mW0my37LWUFI7uzcWUig3KYI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVDXHUFAwAAAAAACgkQsN6d1ii/Ey/K
ngf5ARXMZA1ZqDsPtowxBqtJuISX6EljJQzO6/O+/s6RwogDUIYYB4wNKd75EwQJbgytnd/h06Eu
arDdkEbCEwabsT1aX7tCpK+jkgtImzuoCTde65243GBWhQv+jiezuvXs9ucfu/z+DbPPp3P7mACu
zDkcloBa/rkRsFpGPeDLbNWHpt4P8t1e4qTL0d+IuXRaNGP5n1rtXsZ6wFZbCW/7zEJNltZNCTt3
E+R/JekQlvCtxwELgZGyJutwOKLVX94IgmFennPw2a+IdO30iy9pP/u7JHtcRbLt+KnALyUMcTN2
oYgXmSm0q9hLWEHfVXI008HL3zNWYttWCPULYcFzAA==
=jLHE
-----END PGP SIGNATURE-----

--------------mW0my37LWUFI7uzcWUig3KYI--

