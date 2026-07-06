Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FDpdACF7S2qTSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:53:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15770ECE7
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:53:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Uqh2K9Eb;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355266.1610018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgg0y-0002ke-6n; Mon, 06 Jul 2026 09:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355266.1610018; Mon, 06 Jul 2026 09:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgg0y-0002iB-41; Mon, 06 Jul 2026 09:53:24 +0000
Received: by outflank-mailman (input) for mailman id 1355266;
 Mon, 06 Jul 2026 09:53:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f36d8b30300080a8@swg.vates.tech>)
 id 1wgg0w-0002hp-Ua
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:53:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgg0w-008jpk-B3
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:53:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f36d8b30300080a8@swg.vates.tech>)
 id 6a4b7b0e-5cb7-0a2a0a5109dd-0a2a4507a0b6-8
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:53:22 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f36d8b30300080a8@swg.vates.tech>)
 id 6a4b7b11-9c8e-0a2a45070019-b9ff1c23b091-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:53:21 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f36d8b30300080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 06 Jul 2026 09:53:19 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5F7D681CE3;
 Mon,  6 Jul 2026 11:53:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=cs+hJHYKjd4nNAgZYIrLXdzuKsDOKiTI0qFjSHmr5B4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Uqh2K9Ebh506ns6o9cALjkkx8Jyn+bLT0427E033jWyXl+IaH3Q8E0rkE05Whs5TI/YRzE/ez
 36g3Sj7sV8zOU2XhUatTSqdMXe3lbLlx0dFOLUKa5TmAgWfptcO4WD/qU2tzn+I1Gd4lm45MaAl
 FphRlAal6Al+vc8XUnxoBqG9YNeDeK462dzKPAijVVxBWAhk/PCHxiOYIm7EHNEUMDRTW/RfnpV
 htu/KrUtt97l0QlY3WNxLdcUMHW7duPzgpj/r/L7XsfDXLk9ZW9lvC38YSlKTcIqRnQwt5MgxW7
 XgtxmTcm2hj4jxGDZwYk6BscD3oIg4Ge2F/kftAseOVQ==
X-Zone-Loop: 203973aa3caef4e76c0a7a5480cba6b73b74d92094ed
x-campaign-type: default
x-transaction-id: 32226af2-0f47-46b5-9918-edb8357078b7
x-swg-uid: 01-6c44122e-b17c-4a36-ab24-d6bfc2ca1c75
X-Mailer: Sweego
Message-ID:
 <1783331599.8631fc262581453bbf619ec5b2062170.19f36d8b30300080a8@vates.tech>
x-swg-bid: 1783331599.8631fc262581453bbf619ec5b2062170.19f36d8b30300080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 6 Jul 2026 11:53:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] stubdom: remove c-stubdom
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260706090521.1992123-1-jgross@suse.com>
 <20260706090521.1992123-2-jgross@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260706090521.1992123-2-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------27eyKSqIuqI0v0h0XzHB1R1f"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783331598536
X-purgate-ID: tlsNG-ef75cf/1783331601-FD12E25E-D3372031/0/0
X-purgate-type: clean
X-purgate-size: 15520
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:samuel.thibault@ens-lyon.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B15770ECE7

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------27eyKSqIuqI0v0h0XzHB1R1f
Content-Type: multipart/mixed; boundary="------------6LfCFJdyqH9yIx0vJ6LYyhs2";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2cd65d2b-cbbc-4df5-b814-69f6fb5cfcff@vates.tech>
Subject: Re: [PATCH v2 1/2] stubdom: remove c-stubdom
References: <20260706090521.1992123-1-jgross@suse.com>
 <20260706090521.1992123-2-jgross@suse.com>
In-Reply-To: <20260706090521.1992123-2-jgross@suse.com>
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

--------------6LfCFJdyqH9yIx0vJ6LYyhs2
Content-Type: multipart/mixed; boundary="------------VzT2rSCPjehQAQzpdd0B4EgL"

