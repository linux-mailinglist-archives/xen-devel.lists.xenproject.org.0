Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A7E602EE9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 16:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425078.672854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknyc-000426-QP; Tue, 18 Oct 2022 14:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425078.672854; Tue, 18 Oct 2022 14:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oknyc-0003zT-Nl; Tue, 18 Oct 2022 14:53:54 +0000
Received: by outflank-mailman (input) for mailman id 425078;
 Tue, 18 Oct 2022 14:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4KBa=2T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oknyb-0003zM-Ac
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 14:53:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adccab35-4ef4-11ed-8fd0-01056ac49cbb;
 Tue, 18 Oct 2022 16:53:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6762521883;
 Tue, 18 Oct 2022 14:53:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E093713480;
 Tue, 18 Oct 2022 14:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mDKRNf69TmMFUAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 18 Oct 2022 14:53:50 +0000
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
X-Inumbo-ID: adccab35-4ef4-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666104831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bF3DrP31+GvB7zHSheslhxfSA2LjZWK4h34WoFWlWag=;
	b=uhEmpL+LqowFZpMis7rdL+XyM6ZyRWbZkXDYzYHWmF2taWuaLa2ZLBJo3GVuQiN6nQgV+b
	gd2k8uQWaCXYnJnPs19QlmYM7s+Qd53ecAQ5kSiVCAhSmoYvEh1yx8wuzMGdyGn2ZHwnQp
	3farCF8MEbGro7jEb0RxubTSemck+zo=
Message-ID: <e0448dac-a35e-cfd0-c087-411558512b5e@suse.com>
Date: Tue, 18 Oct 2022 16:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
To: Christoph Hellwig <hch@lst.de>, Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20221018082413.GA25785@lst.de>
 <a5966644-72d7-4b25-83d1-9765d0593e44@suse.com>
 <20221018110243.GA4655@lst.de>
 <d67ceabb-b31a-59e6-fc77-8d6c48b277f2@suse.com>
 <20221018143320.GA19106@lst.de>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20221018143320.GA19106@lst.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dc3TknTbH6vDjCxs96kqh3VL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dc3TknTbH6vDjCxs96kqh3VL
Content-Type: multipart/mixed; boundary="------------Kgg0bGLcOQl0evOUdHqCwYPG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Christoph Hellwig <hch@lst.de>, Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 regressions@lists.linux.dev, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, Robert Beckett <bob.beckett@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <e0448dac-a35e-cfd0-c087-411558512b5e@suse.com>
Subject: Re: i915 "GPU HANG", bisected to a2daa27c0c61 "swiotlb: simplify
 swiotlb_max_segment"
References: <20221018082413.GA25785@lst.de>
 <a5966644-72d7-4b25-83d1-9765d0593e44@suse.com>
 <20221018110243.GA4655@lst.de>
 <d67ceabb-b31a-59e6-fc77-8d6c48b277f2@suse.com>
 <20221018143320.GA19106@lst.de>
In-Reply-To: <20221018143320.GA19106@lst.de>

--------------Kgg0bGLcOQl0evOUdHqCwYPG
Content-Type: multipart/mixed; boundary="------------HP4PX2rd4ybSjA8vplorqVEm"

