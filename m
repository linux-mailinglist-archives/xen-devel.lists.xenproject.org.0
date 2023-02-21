Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23569DBAE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 09:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498566.769439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNjf-0003eD-CW; Tue, 21 Feb 2023 08:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498566.769439; Tue, 21 Feb 2023 08:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUNjf-0003c7-9H; Tue, 21 Feb 2023 08:10:51 +0000
Received: by outflank-mailman (input) for mailman id 498566;
 Tue, 21 Feb 2023 08:10:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7VW=6R=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pUNjd-0003c1-7b
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 08:10:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3bf9df-b1bf-11ed-93b5-47a8fe42b414;
 Tue, 21 Feb 2023 09:10:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A220E5C261;
 Tue, 21 Feb 2023 08:10:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7680E13223;
 Tue, 21 Feb 2023 08:10:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YEuCG4V89GNofgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Feb 2023 08:10:45 +0000
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
X-Inumbo-ID: 3e3bf9df-b1bf-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676967045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dz0+QK94uSdaIqnPNHbrZ9EVlOv0020EfjAdxjA9hyY=;
	b=pnQjnS+V5QkJ7bFgZOfjy77/2l7u+ylXoZhz/oYrqxvg64cA0EBuecWXYe1Yvg2kpOoh5q
	7QXLqxYRvcIdhyz9P5aMmpbdSAKcmgqY0t7XdWcx3svnKop4iAKXgRV4FGSO6jj7BMsdEW
	cNIL/+W5UjRBlhT1rQjhNAqyRUtOmLw=
Message-ID: <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
Date: Tue, 21 Feb 2023 09:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
In-Reply-To: <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------8KnR0DNmu6tzonXCdzmVUbvS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------8KnR0DNmu6tzonXCdzmVUbvS
Content-Type: multipart/mixed; boundary="------------BqnaCl1sI9J9zjInHdE4bPgx";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e90591bd-1242-0721-242b-5db2565349f8@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
 <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
 <32a517cf-4448-2208-4877-83c7a7531635@suse.com>
 <20151614-96ca-0875-29a0-8099953b7e61@xen.org>
In-Reply-To: <20151614-96ca-0875-29a0-8099953b7e61@xen.org>

--------------BqnaCl1sI9J9zjInHdE4bPgx
Content-Type: multipart/mixed; boundary="------------qzMXwcMZTgCBfDiaM4ojIKxN"

