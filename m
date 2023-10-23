Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54A97D2A76
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 08:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620978.966881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoTM-00031a-9w; Mon, 23 Oct 2023 06:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620978.966881; Mon, 23 Oct 2023 06:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quoTM-0002z0-6h; Mon, 23 Oct 2023 06:31:32 +0000
Received: by outflank-mailman (input) for mailman id 620978;
 Mon, 23 Oct 2023 06:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t4BY=GF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1quoTK-0002yr-B0
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 06:31:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb42b7e3-716d-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 08:31:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8896B1FD74;
 Mon, 23 Oct 2023 06:31:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52534132FD;
 Mon, 23 Oct 2023 06:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /1alEj4TNmVCWQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 23 Oct 2023 06:31:26 +0000
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
X-Inumbo-ID: cb42b7e3-716d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698042686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hGQlb6VBtMx0KwTDMcec75OMPWM60E36Q4mWk4rFzcI=;
	b=pVBeIQ7zL3GKd5UehzgohsGBLUMRra53Cm9eM+SuK8IzG3h4GweSY9yTK7u6EL4vw2UrB0
	XJsMnE+EPpriYNaHGFgozPZh1lGbl8bJC6Xl7XsGVx2843A15di7maPJGdxq/caXkTwJMR
	hzAyLjXkRDWu10a+QdSoPbo8hVD6wHg=
