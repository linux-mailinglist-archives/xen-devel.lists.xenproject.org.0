Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1835A8E44
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 08:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396224.636292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTdhH-0004uV-DP; Thu, 01 Sep 2022 06:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396224.636292; Thu, 01 Sep 2022 06:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTdhH-0004rd-A4; Thu, 01 Sep 2022 06:29:03 +0000
Received: by outflank-mailman (input) for mailman id 396224;
 Thu, 01 Sep 2022 06:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oTdhF-0004rS-7J
 for xen-devel@lists.xen.org; Thu, 01 Sep 2022 06:29:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bbf93fc-29bf-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 08:28:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7F551FAA9;
 Thu,  1 Sep 2022 06:28:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65B9F13316;
 Thu,  1 Sep 2022 06:28:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X71PFypREGMJHgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 01 Sep 2022 06:28:58 +0000
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
X-Inumbo-ID: 5bbf93fc-29bf-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662013738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OlY9nmK3diDQwat6lv3sfUDYuceybSJWubnvy/ap0OM=;
	b=KyMWIyJuSJcVBd4DBC/89MwCEUCJq04rNGyDEIg/Gsv2UmekFS/41I/ou7mUjFt8iUlUXq
	csWNlPb+zME6OVXdFDRolze+qrfPmPi8RKNMzDOCaX79M0C1pPUvEhjv+uLQpJsIshP7Ix
	rNE8Df6hRTg72mPg/3Ygu1i2ubuzbww=
Message-ID: <69ef73a8-ecfd-4163-19a6-bc74e2e15711@suse.com>
Date: Thu, 1 Sep 2022 08:28:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Stratos-dev@op-lists.linaro.org" <Stratos-dev@op-lists.linaro.org>,
 "mathieu.poirier@linaro.com" <mathieu.poirier@linaro.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com> <877d2xj23o.fsf@linaro.org>
 <edc33ca4-135e-111a-e198-38b9bae53005@suse.com> <87y1vdh9or.fsf@linaro.org>
 <9697a559-fe42-3efb-5715-1f6bc631f57d@suse.com> <875yi8pfhc.fsf@linaro.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <875yi8pfhc.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7ii8U7UcB0T0rKiGWIa0mw0W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7ii8U7UcB0T0rKiGWIa0mw0W
Content-Type: multipart/mixed; boundary="------------clnhdyorXixPgreZBK3F8k99";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Stratos-dev@op-lists.linaro.org" <Stratos-dev@op-lists.linaro.org>,
 "mathieu.poirier@linaro.com" <mathieu.poirier@linaro.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>
Message-ID: <69ef73a8-ecfd-4163-19a6-bc74e2e15711@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com> <877d2xj23o.fsf@linaro.org>
 <edc33ca4-135e-111a-e198-38b9bae53005@suse.com> <87y1vdh9or.fsf@linaro.org>
 <9697a559-fe42-3efb-5715-1f6bc631f57d@suse.com> <875yi8pfhc.fsf@linaro.org>
In-Reply-To: <875yi8pfhc.fsf@linaro.org>

--------------clnhdyorXixPgreZBK3F8k99
Content-Type: multipart/mixed; boundary="------------kLVUhaep4LdBLZwdlKRDD324"

