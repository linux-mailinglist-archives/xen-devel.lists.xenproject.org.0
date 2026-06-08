Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4OJKLe7YJmoJlwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:59:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D5657BF1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 16:59:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b="gt/5OuGy";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1331916.1594573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbS3-0005Il-37; Mon, 08 Jun 2026 14:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331916.1594573; Mon, 08 Jun 2026 14:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbS2-0005Fz-Vx; Mon, 08 Jun 2026 14:59:42 +0000
Received: by outflank-mailman (input) for mailman id 1331916;
 Mon, 08 Jun 2026 14:59:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b@swg.vates.tech>)
 id 1wWbRz-00058X-Sv
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 14:59:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbRz-003H2Y-9L
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 16:59:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b@swg.vates.tech>)
 id 6a26d8d4-e002-0a2a0a5209dd-0a2a4508b9b8-20
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 16:59:39 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b@swg.vates.tech>)
 id 6a26d8da-63b5-0a2a45080019-b9ff1c12b3ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 16:59:38 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ea7bf10cd000701b.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 08 Jun 2026 14:59:37 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 84ECC870D2;
 Mon,  8 Jun 2026 16:59:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=CZ+i2CB0BdIOINPeiN4FrF9Mbfhow0AWNON35OBeS8s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gt/5OuGyM8t73fDKZ4QrMLuWZkelTzgoNmJaFmY3fClh6V4XZZs68/MffZqxG2pu5RcYRsWBU
 7Yzm6GYbHDkEQSb2APXf7Yqn1XR21Dcfz2nGHMBk8a7qw0FGGRVw6/q3MVa3Zj5V+2dSSnh6D74
 dz5QtaAC/sVifGmMoOTiFMsFjoa7h02tiRTCBkPEDYQdKll2XG0HcnB+yh6vFh6MRcwOw77Wj50
 o82uhZdhkLRo5lPrVxahEdfIND7MQ7vduIQc/D7SpXOpLKPUy9O7ORbyBTWc6EghZa1rmN/qa/x
 9ntyGlT4WT7As4dWtF4vuNnmW7TvALKG3QtyZw55B8fQ==
X-Zone-Loop: 878c393101ec056cad1e9d672cd1f6f8ff8d366c38df
x-campaign-type: default
x-transaction-id: 0c3b5937-d334-4915-ba71-b68c9ad3da77
x-swg-uid: 01-1d5da5e0-2a68-4cf8-ac00-53dac07ec797
X-Mailer: Sweego
Message-ID:
 <1780930777.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b@vates.tech>
x-swg-bid: 1780930777.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 8 Jun 2026 16:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/16] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-13-frediano.ziglio@cloud.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260603130603.776452-13-frediano.ziglio@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bJXDgwFSKVtzoJ7ihw0XiNJk"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1780930776712
X-purgate-ID: tlsNG-c1860d/1780930779-C5F80DB1-0547AA56/0/0
X-purgate-type: clean
X-purgate-size: 16781
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 123D5657BF1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bJXDgwFSKVtzoJ7ihw0XiNJk
Content-Type: multipart/mixed; boundary="------------koSVJldpvy6Ja05VsOuLnVMr";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Message-ID: <9ea186f5-0d12-4304-9b68-c486cee3e93e@vates.tech>
Subject: Re: [PATCH v4 12/16] xen: implement new foreign copy hypercall
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-13-frediano.ziglio@cloud.com>
In-Reply-To: <20260603130603.776452-13-frediano.ziglio@cloud.com>
Autocrypt-Gossip: addr=jgross@suse.com; keydata=
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

--------------koSVJldpvy6Ja05VsOuLnVMr
Content-Type: multipart/mixed; boundary="------------Yg8OixMvwm29bk2YHImaZMQV"

