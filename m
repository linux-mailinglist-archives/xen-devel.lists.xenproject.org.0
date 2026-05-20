Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OjyNiOIDWquygUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:08:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F258B5C8
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 12:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313791.1583859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPdqd-00068l-47; Wed, 20 May 2026 10:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313791.1583859; Wed, 20 May 2026 10:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPdqd-00067K-0q; Wed, 20 May 2026 10:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1313791;
 Wed, 20 May 2026 10:08:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e44db6d97000f373@swg.vates.tech>)
 id 1wPdqa-000678-KI
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 10:08:16 +0000
Received: from mx.expurgate.net (helo=mx.expurgate.net)
 by mx.expurgate.net with esmtp id 1wPdqa-00FL01-01
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:08:16 +0200
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPdqZ-00FvRT-O3
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:08:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e44db6d97000f373@swg.vates.tech>)
 id 6a0d8808-e002-0a2a0a5209dd-0a2a4506c6ea-36
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:08:15 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e44db6d97000f373@swg.vates.tech>)
 id 6a0d880e-7371-0a2a45060019-b9ff1c22b4e1-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:08:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e44db6d97000f373.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 10:08:11 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0163C8671A;
 Wed, 20 May 2026 12:08:10 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=i1ThJMD2BLyIekFWi1EDNcZCQxbwnEJ7ym0A9HVsYKk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=MSpqQW0jXggX33Nf+XfKYDMFhGV/1tvGIbo4Q7a874akgM6faaVdtOaUgynekdW/ZFG8HlIyt
 01QIVafoL+GE4xgMpZ2sF1awfr1rXxVW3ZPsvlAPWR4jhD1uBsvGSQmGYHUcDwFqrzFmuLuQ4zD
 ZuujWdc/mQMY3pmQjatDGRpPg5BjCk/lAkntQ57Sr15uRAUn1MUgwwrIIDKELz9Y1Pga3eh9mZS
 4904MbBJ2oLTD28QrZJgluPv+YSg7UHzqYZddV3/8ggyOCzTwfLFjBYUbQLla6BIwOp5AGHqO/b
 uN5aqfbMAgj+r41Q4+SeAv9tDmjVVh84zdCUQkw5NoBA==
X-Zone-Loop: dbb4011142d79ab59d54812e1c9f52763cfa04c27d0b
x-campaign-type: default
x-transaction-id: d42fba42-d897-4a99-8059-d3523256b2df
x-swg-uid: 01-30b67fce-77b0-4a9a-b14f-f7d4f5b71270
X-Mailer: Sweego
Message-ID:
 <1779271691.8631fc262581453bbf619ec5b2062170.19e44db6d97000f373@vates.tech>
x-swg-bid: 1779271691.8631fc262581453bbf619ec5b2062170.19e44db6d97000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 12:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
 <ag0jtx6yNpPI3ZTD@kraken>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <ag0jtx6yNpPI3ZTD@kraken>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VdzMO0gutUTPpb1isbd0dYZO"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779271691116
X-purgate-ID: tlsNG-16d1c6/1779271695-8ED88D75-3A3E0D68/0/0
X-purgate-type: clean
X-purgate-size: 14057
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:url,vates.tech:email,vates.tech:mid,vates.tech:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 525F258B5C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VdzMO0gutUTPpb1isbd0dYZO
Content-Type: multipart/mixed; boundary="------------N30O4PzHj1bWEgezF9Q86UDN";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <fab3f871-c29e-4049-9cb9-818941c72565@vates.tech>
Subject: Re: [PATCH 2/5] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
 <ag0jtx6yNpPI3ZTD@kraken>
In-Reply-To: <ag0jtx6yNpPI3ZTD@kraken>

--------------N30O4PzHj1bWEgezF9Q86UDN
Content-Type: multipart/mixed; boundary="------------Ax4fG7B1C6CHvK1AyveBCiOu"

