Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140FFA21C18
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 12:23:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879094.1289313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td69l-0003Yx-Iw; Wed, 29 Jan 2025 11:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879094.1289313; Wed, 29 Jan 2025 11:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td69l-0003XV-G8; Wed, 29 Jan 2025 11:22:53 +0000
Received: by outflank-mailman (input) for mailman id 879094;
 Wed, 29 Jan 2025 11:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyJd=UV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1td69j-0003XP-Ue
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 11:22:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f9a134c-de33-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 12:22:50 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFE231F365;
 Wed, 29 Jan 2025 11:22:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5DC99137DB;
 Wed, 29 Jan 2025 11:22:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id RAg8FYkPmmf4PQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Jan 2025 11:22:49 +0000
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
X-Inumbo-ID: 5f9a134c-de33-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738149769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kJ+sVjc09SMmCjC36y3BSChpyhgwQ/u/jQHMHdFN9Nc=;
	b=f7vc5PDhDRqWblW/GZdLTykMmWWjLklpvDwps0adPsGref8qZhZb3sW1yy4cxwQ99Fu5h8
	ls8SyILmsY1GTfjutMcTrzJ/mDSUK0xRS2R96L7Pfjbf8tMf3BctFsGxR8RSgIPqrZf7TY
	2YKH1FV2x48ldHUoU1sjVCNoCIRjuM4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738149769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kJ+sVjc09SMmCjC36y3BSChpyhgwQ/u/jQHMHdFN9Nc=;
	b=f7vc5PDhDRqWblW/GZdLTykMmWWjLklpvDwps0adPsGref8qZhZb3sW1yy4cxwQ99Fu5h8
	ls8SyILmsY1GTfjutMcTrzJ/mDSUK0xRS2R96L7Pfjbf8tMf3BctFsGxR8RSgIPqrZf7TY
	2YKH1FV2x48ldHUoU1sjVCNoCIRjuM4=
