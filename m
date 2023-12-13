Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB0810D31
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:17:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653797.1020373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLMt-0002Tf-1H; Wed, 13 Dec 2023 09:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653797.1020373; Wed, 13 Dec 2023 09:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLMs-0002RK-Uq; Wed, 13 Dec 2023 09:17:26 +0000
Received: by outflank-mailman (input) for mailman id 653797;
 Wed, 13 Dec 2023 09:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDLMs-0002RC-0L
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:17:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d65ca40-9998-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 10:17:24 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BBC731FD42;
 Wed, 13 Dec 2023 09:17:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FBB51377F;
 Wed, 13 Dec 2023 09:17:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +TtaHaN2eWWJQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 09:17:23 +0000
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
X-Inumbo-ID: 6d65ca40-9998-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702459043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W0u7YrUT5nB5qMo1ziHRqeuZ18RQMb54IAgPhzbexck=;
	b=V7aBZTJdSnvlSHPu6vJNzoXaZXSVeP5z/ZAHn0E/sYzxMKFrWIWM9JvBTpJN74hi7Jl7zy
	+YBXC2UrfPKidSCLoao5ehOqbEXesI0iR5uXrQ2C+eUNsQaUN9VZX77zbk3aTXVhmVSMnJ
	YQvnHy86ljAWn1ST/bElL84ROp7lBNY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702459043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=W0u7YrUT5nB5qMo1ziHRqeuZ18RQMb54IAgPhzbexck=;
	b=V7aBZTJdSnvlSHPu6vJNzoXaZXSVeP5z/ZAHn0E/sYzxMKFrWIWM9JvBTpJN74hi7Jl7zy
	+YBXC2UrfPKidSCLoao5ehOqbEXesI0iR5uXrQ2C+eUNsQaUN9VZX77zbk3aTXVhmVSMnJ
	YQvnHy86ljAWn1ST/bElL84ROp7lBNY=
