Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pzVSBomiT2rMlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 15:30:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B825731978
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 15:30:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=lkq1EWCN;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358179.1612430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whopc-000376-Ma; Thu, 09 Jul 2026 13:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358179.1612430; Thu, 09 Jul 2026 13:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whopc-00034q-Iy; Thu, 09 Jul 2026 13:30:24 +0000
Received: by outflank-mailman (input) for mailman id 1358179;
 Thu, 09 Jul 2026 13:30:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f47127053000edb5@swg.vates.tech>)
 id 1whopb-00034k-0u
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 13:30:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whopY-0030cB-Hk
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 15:30:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f47127053000edb5@swg.vates.tech>)
 id 6a4fa26a-2eae-0a2a0a5409dd-0a2a4509d7dc-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:30:20 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f47127053000edb5@swg.vates.tech>)
 id 6a4fa26c-b440-0a2a45090019-b9ff1c128e13-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 15:30:20 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f47127053000edb5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 09 Jul 2026 13:30:18 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id B027881F88;
 Thu,  9 Jul 2026 15:30:17 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=70u/FsFQGI3hA7sQLdw2qtBVlE4IV2OHgwOm2kOxi4E=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=lkq1EWCNTFkxiF+YoOL4prQUabQ5627jWn13Ha3U7ATf4OIcxN7VCVPL3Ggo3YsQ9mTy81LM0
 k5UayMWNEe+zOGXvmElM6N23UGheXhN5p+0pbbLZ0D7FtyOZ/M+tIJy/rftWeswmhL6aYcjJZwL
 WRH6a/ALnZn9YcO0KfvI1XUhn0AIGDfNq7fEklEO6jaFSpdZw/6uRlInGSh8DWjAhw5bVHNiF36
 0XS7WCBKHIia0nBHGby3vHJg5TY0Ukh6blhTsz9sKVdWJ7FKA1/z7+qazGjTjkezH7Y/FawxRe9
 Bcl64yC+sezhkDXXzVJ91/oRyCmU5yxWk8bbGwCslk0A==
X-Zone-Loop: 876bdd5e276569a4bcfca836e10048413ebbc4ed99eb
x-campaign-type: default
x-transaction-id: 0dad8b52-ba70-48f1-887a-81f72f4e03ef
x-swg-uid: 01-0e1c4e13-8fc6-4965-8177-b53e41effcac
X-Mailer: Sweego
Message-ID:
 <1783603818.8631fc262581453bbf619ec5b2062170.19f47127053000edb5@vates.tech>
x-swg-bid: 1783603818.8631fc262581453bbf619ec5b2062170.19f47127053000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 9 Jul 2026 15:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: report proper GIC version via
 XEN_DOMCTL_getdomaininfo
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------79euMm2uPCLAl6A4v9yzY7Kg"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783603817895
X-purgate-ID: tlsNG-bad1c0/1783603820-57F66A0B-4ED235C7/0/0
X-purgate-type: clean
X-purgate-size: 7950
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B825731978

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------79euMm2uPCLAl6A4v9yzY7Kg
Content-Type: multipart/mixed; boundary="------------r1Y109u4KXGT07tgG0OeU0S9";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Julian Vetter <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Message-ID: <750d24bc-aae4-4d44-b410-c7d1aa7a8fcb@vates.tech>
Subject: Re: [PATCH] xen/arm: report proper GIC version via
 XEN_DOMCTL_getdomaininfo
References: <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>
In-Reply-To: <1783603237.8631fc262581453bbf619ec5b2062170.19f470991a0000edb5@vates.tech>

--------------r1Y109u4KXGT07tgG0OeU0S9
Content-Type: multipart/mixed; boundary="------------9yKiFymgq0eGXhW1AyI74daB"

