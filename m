Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71D4B8847
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 13:56:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274108.469461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJq7-0006zI-LT; Wed, 16 Feb 2022 12:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274108.469461; Wed, 16 Feb 2022 12:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJq7-0006wy-I6; Wed, 16 Feb 2022 12:55:23 +0000
Received: by outflank-mailman (input) for mailman id 274108;
 Wed, 16 Feb 2022 12:55:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKJq6-0006ws-5q
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 12:55:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b27dde24-8f27-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 13:55:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1227E21763;
 Wed, 16 Feb 2022 12:55:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A81E313B0A;
 Wed, 16 Feb 2022 12:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p5VhJzf0DGJdXQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 12:55:19 +0000
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
X-Inumbo-ID: b27dde24-8f27-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645016120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQJ/FOU/OBDzBQ+DP+YdrS+fYXTN4ezvR/yaqHC6IvA=;
	b=DFLfUIrclvvPh1dbgiYpo0xcIHCuk5GAaAwP7yrmc3sFYCRSa+iimv7BNbfi2rSPywD387
	YP7kTbdER7DtQtXjy16OVCAfej3GNtW0Ayh/RAc9Lwx9Hw6LQ1xMCvOEeSKVgCcUhWKmYR
	mMxvd4yMP9HzfRg0KPH2CnMLBCnJMsU=
Message-ID: <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
Date: Wed, 16 Feb 2022 13:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
 <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------alQ9vdTNmDSPU8J1MtfNMirk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------alQ9vdTNmDSPU8J1MtfNMirk
Content-Type: multipart/mixed; boundary="------------2djNK4009U0uLsNdoMD4Iix4";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
 <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
In-Reply-To: <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>

--------------2djNK4009U0uLsNdoMD4Iix4
Content-Type: multipart/mixed; boundary="------------fUaRchlecyt3jRs9acd9w00e"

