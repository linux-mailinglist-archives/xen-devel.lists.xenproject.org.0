Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOhFI5XlBmoHowIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:21:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C586C54C4DC
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 11:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309765.1580816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNoie-0005L4-Nm; Fri, 15 May 2026 09:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309765.1580816; Fri, 15 May 2026 09:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNoie-0005IA-Kl; Fri, 15 May 2026 09:20:32 +0000
Received: by outflank-mailman (input) for mailman id 1309765;
 Fri, 15 May 2026 09:20:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNoic-0005I4-KI
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:20:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNoib-00HQiT-Q9
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:20:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2aefe501000f373@swg.vates.tech>)
 id 6a06e555-2eae-0a2a0a5409dd-0a2a4506b980-32
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:20:29 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e2aefe501000f373@swg.vates.tech>)
 id 6a06e55d-7371-0a2a45060019-b9ff1c229f3b-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 11:20:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e2aefe501000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 15 May 2026 09:20:25 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9BADE8621D;
 Fri, 15 May 2026 11:20:24 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=1F56fiwydD6Vrx7znhq+zSnJfQ0zQBjy1flII6bm1bw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Qp063GoCwJW7jkMgTzLEBsnKp3D1QMS3HAdfUd35RZPhtBJ68hVA/BsbRKpjqnnC7DevzUjal
 Hf/oF/ZVo3YRWNbQ0Df6IZm+o4ZMyCRErMvL7/ihKm1iaXmQRWtnSaa3gJP5dLFPOFB+NZNRE5/
 OeB/mhc5U3eL0iSFlSZWC4mgdfi4bKMF/eklIbT/rMp/T02uIiuUA5+Fc57pqwV5M/WAsqH0GAT
 rszQg+Rfj7K/C/1d4YKZbEhVKWUUpyQsW2Ur1fZ++6kD5R2cl7fXx5uV85E6HrntjG1v/pg+KmW
 FWD/M+qpo6DJTvF3G1PVp3wtTUpOphv36WbBGemNAeDQ==
X-Zone-Loop: 1378a93e5952dd91aef12e5d3963ba4291f68c8d35a9
x-campaign-type: default
x-transaction-id: 23f7d7e2-362e-4f1b-b211-77adbd4236a3
x-swg-uid: 01-47589dff-c9f6-48a8-837d-444f2d67ecca
X-Mailer: Sweego
Message-ID:
 <1778836825.8631fc262581453bbf619ec5b2062170.19e2aefe501000f373@vates.tech>
x-swg-bid: 1778836825.8631fc262581453bbf619ec5b2062170.19e2aefe501000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 15 May 2026 11:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r0mjTP4Oij12D8dvz8orKq6m"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778836824784
X-purgate-ID: tlsNG-16d1c6/1778836829-8EF89D75-1A762C68/10/73395122804
X-purgate-type: spam
X-purgate-size: 14119
X-Rspamd-Queue-Id: C586C54C4DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:abdelkareem.abdelsaamad@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,suse.com,amd.com,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r0mjTP4Oij12D8dvz8orKq6m
Content-Type: multipart/mixed; boundary="------------aPrWUFvmXbGpjde2gSNJP9CV";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-ID: <d484df63-3106-4328-b5d1-7f8df116105a@vates.tech>
Subject: Re: [PATCH for-4.22 v6] x86/svm: Support vNMI on capable hardware
References: <20260514175623.1869042-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260514175623.1869042-1-andrew.cooper3@citrix.com>

--------------aPrWUFvmXbGpjde2gSNJP9CV
Content-Type: multipart/mixed; boundary="------------a96RPmdQMuETDhowlGMZXEjv"

