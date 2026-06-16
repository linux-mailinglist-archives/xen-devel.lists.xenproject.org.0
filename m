Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KGfHJoUVMWqEbQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:21:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE16B68D78A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:21:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=rT93quT6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1338905.1599985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPya-0003HB-AV; Tue, 16 Jun 2026 09:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338905.1599985; Tue, 16 Jun 2026 09:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPya-0003F9-6u; Tue, 16 Jun 2026 09:20:56 +0000
Received: by outflank-mailman (input) for mailman id 1338905;
 Tue, 16 Jun 2026 09:20:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecfbbc702000701b@swg.vates.tech>)
 id 1wZPyY-0003Et-JK
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:20:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPyX-005FzJ-GP
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:20:53 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecfbbc702000701b@swg.vates.tech>)
 id 6a311574-e002-0a2a0a5209dd-0a2a4508b192-6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:20:53 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ecfbbc702000701b@swg.vates.tech>)
 id 6a311575-63b5-0a2a45080019-b9ff1c12a5e5-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:20:53 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ecfbbc702000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Jun 2026 09:20:50 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id A434082DF7;
 Tue, 16 Jun 2026 11:20:49 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=y8HSdR9pp623a1LAq9JQbwaUudFVyHZnzuLdZg9tJ4g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=rT93quT6jZeczeILvrcR/GgDwu5yZkmXiZeFC5ZEosbNxEY5xsO7Rs5TChABM/0imRvYHtECT
 iNt6kiRnwPW1HhBBbCNRZTEq0DdGFPejTtaa2RUnsw77+P0zp7+u+MApNd5wsM1ArkdHHowzVRP
 /fYAES7I5cxlN+gKBsqv5uemZ/Z8POgWGjGsF53wn9xqMaCs/xVB9y0AWEphSJsCoiyzPWKo2f3
 IM9ni76cvt71kTwRMLeBrFr+erM8DQgCTnxjnBIUz+MqHnTQlXInfROiCrYgdQQYb0D9q4Kcxg8
 fivu+BAHpXMHGvXs0KbmD9/Fbn9t1x8+2il79BMENYLw==
X-Zone-Loop: b1f203287ea06d63cc2d3864361dea310dec6ae64717
x-campaign-type: default
x-transaction-id: 375d9200-daf7-4a5f-9aa4-5f6e85a11634
x-swg-uid: 01-5f57ca30-9fbd-4d0e-8f86-013cee3577b4
X-Mailer: Sweego
Message-ID:
 <1781601650.8631fc262581453bbf619ec5b2062170.19ecfbbc702000701b@vates.tech>
x-swg-bid: 1781601650.8631fc262581453bbf619ec5b2062170.19ecfbbc702000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 16 Jun 2026 11:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Daniel Smith
 <dpsmith@apertussolutions.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IFcwSYLC3cNoDRuJSqJ9lOsp"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781601649895
X-purgate-ID: tlsNG-c1860d/1781601653-BC567DB1-40FB9E7A/0/0
X-purgate-type: clean
X-purgate-size: 11976
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,vates.tech:dkim,vates.tech:email,vates.tech:mid,vates.tech:from_mime];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE16B68D78A

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IFcwSYLC3cNoDRuJSqJ9lOsp
Content-Type: multipart/mixed; boundary="------------Pwtw3jErIieSPFPYAPaWSd2a";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Daniel Smith
 <dpsmith@apertussolutions.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Message-ID: <d0acddd8-1203-46cf-acab-fb0cfc8ca027@vates.tech>
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
In-Reply-To: <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
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

--------------Pwtw3jErIieSPFPYAPaWSd2a
Content-Type: multipart/mixed; boundary="------------gCQBHcE2z2KDeHjXHDRDdnjR"

