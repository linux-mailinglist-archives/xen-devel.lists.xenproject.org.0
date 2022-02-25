Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165954C4035
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278824.476216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNW5v-0003pk-FS; Fri, 25 Feb 2022 08:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278824.476216; Fri, 25 Feb 2022 08:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNW5v-0003nk-CL; Fri, 25 Feb 2022 08:36:55 +0000
Received: by outflank-mailman (input) for mailman id 278824;
 Fri, 25 Feb 2022 08:36:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d3I2=TI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nNW5t-0003ne-T7
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:36:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 148bcace-9616-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 09:36:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B1EC212BF;
 Fri, 25 Feb 2022 08:36:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B0CB13B65;
 Fri, 25 Feb 2022 08:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N1FSASSVGGKoPgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Feb 2022 08:36:52 +0000
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
X-Inumbo-ID: 148bcace-9616-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645778212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kbee77WNyNUjc5zQbhgYW4K+2VGvOEyP/lNyCctJvZ8=;
	b=t+wfr+SjreykOXdOhZ/8yIpwiZGnMyJ/Ao7WZu5rYvEMyybCp11tAx+gFh6igdNReRzZGr
	JXJ0ZZQ8ztqsSRonbPZq8U4CSZ79npZahqynhZwJzdB5m+Kkg8VrRA0uNbz3kxvEW+B69S
	pBW8l4cQQ6/HdGMm5T4UYV5krxnqwDw=
Message-ID: <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
Date: Fri, 25 Feb 2022 09:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cOSq3T0ls92hfBkNd1U9gNz0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cOSq3T0ls92hfBkNd1U9gNz0
Content-Type: multipart/mixed; boundary="------------CPqfh8fPfecjEIYNluIGKQUw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
In-Reply-To: <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>

--------------CPqfh8fPfecjEIYNluIGKQUw
Content-Type: multipart/mixed; boundary="------------4IqAYmWzR6QhgnrSvdMat2C6"

