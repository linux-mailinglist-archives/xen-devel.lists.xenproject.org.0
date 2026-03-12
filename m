Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNr9Hi7ksmnyQgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:05:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B327527F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:05:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252668.1549274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iWk-0006kv-SW; Thu, 12 Mar 2026 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252668.1549274; Thu, 12 Mar 2026 16:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0iWk-0006i6-Ph; Thu, 12 Mar 2026 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1252668;
 Thu, 12 Mar 2026 16:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0iWj-0006hw-4D
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:04:45 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f18a723-1e2d-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:04:43 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b955351e0a6so199039766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:04:43 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b972e18e435sm147712266b.53.2026.03.12.09.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:04:42 -0700 (PDT)
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
X-Inumbo-ID: 2f18a723-1e2d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773331483; x=1773936283; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mnTCbE6w2dR+SRnkwLx4Eoq6Rfg4WwLEV71NK9c/aDQ=;
        b=M3upRXrROy0dIjA5yY2giq9lXwbpODwbS03zJTja2sPwQmC9jKcD0RzBJB0x87z+sk
         VHEh8drqsAFJ5/xksp3EKvdBu/JWRnHh03fbrpKuW8Kx01PGhKaVzr5KZeV4hkw7FvTB
         dWtmeLMclcv+KuPFRLsEOrnyixt6pzCLhFTT5PzVg5444gEceu3rwi8B3uWHPIBY9cMO
         PX7qeM6l58zXqWCR9XJ124XZrZN+yGuK39SMDrRVz9A3bxfH+FLKqm4jKoSBAqz+lhcQ
         bml6+ol2PGNGa4A4DT4yvuFYW68DpYqwrT4iuipyzUVI6ESwEPDDLdquZwjrf2U3Lbku
         0QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331483; x=1773936283;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnTCbE6w2dR+SRnkwLx4Eoq6Rfg4WwLEV71NK9c/aDQ=;
        b=ETnlIxSTDfKyb87w3LcDfRrzyysRC+hYxSGV+P2+hg9BX/PGeCyP3scg+u2yakaOft
         1CvBZupdE8hlyRoEmx+WspwaC9JnR9wgr4ID6bNggSRx4FStVgOK/mLb+NkbRx4a36Lj
         PF/5ykJg/iyEojVNcfwMTDPxvuPcFVyMCWkFmrRv90yZMmhOTIitX43dabUbyhFaCt7u
         nplX5jOgG3XH89r0MO7WhkCbUQ01bJqKrSMQT0f7Ktl6dFhL0g1XJigjXNcWUMOpanui
         NToWT8rkzUevmBVvuH7AoT3YgkVzrl5HuGb1WSyZPqemg1aufZn2dfH4Nw3jiT/n3ksr
         RcGA==
X-Forwarded-Encrypted: i=1; AJvYcCXQHI9fG+2sDxxlxVBU3NSG1ouyvsegv91PDN4VDMe6d53aCLZmRScktj77RCM6Gmd88BhS227ZzYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDL3JyUCmDYdX0WlX6cmDtHvfCIWlGBlPAMpjaUkitUCaBX0w8
	+kUvGB2EBLzNNelZkkORf/CXpyCRevr0pgsDCGeBCbZwN+KpmDPAtSeLyKL0J47mL+o=
X-Gm-Gg: ATEYQzw19ESlvyv+Oq4rEWQZ8XjOKn5ypcT4rwvDG742zrMzZPdLHftDmhNv/PvIbCg
	qkk7azQ9Kdvhaqn2h7Z+8+D97twdClnoyr3EjSy80v9NO4CogxwopINaIjRMaa71hzccl6r1r3x
	LaNb7l2oepsag1novJ0V4/tW8nwxF42y/tg0ePJGP5P5zUtmLHsoiStFHhQJXlTt+5CULZ51lXV
	YC6kiesbgGdcstf7VsveMkwpy+B+7oLynMYh2wuRJtSPo04vZbYqespWx7w/N4QxkUU4O+a80yt
	r6mnMdd1OSxJX+EIzn0r7Zx8VJ/2Fds1dwfr5XgItfaZreHdqoGov1sn7s2rEy3BL1606IES3lU
	eNdJfLXvIDCCRLxJRRTolEIAca7T5JtAwCSOgqe9XFRF6bUuNoOVqlkDtiOjlmWhiJup2u0sX9L
	tV/6cqjYQnuLFZWtSG0kXd3+R4OkufZ71NaVEsCB3XkHB+3yzWLjlCEwb+aPGUyQ0EbO1zqK3XS
	lTyRMFVf+RJajCEHTB1bowoKcv4oHaI3zuWtixQLpGGEJQIrImTQQ==
