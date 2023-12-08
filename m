Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29D80A91A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650758.1016554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdog-000885-2q; Fri, 08 Dec 2023 16:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650758.1016554; Fri, 08 Dec 2023 16:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdof-00085s-Vq; Fri, 08 Dec 2023 16:35:05 +0000
Received: by outflank-mailman (input) for mailman id 650758;
 Fri, 08 Dec 2023 16:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T8s0=HT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rBdoe-0007RC-6B
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:35:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc00b459-95e7-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 17:35:02 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E6A121A5F;
 Fri,  8 Dec 2023 16:35:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 70D7E12FF7;
 Fri,  8 Dec 2023 16:35:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CLO8GbVFc2UVDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 Dec 2023 16:35:01 +0000
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
X-Inumbo-ID: bc00b459-95e7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702053301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WBblQVrZ2kw7TP8KxXGOsAF40WVPmDM8mezse8MtwYM=;
	b=Y5BF7zxriRnflBDYqMGWOAateRkziQ13aH+4sGh7TqkJXA89GQbcb/Wu9lnW013LVXYO++
	M18kV5b5Pzc6x0qgqt9R9IMUpQnKxSfz7XLN5xHX1s6hthNC4wg+K+LAB0A1XAHtKFoziB
	iCQxUn+fuPDiE8S1nTQTxlTgSVPRxZM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702053301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=WBblQVrZ2kw7TP8KxXGOsAF40WVPmDM8mezse8MtwYM=;
	b=Y5BF7zxriRnflBDYqMGWOAateRkziQ13aH+4sGh7TqkJXA89GQbcb/Wu9lnW013LVXYO++
	M18kV5b5Pzc6x0qgqt9R9IMUpQnKxSfz7XLN5xHX1s6hthNC4wg+K+LAB0A1XAHtKFoziB
	iCQxUn+fuPDiE8S1nTQTxlTgSVPRxZM=
Message-ID: <95169884-a134-4d12-84c1-a8e5a3bcaad0@suse.com>
Date: Fri, 8 Dec 2023 17:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] tools/xenstored: remove "-N" command line option
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20231121114048.31294-1-jgross@suse.com>
 <20231121114048.31294-6-jgross@suse.com>
 <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>
 <4add391b-cee8-4af3-be1f-56078e33e32d@suse.com>
 <f8ddd1ee-984f-4c54-8ac8-e65f430718f4@perard>
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
In-Reply-To: <f8ddd1ee-984f-4c54-8ac8-e65f430718f4@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------erqX6u9v0si8F4xeNHWnKr3S"
X-Spam-Level: 
X-Spam-Score: -5.19
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.19 / 50.00];
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
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.19
Authentication-Results: smtp-out1.suse.de;
	none

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------erqX6u9v0si8F4xeNHWnKr3S
Content-Type: multipart/mixed; boundary="------------xiHgSMBN0lF4z0zz9YnI0F0M";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
Message-ID: <95169884-a134-4d12-84c1-a8e5a3bcaad0@suse.com>
Subject: Re: [PATCH v2 5/5] tools/xenstored: remove "-N" command line option
References: <20231121114048.31294-1-jgross@suse.com>
 <20231121114048.31294-6-jgross@suse.com>
 <fe647c65-1092-4a25-9af1-3528ac69f682@citrix.com>
 <4add391b-cee8-4af3-be1f-56078e33e32d@suse.com>
 <f8ddd1ee-984f-4c54-8ac8-e65f430718f4@perard>
In-Reply-To: <f8ddd1ee-984f-4c54-8ac8-e65f430718f4@perard>

--------------xiHgSMBN0lF4z0zz9YnI0F0M
Content-Type: multipart/mixed; boundary="------------Ld4S2HAxNtrWixge3A3WIeNh"