--------------Yg8OixMvwm29bk2YHImaZMQV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDMvMDYvMjAyNiDDoCAxNTowOCwgRnJlZGlhbm8gWmlnbGlvIGEgw6ljcml0wqA6DQo+
IEZyb206IEZyZWRpYW5vIFppZ2xpbyA8ZnJlZGlhbm8uemlnbGlvQGNpdHJpeC5jb20+DQo+
IA0KPiBBZGQgYSBzdWIgaHlwZXJjYWxsIHRvIF9fSFlQRVJWSVNPUl9tZW1vcnlfb3AgdG8g
YWxsb3cgdG8NCj4gcmVhZC93cml0ZSBtZW1vcnkgZnJvbS90byBhIGZvcmVpZ24gZG9tYWlu
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRnJlZGlhbm8gWmlnbGlvIDxmcmVkaWFuby56aWds
aW9AY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAg
IHwgMTMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIHhlbi9p
bmNsdWRlL3B1YmxpYy9tZW1vcnkuaCB8ICA0MCArKysrKysrKysrLQ0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMTcyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL21lbW9yeS5jIGIveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiBp
bmRleCAzNjcyYmRhMDI1Li42YTJkOWMzMTkwIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9u
L21lbW9yeS5jDQo+ICsrKyBiL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gQEAgLTE1NDUsNiAr
MTU0NSwxMzIgQEAgc3RhdGljIGludCBhY3F1aXJlX3Jlc291cmNlKA0KPiAgICAgICByZXR1
cm4gcmM7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIFRoZSAibm9pbmxpbmUiIHF1YWxp
ZmllciBhdm9pZCB0aGUgY29tcGlsZXIgdG8gY3JlYXRlIGEgbGFyZ2UgZnVuY3Rpb24NCj4g
KyAqIGNvbnN1bWluZyBxdWl0ZSBhIGxvdCBvZiBzdGFjay4NCj4gKyAqLw0KPiArc3RhdGlj
IGludCBub2lubGluZSBtZW1fZm9yZWlnbmNvcHkoDQo+ICsgICAgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh4ZW5fZm9yZWlnbmNvcHlfdCkgYXJnKQ0KPiArew0KPiArICAgIHN0cnVjdCBk
b21haW4gKmQsICpjb25zdCBjdXJyZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4gKyAgICB4ZW5f
Zm9yZWlnbmNvcHlfdCBjb3B5Ow0KPiArICAgIGludCByYywgZGlyZWN0aW9uOw0KPiArDQo+
ICsgICAgaWYgKCAhYXJjaF9hY3F1aXJlX3Jlc291cmNlX2NoZWNrKGN1cnJkKSApDQo+ICsg
ICAgICAgIHJldHVybiAtRUFDQ0VTOw0KPiArDQo+ICsgICAgaWYgKCBjb3B5X2Zyb21fZ3Vl
c3QoJmNvcHksIGFyZywgMSkgKQ0KPiArICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gKw0K
PiArICAgIGlmICggY29weS5mbGFncyAmIH4xdSApDQo+ICsgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPiArDQo+ICsgICAgZGlyZWN0aW9uID0gY29weS5mbGFncyAmIFhFTk1FTV9mb3Jl
aWduY29weV9kaXJlY3Rpb247DQo+ICsNCj4gKyAgICBpZiAoIGNvcHkubnJfZnJhbWVzID09
IDAgKQ0KPiArICAgICAgICByZXR1cm4gMDsNCj4gKw0KPiArICAgIHJjID0gcmN1X2xvY2tf
cmVtb3RlX2RvbWFpbl9ieV9pZChjb3B5LmRvbWlkLCAmZCk7DQo+ICsgICAgaWYgKCByYyAp
DQo+ICsgICAgICAgIHJldHVybiByYzsNCj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogQ2hl
Y2sgd2UgYXJlIGFsbG93ZWQgdG8gbWFwIGFuZCBhY2Nlc3MgdGhlc2UgZm9yZWlnbiBwYWdl
cy4NCj4gKyAgICAgKi8NCj4gKyAgICByYyA9IHhzbV9tYXBfZ21mbl9mb3JlaWduKFhTTV9U
QVJHRVQsIGN1cnJkLCBkKTsNCj4gKyAgICBpZiAoIHJjICkNCj4gKyAgICAgICAgZ290byBv
dXQ7DQo+ICsNCj4gKyAgICBkbyB7DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIEFy
Yml0cmFyeSBzaXplLiAgTm90IHRvbyBtdWNoIHN0YWNrIHNwYWNlLCBhbmQgYSByZWFzb25h
YmxlIHN0cmlkZQ0KPiArICAgICAgICAgKiBmb3IgY29udGludWF0aW9uIGNoZWNrcy4NCj4g
KyAgICAgICAgICovDQo+ICsgICAgICAgIHhlbl9wZm5fdCBnZm5fbGlzdFszMl07DQo+ICsg
ICAgICAgIHVuc2lnbmVkIGludCB0b2RvID0gTUlOKEFSUkFZX1NJWkUoZ2ZuX2xpc3QpLCBj
b3B5Lm5yX2ZyYW1lcyk7DQo+ICsNCj4gKyAgICAgICAgcmMgPSAtRUZBVUxUOw0KPiArICAg
ICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdChnZm5fbGlzdCwgY29weS5mcmFtZV9saXN0LCB0
b2RvKSApDQo+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gKw0KPiArICAgICAgICBmb3Ig
KCB1bnNpZ25lZCBpID0gMDsgaSA8IHRvZG87IGkrKyApDQo+ICsgICAgICAgIHsNCj4gKyAg
ICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKmZvcmVpZ25fcGFnZTsNCj4gKyAgICAgICAg
ICAgIHZvaWQgKmZvcmVpZ247DQo+ICsgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQ7DQo+
ICsNCj4gKyAgICAgICAgICAgIGZvcmVpZ25fcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQs
IGdmbl9saXN0W2ldLCAmcDJtdCwgUDJNX0FMTE9DKTsNCj4gKw0KPiArICAgICAgICAgICAg
aWYgKCB1bmxpa2VseShwMm10ICE9IHAybV9yYW1fcncNCj4gKyNpZmRlZiBDT05GSUdfWDg2
DQo+ICsgICAgICAgICAgICAgICAgICYmIHAybXQgIT0gcDJtX3JhbV9sb2dkaXJ0eQ0KPiAr
I2VuZGlmDQo+ICsgICAgICAgICAgICAgICAgICkgJiYgZm9yZWlnbl9wYWdlICkNCj4gKyAg
ICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICBwdXRfcGFnZShmb3JlaWduX3BhZ2Up
Ow0KPiArICAgICAgICAgICAgICAgIGZvcmVpZ25fcGFnZSA9IE5VTEw7DQo+ICsgICAgICAg
ICAgICB9DQo+ICsgICAgICAgICAgICBpZiAoIHVubGlrZWx5KCFmb3JlaWduX3BhZ2UpICkN
Cj4gKyAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICBnZHByaW50ayhYRU5MT0df
V0FSTklORywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAiRXJyb3IgYWNjZXNzaW5n
IGZvcmVpZ24gbWZuICUiIFBSSV9tZm4gIlxuIiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICBnZm5fbGlzdFtpXSk7DQo+ICsgICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOw0K
PiArICAgICAgICAgICAgICAgIGNvcHkubnJfZnJhbWVzIC09IGk7DQo+ICsgICAgICAgICAg
ICAgICAgZ3Vlc3RfaGFuZGxlX2FkZF9vZmZzZXQoY29weS5mcmFtZV9saXN0LCBpKTsNCj4g
KyAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gKyAgICAgICAgICAgIH0NCj4gKw0KPiAr
ICAgICAgICAgICAgLyogQSBwYWdlIGlzIGRpcnRpZWQgd2hlbiBpdCdzIGJlaW5nIGNvcGll
ZCB0by4gKi8NCj4gKyAgICAgICAgICAgIGlmICggZGlyZWN0aW9uID09IFhFTk1FTV9mb3Jl
aWduY29weV90byApDQo+ICsgICAgICAgICAgICAgICAgcGFnaW5nX21hcmtfZGlydHkoZCwg
cGFnZV90b19tZm4oZm9yZWlnbl9wYWdlKSk7DQo+ICsNCj4gKyAgICAgICAgICAgIGZvcmVp
Z24gPSBtYXBfZG9tYWluX3BhZ2UocGFnZV90b19tZm4oZm9yZWlnbl9wYWdlKSk7DQo+ICsg
ICAgICAgICAgICBpZiAoIGRpcmVjdGlvbiA9PSBYRU5NRU1fZm9yZWlnbmNvcHlfZnJvbSAp
DQo+ICsgICAgICAgICAgICAgICAgcmMgPSBjb3B5X3RvX2d1ZXN0KGNvcHkuYnVmZmVyLCBm
b3JlaWduLCBQQUdFX1NJWkUpOw0KPiArICAgICAgICAgICAgZWxzZQ0KPiArICAgICAgICAg
ICAgICAgIHJjID0gY29weV9mcm9tX2d1ZXN0KGZvcmVpZ24sIGNvcHkuYnVmZmVyLCBQQUdF
X1NJWkUpOw0KPiArICAgICAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UoZm9yZWlnbik7DQo+
ICsgICAgICAgICAgICBwdXRfcGFnZShmb3JlaWduX3BhZ2UpOw0KPiArDQo+ICsgICAgICAg
ICAgICBpZiAoIHVubGlrZWx5KHJjKSApDQo+ICsgICAgICAgICAgICB7DQo+ICsgICAgICAg
ICAgICAgICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgIkVycm9yIGNvcHlpbmcgdG8gbWZuICUiIFBSSV9tZm4gIlxuIiwgZ2ZuX2xp
c3RbaV0pOw0KPiArICAgICAgICAgICAgICAgIGNvcHkubnJfZnJhbWVzIC09IGk7DQo+ICsg
ICAgICAgICAgICAgICAgZ3Vlc3RfaGFuZGxlX2FkZF9vZmZzZXQoY29weS5mcmFtZV9saXN0
LCBpKTsNCj4gKyAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4gKyAgICAgICAgICAgIH0N
Cj4gKw0KPiArICAgICAgICAgICAgZ3Vlc3RfaGFuZGxlX2FkZF9vZmZzZXQoY29weS5idWZm
ZXIsIFBBR0VfU0laRSk7DQo+ICsgICAgICAgIH0NCj4gKw0KPiArICAgICAgICBjb3B5Lm5y
X2ZyYW1lcyAtPSB0b2RvOw0KPiArICAgICAgICBndWVzdF9oYW5kbGVfYWRkX29mZnNldChj
b3B5LmZyYW1lX2xpc3QsIHRvZG8pOw0KPiArDQo+ICsgICAgICAgIGlmICggY29weS5ucl9m
cmFtZXMgJiYgaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApDQo+ICsgICAgICAgIHsNCj4g
KyAgICAgICAgICAgIHJjID0gaHlwZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24oDQo+ICsg
ICAgICAgICAgICAgICAgX19IWVBFUlZJU09SX21lbW9yeV9vcCwgImxoIiwgWEVOTUVNX2Zv
cmVpZ25jb3B5LCBhcmcpOw0KPiArICAgICAgICAgICAgZ290byBvdXQ7DQo+ICsgICAgICAg
IH0NCj4gKyAgICB9IHdoaWxlICggY29weS5ucl9mcmFtZXMgKTsNCj4gKw0KPiArICAgIHJj
ID0gMDsNCj4gKw0KPiArIG91dDoNCj4gKyAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCj4g
Kw0KPiArICAgIC8qIFVwZGF0ZSBpbiBhbGwgY2FzZXMsIGl0IGFsbG93cyB0aGUgY2FsbGVy
IHRvIGtub3cgaG93IG1hbnkNCj4gKyAgICAgKiBmcmFtZXMgd2VyZSBzdWNjZXNzZnVsbHkg
Y29waWVkIGFuZCB0aGUgY29udGludWF0aW9uIHRvDQo+ICsgICAgICogY29udGludWUgY29y
cmVjdGx5Lg0KPiArICAgICAqLw0KPiArICAgIGlmICggY29weV90b19ndWVzdChhcmcsICZj
b3B5LCAxKSApDQo+ICsgICAgICAgIHJjID0gLUVGQVVMVDsNCj4gKw0KPiArICAgIHJldHVy
biByYzsNCj4gK30NCj4gKw0KPiAgIGxvbmcgZG9fbWVtb3J5X29wKHVuc2lnbmVkIGxvbmcg
Y21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4gICB7DQo+ICAgICAg
IHN0cnVjdCBkb21haW4gKmQsICpjdXJyX2QgPSBjdXJyZW50LT5kb21haW47DQo+IEBAIC0y
MDEyLDYgKzIxMzgsMTMgQEAgbG9uZyBkb19tZW1vcnlfb3AodW5zaWduZWQgbG9uZyBjbWQs
IFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKQ0KPiAgICAgICAgICAgICAgIHN0
YXJ0X2V4dGVudCk7DQo+ICAgICAgICAgICBicmVhazsNCj4gICANCj4gKyAgICBjYXNlIFhF
Tk1FTV9mb3JlaWduY29weToNCj4gKyAgICAgICAgaWYgKCB1bmxpa2VseShzdGFydF9leHRl
bnQpICkNCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiArDQo+ICsgICAgICAg
IHJjID0gbWVtX2ZvcmVpZ25jb3B5KGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywgeGVuX2ZvcmVp
Z25jb3B5X3QpKTsNCj4gKyAgICAgICAgYnJlYWs7DQo+ICsNCj4gICAgICAgZGVmYXVsdDoN
Cj4gICAgICAgICAgIHJjID0gYXJjaF9tZW1vcnlfb3AoY21kLCBhcmcpOw0KPiAgICAgICAg
ICAgYnJlYWs7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5Lmgg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvbWVtb3J5LmgNCj4gaW5kZXggYmQ5ZmMzN2I1Mi4uYjQ4
ZDFmMzc4ZiAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL21lbW9yeS5oDQo+
ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaA0KPiBAQCAtNzQwLDcgKzc0MCw0
NSBAQCBzdHJ1Y3QgeGVuX3ZudW1hX3RvcG9sb2d5X2luZm8gew0KPiAgIHR5cGVkZWYgc3Ry
dWN0IHhlbl92bnVtYV90b3BvbG9neV9pbmZvIHhlbl92bnVtYV90b3BvbG9neV9pbmZvX3Q7
DQo+ICAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX3ZudW1hX3RvcG9sb2d5X2luZm9f
dCk7DQo+ICAgDQo+IC0vKiBOZXh0IGF2YWlsYWJsZSBzdWJvcCBudW1iZXIgaXMgMjkgKi8N
Cj4gKy8qDQo+ICsgKiBDb3B5IG1lbW9yeSBmcm9tL3RvIGEgZ2l2ZW4gZG9tYWluLg0KPiAr
ICovDQo+ICsjZGVmaW5lIFhFTk1FTV9mb3JlaWduY29weSAyOQ0KPiArc3RydWN0IHhlbl9m
b3JlaWduY29weSB7DQo+ICsgICAgLyogSU4gLSBUaGUgZG9tYWluIHdob3NlIHJlc291cmNl
IGlzIHRvIGJlIGNvcGllZC4gKi8NCj4gKyAgICBkb21pZF90IGRvbWlkOw0KPiArDQo+ICsg
ICAgLyogSU4gLSBGbGFncy4gKi8NCj4gKyNkZWZpbmUgWEVOTUVNX2ZvcmVpZ25jb3B5X2Zy
b20gMA0KPiArI2RlZmluZSBYRU5NRU1fZm9yZWlnbmNvcHlfdG8gMQ0KPiArI2RlZmluZSBY
RU5NRU1fZm9yZWlnbmNvcHlfZGlyZWN0aW9uIDENCj4gKyAgICB1aW50MTZfdCBmbGFnczsN
Cj4gKw0KPiArICAgIC8qDQo+ICsgICAgICogSU4NCj4gKyAgICAgKg0KPiArICAgICAqIEFz
IGFuIElOIHBhcmFtZXRlciBudW1iZXIgb2YgZnJhbWVzIG9mIHRoZSBkb21haW4gdG8gYmUg
Y29waWVkLg0KPiArICAgICAqLw0KPiArICAgIHVpbnQzMl90IG5yX2ZyYW1lczsNCj4gKw0K
DQpUaGUgaW50ZXJmYWNlIG9ubHkgYWxsb3dzIGNvcGllcyB0byBiZSBtYWRlIGF0IHBhZ2Ug
Z3JhbnVsYXJpdHksIHdoaWxlIA0KdGhhdCBjYW4gYmUgb2ssIHRoYXQgcHJvYmFibHkgd2Fu
dHMgdG8gYmUgc3RhdGVkLg0KDQo+ICsgICAgLyoNCj4gKyAgICAgKiBJTg0KPiArICAgICAq
DQo+ICsgICAgICogRnJhbWVzIHRvIGJlIGNvcGllZC4NCj4gKyAgICAgKi8NCj4gKyAgICBY
RU5fR1VFU1RfSEFORExFKHhlbl9wZm5fdCkgZnJhbWVfbGlzdDsNCj4gKw0KPiArICAgIC8q
DQo+ICsgICAgICogSU4vT1VUDQo+ICsgICAgICoNCj4gKyAgICAgKiBVc2Vyc3BhY2UgYnVm
ZmVyIHRvIHJlYWQvd3JpdGUgZnJvbS4NCj4gKyAgICAgKi8NCj4gKyAgICBYRU5fR1VFU1Rf
SEFORExFKHVpbnQ4KSBidWZmZXI7DQo+ICt9Ow0KDQpUaGUgaW50ZXJmYWNlIGxvb2tzIGEg
Yml0IGFzeW1ldHJpYywgb24gb25lIGhhbmQsIGl0IHRha2VzIHBmbnMgYW5kIG9uIA0KdGhl
IG90aGVyIGhhbmQsIGl0IHRha2VzIGEgZ3Vlc3QgdmlydHVhbCBhZGRyZXNzLg0KDQpUaG91
Z2gsIHVzaW5nIGd1ZXN0IHBvaW50ZXJzIGlzIG5vdCBncmVhdCBmb3IgUFZIIGRvbWFpbnMs
IGFzIGl0IA0KcmVxdWlyZXMgZXhwZW5zaXZlIHBhZ2V3YWxrcyAoZXNwZWNpYWxseSBmb3Ig
YSBsb3Qgb2YgcGFnZXMpLg0KDQpXb3VsZCBpdCBiZSBwcmVmZXJhYmxlIHRvIGhhdmUgYSBs
aXN0IG9mIGdtZm4gZm9yIGJvdGggc2lkZXMgPw0KDQo+ICt0eXBlZGVmIHN0cnVjdCB4ZW5f
Zm9yZWlnbmNvcHkgeGVuX2ZvcmVpZ25jb3B5X3Q7DQo+ICtERUZJTkVfWEVOX0dVRVNUX0hB
TkRMRSh4ZW5fZm9yZWlnbmNvcHlfdCk7DQo+ICsNCj4gKy8qIE5leHQgYXZhaWxhYmxlIHN1
Ym9wIG51bWJlciBpcyAzMCAqLw0KPiAgIA0KPiAgICNlbmRpZiAvKiBfX1hFTl9QVUJMSUNf
TUVNT1JZX0hfXyAqLw0KPiAgIA0KDQpUZWRkeQ0K
--------------Yg8OixMvwm29bk2YHImaZMQV
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------Yg8OixMvwm29bk2YHImaZMQV--

