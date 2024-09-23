Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A497E722
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 10:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801712.1211695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sse3J-0008BR-8Z; Mon, 23 Sep 2024 08:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801712.1211695; Mon, 23 Sep 2024 08:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sse3J-00088F-3s; Mon, 23 Sep 2024 08:04:13 +0000
Received: by outflank-mailman (input) for mailman id 801712;
 Mon, 23 Sep 2024 08:04:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DQIS=QV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sse3H-000889-Dp
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 08:04:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6930e282-7982-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 10:04:09 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C9501FB7C;
 Mon, 23 Sep 2024 08:04:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CD2213A64;
 Mon, 23 Sep 2024 08:04:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GLs1Bfgg8WbCZwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 23 Sep 2024 08:04:08 +0000
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
X-Inumbo-ID: 6930e282-7982-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1727078648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=89QS8ERJqMnCr1nNtRzn/h+23hZmcxPrsCcZCfl6t8E=;
	b=W83zejFaw3IgjYs4pgWrBRiK+2gs1T22Jw/w1wpwsdhAZrIj0xPLnrXMc5klmdZd/ljKUN
	UqQOo47abpeBCyTlkeATIsHHNKSIT9lksJ2VzyRuu8gBJi05+Ina5HXf6y9L+UnkBk8l6q
	q5fMjeA/UbUgWE6dslpkvWvDabWXJL4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=W83zejFa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1727078648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=89QS8ERJqMnCr1nNtRzn/h+23hZmcxPrsCcZCfl6t8E=;
	b=W83zejFaw3IgjYs4pgWrBRiK+2gs1T22Jw/w1wpwsdhAZrIj0xPLnrXMc5klmdZd/ljKUN
	UqQOo47abpeBCyTlkeATIsHHNKSIT9lksJ2VzyRuu8gBJi05+Ina5HXf6y9L+UnkBk8l6q
	q5fMjeA/UbUgWE6dslpkvWvDabWXJL4=
Message-ID: <a7d2a3e8-e2f1-4175-b74c-2e27a909c25d@suse.com>
Date: Mon, 23 Sep 2024 10:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [KERNEL PATCH v9 3/3] xen/privcmd: Add new syscall to get gsi
 from dev
From: Juergen Gross <jgross@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20240912092352.1602724-1-Jiqian.Chen@amd.com>
 <20240912092352.1602724-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2409181522080.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB5849DFA05D02F1BD9A416122E76C2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2409200959400.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB584987F7DF08909143AC0E21E76F2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>
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
In-Reply-To: <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dUiUSvjB6lk85hg7NxW0fMOv"
X-Rspamd-Queue-Id: 5C9501FB7C
X-Spam-Level: 
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.983];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,amd.com:email,intel.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.41
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dUiUSvjB6lk85hg7NxW0fMOv
Content-Type: multipart/mixed; boundary="------------rF2Tgg4eFuptfrpeGtpW0w60";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
Message-ID: <a7d2a3e8-e2f1-4175-b74c-2e27a909c25d@suse.com>
Subject: Re: [KERNEL PATCH v9 3/3] xen/privcmd: Add new syscall to get gsi
 from dev
References: <20240912092352.1602724-1-Jiqian.Chen@amd.com>
 <20240912092352.1602724-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2409181522080.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB5849DFA05D02F1BD9A416122E76C2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2409200959400.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB584987F7DF08909143AC0E21E76F2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>
In-Reply-To: <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>

--------------rF2Tgg4eFuptfrpeGtpW0w60
Content-Type: multipart/mixed; boundary="------------lOVk20paBAGFc2c6JmpBsndx"