--------------Ax4fG7B1C6CHvK1AyveBCiOu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDUvMjAyNiDDoCAwNTowMywgZG11a2hpbkBmb3JkLmNvbSBhIMOpY3JpdMKgOg0K
PiBPbiBNb24sIE1heSAxOCwgMjAyNiBhdCAwNToyMToyNlBNICswMjAwLCBUZWRkeSBBc3Rp
ZSB3cm90ZToNCj4+IFVzZSBhIGRlZGljYXRlZCBwY2lfc2JkZl90IHN0cnVjdCB0aGF0IHdl
IHVwZGF0ZSBpbnN0ZWFkIG9mIHJlY3JlYXRpbmcNCj4+IG9uZSBlYWNoIHRpbWUgd2UgbmVl
ZCBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVA
dmF0ZXMudGVjaD4NCj4+IC0tLQ0KPj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
ZG1hci5jIHwgNDIgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMNCj4+IGluZGV4IDJhNzU2ODMxYTYuLmMz
NmY0YmJkN2IgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
ZG1hci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jDQo+
PiBAQCAtMzEwLDcgKzMxMCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFjcGlfcGFyc2VfZGV2
X3Njb3BlKA0KPj4gICB7DQo+PiAgICAgICBzdHJ1Y3QgYWNwaV9pb2FwaWNfdW5pdCAqYWNw
aV9pb2FwaWNfdW5pdDsNCj4+ICAgICAgIGNvbnN0IHN0cnVjdCBhY3BpX2RtYXJfZGV2aWNl
X3Njb3BlICphY3BpX3Njb3BlOw0KPj4gLSAgICB1MTYgYnVzLCBzdWJfYnVzLCBzZWNfYnVz
Ow0KPj4gKyAgICB1MTYgc3ViX2J1cywgc2VjX2J1czsNCj4+ICAgICAgIGNvbnN0IHN0cnVj
dCBhY3BpX2RtYXJfcGNpX3BhdGggKnBhdGg7DQo+PiAgICAgICBzdHJ1Y3QgYWNwaV9kcmhk
X3VuaXQgKmRyaGQgPSB0eXBlID09IERNQVJfVFlQRSA/DQo+PiAgICAgICAgICAgY29udGFp
bmVyX29mKHNjb3BlLCBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQsIHNjb3BlKSA6IE5VTEw7DQo+
PiBAQCAtMzMyLDI5ICszMzIsMjYgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJzZV9k
ZXZfc2NvcGUoDQo+PiAgIA0KPj4gICAgICAgd2hpbGUgKCBzdGFydCA8IGVuZCApDQo+PiAg
ICAgICB7DQo+PiArICAgICAgICBwY2lfc2JkZl90IGRldl9zYmRmOw0KPj4gICAgICAgICAg
IGFjcGlfc2NvcGUgPSBzdGFydDsNCj4+ICAgICAgICAgICBwYXRoID0gKGNvbnN0IHZvaWQg
KikoYWNwaV9zY29wZSArIDEpOw0KPj4gICAgICAgICAgIGRlcHRoID0gKGFjcGlfc2NvcGUt
Pmxlbmd0aCAtIHNpemVvZigqYWNwaV9zY29wZSkpIC8gc2l6ZW9mKCpwYXRoKTsNCj4+IC0g
ICAgICAgIGJ1cyA9IGFjcGlfc2NvcGUtPmJ1czsNCj4+ICsgICAgICAgIGRldl9zYmRmID0g
UENJX1NCREYoc2VnLCBhY3BpX3Njb3BlLT5idXMsIHBhdGgtPmRldiwgcGF0aC0+Zm4pOw0K
PiANCj4gYGRldl9zYmRmYCBjYWxjdWxhdGlvbiBkZXBlbmRzIG9uIGBwYXRoYCB3aGljaCBp
cyB1cGRhdGVkIGluIGB3aGlsZSgpYCBsb29wDQo+IGJlbG93Lg0KPiANCg0KQWggeWVzIGlu
ZGVlZCwgZ29vZCBjYXRjaC4NCg0KRml4ZWQgbG9jYWxseS4NCg0KPj4gICANCj4+ICAgICAg
ICAgICB3aGlsZSAoIC0tZGVwdGggPiAwICkNCj4+ICAgICAgICAgICB7DQo+PiAtICAgICAg
ICAgICAgYnVzID0gcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoc2VnLCBidXMsIHBhdGgtPmRl
diwgcGF0aC0+Zm4pLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBD
SV9TRUNPTkRBUllfQlVTKTsNCj4+ICsgICAgICAgICAgICBkZXZfc2JkZi5idXMgPSBwY2lf
Y29uZl9yZWFkOChkZXZfc2JkZiwgUENJX1NFQ09OREFSWV9CVVMpOw0KPj4gICAgICAgICAg
ICAgICBwYXRoKys7DQo+PiAgICAgICAgICAgfQ0KPj4gICANCj4+ICAgICAgICAgICBzd2l0
Y2ggKCBhY3BpX3Njb3BlLT5lbnRyeV90eXBlICkNCj4+ICAgICAgICAgICB7DQo+PiAgICAg
ICAgICAgY2FzZSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9CUklER0U6DQo+PiAtICAgICAgICAg
ICAgc2VjX2J1cyA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKHNlZywgYnVzLCBwYXRoLT5k
ZXYsIHBhdGgtPmZuKSwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUENJX1NFQ09OREFSWV9CVVMpOw0KPj4gLSAgICAgICAgICAgIHN1Yl9idXMgPSBwY2lf
Y29uZl9yZWFkOChQQ0lfU0JERihzZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRoLT5mbiksDQo+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9TVUJPUkRJTkFU
RV9CVVMpOw0KPj4gKyAgICAgICAgICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChkZXZf
c2JkZiwgUENJX1NFQ09OREFSWV9CVVMpOw0KPj4gKyAgICAgICAgICAgIHN1Yl9idXMgPSBw
Y2lfY29uZl9yZWFkOChkZXZfc2JkZiwgUENJX1NVQk9SRElOQVRFX0JVUyk7DQo+PiAgICAg
ICAgICAgICAgIGlmICggaW9tbXVfdmVyYm9zZSApDQo+PiAgICAgICAgICAgICAgICAgICBw
cmludGsoVlREUFJFRklYICIgYnJpZGdlOiAlcHAgc3RhcnQ9JXggc2VjPSV4IHN1Yj0leFxu
IiwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICZQQ0lfU0JERihzZWcsIGJ1cywgcGF0
aC0+ZGV2LCBwYXRoLT5mbiksDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICBhY3BpX3Nj
b3BlLT5idXMsIHNlY19idXMsIHN1Yl9idXMpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgJmRldl9zYmRmLCBhY3BpX3Njb3BlLT5idXMsIHNlY19idXMsIHN1Yl9idXMpOw0KPj4g
ICANCj4+ICAgICAgICAgICAgICAgZG1hcl9zY29wZV9hZGRfYnVzZXMoc2NvcGUsIHNlY19i
dXMsIHN1Yl9idXMpOw0KPj4gICAgICAgICAgICAgICBnZnhfb25seSA9IGZhbHNlOw0KPj4g
QEAgLTM2Miw4ICszNTksNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2Rldl9z
Y29wZSgNCj4+ICAgDQo+PiAgICAgICAgICAgY2FzZSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9I
UEVUOg0KPj4gICAgICAgICAgICAgICBpZiAoIGlvbW11X3ZlcmJvc2UgKQ0KPj4gLSAgICAg
ICAgICAgICAgICBwcmludGsoVlREUFJFRklYICIgTVNJIEhQRVQ6ICVwcFxuIiwNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICZQQ0lfU0JERihzZWcsIGJ1cywgcGF0aC0+ZGV2LCBw
YXRoLT5mbikpOw0KPj4gKyAgICAgICAgICAgICAgICBwcmludGsoVlREUFJFRklYICIgTVNJ
IEhQRVQ6ICVwcFxuIiwgJmRldl9zYmRmKTsNCj4+ICAgDQo+PiAgICAgICAgICAgICAgIGlm
ICggZHJoZCApDQo+PiAgICAgICAgICAgICAgIHsNCj4+IEBAIC0zNzQsOSArMzcwLDcgQEAg
c3RhdGljIGludCBfX2luaXQgYWNwaV9wYXJzZV9kZXZfc2NvcGUoDQo+PiAgICAgICAgICAg
ICAgICAgICBpZiAoICFhY3BpX2hwZXRfdW5pdCApDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBvdXQ7DQo+PiAgICAgICAgICAgICAgICAgICBhY3BpX2hwZXRfdW5pdC0+aWQg
PSBhY3BpX3Njb3BlLT5lbnVtZXJhdGlvbl9pZDsNCj4+IC0gICAgICAgICAgICAgICAgYWNw
aV9ocGV0X3VuaXQtPmJ1cyA9IGJ1czsNCj4+IC0gICAgICAgICAgICAgICAgYWNwaV9ocGV0
X3VuaXQtPmRldiA9IHBhdGgtPmRldjsNCj4+IC0gICAgICAgICAgICAgICAgYWNwaV9ocGV0
X3VuaXQtPmZ1bmMgPSBwYXRoLT5mbjsNCj4+ICsgICAgICAgICAgICAgICAgYWNwaV9ocGV0
X3VuaXQtPmJkZiA9IGRldl9zYmRmLmJkZjsNCj4+ICAgICAgICAgICAgICAgICAgIGxpc3Rf
YWRkKCZhY3BpX2hwZXRfdW5pdC0+bGlzdCwgJmRyaGQtPmhwZXRfbGlzdCk7DQo+PiAgIA0K
Pj4gICAgICAgICAgICAgICAgICAgZ2Z4X29ubHkgPSBmYWxzZTsNCj4+IEBAIC0zODYsMTYg
KzM4MCwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2Rldl9zY29wZSgNCj4+
ICAgDQo+PiAgICAgICAgICAgY2FzZSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9FTkRQT0lOVDoN
Cj4+ICAgICAgICAgICAgICAgaWYgKCBpb21tdV92ZXJib3NlICkNCj4+IC0gICAgICAgICAg
ICAgICAgcHJpbnRrKFZURFBSRUZJWCAiIGVuZHBvaW50OiAlcHBcbiIsDQo+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAmUENJX1NCREYoc2VnLCBidXMsIHBhdGgtPmRldiwgcGF0aC0+
Zm4pKTsNCj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFZURFBSRUZJWCAiIGVuZHBvaW50
OiAlcHBcbiIsICZkZXZfc2JkZik7DQo+PiAgIA0KPj4gLSAgICAgICAgICAgIGlmICggZHJo
ZCAmJiBwY2lfZGV2aWNlX2RldGVjdChzZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRoLT5mbikg
KQ0KPj4gKyAgICAgICAgICAgIGlmICggZHJoZCAmJiBwY2lfZGV2aWNlX2RldGVjdChzZWcs
IGRldl9zYmRmLmJ1cywgZGV2X3NiZGYuZGV2LCBkZXZfc2JkZi5mbikgKQ0KPiANCj4gTG9v
a3MgbGlrZSBgcGNpX2RldmljZV9kZXRlY3QoKWAgYWxzbyBuZWVkcyBzb21lIHJlZmFjdG9y
aW5nLi4uDQo+IChQcm9iYWJseSBvdXQgb2Ygc2NvcGUgZm9yIHRoaXMgc2VyaWVzLCB0aG91
Z2gpDQo+IA0KPj4gICAgICAgICAgICAgICB7DQo+PiAtICAgICAgICAgICAgICAgIGlmICgg
cGNpX2NvbmZfcmVhZDgoUENJX1NCREYoc2VnLCBidXMsIHBhdGgtPmRldiwgcGF0aC0+Zm4p
LA0KPj4gKyAgICAgICAgICAgICAgICBpZiAoIHBjaV9jb25mX3JlYWQ4KGRldl9zYmRmLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfQ0xBU1NfREVW
SUNFICsgMSkgIT0gMHgwMw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAvKiBQQ0lfQkFTRV9DTEFTU19ESVNQTEFZICovICkNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICBnZnhfb25seSA9IGZhbHNlOw0KPj4gLSAgICAgICAgICAgICAgICBlbHNlIGlm
ICggIXNlZyAmJiAhYnVzICYmIHBhdGgtPmRldiA9PSAyICYmICFwYXRoLT5mbiApDQo+PiAr
ICAgICAgICAgICAgICAgIGVsc2UgaWYgKCAhc2VnICYmICFkZXZfc2JkZi5idXMgJiYgcGF0
aC0+ZGV2ID09IDIgJiYgIXBhdGgtPmZuICkNCj4+ICAgICAgICAgICAgICAgICAgICAgICBp
Z2RfZHJoZF9hZGRyZXNzID0gZHJoZC0+YWRkcmVzczsNCj4+ICAgICAgICAgICAgICAgfQ0K
Pj4gICANCj4+IEBAIC00MDMsOCArMzk2LDcgQEAgc3RhdGljIGludCBfX2luaXQgYWNwaV9w
YXJzZV9kZXZfc2NvcGUoDQo+PiAgIA0KPj4gICAgICAgICAgIGNhc2UgQUNQSV9ETUFSX1ND
T1BFX1RZUEVfSU9BUElDOg0KPj4gICAgICAgICAgICAgICBpZiAoIGlvbW11X3ZlcmJvc2Ug
KQ0KPj4gLSAgICAgICAgICAgICAgICBwcmludGsoVlREUFJFRklYICIgSU9BUElDOiAlcHBc
biIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAmUENJX1NCREYoc2VnLCBidXMsIHBh
dGgtPmRldiwgcGF0aC0+Zm4pKTsNCj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFZURFBS
RUZJWCAiIElPQVBJQzogJXBwXG4iLCAmZGV2X3NiZGYpOw0KPj4gICANCj4+ICAgICAgICAg
ICAgICAgaWYgKCBkcmhkICkNCj4+ICAgICAgICAgICAgICAgew0KPj4gQEAgLTQxMyw5ICs0
MDUsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2Rldl9zY29wZSgNCj4+ICAg
ICAgICAgICAgICAgICAgIGlmICggIWFjcGlfaW9hcGljX3VuaXQgKQ0KPj4gICAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gICAgICAgICAgICAgICAgICAgYWNwaV9pb2Fw
aWNfdW5pdC0+YXBpY19pZCA9IGFjcGlfc2NvcGUtPmVudW1lcmF0aW9uX2lkOw0KPj4gLSAg
ICAgICAgICAgICAgICBhY3BpX2lvYXBpY191bml0LT5pb2FwaWMuYmRmLmJ1cyA9IGJ1czsN
Cj4+IC0gICAgICAgICAgICAgICAgYWNwaV9pb2FwaWNfdW5pdC0+aW9hcGljLmJkZi5kZXYg
PSBwYXRoLT5kZXY7DQo+PiAtICAgICAgICAgICAgICAgIGFjcGlfaW9hcGljX3VuaXQtPmlv
YXBpYy5iZGYuZnVuYyA9IHBhdGgtPmZuOw0KPj4gKyAgICAgICAgICAgICAgICBhY3BpX2lv
YXBpY191bml0LT5pb2FwaWMuaW5mbyA9IGRldl9zYmRmLmJkZjsNCj4+ICAgICAgICAgICAg
ICAgICAgIGxpc3RfYWRkKCZhY3BpX2lvYXBpY191bml0LT5saXN0LCAmZHJoZC0+aW9hcGlj
X2xpc3QpOw0KPj4gICANCj4+ICAgICAgICAgICAgICAgICAgIGdmeF9vbmx5ID0gZmFsc2U7
DQo+PiBAQCAtNDMxLDcgKzQyMSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGFjcGlfcGFyc2Vf
ZGV2X3Njb3BlKA0KPj4gICAgICAgICAgICAgICBnZnhfb25seSA9IGZhbHNlOw0KPj4gICAg
ICAgICAgICAgICBjb250aW51ZTsNCj4+ICAgICAgICAgICB9DQo+PiAtICAgICAgICBzY29w
ZS0+ZGV2aWNlc1tkaWR4KytdID0gUENJX0JERihidXMsIHBhdGgtPmRldiwgcGF0aC0+Zm4p
Ow0KPj4gKyAgICAgICAgc2NvcGUtPmRldmljZXNbZGlkeCsrXSA9IGRldl9zYmRmLmJkZjsN
Cj4+ICAgICAgICAgICBzdGFydCArPSBhY3BpX3Njb3BlLT5sZW5ndGg7DQo+PiAgICAgICB9
DQo+PiAgIA0KPj4gLS0gDQo+PiAyLjUyLjANCj4+DQo+Pg0KPj4NCj4+IC0tDQo+PiBUZWRk
eSBBc3RpZSB8IFZhdGVzIFhDUC1uZyBEZXZlbG9wZXINCj4+DQo+PiBYQ1AtbmcgJiBYZW4g
T3JjaGVzdHJhIC0gVmF0ZXMgc29sdXRpb25zDQo+Pg0KPj4gd2ViOiBodHRwczovL3ZhdGVz
LnRlY2gNCj4gDQoNClRlZGR5DQo=
--------------Ax4fG7B1C6CHvK1AyveBCiOu
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------Ax4fG7B1C6CHvK1AyveBCiOu--

