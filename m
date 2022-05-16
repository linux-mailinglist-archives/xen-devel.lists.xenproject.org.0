Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89305285FA
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 15:53:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329863.553134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqb9l-0006s9-CW; Mon, 16 May 2022 13:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329863.553134; Mon, 16 May 2022 13:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqb9l-0006qI-96; Mon, 16 May 2022 13:53:05 +0000
Received: by outflank-mailman (input) for mailman id 329863;
 Mon, 16 May 2022 13:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/re5=VY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nqb9j-0006qC-KN
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 13:53:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80589b98-d51f-11ec-837e-e5687231ffcc;
 Mon, 16 May 2022 15:53:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 407151FB39;
 Mon, 16 May 2022 13:53:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E414713ADC;
 Mon, 16 May 2022 13:53:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +uINNjxXgmLKCQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 May 2022 13:53:00 +0000
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
X-Inumbo-ID: 80589b98-d51f-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1652709181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KtzkKyIkNI9xN3OvQlYgRNvsxQ9mM14sOJjAy6XKkhs=;
	b=GY9m6gl4lWZWSBUUm+bJQHj9elBNq0WkH4DQHYiaiJb229Ur/ogMxucufTVjwNMuABxSI8
	tnCSoUbA2eB55Us7GUCKqVY6eBByNc4RhVEgcGiIGn+X4rm4WiSSmaCntB4jfzT2h2a/Lb
	aGaC0sD/jUS2g3ak/DWHx4Pu7XHkH8Q=
Message-ID: <612415ce-bc24-52b1-e5a0-2860d36f2c01@suse.com>
Date: Mon, 16 May 2022 15:53:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Process for cherry-picking patches from other projects
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
 <F88CECAA-BDBE-40F8-81A8-642F47AEEB62@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <F88CECAA-BDBE-40F8-81A8-642F47AEEB62@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NMHdFOqR37IMccSdMrsHS50L"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NMHdFOqR37IMccSdMrsHS50L
Content-Type: multipart/mixed; boundary="------------VUtASp0q2WImv0CMSrHqzwyh";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <612415ce-bc24-52b1-e5a0-2860d36f2c01@suse.com>
Subject: Re: Process for cherry-picking patches from other projects
References: <396325A0-7EE6-4EAC-9BB9-BA67D878E6AE@citrix.com>
 <2f2f10c1-e0cb-7274-1879-6f88c2517c47@suse.com>
 <F88CECAA-BDBE-40F8-81A8-642F47AEEB62@citrix.com>
In-Reply-To: <F88CECAA-BDBE-40F8-81A8-642F47AEEB62@citrix.com>

--------------VUtASp0q2WImv0CMSrHqzwyh
Content-Type: multipart/mixed; boundary="------------4Qa3fUmXvTK2VupZqP56KNRM"

