Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E705462C9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346317.572091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbIV-0006fE-HQ; Fri, 10 Jun 2022 09:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346317.572091; Fri, 10 Jun 2022 09:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbIV-0006cu-EV; Fri, 10 Jun 2022 09:51:19 +0000
Received: by outflank-mailman (input) for mailman id 346317;
 Fri, 10 Jun 2022 09:51:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FoyK=WR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nzbIT-0006RR-Rc
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:51:17 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df25382b-e8a2-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:51:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7796A1FD40;
 Fri, 10 Jun 2022 09:51:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A80B139ED;
 Fri, 10 Jun 2022 09:51:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MC77DBQUo2JgbAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Jun 2022 09:51:16 +0000
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
X-Inumbo-ID: df25382b-e8a2-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654854676; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtlNKH1Fij9QrsGIkf0MmQ4sa+LBNJh0axb3u0h5+44=;
	b=FZanm8XrtoSf0LLHaKAJuaWjQWC+zpTrp32TA9M1ou/c93ENWbeoBay0bwzDxp+vsbiIi1
	h7nGTuuFIkUL2ME+vLkFLh3ypq3Wlou1rzd36sFaGswdBjNnlcfZFTyqztRx7CAk6rj+IG
	ehXB0ygANNUY6GDWbdMGeJIpC8fKcBQ=
Message-ID: <2ccd52a7-a5b2-c221-b847-ed0c9de2effd@suse.com>
Date: Fri, 10 Jun 2022 11:51:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
 <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JKDhM0E2Smrq7Y9s5N200KHP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JKDhM0E2Smrq7Y9s5N200KHP
Content-Type: multipart/mixed; boundary="------------Qyj0ckMhSP7Xdp0pKbt0MfOr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <2ccd52a7-a5b2-c221-b847-ed0c9de2effd@suse.com>
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
 <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
In-Reply-To: <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>

--------------Qyj0ckMhSP7Xdp0pKbt0MfOr
Content-Type: multipart/mixed; boundary="------------I7VTX00ZdxBSnJ0zsHMFowbi"

--------------I7VTX00ZdxBSnJ0zsHMFowbi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDYuMjIgMTE6NDQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wNi4yMDIy
IDEwOjMzLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+PiBBbGwgdGhlIG1lbWJlcnMgb2Ygc3Ry
dWN0IHRtIGFyZSBkZWZpbmVkIGFzIGludGVnZXJzIGJ1dCB0aGUgZm9ybWF0IHRhZ3MNCj4+
IHVzZWQgaW4gY29uc29sZSBkcml2ZXIgZm9yIHNucHJpbnRmIHdyb25nbHkgZXhwZWN0IHVu
c2lnbmVkIHZhbHVlcy4gRml4DQo+PiB0aGUgdGFncyB0byBleHBlY3QgaW50ZWdlcnMuDQo+
IA0KPiBQZXJoYXBzIGRvIHRoaW5ncyB0aGUgb3RoZXIgd2F5IGFyb3VuZCAtIGNvbnZlcnQg
ZmllbGQgdHlwZXMgdG8gdW5zaWduZWQNCj4gdW5sZXNzIG5lZ2F0aXZlIHZhbHVlcyBjYW4g
YmUgc3RvcmVkIHRoZXJlPyBUaGlzIHdvdWxkIG1hdGNoIG91ciBnZW5lcmFsDQo+IGFpbSBv
ZiB1c2luZyB1bnNpZ25lZCB0eXBlcyB3aGVuIG9ubHkgbm9uLW5lZ2F0aXZlIHZhbHVlcyBj
YW4gYmUgaGVsZCBpbg0KPiB2YXJpYWJsZXMgLyBwYXJhbWV0ZXJzIC8gZmllbGRzLg0KDQpE
b24ndCB5b3UgdGhpbmsga2VlcGluZyBzdHJ1Y3QgdG0gaW4gc3luYyB3aXRoIHRoZSBQb3Np
eCBkZWZpbml0aW9uIHNob3VsZA0KYmUgcHJlZmVycmVkIGhlcmU/DQoNCg0KSnVlcmdlbg0K

--------------I7VTX00ZdxBSnJ0zsHMFowbi
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------I7VTX00ZdxBSnJ0zsHMFowbi--

--------------Qyj0ckMhSP7Xdp0pKbt0MfOr--

--------------JKDhM0E2Smrq7Y9s5N200KHP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKjFBMFAwAAAAAACgkQsN6d1ii/Ey8M
oAf/dh5+ijkzdctApWj9n43I62FGACZFQmEBI5kwjFlr+S+nrXPyE8A2D7qhGeLtUPxov6vMmw26
a245oXasDdjmeFBcBNCidQ6BQWstrdLsNpdO02H4ZpG7qQ5p9NL5y99LL1F+KJpLB9UReHY/qIvc
QQ4TEHC3lNRgEsxZmmIusjv0YcBeiSGPcUhn226RJsv5iiU7sz80YzXKn/cVuG7ON9NDS8DhlwCl
Q4bh6m9RE5XuvTy7cbEn2RwLVbVHNIorh+N+BIVVy+lH7ANupyctur7GMeKAKpQvnlo7sNSixHQN
QXii+16hvzbRD9KbdxtE7swcqpOLtKtxkiNtX28XSg==
=65V6
-----END PGP SIGNATURE-----

--------------JKDhM0E2Smrq7Y9s5N200KHP--