--------------Ld4S2HAxNtrWixge3A3WIeNh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTIuMjMgMTc6MTYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBGcmksIERl
YyAwOCwgMjAyMyBhdCAwNDo1ODo1MlBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMDguMTIuMjMgMTY6NDYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMjEv
MTEvMjAyMyAxMTo0MCBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gVGhlICItTiIg
KGRvIG5vdCBkYWVtb25pemUpIGNvbW1hbmQgbGluZSBvcHRpb24gaXMgb2YgcXVlc3Rpb25h
YmxlIHVzZToNCj4+Pj4gaXRzIHNvbGUgcHVycG9zZSBzZWVtcyB0byBiZSB0byBhaWQgZGVi
dWdnaW5nIG9mIHhlbnN0b3JlZCBieSBtYWtpbmcgaXQNCj4+Pj4gZWFzaWVyIHRvIHN0YXJ0
IHhlbnN0b3JlZCB1bmRlciBnZGIsIG9yIHRvIHNlZSBhbnkgZGVidWcgbWVzc2FnZXMNCj4+
Pj4gZWFzaWx5Lg0KPj4+Pg0KPj4+PiBEZWJ1ZyBtZXNzYWdlcyBjYW4gYXMgd2VsbCBiZSBz
ZW50IHRvIHN5c2xvZygpLCB3aGlsZSBnZGIgY2FuIGJlDQo+Pj4+IGF0dGFjaGVkIHRvIHRo
ZSBkYWVtb24gZWFzaWx5LiBUaGUgb25seSBub3QgY292ZXJlZCBjYXNlIGlzIGFuIGVycm9y
DQo+Pj4+IHdoaWxlIGluaXRpYWxpemluZyB4ZW5zdG9yZWQsIGJ1dCB0aGlzIGNvdWxkIGJl
IGhhbmRsZWQgZS5nLiBieSBzYXZpbmcNCj4+Pj4gYSBjb3JlIGR1bXAsIHdoaWNoIGNhbiBi
ZSBhbmFseXplZCBsYXRlci4NCj4+Pj4NCj4+Pj4gVGhlIGNhbGwgb2YgdGFsbG9jX2VuYWJs
ZV9sZWFrX3JlcG9ydF9mdWxsKCkgZG9uZSBvbmx5IHdpdGggIi1OIg0KPj4+PiBzcGVjaWZp
ZWQgaXMgbm8gbG9uZ2VyIG5lZWRlZCwgYXMgdGhlIHNhbWUgY2FuIGJlIGFjaGlldmVkIHZp
YQ0KPj4+PiAieGVuc3RvcmUtY29udHJvbCBtZW1yZXBvcnQiLg0KPj4+Pg0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4NCj4+PiBT
eXN0ZW1kIHdhbnRzIGRhZW1vbnMgdG8gbm90IGZvcmssIGJlY2F1c2Ugc3lzdGVtZCBjYW4g
c3RhcnQgdGhlbSB1cCBpbg0KPj4+IGEgYmV0dGVyLXByZXNjcmliZWQgZW52aXJvbm1lbnQg
dGhhbiBkZWFtb25pc2UoKSBjYW4gbWFrZS4NCj4+Pg0KPj4+IEl0IHdhcyBhIGxhenkgcG9y
dCB0byBzeXN0ZW0gd2hpY2ggaGFzIGNhdXNlZCB1cyBub3QgdG8gYmUgdXNpbmcgLU4gaW4N
Cj4+PiB0aGUgZmlyc3QgcGxhY2UuDQo+Pj4NCj4+PiBTbyBubyAtIEkgdGhpbmsgdGhpcyBv
cHRpb24gc3BlY2lmaWNhbGx5IHdhbnRzIHRvIHN0YXksIGFuZCB0aGUgc3lzdGVtZA0KPj4+
IGludGVncmF0aW9uIGltcHJvdmVkLg0KPj4NCj4+IFRoZSBwcm9ibGVtIHdpdGggdGhpcyBh
cHByb2FjaCBpcyB0aGF0IHdlIGhhdmUgc29tZSBmdW5jdGlvbmFsaXR5IGluIHRoZQ0KPj4g
bGF1bmNoLXhlbnN0b3JlIHNjcmlwdCByZWx5aW5nIG9uIFtvXXhlbnN0b3JlZCBjb21pbmcg
YmFjayBhZnRlciBoYXZpbmcNCj4+IGZvcmtlZCBvZmYgdGhlIGRhZW1vbjogd2UgYXJlIHNl
dHRpbmcgdGhlIG9vbS1zY29yZSwgd2hpY2ggY2FuIGJlIGRvbmUNCj4gDQo+IEl0J3MgcGVy
ZmVjdGx5IHJlYXNvbmFibGUgdG8gYmFuZSB0aGUgdXNlIG9mICItTiIgd2hlbiB1c2luZw0K
PiBgLi9sYXVuY2gteGVuc3RvcmVgIHRvIHN0YXJ0IHhlbnN0b3JlZC4gSXQgZG9lc24ndCBt
ZWFuIHRoYXQgdGhlIG9wdGlvbg0KPiBuZWVkcyB0byBiZSByZW1vdmVkIGZyb20geGVuc3Rv
cmVkLg0KPiANCj4+IG9ubHkgd2hlbiBrbm93aW5nIHRoZSBwcm9jZXNzIGlkLg0KPj4NCj4+
IFNvIHdlIG5lZWQgYSBzb2x1dGlvbiBmb3IgdGhpcyBwcm9ibGVtIGJlZm9yZSB3ZSBjYW4g
cmVhbGx5IGVuY291cmFnZQ0KPj4gdXNlcnMgdG8gdXNlIHRoZSAtTiBvcHRpb24uDQo+Pg0K
Pj4gUGxlYXNlIG5vdGUgdGhhdCBzZXR0aW5nIHRoZSBvb20tc2NvcmUgZnJvbSB3aXRoaW4g
eGVuc3RvcmVkIHdhcyByZWplY3RlZA0KPj4gYmFjayB3aGVuIEkgcG9zdGVkIGEgcGF0Y2gg
aW4gdGhpcyByZWdhcmQsIGVzcGVjaWFsbHkgYXMgaXQgaXMgc3BlY2lmaWMgdG8NCj4+IExp
bnV4LiBBZGRpdGlvbmFsbHkgdGhpcyB3b3VsZCBtZWFuIHdlIG5lZWQgdG8gYWRkIHRoaXMg
ZnVuY3Rpb25hbGl0eSB0bw0KPj4geGVuc3RvcmVkIEFORCBveGVuc3RvcmVkLg0KPiANCj4g
VGhlcmUncyBzdGlsbCBhIHdvcmxkIHdoZXJlIC1OIGNhbiBiZSB1c2VkLCBhbmQgb29tLXNj
b3JlIGNhbiBiZSBzZXQsDQo+IEknbSBwcmV0dHkgc3VyZSB0aGF0IGNhbiBiZSBkb25lIHdp
dGggYW4gaGFuZC1jcmFmdGVkICJzeXN0ZW1kLnNlcnZpY2UiDQo+IGZpbGUuIE9uZSBwcm9i
YWJseSBuZWVkIHRvIGhhdmUgc29tZXRoaW5nIGxpa2UgIk9PTVBvbGljeT0iIG9yDQo+ICJP
T01TY29yZUFkanVzdD0iIGluIHRoZWlyIHNlcnZpY2UgZmlsZSwgYW5kIHN0YXJ0IHRoZSBg
eGVuc3RvcmVkYA0KPiBkYWVtb24gb2YgdGhlaXIgY2hvaWNlIGRpcmVjdGx5LCBldmVuIHdp
dGggLU4gYXMgc3lzdGVtZCBjYW4gZGV0ZWN0IHdoZW4NCj4gdGhlIGRhZW1vbiBpcyByZWFk
eSBiZWNhdXNlIHdlIHVzZSBzZF9ub3RpZnkoKSAoYXQgbGVhc3QgaW4gY3hlbnN0b3JlZCku
DQo+IA0KPiANCj4gU28sIEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAgLU4uDQoNCk9rYXksIGZh
aXIgZW5vdWdoLg0KDQpMZXRzIGRyb3AgdGhlIHBhdGNoIHRoZW4uDQoNCg0KSnVlcmdlbg0K

