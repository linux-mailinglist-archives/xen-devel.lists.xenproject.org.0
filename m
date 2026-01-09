Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52791D09488
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 13:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198668.1515527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBHg-0003SQ-7N; Fri, 09 Jan 2026 12:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198668.1515527; Fri, 09 Jan 2026 12:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBHg-0003Q3-4c; Fri, 09 Jan 2026 12:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1198668;
 Fri, 09 Jan 2026 12:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1veBHe-0003Px-3r
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 12:08:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7254543-ed53-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 13:07:59 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E62F95BFFC;
 Fri,  9 Jan 2026 12:07:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 383B63EA63;
 Fri,  9 Jan 2026 12:07:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0XBzCp7vYGmiIQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 09 Jan 2026 12:07:58 +0000
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
X-Inumbo-ID: d7254543-ed53-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1767960479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4Z+d5TRTcuwLi/S5zOetEJtn8Zjhaf3WusJBplaDol4=;
	b=aA3Y/9KCXCEmqClV3RGYgLOys0emintyICqd2JAe/fdYrAisel9rYOc2SiHAdUyo235Iar
	V6V+uJKMGR4YssidBXnb53iVtigu5dcBMHammyvA6v7PdGqxdNAhZKvQf2vsuR4QoxziwU
	e865T+Fy69F2EAQ21+P/PTCjVUPGryA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=k95zaFPt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1767960478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4Z+d5TRTcuwLi/S5zOetEJtn8Zjhaf3WusJBplaDol4=;
	b=k95zaFPt9RDIKAZ5/+7d7pYm66zVpo3SAxF/Q0von+Okgsg+hb0gC0zkHw8EJMOE3Ee5T3
	1c3GqBNI63JZ+IxDtNTnKQM4z0Yzp1LWmi6DRQFM/M/h0GGmg7DsCQxmMk2zLD0/C/IH2K
	V4hTV0PsFkjT1YkS7w9d2JZ1Yi20hik=
Message-ID: <3102d712-8fa7-4567-bb8a-0f39fd71712d@suse.com>
Date: Fri, 9 Jan 2026 13:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] x86: Cleanups around slow_down_io()
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-block@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20251216134150.2710-1-jgross@suse.com>
Content-Language: en-US
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
In-Reply-To: <20251216134150.2710-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6KmjgHGC0GjFkS6YvFAdgUNk"
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid]
X-Spam-Flag: NO
X-Spam-Score: -5.41
X-Rspamd-Queue-Id: E62F95BFFC
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6KmjgHGC0GjFkS6YvFAdgUNk
Content-Type: multipart/mixed; boundary="------------Gs0D86kS3xPc0aUTHyn2oG1W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 linux-block@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Denis Efremov <efremov@linux.com>,
 Jens Axboe <axboe@kernel.dk>
Message-ID: <3102d712-8fa7-4567-bb8a-0f39fd71712d@suse.com>
Subject: Re: [PATCH v2 0/5] x86: Cleanups around slow_down_io()
References: <20251216134150.2710-1-jgross@suse.com>
In-Reply-To: <20251216134150.2710-1-jgross@suse.com>

--------------Gs0D86kS3xPc0aUTHyn2oG1W
Content-Type: multipart/mixed; boundary="------------Ui1zwu9aMuM48dsP0uysbNdM"

--------------Ui1zwu9aMuM48dsP0uysbNdM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

