Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C0855E6D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 10:42:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681448.1060216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYG7-0001oG-9U; Thu, 15 Feb 2024 09:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681448.1060216; Thu, 15 Feb 2024 09:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYG7-0001lT-61; Thu, 15 Feb 2024 09:42:23 +0000
Received: by outflank-mailman (input) for mailman id 681448;
 Thu, 15 Feb 2024 09:42:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raYG5-0001lN-Uc
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 09:42:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82ef9500-cbe6-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 10:42:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB46321E57;
 Thu, 15 Feb 2024 09:42:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB88B13A82;
 Thu, 15 Feb 2024 09:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 33ROKHrczWUSHgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 09:42:18 +0000
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
X-Inumbo-ID: 82ef9500-cbe6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707990139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Cj6pyE1GOQTLeuJaj/AA8G4xHFwLkvXX3uxItvYzY70=;
	b=ptMv9f9mFBY4nrtkIHDn3aWPUfw3uIsC5MN019rwPuM5rwOhYPmLovY8TX89hVMxB8mw7S
	Ry3mYbFy8Xk57yklsZEk/Ahot6MRr6jBkP8HIkizewfA9dgtj6UeVhdXthdiUmC5ZDwTrU
	YADPOEd7+XDsTIhDET7nbi3bMJTydec=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707990138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Cj6pyE1GOQTLeuJaj/AA8G4xHFwLkvXX3uxItvYzY70=;
	b=B91IJ2GWSeduvClHEx61LZ9CoOiNXNpTcmhZ1A7cB9GbiIDAis6Kqf9PXryuK/NeO/L8Tk
	6EHd4JN8CEHa5bZSOcmOknFWgcKKzAAlq+P+GYu9elm0qKUkgwdDlvx309RBt6NWGbV/ep
	IzGghHxLwMncMa5B3g+7hWf479HQxB8=
