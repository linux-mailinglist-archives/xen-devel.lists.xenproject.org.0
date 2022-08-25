Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9875A089C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 08:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393035.631733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR5x6-0006S6-7Q; Thu, 25 Aug 2022 06:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393035.631733; Thu, 25 Aug 2022 06:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR5x6-0006Q3-4Q; Thu, 25 Aug 2022 06:02:52 +0000
Received: by outflank-mailman (input) for mailman id 393035;
 Thu, 25 Aug 2022 06:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K3TS=Y5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oR5x4-0006Pw-Qo
 for xen-devel@lists.xen.org; Thu, 25 Aug 2022 06:02:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a93b2ea-243b-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 08:02:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3FF305C797;
 Thu, 25 Aug 2022 06:02:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD89E13A89;
 Thu, 25 Aug 2022 06:02:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v9RJLIUQB2OwLwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Aug 2022 06:02:45 +0000
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
X-Inumbo-ID: 8a93b2ea-243b-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661407366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0TKO6tdS6WQAG7ojQIv0U+TP7vtCujKz80myrNFUI+g=;
	b=G5K6g60T0DmKnRTcpcuK90tm33ex04IAA2U8fscLRD93BBwqfAusZqtBrW2OZTC6ArRDxU
	UoRfrnoqpP/tTDb5WqLmimTDc2EX8HS6tMI7npoi8DZr22pqAMVptptlu8ssrfGzBPvlh5
	C9p65E3INDFqW3V6lRDAo3JLHTcB4dA=
Message-ID: <9697a559-fe42-3efb-5715-1f6bc631f57d@suse.com>
Date: Thu, 25 Aug 2022 08:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
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
From: Juergen Gross <jgross@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
In-Reply-To: <87y1vdh9or.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6Yuq9Nn5vXhfEPScyNd0DknY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6Yuq9Nn5vXhfEPScyNd0DknY
Content-Type: multipart/mixed; boundary="------------yfoQ3Sh26c1MJD97wG8G5gti";
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
Message-ID: <9697a559-fe42-3efb-5715-1f6bc631f57d@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com> <877d2xj23o.fsf@linaro.org>
 <edc33ca4-135e-111a-e198-38b9bae53005@suse.com> <87y1vdh9or.fsf@linaro.org>
In-Reply-To: <87y1vdh9or.fsf@linaro.org>

--------------yfoQ3Sh26c1MJD97wG8G5gti
Content-Type: multipart/mixed; boundary="------------mFNoxFDyl8M5L3UPa4Gn5wW8"

