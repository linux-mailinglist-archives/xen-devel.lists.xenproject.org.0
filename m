Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC07AD562F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 14:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011700.1390153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPL2Q-0004Xa-69; Wed, 11 Jun 2025 12:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011700.1390153; Wed, 11 Jun 2025 12:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPL2Q-0004W4-0x; Wed, 11 Jun 2025 12:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1011700;
 Wed, 11 Jun 2025 12:58:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtSS=Y2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uPL2O-0004Vy-Rx
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 12:58:41 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb5dff98-46c3-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 14:58:39 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D2ADE211FA;
 Wed, 11 Jun 2025 12:58:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 561A0137FE;
 Wed, 11 Jun 2025 12:58:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CpxNE359SWieRAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 11 Jun 2025 12:58:38 +0000
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
X-Inumbo-ID: cb5dff98-46c3-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749646718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q9scDhxdSxrhQDSFyJ01DGBn4P9xC44kWau4Ktpczak=;
	b=n7n8zpSvfPFUzxn5mYl/BLvpr5WzpeLvFfLTCMVD7qBDFwsZt/E/tojrfCoYEqv09og4zX
	nIV0gICFiE7Cd5qgYdkf6yTWIzzXVRfej8wRZja2voIMiVCaXhhtf6BrFC+FwYw1qlmYdp
	JVjkVGnik2dlHG+TO3azg22SMnVFUUI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=n7n8zpSv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749646718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q9scDhxdSxrhQDSFyJ01DGBn4P9xC44kWau4Ktpczak=;
	b=n7n8zpSvfPFUzxn5mYl/BLvpr5WzpeLvFfLTCMVD7qBDFwsZt/E/tojrfCoYEqv09og4zX
	nIV0gICFiE7Cd5qgYdkf6yTWIzzXVRfej8wRZja2voIMiVCaXhhtf6BrFC+FwYw1qlmYdp
	JVjkVGnik2dlHG+TO3azg22SMnVFUUI=
Message-ID: <8a82946a-6c3e-41d1-b3bd-be164dc6eeba@suse.com>
Date: Wed, 11 Jun 2025 14:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
 <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
 <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
 <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>
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
In-Reply-To: <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oels03X95c0cS93P70Cfnsn7"
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: D2ADE211FA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oels03X95c0cS93P70Cfnsn7
Content-Type: multipart/mixed; boundary="------------5m4wyWuZsrcf0JlaWaNuLGP3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
 virtualization@lists.linux.dev
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8a82946a-6c3e-41d1-b3bd-be164dc6eeba@suse.com>
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
 <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
 <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
 <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>
In-Reply-To: <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>

--------------5m4wyWuZsrcf0JlaWaNuLGP3
Content-Type: multipart/mixed; boundary="------------pefjOMlVvz4lJIGDtsC3KwYp"

