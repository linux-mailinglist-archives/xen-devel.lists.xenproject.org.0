Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70C54D197C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286881.486567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRa8X-0005NM-Kl; Tue, 08 Mar 2022 13:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286881.486567; Tue, 08 Mar 2022 13:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRa8X-0005Km-HM; Tue, 08 Mar 2022 13:44:25 +0000
Received: by outflank-mailman (input) for mailman id 286881;
 Tue, 08 Mar 2022 13:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PwwU=TT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nRa8W-0005Kg-DD
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:44:24 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcc66042-9ee5-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:44:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C33BA210F5;
 Tue,  8 Mar 2022 13:44:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DCAB13CCE;
 Tue,  8 Mar 2022 13:44:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id COAEArZdJ2JKJQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Mar 2022 13:44:22 +0000
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
X-Inumbo-ID: dcc66042-9ee5-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1646747062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMe7tVAgMCoCs60kbPFHS0ijMf3wCb5ecqkdk7hs2VI=;
	b=mBDUeYwXn3as9vpFKt/UcpOBEUzhJTJiApJCDyd7BEwSscTA5x8Jy0tXHX4UvpnSXvq/c8
	4WozC8XxMxdK98bGo6oPBHAkHI6Hlc9v+pe/ugEBrxPZXe99oa7Ur/LG410nFHryQ0fJ6a
	uGptj1A7qzQZJCHqxFR7o2yZLdJfXLk=
Message-ID: <7764a747-bff5-7c76-ab4b-a93fdd9050df@suse.com>
Date: Tue, 8 Mar 2022 14:44:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
 <cc6c9782-fff6-1832-0c25-d8fd38ed1c1d@suse.com>
 <88014841-017c-5621-0193-c4223596a29c@suse.com>
 <4455dab2-d52b-2e1a-388a-ffc3123438a4@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <4455dab2-d52b-2e1a-388a-ffc3123438a4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cZ1EIPHbOpkcQEXk0Ti3eL2t"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cZ1EIPHbOpkcQEXk0Ti3eL2t
Content-Type: multipart/mixed; boundary="------------PklIN8lTebXafeKv8RHJ0GTf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <7764a747-bff5-7c76-ab4b-a93fdd9050df@suse.com>
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
References: <20211208155606.20029-1-jgross@suse.com>
 <0ec9f176-1108-e1ac-a250-5ab9d151f7a8@suse.com>
 <4ac7c2ad-a600-f817-3b69-af0c1a47f4ac@suse.com>
 <cc6c9782-fff6-1832-0c25-d8fd38ed1c1d@suse.com>
 <88014841-017c-5621-0193-c4223596a29c@suse.com>
 <4455dab2-d52b-2e1a-388a-ffc3123438a4@suse.com>
In-Reply-To: <4455dab2-d52b-2e1a-388a-ffc3123438a4@suse.com>

--------------PklIN8lTebXafeKv8RHJ0GTf
Content-Type: multipart/mixed; boundary="------------yL9TfKeg30rDFQIL0BEcrNEo"

