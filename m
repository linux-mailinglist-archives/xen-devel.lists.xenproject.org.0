Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34EC97E702
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 09:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801703.1211684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdxc-00068g-Ef; Mon, 23 Sep 2024 07:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801703.1211684; Mon, 23 Sep 2024 07:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssdxc-00066d-Bi; Mon, 23 Sep 2024 07:58:20 +0000
Received: by outflank-mailman (input) for mailman id 801703;
 Mon, 23 Sep 2024 07:58:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DQIS=QV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ssdxa-00066X-SL
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 07:58:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96e02d72-7981-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 09:58:16 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C48DA21FAB;
 Mon, 23 Sep 2024 07:58:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F21F1347F;
 Mon, 23 Sep 2024 07:58:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QVZpIZYf8WbuZQAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 23 Sep 2024 07:58:14 +0000
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
X-Inumbo-ID: 96e02d72-7981-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1727078295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ROfvZa8oJwfnkYF9dYz730qnzOkiEvX+nmVdpz/16xs=;
	b=ZvldHNxXobh7lWUA/oP9ItjAoibzKWOsXVMVL+T9D/xtXGkw462SvKNda2OVm18ncp9cp2
	XgIWC43XslmqIvwiDFfR3urGrxVRJzFm+1TBVjYjan/tCj5pc4NpmQuUosNzn9JE46YdI8
	tW4viE8Ev5/kKkPkDiU6ogLqQg+rSDY=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=s4CiUeWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1727078294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ROfvZa8oJwfnkYF9dYz730qnzOkiEvX+nmVdpz/16xs=;
	b=s4CiUeWIUwfyspYGFwRS9mJACEqTbDatJRv8qme0Hp1dQriRTSjSlZp3FuKlhgeBpC30gz
	DginX+Y4h49cwWKKQnuMekESPp0KkMdZN+XMSoOMfwe82i+xZ4Q95zOShq/FZo4S/q4DWv
	bZjjrqr7xqThFluMH4xt/qlammkHZYw=
Message-ID: <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>
Date: Mon, 23 Sep 2024 09:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [KERNEL PATCH v9 3/3] xen/privcmd: Add new syscall to get gsi
 from dev
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
In-Reply-To: <BL1PR12MB584987F7DF08909143AC0E21E76F2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mofSP9SXK2eiqtPef5WPEunV"
X-Rspamd-Queue-Id: C48DA21FAB
X-Spam-Score: -5.39
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.39 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.18)[-0.901];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mofSP9SXK2eiqtPef5WPEunV
Content-Type: multipart/mixed; boundary="------------zcMgvOjcjuYdCwkVS4s00rIP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
Message-ID: <1cc89abe-3744-4c35-9d78-070e58d6836a@suse.com>
Subject: Re: [KERNEL PATCH v9 3/3] xen/privcmd: Add new syscall to get gsi
 from dev
References: <20240912092352.1602724-1-Jiqian.Chen@amd.com>
 <20240912092352.1602724-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2409181522080.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB5849DFA05D02F1BD9A416122E76C2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2409200959400.1417852@ubuntu-linux-20-04-desktop>
 <BL1PR12MB584987F7DF08909143AC0E21E76F2@BL1PR12MB5849.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB584987F7DF08909143AC0E21E76F2@BL1PR12MB5849.namprd12.prod.outlook.com>

--------------zcMgvOjcjuYdCwkVS4s00rIP
Content-Type: multipart/mixed; boundary="------------8Eg8fzQO3MCqUcN5JX8wtOd0"

