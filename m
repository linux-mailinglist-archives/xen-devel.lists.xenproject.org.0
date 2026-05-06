Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HUPJNL/+mkOVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:46:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B166C4D80D0
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301318.1575610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXtC-0003HW-8y; Wed, 06 May 2026 08:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301318.1575610; Wed, 06 May 2026 08:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXtC-0003FE-61; Wed, 06 May 2026 08:45:54 +0000
Received: by outflank-mailman (input) for mailman id 1301318;
 Wed, 06 May 2026 08:45:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wKXtA-0003F6-42
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:45:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXt9-001pEZ-5G
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:45:51 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69faffbc-2eae-0a2a0a5409dd-0a2a4501b7cc-14
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:45:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69faffbe-c1f2-0a2a45010019-d155802dc4db-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:45:50 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so59076005e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:45:50 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538fb19csm29105215e9.11.2026.05.06.01.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 01:45:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1778057150; x=1778661950; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zqf/TgdeYWStRELFhd5bFyr71dKgZm98KPqHwV+WZwA=;
        b=P8hK5LA6VpVXpRNIhZZNxyeJ2nDvjCxH5qaVCHkwCGULqMhKb6HP24N+mbFVZUMuL/
         OXQh3ESRxnRRI+ByLt4jU3mP0y8IfXV+EWpLSfH1ej0clhpfpWvGs7Znc7SDi9Nxb0Ga
         SSSXyhQohMO/tl9CXz67kWpjjcr/KLA0s3XYpP39qxoKFfPZjoMq27UtItnG5JlDgE6s
         z4GrkSjnga5DV9r3L2t4XIugQDv9nnLgARB8Q2/vxp+YDh7t7pFvszesNWnQg/eVcdz+
         fWTI+6NGq4uKYrjfR5XpvcfODAPnKbTqBNaeyAWiD+InW60pctfLvIUNhKoSKTV16Ke2
         77NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778057150; x=1778661950;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqf/TgdeYWStRELFhd5bFyr71dKgZm98KPqHwV+WZwA=;
        b=QBW/h8qGKfcLUtQY3WjtdJsi2QNcgh+SHMi2xBfRJsZzJ4GKWZdsX6XFJwgsTEWDhe
         ZIeFlfwQ+QkaqDx+skuo6cmnliQqSR+4D6mNToJ+BKDVoF+cDoMorjmIB9keG8VK2Ezt
         IGLF7/k5hG3bHpkURiOFng3/k0wInshzCR8xfBDbMhyKkIQvzn96R5597BmEbmruZtYh
         VUnr3bYsEjkbErSlsaS/KMhxV8FJ8KhU/f02TZhaM5f/vxGI5JGXoAGchpsyttrY7GtK
         QPIHpZSk1q24Z5QiWpU4U2xqtIt9FGTZDiVUYrGcADSIM0CHoqa//lrHIkQx8mKY50Tk
         Dgfw==
X-Gm-Message-State: AOJu0YzkvTesKznTr88Ex9Oo2QoGfoYwv/79a3bhAwm+kEU+nDJ3UOhF
	al2XbYj6wDM1PxcCoz09u07qS7pHVqrEWUixq/b6zO/zpKRAjjz0ID8TJu81zfprVEQ=
X-Gm-Gg: AeBDieu7vhIoeFDhpeOZ/O9w8Ld5QIKEn0W94itR+cgzHZf1HWBE+HaC4kat61EhcdI
	+PhP9QVqjNGyq/+v3P9vRs5B4uXF8hOjV4Ft/7BJ/UuGYl4iGGk64WxEzOYCi7gZYwQ+dlMXut+
	Y4XnJao0mTwCE2Q65HI/aQ/z692Ft3+rUeqVNc6rj2YWbMTb5azziOslZJiQwXxT/6s9zY2zRUh
	knrrs7alr5s77K0RF6Ghhyhgzad1o7ObZvyJmkasSIdEW3RCa/Sgg6z5O4igaWxkpxcRjq9EQjJ
	FvutGB0wAj95chh3RBWCJRCA/LdvmYV/VjHBsv3cT/ipEDQJSPe2sLpxjQKbeTp9m7KSSP5jEod
	qjjA6b9cSFrdoLsf0qoznnRAfcgC34v7lh473W4PiXum/g4dcbe1alC8CbW5CA6weIrluzYlMW4
	d1wtA/DpKguXlEd6XWP7ZDADXbcaXRDLXwX4tWZy8UMh4Hj3l9gIKyXHiZ711uv7rF7EudH/Lop
	9ODZMSTSHnt36F9EoMUTaOksRJvqmOBFPjMtv735rYrsIW2Wo0p+/odOvTmUN3r96xjiAgPsoE=
