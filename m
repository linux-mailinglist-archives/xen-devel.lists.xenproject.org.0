Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z/eRDpWVV2rqXQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 16:13:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8039775F37A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 16:13:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=gasfKqRr;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1363172.1614967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk0ML-0004de-NG; Wed, 15 Jul 2026 14:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363172.1614967; Wed, 15 Jul 2026 14:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wk0ML-0004ax-KQ; Wed, 15 Jul 2026 14:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1363172;
 Wed, 15 Jul 2026 14:13:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5@swg.vates.tech>)
 id 1wk0MJ-0004ar-EX
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 14:13:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wk0MI-004ew5-HD
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 16:13:10 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5@swg.vates.tech>)
 id 6a57956e-2eae-0a2a0a5409dd-0a2a45019480-26
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:13:10 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5@swg.vates.tech>)
 id 6a579576-5984-0a2a45010019-b9ff1c23a40d-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 16:13:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f661fca07000edb5.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 15 Jul 2026 14:13:07 +0000
Received: from [192.168.1.18] (88-188-240-210.subs.proxad.net [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 610DA81249;
 Wed, 15 Jul 2026 16:13:06 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Q9qauY3ho6sJnRDPNz/jMN5ThLRSFlnuw0AByOcUJcI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=gasfKqRrAeOx1FMmy3A5PFOnDIeZc4orV7JbmGiCKw8rBD3KWcZkEvHaUIBlx7IuJahax66MR
 +gKGQTE137KujNMXqTmd37OSvv48NFBBzZdSVu/K1dEFRJNNurRbsTz1HJ521k+A5OIPGy1hrxw
 B1rlvbWEc6rRcyu/DvulgKN0yspoXqcriXXkxD5TPx3xhzAERncfBH2+BXpsKjcRLn5mf5Fsabf
 wmU7Ya2uBsVaAEdAuCDdPmtYJuNTH4jbiNkugOUzoVomlbMk+e9u62lBVKMVU/e5kpaFuOxq8Vj
 IClszsVXOZmgIkUiKeCD0Kz5dUtQwJxOntb0r1m2nIeA==
X-Zone-Loop: cf5e1f497c2203f6f560e0ba82455f607a6043557858
x-campaign-type: default
x-transaction-id: cb49ed01-d055-496f-afad-b660d3f510ca
x-swg-uid: 01-9247d8f8-0de6-435e-ae2f-698b353357c0
X-Mailer: Sweego
Message-ID:
 <1784124787.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5@vates.tech>
x-swg-bid: 1784124787.8631fc262581453bbf619ec5b2062170.19f661fca07000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 15 Jul 2026 16:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v1] nSVM: Check injected event consistency
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jason.andryuk@amd.com
References: <d01b3d5327ace27ca9d81244a168ba2ab6ed094d.1784121738.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-US
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <d01b3d5327ace27ca9d81244a168ba2ab6ed094d.1784121738.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------60ZWhcN7zupjno80KU5Jtiwp"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784124786559
X-purgate-ID: tlsNG-d62444/1784124790-1D272757-5BFC3915/0/0
X-purgate-type: clean
X-purgate-size: 12763
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:url,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:from_smtp,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 8039775F37A
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------60ZWhcN7zupjno80KU5Jtiwp
Content-Type: multipart/mixed; boundary="------------h2Sx1g2IltcWKVBavcda0k2E";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 jason.andryuk@amd.com
Message-ID: <8bf25049-9495-4a55-9d54-4f80640edd53@vates.tech>
Subject: Re: [PATCH v1] nSVM: Check injected event consistency
References: <d01b3d5327ace27ca9d81244a168ba2ab6ed094d.1784121738.git.abdelkareem.abdelsaamad@citrix.com>
In-Reply-To: <d01b3d5327ace27ca9d81244a168ba2ab6ed094d.1784121738.git.abdelkareem.abdelsaamad@citrix.com>

--------------h2Sx1g2IltcWKVBavcda0k2E
Content-Type: multipart/mixed; boundary="------------W67H0MV36qWcWdrxGKytoLnw"

--------------W67H0MV36qWcWdrxGKytoLnw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMTUvMDcvMjAyNiDDoCAxNTozOSwgQWJkZWxrYXJlZW0gQWJkZWxzYWFtYWQgYSDDqWNy
aXTCoDoNCj4gT24gdGhlIEFNRCBwbGF0Zm9ybXMsIGFsbG93aW5nIGEgVk1SVU4gaW5zdHJ1
Y3Rpb24gd2l0aCBhIG1hbGZvcm1lZCBWTUNCIGhhcw0KPiBkZWJ1Z2dpbmcgY29tcGxpY2F0
aW9ucywgc2VjdXJpdHkgYW5kIHBlcmZvcm1hbmNlIGltcGxpY2F0aW9ucy4gVGhlIEFQTSB2
b2x1bWUNCj4gMiAxNS4yMCBbMV0gc3RhdGVzIHR3byBwb3NzaWJpbGl0aWVzIHRoYXQgcmVz
dWx0IGluIGEgVk1SVU4gZXhpdCB3aXRoDQo+IFZNRVhJVF9JTlZBTElEIGR1ZSB0byBpbmpl
Y3RlZCBldmVudHMuIFRoZXNlIGFyZSBlaXRoZXINCj4g4oCiIFJlc2VydmVkIHZhbHVlcyBv
ZiBUWVBFIGhhdmUgYmVlbiBzcGVjaWZpZWQuDQo+IOKAoiBUWVBFID0gMyAoZXhjZXB0aW9u
KSBoYXMgYmVlbiBzcGVjaWZpZWQgd2l0aCBhIHZlY3RvciB0aGF0IGRvZXMgbm90DQo+ICAg
IGNvcnJlc3BvbmQgdG8gYW4gZXhjZXB0aW9uICh0aGlzIGluY2x1ZGVzIHZlY3RvciAyLCB3
aGljaCBpcyBhbiBOTUksIG5vdA0KPiAgICBhbiBleGNlcHRpb24pLg0KPiBFeHRlbmQgdGhl
IFZNQ0IgY2hlY2tzIHRvIGNoZWNrIGZvciBzdWNoIGluY29uc2lzdGVuY3kuDQo+IA0KPiBU
aGUgY29sbGVjdGlvbiBvZiB0aGUgaW52YWxpZCBleGNlcHRpb24gdmVjdG9ycyBhcmUgcGlj
a2VkIGZyb20gdGhlIHVwc3RyZWFtIEtWTQ0KPiBjb21taXQgKCI3ZTc5ZjcxYmNhNWMiIEtW
TTogblNWTTogQWRkIG1pc3NpbmcgY29uc2lzdGVuY3kgY2hlY2sgZm9yIEVWRU5USU5KKS4N
Cj4gDQo+IFsxXSBodHRwczovL2RvY3MuYW1kLmNvbS92L3UvZW4tVVMvMjQ1OTNfMy40NF9B
UE1fVm9sMg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWJkZWxrYXJlZW0gQWJkZWxzYWFtYWQg
PGFiZGVsa2FyZWVtLmFiZGVsc2FhbWFkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBUZXN0aW5n
Og0KPiAgIC0gVXNpbmcgYSBsb2NhbGx5IGRldmVsb3BlZCBYVEYgbmVzdGVkIHZpcnQgc2V0
dXAsIEkgbWFudWFsbHkgdGVzdGVkIFZNUlVODQo+ICAgICBpbnN0cnVjdGlvbiBoYW5kbGlu
ZyB3aXRoIGEgbWFsZm9ybWVkIFZNQ0I6DQo+ICAgICAxKSBJbmplY3QgZXZlbnQgd2l0aCB0
aGUgdHlwZSAoNykuDQo+ICAgICAgICBUaGUgaHlwZXJ2aXNvciBsb2dzIHNob3cgdGhlIG1l
c3NhZ2UNCj4gICAgICAgIChYRU4pIFsgIDY0NS4xNTU2MDldIGQydjBbbnN2bV92bWNiX3By
ZXBhcmU0dm1ydW5dOiBldmVudGluajogSW52YWxpZCBJbmplY3RlZA0KPiAgICAgICAgICAg
ICAgRXZlbnQgVHlwZTogKDB4NykNCj4gICAgIDIpIEluamVjdCBldmVudCB3aXRoIHRoZSBl
eGNlcHRpb24gdmFsdWUgKDMpIGFuZCB0aGUgdmVjdG9yIHZhbHVlICgyKSBmb3IgTk1JLg0K
PiAgICAgICAgVGhlIGh5cGVydmlzb3IgbG9ncyBzaG93IHRoZSBtZXNzYWdlDQo+ICAgICAg
ICAoWEVOKSBbICA2NDUuMTU3Mjc3XSBkMnYwW25zdm1fdm1jYl9wcmVwYXJlNHZtcnVuXTog
ZXZlbnRpbmo6IEludmFsaWQgSW5qZWN0ZWQgRXZlbnQuDQo+ICAgICAgICAgICAgICAgRXhj
ZXB0aW9uIHR5cGU6ICgweDMpLCB3aXRoIGEgdmVjdG9yOiAoMHgyKSBkb2VzIG5vdCBiZWxv
bmcgdG8gYW4gZXhjZXB0aW9uDQo+IA0KPiAgIC0gQ0kgdGVzdHM6DQo+IGh0dHBzOi8vZ2l0
bGFiLmNvbS94ZW4tcHJvamVjdC9wZW9wbGUvYWFiZGVsc2EveGVuLy0vcGlwZWxpbmVzLzI2
Nzg2MjkyNzANCj4gLS0tDQo+ICAgeGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jIHwgMzYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgeGVuL2FyY2gveDg2
L2h2bS9zdm0vdm1jYi5oIHwgIDMgKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1j
Yi5jIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5jDQo+IGluZGV4IDk3NWExZWFlZjgu
LjFjYTg0NzQ5NTggMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3ZtY2Iu
Yw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmMNCj4gQEAgLTMyMCw2ICsz
MjAsMzEgQEAgdm9pZCBzdm1fdm1jYl9kdW1wKGNvbnN0IGNoYXIgKmZyb20sIGNvbnN0IHN0
cnVjdCB2bWNiX3N0cnVjdCAqdm1jYikNCj4gICAgICAgc3ZtX2R1bXBfc2VsKCIgIFRSIiwg
JnZtY2ItPnRyKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgYm9vbCBpc192YWxpZF9zdm1f
dm1jYl9pbmplY3RlZF9leGNlcHRpb25fdmVjdG9yKA0KPiArICAgIGNvbnN0IHN0cnVjdCB2
bWNiX3N0cnVjdCAqdm1jYiwgdWludDhfdCB2bWNiX2luamVjdGVkX3ZlY3RvcikNCj4gK3sN
Cj4gKyAgICByZXR1cm4gKCAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19ERSkg
fHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19E
QikgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VY
Q19CUCkgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2
X0VYQ19PRikgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0g
WDg2X0VYQ19CUikgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3Ig
PT0gWDg2X0VYQ19VRCkgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0
b3IgPT0gWDg2X0VYQ19OTSkgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92
ZWN0b3IgPT0gWDg2X0VYQ19ERikgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3Rl
ZF92ZWN0b3IgPT0gWDg2X0VYQ19UUykgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9pbmpl
Y3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19OUCkgfHwNCj4gKyAgICAgICAgICAgICAodm1jYl9p
bmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19TUykgfHwNCj4gKyAgICAgICAgICAgICAodm1j
Yl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19HUCkgfHwNCj4gKyAgICAgICAgICAgICAo
dm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19QRikgfHwNCj4gKyAgICAgICAgICAg
ICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19NRikgfHwNCj4gKyAgICAgICAg
ICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19BQykgfHwNCj4gKyAgICAg
ICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19NQykgfHwNCj4gKyAg
ICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19YTSkgfHwNCj4g
KyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19IVikgfHwN
Cj4gKyAgICAgICAgICAgICAodm1jYl9pbmplY3RlZF92ZWN0b3IgPT0gWDg2X0VYQ19TWCkg
fHwNCj4gKyAgICAgICAgICAgICAodm1jYl9nZXRfc2V2X2VzKHZtY2IpICYmIHZtY2JfaW5q
ZWN0ZWRfdmVjdG9yID09IFg4Nl9FWENfVkMpICk7DQoNCkknbSBub3Qgc3VyZSB0aGF0ICNW
QyBpcyBnYXRlZCBiZWhpbmQgU0VWLUVTIGd1ZXN0Lg0KDQpSZWdhcmRsZXNzLCBpbmplY3Rp
bmcgbWFudWFsbHkgI1ZDIGlzIHdlaXJkIChlc3BlY2lhbGx5IGZvciBTRVYtRVMgDQpndWVz
dHMgd2hlcmUgaXQncyBzdHJvbmdseSBkaXNjb3VyYWdlZCksIGJ1dCBpdCBjb3VsZCBiZSBz
b21ld2hhdCBhYnVzZWQgDQp0byBlbXVsYXRlIHNvbWUgb2YgdGhlIFNFVi1FUyBzZW1hbnRp
Y3MuIFNvIEkgd291bGQgc3VnZ2VzdCB0byB0aHJlYXQgaXQgDQpsaWtlIHRoZSBvdGhlcnMu
DQoNCj4gK30NCj4gKw0KPiAgIGJvb2wgc3ZtX3ZtY2JfaXN2YWxpZCgNCj4gICAgICAgY29u
c3QgY2hhciAqZnJvbSwgY29uc3Qgc3RydWN0IHZtY2Jfc3RydWN0ICp2bWNiLCBjb25zdCBz
dHJ1Y3QgdmNwdSAqdiwNCj4gICAgICAgYm9vbCB2ZXJib3NlKQ0KPiBAQCAtMzMwLDYgKzM1
NSw4IEBAIGJvb2wgc3ZtX3ZtY2JfaXN2YWxpZCgNCj4gICAgICAgdW5zaWduZWQgbG9uZyBj
cjQgPSB2bWNiX2dldF9jcjQodm1jYik7DQo+ICAgICAgIHVuc2lnbmVkIGxvbmcgdmFsaWQ7
DQo+ICAgICAgIHVpbnQ2NF90IGVmZXIgPSB2bWNiX2dldF9lZmVyKHZtY2IpOw0KPiArICAg
IHVpbnQ4X3Qgdm1jYl9pbmplY3RlZF90eXBlID0gdm1jYi0+ZXZlbnRfaW5qLnR5cGUgJiBT
Vk1fRVZFTlRfSU5KX1RZUEVfTUFTSzsNCj4gKyAgICB1aW50OF90IHZtY2JfaW5qZWN0ZWRf
dmVjdG9yID0gdm1jYi0+ZXZlbnRfaW5qLnZlY3RvciAmIFNWTV9FVkVOVF9JTkpfVkVDX01B
U0s7DQoNCldoYXQgYXJlIHRoZXNlIG1hc2tzIGZvciA/DQoNClRoZSBkZWZpbml0aW9uIG9m
IHZtY2ItPmV2ZW50X2luaiBzdWdnZXN0IHRoYXQgdGhleSBhcmUgbm90IHJlcXVpcmVkDQog
PiB1aW50OF90ICB2ZWN0b3I7DQogPiB1aW50OF90ICB0eXBlOjM7DQoNCj4gICANCj4gICAj
ZGVmaW5lIFBSSU5URihmbXQsIGFyZ3MuLi4pIGRvIHsgXA0KPiAgICAgICBpZiAoICF2ZXJi
b3NlICkgcmV0dXJuIHRydWU7IFwNCj4gQEAgLTM5Miw2ICs0MTksMTUgQEAgYm9vbCBzdm1f
dm1jYl9pc3ZhbGlkKA0KPiAgICAgICAgICAgUFJJTlRGKCJldmVudGluajogTUJaIGJpdHMg
YXJlIHNldCAoJSMiUFJJeDY0IilcbiIsDQo+ICAgICAgICAgICAgICAgICAgdm1jYi0+ZXZl
bnRfaW5qLnJhdyk7DQo+ICAgDQo+ICsgICAgaWYgKCB2bWNiX2luamVjdGVkX3R5cGUgPiBY
ODZfRVRfU1dfSU5UICkNCj4gKyAgICAgICAgUFJJTlRGKCJldmVudGluajogSW52YWxpZCBJ
bmplY3RlZCBFdmVudCBUeXBlOiAoJSMiUFJJeDgiKVxuIiwNCj4gKyAgICAgICAgICAgICAg
IHZtY2JfaW5qZWN0ZWRfdHlwZSk7DQoNCldoYXQgYWJvdXQgdm1jYl9pbmplY3RlZF90eXBl
ID09IDEgY2FzZSA/DQoNCj4gKw0KPiArICAgIGlmICggKHZtY2JfaW5qZWN0ZWRfdHlwZSA9
PSBYODZfRVRfSFdfRVhDKSAmJg0KPiArICAgICAgICAgIWlzX3ZhbGlkX3N2bV92bWNiX2lu
amVjdGVkX2V4Y2VwdGlvbl92ZWN0b3Iodm1jYiwgdm1jYl9pbmplY3RlZF92ZWN0b3IpICkN
Cj4gKyAgICAgICAgUFJJTlRGKCJldmVudGluajogSW52YWxpZCBJbmplY3RlZCBFdmVudC4g
RXhjZXB0aW9uIHR5cGU6ICglIyJQUkl4OCIpLCINCj4gKyAgICAgICAgICAgICAgICIgd2l0
aCBhIHZlY3RvcjogKCUjIlBSSXg4IikgZG9lcyBub3QgYmVsb25nIHRvIGFuIGV4Y2VwdGlv
blxuIiwNCj4gKyAgICAgICAgICAgICAgIHZtY2JfaW5qZWN0ZWRfdHlwZSwgdm1jYl9pbmpl
Y3RlZF92ZWN0b3IpOw0KPiAgICN1bmRlZiBQUklOVEYNCj4gICAgICAgcmV0dXJuIHJldDsN
Cj4gICB9DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmggYi94
ZW4vYXJjaC94ODYvaHZtL3N2bS92bWNiLmgNCj4gaW5kZXggMTNjY2ZkM2ZmOS4uM2MyMjA5
NWRiMSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vdm1jYi5oDQo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3ZtY2IuaA0KPiBAQCAtMzA2LDYgKzMwNiw5IEBA
IGVudW0NCj4gICAgICAgVExCX0NUUkxfRkxVU0hfQVNJRF9OT05HTE9CQUwgPSA3LA0KPiAg
IH07DQo+ICAgDQo+ICsjZGVmaW5lIFNWTV9FVkVOVF9JTkpfVkVDX01BU0sgICAgIDB4ZmYN
Cj4gKyNkZWZpbmUgU1ZNX0VWRU5UX0lOSl9UWVBFX01BU0sgICAgMHg3DQo+ICsNCj4gICB0
eXBlZGVmIHVuaW9uDQo+ICAgew0KPiAgICAgICBzdHJ1Y3QNCg0KVGVkZHkNCg==
--------------W67H0MV36qWcWdrxGKytoLnw
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------W67H0MV36qWcWdrxGKytoLnw--

--------------h2Sx1g2IltcWKVBavcda0k2E--

--------------60ZWhcN7zupjno80KU5Jtiwp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmpXlXIFAwAAAAAACgkQZg+p0QLLz9DK
1Qv/dYmyNfXZFuKDYdFqRbSdOQ8v8KTnhYz3s+vl8GHD6wZyiIT/faKDJOmC25SMicGDZq6fb1wE
4U+Hu5Rrm+VIYVj6imeKpspbeYZTdzLdxvT3epWg/7wIkGQ3T5arPsawQOqWM2z89FnTuCbIxR4/
bMva2/dJlDLVCqPzcwUzh1g+rKbTpIEeSCrRjDIAxslM6OT523MuqIC9XZbwBR8SMHokk4Uokyza
zU96Qa5MfLz2HQkjc6CWzuDGFwDJUc65qFg5boSSBLJvraywDUzBCaCWyn2RR33aaUiDlxXf40x+
j2XxNM+7GU6ucLNXGSM9RGqphD1WjcuTBaYlt2Ul/LCPEz6JO2OUC67mts+H9aemC8c7UA6rQqpl
9zhdxt3E3RYG52pp4OHUNukL4n4gb3kNxxQxncHFXvjCd6CwiOovNvnnQJ/FGtNW56Bs12UvyeTS
Cao6GVnft4JJLD1w+JyP8ef57/XTj902zlXL0IU4pffxJ3WFqnvOqSScrNET
=p93U
-----END PGP SIGNATURE-----

--------------60ZWhcN7zupjno80KU5Jtiwp--