--------------lOVk20paBAGFc2c6JmpBsndx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDkuMjQgMDk6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDIzLjA5LjI0
IDA3OjQ5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzkvMjEgMDU6MTcsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBGcmksIDIwIFNlcCAyMDI0LCBDaGVu
LCBKaXFpYW4gd3JvdGU6DQo+Pj4+IE9uIDIwMjQvOS8xOSAwNjo0OSwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4+Pj4gT24gVGh1LCAxMiBTZXAgMjAyNCwgSmlxaWFuIENoZW4g
d3JvdGU6DQo+Pj4+Pj4gT24gUFZIIGRvbTAsIHdoZW4gcGFzc3Rocm91Z2ggYSBkZXZpY2Ug
dG8gZG9tVSwgUUVNVSBhbmQgeGwgdG9vbHMNCj4+Pj4+PiB3YW50IHRvIHVzZSBnc2kgbnVt
YmVyIHRvIGRvIHBpcnEgbWFwcGluZywgc2VlIFFFTVUgY29kZQ0KPj4+Pj4+IHhlbl9wdF9y
ZWFsaXplLT54Y19waHlzZGV2X21hcF9waXJxLCBhbmQgeGwgY29kZQ0KPj4+Pj4+IHBjaV9h
ZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycSwgYnV0IGluIGN1cnJlbnQgY29kZXMs
IHRoZSBnc2kNCj4+Pj4+PiBudW1iZXIgaXMgZ290IGZyb20gZmlsZSAvc3lzL2J1cy9wY2kv
ZGV2aWNlcy88c2JkZj4vaXJxLCB0aGF0IGlzDQo+Pj4+Pj4gd3JvbmcsIGJlY2F1c2UgaXJx
IGlzIG5vdCBlcXVhbCB3aXRoIGdzaSwgdGhleSBhcmUgaW4gZGlmZmVyZW50DQo+Pj4+Pj4g
c3BhY2VzLCBzbyBwaXJxIG1hcHBpbmcgZmFpbHMuDQo+Pj4+Pj4gQW5kIGluIGN1cnJlbnQg
bGludXggY29kZXMsIHRoZXJlIGlzIG5vIG1ldGhvZCB0byBnZXQgZ3NpDQo+Pj4+Pj4gZm9y
IHVzZXJzcGFjZS4NCj4+Pj4+Pg0KPj4+Pj4+IEZvciBhYm92ZSBwdXJwb3NlLCByZWNvcmQg
Z3NpIG9mIHBjaXN0dWIgZGV2aWNlcyB3aGVuIGluaXQNCj4+Pj4+PiBwY2lzdHViIGFuZCBh
ZGQgYSBuZXcgc3lzY2FsbCBpbnRvIHByaXZjbWQgdG8gbGV0IHVzZXJzcGFjZQ0KPj4+Pj4+
IGNhbiBnZXQgZ3NpIHdoZW4gdGhleSBoYXZlIGEgbmVlZC4NCj4+Pj4+Pg0KPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+
Pj4gLS0tDQo+Pj4+Pj4gdjgtPnY5IGNoYW5nZXM6DQo+Pj4+Pj4gQ2hhbmdlZCB0aGUgc3lz
Y2FsbCBuYW1lIGZyb20gIklPQ1RMX1BSSVZDTURfR1NJX0ZST01fREVWIiB0byANCj4+Pj4+
PiAiSU9DVExfUFJJVkNNRF9QQ0lERVZfR0VUX0dTSSIuIEFsc28gY2hhbmdlZCB0aGUgb3Ro
ZXIgZnVuY3Rpb25zIG5hbWUuDQo+Pj4+Pj4gQ2hhbmdlZCB0aGUgbWFjcm8gd3JhcHBpbmcg
InBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYiIGZyb20gDQo+Pj4+Pj4gIkNPTkZJR19YRU5f
QUNQSSIgdG8gIkNPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQiIHRvIGZpeCBjb21waWxlIGVy
cm9ycyANCj4+Pj4+PiByZXBvcnRlZCBieSBDSSByb2JvdC4NCj4+Pj4+PiBDaGFuZ2VkIHRo
ZSBwYXJhbWV0ZXIgZ3NpIG9mIHN0cnVjdCBwcml2Y21kX3BjaWRldl9nZXRfZ3NpIGZyb20g
aW50IHRvIHUzMi4NCj4+Pj4+Pg0KPj4+Pj4+IHY3LT52OCBjaGFuZ2VzOg0KPj4+Pj4+IElu
IGZ1bmN0aW9uIHByaXZjbWRfaW9jdGxfZ3NpX2Zyb21fZGV2LCByZXR1cm4gLUVJTlZBTCB3
aGVuIG5vdCBjb25maWdlIA0KPj4+Pj4+IENPTkZJR19YRU5fQUNQSS4NCj4+Pj4+PiBVc2Vk
IFBDSV9CVVNfTlVNIFBDSV9TTE9UIFBDSV9GVU5DIGluc3RlYWQgb2Ygb3BlbiBjb2Rpbmcu
DQo+Pj4+Pj4NCj4+Pj4+PiB2Ni0+djcgY2hhbmdlczoNCj4+Pj4+PiBDaGFuZ2VkIGltcGxl
bWVudGF0aW9uIHRvIGFkZCBhIG5ldyBwYXJhbWV0ZXIgImdzaSIgdG8gc3RydWN0IA0KPj4+
Pj4+IHBjaXN0dWJfZGV2aWNlIGFuZCBzZXQgZ3NpIHdoZW4gcGNpc3R1YiBpbml0aWFsaXpl
IGRldmljZS4gVGhlbiB3aGVuIA0KPj4+Pj4+IHVzZXJzcGFjZSB3YW50cyB0byBnZXQgZ3Np
IGFuZCBwYXNzIHNiZGYsIHdlIGNhbiByZXR1cm4gdGhhdCBnc2kuDQo+Pj4+Pj4NCj4+Pj4+
PiB2NS0+djYgY2hhbmdlczoNCj4+Pj4+PiBDaGFuZ2VkIGltcGxlbWVudGF0aW9uIHRvIGFk
ZCBhIG5ldyBzeXNjYWxsIHRvIHRyYW5zbGF0ZSBpcnEgdG8gZ3NpLCANCj4+Pj4+PiBpbnN0
ZWFkIGFkZGluZyBhIG5ldyBnc2kgc3lzZnMgbm9kZSwgYmVjYXVzZSB0aGUgcGNpIE1haW50
YWluZXIgZGlkbid0IA0KPj4+Pj4+IGFsbG93IHRvIGFkZCB0aGF0IHN5c2ZzIG5vZGUuDQo+
Pj4+Pj4NCj4+Pj4+PiB2My0+djUgY2hhbmdlczoNCj4+Pj4+PiBOby4NCj4+Pj4+Pg0KPj4+
Pj4+IHYyLT52MyBjaGFuZ2VzOg0KPj4+Pj4+IFN1Z2dlc3RlZCBieSBSb2dlcjogQWJhbmRv
bmVkIHByZXZpb3VzIGltcGxlbWVudGF0aW9ucyB0aGF0IGFkZGVkIG5ldyANCj4+Pj4+PiBz
eXNjYWxsIHRvIGdldCBnc2kgZnJvbSBpcnEgYW5kIGNoYW5nZWQgdG8gYWRkIGEgbmV3IHN5
c2ZzIG5vZGUgZm9yIGdzaSwgDQo+Pj4+Pj4gdGhlbiB1c2Vyc3BhY2UgY2FuIGdldCBnc2kg
bnVtYmVyIGZyb20gc3lzZnMgbm9kZS4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiB8IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+Pj4+PiB8IENsb3Nl
czogDQo+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0
MDYwOTA4MjYud2hsNkNiN1ItbGtwQGludGVsLmNvbS8NCj4+Pj4+PiAtLS0NCj4+Pj4+PiB8
IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+Pj4+
PiB8IENsb3NlczogDQo+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxk
LWFsbC8yMDI0MDUxNzExMTMuVDQzMVBDOE8tbGtwQGludGVsLmNvbS8NCj4+Pj4+PiAtLS0N
Cj4+Pj4+PiDCoCBkcml2ZXJzL3hlbi9wcml2Y21kLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+Pj4gwqAgZHJpdmVycy94
ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLQ0KPj4+Pj4+IMKgIGluY2x1ZGUvdWFwaS94ZW4vcHJpdmNtZC5owqDCoMKgwqDC
oMKgwqDCoCB8wqAgNyArKysrKysNCj4+Pj4+PiDCoCBpbmNsdWRlL3hlbi9hY3BpLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArKysrKysrDQo+Pj4+Pj4gwqAg
NCBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+
Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYyBiL2RyaXZl
cnMveGVuL3ByaXZjbWQuYw0KPj4+Pj4+IGluZGV4IDk1NjM2NTBkZmJhZi4uMWVkNjEyZDIx
NTQzIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQuYw0KPj4+Pj4+
ICsrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQuYw0KPj4+Pj4+IEBAIC00Niw2ICs0Niw5IEBA
DQo+Pj4+Pj4gwqAgI2luY2x1ZGUgPHhlbi9wYWdlLmg+DQo+Pj4+Pj4gwqAgI2luY2x1ZGUg
PHhlbi94ZW4tb3BzLmg+DQo+Pj4+Pj4gwqAgI2luY2x1ZGUgPHhlbi9iYWxsb29uLmg+DQo+
Pj4+Pj4gKyNpZmRlZiBDT05GSUdfWEVOX0FDUEkNCj4+Pj4+PiArI2luY2x1ZGUgPHhlbi9h
Y3BpLmg+DQo+Pj4+Pj4gKyNlbmRpZg0KPj4+Pj4+IMKgICNpbmNsdWRlICJwcml2Y21kLmgi
DQo+Pj4+Pj4gQEAgLTg0NCw2ICs4NDcsMjkgQEAgc3RhdGljIGxvbmcgcHJpdmNtZF9pb2N0
bF9tbWFwX3Jlc291cmNlKHN0cnVjdCBmaWxlIA0KPj4+Pj4+ICpmaWxlLA0KPj4+Pj4+IMKg
wqDCoMKgwqAgcmV0dXJuIHJjOw0KPj4+Pj4+IMKgIH0NCj4+Pj4+PiArc3RhdGljIGxvbmcg
cHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCBf
X3VzZXIgDQo+Pj4+Pj4gKnVkYXRhKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyNpZmRlZiBDT05G
SUdfWEVOX0FDUEkNCj4+Pj4+PiArwqDCoMKgIGludCByYzsNCj4+Pj4+PiArwqDCoMKgIHN0
cnVjdCBwcml2Y21kX3BjaWRldl9nZXRfZ3NpIGtkYXRhOw0KPj4+Pj4+ICsNCj4+Pj4+PiAr
wqDCoMKgIGlmIChjb3B5X2Zyb21fdXNlcigma2RhdGEsIHVkYXRhLCBzaXplb2Yoa2RhdGEp
KSkNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+Pj4+Pj4gKw0K
Pj4+Pj4+ICvCoMKgwqAgcmMgPSBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKGtkYXRhLnNi
ZGYpOw0KPj4+Pj4+ICvCoMKgwqAgaWYgKHJjIDwgMCkNCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJjOw0KPj4+Pj4+ICsNCj4+Pj4+PiArwqDCoMKgIGtkYXRhLmdzaSA9IHJj
Ow0KPj4+Pj4+ICvCoMKgwqAgaWYgKGNvcHlfdG9fdXNlcih1ZGF0YSwgJmtkYXRhLCBzaXpl
b2Yoa2RhdGEpKSkNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FRkFVTFQ7DQo+
Pj4+Pj4gKw0KPj4+Pj4+ICvCoMKgwqAgcmV0dXJuIDA7DQo+Pj4+Pj4gKyNlbHNlDQo+Pj4+
Pj4gK8KgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4gK30N
Cj4+Pj4+PiArDQo+Pj4+Pj4gwqAgI2lmZGVmIENPTkZJR19YRU5fUFJJVkNNRF9FVkVOVEZE
DQo+Pj4+Pj4gwqAgLyogSXJxZmQgc3VwcG9ydCAqLw0KPj4+Pj4+IMKgIHN0YXRpYyBzdHJ1
Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqaXJxZmRfY2xlYW51cF93cTsNCj4+Pj4+PiBAQCAtMTU0
Myw2ICsxNTY5LDEwIEBAIHN0YXRpYyBsb25nIHByaXZjbWRfaW9jdGwoc3RydWN0IGZpbGUg
KmZpbGUsDQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHByaXZjbWRfaW9jdGxf
aW9ldmVudGZkKGZpbGUsIHVkYXRhKTsNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7DQo+Pj4+Pj4gK8KgwqDCoCBjYXNlIElPQ1RMX1BSSVZDTURfUENJREVWX0dFVF9HU0k6
DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IHByaXZjbWRfaW9jdGxfcGNpZGV2X2dl
dF9nc2koZmlsZSwgdWRhdGEpOw0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+
Pj4+PiArDQo+Pj4+Pj4gwqDCoMKgwqDCoCBkZWZhdWx0Og0KPj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBicmVhazsNCj4+Pj4+PiDCoMKgwqDCoMKgIH0NCj4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyANCj4+Pj4+PiBiL2RyaXZl
cnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMNCj4+Pj4+PiBpbmRleCA4Y2UyNzMzM2Y1
NGIuLjJlYThlNDA3NWFkYyAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4t
cGNpYmFjay9wY2lfc3R1Yi5jDQo+Pj4+Pj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJh
Y2svcGNpX3N0dWIuYw0KPj4+Pj4+IEBAIC01Niw2ICs1Niw5IEBAIHN0cnVjdCBwY2lzdHVi
X2RldmljZSB7DQo+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGNpX2RldiAqZGV2Ow0KPj4+
Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXY7Lyogbm9uLU5V
TEwgaWYgc3RydWN0IHBjaV9kZXYgaXMgaW4gDQo+Pj4+Pj4gdXNlICovDQo+Pj4+Pj4gKyNp
ZmRlZiBDT05GSUdfWEVOX0FDUEkNCj4+Pj4+PiArwqDCoMKgIGludCBnc2k7DQo+Pj4+Pj4g
KyNlbmRpZg0KPj4+Pj4+IMKgIH07DQo+Pj4+Pj4gwqAgLyogQWNjZXNzIHRvIHBjaXN0dWJf
ZGV2aWNlcyAmIHNlaXplZF9kZXZpY2VzIGxpc3RzIGFuZCB0aGUgDQo+Pj4+Pj4gaW5pdGlh
bGl6ZV9kZXZpY2VzDQo+Pj4+Pj4gQEAgLTg4LDYgKzkxLDkgQEAgc3RhdGljIHN0cnVjdCBw
Y2lzdHViX2RldmljZSANCj4+Pj4+PiAqcGNpc3R1Yl9kZXZpY2VfYWxsb2Moc3RydWN0IHBj
aV9kZXYgKmRldikNCj4+Pj4+PiDCoMKgwqDCoMKgIGtyZWZfaW5pdCgmcHNkZXYtPmtyZWYp
Ow0KPj4+Pj4+IMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2luaXQoJnBzZGV2LT5sb2NrKTsNCj4+
Pj4+PiArI2lmZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4+Pj4+ICvCoMKgwqAgcHNkZXYtPmdz
aSA9IC0xOw0KPj4+Pj4+ICsjZW5kaWYNCj4+Pj4+PiDCoMKgwqDCoMKgIHJldHVybiBwc2Rl
djsNCj4+Pj4+PiDCoCB9DQo+Pj4+Pj4gQEAgLTIyMCw2ICsyMjYsMjUgQEAgc3RhdGljIHN0
cnVjdCBwY2lfZGV2IA0KPj4+Pj4+ICpwY2lzdHViX2RldmljZV9nZXRfcGNpX2RldihzdHJ1
Y3QgeGVuX3BjaWJrX2RldmljZSAqcGRldiwNCj4+Pj4+PiDCoMKgwqDCoMKgIHJldHVybiBw
Y2lfZGV2Ow0KPj4+Pj4+IMKgIH0NCj4+Pj4+PiArI2lmZGVmIENPTkZJR19YRU5fUENJREVW
X0JBQ0tFTkQNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gVGhpcyBicmVha3MgY29uZmlndXJhdGlv
bnMgd2l0aG91dCBDT05GSUdfQUNQSSBhbmQgd2l0aA0KPj4+Pj4gQ09ORklHX1hFTl9QQ0lE
RVZfQkFDS0VORC4NCj4+Pj4+DQo+Pj4+PiBBbHNvIHRoZXJlIHNob3VsZCBiZSBubyBkZXBl
bmRlbmN5IGJldHdlZW4gUENJREVWX0JBQ0tFTkQgYW5kDQo+Pj4+PiBwY2lzdHViX2dldF9n
c2lfZnJvbV9zYmRmLg0KPj4+Pj4NCj4+Pj4+IEkgdGhpbmsgd2Ugc2hvdWxkIHNvbHZlIHRo
ZSBidWlsZCBpc3N1ZXMgdGhpcyB3YXk6DQo+Pj4+Pg0KPj4+Pj4gLSBwcml2Y21kX2lvY3Rs
X3BjaWRldl9nZXRfZ3NpIHNob3VsZCBoYXZlOg0KPj4+Pj4gI2lmIGRlZmluZWQoQ09ORklH
X1hFTl9BQ1BJKSAmJiBkZWZpbmVkKENPTkZJR19YRU5fUENJX1NUVUIpDQo+Pj4+Pg0KPj4+
Pj4gLSBoZXJlIHdlIHNob3VsZCBoYXZlICNpZmRlZiBDT05GSUdfWEVOX0FDUEkgYXMgeW91
IGhhZCBiZWZvcmUNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwg
dGhlIGFib3ZlIHNob3VsZCBiZSBhYmxlIHRvIGFkZHJlc3MgYWxsIHZhbGlkDQo+Pj4+PiBj
b21iaW5hdGlvbnMuDQo+Pj4+IFRoaXMgY2FuJ3QgcGFzcyBhIGNvbWJpbmF0aW9uIHRoYXQ6
DQo+Pj4+IENPTkZJR19YRU5fQUNQST15DQo+Pj4+IENPTkZJR19YRU5fUENJX1NUVUI9eQ0K
Pj4+PiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0NCj4+Pj4gUmVwb3J0ZWQgYnkgcm9i
b3QgDQo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNDA2
MDkwODI2LndobDZDYjdSLWxrcEBpbnRlbC5jb20vDQo+Pj4+DQo+Pj4+IEF0IHRoaXMgY29t
YmluYXRpb24sIHByaXZjbWRfaW9jdGxfcGNpZGV2X2dldF9nc2kgY2FuIGNhbGwgDQo+Pj4+
IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYgYmVjYXVzZSBDT05GSUdfWEVOX0FDUEkgYW5k
IENPTkZJR19YRU5fUENJX1NUVUIgDQo+Pj4+IGFyZSBib3RoICJ5Ii4NCj4+Pj4gQnV0IHdo
ZW4gdGhlIGNvbXBpbGVyIHRyaWVzIHRvIGZpbmQgdGhlIGltcGxlbWVudGF0aW9uIG9mIA0K
Pj4+PiBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmLCBpdCBmYWlscyAobGQ6IHZtbGludXgu
bzogaW4gZnVuY3Rpb24gDQo+Pj4+IGBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3NpJzoN
Cj4+Pj4gL2hvbWUvY2pxL2NvZGUvdXBzdHJlYW0va2VybmVsX3Rlc3Rfcm9ib3QvbGludXhf
eGVuL2J1aWxkX2Rpci8uLi9kcml2ZXJzL3hlbi9wcml2Y21kLmM6ODU5OiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmJyksIGJlY2F1c2UgdGhl
IHZhbHVlIG9mIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQgaXMgIm0iIChmaWxlIGRyaXZl
cnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlIHNob3dzICJvYmotJChDT05GSUdfWEVOX1BD
SURFVl9CQUNLRU5EKSArPSB4ZW4tcGNpYmFjay5vIiksIHNvIHRoYXQgeGVuLXBjaWJhY2sg
aXMgYnVpbHQgYXMgYSBtb2R1bGUuDQo+Pj4NCj4+Pg0KPj4+IFRoZSBhdHRhY2hlZCAuY29u
ZmlnLCB3aXRoIHRoZSBhcHBlbmRlZCBjaGFuZ2VzIG9uIHRvcCBvZiB5b3VyIHBhdGNoDQo+
Pj4gd29yayBmb3IgbWUuIEkgaGF2ZSBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0uDQo+
PiBVc2luZyB5b3VyIGF0dGFjaGVkIC5jb25maWcsIGl0IGFsc28gd29ya3MgZm9yIG1lLg0K
Pj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB5b3VyIC5jb25maWcgYW5kIHRoZSBjb25maWcg
cmVwb3J0ZWQgYnkgUm9ib3QgDQo+PiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1j
aS9hcmNoaXZlLzIwMjQwNjA5LzIwMjQwNjA5MDgyNi53aGw2Q2I3Ui1sa3BAaW50ZWwuY29t
L2NvbmZpZykgaXMgdGhhdCB5b3VyIENPTkZJR19YRU5fUFJJVkNNRD1tLCBidXQgUm9ib3Qn
cyBDT05GSUdfWEVOX1BSSVZDTUQ9eS4NCj4+DQo+PiBJdCBzZWVtcyB0aGF0LCB3aXRoIG15
IHBhdGNoIGNoYW5nZXMsIHByaXZjbWQgdXNlcyB0aGUgZnVuY3Rpb24gaW1wbGVtZW50ZWQg
YnkgDQo+PiB4ZW4tcGNpYmFjaywgc28gaWYgdGhlIGNvbmZpZ3VyYXRpb24gaXMgIkNPTkZJ
R19YRU5fUFJJVkNNRD1tICYgDQo+PiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0iIG9y
ICJDT05GSUdfWEVOX1BSSVZDTUQ9eSAmIA0KPj4gQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VO
RD15IiwgdGhlIGNvbXBpbGF0aW9uIGlzIE9LLCBidXQgaWYgdGhlIGNvbmZpZ3VyYXRpb24g
DQo+PiBpcyAiQ09ORklHX1hFTl9QUklWQ01EPXkgJiBDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EPW0iLCBpc3N1ZSBoYXBwZW5zLg0KPj4NCj4+IFlvdSBjYW4gY2hhbmdlIENPTkZJR19Y
RU5fUFJJVkNNRCBmcm9tICJtIiB0byAieSIgaW4geW91ciAuY29uZmlnLCB0aGVuIHlvdSAN
Cj4+IHdpbGwgZmFpbCBhdDoNCj4+IGxkOiB2bWxpbnV4Lm86IGluIGZ1bmN0aW9uIGBwcml2
Y21kX2lvY3RsJzoNCj4+IHByaXZjbWQuYzooLnRleHQrMHg2NjVlNDIpOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmJw0KPiANCj4gWW91IGNh
biBkbzoNCj4gDQo+ICDCoMKgwqDCoGlmIChJU19SRUFDSEFCTEUoQ09ORklHX1hFTl9QQ0lE
RVZfQkFDS0VORCkpIHsNCj4gIMKgwqDCoMKgwqDCoMKgIHJjID0gcGNpc3R1Yl9nZXRfZ3Np
X2Zyb21fc2JkZihrZGF0YS5zYmRmKTsNCj4gIMKgwqDCoMKgwqDCoMKgIGlmIChyYyA8IDAp
DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByYzsNCj4gIMKgwqDCoMKgfQ0K
PiANCj4gU2VlIERvY3VtZW50YXRpb24va2J1aWxkL2tjb25maWctbGFuZ3VhZ2UucnN0IGlu
IHRoZSBrZXJuZWwgc291cmNlIHRyZWUuDQoNCk9oLCBJIHRoaW5rIHRoaXMgd2lsbCBuZWVk
Og0KDQoJaW1wbHkgQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORA0KDQppbiB0aGUgQ09ORklH
X1hFTl9QUklWQ01EIEtjb25maWcgZGVmaW5pdGlvbi4NCg0KDQpKdWVyZ2VuDQoNCg==
--------------lOVk20paBAGFc2c6JmpBsndx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------lOVk20paBAGFc2c6JmpBsndx--

--------------rF2Tgg4eFuptfrpeGtpW0w60--

--------------dUiUSvjB6lk85hg7NxW0fMOv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbxIPcFAwAAAAAACgkQsN6d1ii/Ey8C
pAf/cnFQwNfkz05QlBSPAmCpXqBvJkiNTeUzzKHYFbD3TScNQTWMhRAedozHPN2ErO8c21yFRYt9
q/qJD1rJl+UHo2Xgm9i8QDPo6C716QvNsTU6MLp8dvHjksRZdSdTAf0QXyU6iGTLuw9Qo1Pn8tvT
Uoat7C3pF21SfTot3g4HGQ+r5AWylX6MEzmiUwRkCq1bUPfWNN0Gk7JiAqL8OdQ8EtBYh7bYc78M
aZOyGe3Svd/RWKINOHtgKRC61g70W6u4s6j0jTYcagW+CjZuY+dURvUn0QRei8Wo/2zPywowus7d
ReW0X6aq6SkzcWUrS1fmVbikRxMMHMb9pcgaCACFOA==
=8QYS
-----END PGP SIGNATURE-----

--------------dUiUSvjB6lk85hg7NxW0fMOv--

