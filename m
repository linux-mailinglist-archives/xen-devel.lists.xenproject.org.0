Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGUrM0cf52mY4AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:55:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6E437369
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 08:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288325.1568604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF50K-0006wu-Or; Tue, 21 Apr 2026 06:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288325.1568604; Tue, 21 Apr 2026 06:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF50K-0006uf-Lb; Tue, 21 Apr 2026 06:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1288325;
 Tue, 21 Apr 2026 06:54:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wF50J-0006uZ-18
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 06:54:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF50H-006Awq-Rb
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:54:37 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e71f28-bab6-0a2a0a5309dd-0a2a4504b3a4-22
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:54:37 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e71f2d-1dec-0a2a45040019-d155802adca6-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 08:54:37 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso29325935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:54:37 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a55dc9f58sm60546085e9.6.2026.04.20.23.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 23:54:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1776754477; x=1777359277; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z1bx3gqStCmaMMpTQ7cTWC0AxlpsOrrdhShw0XEwbUU=;
        b=JYfmDHUJYFyNw+UnFGo9hf0DDXqNnAS4KOs6CMmj9FGlUaiNAxZCBZWVJj4RdwtULP
         KoLo0vTwTaNwIeUrcCzwjEegjsBc6j1bsQFJUQWDOblcow5ghBOhK2AFxeTgtiq1Ovky
         Y+kjxtDFIG3y9t2SwR3dPcMgXsB0HrQv9FD1fHS5Gfiv9idHOAVUtvG9r6D9815dq7v0
         IAksVJPrASHZjkxQPjt7auXZRlYil082dRm3ao/tMm6BQdB9MVIyz5Ae0RAF9s+h/0bj
         582QFvcXy+bUmohCGlefkflBG4rNwVvx3TcNKPAXVe7PZwk2c706BdM9wXVQ3Ko/zB/j
         FbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776754477; x=1777359277;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1bx3gqStCmaMMpTQ7cTWC0AxlpsOrrdhShw0XEwbUU=;
        b=CEhcTbP793vdTi7b6k8OFXJk28Fn5ZBjVSS7q/O/IBnReAv/FznSfJNcgjWW5zy4xp
         yWXokNhBQc7Suso1+yBF5Bvgh/P1yy9RfKl8Xe9NOqZYuir1JK6GjX3gL4w2tr7Zx/fz
         bscQKq0ptLzX4DGYhbFD+K+RRaz5/M0ZkYKQTorW8tpxWiGpsXKCiOudptJ+0NdnGd8M
         ajzcktTXajML3d49pbuSz5TjFxZOaFDybSAldYnsP1aHkP1XiNRdpaZKiuE1hCFkojtX
         yfasr9OMIonEf0/Wo0Q8Mf3jrfVqoL0F5gQ7mKWbrvNyu9CRuS1Q9IWRnC1x4sGexyfS
         R00A==
X-Forwarded-Encrypted: i=1; AFNElJ9CNWBaWPtYbIaXOHqjy6urnAWXmbMp2kT8qwEAckIfSGl5aW3WlOx8aMy5ppORbRSvH7qIznZFjyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQ2wxXbgQP4mCKMNHEN9UcgUliy2grZVcXXNL+8i44P1D6dcCm
	CKFpH0PsuVGUdri4Q9GJT0OQfrta/aVtw5F9nnFWJhgYFMlrwzVlGAWtp3LBjHxxgFU=
