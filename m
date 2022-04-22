Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CB50B5EE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 13:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310825.527767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrBS-0006uh-0M; Fri, 22 Apr 2022 11:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310825.527767; Fri, 22 Apr 2022 11:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhrBR-0006s5-TM; Fri, 22 Apr 2022 11:10:41 +0000
Received: by outflank-mailman (input) for mailman id 310825;
 Fri, 22 Apr 2022 11:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aXhv=VA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhrBP-0006rg-PM
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 11:10:39 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d311adc4-c22c-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 13:10:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4511F212B7;
 Fri, 22 Apr 2022 11:10:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CF60131BD;
 Fri, 22 Apr 2022 11:10:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFvYAS6NYmJPOAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Apr 2022 11:10:38 +0000
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
X-Inumbo-ID: d311adc4-c22c-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650625838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dInreaPcH1Xy6SsC7cZkL2SMUJncDiJeMExLCEUxUHw=;
	b=uCkWOnnXH35EWtmUWxE7SQxpROxKuXK6XiYBuTClVNZNJhymtM4Ow+Wiy7BznQWN/2bPJw
	YdfsCs/haqgk5UQY3C5WfCrUewlKchq8mY2dC914AJZ77k+hu9GBOo/an5j+A7+MqHULQF
	xfpezM1Ufv1VYsWoHItHftD3IK0cpZo=
Message-ID: <a6c3a1d2-4fd3-71fc-7cc3-72948eec70a5@suse.com>
Date: Fri, 22 Apr 2022 13:10:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ym8qimm0qPzDZ129FZu0TYyi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ym8qimm0qPzDZ129FZu0TYyi
Content-Type: multipart/mixed; boundary="------------mybByZ81b5gok4k2ZB1SYfiX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
Message-ID: <a6c3a1d2-4fd3-71fc-7cc3-72948eec70a5@suse.com>
Subject: Re: [PATCH RFC] x86+libxl: correct p2m (shadow) memory pool size
 calculation
References: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
In-Reply-To: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>

--------------mybByZ81b5gok4k2ZB1SYfiX
Content-Type: multipart/mixed; boundary="------------luMZrN0g5KlWdLz4newwbEwa"

--------------luMZrN0g5KlWdLz4newwbEwa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjIgMTI6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBUaGUgcmVmZXJlbmNl
ICJ0byBzaGFkb3cgdGhlIHJlc2lkZW50IHByb2Nlc3NlcyIgaXMgYXBwbGljYWJsZSB0bw0K
PiBkb21haW5zIChwb3RlbnRpYWxseSkgcnVubmluZyBpbiBzaGFkb3cgbW9kZSBvbmx5LiBB
ZGp1c3QgdGhlDQo+IGNhbGN1bGF0aW9ucyBhY2NvcmRpbmdseS4NCj4gDQo+IEluIGRvbTBf
cGFnaW5nX3BhZ2VzKCkgYWxzbyB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgc3RvcCBvcGVu
LWNvZGluZw0KPiBESVZfUk9VTkRfVVAoKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gLS0tDQo+IFJGQzogSSdtIHByZXR0eSBz
dXJlIEkgY2FuJ3QgY2hhbmdlIGEgcHVibGljIGxpYnhsIGZ1bmN0aW9uIChkZXByZWNhdGVk
DQo+ICAgICAgIG9yIG5vdCkgbGlrZSB0aGlzLCBidXQgSSBhbHNvIGRvbid0IGtub3cgaG93
IEkgc2hvdWxkIGdvIGFib3V0DQo+ICAgICAgIGRvaW5nIHNvIChzaG9ydCBvZiBpbnRyb2R1
Y2luZyBhIGJyYW5kIG5ldyBmdW5jdGlvbiBhbmQgbGVhdmluZyB0aGUNCj4gICAgICAgZXhp
c3Rpbmcgb25lIGJyb2tlbikuDQoNCkknZCBtb2RpZnkgdGhlIGRlcHJlY2F0ZWQgZnVuY3Rp
b24gdG8gdXNlIHRoZSB3b3JzdCBjYXNlIHNjZW5hcmlvIGFuZA0KdXNlIGEgbmV3IGZ1bmN0
aW9uIGludGVybmFsbHkuDQoNCg0KSnVlcmdlbg0K
--------------luMZrN0g5KlWdLz4newwbEwa
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------luMZrN0g5KlWdLz4newwbEwa--

--------------mybByZ81b5gok4k2ZB1SYfiX--

--------------Ym8qimm0qPzDZ129FZu0TYyi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJijS0FAwAAAAAACgkQsN6d1ii/Ey8A
SwgAhy1JozOAuvrvOqqlGgt36nCo+MveQxxaJlmyvQq+VhR16Fg7UqZFLb9Xnf6vr+oJmuyXwLIY
WDnlRTSNhm4l4ZTrhVvF58ArF5AAWFWyX9quMIoj2wGTVi4/fDXyBE9++cw45pMZIeFvn2BjjVFK
2m9DHVfeC9MwNhc9Z+jXjIsC7GIks/vkvsR0qtVsmS3xch1EORutHxOWOq/j3ZyQqeaMAxZPvvWc
OQOtoVHGxuhlGJfxA5D1Dv+8enb3xM19ZR+yoo6RBf1ijM5MDulLTPzAyYiIY0JjxYgwKYK1ZdZS
UX9+kyskyxJ82/SBlf9eZCbn0/FRuCk3ek+dUnufzA==
=0u/X
-----END PGP SIGNATURE-----

--------------Ym8qimm0qPzDZ129FZu0TYyi--