--------------a96RPmdQMuETDhowlGMZXEjv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTQvMDUvMjAyNiDDoCAxOTo1OSwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBG
cm9tOiBBYmRlbGthcmVlbSBBYmRlbHNhYW1hZCA8YWJkZWxrYXJlZW0uYWJkZWxzYWFtYWRA
Y2l0cml4LmNvbT4NCj4gDQo+IFN0YXJ0aW5nIHdpdGggWmVuNCwgQU1EIENQVXMgY2FuIHZp
cnR1YWxpc2UgTk1JcyBmb3IgYSBndWVzdC4gIE9uIG9sZGVyDQo+IGhhcmR3YXJlLCBkZXRl
cm1pbmluZyB3aGVuIGFuIE5NSSBpcyBzYWZlIHRvIGRlbGl2ZXIgaXMgYSBjaGFsbGVuZ2Ug
YW5kIFhlbg0KPiBkb2VzIG5vdCBoYW5kbGUgYWxsIGNvcm5lciBjYXNlcyBjb3JyZWN0bHku
DQo+IA0KPiBXaXRoIHZOTUksIHRoZXJlIGlzIGFuIGVuYWJsZW1lbnQgYml0IGFuZCB0d28g
bmV3IGJpdHMgb2Ygc3RhdGUgaW4gdGhlIFZNQ0I7IGENCj4gcGVuZGluZyBiaXQsIGFuZCBh
IGJsb2NrZWQgYml0LiAgVGhlc2UgZGlyZWN0bHkgbWFwIHRvIHRoZSBDUFUgc3RhdGUgZm9y
DQo+IGhhbmRsaW5nIE5NSXMsIGFuZCBhcmUgbWFpbnRhaW5lZCBieSBoYXJkd2FyZSBkdXJp
bmcgdGhlIHJ1bm5pbmcgb2YgdGhlIHZDUFUuDQo+IA0KPiBXaGVuIHZOTUkgaXMgZW5hYmxl
ZCwgaGF2ZSBzdm1fe2dldCxzZXR9c2V0X2ludGVycnVwdF9zaGFkb3coKSB3b3JrIGluIHRl
cm1zDQo+IG9mIHRoZSB2bm1pX2Jsb2NraW5nIGJpdCByYXRoZXIgdGhhbiB0aGUgSVJFVCBp
bnRlcmNlcHQuICBUaGlzIGFsbG93cyBhbg0KPiBlbXVsYXRlZCBJUkVUIGluc3RydWN0aW9u
IHRvIHJlLWVuYWJsZSBOTUlzLg0KPiANCj4gV2hlbiBpbmplY3RpbmcgYSBuZXcgTk1JLCBz
aW1wbHkgc2V0IHRoZSB2bm1pX3BlbmRpbmcgYml0OyBoYXJkd2FyZSB3aWxsDQo+IGRlbGl2
ZXIgdGhlIE5NSSB0byB0aGUgZ3Vlc3QgYXQgdGhlIG5leHQgc3VpdGFibGUganVuY3R1cmUu
DQo+IA0KPiBPbmUgY29tcGxpY2F0aW9uIGlzIHRoYXQsIHdoZW4gZGVsaXZlcmluZyBhIHNl
Y29uZCBOTUkgYmVmb3JlIHRoZSBmaXJzdCBoYXMNCj4gY29tcGxldGVkLCB0aGUgbWl4IGJl
dHdlZW4gY29tbW9uIEhWTSBsb2dpYyBhbmQgU1ZNIHNwZWNpZmljIGxvZ2ljIHdpbGwgdHJ5
IHRvDQo+IG9wZW4gYW4gTk1JIHdpbmRvdywgbWFsZnVuY3Rpb25pbmcgYXMgaXQgZG9lcyBz
by4gIFdoZW4gdk5NSSBpcyBlbmFibGVkLCBzaG9ydA0KPiBjaXJjdWl0IHRoaXMgdG8gbm90
IGNvbnNpZGVyIE5NSXMgYmxvY2tlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFiZGVsa2Fy
ZWVtIEFiZGVsc2FhbWFkIDxhYmRlbGthcmVlbS5hYmRlbHNhYW1hZEBjaXRyaXguY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
Q0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzogVGVk
ZHkgQXN0aWUgPHRlZGR5LmFzdGllQHZhdGVzLnRlY2g+DQo+IENDOiBKYXNvbiBBbmRyeXVr
IDxqYXNvbi5hbmRyeXVrQGFtZC5jb20+DQo+IENDOiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVr
c2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4NCj4gDQo+IEZvciA0LjIyLiAgVGhpcyBpcyBzb21l
d2hhdCBvdmVyZHVlIGFuZCBtYWtlcyBhIGNvbmNyZXRlIGltcHJvdmVtZW50IHRvIE5NSQ0K
PiBoYW5kbGluZyBvbiByZWNlbnQgQU1EIGhhcmR3YXJlLg0KPiANCj4gdjY6DQo+ICAgKiBQ
bHVtYiB0aHJvdWdoIHN2bV97Z2V0LHNldH1zZXRfaW50ZXJydXB0X3NoYWRvdygpIHNvIHRo
YXQgZW11bGF0ZWQgSVJFVA0KPiAgICAgd29ya3MsIGFzIHJlcXVlc3RlZCBzZXZlcmFsIHRp
bWVzIGR1cmluZyByZXZpZXcgb2YgZWFybGllciByZXZpc2lvbnMuDQo+ICAgKiBFeHBhbmQg
dGhlIGNvbW1pdCBtZXNzYWdlDQo+IA0KPiBUaGUgIXZOTUkgY2FzZSBpcyBldmVuIG1vcmUg
YnJva2VuIHRoYW4gSSdkIHJlYWxpc2VkLiAgQmVzaWRlcyB0aGUgIndoYXQgaWYNCj4gdGhl
IElSRVQgZmF1bHRzPyIgcHJvYmxlbSwgc3ZtX2VuYWJsZV9pbnRyX3dpbmRvdygpIGJhc2lj
YWxseSBpZ25vcmVzIHRoZSBOTUkNCj4gY2FzZSBhbmQgc2ltcGx5IHJlLWVudGVycyB0aGUg
Vk0uICBUaGlzIGNhdXNlcyB0aGUgcGVuZGluZyBOTUkgdG8gb25seSBiZQ0KPiBpbmplY3Rl
ZCBuZXh0IHRpbWUgdGhlcmUgaXMgYSBWTUV4aXQuDQoNCkRvZXMgdGhhdCBoYXBwZW5zIG9m
dGVuIGluIHByYWN0aWNlID8NCg0KPiAtLS0NCj4gICB4ZW4vYXJjaC94ODYvaHZtL3N2bS9p
bnRyLmMgfCAxOSArKysrKysrKysrKysrKysrKysrDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9z
dm0vc3ZtLmMgIHwgMjMgKysrKysrKysrKysrKysrKystLS0tLS0NCj4gICB4ZW4vYXJjaC94
ODYvaHZtL3N2bS92bWNiLmMgfCAgMiArKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzggaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaHZtL3N2bS9pbnRyLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9pbnRyLmMNCj4g
aW5kZXggNjQ1M2E0NmI4NTA4Li5jZjA2MjFkMmY2MjggMTAwNjQ0DQo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL2ludHIuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9p
bnRyLmMNCj4gQEAgLTMzLDYgKzMzLDEyIEBAIHN0YXRpYyB2b2lkIHN2bV9pbmplY3Rfbm1p
KHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICB1MzIgZ2VuZXJhbDFfaW50ZXJjZXB0cyA9IHZt
Y2JfZ2V0X2dlbmVyYWwxX2ludGVyY2VwdHModm1jYik7DQo+ICAgICAgIGludGluZm9fdCBl
dmVudDsNCj4gICANCj4gKyAgICBpZiAoIHZtY2ItPl92aW50ci5maWVsZHMudm5taV9lbmFi
bGUgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgdm1jYi0+X3ZpbnRyLmZpZWxkcy52bm1pX3Bl
bmRpbmcgPSB0cnVlOw0KPiArICAgICAgICByZXR1cm47DQo+ICsgICAgfQ0KPiArDQo+ICAg
ICAgIGV2ZW50LnJhdyA9IDA7DQo+ICAgICAgIGV2ZW50LnYgPSB0cnVlOw0KPiAgICAgICBl
dmVudC50eXBlID0gWDg2X0VUX05NSTsNCj4gQEAgLTE0Miw2ICsxNDgsMTkgQEAgdm9pZCBh
c21saW5rYWdlIHN2bV9pbnRyX2Fzc2lzdCh2b2lkKQ0KPiAgICAgICAgICAgICAgIHJldHVy
bjsNCj4gICANCj4gICAgICAgICAgIGludGJsayA9IGh2bV9pbnRlcnJ1cHRfYmxvY2tlZCh2
LCBpbnRhY2spOw0KPiArDQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIFdoZW4gdk5N
SSBpcyBhY3RpdmUsIE5NSXMgY2FuIGJlIGluamVjdGVkIGJ5IHNldHRpbmcgdm5taV9wZW5k
aW5nDQo+ICsgICAgICAgICAqIGFuZCBoYXJkd2FyZSB3aWxsIGRlbGl2ZXIgdGhlbSBhdCB0
aGUgbmV4dCBhcHByb3ByaWF0ZSBvcHBvcnR1bml0eS4NCj4gKyAgICAgICAgICogQ29uc2lk
ZXIgdGhlbSBub3QgYmxvY2tlZCwgdG8gYXZvaWQgdHJ5aW5nIHRvIG9wZW4gYW4gTk1JIFdp
bmRvdy4NCj4gKyAgICAgICAgICoNCj4gKyAgICAgICAgICogQ29ycmVjdG5lc3MgaGVyZSBy
ZWxpZXMgb24gdGhlIGZhY3QgdGhhdCBhbGwgdk5NSSBjYXBhYmxlIGhhcmR3YXJlDQo+ICsg
ICAgICAgICAqIGhhcyB2R0lGLCBhbmQgdkdJRiBpcyBhbHdheXMgYWN0aXZhdGVkIHdoZW4g
YXBwcm9wcmlhdGUuDQo+ICsgICAgICAgICAqLw0KPiArICAgICAgICBpZiAoIGludGJsayA9
PSBodm1faW50YmxrX25taV9pcmV0ICYmDQo+ICsgICAgICAgICAgICAgdm1jYi0+X3ZpbnRy
LmZpZWxkcy52bm1pX2VuYWJsZSApDQo+ICsgICAgICAgICAgICBpbnRibGsgPSBodm1faW50
YmxrX25vbmU7DQo+ICsNCj4gICAgICAgICAgIGlmICggaW50YmxrID09IGh2bV9pbnRibGtf
c3ZtX2dpZiApDQo+ICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgQVNTRVJUKG5lc3Rl
ZGh2bV9lbmFibGVkKHYtPmRvbWFpbikpOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYw0KPiBpbmRleCBm
NDlkMmViYmZkZDUuLjQ5ZmNkZDkwNmNmOCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9zdm0vc3ZtLmMNCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4g
QEAgLTQ5OSw3ICs0OTksOSBAQCBzdGF0aWMgdW5zaWduZWQgY2ZfY2hlY2sgaW50IHN2bV9n
ZXRfaW50ZXJydXB0X3NoYWRvdyhzdHJ1Y3QgdmNwdSAqdikNCj4gICAgICAgaWYgKCB2bWNi
LT5pbnRfc3RhdC5pbnRyX3NoYWRvdyApDQo+ICAgICAgICAgICBpbnRyX3NoYWRvdyB8PSBI
Vk1fSU5UUl9TSEFET1dfTU9WX1NTIHwgSFZNX0lOVFJfU0hBRE9XX1NUSTsNCj4gICANCj4g
LSAgICBpZiAoIHZtY2JfZ2V0X2dlbmVyYWwxX2ludGVyY2VwdHModm1jYikgJiBHRU5FUkFM
MV9JTlRFUkNFUFRfSVJFVCApDQo+ICsgICAgaWYgKCB2bWNiLT5fdmludHIuZmllbGRzLnZu
bWlfZW5hYmxlDQo+ICsgICAgICAgICA/IHZtY2ItPl92aW50ci5maWVsZHMudm5taV9ibG9j
a2luZw0KPiArICAgICAgICAgOiAodm1jYl9nZXRfZ2VuZXJhbDFfaW50ZXJjZXB0cyh2bWNi
KSAmIEdFTkVSQUwxX0lOVEVSQ0VQVF9JUkVUKSApDQo+ICAgICAgICAgICBpbnRyX3NoYWRv
dyB8PSBIVk1fSU5UUl9TSEFET1dfTk1JOw0KPiAgIA0KPiAgICAgICByZXR1cm4gaW50cl9z
aGFkb3c7DQo+IEBAIC01MDksMTUgKzUxMSwyMyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBz
dm1fc2V0X2ludGVycnVwdF9zaGFkb3coDQo+ICAgICAgIHN0cnVjdCB2Y3B1ICp2LCB1bnNp
Z25lZCBpbnQgaW50cl9zaGFkb3cpDQo+ICAgew0KPiAgICAgICBzdHJ1Y3Qgdm1jYl9zdHJ1
Y3QgKnZtY2IgPSB2LT5hcmNoLmh2bS5zdm0udm1jYjsNCj4gLSAgICB1MzIgZ2VuZXJhbDFf
aW50ZXJjZXB0cyA9IHZtY2JfZ2V0X2dlbmVyYWwxX2ludGVyY2VwdHModm1jYik7DQo+ICsg
ICAgYm9vbCBibG9ja19ubWkgPSBpbnRyX3NoYWRvdyAmIEhWTV9JTlRSX1NIQURPV19OTUk7
DQo+ICAgDQo+ICAgICAgIHZtY2ItPmludF9zdGF0LmludHJfc2hhZG93ID0NCj4gICAgICAg
ICAgICEhKGludHJfc2hhZG93ICYgKEhWTV9JTlRSX1NIQURPV19NT1ZfU1N8SFZNX0lOVFJf
U0hBRE9XX1NUSSkpOw0KPiAgIA0KPiAtICAgIGdlbmVyYWwxX2ludGVyY2VwdHMgJj0gfkdF
TkVSQUwxX0lOVEVSQ0VQVF9JUkVUOw0KPiAtICAgIGlmICggaW50cl9zaGFkb3cgJiBIVk1f
SU5UUl9TSEFET1dfTk1JICkNCj4gLSAgICAgICAgZ2VuZXJhbDFfaW50ZXJjZXB0cyB8PSBH
RU5FUkFMMV9JTlRFUkNFUFRfSVJFVDsNCj4gLSAgICB2bWNiX3NldF9nZW5lcmFsMV9pbnRl
cmNlcHRzKHZtY2IsIGdlbmVyYWwxX2ludGVyY2VwdHMpOw0KPiArICAgIGlmICggdm1jYi0+
X3ZpbnRyLmZpZWxkcy52bm1pX2VuYWJsZSApDQo+ICsgICAgICAgIHZtY2ItPl92aW50ci5m
aWVsZHMudm5taV9ibG9ja2luZyA9IGJsb2NrX25taTsNCj4gKyAgICBlbHNlDQo+ICsgICAg
ew0KPiArICAgICAgICB1aW50MzJfdCBnZW4xID0gdm1jYl9nZXRfZ2VuZXJhbDFfaW50ZXJj
ZXB0cyh2bWNiKTsNCj4gKw0KPiArICAgICAgICBnZW4xICY9IH5HRU5FUkFMMV9JTlRFUkNF
UFRfSVJFVDsNCj4gKyAgICAgICAgaWYgKCBibG9ja19ubWkgKQ0KPiArICAgICAgICAgICAg
Z2VuMSB8PSBHRU5FUkFMMV9JTlRFUkNFUFRfSVJFVDsNCj4gKw0KPiArICAgICAgICB2bWNi
X3NldF9nZW5lcmFsMV9pbnRlcmNlcHRzKHZtY2IsIGdlbjEpOw0KPiArICAgIH0NCj4gICB9
DQo+ICAgDQo+ICAgc3RhdGljIGludCBjZl9jaGVjayBzdm1fZ3Vlc3RfeDg2X21vZGUoc3Ry
dWN0IHZjcHUgKnYpDQo+IEBAIC0yNDYwLDYgKzI0NzAsNyBAQCBjb25zdCBzdHJ1Y3QgaHZt
X2Z1bmN0aW9uX3RhYmxlICogX19pbml0IHN0YXJ0X3N2bSh2b2lkKQ0KPiAgICAgICBQKGNw
dV9oYXNfdHNjX3JhdGlvLCAiVFNDIFJhdGUgTVNSIik7DQo+ICAgICAgIFAoY3B1X2hhc19z
dm1fc3NzLCAiTlBUIFN1cGVydmlzb3IgU2hhZG93IFN0YWNrIik7DQo+ICAgICAgIFAoY3B1
X2hhc19zdm1fc3BlY19jdHJsLCAiTVNSX1NQRUNfQ1RSTCB2aXJ0dWFsaXNhdGlvbiIpOw0K
PiArICAgIFAoY3B1X2hhc19zdm1fdm5taSwgIlZpcnR1YWwgTk1JIik7DQo+ICAgICAgIFAo
Y3B1X2hhc19zdm1fYnVzX2xvY2ssICJCdXMgTG9jayBGaWx0ZXIiKTsNCj4gICAjdW5kZWYg
UA0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jDQo+IGluZGV4IDUxNGU1MzBjYmRhNy4uOTc1
YTFlYWVmODA2IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMN
Cj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jDQo+IEBAIC0xODUsNiArMTg1
LDggQEAgc3RhdGljIGludCBjb25zdHJ1Y3Rfdm1jYihzdHJ1Y3QgdmNwdSAqdikNCj4gICAg
ICAgaWYgKCBkZWZhdWx0X3hlbl9zcGVjX2N0cmwgPT0gU1BFQ19DVFJMX1NUSUJQICkNCj4g
ICAgICAgICAgIHYtPmFyY2gubXNycy0+c3BlY19jdHJsLnJhdyA9IFNQRUNfQ1RSTF9TVElC
UDsNCj4gICANCj4gKyAgICB2bWNiLT5fdmludHIuZmllbGRzLnZubWlfZW5hYmxlID0gY3B1
X2hhc19zdm1fdm5taTsNCj4gKw0KPiAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+ICAgDQoN
ClJldmlld2VkLWJ5OiBUZWRkeSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCg0K
VGVkZHkNCg==
--------------a96RPmdQMuETDhowlGMZXEjv
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------a96RPmdQMuETDhowlGMZXEjv--

