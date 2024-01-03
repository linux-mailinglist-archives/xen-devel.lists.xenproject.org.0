Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F182281E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jan 2024 06:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660888.1030561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKuBu-0002ev-L6; Wed, 03 Jan 2024 05:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660888.1030561; Wed, 03 Jan 2024 05:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKuBu-0002cV-IO; Wed, 03 Jan 2024 05:53:22 +0000
Received: by outflank-mailman (input) for mailman id 660888;
 Wed, 03 Jan 2024 05:53:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tcLg=IN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rKuBt-0002cP-0y
 for xen-devel@lists.xenproject.org; Wed, 03 Jan 2024 05:53:21 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64b0b574-a9fc-11ee-9b0f-b553b5be7939;
 Wed, 03 Jan 2024 06:53:19 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58B9C1F78D;
 Wed,  3 Jan 2024 05:53:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0190F13418;
 Wed,  3 Jan 2024 05:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IOTyOUz2lGV8OgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 03 Jan 2024 05:53:16 +0000
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
X-Inumbo-ID: 64b0b574-a9fc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704261197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=A4y9+iKixrUT2kJ/gjgCrHQHgcvQaFAmrJTfAN0z+kI=;
	b=nAyEJUduWo3Q0XeHo/wxUsZHGmFXGwJQpZLUldNiVqLTjfmjCumvfXpDcXJ+zx5Fx71LqO
	qIXww4FWw6XL9yFJkZzwR0hZ1smR1VAVlMDSACpCKJZ0UBJJEkjAir8HjztbJnmZyfzuK+
	N72JZEDEL5GcQxLJJA/rL5bgwtYmSAA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704261197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=A4y9+iKixrUT2kJ/gjgCrHQHgcvQaFAmrJTfAN0z+kI=;
	b=nAyEJUduWo3Q0XeHo/wxUsZHGmFXGwJQpZLUldNiVqLTjfmjCumvfXpDcXJ+zx5Fx71LqO
	qIXww4FWw6XL9yFJkZzwR0hZ1smR1VAVlMDSACpCKJZ0UBJJEkjAir8HjztbJnmZyfzuK+
	N72JZEDEL5GcQxLJJA/rL5bgwtYmSAA=
Message-ID: <9637302c-9fcf-46c5-9b70-ec44cd25f89d@suse.com>
Date: Wed, 3 Jan 2024 06:53:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release schedule proposal
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: community.manager@xenproject.org, julien@xen.org, sstabellini@kernel.org,
 Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com, anthony.perard@citrix.com, george.dunlap@cloud.com,
 Wei.Chen@arm.com
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
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
In-Reply-To: <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o8VjT7LNoJWb3XjoVuhJQawp"
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.20 / 50.00];
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
	 FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=nAyEJUdu
X-Spam-Score: -6.20
X-Rspamd-Queue-Id: 58B9C1F78D

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o8VjT7LNoJWb3XjoVuhJQawp
Content-Type: multipart/mixed; boundary="------------kYp6rgkP7vMRAhtfrv088vgt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: community.manager@xenproject.org, julien@xen.org, sstabellini@kernel.org,
 Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com, anthony.perard@citrix.com, george.dunlap@cloud.com,
 Wei.Chen@arm.com
Message-ID: <9637302c-9fcf-46c5-9b70-ec44cd25f89d@suse.com>
Subject: Re: Xen 4.19 release schedule proposal
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
In-Reply-To: <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>

--------------kYp6rgkP7vMRAhtfrv088vgt
Content-Type: multipart/mixed; boundary="------------bopPjl3JN87y0A9PseU7SoxU"

