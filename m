Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB122A5ECB7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 08:19:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911266.1317717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscq6-0004H4-P5; Thu, 13 Mar 2025 07:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911266.1317717; Thu, 13 Mar 2025 07:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tscq6-0004Dv-L5; Thu, 13 Mar 2025 07:18:46 +0000
Received: by outflank-mailman (input) for mailman id 911266;
 Thu, 13 Mar 2025 07:18:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tscq5-0004Dp-2z
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 07:18:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 640df40e-ffdb-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 08:18:41 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B69271F388;
 Thu, 13 Mar 2025 07:18:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72A0A137BA;
 Thu, 13 Mar 2025 07:18:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lcL+GdCG0mdMEAAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Mar 2025 07:18:40 +0000
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
X-Inumbo-ID: 640df40e-ffdb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741850321; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZoHa1Ll3eTqXgoLkmXIBafMx+ksC4nZCkggDQuQ7HM=;
	b=EFEbdoaevNwgpFoIQaNmOi827iDt3oHBEU1Vkjj30Ox5QDWycVxjlXZiI7slY6cKKkzJsa
	ooumgNlxQsi1LZhwsQtx1QevCYnzv2MuqeLWMdhboVmYeGTUU/VDz1jMJKCGhwVOOgDjDS
	+AsbiLzG+HGRuc4c1dGz4a48ytkzWE0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1741850320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZoHa1Ll3eTqXgoLkmXIBafMx+ksC4nZCkggDQuQ7HM=;
	b=h2diK1LYTAGWXtqwXbnbicc3W6DKD0hHkCCtyK7gypUnkSc9HEU0oQC6lOV22jcYHddHmb
	RDcCrSql1HzjYKJ2Tgmw7bQoyPancFzD5mkaqa/+x6pydpM508TFe+YRqGlOcFWXugGWaz
	A6U2HerIb5aRu05Wt5mSSah71wNBOgg=
Message-ID: <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
Date: Thu, 13 Mar 2025 08:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Discussion on unexpected behavior of ARINC653 scheduler
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
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
In-Reply-To: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dRXv3MgvTM6KB8Yie918mwHH"
X-Spam-Score: -5.19
X-Spamd-Result: default: False [-5.19 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-0.99)[-0.991];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain,text/x-patch];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:+,5:~,6:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dRXv3MgvTM6KB8Yie918mwHH
Content-Type: multipart/mixed; boundary="------------a2aNnbxQLzM3HvGlpF7R1eyf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "nathan.studer@dornerworks.com" <nathan.studer@dornerworks.com>,
 "stewart@stew.dk" <stewart@stew.dk>,
 "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>,
 "Whitehead (US), Joshua C" <joshua.c.whitehead@boeing.com>
Message-ID: <714d1f40-d627-4d70-b8a6-5e9a13025c32@suse.com>
Subject: Re: Discussion on unexpected behavior of ARINC653 scheduler
References: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <BN0P110MB214836659525A1FEB86C407C90D3A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>

--------------a2aNnbxQLzM3HvGlpF7R1eyf
Content-Type: multipart/mixed; boundary="------------9kNQ0uz42ElHo48kEgoPbbig"