--------------aPrWUFvmXbGpjde2gSNJP9CV--

--------------r0mjTP4Oij12D8dvz8orKq6m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoG5VgFAwAAAAAACgkQZg+p0QLLz9Ax
eQv/axP+SAXwNFGEqQMn8UmED/QyIxn3EKZEc/TAuR5fcLtNKxO0onkkgIcxRDYQaqBVkjSXUDoS
VWAGs3CCDmcWpFgwl/tix/BuGpmNXS3aOH687dx092nxMWM2rsAPew3AsM6QKgebd6kOjSUaSzpi
tuv2Y+gxnlYXAWUNfp8S1A9sYWSe7rbWnITKJTC5YycdQZ0FUYiuMwib6tIzjw421hRahEQpDOC6
HpAmxdYmGGTHzN7Lgh3hJi/ldEZJhpN9SBzqlj+45SuZD45Z6BECJUktqB6L2epZvLiphpv0+CfS
UXDcqrCzg7zKDke7gGy7q5NR1MlOX+FgyzmHtfqzp666ocLUJ+0+HCZK7BEgodWR7ZLDlTQXGINL
1R65hq6Hxz25P5uv5JdiJJ6p2Ko8AHlsJ2fFCNmqEFLCmBkPTT3HPX4Jy3QV5IVWQgvWj25rUeYZ
ITpvix/DAUxLYhgzyE7jp7bNt0EB92hQF4IliDz5yOpZ4mOvUm1fJiPU8eTW
=tQ4B
-----END PGP SIGNATURE-----

--------------r0mjTP4Oij12D8dvz8orKq6m--

