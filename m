Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D95F7A51
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 17:11:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418082.662840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogozl-0007Um-PG; Fri, 07 Oct 2022 15:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418082.662840; Fri, 07 Oct 2022 15:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogozl-0007SF-Mf; Fri, 07 Oct 2022 15:10:37 +0000
Received: by outflank-mailman (input) for mailman id 418082;
 Fri, 07 Oct 2022 15:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ogozk-0007S9-8I
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 15:10:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310bad83-4652-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 17:10:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0889211C3;
 Fri,  7 Oct 2022 15:10:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA80913A9A;
 Fri,  7 Oct 2022 15:10:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fEN9J2lBQGO7JgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 07 Oct 2022 15:10:33 +0000
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
X-Inumbo-ID: 310bad83-4652-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1665155433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9NyaT9kc7y2hABIl2Ej5DgC0r071ytcPJuf8xermk8=;
	b=CaOHIGOZFZt9dj2LYvEYX4OkngiTbpUmGdHrW+ZMcHT9pA9H+vMyZRHxrSSBKMyzKalxZR
	a6t42FtdPnm5L46/ZL3c88gDmYkjUirA56uFTOAgjRTqWxGNpEbrw8Js4YLsGTGQUfK78G
	T4Q3CNh/ybOQEhubChhdndqgf4zIAMI=
Message-ID: <090c9202-68ed-a62b-c10a-350e1531bd90@suse.com>
Date: Fri, 7 Oct 2022 17:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] xen/virtio: Handle cases when page offset > PAGE_SIZE
 properly
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20221007132736.2275574-1-olekstysh@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221007132736.2275574-1-olekstysh@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eG0Azqfrz4Pl3dZ20BiE4UjI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eG0Azqfrz4Pl3dZ20BiE4UjI
Content-Type: multipart/mixed; boundary="------------zrU2QzhXpGsV8GuX8utfpQG4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Message-ID: <090c9202-68ed-a62b-c10a-350e1531bd90@suse.com>
Subject: Re: [PATCH] xen/virtio: Handle cases when page offset > PAGE_SIZE
 properly
References: <20221007132736.2275574-1-olekstysh@gmail.com>
In-Reply-To: <20221007132736.2275574-1-olekstysh@gmail.com>

--------------zrU2QzhXpGsV8GuX8utfpQG4
Content-Type: multipart/mixed; boundary="------------wFlYredAldefDdUApsew02Gt"

--------------wFlYredAldefDdUApsew02Gt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTAuMjIgMTU6MjcsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiBGcm9t
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
DQo+IA0KPiBQYXNzZWQgdG8geGVuX2dyYW50X2RtYV9tYXBfcGFnZSgpIG9mZnNldCBpbiB0
aGUgcGFnZQ0KPiBjYW4gYmUgPiBQQUdFX1NJWkUgZXZlbiBpZiB0aGUgZ3Vlc3QgdXNlcyB0
aGUgc2FtZSBwYWdlIGdyYW51bGFyaXR5DQo+IGFzIFhlbiAoNEtCKS4NCj4gDQo+IEJlZm9y
ZSBjdXJyZW50IHBhdGNoLCBpZiBzdWNoIGNhc2UgaGFwcGVuZWQgd2UgZW5kZWQgdXAgcHJv
dmlkaW5nDQo+IGdyYW50cyBmb3IgdGhlIHdob2xlIHJlZ2lvbiBpbiB4ZW5fZ3JhbnRfZG1h
X21hcF9wYWdlKCkgd2hpY2gNCj4gd2FzIHJlYWxseSB1bm5lY2Vzc2FyeS4gVGhlIG1vcmUs
IHdlIGVuZGVkIHVwIG5vdCByZWxlYXNpbmcgYWxsDQo+IGdyYW50cyB3aGljaCByZXByZXNl
bnRlZCB0aGF0IHJlZ2lvbiBpbiB4ZW5fZ3JhbnRfZG1hX3VubWFwX3BhZ2UoKS4NCj4gDQo+
IEN1cnJlbnQgcGF0Y2ggdXBkYXRlcyB0aGUgY29kZSB0byBiZSBhYmxlIHRvIGRlYWwgd2l0
aCBzdWNoIGNhc2VzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVu
a28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KDQpSZXZpZXdlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------wFlYredAldefDdUApsew02Gt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------wFlYredAldefDdUApsew02Gt--

--------------zrU2QzhXpGsV8GuX8utfpQG4--

--------------eG0Azqfrz4Pl3dZ20BiE4UjI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNAQWkFAwAAAAAACgkQsN6d1ii/Ey9w
cwf5AVa4s11Y5TevJXo/7Xv6prUoX8Mb6XJ9VNtq6sVZ2QkeRLYsl1YIfP5kKZCJGnZd+Dmz6LR4
J28x7tykCI6ETL3xkZugQ8N6N4wUFX/jFeldfGqJ88E9szfsH+AXun+IKFIP5ERenZeZrHsc3l9u
uY5JFKB638pauo0ZAqWKwyOw0c2D83ODznUTLAiTGDmAun3ududV93gveG4JZshcrvIDad5qMvis
hCJBd8U13qOlseyAN8f8hXknaW2Av07OZ0lVizdWN8bJJwWOl9Dkn1bI5sAmqdZ8arOKd5HelF2S
k9lxdI/asCTVbpYgMPpJVTkqPcZVGNTyIVAHGeZmYg==
=Au6E
-----END PGP SIGNATURE-----

--------------eG0Azqfrz4Pl3dZ20BiE4UjI--

