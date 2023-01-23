Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9748967765C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 09:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482683.748315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsKH-0002JW-Av; Mon, 23 Jan 2023 08:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482683.748315; Mon, 23 Jan 2023 08:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJsKH-0002Gj-7C; Mon, 23 Jan 2023 08:37:13 +0000
Received: by outflank-mailman (input) for mailman id 482683;
 Mon, 23 Jan 2023 08:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MxFs=5U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pJsKG-0002Gd-B6
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 08:37:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20f6ae7d-9af9-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 09:37:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 90DA01F385;
 Mon, 23 Jan 2023 08:37:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65BBE1357F;
 Mon, 23 Jan 2023 08:37:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j+iTFzZHzmOGWQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 23 Jan 2023 08:37:10 +0000
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
X-Inumbo-ID: 20f6ae7d-9af9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1674463030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hS5XGFExAsqsp+MS5HknuutdmdrcrusqkkUDZna1C68=;
	b=Z0HmZz9iqB8m36g6PeUuLp/ZQgsMqPCJPzkVlcefDTIfmpPBZ9guE13huLRnnc5I8j+9SQ
	PNGStIjBSgmgMZzc561FUpemEJeQBetQW9a6iMovY5pstP9LKkRKy1mdg/F45FcmHN/uhU
	E/QilRI03nFVeMF8WQoUTXFFZC1JmKY=
Message-ID: <35169441-18ab-b937-8063-b40b16ff3bd4@suse.com>
Date: Mon, 23 Jan 2023 09:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230121213908.6504-1-jandryuk@gmail.com>
 <20230121213908.6504-3-jandryuk@gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] Revert "tools/xenstore: simplify loop handling
 connection I/O"
In-Reply-To: <20230121213908.6504-3-jandryuk@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w8Uw4fiU27yCTPZCNOp0sChW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w8Uw4fiU27yCTPZCNOp0sChW
Content-Type: multipart/mixed; boundary="------------zzHsIoN0Z56OzUvf3pUHZ9mX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <35169441-18ab-b937-8063-b40b16ff3bd4@suse.com>
Subject: Re: [PATCH 2/2] Revert "tools/xenstore: simplify loop handling
 connection I/O"
References: <20230121213908.6504-1-jandryuk@gmail.com>
 <20230121213908.6504-3-jandryuk@gmail.com>
In-Reply-To: <20230121213908.6504-3-jandryuk@gmail.com>

--------------zzHsIoN0Z56OzUvf3pUHZ9mX
Content-Type: multipart/mixed; boundary="------------YeR8jgEvZz17dcIP1lV3VJ2I"

