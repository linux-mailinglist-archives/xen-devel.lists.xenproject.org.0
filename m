Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCbtCofXu2k6pAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:01:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA252C9E61
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256950.1551418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3B7o-0002O9-92; Thu, 19 Mar 2026 11:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256950.1551418; Thu, 19 Mar 2026 11:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3B7o-0002Ls-6D; Thu, 19 Mar 2026 11:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1256950;
 Thu, 19 Mar 2026 11:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3B7m-0002Lf-Ga
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 11:01:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eeea5bfe-2382-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 12:01:08 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so106329666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 04:01:08 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b97f13edad8sm409503366b.6.2026.03.19.04.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 04:01:07 -0700 (PDT)
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
X-Inumbo-ID: eeea5bfe-2382-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773918068; x=1774522868; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nHOCizN5DbSZeHTb8WFC3vQPqxtTw6p89m26bd8GNIA=;
        b=ZKBkuSpFs33tgtm2VRKz2mOndCwdbpHIOSGN8Gw+/bfuFiMHr9o4qsbCUsfl+1z7o5
         JLDtSwF17v/UrErXqZ48D8ldU02T33SPXERGzZF3cGB3o9OQGDhgTADZBagUpdS0vSyB
         D5y/lGarhxtLkbqald9CRHtsR28aqwFo4fiKbnJEdlEAfgpvyljotNjE4N5Cu1EpLKo1
         IN5MH+42woyKGxaigOW6uTJaV5QQCNsOMqYk3G0lmoYQNaTtOtlFMRuMCAV3v7BDak1B
         IfsYEVqSxNlqpvbPJQz+mqDOJh+/HhqIyYn+SQfwCvw6vwJ8w/vXHwUTIm/+rocNI17W
         z+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918068; x=1774522868;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHOCizN5DbSZeHTb8WFC3vQPqxtTw6p89m26bd8GNIA=;
        b=LnPl1+N1fGjAufYq4zmDA0x9zQdAUtxg3szlsSE/aN1RAR1pGcWVFSRJuSqVvOzPEK
         zDGMWsz0dBtUxwTqAzxFVvPoG31LDRu33Hanc3WZwZk0HNqECFxbrPo4gv4Dh8SLUROu
         UAdGjpub+4Op/1T/5kvhRV6YzOiiijQPb7DFjWbItsca+fIv0GD1t/zcz7E6Tod/eLQ1
         sF9jaYZ74xLVzcctVcgZR0gnql9BFxp8Htv/9ePuVRkFCoQE0IG2j3N8A5bLS4ZfZMop
         65exW2Mq6e0rgMFPB2DlEAC5ArYvrGXSl6m1/8650QK23XwaDKbwquZ99LuUNtNdoQNT
         2Z9g==
X-Gm-Message-State: AOJu0YwxzpNTb1bJBsdrxHRSlsIflwFMJgibad28scIFY6Uu8aZIBprz
	JOszhHcONuzU4zW/XnqH1n76bUDzk3OfpjqpsjxASgbOxBx1xInrQhYfb1DICT1KHqM=
X-Gm-Gg: ATEYQzw4EEekmzu2IcLEDlfedyDw4Md1+JhSYyCJaMKBnFRM28kYyRzuZZIyVJjMxaq
	HgyvfubODDyLyUvaUJGz87EQC8jKw2qHdro8FqvKuA6dc6faUDD1oSU3LI5mmP01IzyKJuixR2m
	b7wVYwh4K5lSzrlLAZmJVDBLwURF4uy4vwx868mwtNYois9zScD/1i0lGzL3GcqYTeaRP7oNZ4f
	yetPto7/woOBBtCzMzsbcEDr1Dn+ukw5ZRqCw15QyNz7tcsdYz66Wz837N+LL+fyPnlUrnTNIOz
	90Xgn6kfX0KKGSpJvszTghxu9dGEUTzjQFSFgDHD+VYSgq3c9mI5XdEGXQnB0cdCFC2mWJZY//j
	VJkfaHyAiPorxiE8hrbMffIg6kF1YnKiDJ5Vb1Pmt20IaEOW6MDoc9qgC2J7xnoJssWHuYX8L81
	JvWGgsYBUkURBc1kSEBsNWpmCNMRdvLRha/Yp9wyzU7nX33EG3XAjUkLI0bcSFqN8fPWT9RkaBp
	i/5f5fviH+C/1EA63pOLTjSY4CHScJoAQREqi3FJehPRe3JDQCPmQ==
X-Received: by 2002:a17:907:7b94:b0:b97:c431:b029 with SMTP id a640c23a62f3a-b97f4b70e45mr409536966b.57.1773918067710;
        Thu, 19 Mar 2026 04:01:07 -0700 (PDT)
Message-ID: <1ed6d9bf-31cf-4c9f-becf-ce885c085c13@suse.com>
Date: Thu, 19 Mar 2026 12:01:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] tools/libxl: add support for xenstore quota in
 domain_config
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>,
 George Dunlap <gwd@xenproject.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-10-jgross@suse.com> <abvBXjUXfHHJTE29@l14>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <abvBXjUXfHHJTE29@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KeMfeV9AsayVDSgNuhrnEDgU"
X-Spamd-Result: default: False [-1.46 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.63)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:enr0n@ubuntu.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 8AA252C9E61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KeMfeV9AsayVDSgNuhrnEDgU
Content-Type: multipart/mixed; boundary="------------qMjCBxZNU0lxSl2Z4mtrgI0J";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>,
 George Dunlap <gwd@xenproject.org>
Message-ID: <1ed6d9bf-31cf-4c9f-becf-ce885c085c13@suse.com>
Subject: Re: [PATCH 09/11] tools/libxl: add support for xenstore quota in
 domain_config
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-10-jgross@suse.com> <abvBXjUXfHHJTE29@l14>
In-Reply-To: <abvBXjUXfHHJTE29@l14>

