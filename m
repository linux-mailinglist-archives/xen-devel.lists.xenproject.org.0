Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CBXCRurpWmpDgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:22:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5911DBB98
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244328.1543770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx55i-0001Kp-Ey; Mon, 02 Mar 2026 15:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244328.1543770; Mon, 02 Mar 2026 15:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx55i-0001J2-Br; Mon, 02 Mar 2026 15:21:50 +0000
Received: by outflank-mailman (input) for mailman id 1244328;
 Mon, 02 Mar 2026 15:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tIQT=BC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vx55g-0001Is-OQ
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:21:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87279418-164b-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:21:47 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4837584120eso33136355e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 07:21:47 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75df9fsm491001415e9.13.2026.03.02.07.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 07:21:46 -0800 (PST)
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
X-Inumbo-ID: 87279418-164b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772464907; x=1773069707; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ETlvC185db5TbfgIdZN3woKwjLCVJdZ9mMDN+oYJ5tI=;
        b=OsEeR0/UnBedT/WH4A/AZFgpZeOKUA/viGv0q/jMAh91XZORd5vBs/8swBe75PklDK
         nURCX/IUMTuwilWq0+ZKduj+YHo+aULzjFal7nVZcv+I4D4qonxqy0ip89i/7HmuLp5N
         DR9EcN3G4rnZhSeMxoBjm9H6YPavOQIDsHTu2+cTKRSRCA/1QEsUPRaDR6oTgyRyxXRg
         mt8MD4al4HKI2R6aVc+0sDgXVffg2/QB2j1xn1g3OXdhcqZVnk0OPK/BogTeGQz0bg+z
         bbUPN7K8Ig6A0bdbZpn7BIfJ89FWWjIvgvcSX7IFZ6WXM7qPsVnL5gywq9Iefl22Mvsh
         yCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464907; x=1773069707;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETlvC185db5TbfgIdZN3woKwjLCVJdZ9mMDN+oYJ5tI=;
        b=DcdJUtgIPhhgeui6FSpe3Hbg7fHRjGlV1KAJMDs0iJBwtu9yeYNfJEYXd+kGSo9v3W
         iY0aV41ffFgRY2pTqGF+ibOETAy+W38XeU6/tf6+ThpbTC4oGau4YKQ3mO9d9R1u/pqY
         YfCZS4XQGBHtgNNVcjirhWbuAZkOERv2JsPL2zxOEpmaz0D2Jv9KpndQT61jcNvJeLBd
         3UIXErQX+XcipQ8nTVMhNRXp84nPN3yg0xGUjs8ttPqiEU0GmyDaFPmsMLe+Cx5f6gJH
         KGxITmcXph9RYw2350l+TRw6idtErPSVuwWiYd/JF65Vm62teWMKUEYjqOstL46C4EQE
         T+SQ==
X-Gm-Message-State: AOJu0Yx9EyhDIp7Oi0gUaW5Np4ZO9R1/mtPwaFWBnLTchhZVW73uayZt
	NU7pfevhhAfqezy9FHcnmUZDK8JdKYoOPV38XMExMZ1OsxQwH+UiFcMDAqaZm78rRn8=
X-Gm-Gg: ATEYQzztJTcavlUNdJmKi1SIKrjGhhFUGk4XQCpCoU3orei8TAbYhJ9HES9vrkm6SGo
	itjlFiLcT7gnGuFlPwvJhXGL1a1LKcBx99IbQZgI4cfn4PtAZfA8i95GPedCX5YCjAeWq7/ypFY
	i5HXj694J7HHEOgwActyVtFRa+G6ItUVpnt049vK3snIqLfCB2YRnhCh6eCME8rwC5hWPiE71UN
	ptv8X54ejOp86sZT5L/Snf2LTs6qFaUXM39GBfzCjQHYGPJuxC/d4PmUyDOmpUNVd1i3H1akc37
	It0tm/BkaCf0t3DQqAa0qKJUi+5jwQ+U5+Fp+xyx6hw7CkGrZ/4YWMSWkiQPGefrTBxqbe4Ps7Y
	b+HsYirZdDLuUNnNsvGw/7mFhL/aoW9wtW1z94I355rHCb3C9h7Lx5cid2cXbkLnKB/wRZsfwZe
	JSxaZ8CJG4IicZ3xnhWPTPlSBdSATB8rdLJQgOVvBId1D5h7y4typJ1/R/5lvyOtCPl8VUgrF1j
	19Pd1gsjDSdNrijJFTGwpk0cztbMirjgYldjBTi5dhdHvHVhG+EiowxK7q0gbWn
X-Received: by 2002:a05:600c:1e89:b0:483:badb:618b with SMTP id 5b1f17b1804b1-483c9bc55e1mr209049255e9.24.1772464906439;
        Mon, 02 Mar 2026 07:21:46 -0800 (PST)
