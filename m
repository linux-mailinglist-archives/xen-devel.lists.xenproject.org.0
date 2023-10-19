Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222807CF71F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619253.964043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRMT-0001Ep-K7; Thu, 19 Oct 2023 11:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619253.964043; Thu, 19 Oct 2023 11:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtRMT-0001C8-H9; Thu, 19 Oct 2023 11:38:45 +0000
Received: by outflank-mailman (input) for mailman id 619253;
 Thu, 19 Oct 2023 11:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yz61=GB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qtRMS-0001Bz-Ta
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:38:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e0196a3-6e74-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:38:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B7B21F38C;
 Thu, 19 Oct 2023 11:38:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9A56139C2;
 Thu, 19 Oct 2023 11:38:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hFSLM0EVMWWrIgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 Oct 2023 11:38:41 +0000
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
X-Inumbo-ID: 0e0196a3-6e74-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697715522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qzJ6TJbI9vJZwCZlDe5dCpDP4jbNYRA3VOgITl7b3o4=;
	b=Uh1bc4ayU+nVAzX1MA08mMS2ubkNiUBgE5Lfx4sp1CcV9qkpvNR0LuBzN3yz0xSNtN3qz+
	vJbrJoqqVfYzSxmjbrvEtriIXAjFg7Mkw1yK/4nv1zA5Ms0ZYOXMFYZMGgfdJ7mc+Rv/Lu
	Ayj8/r37L1WUYJxTN+TFDbD9tRB7Yek=
Message-ID: <1f8183eb-65cc-41b6-bd91-d1075757b366@suse.com>
Date: Thu, 19 Oct 2023 13:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20231019112314.22665-1-jgross@suse.com>
 <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
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
In-Reply-To: <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OqmMUqC304sT0nLmXWw4yeKi"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OqmMUqC304sT0nLmXWw4yeKi
Content-Type: multipart/mixed; boundary="------------jvFoVQDNsSWL29d0XMA119a9";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <1f8183eb-65cc-41b6-bd91-d1075757b366@suse.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
References: <20231019112314.22665-1-jgross@suse.com>
 <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>
In-Reply-To: <F1CDF477-9003-45F9-83E8-2122413AB514@arm.com>

--------------jvFoVQDNsSWL29d0XMA119a9
Content-Type: multipart/mixed; boundary="------------5KRz405KTaJFwc4dDhD0Uhlg"