--------------pefjOMlVvz4lJIGDtsC3KwYp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDUuMjUgMDk6NDQsIFhpbiBMaSB3cm90ZToNCj4gT24gNS8xMi8yMDI1IDQ6MjAg
QU0sIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+PiBPbiAwOS4wNS4yNSAxMDoxOCwgWGluIExp
IHdyb3RlOg0KPj4+IE9uIDUvNi8yMDI1IDI6MjAgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+Pj4gSSdtIHRyeWluZyB0byBldmFsdWF0ZSBob3cgdG8gYWRkIHRoZSBpbW1lZGlhdGUg
Zm9ybSBNU1IgaW5zdHJ1Y3Rpb25zDQo+Pj4gb24gdG9wIG9mIHRoaXMgcGF0Y2ggc2V0LsKg
IEFuZCBJJ20gY2xvc2UgdG8gZ2V0IGl0IGRvbmUuDQo+Pg0KPj4gVGhlcmUgaXMgc29tZXRo
aW5nIHRvIGNvbnNpZGVyIHdoZW4gcnVubmluZyBhcyBhIFhlbiBQViBndWVzdCwgLi4uDQo+
IA0KPiBBbmRyZXcgc2FpZCBoZSBkb2Vucyd0IHBsYW4gdG8gZXhwb3NlIFdSTVNSTlMgdG8g
UFYgZ3Vlc3RzLCBhbmQgZG9lc24ndA0KPiBleHBlY3QgTVNSX0lNTSB0byBiZSB1c2VmdWwg
aW4gYSBQViBndWVzdCBlaXRoZXIsIHdoaWNoIEkgZnVsbHkgYWdyZWUuDQo+Pj4+DQo+Pj4+
IE5vdGUgdGhhdCBpbiB0aGUgWGVuIFBWIGNhc2UgdGhlIFJETVNSL1dSTVNSIHBhdGNoaW5n
IG11c3Qgbm90IGhhcHBlbg0KPj4+PiBldmVuIGFzIGFuIGludGVybWVkaWF0ZSBzdGVwLCBh
cyB0aGlzIHdvdWxkIGNsb2JiZXIgdGhlIGluZGlyZWN0IGNhbGwNCj4+Pj4gaW5mb3JtYXRp
b24gbmVlZGVkIHdoZW4gcGF0Y2hpbmcgaW4gdGhlIGRpcmVjdCBjYWxsIGZvciB0aGUgWGVu
IGNhc2UuDQo+Pj4NCj4+PiBHb29kIHBvaW50IQ0KPj4NCj4+IC4uLiBhcyB0aGlzIHN0aWxs
IG5lZWRzIHRvIGJlIHRydWUuDQo+Pg0KPj4gVGhlcmUgYXJlIDIgZGlmZmVyZW50IHdheXMg
dG8gZGVhbCB3aXRoIHRoaXM6DQo+Pg0KPj4gMS4gV2hlbiBydW5uaW5nIGFzIGEgWGVuIFBW
IGd1ZXN0IGRpc2FibGUgWDg2X0ZFQVRVUkVfV1JNU1JOUyBhbmQNCj4+IMKgwqDCoCBBU01f
V1JNU1JOU19JTU0gKGUuZy4gaW4geGVuX2luaXRfY2FwYWJpbGl0aWVzKCkpLg0KPj4NCj4+
IDIuIEJ1ZmZlciB0aGUgb3JpZ2luYWwgaW5zdHJ1Y3Rpb24gYmVmb3JlIHBhdGNoaW5nIGlu
IGFwcGx5X2FsdGVybmF0aXZlcygpDQo+PiDCoMKgwqAgaW4gb3JkZXIgdG8gYXZvaWQgdGhl
IHNlcXVlbmNlIGxpbWl0YXRpb24gYWJvdmUgKHNlZSBhdHRhY2hlZCBwYXRjaCkuDQo+Pg0K
Pj4+IERlY2lkaW5nIHdoZXRoZXIgdG8gcmV0YWluIHRoZSBwdm9wcyBNU1IgQVBJIGlzIHRo
ZSByZXNwb25zaWJpbGl0eSBvZg0KPj4+IHRoZSB4ODYgbWFpbnRhaW5lcnMsIHdobyBhcmUg
dGhlIG9uZXMgZXhwZXJpZW5jaW5nIHRoZSBjaGFsbGVuZ2VzIG9mIA0KPj4+IG1haW50YWlu
aW5nIHRoZSBjb2RlLg0KPj4NCj4+IFdlbGwsIEknbSB0aGUgUFYgb3BzIG1haW50YWluZXIs
IHNvIGl0IGlzIGJhc2ljYWxseSBtZSB3aG8gbmVlZHMgdG8gZGVhbA0KPj4gd2l0aCB0aGlz
LiBPVE9IIEkgZG8gdW5kZXJzdGFuZCB0aGF0IGRpYWdub3NpcyBvZiBwcm9ibGVtcyB3aXRo
IFBWIG9wcyBpcw0KPj4gbW9yZSBjb21wbGljYXRlZCB0aGFuIHdpdGhvdXQuDQo+IA0KPiBJ
bmRlZWQsIHNpZ25pZmljYW50IGltcHJvdmVtZW50cyBjb250aW51ZSB0byBiZSBpbXBsZW1l
bnRlZC4NCj4gDQo+Pg0KPj4+DQo+Pj4gdGdseCBzYWlkIEBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzg3eTFoODFodDQuZmZzQHRnbHgvOg0KPj4+DQo+Pj4gwqA+IEkgZnVuZGFt
ZW50YWx5IGhhdGUgYWRkaW5nIHRoaXMgdG8gdGhlIFBWIGluZnJhc3RydWN0dXJlLiBXZSBk
b24ndA0KPj4+IMKgPiB3YW50IG1vcmUgUFYgb3BzLCBxdWl0ZSB0aGUgY29udHJhcnkuDQo+
Pj4NCj4+PiBUaGF0IGlzIHRoZSByZWFzb24gSSB0b29rIGEgZGlmZmVyZW50IGRpcmVjdGlv
biwgaS5lLiwgcmVtb3ZpbmcgdGhlDQo+Pj4gcHZvcHMgTVNSIEFQSXMuwqAgQnV0IGlmIHlv
dXIgYXBwcm9hY2ggaXMgY2xlYW5lciwgdGhleSBtYXkgcHJlZmVyIGl0Lg0KPj4NCj4+IElu
IHRoZSBlbmQgaXQgaXNuJ3QgYWRkaW5nIGFkZGl0aW9uYWwgUFYgb3BzIGludGVyZmFjZXMu
IEl0IGlzIG1vZGlmeWluZw0KPj4gZXhpc3Rpbmcgb25lcy4NCj4+DQo+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggYi9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS8gcGFyYXZpcnQuaA0KPj4+PiBpbmRleCBhNDYzYzc0N2M3ODAuLmRmMTBi
MGU0ZjdiOCAxMDA2NDQNCj4+Pj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vcGFyYXZp
cnQuaA0KPj4+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydC5oDQo+Pj4+
IEBAIC0xNzUsMjQgKzE3NSw3MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX193cml0ZV9jcjQo
dW5zaWduZWQgbG9uZyB4KQ0KPj4+PiDCoMKgwqDCoMKgIFBWT1BfVkNBTEwxKGNwdS53cml0
ZV9jcjQsIHgpOw0KPj4+PiDCoCB9DQo+Pj4+IC1zdGF0aWMgaW5saW5lIHU2NCBwYXJhdmly
dF9yZWFkX21zcih1MzIgbXNyKQ0KPj4+PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB1NjQg
cGFyYXZpcnRfcmVhZF9tc3IodTMyIG1zcikNCj4+Pj4gwqAgew0KPj4+PiAtwqDCoMKgIHJl
dHVybiBQVk9QX0NBTEwxKHU2NCwgY3B1LnJlYWRfbXNyLCBtc3IpOw0KPj4+PiArwqDCoMKg
IEVBWF9FRFhfREVDTEFSRV9BUkdTKHZhbCwgbG93LCBoaWdoKTsNCj4+Pg0KPj4+IFRoaXMg
aXMgdW5kZXIgQ09ORklHX1BBUkFWSVJUX1hYTCwgdGh1cyBDT05GSUdfWEVOX1BWIGFuZCBD
T05GSUdfWDg2XzY0LA0KPj4+IHRoZXJlZm9yZSB3ZSBkb24ndCBuZWVkIHRvIGNvbnNpZGVy
IDMyLWJpdCBhdCBhbGwsIG5vPw0KPj4NCj4+IFJpZ2h0LiBPVE9IIHRoZSBtYWNyb3MgYXJl
IHRoZXJlLCBzbyB3aHkgbm90IHVzZSB0aGVtPw0KPj4NCj4+IEluIHRoZSBlbmQgSSdtIGZp
bmUgdG8gb3BlbiBjb2RlIHRoZSA2NC1iaXQgY2FzZSBoZXJlLg0KPj4NCj4gDQo+IEhlcmUg
aXMgYSBwYXRjaCBJIGNvb2tlZC7CoCBJIGFkZGVkIGFuIEFMVEVSTkFUSVZFKCkgaGFjayBi
ZWNhdXNlIHRoZSBuZXcgDQo+IGluc3RydWN0aW9ucyBjYW4ndCBiZSBtb3JlIHRoYW4gNiBi
eXRlcyBsb25nLsKgIEJ1dCB3aXRoIHRoZSBwYXRjaCB5b3UNCj4ganVzdCBzZW50LCBpdCBz
aG91bGRuJ3QgYmUgbmVlZGVkLg0KDQpJIGhhdmUgbWVhbndoaWxlIGRyb3BwZWQgdGhlIHBh
dGNoIGNvcHlpbmcgdGhlIG9yaWdpbmFsIGluZGlyZWN0IGNhbGwuDQoNClJlYXNvbiBpcyB0
aGF0IEknbSBzZWVpbmcgYSBwb3RlbnRpYWwgcmlzayB3aXRoIGN1cnJlbnQgYWx0ZXJuYXRp
dmUNCnBhdGNoaW5nIHdoZW4gdXNpbmcgQUxURVJOQVRJVkVfWzIzXSgpOiBkZXBlbmRpbmcg
b24gdGhlIHRlc3RlZCBmZWF0dXJlcw0KaXQgbWlnaHQgaGFwcGVuIHRoYXQgYW4gaW5zdHJ1
Y3Rpb24gc2VxdWVuY2Ugbm90IHN1aXRhYmxlIGZvciB0aGUgY3VycmVudA0KcnVudGltZSBl
bnZpcm9ubWVudCBpcyBwYXRjaGVkIGluIGFzIGFuIGludGVybWVkaWF0ZSBzdGVwLiBJbiBj
YXNlIHRoZXJlDQppcyBhbiBpbnRlcnJ1cHQgaGFwcGVuaW5nIGp1c3QgdGhlbiBBTkQgdGhl
IGhhbmRsaW5nIG9mIHRoZSBpbnRlcnJ1cHQgaXMNCnVzaW5nIHRoZSBwYXRjaCBzaXRlLCB0
aGlzIGNvdWxkIHJlc3VsdCBpbiBjcmFzaGVzIG9yIHVuZGVmaW5lZCBiZWhhdmlvci4NCg0K
SSBoYXZlIG1lYW53aGlsZSBhIHNldCBvZiAzIHBhdGNoZXMgZml4aW5nIHRoYXQgcHJvYmxl
bSBieSBtZXJnaW5nIGFsbA0KYWx0ZXJuYXRpdmUgcGF0Y2hpbmcgb2YgYSBwYXRjaCBzaXRl
IGluIHRoZSBsb2NhbCBidWZmZXIgYW5kIG9ubHkgdGhlbg0KcGF0Y2hpbmcgdGhlIGNvZGUg
YXQgdGhlIHRhcmdldCBzaXRlIHdpdGggdGhlIGZpbmFsIHJlc3VsdC4NCg0KVGhlIHNhbWUg
cHJvYmxlbSBhcmlzZXMgd2l0aCB5b3VyIGNvZGUgYmVsb3csIGJ1dCB0aGlzIHRpbWUgaXQg
aXNuJ3QNCmZpeGVkIGJ5IG15IHBhdGNoZXM6IHRoZSB0d28gQUxURVJOQVRJVkUoKSBpbnN0
YW5jZXMgaW4gdGhlIGFzbSgpIGNvbnN0cnVjdA0Kd291bGQgbmVlZCB0byBiZSBwYXRjaGVk
IGluIGEgc2luZ2xlIGF0b21pYyBvcGVyYXRpb24gdG8gYmUgY29uc2lzdGVudC4NCk90aGVy
d2lzZSB5b3UgY291bGQgZW5kIHVwIGUuZy4gb24gYmFyZSBtZXRhbCB3aXRoIHBhcmF2aXJ0
X3JlYWRfbXNyKCkNCmhhdmluZyByZXBsYWNlZCB0aGUgaW5kaXJlY3QgY2FsbCB3aXRoICJy
ZG1zciIsIGJ1dCBub3QgeWV0IGhhdmluZyBhZGRlZA0KdGhlIGNvZGUgdG8gbWVyZ2UgJXJk
eCBpbnRvICVyYXguDQoNCkknbSBqdXN0IGRvaW5nIGEgVjIgb2YgbXkgc2VyaWVzLCBidXQg
dGhpcyB0aW1lIGluY2x1ZGluZyB0aGUgYWRkaXRpb25hbA0Kc3VwcG9ydCBvZiB0aGUgbm9u
LXNlcmlhbGl6aW5nIGFuZCBpbW1lZGlhdGUgZm9ybXMuIExldHMgc2VlIGhvdyB0aGlzIHdp
bGwNCmxvb2sgbGlrZS4gSSB3aWxsIGRyb3AgdXNpbmcgdGhlIEVBWF9FRFhfKiBtYWNyb3Ms
IGJ1dCBkdWUgdG8gdGhlIHJlYXNvbg0KbWVudGlvbmVkIGFib3ZlIEkgd29uJ3Qgc3dpdGNo
IHRvIHlvdXIgdmFyaWFudCBjb21wbGV0ZWx5Lg0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3Bh
cmF2aXJ0LmgNCj4gaW5kZXggZGYxMGIwZTRmN2I4Li44MmZmYzExZDZmMWYgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgNCj4gKysrIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20vcGFyYXZpcnQuaA0KPiBAQCAtMTc3LDE4ICsxNzcsMjAgQEAgc3Rh
dGljIGlubGluZSB2b2lkIF9fd3JpdGVfY3I0KHVuc2lnbmVkIGxvbmcgeCkNCj4gDQo+ICDC
oHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdTY0IHBhcmF2aXJ0X3JlYWRfbXNyKHUzMiBtc3Ip
DQo+ICDCoHsNCj4gLcKgwqDCoCBFQVhfRURYX0RFQ0xBUkVfQVJHUyh2YWwsIGxvdywgaGln
aCk7DQo+ICvCoMKgwqAgdTY0IHZhbDsNCj4gDQo+ICDCoMKgwqDCoCBQVk9QX1RFU1RfTlVM
TChjcHUucmVhZF9tc3IpOw0KPiAgwqDCoMKgwqAgYXNtIHZvbGF0aWxlKCIxOiAiQUxURVJO
QVRJVkVfMihQQVJBVklSVF9DQUxMLA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAicmRtc3IiLCBBTFRfTk9UX1hFTiwNCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NBTExfSU5TVFIsIEFMVF9YRU5QVl9D
QUxMKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFMVEVSTkFUSVZFKCIiLCAic2hs
ICQweDIwLCAlJXJkeDsgb3IgJSVyZHgsICUlcmF4IiwgQUxUX05PVF9YRU4pDQo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiMjpcbiINCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF9BU01fRVhUQUJMRV9UWVBFKDFiLCAyYiwgRVhfVFlQRV9SRE1TUikNCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IEVBWF9FRFhfUkVUKHZhbCwgbG93LCBoaWdoKSwg
QVNNX0NBTExfQ09OU1RSQUlOVA0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDogcGFy
YXZpcnRfcHRyKGNwdS5yZWFkX21zciksICJjIiAobXNyKSk7DQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgOiAiPWEiICh2YWwpLCBBU01fQ0FMTF9DT05TVFJBSU5UDQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBwYXJhdmlydF9wdHIoY3B1LnJlYWRfbXNyKSwgImMi
IChtc3IpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiAicmR4Iik7DQo+IA0KPiAt
wqDCoMKgIHJldHVybiBFQVhfRURYX1ZBTCh2YWwsIGxvdywgaGlnaCk7DQo+ICvCoMKgwqAg
cmV0dXJuIHZhbDsNCg0KSnVlcmdlbg0K
--------------pefjOMlVvz4lJIGDtsC3KwYp
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------pefjOMlVvz4lJIGDtsC3KwYp--

--------------5m4wyWuZsrcf0JlaWaNuLGP3--

--------------oels03X95c0cS93P70Cfnsn7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhJfX0FAwAAAAAACgkQsN6d1ii/Ey8c
mQf7B36mN9TkpQcJ9dBTl5D4DOiwEOq9zQ3tpGoxheLmNKDbHwW+OwcExi2Seq2FB7V53ANwlzt6
P7k5amwKLMLSgWxamT4khza7F4pjIVST+ELQTFXkCzVNcHEp3705DI9ypOf/k4QAtXPyFSajwvNh
3MOCBq0UDYMAj4juYAbPOg538e0/sKe4HPZ6c6VuJF+QXIAIAUSps9TveX3FRUAxVwcX+WHqumtQ
4WK/t/R/E0FnRINSKMMvbpZ8s8uFkw/GYvog23uKO19nVNQM2BUc8cEzsllbZ1WuUp5MYhTop3ZN
Eiq9RrkVrni2qEbsV/LESJbLGIO4yG8ddomtfeZzIA==
=/WKs
-----END PGP SIGNATURE-----

--------------oels03X95c0cS93P70Cfnsn7--