--------------N30O4PzHj1bWEgezF9Q86UDN--

--------------VdzMO0gutUTPpb1isbd0dYZO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoNiAoFAwAAAAAACgkQZg+p0QLLz9AY
EQwAk2dZ8ELxednBp7+0Q/DwovhCqg9/fnh9ReqZLbp1n9Ozhw8ApUkoIQTaJhaiycjWh4AvfZce
6aUl+jXFECy6cxvz7UYK+K9cwefryRmUl77PiDS0csWavcQNNLLtisOH2aXtWXjT22CHSAC9FOg3
kerOcLicY3n0CbBZKs/XHagXzhyEnMUSCU/cuKbmYF3YptDRgopB4AuYPWvt2pAx/0ApaYtqF5Zb
2pWVWo3XuUmpPjeaMb0Z54gobuLvcAjQRayJHRYtUxE0TNq8fp4fM+YMAHVmMlzgq4uzZE5C+bUi
GTsrgKnNrALg3L1B6WtnUpJgNfCNUQG/f87MqO67UoTPg0Foi7+7rZUwuRhKmdztT2Pm5/7e5f+M
eK0/elPCEjhbxx1ynaD3F7E6DFGgwucrAJAxdYxK2lNvvauHHd9Gvn+b6kFzjL3iFayK6laybDbN
uIELHIzbP82RezIEYZ5kEx6/xYlFZsKo5Mnk9WBF4BlROUcB6eRxtql3Kgrb
=Ip3A
-----END PGP SIGNATURE-----

--------------VdzMO0gutUTPpb1isbd0dYZO--

