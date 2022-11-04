Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47C618FFB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 06:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437278.691544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqpDc-0004an-RZ; Fri, 04 Nov 2022 05:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437278.691544; Fri, 04 Nov 2022 05:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqpDc-0004Yp-Ng; Fri, 04 Nov 2022 05:26:16 +0000
Received: by outflank-mailman (input) for mailman id 437278;
 Fri, 04 Nov 2022 05:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0BBJ=3E=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oqpDb-0004Yj-En
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 05:26:15 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 325a7165-5c01-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 06:26:13 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 603E72189A;
 Fri,  4 Nov 2022 05:26:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 220E71346F;
 Fri,  4 Nov 2022 05:26:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IE34BnSiZGOfDgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Nov 2022 05:26:12 +0000
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
X-Inumbo-ID: 325a7165-5c01-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667539572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Djrd93CGqgfukS0X6L4qoN5LdoVsSUW9kV4JSANiJ6Y=;
	b=n2JkqHahQfBb5RCUC8Rx0Xi9eVjcl/fTNpXFXfHj6sRFa1KWqiBYmiU6j0S48GLBjHX7Qq
	La0QC9+B1JUqtA+X618DRtE+Op29VEL0DHW65otXi+j+R7/ldWMHBQLIJ55tAh/bkvDS6Z
	0ZmxW2B73aUHAHjmoy0bcYUsDu8UT24=
Message-ID: <da762667-d2d0-6b5b-3da4-085928aca18d@suse.com>
Date: Fri, 4 Nov 2022 06:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
In-Reply-To: <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HtzEsG4XTbMGCMJUqeL4ZwUF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HtzEsG4XTbMGCMJUqeL4ZwUF
Content-Type: multipart/mixed; boundary="------------CNhJV7xvs6AgUgbVyiCDXkPQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <da762667-d2d0-6b5b-3da4-085928aca18d@suse.com>
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
In-Reply-To: <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>

--------------CNhJV7xvs6AgUgbVyiCDXkPQ
Content-Type: multipart/mixed; boundary="------------UPuAP82ACL0jTna2VviEimP1"

