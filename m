Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F285B8513
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 11:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406885.649290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYOmd-0001LK-5S; Wed, 14 Sep 2022 09:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406885.649290; Wed, 14 Sep 2022 09:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYOmd-0001Ij-1d; Wed, 14 Sep 2022 09:34:15 +0000
Received: by outflank-mailman (input) for mailman id 406885;
 Wed, 14 Sep 2022 09:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oYOmb-0001Id-Qg
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 09:34:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 643fdb3c-3410-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 11:34:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3E6222522;
 Wed, 14 Sep 2022 09:34:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9900F134B3;
 Wed, 14 Sep 2022 09:34:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r2T8IxOgIWM/LQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Sep 2022 09:34:11 +0000
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
X-Inumbo-ID: 643fdb3c-3410-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663148051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mr7DJ+rONRlRTlvy+2ELh9/7A7OmuCGJ3+umwNNxXgM=;
	b=tZzq81NRhCyFGpPkYMpW4W43Ly6vzEB2hgOXxn7bnVELKQ8dmLSKQbl9jYKSentCuH3lRE
	ct3qtreOfAzXTSOAR95EOTP35/NEe3V6HmcxUK7FDtkDXx746sayJ3K8JlFP739GWppbv1
	Qs7Knp/3YS1/fL3SjhQxyPboocM6Jz0=
Message-ID: <739b7b48-c488-5216-064d-ff7fd77e76a6@suse.com>
Date: Wed, 14 Sep 2022 11:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH -next] xen-netfront: make bounce_skb static
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220914064339.49841-1-ruanjinjie@huawei.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220914064339.49841-1-ruanjinjie@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z297QInJ2eAbukrn83P9heiv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z297QInJ2eAbukrn83P9heiv
Content-Type: multipart/mixed; boundary="------------FTlzLylkOtqjiWteUcsK9JYi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: ruanjinjie <ruanjinjie@huawei.com>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <739b7b48-c488-5216-064d-ff7fd77e76a6@suse.com>
Subject: Re: [PATCH -next] xen-netfront: make bounce_skb static
References: <20220914064339.49841-1-ruanjinjie@huawei.com>
In-Reply-To: <20220914064339.49841-1-ruanjinjie@huawei.com>

--------------FTlzLylkOtqjiWteUcsK9JYi
Content-Type: multipart/mixed; boundary="------------EOkORFmsPIA8fXrPfo0M0WHn"

--------------EOkORFmsPIA8fXrPfo0M0WHn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDkuMjIgMDg6NDMsIHJ1YW5qaW5qaWUgd3JvdGU6DQo+IFRoZSBzeW1ib2wgaXMg
bm90IHVzZWQgb3V0c2lkZSBvZiB0aGUgZmlsZSwgc28gbWFyayBpdCBzdGF0aWMuDQo+IA0K
PiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6DQo+IA0KPiAuL2RyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jOjY3NjoxNjogd2FybmluZzogc3ltYm9sICdib3VuY2Vfc2tiJyB3YXMg
bm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPw0KPiANCj4gU2lnbmVkLW9mZi1i
eTogcnVhbmppbmppZSA8cnVhbmppbmppZUBodWF3ZWkuY29tPg0KDQpSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------EOkORFmsPIA8fXrPfo0M0WHn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------EOkORFmsPIA8fXrPfo0M0WHn--

--------------FTlzLylkOtqjiWteUcsK9JYi--

--------------z297QInJ2eAbukrn83P9heiv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMhoBMFAwAAAAAACgkQsN6d1ii/Ey8a
lwgAicNZRZqQAoZQeWQld5M/oFJQWydKiMEX0CTzhggmt6K5qGhDAh5S6fCjySBusrq2r9+q8U74
SmBvrKl4QpI8CyBtPXAdQo5nWjab5N8gOC7crIWqYwCgQf2YOOXFbGz5m0b0ufm1rXaSP/3dapOT
NTKjcRBBX9Zhr01eJ0Zwga3A7m17gc8eTmAlS5U2JKicbfKpywOeLgqfoQz5mxDuZWysjuPg3Twc
xALkdxjYAHSKGlvs68GNzM5dwReCB6pSTsr21+xvX0afp+DJ7qE32A/p8aV1SQ0tguo9QyWSmNi/
1MeYehvVMY5u1TMH5SCwtHiMsCMgG9U/V9iZNNdV3Q==
=SRkQ
-----END PGP SIGNATURE-----

--------------z297QInJ2eAbukrn83P9heiv--

