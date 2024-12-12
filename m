Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4619EE156
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 09:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855542.1268411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLee9-0001PU-Jm; Thu, 12 Dec 2024 08:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855542.1268411; Thu, 12 Dec 2024 08:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLee9-0001Mn-GF; Thu, 12 Dec 2024 08:34:09 +0000
Received: by outflank-mailman (input) for mailman id 855542;
 Thu, 12 Dec 2024 08:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+X7=TF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tLee7-0001Mh-JA
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 08:34:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8e66392-b863-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 09:34:05 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A450E21120;
 Thu, 12 Dec 2024 08:34:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EF2513508;
 Thu, 12 Dec 2024 08:34:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UvNnDfyfWmfhewAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 12 Dec 2024 08:34:04 +0000
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
X-Inumbo-ID: d8e66392-b863-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733992444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tmKmAkW6sky1KrqIET/0hTlrU0aJrqhTHuOrrPeQhZY=;
	b=qG/7zovhFMnyzH9U9uaTBWObmvkOXJBWIfZ4xFizcoOSdv+K9VXsFGVFQVJID6OrNRtupx
	tPF1Z5Kg+MKxtOXgF3n/ydc/CZ9oQYbhLQ9fKsU7E/f1wkkO6NTkENqOnM9ZFHPCtcK1vQ
	UQTNj9TSYsWOzAlA4KMXiX0YDscZJ00=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="qG/7zovh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1733992444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tmKmAkW6sky1KrqIET/0hTlrU0aJrqhTHuOrrPeQhZY=;
	b=qG/7zovhFMnyzH9U9uaTBWObmvkOXJBWIfZ4xFizcoOSdv+K9VXsFGVFQVJID6OrNRtupx
	tPF1Z5Kg+MKxtOXgF3n/ydc/CZ9oQYbhLQ9fKsU7E/f1wkkO6NTkENqOnM9ZFHPCtcK1vQ
	UQTNj9TSYsWOzAlA4KMXiX0YDscZJ00=
Message-ID: <138422c8-36a8-4ed0-b8b8-c1085c9f22e6@suse.com>
Date: Thu, 12 Dec 2024 09:34:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Grab mm lock before grabbing pt lock
To: Maksym Planeta <maksym@exostellar.io>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20241204103516.3309112-1-maksym@exostellar.io>
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
In-Reply-To: <20241204103516.3309112-1-maksym@exostellar.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3TvqW7IvbKy70kZij6m81HGa"
X-Rspamd-Queue-Id: A450E21120
X-Spam-Level: 
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3TvqW7IvbKy70kZij6m81HGa
Content-Type: multipart/mixed; boundary="------------mdV24wtmxeUldecw03mORDd4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Maksym Planeta <maksym@exostellar.io>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <138422c8-36a8-4ed0-b8b8-c1085c9f22e6@suse.com>
Subject: Re: [PATCH] Grab mm lock before grabbing pt lock
References: <20241204103516.3309112-1-maksym@exostellar.io>
In-Reply-To: <20241204103516.3309112-1-maksym@exostellar.io>

--------------mdV24wtmxeUldecw03mORDd4
Content-Type: multipart/mixed; boundary="------------hPf6TyNP2uLKBoEnbFa4w0x1"

