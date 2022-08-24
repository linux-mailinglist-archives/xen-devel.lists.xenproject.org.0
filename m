Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3FF59F62A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392312.630576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmfQ-0001Ox-JX; Wed, 24 Aug 2022 09:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392312.630576; Wed, 24 Aug 2022 09:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmfQ-0001M0-Ge; Wed, 24 Aug 2022 09:27:20 +0000
Received: by outflank-mailman (input) for mailman id 392312;
 Wed, 24 Aug 2022 09:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQmfP-0001Lu-81
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 09:27:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1d978bc-238e-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 11:27:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C80A2025A;
 Wed, 24 Aug 2022 09:27:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF93513780;
 Wed, 24 Aug 2022 09:27:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2l1cKfTuBWOMAQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 09:27:16 +0000
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
X-Inumbo-ID: f1d978bc-238e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661333237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NqorV2o3cAm6KW/WZYcuOig7YwnnMQJG6cFEbpXaXMw=;
	b=t9wKP7qowZUJIpUUCuhQ5gOB5EGh3hR3rqrWzATX6gpEP7+06Z3+9gk9Oj0brRXnk48y6p
	Zq88iUM50YQ+T2C62smh8Z5g5rFj0PTqsO/IYTsBW3s1ux7JJfD/NPoR/gRi8DmBU70H9X
	bVKtluqeCnDbIYf+lr7PWGXHXWglKlg=
Message-ID: <677b1763-7cd2-e867-9e28-db0779bb6785@suse.com>
Date: Wed, 24 Aug 2022 11:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
 <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
 <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dWsQyMMwOfYb90F8g0l7pbKM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dWsQyMMwOfYb90F8g0l7pbKM
Content-Type: multipart/mixed; boundary="------------cvaJCzThN0Q84027mmYizvrS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Message-ID: <677b1763-7cd2-e867-9e28-db0779bb6785@suse.com>
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
 <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
 <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
In-Reply-To: <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>

--------------cvaJCzThN0Q84027mmYizvrS
Content-Type: multipart/mixed; boundary="------------ENevu0fL4lNIIl3MdanTUFVl"

