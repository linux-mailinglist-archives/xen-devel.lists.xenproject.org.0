Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLk2KL+0FmokogcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 11:09:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D155E18D1
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 11:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320390.1587701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSAFO-0001nN-NX; Wed, 27 May 2026 09:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320390.1587701; Wed, 27 May 2026 09:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSAFO-0001kX-Hp; Wed, 27 May 2026 09:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1320390;
 Wed, 27 May 2026 09:08:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wSAFM-0001kR-Uz
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 09:08:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSAFM-004IlN-5t
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 11:08:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a16b479-bab6-0a2a0a5309dd-0a2a4508c83a-44
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 11:08:15 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a16b47f-63b5-0a2a45080019-d155d02dd5c1-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 11:08:15 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-67f94c078e8so2249774a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 02:08:15 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68a6facda9esm538949a12.13.2026.05.27.02.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 02:08:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1779872895; x=1780477695; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eiLWx2gHl6Xze60efbxTAuOXAukJJWiOaNWz3rbIjlg=;
        b=gQ7S8DmklHT/XWBdqoBYTqAREmBqWyhcjJZSXOeES/UHRCwnkPM2HnaShH1vxenwUq
         LL9b+77589WNd3p41J+jUa8BoCWafPlCyNRG3zrtAxwkngufZ42dx1qNF16r+UjgErlP
         i3UAVaRDJWvbdWz4K39t5SUeXM1lJgl3Oft/8rbQF7z0WAjuFPw47Q1P2myGv75gmywC
         3pOChNDMipveFn1U/mY6PuAIZBi+moOUiXFDsVHMDcsIFxIlpGFcac5fe5+IX85Ubx9p
         3kt+wXVtqIAavFNhjuXITBa+7aDhZa0mi7IrkSV4KdByV5haTuJcqGc5i4JduzAeTQh6
         Y+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872895; x=1780477695;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiLWx2gHl6Xze60efbxTAuOXAukJJWiOaNWz3rbIjlg=;
        b=IXa64d9aSVNBlcNhGHjtgC3ruYqBEOgQoJ6hW2tJaBr8cVzkIJSOa/Ldg24WxUNh7S
         HU8DbPSCKD174DTrmXQqux0JZzazy5QcnrRh7fdDFilSEAqF3R9taVkPuGwwbc4MTvrO
         c1oeriTtHKALemaDr3ykcKf0JlmQwR84V/Vd0tZmhkvGdvG/19h8mBHHiaBXLxdXR/Ga
         oWaJB1ch5koefrLgwerGduv4/tjuoBE0hZxUT6DcjUZNwCaKK0jlUlC7SrFoQHmzgD3r
         kb/GEG4ikqs6vMsrPLehj1aszAjx3gEgUuTiVoitammrmEFQNsf2OGnAerFgL7MXQ6DA
         pAsg==
X-Forwarded-Encrypted: i=1; AFNElJ/UfVJ7eWLUNDUkkzj5Wy/avBp7YHAqEiS2kOQzQMP7h60IMbUzG950tFybbwHJo8uWO07BPpRnE6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywpot23BOGtNQLjXbjZGQoPLxceUV0C9T7Gx0nUWg1JtW+YdKrx
	v7OJkrJk5Tyearg7JntyT64NKXRZPC5gVdBkrEJjHImTfoz2PbPWQGYsM7yuOmdMvXo=
X-Gm-Gg: Acq92OEQQtl58umoRfmCMrgvDyt4HFnlILUX7A/1VneiAbTQoKBhhVaZecvVhdH37zc
	bBc3/2aSF2iRWHNR1j2FDoT7CpnXpHH5AxLhBeHsAn+c5sroeCMn5+tuTDC4uTmeGE6uQAr2qFz
	mikQH8UHkNuDIWE9h8GgLz58Rvt/nynMPVnAkXCQnGuNnftvoczWCcagNh81JzPDg96EL0onPmH
	Hi8cihmJGO97vAwWo7b9ECJ8833OQEIBOV/9QHE3KhKKTs4D+1Zok6oIWNCvK0JsSaXvmIAFmoq
	HjgmU2epT9HVCtPa5L0EoSp3MgsyVNc+yNhbZIyI4hfcAV0MMo6PTuEBFB9dwCSazgsc2gaOzHC
	iLFH7vveThXrHoPyuVdlFMyCstRwvQnA5guycW+iZuaIa2ejuAEmwz2do/Qly6xX5zsR8Lou0uV
	7O8DbP7/MJBtSIGWSaqlVdvNpAPfqPDzLKAJPWjiMXlDvlgzHXkR6SKzyw9q5kIb/ThJjePF1sE
	ahF8qMjgnCeiwwMqGxVOyrrl1weu8DYWG1Y5UU9F3sHjyRbL/8srWXcKEfL6r2r