--------------9kNQ0uz42ElHo48kEgoPbbig
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjUgMDc6NTEsIENob2ksIEFuZGVyc29uIHdyb3RlOg0KPiBXZSBhcmUgb2Jz
ZXJ2aW5nIGFuIGluY29ycmVjdCBvciB1bmV4cGVjdGVkIGJlaGF2aW9yIHdpdGggQVJJTkM2
NTMgc2NoZWR1bGVyIHdoZW4gd2Ugc2V0IHVwIG11bHRpcGxlIEFSSU5DNjUzIENQVSBwb29s
cyBhbmQgYXNzaWduIGEgZGlmZmVyZW50IG51bWJlciBvZiBkb21haW5zIHRvIGVhY2ggQ1BV
IHBvb2wuDQoNCi4uLg0KDQo+IEl0IHNlZW1zIHRoZXJlJ3MgYSBjb3JuZXIgY29uZGl0aW9u
IGluIHVzaW5nIHRoZSBnbG9iYWwgdmFyaWFibGVzICJzY2hlZF9pbmRleCIgYW5kICJuZXh0
X3N3aXRjaF90aW1lIiB3aGVuIG11bHRpcGxlIEFSSU5DNjUzIGNwdXBvb2xzIGFyZSBydW5u
aW5nIG9uIGRpZmZlcmVudCBwaHlzaWNhbCBDUFVzDQo+IA0KPiBUaGUgdmFyaWFibGVzIHNj
aGVkX2luZGV4IGFuZCBuZXh0X3N3aXRjaF90aW1lIGFyZSBkZWZpbmVkIGFzIHN0YXRpYyBh
dCB4ZW4vY29tbW9uL3NjaGVkL2FyaW5jNjUzLmMgYXMgc2hvd24gYmVsb3cuDQo+IA0KPiBz
dGF0aWMgdm9pZCBjZl9jaGVjaw0KPiBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoDQo+ICAgICAg
Y29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLA0KPiAgICAgIHN0cnVjdCBzY2hlZF91bml0
ICpwcmV2LA0KPiAgICAgIHNfdGltZV90IG5vdywNCj4gICAgICBib29sIHRhc2tsZXRfd29y
a19zY2hlZHVsZWQpDQo+IHsNCj4gICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqbmV3X3Rhc2sg
PSBOVUxMOw0KPiAgICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2NoZWRfaW5kZXggPSAwOyAg
ICA8PT0NCj4gICAgICBzdGF0aWMgc190aW1lX3QgbmV4dF9zd2l0Y2hfdGltZTsgICAgICAg
PD09DQoNClRoYW5rcyBmb3IgdGhlIHJlcG9ydCENCg0KQ291bGQgeW91IHBsZWFzZSB2ZXJp
ZnkgdGhlIGF0dGFjaGVkIHBhdGNoIGlzIGZpeGluZyB5b3VyIHByb2JsZW0/DQoNCkFuZCBw
bGVhc2UgdGVsbCBtZSB3aGV0aGVyIGFkZGluZyB5b3UgYXMgIlJlcG9ydGVkLWJ5OiIgaXMg
ZmluZSB3aXRoIHlvdSENCg0KDQpKdWVyZ2VuDQo=
--------------9kNQ0uz42ElHo48kEgoPbbig
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-arinc653-to-not-use-variables-across-c.patch"
Content-Disposition: attachment;
 filename*0="0001-xen-sched-fix-arinc653-to-not-use-variables-across-c.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAyNzY2YWVhZjNjY2JlOWZlYzJjM2ZhYTZmZGUzMTRjZGE4OTFmMzRjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CkRhdGU6IFRodSwgMTMgTWFyIDIwMjUgMDg6MTI6MDAgKzAxMDAKU3ViamVjdDogW1BBVENI
