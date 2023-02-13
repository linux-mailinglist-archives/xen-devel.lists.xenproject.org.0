Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F2693F61
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 09:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494148.764106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRTx6-0005iw-G8; Mon, 13 Feb 2023 08:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494148.764106; Mon, 13 Feb 2023 08:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRTx6-0005fz-CS; Mon, 13 Feb 2023 08:12:44 +0000
Received: by outflank-mailman (input) for mailman id 494148;
 Mon, 13 Feb 2023 08:12:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DRhn=6J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pRTx4-0005ft-IR
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 08:12:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e977e6d-ab76-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 09:12:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0684C67A96;
 Mon, 13 Feb 2023 08:12:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6406138E6;
 Mon, 13 Feb 2023 08:12:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id maG3Kvbw6WOJMgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Feb 2023 08:12:38 +0000
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
X-Inumbo-ID: 2e977e6d-ab76-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676275959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Goj0CVYbqJm9f9dvo9/K7xYI+JDbxMaoqo4CZZFkBBk=;
	b=LQEMz/X/MWGXbrqTPHrYKwlbxa3iGttJOvMPqltHTvt6iWpcUhsSJsA8ivRxYAn505tiH1
	YWPgsupEz7eQLntjATa0KJapT1vpEP+6wq1sPOSMfCu3z+COXwKAHqNZinKleJ6elF85tQ
	hRSvtR6JjWXasMKTeKQgCCUEsrCRfTM=
Message-ID: <f1715894-8bb5-fef9-3f92-77ae293ebfb4@suse.com>
Date: Mon, 13 Feb 2023 09:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH][next] xen: Replace one-element array with flexible-array
 member
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <Y9xjN6Wa3VslgXeX@work>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <Y9xjN6Wa3VslgXeX@work>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eNpq4uVnbNf970ybwQrjr0CB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eNpq4uVnbNf970ybwQrjr0CB
Content-Type: multipart/mixed; boundary="------------BMX3LvNHt974ooZRj4nUmQiw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Message-ID: <f1715894-8bb5-fef9-3f92-77ae293ebfb4@suse.com>
Subject: Re: [PATCH][next] xen: Replace one-element array with flexible-array
 member
References: <Y9xjN6Wa3VslgXeX@work>
In-Reply-To: <Y9xjN6Wa3VslgXeX@work>

--------------BMX3LvNHt974ooZRj4nUmQiw
Content-Type: multipart/mixed; boundary="------------0z5CCKY7k5kyMrtZRYWOKqVY"

--------------0z5CCKY7k5kyMrtZRYWOKqVY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDIuMjMgMDI6MjgsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6DQo+IE9uZS1l
bGVtZW50IGFycmF5cyBhcmUgZGVwcmVjYXRlZCwgYW5kIHdlIGFyZSByZXBsYWNpbmcgdGhl
bSB3aXRoIGZsZXhpYmxlDQo+IGFycmF5IG1lbWJlcnMgaW5zdGVhZC4gU28sIHJlcGxhY2Ug
b25lLWVsZW1lbnQgYXJyYXkgd2l0aCBmbGV4aWJsZS1hcnJheQ0KPiBtZW1iZXIgaW4gc3Ry
dWN0IHhlbl9wYWdlX2RpcmVjdG9yeS4NCj4gDQo+IFRoaXMgaGVscHMgd2l0aCB0aGUgb25n
b2luZyBlZmZvcnRzIHRvIHRpZ2h0ZW4gdGhlIEZPUlRJRllfU09VUkNFDQo+IHJvdXRpbmVz
IG9uIG1lbWNweSgpIGFuZCBoZWxwIHVzIG1ha2UgcHJvZ3Jlc3MgdG93YXJkcyBnbG9iYWxs
eQ0KPiBlbmFibGluZyAtZnN0cmljdC1mbGV4LWFycmF5cz0zIFsxXS4NCj4gDQo+IFRoaXMg
cmVzdWx0cyBpbiBubyBkaWZmZXJlbmNlcyBpbiBiaW5hcnkgb3V0cHV0Lg0KPiANCj4gTGlu
azogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzc5DQo+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8yNTUNCj4gTGluazogaHR0cHM6
Ly9nY2MuZ251Lm9yZy9waXBlcm1haWwvZ2NjLXBhdGNoZXMvMjAyMi1PY3RvYmVyLzYwMjkw
Mi5odG1sIFsxXQ0KPiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0
YXZvYXJzQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=
--------------0z5CCKY7k5kyMrtZRYWOKqVY
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0z5CCKY7k5kyMrtZRYWOKqVY--

--------------BMX3LvNHt974ooZRj4nUmQiw--

--------------eNpq4uVnbNf970ybwQrjr0CB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPp8PYFAwAAAAAACgkQsN6d1ii/Ey+9
uQf/eQfbMt2KRzkI4NOdIg9qgtM1yIbcE6jCTytb2TlPZD1woI72l+dOp7H/O9blL0vuRMZcd7wk
icr1zJWysBJ9ZSJSZyPbHwbwX9A37t8L+DvK6gIbgm8tg6Si1jHY9KlvvxrzWJx0Qwtcl0dptfZY
6gjk/PEgxzbh1+dwFBApHucTQLZoxr9WXQVpzItZobKArtLTLbnHjvz7Nnqoxh2ljkRvue0QqjhA
xTZeBaoow5rzQOVCyt5v+u0xxuPm1h0k33q2ScNl5Eapli/Cez1mtmiQSIa4mg8QTr5kYTwZGk3f
7wE/ZmlgP8nl5gXkM/cGCX1ANdOSlmdL3puiPcVNhg==
=gH+G
-----END PGP SIGNATURE-----

--------------eNpq4uVnbNf970ybwQrjr0CB--

