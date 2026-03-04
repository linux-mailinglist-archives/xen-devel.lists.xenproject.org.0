Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJGIN9JDqGnPrwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:38:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62380201AD5
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245500.1544874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnMQ-00017H-3c; Wed, 04 Mar 2026 14:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245500.1544874; Wed, 04 Mar 2026 14:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnMP-000157-Vg; Wed, 04 Mar 2026 14:38:01 +0000
Received: by outflank-mailman (input) for mailman id 1245500;
 Wed, 04 Mar 2026 14:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=03ok=BE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vxnMO-0000VJ-L3
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:38:00 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bdd922b6-17d7-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:37:59 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3870df2331aso53206541fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:37:59 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a12356fe34sm1311356e87.90.2026.03.04.06.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 06:37:58 -0800 (PST)
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
X-Inumbo-ID: bdd922b6-17d7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772635079; x=1773239879; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SPBavIlOJuGgmLzdF/KYwcRkviDTPiwIMqjlJYlICSI=;
        b=Kc19yjP34vtkkHcjjDok4PefWeuKxZKk7yuPtph/pfizD3UNTgr7/XeHrM8V71Wd2H
         LNaH57/pxe+z6hZPuXOn8tNT43nAxils9FWTqWftYIL6QqyVhsx6sOIPi7FOg/UxFLiB
         LVSyVBD6L25t3wcIDwa6OGm+JcxRzJsDBvOkKtqqpnR3rWBCHEe9BA2jVWsr1qtwtgjq
         sAl13gx6ymGpq1miqJZbu9mmRTn0kplxwvoPI4dJ8lack12xSk0sb81W8iirRVKAVWyG
         xEfOsyshSfF27pzyNSU0cf1dTNbg5ZEyxaBp67Wnmxik810eS3BRGKxZ+Oxhfvv5ewoX
         HPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635079; x=1773239879;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPBavIlOJuGgmLzdF/KYwcRkviDTPiwIMqjlJYlICSI=;
        b=uH+PygF3Hb0Xl1KseNEp+DgNZumPgaJ7pOwCFsN/eIAwb5iGdFaqIiQlGN9ZX5XTgR
         o/A+aAoY/U0TIwJZN3TNlQ5H7A3MP9+oHF3eyUG0jwTsjM05B+opa1+TX+vyGy0Naczq
         Edr1ayWz7xlUchlZL+4IJ9Qz3q0jwCVc2p8ECOPbxVpQsr33MbzS88QhbjQciYeyHQqk
         4GI4be1ZELQn4FOL0JZ3D3d49PJ/+abMtbv3O7RGtuSrPGun6UNTGeXeHeTiPg1AZ1JH
         vmnxcqjxfMDXYT+mpsfjEqzCloTws3Cc7aaEP7f0Dtv+kMO8nYRdvDSJEtZnqqQ3iG4n
         jAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqQEElXuTd7esJAbWHCXuCkvcwueJxdI25yMnJOjOm6cfuOmbIBtqmfG7L4bMRHogK7714s06G2cc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1a1o23K2rDos4EYK8vvGsx7sI0BZm6MEUNZZMuC9/ZffnMfRx
	H8vW5xLgczCqzb8USWnGEbKEpfCnHxT64/v7aT2DoZFtruasE4VRHWLMikIeYRyW8OQ=
X-Gm-Gg: ATEYQzz/usv4E2cezLH+cWgZYIwvc8JgzgrBW6csAdCZvZFNjQ0UuiSfL+szU5/nIzX
	imuSmyyn9K/3vRiF9UXvUeuzWr550eJkFq/1JKkn/HYheurFYZyQqFkVIh28/HqQOXsaIA5IGNE
	Jwn42BLXpfXvc7HvywWyuuy6KvuqIHyn3ibCY7HfOt9OCQt+ofDQBwgj5X6sZgjsQ48yI/Fvdyo
	V+puMDLA9vlsdnogpXF2VDP3QyvoSgOG0pvzrnk6CmV63p4P8z4M3Mddmsnscz8NVhbaqjkzkFd
	RT0xIXbqaE3e39tAQJ9IuaBONM0mlDXaQHSyB2us0xszga4S89B13m5W4UIvq9Zab57aJSS+ea2
	jx6d07vTSLpfs4Viyv+p8gExMj0nxMZ3vND+oy3QHAcW6qjXkWevWJCb1wTuk783elY8KuaUn6R
	p/qU5qjSBKUUWXLcxe4S3q4sSw2Rn8EYn0Ldh3NlivlJ32vBuUX9KLWc1Ea7TcUKiCGoL/xDBCU
	ECR2DARv+XKtbbH3o8RoHM2NBgEBEITQDWYsrsWLVgVeKzsKWDTfA==
X-Received: by 2002:a05:651c:1a0e:b0:385:bb35:8e45 with SMTP id 38308e7fff4ca-38a1c396502mr54586441fa.6.1772635078965;
        Wed, 04 Mar 2026 06:37:58 -0800 (PST)