--------------UPuAP82ACL0jTna2VviEimP1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTEuMjIgMDY6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAzLzExLzIw
MjIgMTY6MzYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUaGUgY29kZSBnZW5lcmF0ZWQg
Zm9yIHRoZSBjYWxsX2hhbmRsZXJzXyooKSBtYWNyb3MgbmVlZHMgdG8gYXZvaWQNCj4+IHVu
ZGVmaW5lZCBiZWhhdmlvciB3aGVuIG11bHRpcGxlIGhhbmRsZXJzIHNoYXJlIHRoZSBzYW1l
IHByaW9yaXR5Lg0KPj4gVGhlIGlzc3VlIGlzIHRoZSBoeXBlcmNhbGwgbnVtYmVyIGJlaW5n
IHVudmVyaWZpZWQgZmVkIGludG8gdGhlIG1hY3Jvcw0KPj4gYW5kIHRoZW4gdXNlZCB0byBz
ZXQgYSBtYXNrIHZpYSAibWFzayA9IDFVTEwgPDwgPGh5cGVyY2FsbC1udW1iZXI+Ii4NCj4+
DQo+PiBBdm9pZCBhIHNoaWZ0IGFtb3VudCBvZiBtb3JlIHRoYW4gNjMgYnkgc2V0dGluZyBt
YXNrIHRvIHplcm8gaW4gY2FzZQ0KPj4gdGhlIGh5cGVyY2FsbCBudW1iZXIgaXMgdG9vIGxh
cmdlLg0KPj4NCj4+IEZpeGVzOiBlY2ExZjAwZDAyMjcgKCJ4ZW46IGdlbmVyYXRlIGh5cGVy
Y2FsbCBpbnRlcmZhY2UgcmVsYXRlZCBjb2RlIikNCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFRoaXMgaXMgbm90IGEgc3VpdGFi
bGUgZml4LsKgIFRoZXJlIGJlaW5nIGEgc2VjdXJpdHkgaXNzdWUgaXMganVzdCB0aGUNCj4g
dGlwIG9mIHRoZSBpY2ViZXJnLg0KPiANCj4gVGhlIGNoYW5nZXMgYnJva2UgdGhlIGtleGVj
X29wKCkgQUJJIGFuZCB0aGlzIGlzIGEgYmxvY2tpbmcgcmVncmVzc2lvbg0KPiB2cyA0LjE2
Lg0KDQpJIHQgd291bGQgcmVhbGx5IGJlIGJlbmVmaWNpYWwgaWYgeW91IHdvdWxkIGp1c3Qg
dGVsbCB3aGF0IHRoZSBpc3N1ZXMNCmFyZSBpbnN0ZWFkIG9mIHZvaWNpbmcgc29tZSB2YWd1
ZSBjb25jZXJucyBhbmQgdGhlbiBkcm9wcGluZyBvZmYgdG8NCnNpbGVuY2UgYWdhaW4gd2hl
biBhc2tlZCAocGFydGlhbGx5IG11bHRpcGxlIHRpbWVzKSB3aGF0IHRoZSByZWFsDQpwcm9i
bGVtcyBhcmUuDQoNCj4gSW4gbGlldSBvZiBoYXZpbmcgdGltZSB0byBkbw0KPiBodHRwczov
L2dpdGxhYi5jb20veGVuLXByb2plY3QveGVuLy0vaXNzdWVzLzkzLCBoZXJlJ3MgdGhlIGFi
cmlkZ2VkIGxpc3QNCj4gb2YgZXJyb3JzDQo+IA0KPiBUaGUgc2VyaWVzIGNsYWltcyAiVGhp
cyBpcyBiZW5lZmljaWFsIHRvIHBlcmZvcm1hbmNlIGFuZCBhdm9pZHMNCj4gc3BlY3VsYXRp
b24gaXNzdWVzLiIsIGMvcyA4NTIzODUxZGJjNC4NCj4gDQo+IFRoYXQgaGFsZiBzZW50ZW5j
ZSBpcyBsaXRlcmFsbHkgdGhlIHN1bSB0b3RhbCBvZiBqdXN0aWZpY2F0aW9uIGdpdmVuIGZv
cg0KPiB0aGlzIGJlaW5nIHJlbGF0ZWQgdG8gc3BlY3VsYXRpb24uDQo+IA0KPiBUaGUgb3Ro
ZXIgaGFsZiBvZiB0aGUgc2VudGVuY2UgY2xhaW1zIHBlcmZvcm1hbmNlLsKgIEJ1dCBubyBw
ZXJmb3JtYW5jZQ0KPiB0ZXN0aW5nIHdhcyBkb25lOyB0aGUgY292ZXIgbGV0dGVyIHRhbGtz
IGFib3V0IG9uZSB0ZXN0IHdpdGggc3BlY2lmaWNzLA0KPiBidXQgaXQgZGVzY3JpYmVzIGEg
c2NlbmFyaW8gd2hlcmUgdGhlIGRlbHRhIHdhcyBhIGhhbmRmdWwgb2YgY3ljbGVzDQo+IGRp
ZmZlcmVuY2UsIGFzIG9uZSBwYXJ0IGluIG11bHRpLW1pbGxpb25zLCBwcm9iYWJseSBiaWxs
aW9ucy7CoCBUaGVyZSBpcw0KPiBubyBwbGF1c2libGUgd2F5IHRoYXQgd2hhdGV2ZXIgcmF3
IGRhdGEgbGVhZCB0byB0aGUgIjwxJSBpbXByb3ZlbWVudCINCj4gY2xhaW0gd2FzIHN0YXRp
c3RpY2FsbHkgc2lnbmlmaWNhbnQuDQoNClllcywgYW5kIHlvdSB0b2xkIG1lIHRvIGRvIHNv
bWUgbW9yZSBwZXJmb3JtYW5jZSB0ZXN0aW5nIHdpdGggWGVuU2VydmVyDQphbmQgeW91IGV2
ZW4gZGlkbid0IHJlc3BvbmQgdG8gcXVlcmllcyByZWdhcmRpbmcgdGhlIHN0YXRlIG9mIHRo
YXQNCnRlc3RpbmcuDQoNCj4gVGhlIHJlYXNvbiBhIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50
IGNhbm5vdCBiZSBtZWFzdXJlZCBpcyB0aGF0IGEgYmlnDQo+IG91dC1vZi1vcmRlciBjb3Jl
IGNhbiBlYXNpbHkgYWJzb3JiIHRoZSBoaXQgaW4gdGhlIHNoYWRvdyBvZiBvdGhlcg0KPiBv
cGVyYXRpb25zLsKgwqAgU21hbGxlciBjb3JlcyBjYW5ub3QsIGFuZCBJJ20gY29uZmlkZW50
IHRoYXQgYWRlcXVhdGUNCj4gcGVyZm9ybWFuY2UgdGVzdGluZyB3b3VsZCBoYXZlIGRlbW9u
c3RyYXRlZCB0aGlzLg0KPiANCj4gVW5hZGRyZXNzZWQgaXMgdGhlIGNvZGUgYmxvYXQgZnJv
bSB0aGUgY2hhbmdlOyByZWxldmFudCBiZWNhdXNlIGl0IGlzDQo+IHRoZSBuZWdhdGl2ZSBo
YWxmIG9mIHRoZSB0cmFkZW9mZiBvbiB3aGF0IGlzIGFsbGVnZWRseSBhIG5ldCBpbXByb3Zl
bWVudA0KPiBvbiBhIGZhc3RwYXRoLsKgIEFjdHVhbGx5IHRyeWluZyB0byByZWFzb24gYWJv
dXQgdGhlIGNvZGUgYmxvYXQgd291bGQNCj4gaGF2ZSBoaWdobGlnaHRlZCB3aHkgaXQncyBy
YXRoZXIgaW1wb3J0YW50IHRoYXQgdGhlIGxvZ2ljIGJlIGltcGxlbWVudGVkDQo+IGFzIGEg
cmVhbCBmdW5jdGlvbiByYXRoZXIgdGhhbiBhIG1hY3JvLg0KDQpZb3UgaGFkIHNldmVyYWwg
d2Vla3MgdG8gYnJpbmcgdXAgdGhhdCBjb25jZXJuLCB5ZXQgeW91IGRpZG4ndC4NCg0KPiBB
bHNvIHVuYWRkcmVzc2VkIGlzIHdoZXRoZXIgdGhlIG11bHRpLW5lc3RpbmcgZXZlbiBoYXMg
YW55IHV0aWxpdHksIGFuZA0KPiBpZiBpdCBkb2VzLCB3aGF0IGl0IGRvZXMgdG8gdGhlIG90
aGVyIGtpbmRzIG9mIHdvcmtsb2Fkcy4NCj4gDQo+IFVuYWRkcmVzc2VkIHRvbyBpcyB0aGUg
aW1wYWN0IGZyb20gWFNBcyAzOTggYW5kIDQwNyB3aGljaCwgYXMgbWVtYmVycyBvZg0KPiB0
aGUgc2VjdXJpdHkgdGVhbSwgeW91IGhhZCBzdWJzdGFudGlhbGx5IG1vcmUgZXhwb3N1cmUg
dG8gdGhhbiBtb3N0Lg0KPiANCj4gDQo+IFRha2luZyBhIHN0ZXAgYmFjayBmcm9tIGxvdyBs
ZXZlbCBpc3N1ZXMuDQo+IA0KPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2VzIGEgTklIIGRvbWFp
bi1zcGVjaWZpYyBsYW5ndWFnZSBmb3IgZGVzY3JpYmluZw0KPiBoeXBlcmNhbGxzLCBidXQg
bGFja2luZyBpbiBhbnkgZG9jdW1lbnRhdGlvbi7CoCBBcyBhbiBleGVyY2lzZSB0byBvdGhl
cnMsDQo+IHRpbWUgaG93IGxvbmcgaXQgdGFrZXMgeW91IHRvIGdldCBjb21waWxlIGEgaHlw
ZXJ2aXNvciB3aXRoIGEgbmV3DQo+IGh5cGVyY2FsbCB0aGF0IHRha2VzIGUuZy4gb25lIGlu
dGVnZXIgYW5kIG9uZSBwb2ludGVyIHBhcmFtZXRlci7CoCBUaGVyZQ0KPiBzaG91bGQgYmUg
YSB3aG9sZSBsb3QgbW9yZSBhY2tzIG9uIHRoYXQgcGF0Y2ggZm9yIGl0IHRvIGJlIGNvbnNp
ZGVyZWQgdG8NCj4gaGF2ZSBhbiBhZGVxdWF0ZSByZXZpZXcuDQo+IA0KPiBTb21ld2hlcmUg
KEkgY2FuJ3QgcmVjYWxsIHdoZXJlLCBidXQgaXQncyA0IGluIHRoZSBtb3JuaW5nIHNvIEkn
bSBub3QNCj4gbG9va2luZyBmb3IgaXQgbm93KSwgYSBzdGF0ZW1lbnQgd2FzIG1hZGUgdGhh
dCBpZiBpc3N1ZXMgd2VyZSBmb3VuZCB0aGV5DQo+IGNvdWxkIGJlIGFkZHJlc3NlZCBnb2lu
ZyBmb3J3YXJkcy7CoCBCdXQgdGhlIHNlcmllcyB3YXMgY29tbWl0dGVkIHdpdGhvdXQNCj4g
YW55IHBvc3NpYmlsaXR5IGZvciBhbnlvbmUgdG8gcGVyZm9ybSB0aGUgdGVzdGluZyByZXF1
ZXN0ZWQgb2YgdGhlDQo+IG9yaWdpbmFsIHN1Ym1pc3Npb24uDQoNCkZ1bm55IHN0YXRlbWVu
dC4NCg0KVGhlIHNlcmllcyB3YXMgcGVuZGluZyBmb3IgYmVpbmcgY29tbWl0dGVkIGZvciBz
ZXZlcmFsIG1vbnRocywgSSBkaWQgcGluZw0KbXVsdGlwbGUgdGltZXMgZm9yIGFueSBmZWVk
YmFjayAoZXNwZWNpYWxseSB5b3UpIGFuZCB5b3UgZGlkbid0IGV2ZW4NCnJlc3BvbmQgd2l0
aCBhICJJJ2xsIGNvbWUgYmFjayB0byBpdCBsYXRlciIuIFlvdSBqdXN0IGJlaGF2ZWQgbGlr
ZQ0KL2Rldi9udWxsLiBUaGF0IHdhcyBkaXNjdXNzZWQgZXZlbiBpbiB0aGUgY29tbXVuaXR5
IGNhbGwsIHdoZXJlIHRoZQ0KZGVjaXNpb24gd2FzIHRha2VuIHRvIGZpbmFsbHkgYXBwbHkg
dGhlIHNlcmllcyB3aXRoIHlvdSBub3QgZXZlbiByZWFjdGluZw0KaW4gYSBtaW5pbWFsIHdh
eS4NCg0KPiBUaGVyZSB3YXMgb25lIHJlZGVlbWluZyBwcm9wZXJ0eSBvZiB0aGUgc2VyaWVz
LCBhbmQgeWV0IHRoZXJlIHdhcyBubw0KPiBkaXNjdXNzaW9uIGFueXdoZXJlIGFib3V0IGZ1
bmN0aW9uIHBvaW50ZXIgY2FzdHMuwqAgQnV0IGdpdmVuIHRoYXQgdGhlDQo+IHByZW1pc2Ug
d2FzIGRpc3B1dGVkIHRvIGJlZ2luIHdpdGgsIGFuZCB0aGUgcGVyZm9ybWFuY2UgdGVzdGlu
ZyB0aGF0DQo+IHN0b29kIGFuIG91dHNpZGUgY2hhbmNlIG9mIGNvdW50ZXJpbmcgdGhlIGRp
c3B1dGUgd2FzIGlnbm9yZWQsIGFuZA0KPiAvdGhlbi8gdGhhdCBteSBvYmplY3Rpb25zIHdl
cmUgZGlzcmVnYXJkZWQgYW5kIHRoZSBzZXJpZXMgY29tbWl0dGVkDQo+IHdpdGhvdXQgY2Fs
bGluZyBhIHZvdGUsIEkgaGF2ZSB0byBzYXkgdGhhdCBJJ20gdmVyeSBkaXNwbGVhc2VkIHdp
dGggaG93DQo+IHRoaXMgd2VudC4NCg0KWWVzLCBtZSB0b28uDQoNCkJlaW5nIGFza2VkIGZv
ciBzcGVjaWZpYyBjb25jZXJucyBtdWx0aXBsZSB0aW1lcywgbm90IHJlYWN0aW5nLCBhbmQg
dGhlbg0KY29taW5nIGJhY2sgYWZ0ZXIgbW9udGhzIHRoYXQgeW91IGhhdmUgYmVlbiBpZ25v
cmVkIGlzIGp1c3QgZGlzZ3VzdGluZy4NCg0KDQpKdWVyZ2VuDQo=
--------------UPuAP82ACL0jTna2VviEimP1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------UPuAP82ACL0jTna2VviEimP1--

--------------CNhJV7xvs6AgUgbVyiCDXkPQ--

--------------HtzEsG4XTbMGCMJUqeL4ZwUF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNkonMFAwAAAAAACgkQsN6d1ii/Ey9n
wggAkFBc2qPkS7HL4sxv9lcMtw+li82FEwMhbT7gEdGmkbDQP1hjUXdXxGERPvQeQtxhsOjK1cFt
NYfu/psMU17ynjYkWX/lXYJa4Zrjz4nbAFI3plxg1mC05+y1fdlicaRV6lvPYoTiIOB02iiy092i
Zy+/SP2Kco1E3DvK/fH9MNd9MGqHNGsxOqMsrlot71AEvzrAb3ImrBQ0+CnskO32HtvOJBJfcstF
7f8kKNSVOfSGFmUgxHNELweQHa76F1mk6Zs9sbX9YLd/HqQFmPKD/4hdGz+GwPlDS3YzizyXAU05
Lu+9egKhJ/O2zEIQPrtFYJdkq9eZuxTY2aNOCOMnVg==
=FdzR
-----END PGP SIGNATURE-----

--------------HtzEsG4XTbMGCMJUqeL4ZwUF--