Message-ID: <9d30d9ea-c080-45ff-a77d-30f79d4e800e@suse.com>
Date: Mon, 2 Mar 2026 16:21:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
 <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org> <aaVuB3x3y4ROr5XA@mail-itl>
 <663cff60-8181-4a47-beff-204bfe01bb06@kernel.org> <aaWohimzb5P8n0YU@mail-itl>
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
In-Reply-To: <aaWohimzb5P8n0YU@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y09wBeURikoDRh6YDGjmJ4El"
X-Rspamd-Queue-Id: 8A5911DBB98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:david@kernel.org,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,m:vbabka@suse.cz,m:linux-mm@kvack.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	HAS_ATTACHMENT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y09wBeURikoDRh6YDGjmJ4El
Content-Type: multipart/mixed; boundary="------------e1DxIpki1MRw3sNDu0gCKGiO";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 linux-mm@kvack.org
Message-ID: <9d30d9ea-c080-45ff-a77d-30f79d4e800e@suse.com>
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
 <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org> <aaVuB3x3y4ROr5XA@mail-itl>
 <663cff60-8181-4a47-beff-204bfe01bb06@kernel.org> <aaWohimzb5P8n0YU@mail-itl>
In-Reply-To: <aaWohimzb5P8n0YU@mail-itl>

--------------e1DxIpki1MRw3sNDu0gCKGiO
Content-Type: multipart/mixed; boundary="------------v5nbIR44GMrnBS70Yhw0f5mu"