--------------YeR8jgEvZz17dcIP1lV3VJ2I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDEuMjMgMjI6MzksIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEknbSBvYnNlcnZp
bmcgZ3Vlc3Qga2V4ZWMgdHJpZ2dlciB4ZW5zdG9yZWQgdG8gYWJvcnQgb24gYSBkb3VibGUg
ZnJlZS4NCj4gDQo+IGdkYiBvdXRwdXQ6DQo+IFByb2dyYW0gcmVjZWl2ZWQgc2lnbmFsIFNJ
R0FCUlQsIEFib3J0ZWQuDQo+IF9fcHRocmVhZF9raWxsX2ltcGxlbWVudGF0aW9uIChub190
aWQ9MCwgc2lnbm89NiwgdGhyZWFkaWQ9MTQwNjQ1NjE0MjU4MTEyKSBhdCAuL25wdGwvcHRo
cmVhZF9raWxsLmM6NDQNCj4gNDQgICAgLi9ucHRsL3B0aHJlYWRfa2lsbC5jOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5Lg0KPiAoZ2RiKSBidA0KPiAgICAgIGF0IC4vbnB0bC9wdGhy
ZWFkX2tpbGwuYzo0NA0KPiAgICAgIGF0IC4vbnB0bC9wdGhyZWFkX2tpbGwuYzo3OA0KPiAg
ICAgIGF0IC4vbnB0bC9wdGhyZWFkX2tpbGwuYzo4OQ0KPiAgICAgIGF0IC4uL3N5c2RlcHMv
cG9zaXgvcmFpc2UuYzoyNg0KPiAgICAgIGF0IHRhbGxvYy5jOjExOQ0KPiAgICAgIHB0cj1w
dHJAZW50cnk9MHg1NTlmYWU3MjQyOTApIGF0IHRhbGxvYy5jOjIzMg0KPiAgICAgIGF0IHhl
bnN0b3JlZF9jb3JlLmM6Mjk0NQ0KPiAoZ2RiKSBmcmFtZSA1DQo+ICAgICAgYXQgdGFsbG9j
LmM6MTE5DQo+IDExOSAgICAgICAgICAgIFRBTExPQ19BQk9SVCgiQmFkIHRhbGxvYyBtYWdp
YyB2YWx1ZSAtIGRvdWJsZSBmcmVlIik7DQo+IChnZGIpIGZyYW1lIDcNCj4gICAgICBhdCB4
ZW5zdG9yZWRfY29yZS5jOjI5NDUNCj4gMjk0NSAgICAgICAgICAgICAgICB0YWxsb2NfaW5j
cmVhc2VfcmVmX2NvdW50KGNvbm4pOw0KPiAoZ2RiKSBwIGNvbm4NCj4gJDEgPSAoc3RydWN0
IGNvbm5lY3Rpb24gKikgMHg1NTlmYWU3MjQyOTANCj4gDQo+IExvb2tpbmcgYXQgYSB4ZW5z
dG9yZSB0cmFjZSwgd2UgaGF2ZToNCj4gSU4gMHg1NTlmYWU3MWYyNTAgMjAyMzAxMjAgMTc6
NDA6NTMgUkVBRCAoL2xvY2FsL2RvbWFpbi8zL2ltYWdlL2RldmljZS1tb2RlbC1kb20NCj4g
aWQgKQ0KPiB3cmw6IGRvbSAgICAwICAgICAgMSAgbXNlYyAgICAgIDEwMDAwIGNyZWRpdCAg
ICAgMTAwMDAwMCByZXNlcnZlICAgICAgICAxMDAgZGlzYw0KPiBhcmQNCj4gd3JsOiBkb20g
ICAgMyAgICAgIDEgIG1zZWMgICAgICAxMDAwMCBjcmVkaXQgICAgIDEwMDAwMDAgcmVzZXJ2
ZSAgICAgICAgMTAwIGRpc2MNCj4gYXJkDQo+IHdybDogZG9tICAgIDAgICAgICAwICBtc2Vj
ICAgICAgMTAwMDAgY3JlZGl0ICAgICAxMDAwMDAwIHJlc2VydmUgICAgICAgICAgMCBkaXNj
DQo+IGFyZA0KPiB3cmw6IGRvbSAgICAzICAgICAgMCAgbXNlYyAgICAgIDEwMDAwIGNyZWRp
dCAgICAgMTAwMDAwMCByZXNlcnZlICAgICAgICAgIDAgZGlzYw0KPiBhcmQNCj4gT1VUIDB4
NTU5ZmFlNzFmMjUwIDIwMjMwMTIwIDE3OjQwOjUzIEVSUk9SIChFTk9FTlQgKQ0KPiB3cmw6
IGRvbSAgICAwICAgICAgMSAgbXNlYyAgICAgIDEwMDAwIGNyZWRpdCAgICAgMTAwMDAwMCBy
ZXNlcnZlICAgICAgICAxMDAgZGlzYw0KPiBhcmQNCj4gd3JsOiBkb20gICAgMyAgICAgIDEg
IG1zZWMgICAgICAxMDAwMCBjcmVkaXQgICAgIDEwMDAwMDAgcmVzZXJ2ZSAgICAgICAgMTAw
IGRpc2MNCj4gYXJkDQo+IElOIDB4NTU5ZmFlNzFmMjUwIDIwMjMwMTIwIDE3OjQwOjUzIFJF
TEVBU0UgKDMgKQ0KPiBERVNUUk9ZIHdhdGNoIDB4NTU5ZmFlNzNmNjMwDQo+IERFU1RST1kg
d2F0Y2ggMHg1NTlmYWU3NWRkZjANCj4gREVTVFJPWSB3YXRjaCAweDU1OWZhZTc1ZWMzMA0K
PiBERVNUUk9ZIHdhdGNoIDB4NTU5ZmFlNzVlYTYwDQo+IERFU1RST1kgd2F0Y2ggMHg1NTlm
YWU3MzJjMDANCj4gREVTVFJPWSB3YXRjaCAweDU1OWZhZTcyY2VhMA0KPiBERVNUUk9ZIHdh
dGNoIDB4NTU5ZmFlNzI4ZmMwDQo+IERFU1RST1kgd2F0Y2ggMHg1NTlmYWU3Mjk1NzANCj4g
REVTVFJPWSBjb25uZWN0aW9uIDB4NTU5ZmFlNzI0MjkwDQo+IG9ycGhhbmVkIG5vZGUgL2xv
Y2FsL2RvbWFpbi8zL2RldmljZS9zdXNwZW5kL2V2ZW50LWNoYW5uZWwgZGVsZXRlZA0KPiBv
cnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9kZXZpY2UvdmJkLzUxNzEyIGRlbGV0ZWQN
Cj4gb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvZGV2aWNlL3ZrYmQvMCBkZWxldGVk
DQo+IG9ycGhhbmVkIG5vZGUgL2xvY2FsL2RvbWFpbi8zL2RldmljZS92aWYvMCBkZWxldGVk
DQo+IG9ycGhhbmVkIG5vZGUgL2xvY2FsL2RvbWFpbi8zL2NvbnRyb2wvc2h1dGRvd24gZGVs
ZXRlZA0KPiBvcnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9jb250cm9sL2ZlYXR1cmUt
cG93ZXJvZmYgZGVsZXRlZA0KPiBvcnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9jb250
cm9sL2ZlYXR1cmUtcmVib290IGRlbGV0ZWQNCj4gb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9t
YWluLzMvY29udHJvbC9mZWF0dXJlLXN1c3BlbmQgZGVsZXRlZA0KPiBvcnBoYW5lZCBub2Rl
IC9sb2NhbC9kb21haW4vMy9jb250cm9sL2ZlYXR1cmUtczMgZGVsZXRlZA0KPiBvcnBoYW5l
ZCBub2RlIC9sb2NhbC9kb21haW4vMy9jb250cm9sL2ZlYXR1cmUtczQgZGVsZXRlZA0KPiBv
cnBoYW5lZCBub2RlIC9sb2NhbC9kb21haW4vMy9jb250cm9sL3N5c3JxIGRlbGV0ZWQNCj4g
b3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvZGF0YSBkZWxldGVkDQo+IG9ycGhhbmVk
IG5vZGUgL2xvY2FsL2RvbWFpbi8zL2RyaXZlcnMgZGVsZXRlZA0KPiBvcnBoYW5lZCBub2Rl
IC9sb2NhbC9kb21haW4vMy9mZWF0dXJlIGRlbGV0ZWQNCj4gb3JwaGFuZWQgbm9kZSAvbG9j
YWwvZG9tYWluLzMvYXR0ciBkZWxldGVkDQo+IG9ycGhhbmVkIG5vZGUgL2xvY2FsL2RvbWFp
bi8zL2Vycm9yIGRlbGV0ZWQNCj4gb3JwaGFuZWQgbm9kZSAvbG9jYWwvZG9tYWluLzMvY29u
c29sZS9iYWNrZW5kLWlkIGRlbGV0ZWQNCj4gDQo+IGFuZCBubyBmdXJ0aGVyIG91dHB1dC4N
Cj4gDQo+IFRoZSB0cmFjZSBzaG93cyB0aGF0IERFU1RST1kgd2FzIGNhbGxlZCBmb3IgY29u
bmVjdGlvbiAweDU1OWZhZTcyNDI5MCwNCj4gYnV0IHRoYXQgaXMgdGhlIHNhbWUgcG9pbnRl
ciAoY29ubikgbWFpbigpIHdhcyBsb29waW5nIHRocm91Z2ggZnJvbQ0KPiBjb25uZWN0aW9u
cy4gIFNvIGl0IHdhc24ndCBhY3R1YWxseSByZW1vdmVkIGZyb20gdGhlIGNvbm5lY3Rpb25z
IGxpc3Q/DQo+IA0KPiBSZXZlcnRpbmcgY29tbWl0IGU4ZTZlNDIyNzlhNSAidG9vbHMveGVu
c3RvcmU6IHNpbXBsaWZ5IGxvb3AgaGFuZGxpbmcNCj4gY29ubmVjdGlvbiBJL08iIGZpeGVz
IHRoZSBhYm9ydC9kb3VibGUgZnJlZS4gIEkgdGhpbmsgdGhlIHVzZSBvZg0KPiBsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NhZmUgaXMgaW5jb3JyZWN0LiAgbGlzdF9mb3JfZWFjaF9lbnRyeV9z
YWZlIG1ha2VzDQo+IHRyYXZlcnNhbCBzYWZlIGZvciBkZWxldGluZyB0aGUgY3VycmVudCBp
dGVyYXRvciwgYnV0IFJFTEVBU0UvZG9fcmVsZWFzZQ0KPiB3aWxsIGRlbGV0ZSBzb21lIG90
aGVyIGVudHJ5IGluIHRoZSBjb25uZWN0aW9ucyBsaXN0LiAgSSB0aGluayB0aGUNCj4gb2Jz
ZXJ2ZWQgYWJvcnQgaXMgYmVjYXVzZSBsaXN0X2Zvcl9lYWNoX2VudHJ5IGhhcyBuZXh0IHBv
aW50aW5nIHRvIHRoZQ0KPiBkZWxldGVkIGNvbm5lY3Rpb24sIGFuZCBpdCBpcyB1c2VkIGlu
IHRoZSBzdWJzZXF1ZW50IGl0ZXJhdGlvbi4NCj4gDQo+IEFkZCBhIGNvbW1lbnQgZXhwbGFp
bmluZyB0aGUgdW5zdWl0YWJpbGl0eSBvZiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUuDQo+
IEFsc28gbm90aWNlIHRoYXQgdGhlIG9sZCBjb2RlIHRha2VzIGEgcmVmZXJlbmNlIG9uIG5l
eHQgd2hpY2ggd291bGQNCj4gcHJldmVudHMgYSB1c2UtYWZ0ZXItZnJlZS4NCj4gDQo+IFRo
aXMgcmV2ZXJ0cyBjb21taXQgZThlNmU0MjI3OWE1NzIzMjM5YzVjNDBiYTRjN2Y1NzlhOTc5
NDY1ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdt
YWlsLmNvbT4NCg0KR29vZCBjYXRjaCENCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCg0Kd2l0aCBvbmUgbml0OiBhICJGaXhlczoiIHRhZyBmb3Ig
Y29tbWl0IGU4ZTZlNDIyNzlhNSBzaG91bGQgYmUgYWRkZWQuDQoNCj4gLS0tDQo+IEkgZGlk
bid0IHZlcmlmeSB0aGUgc3RhbGUgcG9pbnRlcnMsIHdoaWNoIGlzIHdoeSB0aGVyZSBhcmUg
YSBsb3Qgb2YgIkkNCj4gdGhpbmsiIHF1YWxpZmllcnMuICBCdXQgcmV2ZXJ0aW5nIHRoZSBj
b21taXQgaGFzIHhlbnN0b3JlZCBzdGlsbCBydW5uaW5nDQo+IHdoZXJlYXMgaXQgd2FzIGFi
b3J0aW5nIGNvbnNpc3RlbnRseSBiZWZvcmVoYW5kLg0KDQpZb3VyIGFuYWx5c2lzIHNlZW1z
IHRvIGJlIGZpbmUuIFNvZnQgcmVzZXQgaGFuZGxpbmcgaW5jbHVkZXMgYQ0KIlhTX1JFTEVB
U0UiIG1lc3NhZ2UgZm9yIHRoZSBhZmZlY3RlZCBndWVzdCwgd2hpY2ggcmVzdWx0cyBpbiB0
aGUNCnN0cnVjdCBkb21haW4gYW5kIHRoZSBhc3NvY2lhdGVkIGNvbm5lY3Rpb24gdG8gYmUg
ZnJlZWQuIFRoaXMgY2FuDQpoYXBwZW4gdG8gYmUgdGhlIGNvbm5lY3Rpb24gaW4gdGhlICJu
ZXh0IiBwb2ludGVyLCByZXN1bHRpbmcgaW4NCnRoZSBjcmFzaCB5b3UndmUgb2JzZXJ2ZWQu
DQoNCg0KSnVlcmdlbg0K
--------------YeR8jgEvZz17dcIP1lV3VJ2I
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------YeR8jgEvZz17dcIP1lV3VJ2I--

--------------zzHsIoN0Z56OzUvf3pUHZ9mX--

--------------w8Uw4fiU27yCTPZCNOp0sChW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPORzUFAwAAAAAACgkQsN6d1ii/Ey/V
Kwf/YdTA7bZQ4tj2cZIU9nUfIjeCqTpaX+8sVuAsWdBk0bhnKIq2z9HGYu2wSQN2Y5pLQ9yIxj7Z
KxCKUKFdp0hoxcE0xMWcc87zD2T8P4/jcnzxTixJ0WcsNtrEkfOx+m5GZz+C3ldrE6tIF6WAwu3X
aN6ZkRBBtCxd+8Mpx06fnyL/qb6hYrMKWH/Ibj7hvwF1ussOeUnOhtwiDNHyhbk/cLZLOyxxmjNL
gnafdtzmznSmIquSoqDTC3uo/Kgv79Gn8UxOBFR7o7n8QMz5cMSbPZzwJPp93l19lk4aP99j57M0
G6f3dNBOJCt8pXuVdQBCE8s2xuFeYj9prJCv0x1VBA==
=PtDk
-----END PGP SIGNATURE-----

--------------w8Uw4fiU27yCTPZCNOp0sChW--