Message-ID: <ed494df3-85da-4849-b6e3-f9d60862c8b7@suse.com>
Date: Mon, 23 Oct 2023 08:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231019112314.22665-1-jgross@suse.com>
 <d1284225-8cca-4f5a-911e-8ebdc0336356@citrix.com>
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
In-Reply-To: <d1284225-8cca-4f5a-911e-8ebdc0336356@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------meCs2tUTK5YoQ0zLlDsmTXrO"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -8.99
X-Spamd-Result: default: False [-8.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[5];
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
--------------meCs2tUTK5YoQ0zLlDsmTXrO
Content-Type: multipart/mixed; boundary="------------pSCJR0n4y5TfNY7mG0tR3YCh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Henry Wang <Henry.Wang@arm.com>
Message-ID: <ed494df3-85da-4849-b6e3-f9d60862c8b7@suse.com>
Subject: Re: [PATCH] xen/sched: fix sched_move_domain()
References: <20231019112314.22665-1-jgross@suse.com>
 <d1284225-8cca-4f5a-911e-8ebdc0336356@citrix.com>
In-Reply-To: <d1284225-8cca-4f5a-911e-8ebdc0336356@citrix.com>

--------------pSCJR0n4y5TfNY7mG0tR3YCh
Content-Type: multipart/mixed; boundary="------------XGp0bSL8egSA1qw0RVhD8Y84"

--------------XGp0bSL8egSA1qw0RVhD8Y84
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMTAuMjMgMjA6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE5LzEwLzIw
MjMgMTI6MjMgcG0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBXaGVuIG1vdmluZyBhIGRv
bWFpbiBvdXQgb2YgYSBjcHVwb29sIHJ1bm5pbmcgd2l0aCB0aGUgY3JlZGl0Mg0KPj4gc2No
ZWR1bGVyIGFuZCBoYXZpbmcgbXVsdGlwbGUgcnVuLXF1ZXVlcywgdGhlIGZvbGxvd2luZyBB
U1NFUlQoKSBjYW4NCj4+IGJlIG9ic2VydmVkOg0KPj4NCj4+IChYRU4pIFhlbiBjYWxsIHRy
YWNlOg0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjNhNzAwPl0gUiBjcmVkaXQyLmMjY3Nj
aGVkMl91bml0X3JlbW92ZSsweGUzLzB4ZTcNCj4+IChYRU4pICAgIFs8ZmZmZjgyZDA0MDI0
NmFkYj5dIFMgc2NoZWRfbW92ZV9kb21haW4rMHgyZjMvMHg1YjENCj4+IChYRU4pICAgIFs8
ZmZmZjgyZDA0MDIzNGNmNz5dIFMgY3B1cG9vbC5jI2NwdXBvb2xfbW92ZV9kb21haW5fbG9j
a2VkKzB4MWQvMHgzYg0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjM2MDI1Pl0gUyBjcHVw
b29sX21vdmVfZG9tYWluKzB4MjQvMHgzNQ0KPj4gKFhFTikgICAgWzxmZmZmODJkMDQwMjA2
NTEzPl0gUyBkb21haW5fa2lsbCsweGE1LzB4MTE2DQo+PiAoWEVOKSAgICBbPGZmZmY4MmQw
NDAyMzJiMTI+XSBTIGRvX2RvbWN0bCsweGU1Zi8weDE5NTENCj4+IChYRU4pICAgIFs8ZmZm
ZjgyZDA0MDIyNzZiYT5dIFMgdGltZXIuYyN0aW1lcl9sb2NrKzB4NjkvMHgxNDMNCj4+IChY
RU4pICAgIFs8ZmZmZjgyZDA0MDJkYzcxYj5dIFMgcHZfaHlwZXJjYWxsKzB4NDRlLzB4NGE5
DQo+PiAoWEVOKSAgICBbPGZmZmY4MmQwNDAyMDEyYjc+XSBTIGxzdGFyX2VudGVyKzB4MTM3
LzB4MTQwDQo+PiAoWEVOKQ0KPj4gKFhFTikNCj4+IChYRU4pICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCj4+IChYRU4pIFBhbmljIG9uIENQVSAxOg0KPj4g
KFhFTikgQXNzZXJ0aW9uICdzdmMtPnJxZCA9PSBjMnJxZChzY2hlZF91bml0X21hc3Rlcih1
bml0KSknIGZhaWxlZCBhdCBjb21tb24vc2NoZWQvY3JlZGl0Mi5jOjExNTkNCj4+IChYRU4p
ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4+DQo+PiBUaGlz
IGlzIGhhcHBlbmluZyBhcyBzY2hlZF9tb3ZlX2RvbWFpbigpIGlzIHNldHRpbmcgYSBkaWZm
ZXJlbnQgY3B1DQo+PiBmb3IgYSBzY2hlZHVsaW5nIHVuaXQgd2l0aG91dCB0ZWxsaW5nIHRo
ZSBzY2hlZHVsZXIuIFdoZW4gdGhpcyB1bml0IGlzDQo+PiByZW1vdmVkIGZyb20gdGhlIHNj
aGVkdWxlciwgdGhlIEFTU0VSVCgpIHdpbGwgdHJpZ2dlci4NCj4+DQo+PiBJbiBub24tZGVi
dWcgYnVpbGRzIHRoZSByZXN1bHQgaXMgdXN1YWxseSBhIGNsb2JiZXJlZCBwb2ludGVyLCBs
ZWFkaW5nDQo+PiB0byBhbm90aGVyIGNyYXNoIGEgc2hvcnQgdGltZSBsYXRlci4NCj4+DQo+
PiBGaXggdGhhdCBieSBzd2FwcGluZyB0aGUgdHdvIGludm9sdmVkIGFjdGlvbnMgKHNldHRp
bmcgYW5vdGhlciBjcHUgYW5kDQo+PiByZW1vdmluZyB0aGUgdW5pdCBmcm9tIHRoZSBzY2hl
ZHVsZXIpLg0KPj4NCj4+IENjOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+
PiBGaXhlczogNzBmYWRjNDE2MzViICgieGVuL2NwdXBvb2w6IHN1cHBvcnQgbW92aW5nIGRv
bWFpbiBiZXR3ZWVuIGNwdXBvb2xzIHdpdGggZGlmZmVyZW50IGdyYW51bGFyaXR5IikNCj4g
DQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9EYXNoYXJvL2Rhc2hhcm8taXNzdWVzL2lz
c3Vlcy80ODgNCj4gDQo+IEFuZCBhIFJlcG9ydGVkL1Rlc3RlZC1ieSBpZiB0aGUgZGlzY292
ZXJlciB3aXNoZXMuDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBUaGlzIGZpeGVzIGEgcmVncmVzc2lvbiBpbnRy
b2R1Y2VkIGluIFhlbiA0LjE1LiBUaGUgZml4IGlzIHZlcnkgc2ltcGxlDQo+PiBhbmQgaXQg
d2lsbCBhZmZlY3Qgb25seSBjb25maWd1cmF0aW9ucyB3aXRoIG11bHRpcGxlIGNwdXBvb2xz
LiBJIHRoaW5rDQo+PiB3aGV0aGVyIHRvIGluY2x1ZGUgaXQgaW4gNC4xOCBzaG91bGQgYmUg
ZGVjaWRlZCBieSB0aGUgcmVsZWFzZSBtYW5hZ2VyDQo+PiBiYXNlZCBvbiB0aGUgY3VycmVu
dCBzdGF0ZSBvZiB0aGUgcmVsZWFzZSAoSSB0aGluayBJIHdvdWxkbid0IGhhdmUNCj4+IGFk
ZGVkIGl0IHRoYXQgbGF0ZSBpbiB0aGUgcmVsZWFzZSB3aGlsZSBiZWluZyB0aGUgcmVsZWFz
ZSBtYW5hZ2VyKS4NCj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyB8IDcg
KysrKy0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyBi
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBpbmRleCAxMmRlZWZhNzQ1Li5lOWY3NDg2
MTk3IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMNCj4+ICsrKyBi
L3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtNzM4LDEyICs3MzgsMTMgQEAgaW50
IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpj
KQ0KPj4gICAgICAgbmV3X3AgPSBjcHVtYXNrX2ZpcnN0KGQtPmNwdXBvb2wtPmNwdV92YWxp
ZCk7DQo+PiAgICAgICBmb3JfZWFjaF9zY2hlZF91bml0ICggZCwgdW5pdCApDQo+PiAgICAg
ICB7DQo+PiAtICAgICAgICBzcGlubG9ja190ICpsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2Nr
X2lycSh1bml0KTsNCj4+ICsgICAgICAgIHNwaW5sb2NrX3QgKmxvY2s7DQo+PiArDQo+PiAr
ICAgICAgICBzY2hlZF9yZW1vdmVfdW5pdChvbGRfb3BzLCB1bml0KTsNCj4+ICAgDQo+PiAr
ICAgICAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0KTsNCj4+ICAgICAg
ICAgICBzY2hlZF9zZXRfcmVzKHVuaXQsIGdldF9zY2hlZF9yZXMobmV3X3ApKTsNCj4+ICAg
ICAgICAgICBzcGluX3VubG9ja19pcnEobG9jayk7DQo+PiAtDQo+PiAtICAgICAgICBzY2hl
ZF9yZW1vdmVfdW5pdChvbGRfb3BzLCB1bml0KTsNCj4gDQo+IEknbSBoYXBweSB0byBzZWUg
dGhlIFQtYnksIGFuZCB0aGF0IHlvdSBrbm93IHdoYXQncyBnb2luZyBvbiBoZXJlLCBidXQg
SQ0KPiBkb24ndCB1bmRlcnN0YW5kIHRoZSBleHBsYW5hdGlvbi4NCj4gDQo+IFRoZSBjaGFu
Z2UgaGVyZSBpcyB0aGUgb3JkZXJpbmcgb2Ygc2NoZWRfcmVtb3ZlX3VuaXQoKSB3aXRoIHJl
c3BlY3QgdG8NCj4gdGhlIGxvY2svZ2V0JnNldC91bmxvY2sgYmxvY2suDQoNClllcy4NCg0K
PiByZW1vdmUgdW5pdCBpcyBtb2RlcmF0ZWx5IGNvbXBsaWNhdGVkLCBidXQgdGhlIGdldCZz
ZXQgaXMganVzdCBhbiBSQ1UNCj4gcG9pbnRlciBhc3NpZ25tZW50LsKgIEJ1dCBhcyB0aGUg
YXNzZXJ0aW9uIGZpcmVzIGluIHRoZSBsYXR0ZXIgYWN0aW9uLCBpdA0KPiBtdXN0IGJlIHRo
ZSBnZXQmc2V0IGNhdXNpbmcgcHJvYmxlbXMuDQoNClllcy4gQXMgSSB3cm90ZSwgaXQgaXMg
YmVjYXVzZSB0aGUgY3B1IGFzc2lnbm1lbnQgb2YgdGhlIHVuaXQgaXMgYmVpbmcNCmNoYW5n
ZWQgd2l0aG91dCB0ZWxsaW5nIHRoZSBzcGVjaWZpYyBzY2hlZHVsZXIgKGNyZWRpdDIpIGFi
b3V0IGl0Lg0KDQo+IEFuZCB0aGF0J3MgYmVjYXVzZSBuZXdfcCBpcyBhY3R1YWxseSBhIGNw
dSBudW1iZXIsIHdoaWNoIGhhcyB0aGUNCj4gY29uc2VxdWVuY2Ugb2YgY2F1c2luZyBDcmVk
aXQyJ3MgYzJycWQoKSB0byBtYXRlcmlhbGlzZSB0aGUgd3JvbmcNCj4gY3NjaGVkMl9ydW5x
dWV1ZV9kYXRhIHBvaW50ZXIsIGFuZCB0aGVuIHdlJ3JlIG9wZXJhdGluZyBvbiBzb21lb25l
DQo+IGVsc2UncyBkYXRhIHdpdGhvdXQgYSBzdWl0YWJsZSBsb2NrIGhlbGQuDQoNCkkgaGF2
ZW4ndCBsb29rZWQgaW50byB0aGUgZXhhY3QgZGV0YWlscyB3aGF0IHdlbnQgd3JvbmcgZnVy
dGhlciBkb3duIHRoZQ0Kcm9hZCwgYnV0IEkgdGhpbmsgaXQgaXMgbm90IG9ubHkgdGhlIG1p
c3NpbmcgbG9jaywgYnV0IHByb2JhYmx5IHRoZQ0KZmFjdCB0aGF0IGRlcGVuZGluZyBvbiB0
aGUgdXNlIGNhc2UgZGlmZmVyZW50IHJ1biBxdWV1ZXMgd2lsbCBiZSBhZGRyZXNzZWQNCmZv
ciB0aGUgc2FtZSB1bml0LCBjYXVzaW5nIGluY29uc2lzdGVuY2llcy4NCg0KPiBBbmQgaXQn
cyBvbmx5IGJ5IGx1Y2sgdGhhdCBub25lIG9mIHRoZSBvdGhlciBzY2hlZHVsZXJzIHRpZSBz
b21ldGhpbmcgdG8NCj4gcGVyLWNwdSBkYXRhIGxpa2UgdGhpcz8NCg0KSSBkaWRuJ3QgbG9v
ayBpbnRvIHRoZSBvdGhlciBzY2hlZHVsZXJzLg0KDQo+IE90aGVyIG9ic2VydmF0aW9ucy4N
Cj4gDQo+IEkgdGhpbmsgc2NoZWRfbW92ZV9kb21haW4oKSB3b3VsZCBiZSBlYXNpZXIgdG8g
Zm9sbG93IHdpdGgNCj4gcy9uZXdfcC9uZXdfY3B1LyAoYW5kIHNpbWlsYXIgZm9yIHVuaXRf
cCkgYXMgInAiIGlzIG5vdCBvYnZpb3VzbHkNCj4gcHJvY2Vzc29yIHVubGVzcyB5b3Ugbm90
aWNlIHRoZSBjcHVtYXNrX2ZpcnN0KCkgY2FsbHMuDQoNCk1heWJlLiBJIGRvbid0IGhhdmUg
dGhhdCBwcm9ibGVtLCBPVE9IIEkndmUgd3JpdHRlbiB0aGF0IGNvZGUuIDotRA0KDQo+IFdo
eSBkbyB3ZSBtb3ZlIGEgZG9tYWluIGJhY2sgdG8gY3B1cG9vbDAgb24gZG9tYWluIGRlc3Ry
b3k/wqAgVGhlcmUncw0KPiBub3RoaW5nIG1hZ2ljIGFib3V0IGNwdXBvb2wwIHRoYXQgSSdt
IGF3YXJlIG9mIGhlcmUuwqAgSXQgc2VlbXMgbGlrZQ0KPiB1bm5lY2Vzc2FyeSBjb21wbGV4
aXR5Lg0KDQpTZWUgY29tbWl0IGJhYzYzMzRiNTFkOS4NCg0KDQpKdWVyZ2VuDQo=
--------------XGp0bSL8egSA1qw0RVhD8Y84
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------XGp0bSL8egSA1qw0RVhD8Y84--

--------------pSCJR0n4y5TfNY7mG0tR3YCh--

--------------meCs2tUTK5YoQ0zLlDsmTXrO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmU2Ez0FAwAAAAAACgkQsN6d1ii/Ey+X
AAf5AXaCnGJNI3CxlfWX9MreUPkNF/kaZU2+jdxvj7MyRZ4pshyO3YfgQV4/J2O1Hq/8M7pLJm7M
JpcejQtCBrG3WkTQbgfBPXgsfF21jK8rFnXrJx5P8KtKJE9kZY4XiYlxJNnjJJ6wSMpT4AFoZ9+r
6oDj0UTKLuVYaqaf9gV6xQ47NkOmbmiPE0krdFEhCM9cSBLT6y/YyWDScKXqMgRhi481JgxfPsnb
7xvf7+KldbRYnjkC7UXl+60ErKsfDkg5WSBKd+cyFOQd0MHQyGGviGVlt93WYAMJ4+4JqDYf3IFK
v9yO9HiTNqKYx9VZYt2eURLksgYpcjVa3x7p/JKpPg==
=TTYu
-----END PGP SIGNATURE-----

--------------meCs2tUTK5YoQ0zLlDsmTXrO--