--------------VzT2rSCPjehQAQzpdd0B4EgL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDYvMDcvMjAyNiDDoCAxMTowOCwgSnVlcmdlbiBHcm9zcyBhIMOpY3JpdMKgOg0KPiBD
LXN0dWJkb20gd2FzIG1lYW50IGFzIGEgYmFzZSBmb3IgYnVpbGRpbmcgbmV3IE1pbmktT1Mg
YmFzZWQgc3R1YmRvbXMuDQo+IEl0IGhhc24ndCBzZWVuIGFueSB3b3JrIGZvciBtYW55IHll
YXJzIG5vdyBhbmQgY3JlYXRpbmcgbmV3IHN0dWJkb21zDQo+IHNob3VsZCB1c2UgVU5JS1JB
RlQgaW5zdGVhZCBvZiBNaW5pLU9TLg0KPiANCj4gU28gcmVtb3ZlIGMtc3R1YmRvbS4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4g
QWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+
IC0tLQ0KPiAgIHN0dWJkb20vTWFrZWZpbGUgICAgIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiAgIHN0dWJkb20vYy9NYWtlZmlsZSAgIHwgMTMgLS0tLS0tLS0tLS0tLQ0KPiAgIHN0
dWJkb20vYy9tYWluLmMgICAgIHwgIDggLS0tLS0tLS0NCj4gICBzdHViZG9tL2MvbWluaW9z
LmNmZyB8ICAyIC0tDQo+ICAgc3R1YmRvbS9jb25maWd1cmUgICAgfCA0NCAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIHN0dWJkb20vY29uZmln
dXJlLmFjIHwgIDEgLQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgODcgZGVsZXRpb25zKC0pDQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHN0dWJkb20vYy9NYWtlZmlsZQ0KPiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBzdHViZG9tL2MvbWFpbi5jDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IHN0
dWJkb20vYy9taW5pb3MuY2ZnDQo+IA0KPiBkaWZmIC0tZ2l0IGEvc3R1YmRvbS9NYWtlZmls
ZSBiL3N0dWJkb20vTWFrZWZpbGUNCj4gaW5kZXggOWFhMGQzZGVlNC4uYWNkNWU1NmYxNiAx
MDA2NDQNCj4gLS0tIGEvc3R1YmRvbS9NYWtlZmlsZQ0KPiArKysgYi9zdHViZG9tL01ha2Vm
aWxlDQo+IEBAIC0zMzksMTcgKzMzOSw2IEBAICQoVEFSR0VUU19NSU5JT1MpOiBtaW5pLW9z
LSU6DQo+ICAgICAgICAgICAgICAgICAgIG1rZGlyIC1wICRALyQkaSA7IFwNCj4gICAJZG9u
ZQ0KPiAgIA0KPiAtIyMjDQo+IC0jIEMNCj4gLSMjIw0KPiAtDQo+IC1jLW1pbmlvcy1jb25m
aWcubWs6ICQoQ1VSRElSKS9jL21pbmlvcy5jZmcNCj4gLQlNSU5JT1NfQ09ORklHPSIkPCIg
Q09ORklHX0ZJTEU9IiQoQ1VSRElSKS8kQCIgJChNQUtFKSBERVNURElSPSAtQyAkKE1JTklf
T1MpIGNvbmZpZw0KPiAtDQo+IC0uUEhPTlk6IGMNCj4gLWM6ICQoQ1JPU1NfUk9PVCkgYy1t
aW5pb3MtY29uZmlnLm1rDQo+IC0JQ1BQRkxBR1M9IiQoVEFSR0VUX0NQUEZMQUdTKSAkKHNo
ZWxsIGNhdCBjLW1pbmlvcy1jb25maWcubWspIiBDRkxBR1M9IiQoVEFSR0VUX0NGTEFHUyki
ICQoTUFLRSkgREVTVERJUj0gLUMgJEAgTFdJUERJUj0kKENVUkRJUikvbHdpcC0kKFhFTl9U
QVJHRVRfQVJDSCkNCj4gLQ0KPiAgICMjIyMjIw0KPiAgICMgVlRQTQ0KPiAgICMjIyMjIw0K
PiBAQCAtNDMyLDEwICs0MjEsNiBAQCB4ZW5zdG9yZXB2aDogJChDUk9TU19ST09UKSB4ZW5z
dG9yZXB2aC1taW5pb3MtY29uZmlnLm1rDQo+ICAgIyBtaW5pb3MNCj4gICAjIyMjIyMjIw0K
PiAgIA0KPiAtLlBIT05ZOiBjLXN0dWJkb20NCj4gLWMtc3R1YmRvbTogbWluaS1vcy0kKFhF
Tl9UQVJHRVRfQVJDSCktYyBsd2lwLSQoWEVOX1RBUkdFVF9BUkNIKSBsaWJ4ZW5ndWVzdCBj
DQo+IC0JREVGX0NQUEZMQUdTPSIkKFRBUkdFVF9DUFBGTEFHUykiIERFRl9DRkxBR1M9IiQo
VEFSR0VUX0NGTEFHUykiIERFRl9MREZMQUdTPSIkKFRBUkdFVF9MREZMQUdTKSIgTUlOSU9T
X0NPTkZJRz0iJChDVVJESVIpL2MvbWluaW9zLmNmZyIgJChNQUtFKSBERVNURElSPSAtQyAk
KE1JTklfT1MpIE9CSl9ESVI9JChDVVJESVIpLyQ8IExXSVBESVI9JChDVVJESVIpL2x3aXAt
JChYRU5fVEFSR0VUX0FSQ0gpIEFQUF9PQkpTPSQoQ1VSRElSKS9jL21haW4uYQ0KPiAtDQo+
ICAgLlBIT05ZOiB2dHBtLXN0dWJkb20NCj4gICB2dHBtLXN0dWJkb206IG1pbmktb3MtJChY
RU5fVEFSR0VUX0FSQ0gpLXZ0cG0gdnRwbQ0KPiAgIAlERUZfQ1BQRkxBR1M9IiQoVEFSR0VU
X0NQUEZMQUdTKSIgREVGX0NGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSIgREVGX0xERkxBR1M9
IiQoVEFSR0VUX0xERkxBR1MpIiBNSU5JT1NfQ09ORklHPSIkKENVUkRJUikvdnRwbS9taW5p
b3MuY2ZnIiAkKE1BS0UpIC1DICQoTUlOSV9PUykgT0JKX0RJUj0kKENVUkRJUikvJDwgQVBQ
X09CSlM9IiQoQ1VSRElSKS92dHBtL3Z0cG0uYSIgQVBQX0xETElCUz0iLWx0cG0gLWx0cG1f
Y3J5cHRvIC1sZ21wIC1scG9sYXJzc2wiDQo+IEBAIC00ODUsOCArNDcwLDYgQEAgZWxzZQ0K
PiAgIGluc3RhbGwtZ3J1Yi1pZi1lbmFibGVkOg0KPiAgIGVuZGlmDQo+ICAgDQo+IC1pbnN0
YWxsLWM6IGMtc3R1YmRvbQ0KPiAtDQo+ICAgaW5zdGFsbC14ZW5zdG9yZTogeGVuc3RvcmUt
c3R1YmRvbQ0KPiAgIAkkKElOU1RBTExfRElSKSAiJChERVNURElSKSQoWEVORklSTVdBUkVE
SVIpIg0KPiAgIAkkKElOU1RBTExfREFUQSkgbWluaS1vcy0kKFhFTl9UQVJHRVRfQVJDSCkt
eGVuc3RvcmUvbWluaS1vcy5neiAiJChERVNURElSKSQoWEVORklSTVdBUkVESVIpL3hlbnN0
b3JlLXN0dWJkb20uZ3oiDQo+IEBAIC01NDAsMTMgKzUyMywxMSBAQCB1bmluc3RhbGwtdnRw
bW1ncjoNCj4gICAuUEhPTlk6IGNsZWFuDQo+ICAgY2xlYW46ICQoZm9yZWFjaCBsaWIsJChT
VFVCX0xJQlMpLGNsZWFuLWxpYnhlbiQobGliKSkNCj4gICBjbGVhbjoNCj4gLQlybSAtZnIg
bWluaS1vcy0kKFhFTl9UQVJHRVRfQVJDSCktYw0KPiAgIAlybSAtZnIgbWluaS1vcy0kKFhF
Tl9UQVJHRVRfQVJDSCktZ3J1Yg0KPiAgIAlybSAtZnIgbWluaS1vcy0kKFhFTl9UQVJHRVRf
QVJDSCkteGVuc3RvcmUNCj4gICAJcm0gLWZyIG1pbmktb3MtJChYRU5fVEFSR0VUX0FSQ0gp
LXhlbnN0b3JlcHZoDQo+ICAgCXJtIC1mciBtaW5pLW9zLSQoWEVOX1RBUkdFVF9BUkNIKS12
dHBtDQo+ICAgCXJtIC1mciBtaW5pLW9zLSQoWEVOX1RBUkdFVF9BUkNIKS12dHBtbWdyDQo+
IC0JJChNQUtFKSBERVNURElSPSAtQyBjIGNsZWFuDQo+ICAgCSQoTUFLRSkgLUMgdnRwbSBj
bGVhbg0KPiAgIAkkKE1BS0UpIC1DIHZ0cG1tZ3IgY2xlYW4NCj4gICAJcm0gLWZyIGdydWIt
JChYRU5fVEFSR0VUX0FSQ0gpDQo+IGRpZmYgLS1naXQgYS9zdHViZG9tL2MvTWFrZWZpbGUg
Yi9zdHViZG9tL2MvTWFrZWZpbGUNCj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGlu
ZGV4IGIyNTJkY2FkMGIuLjAwMDAwMDAwMDANCj4gLS0tIGEvc3R1YmRvbS9jL01ha2VmaWxl
DQo+ICsrKyAvZGV2L251bGwNCj4gQEAgLTEsMTMgKzAsMCBAQA0KPiAtWEVOX1JPT1QgPSAk
KENVUkRJUikvLi4vLi4NCj4gLQ0KPiAtaWZlcSAoLCQoZmluZHN0cmluZyBjbGVhbiwkKE1B
S0VDTURHT0FMUykpKQ0KPiAtaW5jbHVkZSAkKFhFTl9ST09UKS9Db25maWcubWsNCj4gLWVu
ZGlmDQo+IC0NCj4gLWFsbDogbWFpbi5hDQo+IC0NCj4gLW1haW4uYTogbWFpbi5vDQo+IC0J
JChBUikgY3IgJEAgJF4NCj4gLQ0KPiAtY2xlYW46DQo+IC0Jcm0gLWYgKi5hICoubw0KPiBk
aWZmIC0tZ2l0IGEvc3R1YmRvbS9jL21haW4uYyBiL3N0dWJkb20vYy9tYWluLmMNCj4gZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IGY5N2EwZjcyZDQuLjAwMDAwMDAwMDAN
Cj4gLS0tIGEvc3R1YmRvbS9jL21haW4uYw0KPiArKysgL2Rldi9udWxsDQo+IEBAIC0xLDgg
KzAsMCBAQA0KPiAtI2luY2x1ZGUgPHN0ZGlvLmg+DQo+IC0jaW5jbHVkZSA8dW5pc3RkLmg+
DQo+IC0NCj4gLWludCBtYWluKHZvaWQpIHsNCj4gLSAgICAgICAgc2xlZXAoMik7DQo+IC0g
ICAgICAgIHByaW50ZigiSGVsbG8sIHdvcmxkIVxuIik7DQo+IC0gICAgICAgIHJldHVybiAw
Ow0KPiAtfQ0KPiBkaWZmIC0tZ2l0IGEvc3R1YmRvbS9jL21pbmlvcy5jZmcgYi9zdHViZG9t
L2MvbWluaW9zLmNmZw0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggNTZk
NjU1MTBjZC4uMDAwMDAwMDAwMA0KPiAtLS0gYS9zdHViZG9tL2MvbWluaW9zLmNmZw0KPiAr
KysgL2Rldi9udWxsDQo+IEBAIC0xLDIgKzAsMCBAQA0KPiAtQ09ORklHX0xJQkM9eQ0KPiAt
Q09ORklHX0xXSVA9eQ0KPiBkaWZmIC0tZ2l0IGEvc3R1YmRvbS9jb25maWd1cmUgYi9zdHVi
ZG9tL2NvbmZpZ3VyZQ0KPiBpbmRleCBlMTI3ZWY0NGViLi44YTBhNzk4YmQyIDEwMDc1NQ0K
PiAtLS0gYS9zdHViZG9tL2NvbmZpZ3VyZQ0KPiArKysgYi9zdHViZG9tL2NvbmZpZ3VyZQ0K
PiBAQCAtNjYxLDcgKzY2MSw2IEBAIGRlYnVnDQo+ICAgeGVuc3RvcmVwdmgNCj4gICB4ZW5z
dG9yZQ0KPiAgIGdydWINCj4gLWMNCj4gICBob3N0X29zDQo+ICAgaG9zdF92ZW5kb3INCj4g
ICBob3N0X2NwdQ0KPiBAQCAtNzEyLDcgKzcxMSw2IEBAIFNIRUxMJw0KPiAgIGFjX3N1YnN0
X2ZpbGVzPScnDQo+ICAgYWNfdXNlcl9vcHRzPScNCj4gICBlbmFibGVfb3B0aW9uX2NoZWNr
aW5nDQo+IC1lbmFibGVfY19zdHViZG9tDQo+ICAgZW5hYmxlX3B2X2dydWINCj4gICBlbmFi
bGVfeGVuc3RvcmVfc3R1YmRvbQ0KPiAgIGVuYWJsZV94ZW5zdG9yZXB2aF9zdHViZG9tDQo+
IEBAIC0xMzYwLDcgKzEzNTgsNiBAQCBPcHRpb25hbCBGZWF0dXJlczoNCj4gICAgIC0tZGlz
YWJsZS1vcHRpb24tY2hlY2tpbmcgIGlnbm9yZSB1bnJlY29nbml6ZWQgLS1lbmFibGUvLS13
aXRoIG9wdGlvbnMNCj4gICAgIC0tZGlzYWJsZS1GRUFUVVJFICAgICAgIGRvIG5vdCBpbmNs
dWRlIEZFQVRVUkUgKHNhbWUgYXMgLS1lbmFibGUtRkVBVFVSRT1ubykNCj4gICAgIC0tZW5h
YmxlLUZFQVRVUkVbPUFSR10gIGluY2x1ZGUgRkVBVFVSRSBbQVJHPXllc10NCj4gLSAgLS1l
bmFibGUtYy1zdHViZG9tICAgICAgQnVpbGQgYW5kIGluc3RhbGwgYy1zdHViZG9tIChkZWZh
dWx0IGlzIERJU0FCTEVEKQ0KPiAgICAgLS1lbmFibGUtcHYtZ3J1YiAgICAgICAgQnVpbGQg
YW5kIGluc3RhbGwgcHYtZ3J1YiAoZGVmYXVsdCBpcyBESVNBQkxFRCkNCj4gICAgIC0tZGlz
YWJsZS14ZW5zdG9yZS1zdHViZG9tDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
dWlsZCBhbmQgaW5zdGFsbCB4ZW5zdG9yZS1zdHViZG9tIChkZWZhdWx0IGlzDQo+IEBAIC0y
NDA2LDQ3ICsyNDAzLDYgQEAgY2FzZSAkaG9zdF9vcyBpbiAqXCAqKSBob3N0X29zPWBlY2hv
ICIkaG9zdF9vcyIgfCBzZWQgJ3MvIC8tL2cnYDs7IGVzYWMNCj4gICANCj4gICAjIEVuYWJs
ZS9kaXNhYmxlIHN0dWIgZG9tYWlucw0KPiAgIA0KPiAtIyBDaGVjayB3aGV0aGVyIC0tZW5h
YmxlLWMtc3R1YmRvbSB3YXMgZ2l2ZW4uDQo+IC1pZiB0ZXN0ICR7ZW5hYmxlX2Nfc3R1YmRv
bSt5fQ0KPiAtdGhlbiA6DQo+IC0gIGVuYWJsZXZhbD0kZW5hYmxlX2Nfc3R1YmRvbTsNCj4g
LQ0KPiAtaWYgdGVzdCAieCRlbmFibGV2YWwiID0gInh5ZXMiDQo+IC10aGVuIDoNCj4gLQ0K
PiAtDQo+IC1jPXkNCj4gLVNUVUJET01fVEFSR0VUUz0iJFNUVUJET01fVEFSR0VUUyBjIg0K
PiAtU1RVQkRPTV9CVUlMRD0iJFNUVUJET01fQlVJTEQgYy1zdHViZG9tIg0KPiAtU1RVQkRP
TV9JTlNUQUxMPSIkU1RVQkRPTV9JTlNUQUxMIGluc3RhbGwtYyINCj4gLVNUVUJET01fVU5J
TlNUQUxMPSIkU1RVQkRPTV9VTklOU1RBTEwgaW5zdGFsbC1jIg0KPiAtDQo+IC0NCj4gLWVs
c2UgJGFzX25vcA0KPiAtDQo+IC1pZiB0ZXN0ICJ4JGVuYWJsZXZhbCIgPSAieG5vIg0KPiAt
dGhlbiA6DQo+IC0NCj4gLQ0KPiAtYz1uDQo+IC0NCj4gLQ0KPiAtZmkNCj4gLQ0KPiAtZmkN
Cj4gLQ0KPiAtDQo+IC1lbHNlICRhc19ub3ANCj4gLQ0KPiAtDQo+IC1jPW4NCj4gLQ0KPiAt
DQo+IC1maQ0KPiAtDQo+IC0NCj4gLQ0KPiAtDQo+ICAgIyBDaGVjayB3aGV0aGVyIC0tZW5h
YmxlLXB2LWdydWIgd2FzIGdpdmVuLg0KPiAgIGlmIHRlc3QgJHtlbmFibGVfcHZfZ3J1Yit5
fQ0KPiAgIHRoZW4gOg0KPiBkaWZmIC0tZ2l0IGEvc3R1YmRvbS9jb25maWd1cmUuYWMgYi9z
dHViZG9tL2NvbmZpZ3VyZS5hYw0KPiBpbmRleCBmMDdiMDhjNWIzLi4zM2YxNzAxNDRlIDEw
MDY0NA0KPiAtLS0gYS9zdHViZG9tL2NvbmZpZ3VyZS5hYw0KPiArKysgYi9zdHViZG9tL2Nv
bmZpZ3VyZS5hYw0KPiBAQCAtMTgsNyArMTgsNiBAQCBtNF9pbmNsdWRlKFsuLi9tNC9kZXBl
bmRzLm00XSkNCj4gICBtNF9pbmNsdWRlKFsuLi9tNC9mZXRjaGVyLm00XSkNCj4gICANCj4g
ICAjIEVuYWJsZS9kaXNhYmxlIHN0dWIgZG9tYWlucw0KPiAtQVhfU1RVQkRPTV9ERUZBVUxU
X0RJU0FCTEUoW2Mtc3R1YmRvbV0sIFtjXSkNCj4gICBBWF9TVFVCRE9NX0RFRkFVTFRfRElT
QUJMRShbcHYtZ3J1Yl0sIFtncnViXSkNCj4gICBBWF9TVFVCRE9NX0RFRkFVTFRfRU5BQkxF
KFt4ZW5zdG9yZS1zdHViZG9tXSwgW3hlbnN0b3JlXSkNCj4gICBBWF9TVFVCRE9NX0RFRkFV
TFRfRU5BQkxFKFt4ZW5zdG9yZXB2aC1zdHViZG9tXSwgW3hlbnN0b3JlcHZoXSkNCg0KUmV2
aWV3ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0K
--------------VzT2rSCPjehQAQzpdd0B4EgL
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------VzT2rSCPjehQAQzpdd0B4EgL--