X-Received: by 2002:a17:907:3d4b:b0:b8e:3d49:25db with SMTP id a640c23a62f3a-b972e5ab6camr389440066b.54.1773331482912;
        Thu, 12 Mar 2026 09:04:42 -0700 (PDT)
Message-ID: <26fb3140-9731-42f0-8147-20f64e71ffdd@suse.com>
Date: Thu, 12 Mar 2026 17:04:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] tools/xs-clients: don't exit with error when using
 -h parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260312155102.2862824-1-jgross@suse.com>
 <20260312155102.2862824-7-jgross@suse.com>
 <6afc5c69-230c-460d-980e-2673434e6b4a@citrix.com>
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
In-Reply-To: <6afc5c69-230c-460d-980e-2673434e6b4a@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d4H1EdoiAF9YmsdRcpOJp6SF"
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E35B327527F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d4H1EdoiAF9YmsdRcpOJp6SF
Content-Type: multipart/mixed; boundary="------------00XGarkhZumGpgKFBBHlz4m3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <26fb3140-9731-42f0-8147-20f64e71ffdd@suse.com>
Subject: Re: [PATCH v2 6/8] tools/xs-clients: don't exit with error when using
 -h parameter
References: <20260312155102.2862824-1-jgross@suse.com>
 <20260312155102.2862824-7-jgross@suse.com>
 <6afc5c69-230c-460d-980e-2673434e6b4a@citrix.com>
In-Reply-To: <6afc5c69-230c-460d-980e-2673434e6b4a@citrix.com>

--------------00XGarkhZumGpgKFBBHlz4m3
Content-Type: multipart/mixed; boundary="------------oNdDpmAxO7W9kNlKFw2j1ywL"

