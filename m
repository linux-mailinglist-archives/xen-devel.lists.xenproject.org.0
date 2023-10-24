Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B37D4F76
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:08:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621874.968741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGCx-0004WD-Bt; Tue, 24 Oct 2023 12:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621874.968741; Tue, 24 Oct 2023 12:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGCx-0004UY-8U; Tue, 24 Oct 2023 12:08:27 +0000
Received: by outflank-mailman (input) for mailman id 621874;
 Tue, 24 Oct 2023 12:08:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CJyy=GG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qvGCv-0004US-D3
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:08:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055ed133-7266-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 14:08:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA7481FE68;
 Tue, 24 Oct 2023 12:08:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81B6A134F5;
 Tue, 24 Oct 2023 12:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id alu+HbKzN2V2WwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 24 Oct 2023 12:08:18 +0000
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
X-Inumbo-ID: 055ed133-7266-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698149298; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mywBBHv2y8WjBsk+dH4go69eBtkULHdwxKcLdRi3JPg=;
	b=fsheurC7AcK2I09/z5tKJahtyJavDKZvpGvLm4APv3I+XRUxCVUHf03Gf7mun7uNioKyOp
	J4CvvagbdOScUX1f2qEXoLcyEpq30dgbMVTtHzJh2JDUuOZPasAL2IdWu4oRLfAtKnZsWZ
	Vqdqc+9OaztoARfSMiO/ZQ4+txhk74E=
Message-ID: <0a2725ee-a1a8-43e4-b117-f474ffb392a8@suse.com>
Date: Tue, 24 Oct 2023 14:08:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
 <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
 <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>
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
In-Reply-To: <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5gCY434GYIiPdm8xUJiVwmC3"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.99
X-Spamd-Result: default: False [-7.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain,text/x-patch];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 TO_DN_ALL(0.00)[];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~,6:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5gCY434GYIiPdm8xUJiVwmC3
Content-Type: multipart/mixed; boundary="------------QWsv01t6A6nc4g6x7zhes8ka";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: David Woodhouse <dwmw2@infradead.org>,
 xen-devel <xen-devel@lists.xenproject.org>, paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>
Message-ID: <0a2725ee-a1a8-43e4-b117-f474ffb392a8@suse.com>
Subject: Re: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
References: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
 <c75a3d53-fc36-46a6-b781-f16e1e5c6226@suse.com>
 <662772ec0d43cce9233680d67d7114bc8b0ed48d.camel@infradead.org>
 <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>
In-Reply-To: <8e6c144f-f808-4603-8de4-76decc3c2838@suse.com>

--------------QWsv01t6A6nc4g6x7zhes8ka
Content-Type: multipart/mixed; boundary="------------PhxH83cbsuQZ55H2a2TQ3J92"

