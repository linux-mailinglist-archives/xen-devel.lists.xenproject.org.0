Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sVVvDMcWMGooNQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:14:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD2B68787E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:14:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EuZxTsgu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338374.1599404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ90m-0008JQ-1W; Mon, 15 Jun 2026 15:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338374.1599404; Mon, 15 Jun 2026 15:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ90l-0008HI-V1; Mon, 15 Jun 2026 15:14:03 +0000
Received: by outflank-mailman (input) for mailman id 1338374;
 Mon, 15 Jun 2026 15:14:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wZ90k-0008Ff-Hq
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:14:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ90j-006yH4-Um
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:14:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3016b9-e002-0a2a0a5209dd-0a2a4507d500-0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:14:01 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a3016b9-229c-0a2a45070019-d155da2db1c1-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:14:01 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c03a466c96aso97445466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:14:01 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb5318d8dsm476577766b.26.2026.06.15.08.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 08:14:00 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781536441; x=1782141241; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=baXP0rsce8RxgN3E4KwK75xIeIhqJL8ydG3/ruWWQ8Y=;
        b=EuZxTsguccJss+Cv72BZK5n/qsFea0bV3yZiGf+vCxaelJ96NNTUdRmrWNmn9WqBiV
         I5L9MG+JTqWkNO7pmOSPHCkkLx6Uz+ySsLhJypphKzLJSSZ67X9TQVXmvInsUMWq5p4L
         vtCy+RQXljv8/BII8w3D5g1flGC2FOke/fAHsHoN1wYz8YLj2X4NO16atWPh8540j/Ik
         Upa0gOYsYLCllrQPFgEVA+VhGJNWtaYWkiIv/48pSd3D66QrSJ8HiJcARtnCyvbVoVJW
         EebJcFZ4NwHEsLyOuwxls+bb6n6PmFbHCnuW5BwTJEUuydMXhv4U5nMvb8z7Te33G0Tf
         M/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536441; x=1782141241;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baXP0rsce8RxgN3E4KwK75xIeIhqJL8ydG3/ruWWQ8Y=;
        b=cqiI2/l2CfI2sH4ugUmRCx5gyeJRkIqYcqIwKLfc0Fe5jvreuzmKQ5JzvcirYi/iSA
         EFm4cb15wy2lZ3UDMq+gDe0xAUbjtlbnZEHMT6HIH9hVsyJ32u0xlJ6qFKagdsisVHdp
         R4nrgUxyEBRHXWzmqQEaKFGHdSDaUSP0ALcbD+6Yc8FMCrGebAJtCfmUatrDFpDLPqeW
         JrES8w8T+8lKJfWt2W0rObHjiL+5z5yvRCUpcJ+EHE/+/AfBGfSIK8ncZb5r6ycoBbOm
         DKPZnW41kJglMGWwUMW586wx2YE3r3fLwPLLroxKp9NFX0oQ7xExWLe59Jj0V/08oH69
         b1rA==
X-Gm-Message-State: AOJu0YyFIbXuYl3D6WyfOu+9/EW6qoryy6vRg0fkMn5hehP4UKZmHmaV
	nIFSAPUS5owllOfGXSTwEQYR8PX85/DsIjkuFKtLAsRIsfYRcppCYPTugjkAcqPfjq4=
X-Gm-Gg: Acq92OE65pRmI1VqjQK6X1eqMvwA5Vs98RXLfumLVbSDd8xoSZ3QuTUlYEk2Jg91g5i
	jTE1Zm3CzdF6OLNI7mR4MNumBCifQpL1oUbYE63GSZVvdpudD8NJr92NSJaALCOIqiqC82as8tu
	fRwbaBtU8BHz3NLqEpTk99d5lxwUWCBX5WMZpK9vos2ekPTBDOkCrUqIfUxxqFetD/J7oLkSBVB
	c35tcWYcB2kvfpThABZoiIV0aCg+apuH1ZCQSp7cbHyasRBVduyxq4VqFm/CJAjRMkVPruAijP1
	lhOSVzGrDc+G5BXzzndUnV/HeekLLDzhVW6H/1i2P/P/jUQh1IgR3VT92jiqnnKUA8TsRF+QPHr
	QMIb6KugGQjEeQc88RnHqQk+wRZieRduk7JKewILvdU1tEVBtFbdwavwft8NifaXIZ8ynHE1QQh
	4pRjcRgxTVfGBdMOa8wqOotDHsEMGyhkamlz+PUuC0KMCF1pWOY1vbQIYKtpVslGJS7zRuEhw/f
	eFtLa2CwzoIdNN/G0xSNm5EuY+Q2VztokBInG2cm4aHfySK9LCfBg==