X-Received: by 2002:a05:600c:a111:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48e51f2f83dmr33455005e9.17.1778057150261;
        Wed, 06 May 2026 01:45:50 -0700 (PDT)
Message-ID: <4ca0f24d-2526-4e49-a4e0-f8497aa8f4b0@suse.com>
Date: Wed, 6 May 2026 10:45:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem with PCI-passthrough to PV guest
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
 <afo7NyXOEsDsVB6i@macbook.local>
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
In-Reply-To: <afo7NyXOEsDsVB6i@macbook.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IvuMaeBmXxWd0E7Ytw33YQLf"
X-purgate-ID: tlsNG-d62444/1778057150-B5744FF4-686D2880/0/0
X-purgate-type: clean
X-purgate-size: 6653
X-Rspamd-Queue-Id: B166C4D80D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.18 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IvuMaeBmXxWd0E7Ytw33YQLf
Content-Type: multipart/mixed; boundary="------------AZJhi2Thl015qQ02a1phxyCK";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <4ca0f24d-2526-4e49-a4e0-f8497aa8f4b0@suse.com>
Subject: Re: Problem with PCI-passthrough to PV guest
References: <04c8ed4e-4e99-46ae-b83d-af9031f5b622@suse.com>
 <afo7NyXOEsDsVB6i@macbook.local>
In-Reply-To: <afo7NyXOEsDsVB6i@macbook.local>

--------------AZJhi2Thl015qQ02a1phxyCK
Content-Type: multipart/mixed; boundary="------------QgjW4n67pUsDOjIoliUeZfQO"

--------------QgjW4n67pUsDOjIoliUeZfQO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDUuMjYgMjA6NDcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFR1ZSwg
TWF5IDA1LCAyMDI2IGF0IDA1OjUzOjMxUE0gKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6
DQo+PiBTVVNFIFFBIGlzIHNlZWluZyBhIHByb2JsZW0gd2l0aCBQQ0ktcGFzc3Rocm91Z2gg
b2YgYSBTUi1JT1YgdG8gYSBQViBndWVzdA0KPj4gcnVubmluZyBhIDYuNCBiYXNlZCBrZXJu
ZWwsIGJ1dCBJIGNhbiByZXByb2R1Y2UgdGhlIHByb2JsZW0gd2l0aCB1cHN0cmVhbQ0KPj4g
a2VybmVsLCB0b28uDQoNClVoLCBzZWVtcyBteSB0ZXN0ZWQga2VybmVsIHdhcyBvbmx5ICJu
ZWFybHkgdXBzdHJlYW0iIChpdCB3YXMgYW4gZWFybHkNCjcuMCBrZXJuZWwpLiBJdCB3YXMg
bWlzc2luZyBjb21taXQgMDk0OWM2NDZkNjQ2LCB3aGljaCBtYWtlcyB0aGUgZGlmZmVyZW5j
ZS4NCg0KU28gZm9yIG5vdyB0aGlzIGlzc3VlIHdpbGwgb25seSBzaG93IHVwIGZvciBjYXNl
cyB3aGVyZSBhIFBWLWd1ZXN0IGlzDQpzZXR1cCBmb3IgUENJIHBhc3N0aHJvdWdoIGFuZCBp
dCBnZXRzIG1lbW9yeSBob3RwbHVnZ2VkIGJlZm9yZSB0aGUgUENJDQpkZXZpY2UgaXMgYWRk
ZWQgdG8gaXQuDQoNCg0KSnVlcmdlbg0K
--------------QgjW4n67pUsDOjIoliUeZfQO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------QgjW4n67pUsDOjIoliUeZfQO--

--------------AZJhi2Thl015qQ02a1phxyCK--

--------------IvuMaeBmXxWd0E7Ytw33YQLf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmn6/70FAwAAAAAACgkQsN6d1ii/Ey8T
YQf/U9zGdFF8fQdgHy6cxdqIrNR0nqjO31iyHnNMQEzQZtSJ7k5za7eblPBT8U6jJRDMedUrea1S
oPgVPBH6NxE3sDVZcstTYr6WKuDSokwpo6cX39j/+LsD1O5NOQ+vw2XuRHnjWjrTeCLvpE1lK4AL
s/GTzFdhjw6Ub0s3TEmjtvKNyuIuP2N7kOflEku9LYyu19mpi3tSRbsHL+oIci4b1TB3Fqh05sLW
BrdiNVMu418/bZ1eVRhU6Bf1Z8GL72M329jgg2AXiALHMhKjBT8Bv2cc745K4g2bViYh4YkaedR8
QXEESkQnUCCuHFFWWSiNttGg9xFRqpCuTsgMvsfBdw==
=9s3a
-----END PGP SIGNATURE-----

--------------IvuMaeBmXxWd0E7Ytw33YQLf--