--------------9yKiFymgq0eGXhW1AyI74daB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDkvMDcvMjAyNiDDoCAxNToyMiwgSnVsaWFuIFZldHRlciBhIMOpY3JpdMKgOg0KPiBX
aGVuIGNyZWF0aW5nIGEgZG9tYWluIG9uIEFSTSwgYW5kIHBhc3NpbmcgWEVOX0RPTUNUTF9D
T05GSUdfR0lDX05BVElWRQ0KPiBmb3IgdGhlIGdpY192ZXJzaW9uIGZpZWxkIGluIHRoZSBz
dHJ1Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnLA0KPiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9j
b25maWcoKSByZXNvbHZlcyB0aGlzIHRvIHRoZSBhcHByb3JwaWF0ZSBHSUNfVjIgb3INCj4g
R0lDX1YzIHZlcnNpb24gdGhlIGRvbWFpbiBhY3R1YWxseSBoYXMsIGJhc2VkIG9uIHRoZSBo
b3N0J3MNCj4gZ2ljX2h3X3ZlcnNpb24oKS4gVGhhdCB2YWx1ZSBpcyBzdG9yZWQgaW4gdGhl
IGRvbWFpbiBhcw0KPiBkLT5hcmNoLnZnaWMudmVyc2lvbiwgYnV0IGNhbid0IGJlIHF1ZXJp
ZWQgdGhyb3VnaCBhbnkgb3RoZXIgZG9tY3RsDQo+IGxhdGVyLiBUb29sc3RhY2tzIHRoYXQg
Y3JlYXRlIGFuZCBidWlsZCBhIGRvbWFpbiBpbiB0aGUgc2FtZSBjYWxsDQo+IGFscmVhZHkg
aGF2ZSB0aGlzIGluZm8gZnJvbSB0aGUgY3JlYXRlZG9tYWluIHJlcGx5IGFuZCBuZXZlciBu
ZWVkIHRvIGFzaw0KPiBhZ2Fpbi4NCj4gDQo+IFRvb2xzdGFja3MgdGhhdCBjcmVhdGUgYSBk
b21haW4gYW5kIGJ1aWxkIGl0IGxhdGVyIGZyb20gYSBzZXBhcmF0ZQ0KPiBwcm9jZXNzIGRv
IG5lZWQgdG8gYXNrIGFnYWluLiBCdXQsIHRoZSBBUk0gaW1wbGVtZW50YXRpb24gb25seSBm
aWxscyBpbg0KPiBpbmZvLT5mbGFncyBhbmQgaW5mby0+Z3BhZGRyX2JpdHMuIGluZm8tPmFy
Y2hfY29uZmlnIGlzIGxlZnQgemVyb2VkLCBzbw0KPiBYRU5fRE9NQ1RMX2dldGRvbWFpbmlu
Zm8gYWx3YXlzIHJlcG9ydHMgZ2ljX3ZlcnNpb24gYXMNCj4gWEVOX0RPTUNUTF9DT05GSUdf
R0lDX05BVElWRSAoMCkgcmVnYXJkbGVzcyBvZiB3aGF0IHdhcyBhY3R1YWxseQ0KPiBjb25m
aWd1cmVkIGVhcmxpZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpYW4gVmV0dGVyIDxq
dWxpYW4udmV0dGVyQHZhdGVzLnRlY2g+DQo+IC0tLQ0KPiAgIHhlbi9hcmNoL2FybS9kb21j
dGwuYyB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWN0bC5jIGIveGVuL2FyY2gvYXJtL2Rv
bWN0bC5jDQo+IGluZGV4IDZjOWEzZjk5MjAuLmI3NmFmNTZmYWQgMTAwNjQ0DQo+IC0tLSBh
L3hlbi9hcmNoL2FybS9kb21jdGwuYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tY3RsLmMN
Cj4gQEAgLTI0LDYgKzI0LDggQEAgdm9pZCBhcmNoX2dldF9kb21haW5faW5mbyhjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgICBpbmZvLT5mbGFncyB8PSBYRU5fRE9NSU5GX2hh
cDsNCj4gICANCj4gICAgICAgaW5mby0+Z3BhZGRyX2JpdHMgPSBwMm1faXBhX2JpdHM7DQo+
ICsNCj4gKyAgICBpbmZvLT5hcmNoX2NvbmZpZy5naWNfdmVyc2lvbiA9IGQtPmFyY2gudmdp
Yy52ZXJzaW9uOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW50IGhhbmRsZV92dWFydF9p
bml0KHN0cnVjdCBkb21haW4gKmQsDQoNClRoYXQgcHJvYmFibHkgd2FudHMgYSBGaXhlczog
bm90ZSBnaXZlbiB0aGF0IHRoZSBjdXJyZW50IGJlaGF2aW9yIGlzIA0KaW5jb21wbGV0ZS4N
Cg0KQWx0aG91Z2gsIHRoZXJlIGFyZSBhIGZldyBpc3N1ZXMsIHRoZSBoeXBlcmNhbGwgcGFy
dCANCihhcmNoX2NvbmZpZy5naWNfdmVyc2lvbikgdXNlcw0KDQojZGVmaW5lIFhFTl9ET01D
VExfQ09ORklHX0dJQ19OQVRJVkUgICAgMA0KI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19H
SUNfVjIgICAgICAgIDENCiNkZWZpbmUgWEVOX0RPTUNUTF9DT05GSUdfR0lDX1YzICAgICAg
ICAyDQoNCndoaWxlIGludGVybmFsIEFSTSBjb2RlIChhcmNoLnZnaWMudmVyc2lvbikgdXNl
cw0KDQplbnVtIGdpY192ZXJzaW9uIHsNCiAgICAgR0lDX0lOVkFMSUQgPSAwLCAgICAvKiB0
aGUgZGVmYXVsdCB1bnRpbCBleHBsaWNpdGx5IHNldCB1cCAqLw0KICAgICBHSUNfVjIsDQog
ICAgIEdJQ19WMywNCn07DQoNClRoYXQgaGFwcGVucyB0byBtYXRjaCwgYnV0IHRoYXQgbWF5
IHdhbnQgdG8gYmUgYWRqdXN0ZWQgdG8gbm90IGJyZWFrIGluIA0KY2FzZSB0aGVzZSAyIHJl
cHJlc2VudGF0aW9ucyBkaXZlcmdlcy4NCg0KVGVkZHkNCg==
--------------9yKiFymgq0eGXhW1AyI74daB
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------9yKiFymgq0eGXhW1AyI74daB--

