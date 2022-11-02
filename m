Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD1615E8D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 09:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435670.689328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9aL-0001pd-BY; Wed, 02 Nov 2022 08:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435670.689328; Wed, 02 Nov 2022 08:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9aL-0001nF-8X; Wed, 02 Nov 2022 08:58:57 +0000
Received: by outflank-mailman (input) for mailman id 435670;
 Wed, 02 Nov 2022 08:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O20d=3C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oq9aJ-0001n8-Qm
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 08:58:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93cf6ccc-5a8c-11ed-91b5-6bf2151ebd3b;
 Wed, 02 Nov 2022 09:58:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE9CA225DC;
 Wed,  2 Nov 2022 08:58:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 539C8139D3;
 Wed,  2 Nov 2022 08:58:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mxTmEk0xYmPmHAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 02 Nov 2022 08:58:53 +0000
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
X-Inumbo-ID: 93cf6ccc-5a8c-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667379533; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x32TTSXhwza5c7baqBgiOCbV2AXnegIHoi3AjHskP0Y=;
	b=Y65T1xmuEky7XtQo065WDHNFG2bBmcNcA8SMKwV1flVuA8gBCT+23xawrwdHDo2Cusu2o5
	lLsU541qCRsQhS2QljZneSMuXIwQTWpyJv01vGycSSHSPT22WU19Kcdeh0P3JcdTQXeIrs
	KhD4j7db0e+tgEimRCX+CNN+nsEQzZ8=
Message-ID: <e5a22545-ce22-87a1-63b6-6b3ffa3f68ed@suse.com>
Date: Wed, 2 Nov 2022 09:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
 <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
 <Y2E05RLmXRIR6heO@mattapan.m5p.com>
 <947E315E-6537-48DC-8AC6-5218C12B604C@arm.com>
 <Y2GAwKsmx9f39p+Y@mattapan.m5p.com>
 <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IfVgbINxJkhComWf6T80Q9Je"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IfVgbINxJkhComWf6T80Q9Je
Content-Type: multipart/mixed; boundary="------------bKqdsL0ifYJIOn5PfF7fOG5X";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Elliott Mitchell <ehem+xen@m5p.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e5a22545-ce22-87a1-63b6-6b3ffa3f68ed@suse.com>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
References: <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
 <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
 <alpine.DEB.2.22.394.2210302148150.3408@ubuntu-linux-20-04-desktop>
 <9F323893-B1C9-4D31-9A40-213345421860@arm.com>
 <Y2E05RLmXRIR6heO@mattapan.m5p.com>
 <947E315E-6537-48DC-8AC6-5218C12B604C@arm.com>
 <Y2GAwKsmx9f39p+Y@mattapan.m5p.com>
 <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>
In-Reply-To: <FB140BBA-B27D-413D-84C6-B75D66218413@arm.com>

--------------bKqdsL0ifYJIOn5PfF7fOG5X
Content-Type: multipart/mixed; boundary="------------z6Uogb5YoIpOS7nT1iS9sxHW"