--------------fUaRchlecyt3jRs9acd9w00e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDIuMjIgMTM6MTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDE2IEZlYiAyMDIyLCBhdCAwMjo0NSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPiB3cm90ZToNCj4+DQo+PiBPbiBUdWUsIDE1IEZlYiAyMDIyLCBMdWNh
IEZhbmNlbGx1IHdyb3RlOg0KPj4+IEludHJvZHVjZSBhbiBhcmNoaXRlY3R1cmUgc3BlY2lm
aWMgd2F5IHRvIGNyZWF0ZSBkaWZmZXJlbnQgY3B1cG9vbHMNCj4+PiBhdCBib290IHRpbWUs
IHRoaXMgaXMgcGFydGljdWxhcmx5IHVzZWZ1bCBvbiBBUk0gYmlnLkxJVFRMRSBzeXN0ZW0N
Cj4+PiB3aGVyZSB0aGVyZSBtaWdodCBiZSB0aGUgbmVlZCB0byBoYXZlIGRpZmZlcmVudCBj
cHVwb29scyBmb3IgZWFjaCB0eXBlDQo+Pj4gb2YgY29yZSwgYnV0IGFsc28gc3lzdGVtcyB1
c2luZyBOVU1BIGNhbiBoYXZlIGRpZmZlcmVudCBjcHUgcG9vbHMgZm9yDQo+Pj4gZWFjaCBu
b2RlLg0KPj4+DQo+Pj4gVGhlIGZlYXR1cmUgb24gYXJtIHJlbGllcyBvbiBhIHNwZWNpZmlj
YXRpb24gb2YgdGhlIGNwdXBvb2xzIGZyb20gdGhlDQo+Pj4gZGV2aWNlIHRyZWUgdG8gYnVp
bGQgcG9vbHMgYW5kIGFzc2lnbiBjcHVzIHRvIHRoZW0uDQo+Pj4NCj4+PiBEb2N1bWVudGF0
aW9uIGlzIGNyZWF0ZWQgdG8gZXhwbGFpbiB0aGUgZmVhdHVyZS4NCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+PiAt
LS0NCj4+PiBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dCB8IDExOCAr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4geGVuL2FyY2gvYXJtL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgfCAgIDkgKysNCj4+PiB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICB8ICAgMSArDQo+Pj4geGVuL2FyY2gvYXJtL2NwdXBvb2wuYyAgICAg
ICAgICAgICAgICAgfCAxMTggKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+IHhlbi9j
b21tb24vc2NoZWQvY3B1cG9vbC5jICAgICAgICAgICAgIHwgICA0ICstDQo+Pj4geGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgICAgfCAgMTEgKysrDQo+Pj4gNiBmaWxl
cyBjaGFuZ2VkLCAyNjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dA0K
Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vY3B1cG9vbC5jDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9jcHVwb29scy50eHQg
Yi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dA0KPj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi43Mjk4YjYzOTQzMzINCj4+
PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9j
cHVwb29scy50eHQNCj4+PiBAQCAtMCwwICsxLDExOCBAQA0KPj4+ICtCb290IHRpbWUgY3B1
cG9vbHMNCj4+PiArPT09PT09PT09PT09PT09PT09DQo+Pj4gKw0KPj4+ICtPbiBhcm0sIHdo
ZW4gQk9PVF9USU1FX0NQVVBPT0xTIGlzIGVuYWJsZWQgaW4gdGhlIFhlbiBjb25maWd1cmF0
aW9uLCBpdCBpcw0KPj4+ICtwb3NzaWJsZSB0byBjcmVhdGUgY3B1cG9vbHMgZHVyaW5nIGJv
b3QgcGhhc2UgYnkgc3BlY2lmeWluZyB0aGVtIGluIHRoZSBkZXZpY2UNCj4+PiArdHJlZS4N
Cj4+PiArDQo+Pj4gK0NwdXBvb2xzIHNwZWNpZmljYXRpb24gbm9kZXMgc2hhbGwgYmUgZGly
ZWN0IGNoaWxkcyBvZiAvY2hvc2VuIG5vZGUuDQo+Pj4gK0VhY2ggY3B1cG9vbCBub2RlIGNv
bnRhaW5zIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoNCj4+PiArDQo+Pj4gKy0gY29tcGF0
aWJsZSAobWFuZGF0b3J5KQ0KPj4+ICsNCj4+PiArICAgIE11c3QgYWx3YXlzIGluY2x1ZGUg
dGhlIGNvbXBhdGlibGl0eSBzdHJpbmc6ICJ4ZW4sY3B1cG9vbCIuDQo+Pj4gKw0KPj4+ICst
IGNwdXBvb2wtaWQgKG1hbmRhdG9yeSkNCj4+PiArDQo+Pj4gKyAgICBNdXN0IGJlIGEgcG9z
aXRpdmUgaW50ZWdlciBudW1iZXIuDQo+Pg0KPiANCj4gSGkgU3RlZmFubywNCj4gDQo+IFRo
YW5rIHlvdSBmb3IgeW91ciByZXZpZXcsDQo+IA0KPj4gV2h5IGlzIGNwdXBvb2wtaWQgbWFu
ZGF0b3J5PyBJdCBsb29rcyBsaWtlIGl0IGNvdWxkIGJlIGdlbmVyYXRlZCBieSBYZW4uDQo+
PiBPciBpcyBpdCBhY3R1YWxseSBiZXR0ZXIgdG8gaGF2ZSB0aGUgdXNlciBzcGVjaWZ5IGl0
IGFueXdheT8NCj4+DQo+IA0KPiBZZXMgYXQgZmlyc3QgSSB0aG91Z2h0IHRvIGF1dG9tYXRp
Y2FsbHkgZ2VuZXJhdGUgdGhhdCwgaG93ZXZlciBJIG5lZWRlZCBhIHN0cnVjdHVyZQ0KPiB0
byBtYXAgdGhlIGlkIHRvIHRoZSBjcHVwb29sIERUIG5vZGUuIEhlcmUgbXkgZG91YnQgd2Fz
IGFib3V0IHRoZSBzaXplIG9mIHRoZQ0KPiBzdHJ1Y3R1cmUsIGJlY2F1c2UgdGhlIHVzZXIg
Y291bGQgZXZlbiBzcGVjaWZ5IGEgY3B1cG9vbCBmb3IgZWFjaCBjcHUuIEkgY291bGQgYWxs
b2NhdGUNCj4gSXQgZHluYW1pY2FsbHkgYW5kIGZyZWUgaXQgYWZ0ZXIgZG9tVXMgY3JlYXRp
b24gaW4gc2V0dXBfeGVuLg0KPiBXaGF0IGRvIHlvdSB0aGluayBjb3VsZCBiZSB0aGUgcmln
aHQgd2F5Pw0KPiBPciB0aGUgZG9tMGxlc3MgZ3Vlc3QgY291bGQgc3BlY2lmeSB0aGUgaWQs
IGJ1dCBJIGxpa2UgaXQgbW9yZSB3aGVuIHVzaW5nIGEgcGhhbmRsZSB0byB0aGUNCj4gWGVu
LGNwdXBvb2wgbm9kZS4NCj4gDQo+Pg0KPj4+ICstIGNwdXBvb2wtY3B1cyAobWFuZGF0b3J5
KQ0KPj4+ICsNCj4+PiArICAgIE11c3QgYmUgYSBsaXN0IG9mIGRldmljZSB0cmVlIHBoYW5k
bGUgdG8gbm9kZXMgZGVzY3JpYmluZyBjcHVzIChlLmcuIGhhdmluZw0KPj4+ICsgICAgZGV2
aWNlX3R5cGUgPSAiY3B1IiksIGl0IGNhbid0IGJlIGVtcHR5Lg0KPj4+ICsNCj4+PiArLSBj
cHVwb29sLXNjaGVkIChvcHRpb25hbCkNCj4+PiArDQo+Pj4gKyAgICBNdXN0IGJlIGEgc3Ry
aW5nIGhhdmluZyB0aGUgbmFtZSBvZiBhIFhlbiBzY2hlZHVsZXIsIGl0IGhhcyBubyBlZmZl
Y3Qgd2hlbg0KPj4+ICsgICAgdXNlZCBpbiBjb25qdW5jdGlvbiBvZiBhIGNwdXBvb2wtaWQg
ZXF1YWwgdG8gemVybywgaW4gdGhhdCBjYXNlIHRoZQ0KPj4+ICsgICAgZGVmYXVsdCBYZW4g
c2NoZWR1bGVyIGlzIHNlbGVjdGVkIChzY2hlZD08Li4uPiBib290IGFyZ3VtZW50KS4NCj4+
DQo+PiBJIGRvbid0IGdldCB3aHkgY3B1cG9vbC1pZCA9PSAwIHNob3VsZCB0cmlnZ2VyIGEg
c3BlY2lhbCBjcHVwb29sLXNjaGVkDQo+PiBiZWhhdmlvci4NCj4gDQo+IENwdXBvb2wgd2l0
aCBpZCAwIGlzIGVtYmVkZGVkIGluIFhlbiwgaXQgaGFzIGl0cyBvd24gc3BlY2lhbCBjYXNl
IGhhbmRsaW5nIGluIGNwdXBvb2xfY3JlYXRlDQo+IHRoYXQgaXMgZ2l2aW5nIGl0IHRoZSBk
ZWZhdWx0IHNjaGVkdWxlci4gSSB0aG91Z2h0IGl0IHdhcyBiZXR0ZXIgdG8gbGVhdmUgaXQg
YXMgaXQgd2FzLCBob3dldmVyIHRoZQ0KPiBjcHVwb29sMCBzY2hlZHVsZXIgY2FuIGJlIG1v
ZGlmaWVkIHVzaW5nIHNjaGVkPSBib290IGFyZ3MgYXMgaXQgd2FzIGJlZm9yZS4NCj4gDQo+
Pg0KPj4NCj4+PiArQ29uc3RyYWludHMNCj4+PiArPT09PT09PT09PT0NCj4+PiArDQo+Pj4g
K1RoZSBjcHVwb29sIHdpdGggaWQgemVybyBpcyBpbXBsaWNpdGx5IGNyZWF0ZWQgZXZlbiBp
ZiBub3Qgc3BlY2lmaWVkLCB0aGF0IHBvb2wNCj4+PiArbXVzdCBoYXZlIGF0IGxlYXN0IG9u
ZSBjcHUgYXNzaWduZWQsIG90aGVyd2lzZSBYZW4gd2lsbCBzdG9wLg0KPj4+ICsNCj4+PiAr
RXZlcnkgY3B1IGJyb3VnaHQgdXAgYnkgWGVuIHdpbGwgYmUgYXNzaWduZWQgdG8gdGhlIGNw
dXBvb2wgd2l0aCBpZCB6ZXJvIGlmIGl0J3MNCj4+PiArbm90IGFzc2lnbmVkIHRvIGFueSBv
dGhlciBjcHVwb29sLg0KPj4+ICsNCj4+PiArSWYgYSBjcHUgaXMgYXNzaWduZWQgdG8gYSBj
cHVwb29sLCBidXQgaXQncyBub3QgYnJvdWdodCB1cCBjb3JyZWN0bHksIFhlbiB3aWxsDQo+
Pj4gK3N0b3AuDQo+Pg0KPj4gVGhhbmsgeW91IGZvciBkb2N1bWVudGluZyB0aGUgY29uc3Ry
YWludHMsIGJ1dCB3aHkgZG8gd2UgaGF2ZSB0aGVtPw0KPj4gSW1hZ2luZSBhIHVzZXIgc3Bl
Y2lmeWluZyAzIGNwdSBwb29scyBhbmQgaW1hZ2luZSB0aGUgY3B1cG9vbC1pZCBpcw0KPj4g
b3B0aW9uYWwgYW5kIG1pc3NpbmcuIFdlIGNvdWxkIHRha2UgY2FyZSBvZiB0aGUgY3B1cG9v
bC1pZCBnZW5lcmF0aW9uIGluDQo+PiBYZW4gYW5kIHdlIGNvdWxkIGFsc28gYXNzaWduIHRo
ZSBkZWZhdWx0IHNjaGVkdWxlciBldmVyeXdoZXJlDQo+PiBjcHVwb29sLXNjaGVkIGlzIG5v
dCBzcGVjaWZpZWQuIE1heWJlIEkgYW0gbWlzc2luZyBzb21ldGhpbmc/DQo+IA0KPiBZZXMg
d2UgY291bGQgbWFrZSB0aGUgY3B1cG9vbC1pZCBvcHRpb25hbCwgbXkgZG91YnRzIGFyZSBp
biB0aGUgZmlzdCBjb21tZW50IGFib3ZlLg0KPiBXaGVuZXZlciB0aGUgY3B1cG9vbC1zY2hl
ZCBpcyBub3Qgc3BlY2lmaWVkLCB0aGUgY3VycmVudCBiZWhhdmlvdXIgaXMgdG8gdXNlIHRo
ZSBkZWZhdWx0IHNjaGVkdWxlci4NCj4gDQo+Pg0KPj4gRG9lcyBjcHVwb29sMCBoYXMgdG8g
ZXhpc3Q/IEkgZ3Vlc3MgdGhlIGFuc3dlciBjb3VsZCBiZSB5ZXMsIGJ1dCBpZiBpdA0KPj4g
aXMgc3BlY2lmaWVkIGFzIGlkIG9mIG9uZSBvZiB0aGUgcG9vbHMgd2UgYXJlIGZpbmUsIG90
aGVyd2lzZSBpdCBjb3VsZA0KPj4gYmUgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgYnkgWGVu
Lg0KPiANCj4gWWVzIGNwdXBvb2wwIG5lZWRzIHRvIGV4aXN0cywgaG93ZXZlciBpdCBpcyBz
dGlsbCBnZW5lcmF0ZWQgYnkgWGVuIHJlZ2FyZGxlc3Mgb2YgdGhlIERUDQo+IHNwZWNpZmlj
YXRpb25zLiBJbiBmYWN0IHlvdSBjb3VsZCBub3Qgc3BlY2lmeSBpbiB0aGUgRFQgYW55IHhl
bixjcHVwb29sIGNvbXBhdGlibGUgbm9kZQ0KPiB3aXRoIHRoZSBjcHVwb29sLWlkID09IDAg
YW5kIFhlbiB3aWxsIGdlbmVyYXRlIHRoZSBjcHVwb29sMCBhbnl3YXkNCj4gKFhlbiBpbnRl
cm5hbHMgYXJlIHRpZWQgd2l0aCB0aGUgZXhpc3RlbmNlIG9mIGEgY3B1cG9vbDApLg0KPiAN
Cj4+DQo+PiBJbiBhbnkgY2FzZSwgSSBkb24ndCB0aGluayB0aGF0IGNwdXBvb2wwIGhhcyB0
byBoYXZlIHRoZSBkZWZhdWx0DQo+PiBzY2hlZHVsZXI/DQo+IA0KPiBPayBJIHRoaW5rIEkg
Y2FuIGNyZWF0ZSBhIGZ1bmN0aW9uIHRvIGFzc2lnbiBhIHNjaGVkdWxlciB0byB0aGUgY3B1
cG9vbDAgYWZ0ZXIgaXRzIGNyZWF0aW9uLA0KPiBJIHdvdWxkIG5lZWQgdG8gdGVzdCBpdCB0
byBiZSBzdXJlIEkgZG9u4oCZdCBmaW5kIHNvbWV0aGluZyBzdHJhbmdlLg0KPiANCj4+DQo+
PiBNeSBzdWdnZXN0aW9uIHdvdWxkIGJlOg0KPj4NCj4+IC0gbWFrZSBjcHVwb29sLWlkIG9w
dGlvbmFsDQo+PiAtIGFzc2lnbiBhdXRvbWF0aWNhbGx5IGNwdXBvb2wtaWRzIHN0YXJ0aW5n
IGZyb20gMA0KPj4gICAgIC0gcmVzcGVjdCBjcHVwb29sLWlkcyBjaG9zZW4gYnkgdGhlIHVz
ZXINCj4gDQo+IE9rLCBpdCB3b3VsZCBzdGFydCBmcm9tIDEgYmVjYXVzZSBjcHVwb29sMCBh
bHdheXMgZXhpc3RzDQo+IA0KPj4gLSBpZiBzb21lIENQVXMgYXJlIGxlZnQgb3V0IChub3Qg
c3BlY2lmaWVkIGluIGFueSBwb29sKSBhZGQgYW4gZXh0cmEgY3B1cG9vbA0KPj4gICAgIC0g
dGhlIGV4dHJhIGNwdXBvb2wgZG9lc24ndCBoYXZlIHRvIGJlIGNwdXBvb2wtaWQgPT0gMCwg
aXQgY291bGQgYmUNCj4+ICAgICAgIGNwdXBvb2wtaWQgPT0gbg0KPj4gICAgIC0gdGhlIGV4
dHJhIGNwdXBvb2wgdXNlcyB0aGUgZGVmYXVsdCBzY2hlZHVsZXINCj4gDQo+IEkgZ2F2ZSBh
bGwgdGhlIHVuYXNzaWduZWQgY3B1cyB0byBjcHVwb29sMCB0byByZWZsZWN0IHRoZSBjdXJy
ZW50IGJlaGF2aW91ciwgc28gdGhhdA0KPiBhIHVzZXIgdGhhdCBkb2VzbuKAmXQgc3BlY2lm
eSBhbnkgeGVuLGNwdXBvb2wgbm9kZSBlbmRzIHVwIGluIGEgc3lzdGVtIHJlZmxlY3Rpbmcg
dGhlDQo+IGN1cnJlbnQgYmVoYXZpb3VyIGFzIHRoZSBmZWF0dXJlIGlzIG5vdCBlbmFibGVk
Lg0KPiBIb3dldmVyIEkgY2FuIHNheSwgaWYgbm8geGVuLGNwdXBvb2wgbm9kZXMgYXJlIGZv
dW5kIHRoZW4gYXNzaWduIGNwdXMgdG8gY3B1cG9vbDAsDQo+IGVsc2UgYXNzaWduIHRoZW0g
dG8gYSBuZXcgY3B1cG9vbCBhbmQuLi4NCj4gDQo+Pg0KPj4gSWYgdGhlIHVzZXIgY3JlYXRl
ZCBjcHVwb29scyBpbiBkZXZpY2UgdHJlZSBjb3ZlcmluZyBhbGwgQ1BVcyBhbmQgYWxzbw0K
Pj4gc3BlY2lmaWVkIGFsbCBjcHVwb29sLWlkcyBldmVyeXdoZXJlLCBhbmQgbm9uZSBvZiB0
aGVtIGFyZSAwIChubyBjcHVwb29sDQo+PiBpbiB0aGUgc3lzdGVtIGlzIGNwdXBvb2wwKSB0
aGVuIHBhbmljLiAoQXNzdW1pbmcgdGhhdCBjcHVwb29sMCBpcw0KPj4gcmVxdWlyZWQuKQ0K
PiANCj4g4oCmIHBhbmljIGlmIGNwdXBvb2wwIGhhcyBubyBjcHVzLg0KDQpUb2RheSBjcHUg
MCBpcyBhbHdheXMgbWVtYmVyIG9mIGNwdXBvb2wwLCBhbmQgY2hhbmdpbmcgdGhhdCBtaWdo
dCBiZQ0KaGFyZC4NCg0KDQpKdWVyZ2VuDQo=
--------------fUaRchlecyt3jRs9acd9w00e
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------fUaRchlecyt3jRs9acd9w00e--

--------------2djNK4009U0uLsNdoMD4Iix4--

--------------alQ9vdTNmDSPU8J1MtfNMirk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIM9DcFAwAAAAAACgkQsN6d1ii/Ey9U
RQf9EopFJNLixI3nBdIm4aOSH90VrbR8S4aEzOM2oNJDUEeYEe5pEvM5serMqdMJE4PxFyPwQDr1
dHL9cwVQFFf5xlFqgVQY7+zCypxJr+9er8cZME9JvLKla637mzfnXbL10kdOwNOBg1bCAOSY/65l
K3xntPtnynK7byFaMC4TjzOSGUrt9FOHPHZSM4OEKQiS+8S026LIh2SSLTd+KrkMX8+u2+pgGpbK
UidLDam+VOFy37vHDphSbYCJfF+IaLZ8euELjIDiGFld/AZaHwW5p+MKHnXJptXNi1SXRLPtgSUS
+3U53XOod4ZmbEDWzcrU4SjwHnpalXXNEEMNPkVLKA==
=C6Ks
-----END PGP SIGNATURE-----

--------------alQ9vdTNmDSPU8J1MtfNMirk--