--------------qMjCBxZNU0lxSl2Z4mtrgI0J
Content-Type: multipart/mixed; boundary="------------02ZKOvjdOD0ui7Mar9fm1Ij2"

--------------02ZKOvjdOD0ui7Mar9fm1Ij2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMTA6MjYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MjowNlBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfZG9tYWluLmMgYi90b29s
cy9saWJzL2xpZ2h0L2xpYnhsX2RvbWFpbi5jDQo+PiBpbmRleCA1YmU0N2Y2ODdmLi44NmU0
M2U3MTMzIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb21haW4u
Yw0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9kb21haW4uYw0KPj4gQEAgLTI1
MzMsNiArMjUzMywxNiBAQCBzdGF0aWMgdm9pZCByZXRyaWV2ZV9kb21haW5fY29uZmlndXJh
dGlvbl9lbmQobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH0N
Cj4+ICAgDQo+PiArICAgIC8qIFhlbnN0b3JlIHF1b3RhICovDQo+PiArICAgIHsNCj4+ICsg
ICAgICAgIGxpYnhsX3hzX3F1b3RhX3NldF9kaXNwb3NlKCZkX2NvbmZpZy0+Yl9pbmZvLnhl
bnN0b3JlX3F1b3RhKTsNCj4+ICsgICAgICAgIHJjID0gbGlieGxfeHNxdW90YV9kb21haW5f
Z2V0KENUWCwgZG9taWQsICZkX2NvbmZpZy0+Yl9pbmZvLnhlbnN0b3JlX3F1b3RhKTsNCj4+
ICsgICAgICAgIGlmIChyYykgew0KPj4gKyAgICAgICAgICAgIExPR0QoRVJST1IsIGRvbWlk
LCAiRmFpbCB0byBnZXQgeGVuc3RvcmUgcXVvdGEiKTsNCj4gDQo+IEl0IHdvdWxkIGJlIHVz
ZWZ1bCB0byBwcmludCAiZXJybm8iIHdpdGggTE9HRUQsIHJpZ2h0Pw0KDQpPa2F5Lg0KDQo+
IA0KPj4gKyAgICAgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9
DQo+PiArDQo+PiAgICAgICAvKiBEZXZpY2VzOiBkaXNrLCBuaWMsIHZ0cG0sIHBjaWRldiBl
dGMuICovDQo+PiAgIA0KPj4gICAgICAgLyogVGhlIE1FUkdFIG1hY3JvIGltcGxlbWVudHMg
Zm9sbG93aW5nIGxvZ2ljOg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGli
eGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF90eXBlcy5pZGwNCj4+IGlu
ZGV4IGM1ZGRjNDBmMzUuLmVlOGY4OWU0NjIgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJz
L2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4
bF90eXBlcy5pZGwNCj4+IEBAIC03NjAsNiArNzYwLDcgQEAgbGlieGxfZG9tYWluX2J1aWxk
X2luZm8gPSBTdHJ1Y3QoImRvbWFpbl9idWlsZF9pbmZvIixbDQo+PiAgICAgICAoInZwbXUi
LCBsaWJ4bF9kZWZib29sKSwNCj4+ICAgICAgICgidHJhcF91bm1hcHBlZF9hY2Nlc3NlcyIs
IGxpYnhsX2RlZmJvb2wpLA0KPj4gICAgICAgKCJ4ZW5zdG9yZV9mZWF0dXJlX21hc2siLCB1
aW50MzIsIHsnaW5pdF92YWwnOiAnfjBVJ30pLA0KPj4gKyAgICAoInhlbnN0b3JlX3F1b3Rh
IiwgbGlieGxfeHNfcXVvdGFfc2V0KSwNCj4gDQo+IFRoaXMgd291bGQgZGVzZXJ2ZSBhIG5l
dyBMSUJYTF9IQVZFXyBtYWNybywgb3IgYSBtZW50aW9uIGFib3V0IHRoZSBuZXcNCj4gZmll
bGQgaW4gdGhlIG1hY3JvIGFkZGVkIGluIHRoZSBwcmV2aW91cyBwYXRjaC4NCg0KSSdsbCBk
byB0aGUgbGF0dGVyLg0KDQoNClRoYW5rcywNCg0KSnVlcmdlbg0K
--------------02ZKOvjdOD0ui7Mar9fm1Ij2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------02ZKOvjdOD0ui7Mar9fm1Ij2--

--------------qMjCBxZNU0lxSl2Z4mtrgI0J--

--------------KeMfeV9AsayVDSgNuhrnEDgU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm713IFAwAAAAAACgkQsN6d1ii/Ey8G
fwf/RGzYBDZb8OM4HShKDPLhm0WtRuaOG9NS8Q4s6nXaz2FEFuvAnwWcVwmHWB2fPlJdyW2udS5L
oU37e1ZZ1xSkJr7wyk2JFi4mm+3uZORjvcmS1sejwYW5QwUoXJKizz+72txCD8uqSHak5wBcqaGV
AioJnMZ7GylkI4ibfK6+60XsOYgLfjE6QywwrMh67532XzjJRiAFYEHpnzHvmzYvlrDDDRAq17PG
kZKvJWv2HpjCp6XXXStTqrQTwMN7Pjw2vedgL7TWnI+GP4z7KjPMBeefkn6PGk+rvjNRTYHSVI0Y
p0hSL6TTNdrSx4AC9bPMr7e4Do/BdrV4/dLlQbHQjA==
=p7Jz
-----END PGP SIGNATURE-----

--------------KeMfeV9AsayVDSgNuhrnEDgU--