--------------PhxH83cbsuQZ55H2a2TQ3J92
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTAuMjMgMTI6NDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDI0LjEwLjIz
IDA5OjQzLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6DQo+PiBPbiBUdWUsIDIwMjMtMTAtMjQg
YXQgMDg6NTMgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4NCj4+PiBJJ20gcHV6
emxlZC4gVGhpcyBwYXRoIGRvZXNuJ3QgY29udGFpbiBhbnkgb2YgdGhlIFJDVSB1c2FnZSBJ
J3ZlIGFkZGVkIGluDQo+Pj4gY29tbWl0IDg3Nzk3ZmFkNmNjZS4NCj4+Pg0KPj4+IEFyZSB5
b3Ugc3VyZSB0aGF0IHdpdGgganVzdCByZXZlcnRpbmcgY29tbWl0IDg3Nzk3ZmFkNmNjZSB0
aGUgaXNzdWUgZG9lc24ndA0KPj4+IG1hbmlmZXN0IGFueW1vcmU/IEknZCByYXRoZXIgZXhw
ZWN0IGNvbW1pdCA3MjEyNTViOTgyNmIgaGF2aW5nIGNhdXNlZCB0aGlzDQo+Pj4gYmVoYXZp
b3IsIGp1c3QgdGVsbGluZyBmcm9tIHRoZSBtZXNzYWdlcyBhYm92ZS4NCj4+DQo+PiBSZXRl
c3RpbmcgaW4gdGhlIGNvbGQgbGlnaHQgb2YgZGF5LCB5ZXMuIFVzaW5nIHY2LjYtcmM1IHdo
aWNoIGlzIHRoZQ0KPj4gcGFyZW50IGNvbW1pdCBvZiB0aGUgb2ZmZW5kaW5nIDg3Nzk3ZmFk
NmNjZS4NCj4+DQo+PiBJIG5vdyBzZWUgdGhpcyB3YXJuaW5nIGF0IGJvb3QgdGltZSBhZ2Fp
biwgd2hpY2ggSSBiZWxpZXZlIHdhcyBhbg0KPj4gYXNwZWN0IG9mIHdoYXQgeW91IHdlcmUg
dHJ5aW5nIHRvIGZpeDoNCj4+DQo+PiBbwqDCoMKgIDAuMDU5MDE0XSB4ZW46ZXZlbnRzOiBV
c2luZyBGSUZPLWJhc2VkIEFCSQ0KPj4gW8KgwqDCoCAwLjA1OTAyOV0geGVuOmV2ZW50czog
WGVuIEhWTSBjYWxsYmFjayB2ZWN0b3IgZm9yIGV2ZW50IGRlbGl2ZXJ5IGlzIGVuYWJsZWQN
Cj4+IFvCoMKgwqAgMC4wNTkyMjddIHJjdTogc3JjdV9pbml0OiBTZXR0aW5nIHNyY3Vfc3Ry
dWN0IHNpemVzIGJhc2VkIG9uIGNvbnRlbnRpb24uDQo+PiBbwqDCoMKgIDAuMDU5Mjk2XQ0K
Pj4gW8KgwqDCoCAwLjA1OTI5N10gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4+
IFvCoMKgwqAgMC4wNTkyOThdIFsgQlVHOiBJbnZhbGlkIHdhaXQgY29udGV4dCBdDQo+PiBb
wqDCoMKgIDAuMDU5Mjk5XSA2LjYuMC1yYzUgIzEzNzQgTm90IHRhaW50ZWQNCj4+IFvCoMKg
wqAgMC4wNTkzMDBdIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiBbwqDCoMKg
IDAuMDU5MzAxXSBzd2FwcGVyLzAvMCBpcyB0cnlpbmcgdG8gbG9jazoNCj4+IFvCoMKgwqAg
MC4wNTkzMDNdIGZmZmZmZmZmOGFkNTk1ZjggKGV2dGNobl9yd2xvY2spey4uLi59LXszOjN9
LCBhdDogDQo+PiB4ZW5fZXZ0Y2huX2RvX3VwY2FsbCsweDU5LzB4ZDANCj4gDQo+IEluZGVl
ZC4NCj4gDQo+IFdoYXQgSSBzdGlsbCBub3QgZ2V0IGlzIHdoeSB0aGUgcmN1X2RlcmVmZXJl
bmNlX2NoZWNrKCkgc3BsYXQgaXNuJ3QNCj4gaGFwcGVuaW5nIHdpdGhvdXQgbXkgcGF0Y2gu
DQo+IA0KPiBJTUhPIGl0IHNob3VsZCBiZSByZWxhdGVkIHRvIHRoZSBmYWN0IHRoYXQgY3B1
aHBfcmVwb3J0X2lkbGVfZGVhZCgpDQo+IGlzIHRyeWluZyB0byBzZW5kIGFuIElQSSB2aWEg
eGVuX3NlbmRfSVBJX29uZSgpLCB3aGljaCBpcyB1c2luZw0KPiBub3RpZnlfcmVtb3RlX3Zp
YV9pcnEoKSwgd2hpY2ggaW4gdHVybiBuZWVkcyB0byBjYWxsIGlycV9nZXRfY2hpcF9kYXRh
KCkuDQo+IFRoaXMgaXMgdXNpbmcgdGhlIG1hcGxlLXRyZWUgc2luY2UgNzIxMjU1Yjk4MjZi
LCB3aGljaCBpcyB1c2luZw0KPiByY3VfcmVhZF9sb2NrKCkuDQo+IA0KPiBJIGNhbiBwcm9i
YWJseSBjaGFuZ2UgeGVuX3NlbmRfSVBJX29uZSgpIHRvIG5vdCBuZWVkIGlycV9nZXRfY2hp
cF9kYXRhKCkuDQoNCkRhdmlkLCBjb3VsZCB5b3UgdGVzdCB0aGUgYXR0YWNoZWQgcGF0Y2gs
IHBsZWFzZT8gQnVpbGQgdGVzdGVkIG9ubHkuDQoNCg0KSnVlcmdlbg0K
--------------PhxH83cbsuQZ55H2a2TQ3J92
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-events-avoid-using-info_for_irq-in-xen_send_IPI_.patch"
Content-Disposition: attachment;
 filename*0="0001-xen-events-avoid-using-info_for_irq-in-xen_send_IPI_.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5YmNiN2I4NjU3OGRiNGMxNGY0NjBjZTk1NGViMzViODIxZTExYWQ4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFR1ZSwgMjQgT2N0IDIwMjMgMTM6NTE6MzYgKzAyMDAKU3ViamVjdDogW1BBVENI