XSB4ZW4vc2NoZWQ6IGZpeCBhcmluYzY1MyB0byBub3QgdXNlIHZhcmlhYmxlcyBhY3Jvc3Mg
Y3B1cG9vbHMKCmE2NTNzY2hlZF9kb19zY2hlZHVsZSgpIGlzIHVzaW5nIHR3byBmdW5jdGlv
biBsb2NhbCBzdGF0aWMgdmFyaWFibGVzLAp3aGljaCBpcyByZXN1bHRpbmcgaW4gYmFkIGJl
aGF2aW9yIHdoZW4gdXNpbmcgbW9yZSB0aGFuIG9uZSBjcHVwb29sCndpdGggdGhlIGFyaW5j
NjUzIHNjaGVkdWxlci4KCkZpeCB0aGF0IGJ5IG1vdmluZyB0aG9zZSB2YXJpYWJsZXMgdG8g
dGhlIHNjaGVkdWxlciBwcml2YXRlIGRhdGEuCgpGaXhlczogMjI3ODdmMmUxMDdjICgiQVJJ
TkMgNjUzIHNjaGVkdWxlciIpClJlcG9ydGVkLWJ5OiBDaG9pLCBBbmRlcnNvbiA8QW5kZXJz
b24uQ2hvaUBib2VpbmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jIHwgMzEgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWQvYXJpbmM2NTMuYyBiL3hlbi9jb21tb24vc2NoZWQvYXJpbmM2NTMuYwppbmRleCBhODJj
MGQ3MzE0Li45ZWJhZTZkN2FlIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkL2FyaW5j
NjUzLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9hcmluYzY1My5jCkBAIC0xNDMsNiArMTQz
LDEyIEBAIHR5cGVkZWYgc3RydWN0IGE2NTNzY2hlZF9wcml2X3MKICAgICAgKiBwb2ludGVy
cyB0byBhbGwgWGVuIFVOSVQgc3RydWN0dXJlcyBmb3IgaXRlcmF0aW5nIHRocm91Z2gKICAg
ICAgKi8KICAgICBzdHJ1Y3QgbGlzdF9oZWFkIHVuaXRfbGlzdDsKKworICAgIC8qKgorICAg
ICAqIHNjaGVkdWxpbmcgaG91c2Uga2VlcGluZyB2YXJpYWJsZXMKKyAgICAgKi8KKyAgICB1
bnNpZ25lZCBpbnQgc2NoZWRfaW5kZXg7CisgICAgc190aW1lX3QgbmV4dF9zd2l0Y2hfdGlt
ZTsKIH0gYTY1M3NjaGVkX3ByaXZfdDsKIAogLyoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCkBAIC01
MTMsOCArNTE5LDYgQEAgYTY1M3NjaGVkX2RvX3NjaGVkdWxlKAogICAgIGJvb2wgdGFza2xl
dF93b3JrX3NjaGVkdWxlZCkKIHsKICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqbmV3X3Rhc2sg
PSBOVUxMOwotICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2NoZWRfaW5kZXggPSAwOwotICAg
IHN0YXRpYyBzX3RpbWVfdCBuZXh0X3N3aXRjaF90aW1lOwogICAgIGE2NTNzY2hlZF9wcml2
X3QgKnNjaGVkX3ByaXYgPSBTQ0hFRF9QUklWKG9wcyk7CiAgICAgY29uc3QgdW5zaWduZWQg
aW50IGNwdSA9IHNjaGVkX2dldF9yZXNvdXJjZV9jcHUoc21wX3Byb2Nlc3Nvcl9pZCgpKTsK
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwpAQCAtNTI4LDE4ICs1MzIsMTkgQEAgYTY1M3Nj
aGVkX2RvX3NjaGVkdWxlKAogICAgICAgICAvKiB0aW1lIHRvIGVudGVyIGEgbmV3IG1ham9y
IGZyYW1lCiAgICAgICAgICAqIHRoZSBmaXJzdCB0aW1lIHRoaXMgZnVuY3Rpb24gaXMgY2Fs
bGVkLCB0aGlzIHdpbGwgYmUgdHJ1ZSAqLwogICAgICAgICAvKiBzdGFydCB3aXRoIHRoZSBm
aXJzdCBkb21haW4gaW4gdGhlIHNjaGVkdWxlICovCi0gICAgICAgIHNjaGVkX2luZGV4ID0g
MDsKKyAgICAgICAgc2NoZWRfcHJpdi0+c2NoZWRfaW5kZXggPSAwOwogICAgICAgICBzY2hl
ZF9wcml2LT5uZXh0X21ham9yX2ZyYW1lID0gbm93ICsgc2NoZWRfcHJpdi0+bWFqb3JfZnJh
bWU7Ci0gICAgICAgIG5leHRfc3dpdGNoX3RpbWUgPSBub3cgKyBzY2hlZF9wcml2LT5zY2hl
ZHVsZVswXS5ydW50aW1lOworICAgICAgICBzY2hlZF9wcml2LT5uZXh0X3N3aXRjaF90aW1l
ID0gbm93ICsgc2NoZWRfcHJpdi0+c2NoZWR1bGVbMF0ucnVudGltZTsKICAgICB9CiAgICAg
ZWxzZQogICAgIHsKLSAgICAgICAgd2hpbGUgKCAobm93ID49IG5leHRfc3dpdGNoX3RpbWUp
Ci0gICAgICAgICAgICAgICAgJiYgKHNjaGVkX2luZGV4IDwgc2NoZWRfcHJpdi0+bnVtX3Nj
aGVkdWxlX2VudHJpZXMpICkKKyAgICAgICAgd2hpbGUgKCAobm93ID49IHNjaGVkX3ByaXYt
Pm5leHRfc3dpdGNoX3RpbWUpICYmCisgICAgICAgICAgICAgICAgKHNjaGVkX3ByaXYtPnNj
aGVkX2luZGV4IDwgc2NoZWRfcHJpdi0+bnVtX3NjaGVkdWxlX2VudHJpZXMpICkKICAgICAg
ICAgewogICAgICAgICAgICAgLyogdGltZSB0byBzd2l0Y2ggdG8gdGhlIG5leHQgZG9tYWlu
IGluIHRoaXMgbWFqb3IgZnJhbWUgKi8KLSAgICAgICAgICAgIHNjaGVkX2luZGV4Kys7Ci0g
ICAgICAgICAgICBuZXh0X3N3aXRjaF90aW1lICs9IHNjaGVkX3ByaXYtPnNjaGVkdWxlW3Nj
aGVkX2luZGV4XS5ydW50aW1lOworICAgICAgICAgICAgc2NoZWRfcHJpdi0+c2NoZWRfaW5k
ZXgrKzsKKyAgICAgICAgICAgIHNjaGVkX3ByaXYtPm5leHRfc3dpdGNoX3RpbWUgKz0KKyAg
ICAgICAgICAgICAgICBzY2hlZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9wcml2LT5zY2hlZF9p
bmRleF0ucnVudGltZTsKICAgICAgICAgfQogICAgIH0KIApAQCAtNTQ3LDggKzU1Miw4IEBA
IGE2NTNzY2hlZF9kb19zY2hlZHVsZSgKICAgICAgKiBJZiB3ZSBleGhhdXN0ZWQgdGhlIGRv
bWFpbnMgaW4gdGhlIHNjaGVkdWxlIGFuZCBzdGlsbCBoYXZlIHRpbWUgbGVmdAogICAgICAq
IGluIHRoZSBtYWpvciBmcmFtZSB0aGVuIHN3aXRjaCBuZXh0IGF0IHRoZSBuZXh0IG1ham9y
IGZyYW1lLgogICAgICAqLwotICAgIGlmICggc2NoZWRfaW5kZXggPj0gc2NoZWRfcHJpdi0+
bnVtX3NjaGVkdWxlX2VudHJpZXMgKQotICAgICAgICBuZXh0X3N3aXRjaF90aW1lID0gc2No
ZWRfcHJpdi0+bmV4dF9tYWpvcl9mcmFtZTsKKyAgICBpZiAoIHNjaGVkX3ByaXYtPnNjaGVk
X2luZGV4ID49IHNjaGVkX3ByaXYtPm51bV9zY2hlZHVsZV9lbnRyaWVzICkKKyAgICAgICAg
c2NoZWRfcHJpdi0+bmV4dF9zd2l0Y2hfdGltZSA9IHNjaGVkX3ByaXYtPm5leHRfbWFqb3Jf
ZnJhbWU7CiAKICAgICAvKgogICAgICAqIElmIHRoZXJlIGFyZSBtb3JlIGRvbWFpbnMgdG8g
cnVuIGluIHRoZSBjdXJyZW50IG1ham9yIGZyYW1lLCBzZXQKQEAgLTU1Niw4ICs1NjEsOCBA
QCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAgICAgICogT3RoZXJ3aXNlLCBzZXQgbmV3X3Rh
c2sgZXF1YWwgdG8gdGhlIGFkZHJlc3Mgb2YgdGhlIGlkbGUgdGFzaydzCiAgICAgICogc2No
ZWRfdW5pdCBzdHJ1Y3R1cmUuCiAgICAgICovCi0gICAgbmV3X3Rhc2sgPSAoc2NoZWRfaW5k
ZXggPCBzY2hlZF9wcml2LT5udW1fc2NoZWR1bGVfZW50cmllcykKLSAgICAgICAgPyBzY2hl
ZF9wcml2LT5zY2hlZHVsZVtzY2hlZF9pbmRleF0udW5pdAorICAgIG5ld190YXNrID0gKHNj
aGVkX3ByaXYtPnNjaGVkX2luZGV4IDwgc2NoZWRfcHJpdi0+bnVtX3NjaGVkdWxlX2VudHJp
ZXMpCisgICAgICAgID8gc2NoZWRfcHJpdi0+c2NoZWR1bGVbc2NoZWRfcHJpdi0+c2NoZWRf
aW5kZXhdLnVuaXQKICAgICAgICAgOiBJRExFVEFTSyhjcHUpOwogCiAgICAgLyogQ2hlY2sg
dG8gc2VlIGlmIHRoZSBuZXcgdGFzayBjYW4gYmUgcnVuIChhd2FrZSAmIHJ1bm5hYmxlKS4g
Ki8KQEAgLTU4OSw3ICs1OTQsNyBAQCBhNjUzc2NoZWRfZG9fc2NoZWR1bGUoCiAgICAgICog
UmV0dXJuIHRoZSBhbW91bnQgb2YgdGltZSB0aGUgbmV4dCBkb21haW4gaGFzIHRvIHJ1biBh
bmQgdGhlIGFkZHJlc3MKICAgICAgKiBvZiB0aGUgc2VsZWN0ZWQgdGFzaydzIFVOSVQgc3Ry
dWN0dXJlLgogICAgICAqLwotICAgIHByZXYtPm5leHRfdGltZSA9IG5leHRfc3dpdGNoX3Rp
bWUgLSBub3c7CisgICAgcHJldi0+bmV4dF90aW1lID0gc2NoZWRfcHJpdi0+bmV4dF9zd2l0
Y2hfdGltZSAtIG5vdzsKICAgICBwcmV2LT5uZXh0X3Rhc2sgPSBuZXdfdGFzazsKICAgICBu
ZXdfdGFzay0+bWlncmF0ZWQgPSBmYWxzZTsKIAotLSAKMi40My4wCgo=
--------------9kNQ0uz42ElHo48kEgoPbbig
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9kNQ0uz42ElHo48kEgoPbbig--

--------------a2aNnbxQLzM3HvGlpF7R1eyf--

--------------dRXv3MgvTM6KB8Yie918mwHH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfShs8FAwAAAAAACgkQsN6d1ii/Ey9o
tgf/f+0+ynSS9CkQe8AUWVMjxEWHygAnjXGt4lOZ6K4Iftxa4xLVH2pJmdByHiCsbiNCibhmaZYn
z32k5pSq+EYKTubok00Gt0DNx6hW2bGj2ZDc0wLiqLrZQXcGURYJC5CRO7abIaarV61mXeSeiD2q
ucbbCj/LAZfUnXrUOOS2dT746oVkpM9VdIYhdvCWh5uSIiwq54+GINVXAApAPQOpcNnW0zH0wRqn
2Rw/dwYZRV4poYIuBY0q2mizMuxIGuVzfQ+h8y3ksT7yYQPYO/36EszXXsCI36ijfwfXBeElxGu/
UBk+jnUhfD0SsReo+9RoGo5pqNG/iiv/fnv3q9wQ9Q==
=n+v9
-----END PGP SIGNATURE-----

--------------dRXv3MgvTM6KB8Yie918mwHH--

