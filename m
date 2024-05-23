Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9418CD1D3
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 14:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728445.1133373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA7Hr-0005OC-6E; Thu, 23 May 2024 12:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728445.1133373; Thu, 23 May 2024 12:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA7Hr-0005Le-3A; Thu, 23 May 2024 12:11:11 +0000
Received: by outflank-mailman (input) for mailman id 728445;
 Thu, 23 May 2024 12:11:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGfz=M2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sA7Ho-0005LY-WC
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 12:11:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ec44d9-18fd-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 14:11:06 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 44BFA2267B;
 Thu, 23 May 2024 12:11:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D20D013A6C;
 Thu, 23 May 2024 12:11:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ghWaMVgyT2YufAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 23 May 2024 12:11:04 +0000
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
X-Inumbo-ID: 87ec44d9-18fd-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716466265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yNEl4PpgQKZO5rROFcDvA2Q2IWXapfP6Qa1GqWmmKEg=;
	b=ehR3kYm+INskrct6vxM6/UCoBe9y7KheDC4wNjAJ1v/zZx9LDXSPIQsm7xVTS2wKuxTj0x
	o2xQPutdP6khpOYYu1QXxG3T2K1F5LM4Spm0WjBDd30k1AoR8NDTWSXUfvMFx4ljTjEIBu
	YQLM02wU27QpYbxrZt4DEPnJXmf/z4Q=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ehR3kYm+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1716466265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yNEl4PpgQKZO5rROFcDvA2Q2IWXapfP6Qa1GqWmmKEg=;
	b=ehR3kYm+INskrct6vxM6/UCoBe9y7KheDC4wNjAJ1v/zZx9LDXSPIQsm7xVTS2wKuxTj0x
	o2xQPutdP6khpOYYu1QXxG3T2K1F5LM4Spm0WjBDd30k1AoR8NDTWSXUfvMFx4ljTjEIBu
	YQLM02wU27QpYbxrZt4DEPnJXmf/z4Q=
Message-ID: <3cb5532e-d9af-4045-99f3-9c8944672073@suse.com>
Date: Thu, 23 May 2024 14:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/pvh: Add 64bit relocation page tables
To: Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20240410194850.39994-1-jason.andryuk@amd.com>
 <20240410194850.39994-6-jason.andryuk@amd.com>
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
In-Reply-To: <20240410194850.39994-6-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KkuuWwn3SK0lxQQ4zaeHf4x3"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.40 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[13];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 44BFA2267B
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -5.40

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KkuuWwn3SK0lxQQ4zaeHf4x3
Content-Type: multipart/mixed; boundary="------------5eXTs0qB51N2dWyATTYEzKyl";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <3cb5532e-d9af-4045-99f3-9c8944672073@suse.com>
Subject: Re: [PATCH 5/5] x86/pvh: Add 64bit relocation page tables
References: <20240410194850.39994-1-jason.andryuk@amd.com>
 <20240410194850.39994-6-jason.andryuk@amd.com>
In-Reply-To: <20240410194850.39994-6-jason.andryuk@amd.com>

--------------5eXTs0qB51N2dWyATTYEzKyl
Content-Type: multipart/mixed; boundary="------------914VC0jSQ884gY3Ozs1Ax8Ki"