--------------gCQBHcE2z2KDeHjXHDRDdnjR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTYvMDYvMjAyNiDDoCAxMTowMywgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gTnVs
LXRlcm1pbmF0ZWQgc3RyaW5ncyBhcmUgcGFzc2VkIGluIGFsbCBjYXNlcywgc28gdGhlIHN0
cmxlbigpIGNhbiB2ZXJ5DQo+IHdlbGwgYmUgaW52b2tlZCBieSB0aGUgZnVuY3Rpb24gaXRz
ZWxmLiBJbiBwcmVwYXJhdGlvbiBmb3IgYSBoeXBlcnZpc29yDQo+IGNoYW5nZSBhbHNvIGlu
Y2x1ZGUgdGhlIG51bCB0ZXJtaW5hdG9yIGluIHRoZSBzaXplIGNhbGN1bGF0aW9uLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiAt
LS0NCj4gSWRlYWxseSBsaWJ4bF9mbGFza19jb250ZXh0X3RvX3NpZCgpIHdvdWxkIGZvbGxv
dyBzdWl0LCBidXQgYWl1aSBkb2luZyBzbw0KPiB3b3VsZCBicmVhayBpdHMgKHN0YWJsZSkg
QUJJLg0KPiANCj4gT2YgY291cnNlIHRoZSBjYXN0cyBpbiB4Y19mbGFza19hY2Nlc3MoKSBh
cmUgc3VzcGljaW91cy4NCj4gDQo+IC0tLSBhL3Rvb2xzL2hlbHBlcnMvaW5pdC14ZW5zdG9y
ZS1kb21haW4uYw0KPiArKysgYi90b29scy9oZWxwZXJzL2luaXQteGVuc3RvcmUtZG9tYWlu
LmMNCj4gQEAgLTEwOCw3ICsxMDgsNyBAQCBzdGF0aWMgaW50IGJ1aWxkKHhjX2ludGVyZmFj
ZSAqeGNoKQ0KPiAgIA0KPiAgICAgICBpZiAoIGZsYXNrICkNCj4gICAgICAgew0KPiAtICAg
ICAgICBydiA9IHhjX2ZsYXNrX2NvbnRleHRfdG9fc2lkKHhjaCwgZmxhc2ssIHN0cmxlbihm
bGFzayksICZjb25maWcuc3NpZHJlZik7DQo+ICsgICAgICAgIHJ2ID0geGNfZmxhc2tfY29u
dGV4dF90b19zaWQoeGNoLCBmbGFzaywgJmNvbmZpZy5zc2lkcmVmKTsNCj4gICAgICAgICAg
IGlmICggcnYgKQ0KPiAgICAgICAgICAgew0KPiAgICAgICAgICAgICAgIGZwcmludGYoc3Rk
ZXJyLCAieGNfZmxhc2tfY29udGV4dF90b19zaWQgZmFpbGVkXG4iKTsNCj4gLS0tIGEvdG9v
bHMvaW5jbHVkZS94ZW5jdHJsLmgNCj4gKysrIGIvdG9vbHMvaW5jbHVkZS94ZW5jdHJsLmgN
Cj4gQEAgLTIzNzIsNyArMjM3Miw3IEBAIGxvbmcgeGNfc2hhcmluZ191c2VkX2ZyYW1lcyh4
Y19pbnRlcmZhY2UNCj4gICAvKioqIEVuZCBzaGFyaW5nIGludGVyZmFjZSAqKiovDQo+ICAg
DQo+ICAgaW50IHhjX2ZsYXNrX2xvYWQoeGNfaW50ZXJmYWNlICp4Y19oYW5kbGUsIGNoYXIg
KmJ1ZiwgdWludDMyX3Qgc2l6ZSk7DQo+IC1pbnQgeGNfZmxhc2tfY29udGV4dF90b19zaWQo
eGNfaW50ZXJmYWNlICp4Y19oYW5kbGUsIGNoYXIgKmJ1ZiwgdWludDMyX3Qgc2l6ZSwgdWlu
dDMyX3QgKnNpZCk7DQo+ICtpbnQgeGNfZmxhc2tfY29udGV4dF90b19zaWQoeGNfaW50ZXJm
YWNlICp4Y19oYW5kbGUsIGNoYXIgKmJ1ZiwgdWludDMyX3QgKnNpZCk7DQo+ICAgaW50IHhj
X2ZsYXNrX3NpZF90b19jb250ZXh0KHhjX2ludGVyZmFjZSAqeGNfaGFuZGxlLCBpbnQgc2lk
LCBjaGFyICpidWYsIHVpbnQzMl90IHNpemUpOw0KPiAgIGludCB4Y19mbGFza19nZXRlbmZv
cmNlKHhjX2ludGVyZmFjZSAqeGNfaGFuZGxlKTsNCj4gICBpbnQgeGNfZmxhc2tfc2V0ZW5m
b3JjZSh4Y19pbnRlcmZhY2UgKnhjX2hhbmRsZSwgaW50IG1vZGUpOw0KPiAtLS0gYS90b29s
cy9saWJzL2N0cmwveGNfZmxhc2suYw0KPiArKysgYi90b29scy9saWJzL2N0cmwveGNfZmxh
c2suYw0KPiBAQCAtODMsMTAgKzgzLDExIEBAIGludCB4Y19mbGFza19sb2FkKHhjX2ludGVy
ZmFjZSAqeGNoLCBjaGENCj4gICAgICAgcmV0dXJuIGVycjsNCj4gICB9DQo+ICAgDQo+IC1p
bnQgeGNfZmxhc2tfY29udGV4dF90b19zaWQoeGNfaW50ZXJmYWNlICp4Y2gsIGNoYXIgKmJ1
ZiwgdWludDMyX3Qgc2l6ZSwgdWludDMyX3QgKnNpZCkNCj4gK2ludCB4Y19mbGFza19jb250
ZXh0X3RvX3NpZCh4Y19pbnRlcmZhY2UgKnhjaCwgY2hhciAqYnVmLCB1aW50MzJfdCAqc2lk
KQ0KPiAgIHsNCj4gICAgICAgaW50IGVycjsNCj4gICAgICAgc3RydWN0IHhlbl9mbGFza19v
cCBvcCA9IHt9Ow0KPiArICAgIHNpemVfdCBzaXplID0gc3RybGVuKGJ1ZikgKyAxOw0KPiAg
ICAgICBERUNMQVJFX0hZUEVSQ0FMTF9CT1VOQ0UoYnVmLCBzaXplLCBYQ19IWVBFUkNBTExf
QlVGRkVSX0JPVU5DRV9JTik7DQo+ICAgDQo+ICAgICAgIGlmICggeGNfaHlwZXJjYWxsX2Jv
dW5jZV9wcmUoeGNoLCBidWYpICkNCj4gQEAgLTI0Nyw3ICsyNDgsNyBAQCBzdGF0aWMgaW50
IHhjX2ZsYXNrX2FkZCh4Y19pbnRlcmZhY2UgKnhjDQo+ICAgICAgIGludCBlcnI7DQo+ICAg
ICAgIHN0cnVjdCB4ZW5fZmxhc2tfb3Agb3AgPSB7fTsNCj4gICANCj4gLSAgICBlcnIgPSB4
Y19mbGFza19jb250ZXh0X3RvX3NpZCh4Y2gsIHNjb250ZXh0LCBzdHJsZW4oc2NvbnRleHQp
LCAmc2lkKTsNCj4gKyAgICBlcnIgPSB4Y19mbGFza19jb250ZXh0X3RvX3NpZCh4Y2gsIHNj
b250ZXh0LCAmc2lkKTsNCj4gICAgICAgaWYgKCBlcnIgKQ0KPiAgICAgICAgICAgcmV0dXJu
IGVycjsNCj4gICANCj4gQEAgLTMyMywxMCArMzI0LDEwIEBAIGludCB4Y19mbGFza19hY2Nl
c3MoeGNfaW50ZXJmYWNlICp4Y2gsIGMNCj4gICAgICAgc3RydWN0IHhlbl9mbGFza19vcCBv
cCA9IHt9Ow0KPiAgICAgICBpbnQgZXJyOw0KPiAgIA0KPiAtICAgIGVyciA9IHhjX2ZsYXNr
X2NvbnRleHRfdG9fc2lkKHhjaCwgKGNoYXIqKXNjb24sIHN0cmxlbihzY29uKSwgJm9wLnUu
YWNjZXNzLnNzaWQpOw0KPiArICAgIGVyciA9IHhjX2ZsYXNrX2NvbnRleHRfdG9fc2lkKHhj
aCwgKGNoYXIqKXNjb24sICZvcC51LmFjY2Vzcy5zc2lkKTsNCj4gICAgICAgaWYgKCBlcnIg
KQ0KPiAgICAgICAgICAgcmV0dXJuIGVycjsNCj4gLSAgICBlcnIgPSB4Y19mbGFza19jb250
ZXh0X3RvX3NpZCh4Y2gsIChjaGFyKil0Y29uLCBzdHJsZW4odGNvbiksICZvcC51LmFjY2Vz
cy50c2lkKTsNCj4gKyAgICBlcnIgPSB4Y19mbGFza19jb250ZXh0X3RvX3NpZCh4Y2gsIChj
aGFyKil0Y29uLCAmb3AudS5hY2Nlc3MudHNpZCk7DQo+ICAgICAgIGlmICggZXJyICkNCj4g
ICAgICAgICAgIHJldHVybiBlcnI7DQo+ICAgDQo+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQv
bGlieGxfZmxhc2suYw0KPiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2ZsYXNrLmMN
Cj4gQEAgLTIxLDcgKzIxLDggQEAgaW50IGxpYnhsX2ZsYXNrX2NvbnRleHRfdG9fc2lkKGxp
YnhsX2N0eA0KPiAgIHsNCj4gICAgICAgaW50IHJjOw0KPiAgIA0KPiAtICAgIHJjID0geGNf
Zmxhc2tfY29udGV4dF90b19zaWQoY3R4LT54Y2gsIGJ1ZiwgbGVuLCBzc2lkcmVmKTsNCj4g
KyAgICBhc3NlcnQobGVuID09IHN0cmxlbihidWYpKTsNCj4gKyAgICByYyA9IHhjX2ZsYXNr
X2NvbnRleHRfdG9fc2lkKGN0eC0+eGNoLCBidWYsIHNzaWRyZWYpOw0KPiAgIA0KPiAgICAg
ICByZXR1cm4gcmM7DQo+ICAgfQ0KPiAtLS0gYS90b29scy9weXRob24veGVuL2xvd2xldmVs
L3hjL3hjLmMNCj4gKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+
IEBAIC0xNzU0LDcgKzE3NTQsNyBAQCBzdGF0aWMgUHlPYmplY3QgKnB5Zmxhc2tfY29udGV4
dF90b19zaWQoDQo+ICAgICAgICAgICByZXR1cm4gUHlFcnJfU2V0RnJvbUVycm5vKHhjX2Vy
cm9yX29iaik7DQo+ICAgICAgIH0NCj4gICANCj4gLSAgICByZXQgPSB4Y19mbGFza19jb250
ZXh0X3RvX3NpZCh4Y19oYW5kbGUsIGN0eCwgc3RybGVuKGN0eCksICZzaWQpOw0KPiArICAg
IHJldCA9IHhjX2ZsYXNrX2NvbnRleHRfdG9fc2lkKHhjX2hhbmRsZSwgY3R4LCAmc2lkKTsN
Cj4gICANCj4gICAgICAgeGNfaW50ZXJmYWNlX2Nsb3NlKHhjX2hhbmRsZSk7DQo+ICAgDQo+
IA0KPiANCg0KUmV2aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50
ZWNoPg0KDQpUZWRkeQ0K
--------------gCQBHcE2z2KDeHjXHDRDdnjR
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------gCQBHcE2z2KDeHjXHDRDdnjR--

