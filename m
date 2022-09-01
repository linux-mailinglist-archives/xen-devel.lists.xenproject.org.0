Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB95A9663
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 14:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396553.636729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTj0A-0000G1-73; Thu, 01 Sep 2022 12:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396553.636729; Thu, 01 Sep 2022 12:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTj0A-0000DN-4F; Thu, 01 Sep 2022 12:08:54 +0000
Received: by outflank-mailman (input) for mailman id 396553;
 Thu, 01 Sep 2022 12:08:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oTj08-0000DG-RJ
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 12:08:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7543564-29ee-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 14:08:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A5EDB20004;
 Thu,  1 Sep 2022 12:08:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74C4413A89;
 Thu,  1 Sep 2022 12:08:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eokKG9KgEGPNGQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 01 Sep 2022 12:08:50 +0000
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
X-Inumbo-ID: d7543564-29ee-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662034130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=prycf6zC67ozZ9bWudK9unqfbehibITR9GfuLn6I+2A=;
	b=d0K3a6YtIPts7YhNhf6ybBIM7UwzOJwSUfn2kXnOrF/wQqvktfcuoBdZzrElYVyy1noCSq
	c5yMhuKsr1q3EZGb0qKnusm0K79vD+KwtoREB3jueDrx9YkJ5D9TC6eL0kKHm8NKE/0wm3
	TcTKQMrkLOnoiPUoGoSRj/bgn1hBp14=
Message-ID: <7ca10578-6c35-1abf-c418-8abd16cd47b5@suse.com>
Date: Thu, 1 Sep 2022 14:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 3/3] xen/sched: fix cpu hotplug
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-4-jgross@suse.com>
 <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
 <94576d45-39c2-a786-2fe2-5effb16caf68@suse.com>
 <bb4114b7-0376-677b-5176-a4d4d1ef750d@citrix.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <bb4114b7-0376-677b-5176-a4d4d1ef750d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mFxDfl940PuNXjVwa6wL9dk9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mFxDfl940PuNXjVwa6wL9dk9
Content-Type: multipart/mixed; boundary="------------bYWa1wLlSWqaGLEKJEsjca8o";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Message-ID: <7ca10578-6c35-1abf-c418-8abd16cd47b5@suse.com>
Subject: Re: [PATCH v3 3/3] xen/sched: fix cpu hotplug
References: <20220816101317.23014-1-jgross@suse.com>
 <20220816101317.23014-4-jgross@suse.com>
 <096ed545-f268-ba45-6333-ed51d20fc99c@citrix.com>
 <94576d45-39c2-a786-2fe2-5effb16caf68@suse.com>
 <bb4114b7-0376-677b-5176-a4d4d1ef750d@citrix.com>
In-Reply-To: <bb4114b7-0376-677b-5176-a4d4d1ef750d@citrix.com>

--------------bYWa1wLlSWqaGLEKJEsjca8o
Content-Type: multipart/mixed; boundary="------------BYtSIJBeJNOyztIl4skt6uh0"