--------------bopPjl3JN87y0A9PseU7SoxU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDEuMjQgMTc6NTksIE9sZWtzaWkgd3JvdGU6DQo+IERlYXIgY29tbXVuaXR5LA0K
PiANCj4gV2lzaGluZyB5b3UgYSBIYXBweSBOZXcgWWVhciENCj4gDQo+IEknZCBsaWtlIHRv
IHByb3Bvc2UgdGhlIHJlbGVhc2Ugc2NoZWR1bGUgZm9yIFhlbiA0LjE5Lg0KPiANCj4gQmFz
ZWQgb24gdGhlIHByZXZpb3VzIHJlbGVhc2Ugc2NoZWR1bGVzIFsxXSBhbmQgWzJdLCBpdCBz
ZWVtcyB0aGUgbmV4dA0KPiByZWxlYXNlIGRhdGUgc2hvdWxkIGJlIG9uIFdlZG5lc2RheSwg
SnVseSAxMCwgMjAyNDoNCj4gDQo+ICoqIFByb3Bvc2VkIG9wdGlvbjogV2VkIEp1bCAxMCwg
MjAyNCAqKg0KPiAoKzkgbW9udGhzIGZyb20gWGVuIDQuMTggcmVsZWFzZSkNCj4gDQo+IC0g
TGFzdCBwb3N0aW5nIGRhdGUgICAgICAgICAgRnJpIEFwciAyNiwgMjAyNA0KPiANCj4gUGF0
Y2hlcyBhZGRpbmcgbmV3IGZlYXR1cmVzIGFyZSBleHBlY3RlZCB0byBiZSBwb3N0ZWQgdG8g
dGhlIG1haWxpbmcNCj4gbGlzdCBieSB0aGlzIGRhdGUsIGFsdGhvdWdoIHBlcmhhcHMgbm90
IGluIHRoZWlyIGZpbmFsIHZlcnNpb24uDQo+IA0KPiAtIEZlYXR1cmUgZnJlZXplICAgICAg
ICAgICAgIEZyaSBNYXkgMTcsIDIwMjQgKCszIHdlZWtzIGZyb20gTGFzdA0KPiBwb3N0aW5n
IGRhdGUpDQo+IA0KPiBQYXRjaGVzIGFkZGluZyBuZXcgZmVhdHVyZXMgc2hvdWxkIGJlIGNv
bW1pdHRlZCBieSB0aGlzIGRhdGUuDQo+IFN0cmFpZ2h0Zm9yd2FyZCBidWdmaXhlcyBtYXkg
Y29udGludWUgdG8gYmUgYWNjZXB0ZWQgYnkgbWFpbnRhaW5lcnMuDQo+IA0KPiAtIENvZGUg
ZnJlZXplICAgICAgICAgICAgICAgIEZyaSBNYXkgMzEsIDIwMjQgKCsyIHdlZWtzIGZyb20g
RmVhdHVyZQ0KPiBmcmVlemUpDQo+IA0KPiBCdWdmaXhlcyBvbmx5Lg0KPiANCj4gLSBIYXJk
IGNvZGUgZnJlZXplICAgICAgICAgICBGcmkgSnVuIDIxLCAyMDI0ICgrMyB3ZWVrcyBmcm9t
IENvZGUNCj4gZnJlZXplKQ0KPiANCj4gQnVnZml4ZXMgZm9yIHNlcmlvdXMgYnVncyAoaW5j
bHVkaW5nIHJlZ3Jlc3Npb25zKSwgYW5kIGxvdy1yaXNrIGZpeGVzDQo+IG9ubHkuDQo+IA0K
PiAtIEZpbmFsIGNvbW1pdHMgICAgICAgICAgICAgIEZyaSBKdWwgMDUsIDIwMjQgKCsyIHdl
ZWtzIGZyb20gSGFyZCBjb2RlDQo+IGZyZWV6ZSkNCj4gDQo+IEJyYW5jaCBvZmYgc3RhZ2lu
Zy00LjE5Lg0KPiANCj4gLSBSZWxlYXNlICAgICAgICAgICAgICAgICAgICBXZWQgSnVsIDEw
LCAyMDI0DQo+IA0KPiBJZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucywgd2Ugd2lsbCBzdGlj
ayB0byB0aGUgcHJvcG9zZWQgc2NoZWR1bGUuDQo+IA0KPiBPbmUgbW9yZSB0aGluZyBJJ2Qg
bGlrZSB0byBkaXNjdXNzIGlzIHdoZXRoZXIgdG8gYWRkIGEgZmlsZQ0KPiAoUkVMRUFTRS5t
ZCkgd2l0aCB0aGUgcmVsZWFzZSBzY2hlZHVsZSB0byB0aGUgc291cmNlIGNvZGUgb3IgdXBk
YXRlIGFuDQo+IGV4aXN0aW5nIG9uZSAoeGVuLXJlbGVhc2UtbWFuYWdlbWVudC5wYW5kb2Mp
LiBJIHRoaW5rIGl0IHdpbGwgaGVscCB0bw0KPiBmaW5kIHRoZSBmaW5hbCByZWxlYXNlIHNj
aGVkdWxlIGZvciB0aGUgbmVhcmVzdCByZWxlYXNlLiBGb3IgZXhhbXBsZSwNCj4gZm9yIHRo
ZSBwcmV2aW91cyByZWxlYXNlLCB0aGVyZSBhcmUgYSBsb3Qgb2YgZW1haWxzIHdpdGggcHJv
cG9zZWQNCj4gc2NoZWR1bGVzLCBwb2xscyBvZiBYZW4gcmVsZWFzZSBzY2hlZHVsZXMsIGFu
ZCBJIGZvdW5kIHRoZSBmaW5hbA0KPiByZWxlYXNlIHNjaGVkdWxlIGluIGp1c3Qgb25lIG9m
IHRoZSByZXBsaWVzIChidXQgcHJvYmFibHkgSSBtaXNzZWQNCj4gc29tZXRoaW5nKS4NCg0K
V2hhdCBhYm91dCBwdXR0aW5nIGl0IGludG8gdGhlIHdpa2kgdW5kZXIgWGVuX1Byb2plY3Rf
WC5ZWV9SZWxlYXNlX05vdGVzPw0KVGhhdCB3YXkgaXQgd291bGQgYWxyZWFkeSBiZSBhY2Nl
c3NpYmxlIHZpYSBTVVBQT1JULm1kIChpbiB0aGUgd2lraSB1bmRlcg0KaHR0cHM6Ly94ZW5i
aXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS1zdGFnaW5nL3N1cHBvcnQtbWF0cml4Lmh0bWwg
KS4NCg0KDQpKdWVyZ2VuDQo=
--------------bopPjl3JN87y0A9PseU7SoxU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bopPjl3JN87y0A9PseU7SoxU--

--------------kYp6rgkP7vMRAhtfrv088vgt--

--------------o8VjT7LNoJWb3XjoVuhJQawp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmWU9kwFAwAAAAAACgkQsN6d1ii/Ey9k
3Af7B2hyWy1zgUWRr2I2mTdlbJxMTWof7NBTH5H1Ih3gv9IIRP/D70ROU4WSQCkrhHlbxJphC2Pj
/DYdbjAT0Xl5xtYUBCrS5ooLVo78ZbxUViSL8CYmFwA0TGO8vYRO0Ms7K3ocRDyQCds4kjskjxj7
P2MbSIZ4TsLSgdAmqZOZxSzmjGo7Wkywze3oWi0bjLGSVu8kaBOl+c+nk8K2qpy3+129MBASAinL
I81LD7xDDKpv7Cc5P+Dy+uM3pRRXxBsWkIVhYQLhvunzS93bpDjJBt/kelpZKL+Ie69vg2NG5z9K
NRamP/Ch/llX9MQWxXRyt11qeVv2OWWvoCuKP3XCsg==
=5j8e
-----END PGP SIGNATURE-----

--------------o8VjT7LNoJWb3XjoVuhJQawp--