--------------5KRz405KTaJFwc4dDhD0Uhlg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTAuMjMgMTM6MzEsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+IEhpIEp1ZXJnZW4sDQo+
IA0KPj4gT24gT2N0IDE5LCAyMDIzLCBhdCAxOToyMywgSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToNCj4+DQo+PiBXaGVuIG1vdmluZyBhIGRvbWFpbiBvdXQgb2Yg
YSBjcHVwb29sIHJ1bm5pbmcgd2l0aCB0aGUgY3JlZGl0Mg0KPj4gc2NoZWR1bGVyIGFuZCBo
YXZpbmcgbXVsdGlwbGUgcnVuLXF1ZXVlcywgdGhlIGZvbGxvd2luZyBBU1NFUlQoKSBjYW4N
Cj4+IGJlIG9ic2VydmVkOg0KPj4NCj4+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPj4gKFhF
TikgICAgWzxmZmZmODJkMDQwMjNhNzAwPl0gUiBjcmVkaXQyLmMjY3NjaGVkMl91bml0X3Jl
bW92ZSsweGUzLzB4ZTcNCj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDI0NmFkYj5dIFMgc2No
ZWRfbW92ZV9kb21haW4rMHgyZjMvMHg1YjENCj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIz
NGNmNz5dIFMgY3B1cG9vbC5jI2NwdXBvb2xfbW92ZV9kb21haW5fbG9ja2VkKzB4MWQvMHgz
Yg0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjM2MDI1Pl0gUyBjcHVwb29sX21vdmVfZG9t
YWluKzB4MjQvMHgzNQ0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjA2NTEzPl0gUyBkb21h
aW5fa2lsbCsweGE1LzB4MTE2DQo+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMzJiMTI+XSBT
IGRvX2RvbWN0bCsweGU1Zi8weDE5NTENCj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDIyNzZi
YT5dIFMgdGltZXIuYyN0aW1lcl9sb2NrKzB4NjkvMHgxNDMNCj4+IChYRU4pICAgIFs8ZmZm
ZjgyZDA0MDJkYzcxYj5dIFMgcHZfaHlwZXJjYWxsKzB4NDRlLzB4NGE5DQo+PiAoWEVOKSAg
ICBbPGZmZmY4MmQwNDAyMDEyYjc+XSBTIGxzdGFyX2VudGVyKzB4MTM3LzB4MTQwDQo+PiAo
WEVOKQ0KPj4gKFhFTikNCj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioNCj4+IChYRU4pIFBhbmljIG9uIENQVSAxOg0KPj4gKFhFTikgQXNzZXJ0
aW9uICdzdmMtPnJxZCA9PSBjMnJxZChzY2hlZF91bml0X21hc3Rlcih1bml0KSknIGZhaWxl
ZCBhdCBjb21tb24vc2NoZWQvY3JlZGl0Mi5jOjExNTkNCj4+IChYRU4pICoqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+DQo+PiBUaGlzIGlzIGhhcHBlbmlu
ZyBhcyBzY2hlZF9tb3ZlX2RvbWFpbigpIGlzIHNldHRpbmcgYSBkaWZmZXJlbnQgY3B1DQo+
PiBmb3IgYSBzY2hlZHVsaW5nIHVuaXQgd2l0aG91dCB0ZWxsaW5nIHRoZSBzY2hlZHVsZXIu
IFdoZW4gdGhpcyB1bml0IGlzDQo+PiByZW1vdmVkIGZyb20gdGhlIHNjaGVkdWxlciwgdGhl
IEFTU0VSVCgpIHdpbGwgdHJpZ2dlci4NCj4+DQo+PiBJbiBub24tZGVidWcgYnVpbGRzIHRo
ZSByZXN1bHQgaXMgdXN1YWxseSBhIGNsb2JiZXJlZCBwb2ludGVyLCBsZWFkaW5nDQo+PiB0
byBhbm90aGVyIGNyYXNoIGEgc2hvcnQgdGltZSBsYXRlci4NCj4+DQo+PiBGaXggdGhhdCBi
eSBzd2FwcGluZyB0aGUgdHdvIGludm9sdmVkIGFjdGlvbnMgKHNldHRpbmcgYW5vdGhlciBj
cHUgYW5kDQo+PiByZW1vdmluZyB0aGUgdW5pdCBmcm9tIHRoZSBzY2hlZHVsZXIpLg0KPj4N
Cj4+IENjOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBFbW1tLCBJ
IHRoaW5rIF4gdGhpcyBDQyBpcyBiZXR0ZXIgdG8gbWUgbW92ZWQgdG8gdGhlIHNjaXNzb3Jz
IGxpbmUsIG90aGVyd2lzZQ0KPiBpZiB0aGlzIHBhdGNoIGlzIGNvbW1pdHRlZCwgdGhpcyBs
aW5lIHdpbGwgYmUgc2hvd24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLi4uDQo+IA0KPj4gRml4
ZXM6IDcwZmFkYzQxNjM1YiAoInhlbi9jcHVwb29sOiBzdXBwb3J0IG1vdmluZyBkb21haW4g
YmV0d2VlbiBjcHVwb29scyB3aXRoIGRpZmZlcmVudCBncmFudWxhcml0eSIpDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+
IFRoaXMgZml4ZXMgYSByZWdyZXNzaW9uIGludHJvZHVjZWQgaW4gWGVuIDQuMTUuIFRoZSBm
aXggaXMgdmVyeSBzaW1wbGUNCj4+IGFuZCBpdCB3aWxsIGFmZmVjdCBvbmx5IGNvbmZpZ3Vy
YXRpb25zIHdpdGggbXVsdGlwbGUgY3B1cG9vbHMuIEkgdGhpbmsNCj4+IHdoZXRoZXIgdG8g
aW5jbHVkZSBpdCBpbiA0LjE4IHNob3VsZCBiZSBkZWNpZGVkIGJ5IHRoZSByZWxlYXNlIG1h
bmFnZXINCj4+IGJhc2VkIG9uIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRoZSByZWxlYXNlIChJ
IHRoaW5rIEkgd291bGRuJ3QgaGF2ZQ0KPj4gYWRkZWQgaXQgdGhhdCBsYXRlIGluIHRoZSBy
ZWxlYXNlIHdoaWxlIGJlaW5nIHRoZSByZWxlYXNlIG1hbmFnZXIpLg0KPiANCj4gVGhhbmtz
IGZvciB0aGUgcmVtaW5kZXIgOikNCj4gDQo+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgYW0g
d3JvbmcsIGlmIHRoaXMgaXMgZml4aW5nIHRoZSByZWdyZXNzaW9uIGludHJvZHVjZWQgaW4N
Cj4gNC4xNSwgc2hvdWxkbuKAmXQgdGhpcyBwYXRjaCBiZWluZyBiYWNrcG9ydGVkIHRvIDQu
MTUsIDQuMTYsIDQuMTcgYW5kIHNvb24NCj4gNC4xOD8gU28gaG9uZXN0bHkgSSB0aGluayBh
dCBsZWFzdCBmb3IgNC4xOCBlaXRoZXIgYWRkIHRoaXMgcGF0Y2ggbm93IG9yDQo+IGxhdGVy
IHdvbuKAmXQgbWFrZSBtdWNoIGRpZmZlcmVuY2XigKZJIGFtIG9rIGVpdGhlciB3YXkgSSBn
dWVzcy4NCg0KWW91IGFyZSByaWdodCwgdGhlIHBhdGNoIG5lZWRzIHRvIGJlIGJhY2twb3J0
ZWQuDQoNCk9UT0ggbm9ib2R5IG5vdGljZWQgdGhlIHJlZ3Jlc3Npb24gdW50aWwgYSBmZXcg
ZGF5cyBhZ28uIFNvIGRlbGF5aW5nIHRoZSBmaXgNCmZvciBhIGZldyB3ZWVrcyB3b3VsZCBw
cm9iYWJseSBub3QgaHVydCB0b28gbWFueSBwZW9wbGUuIEVhY2ggcGF0Y2ggY2hhbmdpbmcN
CmNvZGUgaXMgYSByaXNrIHRvIGludHJvZHVjZSBhbm90aGVyIHJlZ3Jlc3Npb24sIHNvIGl0
cyB5b3VyIGRlY2lzaW9uIHdoZXRoZXINCnlvdSB3YW50IHRvIHRha2UgdGhpcyByaXNrLiBF
c3BlY2lhbGx5IGNoYW5nZXMgbGlrZSB0aGlzIG9uZSB0b3VjaGluZyB0aGUNCmNvcmUgc2No
ZWR1bGluZyBjb2RlIGFsd2F5cyBoYXZlIGEgbGF0ZW50IHJpc2sgdG8gb3BlbiB1cCBhIHNt
YWxsIHJhY2Ugd2luZG93DQoodGhpcyBjb3VsZCBiZSBzYWlkIGZvciB0aGUgb3JpZ2luYWwg
cGF0Y2ggSSdtIGZpeGluZyBoZXJlLCB0b28gOi0pICkuDQoNCg0KSnVlcmdlbg0K
--------------5KRz405KTaJFwc4dDhD0Uhlg
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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------5KRz405KTaJFwc4dDhD0Uhlg--

--------------jvFoVQDNsSWL29d0XMA119a9--

--------------OqmMUqC304sT0nLmXWw4yeKi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUxFUEFAwAAAAAACgkQsN6d1ii/Ey/b
FAf/a2uCjPLJHjG6TUtXgLHwPBZYqPWCjaq2w8SuaXayA0HCqQ512V4Q4Rnt85oahy8n9e9tM19Z
H5UE4imYUmkeMB0MD2bd8EKoRzqktKjMcbmfiKmhryZK3EeD0iA5yD0r54WKRWn81Ap7Z3kMY6Ru
10R/Psrg1MxJm8SuzeVEyry+oTQM9WITFXOxEsxCQmJdP07TAPScksCffq70RsbwOGNXzLIPEDp2
YS6hwxV+wYRyJyhh0A15EMmYYEZdvQhme5kAn6uoHRLVySqQwYfPL8xSk59dZAz5Wm0QN+w9NBI8
5oTtlglGIlUtH50Cu7rO7hwwCC31mDbODl/c/jxZlQ==
=diOI
-----END PGP SIGNATURE-----

--------------OqmMUqC304sT0nLmXWw4yeKi--