X-Gm-Gg: AeBDievkWHA8ZzhCCNu1NDke7IW1jkvl1Lyi8kZ/fIiR7wGslh9Ijk+c+kbPWwRecBL
	ewLTaYqkXq8v90/6Twch1JrYl5RKxP7YZXSYMcbpr8IiI/vzP6GXTAYr9QSeNgxZq5ta8FAjVEn
	FVjIXd5aBdWZmVP6X9zNYIgLTBNHj1AVYwYGNcyr/qi7FxTMj9eRRgUFfq+7yVhHRjuN4itVpFD
	1TROWDWwlDsw3fhLgdLS6D0iXfaBDBYtdmokoe19yPnLz1K7PiRupzLHBmORvkO8UC/XZcgzfso
	AI34266pct9KKSd2LcZpOEiDUYq1MfYOy61d3sxGoNoCUOij1VyVFMapfAWng838LTlJdXbw3wd
	9Qv2u5A9WEgBanwtNSQnnCWJAm/SB6fBPLfJlmSBGxEn2rQpaTKA71toBomzDLYtGBqrVxlVze3
	vuXalaoNVuXn+137NSUgNrHf6tncNTimwSCgZFC4Nr9Hl8cstul1tUTeuzO+0M1EFMzFsuocFrj
	kCp2VZVUjfCiAMHVXcgOP+6qFqxhIGRE2HDX88mVROYqus86N1jgYrD5VMn/aDm
X-Received: by 2002:a05:600d:8451:b0:485:4388:3492 with SMTP id 5b1f17b1804b1-488fb743c43mr207095345e9.11.1776754477019;
        Mon, 20 Apr 2026 23:54:37 -0700 (PDT)
Message-ID: <ccf95e11-03f9-4b76-98b3-a62b33a8fc90@suse.com>
Date: Tue, 21 Apr 2026 08:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] tools/libs/store: add support to use watches with a
 depth parameter
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-4-jgross@suse.com>
 <75667f07-b997-4bba-a905-9c5d80e8ba0c@amd.com>
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
In-Reply-To: <75667f07-b997-4bba-a905-9c5d80e8ba0c@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZSWoV6RU9DtjzB3DRNM0QY8R"
X-purgate-ID: tlsNG-ebf023/1776754477-4BF6D3FF-DAC710BC/0/0
X-purgate-type: clean
X-purgate-size: 9627
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 20D6E437369
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZSWoV6RU9DtjzB3DRNM0QY8R
Content-Type: multipart/mixed; boundary="------------Px9KkMhQVrNoGzHNqVfi3e1G";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
Message-ID: <ccf95e11-03f9-4b76-98b3-a62b33a8fc90@suse.com>
Subject: Re: [PATCH 3/8] tools/libs/store: add support to use watches with a
 depth parameter
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-4-jgross@suse.com>
 <75667f07-b997-4bba-a905-9c5d80e8ba0c@amd.com>
In-Reply-To: <75667f07-b997-4bba-a905-9c5d80e8ba0c@amd.com>

--------------Px9KkMhQVrNoGzHNqVfi3e1G
Content-Type: multipart/mixed; boundary="------------oNpgzHj051dAB4qkUxhRMpLI"