--------------qzMXwcMZTgCBfDiaM4ojIKxN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMTk6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAy
MC8wMi8yMDIzIDE0OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjAuMDIuMjMg
MTU6MTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBPbiAyMC8wMi8yMDIzIDEzOjQ5LCBK
dWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+PiBPbiAyMC4wMi4yMyAxMzowNywgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPj4+Pj4gSGkgSnVlcmdlbiwNCj4+Pj4+DQo+Pj4+PiBPbiAyMC8wMi8y
MDIzIDExOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+IE9uIDIwLjAyLjIzIDEw
OjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+Pj4+IEhpIEp1ZXJnZW4sDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IE9uIDIwLzAxLzIwMjMgMTA6MDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
Pj4+Pj4+PiBUaGUgYWNjb3VudGluZyBmb3IgdGhlIG51bWJlciBvZiBub2RlcyBvZiBhIGRv
bWFpbiBpbiBhbiBhY3RpdmUNCj4+Pj4+Pj4+IHRyYW5zYWN0aW9uIGlzIG5vdCB3b3JraW5n
IGNvcnJlY3RseSwgYXMgaXQgYWxsb3dzIHRvIGNyZWF0ZSBhcmJpdHJhcnkNCj4+Pj4+Pj4+
IG51bWJlciBvZiBub2Rlcy4gVGhlIHRyYW5zYWN0aW9uIHdpbGwgZmluYWxseSBmYWlsIGR1
ZSB0byBleGNlZWRpbmcNCj4+Pj4+Pj4+IHRoZSBudW1iZXIgb2Ygbm9kZXMgcXVvdGEsIGJ1
dCBiZWZvcmUgY2xvc2luZyB0aGUgdHJhbnNhY3Rpb24gYW4NCj4+Pj4+Pj4+IHVucHJpdmls
ZWdlZCBndWVzdCBjb3VsZCBjYXVzZSBYZW5zdG9yZSB0byB1c2UgYSBsb3Qgb2YgbWVtb3J5
Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJIGtub3cgSSBzYWlkIEkgd291bGQgZGVsYXkgbXkgZGVj
aXNpb24gb24gdGhpcyBwYXRjaC4gSG93ZXZlciwgSSB3YXMgDQo+Pj4+Pj4+IHN0aWxsIGV4
cGVjdGluZyB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gYmUgdXBkYXRlZCBiYXNlZCBvbiBvdXIg
cHJldmlvdXMgDQo+Pj4+Pj4+IGRpc2N1c3Npb24uDQo+Pj4+Pj4NCj4+Pj4+PiBBcyBzYWlk
IGJlZm9yZSwgSSB3YXMgd2FpdGluZyBvbiB0aGUgc2V0dGxlbWVudCBvZiBvdXIgZGlzY3Vz
c2lvbiBiZWZvcmUNCj4+Pj4+PiBkb2luZyB0aGUgdXBkYXRlLg0KPj4+Pj4NCj4+Pj4+IFRo
aXMgaXMgbm90IGEgdmVyeSBnb29kIHByYWN0aWNlIHRvIHJlc2VuZCBhIHBhdGNoIHdpdGhv
dXQgcmVjb3JkaW5nIHRoZSANCj4+Pj4+IGRpc2FncmVlbWVudCBiZWNhdXNlIG5ldyByZXZp
ZXdlcnMgbWF5IG5vdCBiZSBhd2FyZSBvZiB0aGUgZGlzYWdyZWVtZW50IGFuZCANCj4+Pj4+
IHRoaXMgY291bGQgZW5kIHVwIHRvIGJlIGNvbW1pdHRlZCBieSBtaXN0YWtlLi4uDQo+Pj4+
DQo+Pj4+IFlvdSBzYWlkIHlvdSB3YW50ZWQgdG8gbG9vayBpbnRvIHRoaXMgcGF0Y2ggaW4g
ZGV0YWlsIGFmdGVyIHRoZSBwcmV2aW91cw0KPj4+PiBzZXJpZXMsIHNvIEkgbW92ZSBpdCBp
bnRvIHRoaXMgc2VyaWVzLiBUaGUgd29yZGluZyB1cGRhdGUgd291bGQgc3Ryb25nbHkNCj4+
Pj4gZGVwZW5kIG9uIHRoZSBvdXRjb21lIG9mIHRoZSBkaXNjdXNzaW9uIElNTywgc28gSSBk
aWRuJ3QgZG8gaXQgeWV0Lg0KPj4+IFRoaXMgY291bGQgaGF2ZSBiZWVuIG1lbnRpb25lZCBh
ZnRlciAtLS0uIFRoaXMgY291bGQgYWxsb3cgcGVvcGxlIHRvIA0KPj4+IHVuZGVyc3RhbmQg
dGhlIGNvbmNlcm4gYW5kIHRoZW4gcGFydGljaXBhdGUuDQo+Pg0KPj4gV2lsbCBkbyBzbyBp
biBmdXR1cmUuDQo+Pg0KPj4+DQo+Pj4+DQo+Pj4+Pj4+IEFsc28gdGhpbmtpbmcgbW9yZSBh
Ym91dCBpdCwgIlRoZSB0cmFuc2FjdGlvbiB3aWxsIGZpbmFsbHkgZmFpbCBkdWUgdG8gDQo+
Pj4+Pj4+IGV4Y2VlZGluZyB0aGUgbnVtYmVyIG9mIG5vZGVzIHF1b3RhIiBtYXkgbm90IGJl
IHRydWUgZm9yIGEgY291cGxlIG9mIA0KPj4+Pj4+PiByZWFzb25zOg0KPj4+Pj4+PiDCoMKg
IDEpIFRoZSB0cmFuc2FjdGlvbiBtYXkgcmVtb3ZlZCBhIG5vZGUgYWZ0ZXJ3YXJkcy4NCj4+
Pj4+Pg0KPj4+Pj4+IFllcywgYW5kPyBKdXN0IGJlY2F1c2UgaXQgaXMgYSB0cmFuc2FjdGlv
biwgdGhpcyBpcyBzdGlsbCBhIHZpb2xhdGlvbiBvZg0KPj4+Pj4+IHRoZSBxdW90YS4gRXZl
biBvdXRzaWRlIGEgdHJhbnNhY3Rpb24geW91IGNvdWxkIHVzZSB0aGUgc2FtZSByZWFzb25p
bmcsDQo+Pj4+Pj4gYnV0IHlvdSBkb24ndCAod2hpY2ggaXMgY29ycmVjdCwgb2YgY291cnNl
KS4NCj4+Pj4+DQo+Pj4+PiBJIGNhbiB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIEhvd2V2ZXIs
IHRvIG1lLCB0aGUgZ29hbCBvZiB0aGUgdHJhbnNhY3Rpb24gaXMgDQo+Pj4+PiB0byBjb21t
aXQgZXZlcnl0aGluZyBpbiBvbmUgZ28gYXQgdGhlIGVuZC4gU28gdGhlIHZpb2xhdGlvbnMg
aW4gdGhlIG1pZGRsZSANCj4+Pj4+IHNob3VsZCBub3QgbWF0dGVyLg0KPj4+Pg0KPj4+PiBP
ZiBjb3Vyc2UgdGhleSBzaG91bGQuDQo+Pj4+DQo+Pj4+IFdlIHdvdWxkbid0IGFsbG93IHRv
IHdyaXRlIG92ZXItc2l6ZWQgbm9kZXMsIGV2ZW4gaWYgdGhleSBjb3VsZCBiZSByZXdyaXR0
ZW4gaW4NCj4+Pj4gdGhlIHNhbWUgdHJhbnNhY3Rpb24gd2l0aCBhIHNtYWxsZXIgc2l6ZS4N
Cj4+Pg0KPj4+IEkgdmlldyB0aGUgdHdvIGRpZmZlcmVudC4NCj4+Pg0KPj4+PiBXZSB3b3Vs
ZG4ndCBhbGxvdyB0byBjcmVhdGUgbm9kZXMgd2hpY2ggd291bGQgdmlvbGF0ZSBvdmVyYWxs
IG1lbW9yeQ0KPj4+PiBjb25zdW1wdGlvbi4NCj4+Pj4NCj4+Pj4gV2Ugd291bGRuJ3QgYWxs
b3cgbm9kZXMgd2l0aCBtb3JlIHBlcm1pc3Npb24gZW50cmllcyB0aGFuIGFsbG93ZWQsIGV2
ZW4gaWYgdGhleQ0KPj4+PiBjb3VsZCBiZSByZWR1Y2VkIGluIHRoZSBzYW1lIHRyYW5zYWN0
aW9uIGFnYWluLg0KPj4+Pg0KPj4+PiBJIGRvbid0IHNlZSB3aHkgdGhlIG51bWJlciBvZiBu
b2RlcyBzaG91bGRuJ3QgYmUgdGFrZW4gaW50byBhY2NvdW50Lg0KPj4+Pg0KPj4+Pj4gRnVy
dGhlcm1vcmUsIEkgd291bGQgZXhwZWN0IGEgdHJhbnNhY3Rpb24gdG8gd29yayBvbiBhIHNu
YXBzaG90IG9mIHRoZSANCj4+Pj4+IHN5c3RlbS4gU28gaXQgZmVlbHMgcmVhbGx5IHN0cmFu
Z2UgdG8gbWUgdGhhdCB3ZSBhcmUgY29uc3RhbnRseSBjaGVja2luZyANCj4+Pj4+IHRoZSBx
dW90YSB3aXRoIHRoZSB1cGRhdGVkIHZhbHVlcyByYXRoZXIgdGhhbiB0aGUgaW5pdGlhbCBv
bmUuDQo+Pj4+DQo+Pj4+IFlvdSBhcmUgYXdhcmUgdGhhdCB0aGUgY29kZSB3aXRob3V0IHRo
aXMgcGF0Y2ggaXMganVzdCBuZWdsZWN0aW5nIHRoZSBub2Rlcw0KPj4+PiBjcmVhdGVkIGlu
IHRoZSB0cmFuc2FjdGlvbj8gSXQganVzdCBpcyB1c2luZyB0aGUgY3VycmVudCBudW1iZXIg
b2Ygbm9kZXMNCj4+Pj4gb3V0c2lkZSBhbnkgdHJhbnNhY3Rpb24gZm9yIHF1b3RhIGNoZWNr
Lg0KPj4+DQo+Pj4gQXJlIHlvdSByZWZlcnJpbmcgdG8gdGhlIHF1b3RhIGNoZWNrIHdpdGhp
biB0aGUgdHJhbnNhY3Rpb24/DQo+Pg0KPj4gSSdtIHJlZmVycmluZyB0byB0aGUgcXVvdGEg
Y2hlY2sgaW4gY3JlYXRlX25vZGUoKS4gPg0KPj4+DQo+Pj4+IFNvIEkgY291bGQgZWFzaWx5
IGNyZWF0ZSBhIHNjZW5hcmlvDQo+Pj4+IHdoZXJlIG15IG5ldyBjb2RlIHdpbGwgc3VjY2Vl
ZCwgYnV0IHRoZSBjdXJyZW50IG9uZSBpcyBmYWlsaW5nOg0KPj4+PiBBc3N1bWUgbm9kZSBx
dW90YSBpcyAxMDAwLCBhbmQgYXQgc3RhcnQgb2YgdGhlIHRyYW5zYWN0aW9uIHRoZSBndWVz
dCBpcyBvd25pbmcNCj4+Pj4gOTk5IG5vZGVzLiBJbiB0aGUgdHJhbnNhY3Rpb24gdGhlIGd1
ZXN0IGlzIGRlbGV0aW5nIDEwIG5vZGVzLCB0aGVuIGRvbTAgaXMNCj4+Pj4gY3JlYXRpbmcg
NSBhZGRpdGlvbmFsIG5vZGVzIG93bmVkIGJ5IHRoZSBndWVzdC4gVGhlIGNlbnRyYWwgbm9k
ZSBjb3VudGVyIGlzIG5vdw0KPj4+PiAxMDA0IChvdmVyIHF1b3RhKSwgd2hpbGUgdGhlIGlu
LXRyYW5zYWN0aW9uIGNvdW50IGlzIDk5NC4NCj4+Pj4gSW4gdGhlIHRyYW5zYWN0aW9uIHRo
ZQ0KPj4+PiBndWVzdCBjYW4gbm93IGhhcHBpbHkgY3JlYXRlIGEgbmV3IG5vZGUgKCM5OTUp
IHdpdGggbXkgcGF0Y2gsIGJ1dCB3aWxsIGZhaWwgdG8NCj4+Pj4gZG8gc28gd2l0aG91dCAo
aXQgc2VlcyB0aGUgMTAwNCBkdWUgdG8gdGhlIHRyYW5zYWN0aW9uIGNvdW50IGJlaW5nIGln
bm9yZWQpLg0KPj4+DQo+Pj4gVGhpcyBkb2Vzbid0IHNvdW5kIGNvcnJlY3QuIFRvIGRvIHlv
dSBoYXZlIGFueSB0ZXN0IEkgY291bGQgdXNlIHRvIGNoZWNrIHRoZSANCj4+PiBiZWhhdmlv
cj8NCj4+DQo+PiBUcnkgaXQ6DQo+Pg0KPj4gLSBjcmVhdGUgbm9kZXMgaW4gYSBndWVzdCB1
bnRpbCB5b3UgaGl0IHRoZSBFTk9TUEMgcmV0dXJuIGNvZGUgZHVlIHRvIHRvbyBtYW55DQo+
PiDCoMKgIG5vZGVzDQo+PiAtIHN0YXJ0IGEgdHJhbnNhY3Rpb24gZGVsZXRpbmcgc29tZSBu
b2RlcyBhbmQgdGhlbiB0cnlpbmcgdG8gY3JlYXRlIGFub3RoZXINCj4+IMKgwqAgb25lLCB3
aGljaCBmYWlsIGZhaWwgd2l0aCBFTk9TUEMuDQo+IA0KPiBTbyBJIGhhdmUgcmVjcmVhdGVk
IGFuIFhURiB0ZXN0IHdoaWNoIEkgdGhpbmsgbWF0Y2ggd2hhdCB5b3Ugd3JvdGUgWzFdLg0K
PiANCj4gSXQgaXMgaW5kZWVkIGZhaWxpbmcgd2l0aG91dCB5b3VyIHBhdGNoLiBCdXQgdGhl
biB0aGVyZSBhcmUgc3RpbGwgc29tZSB3ZWlyZCANCj4gYmVoYXZpb3IgaGVyZS4NCj4gDQo+
IEkgd291bGQgZXhwZWN0IHRoZSBjcmVhdGlvbiBvZiB0aGUgbm9kZSB3b3VsZCBhbHNvIGZh
aWwgaWYgaW5zdGVhZCBvZiByZW1vdmluZyANCj4gdGhlIG5vZGUgaWYgcmVtb3ZlZCBvdXRz
aWRlIG9mIHRoZSB0cmFuc2FjdGlvbi4NCj4gDQo+IFRoaXMgaXMgbm90IHRoZSBjYXNlIGJl
Y2F1c2Ugd2UgYXJlIGxvb2tpbmcgYXQgdGhlIGN1cnJlbnQgcXVvdGEuIFNvIHNob3VsZG4n
dCANCj4gd2Ugc25hcHNob3QgdGhlIGdsb2JhbCBjb3VudD8NCg0KQXMgd2UgZG9uJ3QgZG8g
YSBnbG9iYWwgc25hcHNob3Qgb2YgdGhlIGRhdGEgYmFzZSBmb3IgYSB0cmFuc2FjdGlvbiAo
dGhpcyB3YXMNCmNoYW5nZWQgZHVlIHRvIGh1Z2UgbWVtb3J5IG5lZWRzLCBiYWQgcGVyZm9y
bWFuY2UsIGFuZCBhIGhpZ2hlciB0cmFuc2FjdGlvbg0KZmFpbHVyZSByYXRlKSwgSSBkb24n
dCB0aGluayB3ZSBzaG91bGQgc25hcHNob3QgdGhlIGNvdW50IGVpdGhlci4NCg0KQSB0cmFu
c2FjdGlvbiBpcyBwZXJmb3JtZWQgYXRvbWljYWxseSBhdCB0aGUgdGltZSBpdCBpcyBmaW5p
c2hlZC4gVGhlcmVmb3JlDQpzZWVpbmcgdGhlIGN1cnJlbnQgZ2xvYmFsIHN0YXRlIGluc2lk
ZSB0aGUgdHJhbnNhY3Rpb24gKHdpdGggdGhlIHRyYW5zYWN0aW9uDQpwcml2YXRlIHN0YXRl
IG9uIHRvcCBsaWtlIGFuIG92ZXJsYXkpIGlzIGFic29sdXRlbHkgZmluZSBJTU8uDQoNCg0K
SnVlcmdlbg0K
--------------qzMXwcMZTgCBfDiaM4ojIKxN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------qzMXwcMZTgCBfDiaM4ojIKxN--

--------------BqnaCl1sI9J9zjInHdE4bPgx--

--------------8KnR0DNmu6tzonXCdzmVUbvS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmP0fIUFAwAAAAAACgkQsN6d1ii/Ey+V
OAf+KPXAV0Fzr4JSR3mCsfhjK4Q2VPUgewMd2Vim9xrhsUN3G1/3KjRoc9umxli40LfHMlpYVS9E
4RwY9Kn97I8fnaZ/kLftq1mVrI3ZKb+YjegjMy0CFniggSMEN0p0Ehqrk6Hahp3zltKkDe/rQz0D
3RTGEWeUUgLiqiNSos+6SJtJaF1K7rsjSw6ttg83fMf/9MLrloton8n5fBMU+XI4QDogdgyFgY9n
08Bx/eURVwjMUBZSlkw3R2xI5fWFGFid+L5JBnE9KBhlf8sQpyxlX5i7vbCSwXOw7vsAvxmxyY5b
e+17IalargVHjUEVKl7NaFFWnv/T5TpnKYvfFhqPTg==
=kTER
-----END PGP SIGNATURE-----

--------------8KnR0DNmu6tzonXCdzmVUbvS--

