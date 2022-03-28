Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338A4E8E30
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 08:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295311.502463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYipX-0004Np-EM; Mon, 28 Mar 2022 06:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295311.502463; Mon, 28 Mar 2022 06:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYipX-0004KM-A1; Mon, 28 Mar 2022 06:26:19 +0000
Received: by outflank-mailman (input) for mailman id 295311;
 Mon, 28 Mar 2022 06:26:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJb9=UH=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nYipV-0004KG-2P
 for xen-devel@lists.xen.org; Mon, 28 Mar 2022 06:26:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7cfe7fe-ae5f-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 08:26:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1CDA6210E3;
 Mon, 28 Mar 2022 06:26:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C942013215;
 Mon, 28 Mar 2022 06:26:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /DfPLwVVQWLWXgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 28 Mar 2022 06:26:13 +0000
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
X-Inumbo-ID: f7cfe7fe-ae5f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648448774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5JXmn2CtCDIOTgPMnQ7bAxcpR4dTBIp13O5PBvvwAgU=;
	b=CZQN9Hr5NxYV6Ih6lJLTgYECQAAtmSirQzekqkDST2ozMbcylWlYBF1oM8xtCuAwQGGbhm
	XaMp2CpW0F5D0+Tnt4EvDeLkaLsmzrLvQI6sayqOruYhc38kWkW/x6ywiad699r7EWjD7D
	6kyMS8qxcYxmxUudBPIfn2c/ZITzCas=
Message-ID: <5533dbcc-64da-bed9-27c6-90797e711aeb@suse.com>
Date: Mon, 28 Mar 2022 08:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org,
 Stratos-dev@op-lists.linaro.org, viresh.kumar@linaro.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, christopher.w.clark@gmail.com,
 boris.ostrovsky@oracle.com, Arnd Bergmann <arnd.bergmann@linaro.org>
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com> <87mthe0zea.fsf@linaro.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
In-Reply-To: <87mthe0zea.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------30v9tizF2cZDQr750Qi0xppF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------30v9tizF2cZDQr750Qi0xppF
Content-Type: multipart/mixed; boundary="------------Bwfd4Y0krBnyaae5jYj8qAF0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org,
 Stratos-dev@op-lists.linaro.org, viresh.kumar@linaro.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, christopher.w.clark@gmail.com,
 boris.ostrovsky@oracle.com, Arnd Bergmann <arnd.bergmann@linaro.org>
Message-ID: <5533dbcc-64da-bed9-27c6-90797e711aeb@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com> <87mthe0zea.fsf@linaro.org>
In-Reply-To: <87mthe0zea.fsf@linaro.org>

--------------Bwfd4Y0krBnyaae5jYj8qAF0
Content-Type: multipart/mixed; boundary="------------w0TlHFC4N0K3RQhFFRTx5Fse"