--------------4Qa3fUmXvTK2VupZqP56KNRM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDUuMjIgMTU6MTIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IE1heSAxMywgMjAyMiwgYXQgMzo1MiBQTSwgSnVlcmdlbiBHcm9zcyA8Skdyb3NzQHN1c2Uu
Y29tPiB3cm90ZToNCj4+DQo+PiBPbiAxMy4wNS4yMiAxNjozMywgR2VvcmdlIER1bmxhcCB3
cm90ZToNCj4+PiBTdGFydGluZyBhIG5ldyB0aHJlYWQgdG8gbWFrZSBpdCBjbGVhciB0aGF0
IHdl4oCZcmUgZGlzY3Vzc2luZyBhIHdpZGVyIHBvbGljeSBoZXJlLg0KPj4+IFRoaXMgcXVl
c3Rpb24gaXMgYWltZWQgYXQgSmFuIGFuZCBBbmR5IGluIHBhcnRpY3VsYXIsIGFzIEkgdGhp
bmsgdGhleeKAmXZlIHByb2JhYmx5IGRvbmUgdGhlIG1vc3Qgb2YgdGhpczsgc28gSeKAmW0g
bG9va2luZyB0byB0aGVtIHRvIGZpbmQgb3V0IHdoYXQgb3VyIOKAnHN0YW5kYXJkIHByYWN0
aWNl4oCdIGlzLg0KPj4+IFRoZXJlIGhhdmUgcmVjZW50bHkgYmVlbiBzb21lIHBhdGNoZXMg
dGhhdCBCZXJ0cmFuZCBoYXMgc3VibWl0dGVkIHdoaWNoIHB1bGwgaW4gY29kZSBmcm9tIExp
bnV4ICgiW1BBVENIIDEvM10geGVuL2FybTogU3luYyBzeXNyZWdzIGFuZCBjcHVpbmZvIHdp
dGggTGludXggNS4xOC1yYzPigJ0pLCB3aGljaCBoYXMgY2F1c2VkIGEgZGlzY3Vzc2lvbiBi
ZXR3ZWVuIGhpbSwgSnVsaWVuLCBhbmQgU3RlZmFubyBhYm91dCB0aGUgcHJvcGVyIHdheSB0
byBkbyBzdWNoIHBhdGNoZXMuDQo+Pj4gVGhlIOKAnE9yaWdpbjrigJ0gdGFnIHNlY3Rpb24g
b2YgeGVuLmdpdC9kb2NzL3Byb2Nlc3Mvc2VuZGluZy1wYXRjaGVzLnBhbmRvYyBzdWdnZXN0
cyB0aGF0IHRoZXJlIGFyZSBzb21lIHN0YW5kYXJkcywgYnV0IGRvZXNu4oCZdCBzcGVsbCB0
aGVtIG91dC4NCj4+PiBUaGUgcXVlc3Rpb25zIHNlZW0gdG8gYmU6DQo+Pj4gMSkgV2hlbiBk
b2luZyB0aGlzIGtpbmQgb2YgdXBkYXRlLCBpcyBpdCBwZXJtaXNzaWJsZSB0byBzZW5kIGEg
c2luZ2xlIHBhdGNoIHdoaWNoIOKAnGJhdGNoZXPigJ0gc2V2ZXJhbCB1cHN0cmVhbSBjb21t
aXRzIHRvZ2V0aGVyLCBvciBzaG91bGQgZWFjaCBwYXRjaCBiZSBiYWNrcG9ydGVkIGluZGl2
aWR1YWxseT8NCj4+PiAyKSBJZiDigJxiYXRjaGVz4oCdIGFyZSBwZXJtaXNzaWJsZSwgd2hl
bj8gV2hlbiB3b3VsZCBpbmRpdmlkdWFsIHBhdGNoZXMgYmUgcHJlZmVycmVkPw0KPj4+IDMp
IEZvciDigJxiYXRjaCB1cGRhdGVz4oCdLCB3aGF0IHRhZ3MgYXJlIG5lY2Vzc2FyeT8gRG8g
d2UgbmVlZCB0byBub3RlIHRoZSBjaGFuZ2VzZXRzIG9mIGFsbCB0aGUgY29tbWl0cywgYW5k
IGlmIHNvLCBkbyB3ZSBuZWVkIG11bHRpcGxlIOKAnE9yaWdpbuKAnSB0YWdzPyBEbyB3ZSBu
ZWVkIHRvIGluY2x1ZGUgYW55dGhpbmcgZnJvbSB0aGUgb3JpZ2luYWwgY29tbWl0cyDigJQg
Y29tbWl0IG1lc3NhZ2VzPyBTaWduZWQtb2ZmLWJ54oCZcz8NCj4+PiBBbmQgYSByZWxhdGVk
IHF1ZXN0aW9uOg0KPj4+IDQpIFdoZW4gaW1wb3J0aW5nIGFuIGVudGlyZSBmaWxlIGZyb20g
YW4gdXBzdHJlYW0gbGlrZSBMaW51eCwgd2hhdCB0YWdzIGRvIHdlIG5lZWQ/DQo+Pj4gTXkg
cmVjb2xsZWN0aW9uIGlzIHRoYXQgd2Ugb2Z0ZW4gdG8gYSDigJxhY2N1bXVsYXRlZCBwYXRj
aOKAnSB0byB1cGRhdGUsIHNheSwgdGhlIEtjb25maWcgdG9vbGluZzsgc28gaXQgc2VlbXMg
bGlrZSB0aGUgYW5zd2VyIHRvIHRoaXMgaXMgc29tZXRpbWVzIOKAnHllc+KAnS4NCj4+PiBJ
dCBzZWVtcyB0byBtZSB0aGF0IGluIGEgY2FzZSB3aGVyZSB5b3XigJlyZSBpbXBvcnRpbmcg
YSBoYW5kZnVsIG9mIHBhdGNoZXMg4oCUIHNheSA1LTEwIOKAlCB0aGF0IGltcG9ydGluZyB0
aGVtIG9uZS1ieS1vbmUgbWlnaHQgYmUgcHJlZmVycmVkOyBidXQgaW4gdGhpcyBjYXNlLCBz
aW5jZSB0aGUgc3VibWlzc2lvbiB3YXMgYWxyZWFkeSBtYWRlIGFzIGEgYmF0Y2gsIEnigJlk
IGFjY2VwdCBoYXZpbmcgaXQgYXMgYSBiYXRjaC4NCj4+PiBJIHRoaW5rIGlmIEkgd2VyZSB3
cml0aW5nIHRoaXMgcGF0Y2gsIEnigJlkIG1ha2UgYSBzZXBhcmF0ZSDigJxPcmlnaW7igJ0g
dGFnIGZvciBlYWNoIGNvbW1pdC4NCj4+PiBJIHdvdWxkbuKAmXQgaW5jbHVkZSB0aGUgdXBz
dHJlYW0gY29tbWl0IG1lc3NhZ2VzIG9yIFMtby1i4oCZczsgSSB3b3VsZCB3cml0ZSBteSBv
d24gY29tbWl0IG1lc3NhZ2Ugc3VtbWFyaXppbmcgd2h5IEnigJltIGltcG9ydGluZyB0aGUg
Y29tbWl0cywgdGhlbiBoYXZlIHRoZSDigJhvcmlnaW7igJkgdGFncywgdGhlbiBteSBvd24g
Uy1vLWIgdG8gaW5kaWNhdGUgdGhhdCBJIGFtIGF0dGVzdGluZyB0aGF0IGl0IGNvbWVzIGZy
b20gYW4gb3Blbi1zb3VyY2UgcHJvamVjdCAoYW5kIGZvciB3aGF0ZXZlciBjb3B5cmlnaHQg
Y2FuIGJlIGFzc2VydGVkIG9uIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhlIHBhdGNoIGFz
IGEgY29sbGVjdGlvbikuDQo+Pj4gQW5kIGZvciAjNCwgSSB3b3VsZCBkbyBzb21ldGhpbmcg
c2ltaWxhcjogSSB3b3VsZCB3cml0ZSBteSBvd24gY29tbWl0IG1lc3NhZ2UgZGVzY3JpYmlu
ZyB3aGF0IHRoZSBmaWxlIGlzIGZvciBhbmQgd2h5IHdl4oCZcmUgaW1wb3J0aW5nIGl0OyBo
YXZlIHRoZSBPcmlnaW4gdGFnIHBvaW50IHRvIHRoZSBjb21taXQgYXQgdGhlIHBvaW50IEkg
dG9vayB0aGUgZmlsZTsgYW5kIG15IG93biBTLW8tYi4NCj4+DQo+PiBJTU8gd2Ugc2hvdWxk
IGFkZCBhbm90aGVyIHRhZyBmb3IgdGhhdCBwdXJwb3NlLCBlLmcuOg0KPj4NCj4+IEZpbGUt
b3JpZ2luOiA8cmVwb3NpdG9yeT4gPHRhZz4gPHBhdGg+IFsjIDxsb2NhbC1wYXRoPl0NCj4+
DQo+PiBTcGVjaWZ5aW5nIHRoZSByZXBvc2l0b3J5IHRoZSBmaWxlKHMpIGFyZSBjb21pbmcg
ZnJvbSwgdGhlIHRhZyAoZS5nLiBhDQo+PiB0YWdnZWQgdmVyc2lvbiwgb3IgdGhlIHRvcCBn
aXQgY29tbWl0KSwgYW5kIHRoZSBwYXRoIG9mIHRoZSBvcmlnaW5hbA0KPj4gZmlsZShzKSBp
biB0aGF0IHJlcG9zaXRvcnkgKDxwYXRoPiBjb3VsZCBlaXRoZXIgYmUgYSBjb21tb24gZGly
ZWN0b3J5DQo+PiBvZiBtdWx0aXBsZSBmaWxlcywgb3IgYSBzaW5nbGUgZmlsZTsgbXVsdGlw
bGUgIkZpbGUtb3JpZ2luOiIgdGFncyBzaG91bGQNCj4+IGJlIHBvc3NpYmxlKS4gSW4gY2Fz
ZSB0aGUgZmlsZSBpcyBiZWluZyByZW5hbWVkIGxvY2FsbHksIGl0cyBuZXcgbmFtZQ0KPj4g
Y2FuIGJlIGFkZGVkIGFzIDxsb2NhbC1wYXRoPi4NCj4+DQo+PiBUaGlzIHZhcmlhbnQgc2hv
dWxkIGJlIHVzZWQgdG8gYWRkIF9uZXdfIGZpbGVzIHRvIFhlbi4gSW4gY2FzZSBvZg0KPj4g
dXBkYXRpbmcgYSBmaWxlIHdoaWNoIGhhcyBzZWVtIGxvdHMgb2YgY29tbWl0cyBzaW5jZSBp
dHMgbGFzdCB1cGRhdGUgb3INCj4+IGludHJvZHVjdGlvbiwgaXQgbWlnaHQgYmUgZWFzaWVy
IHRvIGp1c3QgdXNlIHRoZSAiRmlsZS1vcmlnaW46IiB0YWcsDQo+PiBwcm9iYWJseSB3aXRo
IGEgbm90ZSBiZWxvdyB0aGUgIi0tLSIgbWFya2VyIHRoYXQgbGlzdGluZyBtb3JlIHRoYW4g
PHg+DQo+PiBwYXRjaGVzICh4ID4gMTA/KSBvciBzcGxpdHRpbmcgaW50byBtb3JlIHRoYW4g
PHg+IHBhdGNoZXMgd291bGQgYmUNCj4+IGp1c3QgdXNlbGVzcyB3b3JrIChjb21tb24gc2Vu
c2Ugc2hvdWxkIGFwcGx5IGhlcmUsIGVzcGVjaWFsbHkgcmVnYXJkaW5nDQo+PiB0aGUgcmVh
ZGFiaWxpdHkgb2YgdGhlIHBhdGNoIGFuZCB0aGUgcmVsYXRlZCByZXZpZXcgZWZmb3J0KS4N
Cj4gDQo+IFlvdSBkb27igJl0IG1lbnRpb24gd2hhdCB0byBkbyBhYm91dCBTb0LigJlzIOKA
lCBJIGFzc3VtZSB5b3UgYWdyZWUgd2l0aCBteSBhc3Nlc3NtZW50IGFib3ZlLCB0aGF0IGEg
c2luZ2xlICBTb0IgZnJvbSB0aGUgc3VibWl0dGVyIG9mIHRoZSBwYXRjaCB0byBYZW4sIGFz
c2VydGluZyB0aGF0IHRoZXnigJlyZSBzYXRpc2ZpZWQgdGhhdCBhbGwgb2YgdGhlIGNvZGUg
aGFzIGJlZW4gYXNzZXJ0ZWQgYnkgb3RoZXIgcGVvcGxlIGFzIGhhdmluZyBhIHN1aXRhYmxl
IGxpY2Vuc2UsIGlzIHN1ZmZpY2llbnQuDQoNClllcy4NCg0KPiBJbiB3aGljaCBjYXNlLCBi
YXJyaW5nIGEgY29udHJhZGljdGlvbiBmcm9tIEFuZHkgb3IgSmFuIGFzIHRvIG91ciBzdGFu
ZGFyZCBwcmFjdGljZSwgSSB0aGluayB0aGF0IHdlIGRvbuKAmXQgbmVlZCB0byBjb2xsZWN0
IFNvQnMgZnJvbSB0aGUgb3JpZ2luYWwgY29tbWl0czsgYSBzaW5nbGUgU29CIGJ5IEJlcnRy
YW5kIChvciB3aG9tZXZlcikgdGhhdCBpdCBhbGwgY29tZXMgZnJvbSBMaW51eCBhbmQgdGhh
dCBzdWl0YWJsZSBTb0JzIGNhbiBiZSB0cmFja2VkIGRvd24gc2hvdWxkIGl0IGJlY29tZSBu
ZWNlc3NhcnksIHdpbGwgYmUgc3VmZmljaWVudC4NCg0KWWVzLCB0aGlzIGlzIHRoZSBpZGVh
IGJ5IHNwZWNpZnlpbmcgYSB0YWcgb2YgdGhlIHNvdXJjZSByZXBvc2l0b3J5Lg0KVXNpbmcg
dGhlIGNvcnJlY3QgZ2l0IGNvbW1hbmRzIGl0IHNob3VsZCBhbHdheXMgYmUgcG9zc2libGUg
dG8gZ2V0DQp0aGUgY29tcGxldGUgbGlzdCBvZiBTb0JzIGZvciBhbiBpbXBvcnRlZCBmaWxl
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------4Qa3fUmXvTK2VupZqP56KNRM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4Qa3fUmXvTK2VupZqP56KNRM--

--------------VUtASp0q2WImv0CMSrHqzwyh--

--------------NMHdFOqR37IMccSdMrsHS50L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmKCVzwFAwAAAAAACgkQsN6d1ii/Ey9m
AAf+KxaZQHZatGli+8NkOfyJ8A8Y4EeU/fpaFKyP9BhAleJ057cm9n1DEIsDM/pLD+D3SyajVeAb
VqMfaUWX3ehmaN3kbsz7rDhdiEVej0Ci2sXUZdLEemc31bU9jSUbgttHnko4ryl1hhlSkjvvKMnj
lXk/bBwnowItoojdKSeldqTpMJ0eMXUJeDkbX5Oiye5CngqZ/7DFXrkSYkY+wbceJ+K0yNmuSc8A
tcSpB7gm6iwQlURqHpLxZ3vfiRc6QquBRhZgSu7/lNO0Tpclw7PRgTHY1mXRmxGJ7iLSmEao25I9
INmZn7+brcBYW7/0cSccS1vgp7Qgx16xk70Wx0Mvhw==
=YAIJ
-----END PGP SIGNATURE-----

--------------NMHdFOqR37IMccSdMrsHS50L--

