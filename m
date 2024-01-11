Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F082ABAB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666105.1036566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs47-0000ni-5J; Thu, 11 Jan 2024 10:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666105.1036566; Thu, 11 Jan 2024 10:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs47-0000mB-1z; Thu, 11 Jan 2024 10:13:35 +0000
Received: by outflank-mailman (input) for mailman id 666105;
 Thu, 11 Jan 2024 10:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CYFo=IV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rNs44-0000m5-V4
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:13:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11adec6a-b06a-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 11:13:30 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEC0121E8F;
 Thu, 11 Jan 2024 10:13:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6405113635;
 Thu, 11 Jan 2024 10:11:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id hCHcFu++n2USBQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 11 Jan 2024 10:11:59 +0000
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
X-Inumbo-ID: 11adec6a-b06a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704967919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3BjA1LrwxV5AIWA3gA/Fe5aR0VRzQGP7vcxWnSASqJw=;
	b=URiEAx34QYm55HI0J5jGWyZef3vGBBqyrF/TVIVZFKiXrl1giV2rCKwwAA0AcV2drT3crL
	Om0geWBrJeB0VheQx4s4AyYUghrXzY2Nt20xhltdGvg3ls0YASk2//YUKkq+REMaJcW/VV
	k534Y8JV6mmsnd3dF0ttymqU5wdcAwY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1704967919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3BjA1LrwxV5AIWA3gA/Fe5aR0VRzQGP7vcxWnSASqJw=;
	b=URiEAx34QYm55HI0J5jGWyZef3vGBBqyrF/TVIVZFKiXrl1giV2rCKwwAA0AcV2drT3crL
	Om0geWBrJeB0VheQx4s4AyYUghrXzY2Nt20xhltdGvg3ls0YASk2//YUKkq+REMaJcW/VV
	k534Y8JV6mmsnd3dF0ttymqU5wdcAwY=
