Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH42O1h9xmnwKgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:51:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BA344936
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265592.1556422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66en-0002Uz-5w; Fri, 27 Mar 2026 12:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265592.1556422; Fri, 27 Mar 2026 12:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66en-0002SS-33; Fri, 27 Mar 2026 12:51:21 +0000
Received: by outflank-mailman (input) for mailman id 1265592;
 Fri, 27 Mar 2026 12:51:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w66el-0002SM-QZ
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:51:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w66el-006iA4-5U
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:51:19 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69c67d45-5cb7-0a2a0a5109dd-0a2a45039146-8
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:51:19 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69c67d46-1947-0a2a45030019-d1558034f00b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:51:18 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso16067205e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 05:51:18 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48727189cd1sm15062955e9.29.2026.03.27.05.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 05:51:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774615878; x=1775220678; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SckRGSf6TTBxZUFG7HmhvZkcg5DfrpwMyToGdndXJJ0=;
        b=SIbFtVd54eQAbv3ikX+l3gPLd25m8o9PKoer1Z9wStWFDKvbrWOymWD+a/1OOk7+/L
         uB0qWd+YxvgdljB5awVuvlEQLCSVmpGimthqc9fbnRzl0bRLrun2vjsV5fMEc+dnLGw7
         s92RuYb+62VGGKGxIO4nEtmycxSAZek4Kb+TBUBx4kxZybEk7n/ibPKg3rai34t2d6B5
         N93263yANgaATtFq68Xg0RkPQKkDoPjUqBn+2ezJcvLX5FEJX85NOmmBb3QJVoIMsbXg
         MDJIAbCelgUDHsrFDDSQ3AdzZogCTrJxC2JCTdWggX11r3xmQ7b8jaEVnF5ISB1REBeD
         RQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615878; x=1775220678;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SckRGSf6TTBxZUFG7HmhvZkcg5DfrpwMyToGdndXJJ0=;
        b=XE2Tz5mYIUHl+TgCnUp3GPH3+T1zUkVG1uHQOa/eXwCfsJ7UNjeYqP3G1UHZt5nT2e
         II99IG+HX3TOEvKPShiIzgoBD9Tc9xYMEXoL78ZwpXyVHFF4OQVVHzaBeVDcb7Irpafb
         Lf1Kcwg8HJ4iCyweTxg/dVanV10jFut6ANFyuGJz5E+6I7CSn3z+1S0ou17BAMAyu7pg
         zV5k6MnZJFqVFlU6vUM8PKwZVi6sfvTXnQXV6LFIrP6N61wOiZWhu3io87WgGtNKKvgj
         W1s3Wyscow5/9K1BdHW56V1uH7KqhIdaUTlFKezvjiqQclzGu/kuIuawJnKkeBnqpDGr
         JIWw==
X-Forwarded-Encrypted: i=1; AJvYcCXALY7JldFcnR1wzvGPPpJ9fRIDREKLnpI/v2Q77I+O8BHN1QjxKVFREhLgk5G/3M/CV6HEpm0Srkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLzB7O9oh9PqRMmqw/mico2qxxhINuH90HBXgbKU/0w0+/wGNE
	/m2v73WwnUedvZ5DwAyaJ040zBFwpOIvH1+vVndemZbW7758kC3OfOHLUQV5U9gLD+w=
X-Gm-Gg: ATEYQzx7+QT6PbyWsVU3SF8RFlXweReqs1x7EBCVIC+QgS1hOpzRgC6U2Y5XGj9w+nW
	S5TJ0gr+LkwG/Ah9t0WGTfXaDPyWBeaVxr4WwEMMNik8+ik4QIN8fimW+etvWWUheoeKVC+mbJi
	SFtRdpmTT0Vb/Y1ZYffPNPXsR5X1MJKOdZtnk3jGnQfuEQAiKYlT9EYnmZ9wD2fpV9gRRiNbQvc
	fGfNQomFy0estxWiS4KSqFmZFWLXt0Y/wFdpeclRRfNurCbkbqpUZYsgcDEyna0HVaU/iaFZd6/
	Ks9lMzrDdzVhiwP6f+Peq2Ps/rKZtDK3B+9+25+5tY0PQw4J4Vbb4zZHyZ7N1xXrnYOh0lskp3k
	1zYqwppucNBy8/pJ/WFiKJ25R5NAGynpog2sSRTPVd9nmP42LPo4n4NmBqTyM4/uR5PAYfdHAX/
	n3xHW/zyBixc3J+7nhjd9ZI0akI/GlO1dZZu2Z2ofqJdmDfOfc2Mwk7aS7sb5FoLCfBUZNkyxG8
	TMVK0Po6isLRLrbkxe7+tm7ae5oipdo7sFzyYYsSBCzPnQux3apyg==