--------------oNpgzHj051dAB4qkUxhRMpLI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDQuMjYgMjM6MzAsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDMt
MTMgMDM6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgYSBuZXcgeHNfd2F0Y2hf
ZGVwdGgoKSBmdW5jdGlvbiB0byBsaWJ4ZW5zdG9yZSBhbGxvd2luZyB0byBsaW1pdA0KPj4g
dGhlIHNjb3BlIG9mIGEgWGVuc3RvcmUgd2F0Y2guIEl0IGNhbiBiZSB1c2VkIG9ubHkgaW4g
Y2FzZSBYZW5zdG9yZSBpcw0KPj4gc3VwcG9ydGluZyB0aGUgWEVOU1RPUkVfU0VSVkVSX0ZF
QVRVUkVfV0FUQ0hERVBUSCBmZWF0dXJlLg0KPj4NCj4+IEZvciBjb252ZW5pZW5jZSBhZGQg
YSB4c193YXRjaF90cnlfZGVwdGgoKSB3cmFwcGVyLCB3aGljaCB3aWxsIGNhbGwNCj4+IHhz
X3dhdGNoX2RlcHRoKCkgaWYgc3VwcG9ydGVkIGFuZCB4c193YXRjaCgpIG90aGVyd2lzZS4N
Cj4+DQo+PiBDYWNoZSB0aGUgc3VwcG9ydGVkIGZlYXR1cmVzIG9mIFhlbnN0b3JlIGluIG9y
ZGVyIG5vdCBoYXZpbmcgdG8gZ2V0DQo+PiB0aGVtIGZyb20gWGVuc3RvcmUgZm9yIGVhY2gg
Y2FsbCBvZiBvbmUgb2YgdGhlIG5ldyBmdW5jdGlvbnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4+IEBAIC05ODQsMzcg
Kzk4NCwyOSBAQCBib29sIHhzX3Jlc3RyaWN0KHN0cnVjdCB4c19oYW5kbGUgKmgsIHVuc2ln
bmVkIGRvbWlkKQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7DQo+PiDCoCB9DQo+PiAt
LyogV2F0Y2ggYSBub2RlIGZvciBjaGFuZ2VzIChwb2xsIG9uIGZkIHRvIGRldGVjdCwgb3Ig
Y2FsbCByZWFkX3dhdGNoKCkpLg0KPj4gLSAqIFdoZW4gdGhlIG5vZGUgKG9yIGFueSBjaGls
ZCkgY2hhbmdlcywgZmQgd2lsbCBiZWNvbWUgcmVhZGFibGUuDQo+PiAtICogVG9rZW4gaXMg
cmV0dXJuZWQgd2hlbiB3YXRjaCBpcyByZWFkLCB0byBhbGxvdyBtYXRjaGluZy4NCj4+IC0g
KiBSZXR1cm5zIGZhbHNlIG9uIGZhaWx1cmUuDQo+PiAtICovDQo+PiAtYm9vbCB4c193YXRj
aChzdHJ1Y3QgeHNfaGFuZGxlICpoLCBjb25zdCBjaGFyICpwYXRoLCBjb25zdCBjaGFyICp0
b2tlbikNCj4+ICtzdGF0aWMgYm9vbCB4c193YXRjaF9oZWxwZXIoc3RydWN0IHhzX2hhbmRs
ZSAqaCkNCj4+IMKgIHsNCj4+IC3CoMKgwqAgc3RydWN0IHhzZF9zb2NrbXNnIG1zZyA9IHsg
LnR5cGUgPSBYU19XQVRDSCB9Ow0KPj4gLcKgwqDCoCBzdHJ1Y3QgaW92ZWMgaW92WzNdOw0K
Pj4gLQ0KPj4gwqAgI2lmZGVmIFVTRV9QVEhSRUFEDQo+PiArwqDCoMKgIHNpZ3NldF90IHNl
dCwgb2xkX3NldDsNCj4+ICvCoMKgwqAgcHRocmVhZF9hdHRyX3QgYXR0cjsNCj4+ICvCoMKg
wqAgc3RhdGljIHNpemVfdCBzdGFja19zaXplOw0KPj4gKyNpZmRlZiBVU0VfRExTWU0NCj4+
ICvCoMKgwqAgc2l6ZV90ICgqZ2V0c3opKHB0aHJlYWRfYXR0cl90ICphdHRyKTsNCj4+ICsj
ZW5kaWYNCj4+ICsNCj4+IMKgICNkZWZpbmUgREVGQVVMVF9USFJFQURfU1RBQ0tTSVpFICgx
NiAqIDEwMjQpDQo+PiDCoCAvKiBOZXRCU0QgZG9lc24ndCBoYXZlIFBUSFJFQURfU1RBQ0tf
TUlOLiAqLw0KPj4gwqAgI2lmbmRlZiBQVEhSRUFEX1NUQUNLX01JTg0KPj4gwqAgIyBkZWZp
bmUgUFRIUkVBRF9TVEFDS19NSU4gMA0KPj4gwqAgI2VuZGlmDQo+PiAtI2RlZmluZSBSRUFE
X1RIUkVBRF9TVEFDS1NJWkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwNCj4+IC3CoMKgwqAgKChERUZBVUxUX1RIUkVBRF9TVEFDS1NJWkUgPCBQVEhSRUFE
X1NUQUNLX01JTikgP8KgwqDCoMKgIFwNCj4+ICsjZGVmaW5lIFJFQURfVEhSRUFEX1NUQUNL
U0laRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKg
wqAgKChERUZBVUxUX1RIUkVBRF9TVEFDS1NJWkUgPCBQVEhSRUFEX1NUQUNLX01JTikgP8Kg
wqDCoCBcDQo+PiDCoMKgwqDCoMKgwqAgUFRIUkVBRF9TVEFDS19NSU4gOiBERUZBVUxUX1RI
UkVBRF9TVEFDS1NJWkUpDQo+PiDCoMKgwqDCoMKgIC8qIFdlIGR5bmFtaWNhbGx5IGNyZWF0
ZSBhIHJlYWRlciB0aHJlYWQgb24gZGVtYW5kLiAqLw0KPj4gwqDCoMKgwqDCoCBtdXRleF9s
b2NrKCZoLT5yZXF1ZXN0X211dGV4KTsNCj4+IMKgwqDCoMKgwqAgaWYgKCFoLT5yZWFkX3Ro
cl9leGlzdHMpIHsNCj4+IC3CoMKgwqDCoMKgwqDCoCBzaWdzZXRfdCBzZXQsIG9sZF9zZXQ7
DQo+PiAtwqDCoMKgwqDCoMKgwqAgcHRocmVhZF9hdHRyX3QgYXR0cjsNCj4+IC3CoMKgwqDC
oMKgwqDCoCBzdGF0aWMgc2l6ZV90IHN0YWNrX3NpemU7DQo+PiAtI2lmZGVmIFVTRV9ETFNZ
TQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHNpemVfdCAoKmdldHN6KShwdGhyZWFkX2F0dHJfdCAq
YXR0cik7DQo+PiAtI2VuZGlmDQo+IA0KPiBBRkFJQ1QsIHRoZXJlIGlzIG5vIHBhcnRpY3Vs
YXIgcmVhc29uIHRvIGNoYW5nZSB0aGUgc2NvcGUgb2YgdGhlc2UgdmFyaWFibGVzLiAgDQo+
IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNClRoYXQgd2Fzbid0IG9uIHB1cnBvc2UuDQoN
ClNlZW1zIHRvIGJlIGFuIGFydGlmYWN0IG9mIGNyZWF0aW5nIHRoZSBuZXcgeHNfd2F0Y2hf
aGVscGVyKCkgZnVuY3Rpb24uDQoNCkknbGwgZml4IHRoYXQgYW5kIHNlbmQgYSBWMi4NCg0K
PiANCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIG9rYXkuDQoNClRoYW5rcywNCg0KDQpKdWVy
Z2VuDQo=
--------------oNpgzHj051dAB4qkUxhRMpLI
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

--------------oNpgzHj051dAB4qkUxhRMpLI--

--------------Px9KkMhQVrNoGzHNqVfi3e1G--

--------------ZSWoV6RU9DtjzB3DRNM0QY8R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnnHywFAwAAAAAACgkQsN6d1ii/Ey8W
cgf/XZ2geommsOghRx9USclumyJ9nIkf7P2hf89F3urJHR7I5ZSh49n8Wwc+Gn9W8vVBg1/KhgQ2
VJKKKcp4K9RYd6qeZX/4EgTQIrYx2zlQwnJoLoOBbomgLIxAnPPRU5QGCrMNeghQ1+jcloZe1Fbb
J0o1OCWyOUy9XquGrzTWcebq2E8XeFH//XP9JNnRHQGCoXu7eLA2LpY3/OCD5Ecjh+VbTzsu5HDx
OQlDcjynNOlcXXm4peImiy/oDsTBaW7kjoye1TtiUGzqGK4Wki7ZxM0ITovwCaYPsuB8hjfQccdL
ZAWmMU1MapYo0T4fHbc7FIkEzGunYpL3B9VOkN4sMA==
=cqdc
-----END PGP SIGNATURE-----

--------------ZSWoV6RU9DtjzB3DRNM0QY8R--