--------------kLVUhaep4LdBLZwdlKRDD324
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDguMjIgMTg6MDIsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gDQo+IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JpdGVzOg0KPiANCj4+IFtbUEdQIFNpZ25lZCBQ
YXJ0OlVuZGVjaWRlZF1dDQo+PiBPbiAyNC4wOC4yMiAxNzo1OCwgQWxleCBCZW5uw6llIHdy
b3RlOg0KPj4+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JpdGVzOg0KPj4+
DQo+Pj4+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVjaWRlZF1dDQo+Pj4+IE9uIDI0LjA4LjIy
IDEzOjIyLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4+PiBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPiB3cml0ZXM6DQo+Pj4+Pg0KPj4+Pj4+IE9uIDI0LzA4
LzIwMjIgMTA6MTksIFZpcmVzaCBLdW1hciB3cm90ZToNCj4+Pj4+Pj4gT24gMjQtMDMtMjIs
IDA2OjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+Pj4gRm9yIGEgcmF0aGVyIGxv
bmcgdGltZSB3ZSB3ZXJlIHVzaW5nICJub3JtYWwiIHVzZXIgcGFnZXMgZm9yIHRoaXMgcHVy
cG9zZSwNCj4+Pj4+Pj4+IHdoaWNoIHdlcmUganVzdCBsb2NrZWQgaW50byBtZW1vcnkgZm9y
IGRvaW5nIHRoZSBoeXBlcmNhbGwuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gVW5mb3J0dW5hdGVs
eSB0aGVyZSBoYXZlIGJlZW4gdmVyeSByYXJlIHByb2JsZW1zIHdpdGggdGhhdCBhcHByb2Fj
aCwgYXMNCj4+Pj4+Pj4+IHRoZSBMaW51eCBrZXJuZWwgY2FuIHNldCBhIHVzZXIgcGFnZSBy
ZWxhdGVkIFBURSB0byBpbnZhbGlkIGZvciBzaG9ydA0KPj4+Pj4+Pj4gcGVyaW9kcyBvZiB0
aW1lLCB3aGljaCBsZWQgdG8gRUZBVUxUIGluIHRoZSBoeXBlcnZpc29yIHdoZW4gdHJ5aW5n
IHRvDQo+Pj4+Pj4+PiBhY2Nlc3MgdGhlIGh5cGVyY2FsbCBkYXRhLg0KPj4+Pj4+Pj4NCj4+
Pj4+Pj4+IEluIExpbnV4IHRoaXMgY2FuIGF2b2lkZWQgb25seSBieSB1c2luZyBrZXJuZWwg
bWVtb3J5LCB3aGljaCBpcyB0aGUNCj4+Pj4+Pj4+IHJlYXNvbiB3aHkgdGhlIGh5cGVyY2Fs
bCBidWZmZXJzIGFyZSBhbGxvY2F0ZWQgYW5kIG1tYXAoKS1lZCB0aHJvdWdoIHRoZQ0KPj4+
Pj4+Pj4gcHJpdmNtZCBkcml2ZXIuDQo+Pj4+Pj4+IEhpIEp1ZXJnZW4sDQo+Pj4+Pj4+DQo+
Pj4+Pj4+IEkgdW5kZXJzdGFuZCB3aHkgd2UgbW92ZWQgZnJvbSB1c2VyIHBhZ2VzIHRvIGtl
cm5lbCBwYWdlcywgYnV0IEkgZG9uJ3QNCj4+Pj4+Pj4gZnVsbHkgdW5kZXJzdGFuZCB3aHkg
d2UgbmVlZCB0byBtYWtlIHR3byBzZXBhcmF0ZSBjYWxscyB0byBtYXAgdGhlDQo+Pj4+Pj4+
IGd1ZXN0IG1lbW9yeSwgaS5lLiBtbWFwKCkgZm9sbG93ZWQgYnkgaW9jdGwoSU9DVExfUFJJ
VkNNRF9NTUFQQkFUQ0gpLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBXaHkgYXJlbid0IHdlIGRvaW5n
IGFsbCBvZiBpdCBmcm9tIG1tYXAoKSBpdHNlbGYgPyBJIGhhY2tlZCBpdCB1cCB0bw0KPj4+
Pj4+PiBjaGVjayBvbiBpdCBhbmQgaXQgd29ya3MgZmluZSBpZiB3ZSBkbyBpdCBhbGwgZnJv
bSBtbWFwKCkgaXRzZWxmLg0KPj4+Pj4gQXMgSSB1bmRlcnN0YW5kIGl0IHRoZSBNTUFQQkFU
Q0ggaW9jdGwgaXMgYmVpbmcgdHJlYXRlZCBsaWtlIGV2ZXJ5DQo+Pj4+PiBvdGhlcg0KPj4+
Pj4gaHlwZXJjYWxsIHByb3h5IHRocm91Z2ggdGhlIGlvY3RsIGludGVyZmFjZS4gV2hpY2gg
bWFrZXMgc2Vuc2UgZnJvbSB0aGUNCj4+Pj4+IHBvaW50IG9mIHZpZXcgb2YgaGF2aW5nIGEg
Y29uc2lzdGVudCBpbnRlcmZhY2UgdG8gdGhlIGh5cGVydmlzb3IgYnV0IG5vdA0KPj4+Pj4g
ZnJvbSBwb2ludCBvZiB2aWV3IG9mIHByb3ZpZGluZyBhIGNvbnNpc3RlbnQgdXNlcnNwYWNl
IGludGVyZmFjZSBmb3INCj4+Pj4+IG1hcHBpbmcgbWVtb3J5IHdoaWNoIGRvZXNuJ3QgY2Fy
ZSBhYm91dCB0aGUgaHlwZXJ2aXNvciBkZXRhaWxzLg0KPj4+Pj4gVGhlIHByaXZjbWRfbW1h
cGJhdGNoX3YyIGludGVyZmFjZSBpcyBzbGlnaHRseSByaWNoZXIgdGhhbiB3aGF0IHlvdQ0K
Pj4+Pj4gY291bGQgZXhwb3NlIHZpYSBtbWFwKCkgYmVjYXVzZSBpdCBhbGxvd3MgdGhlIGhh
bmRsaW5nIG9mIHBhcnRpYWwNCj4+Pj4+IG1hcHBpbmdzIHdpdGggd2hhdCBJIHByZXN1bWUg
aXMgYSBwZXItcGFnZSAqZXJyIGFycmF5LiBJZiB5b3UgaXNzdWVkIHRoZQ0KPj4+Pj4gaHlw
ZXJjYWxsIGRpcmVjdGx5IGZyb20gdGhlIG1tYXAoKSBhbmQgb25lIG9mIHRoZSBwYWdlcyB3
YXNuJ3QgbWFwcGVkIGJ5DQo+Pj4+PiB0aGUgaHlwZXJ2aXNvciB5b3Ugd291bGQgaGF2ZSB0
byB1bndpbmQgZXZlcnl0aGluZyBiZWZvcmUgcmV0dXJuaW5nDQo+Pj4+PiBFRkFVTFQgdG8g
dGhlIHVzZXIuDQo+Pj4+Pg0KPj4+Pj4+PiBBcmVuJ3Qgd2UgYWJ1c2luZyB0aGUgTGludXgg
dXNlcnNwYWNlIEFCSSBoZXJlID8gQXMgc3RhbmRhcmQgdXNlcnNwYWNlDQo+Pj4+Pj4+IGNv
ZGUgd291bGQgZXhwZWN0IGp1c3QgbW1hcCgpIHRvIGJlIGVub3VnaCB0byBtYXAgdGhlIG1l
bW9yeS4gWWVzLCB0aGUNCj4+Pj4+Pj4gY3VycmVudCB1c2VyLCBYZW4gaXRzZWxmLCBpcyBh
ZGFwdGVkIHRvIG1ha2UgdHdvIGNhbGxzLCBidXQgaXQgYnJlYWtzDQo+Pj4+Pj4+IGFzIHNv
b24gYXMgd2Ugd2FudCB0byB1c2Ugc29tZXRoaW5nIHRoYXQgcmVsaWVzIG9uIExpbnV4IHVz
ZXJzcGFjZQ0KPj4+Pj4+PiBBQkkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZvciBpbnN0YW5jZSwg
aW4gb3VyIGNhc2UsIHdoZXJlIHdlIGFyZSBsb29raW5nIHRvIGNyZWF0ZQ0KPj4+Pj4+PiBo
eXBlcnZpc29yLWFnbm9zdGljIHZpcnRpbyBiYWNrZW5kcywgdGhlIHJ1c3Qtdm1tIGxpYnJh
cnkgWzFdIGlzc3Vlcw0KPj4+Pj4+PiBtbWFwKCkgb25seSBhbmQgZXhwZWN0cyBpdCB0byB3
b3JrLiBJdCBkb2Vzbid0IGtub3cgaXQgaXMgcnVubmluZyBvbiBhDQo+Pj4+Pj4+IFhlbiBz
eXN0ZW0sIGFuZCBpdCBzaG91bGRuJ3Qga25vdyB0aGF0IGFzIHdlbGwuDQo+Pj4+Pj4NCj4+
Pj4+PiBVc2UgL2Rldi94ZW4vaHlwZXJjYWxsIHdoaWNoIGhhcyBhIHNhbmUgQUJJIGZvciBn
ZXR0aW5nICJzYWZlIiBtZW1vcnkuDQo+Pj4+Pj4gcHJpdmNtZCBpcyB2ZXJ5IG11Y2ggbm90
IHNhbmUuDQo+Pj4+Pj4NCj4+Pj4+PiBJbiBwcmFjdGljZSB5b3UnbGwgbmVlZCB0byB1c2Ug
Ym90aC7CoCAvZGV2L3hlbi9oeXBlcmNhbGwgZm9yIGdldHRpbmcNCj4+Pj4+PiAic2FmZSIg
bWVtb3J5LCBhbmQgL2Rldi94ZW4vcHJpdmNtZCBmb3IgaXNzdWluZyBoeXBlcmNhbGxzIGZv
ciBub3cuDQo+Pj4+PiBJJ20gdW5zdXJlIHdoYXQgaXMgbWVhbnQgYnkgc2FmZSBtZW1vcnkg
aGVyZS4gcHJpdmNtZF9idWZfbW1hcCgpDQo+Pj4+PiBsb29rcw0KPj4+Pj4gbGlrZSBpdCBq
dXN0IGFsbG9jYXRlcyBhIGJ1bmNoIG9mIEdGUF9LRVJORUwgcGFnZXMgcmF0aGVyIHRoYW4N
Cj4+Pj4+IGludGVyYWN0aW5nIHdpdGggdGhlIGh5cGVydmlzb3IgZGlyZWN0bHkuIEFyZSB0
aGVzZSB0aGUgc2FtZSBwYWdlcyB0aGF0DQo+Pj4+PiBnZXQgdXNlZCB3aGVuIHlvdSBldmVu
dHVhbGx5IGNhbGwgcHJpdmNtZF9pb2N0bF9tbWFwX2JhdGNoKCk/DQo+Pj4+DQo+Pj4+IHBy
aXZjbWRfYnVmX21tYXAoKSBpcyBhbGxvY2F0aW5nIGtlcm5lbCBwYWdlcyB3aGljaCBhcmUg
dXNlZCBmb3IgZGF0YSBiZWluZw0KPj4+PiBhY2Nlc3NlZCBieSB0aGUgaHlwZXJ2aXNvciB3
aGVuIGRvaW5nIHRoZSBoeXBlcmNhbGwgbGF0ZXIuIFRoaXMgaXMgYSBnZW5lcmljDQo+Pj4+
IGludGVyZmFjZSBiZWluZyB1c2VkIGZvciBhbGwgaHlwZXJjYWxscywgbm90IG9ubHkgZm9y
DQo+Pj4+IHByaXZjbWRfaW9jdGxfbW1hcF9iYXRjaCgpLg0KPj4+Pg0KPj4+Pj4gVGhlIGZh
Y3QgdGhhdCAvZGV2L3hlbi9oeXBlcmNhbGwgaXMgc3BlY2lmaWVkIGJ5IHhlbl9wcml2Y21k
YnVmX2RldiBpcyBhDQo+Pj4+PiBsaXR0bGUgY29uZnVzaW5nIFRCSC4NCj4+Pj4+IEFueXdh
eSB0aGUgZ29hbCBoZXJlIGlzIHRvIHByb3ZpZGUgYSBub24teGVuIGF3YXJlIHVzZXJzcGFj
ZSB3aXRoDQo+Pj4+PiBzdGFuZGFyZCB1c2Vyc3BhY2UgQVBJIHRvIGFjY2VzcyB0aGUgZ3Vl
c3RzIG1lbW9yeS4gUGVyaGFwcyBtZXNzaW5nDQo+Pj4+DQo+Pj4+IFRoaXMgaXMgd2hhdCB0
aGUgWGVuIHJlbGF0ZWQgbGlicmFyaWVzIGFyZSBtZWFudCBmb3IuIFlvdXIgZGVjaXNpb24g
dG8NCj4+Pj4gaWdub3JlIHRob3NlIGlzIGZpcmluZyBiYWNrIG5vdy4NCj4+PiBXZSBkaWRu
J3QgaWdub3JlIHRoZW0gLSB0aGUgaW5pdGlhbCB2ZXJzaW9uIG9mIHRoZSB4ZW4tdmhvc3Qt
bWFzdGVyDQo+Pj4gYmluYXJ5IHdhcyBidWlsdCB3aXRoIHRoZSBydXN0IGFuZCBsaW5raW5n
IHRvIHRoZSBYZW4gbGlicmFyaWVzLiBXZSBhcmUNCj4+PiBob3dldmVyIGluIHRoZSBwcm9j
ZXNzIG9mIG1vdmluZyB0byBtb3JlIHB1cmUgcnVzdCAod2l0aCB0aGUgeGVuLXN5cw0KPj4+
IGNyYXRlIGJlaW5nIGEgcHVyZSBydXN0IGlvY3RsL2h5cGVyY2FsbCB3cmFwcGVyKS4NCj4+
DQo+PiBBaCwgb2theSwgSSB3YXNuJ3QgYXdhcmUgb2YgdGhpcy4NCj4+DQo+Pj4gSG93ZXZl
ciBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGVyZSB3aGVyZSB0d28gY2xhc3NlcyBv
Zg0KPj4+IGh5cGVyY2FsbHMuIEFCSSBzdGFibGUgb25lcyB3aGljaCB3b24ndCBjaGFuZ2Ug
KHdoaWNoIGlzIGFsbCB3ZSBhcmUNCj4+PiBwbGFubmluZyB0byBpbXBsZW1lbnQgZm9yIHhl
bi1zeXMpIGFuZCBub24tc3RhYmxlIEFCSXMgd2hpY2ggd291bGQgbmVlZA0KPj4+IG1lZGlh
dGluZyBieSB0aGUgeGVuIGxpYnMuIFdlIGFyZSBob3Bpbmcgd2UgY2FuIGRvIGFsbCBvZiBW
aXJ0SU8gd2l0aA0KPj4+IGp1c3QgdGhlIHN0YWJsZSBBQkkuDQo+Pg0KPj4gT2theS4NCj4+
DQo+Pj4NCj4+Pj4+IGFyb3VuZCB3aXRoIHRoZSBzZW1hbnRpY3Mgb2YgdGhlIC9kZXYveGVu
L1toeXBlcmNhbGx8cHJpdmNtZF0gZGV2aWNlcw0KPj4+Pj4gbm9kZXMgaXMgdG9vIGNvbmZ1
c2luZy4NCj4+Pj4+IE1heWJlIHdlIGNvdWxkIGluc3RlYWQ6DQo+Pj4+PiAgICAgMS4gSGF2
ZSB0aGUgWGVuIGF3YXJlIFZNTSBhc2sgdG8gbWFrZSB0aGUgZ3Vlc3RzIG1lbW9yeSB2aXNp
YmxlIHRvDQo+Pj4+PiB0aGUNCj4+Pj4+ICAgICAgICBob3N0IGtlcm5lbHMgYWRkcmVzcyBz
cGFjZS4NCj4+Pj4NCj4+Pj4gVXJnaC4gVGhpcyB3b3VsZCBiZSBhIG1ham9yIGJyZWFjaCBv
ZiB0aGUgWGVuIHNlY3VyaXR5IGNvbmNlcHQuDQo+Pj4+DQo+Pj4+PiAgICAgMi4gV2hlbiB0
aGlzIGlzIGRvbmUgZXhwbGljaXRseSBjcmVhdGUgYSBkZXZpY2Ugbm9kZSB0byByZXByZXNl
bnQgaXQgKC9kZXYveGVuL2RvbS0lZC1tZW0/KQ0KPj4+Pj4gICAgIDMuIFBhc3MgdGhpcyBu
ZXcgZGV2aWNlIHRvIHRoZSBub24tWGVuIGF3YXJlIHVzZXJzcGFjZSB3aGljaCB1c2VzIHRo
ZQ0KPj4+Pj4gICAgICAgIHN0YW5kYXJkIG1tYXAoKSBjYWxsIHRvIG1ha2UgdGhlIGtlcm5l
bCBwYWdlcyB2aXNpYmxlIHRvIHVzZXJzcGFjZQ0KPj4+Pj4gRG9lcyB0aGF0IG1ha2Ugc2Vu
c2U/DQo+Pj4+DQo+Pj4+IE1heWJlIGZyb20geW91ciBwb2ludCBvZiB2aWV3LCBidXQgbm90
IGZyb20gdGhlIFhlbiBhcmNoaXRlY3R1cmFsIHBvaW50DQo+Pj4+IG9mIHZpZXcgSU1ITy4g
WW91IGFyZSByZW1vdmluZyBiYXNpY2FsbHkgdGhlIG1haW4gc2VjdXJpdHkgYWR2YW50YWdl
cyBvZg0KPj4+PiBYZW4gYnkgZ2VuZXJhdGluZyBhIGtlcm5lbCBpbnRlcmZhY2UgZm9yIG1h
cHBpbmcgYXJiaXRyYXJ5IGd1ZXN0IG1lbW9yeQ0KPj4+PiBlYXNpbHkuDQo+Pj4gV2UgYXJl
IG5vdCB0YWxraW5nIGFib3V0IGRvaW5nIGFuIGVuZC1ydW4gYXJvdW5kIHRoZSBYZW4NCj4+
PiBhcmNoaXRlY3R1cmUuDQo+Pj4gVGhlIGd1ZXN0IHN0aWxsIGhhcyB0byBpbnN0cnVjdCB0
aGUgaHlwZXJ2aXNvciB0byBncmFudCBhY2Nlc3MgdG8gaXRzDQo+Pj4gbWVtb3J5LiBDdXJy
ZW50bHkgdGhpcyBpcyBhIGdsb2JhbCB0aGluZyAoaS5lLiB3aG9sZSBhZGRyZXNzIHNwYWNl
IG9yDQo+Pj4gbm90aGluZykgYnV0IG9idmlvdXNseSBtb3JlIGZpbmUgZ3JhaW5lZCBncmFu
dHMgY2FuIGJlIGRvbmUgb24gYQ0KPj4+IHRyYW5zYWN0aW9uIGJ5IHRyYW5zYWN0aW9uIGJh
c2lzIGFsdGhvdWdoIHdlIGFyZSBleHBsb3JpbmcgbW9yZQ0KPj4+IGVmZmljaWVudCBtZWNo
YW5pc21zIGZvciB0aGlzIChzaGFyZWQgcG9vbHMgYW5kIGNhcnZlIG91dHMpLg0KPj4NCj4+
IEhhcHB5IHRvIGhlYXIgdGhhdC4NCj4+DQo+Pj4gVGhpcyBkb2VzIHJhaXNlIHF1ZXN0aW9u
cyBmb3IgdGhlIG1tYXAgaW50ZXJmYWNlIHRob3VnaCAtIGVhY2gNCj4+PiBpbmRpdmlkdWFs
bHkgZ3JhbnRlZCByZWdpb24gd291bGQgbmVlZCB0byBiZSBtYXBwZWQgaW50byB0aGUgZG9t
MA0KPj4+IHVzZXJzcGFjZSB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2Ugb3IgcGVyaGFwcyBhIG5l
dyBmbGFnIGZvciBtbWFwKCkgc28gd2UNCj4+PiBjYW4gbWFwIHRoZSB3aG9sZSBhZGRyZXNz
IHNwYWNlIGJ1dCBleHBlY3QgU0lHQlVTIGZhdWx0cyBpZiB3ZSBhY2Nlc3MNCj4+PiBzb21l
dGhpbmcgdGhhdCBoYXNuJ3QgYmVlbiBncmFudGVkLg0KPj4NCj4+IERvIEkgdW5kZXJzdGFu
ZCB0aGF0IGNvcnJlY3RseT8gWW91IHdhbnQgdGhlIGd1ZXN0IHRvIGdyYW50IGEgbWVtb3J5
DQo+PiByZWdpb24gdG8gdGhlIGJhY2tlbmQsIGFuZCB0aGUgYmFja2VuZCBzaG91bGQgYmUg
YWJsZSB0byBtYXAgdGhpcyByZWdpb24NCj4+IG5vdCB1c2luZyBncmFudHMsIGJ1dCB0aGUg
Z3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2VzPw0KPiANCj4gWWVzIC0gYWx0aG91Z2ggaXQgZG9l
c24ndCBoYXZlIHRvIGJlIHRoZSB3aG9sZSBHUEEgcmFuZ2UuIFRoZSB2aG9zdC11c2VyDQo+
IHByb3RvY29sIGNvbW11bmljYXRlcyB3aGF0IG9mZnNldCBpbnRvIHRoZSBHUEEgc3BhY2Ug
dGhlIHZhcmlvdXMgbWVtb3J5DQo+IHJlZ2lvbnMgZXhpc3QgYXQuDQoNCkhvdyB3b3VsZCB0
aGUgaW50ZXJmYWNlIHdpdGggdGhlIGh5cGVydmlzb3IgbG9vayBsaWtlIHRoZW4/DQoNCklu
IG9yZGVyIHRvIG1ha2UgdGhpcyBzZWN1cmUsIHRoZSBoeXBlcnZpc29yIHdvdWxkIG5lZWQg
dG8gc2NhbiB0aGUNCmdyYW50IHRhYmxlIG9mIHRoZSBndWVzdCB0byBsb29rIGZvciBhIHBo
eXNpY2FsIGFkZHJlc3MgdGhlIGJhY2tlbmQNCndhbnRzIHRvIG1hcC4gSSBkb24ndCB0aGlu
ayB0aGlzIGlzIGFuIGFjY2VwdGFibGUgaW50ZXJmYWNlLg0KDQoNCkp1ZXJnZW4NCg==
--------------kLVUhaep4LdBLZwdlKRDD324
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------kLVUhaep4LdBLZwdlKRDD324--

--------------clnhdyorXixPgreZBK3F8k99--

--------------7ii8U7UcB0T0rKiGWIa0mw0W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMQUSoFAwAAAAAACgkQsN6d1ii/Ey9G
8gf9GLje1vvhlPVddYNZhRvG59Z1ex8Bf81iG5RSrO4j570atIJOtfXTyh34txy92YkSaIozxP9L
2zEVC7pZ6lTl1FvZYlHnmZWykhuW923TZLY+99T/ZJv2TA81u4wSTNDgzjt3YhBj7Nqh7qvHAeKJ
/LH4X9wp+C8bVdm1Ld5Sm7LYuuCAn1DUj4mFf9W1U82QJsoTQKhZUoshD4L/gNuCPI4LoZeDDSY1
zY08ACggolukYi9CA9TX+MeldzO3IpQEoZibWOQ+ZiXWm7vzv20m9PhedyXxbaeRhEQiTUxMuejz
qQhk9ID6/rnQb1y8y+3va+yMCenfDP3TYoL+hf3siQ==
=fzKA
-----END PGP SIGNATURE-----

--------------7ii8U7UcB0T0rKiGWIa0mw0W--

