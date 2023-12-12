Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB380ECD9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:09:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653116.1019375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2VO-0003fu-Qc; Tue, 12 Dec 2023 13:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653116.1019375; Tue, 12 Dec 2023 13:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2VO-0003dS-Nt; Tue, 12 Dec 2023 13:08:58 +0000
Received: by outflank-mailman (input) for mailman id 653116;
 Tue, 12 Dec 2023 13:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rD2VM-0003dK-Hv
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:08:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a6d29ba-98ef-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 14:08:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B77701FB45;
 Tue, 12 Dec 2023 13:08:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A6B8136C7;
 Tue, 12 Dec 2023 13:08:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id i/RhHGZbeGUFXAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 13:08:54 +0000
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
X-Inumbo-ID: 9a6d29ba-98ef-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702386534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EWmdwTo9q1dyJAM2m70zNTFVQ92/ZTMV/dsFfVdvOaY=;
	b=akCPZJ38xJutF7nR12eslrS2nVV+A5thsS5zcTHX5qxgLQlgO2yn7g5fwJD7PZESuNhKKB
	LN5rBqJzl89YfXYju/7TBEhPGaV/E6ODruURnuPM0lCFRHndCU1qQXKbo2wYHVMXk8Ss9u
	D2vJukc5BUecQ/9cjTqAg2Bgwk0aFXQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702386534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EWmdwTo9q1dyJAM2m70zNTFVQ92/ZTMV/dsFfVdvOaY=;
	b=akCPZJ38xJutF7nR12eslrS2nVV+A5thsS5zcTHX5qxgLQlgO2yn7g5fwJD7PZESuNhKKB
	LN5rBqJzl89YfXYju/7TBEhPGaV/E6ODruURnuPM0lCFRHndCU1qQXKbo2wYHVMXk8Ss9u
	D2vJukc5BUecQ/9cjTqAg2Bgwk0aFXQ=
Message-ID: <9f1f73e6-2ade-440f-aed4-df46be62f3a5@suse.com>
Date: Tue, 12 Dec 2023 14:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
 <569bfdee-5d0b-4384-9dad-e2e90861d837@xen.org>
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
In-Reply-To: <569bfdee-5d0b-4384-9dad-e2e90861d837@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uAmlTggyraC4CH80Etu6Bd0A"
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=akCPZJ38;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-10.90 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -10.90
X-Rspamd-Queue-Id: B77701FB45
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uAmlTggyraC4CH80Etu6Bd0A
Content-Type: multipart/mixed; boundary="------------FvfyFEd9s6wsf2jfcBpyV0fe";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <9f1f73e6-2ade-440f-aed4-df46be62f3a5@suse.com>
Subject: Re: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-13-jgross@suse.com>
 <569bfdee-5d0b-4384-9dad-e2e90861d837@xen.org>
In-Reply-To: <569bfdee-5d0b-4384-9dad-e2e90861d837@xen.org>

--------------FvfyFEd9s6wsf2jfcBpyV0fe
Content-Type: multipart/mixed; boundary="------------NYZTHvQ2rH5EXYcUQbk5ks6m"