--------------BYtSIJBeJNOyztIl4skt6uh0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMDkuMjIgMTQ6MDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDAxLzA5LzIw
MjIgMDc6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBPbiAwMS4wOS4yMiAwMDo1Miwg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAxNi8wOC8yMDIyIDExOjEzLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOg0KPj4+PiBDcHUgY3B1IHVucGx1Z2dpbmcgaXMgY2FsbGluZyBzY2hl
ZHVsZV9jcHVfcm0oKSB2aWEgc3RvcF9tYWNoaW5lX3J1bigpDQo+Pj4NCj4+PiBDcHUgY3B1
Lg0KPj4+DQo+Pj4+IHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCwgdGh1cyBhbnkgbWVtb3J5
IGFsbG9jYXRpb24gb3IgZnJlZWluZyBtdXN0DQo+Pj4+IGJlIGF2b2lkZWQuDQo+Pj4+DQo+
Pj4+IFNpbmNlIGNvbW1pdCA1MDQ3Y2QxZDVkZWEgKCJ4ZW4vY29tbW9uOiBVc2UgZW5oYW5j
ZWQNCj4+Pj4gQVNTRVJUX0FMTE9DX0NPTlRFWFQgaW4geG1hbGxvYygpIikgdGhpcyByZXN0
cmljdGlvbiBpcyBiZWluZyBlbmZvcmNlZA0KPj4+PiB2aWEgYW4gYXNzZXJ0aW9uLCB3aGlj
aCB3aWxsIG5vdyBmYWlsLg0KPj4+Pg0KPj4+PiBCZWZvcmUgdGhhdCBjb21taXQgY3B1IHVu
cGx1Z2dpbmcgaW4gbm9ybWFsIGNvbmZpZ3VyYXRpb25zIHdhcyB3b3JraW5nDQo+Pj4+IGp1
c3QgYnkgY2hhbmNlIGFzIG9ubHkgdGhlIGNwdSBwZXJmb3JtaW5nIHNjaGVkdWxlX2NwdV9y
bSgpIHdhcyBkb2luZw0KPj4+PiBhY3RpdmUgd29yay4gV2l0aCBjb3JlIHNjaGVkdWxpbmcg
ZW5hYmxlZCwgaG93ZXZlciwgZmFpbHVyZXMgY291bGQNCj4+Pj4gcmVzdWx0IGZyb20gbWVt
b3J5IGFsbG9jYXRpb25zIG5vdCBiZWluZyBwcm9wZXJseSBwcm9wYWdhdGVkIHRvIG90aGVy
DQo+Pj4+IGNwdXMnIFRMQnMuDQo+Pj4NCj4+PiBUaGlzIGlzbid0IGFjY3VyYXRlLCBpcyBp
dD/CoCBUaGUgcHJvYmxlbSB3aXRoIGluaXRpYXRpbmcgYSBUTEIgZmx1c2gNCj4+PiB3aXRo
IElSUXMgZGlzYWJsZWQgaXMgdGhhdCB5b3UgY2FuIGRlYWRsb2NrIGFnYWluc3QgYSByZW1v
dGUgQ1BVIHdoaWNoDQo+Pj4gaXMgd2FpdGluZyBmb3IgeW91IHRvIGVuYWJsZSBJUlFzIGZp
cnN0IHRvIHRha2UgYSBUTEIgZmx1c2ggSVBJLg0KPj4NCj4+IEFzIGxvbmcgYXMgb25seSBv
bmUgY3B1IGlzIHRyeWluZyB0byBhbGxvY2F0ZS9mcmVlIG1lbW9yeSBkdXJpbmcgdGhlDQo+
PiBzdG9wX21hY2hpbmVfcnVuKCkgYWN0aW9uIHRoZSBkZWFkbG9jayB3b24ndCBoYXBwZW4u
DQo+Pg0KPj4+IEhvdyBkb2VzIGEgbWVtb3J5IGFsbG9jYXRpb24gb3V0IG9mIHRoZSB4ZW5o
ZWFwIHJlc3VsdCBpbiBhIFRMQiBmbHVzaD8NCj4+PiBFdmVuIHdpdGggc3BsaXQgaGVhcHMs
IHlvdSdyZSBvbmx5IHBvdGVudGlhbGx5IGFsbG9jYXRpbmcgaW50byBhIG5ldw0KPj4+IHNs
b3Qgd2hpY2ggd2FzIHVudXNlZC4uLg0KPj4NCj4+IFllYWgsIHlvdSBhcmUgcmlnaHQuIFRo
ZSBtYWluIHByb2JsZW0gd291bGQgb2NjdXIgb25seSB3aGVuIGEgdmlydHVhbA0KPj4gYWRk
cmVzcyBpcyBjaGFuZ2VkIHRvIHBvaW50IGF0IGFub3RoZXIgcGh5c2ljYWwgYWRkcmVzcywg
d2hpY2ggc2hvdWxkIGJlDQo+PiBxdWl0ZSB1bmxpa2VseS4NCj4+DQo+PiBJIGNhbiBkcm9w
IHRoYXQgcGFyYWdyYXBoLCBhcyBpdCBkb2Vzbid0IHJlYWxseSBoZWxwLg0KPiANCj4gWWVh
aCwgSSB0aGluayB0aGF0IHdvdWxkIGJlIGJlc3QuDQo+IA0KPj4+DQo+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyBiL3hlbi9jb21tb24vc2NoZWQvY3B1
cG9vbC5jDQo+Pj4+IGluZGV4IDU4ZTA4MmViNGMuLjI1MDY4NjFlNGYgMTAwNjQ0DQo+Pj4+
IC0tLSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQo+Pj4+ICsrKyBiL3hlbi9jb21t
b24vc2NoZWQvY3B1cG9vbC5jDQo+Pj4+IEBAIC00MTEsMjIgKzQxMSwyOCBAQCBpbnQgY3B1
cG9vbF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLA0KPj4+PiBzdHJ1Y3QgY3B1cG9v
bCAqYykNCj4+Pj4gIMKgIH0NCj4+Pj4gIMKgIMKgIC8qIFVwZGF0ZSBhZmZpbml0aWVzIG9m
IGFsbCBkb21haW5zIGluIGEgY3B1cG9vbC4gKi8NCj4+Pj4gLXN0YXRpYyB2b2lkIGNwdXBv
b2xfdXBkYXRlX25vZGVfYWZmaW5pdHkoY29uc3Qgc3RydWN0IGNwdXBvb2wgKmMpDQo+Pj4+
ICtzdGF0aWMgdm9pZCBjcHVwb29sX3VwZGF0ZV9ub2RlX2FmZmluaXR5KGNvbnN0IHN0cnVj
dCBjcHVwb29sICpjLA0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGFmZmluaXR5X21hc2tzICptYXNrcykNCj4+Pj4gIMKgIHsNCj4+Pj4gLcKgwqDCoCBzdHJ1
Y3QgYWZmaW5pdHlfbWFza3MgbWFza3M7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IGFmZmluaXR5
X21hc2tzIGxvY2FsX21hc2tzOw0KPj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgZG9tYWluICpk
Ow0KPj4+PiAgwqAgLcKgwqDCoCBpZiAoICF1cGRhdGVfbm9kZV9hZmZfYWxsb2MoJm1hc2tz
KSApDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pj4+ICvCoMKgwqAgaWYgKCAh
bWFza3MgKQ0KPj4+PiArwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggIXVw
ZGF0ZV9ub2RlX2FmZl9hbGxvYygmbG9jYWxfbWFza3MpICkNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgbWFza3MgPSAmbG9j
YWxfbWFza3M7DQo+Pj4+ICvCoMKgwqAgfQ0KPj4+PiAgwqAgwqDCoMKgwqDCoCByY3VfcmVh
ZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+Pj4+ICDCoCDCoMKgwqDCoMKgIGZvcl9l
YWNoX2RvbWFpbl9pbl9jcHVwb29sKGQsIGMpDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBkb21h
aW5fdXBkYXRlX25vZGVfYWZmKGQsICZtYXNrcyk7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBk
b21haW5fdXBkYXRlX25vZGVfYWZmKGQsIG1hc2tzKTsNCj4+Pj4gIMKgIMKgwqDCoMKgwqAg
cmN1X3JlYWRfdW5sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7DQo+Pj4+ICDCoCAtwqDCoMKg
IHVwZGF0ZV9ub2RlX2FmZl9mcmVlKCZtYXNrcyk7DQo+Pj4+ICvCoMKgwqAgaWYgKCBtYXNr
cyA9PSAmbG9jYWxfbWFza3MgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgdXBkYXRlX25vZGVf
YWZmX2ZyZWUobWFza3MpOw0KPj4+PiAgwqAgfQ0KPj4+PiAgwqAgwqAgLyoNCj4+Pg0KPj4+
IFdoeSBkbyB3ZSBuZWVkIHRoaXMgYXQgYWxsP8KgIGRvbWFpbl91cGRhdGVfbm9kZV9hZmYo
KSBhbHJlYWR5IGtub3dzIHdoYXQNCj4+PiB0byBkbyB3aGVuIHBhc3NlZCBOVUxMLCBzbyB0
aGlzIHNlZW1zIGxpa2UgYW4gYXdmdWxseSBjb21wbGljYXRlZCBuby1vcC4NCj4+DQo+PiBZ
b3UgZG8gcmVhbGl6ZSB0aGF0IHVwZGF0ZV9ub2RlX2FmZl9mcmVlKCkgd2lsbCBkbyBzb21l
dGhpbmcgaW4gY2FzZQ0KPj4gbWFza3MNCj4+IHdhcyBpbml0aWFsbHkgTlVMTD8NCj4gDQo+
IEJ5ICJ0aGlzIiwgSSBtZWFudCB0aGUgZW50aXJlIGh1bmssIG5vdCBqdXN0IHRoZSBmaW5h
bCBpZigpLg0KPiANCj4gV2hhdCBpcyB3cm9uZyB3aXRoIHBhc3NpbmcgdGhlIChwb3NzaWJs
eSBOVUxMKSBtYXNrcyBwb2ludGVyIHN0cmFpZ2h0DQo+IGRvd24gaW50byBkb21haW5fdXBk
YXRlX25vZGVfYWZmKCkgYW5kIHJlbW92aW5nIGFsbCB0aGUgbWVtb3J5DQo+IGFsbG9jYXRp
b24gaW4gdGhpcyBmdW5jdGlvbj8NCj4gDQo+IEJ1dCBJJ3ZlIGFsc28gYW5zd2VyZWQgdGhh
dCBieSBsb29raW5nIG1vcmUgY2xlYXJseS7CoCBJdCdzIGFib3V0IG5vdA0KPiByZXBlYXRp
bmcgdGhlIG1lbW9yeSBhbGxvY2F0aW9ucy9mcmVlaW5nIGZvciBlYWNoIGRvbWFpbiBpbiB0
aGUgcG9vbC4NCg0KQ29ycmVjdC4NCg0KPiBXaGljaCBkb2VzIG1ha2Ugc2Vuc2UgYXMgdGhp
cyBpcyBhIHNsb3cgcGF0aCBhbHJlYWR5LCBidXQgdGhlIGNvbXBsZXhpdHkNCj4gaGVyZSBv
ZiBoYXZpbmcgY29uZGl0aW9uYWxseSBhbGxvY2F0ZWQgbWFza3MgaXMgZmFyIGZyb20gc2lt
cGxlLg0KPiANCj4+DQo+Pj4NCj4+Pj4gQEAgLTEwMDgsMTAgKzEwMTYsMjEgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBjcHVfY2FsbGJhY2soDQo+Pj4+ICDCoCB7DQo+Pj4+ICDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQgbG9uZyloY3B1Ow0KPj4+PiAgwqDC
oMKgwqDCoCBpbnQgcmMgPSAwOw0KPj4+PiArwqDCoMKgIHN0YXRpYyBzdHJ1Y3QgY3B1X3Jt
X2RhdGEgKm1lbTsNCj4+Pj4gIMKgIMKgwqDCoMKgwqAgc3dpdGNoICggYWN0aW9uICkNCj4+
Pj4gIMKgwqDCoMKgwqAgew0KPj4+PiAgwqDCoMKgwqDCoCBjYXNlIENQVV9ET1dOX0ZBSUxF
RDoNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggc3lzdGVtX3N0YXRlIDw9IFNZU19TVEFU
RV9hY3RpdmUgKQ0KPj4+PiArwqDCoMKgwqDCoMKgwqAgew0KPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoIG1lbSApDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsN
Cj4+Pg0KPj4+IFNvLCB0aGlzIGRvZXMgY29tcGlsZSAoYW5kIGluZGVlZCBJJ3ZlIHRlc3Rl
ZCB0aGUgcmVzdWx0KSwgYnV0IEkgY2FuJ3QNCj4+PiBzZWUgaG93IGl0IHNob3VsZC4NCj4+
Pg0KPj4+IG1lbSBpcyBndWFyYW50ZWVkIHRvIGJlIHVuaW5pdGlhbGlzZWQgYXQgdGhpcyBw
b2ludCwgYW5kIC4uLg0KPj4NCj4+IC4uLiBpdCBpcyBkZWZpbmVkIGFzICJzdGF0aWMiLCBz
byBpdCBpcyBjbGVhcmx5IE5VTEwgaW5pdGlhbGx5Lg0KPiANCj4gT2gsIHNvIGl0IGlzLsKg
IFRoYXQgaXMgaGlkaW5nIHBhcnRpY3VsYXJseSB3ZWxsIGluIHBsYWluIHNpZ2h0Lg0KPiAN
Cj4gQ2FuIGl0IHBsZWFzZSBiZSB0aGlzOg0KPiANCj4gQEAgLTEwMTQsOSArMTAxNCwxMCBA
QCB2b2lkIGNmX2NoZWNrIGR1bXBfcnVucSh1bnNpZ25lZCBjaGFyIGtleSkNCj4gIMKgc3Rh
dGljIGludCBjZl9jaGVjayBjcHVfY2FsbGJhY2soDQo+ICDCoMKgwqDCoCBzdHJ1Y3Qgbm90
aWZpZXJfYmxvY2sgKm5mYiwgdW5zaWduZWQgbG9uZyBhY3Rpb24sIHZvaWQgKmhjcHUpDQo+
ICDCoHsNCj4gK8KgwqDCoCBzdGF0aWMgc3RydWN0IGNwdV9ybV9kYXRhICptZW07IC8qIFBy
b3RlY3RlZCBieSBjcHVfYWRkX3JlbW92ZV9sb2NrICovDQo+ICsNCj4gIMKgwqDCoMKgIHVu
c2lnbmVkIGludCBjcHUgPSAodW5zaWduZWQgbG9uZyloY3B1Ow0KPiAgwqDCoMKgwqAgaW50
IHJjID0gMDsNCj4gLcKgwqDCoCBzdGF0aWMgc3RydWN0IGNwdV9ybV9kYXRhICptZW07DQo+
ICAgDQo+ICDCoMKgwqDCoCBzd2l0Y2ggKCBhY3Rpb24gKQ0KPiAgwqDCoMKgwqAgew0KPiAN
Cj4gV2UgYWxyZWFkeSBzcGxpdCBzdGF0aWMgYW5kIG5vbi1zdGF0aWMgdmFyaWFibGUgbGlr
ZSB0aGlzIGVsc2V3aGVyZSBmb3INCj4gY2xhcml0eSwgYW5kIGlkZW50aWZ5aW5nIHRoZSBs
b2NrIHdoaWNoIHByb3RlY3RzIHRoZSBkYXRhIGlzIHVzZWZ1bCBmb3INCj4gYW55b25lIGNv
bWluZyB0byB0aGlzIGluIHRoZSBmdXR1cmUuDQoNCkZpbmUgd2l0aCBtZS4NCg0KPiANCj4g
fkFuZHJldw0KPiANCj4gUC5TLiBhcyBhbiBvYnNlcnZhdGlvbiwgdGhpcyBpc24ndCBzYWZl
IGZvciBwYXJhbGxlbCBBUCBib290aW5nLCBidXQgSQ0KPiBndWFyYW50ZWUgdGhhdCB0aGlz
IGlzbid0IHRoZSBvbmx5IGV4YW1wbGUgd2hpY2ggd291bGQgd2FudCBmaXhpbmcgaWYgd2UN
Cj4gd2FudGVkIHRvIGdldCBwYXJhbGxlbCBib290aW5nIHdvcmtpbmcuDQoNCllvdSBhcmUg
YXdhcmUgdGhhdCBtZW0gaXMgdXNlZCBvbmx5IHdoZW4gcmVtb3ZpbmcgY3B1cz8NCg0KDQpK
dWVyZ2VuDQo=
--------------BYtSIJBeJNOyztIl4skt6uh0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BYtSIJBeJNOyztIl4skt6uh0--

--------------bYWa1wLlSWqaGLEKJEsjca8o--

--------------mFxDfl940PuNXjVwa6wL9dk9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMQoNIFAwAAAAAACgkQsN6d1ii/Ey+I
mQf+O9DE/Epfkz23JZn1cKFYQWbCw2xDv5WjUB1WXlDv1Uk8LAqQhjqezr0t5Xl5M1+DAliossXk
kb2KnUQRyizOfwrwXgunKL4EcBkrgri1BYyLSDiT+5lkraWpqSXhIr7i+WVVt/PGXTSD38kbPN0s
rE7R1XFbMW+zmu/0wTZz0dJIukPwPquo9J8pmmGDM5lfdXIoO8N1hBMchPN/09wlpDJujR71lY51
vEFN2TOae3F16RlvXLD8azMT9HPLEAY6jUqjJWDsvr9XZv61cw+LQkwv+R5Re/lyi/JRxyToG6+r
ytMW7LmPiTD9ZtPgUM9Vap9Fp/q2bfAYbLwmFHByww==
=mwel
-----END PGP SIGNATURE-----

--------------mFxDfl940PuNXjVwa6wL9dk9--