--------------v5nbIR44GMrnBS70Yhw0f5mu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDMuMjYgMTY6MTEsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gTW9uLCBNYXIgMDIsIDIwMjYgYXQgMDM6NTQ6MTJQTSArMDEwMCwgRGF2aWQgSGls
ZGVuYnJhbmQgKEFybSkgd3JvdGU6DQo+Pj4NCj4+Pj4gV2hhdGV2ZXIgbGVhdmVzIHRoZSBi
dWRkeSBzaGFsbCBiZSB6ZXJvZWQgb3V0LiBJZiB0aGVyZSBpcyBhDQo+Pj4+IGRvdWJsZS16
ZXJvaW5nIGhhcHBlbiwgdGhlIGxhdHRlciBjb3VsZCBnZXQgb3B0aW1pemVkIG91dCBieSBj
aGVja2luZw0KPj4+PiBzb21ldGhpbmcgbGlrZSB1c2VyX2FsbG9jX25lZWRzX3plcm9pbmco
KS4NCj4+Pj4NCj4+Pj4gU2VlIG1tL2h1Z2VfbWVtb3J5LmM6dm1hX2FsbG9jX2Fub25fZm9s
aW9fcG1kKCkgYXMgYW4gZXhhbXBsZSB3aGVyZSB3ZQ0KPj4+PiBhdm9pZCBkb3VibGUtemVy
b2luZy4NCj4+Pg0KPj4+IEl0IGlzbid0IGp1c3QgcmVkdWNpbmcgZG91YmxlLXplcm9pbmcg
dG8gc2luZ2xlIHplcm9pbmcuIEl0J3MgYWJvdXQNCj4+PiBhdm9pZGluZyB6ZXJvaW5nIHN1
Y2ggcGFnZXMgYXQgYWxsLiBJZiBhIGRvbVUgaXMgc3RhcnRlZCB3aXRoDQo+Pj4gcG9wdWxh
dGUtb24tZGVtYW5kLCBtYW55IChzb21ldGltZXMgbW9zdCkgb2YgaXRzIHBhZ2VzIGFyZSBw
b3B1bGF0ZWQgaW4NCj4+PiBFUFQuIFRoZSBpZGVhIG9mIFBvRCBpcyB0byBzdGFydCBndWVz
dCB3aXRoIGhpZ2ggc3RhdGljIG1lbW9yeSBzaXplLCBidXQNCj4+PiBsb3cgYWN0dWFsIGFs
bG9jYXRpb24gYW5kIGZha2UgaXQgdW50aWwgYmFsbG9vbiBkcml2ZXIga2lja3MgaW4gYW5k
IG1ha2UNCj4+PiB0aGUgZG9tVSByZWFsbHkgbm90IHVzZSBtb3JlIHBhZ2VzIHRoYW4gaXQg
aGFzLiBXaGVuIGJhbGxvb24gZHJpdmVyIHRyeQ0KPj4+IHRvIHJldHVybiB0aG9zZSBwYWdl
cyB0byB0aGUgaHlwZXJ2aXNvciwgbm9ybWFsbHkgaXQgd291bGQganVzdCB0YWtlDQo+Pj4g
dW5hbGxvY2F0ZWQgcGFnZSBvbmUgYnkgb25lIGFuZCBtYWRlIExpbnV4IG5vdCB1c2UgdGhl
bS4gQnV0IGlmIF9hbnlfDQo+Pj4gemVyb2luZyBpcyBoYXBwZW5pbmcsIGVhY2ggcGFnZSBm
aXJzdCBuZWVkcyB0byBiZSBtYXBwZWQgdG8gdGhlIGd1ZXN0IGJ5DQo+Pj4gdGhlIGh5cGVy
dmlzb3IgKG9uZSB0cmlwIHRocm91Z2ggRVBUKSwganVzdCB0byBiZSByZW1vdmVkIGZyb20g
dGhlbSBhDQo+Pj4gbW9tZW50IGxhdGVyLi4uDQo+Pg0KPj4gVGhlIHNhbWUgaXMgdHJ1ZSBm
b3IgbW9zdCBiYWxsb29uIGRyaXZlcnMsIGluY2x1ZGluZyB2aXJ0aW8tYmFsbG9vbi4NCj4+
DQo+PiBTbyBmYXIgbm9ib2R5IHJlYWxseSBjYXJlZCBhYm91dCB0aGF0LCB0aG91Z2gsIGFz
IGluaXRfb25fZnJlZSB1c3VhbGx5DQo+PiBjb21lcyB3aXRoIHN1Y2ggYSBoaWdoIHBlcmZv
cm1hbmNlIHByaWNlIHRhZyB0aGF0IHBlb3BsZSBpbiBjaGVhcCBWTXMNCj4+ICh3aGVyZSB5
b3Ugb3ZlcmNvbW1pdCBldGMpIGRvbid0IGVuYWJsZSBpdC4NCj4+DQo+PiBfX0dGUF9CQUxM
T09OX09VVCBpcyBqdXN0IG5hc3R5Lg0KPj4NCj4+IFdlIGNvdWxkIHByb2JhYmx5IGhhdmUg
YSBzcGVjaWFsIGFsbG9jYXRpb24gaW50ZXJmYWNlIChub3QgZXhwb3NlZCB0bw0KPj4gYXJi
aXRyYXJ5IGtlcm5lbCBtb2R1bGVzKSBhbmQgaGF2ZSB0aGluZ3MgbGlrZSBtbS9iYWxsb29u
LmMgY29uc3VtZSB0aGF0Lg0KPj4NCj4+DQo+PiBJSVVDLCB4ZW4gYmFsbG9vbiBkb2VzIG5v
dCB1c2UgdGhlIG1lbW9yeSBiYWxsb29uIGluZnJhc3RydWN0dXJlLA0KPj4gdGhvdWdoLg0K
PiANCj4gSXMgdGhlcmUgc29tZSBmdW5kYW1lbnRhbCByZWFzb24gZm9yIHRoYXQ/IEJ5IGxv
b2tpbmcgYXQgdGhlIGNvZGUsIHRoZQ0KPiBtaWdyYXRpb24gdG8gdXNlIG1tL2JhbGxvb24u
YyBzaG91bGRuJ3QgYmUgdGhhdCBoYXJkIChmYW1vdXMgbGFzdA0KPiB3b3Jkcy4uLikuDQoN
Ckkgd2FudGVkIHRvIGRvIHRoYXQgZm9yIHllYXJzLCBidXQgLUVOT1RJTUUuDQoNClBhdGNo
ZXMgd2VsY29tZS4gOi0pDQoNCg0KSnVlcmdlbg0K
--------------v5nbIR44GMrnBS70Yhw0f5mu
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------v5nbIR44GMrnBS70Yhw0f5mu--

--------------e1DxIpki1MRw3sNDu0gCKGiO--

--------------y09wBeURikoDRh6YDGjmJ4El
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmlqwkFAwAAAAAACgkQsN6d1ii/Ey9f
Fwf9EH3eVCcUPnLhmeZGvJl5wVYuyA8jurNChwHN0evqFezznfHweMatiP8h6+gtF0Xv0q9O8DzQ
WuEtAbBogZYxsRMqyRrqBhxLPZ5V9BxPF9/Vbw72Sgjm7s5R9jzXfqTKW5MkHnuvtdwTNZ8DKB0T
t8rRMZeJfoQgQ3BJ0g8kQemPWTjXTxdg+fI6xZTPtzfZBAzUoIIKG1NjPLC+j9UgBk3XdH6SnKXW
Oc1XcKeNQhLkkKUqSBN79tWoWtXU6o6t5rJEHHAAWFVadPuo0ihfTm+67VICHzVrogByCjsZsfEO
elF53pC3zyxFRXizLgr1tbyn+o5Jr+Piip8iCw1Z/g==
=Qr2j
-----END PGP SIGNATURE-----

--------------y09wBeURikoDRh6YDGjmJ4El--

