Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C63B11A66
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 11:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057556.1425428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufEHh-00033x-Qq; Fri, 25 Jul 2025 09:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057556.1425428; Fri, 25 Jul 2025 09:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufEHh-00032C-Mx; Fri, 25 Jul 2025 09:00:09 +0000
Received: by outflank-mailman (input) for mailman id 1057556;
 Fri, 25 Jul 2025 09:00:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufEHg-0002xA-Ff
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 09:00:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2cd7341-6935-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 11:00:07 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C87BB1F76C;
 Fri, 25 Jul 2025 09:00:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 91EE4134E8;
 Fri, 25 Jul 2025 09:00:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BygoIpVHg2hSaAAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 25 Jul 2025 09:00:05 +0000
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
X-Inumbo-ID: c2cd7341-6935-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753434006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XTksNkKnE0owIIWVHf7kZ8gg+F/a5ufKTZ2UC+GS7NE=;
	b=mx5E2YLSO4/Rw3q9+LRllWpmfACZkeeWqvrz2fEfY521gSnrM+bRNYozBm1KKvTt2Aq761
	sDHL/nY2D3S3M26F6D4ATU+F9Mm/SOT7ih8mCL8OKvxtacwBFn945VFU9gK9BR7lfuQtm+
	kNoPCJQM4QNiiFiugRwLM0YiaZaNjtI=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tHM0nBWE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1753434005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XTksNkKnE0owIIWVHf7kZ8gg+F/a5ufKTZ2UC+GS7NE=;
	b=tHM0nBWEyzuCb3+rM/aYr2mNOvv5B+HPJvu5KSrckoRBOg9MsaLJjwgSodkF4cs+yxO9n2
	OK7l4KntUToUTOf2+glxdEORfcUmRXbYoEUFbsDuOdi5jd+qsvmk+rh8HJCuudL/bsCgZv
	QglMlIIa4wwui6lpcVCSML+dRsjYoMI=
Message-ID: <4d272577-98ce-4822-a03e-306d9a129fb6@suse.com>
Date: Fri, 25 Jul 2025 11:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tools/xenstored: add server feature support
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-5-jgross@suse.com>
 <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
 <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
Content-Language: en-US
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
In-Reply-To: <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qexFzL5S5Z9HjNdBv7fzSxpX"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: C87BB1F76C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qexFzL5S5Z9HjNdBv7fzSxpX
Content-Type: multipart/mixed; boundary="------------8Rx2EXRVjFCyjT3iJ3gkAEO6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <4d272577-98ce-4822-a03e-306d9a129fb6@suse.com>
Subject: Re: [PATCH 4/7] tools/xenstored: add server feature support
References: <20250722140628.28947-1-jgross@suse.com>
 <20250722140628.28947-5-jgross@suse.com>
 <ef0e3aed-453a-4930-a8ff-152748464c43@amd.com>
 <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>
In-Reply-To: <5f885d03-7c05-445a-a80b-cbb41a14346c@suse.com>

--------------8Rx2EXRVjFCyjT3iJ3gkAEO6
Content-Type: multipart/mixed; boundary="------------6AvTwhOSfxpBDMYITAGhXtNt"