--------------mFNoxFDyl8M5L3UPa4Gn5wW8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTc6NTgsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gDQo+IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JpdGVzOg0KPiANCj4+IFtbUEdQIFNpZ25lZCBQ
YXJ0OlVuZGVjaWRlZF1dDQo+PiBPbiAyNC4wOC4yMiAxMzoyMiwgQWxleCBCZW5uw6llIHdy
b3RlOg0KPj4+IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+IHdy
aXRlczoNCj4+Pg0KPj4+PiBPbiAyNC8wOC8yMDIyIDEwOjE5LCBWaXJlc2ggS3VtYXIgd3Jv
dGU6DQo+Pj4+PiBPbiAyNC0wMy0yMiwgMDY6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
Pj4+Pj4gRm9yIGEgcmF0aGVyIGxvbmcgdGltZSB3ZSB3ZXJlIHVzaW5nICJub3JtYWwiIHVz
ZXIgcGFnZXMgZm9yIHRoaXMgcHVycG9zZSwNCj4+Pj4+PiB3aGljaCB3ZXJlIGp1c3QgbG9j
a2VkIGludG8gbWVtb3J5IGZvciBkb2luZyB0aGUgaHlwZXJjYWxsLg0KPj4+Pj4+DQo+Pj4+
Pj4gVW5mb3J0dW5hdGVseSB0aGVyZSBoYXZlIGJlZW4gdmVyeSByYXJlIHByb2JsZW1zIHdp
dGggdGhhdCBhcHByb2FjaCwgYXMNCj4+Pj4+PiB0aGUgTGludXgga2VybmVsIGNhbiBzZXQg
YSB1c2VyIHBhZ2UgcmVsYXRlZCBQVEUgdG8gaW52YWxpZCBmb3Igc2hvcnQNCj4+Pj4+PiBw
ZXJpb2RzIG9mIHRpbWUsIHdoaWNoIGxlZCB0byBFRkFVTFQgaW4gdGhlIGh5cGVydmlzb3Ig
d2hlbiB0cnlpbmcgdG8NCj4+Pj4+PiBhY2Nlc3MgdGhlIGh5cGVyY2FsbCBkYXRhLg0KPj4+
Pj4+DQo+Pj4+Pj4gSW4gTGludXggdGhpcyBjYW4gYXZvaWRlZCBvbmx5IGJ5IHVzaW5nIGtl
cm5lbCBtZW1vcnksIHdoaWNoIGlzIHRoZQ0KPj4+Pj4+IHJlYXNvbiB3aHkgdGhlIGh5cGVy
Y2FsbCBidWZmZXJzIGFyZSBhbGxvY2F0ZWQgYW5kIG1tYXAoKS1lZCB0aHJvdWdoIHRoZQ0K
Pj4+Pj4+IHByaXZjbWQgZHJpdmVyLg0KPj4+Pj4gSGkgSnVlcmdlbiwNCj4+Pj4+DQo+Pj4+
PiBJIHVuZGVyc3RhbmQgd2h5IHdlIG1vdmVkIGZyb20gdXNlciBwYWdlcyB0byBrZXJuZWwg
cGFnZXMsIGJ1dCBJIGRvbid0DQo+Pj4+PiBmdWxseSB1bmRlcnN0YW5kIHdoeSB3ZSBuZWVk
IHRvIG1ha2UgdHdvIHNlcGFyYXRlIGNhbGxzIHRvIG1hcCB0aGUNCj4+Pj4+IGd1ZXN0IG1l
bW9yeSwgaS5lLiBtbWFwKCkgZm9sbG93ZWQgYnkgaW9jdGwoSU9DVExfUFJJVkNNRF9NTUFQ
QkFUQ0gpLg0KPj4+Pj4NCj4+Pj4+IFdoeSBhcmVuJ3Qgd2UgZG9pbmcgYWxsIG9mIGl0IGZy
b20gbW1hcCgpIGl0c2VsZiA/IEkgaGFja2VkIGl0IHVwIHRvDQo+Pj4+PiBjaGVjayBvbiBp
dCBhbmQgaXQgd29ya3MgZmluZSBpZiB3ZSBkbyBpdCBhbGwgZnJvbSBtbWFwKCkgaXRzZWxm
Lg0KPj4+IEFzIEkgdW5kZXJzdGFuZCBpdCB0aGUgTU1BUEJBVENIIGlvY3RsIGlzIGJlaW5n
IHRyZWF0ZWQgbGlrZSBldmVyeQ0KPj4+IG90aGVyDQo+Pj4gaHlwZXJjYWxsIHByb3h5IHRo
cm91Z2ggdGhlIGlvY3RsIGludGVyZmFjZS4gV2hpY2ggbWFrZXMgc2Vuc2UgZnJvbSB0aGUN
Cj4+PiBwb2ludCBvZiB2aWV3IG9mIGhhdmluZyBhIGNvbnNpc3RlbnQgaW50ZXJmYWNlIHRv
IHRoZSBoeXBlcnZpc29yIGJ1dCBub3QNCj4+PiBmcm9tIHBvaW50IG9mIHZpZXcgb2YgcHJv
dmlkaW5nIGEgY29uc2lzdGVudCB1c2Vyc3BhY2UgaW50ZXJmYWNlIGZvcg0KPj4+IG1hcHBp
bmcgbWVtb3J5IHdoaWNoIGRvZXNuJ3QgY2FyZSBhYm91dCB0aGUgaHlwZXJ2aXNvciBkZXRh
aWxzLg0KPj4+IFRoZSBwcml2Y21kX21tYXBiYXRjaF92MiBpbnRlcmZhY2UgaXMgc2xpZ2h0
bHkgcmljaGVyIHRoYW4gd2hhdCB5b3UNCj4+PiBjb3VsZCBleHBvc2UgdmlhIG1tYXAoKSBi
ZWNhdXNlIGl0IGFsbG93cyB0aGUgaGFuZGxpbmcgb2YgcGFydGlhbA0KPj4+IG1hcHBpbmdz
IHdpdGggd2hhdCBJIHByZXN1bWUgaXMgYSBwZXItcGFnZSAqZXJyIGFycmF5LiBJZiB5b3Ug
aXNzdWVkIHRoZQ0KPj4+IGh5cGVyY2FsbCBkaXJlY3RseSBmcm9tIHRoZSBtbWFwKCkgYW5k
IG9uZSBvZiB0aGUgcGFnZXMgd2Fzbid0IG1hcHBlZCBieQ0KPj4+IHRoZSBoeXBlcnZpc29y
IHlvdSB3b3VsZCBoYXZlIHRvIHVud2luZCBldmVyeXRoaW5nIGJlZm9yZSByZXR1cm5pbmcN
Cj4+PiBFRkFVTFQgdG8gdGhlIHVzZXIuDQo+Pj4NCj4+Pj4+IEFyZW4ndCB3ZSBhYnVzaW5n
IHRoZSBMaW51eCB1c2Vyc3BhY2UgQUJJIGhlcmUgPyBBcyBzdGFuZGFyZCB1c2Vyc3BhY2UN
Cj4+Pj4+IGNvZGUgd291bGQgZXhwZWN0IGp1c3QgbW1hcCgpIHRvIGJlIGVub3VnaCB0byBt
YXAgdGhlIG1lbW9yeS4gWWVzLCB0aGUNCj4+Pj4+IGN1cnJlbnQgdXNlciwgWGVuIGl0c2Vs
ZiwgaXMgYWRhcHRlZCB0byBtYWtlIHR3byBjYWxscywgYnV0IGl0IGJyZWFrcw0KPj4+Pj4g
YXMgc29vbiBhcyB3ZSB3YW50IHRvIHVzZSBzb21ldGhpbmcgdGhhdCByZWxpZXMgb24gTGlu
dXggdXNlcnNwYWNlDQo+Pj4+PiBBQkkuDQo+Pj4+Pg0KPj4+Pj4gRm9yIGluc3RhbmNlLCBp
biBvdXIgY2FzZSwgd2hlcmUgd2UgYXJlIGxvb2tpbmcgdG8gY3JlYXRlDQo+Pj4+PiBoeXBl
cnZpc29yLWFnbm9zdGljIHZpcnRpbyBiYWNrZW5kcywgdGhlIHJ1c3Qtdm1tIGxpYnJhcnkg
WzFdIGlzc3Vlcw0KPj4+Pj4gbW1hcCgpIG9ubHkgYW5kIGV4cGVjdHMgaXQgdG8gd29yay4g
SXQgZG9lc24ndCBrbm93IGl0IGlzIHJ1bm5pbmcgb24gYQ0KPj4+Pj4gWGVuIHN5c3RlbSwg
YW5kIGl0IHNob3VsZG4ndCBrbm93IHRoYXQgYXMgd2VsbC4NCj4+Pj4NCj4+Pj4gVXNlIC9k
ZXYveGVuL2h5cGVyY2FsbCB3aGljaCBoYXMgYSBzYW5lIEFCSSBmb3IgZ2V0dGluZyAic2Fm
ZSIgbWVtb3J5Lg0KPj4+PiBwcml2Y21kIGlzIHZlcnkgbXVjaCBub3Qgc2FuZS4NCj4+Pj4N
Cj4+Pj4gSW4gcHJhY3RpY2UgeW91J2xsIG5lZWQgdG8gdXNlIGJvdGguwqAgL2Rldi94ZW4v
aHlwZXJjYWxsIGZvciBnZXR0aW5nDQo+Pj4+ICJzYWZlIiBtZW1vcnksIGFuZCAvZGV2L3hl
bi9wcml2Y21kIGZvciBpc3N1aW5nIGh5cGVyY2FsbHMgZm9yIG5vdy4NCj4+PiBJJ20gdW5z
dXJlIHdoYXQgaXMgbWVhbnQgYnkgc2FmZSBtZW1vcnkgaGVyZS4gcHJpdmNtZF9idWZfbW1h
cCgpDQo+Pj4gbG9va3MNCj4+PiBsaWtlIGl0IGp1c3QgYWxsb2NhdGVzIGEgYnVuY2ggb2Yg
R0ZQX0tFUk5FTCBwYWdlcyByYXRoZXIgdGhhbg0KPj4+IGludGVyYWN0aW5nIHdpdGggdGhl
IGh5cGVydmlzb3IgZGlyZWN0bHkuIEFyZSB0aGVzZSB0aGUgc2FtZSBwYWdlcyB0aGF0DQo+
Pj4gZ2V0IHVzZWQgd2hlbiB5b3UgZXZlbnR1YWxseSBjYWxsIHByaXZjbWRfaW9jdGxfbW1h
cF9iYXRjaCgpPw0KPj4NCj4+IHByaXZjbWRfYnVmX21tYXAoKSBpcyBhbGxvY2F0aW5nIGtl
cm5lbCBwYWdlcyB3aGljaCBhcmUgdXNlZCBmb3IgZGF0YSBiZWluZw0KPj4gYWNjZXNzZWQg
YnkgdGhlIGh5cGVydmlzb3Igd2hlbiBkb2luZyB0aGUgaHlwZXJjYWxsIGxhdGVyLiBUaGlz
IGlzIGEgZ2VuZXJpYw0KPj4gaW50ZXJmYWNlIGJlaW5nIHVzZWQgZm9yIGFsbCBoeXBlcmNh
bGxzLCBub3Qgb25seSBmb3INCj4+IHByaXZjbWRfaW9jdGxfbW1hcF9iYXRjaCgpLg0KPj4N
Cj4+PiBUaGUgZmFjdCB0aGF0IC9kZXYveGVuL2h5cGVyY2FsbCBpcyBzcGVjaWZpZWQgYnkg
eGVuX3ByaXZjbWRidWZfZGV2IGlzIGENCj4+PiBsaXR0bGUgY29uZnVzaW5nIFRCSC4NCj4+
PiBBbnl3YXkgdGhlIGdvYWwgaGVyZSBpcyB0byBwcm92aWRlIGEgbm9uLXhlbiBhd2FyZSB1
c2Vyc3BhY2Ugd2l0aA0KPj4+IHN0YW5kYXJkIHVzZXJzcGFjZSBBUEkgdG8gYWNjZXNzIHRo
ZSBndWVzdHMgbWVtb3J5LiBQZXJoYXBzIG1lc3NpbmcNCj4+DQo+PiBUaGlzIGlzIHdoYXQg
dGhlIFhlbiByZWxhdGVkIGxpYnJhcmllcyBhcmUgbWVhbnQgZm9yLiBZb3VyIGRlY2lzaW9u
IHRvDQo+PiBpZ25vcmUgdGhvc2UgaXMgZmlyaW5nIGJhY2sgbm93Lg0KPiANCj4gV2UgZGlk
bid0IGlnbm9yZSB0aGVtIC0gdGhlIGluaXRpYWwgdmVyc2lvbiBvZiB0aGUgeGVuLXZob3N0
LW1hc3Rlcg0KPiBiaW5hcnkgd2FzIGJ1aWx0IHdpdGggdGhlIHJ1c3QgYW5kIGxpbmtpbmcg
dG8gdGhlIFhlbiBsaWJyYXJpZXMuIFdlIGFyZQ0KPiBob3dldmVyIGluIHRoZSBwcm9jZXNz
IG9mIG1vdmluZyB0byBtb3JlIHB1cmUgcnVzdCAod2l0aCB0aGUgeGVuLXN5cw0KPiBjcmF0
ZSBiZWluZyBhIHB1cmUgcnVzdCBpb2N0bC9oeXBlcmNhbGwgd3JhcHBlcikuDQoNCkFoLCBv
a2F5LCBJIHdhc24ndCBhd2FyZSBvZiB0aGlzLg0KDQo+IEhvd2V2ZXIgSSB3YXMgdW5kZXIg
dGhlIGltcHJlc3Npb24gdGhlcmUgd2hlcmUgdHdvIGNsYXNzZXMgb2YNCj4gaHlwZXJjYWxs
cy4gQUJJIHN0YWJsZSBvbmVzIHdoaWNoIHdvbid0IGNoYW5nZSAod2hpY2ggaXMgYWxsIHdl
IGFyZQ0KPiBwbGFubmluZyB0byBpbXBsZW1lbnQgZm9yIHhlbi1zeXMpIGFuZCBub24tc3Rh
YmxlIEFCSXMgd2hpY2ggd291bGQgbmVlZA0KPiBtZWRpYXRpbmcgYnkgdGhlIHhlbiBsaWJz
LiBXZSBhcmUgaG9waW5nIHdlIGNhbiBkbyBhbGwgb2YgVmlydElPIHdpdGgNCj4ganVzdCB0
aGUgc3RhYmxlIEFCSS4NCg0KT2theS4NCg0KPiANCj4+PiBhcm91bmQgd2l0aCB0aGUgc2Vt
YW50aWNzIG9mIHRoZSAvZGV2L3hlbi9baHlwZXJjYWxsfHByaXZjbWRdIGRldmljZXMNCj4+
PiBub2RlcyBpcyB0b28gY29uZnVzaW5nLg0KPj4+IE1heWJlIHdlIGNvdWxkIGluc3RlYWQ6
DQo+Pj4gICAgMS4gSGF2ZSB0aGUgWGVuIGF3YXJlIFZNTSBhc2sgdG8gbWFrZSB0aGUgZ3Vl
c3RzIG1lbW9yeSB2aXNpYmxlIHRvDQo+Pj4gdGhlDQo+Pj4gICAgICAgaG9zdCBrZXJuZWxz
IGFkZHJlc3Mgc3BhY2UuDQo+Pg0KPj4gVXJnaC4gVGhpcyB3b3VsZCBiZSBhIG1ham9yIGJy
ZWFjaCBvZiB0aGUgWGVuIHNlY3VyaXR5IGNvbmNlcHQuDQo+Pg0KPj4+ICAgIDIuIFdoZW4g
dGhpcyBpcyBkb25lIGV4cGxpY2l0bHkgY3JlYXRlIGEgZGV2aWNlIG5vZGUgdG8gcmVwcmVz
ZW50IGl0ICgvZGV2L3hlbi9kb20tJWQtbWVtPykNCj4+PiAgICAzLiBQYXNzIHRoaXMgbmV3
IGRldmljZSB0byB0aGUgbm9uLVhlbiBhd2FyZSB1c2Vyc3BhY2Ugd2hpY2ggdXNlcyB0aGUN
Cj4+PiAgICAgICBzdGFuZGFyZCBtbWFwKCkgY2FsbCB0byBtYWtlIHRoZSBrZXJuZWwgcGFn
ZXMgdmlzaWJsZSB0byB1c2Vyc3BhY2UNCj4+PiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8NCj4+
DQo+PiBNYXliZSBmcm9tIHlvdXIgcG9pbnQgb2YgdmlldywgYnV0IG5vdCBmcm9tIHRoZSBY
ZW4gYXJjaGl0ZWN0dXJhbCBwb2ludA0KPj4gb2YgdmlldyBJTUhPLiBZb3UgYXJlIHJlbW92
aW5nIGJhc2ljYWxseSB0aGUgbWFpbiBzZWN1cml0eSBhZHZhbnRhZ2VzIG9mDQo+PiBYZW4g
YnkgZ2VuZXJhdGluZyBhIGtlcm5lbCBpbnRlcmZhY2UgZm9yIG1hcHBpbmcgYXJiaXRyYXJ5
IGd1ZXN0IG1lbW9yeQ0KPj4gZWFzaWx5Lg0KPiANCj4gV2UgYXJlIG5vdCB0YWxraW5nIGFi
b3V0IGRvaW5nIGFuIGVuZC1ydW4gYXJvdW5kIHRoZSBYZW4gYXJjaGl0ZWN0dXJlLg0KPiBU
aGUgZ3Vlc3Qgc3RpbGwgaGFzIHRvIGluc3RydWN0IHRoZSBoeXBlcnZpc29yIHRvIGdyYW50
IGFjY2VzcyB0byBpdHMNCj4gbWVtb3J5LiBDdXJyZW50bHkgdGhpcyBpcyBhIGdsb2JhbCB0
aGluZyAoaS5lLiB3aG9sZSBhZGRyZXNzIHNwYWNlIG9yDQo+IG5vdGhpbmcpIGJ1dCBvYnZp
b3VzbHkgbW9yZSBmaW5lIGdyYWluZWQgZ3JhbnRzIGNhbiBiZSBkb25lIG9uIGENCj4gdHJh
bnNhY3Rpb24gYnkgdHJhbnNhY3Rpb24gYmFzaXMgYWx0aG91Z2ggd2UgYXJlIGV4cGxvcmlu
ZyBtb3JlDQo+IGVmZmljaWVudCBtZWNoYW5pc21zIGZvciB0aGlzIChzaGFyZWQgcG9vbHMg
YW5kIGNhcnZlIG91dHMpLg0KDQpIYXBweSB0byBoZWFyIHRoYXQuDQoNCj4gVGhpcyBkb2Vz
IHJhaXNlIHF1ZXN0aW9ucyBmb3IgdGhlIG1tYXAgaW50ZXJmYWNlIHRob3VnaCAtIGVhY2gN
Cj4gaW5kaXZpZHVhbGx5IGdyYW50ZWQgcmVnaW9uIHdvdWxkIG5lZWQgdG8gYmUgbWFwcGVk
IGludG8gdGhlIGRvbTANCj4gdXNlcnNwYWNlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBvciBw
ZXJoYXBzIGEgbmV3IGZsYWcgZm9yIG1tYXAoKSBzbyB3ZQ0KPiBjYW4gbWFwIHRoZSB3aG9s
ZSBhZGRyZXNzIHNwYWNlIGJ1dCBleHBlY3QgU0lHQlVTIGZhdWx0cyBpZiB3ZSBhY2Nlc3MN
Cj4gc29tZXRoaW5nIHRoYXQgaGFzbid0IGJlZW4gZ3JhbnRlZC4NCg0KRG8gSSB1bmRlcnN0
YW5kIHRoYXQgY29ycmVjdGx5PyBZb3Ugd2FudCB0aGUgZ3Vlc3QgdG8gZ3JhbnQgYSBtZW1v
cnkNCnJlZ2lvbiB0byB0aGUgYmFja2VuZCwgYW5kIHRoZSBiYWNrZW5kIHNob3VsZCBiZSBh
YmxlIHRvIG1hcCB0aGlzIHJlZ2lvbg0Kbm90IHVzaW5nIGdyYW50cywgYnV0IHRoZSBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzZXM/DQoNCg0KSnVlcmdlbg0K
--------------mFNoxFDyl8M5L3UPa4Gn5wW8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mFNoxFDyl8M5L3UPa4Gn5wW8--

--------------yfoQ3Sh26c1MJD97wG8G5gti--

--------------6Yuq9Nn5vXhfEPScyNd0DknY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMHEIUFAwAAAAAACgkQsN6d1ii/Ey9h
fQgAhKiWU17tUH2Wq36HTwRFVnermd8FRCSrxNbYnSw/DmXxcrK5RyuaB4TDjUAlMZzaRKMmXaqG
TYqxpD9+eOL2E4gkPOXDI7b718gRt1y2CvPjbBbymgBJ9Py2B+4SUQJwjaToRACrBYjEtT0yZupX
RAd41p9kJefJSszw+DQfp8uSAsqIdTP1oKMOnC+VhDAIY2J85hUwvTjWPb4vUoggyqj1V/xedPWK
y9MXkZIrLW9pVwmL0JdY2VdbFwcr3dzVTKI7rKxv75hcI0X9q159bKT/cWsL/JEdodG2MMQGO/dk
ig7yyH9ExgnVDXsNFY8ikMo0dHi4rNoV3WkMhE5rKg==
=VOKh
-----END PGP SIGNATURE-----

--------------6Yuq9Nn5vXhfEPScyNd0DknY--

