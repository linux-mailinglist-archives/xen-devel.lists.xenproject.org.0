Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39C979D1C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 10:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799328.1209299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7Lv-0005Uq-US; Mon, 16 Sep 2024 08:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799328.1209299; Mon, 16 Sep 2024 08:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq7Lv-0005TA-R8; Mon, 16 Sep 2024 08:44:59 +0000
Received: by outflank-mailman (input) for mailman id 799328;
 Mon, 16 Sep 2024 08:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tb4s=QO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sq7Lu-0005T2-2t
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 08:44:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f082eb60-7407-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 10:44:52 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9385F21B6E;
 Mon, 16 Sep 2024 08:44:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F338139CE;
 Mon, 16 Sep 2024 08:44:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xl4aBgXw52Y/RAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Sep 2024 08:44:53 +0000
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
X-Inumbo-ID: f082eb60-7407-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726476293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ktzgsr6qHpA+IVyIZzyRCCfHIbuCfPS/dU8pM+xNWRo=;
	b=r4vhUvpAtl4sqWBrHMM2XhpMmXjc/6uD9QtV017FrLkPiPinJFWEt5oznSnMBDor5G6GMb
	RjJ7KvwUpblUTk9jGgiZ+FqzWx+xrG5nVf04N/75mVm5EC0K4yGK1NaD/c1qbqbSs6rgDN
	5e7nkNSDgGmGkgWA06ZJ9bxwEAsReh4=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=r4vhUvpA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726476293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ktzgsr6qHpA+IVyIZzyRCCfHIbuCfPS/dU8pM+xNWRo=;
	b=r4vhUvpAtl4sqWBrHMM2XhpMmXjc/6uD9QtV017FrLkPiPinJFWEt5oznSnMBDor5G6GMb
	RjJ7KvwUpblUTk9jGgiZ+FqzWx+xrG5nVf04N/75mVm5EC0K4yGK1NaD/c1qbqbSs6rgDN
	5e7nkNSDgGmGkgWA06ZJ9bxwEAsReh4=
Message-ID: <f8cf8e13-cbd3-4dfa-b09c-e0a14f0e346c@suse.com>
Date: Mon, 16 Sep 2024 10:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] x86/pvh: Make 64bit PVH entry relocatable
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240823193630.2583107-1-jason.andryuk@amd.com>
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
In-Reply-To: <20240823193630.2583107-1-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dIAicXmN5Gbh6Ov9I2piUkUE"
X-Rspamd-Queue-Id: 9385F21B6E
X-Spam-Level: 
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vger.kernel.org,amd.com,epam.com,redhat.com,gmail.com,oracle.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dIAicXmN5Gbh6Ov9I2piUkUE
Content-Type: multipart/mixed; boundary="------------UuG9x0Hwei00H54D5Tzv2d40";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Jason Andryuk <jason.andryuk@amd.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <f8cf8e13-cbd3-4dfa-b09c-e0a14f0e346c@suse.com>
Subject: Re: [PATCH v3 0/5] x86/pvh: Make 64bit PVH entry relocatable
References: <20240823193630.2583107-1-jason.andryuk@amd.com>
In-Reply-To: <20240823193630.2583107-1-jason.andryuk@amd.com>

--------------UuG9x0Hwei00H54D5Tzv2d40
Content-Type: multipart/mixed; boundary="------------gPhkdFLJFjqB1mZ4ng3KB1MJ"

--------------gPhkdFLJFjqB1mZ4ng3KB1MJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