Message-ID: <3261b14b-bce1-4aa5-bb61-a25930fca133@suse.com>
Date: Thu, 15 Feb 2024 10:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/21] tools/xl: support new 9pfs backend xen_9pfsd
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240215065541.21067-1-jgross@suse.com>
 <20240215065541.21067-16-jgross@suse.com>
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
In-Reply-To: <20240215065541.21067-16-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p0I55L4PbTadoXKUmMCzhEap"
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=B91IJ2GW
X-Spamd-Result: default: False [-4.20 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DB46321E57
X-Spam-Level: 
X-Spam-Score: -4.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p0I55L4PbTadoXKUmMCzhEap
Content-Type: multipart/mixed; boundary="------------4sYac0mFmWSHsk0WeNADZmYl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <3261b14b-bce1-4aa5-bb61-a25930fca133@suse.com>
Subject: Re: [PATCH v6 15/21] tools/xl: support new 9pfs backend xen_9pfsd
References: <20240215065541.21067-1-jgross@suse.com>
 <20240215065541.21067-16-jgross@suse.com>
In-Reply-To: <20240215065541.21067-16-jgross@suse.com>

--------------4sYac0mFmWSHsk0WeNADZmYl
Content-Type: multipart/mixed; boundary="------------rG5Sd0bq0obQ5zm70O0ZQ86d"

--------------rG5Sd0bq0obQ5zm70O0ZQ86d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjQgMDc6NTUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEFkZCBzdXBwb3J0
IGZvciB0aGUgbmV3IDlwZnMgYmFja2VuZCAieGVuXzlwZnNkIi4gRm9yIHRoaXMgYmFja2Vu
ZCB0eXBlDQo+IHRoZSB0YWcgZGVmYXVsdHMgdG8gIlhlbiIgYW5kIHRoZSBob3N0IHNpZGUg
cGF0aCB0bw0KPiAiL3Zhci9sb2cveGVuL2d1ZXN0cy88ZG9tLW5hbWU+Ii4NCj4gDQo+IERv
IG1vc3Qgb2YgdGhlIGRlZmF1bHQgc2V0dGluZ3MgaW4gbGlieGwuIFVuZm9ydHVuYXRlbHkg
dGhlIGRlZmF1bHQNCj4gcGF0aCBjYW4ndCBlYXNpbHkgYmUgc2V0IGluIGxpYnhsLCBhcyB0
aGUgZG9tYWluIG5hbWUgaXNuJ3QgYXZhaWxhYmxlDQo+IGluIHRoZSByZWxhdGVkIDlwZnMg
c3BlY2lmaWMgZnVuY3Rpb24uDQo+IA0KPiBTZXR0aW5ncyB0aGUgZGVmYXVsdHMgaW4gbGli
eGwgcmVxdWlyZXMgdG8gbW92ZSB0aGUgc2FuaXR5IGNoZWNraW5nDQo+IG9mIDlwZnMgcGFy
YW1ldGVycyBmcm9tIHhsIHRvIGxpYnhsLCB0b28uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFJldmlld2VkLWJ5OiBKYXNvbiBB
bmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+DQoNClNvcnJ5IEFudGhvbnksIGp1c3QgZm91
bmQgeW91ciBSLWI6IGluIG15IHNwYW0gZm9sZGVyIDotKA0KDQoNCkp1ZXJnZW4NCg0KPiAt
LS0NCj4gVjI6DQo+IC0gdGVzdCBtYXhfZmlsZXMgYW5kIG1heF9vcGVuX2ZpbGVzLCB0b28g
KEphc29uIEFuZHJ5dWspDQo+IFY0Og0KPiAtIGZpeCBtYW4gcGFnZSB0byB1c2UgdGhlICJ4
ZW5fOXBmc2QiIHR5cGUgZHVlIHRvIGlkbCBsaW1pdGF0aW9uDQo+ICAgIChKYXNvbiBBbmRy
eXVrKQ0KPiAtIHNldCAobW9zdCBvZikgdGhlIGRlZmF1bHRzIGluIGxpYnhsIChBbnRob255
IFBlcmFyZCkNCj4gLS0tDQo+ICAgZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAgfCAz
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIHRvb2xzL2xpYnMv
bGlnaHQvbGlieGxfOXBmcy5jIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICAgdG9vbHMv
eGwveGxfcGFyc2UuYyAgICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrLS0tDQo+
ICAgMyBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiBiL2RvY3MvbWFu
L3hsLmNmZy41LnBvZC5pbg0KPiBpbmRleCBlYThkNDE3MjdkLi4wMzllMDU3MzE4IDEwMDY0
NA0KPiAtLS0gYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4NCj4gKysrIGIvZG9jcy9tYW4v
eGwuY2ZnLjUucG9kLmluDQo+IEBAIC03NzIsMTAgKzc3MiwxNiBAQCBzZXR0aW5ncywgZnJv
bSB0aGUgZm9sbG93aW5nIGxpc3Q6DQo+ICAgDQo+ICAgPW92ZXIgNA0KPiAgIA0KPiArPWl0
ZW0gQjx0eXBlPVRZUEU+DQo+ICsNCj4gK1RoZSBiYWNrZW5kdHlwZSBmb3IgdGhlIFBWIGRl
dmljZS4gU3VwcG9ydGVkIHZhbHVlcyBhcmUgQjxxZW11PiBhbmQNCj4gK0I8eGVuXzlwZnNk
Pi4gIFRoZSBkZWZhdWx0IGlzIEI8cWVtdT4uDQo+ICsNCj4gICA9aXRlbSBCPHRhZz1TVFJJ
Tkc+DQo+ICAgDQo+ICAgOXBmcyB0YWcgdG8gaWRlbnRpZnkgdGhlIGZpbGVzeXN0ZW0gc2hh
cmUuIFRoZSB0YWcgaXMgbmVlZGVkIG9uIHRoZQ0KPiAtZ3Vlc3Qgc2lkZSB0byBtb3VudCBp
dC4NCj4gK2d1ZXN0IHNpZGUgdG8gbW91bnQgaXQuIEZvciB0aGUgYmFja2VuZHR5cGUgb2Yg
Qjx4ZW5fOXBmc2Q+IHRoZSB0YWcgZGVmYXVsdHMgdG8NCj4gKyJYZW4iLg0KPiAgIA0KPiAg
ID1pdGVtIEI8c2VjdXJpdHlfbW9kZWw9Im5vbmUiPg0KPiAgIA0KPiBAQCAtNzg1LDEyICs3
OTEsMzggQEAgc3F1YXNoIG9yIHJlbWFwKS4NCj4gICANCj4gICA9aXRlbSBCPHBhdGg9U1RS
SU5HPg0KPiAgIA0KPiAtRmlsZXN5c3RlbSBwYXRoIG9uIHRoZSBiYWNrZW5kIHRvIGV4cG9y
dC4NCj4gK0ZpbGVzeXN0ZW0gcGF0aCBvbiB0aGUgYmFja2VuZCB0byBleHBvcnQuIEZvciB0
aGUgYmFja2VuZHR5cGUgb2YgQjx4ZW5fOXBmc2Q+DQo+ICt0aGUgcGF0aCBkZWZhdWx0cyB0
byAiQFhFTl9MT0dfRElSQC9ndWVzdHMvPGd1ZXN0LW5hbWU+Ii4NCj4gICANCj4gICA9aXRl
bSBCPGJhY2tlbmQ9ZG9tYWluLWlkPg0KPiAgIA0KPiAgIFNwZWNpZnkgdGhlIGJhY2tlbmQg
ZG9tYWluIG5hbWUgb3IgaWQsIGRlZmF1bHRzIHRvIGRvbTAuDQo+ICAgDQo+ICs9aXRlbSBC
PG1heC1maWxlcz1OVU1CRVI+DQo+ICsNCj4gK1NwZWNpZnkgdGhlIG1heGltdW0gbnVtYmVy
IG9mIGZpbGVzIGJlbG93IEI8cGF0aD4uIEEgdmFsdWUgb2YgMCAod2hpY2gNCj4gK2lzIHRo
ZSBkZWZhdWx0KSBkb2Vzbid0IGxpbWl0IHRoZSBudW1iZXIgb2YgZmlsZXMuIE9ubHkgdmFs
aWQgZm9yDQo+ICtCPHR5cGU9eGVuXzlwZnNkPi4NCj4gKw0KPiArPWl0ZW0gQjxtYXgtb3Bl
bi1maWxlcz1OVU1CRVI+DQo+ICsNCj4gK1NwZWNpZnkgdGhlIG1heGltdW0gbnVtYmVyIG9m
IGNvbmN1cnJlbnRseSBvcGVuZWQgZmlsZXMgYmVsb3cgQjxwYXRoPi4NCj4gK011bHRpcGxl
IG9wZW5zIG9mIHRoZSBzYW1lIGZpbGUgYXJlIGNvdW50ZWQgaW5kaXZpZHVhbGx5LiBPbmx5
IHZhbGlkIGZvcg0KPiArQjx0eXBlPXhlbl85cGZzZD4sIHdoaWNoIGhhcyBhIGRlZmF1bHQg
b2YgQjxtYXgtb3Blbi1maWxlcz01Pi4NCj4gKw0KPiArPWl0ZW0gQjxtYXgtc3BhY2U9TlVN
QkVSPg0KPiArDQo+ICtTcGVjaWZ5IHRoZSBtYXhpbXVtIHVzZWQgZGlzayBzcGFjZSBpbiBN
aUIgYmVsb3cgQjxwYXRoPi4gQSB2YWx1ZSBvZiAwICh3aGljaA0KPiAraXMgdGhlIGRlZmF1
bHQpIGRvZXNuJ3QgbGltaXQgdGhlIHVzYWJsZSBkaXNrIHNwYWNlLiBPbmx5IHZhbGlkIGZv
cg0KPiArQjx0eXBlPXhlbl85cGZzZD4uDQo+ICsNCj4gKz1pdGVtIEI8YXV0by1kZWxldGU9
Qk9PTEVBTj4NCj4gKw0KPiArV2hlbiBzZXQgdGhlIGJhY2tlbmQgd2lsbCBkZWxldGUgdGhl
IG9sZGVzdCBmaWxlIHdoaWNoIGlzIGN1cnJlbnRseSBub3QNCj4gK29wZW5lZCBieSB0aGUg
Z3Vlc3QgaW4gY2FzZSB0aGUgZGlzayBzcGFjZSBsaW1pdCBzZXQgdmlhIEI8bWF4LXNwYWNl
PiBvciB0aGUNCj4gK2ZpbGUgbGltaXQgc2V0IHZpYSBCPG1heC1maWxlcz4gaXMgYmVpbmcg
cmVhY2hlZC4gT25seSB2YWxpZCBmb3INCj4gK0I8dHlwZT14ZW5fOXBmc2Q+Lg0KPiArDQo+
ICAgPWJhY2sNCj4gICANCj4gICA9aXRlbSBCPHB2Y2FsbHM9WyAiYmFja2VuZD1kb21haW4t
aWQiLCAuLi4gXT4NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfOXBm
cy5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF85cGZzLmMNCj4gaW5kZXggOTAwYzBkNDZh
MC4uZGRlYjRmMjBhNyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF85
cGZzLmMNCj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF85cGZzLmMNCj4gQEAgLTIw
LDYgKzIwLDI0IEBADQo+ICAgc3RhdGljIGludCBsaWJ4bF9fZGV2aWNlX3A5X3NldGRlZmF1
bHQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3A5ICpwOSwgYm9vbCBob3Rw
bHVnKQ0KPiAgIHsNCj4gKyAgICBpZiAocDktPnR5cGUgPT0gTElCWExfUDlfVFlQRV9VTktO
T1dOKSB7DQo+ICsgICAgICAgIHA5LT50eXBlID0gTElCWExfUDlfVFlQRV9RRU1VOw0KPiAr
ICAgIH0NCj4gKyAgICBpZiAocDktPnR5cGUgPT0gTElCWExfUDlfVFlQRV9RRU1VICYmDQo+
ICsgICAgICAgIChwOS0+bWF4X2ZpbGVzIHx8IHA5LT5tYXhfb3Blbl9maWxlcyB8fCBwOS0+
bWF4X3NwYWNlIHx8DQo+ICsgICAgICAgICBwOS0+YXV0b19kZWxldGUpKSB7DQo+ICsgICAg
ICAgIExPR0QoRVJST1IsIGRvbWlkLCAiSWxsZWdhbCA5cGZzIHBhcmFtZXRlciBjb21iaW5h
dGlvbiIpOw0KPiArICAgICAgICByZXR1cm4gRVJST1JfSU5WQUw7DQo+ICsgICAgfQ0KPiAr
ICAgIGlmIChwOS0+dHlwZSA9PSBMSUJYTF9QOV9UWVBFX1hFTl85UEZTRCAmJiAhcDktPnRh
Zykgew0KPiArICAgICAgICBwOS0+dGFnID0gbGlieGxfX3N0cmR1cChOT0dDLCAiWGVuIik7
DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgaWYgKCFwOS0+cGF0aCB8fCAhcDktPnNlY3VyaXR5
X21vZGVsIHx8ICFwOS0+dGFnKSB7DQo+ICsgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAi
OXBmcyBzcGVjIG1pc3NpbmcgcmVxdWlyZWQgZmllbGQhIik7DQo+ICsgICAgICAgIHJldHVy
biBFUlJPUl9JTlZBTDsNCj4gKyAgICB9DQo+ICsNCj4gICAgICAgcmV0dXJuIGxpYnhsX19y
ZXNvbHZlX2RvbWlkKGdjLCBwOS0+YmFja2VuZF9kb21uYW1lLCAmcDktPmJhY2tlbmRfZG9t
aWQpOw0KPiAgIH0NCj4gICANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMg
Yi90b29scy94bC94bF9wYXJzZS5jDQo+IGluZGV4IDliMzU4ZjExYjguLjgwZmZlODVmNWUg
MTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMNCj4gKysrIGIvdG9vbHMveGwv
eGxfcGFyc2UuYw0KPiBAQCAtMjIzMyw2ICsyMjMzLDIwIEBAIHZvaWQgcGFyc2VfY29uZmln
X2RhdGEoY29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwNCj4gICAgICAgICAgICAgICAgICAg
ICAgIHJlcGxhY2Vfc3RyaW5nKCZwOS0+dGFnLCB2YWx1ZSk7DQo+ICAgICAgICAgICAgICAg
ICAgIH0gZWxzZSBpZiAoIXN0cmNtcChrZXksICJiYWNrZW5kIikpIHsNCj4gICAgICAgICAg
ICAgICAgICAgICAgIHJlcGxhY2Vfc3RyaW5nKCZwOS0+YmFja2VuZF9kb21uYW1lLCB2YWx1
ZSk7DQo+ICsgICAgICAgICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKGtleSwgInR5cGUi
KSkgew0KPiArICAgICAgICAgICAgICAgICAgICBpZiAobGlieGxfcDlfdHlwZV9mcm9tX3N0
cmluZyh2YWx1ZSwgJnA5LT50eXBlKSkgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ZnByaW50ZihzdGRlcnIsICJmYWlsZWQgdG8gcGFyc2UgOXBmcyB0eXBlOiAlc1xuIiwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUpOw0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgZXhpdCgxKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgfQ0KPiAr
ICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoIXN0cmNtcChrZXksICJtYXgtZmlsZXMiKSkg
ew0KPiArICAgICAgICAgICAgICAgICAgICBwOS0+bWF4X2ZpbGVzID0gcGFyc2VfdWxvbmco
dmFsdWUpOw0KPiArICAgICAgICAgICAgICAgIH0gZWxzZSBpZiAoIXN0cmNtcChrZXksICJt
YXgtb3Blbi1maWxlcyIpKSB7DQo+ICsgICAgICAgICAgICAgICAgICAgIHA5LT5tYXhfb3Bl
bl9maWxlcyA9IHBhcnNlX3Vsb25nKHZhbHVlKTsNCj4gKyAgICAgICAgICAgICAgICB9IGVs
c2UgaWYgKCFzdHJjbXAoa2V5LCAibWF4LXNwYWNlIikpIHsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgcDktPm1heF9zcGFjZSA9IHBhcnNlX3Vsb25nKHZhbHVlKTsNCj4gKyAgICAgICAg
ICAgICAgICB9IGVsc2UgaWYgKCFzdHJjbXAoa2V5LCAiYXV0by1kZWxldGUiKSkgew0KPiAr
ICAgICAgICAgICAgICAgICAgICBwOS0+YXV0b19kZWxldGUgPSBzdHJ0b3VsKHZhbHVlLCBO
VUxMLCAwKTsNCj4gICAgICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAgICAg
ICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAiVW5rbm93biA5cGZzIHBhcmFtZXRlciAnJXMn
XG4iLCBrZXkpOw0KPiAgICAgICAgICAgICAgICAgICAgICAgZXhpdCgxKTsNCj4gQEAgLTIy
NDMsOSArMjI1NywxMiBAQCB2b2lkIHBhcnNlX2NvbmZpZ19kYXRhKGNvbnN0IGNoYXIgKmNv
bmZpZ19zb3VyY2UsDQo+ICAgDQo+ICAgICAgICAgICAgICAgbGlieGxfc3RyaW5nX2xpc3Rf
ZGlzcG9zZSgmcGFpcnMpOw0KPiAgIA0KPiAtICAgICAgICAgICAgaWYgKCFwOS0+cGF0aCB8
fCAhcDktPnNlY3VyaXR5X21vZGVsIHx8ICFwOS0+dGFnKSB7DQo+IC0gICAgICAgICAgICAg
ICAgZnByaW50ZihzdGRlcnIsICI5cGZzIHNwZWMgbWlzc2luZyByZXF1aXJlZCBmaWVsZCFc
biIpOw0KPiAtICAgICAgICAgICAgICAgIGV4aXQoMSk7DQo+ICsgICAgICAgICAgICBpZiAo
cDktPnR5cGUgPT0gTElCWExfUDlfVFlQRV9YRU5fOVBGU0QgJiYgIXA5LT5wYXRoKSB7DQo+
ICsgICAgICAgICAgICAgICAgY2hhciAqcGF0aDsNCj4gKw0KPiArICAgICAgICAgICAgICAg
IHhhc3ByaW50ZigmcGF0aCwgWEVOX0xPR19ESVIgIi9ndWVzdHMvJXMiLCBjX2luZm8tPm5h
bWUpOw0KPiArICAgICAgICAgICAgICAgIHJlcGxhY2Vfc3RyaW5nKCZwOS0+cGF0aCwgcGF0
aCk7DQo+ICsgICAgICAgICAgICAgICAgZnJlZShwYXRoKTsNCj4gICAgICAgICAgICAgICB9
DQo+ICAgICAgICAgICB9DQo+ICAgICAgIH0NCg0K
--------------rG5Sd0bq0obQ5zm70O0ZQ86d
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------rG5Sd0bq0obQ5zm70O0ZQ86d--

--------------4sYac0mFmWSHsk0WeNADZmYl--

--------------p0I55L4PbTadoXKUmMCzhEap
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXN3HoFAwAAAAAACgkQsN6d1ii/Ey+O
sAgAhLX+c7EPwbtzJEnwnSa2UtkkSZujyC1CXEi7f/2yS6OsH+4M3uLWqnRVdE57NCu5Ppxn0C4P
IsGmWHI1ldZ0hzef5mbSEni9ByapmCVWDjI3knPLCjnJGuLQASX7A7/7AN+UrxY8InbxnPsehpZv
5Z+x/SeyvAxxdnGAo7l8OWbgdkf5X7HlZ8hdqMkdRzpJjpd6TwfQQiUO8837Ui1DZG17TxCFSvgU
vh87da/QutFfcoDhXi13cBhH5btzH/n8+tL8cFJoqxUpVRKJ7Uv0dhYCKyIj8RLf+byMKOnFQdVP
Dzs2MT1iDh47Ivmv/0zlTPti8xo8EQRCmaFqKN/nlg==
=TEMr
-----END PGP SIGNATURE-----

--------------p0I55L4PbTadoXKUmMCzhEap--