--------------4IqAYmWzR6QhgnrSvdMat2C6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjIgMTc6MTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wMi4yMDIy
IDExOjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gveDg2L21t
L21tLWxvY2tzLmgNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tbS1sb2Nrcy5oDQo+PiBA
QCAtNDIsNyArNDIsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbW1fbG9ja19pbml0KG1tX2xv
Y2tfdCAqbCkNCj4+ICAgDQo+PiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBtbV9sb2NrZWRfYnlf
bWUoY29uc3QgbW1fbG9ja190ICpsKQ0KPj4gICB7DQo+PiAtICAgIHJldHVybiAobC0+bG9j
ay5yZWN1cnNlX2NwdSA9PSBjdXJyZW50LT5wcm9jZXNzb3IpOw0KPj4gKyAgICByZXR1cm4g
KGwtPmxvY2suZGF0YS5jcHUgPT0gY3VycmVudC0+cHJvY2Vzc29yKTsNCj4+ICAgfQ0KPiAN
Cj4gSSBzZWUgYSBmYWlyIHJpc2sgd2l0aCB0aGlzOiBCZWhhdmlvciB3aWxsIG5vdyBkaWZm
ZXIgYmV0d2VlbiBkZWJ1ZyBhbmQNCj4gbm9uLWRlYnVnIGJ1aWxkcy4gRS5nLiBhIGxpdmVs
b2NrIGJlY2F1c2Ugb2YgdHJ5aW5nIHRvIGFjcXVpcmUgdGhlIHNhbWUNCj4gbG9jayBhZ2Fp
biB3b3VsZCBub3QgYmUgbm90aWNlZCBpbiBhIGRlYnVnIGJ1aWxkIGlmIHRoZSBhY3F1aXJl
IGlzDQo+IGNvbmRpdGlvbmFsIHVwb24gdGhpcyBmdW5jdGlvbidzIHJldHVybiB2YWx1ZS4g
SSB0aGluayB0aGlzIGlzIHRoZSBtYWluDQo+IHJlYXNvbiBiZWhpbmQgaGF2aW5nIHR3byBz
ZXBhcmF0ZSBmaWVsZCwgZGVzcGl0ZSB0aGUgYXBwYXJlbnQgcmVkdW5kYW5jeS4NCg0KWW91
IGFyZSBhd2FyZSB0aGF0IG1tX2xvY2tlZF9ieV9tZSgpIGlzIHVzZWQgZm9yIHJlY3Vyc2l2
ZSBzcGlubG9ja3MNCm9ubHk/DQoNCj4gDQo+IE5ldmVydGhlbGVzcyBhIGZldyBtb3JlIGNv
bW1lbnRzIGluIGNhc2UgSSdtIG1pc3Npbmcgc29tZXRoaW5nLg0KPiANCj4+IEBAIC04MSwx
OSArNzksMTkgQEAgc3RhdGljIHZvaWQgY2hlY2tfYmFycmllcihzcGlubG9ja190ICpsb2Nr
KQ0KPj4gICAgICAgICogSG93ZXZlciwgaWYgd2Ugc3BpbiBvbiBhbiBJUlEtdW5zYWZlIGxv
Y2sgd2l0aCBJUlFzIGRpc2FibGVkIHRoZW4gdGhhdA0KPj4gICAgICAgICogaXMgY2xlYXJs
eSB3cm9uZywgZm9yIHRoZSBzYW1lIHJlYXNvbiBvdXRsaW5lZCBpbiBjaGVja19sb2NrKCkg
YWJvdmUuDQo+PiAgICAgICAgKi8NCj4+IC0gICAgQlVHX09OKCFsb2NhbF9pcnFfaXNfZW5h
YmxlZCgpICYmICFsb2NrLT5kZWJ1Zy5pcnFfc2FmZSk7DQo+PiArICAgIEJVR19PTighbG9j
YWxfaXJxX2lzX2VuYWJsZWQoKSAmJiAhbG9jay0+ZGF0YS5pcnFfc2FmZSk7DQo+PiAgIH0N
Cj4+ICAgDQo+PiAgIHN0YXRpYyB2b2lkIGdvdF9sb2NrKHNwaW5sb2NrX3QgKmxvY2spDQo+
PiAgIHsNCj4+IC0gICAgbG9jay0+ZGVidWcuY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOw0K
Pj4gKyAgICBsb2NrLT5kYXRhLmNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsNCj4gDQo+IFRo
aXMgYXNzaWdubWVudCBicmVha3MgLi4uDQo+IA0KPj4gQEAgLTIzMCw5ICsyMjgsOSBAQCBp
bnQgX3NwaW5faXNfbG9ja2VkKHNwaW5sb2NrX3QgKmxvY2spDQo+PiAgICAgICAgKiAiZmFs
c2UiIGhlcmUsIG1ha2luZyB0aGlzIGZ1bmN0aW9uIHN1aXRhYmxlIG9ubHkgZm9yIHVzZSBp
bg0KPj4gICAgICAgICogQVNTRVJUKClzIGFuZCBhbGlrZS4NCj4+ICAgICAgICAqLw0KPj4g
LSAgICByZXR1cm4gbG9jay0+cmVjdXJzZV9jcHUgPT0gU1BJTkxPQ0tfTk9fQ1BVDQo+PiAr
ICAgIHJldHVybiBsb2NrLT5kYXRhLmNwdSA9PSBTUElOTE9DS19OT19DUFUNCj4gDQo+IC4u
LiB0aGUgdXNlIG9mIHRoaXMgZmllbGQgdG8gZGlzdGluZ3Vpc2ggcmVjdXJzaXZlbHkgbG9j
a2VkIGxvY2tzDQo+IGZyb20gInNpbXBsZSIgb25lcy4gQXQgdGhlIHZlcnkgbGVhc3QgdGhl
IGNvbW1lbnQgbmVlZHMgdXBkYXRpbmcsDQo+IGJ1dCAuLi4NCj4gDQo+PiAgICAgICAgICAg
ICAgPyBsb2NrLT50aWNrZXRzLmhlYWQgIT0gbG9jay0+dGlja2V0cy50YWlsDQo+IA0KPiAu
Li4gaW4gaG93IGZhciB0aGlzIGlzIHN0aWxsIGEgc2Vuc2libGUgY2hlY2sgaW4gZGVidWcg
YnVpbGRzIGlzDQo+IGFsc28gcXVlc3Rpb25hYmxlLiBUaGUgZWZmZWN0IGhlcmUgY2VydGFp
bmx5IGFsc28gZGVzZXJ2ZXMgcG9pbnRpbmcNCj4gb3V0IGluIHRoZSBkZXNjcmlwdGlvbi4N
Cg0KT2theSwgd2lsbCBhZGQgc29tZXRoaW5nLg0KDQo+IA0KPj4gLSAgICAgICAgICAgOiBs
b2NrLT5yZWN1cnNlX2NwdSA9PSBzbXBfcHJvY2Vzc29yX2lkKCk7DQo+PiArICAgICAgICAg
ICA6IGxvY2stPmRhdGEuY3B1ID09IHNtcF9wcm9jZXNzb3JfaWQoKTsNCj4+ICAgfQ0KPj4g
ICANCj4+ICAgaW50IF9zcGluX3RyeWxvY2soc3BpbmxvY2tfdCAqbG9jaykNCj4+IEBAIC0y
OTYsMjIgKzI5NCwyNCBAQCBpbnQgX3NwaW5fdHJ5bG9ja19yZWN1cnNpdmUoc3BpbmxvY2tf
dCAqbG9jaykNCj4+ICAgew0KPj4gICAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9j
ZXNzb3JfaWQoKTsNCj4+ICAgDQo+PiAtICAgIC8qIERvbid0IGFsbG93IG92ZXJmbG93IG9m
IHJlY3Vyc2VfY3B1IGZpZWxkLiAqLw0KPj4gKyAgICAvKiBEb24ndCBhbGxvdyBvdmVyZmxv
dyBvZiBjcHUgZmllbGQuICovDQo+PiAgICAgICBCVUlMRF9CVUdfT04oTlJfQ1BVUyA+IFNQ
SU5MT0NLX05PX0NQVSk7DQo+PiAgICAgICBCVUlMRF9CVUdfT04oU1BJTkxPQ0tfUkVDVVJT
RV9CSVRTIDwgMyk7DQo+PiAgIA0KPj4gICAgICAgY2hlY2tfbG9jayhsb2NrLCB0cnVlKTsN
Cj4+ICAgDQo+PiAtICAgIGlmICggbGlrZWx5KGxvY2stPnJlY3Vyc2VfY3B1ICE9IGNwdSkg
KQ0KPj4gKyAgICBpZiAoIGxpa2VseShsb2NrLT5kYXRhLmNwdSAhPSBjcHUpICkNCj4+ICAg
ICAgIHsNCj4+ICAgICAgICAgICBpZiAoICFzcGluX3RyeWxvY2sobG9jaykgKQ0KPj4gICAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4+IC0gICAgICAgIGxvY2stPnJlY3Vyc2VfY3B1ID0g
Y3B1Ow0KPj4gKyNpZm5kZWYgQ09ORklHX0RFQlVHX0xPQ0tTDQo+PiArICAgICAgICBsb2Nr
LT5kYXRhLmNwdSA9IGNwdTsNCj4+ICsjZW5kaWYNCj4gDQo+IE1heWJlIHdvcnRoIGFuIEFT
U0VSVCgpIGluIHRoZSAjZWxzZSBjYXNlIChhbmQgZWxzZXdoZXJlIGFzIGFwcGxpY2FibGUp
Pw0KDQpPa2F5Lg0KDQo+IA0KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgN
Cj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oDQo+PiBAQCAtNiwyNiArNiwz
NCBAQA0KPj4gICAjaW5jbHVkZSA8YXNtL3NwaW5sb2NrLmg+DQo+PiAgICNpbmNsdWRlIDxh
c20vdHlwZXMuaD4NCj4+ICAgDQo+PiAtI2RlZmluZSBTUElOTE9DS19DUFVfQklUUyAgMTIN
Cj4+ICsjZGVmaW5lIFNQSU5MT0NLX0NQVV9CSVRTICAgICAgMTINCj4+ICsjZGVmaW5lIFNQ
SU5MT0NLX05PX0NQVSAgICAgICAgKCgxdSA8PCBTUElOTE9DS19DUFVfQklUUykgLSAxKQ0K
Pj4gKyNkZWZpbmUgU1BJTkxPQ0tfUkVDVVJTRV9CSVRTICAoMTYgLSBTUElOTE9DS19DUFVf
QklUUykNCj4+ICsjZGVmaW5lIFNQSU5MT0NLX01BWF9SRUNVUlNFICAgKCgxdSA8PCBTUElO
TE9DS19SRUNVUlNFX0JJVFMpIC0gMSkNCj4+ICsjZGVmaW5lIFNQSU5MT0NLX1BBRF9CSVRT
ICAgICAgKDMwIC0gU1BJTkxPQ0tfQ1BVX0JJVFMgLSBTUElOTE9DS19SRUNVUlNFX0JJVFMp
DQo+PiAgIA0KPj4gLSNpZmRlZiBDT05GSUdfREVCVUdfTE9DS1MNCj4+IC11bmlvbiBsb2Nr
X2RlYnVnIHsNCj4+IC0gICAgdWludDE2X3QgdmFsOw0KPj4gLSNkZWZpbmUgTE9DS19ERUJV
R19JTklUVkFMIDB4ZmZmZg0KPj4gK3R5cGVkZWYgdW5pb24gew0KPj4gKyAgICB1MzIgdmFs
Ow0KPj4gICAgICAgc3RydWN0IHsNCj4+IC0gICAgICAgIHVpbnQxNl90IGNwdTpTUElOTE9D
S19DUFVfQklUUzsNCj4+IC0jZGVmaW5lIExPQ0tfREVCVUdfUEFEX0JJVFMgKDE0IC0gU1BJ
TkxPQ0tfQ1BVX0JJVFMpDQo+PiAtICAgICAgICB1aW50MTZfdCA6TE9DS19ERUJVR19QQURf
QklUUzsNCj4+ICsgICAgICAgIHUzMiBjcHU6U1BJTkxPQ0tfQ1BVX0JJVFM7DQo+PiArICAg
ICAgICB1MzIgcmVjdXJzZV9jbnQ6U1BJTkxPQ0tfUkVDVVJTRV9CSVRTOw0KPj4gKyAgICAg
ICAgdTMyIHBhZDpTUElOTE9DS19QQURfQklUUzsNCj4+ICsjaWZkZWYgQ09ORklHX0RFQlVH
X0xPQ0tTDQo+PiAgICAgICAgICAgYm9vbCBpcnFfc2FmZToxOw0KPj4gICAgICAgICAgIGJv
b2wgdW5zZWVuOjE7DQo+PiArI2RlZmluZSBTUElOTE9DS19ERUJVR19JTklUVkFMIDB4YzAw
MDAwMDANCj4+ICsjZWxzZQ0KPj4gKyAgICAgICAgdTMyIGRlYnVnX3BhZDoyOw0KPiANCj4g
UHJpb3IgdG8geW91ciBjaGFuZ2Ugd2UgaGFkIHR3byB3ZWxsLWZvcm1lZCB1aW50MTZfdC4g
WW91IHJlcGxhY2UgdGhlbSBieQ0KPiBmaXZlIG5ldyBpbnN0YW5jZXMgb2YgdGhlIGJlaW5n
LXBoYXNlZC1vdXQgdTMyPw0KDQpPaCwgc29ycnkuIFdpbGwgY2hhbmdlIHRvIHVpbnQzMl90
Lg0KDQo+IEFsc28gLSBkbyB0aGUgdHdvIHBhZGRpbmcgZmllbGRzIHJlYWxseSBuZWVkIG5h
bWVzPw0KDQpJJ20gZmluZSB0byBkcm9wIHRoZW0uDQoNCg0KSnVlcmdlbg0KDQo=
--------------4IqAYmWzR6QhgnrSvdMat2C6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4IqAYmWzR6QhgnrSvdMat2C6--

--------------CPqfh8fPfecjEIYNluIGKQUw--

--------------cOSq3T0ls92hfBkNd1U9gNz0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIYlSMFAwAAAAAACgkQsN6d1ii/Ey8D
8Af7BlkJY/YSRhA/rtn1HNE1/pzdQopBKl4cBwBHICOQ7TuPQox+ulLSPALr16ZprispmzVTmbHz
iIQwIH3mrYxzyqTCKhlzkhrYKP0EtjfOahufDqJhq0Lvc9OlrSy1hN0bIFJ0pP5F5nXDzWgTRx/7
82DsZ4JPGk7OaNyLW+h/LbT2hzTydAjV491qeGaPNtrfc2BLQV/kPDpYnSjiDpvU9SfvT1MLQs1l
J58fk2y80XEkdAkyTPoNhTbd0Inhp2csMnjti9kNLypwewVEju/1tEEbOpt9yZ9mzmmVp8pJMFBl
RtjUOM7fXVd9Cz+ZstWOo0kIzWCe+2QESnG0weRMgA==
=jeh1
-----END PGP SIGNATURE-----

--------------cOSq3T0ls92hfBkNd1U9gNz0--