XSB4ZW4vZXZlbnRzOiBhdm9pZCB1c2luZyBpbmZvX2Zvcl9pcnEoKSBpbiB4ZW5fc2VuZF9J
UElfb25lKCkKCnhlbl9zZW5kX0lQSV9vbmUoKSBpcyBiZWluZyB1c2VkIGJ5IGNwdWhwX3Jl
cG9ydF9pZGxlX2RlYWQoKSBhZnRlcgppdCBjYWxscyByY3VfcmVwb3J0X2RlYWQoKSwgbWVh
bmluZyB0aGF0IGFueSBSQ1UgdXNhZ2UgYnkKeGVuX3NlbmRfSVBJX29uZSgpIGlzIGEgYmFk
IGlkZWEuCgpVbmZvcnR1bmF0ZWx5IHhlbl9zZW5kX0lQSV9vbmUoKSBpcyB1c2luZyBub3Rp
ZnlfcmVtb3RlX3ZpYV9pcnEoKQp0b2RheSwgd2hpY2ggaXMgdXNpbmcgaXJxX2dldF9jaGlw
X2RhdGEoKSB2aWEgaW5mb19mb3JfaXJxKCkuIEFuZAppcnFfZ2V0X2NoaXBfZGF0YSgpIGlu
IHR1cm4gaXMgdXNpbmcgYSBtYXBsZS10cmVlIGxvb2t1cCByZXF1aXJpbmcKUkNVLgoKQXZv
aWQgdGhpcyBwcm9ibGVtIGJ5IGNhY2hpbmcgdGhlIGlwaSBldmVudCBjaGFubmVscyBpbiBh
bm90aGVyCnBlcmNwdSB2YXJpYWJsZSwgYWxsb3dpbmcgdGhlIHVzZSBub3RpZnlfcmVtb3Rl
X3ZpYV9ldnRjaG4oKSBpbgp4ZW5fc2VuZF9JUElfb25lKCkuCgpGaXhlczogNzIxMjU1Yjk4
MjZiICgiZ2VuaXJxOiBVc2UgYSBtYXBsZSB0cmVlIGZvciBpbnRlcnJ1cHQgZGVzY3JpcHRv
ciBtYW5hZ2VtZW50IikKUmVwb3J0ZWQtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5m
cmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgotLS0KIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIHwgMTIgKysrKysr
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJp
dmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKaW5kZXggMWIyMTM2ZmUwZmE1Li4yY2Yw
YzJiNjkzODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5j
CisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCkBAIC0xNjQsNiArMTY0
LDggQEAgc3RhdGljIERFRklORV9QRVJfQ1BVKGludCBbTlJfVklSUVNdLCB2aXJxX3RvX2ly
cSkgPSB7WzAgLi4uIE5SX1ZJUlFTLTFdID0gLTF9OwogCiAvKiBJUlEgPC0+IElQSSBtYXBw
aW5nICovCiBzdGF0aWMgREVGSU5FX1BFUl9DUFUoaW50IFtYRU5fTlJfSVBJU10sIGlwaV90
b19pcnEpID0ge1swIC4uLiBYRU5fTlJfSVBJUy0xXSA9IC0xfTsKKy8qIENhY2hlIGZvciBJ
UEkgZXZlbnQgY2hhbm5lbHMgLSBuZWVkZWQgZm9yIGhvdCBjcHUgdW5wbHVnIChhdm9pZCBS
Q1UgdXNhZ2UpLiAqLworc3RhdGljIERFRklORV9QRVJfQ1BVKGV2dGNobl9wb3J0X3QgW1hF
Tl9OUl9JUElTXSwgaXBpX3RvX2V2dGNobikgPSB7WzAgLi4uIFhFTl9OUl9JUElTLTFdID0g
MH07CiAKIC8qIEV2ZW50IGNoYW5uZWwgZGlzdHJpYnV0aW9uIGRhdGEgKi8KIHN0YXRpYyBh
dG9taWNfdCBjaGFubmVsc19vbl9jcHVbTlJfQ1BVU107CkBAIC0zNjYsNiArMzY4LDcgQEAg
c3RhdGljIGludCB4ZW5faXJxX2luZm9faXBpX3NldHVwKHVuc2lnbmVkIGNwdSwKIAlpbmZv
LT51LmlwaSA9IGlwaTsKIAogCXBlcl9jcHUoaXBpX3RvX2lycSwgY3B1KVtpcGldID0gaXJx
OworCXBlcl9jcHUoaXBpX3RvX2V2dGNobiwgY3B1KVtpcGldID0gZXZ0Y2huOwogCiAJcmV0
dXJuIHhlbl9pcnFfaW5mb19jb21tb25fc2V0dXAoaW5mbywgaXJxLCBJUlFUX0lQSSwgZXZ0
Y2huLCAwKTsKIH0KQEAgLTk4MSw2ICs5ODQsNyBAQCBzdGF0aWMgdm9pZCBfX3VuYmluZF9m
cm9tX2lycSh1bnNpZ25lZCBpbnQgaXJxKQogCQkJYnJlYWs7CiAJCWNhc2UgSVJRVF9JUEk6
CiAJCQlwZXJfY3B1KGlwaV90b19pcnEsIGNwdSlbaXBpX2Zyb21faXJxKGlycSldID0gLTE7
CisJCQlwZXJfY3B1KGlwaV90b19ldnRjaG4sIGNwdSlbaXBpX2Zyb21faXJxKGlycSldID0g
MDsKIAkJCWJyZWFrOwogCQljYXNlIElSUVRfRVZUQ0hOOgogCQkJZGV2ID0gaW5mby0+dS5p
bnRlcmRvbWFpbjsKQEAgLTE2MzEsNyArMTYzNSw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGV2
dGNobl9wdXQpOwogCiB2b2lkIHhlbl9zZW5kX0lQSV9vbmUodW5zaWduZWQgaW50IGNwdSwg
ZW51bSBpcGlfdmVjdG9yIHZlY3RvcikKIHsKLQlpbnQgaXJxOworCWV2dGNobl9wb3J0X3Qg
ZXZ0Y2huOwogCiAjaWZkZWYgQ09ORklHX1g4NgogCWlmICh1bmxpa2VseSh2ZWN0b3IgPT0g
WEVOX05NSV9WRUNUT1IpKSB7CkBAIC0xNjQyLDkgKzE2NDYsOSBAQCB2b2lkIHhlbl9zZW5k
X0lQSV9vbmUodW5zaWduZWQgaW50IGNwdSwgZW51bSBpcGlfdmVjdG9yIHZlY3RvcikKIAkJ
cmV0dXJuOwogCX0KICNlbmRpZgotCWlycSA9IHBlcl9jcHUoaXBpX3RvX2lycSwgY3B1KVt2
ZWN0b3JdOwotCUJVR19PTihpcnEgPCAwKTsKLQlub3RpZnlfcmVtb3RlX3ZpYV9pcnEoaXJx
KTsKKwlldnRjaG4gPSBwZXJfY3B1KGlwaV90b19ldnRjaG4sIGNwdSlbdmVjdG9yXTsKKwlC
VUdfT04oZXZ0Y2huID09IDApOworCW5vdGlmeV9yZW1vdGVfdmlhX2V2dGNobihldnRjaG4p
OwogfQogCiBzdHJ1Y3QgZXZ0Y2huX2xvb3BfY3RybCB7Ci0tIAoyLjM1LjMKCg==
--------------PhxH83cbsuQZ55H2a2TQ3J92
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------PhxH83cbsuQZ55H2a2TQ3J92--

--------------QWsv01t6A6nc4g6x7zhes8ka--

--------------5gCY434GYIiPdm8xUJiVwmC3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU3s7IFAwAAAAAACgkQsN6d1ii/Ey8Y
Uwf/V7rWZz7C6yXEnESPcaa3BrHIaij8RRmOVMEPpCrRYrunW6ionghV8pKGVKCN9FeUtTuv6Ncz
pYsf91H7SVcfog188zrXazuJ4ezBHnslg7Omx00EXVITRZfIfjwQ0RwnOwug+FMQfBf0hK9TAzVQ
X5wf815gCNuPnG2IyqX+0yaKDW+d9qb6lqlQGT4ZReKKddOU+a3stuCG+GH5rF1NVV7uXGSuuB+D
Lfg5bcEN4F/pf+DF5eAyoTFEcBXL2xZYD48f0ibkVXjbVuN6yoWWXokNdQfTRxrkkrURGCxRvQ8k
0aNE++JWvpsT+Hnm0Dw6OA4NkwnvENvkwXAiPFmJNw==
=XCno
-----END PGP SIGNATURE-----

--------------5gCY434GYIiPdm8xUJiVwmC3--

