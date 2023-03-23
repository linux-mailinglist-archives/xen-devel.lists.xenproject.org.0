Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F46C6B00
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513923.795683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLxx-0002Ns-Rz; Thu, 23 Mar 2023 14:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513923.795683; Thu, 23 Mar 2023 14:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLxx-0002Lu-P1; Thu, 23 Mar 2023 14:30:57 +0000
Received: by outflank-mailman (input) for mailman id 513923;
 Thu, 23 Mar 2023 14:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfLxw-0001tb-6X
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:30:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51f33be8-c987-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 15:30:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D98421FE4F;
 Thu, 23 Mar 2023 14:30:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACBD1132C2;
 Thu, 23 Mar 2023 14:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4/iXKJ5iHGR/fwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 14:30:54 +0000
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
X-Inumbo-ID: 51f33be8-c987-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679581854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTWSz6ML4IRa8PTe4BmfTEozdDsCNS8kIS6s8FK2wNk=;
	b=EJIMYVZjCtP2BV2epwfVrl81btJ+J9y46C9Mxt83Cod/D7NZX7DTxf/uMN4qXo67i6XtJ6
	4UvLoZj+qkcGYVL54L3YHL1vPGs+k1FUbTDitjPVwPvXj/yiwW8IpEink+zTRSMdGMoqCI
	VEtQ5tYwIGilnPAk8aW6FgxQAiitPqU=
Message-ID: <068b0759-0d8c-d477-2197-62eff82e601c@suse.com>
Date: Thu, 23 Mar 2023 15:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tools/xenstore: fix quota check in acc_fix_domains()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230224155848.31036-1-jgross@suse.com>
 <a8e71268-6111-d4d5-5cba-ed141dba530d@xen.org>
 <363e4526-6bc2-d961-88ac-93ba82e2e30c@suse.com>
 <b95864bf-014f-7b1d-3c07-295705cdba0d@xen.org>
 <92b2f26a-fd2e-2826-d38f-3ca45727bfb3@suse.com>
 <f2fd8967-7dc5-4aeb-ae72-623bc4ae3e4d@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <f2fd8967-7dc5-4aeb-ae72-623bc4ae3e4d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NJ3F80dndY9D0ORPft79XUay"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NJ3F80dndY9D0ORPft79XUay
Content-Type: multipart/mixed; boundary="------------kWOOqliNnkmCNqdsV7qQYzhZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <068b0759-0d8c-d477-2197-62eff82e601c@suse.com>
Subject: Re: [PATCH] tools/xenstore: fix quota check in acc_fix_domains()
References: <20230224155848.31036-1-jgross@suse.com>
 <a8e71268-6111-d4d5-5cba-ed141dba530d@xen.org>
 <363e4526-6bc2-d961-88ac-93ba82e2e30c@suse.com>
 <b95864bf-014f-7b1d-3c07-295705cdba0d@xen.org>
 <92b2f26a-fd2e-2826-d38f-3ca45727bfb3@suse.com>
 <f2fd8967-7dc5-4aeb-ae72-623bc4ae3e4d@xen.org>
In-Reply-To: <f2fd8967-7dc5-4aeb-ae72-623bc4ae3e4d@xen.org>

--------------kWOOqliNnkmCNqdsV7qQYzhZ
Content-Type: multipart/mixed; boundary="------------7psn3iT2YUD5u0u3HIrQGoH2"