Message-ID: <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
Date: Thu, 11 Jan 2024 11:13:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: E820 memory allocation issue on Threadripper platforms
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Patrick Plenefisch <simonpatp@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
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
In-Reply-To: <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BjG7sAZd1yLEybfI0wGGSIdC"
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=URiEAx34
X-Spamd-Result: default: False [-7.20 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[suse.com,gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AEC0121E8F
X-Spam-Level: 
X-Spam-Score: -7.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BjG7sAZd1yLEybfI0wGGSIdC
Content-Type: multipart/mixed; boundary="------------T457Txab9UfEl0HQ8x9ig5rv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Patrick Plenefisch <simonpatp@gmail.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
Subject: Re: E820 memory allocation issue on Threadripper platforms
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
In-Reply-To: <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>

--------------T457Txab9UfEl0HQ8x9ig5rv
Content-Type: multipart/mixed; boundary="------------JqgJZdrBAc1igMyHZE4sHIRI"

--------------JqgJZdrBAc1igMyHZE4sHIRI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDEuMjQgMDk6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wMS4yMDI0
IDAzOjI5LCBQYXRyaWNrIFBsZW5lZmlzY2ggd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBJIHJh
biBpbnRvIGEgbWVtb3J5IGFsbG9jYXRpb24gaXNzdWUsIEkgdGhpbmsuIEl0IGlzIHRoZSBz
YW1lIGFzDQo+PiBodHRwczovL2dpdGh1Yi5jb20vUXViZXNPUy9xdWJlcy1pc3N1ZXMvaXNz
dWVzLzg3OTEgYW5kIEkgc2F3IGF0IHRoZSBlbmQgaXQNCj4+IHdhcyByZWNvbW1lbmRlZCAo
YnkgbWFybWFyZWspIHRoYXQgdGhlIGlzc3VlIHJlcG9ydGVyIGZvcndhcmQgdGhlIGlzc3Vl
IHRvDQo+PiB0aGlzIGxpc3QuIEkgc2VhcmNoZWQgdGhlIGxpc3QsIGJ1dCBhcyBJIGRpZG4n
dCBzZWUgaXQgaW4gdGhlIGxpc3QgYWxyZWFkeSwNCj4+IEknbSBkb2luZyB0aGF0IG5vdy4N
Cj4+DQo+PiBIYXJkd2FyZToNCj4+IEkgaGF2ZSBhbiBBTUQgVGhyZWFkcmlwcGVyIDc5NjBY
IG9uIGEgQVNSb2NrIFRSWDUwIFdTIG1vdGhlcmJvYXJkLiBUaGUNCj4+IFF1YmVzIHJlcG9y
dGVyIGhhZCBhIFRocmVhZHJpcHBlciAzOTcwWCBvbiBhbiBBU1VTIFByaW1lIFRSWDQwLVBy
bw0KPj4gTW90aGVyYm9hcmQuIEkgc2F3IGEgM3JkIGlzc3VlIHJlcG9ydCBvZiBhIHNpbWls
YXIgaXNzdWUgb24gYW5vdGhlcg0KPj4gVGhyZWFkcmlwcGVyLCBzbyBJIHRoaW5rIHRoaXMg
bWF5IGJlIFRocmVhZHJpcHBlci1zcGVjaWZpYy4NCj4+DQo+PiBTZXR1cDoNCj4+IFRoZSBR
dWViZXNPUyByZXBvcnRlciB3YXMgdXNpbmcgUXViZXMgSW5zdGFsbGVyLg0KPj4gTXkgaW5z
dGFsbCB3YXMgdGhhdCBJIGhhZCBhIGZyZXNoIGluc3RhbGwgb2YgRGViaWFuIDEyIChubyBn
dWkpLCBhbmQgdGhlbg0KPj4gZGlkIGBhcHQgaW5zdGFsbCB4ZW4tc3lzdGVtLWFtZDY0YCBh
bmQgcmVib290ZWQuDQo+Pg0KPj4gVGhlIGlzc3VlOg0KPj4gQW55IGJvb3Qgb2YgWGVuIG9u
IHRoZSBoYXJkd2FyZSByZXN1bHRzIGluIGEgaGFsdGVkIG1hY2hpbmUuIFdoZW4NCj4+IG1v
bml0b3JpbmcgdGhlIGxvZ3Mgd2l0aCBgdmdhPSxrZWVwYCwgd2UgZ2V0Og0KPj4NCj4+IChY
RU4pICoqKiBTZXJpYWwgaW5wdXQgdG8gRE9NMCAodHlwZSAnQ1RSTC1hJyB0aHJlZSB0aW1l
cyB0byBzd2l0Y2ggaW5wdXQpDQo+PiAoWEVOKSBGcmVlZCA2NDRrQiBpbml0IG1lbW9yeQ0K
Pj4gbWFwcGluZyBrZXJuZWwgaW50byBwaHlzaWNhbCBtZW1vcnkNCj4+IGFib3V0IHRvIGdl
dCBzdGFydGVk4oCmDQo+PiB4ZW4gaHlwZXJ2aXNvciBhbGxvY2F0ZWQga2VybmVsIG1lbW9y
eSBjb25mbGljdHMgd2l0aCBFODIwDQo+IA0KPiBTbyBmaXJzdCBvZiBhbGwgKHRoZSB0aXRs
ZSBkb2Vzbid0IHNheSBpdCkgdGhpcyBpcyBhIExpbnV4IERvbTAgaXNzdWUuDQo+IFdoZXRo
ZXIgb3Igbm90IG5lZWRpbmcgYWRkcmVzc2luZyBpbiBYZW4gaXMgdW5rbm93biBhdCB0aGlz
IHBvaW50Lg0KPiANCj4+IChYRU4pIEhhcmR3YXJlIERvbTAgaGFsdGVkOiBoYWx0aW5nIG1h
Y2hpbmUNCj4+DQo+PiBOb25lIG9mIHRoZSBzZXR0aW5ncyBJIG9yIHRoZSBRdWJlcyByZXBv
cnRlciBoYXZlIHRyaWVkIGhhdmUgYmVlbiBhYmxlIHRvDQo+PiBnZXQgcGFzdCB0aGlzIGZh
aWx1cmUuDQo+Pg0KPj4gSSBhbSBoYXBweSB0byBwcm92aWRlIGRlYnVnZ2luZyBzdXBwb3J0
Lg0KPiANCj4gV2VsbCwgdGhlIGNydWNpYWwgcGllY2Ugb2YgZGF0YSBpbml0aWFsbHkgaXMg
Z29pbmcgdG8gYmU6IFdoYXQncyB0aGUNCj4gRTgyMCBtYXAgWGVuIGdldHMgdG8gc2VlLCB3
aGF0J3MgdGhlIEU4MjAgbWFwIERvbTAgZ2V0cyB0byBzZWUsIGFuZA0KPiB3aGF0IGFkZHJl
c3MgcmFuZ2UgaXMgdGhlIGNvbmZsaWN0IGRldGVjdGVkIGZvcj8gVGhlIGZpcnN0IHF1ZXN0
aW9uDQo+IGlzIHBvc3NpYmxlIHRvIGFuc3dlciBieSBzdXBwbHlpbmcgYSBzZXJpYWwgbG9n
LiBUaGUgc2Vjb25kIHF1ZXN0aW9uDQo+IGxpa2VseSBtZWFucyBhZGRpbmcgc29tZSBkZWJ1
Z2dpbmcgY29kZSB0byBlaXRoZXIgWGVuIG9yIExpbnV4LiBUaGUNCj4gYW5zd2VyIHRvIHRo
aXJkIHF1ZXN0aW9uIG1heSBiZSBwb3NzaWJsZSB0byBpbmZlciBmcm9tIHRoZSBvdGhlcg0K
PiBkYXRhLCBidXQgd291bGQgbGlrZWx5IGJlIGJldHRlciB0byBvYnRhaW4gZXhwbGljaXRs
eSBieSBhZGp1c3RpbmcgLw0KPiBhbWVuZGluZyB0aGUgbWVzc2FnZSBMaW51eCBlbWl0cy4N
Cg0KVGhlIG5lZWRlZCBpbmZvcm1hdGlvbiBzaG91bGQgYWxsIGJlIGluIHRoZSBoeXBlcnZp
c29yIG1lc3NhZ2VzLg0KDQpUaGUgaHlwZXJ2aXNvciBpcyBpbml0aWFsbHkgcHJlc2VudGlu
ZyBhIG1lbW9yeSBtYXAgdG8gZG9tMCB3aGljaCBpcyBub3QgdGhlDQpzYW1lIGFzIHRoZSBu
YXRpdmUgbWVtb3J5IG1hcC4gRG9tMCB0cmllcyB0byByZWFycmFuZ2UgaXRzIG1lbW9yeSBs
YXlvdXQgdG8NCmJlIGNvbXBhdGlibGUgd2l0aCB0aGUgbmF0aXZlIG1lbW9yeSBtYXAuDQoN
ClRoZSBzZWVuIG1lc3NhZ2UgKCJ4ZW4gaHlwZXJ2aXNvciBhbGxvY2F0ZWQga2VybmVsIG1l
bW9yeSBjb25mbGljdHMgd2l0aCBFODIwIikNCnRlbGxzIHVzIHRoYXQgdGhlIGtlcm5lbCBw
b3NpdGlvbiBpcyBjb25mbGljdGluZyB3aXRoIHRoZSBuYXRpdmUgbWVtb3J5IG1hcA0KKGF0
IGxlYXN0IG9uZSBndWVzdCBwZm4gb2NjdXBpZWQgYnkgdGhlIGtlcm5lbCB3b3VsZCBiZSBh
dCBhIG5vbi1SQU0gcG9wdWxhdGVkDQpsb2NhdGlvbiBhZnRlciByZWFycmFuZ2VtZW50IG9m
IG1lbW9yeSkuDQoNCkluIHRoZW9yeSBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBjb3ZlciB0
aGlzIGNhc2UsIHRvbywgYnV0IGl0IHdvdWxkIGJlIHF1aXRlDQpjdW1iZXJzb21lLiBSaWdo
dCBub3cgb25seSB0aGUgaW5pdHJkIGlzIGFsbG93ZWQgdG8gY29uZmxpY3Qgd2l0aCB0aGUg
bWVtb3J5IG1hcA0KKGl0IHdpbGwgYmUgbW92ZWQgaW4gdGhpcyBjYXNlKSwga2VybmVsIGFu
ZCBpbml0aWFsIHBhZ2UgdGFibGUgY29uZmxpY3RzIGFyZSBub3QNCmhhbmRsZWQuDQoNCldo
ZW4gSSBhZGRlZCB0aGUgY29uZmxpY3QgaGFuZGxpbmcgbmVhcmx5IDEwIHllYXJzIGFnbywg
dGhlcmUgd2FzIG5vIGhhcmR3YXJlDQprbm93biB0byBoYXZlIG1lbW9yeSBob2xlcyBhdCBh
ZGRyZXNzZXMgd2hpY2ggd291bGQgY29uZmxpY3Qgd2l0aCBYZW4ncyBpbml0aWFsDQppZGVh
IG9mIGRvbTAgbWVtb3J5IGxheW91dC4NCg0KSSBjYW4gbG9vayBpbnRvIHRoaXMgbGF0ZXIs
IGJ1dCByaWdodCBub3cgSSdtIGp1c3QgYWJvdXQgdG8gZ28gb2ZmbGluZSBwcm9iYWJseQ0K
dW50aWwgZW5kIG9mIEphbnVhcnkuDQoNCg0KSnVlcmdlbg0K
--------------JqgJZdrBAc1igMyHZE4sHIRI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------JqgJZdrBAc1igMyHZE4sHIRI--

--------------T457Txab9UfEl0HQ8x9ig5rv--

--------------BjG7sAZd1yLEybfI0wGGSIdC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmWfv0kFAwAAAAAACgkQsN6d1ii/Ey8h
Pwf/VvLB39hRRZ30T5WB29Qy6S6n5POrf1wBje+fTU8U/fD44+CZGvN7tu/xUy/4QhVQCuFujUGe
5+t5Vh4plJKnTjV0ongB7zzF/MGzm+h6d4vzACk3ivBei02Z9492gBMjrZCN/FhHN5fFIPhodx+r
cZ4vMB8o2VzdynXWzhQb4dHZATXQv0y0TM1Ts//JVAcWZ4Wg8TvxvHNda1oWwKCxhMBmPUrqRx8F
Z5i4crkKv2bw5KsrU/X/5pniFbFgTvOPji9oDilfdOsuoZFmRp3Ui3i3pTthLVg4AvVRl5c2YouS
gPoZM7VGayiA9/ZxGh6jAaKIpqjjNNc6kmdqrfBe2w==
=6zqn
-----END PGP SIGNATURE-----

--------------BjG7sAZd1yLEybfI0wGGSIdC--