X-Received: by 2002:a17:906:8a49:b0:bfe:ed25:c563 with SMTP id a640c23a62f3a-bfeed25c992mr358963766b.52.1781536441214;
        Mon, 15 Jun 2026 08:14:01 -0700 (PDT)
Message-ID: <dbc707b0-accd-49a0-96b8-7be2f19dac2f@suse.com>
Date: Mon, 15 Jun 2026 17:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/scsiback: free unsubmitted command instead of
 double-putting it
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
 <20260611123046.2323342-2-michael.bommarito@gmail.com>
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
In-Reply-To: <20260611123046.2323342-2-michael.bommarito@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Jf4ySejmD5HzM4B60G7A8ifN"
X-purgate-ID: tlsNG-ef75cf/1781536441-20961C48-5AD0C9FA/0/0
X-purgate-type: clean
X-purgate-size: 8148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,epam.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-scsi@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AD2B68787E

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Jf4ySejmD5HzM4B60G7A8ifN
Content-Type: multipart/mixed; boundary="------------gFy1erWC8z42liK4wRBk1f9H";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <dbc707b0-accd-49a0-96b8-7be2f19dac2f@suse.com>
Subject: Re: [PATCH 1/2] xen/scsiback: free unsubmitted command instead of
 double-putting it
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
 <20260611123046.2323342-2-michael.bommarito@gmail.com>
In-Reply-To: <20260611123046.2323342-2-michael.bommarito@gmail.com>

--------------gFy1erWC8z42liK4wRBk1f9H
Content-Type: multipart/mixed; boundary="------------d3RfpG0bv0bddNhBytEpBYqL"