--------------oNdDpmAxO7W9kNlKFw2j1ywL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTc6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzAzLzIw
MjYgMzo1MSBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IGRpZmYgLS1naXQgYS90b29s
cy94cy1jbGllbnRzL3hlbnN0b3JlX2NsaWVudC5jIGIvdG9vbHMveHMtY2xpZW50cy94ZW5z
dG9yZV9jbGllbnQuYw0KPj4gaW5kZXggYTEwNGNmNjQ4Ny4uMTc5NDQ1MWQ0MyAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL3hzLWNsaWVudHMveGVuc3RvcmVfY2xpZW50LmMNCj4+ICsrKyBi
L3Rvb2xzL3hzLWNsaWVudHMveGVuc3RvcmVfY2xpZW50LmMNCj4+IEBAIC0yMTQsMzcgKzIx
NCwzNyBAQCBvdXRwdXRfcmF3KGNvbnN0IGNoYXIgKmRhdGEsIGludCBsZW4pDQo+PiAgIH0N
Cj4+ICAgDQo+PiAgIHN0YXRpYyB2b2lkDQo+PiAtdXNhZ2UoZW51bSBtb2RlIG1vZGUsIGlu
dCBpbmNsX21vZGUsIGNvbnN0IGNoYXIgKnByb2duYW1lKQ0KPj4gK3VzYWdlKGludCBldmFs
LCBlbnVtIG1vZGUgbW9kZSwgaW50IGluY2xfbW9kZSwgY29uc3QgY2hhciAqcHJvZ25hbWUp
DQo+PiAgIHsNCj4+ICAgICAgIGNvbnN0IGNoYXIgKm1zdHIgPSBOVUxMOw0KPj4gICANCj4+
ICAgICAgIHN3aXRjaCAobW9kZSkgew0KPj4gICAgICAgY2FzZSBNT0RFX3Vua25vd246DQo+
PiAtCWVycngoMSwgIlVzYWdlOiAlcyA8bW9kZT4gWy1oXSBbLi4uXSIsIHByb2duYW1lKTsN
Cj4+ICsJZXJyeChldmFsLCAiVXNhZ2U6ICVzIDxtb2RlPiBbLWhdIFsuLi5dIiwgcHJvZ25h
bWUpOw0KPj4gICAgICAgY2FzZSBNT0RFX3JlYWQ6DQo+PiAgIAltc3RyID0gaW5jbF9tb2Rl
ID8gInJlYWQgIiA6ICIiOw0KPj4gLQllcnJ4KDEsICJVc2FnZTogJXMgJXNbLWhdIFstcF0g
Wy1SXSBrZXkgWy4uLl0iLCBwcm9nbmFtZSwgbXN0cik7DQo+PiArCWVycngoZXZhbCwgIlVz
YWdlOiAlcyAlc1staF0gWy1wXSBbLVJdIGtleSBbLi4uXSIsIHByb2duYW1lLCBtc3RyKTsN
Cj4+ICAgICAgIGNhc2UgTU9ERV93cml0ZToNCj4+ICAgCW1zdHIgPSBpbmNsX21vZGUgPyAi
d3JpdGUgIiA6ICIiOw0KPj4gLQllcnJ4KDEsICJVc2FnZTogJXMgJXNbLWhdIFstUl0ga2V5
IHZhbHVlIFsuLi5dIiwgcHJvZ25hbWUsIG1zdHIpOw0KPj4gKwllcnJ4KGV2YWwsICJVc2Fn
ZTogJXMgJXNbLWhdIFstUl0ga2V5IHZhbHVlIFsuLi5dIiwgcHJvZ25hbWUsIG1zdHIpOw0K
Pj4gICAgICAgY2FzZSBNT0RFX3JtOg0KPj4gICAJbXN0ciA9IGluY2xfbW9kZSA/ICJybSAi
IDogIiI7DQo+PiAtCWVycngoMSwgIlVzYWdlOiAlcyAlc1staF0gWy10XSBrZXkgWy4uLl0i
LCBwcm9nbmFtZSwgbXN0cik7DQo+PiArCWVycngoZXZhbCwgIlVzYWdlOiAlcyAlc1staF0g
Wy10XSBrZXkgWy4uLl0iLCBwcm9nbmFtZSwgbXN0cik7DQo+PiAgICAgICBjYXNlIE1PREVf
ZXhpc3RzOg0KPj4gICAJbXN0ciA9IGluY2xfbW9kZSA/ICJleGlzdHMgIiA6ICIiOw0KPj4g
ICAJLyogZmFsbHRocm91Z2ggKi8NCj4+ICAgICAgIGNhc2UgTU9ERV9saXN0Og0KPj4gICAJ
bXN0ciA9IG1zdHIgPyA6IGluY2xfbW9kZSA/ICJsaXN0ICIgOiAiIjsNCj4+IC0JZXJyeCgx
LCAiVXNhZ2U6ICVzICVzWy1oXSBbLXBdIGtleSBbLi4uXSIsIHByb2duYW1lLCBtc3RyKTsN
Cj4+ICsJZXJyeChldmFsLCAiVXNhZ2U6ICVzICVzWy1oXSBbLXBdIGtleSBbLi4uXSIsIHBy
b2duYW1lLCBtc3RyKTsNCj4+ICAgICAgIGNhc2UgTU9ERV9sczoNCj4+ICAgCW1zdHIgPSBt
c3RyID8gOiBpbmNsX21vZGUgPyAibHMgIiA6ICIiOw0KPj4gLQllcnJ4KDEsICJVc2FnZTog
JXMgJXNbLWhdIFstZl0gWy1wXSBbcGF0aF0iLCBwcm9nbmFtZSwgbXN0cik7DQo+PiArCWVy
cngoZXZhbCwgIlVzYWdlOiAlcyAlc1staF0gWy1mXSBbLXBdIFtwYXRoXSIsIHByb2duYW1l
LCBtc3RyKTsNCj4+ICAgICAgIGNhc2UgTU9ERV9jaG1vZDoNCj4+ICAgCW1zdHIgPSBpbmNs
X21vZGUgPyAiY2htb2QgIiA6ICIiOw0KPj4gLQllcnJ4KDEsICJVc2FnZTogJXMgJXNbLWhd
IFstdV0gWy1yXSBrZXkgPG1vZGUgW21vZGVzLi4uXT4iLCBwcm9nbmFtZSwgbXN0cik7DQo+
PiArCWVycngoZXZhbCwgIlVzYWdlOiAlcyAlc1staF0gWy11XSBbLXJdIGtleSA8bW9kZSBb
bW9kZXMuLi5dPiIsIHByb2duYW1lLCBtc3RyKTsNCj4+ICAgICAgIGNhc2UgTU9ERV93YXRj
aDoNCj4+ICAgCW1zdHIgPSBpbmNsX21vZGUgPyAid2F0Y2ggIiA6ICIiOw0KPj4gLQllcnJ4
KDEsICJVc2FnZTogJXMgJXNbLWhdIFstbiBOUl0ga2V5IiwgcHJvZ25hbWUsIG1zdHIpOw0K
Pj4gKwllcnJ4KGV2YWwsICJVc2FnZTogJXMgJXNbLWhdIFstbiBOUl0ga2V5IiwgcHJvZ25h
bWUsIG1zdHIpOw0KPj4gICAgICAgfQ0KPj4gICB9DQo+IA0KPiBJJ2Qgbm90IGV2ZW4gc3Bv
dHRlZCB0aGlzLCBidXQgSSBhZ3JlZSBpdCB3YW50cyBmaXhpbmcuwqAgQ291bGQgSQ0KPiBw
b3NzaWJseSB0YWxrIHlvdSBpbnRvIG5hbWluZyB0aGUgcGFyYW1ldGVyIGVycl92YWwsIHNl
ZWluZyBhcyBldmFsDQo+IGNvbW1vbmx5IG1lYW5zIHNvbWV0aGluZyB2ZXJ5IGRpZmZlcmVu
dC4NCg0KSSB0b29rIHRoZSBwYXJhbWV0ZXIgbmFtZSBmcm9tIHRoZSBlcnJ4KCkgbWFuIHBh
Z2UgKEkgYmVsaWV2ZSAiZXZhbCIgaXMgYW4NCmFiYnJldmlhdGlvbiBvZiAiZXhpdC12YWx1
ZSIpLg0KDQpJJ20gZmluZSByZW5hbWluZyBpdCwgdGhvdWdoLg0KDQoNCkp1ZXJnZW4NCg==