--------------914VC0jSQ884gY3Ozs1Ax8Ki
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDQuMjQgMjE6NDgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IFRoZSBQVkggZW50
cnkgcG9pbnQgaXMgMzJiaXQuICBGb3IgYSA2NGJpdCBrZXJuZWwsIHRoZSBlbnRyeSBwb2lu
dCBtdXN0DQo+IHN3aXRjaCB0byA2NGJpdCBtb2RlLCB3aGljaCByZXF1aXJlcyBhIHNldCBv
ZiBwYWdlIHRhYmxlcy4gIEluIHRoZSBwYXN0LA0KPiBQVkggdXNlZCBpbml0X3RvcF9wZ3Qu
DQo+IA0KPiBUaGlzIHdvcmtzIGZpbmUgd2hlbiB0aGUga2VybmVsIGlzIGxvYWRlZCBhdCBM
T0FEX1BIWVNJQ0FMX0FERFIsIGFzIHRoZQ0KPiBwYWdlIHRhYmxlcyBhcmUgcHJlYnVpbHQg
Zm9yIHRoaXMgYWRkcmVzcy4gIElmIHRoZSBrZXJuZWwgaXMgbG9hZGVkIGF0IGENCj4gZGlm
ZmVyZW50IGFkZHJlc3MsIHRoZXkgbmVlZCB0byBiZSBhZGp1c3RlZC4NCj4gDQo+IF9fc3Rh
cnR1cF82NCgpIGFkanVzdHMgdGhlIHByZWJ1aWx0IHBhZ2UgdGFibGVzIGZvciB0aGUgcGh5
c2ljYWwgbG9hZA0KPiBhZGRyZXNzLCBidXQgaXQgaXMgNjRiaXQgY29kZS4gIFRoZSAzMmJp
dCBQVkggZW50cnkgY29kZSBjYW4ndCBjYWxsIGl0DQo+IHRvIGFkanVzdCB0aGUgcGFnZSB0
YWJsZXMsIHNvIGl0IGNhbid0IHJlYWRpbHkgYmUgcmUtdXNlZC4NCj4gDQo+IDY0Yml0IFBW
SCBlbnRyeSBuZWVkcyBwYWdlIHRhYmxlcyBzZXQgdXAgZm9yIGlkZW50aXR5IG1hcCwgdGhl
IGtlcm5lbA0KPiBoaWdoIG1hcCBhbmQgdGhlIGRpcmVjdCBtYXAuICBwdmhfc3RhcnRfeGVu
KCkgZW50ZXJzIGlkZW50aXR5IG1hcHBlZC4NCj4gSW5zaWRlIHhlbl9wcmVwYXJlX3B2aCgp
LCBpdCBqdW1wcyB0aHJvdWdoIGEgcHZfb3BzIGZ1bmN0aW9uIHBvaW50ZXINCj4gaW50byB0
aGUgaGlnaG1hcC4gIFRoZSBkaXJlY3QgbWFwIGlzIHVzZWQgZm9yIF9fdmEoKSBvbiB0aGUg
aW5pdHJhbWZzDQo+IGFuZCBvdGhlciBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMuDQo+IA0K
PiBBZGQgYSBkZWRpY2F0ZWQgc2V0IG9mIHByZWJ1aWxkIHBhZ2UgdGFibGVzIGZvciBQVkgg
ZW50cnkuICBUaGV5IGFyZQ0KPiBhZGp1c3RlZCBpbiBhc3NlbWJseSBiZWZvcmUgbG9hZGlu
Zy4NCj4gDQo+IEFkZCBYRU5fRUxGTk9URV9QSFlTMzJfUkVMT0MgdG8gaW5kaWNhdGUgc3Vw
cG9ydCBmb3IgcmVsb2NhdGlvbg0KPiBhbG9uZyB3aXRoIHRoZSBrZXJuZWwncyBsb2FkaW5n
IGNvbnN0cmFpbnRzLiAgVGhlIG1heGltdW0gbG9hZCBhZGRyZXNzLA0KPiBLRVJORUxfSU1B
R0VfU0laRSAtIDEsIGlzIGRldGVybWluZWQgYnkgYSBzaW5nbGUgcHZoX2xldmVsMl9pZGVu
dF9wZ3QNCj4gcGFnZS4gIEl0IGNvdWxkIGJlIGxhcmdlciB3aXRoIG1vcmUgcGFnZXMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVrQGFtZC5j
b20+DQo+IC0tLQ0KPiBJbnN0ZWFkIG9mIGFkZGluZyA1IHBhZ2VzIG9mIHByZWJ1aWx0IHBh
Z2UgdGFibGVzLCB0aGV5IGNvdWxkIGJlDQo+IGNvbnRydWN0ZWQgZHluYW1pY2FsbHkgaW4g
dGhlIC5ic3MgYXJlYS4gIFRoZXkgYXJlIHRoZW4gb25seSB1c2VkIGZvcg0KPiBQVkggZW50
cnkgYW5kIHVudGlsIHRyYW5zaXRpb25pbmcgdG8gaW5pdF90b3BfcGd0LiAgVGhlIC5ic3Mg
aXMgbGF0ZXINCj4gY2xlYXJlZC4gIEl0J3Mgc2FmZXIgdG8gYWRkIHRoZSBkZWRpY2F0ZWQg
cGFnZXMsIHNvIHRoYXQgaXMgZG9uZSBoZXJlLg0KPiAtLS0NCj4gICBhcmNoL3g4Ni9wbGF0
Zm9ybS9wdmgvaGVhZC5TIHwgMTA1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvcGxhdGZvcm0vcHZoL2hlYWQuUyBi
L2FyY2gveDg2L3BsYXRmb3JtL3B2aC9oZWFkLlMNCj4gaW5kZXggYzA4ZDA4ZDhjYzkyLi40
YWYzY2ZiY2YyZjggMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L3BsYXRmb3JtL3B2aC9oZWFk
LlMNCj4gKysrIGIvYXJjaC94ODYvcGxhdGZvcm0vcHZoL2hlYWQuUw0KPiBAQCAtMjEsNiAr
MjEsOCBAQA0KPiAgICNpbmNsdWRlIDxhc20vbm9zcGVjLWJyYW5jaC5oPg0KPiAgICNpbmNs
dWRlIDx4ZW4vaW50ZXJmYWNlL2VsZm5vdGUuaD4NCj4gICANCj4gKyNpbmNsdWRlICIuLi9r
ZXJuZWwvcGd0YWJsZV82NF9oZWxwZXJzLmgiDQo+ICsNCj4gICAJX19IRUFEDQo+ICAgDQo+
ICAgLyoNCj4gQEAgLTEwMiw4ICsxMDQsNDcgQEAgU1lNX0NPREVfU1RBUlRfTE9DQUwocHZo
X3N0YXJ0X3hlbikNCj4gICAJYnRzbCAkX0VGRVJfTE1FLCAlZWF4DQo+ICAgCXdybXNyDQo+
ICAgDQo+ICsJbW92ICVlYnAsICVlYngNCj4gKwlzdWJsICRMT0FEX1BIWVNJQ0FMX0FERFIs
ICVlYnggLyogb2Zmc2V0ICovDQo+ICsJanogLkxwYWdldGFibGVfZG9uZQ0KPiArDQo+ICsJ
LyogRml4dXAgcGFnZS10YWJsZXMgZm9yIHJlbG9jYXRpb24uICovDQo+ICsJbGVhbCBydmEo
cHZoX2luaXRfdG9wX3BndCkoJWVicCksICVlZGkNCj4gKwltb3ZsICQ1MTIsICVlY3gNCg0K
UGxlYXNlIHVzZSBQVFJTX1BFUl9QR0QgaW5zdGVhZCBvZiB0aGUgbGl0ZXJhbCA1MTIuIFNp
bWlsYXIgaXNzdWUgYmVsb3cuDQoNCj4gKzI6DQo+ICsJdGVzdGwgJF9QQUdFX1BSRVNFTlQs
IDB4MDAoJWVkaSkNCj4gKwlqeiAxZg0KPiArCWFkZGwgJWVieCwgMHgwMCglZWRpKQ0KPiAr
MToNCj4gKwlhZGRsICQ4LCAlZWRpDQo+ICsJZGVjbCAlZWN4DQo+ICsJam56IDJiDQo+ICsN
Cj4gKwkvKiBMMyBpZGVudCBoYXMgYSBzaW5nbGUgZW50cnkuICovDQo+ICsJbGVhbCBydmEo
cHZoX2xldmVsM19pZGVudF9wZ3QpKCVlYnApLCAlZWRpDQo+ICsJYWRkbCAlZWJ4LCAweDAw
KCVlZGkpDQo+ICsNCj4gKwlsZWFsIHJ2YShwdmhfbGV2ZWwzX2tlcm5lbF9wZ3QpKCVlYnAp
LCAlZWRpDQo+ICsJYWRkbCAlZWJ4LCAoNDA5NiAtIDE2KSglZWRpKQ0KPiArCWFkZGwgJWVi
eCwgKDQwOTYgLSA4KSglZWRpKQ0KDQpQQUdFX1NJWkUgaW5zdGVhZCBvZiA0MDk2LCBwbGVh
c2UuDQoNCj4gKw0KPiArCS8qIHB2aF9sZXZlbDJfaWRlbnRfcGd0IGlzIGZpbmUgLSBsYXJn
ZSBwYWdlcyAqLw0KPiArDQo+ICsJLyogcHZoX2xldmVsMl9rZXJuZWxfcGd0IG5lZWRzIGFk
anVzdG1lbnQgLSBsYXJnZSBwYWdlcyAqLw0KPiArCWxlYWwgcnZhKHB2aF9sZXZlbDJfa2Vy
bmVsX3BndCkoJWVicCksICVlZGkNCj4gKwltb3ZsICQ1MTIsICVlY3gNCj4gKzI6DQo+ICsJ
dGVzdGwgJF9QQUdFX1BSRVNFTlQsIDB4MDAoJWVkaSkNCj4gKwlqeiAxZg0KPiArCWFkZGwg
JWVieCwgMHgwMCglZWRpKQ0KPiArMToNCj4gKwlhZGRsICQ4LCAlZWRpDQo+ICsJZGVjbCAl
ZWN4DQo+ICsJam56IDJiDQo+ICsNCj4gKy5McGFnZXRhYmxlX2RvbmU6DQo+ICAgCS8qIEVu
YWJsZSBwcmUtY29uc3RydWN0ZWQgcGFnZSB0YWJsZXMuICovDQo+IC0JbGVhbCBydmEoaW5p
dF90b3BfcGd0KSglZWJwKSwgJWVheA0KPiArCWxlYWwgcnZhKHB2aF9pbml0X3RvcF9wZ3Qp
KCVlYnApLCAlZWF4DQo+ICAgCW1vdiAlZWF4LCAlY3IzDQo+ICAgCW1vdiAkKFg4Nl9DUjBf
UEcgfCBYODZfQ1IwX1BFKSwgJWVheA0KPiAgIAltb3YgJWVheCwgJWNyMA0KPiBAQCAtMTk3
LDUgKzIzOCw2NyBAQCBTWU1fREFUQV9TVEFSVF9MT0NBTChlYXJseV9zdGFjaykNCj4gICAJ
LmZpbGwgQk9PVF9TVEFDS19TSVpFLCAxLCAwDQo+ICAgU1lNX0RBVEFfRU5EX0xBQkVMKGVh
cmx5X3N0YWNrLCBTWU1fTF9MT0NBTCwgZWFybHlfc3RhY2tfZW5kKQ0KPiAgIA0KPiArI2lm
ZGVmIENPTkZJR19YODZfNjQNCj4gKy8qDQo+ICsgKiBYZW4gUFZIIG5lZWRzIGEgc2V0IG9m
IGlkZW50aXR5IG1hcHBlZCBhbmQga2VybmVsIGhpZ2ggbWFwcGluZw0KPiArICogcGFnZSB0
YWJsZXMuICBwdmhfc3RhcnRfeGVuIHN0YXJ0cyBydW5uaW5nIG9uIHRoZSBpZGVudGl0eSBt
YXBwZWQNCj4gKyAqIHBhZ2UgdGFibGVzLCBidXQgeGVuX3ByZXBhcmVfcHZoIGNhbGxzIGlu
dG8gdGhlIGhpZ2ggbWFwcGluZy4NCj4gKyAqIFRoZXNlIHBhZ2UgdGFibGVzIG5lZWQgdG8g
YmUgcmVsb2NhdGFibGUgYW5kIGFyZSBvbmx5IHVzZWQgdW50aWwNCj4gKyAqIHN0YXJ0dXBf
NjQgdHJhbnNpdGlvbnMgdG8gaW5pdF90b3BfcGd0Lg0KPiArICovDQo+ICtTWU1fREFUQV9T
VEFSVF9QQUdFX0FMSUdORUQocHZoX2luaXRfdG9wX3BndCkNCj4gKwkucXVhZCAgIHB2aF9s
ZXZlbDNfaWRlbnRfcGd0IC0gX19TVEFSVF9LRVJORUxfbWFwICsgX0tFUk5QR19UQUJMRV9O
T0VOQw0KPiArCS5vcmcgICAgcHZoX2luaXRfdG9wX3BndCArIEw0X1BBR0VfT0ZGU0VUKjgs
IDANCg0KUGxlYXNlIGFkZCBhIHNwYWNlIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlICcqJy4NCg0K
PiArCS5xdWFkICAgcHZoX2xldmVsM19pZGVudF9wZ3QgLSBfX1NUQVJUX0tFUk5FTF9tYXAg
KyBfS0VSTlBHX1RBQkxFX05PRU5DDQo+ICsJLm9yZyAgICBwdmhfaW5pdF90b3BfcGd0ICsg
TDRfU1RBUlRfS0VSTkVMKjgsIDANCj4gKwkvKiAoMl40OC0oMioxMDI0KjEwMjQqMTAyNCkp
LygyXjM5KSA9IDUxMSAqLw0KPiArCS5xdWFkICAgcHZoX2xldmVsM19rZXJuZWxfcGd0IC0g
X19TVEFSVF9LRVJORUxfbWFwICsgX1BBR0VfVEFCTEVfTk9FTkMNCj4gK1NZTV9EQVRBX0VO
RChwdmhfaW5pdF90b3BfcGd0KQ0KPiArDQo+ICtTWU1fREFUQV9TVEFSVF9QQUdFX0FMSUdO
RUQocHZoX2xldmVsM19pZGVudF9wZ3QpDQo+ICsJLnF1YWQJcHZoX2xldmVsMl9pZGVudF9w
Z3QgLSBfX1NUQVJUX0tFUk5FTF9tYXAgKyBfS0VSTlBHX1RBQkxFX05PRU5DDQo+ICsJLmZp
bGwJNTExLCA4LCAwDQo+ICtTWU1fREFUQV9FTkQocHZoX2xldmVsM19pZGVudF9wZ3QpDQo+
ICtTWU1fREFUQV9TVEFSVF9QQUdFX0FMSUdORUQocHZoX2xldmVsMl9pZGVudF9wZ3QpDQo+
ICsJLyoNCj4gKwkgKiBTaW5jZSBJIGVhc2lseSBjYW4sIG1hcCB0aGUgZmlyc3QgMUcuDQo+
ICsJICogRG9uJ3Qgc2V0IE5YIGJlY2F1c2UgY29kZSBydW5zIGZyb20gdGhlc2UgcGFnZXMu
DQo+ICsJICoNCj4gKwkgKiBOb3RlOiBUaGlzIHNldHMgX1BBR0VfR0xPQkFMIGRlc3BpdGUg
d2hldGhlcg0KPiArCSAqIHRoZSBDUFUgc3VwcG9ydHMgaXQgb3IgaXQgaXMgZW5hYmxlZC4g
IEJ1dCwNCj4gKwkgKiB0aGUgQ1BVIHNob3VsZCBpZ25vcmUgdGhlIGJpdC4NCj4gKwkgKi8N
Cj4gKwlQTURTKDAsIF9fUEFHRV9LRVJORUxfSURFTlRfTEFSR0VfRVhFQywgUFRSU19QRVJf
UE1EKQ0KPiArU1lNX0RBVEFfRU5EKHB2aF9sZXZlbDJfaWRlbnRfcGd0KQ0KPiArU1lNX0RB
VEFfU1RBUlRfUEFHRV9BTElHTkVEKHB2aF9sZXZlbDNfa2VybmVsX3BndCkNCj4gKwkuZmls
bAlMM19TVEFSVF9LRVJORUwsOCwwDQoNClNwYWNlcyBhZnRlciB0aGUgY29tbWFzLg0KDQo+
ICsJLyogKDJeNDgtKDIqMTAyNCoxMDI0KjEwMjQpLSgoMl4zOSkqNTExKSkvKDJeMzApID0g
NTEwICovDQo+ICsJLnF1YWQJcHZoX2xldmVsMl9rZXJuZWxfcGd0IC0gX19TVEFSVF9LRVJO
RUxfbWFwICsgX0tFUk5QR19UQUJMRV9OT0VOQw0KPiArCS5xdWFkCTAgLyogbm8gZml4bWFw
ICovDQo+ICtTWU1fREFUQV9FTkQocHZoX2xldmVsM19rZXJuZWxfcGd0KQ0KPiArDQo+ICtT
WU1fREFUQV9TVEFSVF9QQUdFX0FMSUdORUQocHZoX2xldmVsMl9rZXJuZWxfcGd0KQ0KPiAr
CS8qDQo+ICsJICogS2VybmVsIGhpZ2ggbWFwcGluZy4NCj4gKwkgKg0KPiArCSAqIFRoZSBr
ZXJuZWwgY29kZStkYXRhK2JzcyBtdXN0IGJlIGxvY2F0ZWQgYmVsb3cgS0VSTkVMX0lNQUdF
X1NJWkUgaW4NCj4gKwkgKiB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UsIHdoaWNoIGlzIDEgR2lC
IGlmIFJBTkRPTUlaRV9CQVNFIGlzIGVuYWJsZWQsDQo+ICsJICogNTEyIE1pQiBvdGhlcndp
c2UuDQo+ICsJICoNCj4gKwkgKiAoTk9URTogYWZ0ZXIgdGhhdCBzdGFydHMgdGhlIG1vZHVs
ZSBhcmVhLCBzZWUgTU9EVUxFU19WQUREUi4pDQo+ICsJICoNCj4gKwkgKiBUaGlzIHRhYmxl
IGlzIGV2ZW50dWFsbHkgdXNlZCBieSB0aGUga2VybmVsIGR1cmluZyBub3JtYWwgcnVudGlt
ZS4NCj4gKwkgKiBDYXJlIG11c3QgYmUgdGFrZW4gdG8gY2xlYXIgb3V0IHVuZGVzaXJlZCBi
aXRzIGxhdGVyLCBsaWtlIF9QQUdFX1JXDQo+ICsJICogb3IgX1BBR0VfR0xPQkFMIGluIHNv
bWUgY2FzZXMuDQo+ICsJICovDQo+ICsJUE1EUygwLCBfX1BBR0VfS0VSTkVMX0xBUkdFX0VY
RUMsIEtFUk5FTF9JTUFHRV9TSVpFL1BNRF9TSVpFKQ0KDQpTcGFjZXMgYXJvdW5kICcvJy4N
Cg0KPiArU1lNX0RBVEFfRU5EKHB2aF9sZXZlbDJfa2VybmVsX3BndCkNCj4gKw0KPiArCUVM
Rk5PVEUoWGVuLCBYRU5fRUxGTk9URV9QSFlTMzJfUkVMT0MsDQo+ICsJCSAgICAgLmxvbmcg
Q09ORklHX1BIWVNJQ0FMX0FMSUdOOw0KPiArCQkgICAgIC5sb25nIExPQURfUEhZU0lDQUxf
QUREUjsNCj4gKwkJICAgICAubG9uZyBLRVJORUxfSU1BR0VfU0laRSAtIDEpDQo+ICsjZW5k
aWYNCj4gKw0KPiAgIAlFTEZOT1RFKFhlbiwgWEVOX0VMRk5PVEVfUEhZUzMyX0VOVFJZLA0K
PiAgIAkgICAgICAgICAgICAgX0FTTV9QVFIgKHB2aF9zdGFydF94ZW4gLSBfX1NUQVJUX0tF
Uk5FTF9tYXApKQ0KDQoNCkp1ZXJnZW4NCg==
--------------914VC0jSQ884gY3Ozs1Ax8Ki
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------914VC0jSQ884gY3Ozs1Ax8Ki--

--------------5eXTs0qB51N2dWyATTYEzKyl--

--------------KkuuWwn3SK0lxQQ4zaeHf4x3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmZPMlgFAwAAAAAACgkQsN6d1ii/Ey8b
PAf+IDezaEERt6XB02Yo+3fUEa5yR0T/swqwWR+NkR5RaVD/saRfK4uOdvgYaBl4CkORZIvtN1pj
pNPcYFoH8tZ4COqXNM0NZY6oqVvuuJyaI8C7B4WlcU0P742nGtJ67Dr6tIQugUpwFkbz0xxD3KVs
VdYATMWBiqXAfGEqWUcflDvuSaY6D4V0LltJSTLU2kUF0sf69E+A5wNrKVXEwl4Vp4ZgZHfDwMLf
eqEJSawP4Z2ryR7qOBuO/dLSlqOS2Kn55emx8ifFb+CzN412yM/JL1wzNUijEJyaOlCa6lbUJgEt
PgXMiXqISVk+Qn6aKzpj+iQajMT/mJSFnISFcnODIg==
=KXWs
-----END PGP SIGNATURE-----

--------------KkuuWwn3SK0lxQQ4zaeHf4x3--