--------------7psn3iT2YUD5u0u3HIrQGoH2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjMgMTU6MjksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAy
My8wMy8yMDIzIDE0OjIxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjMuMDMuMjMg
MTU6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDIzLzAz
LzIwMjMgMTI6NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDIzLjAzLjIzIDEz
OjM4LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4NCj4+
Pj4+IE9uIDI0LzAyLzIwMjMgMTU6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4g
VG9kYXkgd2hlbiBmaW5hbGl6aW5nIGEgdHJhbnNhY3Rpb24gdGhlIG51bWJlciBvZiBub2Rl
IHF1b3RhIGlzIGNoZWNrZWQNCj4+Pj4+PiB0byBub3QgYmVpbmcgZXhjZWVkZWQgYWZ0ZXIg
dGhlIHRyYW5zYWN0aW9uLiBUaGlzIGNoZWNrIGlzIGFsd2F5cyBkb25lLA0KPj4+Pj4+IGV2
ZW4gaWYgdGhlIHRyYW5zYWN0aW9uIGlzIGJlaW5nIHBlcmZvcm1lZCBieSBhIHByaXZpbGVn
ZWQgY29ubmVjdGlvbiwNCj4+Pj4+PiBvciBpZiB0aGVyZSB3ZXJlIG5vIG5vZGVzIGNyZWF0
ZWQgaW4gdGhlIHRyYW5zYWN0aW9uLg0KPj4+Pj4+DQo+Pj4+Pj4gQ29ycmVjdCB0aGF0IGJ5
IGNoZWNraW5nIHF1b3RhIG9ubHkgaWY6DQo+Pj4+Pj4gLSB0aGUgdHJhbnNhY3Rpb24gaXMg
YmVpbmcgcGVyZm9ybWVkIGJ5IGFuIHVucHJpdmlsZWdlZCBndWVzdCwgYW5kDQo+Pj4+Pj4g
LSBhdCBsZWFzdCBvbmUgbm9kZSB3YXMgY3JlYXRlZCBpbiB0aGUgdHJhbnNhY3Rpb24NCj4+
Pj4+Pg0KPj4+Pj4+IFJlcG9ydGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
Pg0KPj4+Pj4+IEZpeGVzOiBmMmJlYmY3MmM0ZDUgKCJ4ZW5zdG9yZTogcmV3b3JrIG9mIHRy
YW5zYWN0aW9uIGhhbmRsaW5nIikNCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+Pj4gLS0tDQo+Pj4+Pj4gwqAgdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX2NvcmUuY8KgwqDCoMKgwqDCoMKgIHzCoCAzICsrKw0KPj4+Pj4+
IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uY8KgwqDCoMKgwqAgfMKgIDQg
KystLQ0KPj4+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaMKgwqDC
oMKgwqAgfMKgIDIgKy0NCj4+Pj4+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJh
bnNhY3Rpb24uYyB8IDE2ICsrKysrKysrKysrKysrLS0NCj4+Pj4+PiDCoCB0b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rpb24uaCB8wqAgMyArKysNCj4+Pj4+PiDCoCA1IGZp
bGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pj4+Pj4N
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyAN
Cj4+Pj4+PiBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+Pj4+PiBpbmRl
eCBhNjFkYjJkYjJkLi4zY2E2ODY4MWUzIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+Pj4+PiArKysgYi90b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfY29yZS5jDQo+Pj4+Pj4gQEAgLTE0NzIsNiArMTQ3Miw5IEBAIHN0YXRpYyBz
dHJ1Y3Qgbm9kZSAqY3JlYXRlX25vZGUoc3RydWN0IGNvbm5lY3Rpb24gDQo+Pj4+Pj4gKmNv
bm4sIGNvbnN0IHZvaWQgKmN0eCwNCj4+Pj4+PiDCoMKgwqDCoMKgIGlmICghbm9kZSkNCj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+Pj4+Pj4gK8KgwqDCoCBp
ZiAoY29ubiAmJiBjb25uLT50cmFuc2FjdGlvbikNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
dGFfbm9kZV9jcmVhdGVkKGNvbm4tPnRyYW5zYWN0aW9uKTsNCj4+Pj4+PiArDQo+Pj4+Pj4g
wqDCoMKgwqDCoCBub2RlLT5kYXRhID0gZGF0YTsNCj4+Pj4+PiDCoMKgwqDCoMKgIG5vZGUt
PmRhdGFsZW4gPSBkYXRhbGVuOw0KPj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfZG9tYWluLmMgDQo+Pj4+Pj4gYi90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmMNCj4+Pj4+PiBpbmRleCBkN2ZjMmZhZmM3Li5mNjJiZTIyNDVjIDEwMDY0
NA0KPj4+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYw0KPj4+
Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYw0KPj4+Pj4+IEBA
IC01NDQsNyArNTQ0LDcgQEAgc3RhdGljIHN0cnVjdCBkb21haW4gKmZpbmRfZG9tYWluX2J5
X2RvbWlkKHVuc2lnbmVkIA0KPj4+Pj4+IGludCBkb21pZCkNCj4+Pj4+PiDCoMKgwqDCoMKg
IHJldHVybiAoZCAmJiBkLT5pbnRyb2R1Y2VkKSA/IGQgOiBOVUxMOw0KPj4+Pj4+IMKgIH0N
Cj4+Pj4+PiAtaW50IGFjY19maXhfZG9tYWlucyhzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkLCBi
b29sIHVwZGF0ZSkNCj4+Pj4+PiAraW50IGFjY19maXhfZG9tYWlucyhzdHJ1Y3QgbGlzdF9o
ZWFkICpoZWFkLCBib29sIGNoa19xdW90YSwgYm9vbCB1cGRhdGUpDQo+Pj4+Pj4gwqAgew0K
Pj4+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGNoYW5nZWRfZG9tYWluICpjZDsNCj4+Pj4+PiDC
oMKgwqDCoMKgIGludCBjbnQ7DQo+Pj4+Pj4gQEAgLTU1Miw3ICs1NTIsNyBAQCBpbnQgYWNj
X2ZpeF9kb21haW5zKHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQsIGJvb2wgdXBkYXRlKQ0KPj4+
Pj4+IMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShjZCwgaGVhZCwgbGlzdCkgew0K
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjbnQgPSBkb21haW5fbmJlbnRyeV9maXgoY2Qt
PmRvbWlkLCBjZC0+bmJlbnRyeSwgdXBkYXRlKTsNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCF1cGRhdGUpIHsNCj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
Y250ID49IHF1b3RhX25iX2VudHJ5X3Blcl9kb21haW4pDQo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKGNoa19xdW90YSAmJiBjbnQgPj0gcXVvdGFfbmJfZW50cnlfcGVy
X2RvbWFpbikNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBFTk9TUEM7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNu
dCA8IDApDQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gRU5PTUVNOw0KPj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmggDQo+Pj4+Pj4gYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWlu
LmgNCj4+Pj4+PiBpbmRleCBkYzQ2NjA4NjFlLi5lYzZhYTAwY2M3IDEwMDY0NA0KPj4+Pj4+
IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaA0KPj4+Pj4+ICsrKyBi
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaA0KPj4+Pj4+IEBAIC05Niw3ICs5
Niw3IEBAIHZvaWQgZG9tYWluX291dHN0YW5kaW5nX2RlYyhzdHJ1Y3QgY29ubmVjdGlvbiAq
Y29ubik7DQo+Pj4+Pj4gwqAgdm9pZCBkb21haW5fb3V0c3RhbmRpbmdfZG9taWRfZGVjKHVu
c2lnbmVkIGludCBkb21pZCk7DQo+Pj4+Pj4gwqAgaW50IGRvbWFpbl9nZXRfcXVvdGEoY29u
c3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBkb21pZCk7DQo+Pj4+Pj4gLWlu
dCBhY2NfZml4X2RvbWFpbnMoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCwgYm9vbCB1cGRhdGUp
Ow0KPj4+Pj4+ICtpbnQgYWNjX2ZpeF9kb21haW5zKHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQs
IGJvb2wgY2hrX3F1b3RhLCBib29sIHVwZGF0ZSk7DQo+Pj4+Pg0KPj4+Pj4gRGVwZW5kaW5n
IG9uIHRoZSBhbnN3ZXIgYmVsb3csIEkgd291bGQgc3VnZ2VzdCB0byB3cml0ZSB0aGF0ICdj
aGtfcXVvdGEnIGlzIA0KPj4+Pj4gaWdub3JlZCB3aGVuIGBgdXBkYXRlYGAgaXMgdHJ1ZS4N
Cj4+Pj4NCj4+Pj4gV2l0aCB0aGUgYW5zd2VyIGJlbG93LCBkbyB5b3UgYWdyZWUgdGhhdCBu
byBhZGRpdGlvbmFsIGNvbW1lbnQgaXMgbmVlZGVkPw0KPj4+PiBJJ20gZmluZSBlaXRoZXIg
d2F5Lg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+PiDCoCAvKiBXcml0ZSByYXRlIGxpbWl0aW5nICov
DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2Fj
dGlvbi5jIA0KPj4+Pj4+IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0aW9u
LmMNCj4+Pj4+PiBpbmRleCAxYWE5ZDNjYjNkLi4yYjE1NTA2OTUzIDEwMDY0NA0KPj4+Pj4+
IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5jDQo+Pj4+Pj4g
KysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0aW9uLmMNCj4+Pj4+PiBA
QCAtMTYwLDEyICsxNjAsMjAgQEAgc3RydWN0IHRyYW5zYWN0aW9uDQo+Pj4+Pj4gwqDCoMKg
wqDCoCAvKiBMaXN0IG9mIGNoYW5nZWQgZG9tYWlucyAtIHRvIHJlY29yZCB0aGUgY2hhbmdl
ZCBkb21haW4gZW50cnkgDQo+Pj4+Pj4gbnVtYmVyICovDQo+Pj4+Pj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgbGlzdF9oZWFkIGNoYW5nZWRfZG9tYWluczsNCj4+Pj4+PiArwqDCoMKgIC8qIFRo
ZXJlIHdhcyBhdCBsZWFzdCBvbmUgbm9kZSBjcmVhdGVkIGluIHRoZSB0cmFuc2FjdGlvbi4g
Ki8NCj4+Pj4+PiArwqDCoMKgIGJvb2wgbm9kZV9jcmVhdGVkOw0KPj4+Pj4+ICsNCj4+Pj4+
PiDCoMKgwqDCoMKgIC8qIEZsYWcgZm9yIGxldHRpbmcgdHJhbnNhY3Rpb24gZmFpbC4gKi8N
Cj4+Pj4+PiDCoMKgwqDCoMKgIGJvb2wgZmFpbDsNCj4+Pj4+PiDCoCB9Ow0KPj4+Pj4+IMKg
IHVpbnQ2NF90IGdlbmVyYXRpb247DQo+Pj4+Pj4gK3ZvaWQgdGFfbm9kZV9jcmVhdGVkKHN0
cnVjdCB0cmFuc2FjdGlvbiAqdHJhbnMpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArwqDCoMKgIHRy
YW5zLT5ub2RlX2NyZWF0ZWQgPSB0cnVlOw0KPj4+Pj4+ICt9DQo+Pj4+Pj4gKw0KPj4+Pj4+
IMKgIHN0YXRpYyBzdHJ1Y3QgYWNjZXNzZWRfbm9kZSAqZmluZF9hY2Nlc3NlZF9ub2RlKHN0
cnVjdCB0cmFuc2FjdGlvbiAqdHJhbnMsDQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqbmFtZSkNCj4+Pj4+
PiDCoCB7DQo+Pj4+Pj4gQEAgLTUwOSw2ICs1MTcsNyBAQCBpbnQgZG9fdHJhbnNhY3Rpb25f
ZW5kKGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4+Pj4+IGNvbm5lY3Rpb24gKmNvbm4s
DQo+Pj4+Pj4gwqDCoMKgwqDCoCBjb25zdCBjaGFyICphcmcgPSBvbmVhcmcoaW4pOw0KPj4+
Pj4+IMKgwqDCoMKgwqAgc3RydWN0IHRyYW5zYWN0aW9uICp0cmFuczsNCj4+Pj4+PiDCoMKg
wqDCoMKgIGJvb2wgaXNfY29ycnVwdCA9IGZhbHNlOw0KPj4+Pj4+ICvCoMKgwqAgYm9vbCBj
aGtfcXVvdGE7DQo+Pj4+Pj4gwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4+Pj4+IMKgwqDCoMKg
wqAgaWYgKCFhcmcgfHwgKCFzdHJlcShhcmcsICJUIikgJiYgIXN0cmVxKGFyZywgIkYiKSkp
DQo+Pj4+Pj4gQEAgLTUyMywxMyArNTMyLDE2IEBAIGludCBkb190cmFuc2FjdGlvbl9lbmQo
Y29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgDQo+Pj4+Pj4gY29ubmVjdGlvbiAqY29ubiwNCj4+
Pj4+PiDCoMKgwqDCoMKgIGlmICghY29ubi0+dHJhbnNhY3Rpb25fc3RhcnRlZCkNCj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgY29ubi0+dGFfc3RhcnRfdGltZSA9IDA7DQo+Pj4+Pj4g
K8KgwqDCoCBjaGtfcXVvdGEgPSB0cmFucy0+bm9kZV9jcmVhdGVkICYmIGRvbWFpbl9pc191
bnByaXZpbGVnZWQoY29ubik7DQo+Pj4+Pj4gKw0KPj4+Pj4+IMKgwqDCoMKgwqAgLyogQXR0
YWNoIHRyYW5zYWN0aW9uIHRvIGN0eCBmb3IgYXV0by1jbGVhbnVwICovDQo+Pj4+Pj4gwqDC
oMKgwqDCoCB0YWxsb2Nfc3RlYWwoY3R4LCB0cmFucyk7DQo+Pj4+Pj4gwqDCoMKgwqDCoCBp
ZiAoc3RyZXEoYXJnLCAiVCIpKSB7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0
cmFucy0+ZmFpbCkNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
RU5PTUVNOw0KPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXQgPSBhY2NfZml4X2RvbWFpbnMo
JnRyYW5zLT5jaGFuZ2VkX2RvbWFpbnMsIGZhbHNlKTsNCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgcmV0ID0gYWNjX2ZpeF9kb21haW5zKCZ0cmFucy0+Y2hhbmdlZF9kb21haW5zLCBjaGtf
cXVvdGEsDQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmYWxzZSk7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0ID0gZmluYWxpemVfdHJhbnNhY3Rpb24oY29ubiwgdHJhbnMs
ICZpc19jb3JydXB0KTsNCj4+Pj4+PiBAQCAtNTM5LDcgKzU1MSw3IEBAIGludCBkb190cmFu
c2FjdGlvbl9lbmQoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgDQo+Pj4+Pj4gY29ubmVjdGlv
biAqY29ubiwNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JsX2FwcGx5X2RlYml0X3Ry
YW5zX2NvbW1pdChjb25uKTsNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZml4IGRv
bWFpbiBlbnRyeSBmb3IgZWFjaCBjaGFuZ2VkIGRvbWFpbiAqLw0KPj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoCBhY2NfZml4X2RvbWFpbnMoJnRyYW5zLT5jaGFuZ2VkX2RvbWFpbnMsIHRydWUp
Ow0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBhY2NfZml4X2RvbWFpbnMoJnRyYW5zLT5jaGFu
Z2VkX2RvbWFpbnMsIGZhbHNlLCB0cnVlKTsNCj4+Pj4+DQo+Pj4+PiBJbiB0aGVvcnksIHNo
b3VsZG4ndCB3ZSBwYXNzICdjaGtfcXVvdGEnIHJhdGhlciB0aGFuIGZhbHNlPyBJbiBwcmFj
dGljZSwgSSANCj4+Pj4+IGtub3cgaXQgZG9lc24ndCBtYWtlIGFueSBkaWZmZXJlbmNlIGJl
dHdlZW4gdGhpcyBpcyBhbiB1cGRhdGUuDQo+Pj4+DQo+Pj4+IFdlIGV4cGxpY2l0bHkgZG9u
J3Qgd2FudCB0byBjaGVjayBxdW90YSBpbiB0aGUgInVwZGF0ZSIgY2FzZS4gU28gc3BlY2lm
eWluZw0KPj4+PiAiZmFsc2UiIGlzIHRoZSBjb3JyZWN0IHRoaW5nIHRvIGRvIElNSE8uDQo+
Pj4NCj4+PiBMZXQgbWUgcmVwaHJhc2UgbXkgY29tbWVudCBkaWZmZXJlbnRseS4gV2hhdCB3
b3VsZCBoYXBwZW4gaWYgdGhlIHVzZXIgcGFzcyANCj4+PiAndHJ1ZSc/IFdvdWxkIHdlIGNo
ZWNrIHRoZSBxdW90YSBvciBub3Q/DQo+Pj4NCj4+PiBJIHN1c3BlY3QgdGhpcyBpcyBhIG5v
LCBoZW5jZSB3aHkgSSB3YXMgc3VnZ2VzdGVkIHRoZSBjb21tZW50IHRvIHNheSB0aGUgDQo+
Pj4gZmllbGQgaXMgaWdub3JlZC4gQWx0ZXJuYXRpdmVseSwgd2UgY291bGQgYWRkIGFuIGFz
c2VydCB0aGF0IGVuc3VyZSB0aGF0IA0KPj4+IGNoa19xdW90YSBpcyBmYWxzZSB3aGVuIHVw
ZGF0ZSBpcyB0cnVlLg0KPj4NCj4+IE9rYXksIEknbGwgYWRkIHRoZSBjb21tZW50Lg0KPiAN
Cj4gVGhhbmtzISBObyBuZWVkIHRvIHNlbmQgYSBuZXcgdmVyc2lvbi4gSSB0ZXN0ZWQgdGhl
IGNvZGUgYW5kIGNvbmZpcm1lZCB0aGF0IGl0IA0KPiBzb2x2ZWQgdGhlIHByb2JsZW0gSSBy
ZXBvcnRlZC4gSSB3b3VsZCBiZSBoYXBweSB0byBhZGQgdGhlIGNvbW1lbnQgb24gY29tbWl0
IA0KPiBvbmNlIHdlIGFncmVlIG9uIGl0Lg0KDQpUaGFua3MsDQoNCkp1ZXJnZW4NCg0K
--------------7psn3iT2YUD5u0u3HIrQGoH2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------7psn3iT2YUD5u0u3HIrQGoH2--

--------------kWOOqliNnkmCNqdsV7qQYzhZ--

--------------NJ3F80dndY9D0ORPft79XUay
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQcYp4FAwAAAAAACgkQsN6d1ii/Ey9T
7gf/TvcOQ5TlZ6+F/Wb/1RpM5uTc0WAvAkJ/X6QLmcXrtu1F3V8ANrGzbYKZCj8jdXqJQFTrpVuu
Y/LaB8L1Sd1silkCvvzRyrLzQwxvyXuD2EcpIV78G0qyJgFRLaacJgT5ma/tZhQUzDjWQiLgx53o
FRh7P+jotleAg26jrqUK0NnY8yVg46DvUh0VtRrCDqR/+hZiyCMlhJAgs84t72wYW8cb95dit+FB
ayInmlvTXIq5AeGHxky7/h/1OTVI30QHT4V5dGudGnjJjmyKE9hcpOFlf/uDM847cWxL6LI3mVOf
TE67071qCIVLpo6LCqTb4bei57BA5pmrqfzzHYgJZw==
=JYBi
-----END PGP SIGNATURE-----

--------------NJ3F80dndY9D0ORPft79XUay--