--------------hPf6TyNP2uLKBoEnbFa4w0x1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjQgMTE6MzUsIE1ha3N5bSBQbGFuZXRhIHdyb3RlOg0KPiBGdW5jdGlvbiB4
ZW5fcGluX3BhZ2UgY2FsbHMgeGVuX3B0ZV9sb2NrLCB3aGljaCBpbiB0dXJuIGdyYWIgcGFn
ZQ0KPiB0YWJsZSBsb2NrIChwdGxvY2spLiBXaGVuIGxvY2tpbmcsIHhlbl9wdGVfbG9jayBl
eHBlY3QgbW0tPnBhZ2VfdGFibGVfbG9jaw0KPiB0byBiZSBoZWxkIGJlZm9yZSBncmFiYmlu
ZyBwdGxvY2ssIGJ1dCB0aGlzIGRvZXMgbm90IGhhcHBlbiB3aGVuIHBpbm5pbmcNCj4gaXMg
Y2F1c2VkIGJ5IHhlbl9tbV9waW5fYWxsLg0KPiANCj4gVGhpcyBjb21taXQgYWRkcmVzc2Vz
IGxvY2tkZXAgd2FybmluZyBiZWxvdywgd2hpY2ggc2hvd3MgdXAgd2hlbg0KPiBzdXNwZW5k
aW5nIGEgWGVuIFZNLg0KPiANCj4gWyAzNjgwLjY1ODQyMl0gRnJlZXppbmcgdXNlciBzcGFj
ZSBwcm9jZXNzZXMNCj4gWyAzNjgwLjY2MDE1Nl0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9j
ZXNzZXMgY29tcGxldGVkIChlbGFwc2VkIDAuMDAxIHNlY29uZHMpDQo+IFsgMzY4MC42NjAx
ODJdIE9PTSBraWxsZXIgZGlzYWJsZWQuDQo+IFsgMzY4MC42NjAxOTJdIEZyZWV6aW5nIHJl
bWFpbmluZyBmcmVlemFibGUgdGFza3MNCj4gWyAzNjgwLjY2MTQ4NV0gRnJlZXppbmcgcmVt
YWluaW5nIGZyZWV6YWJsZSB0YXNrcyBjb21wbGV0ZWQgKGVsYXBzZWQgMC4wMDEgc2Vjb25k
cykNCj4gWyAzNjgwLjY4NTI1NF0NCj4gWyAzNjgwLjY4NTI2NV0gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQ0KPiBbIDM2ODAuNjg1MjY5XSBXQVJOSU5HOiBOZXN0ZWQg
bG9jayB3YXMgbm90IHRha2VuDQo+IFsgMzY4MC42ODUyNzRdIDYuMTIuMCsgIzE2IFRhaW50
ZWQ6IEcgICAgICAgIFcNCj4gWyAzNjgwLjY4NTI3OV0gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiBbIDM2ODAuNjg1MjgzXSBtaWdyYXRpb24vMC8xOSBpcyB0cnlp
bmcgdG8gbG9jazoNCj4gWyAzNjgwLjY4NTI4OF0gZmZmZjg4ODAwYmFjMzNjMCAocHRsb2Nr
X3B0cihwdGRlc2MpIzIpeysuKy59LXszOjN9LCBhdDogeGVuX3Bpbl9wYWdlKzB4MTc1LzB4
MWQwDQo+IFsgMzY4MC42ODUzMDNdDQo+IFsgMzY4MC42ODUzMDNdIGJ1dCB0aGlzIHRhc2sg
aXMgbm90IGhvbGRpbmc6DQo+IFsgMzY4MC42ODUzMDhdIGluaXRfbW0ucGFnZV90YWJsZV9s
b2NrDQo+IFsgMzY4MC42ODUzMTFdDQo+IFsgMzY4MC42ODUzMTFdIHN0YWNrIGJhY2t0cmFj
ZToNCj4gWyAzNjgwLjY4NTMxNl0gQ1BVOiAwIFVJRDogMCBQSUQ6IDE5IENvbW06IG1pZ3Jh
dGlvbi8wIFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICAgNi4xMi4wKyAjMTYNCj4gWyAz
NjgwLjY4NTMyNF0gVGFpbnRlZDogW1ddPVdBUk4NCj4gWyAzNjgwLjY4NTMyOF0gU3RvcHBl
cjogbXVsdGlfY3B1X3N0b3ArMHgwLzB4MTIwIDwtIF9fc3RvcF9jcHVzLmNvbnN0cHJvcC4w
KzB4OGMvMHhkMA0KPiBbIDM2ODAuNjg1MzM5XSBDYWxsIFRyYWNlOg0KPiBbIDM2ODAuNjg1
MzQ0XSAgPFRBU0s+DQo+IFsgMzY4MC42ODUzNDddICBkdW1wX3N0YWNrX2x2bCsweDc3LzB4
YjANCj4gWyAzNjgwLjY4NTM1Nl0gIF9fbG9ja19hY3F1aXJlKzB4OTE3LzB4MjMxMA0KPiBb
IDM2ODAuNjg1MzY0XSAgbG9ja19hY3F1aXJlKzB4Y2UvMHgyYzANCj4gWyAzNjgwLjY4NTM2
OV0gID8geGVuX3Bpbl9wYWdlKzB4MTc1LzB4MWQwDQo+IFsgMzY4MC42ODUzNzNdICBfcmF3
X3NwaW5fbG9ja19uZXN0X2xvY2srMHgyZi8weDcwDQo+IFsgMzY4MC42ODUzODFdICA/IHhl
bl9waW5fcGFnZSsweDE3NS8weDFkMA0KPiBbIDM2ODAuNjg1Mzg2XSAgeGVuX3Bpbl9wYWdl
KzB4MTc1LzB4MWQwDQo+IFsgMzY4MC42ODUzOTBdICA/IF9fcGZ4X3hlbl9waW5fcGFnZSsw
eDEwLzB4MTANCj4gWyAzNjgwLjY4NTM5NF0gIF9feGVuX3BnZF93YWxrKzB4MjMzLzB4MmMw
DQo+IFsgMzY4MC42ODU0MDFdICA/IHN0b3Bfb25lX2NwdSsweDkxLzB4MTAwDQo+IFsgMzY4
MC42ODU0MDVdICBfX3hlbl9wZ2RfcGluKzB4NWQvMHgyNTANCj4gWyAzNjgwLjY4NTQxMF0g
IHhlbl9tbV9waW5fYWxsKzB4NzAvMHhhMA0KPiBbIDM2ODAuNjg1NDE1XSAgeGVuX3B2X3By
ZV9zdXNwZW5kKzB4Zi8weDI4MA0KPiBbIDM2ODAuNjg1NDIwXSAgeGVuX3N1c3BlbmQrMHg1
Ny8weDFhMA0KPiBbIDM2ODAuNjg1NDI4XSAgbXVsdGlfY3B1X3N0b3ArMHg2Yi8weDEyMA0K
PiBbIDM2ODAuNjg1NDMyXSAgPyB1cGRhdGVfY3B1bWFza3NfaGllcisweDdjLzB4YTYwDQo+
IFsgMzY4MC42ODU0MzldICA/IF9fcGZ4X211bHRpX2NwdV9zdG9wKzB4MTAvMHgxMA0KPiBb
IDM2ODAuNjg1NDQzXSAgY3B1X3N0b3BwZXJfdGhyZWFkKzB4OGMvMHgxNDANCj4gWyAzNjgw
LjY4NTQ0OF0gID8gc21wYm9vdF90aHJlYWRfZm4rMHgyMC8weDFmMA0KPiBbIDM2ODAuNjg1
NDU0XSAgPyBfX3BmeF9zbXBib290X3RocmVhZF9mbisweDEwLzB4MTANCj4gWyAzNjgwLjY4
NTQ1OF0gIHNtcGJvb3RfdGhyZWFkX2ZuKzB4ZWQvMHgxZjANCj4gWyAzNjgwLjY4NTQ2Ml0g
IGt0aHJlYWQrMHhkZS8weDExMA0KPiBbIDM2ODAuNjg1NDY3XSAgPyBfX3BmeF9rdGhyZWFk
KzB4MTAvMHgxMA0KPiBbIDM2ODAuNjg1NDcxXSAgcmV0X2Zyb21fZm9yaysweDJmLzB4NTAN
Cj4gWyAzNjgwLjY4NTQ3OF0gID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4gWyAzNjgw
LjY4NTQ4Ml0gIHJldF9mcm9tX2ZvcmtfYXNtKzB4MWEvMHgzMA0KPiBbIDM2ODAuNjg1NDg5
XSAgPC9UQVNLPg0KPiBbIDM2ODAuNjg1NDkxXQ0KPiBbIDM2ODAuNjg1NDkxXSBvdGhlciBp
bmZvIHRoYXQgbWlnaHQgaGVscCB1cyBkZWJ1ZyB0aGlzOg0KPiBbIDM2ODAuNjg1NDk3XSAx
IGxvY2sgaGVsZCBieSBtaWdyYXRpb24vMC8xOToNCj4gWyAzNjgwLjY4NTUwMF0gICMwOiBm
ZmZmZmZmZjgyODRkZjM4IChwZ2RfbG9jayl7Ky4rLn0tezM6M30sIGF0OiB4ZW5fbW1fcGlu
X2FsbCsweDE0LzB4YTANCj4gWyAzNjgwLjY4NTUxMl0NCj4gWyAzNjgwLjY4NTUxMl0gc3Rh
Y2sgYmFja3RyYWNlOg0KPiBbIDM2ODAuNjg1NTE4XSBDUFU6IDAgVUlEOiAwIFBJRDogMTkg
Q29tbTogbWlncmF0aW9uLzAgVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgICA2LjEyLjAr
ICMxNg0KPiBbIDM2ODAuNjg1NTI4XSBUYWludGVkOiBbV109V0FSTg0KPiBbIDM2ODAuNjg1
NTMxXSBTdG9wcGVyOiBtdWx0aV9jcHVfc3RvcCsweDAvMHgxMjAgPC0gX19zdG9wX2NwdXMu
Y29uc3Rwcm9wLjArMHg4Yy8weGQwDQo+IFsgMzY4MC42ODU1MzhdIENhbGwgVHJhY2U6DQo+
IFsgMzY4MC42ODU1NDFdICA8VEFTSz4NCj4gWyAzNjgwLjY4NTU0NF0gIGR1bXBfc3RhY2tf
bHZsKzB4NzcvMHhiMA0KPiBbIDM2ODAuNjg1NTQ5XSAgX19sb2NrX2FjcXVpcmUrMHg5M2Mv
MHgyMzEwDQo+IFsgMzY4MC42ODU1NTRdICBsb2NrX2FjcXVpcmUrMHhjZS8weDJjMA0KPiBb
IDM2ODAuNjg1NTU4XSAgPyB4ZW5fcGluX3BhZ2UrMHgxNzUvMHgxZDANCj4gWyAzNjgwLjY4
NTU2Ml0gIF9yYXdfc3Bpbl9sb2NrX25lc3RfbG9jaysweDJmLzB4NzANCj4gWyAzNjgwLjY4
NTU2OF0gID8geGVuX3Bpbl9wYWdlKzB4MTc1LzB4MWQwDQo+IFsgMzY4MC42ODU1NzJdICB4
ZW5fcGluX3BhZ2UrMHgxNzUvMHgxZDANCj4gWyAzNjgwLjY4NTU3OF0gID8gX19wZnhfeGVu
X3Bpbl9wYWdlKzB4MTAvMHgxMA0KPiBbIDM2ODAuNjg1NTgyXSAgX194ZW5fcGdkX3dhbGsr
MHgyMzMvMHgyYzANCj4gWyAzNjgwLjY4NTU4OF0gID8gc3RvcF9vbmVfY3B1KzB4OTEvMHgx
MDANCj4gWyAzNjgwLjY4NTU5Ml0gIF9feGVuX3BnZF9waW4rMHg1ZC8weDI1MA0KPiBbIDM2
ODAuNjg1NTk2XSAgeGVuX21tX3Bpbl9hbGwrMHg3MC8weGEwDQo+IFsgMzY4MC42ODU2MDBd
ICB4ZW5fcHZfcHJlX3N1c3BlbmQrMHhmLzB4MjgwDQo+IFsgMzY4MC42ODU2MDddICB4ZW5f
c3VzcGVuZCsweDU3LzB4MWEwDQo+IFsgMzY4MC42ODU2MTFdICBtdWx0aV9jcHVfc3RvcCsw
eDZiLzB4MTIwDQo+IFsgMzY4MC42ODU2MTVdICA/IHVwZGF0ZV9jcHVtYXNrc19oaWVyKzB4
N2MvMHhhNjANCj4gWyAzNjgwLjY4NTYyMF0gID8gX19wZnhfbXVsdGlfY3B1X3N0b3ArMHgx
MC8weDEwDQo+IFsgMzY4MC42ODU2MjVdICBjcHVfc3RvcHBlcl90aHJlYWQrMHg4Yy8weDE0
MA0KPiBbIDM2ODAuNjg1NjI5XSAgPyBzbXBib290X3RocmVhZF9mbisweDIwLzB4MWYwDQo+
IFsgMzY4MC42ODU2MzRdICA/IF9fcGZ4X3NtcGJvb3RfdGhyZWFkX2ZuKzB4MTAvMHgxMA0K
PiBbIDM2ODAuNjg1NjM4XSAgc21wYm9vdF90aHJlYWRfZm4rMHhlZC8weDFmMA0KPiBbIDM2
ODAuNjg1NjQyXSAga3RocmVhZCsweGRlLzB4MTEwDQo+IFsgMzY4MC42ODU2NDVdICA/IF9f
cGZ4X2t0aHJlYWQrMHgxMC8weDEwDQo+IFsgMzY4MC42ODU2NDldICByZXRfZnJvbV9mb3Jr
KzB4MmYvMHg1MA0KPiBbIDM2ODAuNjg1NjU0XSAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgx
MA0KPiBbIDM2ODAuNjg1NjU3XSAgcmV0X2Zyb21fZm9ya19hc20rMHgxYS8weDMwDQo+IFsg
MzY4MC42ODU2NjJdICA8L1RBU0s+DQo+IFsgMzY4MC42ODUyNjddIHhlbjpncmFudF90YWJs
ZTogR3JhbnQgdGFibGVzIHVzaW5nIHZlcnNpb24gMSBsYXlvdXQNCj4gWyAzNjgwLjY4NTky
MV0gT09NIGtpbGxlciBlbmFibGVkLg0KPiBbIDM2ODAuNjg1OTM0XSBSZXN0YXJ0aW5nIHRh
c2tzIC4uLiBkb25lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFrc3ltIFBsYW5ldGEgPG1h
a3N5bUBleG9zdGVsbGFyLmlvPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------hPf6TyNP2uLKBoEnbFa4w0x1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------hPf6TyNP2uLKBoEnbFa4w0x1--

--------------mdV24wtmxeUldecw03mORDd4--

--------------3TvqW7IvbKy70kZij6m81HGa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdan/sFAwAAAAAACgkQsN6d1ii/Ey+8
EAgAkzb0QIFIiNL92O77yTHv48ee2qE6cR6q1/EWcIGOOPfaQ9Lcag46vdIBSBiIAHnfx7IoVb/4
Bqtx3KRPooPzOW2fWXaKDaJrc+mRFvduliIPcDQbQH+lDsnW0i+RVulzAjhd8Mti9+3L1elwxcdV
mYMd4Nzk7oiBOoFj2E2eZYZ9SlLtM4xOyMdBfQ3UM9BOr9vJfeH0ghO6MxxmCh4cwl32MMMj+PAv
0J63AfaSM0RN192rEFOs7kTouH+i04s+ejIVHo4EhSIcbRWcdDzd0IagA5q6fHkq/c1VkmG9zGBp
rp6ef4tXOCRUOmav5GxoCdQ3sXndBbsauv5lp0tZFg==
=W1Kj
-----END PGP SIGNATURE-----

--------------3TvqW7IvbKy70kZij6m81HGa--

