Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD56C6AC7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513906.795635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLoq-0006ww-LS; Thu, 23 Mar 2023 14:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513906.795635; Thu, 23 Mar 2023 14:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLoq-0006tZ-IU; Thu, 23 Mar 2023 14:21:32 +0000
Received: by outflank-mailman (input) for mailman id 513906;
 Thu, 23 Mar 2023 14:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pfLop-0006tT-3E
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:21:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00b8a54f-c986-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 15:21:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 862B91FDD4;
 Thu, 23 Mar 2023 14:21:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F011132C2;
 Thu, 23 Mar 2023 14:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d6OSFWlgHGTNeQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Mar 2023 14:21:29 +0000
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
X-Inumbo-ID: 00b8a54f-c986-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679581289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rudslpItH9Sn6IMtkQM0X57UGiM/Er9EJIb5g+fP5kc=;
	b=sk0wON325eRlxGAbRV9/Wbird6bxlpYj1/oUWbxuVLLI92XbuWDdwex0/bsNn9P2GiAfMd
	pgh9WweY3uUeb0vr5U3maHM4jZljiKF6ecWD7mqowNmatra/NOVmczZG9oXApTKNEskd/h
	NLVmTgKnhHhCNbi9u6M+4Ik8khtTtPw=
Message-ID: <92b2f26a-fd2e-2826-d38f-3ca45727bfb3@suse.com>
Date: Thu, 23 Mar 2023 15:21:28 +0100
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
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b95864bf-014f-7b1d-3c07-295705cdba0d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RMYCgBSkyAKaZoI50COe10sP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RMYCgBSkyAKaZoI50COe10sP
Content-Type: multipart/mixed; boundary="------------hOfACO0tQhNOBfaABgW0WZFf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <92b2f26a-fd2e-2826-d38f-3ca45727bfb3@suse.com>
Subject: Re: [PATCH] tools/xenstore: fix quota check in acc_fix_domains()
References: <20230224155848.31036-1-jgross@suse.com>
 <a8e71268-6111-d4d5-5cba-ed141dba530d@xen.org>
 <363e4526-6bc2-d961-88ac-93ba82e2e30c@suse.com>
 <b95864bf-014f-7b1d-3c07-295705cdba0d@xen.org>
In-Reply-To: <b95864bf-014f-7b1d-3c07-295705cdba0d@xen.org>

--------------hOfACO0tQhNOBfaABgW0WZFf
Content-Type: multipart/mixed; boundary="------------6ry5m0FHzhMaBuav0HLNCsbM"