--------------z6Uogb5YoIpOS7nT1iS9sxHW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMTEuMjIgMDk6NTAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+IEhpIEVsbGlv
dHQsDQo+IA0KPj4gT24gMSBOb3YgMjAyMiwgYXQgMjA6MjUsIEVsbGlvdHQgTWl0Y2hlbGwg
PGVoZW0reGVuQG01cC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIFR1ZSwgTm92IDAxLCAyMDIy
IGF0IDA0OjMwOjMxUE0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4NCj4+
Pj4gT24gMSBOb3YgMjAyMiwgYXQgMTU6MDEsIEVsbGlvdHQgTWl0Y2hlbGwgPGVoZW0reGVu
QG01cC5jb20+IHdyb3RlOg0KPj4+Pg0KPj4+PiBPbiBNb24sIE9jdCAzMSwgMjAyMiBhdCAw
MToyNjo0NFBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+
PiBPbiAzMCBPY3QgMjAyMiwgYXQgMjE6MTQsIFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+Pj4+Pj4NCj4+Pj4+PiBJZGVhbGx5IHRoaXMg
d291bGQgYmUgc29tZXRoaW5nIHF1aWNrIHRoYXQgY2FuIGJlIGVhc2lseSBpbnZva2VkIGFz
IHRoZQ0KPj4+Pj4+IGZpcnN0IHN0ZXAgb2YgYW4gZXh0ZXJuYWwgdGhpcmQtcGFydHkgYnVp
bGQgcHJvY2Vzcy4NCj4+Pj4+DQo+Pj4+PiBJIHRoaW5rIHRoYXQgd2UgYXJlIG1ha2luZyB0
aGlzIHByb2JsZW0gYSBsb3QgdG8gY29tcGxleCBhbmQgSSBhbSBub3Qgc3VyZQ0KPj4+Pj4g
dGhhdCBhbGwgdGhpcyBjb21wbGV4aXR5IGlzIHJlcXVpcmVkLg0KPj4+Pg0KPj4+PiBTcGVh
a2luZyBvZiBjb21wbGV4aXR5LiAgSXMgaXQganVzdCBtZSBvciBkb2VzIGEgdklPTU1VIGhh
ZCBhbiBvZGQgc29ydA0KPj4+PiBvZiBzaW1pbGFyaXR5IHdpdGggYSBHcmFudCBUYWJsZT8N
Cj4+Pj4NCj4+Pj4gQm90aCBhcmUgYWJvdXQgYWxsb3dpbmcgZm9yZWlnbiBlbnRpdGllcyBh
Y2Nlc3MgdG8gcG9ydGlvbnMgb2YgdGhlDQo+Pj4+IGN1cnJlbnQgZG9tYWluJ3MgbWVtb3J5
LiAgSnVzdCBpbiB0aGUgY2FzZSBvZiBhIEdyYW50IFRhYmxlIHRoZSBlbnRpdHkNCj4+Pj4g
aGFwcGVucyB0byBiZSBhbm90aGVyIGRvbWFpbiwgd2hlcmVhcyBmb3IgYSB2SU9NTVUgaXQg
aXMgYSBoYXJkd2FyZQ0KPj4+PiBkZXZpY2UuDQo+Pj4+DQo+Pj4+IFBlcmhhcHMgc29tZSBm
dW5jdGlvbmFsaXR5IGNvdWxkIGJlIHNoYXJlZCBiZXR3ZWVuIHRoZSB0d28/ICBQZXJoYXBz
DQo+Pj4+IHRoaXMgaXMgc29tZXRoaW5nIGZvciB0aGUgZGVzaWduZXIgb2YgdGhlIG5leHQg
dmVyc2lvbiBvZiBJT01NVSB0byB0aGluaw0KPj4+PiBhYm91dD8gIChvciBwZXJoYXBzIEkn
bSBvZmYgdGhlIGRlZXAgZW5kIGFuZCBicmluZ2luZyBpbiBhIHNpbGx5IGlkZWEpDQo+Pj4N
Cj4+PiBJIGFtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgeW91IG1lYW4gaGVyZS4NCj4+Pg0KPj4+
IFRoZSBJT01NVSBpcyBzb21ldGhpbmcgbm90IFhlbiBzcGVjaWZpYy4gTGludXggaXMgdXNp
bmcgaXQgdG8gcmVzdHJpY3QgdGhlIGFyZWENCj4+PiBvZiBtZW1vcnkgYWNjZXNzaWJsZSB0
byBhIGRldmljZSB1c2luZyBpdHMgRE1BIGVuZ2luZS4gSGVyZSB3ZSBqdXN0IHRyeSB0byBn
aXZlDQo+Pj4gdGhlIHNhbWUgcG9zc2liaWxpdHkgd2hlbiBydW5uaW5nIG9uIHRvcCBYZW4g
aW4gYSB0cmFuc3BhcmVudCB3YXkgc28gdGhhdCB0aGUNCj4+PiBMaW51eCAob3IgYW4gb3Ro
ZXIgZ3Vlc3QpIGNhbiBjb250aW51ZSB0byBkbyB0aGUgc2FtZSBldmVuIGlmIGl0IGlzIHJ1
bm5pbmcgb24NCj4+PiB0b3Agb2YgWGVuLg0KPj4+IEluIHByYWN0aWNlLCB0aGUgZ3Vlc3Qg
aXMgbm90IHRlbGxpbmcgdXMgd2hhdCBpdCBkb2VzLCB3ZSBqdXN0IGdldCB0aGUgcG9pbnRl
ciB0byB0aGUNCj4+PiBmaXJzdCBsZXZlbCBvZiBwYWdlIHRhYmxlIGFuZCB3ZSB3cml0ZSBp
dCBpbiB0aGUgaGFyZHdhcmUgd2hpY2ggaXMgZG9pbmcgdGhlIHJlc3QuDQo+Pj4gV2UgbmVl
ZCB0byBoYXZlIGEgdklPTU1VIGJlY2F1c2Ugd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGd1
ZXN0IGlzIG9ubHkNCj4+PiBkb2luZyB0aGlzIGZvciBkZXZpY2VzIGFzc2lnbmVkIHRvIGhp
bSBhbmQgdGhhdCBpdCBpcyBub3QgbW9kaWZ5aW5nIHRoZSBzZWNvbmQNCj4+PiBsZXZlbCBv
ZiBwYWdlIHRhYmxlcyB3aGljaCBpcyB1c2VkIGJ5IFhlbiB0byBtYWtlIHN1cmUgdGhhdCBv
bmx5IHRoZSBtZW1vcnkNCj4+PiBmcm9tIHRoZSBndWVzdCBpcyBhY2Nlc3NpYmxlIHVzaW5n
IHRoZSBETUEgZW5naW5lLg0KPj4+DQo+Pj4gU28gSSBhbSBub3QgZXhhY3RseSBzZWVpbmcg
dGhlIGNvbW1vbiBwYXJ0IHdpdGggZ3JhbnQgdGFibGVzIGhlcmUuDQo+Pg0KPj4gV2l0aCBH
cmFudCBUYWJsZXMsIG9uZSBkb21haW4gaXMgYWxsb2NhdGluZyBwYWdlcyBhbmQgdGhlbiBh
bGxvd2luZw0KPj4gYW5vdGhlciBkb21haW4gdG8gcmVhZCBhbmQgcG90ZW50aWFsbHkgd3Jp
dGUgdG8gdGhlbS4gIFdoYXQgaXMgYmVpbmcNCj4+IGdpdmVuIHRvIFhlbiBpcyB0aGUgdHVw
bGUgb2YgcGFnZSBhZGRyZXNzIGFuZCBvdGhlciBkb21haW4uDQo+IA0KPiBXaXRoIHRoZSBJ
T01NVSB3ZSBkbyBub3QgZ2V0IHRvIHRoYXQgaW5mb3JtYXRpb24sIHdlIG9ubHkgZ2V0IHRo
ZSBmaXJzdCBsZXZlbCBvZg0KPiBwYWdlIHRhYmxlIHBvaW50ZXIgYW5kIHRoZSBoYXJkd2Fy
ZSBpcyBkb2luZyB0aGUgcmVzdCwgcHJvdGVjdGluZyB0aGUgYWNjZXNzDQo+IHVzaW5nIHRo
ZSBzZWNvbmQgbGV2ZWwgb2YgcGFnZSB0YWJsZXMgaGFuZGxlZCBieSBYZW4uDQo+IA0KPj4N
Cj4+IFdpdGggdGhlIG1vZGVsIHByZXNlbnRseSBiZWluZyBkaXNjdXNzZWQgeW91IHdvdWxk
IGhhdmUgYSB2SU9NTVUgZm9yIGVhY2gNCj4+IG90aGVyIGRvbWFpbi4gIFRoZSB0aGUgcGFn
ZXMgYWNjZXNzIGlzIGJlaW5nIGdyYW50ZWQgdG8gYXJlIHRoZSBwYWdlcw0KPj4gYmVpbmcg
ZW50ZXJlZCBpbnRvIHRoZSB2SU9NTVUgcGFnZSB0YWJsZS4NCj4gDQo+IFdoaWNoIFhlbiBk
b2VzIG5vdCBjaGVjay4NCj4gDQo+Pg0KPj4gQWxsb2NhdGUgYSBkb21haW4gSWQgdG8gZWFj
aCBJT01NVSBkb21haW4gYW5kIHRoaXMgdmVyeSBtdWNoIHNlZW1zIHF1aXRlDQo+PiBzaW1p
bGFyIHRvIFhlbidzIGdyYW50IHRhYmxlcy4gIEknbSB1bnN1cmUgdGhlIHR3byBjYW4gYmUg
dW5pZmllZCwgYnV0DQo+PiB0aGV5IGFwcGVhciB0byBoYXZlIG1hbnkgY29tbW9uIGFzcGVj
dHMuDQo+IA0KPj5Gcm9tIGFuIGhpZ2ggbGV2ZWwgcG9pbnQgb2YgdmlldyBpdCBtaWdodCBi
dXQgZnJvbSB0aGUgZ3Vlc3QgcG9pbnQgb2YgdmlldyB0aGUNCj4gSU9NTVUgaXMgc29tZXRo
aW5nIHVzZWQgd2l0aCBvciB3aXRob3V0IFhlbiB3aGVyZSBncmFudCB0YWJsZXMgYXJlIHZl
cnkNCj4gc3BlY2lmaWMgdG8gWGVuLiBJIGRvIG5vdCBzZWUgYW55dGhpbmcgdGhhdCBjb3Vs
ZCBiZSB1bmlmaWVkIHRoZXJlLg0KPiANCj4gTWF5YmUgSSBhbSBtaXNzaW5nIHNvbWV0aGlu
ZyBoZXJlIHRoYXQgb3RoZXIgY291bGQgc2VlIHRob3VnaCA6LSkNCg0KWW91IG1pZ2h0IHdh
bnQgdG8gaGF2ZSBhIGxvb2sgYXQgbXkgIkdyYW50IHRhYmxlIFYzIiBkZXNpZ24gc2Vzc2lv
biBhdCB0aGUNClhlbiBTdW1taXQgdGhpcyB5ZWFyOg0KDQpodHRwczovL2xpc3RzLnhlbi5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMi0wOS9tc2cwMTQyOS5odG1sDQoNCg0K
SnVlcmdlbg0KDQo=
--------------z6Uogb5YoIpOS7nT1iS9sxHW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------z6Uogb5YoIpOS7nT1iS9sxHW--

--------------bKqdsL0ifYJIOn5PfF7fOG5X--

--------------IfVgbINxJkhComWf6T80Q9Je
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNiMUwFAwAAAAAACgkQsN6d1ii/Ey+n
Zgf/dF9X26FL59JQ7t+VJVI6bjtLKaMEYiLK7zhHXtRU+i4IbmQkMZvdb8muv6M6YnZXEWtIfjOO
NVQErbNM/WSHA9ZEe2JxSegIGsN9g5VC+yEE9yKo2wsyTYdGJJU4+eB1dKRzbTYOX4siGaO2/a/1
Z+QO/daVOdGQa4YF610V5LiLkzPS+8ceDnTkrhD52bq349Dl6VdkbYxJ1W7hBj29n4RLxQIFOMxR
Zhe94/seuKNAvs6YL4zZVEXIRxDAMJoHci+TFzcW0jp1vJNekNfg11oLA943av6yV/GjuLA77zFY
2ST0qH0Y3Ur69D2bOKBMVH8ycWn+lOPvMPyvK249cA==
=4N0q
-----END PGP SIGNATURE-----

--------------IfVgbINxJkhComWf6T80Q9Je--