--------------6AvTwhOSfxpBDMYITAGhXtNt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDc6MTgsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDI1LjA3LjI1
IDAwOjQ4LCBKYXNvbiBBbmRyeXVrIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAyMDI1LTA3LTIy
IDEwOjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IEFkZCBwZXIgZG9tYWluIHNlcnZl
ciBmZWF0dXJlcywgd2hpY2ggYXJlIGluaXRpYWxpemVkIGJ5IHRoZSBzdXBwb3J0ZWQNCj4+
PiBmZWF0dXJlcyBhdCBkb21haW4gaW50cm9kdWN0aW9uLCBvciBieSBsaXZlIHVwZGF0ZSBm
cm9tIHRoZSBtaWdyYXRpb24NCj4+PiBzdHJlYW0uIFRoaXMgcmVxdWlyZXMgdG8gYWRkIHRo
ZSBET01BSU5fREFUQSByZWNvcmQgdG8gdGhlIG1pZ3JhdGlvbg0KPj4+IHN0cmVhbSwgYnV0
IGZvciBub3cgaXQgd2lsbCBvbmx5IGNvbnRhaW4gdGhlIGZlYXR1cmUgd29yZC4NCj4+Pg0K
Pj4+IEFkdmVydGlzZSB0aGUgWGVuc3RvcmUgZmVhdHVyZXMgdG8gZ3Vlc3RzIGJ5IHNldHRp
bmcgdGhlIGFwcHJvcHJpYXRlDQo+Pj4gYml0cyBpbiB0aGUgcmluZyBwYWdlLg0KPj4+DQo+
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+
IC0tLQ0KPj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9kb21haW4uYyB8IDcxICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+PiDCoCB0b29scy94ZW5zdG9yZWQv
ZG9tYWluLmggfMKgIDMgKysNCj4+PiDCoCB0b29scy94ZW5zdG9yZWQvbHUuY8KgwqDCoMKg
IHwgMTQgKysrKysrLS0NCj4+PiDCoCB0b29scy94ZW5zdG9yZWQvbHUuaMKgwqDCoMKgIHzC
oCAyICstDQo+Pj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZWQvZG9t
YWluLmMgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+PiBpbmRleCBlMWQ1ZThkNjE0
Li5mNmQyNGJjMTNhIDEwMDY0NA0KPj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4u
Yw0KPj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4+IEBAIC0zMiw2ICsz
Miw3IEBADQo+Pj4gwqAgI2luY2x1ZGUgInRyYW5zYWN0aW9uLmgiDQo+Pj4gwqAgI2luY2x1
ZGUgIndhdGNoLmgiDQo+Pj4gwqAgI2luY2x1ZGUgImNvbnRyb2wuaCINCj4+PiArI2luY2x1
ZGUgImx1LmgiDQo+Pj4gwqAgI2luY2x1ZGUgPHhlbmV2dGNobi5oPg0KPj4+IMKgICNpbmNs
dWRlIDx4ZW5tYW5hZ2UuaD4NCj4+PiBAQCAtNDIsNiArNDMsOCBAQA0KPj4+IMKgICNpbmNs
dWRlIDxtaW5pLW9zL3hlbmJ1cy5oPg0KPj4+IMKgICNlbmRpZg0KPj4+ICsjZGVmaW5lIFhF
TlNUT1JFX0ZFQVRVUkVTwqDCoMKgIFhFTlNUT1JFX1NFUlZFUl9GRUFUVVJFX0VSUk9SDQo+
Pj4gKw0KPj4+IMKgIHN0YXRpYyB4ZW5tYW5hZ2VfaGFuZGxlICp4bV9oYW5kbGU7DQo+Pj4g
wqAgeGVuZ250dGFiX2hhbmRsZSAqKnhndF9oYW5kbGU7DQo+Pj4gwqAgc3RhdGljIGV2dGNo
bl9wb3J0X3QgdmlycV9wb3J0Ow0KPj4+IEBAIC0xMTUsNiArMTE4LDkgQEAgc3RydWN0IGRv
bWFpbg0KPj4+IMKgwqDCoMKgwqAgLyogRXZlbnQgY2hhbm5lbCBwb3J0ICovDQo+Pj4gwqDC
oMKgwqDCoCBldnRjaG5fcG9ydF90IHBvcnQ7DQo+Pj4gK8KgwqDCoCAvKiBTZXJ2ZXIgZmVh
dHVyZXMgc3VwcG9ydGVkIGZvciB0aGlzIGRvbWFpbi4gKi8NCj4+PiArwqDCoMKgIHVuc2ln
bmVkIGludCBmZWF0dXJlczsNCj4+PiArDQo+Pj4gwqDCoMKgwqDCoCAvKiBEb21haW4gcGF0
aCBpbiBzdG9yZS4gKi8NCj4+PiDCoMKgwqDCoMKgIGNoYXIgKnBhdGg7DQo+Pj4gQEAgLTc5
OSw2ICs4MDUsNyBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiAqYWxsb2NfZG9tYWluKGNvbnN0
IHZvaWQgKmNvbnRleHQsIA0KPj4+IHVuc2lnbmVkIGludCBkb21pZCwNCj4+PiDCoMKgwqDC
oMKgIGRvbWFpbi0+dW5pcXVlX2lkID0gdW5pcXVlX2lkOw0KPj4+IMKgwqDCoMKgwqAgZG9t
YWluLT5nZW5lcmF0aW9uID0gZ2VuZXJhdGlvbjsNCj4+PiDCoMKgwqDCoMKgIGRvbWFpbi0+
aW50cm9kdWNlZCA9IGZhbHNlOw0KPj4+ICvCoMKgwqAgZG9tYWluLT5mZWF0dXJlcyA9IFhF
TlNUT1JFX0ZFQVRVUkVTOw0KPj4+IMKgwqDCoMKgwqAgaWYgKGhhc2h0YWJsZV9hZGQoZG9t
aGFzaCwgJmRvbWFpbi0+ZG9taWQsIGRvbWFpbikpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgdGFsbG9jX2ZyZWUoZG9tYWluKTsNCj4+PiBAQCAtOTkyLDcgKzk5OSw4IEBAIHZvaWQg
aWdub3JlX2Nvbm5lY3Rpb24oc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIHVuc2lnbmVkIA0K
Pj4+IGludCBlcnIpDQo+Pj4gwqAgew0KPj4+IMKgwqDCoMKgwqAgdHJhY2UoIkNPTk4gJXAg
aWdub3JlZCwgcmVhc29uICV1XG4iLCBjb25uLCBlcnIpOw0KPj4+IC3CoMKgwqAgaWYgKGNv
bm4tPmRvbWFpbiAmJiBjb25uLT5kb21haW4tPmludGVyZmFjZSkNCj4+PiArwqDCoMKgIGlm
IChjb25uLT5kb21haW4gJiYgY29ubi0+ZG9tYWluLT5pbnRlcmZhY2UgJiYNCj4+PiArwqDC
oMKgwqDCoMKgwqAgKGNvbm4tPmRvbWFpbi0+ZmVhdHVyZXMgJiBYRU5TVE9SRV9TRVJWRVJf
RkVBVFVSRV9FUlJPUikpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm4tPmRvbWFpbi0+
aW50ZXJmYWNlLT5lcnJvciA9IGVycjsNCj4+PiDCoMKgwqDCoMKgIGNvbm4tPmlzX2lnbm9y
ZWQgPSB0cnVlOw0KPj4+IEBAIC0xMDc4LDExICsxMDg2LDE0IEBAIGludCBkb19pbnRyb2R1
Y2UoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiANCj4+PiAqY29ubiwNCj4+
PiDCoMKgwqDCoMKgIGRvbWFpbl9jb25uX3Jlc2V0KGRvbWFpbik7DQo+Pj4gLcKgwqDCoCBp
ZiAoZG9tYWluLT5pbnRlcmZhY2UgIT0gTlVMTCAmJg0KPj4+IC3CoMKgwqDCoMKgwqDCoCBk
b21haW4tPmludGVyZmFjZS0+Y29ubmVjdGlvbiA9PSBYRU5TVE9SRV9SRUNPTk5FQ1QpIHsN
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgLyogTm90aWZ5IHRoZSBkb21haW4gdGhhdCB4ZW5zdG9y
ZSBpcyBhdmFpbGFibGUgKi8NCj4+PiAtwqDCoMKgwqDCoMKgwqAgZG9tYWluLT5pbnRlcmZh
Y2UtPmNvbm5lY3Rpb24gPSBYRU5TVE9SRV9DT05ORUNURUQ7DQo+Pj4gLcKgwqDCoMKgwqDC
oMKgIHhlbmV2dGNobl9ub3RpZnkoeGNlX2hhbmRsZSwgZG9tYWluLT5wb3J0KTsNCj4+PiAr
wqDCoMKgIGlmIChkb21haW4tPmludGVyZmFjZSAhPSBOVUxMKSB7DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGRvbWFpbi0+aW50ZXJmYWNlLT5zZXJ2ZXJfZmVhdHVyZXMgPSBkb21haW4tPmZl
YXR1cmVzOw0KDQpJIGp1c3QgcmVhbGl6ZWQgdGhhdCB0aGUgc2V0dGluZyBvZiBpbnRlcmZh
Y2UtPnNlcnZlcl9mZWF0dXJlcyBuZWVkcw0KdG8gYmUgbW92ZWQgdG8gaW50cm9kdWNlX2Rv
bWFpbigpLCBhcyBvdGhlcndpc2UgZG9tMCBrZXJuZWwgd29uJ3Qgc2VlDQp0aGUgc3VwcG9y
dGVkIGZlYXR1cmVzLg0KDQoNCkp1ZXJnZW4NCg==
--------------6AvTwhOSfxpBDMYITAGhXtNt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------6AvTwhOSfxpBDMYITAGhXtNt--

--------------8Rx2EXRVjFCyjT3iJ3gkAEO6--

--------------qexFzL5S5Z9HjNdBv7fzSxpX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDR5UFAwAAAAAACgkQsN6d1ii/Ey/n
Bgf/fuZmpD49hiLk0mHvc4uAJs4rm8Zt9FVagdKjz3HiCl5YCc7z3EtOnfp6T8aYteAq6W/8IhGn
HfiARdumZJMyqjuoVjC6/lnMEq/x/jZjh4YLzK3oNLzWl0Dp59lVsTAoI+8QQ57UbSSnS15bGk2z
gD+aHSEnnZWBj/JOIcjfoAbL1WYVQFVJ+nWuwo1ITAJ5RO0m1D+LHdJ+FuSXE1P85HnbI/tulmgg
37Si0/uUaaOCLHvi2yaHLpOgMWC70lu2vzLWyh9G0fLY3pRGKCYuBopLhb78DV8r3zv2kdDGtKMA
gLB0vku8sggsEunR6LAzgwR03VICf0xJPvqb+1BvgA==
=2zeX
-----END PGP SIGNATURE-----

--------------qexFzL5S5Z9HjNdBv7fzSxpX--