--------------d3RfpG0bv0bddNhBytEpBYqL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDYuMjYgMTQ6MzAsIE1pY2hhZWwgQm9tbWFyaXRvIHdyb3RlOg0KPiBzY3NpYmFj
a19nZXRfcGVuZF9yZXEoKSBvYnRhaW5zIGEgY29tbWFuZCB0YWcgYW5kIHJldHVybnMgYQ0K
PiB2c2NzaWJrX3BlbmQgd2hvc2UgZW1iZWRkZWQgc2VfY21kIGhhcyBvbmx5IGJlZW4gbWVt
c2V0IHRvIDAsIHNvDQo+IGl0cyBjbWRfa3JlZiBpcyAwOyB0aGUgc2VfY21kIGlzIGluaXRp
YWxpc2VkIChrcmVmX2luaXQoKSB2aWENCj4gdGFyZ2V0X2luaXRfY21kKCkpIG9ubHkgbGF0
ZXIsIGluIHNjc2liYWNrX2NtZF9leGVjKCksIG9uIHRoZQ0KPiBzdWNjZXNzZnVsIFZTQ1NJ
SUZfQUNUX1NDU0lfQ0RCIHBhdGguIFRoZSB0d28gZXJyb3IgcGF0aHMgaW4NCj4gc2NzaWJh
Y2tfZG9fY21kX2ZuKCkgdGFrZW4gYmVmb3JlIHRoZSBjb21tYW5kIGlzIHN1Ym1pdHRlZCAt
LSBhDQo+IGZhaWxlZCBzY3NpYmFja19nbnR0YWJfZGF0YV9tYXAoKSBhbmQgYW4gdW5rbm93
biByaW5nX3JlcS5hY3QgLS0NCj4gY2FsbCB0cmFuc3BvcnRfZ2VuZXJpY19mcmVlX2NtZCgm
cGVuZGluZ19yZXEtPnNlX2NtZCwgMCksIHdoaWNoDQo+IGtyZWZfcHV0KClzIGEgcmVmY291
bnQgb2YgMC4gVGhhdCB1bmRlcmZsb3dzIGl0ICgicmVmY291bnRfdDoNCj4gdW5kZXJmbG93
OyB1c2UtYWZ0ZXItZnJlZSIpIGFuZCwgYXMgdGhlIHJlbGVhc2UgZnVuY3Rpb24gaXMgbm90
DQo+IHJ1biwgbGVha3MgdGhlIGNvbW1hbmQgdGFnLg0KPiANCj4gSW1wYWN0OiBhIHB2U0NT
SSBndWVzdCBjYW4gbGVhayBldmVyeSBjb21tYW5kIHRhZyBvZiBhIExVTidzDQo+IHNlc3Np
b24sIHN0b3BwaW5nIHRoZSBMVU4sIGJ5IHN1Ym1pdHRpbmcgcmVxdWVzdHMgd2l0aCBhIGJh
ZA0KPiBncmFudCByZWZlcmVuY2Ugb3IgYW4gdW5rbm93biByZXF1ZXN0IHR5cGU7IHVuZGVy
IHBhbmljX29uX3dhcm4NCj4gdGhlIHJlZmNvdW50IHVuZGVyZmxvdyBwYW5pY3MgdGhlIGhv
c3QuDQo+IA0KPiBBZGQgYSBoZWxwZXIgdGhhdCBqdXN0IHJldHVybnMgdGhlIHRhZyB3aXRo
IHRhcmdldF9mcmVlX3RhZygpIGFuZA0KPiBzZW5kcyB0aGUgZXJyb3IgcmVzcG9uc2UuIEl0
IGZyZWVzIHRoZSB0YWcgd2hpbGUgdGhlIHYycCByZWZlcmVuY2UNCj4gc3RpbGwgcGlucyB0
aGUgc2Vzc2lvbiwgYW5kIHNuYXBzaG90cyB0aGUgcmVzcG9uc2UgZmllbGRzDQo+IGJlZm9y
ZWhhbmQgYmVjYXVzZSBmcmVlaW5nIHRoZSB0YWcgY2FuIGxldCBhbm90aGVyIHJpbmcgcmV1
c2UgdGhlDQo+IHBlbmRpbmdfcmVxIHNsb3QuDQo+IA0KPiBGaXhlczogMmRiY2RmMzNkYmY2
ICgieGVuLXNjc2liYWNrOiBDb252ZXJ0IHRvIHBlcmNwdV9pZGEgdGFnIGFsbG9jYXRpb24i
KQ0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBBc3Npc3RlZC1ieTogQ2xhdWRl
OmNsYXVkZS1vcHVzLTQtOA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEJvbW1hcml0byA8
bWljaGFlbC5ib21tYXJpdG9AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------d3RfpG0bv0bddNhBytEpBYqL
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------d3RfpG0bv0bddNhBytEpBYqL--

--------------gFy1erWC8z42liK4wRBk1f9H--

--------------Jf4ySejmD5HzM4B60G7A8ifN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmowFrgFAwAAAAAACgkQsN6d1ii/Ey+O
PAf/Qg12ML1MvaFXxcUkr/ZYb8gAt35wBMav4rH0yQXzWpF6WOyOrncQ6S5bzDOMyJffd+JlDsq9
rvwh2VU3bzxlNzz8tzLk2CHOJ53bUyB/IfBkGmZN9hJ7zMPoUwEVyUxwkWp79JB1HDXWzIoBKpzs
b6MGp3Sg/BwANrz4tKbbWJ+m/GrTOaJNAUb2rJb3XZ7SjcTTWnWPpE2g4ZI4djCbYIUsAXCJXX64
HYkLfTrMWF9LbTjN8tkGy+kUVseyYRvG46nz2VCThoRHi9GZIkPZCHL79Tz1LnrWZ9xiBTMiZvfP
leBsJB6fUa1Zc2v70+ANSnk7DB3hxjzsFc/LdcGFpQ==
=3jap
-----END PGP SIGNATURE-----

--------------Jf4ySejmD5HzM4B60G7A8ifN--