--------------HP4PX2rd4ybSjA8vplorqVEm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTAuMjIgMTY6MzMsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiBPbiBUdWUs
IE9jdCAxOCwgMjAyMiBhdCAwNDoyMTo0M1BNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+IExlYXZpbmcgdGhlICJpOTE1IGFidXNlcyIgcGFydCBhc2lkZSAoYmVjYXVzZSBJIGNh
bid0IHRlbGwgd2hhdCBleGFjdGx5IHRoZQ0KPj4gYWJ1c2UgaXMpLCBidXQgYXNzdW1pbmcg
dGhhdCAiY2FuJ3QgY29wZSB3aXRoIGJvdW5jZSBidWZmZXJpbmciIG1lYW5zIHRoZXkNCj4+
IGRvbid0IGFjdHVhbGx5IHVzZSB0aGUgYWxsb2NhdGVkIGJ1ZmZlcnMsIEknZCBzdWdnZXN0
IHRoaXM6DQo+IA0KPiBFeGNlcHQgZm9yIG9uZSBvZGQgcGxhY2UgaTkxNSBuZXZlciB1c2Vz
IGRtYV9hbGxvY18qIGJ1dCBhbHdheXMgYWxsb2NhdGVzDQo+IG1lbW9yeSBpdHNlbGYgYW5k
IHRoZW4gbWFwcyBpdCwgYnV0IHRoZW4gdHJlYXRzIGl0IGFzIGlmIGl0IHdhcyBhDQo+IGRt
YV9hbGxvY19jb2hlcmVudCBhbGxvY2F0aW9ucywgdGhhdCBpcyBuZXZlciBkb2VzIG93bmVy
c2hpcCBjaGFuZ2VzLg0KPiANCj4+IEkndmUgZHJvcHBlZCB0aGUgVERYIHJlbGF0ZWQgcmVt
YXJrIGJlY2F1c2UgSSBkb24ndCB0aGluayBpdCdzIG1lYW5pbmdmdWwNCj4+IGZvciBQViBn
dWVzdHMuDQo+IA0KPiBUaGlzIHJlbWFyayBpcyBmb3IgVERYIGluIGdlbmVyYWwsIG5vdCBY
ZW4gcmVsYXRlZC4gIFdpdGggVERYIGFuZCBvdGhlcg0KPiBjb25maWRlbnRhdGlhbCBjb21w
dXRpbmcgc2NoZW1lcywgYWxsIERNQSBtdXN0IGJlIGJvdW5jZSBidWZmZXJlZCwgYW5kDQo+
IGFsbCBkcml2ZXJzIHNraXBwaW5nIGRtYV9zeW5jKiBjYWxscyBhcmUgYnJva2VuLg0KPiAN
Cj4+IE90b2ggSSd2ZSBsZWZ0IHRoZSAiYWJ1c2VzIGlnbm9yZXMiIHdvcmQgc2VxdWVuY2Ug
YXMgaXMsIG5vDQo+PiBtYXR0ZXIgdGhhdCBpdCByZWFkcyBvZGQgdG8gbWUuIFBsdXMsIGFz
IGhpbnRlZCBhdCBiZWZvcmUsIEknbSBub3QNCj4+IGNvbnZpbmNlZCB0aGUgSVNfRU5BQkxF
RCgpIHVzZSBpcyBhY3R1YWxseSBuZWNlc3Nhcnkgb3Igd2FycmFudGVkIGhlcmUuDQo+IA0K
PiBJZiB3ZSBkb24ndCBuZWVkIHRoZSBJU19FTkFCTEVEIGlzIG5vdCBuZWVkZWQgSSdtIGFs
bCBmb3IgZHJvcHBpbmcgaXQuDQo+IEJ1dCB1bmxlc3MgSSBtaXNyZWFkIHRoZSBjb2RlLCBv
biBhcm0vYXJtNjQgZXZlbiBQViBndWVzdHMgYXJlIDE6MQ0KPiBtYXBwZWQgc28gdGhhdCBh
bGwgTGludXggcGh5c2ljYWxseSBjb250aWdvdXMgbWVtb3J5IGFsc28gaXMgWGVuDQo+IGNv
bnRpZ291cywgc28gd2UgZG9uJ3QgbmVlZCB0aGUgaGFjay4NCg0KVGhlcmUgYXJlIG5vIFBW
IGd1ZXN0cyBvbiBhcm0vYXJtNjQuDQoNCg0KSnVlcmdlbg0K
--------------HP4PX2rd4ybSjA8vplorqVEm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HP4PX2rd4ybSjA8vplorqVEm--

--------------Kgg0bGLcOQl0evOUdHqCwYPG--

--------------dc3TknTbH6vDjCxs96kqh3VL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNOvf4FAwAAAAAACgkQsN6d1ii/Ey+9
8Qf+JxxMZEdEGyEjsJpPt47ZJcyUfuvyHf4WDR8qZjfA5REOBj3vzoCPls41mnZKRxb+Q3Hm+aZp
UG0JJKo8XA9PiqrI87WOza8ogApFg0Cfizhyuw7V5a/HJGuGmGbsgRhphQLhpVXi7HODv1qc2iPL
NIxi93tZAYo3lI2mCp2H8FV/okYkz8gtiaOtaP9KciQJV7ccttWIVVVD5PCkBgqRyu0Ko/L6F24C
AD/db7b/Dv8oc/pbAf/0vfUa/zaoFLzOt442UfIcKgYB3TtX3yGTRdJbWGL4OSo91oTlKzCBR+oM
bMJYClYr1+UbHfeGeGkLHwb9KBuOs65u79bb1Uudkg==
=qg+p
-----END PGP SIGNATURE-----

--------------dc3TknTbH6vDjCxs96kqh3VL--