Message-ID: <ad2888d8-bfe5-4023-8345-ddd14f2b7fc8@suse.com>
Date: Wed, 4 Mar 2026 15:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the xen-tip tree
To: Mark Brown <broonie@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aahBPzflrEJ2FPx0@sirena.org.uk>
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
In-Reply-To: <aahBPzflrEJ2FPx0@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MR3f0SlHc2G7IOdpGbtDawDC"
X-Rspamd-Queue-Id: 62380201AD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,oracle.com,lists.xenproject.org,antgroup.com,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:konrad.wilk@oracle.com,m:sstabellini@kernel.org,m:boris.ostrovsky@oracle.com,m:xen-devel@lists.xenproject.org,m:houwenlong.hwl@antgroup.com,m:alexdeucher@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MR3f0SlHc2G7IOdpGbtDawDC
Content-Type: multipart/mixed; boundary="------------spju9nddGZXaQtmFSclTQWb0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mark Brown <broonie@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <ad2888d8-bfe5-4023-8345-ddd14f2b7fc8@suse.com>
Subject: Re: linux-next: build failure after merge of the xen-tip tree
References: <aahBPzflrEJ2FPx0@sirena.org.uk>
In-Reply-To: <aahBPzflrEJ2FPx0@sirena.org.uk>

--------------spju9nddGZXaQtmFSclTQWb0
Content-Type: multipart/mixed; boundary="------------uhsS8v2VuZHBS4FiEW6X2uyo"

--------------uhsS8v2VuZHBS4FiEW6X2uyo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDMuMjYgMTU6MjcsIE1hcmsgQnJvd24gd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+
IEFmdGVyIG1lcmdpbmcgdGhlIHhlbi10aXAgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1
aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC90bXAvbmV4dC9idWlsZC9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjX3R5cGVzLmg6MzgsDQo+ICAgICAgICAgICAg
ICAgICAgIGZyb20gL3RtcC9uZXh0L2J1aWxkL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
Ly4uL2Rpc3BsYXkvZGMvZG1fc2VydmljZXNfdHlwZXMuaDozMCwNCj4gICAgICAgICAgICAg
ICAgICAgZnJvbSAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vaW5jbHVkZS9kbV9wcF9pbnRlcmZhY2UuaDoyNiwNCj4gICAgICAgICAgICAgICAgICAg
ZnJvbSAvdG1wL25leHQvYnVpbGQvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
Lmg6NTYsDQo+ICAgICAgICAgICAgICAgICAgIGZyb20gL3RtcC9uZXh0L2J1aWxkL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2NydGMuYzoyOToNCj4gL3RtcC9uZXh0
L2J1aWxkL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNfaHdf
dHlwZXMuaDoyMjE6NjogZXJyb3I6ICdwaXhlbF9mb3JtYXQnIGRlZmluZWQgYXMgd3Jvbmcg
a2luZCBvZiB0YWcNCj4gICAgMjIxIHwgZW51bSBwaXhlbF9mb3JtYXQgew0KPiAgICAgICAg
fCAgICAgIF5+fn5+fn5+fn5+fg0KPiANCj4gQ2F1c2VkIChJIHRoaW5rKSBieSBjb21taXQN
Cj4gDQo+ICAgIDRlMDVhMDhjNmYzZjMgKEFDUEksIHg4Ni9ib290OiBSZW1vdmUge3NldHxn
ZXR9X3Jvb3RfcG9pbnRlcigpIEFDUEkgY2FsbGJhY2tzKQ0KPiANCj4gd2hpY2ggY2hhbmdl
cyB0aGUgaW5jbHVzaW9ucyBhbmQgSSB0aGluayB0cmlnZ2VycyBuYW1lc3BhY2UgY2xhc2hl
cyB3aXRoDQo+IHRoZSB1bm5hbWVzcGFjZWQgcGl4ZWxfZm9ybWF0LiAgSSd2ZSB1c2VkIHRo
ZSB0cmVlIGZyb20gbmV4dC0yMDI2MDMwMw0KPiBpbnN0ZWFkIGJ1dCByZWFsbHkgdGhlIGZp
eCBoZXJlIGlzIHRoYXQgYW1kZ3B1IGFuZCBvdGhlciB0aGluZ3MgZGVmaW5pbmcNCj4gYSBw
aXhlbF9mb3JtYXQgc2hvdWxkIG5hbWVzcGFjZSB0aGluZ3MsIEknbGwgY29uc2lkZXIgaWYg
YSByZXZlcnQgaXMNCj4gbW9yZSBzZW5zaWJsZS4NCg0KRm9yIG5vdyBJIGhhdmUgcmVtb3Zl
ZCA0ZTA1YTA4YzZmM2YzIGZyb20gdGhlIFhlbiB0cmVlLg0KDQoNCkp1ZXJnZW4NCg==
--------------uhsS8v2VuZHBS4FiEW6X2uyo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------uhsS8v2VuZHBS4FiEW6X2uyo--

--------------spju9nddGZXaQtmFSclTQWb0--

--------------MR3f0SlHc2G7IOdpGbtDawDC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmoQ8UFAwAAAAAACgkQsN6d1ii/Ey8j
iwf9EhHkYnpCpah7/uRgLGp3oAC4dlcgZZesNEP3m5ECqYFxJnenRr1suZlRqubQ+2Mz2v1GoIxc
kUwiAVyXVfY7TrGVYMKyxQ+fCRgE/3Rew+dRA4HCsntCjhvhs5tfAGnX79PgW8+MNOFu5PA3ybrX
lycczmMT1aQ4zztc5S23Oo+lTxrzkCzNxNN2mbrUfOxcWkjUdGlX3arhr6b/n/LXFH1+vIYXRPdl
oMQgcnPKTPVsYveeMNXgwpGw8cPvnnlH74L2of/Iqrnzn3pkl+iVVDrIbs/Tuyu3U/H40A7vTAzw
OHb7e+Q3608DDzV7QujMddqPT5k6xrFTp0uIMFxsZw==
=rAvw
-----END PGP SIGNATURE-----

--------------MR3f0SlHc2G7IOdpGbtDawDC--