--------------8Eg8fzQO3MCqUcN5JX8wtOd0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDkuMjQgMDc6NDksIENoZW4sIEppcWlhbiB3cm90ZToNCj4gT24gMjAyNC85LzIx
IDA1OjE3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBGcmksIDIwIFNlcCAy
MDI0LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC85LzE5IDA2OjQ5LCBTdGVm
YW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+IE9uIFRodSwgMTIgU2VwIDIwMjQsIEppcWlh
biBDaGVuIHdyb3RlOg0KPj4+Pj4gT24gUFZIIGRvbTAsIHdoZW4gcGFzc3Rocm91Z2ggYSBk
ZXZpY2UgdG8gZG9tVSwgUUVNVSBhbmQgeGwgdG9vbHMNCj4+Pj4+IHdhbnQgdG8gdXNlIGdz
aSBudW1iZXIgdG8gZG8gcGlycSBtYXBwaW5nLCBzZWUgUUVNVSBjb2RlDQo+Pj4+PiB4ZW5f
cHRfcmVhbGl6ZS0+eGNfcGh5c2Rldl9tYXBfcGlycSwgYW5kIHhsIGNvZGUNCj4+Pj4+IHBj
aV9hZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycSwgYnV0IGluIGN1cnJlbnQgY29k
ZXMsIHRoZSBnc2kNCj4+Pj4+IG51bWJlciBpcyBnb3QgZnJvbSBmaWxlIC9zeXMvYnVzL3Bj
aS9kZXZpY2VzLzxzYmRmPi9pcnEsIHRoYXQgaXMNCj4+Pj4+IHdyb25nLCBiZWNhdXNlIGly
cSBpcyBub3QgZXF1YWwgd2l0aCBnc2ksIHRoZXkgYXJlIGluIGRpZmZlcmVudA0KPj4+Pj4g
c3BhY2VzLCBzbyBwaXJxIG1hcHBpbmcgZmFpbHMuDQo+Pj4+PiBBbmQgaW4gY3VycmVudCBs
aW51eCBjb2RlcywgdGhlcmUgaXMgbm8gbWV0aG9kIHRvIGdldCBnc2kNCj4+Pj4+IGZvciB1
c2Vyc3BhY2UuDQo+Pj4+Pg0KPj4+Pj4gRm9yIGFib3ZlIHB1cnBvc2UsIHJlY29yZCBnc2kg
b2YgcGNpc3R1YiBkZXZpY2VzIHdoZW4gaW5pdA0KPj4+Pj4gcGNpc3R1YiBhbmQgYWRkIGEg
bmV3IHN5c2NhbGwgaW50byBwcml2Y21kIHRvIGxldCB1c2Vyc3BhY2UNCj4+Pj4+IGNhbiBn
ZXQgZ3NpIHdoZW4gdGhleSBoYXZlIGEgbmVlZC4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+
Pj4gdjgtPnY5IGNoYW5nZXM6DQo+Pj4+PiBDaGFuZ2VkIHRoZSBzeXNjYWxsIG5hbWUgZnJv
bSAiSU9DVExfUFJJVkNNRF9HU0lfRlJPTV9ERVYiIHRvICJJT0NUTF9QUklWQ01EX1BDSURF
Vl9HRVRfR1NJIi4gQWxzbyBjaGFuZ2VkIHRoZSBvdGhlciBmdW5jdGlvbnMgbmFtZS4NCj4+
Pj4+IENoYW5nZWQgdGhlIG1hY3JvIHdyYXBwaW5nICJwY2lzdHViX2dldF9nc2lfZnJvbV9z
YmRmIiBmcm9tICJDT05GSUdfWEVOX0FDUEkiIHRvICJDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EIiB0byBmaXggY29tcGlsZSBlcnJvcnMgcmVwb3J0ZWQgYnkgQ0kgcm9ib3QuDQo+Pj4+
PiBDaGFuZ2VkIHRoZSBwYXJhbWV0ZXIgZ3NpIG9mIHN0cnVjdCBwcml2Y21kX3BjaWRldl9n
ZXRfZ3NpIGZyb20gaW50IHRvIHUzMi4NCj4+Pj4+DQo+Pj4+PiB2Ny0+djggY2hhbmdlczoN
Cj4+Pj4+IEluIGZ1bmN0aW9uIHByaXZjbWRfaW9jdGxfZ3NpX2Zyb21fZGV2LCByZXR1cm4g
LUVJTlZBTCB3aGVuIG5vdCBjb25maWdlIENPTkZJR19YRU5fQUNQSS4NCj4+Pj4+IFVzZWQg
UENJX0JVU19OVU0gUENJX1NMT1QgUENJX0ZVTkMgaW5zdGVhZCBvZiBvcGVuIGNvZGluZy4N
Cj4+Pj4+DQo+Pj4+PiB2Ni0+djcgY2hhbmdlczoNCj4+Pj4+IENoYW5nZWQgaW1wbGVtZW50
YXRpb24gdG8gYWRkIGEgbmV3IHBhcmFtZXRlciAiZ3NpIiB0byBzdHJ1Y3QgcGNpc3R1Yl9k
ZXZpY2UgYW5kIHNldCBnc2kgd2hlbiBwY2lzdHViIGluaXRpYWxpemUgZGV2aWNlLiBUaGVu
IHdoZW4gdXNlcnNwYWNlIHdhbnRzIHRvIGdldCBnc2kgYW5kIHBhc3Mgc2JkZiwgd2UgY2Fu
IHJldHVybiB0aGF0IGdzaS4NCj4+Pj4+DQo+Pj4+PiB2NS0+djYgY2hhbmdlczoNCj4+Pj4+
IENoYW5nZWQgaW1wbGVtZW50YXRpb24gdG8gYWRkIGEgbmV3IHN5c2NhbGwgdG8gdHJhbnNs
YXRlIGlycSB0byBnc2ksIGluc3RlYWQgYWRkaW5nIGEgbmV3IGdzaSBzeXNmcyBub2RlLCBi
ZWNhdXNlIHRoZSBwY2kgTWFpbnRhaW5lciBkaWRuJ3QgYWxsb3cgdG8gYWRkIHRoYXQgc3lz
ZnMgbm9kZS4NCj4+Pj4+DQo+Pj4+PiB2My0+djUgY2hhbmdlczoNCj4+Pj4+IE5vLg0KPj4+
Pj4NCj4+Pj4+IHYyLT52MyBjaGFuZ2VzOg0KPj4+Pj4gU3VnZ2VzdGVkIGJ5IFJvZ2VyOiBB
YmFuZG9uZWQgcHJldmlvdXMgaW1wbGVtZW50YXRpb25zIHRoYXQgYWRkZWQgbmV3IHN5c2Nh
bGwgdG8gZ2V0IGdzaSBmcm9tIGlycSBhbmQgY2hhbmdlZCB0byBhZGQgYSBuZXcgc3lzZnMg
bm9kZSBmb3IgZ3NpLCB0aGVuIHVzZXJzcGFjZSBjYW4gZ2V0IGdzaSBudW1iZXIgZnJvbSBz
eXNmcyBub2RlLg0KPj4+Pj4gLS0tDQo+Pj4+PiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+Pj4+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwNjA5MDgyNi53aGw2Q2I3Ui1sa3BAaW50
ZWwuY29tLw0KPj4+Pj4gLS0tDQo+Pj4+PiB8IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4NCj4+Pj4+IHwgQ2xvc2VzOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQwNTE3MTExMy5UNDMxUEM4Ty1sa3BAaW50ZWwu
Y29tLw0KPj4+Pj4gLS0tDQo+Pj4+PiAgIGRyaXZlcnMveGVuL3ByaXZjbWQuYyAgICAgICAg
ICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4gICBkcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tDQo+Pj4+PiAgIGluY2x1ZGUvdWFwaS94ZW4vcHJpdmNtZC5oICAgICAgICAgfCAg
NyArKysrKysNCj4+Pj4+ICAgaW5jbHVkZS94ZW4vYWNwaS5oICAgICAgICAgICAgICAgICB8
ICA5ICsrKysrKysNCj4+Pj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hl
bi9wcml2Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMNCj4+Pj4+IGluZGV4IDk1NjM2
NTBkZmJhZi4uMWVkNjEyZDIxNTQzIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy94ZW4v
cHJpdmNtZC5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMNCj4+Pj4+IEBA
IC00Niw2ICs0Niw5IEBADQo+Pj4+PiAgICNpbmNsdWRlIDx4ZW4vcGFnZS5oPg0KPj4+Pj4g
ICAjaW5jbHVkZSA8eGVuL3hlbi1vcHMuaD4NCj4+Pj4+ICAgI2luY2x1ZGUgPHhlbi9iYWxs
b29uLmg+DQo+Pj4+PiArI2lmZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4+Pj4gKyNpbmNsdWRl
IDx4ZW4vYWNwaS5oPg0KPj4+Pj4gKyNlbmRpZg0KPj4+Pj4gICANCj4+Pj4+ICAgI2luY2x1
ZGUgInByaXZjbWQuaCINCj4+Pj4+ICAgDQo+Pj4+PiBAQCAtODQ0LDYgKzg0NywyOSBAQCBz
dGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZp
bGUsDQo+Pj4+PiAgIAlyZXR1cm4gcmM7DQo+Pj4+PiAgIH0NCj4+Pj4+ICAgDQo+Pj4+PiAr
c3RhdGljIGxvbmcgcHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaShzdHJ1Y3QgZmlsZSAq
ZmlsZSwgdm9pZCBfX3VzZXIgKnVkYXRhKQ0KPj4+Pj4gK3sNCj4+Pj4+ICsjaWZkZWYgQ09O
RklHX1hFTl9BQ1BJDQo+Pj4+PiArCWludCByYzsNCj4+Pj4+ICsJc3RydWN0IHByaXZjbWRf
cGNpZGV2X2dldF9nc2kga2RhdGE7DQo+Pj4+PiArDQo+Pj4+PiArCWlmIChjb3B5X2Zyb21f
dXNlcigma2RhdGEsIHVkYXRhLCBzaXplb2Yoa2RhdGEpKSkNCj4+Pj4+ICsJCXJldHVybiAt
RUZBVUxUOw0KPj4+Pj4gKw0KPj4+Pj4gKwlyYyA9IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3Ni
ZGYoa2RhdGEuc2JkZik7DQo+Pj4+PiArCWlmIChyYyA8IDApDQo+Pj4+PiArCQlyZXR1cm4g
cmM7DQo+Pj4+PiArDQo+Pj4+PiArCWtkYXRhLmdzaSA9IHJjOw0KPj4+Pj4gKwlpZiAoY29w
eV90b191c2VyKHVkYXRhLCAma2RhdGEsIHNpemVvZihrZGF0YSkpKQ0KPj4+Pj4gKwkJcmV0
dXJuIC1FRkFVTFQ7DQo+Pj4+PiArDQo+Pj4+PiArCXJldHVybiAwOw0KPj4+Pj4gKyNlbHNl
DQo+Pj4+PiArCXJldHVybiAtRUlOVkFMOw0KPj4+Pj4gKyNlbmRpZg0KPj4+Pj4gK30NCj4+
Pj4+ICsNCj4+Pj4+ICAgI2lmZGVmIENPTkZJR19YRU5fUFJJVkNNRF9FVkVOVEZEDQo+Pj4+
PiAgIC8qIElycWZkIHN1cHBvcnQgKi8NCj4+Pj4+ICAgc3RhdGljIHN0cnVjdCB3b3JrcXVl
dWVfc3RydWN0ICppcnFmZF9jbGVhbnVwX3dxOw0KPj4+Pj4gQEAgLTE1NDMsNiArMTU2OSwx
MCBAQCBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLA0KPj4+
Pj4gICAJCXJldCA9IHByaXZjbWRfaW9jdGxfaW9ldmVudGZkKGZpbGUsIHVkYXRhKTsNCj4+
Pj4+ICAgCQlicmVhazsNCj4+Pj4+ICAgDQo+Pj4+PiArCWNhc2UgSU9DVExfUFJJVkNNRF9Q
Q0lERVZfR0VUX0dTSToNCj4+Pj4+ICsJCXJldCA9IHByaXZjbWRfaW9jdGxfcGNpZGV2X2dl
dF9nc2koZmlsZSwgdWRhdGEpOw0KPj4+Pj4gKwkJYnJlYWs7DQo+Pj4+PiArDQo+Pj4+PiAg
IAlkZWZhdWx0Og0KPj4+Pj4gICAJCWJyZWFrOw0KPj4+Pj4gICAJfQ0KPj4+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgYi9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jDQo+Pj4+PiBpbmRleCA4Y2UyNzMzM2Y1NGIuLjJl
YThlNDA3NWFkYyAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNr
L3BjaV9zdHViLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL3BjaV9z
dHViLmMNCj4+Pj4+IEBAIC01Niw2ICs1Niw5IEBAIHN0cnVjdCBwY2lzdHViX2RldmljZSB7
DQo+Pj4+PiAgIA0KPj4+Pj4gICAJc3RydWN0IHBjaV9kZXYgKmRldjsNCj4+Pj4+ICAgCXN0
cnVjdCB4ZW5fcGNpYmtfZGV2aWNlICpwZGV2Oy8qIG5vbi1OVUxMIGlmIHN0cnVjdCBwY2lf
ZGV2IGlzIGluIHVzZSAqLw0KPj4+Pj4gKyNpZmRlZiBDT05GSUdfWEVOX0FDUEkNCj4+Pj4+
ICsJaW50IGdzaTsNCj4+Pj4+ICsjZW5kaWYNCj4+Pj4+ICAgfTsNCj4+Pj4+ICAgDQo+Pj4+
PiAgIC8qIEFjY2VzcyB0byBwY2lzdHViX2RldmljZXMgJiBzZWl6ZWRfZGV2aWNlcyBsaXN0
cyBhbmQgdGhlIGluaXRpYWxpemVfZGV2aWNlcw0KPj4+Pj4gQEAgLTg4LDYgKzkxLDkgQEAg
c3RhdGljIHN0cnVjdCBwY2lzdHViX2RldmljZSAqcGNpc3R1Yl9kZXZpY2VfYWxsb2Moc3Ry
dWN0IHBjaV9kZXYgKmRldikNCj4+Pj4+ICAgDQo+Pj4+PiAgIAlrcmVmX2luaXQoJnBzZGV2
LT5rcmVmKTsNCj4+Pj4+ICAgCXNwaW5fbG9ja19pbml0KCZwc2Rldi0+bG9jayk7DQo+Pj4+
PiArI2lmZGVmIENPTkZJR19YRU5fQUNQSQ0KPj4+Pj4gKwlwc2Rldi0+Z3NpID0gLTE7DQo+
Pj4+PiArI2VuZGlmDQo+Pj4+PiAgIA0KPj4+Pj4gICAJcmV0dXJuIHBzZGV2Ow0KPj4+Pj4g
ICB9DQo+Pj4+PiBAQCAtMjIwLDYgKzIyNiwyNSBAQCBzdGF0aWMgc3RydWN0IHBjaV9kZXYg
KnBjaXN0dWJfZGV2aWNlX2dldF9wY2lfZGV2KHN0cnVjdCB4ZW5fcGNpYmtfZGV2aWNlICpw
ZGV2LA0KPj4+Pj4gICAJcmV0dXJuIHBjaV9kZXY7DQo+Pj4+PiAgIH0NCj4+Pj4+ICAgDQo+
Pj4+PiArI2lmZGVmIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQNCj4+Pj4NCj4+Pj4NCj4+
Pj4gVGhpcyBicmVha3MgY29uZmlndXJhdGlvbnMgd2l0aG91dCBDT05GSUdfQUNQSSBhbmQg
d2l0aA0KPj4+PiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5ELg0KPj4+Pg0KPj4+PiBBbHNv
IHRoZXJlIHNob3VsZCBiZSBubyBkZXBlbmRlbmN5IGJldHdlZW4gUENJREVWX0JBQ0tFTkQg
YW5kDQo+Pj4+IHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYuDQo+Pj4+DQo+Pj4+IEkgdGhp
bmsgd2Ugc2hvdWxkIHNvbHZlIHRoZSBidWlsZCBpc3N1ZXMgdGhpcyB3YXk6DQo+Pj4+DQo+
Pj4+IC0gcHJpdmNtZF9pb2N0bF9wY2lkZXZfZ2V0X2dzaSBzaG91bGQgaGF2ZToNCj4+Pj4g
I2lmIGRlZmluZWQoQ09ORklHX1hFTl9BQ1BJKSAmJiBkZWZpbmVkKENPTkZJR19YRU5fUENJ
X1NUVUIpDQo+Pj4+DQo+Pj4+IC0gaGVyZSB3ZSBzaG91bGQgaGF2ZSAjaWZkZWYgQ09ORklH
X1hFTl9BQ1BJIGFzIHlvdSBoYWQgYmVmb3JlDQo+Pj4+DQo+Pj4+DQo+Pj4+IEFzIGZhciBh
cyBJIGNhbiB0ZWxsIHRoZSBhYm92ZSBzaG91bGQgYmUgYWJsZSB0byBhZGRyZXNzIGFsbCB2
YWxpZA0KPj4+PiBjb21iaW5hdGlvbnMuDQo+Pj4gVGhpcyBjYW4ndCBwYXNzIGEgY29tYmlu
YXRpb24gdGhhdDoNCj4+PiBDT05GSUdfWEVOX0FDUEk9eQ0KPj4+IENPTkZJR19YRU5fUENJ
X1NUVUI9eQ0KPj4+IENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQ9bQ0KPj4+IFJlcG9ydGVk
IGJ5IHJvYm90IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNDA2
MDkwODI2LndobDZDYjdSLWxrcEBpbnRlbC5jb20vDQo+Pj4NCj4+PiBBdCB0aGlzIGNvbWJp
bmF0aW9uLCBwcml2Y21kX2lvY3RsX3BjaWRldl9nZXRfZ3NpIGNhbiBjYWxsIHBjaXN0dWJf
Z2V0X2dzaV9mcm9tX3NiZGYgYmVjYXVzZSBDT05GSUdfWEVOX0FDUEkgYW5kIENPTkZJR19Y
RU5fUENJX1NUVUIgYXJlIGJvdGggInkiLg0KPj4+IEJ1dCB3aGVuIHRoZSBjb21waWxlciB0
cmllcyB0byBmaW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBwY2lzdHViX2dldF9nc2lfZnJv
bV9zYmRmLCBpdCBmYWlscyAobGQ6IHZtbGludXgubzogaW4gZnVuY3Rpb24gYHByaXZjbWRf
aW9jdGxfcGNpZGV2X2dldF9nc2knOg0KPj4+IC9ob21lL2NqcS9jb2RlL3Vwc3RyZWFtL2tl
cm5lbF90ZXN0X3JvYm90L2xpbnV4X3hlbi9idWlsZF9kaXIvLi4vZHJpdmVycy94ZW4vcHJp
dmNtZC5jOjg1OTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcGNpc3R1Yl9nZXRfZ3NpX2Zy
b21fc2JkZicpLCBiZWNhdXNlIHRoZSB2YWx1ZSBvZiBDT05GSUdfWEVOX1BDSURFVl9CQUNL
RU5EIGlzICJtIiAoZmlsZSBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZSBzaG93
cyAib2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCkgKz0geGVuLXBjaWJhY2subyIp
LCBzbyB0aGF0IHhlbi1wY2liYWNrIGlzIGJ1aWx0IGFzIGEgbW9kdWxlLg0KPj4NCj4+DQo+
PiBUaGUgYXR0YWNoZWQgLmNvbmZpZywgd2l0aCB0aGUgYXBwZW5kZWQgY2hhbmdlcyBvbiB0
b3Agb2YgeW91ciBwYXRjaA0KPj4gd29yayBmb3IgbWUuIEkgaGF2ZSBDT05GSUdfWEVOX1BD
SURFVl9CQUNLRU5EPW0uDQo+IFVzaW5nIHlvdXIgYXR0YWNoZWQgLmNvbmZpZywgaXQgYWxz
byB3b3JrcyBmb3IgbWUuDQo+IFRoZSBkaWZmZXJlbmNlIGJldHdlZW4geW91ciAuY29uZmln
IGFuZCB0aGUgY29uZmlnIHJlcG9ydGVkIGJ5IFJvYm90IChodHRwczovL2Rvd25sb2FkLjAx
Lm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNDA2MDkvMjAyNDA2MDkwODI2LndobDZDYjdSLWxr
cEBpbnRlbC5jb20vY29uZmlnKSBpcyB0aGF0IHlvdXIgQ09ORklHX1hFTl9QUklWQ01EPW0s
IGJ1dCBSb2JvdCdzIENPTkZJR19YRU5fUFJJVkNNRD15Lg0KPiANCj4gSXQgc2VlbXMgdGhh
dCwgd2l0aCBteSBwYXRjaCBjaGFuZ2VzLCBwcml2Y21kIHVzZXMgdGhlIGZ1bmN0aW9uIGlt
cGxlbWVudGVkIGJ5IHhlbi1wY2liYWNrLCBzbyBpZiB0aGUgY29uZmlndXJhdGlvbiBpcyAi
Q09ORklHX1hFTl9QUklWQ01EPW0gJiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0iIG9y
ICJDT05GSUdfWEVOX1BSSVZDTUQ9eSAmIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQ9eSIs
IHRoZSBjb21waWxhdGlvbiBpcyBPSywgYnV0IGlmIHRoZSBjb25maWd1cmF0aW9uIGlzICJD
T05GSUdfWEVOX1BSSVZDTUQ9eSAmIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQ9bSIsIGlz
c3VlIGhhcHBlbnMuDQo+IA0KPiBZb3UgY2FuIGNoYW5nZSBDT05GSUdfWEVOX1BSSVZDTUQg
ZnJvbSAibSIgdG8gInkiIGluIHlvdXIgLmNvbmZpZywgdGhlbiB5b3Ugd2lsbCBmYWlsIGF0
Og0KPiBsZDogdm1saW51eC5vOiBpbiBmdW5jdGlvbiBgcHJpdmNtZF9pb2N0bCc6DQo+IHBy
aXZjbWQuYzooLnRleHQrMHg2NjVlNDIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwY2lz
dHViX2dldF9nc2lfZnJvbV9zYmRmJw0KDQpZb3UgY2FuIGRvOg0KDQoJaWYgKElTX1JFQUNI
QUJMRShDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKSkgew0KCQlyYyA9IHBjaXN0dWJfZ2V0
X2dzaV9mcm9tX3NiZGYoa2RhdGEuc2JkZik7DQoJCWlmIChyYyA8IDApDQoJCQlyZXR1cm4g
cmM7DQoJfQ0KDQpTZWUgRG9jdW1lbnRhdGlvbi9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS5y
c3QgaW4gdGhlIGtlcm5lbCBzb3VyY2UgdHJlZS4NCg0KDQpKdWVyZ2VuDQo=
--------------8Eg8fzQO3MCqUcN5JX8wtOd0
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

--------------8Eg8fzQO3MCqUcN5JX8wtOd0--

--------------zcMgvOjcjuYdCwkVS4s00rIP--

--------------mofSP9SXK2eiqtPef5WPEunV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbxH5YFAwAAAAAACgkQsN6d1ii/Ey/5
mAgAm+mhC3fHuCWDuh1waPt+5CWz7cZfLQhW3RgsWWlU2LLoeiVLo99lzxoJtFP/FMZlsrWLMxZ2
ryatZEv45WqqEkU46ol1rt8EsPcmNhXBUqBOMUhqE/fd++LBZotRaL8cZ5TiGQF7ef64oBjOy2Wo
5xeUznjuIq90RjtNxlC6Txl55w0Wkg6ejTjoZhFLvFZ70+bjCt6oKMhrfBLvLb+ceDI95mfKGnLz
QXgkiKVJcvzqAKUYlsUi0CBi1S+jIBAoO6pxO6agz+RLm0mtGI3T4AdSEV4QNeRxFrAQbvKhbc5a
erm8+hsPpeugZnaRho15sQne9KOvVEU6U45dZ+LIJw==
=+oOC
-----END PGP SIGNATURE-----

--------------mofSP9SXK2eiqtPef5WPEunV--