Message-ID: <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
Date: Wed, 29 Jan 2025 12:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
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
In-Reply-To: <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ATVvY1dA3DXYncI2xe3rxfCi"
X-Spam-Score: -6.20
X-Spamd-Result: default: False [-6.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ATVvY1dA3DXYncI2xe3rxfCi
Content-Type: multipart/mixed; boundary="------------Vp4XYrfeinVwEvuNrWn450MA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Konrad Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Message-ID: <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com>
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com>
 <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com>
 <2025012919-series-chaps-856e@gregkh>
 <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com>
 <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com>
 <2025012956-jiffy-condone-3137@gregkh>
 <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>
In-Reply-To: <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com>

--------------Vp4XYrfeinVwEvuNrWn450MA
Content-Type: multipart/mixed; boundary="------------cRXte0Sy5h7PSMais8nDyUqr"

--------------cRXte0Sy5h7PSMais8nDyUqr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDEuMjUgMTA6MTUsIEhhcnNodmFyZGhhbiBKaGEgd3JvdGU6DQo+IA0KPiBPbiAy
OS8wMS8yNSAyOjM0IFBNLCBHcmVnIEtIIHdyb3RlOg0KPj4gT24gV2VkLCBKYW4gMjksIDIw
MjUgYXQgMDI6Mjk6NDhQTSArMDUzMCwgSGFyc2h2YXJkaGFuIEpoYSB3cm90ZToNCj4+PiBI
aSBHcmVnLA0KPj4+DQo+Pj4gT24gMjkvMDEvMjUgMjoxOCBQTSwgR3JlZyBLSCB3cm90ZToN
Cj4+Pj4gT24gV2VkLCBKYW4gMjksIDIwMjUgYXQgMDI6MTM6MzRQTSArMDUzMCwgSGFyc2h2
YXJkaGFuIEpoYSB3cm90ZToNCj4+Pj4+IEhpIHRoZXJlLA0KPj4+Pj4NCj4+Pj4+IE9uIDI5
LzAxLzI1IDI6MDUgUE0sIEdyZWcgS0ggd3JvdGU6DQo+Pj4+Pj4gT24gV2VkLCBKYW4gMjks
IDIwMjUgYXQgMDI6MDM6NTFQTSArMDUzMCwgSGFyc2h2YXJkaGFuIEpoYSB3cm90ZToNCj4+
Pj4+Pj4gSGkgQWxsLA0KPj4+Pj4+Pg0KPj4+Pj4+PiArc3RhYmxlDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IFRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgZm9ybWF0dGluZyBpc3N1ZXMgaW4gbXkgbG9n
IG91dHB1dC4gSSBoYXZlDQo+Pj4+Pj4+IGF0dGFjaGVkIGl0IGFzIGEgZmlsZS4NCj4+Pj4+
PiBDb25mdXNlZCwgd2hhdCBhcmUgeW91IHdhbnRpbmcgdXMgdG8gZG8gaGVyZSBpbiB0aGUg
c3RhYmxlIHRyZWU/DQo+Pj4+Pj4NCj4+Pj4+PiB0aGFua3MsDQo+Pj4+Pj4NCj4+Pj4+PiBn
cmVnIGstaA0KPj4+Pj4gU2luY2UsIHRoaXMgaXMgcmVwcm9kdWNpYmxlIG9uIDUuNC55IEkg
aGF2ZSBhZGRlZCBzdGFibGUuIFRoZSBjdWxwcml0DQo+Pj4+PiBjb21taXQgd2hpY2ggdXBv
biBnZXR0aW5nIHJldmVydGVkIGZpeGVzIHRoaXMgaXNzdWUgaXMgYWxzbyBwcmVzZW50IGlu
DQo+Pj4+PiA1LjQueSBzdGFibGUuDQo+Pj4+IFdoYXQgY3VscHJpdCBjb21taXQ/ICBJIHNl
ZSBubyBpbmZvcm1hdGlvbiBoZXJlIDooDQo+Pj4+DQo+Pj4+IFJlbWVtYmVyLCB0b3AtcG9z
dGluZyBpcyBldmlsLi4uDQo+Pj4gTXkgYXBvbG9naWVzLA0KPj4+DQo+Pj4gVGhlIHN0YWJs
ZSB0YWcgdjUuNC4yODkgc2VlbXMgdG8gZmFpbCB0byBib290IHdpdGggdGhlIGZvbGxvd2lu
ZyBwcm9tcHQgaW4gYW4gaW5maW5pdGUgbG9vcDoNCj4+PiBbICAgMjQuNDI3MjE3XSBtZWdh
cmFpZF9zYXMgMDAwMDo2NTowMC4wOiBtZWdhc2FzX2J1aWxkX2lvX2Z1c2lvbiAzMjczIHNn
ZV9jb3VudCAoLTEyKSBpcyBvdXQgb2YgcmFuZ2UuIFJhbmdlIGlzOiAgMC0yNTYNCj4+Pg0K
Pj4+IFJldmVydGluZyB0aGUgZm9sbG93aW5nIHBhdGNoIHNlZW1zIHRvIGZpeCB0aGUgaXNz
dWU6DQo+Pj4NCj4+PiBzdGFibGUtNS40wqDCoMKgwqDCoCA6IHY1LjQuMjg1wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0gNWRmMjlhNDQ1ZjNhIHhlbi9zd2lvdGxiOiBhZGQNCj4+PiBh
bGlnbm1lbnQgY2hlY2sgZm9yIGRtYSBidWZmZXJzDQo+Pj4NCj4+PiBJIHRyaWVkIGNoYW5n
aW5nIHN3aW90bGIgZ3J1YiBjb21tYW5kIGxpbmUgYXJndW1lbnRzIGJ1dCB0aGF0IGRpZG4n
dA0KPj4+IHNlZW0gdG8gaGVscCBtdWNoIHVuZm9ydHVuYXRlbHkgYW5kIHRoZSBlcnJvciB3
YXMgc2VlbiBhZ2Fpbi4NCj4+Pg0KPj4gT2ssIGNhbiB5b3Ugc3VibWl0IHRoaXMgcmV2ZXJ0
IHdpdGggdGhlIGluZm9ybWF0aW9uIGFib3V0IHdoeSBpdCBzaG91bGQNCj4+IG5vdCBiZSBp
bmNsdWRlZCBpbiB0aGUgNS40LnkgdHJlZSBhbmQgY2M6IGV2ZXJ5b25lIGludm9sdmVkIGFu
ZCB0aGVuIHdlDQo+PiB3aWxsIGJlIGdsYWQgdG8gcXVldWUgaXQgdXAuDQo+Pg0KPj4gdGhh
bmtzLA0KPj4NCj4+IGdyZWcgay1oDQo+IA0KPiBUaGlzIG1pZ2h0IGJlIHJlcHJvZHVjaWJs
ZSBvbiBvdGhlciBzdGFibGUgdHJlZXMgYW5kIG1haW5saW5lIGFzIHdlbGwgc28NCj4gd2Ug
d2lsbCBnZXQgaXQgZml4ZWQgdGhlcmUgYW5kIEkgd2lsbCBzdWJtaXQgdGhlIG5lY2Vzc2Fy
eSBmaXggdG8gc3RhYmxlDQo+IHdoZW4gZXZlcnl0aGluZyBpcyBzb3J0ZWQgb3V0IG9uIG1h
aW5saW5lLg0KDQpSaWdodC4gSnVzdCByZXZlcnRpbmcgbXkgcGF0Y2ggd2lsbCB0cmFkZSBv
bmUgZXJyb3Igd2l0aCBhbm90aGVyIG9uZSAodGhlDQpvbmUgd2hpY2ggdHJpZ2dlcmVkIG1l
IHRvIHdyaXRlIHRoZSBwYXRjaCkuDQoNClRoZXJlIGFyZSB0d28gcG9zc2libGUgd2F5cyB0
byBmaXggdGhlIGlzc3VlOg0KDQotIGFsbG93IGxhcmdlciBETUEgYnVmZmVycyBpbiB4ZW4v
c3dpb3RsYiAodG9kYXkgMk1CIGFyZSB0aGUgbWF4LiBzdXBwb3J0ZWQNCiAgIHNpemUsIHRo
ZSBtZWdhcmFpZF9zYXMgZHJpdmVyIHNlZW1zIHRvIGVmZmVjdGl2ZWx5IHJlcXVlc3QgNE1C
KQ0KDQotIGZpeCB0aGUgbWVnYXJhaWRfc2FzIGRyaXZlciBieSBzcGxpdHRpbmcgdXAgdGhl
IGFsbG9jYXRlZCBETUEgYnVmZmVyIChpdCBpcw0KICAgcmVxdWVzdGluZyAyLjNNQiwgd2hp
Y2ggd2lsbCBiZSByb3VuZGVkIHVwIHRvIDRNQiAtIGl0IGlzIHByb2JhYmx5IG5vdCBuZWVk
ZWQNCiAgIHRvIGJlIGluIG9uZSBjaHVuaywgc28gYSBzcGxpdCB3b3VsZCByZXN1bHQgaW4g
bWF4LiAyTUIgY2h1bmsgc2l6ZSkNCg0KQm90aCB2YXJpYW50cyBoYXZlIHRoZWlyIHByb3Mg
YW5kIGNvbnMsIHRob3VnaC4NCg0KDQpKdWVyZ2VuDQo=
--------------cRXte0Sy5h7PSMais8nDyUqr
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------cRXte0Sy5h7PSMais8nDyUqr--

--------------Vp4XYrfeinVwEvuNrWn450MA--

--------------ATVvY1dA3DXYncI2xe3rxfCi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmeaD4gFAwAAAAAACgkQsN6d1ii/Ey/e
QAf/b0DOiXqpS126jdS6Narc1sI8VN+8jDIFFn9YcdLpcys5SSyrhT1I/zwX+8wyDP3m2i/41Mq+
VoGjfmMGL2+Be9hvUmrHVBgoHXuj+Sj2A4Vcsx0w4fm8vUfxVkYZLWlhh42OJYpq0PT/6sP6haAT
lVulWT3Jpyx2K0UrTS3+5C55jyZkdCWAKTisAd/Wfp5rn3NUNzk7LjFAfXJFHxuPKEoLE51KT5RC
XjANN0XT3KyslLpCLwwUGT1wkX1MxXhTHBbqK4uCxVWXsOY7OkVBrypedqFU6wqu3OIG29/6rSg8
zSdLdLtS+Kfl7dMDEl+goVmoAUtRY3i3jqfmIhyPDQ==
=Zw5T
-----END PGP SIGNATURE-----

--------------ATVvY1dA3DXYncI2xe3rxfCi--

