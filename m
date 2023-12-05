Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3988056E1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647923.1011693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW8w-0006hM-Cz; Tue, 05 Dec 2023 14:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647923.1011693; Tue, 05 Dec 2023 14:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAW8w-0006en-8O; Tue, 05 Dec 2023 14:11:22 +0000
Received: by outflank-mailman (input) for mailman id 647923;
 Tue, 05 Dec 2023 14:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAW8u-0006Mk-8t
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:11:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286d51f4-9378-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 15:11:18 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 404501F8BF;
 Tue,  5 Dec 2023 14:11:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F350F1386E;
 Tue,  5 Dec 2023 14:11:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nq0UOoQvb2W/SgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 14:11:16 +0000
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
X-Inumbo-ID: 286d51f4-9378-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701785477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vds+xSphqYEOsfxiI2YJYeIZvVVp7tw8P160r19+a5Q=;
	b=V69iUSg8d4M1kHUGcAuh3ENM6L+DFmuyP2etRBn80n3zKOa39L8Kvl8+yCl9ydjhsDUjde
	NStgMDk4HjItY/kqwngoRdxyw+785h+TmrF/5kEsboSLX9eDippBuPwJVdNs1NZj+dRX7l
	Fj2mmYLniIVr8WUsxjKtNgJ1svXeVqc=
Message-ID: <9e14e65c-8cc0-4e51-ad52-33bdc40eacf0@suse.com>
Date: Tue, 5 Dec 2023 15:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <8aa1ae99-5bc3-4165-90eb-e522769d4de3@suse.com>
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
In-Reply-To: <8aa1ae99-5bc3-4165-90eb-e522769d4de3@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8I9o3TinJtBxY5awZ310DFeS"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.11
X-Spamd-Result: default: False [-4.11 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.12)[-0.609];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8I9o3TinJtBxY5awZ310DFeS
Content-Type: multipart/mixed; boundary="------------b81fTC4Z0yjAgMf9lQ05puq0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
Message-ID: <9e14e65c-8cc0-4e51-ad52-33bdc40eacf0@suse.com>
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <8aa1ae99-5bc3-4165-90eb-e522769d4de3@suse.com>
In-Reply-To: <8aa1ae99-5bc3-4165-90eb-e522769d4de3@suse.com>

--------------b81fTC4Z0yjAgMf9lQ05puq0
Content-Type: multipart/mixed; boundary="------------mv4CixqtfXnh5lf1SZsOyILC"