--------------6LfCFJdyqH9yIx0vJ6LYyhs2--

--------------27eyKSqIuqI0v0h0XzHB1R1f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpLew4FAwAAAAAACgkQZg+p0QLLz9AW
pgwAhZzHbf59k8n85jYICTQ2h4sWNnlk7jyNLpvIlBWLdBy7cx5MAz7HWxQySpH+IlRMqtyN2x6V
C4AAheDSN3NUzGDWxcNXPzGWBuaZRV4waJuHk4RcIWlvBU9xjgGMrEnMiWITi4puPzYxVQLNywWd
muZNFDZZ8vmQO3QoKZc5VHvhGzNS3WwMAX9c6P3NO9q92Nh46XncJtBtj9Uo6xVXC3BaGZ/nWSP2
w3rCxhEAuEQDJqku4Gi10dmh948DNcWesOc/7n6vo2IYWaFJ68LE1LpyLJRoB4xICBhP0CzYJUXu
EVx5+5Zd7N3H1dwjaP3KHLXiERisjMfg5fqDm7xksscPdWgQQCshL0OhUY39XsMzsscTnF4NEHDi
KqORph8oIxETvut7afrXXk0EmnqSunUFcJ/SwssEu29N4v+835U8zK0wStdrya1UPQg1RjjWzhdl
cK6A8QJ41VOy+A0Ubaq0A3/LxaXXtgeRNFCjkclOD8WouY11b3hSOd4mtSbI
=BEcn
-----END PGP SIGNATURE-----

--------------27eyKSqIuqI0v0h0XzHB1R1f--