--------------koSVJldpvy6Ja05VsOuLnVMr--

--------------bJXDgwFSKVtzoJ7ihw0XiNJk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmom2NgFAwAAAAAACgkQZg+p0QLLz9Bw
dQv/YwX061tUJPluXjO3DLl3HFsQu12ap4I7qapSy2SHkjxmKeC6o7yHZXueSaSvP06LugcgJkPi
D6KpBsPSd7hqNsgJaho4OQmxYbUC2oP+iJZDjqBHDVHjadgrUpqQbUmkpDukzPqSUWS9tdtT51lq
DKcIVVr2RNdj3AN7kbhhH5rI7X6FVkttqAfZY7Gfgjwj2Ea3huvewrXY6btljeuAVWt3g0wzhJe1
QbksGFp6Tfg+ASVDsz4zqkiCpVBc3WruB9nM0Drk++a3Dn0+7KYhCFMi+hTjCSyyxGyJIz+5jlB7
qntnUQkQnTyDiGNFbjJ5iTFuC581lXR0pz5/9xGlmSPKdcQnN6qOefnVw0GJ/d4YXwfbo4FE8Tsx
Xs9XjPe4Zpe3Ue7lSJ3RpUEqcsg5j+WK+KvAX2W/reI4ZTxrXe3NyPUi8vf78Jtkl0wn45pwvGh5
vPKbWKvIq81RPMfj+LRpy8J9w7kvoaVC4NQVxR12j4AjRxqcQ54EIcnTqXNn
=YTG/
-----END PGP SIGNATURE-----

--------------bJXDgwFSKVtzoJ7ihw0XiNJk--