R2VudGxlIHBpbmcuDQoNCk9uIDE2LjEyLjI1IDE0OjQxLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Og0KPiBXaGlsZSBsb29raW5nIGF0IHBhcmF2aXJ0IGNsZWFudXBzIEkgc3R1bWJsZWQgb3Zl
ciBzbG93X2Rvd25faW8oKSBhbmQNCj4gdGhlIHJlbGF0ZWQgUkVBTExZX1NMT1dfSU8gZGVm
aW5lLg0KPiANCj4gRG8gc2V2ZXJhbCBjbGVhbnVwcywgcmVzdWx0aW5nIGluIGEgZGVsZXRp
b24gb2YgUkVBTExZX1NMT1dfSU8gYW5kIHRoZQ0KPiBpb19kZWxheSgpIHBhcmF2aXJ0IGZ1
bmN0aW9uIGhvb2suDQo+IA0KPiBQYXRjaCA0IGlzIHJlbW92aW5nIHRoZSBjb25maWcgb3B0
aW9ucyBmb3Igc2VsZWN0aW5nIHRoZSBkZWZhdWx0IGRlbGF5DQo+IG1lY2hhbmlzbSBhbmQg
c2V0cyB0aGUgZGVmYXVsdCB0byAibm8gZGVsYXkiLiBUaGlzIGlzIGluIHByZXBhcmF0aW9u
IG9mDQo+IHJlbW92aW5nIHRoZSBpb19kZWxheSgpIGZ1bmN0aW9uYWxpdHkgY29tcGxldGVs
eSwgYXMgc3VnZ2VzdGVkIGJ5IEluZ28NCj4gTW9sbmFyLg0KPiANCj4gUGF0Y2ggNSBpcyBh
ZGRpbmcgYW4gYWRkaXRpb25hbCBjb25maWcgb3B0aW9uIGFsbG93aW5nIHRvIGF2b2lkDQo+
IGJ1aWxkaW5nIGlvX2RlbGF5LmMgKGRlZmF1bHQgaXMgc3RpbGwgdG8gYnVpbGQgaXQpLg0K
PiANCj4gQ2hhbmdlcyBpbiBWMjoNCj4gLSBwYXRjaGVzIDIgYW5kIDMgb2YgVjEgaGF2ZSBi
ZWVuIGFwcGxpZWQNCj4gLSBuZXcgcGF0Y2hlcyA0IGFuZCA1DQo+IA0KPiBKdWVyZ2VuIEdy
b3NzICg1KToNCj4gICAgeDg2L3BhcmF2aXJ0OiBSZXBsYWNlIGlvX2RlbGF5KCkgaG9vayB3
aXRoIGEgYm9vbA0KPiAgICBibG9jay9mbG9wcHk6IERvbid0IHVzZSBSRUFMTFlfU0xPV19J
TyBmb3IgZGVsYXlzDQo+ICAgIHg4Ni9pbzogUmVtb3ZlIFJFQUxMWV9TTE9XX0lPIGhhbmRs
aW5nDQo+ICAgIHg4Ni9pb19kZWxheTogU3dpdGNoIGlvX2RlbGF5KCkgZGVmYXVsdCBtZWNo
YW5pc20gdG8gIm5vbmUiDQo+ICAgIHg4Ni9pb19kZWxheTogQWRkIGNvbmZpZyBvcHRpb24g
Zm9yIGNvbnRyb2xsaW5nIGJ1aWxkIG9mIGlvX2RlbGF5Lg0KPiANCj4gICBhcmNoL3g4Ni9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrDQo+ICAgYXJjaC94ODYvS2Nv
bmZpZy5kZWJ1ZyAgICAgICAgICAgICAgICB8IDMwIC0tLS0tLS0tLS0NCj4gICBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9mbG9wcHkuaCAgICAgICAgIHwgMzEgKysrKysrKystLQ0KPiAgIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2lvLmggICAgICAgICAgICAgfCAxNyArKystLS0NCj4gICBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydC5oICAgICAgIHwgMTEgKy0tLQ0KPiAgIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0X3R5cGVzLmggfCAgMyArLQ0KPiAgIGFyY2gv
eDg2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgMyArLQ0KPiAgIGFyY2gveDg2
L2tlcm5lbC9jcHUvdm13YXJlLmMgICAgICAgICAgfCAgMiArLQ0KPiAgIGFyY2gveDg2L2tl
cm5lbC9pb19kZWxheS5jICAgICAgICAgICAgfCA4MSArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICBhcmNoL3g4Ni9rZXJuZWwva3ZtLmMgICAgICAgICAgICAgICAgIHwgIDgg
Ky0tDQo+ICAgYXJjaC94ODYva2VybmVsL3BhcmF2aXJ0LmMgICAgICAgICAgICB8ICAzICst
DQo+ICAgYXJjaC94ODYva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICB8ICA0ICstDQo+
ICAgYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jICAgICAgICAgICB8ICA2ICstDQo+ICAg
ZHJpdmVycy9ibG9jay9mbG9wcHkuYyAgICAgICAgICAgICAgICB8ICAyIC0NCj4gICAxNCBm
aWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAxNTQgZGVsZXRpb25zKC0pDQo+IA0K
DQo=
--------------Ui1zwu9aMuM48dsP0uysbNdM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Ui1zwu9aMuM48dsP0uysbNdM--

--------------Gs0D86kS3xPc0aUTHyn2oG1W--

--------------6KmjgHGC0GjFkS6YvFAdgUNk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlg750FAwAAAAAACgkQsN6d1ii/Ey+3
/wgAi5oL7xCqpILZVsO5gRJgR0CTRua+JeXEsT5vAtwtDnpA8iZZVLqBdXDmafTRfSUP0nRw7tUQ
DVh9aTUpweByMdEoEXUup2HTJwvRf2u7r5yJMS+gM9kQbCqCq8KrhWhDpNzyy46+p9Z8wOnnlFu5
2FTSjCahYQIRkKgtSxyLmvtAF4kj0adGtpRterfJvgm7RV+FlIUrSHG80G331Lsh/+tRnaFVeyIW
ETT8zC84K4V6DKfbiFsvmL8zg0ED79+XVtzARSK+Jm+jkXxPXMK8jVqgA9dSvF4/bzbqJckClEK5
XrBV2JpNaU398fDwvSrPDOhJh8tQYvr7jDyIY+4mRw==
=fqat
-----END PGP SIGNATURE-----

--------------6KmjgHGC0GjFkS6YvFAdgUNk--