--------------NYZTHvQ2rH5EXYcUQbk5ks6m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTIuMjMgMTM6MzksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMi8xMi8yMDIzIDA5OjQ3LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWxsb3cgMTYg
Yml0cyBwZXIgY3B1IG51bWJlciwgd2hpY2ggaXMgdGhlIGxpbWl0IGltcG9zZWQgYnkNCj4+
IHNwaW5sb2NrX3RpY2tldHNfdC4NCj4+DQo+PiBUaGlzIHdpbGwgYWxsb3cgdXAgdG8gNjU1
MzUgY3B1cywgd2hpbGUgaW5jcmVhc2luZyBvbmx5IHRoZSBzaXplIG9mDQo+PiByZWN1cnNp
dmUgc3BpbmxvY2tzIGluIGRlYnVnIGJ1aWxkcyBmcm9tIDggdG8gMTIgYnl0ZXMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4g
LS0tDQo+PiDCoCB4ZW4vY29tbW9uL3NwaW5sb2NrLmPCoMKgwqDCoMKgIHzCoCAxICsNCj4+
IMKgIHhlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oIHwgMTggKysrKysrKysrLS0tLS0tLS0t
DQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc3BpbmxvY2suYyBiL3hlbi9j
b21tb24vc3BpbmxvY2suYw0KPj4gaW5kZXggMjk2YmNmMzNlNi4uYWU3YzdjMjA4NiAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vc3BpbmxvY2suYw0KPj4gKysrIGIveGVuL2NvbW1v
bi9zcGlubG9jay5jDQo+PiBAQCAtNDgxLDYgKzQ4MSw3IEBAIGludCByc3Bpbl90cnlsb2Nr
KHJzcGlubG9ja190ICpsb2NrKQ0KPj4gwqDCoMKgwqDCoCAvKiBEb24ndCBhbGxvdyBvdmVy
ZmxvdyBvZiByZWN1cnNlX2NwdSBmaWVsZC4gKi8NCj4+IMKgwqDCoMKgwqAgQlVJTERfQlVH
X09OKE5SX0NQVVMgPiBTUElOTE9DS19OT19DUFUpOw0KPj4gK8KgwqDCoCBCVUlMRF9CVUdf
T04oU1BJTkxPQ0tfQ1BVX0JJVFMgPiBzaXplb2YobG9jay0+cmVjdXJzZV9jcHUpICogOCk7
DQo+PiDCoMKgwqDCoMKgIEJVSUxEX0JVR19PTihTUElOTE9DS19SRUNVUlNFX0JJVFMgPCAz
KTsNCj4+IMKgwqDCoMKgwqAgY2hlY2tfbG9jaygmbG9jay0+ZGVidWcsIHRydWUpOw0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oIGIveGVuL2luY2x1ZGUv
eGVuL3NwaW5sb2NrLmgNCj4+IGluZGV4IDg3OTQ2OTY1YjIuLmQ3MjA3NzhjYzEgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaA0KPj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3NwaW5sb2NrLmgNCj4+IEBAIC03LDE2ICs3LDE2IEBADQo+PiDCoCAjaW5j
bHVkZSA8YXNtL3N5c3RlbS5oPg0KPj4gwqAgI2luY2x1ZGUgPGFzbS9zcGlubG9jay5oPg0K
Pj4gLSNkZWZpbmUgU1BJTkxPQ0tfQ1BVX0JJVFPCoCAxMg0KPj4gKyNkZWZpbmUgU1BJTkxP
Q0tfQ1BVX0JJVFPCoCAxNg0KPj4gwqAgI2lmZGVmIENPTkZJR19ERUJVR19MT0NLUw0KPj4g
wqAgdW5pb24gbG9ja19kZWJ1ZyB7DQo+PiAtwqDCoMKgIHVpbnQxNl90IHZhbDsNCj4+IC0j
ZGVmaW5lIExPQ0tfREVCVUdfSU5JVFZBTCAweGZmZmYNCj4+ICvCoMKgwqAgdWludDMyX3Qg
dmFsOw0KPj4gKyNkZWZpbmUgTE9DS19ERUJVR19JTklUVkFMIDB4ZmZmZmZmZmYNCj4+IMKg
wqDCoMKgwqAgc3RydWN0IHsNCj4+IC3CoMKgwqDCoMKgwqDCoCB1aW50MTZfdCBjcHU6U1BJ
TkxPQ0tfQ1BVX0JJVFM7DQo+PiAtI2RlZmluZSBMT0NLX0RFQlVHX1BBRF9CSVRTICgxNCAt
IFNQSU5MT0NLX0NQVV9CSVRTKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IDpMT0NL
X0RFQlVHX1BBRF9CSVRTOw0KPj4gK8KgwqDCoMKgwqDCoMKgIHVpbnQzMl90IGNwdTpTUElO
TE9DS19DUFVfQklUUzsNCj4+ICsjZGVmaW5lIExPQ0tfREVCVUdfUEFEX0JJVFMgKDMwIC0g
U1BJTkxPQ0tfQ1BVX0JJVFMpDQo+PiArwqDCoMKgwqDCoMKgwqAgdWludDMyX3QgOkxPQ0tf
REVCVUdfUEFEX0JJVFM7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBpcnFfc2FmZTox
Ow0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgdW5zZWVuOjE7DQo+PiDCoMKgwqDCoMKg
IH07DQo+PiBAQCAtMjEwLDEwICsyMTAsMTAgQEAgdHlwZWRlZiBzdHJ1Y3Qgc3BpbmxvY2sg
ew0KPj4gwqAgdHlwZWRlZiBzdHJ1Y3QgcnNwaW5sb2NrIHsNCj4+IMKgwqDCoMKgwqAgc3Bp
bmxvY2tfdGlja2V0c190IHRpY2tldHM7DQo+PiAtwqDCoMKgIHVpbnQxNl90IHJlY3Vyc2Vf
Y3B1OlNQSU5MT0NLX0NQVV9CSVRTOw0KPj4gK8KgwqDCoCB1aW50MTZfdCByZWN1cnNlX2Nw
dTsNCj4+IMKgICNkZWZpbmUgU1BJTkxPQ0tfTk9fQ1BVwqDCoMKgwqDCoMKgwqAgKCgxdSA8
PCBTUElOTE9DS19DUFVfQklUUykgLSAxKQ0KPj4gLSNkZWZpbmUgU1BJTkxPQ0tfUkVDVVJT
RV9CSVRTwqAgKDE2IC0gU1BJTkxPQ0tfQ1BVX0JJVFMpDQo+PiAtwqDCoMKgIHVpbnQxNl90
IHJlY3Vyc2VfY250OlNQSU5MT0NLX1JFQ1VSU0VfQklUUzsNCj4+ICsjZGVmaW5lIFNQSU5M
T0NLX1JFQ1VSU0VfQklUU8KgIDgNCj4+ICvCoMKgwqAgdWludDhfdCByZWN1cnNlX2NudDsN
Cj4gDQo+IFRoaXMgcGF0Y2ggaXMgYWxzbyBidW1waW5nIHRoZSBudW1iZXIgb2YgcmVjdXJz
aW9uIHBvc3NpYmxlIGZyb20gMTYgdG8gMjU2LiBJdCANCj4gaXMgbm90IGNsZWFyIHRvIG1l
IHdoZXRoZXIgdGhpcyB3YXMgaW50ZW5kZWQgb3IgeW91IGp1c3Qgd2FudGVkIHRvIHVzZSB1
aW50OF90IA0KPiBiZWNhdXNlIGl0IHdhcyBlYXN5IHRvIHVzZS4NCg0KVGhhdCB3YXMgdGhl
IGNhc2UgaW5kZWVkLg0KDQo+ICBGcm9tIGFib3ZlLCBJIGFsc28gc2VlIHRoYXQgd2Ugb25s
eSBuZWVkIDMgYml0czoNCj4gDQo+ICA+IEJVSUxEX0JVR19PTihTUElOTE9DS19SRUNVUlNF
X0JJVFMgPCAzKTsNCj4gDQo+IFNvIEkgd291bGQgY29uc2lkZXIgdG8gLi4uDQo+IA0KPj4g
wqAgI2RlZmluZSBTUElOTE9DS19NQVhfUkVDVVJTRcKgwqAgKCgxdSA8PCBTUElOTE9DS19S
RUNVUlNFX0JJVFMpIC0gMSkNCj4gDQo+IC4uLiB1cGRhdGUgU1BJTkxPQ0tfTUFYX1JFQ1VS
U0UgdG8gMTYgb3IgYXQgbGVhc3QgZXhwbGFpbiB3aHkgd2Ugd2FudCB0byBhbGxvdyANCj4g
dXAgdG8gMjU2IHJlY3Vyc2lvbi4NCg0KSSB0aGluayB1cGRhdGluZyBTUElOTE9DS19NQVhf
UkVDVVJTRSB0byAxNSAodGhlIGN1cnJlbnQgdmFsdWUpIGlzIGZpbmUsDQpwcm9iYWJseSB3
aXRoIGFuIGFkZGl0aW9uYWwNCg0KQlVJTERfQlVHX09OKFNQSU5MT0NLX01BWF9SRUNVUlNF
ID4gKCgxdSA8PCBTUElOTE9DS19SRUNVUlNFX0JJVFMpIC0gMSkpOw0KDQoNCkp1ZXJnZW4N
Cg==
--------------NYZTHvQ2rH5EXYcUQbk5ks6m
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NYZTHvQ2rH5EXYcUQbk5ks6m--

--------------FvfyFEd9s6wsf2jfcBpyV0fe--

--------------uAmlTggyraC4CH80Etu6Bd0A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV4W2YFAwAAAAAACgkQsN6d1ii/Ey8S
aQf7BnxYrInDCqWtszJfgGYLn8IjclNxdoI98QnR68yGZmRCGpv7IbIUX0d0TA3Ppwpalsfjzmpw
hfnNPD6ib4R6dx/Vst9nQ8xgajPoHsKufkLvdDL6TObFWGuKwv3LMojRkw6LSYDZtZVNZNiHWbyt
nn88M2QQer96vt3ZmKVUCuxUQuXjWF5B5CRU6Mb7VkMowElugnT6r5DXWnW9RtPMjTZYVumYn1Dl
bZ+3p5i2ApYXH7hcCeATfQ1ORA+fmrBbL1T5rDryVPFxMVIA0yfvZAFmF0ggdHN7f2bT6GFJu+p8
wLwB9ZTyxY13Lg4lYlAvLrM0smppDLMTlh6i+NhvPQ==
=Th8u
-----END PGP SIGNATURE-----

--------------uAmlTggyraC4CH80Etu6Bd0A--