--------------Pwtw3jErIieSPFPYAPaWSd2a--

--------------IFcwSYLC3cNoDRuJSqJ9lOsp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoxFXEFAwAAAAAACgkQZg+p0QLLz9Ci
1Av/a/J/G27LMEOJoDSn1M/kT8xFwpmFisg2EuO/9G7/MZjQyzu3FiYvOHq9ZNwPU0RSk/JYiQUR
jZUqESGZmvm0ROtxBNb3P560t6exjfKmU2XUmdtV5kGHvu3ag6sKFGUrewdmO4jmPxem847KDqll
sum6xRtKjV1F3vzrWuezZNvHuHoSSHQSLynA2b5CsVZJjadpM7c3d8CvKGzypqw7g/8+nn6jykJq
5vU07eISjr5u2IHuxVGWIORFSyxilD8mrAynFF4d/3GErr8LWUl+5FJ8C9umQrOEpH8pez9lvYTa
JxwmU1LtGptFJsVzGYOW9N+fXS1jHpHFafgl9LmIjwcL+CIC1UyIsxVRmz/gOHRZ++JNxYbto5IP
1varMi/vs3JLASmiW52QPtCFXgz6t6c9ABgNK73GOtbP7jxBbor2tPYwLkLC1xFy3zQJcrHcXtlu
5u2esoHg9TqVnIt+9Qn9uimPLbHtrcF5JK/2vALmrzPnRaQTfsV4C8AERtSz
=YVZF
-----END PGP SIGNATURE-----

--------------IFcwSYLC3cNoDRuJSqJ9lOsp--