--------------6ry5m0FHzhMaBuav0HLNCsbM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjMgMTU6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyMy8wMy8yMDIzIDEyOjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjMuMDMu
MjMgMTM6MzgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMjQvMDIvMjAyMyAxNTo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gVG9k
YXkgd2hlbiBmaW5hbGl6aW5nIGEgdHJhbnNhY3Rpb24gdGhlIG51bWJlciBvZiBub2RlIHF1
b3RhIGlzIGNoZWNrZWQNCj4+Pj4gdG8gbm90IGJlaW5nIGV4Y2VlZGVkIGFmdGVyIHRoZSB0
cmFuc2FjdGlvbi4gVGhpcyBjaGVjayBpcyBhbHdheXMgZG9uZSwNCj4+Pj4gZXZlbiBpZiB0
aGUgdHJhbnNhY3Rpb24gaXMgYmVpbmcgcGVyZm9ybWVkIGJ5IGEgcHJpdmlsZWdlZCBjb25u
ZWN0aW9uLA0KPj4+PiBvciBpZiB0aGVyZSB3ZXJlIG5vIG5vZGVzIGNyZWF0ZWQgaW4gdGhl
IHRyYW5zYWN0aW9uLg0KPj4+Pg0KPj4+PiBDb3JyZWN0IHRoYXQgYnkgY2hlY2tpbmcgcXVv
dGEgb25seSBpZjoNCj4+Pj4gLSB0aGUgdHJhbnNhY3Rpb24gaXMgYmVpbmcgcGVyZm9ybWVk
IGJ5IGFuIHVucHJpdmlsZWdlZCBndWVzdCwgYW5kDQo+Pj4+IC0gYXQgbGVhc3Qgb25lIG5v
ZGUgd2FzIGNyZWF0ZWQgaW4gdGhlIHRyYW5zYWN0aW9uDQo+Pj4+DQo+Pj4+IFJlcG9ydGVk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPj4+PiBGaXhlczogZjJiZWJm
NzJjNGQ1ICgieGVuc3RvcmU6IHJld29yayBvZiB0cmFuc2FjdGlvbiBoYW5kbGluZyIpDQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
Pj4gLS0tDQo+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmPCoMKgwqDC
oMKgwqDCoCB8wqAgMyArKysNCj4+Pj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2Rv
bWFpbi5jwqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hl
bnN0b3JlZF9kb21haW4uaMKgwqDCoMKgwqAgfMKgIDIgKy0NCj4+Pj4gwqAgdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX3RyYW5zYWN0aW9uLmMgfCAxNiArKysrKysrKysrKysrKy0tDQo+
Pj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF90cmFuc2FjdGlvbi5oIHzCoCAzICsr
Kw0KPj4+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29yZS5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4+PiBpbmRl
eCBhNjFkYjJkYjJkLi4zY2E2ODY4MWUzIDEwMDY0NA0KPj4+PiAtLS0gYS90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9jb3JlLmMNCj4+Pj4gQEAgLTE0NzIsNiArMTQ3Miw5IEBAIHN0YXRpYyBzdHJ1Y3Qg
bm9kZSAqY3JlYXRlX25vZGUoc3RydWN0IGNvbm5lY3Rpb24gDQo+Pj4+ICpjb25uLCBjb25z
dCB2b2lkICpjdHgsDQo+Pj4+IMKgwqDCoMKgwqAgaWYgKCFub2RlKQ0KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+Pj4+ICvCoMKgwqAgaWYgKGNvbm4gJiYgY29u
bi0+dHJhbnNhY3Rpb24pDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB0YV9ub2RlX2NyZWF0ZWQo
Y29ubi0+dHJhbnNhY3Rpb24pOw0KPj4+PiArDQo+Pj4+IMKgwqDCoMKgwqAgbm9kZS0+ZGF0
YSA9IGRhdGE7DQo+Pj4+IMKgwqDCoMKgwqAgbm9kZS0+ZGF0YWxlbiA9IGRhdGFsZW47DQo+
Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMgDQo+
Pj4+IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jDQo+Pj4+IGluZGV4IGQ3
ZmMyZmFmYzcuLmY2MmJlMjI0NWMgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9kb21haW4uYw0KPj4+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfZG9tYWluLmMNCj4+Pj4gQEAgLTU0NCw3ICs1NDQsNyBAQCBzdGF0aWMgc3RydWN0IGRv
bWFpbiAqZmluZF9kb21haW5fYnlfZG9taWQodW5zaWduZWQgaW50IA0KPj4+PiBkb21pZCkN
Cj4+Pj4gwqDCoMKgwqDCoCByZXR1cm4gKGQgJiYgZC0+aW50cm9kdWNlZCkgPyBkIDogTlVM
TDsNCj4+Pj4gwqAgfQ0KPj4+PiAtaW50IGFjY19maXhfZG9tYWlucyhzdHJ1Y3QgbGlzdF9o
ZWFkICpoZWFkLCBib29sIHVwZGF0ZSkNCj4+Pj4gK2ludCBhY2NfZml4X2RvbWFpbnMoc3Ry
dWN0IGxpc3RfaGVhZCAqaGVhZCwgYm9vbCBjaGtfcXVvdGEsIGJvb2wgdXBkYXRlKQ0KPj4+
PiDCoCB7DQo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGNoYW5nZWRfZG9tYWluICpjZDsNCj4+
Pj4gwqDCoMKgwqDCoCBpbnQgY250Ow0KPj4+PiBAQCAtNTUyLDcgKzU1Miw3IEBAIGludCBh
Y2NfZml4X2RvbWFpbnMoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCwgYm9vbCB1cGRhdGUpDQo+
Pj4+IMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFjaF9lbnRyeShjZCwgaGVhZCwgbGlzdCkgew0K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgY250ID0gZG9tYWluX25iZW50cnlfZml4KGNkLT5k
b21pZCwgY2QtPm5iZW50cnksIHVwZGF0ZSk7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIXVwZGF0ZSkgew0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoY250ID49
IHF1b3RhX25iX2VudHJ5X3Blcl9kb21haW4pDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChjaGtfcXVvdGEgJiYgY250ID49IHF1b3RhX25iX2VudHJ5X3Blcl9kb21haW4p
DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVOT1NQ
QzsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNudCA8IDApDQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVOT01FTTsNCj4+
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaCANCj4+
Pj4gYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmgNCj4+Pj4gaW5kZXggZGM0
NjYwODYxZS4uZWM2YWEwMGNjNyAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX2RvbWFpbi5oDQo+Pj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9kb21haW4uaA0KPj4+PiBAQCAtOTYsNyArOTYsNyBAQCB2b2lkIGRvbWFpbl9vdXRzdGFu
ZGluZ19kZWMoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4pOw0KPj4+PiDCoCB2b2lkIGRvbWFp
bl9vdXRzdGFuZGluZ19kb21pZF9kZWModW5zaWduZWQgaW50IGRvbWlkKTsNCj4+Pj4gwqAg
aW50IGRvbWFpbl9nZXRfcXVvdGEoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlv
biAqY29ubiwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgZG9taWQpOw0KPj4+PiAtaW50IGFjY19maXhfZG9tYWlucyhzdHJ1Y3QgbGlzdF9oZWFk
ICpoZWFkLCBib29sIHVwZGF0ZSk7DQo+Pj4+ICtpbnQgYWNjX2ZpeF9kb21haW5zKHN0cnVj
dCBsaXN0X2hlYWQgKmhlYWQsIGJvb2wgY2hrX3F1b3RhLCBib29sIHVwZGF0ZSk7DQo+Pj4N
Cj4+PiBEZXBlbmRpbmcgb24gdGhlIGFuc3dlciBiZWxvdywgSSB3b3VsZCBzdWdnZXN0IHRv
IHdyaXRlIHRoYXQgJ2Noa19xdW90YScgaXMgDQo+Pj4gaWdub3JlZCB3aGVuIGBgdXBkYXRl
YGAgaXMgdHJ1ZS4NCj4+DQo+PiBXaXRoIHRoZSBhbnN3ZXIgYmVsb3csIGRvIHlvdSBhZ3Jl
ZSB0aGF0IG5vIGFkZGl0aW9uYWwgY29tbWVudCBpcyBuZWVkZWQ/DQo+PiBJJ20gZmluZSBl
aXRoZXIgd2F5Lg0KPj4NCj4+Pg0KPj4+PiDCoCAvKiBXcml0ZSByYXRlIGxpbWl0aW5nICov
DQo+Pj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rp
b24uYyANCj4+Pj4gYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rpb24uYw0K
Pj4+PiBpbmRleCAxYWE5ZDNjYjNkLi4yYjE1NTA2OTUzIDEwMDY0NA0KPj4+PiAtLS0gYS90
b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rpb24uYw0KPj4+PiArKysgYi90b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfdHJhbnNhY3Rpb24uYw0KPj4+PiBAQCAtMTYwLDEyICsx
NjAsMjAgQEAgc3RydWN0IHRyYW5zYWN0aW9uDQo+Pj4+IMKgwqDCoMKgwqAgLyogTGlzdCBv
ZiBjaGFuZ2VkIGRvbWFpbnMgLSB0byByZWNvcmQgdGhlIGNoYW5nZWQgZG9tYWluIGVudHJ5
IG51bWJlciAqLw0KPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgY2hhbmdlZF9k
b21haW5zOw0KPj4+PiArwqDCoMKgIC8qIFRoZXJlIHdhcyBhdCBsZWFzdCBvbmUgbm9kZSBj
cmVhdGVkIGluIHRoZSB0cmFuc2FjdGlvbi4gKi8NCj4+Pj4gK8KgwqDCoCBib29sIG5vZGVf
Y3JlYXRlZDsNCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKgIC8qIEZsYWcgZm9yIGxldHRpbmcg
dHJhbnNhY3Rpb24gZmFpbC4gKi8NCj4+Pj4gwqDCoMKgwqDCoCBib29sIGZhaWw7DQo+Pj4+
IMKgIH07DQo+Pj4+IMKgIHVpbnQ2NF90IGdlbmVyYXRpb247DQo+Pj4+ICt2b2lkIHRhX25v
ZGVfY3JlYXRlZChzdHJ1Y3QgdHJhbnNhY3Rpb24gKnRyYW5zKQ0KPj4+PiArew0KPj4+PiAr
wqDCoMKgIHRyYW5zLT5ub2RlX2NyZWF0ZWQgPSB0cnVlOw0KPj4+PiArfQ0KPj4+PiArDQo+
Pj4+IMKgIHN0YXRpYyBzdHJ1Y3QgYWNjZXNzZWRfbm9kZSAqZmluZF9hY2Nlc3NlZF9ub2Rl
KHN0cnVjdCB0cmFuc2FjdGlvbiAqdHJhbnMsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWUpDQo+Pj4+
IMKgIHsNCj4+Pj4gQEAgLTUwOSw2ICs1MTcsNyBAQCBpbnQgZG9fdHJhbnNhY3Rpb25fZW5k
KGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4+PiBjb25uZWN0aW9uICpjb25uLA0KPj4+
PiDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKmFyZyA9IG9uZWFyZyhpbik7DQo+Pj4+IMKgwqDC
oMKgwqAgc3RydWN0IHRyYW5zYWN0aW9uICp0cmFuczsNCj4+Pj4gwqDCoMKgwqDCoCBib29s
IGlzX2NvcnJ1cHQgPSBmYWxzZTsNCj4+Pj4gK8KgwqDCoCBib29sIGNoa19xdW90YTsNCj4+
Pj4gwqDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4+PiDCoMKgwqDCoMKgIGlmICghYXJnIHx8ICgh
c3RyZXEoYXJnLCAiVCIpICYmICFzdHJlcShhcmcsICJGIikpKQ0KPj4+PiBAQCAtNTIzLDEz
ICs1MzIsMTYgQEAgaW50IGRvX3RyYW5zYWN0aW9uX2VuZChjb25zdCB2b2lkICpjdHgsIHN0
cnVjdCANCj4+Pj4gY29ubmVjdGlvbiAqY29ubiwNCj4+Pj4gwqDCoMKgwqDCoCBpZiAoIWNv
bm4tPnRyYW5zYWN0aW9uX3N0YXJ0ZWQpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb25u
LT50YV9zdGFydF90aW1lID0gMDsNCj4+Pj4gK8KgwqDCoCBjaGtfcXVvdGEgPSB0cmFucy0+
bm9kZV9jcmVhdGVkICYmIGRvbWFpbl9pc191bnByaXZpbGVnZWQoY29ubik7DQo+Pj4+ICsN
Cj4+Pj4gwqDCoMKgwqDCoCAvKiBBdHRhY2ggdHJhbnNhY3Rpb24gdG8gY3R4IGZvciBhdXRv
LWNsZWFudXAgKi8NCj4+Pj4gwqDCoMKgwqDCoCB0YWxsb2Nfc3RlYWwoY3R4LCB0cmFucyk7
DQo+Pj4+IMKgwqDCoMKgwqAgaWYgKHN0cmVxKGFyZywgIlQiKSkgew0KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHRyYW5zLT5mYWlsKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gRU5PTUVNOw0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0ID0gYWNj
X2ZpeF9kb21haW5zKCZ0cmFucy0+Y2hhbmdlZF9kb21haW5zLCBmYWxzZSk7DQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXQgPSBhY2NfZml4X2RvbWFpbnMoJnRyYW5zLT5jaGFuZ2VkX2Rv
bWFpbnMsIGNoa19xdW90YSwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmYWxzZSk7DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0
KQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZmluYWxpemVfdHJhbnNhY3Rpb24oY29ubiwgdHJh
bnMsICZpc19jb3JydXB0KTsNCj4+Pj4gQEAgLTUzOSw3ICs1NTEsNyBAQCBpbnQgZG9fdHJh
bnNhY3Rpb25fZW5kKGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4+PiBjb25uZWN0aW9u
ICpjb25uLA0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgd3JsX2FwcGx5X2RlYml0X3RyYW5z
X2NvbW1pdChjb25uKTsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGZpeCBkb21haW4g
ZW50cnkgZm9yIGVhY2ggY2hhbmdlZCBkb21haW4gKi8NCj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGFjY19maXhfZG9tYWlucygmdHJhbnMtPmNoYW5nZWRfZG9tYWlucywgdHJ1ZSk7DQo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBhY2NfZml4X2RvbWFpbnMoJnRyYW5zLT5jaGFuZ2VkX2RvbWFp
bnMsIGZhbHNlLCB0cnVlKTsNCj4+Pg0KPj4+IEluIHRoZW9yeSwgc2hvdWxkbid0IHdlIHBh
c3MgJ2Noa19xdW90YScgcmF0aGVyIHRoYW4gZmFsc2U/IEluIHByYWN0aWNlLCBJIA0KPj4+
IGtub3cgaXQgZG9lc24ndCBtYWtlIGFueSBkaWZmZXJlbmNlIGJldHdlZW4gdGhpcyBpcyBh
biB1cGRhdGUuDQo+Pg0KPj4gV2UgZXhwbGljaXRseSBkb24ndCB3YW50IHRvIGNoZWNrIHF1
b3RhIGluIHRoZSAidXBkYXRlIiBjYXNlLiBTbyBzcGVjaWZ5aW5nDQo+PiAiZmFsc2UiIGlz
IHRoZSBjb3JyZWN0IHRoaW5nIHRvIGRvIElNSE8uDQo+IA0KPiBMZXQgbWUgcmVwaHJhc2Ug
bXkgY29tbWVudCBkaWZmZXJlbnRseS4gV2hhdCB3b3VsZCBoYXBwZW4gaWYgdGhlIHVzZXIg
cGFzcyANCj4gJ3RydWUnPyBXb3VsZCB3ZSBjaGVjayB0aGUgcXVvdGEgb3Igbm90Pw0KPiAN
Cj4gSSBzdXNwZWN0IHRoaXMgaXMgYSBubywgaGVuY2Ugd2h5IEkgd2FzIHN1Z2dlc3RlZCB0
aGUgY29tbWVudCB0byBzYXkgdGhlIGZpZWxkIA0KPiBpcyBpZ25vcmVkLiBBbHRlcm5hdGl2
ZWx5LCB3ZSBjb3VsZCBhZGQgYW4gYXNzZXJ0IHRoYXQgZW5zdXJlIHRoYXQgY2hrX3F1b3Rh
IGlzIA0KPiBmYWxzZSB3aGVuIHVwZGF0ZSBpcyB0cnVlLg0KDQpPa2F5LCBJJ2xsIGFkZCB0
aGUgY29tbWVudC4NCg0KDQpKdWVyZ2VuDQo=
--------------6ry5m0FHzhMaBuav0HLNCsbM
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

--------------6ry5m0FHzhMaBuav0HLNCsbM--

--------------hOfACO0tQhNOBfaABgW0WZFf--

--------------RMYCgBSkyAKaZoI50COe10sP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQcYGgFAwAAAAAACgkQsN6d1ii/Ey9/
ZAgAkc4DQx6qW8cS/uYLhLZcDkWzCsgu+T5y+qLaSkEdEOL9o/Ct3oSaaa9P0zr0xWOwx8AdGR+J
Pcba1vf/44qbjPmq7F5uBx3QdgNMn5AEJ2eH0RmpJEQeXsbSo7PjjOFYIBdRyyfDQ2913rOVKdzx
ULLf7Q6frfWACGClTQEBM+AenpfCZhFW73MWVLG6gSzQrrnS0FH40pE6foQ9rdo+TXTPWt9t/0ks
Zb+leg1iwsdBJ5qwxtLtdqJSBf/sweS5rohpKzTLifiYTHGRv19ja0SqsVtipVsqm988F7ckHFf6
Dx6mKZb8Ix91R4qyTRH8P+BJAoY/di408i5EuLR9lA==
=CgFg
-----END PGP SIGNATURE-----

--------------RMYCgBSkyAKaZoI50COe10sP--