--------------ENevu0fL4lNIIl3MdanTUFVl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTE6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxNi8wOC8yMDIyIDA3OjQwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE2LjA4LjIw
MjIgMDQ6MzYsIFBlbm55IFpoZW5nIHdyb3RlOg0KPj4+ICt2b2lkIGZyZWVfZG9tc3RhdGlj
X3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkNCj4+PiArew0KPj4+ICvCoMKgwqAgc3Ry
dWN0IGRvbWFpbiAqZCA9IHBhZ2VfZ2V0X293bmVyKHBhZ2UpOw0KPj4+ICvCoMKgwqAgYm9v
bCBkcm9wX2RvbV9yZWY7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKCB1bmxpa2VseSghZCkg
KQ0KPj4+ICvCoMKgwqAgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBBU1NFUlRfVU5SRUFDSEFC
TEUoKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRrKCJUaGUgYWJvdXQtdG8tZnJlZSBz
dGF0aWMgcGFnZSAlIlBSSV9tZm4iIG11c3QgYmUgb3duZWQgYnkgYSANCj4+PiBkb21haW5c
biIsDQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWZuX3gocGFnZV90b19t
Zm4ocGFnZSkpKTsNCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+ICvCoMKgwqAg
fQ0KPj4NCj4+IEZvciB0aGUgbWVzc2FnZSB0byBiZSB1c2VmdWwgYXMgYSBoaW50IGlmIHRo
ZSBhc3NlcnRpb24gdHJpZ2dlcnMsIGl0DQo+PiB3YW50cyBwcmludGluZyBhaGVhZCBvZiB0
aGUgYXNzZXJ0aW9uLiBJIGFsc28gdGhpbmsgaXQgd2FudHMgdG8gYmUgYQ0KPj4gWEVOTE9H
X0dfKiBraW5kIG9mIGxvZyBsZXZlbCwgc28gaXQgd291bGQgYmUgcmF0ZSBsaW1pdGVkIGJ5
IGRlZmF1bHQNCj4+IGluIHJlbGVhc2UgYnVpbGRzLiBKdXN0IHRvIGJlIG9uIHRoZSBzYWZl
IHNpZGUuDQo+IA0KPiArMQ0KPiANCj4+IChJJ20gbm90IGluIGZhdm9yIG9mDQo+PiB0aGUg
bG9nIG1lc3NhZ2UgaW4gdGhlIGZpcnN0IHBsYWNlLCBidXQgSSBkbyBrbm93IHRoYXQgSnVs
aWVuIGhhZA0KPj4gYXNrZWQgZm9yIG9uZS4pDQo+IFRCSCwgSSB0aGluayBhbGwgQVNTRVJU
X1VOUkVBQ0hBQkxFKCkgcGF0aHMgc2hvdWxkIGJlIGFjY29tcGFuaWVkIHdpdGggYSANCj4g
cHJpbnRrKCkuIFRoaXMgd291bGQgYWxzbyBhbGxvdyB1cyB0byBjYXRjaCBpc3N1ZSBpbiBw
cm9kdWN0aW9uIHJhdGhlciB0aGFuIGluIA0KPiBvbmx5IGluIGRlYnVnLg0KDQpXaGF0IGFi
b3V0IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgdGhlbj8NCg0KLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2xpYi5oDQorKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgNCkBAIC00MCw2
ICs0MCwxNiBAQA0KICAgICAgdW5saWtlbHkocmV0X3dhcm5fb25fKTsgICAgICAgICAgICAg
XA0KICB9KQ0KDQorI2RlZmluZSBXQVJOX09OQ0UoKSBkbyB7ICAgICAgICAgICAgICAgIFwN
CisgICAgc3RhdGljIGJvb2wgd2FybmVkID0gZmFsc2U7ICAgICAgICAgXA0KKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQorICAgIGlmICggIXdhcm5lZCAp
ICAgICAgICAgICAgICAgICAgICAgIFwNCisgICAgeyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KKyAgICAgICAgd2FybmVkID0gdHJ1ZTsgICAgICAgICAgICAgICAg
ICBcDQorICAgICAgICBXQVJOKCk7ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCisgICAg
fSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KK30gd2hpbGUgKDApDQor
DQogIC8qIEFsbCBjbGFuZyB2ZXJzaW9ucyBzdXBwb3J0ZWQgYnkgWGVuIGhhdmUgX1N0YXRp
Y19hc3NlcnQuICovDQogICNpZiBkZWZpbmVkKF9fY2xhbmdfXykgfHwgXA0KICAgICAgKF9f
R05VQ19fID4gNCB8fCAoX19HTlVDX18gPT0gNCAmJiBfX0dOVUNfTUlOT1JfXyA+PSA2KSkN
CkBAIC02Myw3ICs3Myw3IEBADQogICNkZWZpbmUgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgYXNz
ZXJ0X2ZhaWxlZCgidW5yZWFjaGFibGUiKQ0KICAjZWxzZQ0KICAjZGVmaW5lIEFTU0VSVChw
KSBkbyB7IGlmICggMCAmJiAocCkgKSB7fSB9IHdoaWxlICgwKQ0KLSNkZWZpbmUgQVNTRVJU
X1VOUkVBQ0hBQkxFKCkgZG8geyB9IHdoaWxlICgwKQ0KKyNkZWZpbmUgQVNTRVJUX1VOUkVB
Q0hBQkxFKCkgV0FSTl9PTkNFKCkNCiAgI2VuZGlmDQoNCiAgI2RlZmluZSBBQlMoX3gpICh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KDQoNCkp1ZXJnZW4NCg==
--------------ENevu0fL4lNIIl3MdanTUFVl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ENevu0fL4lNIIl3MdanTUFVl--

--------------cvaJCzThN0Q84027mmYizvrS--

--------------dWsQyMMwOfYb90F8g0l7pbKM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMF7vQFAwAAAAAACgkQsN6d1ii/Ey8t
+wf7BfS7/ntUMfo4rY0DaVElQsE8rZBxw0w2DubKqMg4ZFFicjhdBetJA3T5A52JBSvi7p4KQdXI
3/sBrg/fZfCSQegAE1EHpLZ3fsD7l3J7hyj2QVURnhIAccns6TjQiiGx/ohH6/62M6RQP8PrVcfm
lphnpWXvb/QQkY8iJg7iRDYqlsY/aUdFzuY6quzJtI3WJGUJm3z1iDmtPVsDebs3BLDMkap2iD1R
JhorGNj/LvT8k3a9UknWmrz0Xyu+bMQ7ezBoC59wUT8B4NUdiUPrng5uze9Z9MxNa9DxY4DvgsZP
rkJpY6KH+8qd4qyjc9ZVCf00fYw9eR4E8g2FNWnRfg==
=nG6J
-----END PGP SIGNATURE-----

--------------dWsQyMMwOfYb90F8g0l7pbKM--

