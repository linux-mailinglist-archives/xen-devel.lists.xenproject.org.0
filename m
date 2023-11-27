Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53807FA59E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 17:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642326.1001726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7e7T-000785-H4; Mon, 27 Nov 2023 16:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642326.1001726; Mon, 27 Nov 2023 16:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7e7T-00075K-Dw; Mon, 27 Nov 2023 16:05:59 +0000
Received: by outflank-mailman (input) for mailman id 642326;
 Mon, 27 Nov 2023 16:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7e7R-00075E-Bv
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 16:05:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7e05a30-8d3e-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 17:05:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 99C0D21AA4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 16:05:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 821971379A
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 16:05:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UV9sHmG+ZGVYUwAAD6G6ig
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 16:05:53 +0000
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
X-Inumbo-ID: d7e05a30-8d3e-11ee-9b0e-b553b5be7939
Message-ID: <42f02cd6-9aa2-43d3-a352-3abfc5b25ee0@suse.com>
Date: Mon, 27 Nov 2023 17:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <01e7d219-5a2f-58cb-bb30-59f31749f019@suse.com> <ZWNbWPkKsLI1q8+D@mail-itl>
 <CACHz=ZiWufUenyw_wg+QuK86+gU5RZNkuJNzX9-K1UM5P3m8+Q@mail.gmail.com>
 <ZWR8+Xjm2K8eZpab@mail-itl>
 <CAKf6xpvBE7VnziXYBpbh4iPw+sJi9bjLcZupUgrt_Pw6qUtffg@mail.gmail.com>
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
In-Reply-To: <CAKf6xpvBE7VnziXYBpbh4iPw+sJi9bjLcZupUgrt_Pw6qUtffg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2gtVCCsMIAv3h5MEATKPZpRR"
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	 TO_DN_NONE(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 ARC_NA(0.00)[];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: 99C0D21AA4
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2gtVCCsMIAv3h5MEATKPZpRR
Content-Type: multipart/mixed; boundary="------------YKcEbY1u19J6Qt5f5JSHSSV8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Message-ID: <42f02cd6-9aa2-43d3-a352-3abfc5b25ee0@suse.com>
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <01e7d219-5a2f-58cb-bb30-59f31749f019@suse.com> <ZWNbWPkKsLI1q8+D@mail-itl>
 <CACHz=ZiWufUenyw_wg+QuK86+gU5RZNkuJNzX9-K1UM5P3m8+Q@mail.gmail.com>
 <ZWR8+Xjm2K8eZpab@mail-itl>
 <CAKf6xpvBE7VnziXYBpbh4iPw+sJi9bjLcZupUgrt_Pw6qUtffg@mail.gmail.com>
In-Reply-To: <CAKf6xpvBE7VnziXYBpbh4iPw+sJi9bjLcZupUgrt_Pw6qUtffg@mail.gmail.com>

--------------YKcEbY1u19J6Qt5f5JSHSSV8
Content-Type: multipart/mixed; boundary="------------KnnF2lKK2VJvbiwx5g1XsTZ1"

--------------KnnF2lKK2VJvbiwx5g1XsTZ1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMTEuMjMgMTY6NTYsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIE1vbiwgTm92
IDI3LCAyMDIzIGF0IDY6MjfigK9BTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kNCj4g
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIE1v
biwgTm92IDI3LCAyMDIzIGF0IDExOjIwOjM2QU0gKzAwMDAsIEZyZWRpYW5vIFppZ2xpbyB3
cm90ZToNCj4+PiBPbiBTdW4sIE5vdiAyNiwgMjAyMyBhdCAyOjUx4oCvUE0gTWFyZWsgTWFy
Y3p5a293c2tpLUfDs3JlY2tpDQo+Pj4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5j
b20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBPbiBNb24sIEZlYiAxOSwgMjAxOCBhdCAwNjozMDox
NFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4gT24gMTYvMDIvMTggMjA6
MDIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4+Pj4gT24gMTYvMDIvMTggMTg6NTEsIE1h
cmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+Pj4gT24gRnJpLCBGZWIg
MTYsIDIwMTggYXQgMDU6NTI6NTBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+
Pj4+Pj4+IE9uIDE2LzAyLzE4IDE3OjQ4LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
d3JvdGU6DQo+Pj4+Pj4+Pj4gSGksDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBBcyBpbiB0aGUg
c3ViamVjdCwgdGhlIGd1ZXN0IGNyYXNoZXMgb24gYm9vdCwgYmVmb3JlIGtlcm5lbCBvdXRw
dXQNCj4+Pj4+Pj4+PiBhbnl0aGluZy4gSSd2ZSBpc29sYXRlZCB0aGlzIHRvIHRoZSBjb25k
aXRpb25zIGJlbG93Og0KPj4+Pj4+Pj4+ICAgLSBQViBndWVzdCBoYXZlIFBDSSBkZXZpY2Ug
YXNzaWduZWQgKGUxMDAwZSBlbXVsYXRlZCBieSBRRU1VIGluIHRoaXMgY2FzZSksDQo+Pj4+
Pj4+Pj4gICAgIHdpdGhvdXQgUENJIGRldmljZSBpdCB3b3Jrcw0KPj4+Pj4+Pj4+ICAgLSBY
ZW4gKGluIEtWTSkgaXMgc3RhcnRlZCB0aHJvdWdoIE9WTUY7IHdpdGggc2VhYmlvcyBpdCB3
b3Jrcw0KPj4+Pj4+Pj4+ICAgLSBuZXN0ZWQgSFZNIGlzIGRpc2FibGVkIGluIEtWTQ0KPj4+
Pj4+Pj4+ICAgLSBBTUQgSU9NTVUgZW11bGF0aW9uIGlzIGRpc2FibGVkIGluIEtWTTsgd2hl
biBlbmFibGVkIHFlbXUgY3Jhc2hlcyBvbg0KPj4+Pj4+Pj4+ICAgICBib290IChsb29rcyBs
aWtlIHFlbXUgYnVnLCB1bnJlbGF0ZWQgdG8gdGhpcyBvbmUpDQo+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+PiBWZXJzaW9uIGluZm86DQo+Pj4+Pj4+Pj4gICAtIEtWTSBob3N0OiBPcGVuU1VTRSA0
Mi4zLCBxZW11IDIuOS4xLCBvdm1mLTIwMTcrZ2l0MTQ5MjA2MDU2MC5iNmQxMWQ3YzQ2LTQu
MSwgQU1EDQo+Pj4+Pj4+Pj4gICAtIFhlbiBob3N0OiBYZW4gNC44LjMsIGRvbTA6IExpbnV4
IDQuMTQuMTMNCj4+Pj4+Pj4+PiAgIC0gWGVuIGRvbVU6IExpbnV4IDQuMTQuMTMsIGRpcmVj
dCBib290DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBOb3Qgc3VyZSBpZiByZWxldmFudCwgYnV0
IGluaXRpYWxseSBJJ3ZlIHRyaWVkIGJvb3RpbmcgeGVuLmVmaSAvbWFwYnMNCj4+Pj4+Pj4+
PiAvbm9leGl0Ym9vdCBhbmQgdGhlbiBkb20wIGtlcm5lbCBjcmFzaGVkIHNheWluZyBzb21l
dGhpbmcgYWJvdXQgY29uZmxpY3QNCj4+Pj4+Pj4+PiBiZXR3ZWVuIGU4MjAgYW5kIGtlcm5l
bCBtYXBwaW5nLiBCdXQgbm93IHRob3NlIG9wdGlvbnMgYXJlIGRpc2FibGVkLg0KPj4+Pj4+
Pj4+DQo+Pj4+Pj4+Pj4gVGhlIGNyYXNoIG1lc3NhZ2U6DQo+Pj4+Pj4+Pj4gKFhFTikgZDF2
MCBVbmhhbmRsZWQgaW52YWxpZCBvcGNvZGUgZmF1bHQvdHJhcCBbIzYsIGVjPTAwMDBdDQo+
Pj4+Pj4+Pj4gKFhFTikgZG9tYWluX2NyYXNoX3N5bmMgY2FsbGVkIGZyb20gZW50cnkuUzog
ZmF1bHQgYXQgZmZmZjgyZDA4MDIxODcyMCBlbnRyeS5vI2NyZWF0ZV9ib3VuY2VfZnJhbWUr
MHgxMzcvMHgxNDYNCj4+Pj4+Pj4+PiAoWEVOKSBEb21haW4gMSAodmNwdSMwKSBjcmFzaGVk
IG9uIGNwdSMxOg0KPj4+Pj4+Pj4+IChYRU4pIC0tLS1bIFhlbi00LjguMyAgeDg2XzY0ICBk
ZWJ1Zz1uICAgTm90IHRhaW50ZWQgXS0tLS0NCj4+Pj4+Pj4+PiAoWEVOKSBDUFU6ICAgIDEN
Cj4+Pj4+Pj4+PiAoWEVOKSBSSVA6ICAgIGUwMzM6WzxmZmZmZmZmZjgyNmQ5MTU2Pl0NCj4+
Pj4+Pj4+IFRoaXMgaXMgI1VELCB3aGljaCBpcyBtb3N0IHByb2JhYmx5IGhpdHRpbmcgYSBC
VUcoKS4gIGFkZHIybGluZSB0aGlzIF4NCj4+Pj4+Pj4+IHRvIGZpbmQgc29tZSBjb2RlIHRv
IGxvb2sgYXQuDQo+Pj4+Pj4+IGFkZHIybGluZSBmYWlsZWQgbWUNCj4+Pj4+Pg0KPj4+Pj4+
IEJ5IGRlZmF1bHQsIHZtbGludXggaXMgc3RyaXBwZWQgYW5kIGNvbXByZXNzZWQuICBJZGVh
bGx5IHlvdSB3YW50IHRvDQo+Pj4+Pj4gYWRkcjJsaW5lIHRoZSB2bWxpbnV4IGFydGVmYWN0
IGluIHRoZSByb290IG9mIHlvdXIga2VybmVsIGJ1aWxkLCB3aGljaA0KPj4+Pj4+IGlzIHRo
ZSBwbGFpbiBlbGYgd2l0aCBkZWJ1Z2dpbmcgc3ltYm9scy4NCj4+Pj4+Pg0KPj4+Pj4+IEFs
dGVybmF0aXZlbHksIHVzZSBzY3JpcHRzL2V4dHJhY3Qtdm1saW51eCBvbiB0aGUgYmluYXJ5
IHlvdSBhY3R1YWxseQ0KPj4+Pj4+IGJvb3RlZCwgd2hpY2ggbWlnaHQgZ2V0IHlvdSBzb21l
d2hlcmUuDQo+Pj4+Pj4NCj4+Pj4+Pj4gLCBidXQgU3lzdGVtLm1hcCBzYXlzIGl0cyB4ZW5f
bWVtb3J5X3NldHVwLiBBbmQgaXQNCj4+Pj4+Pj4gbG9va3MgbGlrZSB0aGUgQlVHKCkgaXMg
dGhlIHNhbWUgYXMgSSBoYWQgaW4gZG9tMCBiZWZvcmU6DQo+Pj4+Pj4+ICJYZW4gaHlwZXJ2
aXNvciBhbGxvY2F0ZWQga2VybmVsIG1lbW9yeSBjb25mbGljdHMgd2l0aCBFODIwIG1hcCIu
DQo+Pj4+Pj4NCj4+Pj4+PiBKdWVyZ2VuOiBJcyB0aGVyZSBhbnl0aGluZyB3ZSBjYW4gZG8g
dG8gdHJ5IGFuZCBpbnNlcnQgc29tZSBkdW1teQ0KPj4+Pj4+IGV4Y2VwdGlvbiBoYW5kbGVy
cyByaWdodCBhdCBQViBzdGFydCwgc28gd2UgY291bGQgYXQgbGVhc3QgcHJpbnQgb3V0IGEN
Cj4+Pj4+PiBvbmVsaW5lciB0byB0aGUgaG9zdCBjb25zb2xlIHdoaWNoIGlzIGEgbGl0dGxl
IG1vcmUgaGVscGZ1bCB0aGFuIFhlbg0KPj4+Pj4+IHNheWluZyAic29tZXRoaW5nIHVua25v
d24gd2VudCB3cm9uZyIgPw0KPj4+Pj4NCj4+Pj4+IFlvdSBtZWFuIHNvbWV0aGluZyBsaWtl
IGNvbW1pdCA0MmIzYTRjYjU2MDlkZTc1N2Y1NDQ1ZmNhZDE4OTQ1YmE5MjM5YTA3DQo+Pj4+
PiBhZGRlZCB0byBrZXJuZWwgNC4xNT8NCj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+
Pj4gRGlzYWJsaW5nIGU4MjBfaG9zdCBpbiBndWVzdCBjb25maWcgc29sdmVkIHRoZSBwcm9i
bGVtLiBUaGFua3MhDQo+Pj4+Pj4+DQo+Pj4+Pj4+IElzIHRoaXMgc29tZSBidWcgaW4gWGVu
IG9yIE9WTUYsIG9yIGlzIGl0IGV4cGVjdGVkIGJlaGF2aW9yIGFuZCBlODIwX2hvc3QNCj4+
Pj4+Pj4gc2hvdWxkIGJlIGF2b2lkZWQ/DQo+Pj4+Pj4NCj4+Pj4+PiBJIGRvbid0IHJlYWxs
eSBrbm93LiAgZTgyMF9ob3N0IGlzIGEgZ3Jvc3MgaGFjayB3aGljaCBzaG91bGRuJ3QgcmVh
bGx5DQo+Pj4+Pj4gYmUgcHJlc2VudC4gIFRoZSBhY3R1YWxseSBwcm9ibGVtIGlzIHRoYXQg
TGludXggY2FuJ3QgY29wZSB3aXRoIHRoZQ0KPj4+Pj4+IG1lbW9yeSBsYXlvdXQgaXQgd2Fz
IGdpdmVuIChhbmQgSSBjYW4ndCByZWNhbGwgaWYgdGhlcmUgaXMgYW55dGhpbmcNCj4+Pj4+
PiBMaW51eCBjb3VsZCBwb3RlbnRpYWxseSB0byBkbyBjb3BlKS4gIE9UT0gsIHRoZSB0b29s
c3RhY2ssIHdoaWNoIGtuZXcNCj4+Pj4+PiBhYm91dCBlODIwX2hvc3QgYW5kIGNob3NlIHRv
IGxheSB0aGUgZ3Vlc3Qgb3V0IGluIGFuIG92ZXJsYXBwaW5nIHdheSBpcw0KPj4+Pj4+IHBy
b2JhYmx5IGFsc28gYXQgZmF1bHQuDQo+Pj4+Pg0KPj4+Pj4gVGhlIGtlcm5lbCBjYW4gY29w
ZSB3aXRoIGxvdHMgb2YgRTgyMCBzY2VuYXJpb3MgKGUuZy4gYnkgcmVsb2NhdGluZw0KPj4+
Pj4gaW5pdHJkIG9yIHRoZSBwMm0gbWFwKSwgYnV0IG1vdmluZyBpdHNlbGYgb3V0IG9mIHRo
ZSB3YXkgaXMgbm90DQo+Pj4+PiBwb3NzaWJsZS4NCj4+Pj4NCj4+Pj4gSSdtIGFmcmFpZCBJ
IG5lZWQgdG8gcmVzdXJyZWN0IHRoaXMgdGhyZWFkLi4uDQo+Pj4+DQo+Pj4+IFdpdGggcmVj
ZW50IGtlcm5lbCAoNi42KyksIHRoZSBob3N0X2U4MjA9MCB3b3JrYXJvdW5kIGlzIG5vdCBh
biBvcHRpb24NCj4+Pj4gYW55bW9yZS4gSXQgbWFrZXMgTGludXggbm90IGluaXRpYWxpemUg
eGVuLXN3aW90bGIgKGR1ZSB0bw0KPj4+PiBmOWEzOGVhNTE3MmEzMzY1ZjQ1OTQzMzVlZDVk
NjNlMTVhZjJmZDE4KSwgc28gUENJIHBhc3N0aHJvdWdoIGRvZXNuJ3QNCj4+Pj4gd29yayBh
dCBhbGwuIFdoaWxlIEkgY2FuIGFkZCB5ZXQgYW5vdGhlciBsYXllciBvZiB3b3JrYXJvdW5k
IChmb3JjZQ0KPj4+PiB4ZW4tc3dpb3RsYiB3aXRoIGlvbW11PXNvZnQpLCB0aGF0J3MgZ2V0
dGluZyB1bndpZWxkeS4NCj4+Pj4NCj4+Pj4gRnVydGhlcm1vcmUsIEkgZG9uJ3QgZ2V0IHRo
ZSBjcmFzaCBtZXNzYWdlIGFueW1vcmUsIGV2ZW4gd2l0aCBkZWJ1Zw0KPj4+PiBoeXBlcnZp
c29yIGFuZCBndWVzdF9sb2dsdmw9YWxsLiBOb3QgZXZlbiAiRG9tYWluIFggY3Jhc2hlZCIg
aW4gYHhsDQo+Pj4+IGRtZXNnYC4gSXQgbG9va3MgbGlrZSB0aGUgImNyYXNoIiBzaHV0ZG93
biByZWFzb24gZG9lc24ndCByZWFjaCBYZW4sIGFuZA0KPj4+PiBpdCdzIGNvbnNpZGVyZWQg
Y2xlYW4gc2h1dGRvd24gKEkgY2FuIGNvbmZpcm0gaXQgYnkgY2hhbmdpbmcgdmFyaW91cw0K
Pj4+PiBgb25fKmAgc2V0dGluZ3MgKHZpYSBsaWJ2aXJ0KSBhbmQgb2JzZXJ2aW5nIHdoaWNo
IGdldHMgYXBwbGllZCkuDQo+Pj4+DQo+Pj4+IE1vc3QgdGVzdHMgSSd2ZSBkb25lIHdpdGgg
Ni43LXJjMSwgYnV0IHRoZSBpc3N1ZSBJIG9ic2VydmVkIG9uIDYuNi4xDQo+Pj4+IGFscmVh
ZHkuDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgb24gWGVuIDQuMTcuMi4gQW5kIHRoZSBMMCBpcyBy
dW5uaW5nIExpbnV4IDYuNi4xLCBhbmQgdGhlbiB1c2VzDQo+Pj4+IFFFTVUgOC4xLjIgKyBP
Vk1GIDIwMjMwOCB0byBydW4gWGVuIGFzIEwxLg0KPj4+Pg0KPj4+DQo+Pj4gU28gYmFzaWNh
bGx5IHlvdSBzdGFydCB0aGUgZG9tYWluIGFuZCBpdCBsb29rcyBsaWtlIGl0J3Mgc2h1dHRp
bmcgZG93bg0KPj4+IGNsZWFubHkgZnJvbSBsb2dzLg0KPj4+IENhbiB5b3Ugc2VlIGFueXRo
aW5nIGZyb20gdGhlIGd1ZXN0PyBDYW4geW91IHR1cm4gb24gc29tZSBtb3JlDQo+Pj4gZGVi
dWdnaW5nIGF0IGd1ZXN0IGxldmVsPw0KPj4NCj4+IE5vLCBpdCBjcmFzaGVzIGJlZm9yZSBw
cmludGluZyBhbnl0aGluZyB0byB0aGUgY29uc29sZSwgYWxzbyB3aXRoDQo+PiBlYXJseXBy
aW50az14ZW4uDQo+Pg0KPj4+IEkgdHJpZWQgdG8gZ2V0IHNvbWUgbW9yZSBpbmZvcm1hdGlv
biBmcm9tIHRoZSBpbml0aWFsIGNyYXNoIGJ1dCBJDQo+Pj4gY291bGQgbm90IHVuZGVyc3Rh
bmQgd2hpY2ggZ3Vlc3QgY29kZSB0cmlnZ2VyZWQgdGhlIGJ1Zy4NCj4+DQo+PiBJJ20gbm90
IHN1cmUgd2hpY2ggb25lIGlzIGl0IHRoaXMgdGltZSAoYmVjYXVzZSBJIGRvbid0IGhhdmUg
WGVuDQo+PiByZXBvcnRpbmcgZ3Vlc3QgY3Jhc2guLi4pIGJ1dCBsYXN0IHRpbWUgaXQgd2Fz
IGhlcmU6DQo+PiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0
ZXIvYXJjaC94ODYveGVuL3NldHVwLmMjTDg3My1MODc0DQo+IA0KPiBIaSBNYXJlaywNCj4g
DQo+IEkgdG9vIGhhdmUgcnVuIGludG8gdGhpcyAiWGVuIGh5cGVydmlzb3IgYWxsb2NhdGVk
IGtlcm5lbCBtZW1vcnkNCj4gY29uZmxpY3RzIHdpdGggRTgyMCBtYXAiIGVycm9yIHdoZW4g
cnVubmluZyBYZW4gdW5kZXIgS1ZNICYgT1ZNRiB3aXRoDQo+IFNlY3VyZUJvb3QuICBPVk1G
IGJ1aWx0IHdpdGhvdXQgU2VjdXJlQm9vdCBkaWQgbm90IHRyaXAgb3ZlciB0aGUNCj4gaXNz
dWUuICBJdCB3YXMgYSBsaXR0bGUgd2hpbGUgYmFjayAtIEkgaGF2ZSBzb21lIG5vdGVzIHRo
b3VnaC4NCj4gDQo+IE5vbi1TZWN1cmVCb290DQo+IChYRU4pICBbMDAwMDAwMDAwMDgxMDAw
MCwgMDAwMDAwMDAwMDhmZmZmZl0gKEFDUEkgTlZTKQ0KPiAoWEVOKSAgWzAwMDAwMDAwMDA5
MDAwMDAsIDAwMDAwMDAwN2Y4ZWVmZmZdICh1c2FibGUpDQo+IA0KPiBTZWN1cmVCb290DQo+
IChYRU4pICBbMDAwMDAwMDAwMDgxMDAwMCwgMDAwMDAwMDAwMTcwZmZmZl0gKEFDUEkgTlZT
KQ0KPiAoWEVOKSAgWzAwMDAwMDAwMDE3MTAwMDAsIDAwMDAwMDAwN2YwZWRmZmZdICh1c2Fi
bGUpDQo+IA0KPiBMaW51eCAodW5kZXIgWGVuKSBpcyBjaGVja2luZyB0aGF0IF9wYShfdGV4
dCkgKD0gMHgxMDAwMDAwKSBpcyBSQU0sDQo+IGJ1dCBpdCBpcyBub3QuICBMb29raW5nIGF0
IHRoZSBFODIwIG1hcCwgdGhlcmUgaXMgdHlwZSA0LCBOVlMsIHJlZ2lvbg0KPiBkZWZpbmVk
Og0KPiBbMDAwMDAwMDAwMDgxMDAwMCwgMDAwMDAwMDAwMTcwZmZmZl0gKEFDUEkgTlZTKQ0K
PiANCj4gV2hlbiBPVk1GIGlzIGJ1aWx0IHdpdGggU01NIChmb3IgU2VjdXJlQm9vdCkgYW5k
IFMzU3VwcG9ydGVkIGlzIHRydWUsDQo+IHRoZSBtZW1vcnkgcmFuZ2UgMHg5MDAwMDAtMHgx
NzBmZmZmIGlzIGFkZGl0aW9uYWxseSBtYXJrZWQgQUNQSSBOVlMNCj4gYW5kIExpbnV4IHRy
aXBzIG92ZXIgdGhpcy4gIEl0IGJlY29tZXMgdXNhYmxlIFJBTSB1bmRlciBOb24tU2VjdXJl
Qm9vdA0KPiBzbyBMaW51eCBib290cyBmaW5lLg0KPiANCj4gV2hhdCBJIGRvbid0IHVuZGVy
c3RhbmQgaXMgd2h5IHRoZXJlIGlzIGV2ZW4gYSBjaGVjayB0aGF0IF9wYShfdGV4dCkNCj4g
aXMgUkFNLiAgWGVuIGxvZ3MgdGhhdCBpdCBwbGFjZXMgZG9tMCB3YXkgdXAgaGlnaCBpbiBt
ZW1vcnksIHNvIHRoZQ0KPiBwaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBrZXJuZWwgcGFnZXMg
YXJlIG11Y2ggaGlnaGVyIHRoYW4gMHgxMDAwMDAwLg0KPiBUaGUgdmFsdWUgMHgxMDAwMDAw
IGZvciBfcGEoX3RleHQpIGRvZXNuJ3QgbWF0Y2ggcmVhbGl0eS4gIE1heWJlIHRoZXJlDQo+
IGFyZSBzb21lIGV4cGVjdGF0aW9ucyBmb3IgdGhlIEFDUEkgTlZTIGFuZCBvdGhlciByZXNl
cnZlZCByZWdpb25zIHRvDQo+IGJlIDEtMSBtYXBwZWQ/ICBJIHRyaWVkIHJlbW92aW5nIHRo
ZSBCVUcgbWVudGlvbmVkIGFib3ZlLCBidXQgaXQgc3RpbGwNCj4gZmFpbGVkIHRvIGJvb3Qu
ICBJIHRoaW5rIEkgYWxzbyByZW1vdmVkIGEgc2Vjb25kIEJVRywgYnV0DQo+IHVuZm9ydHVu
YXRlbHkgSSBkb24ndCBoYXZlIG5vdGVzIG9uIGVpdGhlci4NCg0KVGhlIF9ndWVzdF8gcGh5
c2ljYWwgYWRkcmVzcyBpcyB3aGF0IG1hdHRlcnMgaGVyZS4NCg0KV2l0aCB1c2luZyB0aGUg
aG9zdCBFODIwIG1hcCB0aGUgUFYta2VybmVsIHRyaWVzIHRvIHJlYXJyYW5nZSBpdHMgZ3Vl
c3QNCnBoeXNpY2FsIG1lbW9yeSBsYXlvdXQgdG8gbWF0Y2ggdGhlIEU4MjAgbWFwLiBBbmQg
YSBub24tUkFNIEdQQSBmb3IgdGhlDQpsb2NhdGlvbiB3aGVyZSB0aGUga2VybmVsIGlzIGxv
Y2F0ZWQgdHJpZ2dlcnMgdGhlIEJVRy4NCg0KDQpKdWVyZ2VuDQo=
--------------KnnF2lKK2VJvbiwx5g1XsTZ1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------KnnF2lKK2VJvbiwx5g1XsTZ1--

--------------YKcEbY1u19J6Qt5f5JSHSSV8--

--------------2gtVCCsMIAv3h5MEATKPZpRR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVkvmEFAwAAAAAACgkQsN6d1ii/Ey+m
BQgAnrsN6n2B9Frej3RRSc+gU/b+uCuQXxSnjda0iwwt9s6fiKiu3Dh92l5EKO0JnKeEHh9duypH
1HrL26gSFH9HokvPe12DHooK9BO3ZBSmBKuVFZdHBriQA+s7/pCk0RoLaY53JeOoOkC4nLafRJ16
RjG0Nkg6iS0FrkEz8Ff5iq/nC5AU6z5xtgqDx4Bb6qPV6w6m1BwyW3s2aHpBqdGGSOQ0S5yVjLHH
PGrnimovoROcljpGIa4wcDXKNRXKy2j5z0RUs1co3dUrLH+Lqy0HJmeezpkH8qaN7IIAIj6z/UlO
jJqgAlvpfuLbb3bQ2L+nV/tDVbdzTJ2/0KBa7YvgGA==
=Rotf
-----END PGP SIGNATURE-----

--------------2gtVCCsMIAv3h5MEATKPZpRR--