X-Received: by 2002:a05:6402:458f:b0:687:261a:3388 with SMTP id 4fb4d7f45d1cf-6889cc44682mr11338473a12.22.1779872895234;
        Wed, 27 May 2026 02:08:15 -0700 (PDT)
Message-ID: <3b09cd9b-f0f1-41d6-a118-d0ea855f27d6@suse.com>
Date: Wed, 27 May 2026 11:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/rtds: refill cur_budget when extratime is toggled
 on a depleted vCPU
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dnsi4BmgqPYERP4yF3ZJ8j0k"
X-purgate-ID: tlsNG-c1860d/1779872895-B5F6ADB1-75023BCC/0/0
X-purgate-type: clean
X-purgate-size: 10926
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:mengxu@cis.upenn.edu,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.741];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1D155E18D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dnsi4BmgqPYERP4yF3ZJ8j0k
Content-Type: multipart/mixed; boundary="------------b8sHksz8xCEgyBIQ8qzuT00d";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>
Message-ID: <3b09cd9b-f0f1-41d6-a118-d0ea855f27d6@suse.com>
Subject: Re: [PATCH] sched/rtds: refill cur_budget when extratime is toggled
 on a depleted vCPU
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
In-Reply-To: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>

--------------b8sHksz8xCEgyBIQ8qzuT00d
Content-Type: multipart/mixed; boundary="------------dKwRuHrou25Ny7aGih6vrxQs"