--------------r1Y109u4KXGT07tgG0OeU0S9--

--------------79euMm2uPCLAl6A4v9yzY7Kg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpPomkFAwAAAAAACgkQZg+p0QLLz9DW
XAv8DNJSV3JGa0lPlOB1/JOQW4MGuggnsVcdO3XDN71MMiY4YqFM5mFxvIv+P2AVgZisIWUN7jBS
3A8fx1YM1FwmM0Rw6h+A3GHqH8zZUghYI0ebjdcCpH1LP3ckeW5TzqvW7wUJMeuX+yhQSGdEEdFn
Mgzxg5uJ67suPEeDWy2GCncHH/zbjOyVYPdFUF1BOU6yRQrvKy2Gl4IdMF4DFzdn57ZeX/a3jk+K
QcBS2GQkkcQ3ZLRqNyNv1RPSksBBe8O/1+swgJGCkSl+WoxyeYa79lh9qDC/5KABQzqXRTm/4au+
3QQId6wEEJJ+ctf+dZrJC1ikGFEK1eMRXt6xV3+MXOksUkQQkfRe+VPm6YhCtJGaVAaqIK/hHreM
ruwurfhCxigdpjAM06ylugrLFy8ash8QD8J4mfY/RCwgwwV3zOTnew5tYEMKyRs6UvoUiYaag5x2
KHrgLgMQIQv0pGri2JiQe46CXKJekSJAAmnQERIsJLiwkOqsnIeDK747ihPq
=Yk7E
-----END PGP SIGNATURE-----

--------------79euMm2uPCLAl6A4v9yzY7Kg--