Message-ID: <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
Date: Wed, 13 Dec 2023 10:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
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
In-Reply-To: <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1czFYHZL9XLh5YAqN3goPvSl"
X-Spam-Level: 
X-Spam-Score: -2.99
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.99
X-Spamd-Result: default: False [-2.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1czFYHZL9XLh5YAqN3goPvSl
Content-Type: multipart/mixed; boundary="------------Zvsf2x2Cjonl06wSCHdrcjHR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <ea73d863-6ead-4b03-98f4-7ab873fa614b@suse.com>
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
 <bee4d33a-1120-4389-a83d-4d2b91c5611d@xen.org>
 <2cccc696-a9d6-49ed-9b00-74de59884d43@suse.com>
 <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>
In-Reply-To: <fa87ab8c-b422-4a79-a32d-608c6c63ddf8@xen.org>

--------------Zvsf2x2Cjonl06wSCHdrcjHR
Content-Type: multipart/mixed; boundary="------------Yzzd7twmFYD29Jf0kPtGdFU3"

--------------Yzzd7twmFYD29Jf0kPtGdFU3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjMgMDk6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEzLzEyLzIwMjMgMDY6MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMi4xMi4yMyAyMDoxMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAxMi8xMi8yMDIzIDA5OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBBZGQgYW5vdGhlciBmdW5jdGlvbiBsZXZlbCBpbiBzcGlubG9jay5jIGhpZGluZyB0
aGUgc3BpbmxvY2tfdCBsYXlvdXQNCj4+Pj4gZnJvbSB0aGUgbG93IGxldmVsIGxvY2tpbmcg
Y29kZS4NCj4+Pj4NCj4+Pj4gVGhpcyBpcyBkb25lIGluIHByZXBhcmF0aW9uIG9mIGludHJv
ZHVjaW5nIHJzcGlubG9ja190IGZvciByZWN1cnNpdmUNCj4+Pj4gbG9ja3Mgd2l0aG91dCBo
YXZpbmcgdG8gZHVwbGljYXRlIGFsbCBvZiB0aGUgbG9ja2luZyBjb2RlLg0KPj4+DQo+Pj4g
U28gYWxsIHRoZSBmaWVsZHMgeW91IHBhc3MgYXJlIHRoZSBvbmUgZnJvbSBzcGlubG9jay4N
Cj4+Pg0KPj4+IExvb2tpbmcgYXQgcGFob2xlIGFmdGVyIHRoaXMgc2VyaWVzIGlzIGFwcGxp
ZCwgd2UgaGF2ZToNCj4+Pg0KPj4+ID09PT0gRGVidWcgKyBMb2NrIHByb2ZpbGUgPT09PQ0K
Pj4+DQo+Pj4gc3RydWN0IHNwaW5sb2NrIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHNwaW5s
b2NrX3RpY2tldHNfdMKgwqDCoMKgwqDCoMKgwqAgdGlja2V0czvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKsKgwqDCoMKgIDAgNCAqLw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgdW5p
b24gbG9ja19kZWJ1Z8KgwqDCoMKgwqDCoMKgwqDCoMKgIGRlYnVnO8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDCoMKgIDQgNCAqLw0KPj4+IMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGxvY2tfcHJvZmlsZSAqwqDCoMKgwqDCoCBwcm9maWxlO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgOCA4ICovDQo+Pj4NCj4+PiDCoMKgwqDCoMKg
wqDCoMKgIC8qIHNpemU6IDE2LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiAzICovDQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoCAvKiBsYXN0IGNhY2hlbGluZTogMTYgYnl0ZXMgKi8NCj4+PiB9
Ow0KPj4+IHN0cnVjdCByc3BpbmxvY2sgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgc3Bpbmxv
Y2tfdGlja2V0c190wqDCoMKgwqDCoMKgwqDCoCB0aWNrZXRzO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qwqDCoMKgwqAgMCA0ICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1aW50
MTZfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWN1cnNlX2NwdTvC
oMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA0IDIgKi8NCj4+PiDCoMKgwqDCoMKgwqDC
oMKgIHVpbnQ4X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWN1
cnNlX2NudDvCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA2IDEgKi8NCj4+Pg0KPj4+
IMKgwqDCoMKgwqDCoMKgwqAgLyogWFhYIDEgYnl0ZSBob2xlLCB0cnkgdG8gcGFjayAqLw0K
Pj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGVidWc7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKg
wqAgOCA0ICovDQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIFhYWCA0IGJ5dGVzIGhv
bGUsIHRyeSB0byBwYWNrICovDQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBs
b2NrX3Byb2ZpbGUgKsKgwqDCoMKgwqAgcHJvZmlsZTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvKsKgwqDCoCAxNiA4ICovDQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHNp
emU6IDI0LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiA1ICovDQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoCAvKiBzdW0gbWVtYmVyczogMTksIGhvbGVzOiAyLCBzdW0gaG9sZXM6IDUgKi8NCj4+
PiDCoMKgwqDCoMKgwqDCoMKgIC8qIGxhc3QgY2FjaGVsaW5lOiAyNCBieXRlcyAqLw0KPj4+
IH07DQo+Pj4NCj4+Pg0KPj4+ID09PT0gRGVidWcgPT09PQ0KPj4+DQo+Pj4gc3RydWN0IHNw
aW5sb2NrIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHNwaW5sb2NrX3RpY2tldHNfdMKgwqDC
oMKgwqDCoMKgwqAgdGlja2V0czvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKsKgwqDC
oMKgIDAgNCAqLw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgdW5pb24gbG9ja19kZWJ1Z8KgwqDC
oMKgwqDCoMKgwqDCoMKgIGRlYnVnO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAv
KsKgwqDCoMKgIDQgNCAqLw0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBzaXplOiA4
LCBjYWNoZWxpbmVzOiAxLCBtZW1iZXJzOiAyICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAv
KiBsYXN0IGNhY2hlbGluZTogOCBieXRlcyAqLw0KPj4+IH07DQo+Pj4gc3RydWN0IHJzcGlu
bG9jayB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBzcGlubG9ja190aWNrZXRzX3TCoMKgwqDC
oMKgwqDCoMKgIHRpY2tldHM7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDC
oCAwIDQgKi8NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY3Vyc2VfY3B1O8KgwqDCoMKgwqDCoMKgwqDCoCAv
KsKgwqDCoMKgIDQgMiAqLw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDhfdMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY3Vyc2VfY250O8KgwqDCoMKgwqDC
oMKgwqDCoCAvKsKgwqDCoMKgIDYgMSAqLw0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAv
KiBYWFggMSBieXRlIGhvbGUsIHRyeSB0byBwYWNrICovDQo+Pj4NCj4+PiDCoMKgwqDCoMKg
wqDCoMKgIHVuaW9uIGxvY2tfZGVidWfCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWJ1ZzvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyrCoMKgwqDCoCA4IDQgKi8NCj4+Pg0KPj4+
IMKgwqDCoMKgwqDCoMKgwqAgLyogc2l6ZTogMTIsIGNhY2hlbGluZXM6IDEsIG1lbWJlcnM6
IDQgKi8NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHN1bSBtZW1iZXJzOiAxMSwgaG9sZXM6
IDEsIHN1bSBob2xlczogMSAqLw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgLyogbGFzdCBjYWNo
ZWxpbmU6IDEyIGJ5dGVzICovDQo+Pj4gfTsNCj4+Pg0KPj4+ID09PT0gUHJvZCA9PT09DQo+
Pj4NCj4+PiBzdHJ1Y3Qgc3BpbmxvY2sgew0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgc3Bpbmxv
Y2tfdGlja2V0c190wqDCoMKgwqDCoMKgwqDCoCB0aWNrZXRzO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qwqDCoMKgwqAgMCA0ICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1bmlv
biBsb2NrX2RlYnVnwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVidWc7wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNCAwICovDQo+Pj4NCj4+PiDCoMKgwqDCoMKg
wqDCoMKgIC8qIHNpemU6IDQsIGNhY2hlbGluZXM6IDEsIG1lbWJlcnM6IDIgKi8NCj4+PiDC
oMKgwqDCoMKgwqDCoMKgIC8qIGxhc3QgY2FjaGVsaW5lOiA0IGJ5dGVzICovDQo+Pj4gfTsN
Cj4+PiBzdHJ1Y3QgcnNwaW5sb2NrIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHNwaW5sb2Nr
X3RpY2tldHNfdMKgwqDCoMKgwqDCoMKgwqAgdGlja2V0czvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKsKgwqDCoMKgIDAgNCAqLw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgdWludDE2
X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjdXJzZV9jcHU7wqDC
oMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNCAyICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oCB1aW50OF90wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjdXJz
ZV9jbnQ7wqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNiAxICovDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoCB1bmlvbiBsb2NrX2RlYnVnwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVidWc7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qwqDCoMKgwqAgNyAwICovDQo+Pj4N
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHNpemU6IDgsIGNhY2hlbGluZXM6IDEsIG1lbWJl
cnM6IDQgKi8NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIHBhZGRpbmc6IDEgKi8NCj4+PiDC
oMKgwqDCoMKgwqDCoMKgIC8qIGxhc3QgY2FjaGVsaW5lOiA4IGJ5dGVzICovDQo+Pj4gfTsN
Cj4+Pg0KPj4+DQo+Pj4gSSB0aGluayB3ZSBjb3VsZCBlbWJlZCBzcGlubG9ja190IGluIHJz
cGlubG9ja190IHdpdGhvdXQgaW5jcmVhc2luZyANCj4+PiByc3BpbmxvY2tfdC4gSGF2ZSB5
b3UgY29uc2lkZXJlZCBpdD8gVGhpcyBjb3VsZCByZWR1Y2UgdGhlIG51bWJlciBvZiBmdW5j
dGlvbiANCj4+PiBsZXZlbCBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzLg0KPj4NCj4+IFRo
YXQgd2FzIHRoZSBsYXlvdXQgaW4gdGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMu
IEphbiByZXF1ZXN0ZWQgdG8gY2hhbmdlDQo+PiBpdCB0byB0aGUgY3VycmVudCBsYXlvdXQg
WzFdLg0KPiANCj4gQWguLi4gTG9va2luZyB0aHJvdWdoIHRoZSByZWFzb25pbmcsIEkgaGF2
ZSB0byBkaXNhZ3JlZSB3aXRoIEphbiBhcmd1bWVudGF0aW9ucy4NCg0KSSB3b3VsZCBfcmVh
bGx5XyBoYXZlIGxpa2VkIHlvdSB0byBtZW50aW9uIHRoaXMgZGlzYWdyZWVtZW50IGJhY2sg
dGhlbiAoeW91J3ZlDQpiZWVuIG9uIENjOiBpbiB0aGUgdGhyZWFkLCB0b28pLg0KDQpMZXR0
aW5nIG1lIGRvIGEgbWFqb3IgcmV3b3JrIGFuZCB0aGVuIGFmdGVyIDIgbW9yZSBpdGVyYXRp
b25zIG9mIHRoZSBzZXJpZXMNCnJlcXVlc3RpbmcgdG8gdW5kbyBtb3N0IG9mIHRoZSB3b3Jr
IGlzbid0IGdyZWF0Lg0KDQo+IEF0IGxlYXN0IHdpdGggdGhlIGZ1bGwgc2VyaWVzIGFwcGxp
ZWQsIHRoZXJlIGlzIG5vIGluY3JlYXNlIG9mIHJzcGlubG9ja190IGluIA0KPiBkZWJ1ZyBi
dWlsZCAoaWYgd2UgY29tcGFyZSB0byB0aGUgdmVyc2lvbiB5b3UgcHJvdmlkZWQgaW4gdGhp
cyBzZXJpZXMpLg0KDQpUaGF0IHdhc24ndCBoaXMgc29sZSByZWFzb25pbmcsIHJpZ2h0Pw0K
DQo+IEZ1cnRoZXJtb3JlLCB0aGlzIGlzIGdvaW5nIHRvIHJlbW92ZSBhdCBsZWFzdCBwYXRj
aCAjNiBhbmQgIzguIFdlIHdvdWxkIHN0aWxsIA0KPiBuZWVkIG5yc3BpbmxvY2tfKiBiZWNh
dXNlIHRoZXkgY2FuIGp1c3QgYmUgd3JhcHBlciB0bw0KPiBzcGluX2JhcnJpZXIoJmxvY2st
PmxvY2spLg0KPiANCj4gVGhpcyBzaG91bGQgYWxzbyBzb2x2ZSBoaXMgY29uY2VybiBvZiB1
bndpZWxkeSBjb2RlOg0KPiANCj4gID4gK8KgwqDCoCBzcGluX2JhcnJpZXIoJnAybS0+cG9k
LmxvY2subG9jay5sb2NrKTsNCg0KWWVzLCBidXQgdGhlIGRlbWFuZCB0byBoYXZlIG9wdGlv
bmFsIGZpZWxkcyBhdCB0aGUgZW5kIG9mIHRoZSBzdHJ1Y3QgaXNuJ3QNCmNvdmVyZWQgYnkg
eW91ciByZXF1ZXN0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------Yzzd7twmFYD29Jf0kPtGdFU3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Yzzd7twmFYD29Jf0kPtGdFU3--

--------------Zvsf2x2Cjonl06wSCHdrcjHR--

--------------1czFYHZL9XLh5YAqN3goPvSl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5dqMFAwAAAAAACgkQsN6d1ii/Ey+4
jwf/ajN4/rlfp11S8Lk7uhG3+cvdgeoREymWYjJWhdtb+TMhxFEt7Dx2GjnnY9ehf5BP51jcPK8p
OWtOrVnlt1QVpmq9sPebWOUe3QsCUAHdBTDRrjKeo8X4U1cqx1iWqLA4Z3ubyjnndn6ZrozI2MwU
CPcsZE4BAGX5KQZbAbNaLycZvU4HlQ5qF0bexvHbpPg7Sd9rrDHo00u4RaGdHddBSUfx4vPhEjHF
TjPveUzscbvrD5LT05AnZAc3LjgTpGAm9gks2wtfjp8P3gxg5pAnh20zgJZddcd/EzWcoxHdH1LH
QjLjQqg6ehSd9SYUHVWjfpXtK4a+EzTh5Bzc9oxd3g==
=DgRK
-----END PGP SIGNATURE-----

--------------1czFYHZL9XLh5YAqN3goPvSl--