--------------mv4CixqtfXnh5lf1SZsOyILC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTIuMjMgMTQ6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4xMi4yMDIz
IDExOjA3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQEAgLTE1LDY3ICs3LDEyNiBAQA0K
Pj4gICAjaW5jbHVkZSA8YXNtL2J5dGVvcmRlci5oPg0KPj4gICAjZW5kaWYNCj4+ICAgDQo+
PiAtI2RlZmluZSBnZXRfdW5hbGlnbmVkKHApICgqKHApKQ0KPj4gLSNkZWZpbmUgcHV0X3Vu
YWxpZ25lZCh2YWwsIHApICgqKHApID0gKHZhbCkpDQo+PiArLyoNCj4+ICsgKiBUaGlzIGlz
IHRoZSBtb3N0IGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2YgdW5hbGlnbmVkIGFjY2Vzc2Vz
DQo+PiArICogYW5kIHNob3VsZCB3b3JrIGFsbW9zdCBhbnl3aGVyZS4NCj4+ICsgKi8NCj4+
ICsNCj4+ICsjZGVmaW5lIF9fZ2V0X3VuYWxpZ25lZF90KHR5cGUsIHB0cikgKHsJCQkJCQlc
DQo+PiArCWNvbnN0IHN0cnVjdCB7IHR5cGUgeDsgfSBfX3BhY2tlZCAqX19wcHRyID0gKHR5
cGVvZihfX3BwdHIpKShwdHIpOwlcDQo+PiArCV9fcHB0ci0+eDsJCQkJCQkJCVwNCj4+ICt9
KQ0KPj4gKw0KPj4gKyNkZWZpbmUgX19wdXRfdW5hbGlnbmVkX3QodHlwZSwgdmFsLCBwdHIp
IGRvIHsJCQkJCVwNCj4+ICsJc3RydWN0IHsgdHlwZSB4OyB9IF9fcGFja2VkICpfX3BwdHIg
PSAodHlwZW9mKF9fcHB0cikpKHB0cik7CQlcDQo+PiArCV9fcHB0ci0+eCA9ICh2YWwpOwkJ
CQkJCQlcDQo+PiArfSB3aGlsZSAoMCkNCj4gDQo+IFBsZWFzZSBjYW4gd2UgYXZvaWQgZ2Fp
bmluZyBuZXcgKGV2ZW4gZG91YmxlKSBsZWFkaW5nIHVuZGVyc2NvcmUgc3ltYm9scywNCj4g
ZXNwZWNpYWxseSB3aGVuIHRoZXkncmUgaW4gaGVscGVyIChpLmUuIG5vdCBpbnRlbmRlZCB0
byBiZSB1c2VkIGRpcmVjdGx5KQ0KPiBjb25zdHJ1Y3RzPyBObyByZWFzb24gdG8gaW50cm9k
dWNlIGZ1cnRoZXIgaXNzdWVzIHdydCBNaXNyYSBhZG9wdGlvbi4NCj4gDQo+PiArI2RlZmlu
ZSBnZXRfdW5hbGlnbmVkKHB0cikJX19nZXRfdW5hbGlnbmVkX3QodHlwZW9mKCoocHRyKSks
IChwdHIpKQ0KPj4gKyNkZWZpbmUgcHV0X3VuYWxpZ25lZCh2YWwsIHB0cikgX19wdXRfdW5h
bGlnbmVkX3QodHlwZW9mKCoocHRyKSksICh2YWwpLCAocHRyKSkNCj4gDQo+IE1heSBJIGFz
ayB0byBvbWl0IGV4Y2VzcyBwYXJlbnRoZXNlcyB3aGVyZSBwb3NzaWJsZT8NCj4gDQo+PiAr
c3RhdGljIGlubGluZSB1MTYgZ2V0X3VuYWxpZ25lZF9sZTE2KGNvbnN0IHZvaWQgKnApDQo+
PiArew0KPj4gKwlyZXR1cm4gbGUxNl90b19jcHUoX19nZXRfdW5hbGlnbmVkX3QoX19sZTE2
LCBwKSk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdTMyIGdldF91bmFsaWdu
ZWRfbGUzMihjb25zdCB2b2lkICpwKQ0KPj4gK3sNCj4+ICsJcmV0dXJuIGxlMzJfdG9fY3B1
KF9fZ2V0X3VuYWxpZ25lZF90KF9fbGUzMiwgcCkpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0
aWMgaW5saW5lIHU2NCBnZXRfdW5hbGlnbmVkX2xlNjQoY29uc3Qgdm9pZCAqcCkNCj4+ICt7
DQo+PiArCXJldHVybiBsZTY0X3RvX2NwdShfX2dldF91bmFsaWduZWRfdChfX2xlNjQsIHAp
KTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRf
bGUxNih1MTYgdmFsLCB2b2lkICpwKQ0KPj4gK3sNCj4+ICsJX19wdXRfdW5hbGlnbmVkX3Qo
X19sZTE2LCBjcHVfdG9fbGUxNih2YWwpLCBwKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGlj
IGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfbGUzMih1MzIgdmFsLCB2b2lkICpwKQ0KPj4g
K3sNCj4+ICsJX19wdXRfdW5hbGlnbmVkX3QoX19sZTMyLCBjcHVfdG9fbGUzMih2YWwpLCBw
KTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRf
bGU2NCh1NjQgdmFsLCB2b2lkICpwKQ0KPj4gK3sNCj4+ICsJX19wdXRfdW5hbGlnbmVkX3Qo
X19sZTY0LCBjcHVfdG9fbGU2NCh2YWwpLCBwKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGlj
IGlubGluZSB1MTYgZ2V0X3VuYWxpZ25lZF9iZTE2KGNvbnN0IHZvaWQgKnApDQo+PiArew0K
Pj4gKwlyZXR1cm4gYmUxNl90b19jcHUoX19nZXRfdW5hbGlnbmVkX3QoX19iZTE2LCBwKSk7
DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdTMyIGdldF91bmFsaWduZWRfYmUz
Mihjb25zdCB2b2lkICpwKQ0KPj4gK3sNCj4+ICsJcmV0dXJuIGJlMzJfdG9fY3B1KF9fZ2V0
X3VuYWxpZ25lZF90KF9fYmUzMiwgcCkpOw0KPj4gK30NCj4+ICAgDQo+PiAtc3RhdGljIGlu
bGluZSB1aW50MTZfdCBnZXRfdW5hbGlnbmVkX2JlMTYoY29uc3Qgdm9pZCAqcCkNCj4+ICtz
dGF0aWMgaW5saW5lIHU2NCBnZXRfdW5hbGlnbmVkX2JlNjQoY29uc3Qgdm9pZCAqcCkNCj4+
ICAgew0KPj4gLQlyZXR1cm4gYmUxNl90b19jcHVwKHApOw0KPj4gKwlyZXR1cm4gYmU2NF90
b19jcHUoX19nZXRfdW5hbGlnbmVkX3QoX19iZTY0LCBwKSk7DQo+PiAgIH0NCj4+ICAgDQo+
PiAtc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmUxNih1aW50MTZfdCB2YWws
IHZvaWQgKnApDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmUxNih1
MTYgdmFsLCB2b2lkICpwKQ0KPj4gICB7DQo+PiAtCSooX19mb3JjZSBfX2JlMTYqKXAgPSBj
cHVfdG9fYmUxNih2YWwpOw0KPj4gKwlfX3B1dF91bmFsaWduZWRfdChfX2JlMTYsIGNwdV90
b19iZTE2KHZhbCksIHApOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBpbmxpbmUgdWlu
dDMyX3QgZ2V0X3VuYWxpZ25lZF9iZTMyKGNvbnN0IHZvaWQgKnApDQo+PiArc3RhdGljIGlu
bGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmUzMih1MzIgdmFsLCB2b2lkICpwKQ0KPj4gICB7
DQo+PiAtCXJldHVybiBiZTMyX3RvX2NwdXAocCk7DQo+PiArCV9fcHV0X3VuYWxpZ25lZF90
KF9fYmUzMiwgY3B1X3RvX2JlMzIodmFsKSwgcCk7DQo+PiAgIH0NCj4+ICAgDQo+PiAtc3Rh
dGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmUzMih1aW50MzJfdCB2YWwsIHZvaWQg
KnApDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHB1dF91bmFsaWduZWRfYmU2NCh1NjQgdmFs
LCB2b2lkICpwKQ0KPj4gICB7DQo+PiAtCSooX19mb3JjZSBfX2JlMzIqKXAgPSBjcHVfdG9f
YmUzMih2YWwpOw0KPj4gKwlfX3B1dF91bmFsaWduZWRfdChfX2JlNjQsIGNwdV90b19iZTY0
KHZhbCksIHApOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBpbmxpbmUgdWludDY0X3Qg
Z2V0X3VuYWxpZ25lZF9iZTY0KGNvbnN0IHZvaWQgKnApDQo+PiArc3RhdGljIGlubGluZSB1
MzIgX19nZXRfdW5hbGlnbmVkX2JlMjQoY29uc3QgdTggKnApDQo+IA0KPiBIZXJlIGFuZCBi
ZWxvdyAtIGRvIHlvdSBmb3Jlc2VlIHVzZSBvZiB0aGVzZSAyNC1iaXQgaGVscGVycz8gVGhl
eSB3ZXJlbid0DQo+IHRoZXJlIGJlZm9yZSwgYW5kIHRoZSBkZXNjcmlwdGlvbiBhbHNvIGRv
ZXNuJ3QganVzdGlmeSB0aGVpciBpbnRyb2R1Y3Rpb24uDQoNCkkgaGF2ZSBqdXN0IGFwcGxp
ZWQgdGhlIHBhdGNoIGZyb20gdGhlIGtlcm5lbCAoc2VlIE9yaWdpbjogdGFnKS4NCg0KSSBj
YW4gY2hhbmdlIHRoZSBwYXRjaCBhY2NvcmRpbmcgdG8geW91ciBjb21tZW50cywgb2YgY291
cnNlLg0KDQoNCkp1ZXJnZW4NCg==
--------------mv4CixqtfXnh5lf1SZsOyILC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------mv4CixqtfXnh5lf1SZsOyILC--

--------------b81fTC4Z0yjAgMf9lQ05puq0--

--------------8I9o3TinJtBxY5awZ310DFeS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVvL4QFAwAAAAAACgkQsN6d1ii/Ey8t
3Af/SfXYaV704fed31GNdS9aMuWqoq26b+74k71jxc7WA7Xc6cEZYA1TJ6PNGJ0qQh3LywqwcfTE
Teq9ivayf96PPNgBWvpTr0IbauMTBT5wefXBh5nGZl55DfeeOMaFeyz8ZTKi3pmDYkyU3mc5vdWe
c0Wa9646YN4pJuUv73leRoTDvjoy6c22hYE/Otk5skJUBok7CK1DAPM62Q9vthHX5DS8gpf7gehH
kjioYojW5IYVKp4vT4Q9o85wr8ZDQJ+hbvpEoovGZ0302f6ld6xxjOenuf5/4VqCyh2nZxwfcbmk
PYZHS3f2asULJRcY57FkyRGJLVoabjr3nsUkg3YyNg==
=jKZe
-----END PGP SIGNATURE-----

--------------8I9o3TinJtBxY5awZ310DFeS--