--------------oNdDpmAxO7W9kNlKFw2j1ywL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------oNdDpmAxO7W9kNlKFw2j1ywL--

--------------00XGarkhZumGpgKFBBHlz4m3--

--------------d4H1EdoiAF9YmsdRcpOJp6SF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmy5BoFAwAAAAAACgkQsN6d1ii/Ey8a
Ugf+IAvW6+UV7uoTvIlP7uZeJKvmUaPGH49k0VQAAC+BIz1OIqYoBAD3gposx4X1zZ0Dv5qwWAZk
plyU9cdF7rgR4bw8kN4FQEeXBiQyXT3hUZMnVn4bsHjW4o4IrsnR9pHIu1fSYf/QBACi8Y++wJnH
xM4OntrPj+i2MJPdq3S4maDP6mJkDe4kP9NCooCnWDY5+eZxtCXPEyL95kChZQLcMiTMoIFaVp6f
fNDf8neygjX+WL5Z3btpIyeR7Q1isv09ElO3/B3y+pmPMdMpCCPCEXFxDQ0g/v8dr0hCBtDaMMX3
vY0yi1//1//jMozoKncC6IAtz0U7wV/FF5fyzLpymg==
=5QWl
-----END PGP SIGNATURE-----

--------------d4H1EdoiAF9YmsdRcpOJp6SF--