--------------yL9TfKeg30rDFQIL0BEcrNEo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDMuMjIgMTQ6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wMy4yMDIy
IDEzOjU2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDguMDMuMjIgMTM6NTAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjAzLjIwMjIgMDk6MzksIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IE9uIDA4LjAzLjIyIDA5OjM0LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+IE9uIDA4LjEyLjIwMjEgMTY6NTUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gSW4gb3JkZXIgdG8gYXZvaWQgaW5kaXJlY3QgZnVuY3Rpb24gY2FsbHMgb24gdGhlIGh5
cGVyY2FsbCBwYXRoIGFzDQo+Pj4+Pj4gbXVjaCBhcyBwb3NzaWJsZSB0aGlzIHNlcmllcyBp
cyByZW1vdmluZyB0aGUgaHlwZXJjYWxsIGZ1bmN0aW9uIHRhYmxlcw0KPj4+Pj4+IGFuZCBp
cyByZXBsYWNpbmcgdGhlIGh5cGVyY2FsbCBoYW5kbGVyIGNhbGxzIHZpYSB0aGUgZnVuY3Rp
b24gYXJyYXkNCj4+Pj4+PiBieSBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZCBjYWxsIG1hY3Jv
cy4NCj4+Pj4+Pg0KPj4+Pj4+IEFub3RoZXIgYnktcHJvZHVjdCBvZiBnZW5lcmF0aW5nIHRo
ZSBjYWxsIG1hY3JvcyBpcyB0aGUgYXV0b21hdGljDQo+Pj4+Pj4gZ2VuZXJhdGluZyBvZiB0
aGUgaHlwZXJjYWxsIGhhbmRsZXIgcHJvdG90eXBlcyBmcm9tIHRoZSBzYW1lIGRhdGEgYmFz
ZQ0KPj4+Pj4+IHdoaWNoIGlzIHVzZWQgdG8gZ2VuZXJhdGUgdGhlIG1hY3Jvcy4NCj4+Pj4+
Pg0KPj4+Pj4+IFRoaXMgaGFzIHRoZSBhZGRpdGlvbmFsIGFkdmFudGFnZSBvZiB1c2luZyB0
eXBlIHNhZmUgY2FsbHMgb2YgdGhlDQo+Pj4+Pj4gaGFuZGxlcnMgYW5kIHRvIGVuc3VyZSBy
ZWxhdGVkIGhhbmRsZXIgKGUuZy4gUFYgYW5kIEhWTSBvbmVzKSBzaGFyZQ0KPj4+Pj4+IHRo
ZSBzYW1lIHByb3RvdHlwZXMuDQo+Pj4+Pj4NCj4+Pj4+PiBBIHZlcnkgYnJpZWYgcGVyZm9y
bWFuY2UgdGVzdCAocGFyYWxsZWwgYnVpbGQgb2YgdGhlIFhlbiBoeXBlcnZpc29yDQo+Pj4+
Pj4gaW4gYSA2IHZjcHUgZ3Vlc3QpIHNob3dlZCBhIHZlcnkgc2xpbSBpbXByb3ZlbWVudCAo
bGVzcyB0aGFuIDElKSBvZg0KPj4+Pj4+IHRoZSBwZXJmb3JtYW5jZSB3aXRoIHRoZSBwYXRj
aGVzIGFwcGxpZWQuIFRoZSB0ZXN0IHdhcyBwZXJmb3JtZWQgdXNpbmcNCj4+Pj4+PiBhIFBW
IGFuZCBhIFBWSCBndWVzdC4NCj4+Pj4+Pg0KPj4+Pj4+IENoYW5nZXMgaW4gVjI6DQo+Pj4+
Pj4gLSBuZXcgcGF0Y2hlcyA2LCAxNCwgMTUNCj4+Pj4+PiAtIHBhdGNoIDc6IHN1cHBvcnQg
aHlwZXJjYWxsIHByaW9yaXRpZXMgZm9yIGZhc3RlciBjb2RlDQo+Pj4+Pj4gLSBjb21tZW50
cyBhZGRyZXNzZWQNCj4+Pj4+Pg0KPj4+Pj4+IENoYW5nZXMgaW4gVjM6DQo+Pj4+Pj4gLSBw
YXRjaGVzIDEgYW5kIDQgcmVtb3ZlZCBhcyBhbHJlYWR5IGFwcGxpZWQNCj4+Pj4+PiAtIGNv
bW1lbnRzIGFkZHJlc3NlZA0KPj4+Pj4+DQo+Pj4+Pj4gSnVlcmdlbiBHcm9zcyAoMTMpOg0K
Pj4+Pj4+ICAgICAgeGVuOiBtb3ZlIGRvX3ZjcHVfb3AoKSB0byBhcmNoIHNwZWNpZmljIGNv
ZGUNCj4+Pj4+PiAgICAgIHhlbjogaGFybW9uaXplIHJldHVybiB0eXBlcyBvZiBoeXBlcmNh
bGwgaGFuZGxlcnMNCj4+Pj4+PiAgICAgIHhlbjogZG9uJ3QgaW5jbHVkZSBhc20vaHlwZXJj
YWxsLmggZnJvbSBDIHNvdXJjZXMNCj4+Pj4+PiAgICAgIHhlbjogaW5jbHVkZSBjb21wYXQv
cGxhdGZvcm0uaCBmcm9tIGh5cGVyY2FsbC5oDQo+Pj4+Pj4gICAgICB4ZW46IGdlbmVyYXRl
IGh5cGVyY2FsbCBpbnRlcmZhY2UgcmVsYXRlZCBjb2RlDQo+Pj4+Pj4gICAgICB4ZW46IHVz
ZSBnZW5lcmF0ZWQgcHJvdG90eXBlcyBmb3IgaHlwZXJjYWxsIGhhbmRsZXJzDQo+Pj4+Pj4g
ICAgICB4ODYvcHYtc2hpbTogZG9uJ3QgbW9kaWZ5IGh5cGVyY2FsbCB0YWJsZQ0KPj4+Pj4+
ICAgICAgeGVuL3g4NjogZG9uJ3QgdXNlIGh5cGVyY2FsbCB0YWJsZSBmb3IgY2FsbGluZyBj
b21wYXQgaHlwZXJjYWxscw0KPj4+Pj4+ICAgICAgeGVuL3g4NjogY2FsbCBoeXBlcmNhbGwg
aGFuZGxlcnMgdmlhIGdlbmVyYXRlZCBtYWNybw0KPj4+Pj4+ICAgICAgeGVuL2FybTogY2Fs
bCBoeXBlcmNhbGwgaGFuZGxlcnMgdmlhIGdlbmVyYXRlZCBtYWNybw0KPj4+Pj4+ICAgICAg
eGVuL3g4NjogYWRkIGh5cGVyY2FsbCBwZXJmb3JtYW5jZSBjb3VudGVycyBmb3IgaHZtLCBj
b3JyZWN0IHB2DQo+Pj4+Pj4gICAgICB4ZW46IGRyb3AgY2FsbHNfdG9fbXVsdGljYWxsIHBl
cmZvcm1hbmNlIGNvdW50ZXINCj4+Pj4+PiAgICAgIHRvb2xzL3hlbnBlcmY6IHVwZGF0ZSBo
eXBlcmNhbGwgbmFtZXMNCj4+Pj4+DQo+Pj4+PiBBcyBpdCdzIHByZXR0eSBjZXJ0YWluIG5v
dyB0aGF0IHBhcnRzIG9mIHRoaXMgd2hpY2ggZGlkbid0IGdvIGluIHlldCB3aWxsDQo+Pj4+
PiBuZWVkIHJlLWJhc2luZywgSSdtIGdvaW5nIHRvIGRyb3AgdGhpcyBmcm9tIG15IHdhaXRp
bmctdG8tYmUtYWNrZWQgZm9sZGVyLA0KPj4+Pj4gZXhwZWN0aW5nIGEgdjQgaW5zdGVhZC4N
Cj4+Pj4NCj4+Pj4gWWVzLCBJIHdhcyBwbGFubmluZyB0byBzcGluIHRoYXQgdXAgc29vbi4N
Cj4+Pj4NCj4+Pj4gVGhlIG1haW4gcmVtYWluaW5nIHF1ZXN0aW9uIGlzIHdoZXRoZXIgd2Ug
d2FudCB0byBzd2l0Y2ggdGhlIHJldHVybiB0eXBlDQo+Pj4+IG9mIGFsbCBoeXBlcmNhbGxz
IChvciBhdCBsZWFzdCB0aGUgb25lcyBjb21tb24gdG8gYWxsIGFyY2hzKSBub3QNCj4+Pj4g
cmVxdWlyaW5nIHRvIHJldHVybiA2NC1iaXQgdmFsdWVzIHRvICJpbnQiLCBhcyBKdWxpZW4g
cmVxdWVzdGVkLg0KPj4+DQo+Pj4gQWZ0ZXIgd2Fsa2luZyB0aHJvdWdoIHRoZSBlYXJsaWVy
IGRpc2N1c3Npb24gKErDvHJnZW4gLSB0aGFua3MgZm9yIHRoZSBsaW5rKQ0KPj4+IEknbSBp
bmNsaW5lZCB0byBzYXkgdGhhdCBpZiBBcm0gd2FudHMgdGhlaXIgcmV0dXJuIHZhbHVlcyBs
aW1pdGVkIHRvIDMyIGJpdHMNCj4+PiAod2l0aCBleGNlcHRpb25zIHdoZXJlIG5lZWRlZCks
IHNvIGJlIGl0LiBCdXQgb24geDg2IEknZCByYXRoZXIgbm90IHNlZSB1cw0KPj4+IGNoYW5n
ZSB0aGlzIGFzcGVjdC4gT2YgY291cnNlIEknZCBtdWNoIHByZWZlciBpZiBhcmNoaXRlY3R1
cmVzIGRpZG4ndA0KPj4+IGRpdmVyZ2UgaW4gdGhpcyByZWdhcmQsIHlldCB0aGVuIGFnYWlu
IEFybSBoYXMgYWxyZWFkeSBkaXZlcmdlZCBpbiBhdm9pZGluZw0KPj4+IHRoZSBjb21wYXQg
bGF5ZXIgKGluIHRoaXMgY2FzZSBJIHZpZXcgdGhlIGRpdmVyZ2VuY2UgYXMgaGVscGZ1bCwg
dGhvdWdoLCBhcw0KPj4+IGl0IGF2b2lkcyB1bm5lY2Vzc2FyeSBoZWFkYWNoZSkuDQo+Pg0K
Pj4gSG93IHRvIGhhbmRsZSB0aGlzIGluIGNvbW1vbiBjb2RlIHRoZW4/IEhhdmUgYSBoeXBl
cmNhbGxfcmV0X3QgdHlwZQ0KPj4gKGV4YWN0IG5hbWluZyBUQkQpIHdoaWNoIGlzIGRlZmlu
ZWQgYXMgbG9uZyBvbiB4ODYgYW5kIGludCBvbiBBcm0/DQo+PiBPciB1c2UgbG9uZyBpbiB0
aGUgaGFuZGxlcnMgYW5kIGNoZWNrIHRoZSB2YWx1ZSBvbiBBcm0gc2lkZSB0byBiZSBhDQo+
PiB2YWxpZCAzMi1iaXQgc2lnbmVkIGludCAodGhpcyB3b3VsZCBiZSBjdW1iZXJzb21lIGZv
ciB0aGUgZXhjZXB0aW9ucywNCj4+IHRob3VnaCk/DQo+IA0KPiBJIHdhcyB0aGlua2luZyBh
bG9uZyB0aGUgbGluZXMgb2YgaHlwZXJjYWxsX3JldF90LCB5ZXMsIGJ1dCB0aGUNCj4gY29t
cGlsZXIgd291bGRuJ3QgYmUgaGVscGluZyB3aXRoIHNwb3R0aW5nIHRydW5jYXRpb24gaXNz
dWVzICh3ZSBjYW4ndA0KPiByZWFzb25hYmx5IGVuYWJsZSB0aGUgcmVzcGVjdGl2ZSB3YXJu
aW5ncywgYXMgdGhleSB3b3VsZCB0cmlnZ2VyIGFsbA0KPiBvdmVyIHRoZSBwbGFjZSkuIElm
IHdlIHdlcmUgdG8gZ28gdGhhdCByb3V0ZSwgd2UnZCByZWx5IG9uIGFuIGluaXRpYWwNCj4g
YXVkaXQgYW5kIHN1YnNlcXVlbnQgcGF0Y2ggcmV2aWV3IHRvIHNwb3QgaXNzdWVzLiBUaGVy
ZWZvcmUsDQo+IGN1bWJlcnNvbWUgb3Igbm90LCB0aGUgY2hlY2tpbmcgYXBwcm9hY2ggbWF5
IGJlIHRoZSBtb3JlIHZpYWJsZSBvbmUuDQo+IA0KPiBUaGVuIGFnYWluIEp1bGllbiBtYXkg
aGF2ZSBhIGJldHRlciBwbGFuIGluIG1pbmQ7IEknZCBhbnl3YXkgZXhwZWN0DQo+IGhpbSB0
byBzdXBwbHkgZGV0YWlscyBvbiBob3cgaGUgdGhpbmtzIHN1Y2ggYSB0cmFuc2l0aW9uIGNv
dWxkIGJlIGRvbmUNCj4gc2FmZWx5LCBhcyBoZSB3YXMgdGhlIG9uZSB0byByZXF1ZXN0IGxp
bWl0aW5nIHRvIDMyIGJpdHMuDQoNCkluIG9yZGVyIHRvIGhhdmUgc29tZSBwcm9ncmVzcyBJ
IGNvdWxkIGp1c3QgbGVhdmUgdGhlIEFybSBzaWRlIGFsb25lDQppbiBteSBzZXJpZXMuIEl0
IGNvdWxkIGJlIGFkZGVkIGxhdGVyIGlmIGEgc29sdXRpb24gaGFzIGJlZW4gYWdyZWVkDQpv
bi4NCg0KV2hhdCBkbyB5b3UgdGhpbms/DQoNCg0KSnVlcmdlbg0KDQo=
--------------yL9TfKeg30rDFQIL0BEcrNEo
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------yL9TfKeg30rDFQIL0BEcrNEo--

--------------PklIN8lTebXafeKv8RHJ0GTf--

--------------cZ1EIPHbOpkcQEXk0Ti3eL2t
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmInXbUFAwAAAAAACgkQsN6d1ii/Ey9G
pwf9EpC79NldYjKkDpklnj1WKSBkfGFZ8+LVwazNQ4njnlsOcL9nCX9SSrT2qa1WMlShKvQnXsU5
cTiN8gJDDTCOCGICzMuqmmOrjGjZj7V4viGCsMbNIv+wxm0cOTgaGgYJSUQ5gBpJlMraMEjSFkLh
g2bSmTadp5TCgVg/rPLaVHLsGTQcvpK5mtpc0NdD3FvofjoRTV8cN5ScZ/adg9ZNwtEVL7pGuv0v
xTj5/1Kn+sx+Vkx9FeAq8PqgYgZbhDLZ4m0TdzvBZVChS/o2QmKtxvClBh6bSVlbe9X744YopScB
ZkpP+bR2FBKLmVEJxImsVnSTwa6S5FqPR3uKg/JxrA==
=Wgec
-----END PGP SIGNATURE-----

--------------cZ1EIPHbOpkcQEXk0Ti3eL2t--