--------------dKwRuHrou25Ny7aGih6vrxQs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDUuMjYgMTU6NTcsIE9sZWtzaWkgTW9pc2llaWV2IHdyb3RlOg0KPiBYRU5fRE9N
Q1RMX1NDSEVET1BfcHV0dmNwdWluZm8gY2FuIGZsaXAgdGhlIFJURFNfZXh0cmF0aW1lIGJp
dCBvbiBhIHZDUFUNCj4gdGhhdCBpcyBjdXJyZW50bHkgZGVwbGV0ZWQgKGN1cl9idWRnZXQg
PT0gMCwgcG9zc2libHkgc2l0dGluZyBvbiB0aGUNCj4gZGVwbGV0ZWQgcXVldWUpLiBydF9k
b21fY250bCgpIHRvdWNoZXMgb25seSBzdmMtPmZsYWdzOyBjdXJfYnVkZ2V0IGlzDQo+IGxl
ZnQgdW5jaGFuZ2VkLiBBcyBhIHJlc3VsdCB0aGUgbmV4dCBjb2RlIHBhdGggdGhhdCBjYWxs
cyBydW5xX2luc2VydCgpDQo+IG9uIHRoaXMgdkNQVSAtIHJ0X3VuaXRfd2FrZSgpIGFmdGVy
IGEgZG9tYWluX3VucGF1c2UoKSwNCj4gcnRfY29udGV4dF9zYXZlZCgpIGZvbGxvd2luZyBh
IGRlbGF5ZWQgcnVucSBhZGQsIG9yIHJlcGxfdGltZXJfaGFuZGxlcigpDQo+IGFmdGVyIGEg
cmVwbGVuaXNobWVudCAtIHBsYWNlcyB0aGUgdkNQVSBvbiB0aGUgcnVuIHF1ZXVlLCBiZWNh
dXNlDQo+IGhhc19leHRyYXRpbWUoc3ZjKSBpcyBub3cgdHJ1ZSBhbmQgcnVucV9pbnNlcnQo
KSBhZG1pdHMgZXh0cmF0aW1lIHVuaXRzDQo+IHJlZ2FyZGxlc3Mgb2YgY3VyX2J1ZGdldDoN
Cj4gDQo+ICAgICAgLyogYWRkIHN2YyB0byBydW5xIGlmIHN2YyBzdGlsbCBoYXMgYnVkZ2V0
IG9yIGl0cyBleHRyYXRpbWUgaXMgc2V0ICovDQo+ICAgICAgaWYgKCBzdmMtPmN1cl9idWRn
ZXQgPiAwIHx8DQo+ICAgICAgICAgICBoYXNfZXh0cmF0aW1lKHN2YykgKQ0KPiAgICAgICAg
ICBkZWFkbGluZV9ydW5xX2luc2VydChzdmMsICZzdmMtPnFfZWxlbSwgcnVucSk7DQo+ICAg
ICAgZWxzZQ0KPiAgICAgICAgICBsaXN0X2FkZCgmc3ZjLT5xX2VsZW0sICZwcnYtPmRlcGxl
dGVkcSk7DQo+IA0KPiBUaGUgdmVyeSBuZXh0IHJ0X3NjaGVkdWxlKCkgaXRlcmF0ZXMgdGhl
IHJ1biBxdWV1ZSBmcm9tIHJ1bnFfcGljaygpDQo+IGFuZCB0cmlwcyB0aGUgQVNTRVJUKGl0
ZXJfc3ZjLT5jdXJfYnVkZ2V0ID4gMCkgYXQgdGhlIGJvdHRvbSBvZiB0aGUNCj4gbG9vcCwg
cGFuaWNraW5nIHRoZSBob3N0LiBPYnNlcnZlZCB0cmFjZToNCj4gDQo+ICAgICAgQXNzZXJ0
aW9uICdpdGVyX3N2Yy0+Y3VyX2J1ZGdldCA+IDAnIGZhaWxlZCBhdCBjb21tb24vc2NoZWQv
cnQuYzoxMDM1DQo+ICAgICAgLS0tLVsgWGVuLTQuMjItdW5zdGFibGUgIGFybTY0ICBkZWJ1
Zz15IHVic2FuPXkgIE5vdCB0YWludGVkIF0tLS0tDQo+ICAgICAgWzwuLi4+XSBydC5jI3J0
X3NjaGVkdWxlKzB4MTU1OC8weDMzZTAgKFBDKQ0KPiAgICAgIFs8Li4uPl0gY29yZS5jI2Rv
X3NjaGVkdWxlKzB4MmU0LzB4MTViNA0KPiAgICAgIFs8Li4uPl0gY29yZS5jI3NjaGVkdWxl
KzB4YjE0LzB4ZTUwDQo+ICAgICAgWzwuLi4+XSBzb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4
MjBjLzB4M2Q0DQo+ICAgICAgWzwuLi4+XSBkb19zb2Z0aXJxKzB4MTQvMHgxYw0KPiAgICAg
IFs8Li4uPl0gZG9tYWluLmMjaWRsZV9sb29wKzB4MTk0LzB4NTU4DQo+IA0KPiBNaW5pbWFs
IHJlcHJvZHVjZXI6IHBpbiBhIHNpbmdsZS12Q1BVIGRvbVUgdG8gYSBwQ1BVLCBwcm9ncmFt
IFJURFMgd2l0aA0KPiBleHRyYXRpbWUgb2ZmIGFuZCBhIGxvdyB1dGlsaXNhdGlvbiAoZS5n
LiBidWRnZXQgPSAxMG1zIC8gcGVyaW9kID0gMTAwbXMpDQo+IHNvIHRoZSB2Q1BVIHNwZW5k
cyBtb3N0IG9mIGl0cyB0aW1lIGluIHRoZSBkZXBsZXRlZCBxdWV1ZSwgcGF1c2UgdGhlDQo+
IGRvbWFpbiwgaXNzdWUgYSBwdXR2Y3B1aW5mbyB0aGF0IHNldHMgWEVOX0RPTUNUTF9TQ0hF
RFJUX2V4dHJhLCB0aGVuDQo+IHVucGF1c2UuIEFzIHNvb24gYXMgdGhlIHNjaGVkdWxlIHNv
ZnRpcnEgZmlyZXMgb24gdGhlIHBDUFUsIHRoZSBCVUcNCj4gaGl0cy4gVGhlIHNhbWUgc2Vx
dWVuY2UgaXMgcmVhY2hhYmxlIHdpdGhvdXQgYW4gZXhwbGljaXQgcGF1c2U6IGFueQ0KPiB3
aW5kb3cgaW4gd2hpY2ggcnRfZG9tX2NudGwoKSBydW5zIGJldHdlZW4gYnVybl9idWRnZXQo
KSdzIGJ1ZGdldA0KPiBleGhhdXN0aW9uIGFuZCBydF9jb250ZXh0X3NhdmVkKCkncyBydW5x
X2luc2VydCgpIGFsc28gY2xvc2VzIG9udG8gdGhlDQo+IHNhbWUgYnJva2VuIHN0YXRlLCBi
ZWNhdXNlIHRoZSBwZXItc2NoZWR1bGVyIGxvY2sgaXMgZHJvcHBlZCBiZXR3ZWVuDQo+IHRo
b3NlIHR3byBwb2ludHMuDQo+IA0KPiBUaGUgc2VtYW50aWNzIGZvciAiZXh0cmF0aW1lIGdl
dHMgZXhoYXVzdGVkIGJ1ZGdldCByZWZpbGxlZCIgYWxyZWFkeQ0KPiBsaXZlIGluIGJ1cm5f
YnVkZ2V0KCk6DQo+IA0KPiAgICAgIGlmICggaGFzX2V4dHJhdGltZShzdmMpICkNCj4gICAg
ICB7DQo+ICAgICAgICAgIHN2Yy0+cHJpb3JpdHlfbGV2ZWwrKzsNCj4gICAgICAgICAgc3Zj
LT5jdXJfYnVkZ2V0ID0gc3ZjLT5idWRnZXQ7DQo+ICAgICAgfQ0KPiANCj4gQXBwbHkgdGhl
IHNhbWUgcHJpb3JpdHktZGVtb3Rpb24tYW5kLXJlZmlsbCBpbiBydF9kb21fY250bCgpIHdo
ZW4gdGhlDQo+IGZsYWcgdHJhbnNpdGlvbnMgZnJvbSBvZmYgdG8gb24gd2hpbGUgdGhlIHZD
UFUgaXMgZGVwbGV0ZWQsIGNsZWFyDQo+IFJURFNfZGVwbGV0ZWQgdG8gbWF0Y2gsIGFuZCAt
IGlmIHRoZSB2Q1BVIGlzIGN1cnJlbnRseSBvbiB0aGUgZGVwbGV0ZWQNCj4gcXVldWUgLSBt
b3ZlIGl0IHRvIHRoZSBydW4gcXVldWUgdXNpbmcgdGhlIHNhbWUgcV9yZW1vdmUoKSArDQo+
IHJ1bnFfaW5zZXJ0KCkgcGF0dGVybiBhbHJlYWR5IHVzZWQgYnkgcmVwbF90aW1lcl9oYW5k
bGVyKCkuIFRoZSB2Q1BVDQo+IHJlbWFpbnMgb24gdGhlIHJlcGxlbmlzaG1lbnQgcXVldWUg
dGhyb3VnaG91dCwgc28gaXRzIG5vcm1hbA0KPiByZXBsZW5pc2htZW50IGNhZGVuY2UgaXMg
cHJlc2VydmVkLg0KPiANCj4gVGhlIGNvbXBsZW1lbnRhcnkgdHJhbnNpdGlvbiAob24gLT4g
b2ZmKSBpcyBhbHJlYWR5IHNhZmU6IGNsZWFyaW5nIHRoZQ0KPiBmbGFnIG9ubHkgbmFycm93
cyB0aGUgcnVucV9pbnNlcnQoKSBhZG1pc3Npb24gY29uZGl0aW9uLCBzbyBzdWJzZXF1ZW50
DQo+IGRlcGxldGVkIGluc2VydGlvbnMgY29ycmVjdGx5IHJvdXRlIHRvIHRoZSBkZXBsZXRl
ZCBxdWV1ZS4NCj4gDQo+IE5vIG90aGVyIGNhbGwgc2l0ZXMgbmVlZCBjaGFuZ2VzOiB3aXRo
IGN1cl9idWRnZXQgcmVzdG9yZWQgYmVmb3JlIHRoZQ0KPiBmbGFnIGlzIG9ic2VydmFibGUg
dG8gcnVucV9pbnNlcnQoKSwgcnVucV9waWNrKCkncyBsb25nLXN0YW5kaW5nDQo+IGludmFy
aWFudCAoZXZlcnkgcnVuLXF1ZXVlIGVudHJ5IGhhcyBjdXJfYnVkZ2V0ID4gMCkgaXMgcHJl
c2VydmVkLg0KPiANCg0KVGhpcyBpcyBtaXNzaW5nDQoNCkZpeGVzOiA0NjNiOTU4MzE3Nzgg
KCJ4ZW46cnRkczogdG93YXJkcyB3b3JrIGNvbnNlcnZpbmcgUlREUyIpDQoNCj4gU2lnbmVk
LW9mZi1ieTogT2xla3NpaSBNb2lzaWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29t
Pg0KDQpXaXRoIHRoZSAiRml4ZXM6IiB0YWcgYWRkZWQ6DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------dKwRuHrou25Ny7aGih6vrxQs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dKwRuHrou25Ny7aGih6vrxQs--

--------------b8sHksz8xCEgyBIQ8qzuT00d--

--------------dnsi4BmgqPYERP4yF3ZJ8j0k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmoWtH4FAwAAAAAACgkQsN6d1ii/Ey8+
YQf/R4pi4y9sD4vplOhxbWEdw+X6IOeiFYeWpPMYB5ugUzqq+ZZqwKrSXF4jgPAcKtIqMVhCPNCt
KRi15WOfTT5sgsAbejbmuOtJz82FGXOkJrf1aTIUNnw3CauTDktDqpMZinnh+Fuq5y2TmYCdp2bS
o/peOULmbhySOPdVnU4vhdjcYC4VonEw0BKtteB3RtRDic8pxMQWvAmNktqOYZvd0fwS5/5tYGDo
3Ll0E2aoMlb02NikV3bRlW/A+d/PHpm7vvTCTAGC1TpJjIWKOgM7RpsGFLxOw+MjCA9w/Lj3SOf3
u8tLoNSU1heqUmA9od6KJUr7rt7XCExz8ggHraC7xQ==
=OHAH
-----END PGP SIGNATURE-----

--------------dnsi4BmgqPYERP4yF3ZJ8j0k--