X-Received: by 2002:a05:600c:1d1c:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-48727efacb3mr37802375e9.20.1774615878339;
        Fri, 27 Mar 2026 05:51:18 -0700 (PDT)
Message-ID: <7e21c108-f747-4805-8904-b116bf04be89@suse.com>
Date: Fri, 27 Mar 2026 13:51:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/sched: validate RTDS putinfo period and budget
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mGWDMak0AFJ5fCbzeXNA2PzL"
X-purgate-ID: tlsNG-33051d/1774615879-49E5B72C-7748545E/0/0
X-purgate-type: clean
X-purgate-size: 8687
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,epam.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 482BA344936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mGWDMak0AFJ5fCbzeXNA2PzL
Content-Type: multipart/mixed; boundary="------------851aCZfoFMbQORZHgbqNyCMR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <7e21c108-f747-4805-8904-b116bf04be89@suse.com>
Subject: Re: [PATCH v3] xen/sched: validate RTDS putinfo period and budget
References: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
In-Reply-To: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>

--------------851aCZfoFMbQORZHgbqNyCMR
Content-Type: multipart/mixed; boundary="------------3JwH9fE6pjrrowzAiv4koBDy"

--------------3JwH9fE6pjrrowzAiv4koBDy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDMuMjYgMTI6MzEsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBUaGUgUlRE
UyBkb21haW4td2lkZSBYRU5fRE9NQ1RMX1NDSEVET1BfcHV0aW5mbyBwYXRoIG9ubHkgY2hl
Y2tzIGZvcg0KPiB6ZXJvIHZhbHVlcyBiZWZvcmUgYXBwbHlpbmcgcGVyaW9kIGFuZCBidWRn
ZXQgdG8gYWxsIHZDUFVzIGluIHRoZQ0KPiBkb21haW4uDQo+IA0KPiBUaGlzIGlzIHdlYWtl
ciB0aGFuIHRoZSBwZXItdkNQVSBYRU5fRE9NQ1RMX1NDSEVET1BfcHV0dmNwdWluZm8gcGF0
aCwNCj4gd2hpY2ggYWxyZWFkeSByZWplY3RzIHZhbHVlcyBiZWxvdyB0aGUgbWluaW11bSwg
YWJvdmUgdGhlIG1heGltdW0sIGFuZA0KPiBjYXNlcyB3aGVyZSBidWRnZXQgZXhjZWVkcyBw
ZXJpb2QuDQo+IA0KPiBVc2UgdGhlIHNhbWUgdmFsaWRhdGlvbiBydWxlcyBmb3IgcHV0aW5m
byBhcyBmb3IgcHV0dmNwdWluZm8sIHNvDQo+IGludmFsaWQgZG9tYWluLXdpZGUgdXBkYXRl
cyBhcmUgcmVqZWN0ZWQgd2l0aCAtRUlOVkFMIGluc3RlYWQgb2YgYmVpbmcNCj4gYXBwbGll
ZCBpbmNvbnNpc3RlbnRseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2ll
aWV2IDxvbGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2Vz
IGluIHYzOg0KPiAtIGNoYW5nZWQgcnRfdmFsaWRhdGVfcGFyYW1zIGlucHV0IHRvIGdldCBz
dHJ1Y3QgaW5zdGVhZCBvZg0KPiBwZXJpb2QgYW5kIGJ1ZGdldA0KPiAtIGltcHJvdmVkIGNv
ZGUgcmVhZGFiaWxpdHkNCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gaW50cm9kdWNlIHJ0
X3ZhbGlkYXRlX3BhcmFtcyBoZWxwZXIgZnVuY3Rpb24gdG8gY2hlY2sgcGVyaW9kIGFuZCBi
dWRnZXQNCj4gDQo+ICAgeGVuL2NvbW1vbi9zY2hlZC9ydC5jIHwgMzcgKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNl
cnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkL3J0LmMgYi94ZW4vY29tbW9uL3NjaGVkL3J0LmMNCj4gaW5kZXggN2IxZjY0
YTc3OS4uYzE2MWJmN2Y3OCAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9ydC5j
DQo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvcnQuYw0KPiBAQCAtMTM2Miw2ICsxMzYyLDIz
IEBAIG91dDoNCj4gICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHVuaXQp
Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQNCj4gK3J0X3ZhbGlkYXRlX3BhcmFtcyhz
dHJ1Y3QgeGVuX2RvbWN0bF9zY2hlZF9ydGRzICpydGRzLA0KPiArICAgICAgICAgICAgICAg
ICAgIHNfdGltZV90ICpwZXJpb2QsIHNfdGltZV90ICpidWRnZXQpDQo+ICt7DQo+ICsgICAg
c190aW1lX3QgcCA9IE1JQ1JPU0VDUyhydGRzLT5wZXJpb2QpOw0KPiArICAgIHNfdGltZV90
IGIgPSBNSUNST1NFQ1MocnRkcy0+YnVkZ2V0KTsNCj4gKw0KPiArICAgIGlmICggcCA+IFJU
RFNfTUFYX1BFUklPRCB8fCBiIDwgUlREU19NSU5fQlVER0VUIHx8DQo+ICsgICAgICAgICBi
ID4gcCB8fCBwIDwgUlREU19NSU5fUEVSSU9EICkNCg0KVGhpcyBzZXF1ZW5jZSBvZiB0ZXN0
cyBtYWtlcyBpdCBoYXJkZXIgdG8gcmVhZCB0aGFuIG5lY2Vzc2FyeS4NCg0KQ291bGQgeW91
IHBsZWFzZSByZWFycmFuZ2UgdG86DQoNCisgICAgaWYgKCBwIDwgUlREU19NSU5fUEVSSU9E
IHx8IHAgPiBSVERTX01BWF9QRVJJT0QgfHwNCisgICAgICAgICBiIDwgUlREU19NSU5fQlVE
R0VUIHx8IGIgPiBwICkNCg0KVGhpcyBtYWtlcyBpdCByYXRoZXIgb2J2aW91cyB3aGF0IHRo
ZSBhbGxvd2VkIHJhbmdlcyBhcmUuDQoNCldpdGggdGhpcyBhbmQgdGhlICJjb25zdCIgYWRk
ZWQgbWVudGlvbmVkIGJ5IEphbiB5b3UgY2FuIGFkZCBteToNCg0KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCg0KDQpKdWVyZ2VuDQo=
--------------3JwH9fE6pjrrowzAiv4koBDy
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------3JwH9fE6pjrrowzAiv4koBDy--

--------------851aCZfoFMbQORZHgbqNyCMR--

--------------mGWDMak0AFJ5fCbzeXNA2PzL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnGfUUFAwAAAAAACgkQsN6d1ii/Ey+S
6Qf+KCJLWpgdV2wtXkXAOqjU9Cb36rJlefMLZEW36K9c1c1WXUWa1F/PKvQiClWhRAvCzIPcIEZW
/k4FHM1S73B7OYTCETcGaNzjdQlWtq7etZ6855RezgropNeln8/PZ9+8jHR4FVgsPOj1BFexOsAx
ELJl2pSJo7HfrpllmPjTEZtDW+/w9wnskSF7jBmTgnW12zmw3AGdlwY1jbo5xmTpFLqYgZ2WVvEX
HZ8yIalrjKxGFZ/9Q0oxlm7onUP9ydmDjMghFAIzSwXE5MeB0x+dUvgLdvqLkRm/E/QvwsshzyGB
dmpitpDktavOr86/LICqIyRvoV6gV4j8I4PcvsR5Qw==
=NeA0
-----END PGP SIGNATURE-----

--------------mGWDMak0AFJ5fCbzeXNA2PzL--