eDg2IG1haW50YWluZXJzLA0KDQphcmUgeW91IGdvaW5nIHRvIHBpY2sgdGhpcyBzZXJpZXMg
dXAsIG9yIHNob3VsZCBJIHRha2UgaXQgdmlhIHRoZQ0KWGVuIHRyZWU/DQoNCg0KSnVlcmdl
bg0KDQpPbiAyMy4wOC4yNCAyMTozNiwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gVXNpbmcg
dGhlIFBWSCBlbnRyeSBwb2ludCwgdGhlIHVuY29tcHJlc3NlZCB2bWxpbnV4IGlzIGxvYWRl
ZCBhdA0KPiBMT0FEX1BIWVNJQ0FMX0FERFIsIGFuZCBleGVjdXRpb24gc3RhcnRzIGluIDMy
Yml0IG1vZGUgYXQgdGhlDQo+IGFkZHJlc3MgaW4gWEVOX0VMRk5PVEVfUEhZUzMyX0VOVFJZ
LCBwdmhfc3RhcnRfeGVuLCB3aXRoIHBhZ2luZw0KPiBkaXNhYmxlZC4NCj4gDQo+IExvYWRp
bmcgYXQgTE9BRF9QSFlTSUNBTF9BRERSIGhhcyBub3QgYmVlbiBhIHByb2JsZW0gaW4gdGhl
IHBhc3QgYXMNCj4gdmlydHVhbCBtYWNoaW5lcyBkb24ndCBoYXZlIGNvbmZsaWN0aW5nIG1l
bW9yeSBtYXBzLiAgQnV0IFhlbiBub3cNCj4gc3VwcG9ydHMgYSBQVkggZG9tMCwgd2hpY2gg
dXNlcyB0aGUgaG9zdCBtZW1vcnkgbWFwLCBhbmQgdGhlcmUgYXJlDQo+IENvcmVib290L0VE
SzIgZmlybXdhcmVzIHRoYXQgaGF2ZSByZXNlcnZlZCByZWdpb25zIGNvbmZsaWN0aW5nIHdp
dGgNCj4gTE9BRF9QSFlTSUNBTF9BRERSLiAgWGVuIHJlY2VudGx5IGFkZGVkIFhFTl9FTEZO
T1RFX1BIWVMzMl9SRUxPQyB0bw0KPiBzcGVjaWZ5IGFuIGFsaWdubWVudCwgbWluaW11bSBh
bmQgbWF4aW11bSBsb2FkIGFkZHJlc3Mgd2hlbg0KPiBMT0FEX1BIWVNJQ0FMX0FERFIgY2Fu
bm90IGJlIHVzZWQuICBUaGlzIHBhdGNoIHNlcmllcyBtYWtlcyB0aGUgUFZIDQo+IGVudHJ5
IHBhdGggUElDIHRvIHN1cHBvcnQgcmVsb2NhdGlvbi4NCj4gDQo+IE9ubHkgeDg2LTY0IGlz
IGNvbnZlcnRlZC4gIFRoZSAzMmJpdCBlbnRyeSBwYXRoIGNhbGxpbmcgaW50byB2bWxpbnV4
LA0KPiB3aGljaCBpcyBub3QgUElDLCB3aWxsIG5vdCBzdXBwb3J0IHJlbG9jYXRpb24uDQo+
IA0KPiBUaGUgZW50cnkgcGF0aCBuZWVkcyBwYWdlcyB0YWJsZXMgdG8gc3dpdGNoIHRvIDY0
Yml0IG1vZGUuICBBIG5ldw0KPiBwdmhfaW5pdF90b3BfcGd0IGlzIGFkZGVkIHRvIG1ha2Ug
dGhlIHRyYW5zaXRpb24gaW50byB0aGUgc3RhcnR1cF82NA0KPiB3aGVuIHRoZSByZWd1bGFy
IGluaXRfdG9wX3BndCBwYWdldGFibGVzIGFyZSBzZXR1cC4gIFRoaXMgZHVwbGljYXRpb24g
aXMNCj4gdW5mb3J0dW5hdGUsIGJ1dCBpdCBrZWVwcyB0aGUgY2hhbmdlcyBzaW1wbGVyLiAg
X19zdGFydHVwXzY0KCkgY2FuJ3QgYmUNCj4gdXNlZCB0byBzZXR1cCBpbml0X3RvcF9wZ3Qg
Zm9yIFBWSCBlbnRyeSBiZWNhdXNlIGl0IGlzIDY0Yml0IGNvZGUgLSB0aGUNCj4gMzJiaXQg
ZW50cnkgY29kZSBkb2Vzbid0IGhhdmUgcGFnZSB0YWJsZXMgdG8gdXNlLg0KPiANCj4gVGhp
cyBpcyB0aGUgc3RyYWlnaHQgZm9yd2FyZCBpbXBsZW1lbnRhdGlvbiB0byBtYWtlIGl0IHdv
cmsuICBPdGhlcg0KPiBhcHByb2FjaGVzIGNvdWxkIGJlIHB1cnN1ZWQuDQo+IA0KPiBjaGVj
a3BhdGNoLnBsIGdpdmVzIGFuIGVycm9yOiAiRVJST1I6IE1hY3JvcyB3aXRoIG11bHRpcGxl
IHN0YXRlbWVudHMNCj4gc2hvdWxkIGJlIGVuY2xvc2VkIGluIGEgZG8gLSB3aGlsZSBsb29w
IiBhYm91dCB0aGUgbW92ZWQgUE1EUyBtYWNyby4NCj4gQnV0IFBNRFMgaXMgYW4gYXNzZW1i
bGVyIG1hY3JvLCBzbyBpdHMgbm90IGFwcGxpY2FibGUuICBUaGVyZSBhcmUgc29tZQ0KPiBm
YWxzZSBwb3NpdGl2ZSB3YXJuaW5ncyAiV0FSTklORzogc3BhY2UgcHJvaGliaXRlZCBiZXR3
ZWVuIGZ1bmN0aW9uIG5hbWUNCj4gYW5kIG9wZW4gcGFyZW50aGVzaXMgJygnIiBhYm91dCB0
aGUgbWFjcm8sIHRvby4NCj4gDQo+IHYyIGFkZHJlc3NlcyByZXZpZXcgZmVlZGJhY2suICBJ
dCBhbHNvIHJlcGxhY2UgTE9BRF9QSFlTSUNBTF9BRERSIHdpdGgNCj4gX3BhKHB2aF9zdGFy
dF94ZW4pIGluIHNvbWUgb2Zmc2V0IGNhbGN1bGF0aW9ucy4gIFRoZXkgaGFwcGVuZWQgdG8g
YmUNCj4gZXF1YWwgaW4gbXkgb3JpZ2luYWwgYnVpbGRzLiAgV2hlbiB0aGUgdHdvIHZhbHVl
cyBkaWZmZXIsDQo+IF9wYShwdmhfc3RhcnRfeGVuKSBpcyB0aGUgY29ycmVjdCBvbmUgdG8g
dXNlLg0KPiANCj4gdjM6IEZpeCBidWlsZCBlcnJvciBmb3IgMzJiaXQuICBBZGQgSnVlcmdl
bidzIFItYiB0byBwYXRjaCA0Lg0KPiANCj4gSmFzb24gQW5kcnl1ayAoNSk6DQo+ICAgIHhl
bjogc3luYyBlbGZub3RlLmggZnJvbSB4ZW4gdHJlZQ0KPiAgICB4ODYvcHZoOiBNYWtlIFBW
SCBlbnRyeXBvaW50IFBJQyBmb3IgeDg2LTY0DQo+ICAgIHg4Ni9wdmg6IFNldCBwaHlzX2Jh
c2Ugd2hlbiBjYWxsaW5nIHhlbl9wcmVwYXJlX3B2aCgpDQo+ICAgIHg4Ni9rZXJuZWw6IE1v
dmUgcGFnZSB0YWJsZSBtYWNyb3MgdG8gaGVhZGVyDQo+ICAgIHg4Ni9wdmg6IEFkZCA2NGJp
dCByZWxvY2F0aW9uIHBhZ2UgdGFibGVzDQo+IA0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNt
L3BndGFibGVfNjQuaCB8ICAyMyArKysrLQ0KPiAgIGFyY2gveDg2L2tlcm5lbC9oZWFkXzY0
LlMgICAgICAgICB8ICAyMCAtLS0tDQo+ICAgYXJjaC94ODYvcGxhdGZvcm0vcHZoL2hlYWQu
UyAgICAgIHwgMTYxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAgIGluY2x1
ZGUveGVuL2ludGVyZmFjZS9lbGZub3RlLmggICB8ICA5MyArKysrKysrKysrKysrKysrLQ0K
PiAgIDQgZmlsZXMgY2hhbmdlZCwgMjU5IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygt
KQ0KPiANCj4gDQo+IGJhc2UtY29tbWl0OiA3YzYyNmNlNGJhZTFhYzE0ZjYwMDc2ZDAwZWFm
ZTcxYWYzMDQ1MGJhDQoNCg==
--------------gPhkdFLJFjqB1mZ4ng3KB1MJ
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

--------------gPhkdFLJFjqB1mZ4ng3KB1MJ--

--------------UuG9x0Hwei00H54D5Tzv2d40--

--------------dIAicXmN5Gbh6Ov9I2piUkUE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbn8AQFAwAAAAAACgkQsN6d1ii/Ey/i
8wf/S0yDyru3jn5rUfveejzPm5Vxz89HI0S/AuteHGQqjBSJOatAeFdwhY6Ng/XfLMe+wL1Tpnph
HQFZfzAuE3viHVX/PBrzzjZcWvovZrpp4xNQaxqJp4G0JxGa6m6VQyQG3ENl5ZYpOAuZl3fYw0+w
WtE3j6bDQMq/uxjo2yDJ+iZzuFVYmfpCLhmcDcLzTuAoPaETjSMXr5rtCgAy4W5WdbBjNahnenBz
Ng5Q6a2A426rya4ZJLwCdd1WXO3XuH/0vqIsU63DRitHgAiIxUEnYoKgAts0+0ez81i+o6Yant60
6SiNfcfWV8Qj8VFtORWEmJXxM6zPR4XGOljvM6JIhg==
=qR4W
-----END PGP SIGNATURE-----

--------------dIAicXmN5Gbh6Ov9I2piUkUE--