--------------Ld4S2HAxNtrWixge3A3WIeNh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Ld4S2HAxNtrWixge3A3WIeNh--

--------------xiHgSMBN0lF4z0zz9YnI0F0M--

--------------erqX6u9v0si8F4xeNHWnKr3S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVzRbUFAwAAAAAACgkQsN6d1ii/Ey9a
WAf9GX0d53+fFi7oP67SCYDwddTc37Cx6WJe3yAoycfmStUP35LYLk/sLKUcTvVJopiEHJieOpSz
xoDVTN/fpEPF3Rf8TAcGYj7mfTKVlZjyqoMd0bLD245sY2yY1d3A9NK7jPzvO5ljFigRnrW8r7Gl
17t0DOUcOQ3TLDQdwZ3mK/nS+XU8knHK48SOswSUo2wy8H8UPZai2sCE0khv9qsfC/bvMPnqMXh+
pC5blxn3sBPlWT2+jv7u/AcSWwrefOybK3gM986P2YaBkTaxE/Q84SeFwAZs4jGzuLFtCWy0KUlv
fGeGsBtK+7FimmixSyFZ6lh5YoDJkM4Gqe76Nl61LQ==
=xr03
-----END PGP SIGNATURE-----

--------------erqX6u9v0si8F4xeNHWnKr3S--