--------------w0TlHFC4N0K3RQhFFRTx5Fse
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDMuMjIgMTc6MDcsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gDQo+IChhZGQgQXJu
ZCB0byBDQykNCj4gDQo+IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JpdGVz
Og0KPiANCj4+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVjaWRlZF1dDQo+PiBPbiAyNC4wMy4y
MiAwMjo0MiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IEkgYW0gcHJldHR5IHN1
cmUgdGhlIHJlYXNvbnMgaGF2ZSB0byBkbyB3aXRoIG9sZCB4ODYgUFYgZ3Vlc3RzLCBzbyBJ
IGFtDQo+Pj4gQ0NpbmcgSnVlcmdlbiBhbmQgQm9yaXMuDQo+Pj4NCj4+Pj4gSGksDQo+Pj4+
DQo+Pj4+IFdoaWxlIHdlJ3ZlIGJlZW4gd29ya2luZyBvbiB0aGUgcnVzdC12bW0gdmlydGlv
IGJhY2tlbmRzIG9uIFhlbiB3ZQ0KPj4+PiBvYnZpb3VzbHkgaGF2ZSB0byBtYXAgZ3Vlc3Qg
bWVtb3J5IGluZm8gdGhlIHVzZXJzcGFjZSBvZiB0aGUgZGFlbW9uLg0KPj4+PiBIb3dldmVy
IGZvbGxvd2luZyB0aGUgbG9naWMgb2Ygd2hhdCBpcyBnb2luZyBvbiBpcyBhIGxpdHRsZSBj
b25mdXNpbmcuDQo+Pj4+IEZvciBleGFtcGxlIGluIHRoZSBMaW51eCBiYWNrZW5kIHdlIGhh
dmUgdGhpczoNCj4+Pj4NCj4+Pj4gICAgIHZvaWQgKm9zZGVwX3hlbmZvcmVpZ25tZW1vcnlf
bWFwKHhlbmZvcmVpZ25tZW1vcnlfaGFuZGxlICpmbWVtLA0KPj4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9tLCB2b2lkICphZGRyLA0KPj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHByb3QsIGludCBm
bGFncywgc2l6ZV90IG51bSwNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHhlbl9wZm5fdCBhcnJbLypudW0qL10sIGludCBlcnJbLypudW0qL10p
DQo+Pj4+ICAgICB7DQo+Pj4+ICAgICAgICAgaW50IGZkID0gZm1lbS0+ZmQ7DQo+Pj4+ICAg
ICAgICAgcHJpdmNtZF9tbWFwYmF0Y2hfdjJfdCBpb2N0bHg7DQo+Pj4+ICAgICAgICAgc2l6
ZV90IGk7DQo+Pj4+ICAgICAgICAgaW50IHJjOw0KPj4+Pg0KPj4+PiAgICAgICAgIGFkZHIg
PSBtbWFwKGFkZHIsIG51bSA8PCBYQ19QQUdFX1NISUZULCBwcm90LCBmbGFncyB8IE1BUF9T
SEFSRUQsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgZmQsIDApOw0KPj4+PiAgICAgICAg
IGlmICggYWRkciA9PSBNQVBfRkFJTEVEICkNCj4+Pj4gICAgICAgICAgICAgcmV0dXJuIE5V
TEw7DQo+Pj4+DQo+Pj4+ICAgICAgICAgaW9jdGx4Lm51bSA9IG51bTsNCj4+Pj4gICAgICAg
ICBpb2N0bHguZG9tID0gZG9tOw0KPj4+PiAgICAgICAgIGlvY3RseC5hZGRyID0gKHVuc2ln
bmVkIGxvbmcpYWRkcjsNCj4+Pj4gICAgICAgICBpb2N0bHguYXJyID0gYXJyOw0KPj4+PiAg
ICAgICAgIGlvY3RseC5lcnIgPSBlcnI7DQo+Pj4+DQo+Pj4+ICAgICAgICAgcmMgPSBpb2N0
bChmZCwgSU9DVExfUFJJVkNNRF9NTUFQQkFUQ0hfVjIsICZpb2N0bHgpOw0KPj4+Pg0KPj4+
PiBXaGVyZSB0aGUgZmQgcGFzc2VkIGRvd24gaXMgYXNzb2NpYXRlZCB3aXRoIHRoZSAvZGV2
L3hlbi9wcml2Y21kIGRldmljZQ0KPj4+PiBmb3IgaXNzdWluZyBoeXBlcmNhbGxzIG9uIHVz
ZXJzcGFjZXMgYmVoYWxmLiBXaGF0IGlzIGNvbmZ1c2luZyBpcyB3aHkNCj4+Pj4gdGhlIGZ1
bmN0aW9uIGRvZXMgaXQncyBvd24gbW1hcCAtIG9uZSB3b3VsZCBhc3N1bWUgdGhlIHBhc3Nl
ZCBhZGRyIHdvdWxkDQo+Pj4+IGJlIGFzc29jaWF0ZWQgd2l0aCBhIGFub255bW91cyBvciBm
aWxlIGJhY2tlZCBtbWFwIHJlZ2lvbiBhbHJlYWR5IHRoYXQNCj4+Pj4gdGhlIGNhbGxpbmcg
Y29kZSBoYXMgc2V0dXAuIEFwcGx5aW5nIGEgbW1hcCB0byBhIHNwZWNpYWwgZGV2aWNlIHNl
ZW1zIGENCj4+Pj4gbGl0dGxlIG9kZC4NCj4+Pj4NCj4+Pj4gTG9va2luZyBhdCB0aGUgaW1w
bGVtZW50YXRpb24gb24gdGhlIGtlcm5lbCBzaWRlIGl0IHNlZW1zIHRoZSBtbWFwDQo+Pj4+
IGhhbmRsZXIgb25seSBzZXRzIGEgZmV3IGZsYWdzOg0KPj4+Pg0KPj4+PiAgICAgc3RhdGlj
IGludCBwcml2Y21kX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hKQ0KPj4+PiAgICAgew0KPj4+PiAgICAgICAgICAgICAvKiBET05UQ09QWSBp
cyBlc3NlbnRpYWwgZm9yIFhlbiBiZWNhdXNlIGNvcHlfcGFnZV9yYW5nZSBkb2Vzbid0IGtu
b3cNCj4+Pj4gICAgICAgICAgICAgICogaG93IHRvIHJlY3JlYXRlIHRoZXNlIG1hcHBpbmdz
ICovDQo+Pj4+ICAgICAgICAgICAgIHZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9QRk5N
QVAgfCBWTV9ET05UQ09QWSB8DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Vk1fRE9OVEVYUEFORCB8IFZNX0RPTlREVU1QOw0KPj4+PiAgICAgICAgICAgICB2bWEtPnZt
X29wcyA9ICZwcml2Y21kX3ZtX29wczsNCj4+Pj4gICAgICAgICAgICAgdm1hLT52bV9wcml2
YXRlX2RhdGEgPSBOVUxMOw0KPj4+Pg0KPj4+PiAgICAgICAgICAgICByZXR1cm4gMDsNCj4+
Pj4gICAgIH0NCj4+Pj4NCj4+Pj4gU28gY2FuIEkgY29uZmlybSB0aGF0IHRoZSBtbWFwIG9m
IC9kZXYveGVuL3ByaXZjbWQgaXMgYmVpbmcgY2FsbGVkIGZvcg0KPj4+PiBzaWRlIGVmZmVj
dHM/IElzIGl0IHNvIHdoZW4gdGhlIGFjdHVhbCBpb2N0bCBpcyBjYWxsZWQgdGhlIGNvcnJl
Y3QgZmxhZ3MNCj4+Pj4gYXJlIHNldCBvZiB0aGUgcGFnZXMgYXNzb2NpYXRlZCB3aXRoIHRo
ZSB1c2VyIHNwYWNlIHZpcnR1YWwgYWRkcmVzcw0KPj4+PiByYW5nZT8NCj4+Pj4NCj4+Pj4g
Q2FuIEkgY29uZmlybSB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IGxpbWl0YXRpb24gb24gd2hl
cmUgYW5kIGhvdyB0aGUNCj4+Pj4gdXNlcnNwYWNlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBp
cyBzZXR1cCBmb3IgdGhlIG1hcHBpbmcgaW4gdGhlIGd1ZXN0DQo+Pj4+IG1lbW9yeT8NCj4+
Pj4NCj4+Pj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IHRoaXMgaXNuJ3QgZG9uZSBpbiB0aGUg
aW9jdGwgcGF0aCBpdHNlbGY/DQo+Pg0KPj4gRm9yIGEgcmF0aGVyIGxvbmcgdGltZSB3ZSB3
ZXJlIHVzaW5nICJub3JtYWwiIHVzZXIgcGFnZXMgZm9yIHRoaXMgcHVycG9zZSwNCj4+IHdo
aWNoIHdlcmUganVzdCBsb2NrZWQgaW50byBtZW1vcnkgZm9yIGRvaW5nIHRoZSBoeXBlcmNh
bGwuDQo+IA0KPiBXYXMgdGhpcyB1c2luZyB0aGUgbm9ybWFsIG1sb2NrKCkgc2VtYW50aWNz
IHRvIHN0b3AgcGFnZXMgYmVpbmcgc3dhcHBlZA0KPiBvdXQgb2YgUkFNPw0KDQpUaGUgY29k
ZSBpcyBzdGlsbCBpbiB0b29scy9saWJzL2NhbGwvbGludXguYyBpbiBhbGxvY19wYWdlc19u
b2J1ZmRldigpLA0Kd2hpY2ggaXMgdXNlZCBpZiB0aGUga2VybmVsIGRyaXZlciBkb2Vzbid0
IHN1cHBvcnQgdGhlIHNwZWNpYWwgZGV2aWNlDQpmb3IgdGhlIGtlcm5lbCBtZW1vcnkgbW1h
cCgpLg0KDQo+IA0KPj4gVW5mb3J0dW5hdGVseSB0aGVyZSBoYXZlIGJlZW4gdmVyeSByYXJl
IHByb2JsZW1zIHdpdGggdGhhdCBhcHByb2FjaCwgYXMNCj4+IHRoZSBMaW51eCBrZXJuZWwg
Y2FuIHNldCBhIHVzZXIgcGFnZSByZWxhdGVkIFBURSB0byBpbnZhbGlkIGZvciBzaG9ydA0K
Pj4gcGVyaW9kcyBvZiB0aW1lLCB3aGljaCBsZWQgdG8gRUZBVUxUIGluIHRoZSBoeXBlcnZp
c29yIHdoZW4gdHJ5aW5nIHRvDQo+PiBhY2Nlc3MgdGhlIGh5cGVyY2FsbCBkYXRhLg0KPiAN
Cj4gSSBtdXN0IGFkbWl0IEknbSBub3Qgc3VwZXIgZmFtaWxpYXIgd2l0aCB0aGUgaW50ZXJu
YWxzIG9mIHBhZ2UgdGFibGUNCj4gaGFuZGxpbmcgd2l0aCBMaW51eCtYZW4uIERvZXNuJ3Qg
dGhlIGtlcm5lbCBuZWVkIHRvIGRlbGVnYXRlIHRoZQ0KPiB0d2Vha2luZyBvZiBwYWdlIHRh
YmxlcyB0byB0aGUgaHlwZXJ2aXNvciBvciBpcyBpdCBhbGxvd2VkIHRvIG1hbmlwdWxhdGUN
Cj4gdGhlIHBhZ2UgdGFibGVzIGl0c2VsZj8NCg0KUFYgZG9tYWlucyBuZWVkIHRvIGRvIHBh
Z2UgdGFibGUgbWFuaXB1bGF0aW9ucyB2aWEgdGhlIGh5cGVydmlzb3IsIGJ1dA0KdGhlIGlz
c3VlIHdvdWxkIG9jY3VyIGluIFBWSCBvciBIVk0gZG9tYWlucywgdG9vLg0KDQo+IA0KPj4g
SW4gTGludXggdGhpcyBjYW4gYXZvaWRlZCBvbmx5IGJ5IHVzaW5nIGtlcm5lbCBtZW1vcnks
IHdoaWNoIGlzIHRoZQ0KPj4gcmVhc29uIHdoeSB0aGUgaHlwZXJjYWxsIGJ1ZmZlcnMgYXJl
IGFsbG9jYXRlZCBhbmQgbW1hcCgpLWVkIHRocm91Z2ggdGhlDQo+PiBwcml2Y21kIGRyaXZl
ci4NCj4+DQo+Pj4+DQo+Pj4+IEknbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGUgZGlmZmVy
ZW5jZXMgYmV0d2VlbiBYZW4gYW5kIEtWTSBpbiB0aGUgQVBJDQo+Pj4+IGNob2ljZXMgaGVy
ZS4gSSB0aGluayB0aGUgZXF1aXZhbGVudCBpcyB0aGUgS1ZNX1NFVF9VU0VSX01FTU9SWV9S
RUdJT04NCj4+Pj4gaW9jdGwgZm9yIEtWTSB3aGljaCBicmluZ3MgYSBzZWN0aW9uIG9mIHRo
ZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlDQo+Pj4+IGludG8gdGhlIHVzZXJzcGFj
ZXMgdmFkZHIgcmFuZ2UuDQo+Pg0KPj4gVGhlIG1haW4gZGlmZmVyZW5jZSBpcyBqdXN0IHRo
YXQgdGhlIGNvbnN1bWVyIG9mIHRoZSBoeXBlcmNhbGwgYnVmZmVyIGlzDQo+PiBOT1QgdGhl
IGtlcm5lbCwgYnV0IHRoZSBoeXBlcnZpc29yLiBJbiB0aGUgS1ZNIGNhc2UgYm90aCBhcmUg
dGhlIHNhbWUsIHNvDQo+PiBhIGJyaWVmIHBlcmlvZCBvZiBhbiBpbnZhbGlkIFBURSBjYW4g
YmUgaGFuZGxlZCBqdXN0IGZpbmUgaW4gS1ZNLCB3aGlsZQ0KPj4gdGhlIFhlbiBoeXBlcnZp
c29yIGhhcyBubyBpZGVhIHRoYXQgdGhpcyBzaXR1YXRpb24gd2lsbCBiZSBvdmVyIHZlcnkN
Cj4+IHNvb24uDQo+IA0KPiBJIHN0aWxsIGRvbid0IGZvbGxvdyB0aGUgZGV0YWlscyBvZiB3
aHkgd2UgaGF2ZSB0aGUgc2VwYXJhdGUgbW1hcC4gSXMgaXQNCj4gcHVyZWx5IGJlY2F1c2Ug
dGhlIFZNIGZsYWdzIG9mIHRoZSBzcGVjaWFsIGZpbGUgY2FuIGJlIGNoYW5nZWQgaW4gYSB3
YXkNCj4gdGhhdCBjYW4ndCBiZSBkb25lIHdpdGggYSB0cmFkaXRpb25hbCBmaWxlLWJhY2tl
ZCBtbWFwPw0KDQpZZXMuIFlvdSBjYW4ndCBtYWtlIHRoZSBrZXJuZWwgYmVsaWV2ZSB0aGF0
IGEgdXNlciBwYWdlIGlzIGEga2VybmVsDQpvbmUuIEFuZCBvbmx5IGtlcm5lbCBwYWdlcyBh
cmUgbm90IGFmZmVjdGVkIGJ5IHRoZSBzaG9ydCB0aW1lIFBURQ0KaW52YWxpZGF0aW9uIHdo
aWNoIGNhdXNlZCB0aGUgcHJvYmxlbXMgKHRoaXMgaXMgd2hhdCBJIHdhcyB0b2xkIGJ5DQp0
aGUgZ3V5IG1haW50YWluaW5nIHRoZSBrZXJuZWwncyBtZW1vcnkgbWFuYWdlbWVudCBhdCBT
VVNFKS4NCg0KPiBJIGNhbiBzZWUgdmFyaW91cyBvdGhlciBkZXZpY2VzIGhhdmUgdGhlaXIg
b3duIHNldHRpbmcgb2Ygdm0gZmxhZ3MgYnV0DQo+IFZNX0RPTlRDT1BZIGZvciBleGFtcGxl
IGNhbiBiZSBzZXQgd2l0aCB0aGUgYXBwcm9wcmlhdGUgbWFkdmlzZSBjYWxsOg0KPiANCj4g
ICAgICAgICBNQURWX0RPTlRGT1JLIChzaW5jZSBMaW51eCAyLjYuMTYpDQo+ICAgICAgICAg
ICAgICAgIERvIG5vdCBtYWtlIHRoZSBwYWdlcyBpbiB0aGlzIHJhbmdlIGF2YWlsYWJsZSB0
byB0aGUgY2hpbGQgYWZ0ZXINCj4gICAgICAgICAgICAgICAgYSBmb3JrKDIpLiAgVGhpcyBp
cyB1c2VmdWwgdG8gIHByZXZlbnQgIGNvcHktb24td3JpdGUgIHNlbWFudGljcw0KPiAgICAg
ICAgICAgICAgICBmcm9tICBjaGFuZ2luZyAgdGhlICBwaHlzaWNhbCAgbG9jYXRpb24gIG9m
IGEgcGFnZSBpZiB0aGUgcGFyZW50DQo+ICAgICAgICAgICAgICAgIHdyaXRlcyB0byBpdCBh
ZnRlciBhICBmb3JrKDIpLiAgIChTdWNoICBwYWdlICByZWxvY2F0aW9ucyAgY2F1c2UNCj4g
ICAgICAgICAgICAgICAgcHJvYmxlbXMgZm9yIGhhcmR3YXJlIHRoYXQgRE1BcyBpbnRvIHRo
ZSBwYWdlLikNCj4gDQo+IEZvciB0aGUgdmhvc3QtdXNlciB3b3JrIHdlIG5lZWQgdG8gYmUg
YWJsZSB0byBzaGFyZSB0aGUgZ3Vlc3QgbWVtb3J5DQo+IGJldHdlZW4gdGhlIHhlbi12aG9z
dC1tYXN0ZXIgKHdoaWNoIGlzIGRvaW5nIHRoZSBpb2N0bHMgdG8gdGFsayB0byBYZW4pDQo+
IGFuZCB0aGUgdmhvc3QtdXNlciBkYWVtb24gKHdoaWNoIGRvZXNuJ3Qga25vdyBhYm91dCBo
eXBlcnZpc29ycyBidXQganVzdA0KPiBkZWFscyBpbiBtZW1vcnkgYW5kIGV2ZW50cykuDQoN
ClRoZSBwcm9ibGVtIGlzIHJlYWxseSBvbmx5IHdpdGggdGhlIGh5cGVydmlzb3IgdHJ5aW5n
IHRvIGFjY2VzcyBhDQpkb21haW4ncyBidWZmZXIgdmlhIGEgZG9tYWluIHZpcnR1YWwgbWVt
b3J5IGFkZHJlc3MuIEl0IGhhcyBub3RoaW5nDQp0byBkbyB3aXRoIG1hcHBpbmcgb3RoZXIg
ZG9tYWluJ3MgbWVtb3J5IGluIGEgZG9tYWluLg0KDQo+IFdvdWxkIGl0IGJlIGVub3VnaCB0
byBsb29zZW4gdGhlIEFQSSBhbmQganVzdCBoYXZlIHhlbl9yZW1hcF9wZm4oKQ0KPiB2ZXJp
ZnkgdGhlIGtlcm5lbHMgVk0gZmxhZ3MgYXJlIGFwcHJvcHJpYXRlbHkgc2V0IGJlZm9yZSBy
ZXF1ZXN0aW5nIFhlbg0KPiB1cGRhdGVzIHRoZSBwYWdlIHRhYmxlcz8NCg0KSSBkb24ndCB0
aGluayB5b3UgaGF2ZSB0byBjaGFuZ2UgYW55dGhpbmcgZm9yIHRoYXQuDQoNCg0KSnVlcmdl
bg0K
--------------w0TlHFC4N0K3RQhFFRTx5Fse
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------w0TlHFC4N0K3RQhFFRTx5Fse--

--------------Bwfd4Y0krBnyaae5jYj8qAF0--

--------------30v9tizF2cZDQr750Qi0xppF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJBVQUFAwAAAAAACgkQsN6d1ii/Ey9H
agf/fs4btlMkeMyxC9gYT0ryGp/g5KpuIxdnndNtsi1j/S3WheHrCmw7LW8IymSHQQw12c5obISs
o0aCXPe5njWetbeBrdQE2GdXAhvixwi+Zf3MXGXBD+FGyb7JN5N7lDCK8IDFMUtxMWFpwJlZ0Edr
/MpvHnenashsJs+uKDOeT3Jiphzs+7rn1J6dGWn35/VfLZLMECSQee5JneshBkCOHlQ/9emz6rpz
O4fSutOImDD/rNdQRHzFJotLux/MWJZz74nANJK713UTHqgb45s7gp+lXX99A0okxmNtISRuWLiW
XD8TXbEsKvlv2INOdwkuHNojL/vC9wsIHR1ezTQuQw==
=EV2W
-----END PGP SIGNATURE-----

--------------30v9tizF2cZDQr750Qi0xppF--

