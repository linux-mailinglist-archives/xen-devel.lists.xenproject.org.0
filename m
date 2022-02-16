Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922994B8888
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 14:07:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274124.469483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKK1f-0000ia-62; Wed, 16 Feb 2022 13:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274124.469483; Wed, 16 Feb 2022 13:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKK1f-0000fq-1m; Wed, 16 Feb 2022 13:07:19 +0000
Received: by outflank-mailman (input) for mailman id 274124;
 Wed, 16 Feb 2022 13:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BoLq=S7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nKK1c-0000fk-Rv
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 13:07:16 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cae221b-8f29-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 14:07:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 268241F383;
 Wed, 16 Feb 2022 13:07:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA38513B0A;
 Wed, 16 Feb 2022 13:07:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UT3wJwL3DGIkZAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Feb 2022 13:07:14 +0000
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
X-Inumbo-ID: 5cae221b-8f29-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1645016835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SUTQuutlbqGH5XGZV+1gUsZX1dIcojU1Q12se0e3hsY=;
	b=H7t6/4AD72MPL8V5iln/7axsOx8sjBOvTkpV/VKOn4xAIQqbarjHDyvuiJnSZoUFW2BfAl
	SLBhGR+OdOokCEpkrdZOl/5k07A1QAivCiKLZwzl+l5hrsA2wl62nS+CwZ10HTwzrHa/U3
	j0Y8cxyiBAmh4Wy+KfWaQl037bkaOr4=
Message-ID: <69d80e47-ad4a-5fa7-acdb-96da6c9598de@suse.com>
Date: Wed, 16 Feb 2022 14:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
 <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
 <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
 <1D92168D-DFD6-4B1A-9079-FBFDDA9F2969@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1D92168D-DFD6-4B1A-9079-FBFDDA9F2969@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e3l56HugvGX0TaqW7JqvortL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e3l56HugvGX0TaqW7JqvortL
Content-Type: multipart/mixed; boundary="------------RWs5vHXUoPlS9rZSb0xQiggU";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Message-ID: <69d80e47-ad4a-5fa7-acdb-96da6c9598de@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
 <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
 <44d2673b-2450-81cf-5d3e-9afb23ae09c6@suse.com>
 <1D92168D-DFD6-4B1A-9079-FBFDDA9F2969@arm.com>
In-Reply-To: <1D92168D-DFD6-4B1A-9079-FBFDDA9F2969@arm.com>

--------------RWs5vHXUoPlS9rZSb0xQiggU
Content-Type: multipart/mixed; boundary="------------IWY3wwzbe04gZE0J09kZbr2u"

--------------IWY3wwzbe04gZE0J09kZbr2u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDIuMjIgMTQ6MDEsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDE2IEZlYiAyMDIyLCBhdCAxMjo1NSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBPbiAxNi4wMi4yMiAxMzoxMCwgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+Pj4gT24gMTYgRmViIDIwMjIsIGF0IDAyOjQ1LCBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+Pg0KPj4+PiBPbiBUdWUsIDE1
IEZlYiAyMDIyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+Pj4gSW50cm9kdWNlIGFuIGFy
Y2hpdGVjdHVyZSBzcGVjaWZpYyB3YXkgdG8gY3JlYXRlIGRpZmZlcmVudCBjcHVwb29scw0K
Pj4+Pj4gYXQgYm9vdCB0aW1lLCB0aGlzIGlzIHBhcnRpY3VsYXJseSB1c2VmdWwgb24gQVJN
IGJpZy5MSVRUTEUgc3lzdGVtDQo+Pj4+PiB3aGVyZSB0aGVyZSBtaWdodCBiZSB0aGUgbmVl
ZCB0byBoYXZlIGRpZmZlcmVudCBjcHVwb29scyBmb3IgZWFjaCB0eXBlDQo+Pj4+PiBvZiBj
b3JlLCBidXQgYWxzbyBzeXN0ZW1zIHVzaW5nIE5VTUEgY2FuIGhhdmUgZGlmZmVyZW50IGNw
dSBwb29scyBmb3INCj4+Pj4+IGVhY2ggbm9kZS4NCj4+Pj4+DQo+Pj4+PiBUaGUgZmVhdHVy
ZSBvbiBhcm0gcmVsaWVzIG9uIGEgc3BlY2lmaWNhdGlvbiBvZiB0aGUgY3B1cG9vbHMgZnJv
bSB0aGUNCj4+Pj4+IGRldmljZSB0cmVlIHRvIGJ1aWxkIHBvb2xzIGFuZCBhc3NpZ24gY3B1
cyB0byB0aGVtLg0KPj4+Pj4NCj4+Pj4+IERvY3VtZW50YXRpb24gaXMgY3JlYXRlZCB0byBl
eHBsYWluIHRoZSBmZWF0dXJlLg0KPj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2Eg
RmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gZG9j
cy9taXNjL2FybS9kZXZpY2UtdHJlZS9jcHVwb29scy50eHQgfCAxMTggKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4+Pj4geGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgfCAgIDkgKysNCj4+Pj4+IHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgIHwgICAxICsNCj4+Pj4+IHhlbi9hcmNoL2FybS9jcHVwb29sLmMgICAgICAgICAg
ICAgICAgIHwgMTE4ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4+IHhlbi9jb21t
b24vc2NoZWQvY3B1cG9vbC5jICAgICAgICAgICAgIHwgICA0ICstDQo+Pj4+PiB4ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaCAgICAgICAgICAgICAgICB8ICAxMSArKysNCj4+Pj4+IDYgZmls
ZXMgY2hhbmdlZCwgMjYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+IGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4
dA0KPj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9jcHVwb29sLmMNCj4+
Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9jcHVw
b29scy50eHQgYi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dA0KPj4+
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzI5
OGI2Mzk0MzMyDQo+Pj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+PiArKysgYi9kb2NzL21pc2Mv
YXJtL2RldmljZS10cmVlL2NwdXBvb2xzLnR4dA0KPj4+Pj4gQEAgLTAsMCArMSwxMTggQEAN
Cj4+Pj4+ICtCb290IHRpbWUgY3B1cG9vbHMNCj4+Pj4+ICs9PT09PT09PT09PT09PT09PT0N
Cj4+Pj4+ICsNCj4+Pj4+ICtPbiBhcm0sIHdoZW4gQk9PVF9USU1FX0NQVVBPT0xTIGlzIGVu
YWJsZWQgaW4gdGhlIFhlbiBjb25maWd1cmF0aW9uLCBpdCBpcw0KPj4+Pj4gK3Bvc3NpYmxl
IHRvIGNyZWF0ZSBjcHVwb29scyBkdXJpbmcgYm9vdCBwaGFzZSBieSBzcGVjaWZ5aW5nIHRo
ZW0gaW4gdGhlIGRldmljZQ0KPj4+Pj4gK3RyZWUuDQo+Pj4+PiArDQo+Pj4+PiArQ3B1cG9v
bHMgc3BlY2lmaWNhdGlvbiBub2RlcyBzaGFsbCBiZSBkaXJlY3QgY2hpbGRzIG9mIC9jaG9z
ZW4gbm9kZS4NCj4+Pj4+ICtFYWNoIGNwdXBvb2wgbm9kZSBjb250YWlucyB0aGUgZm9sbG93
aW5nIHByb3BlcnRpZXM6DQo+Pj4+PiArDQo+Pj4+PiArLSBjb21wYXRpYmxlIChtYW5kYXRv
cnkpDQo+Pj4+PiArDQo+Pj4+PiArICAgIE11c3QgYWx3YXlzIGluY2x1ZGUgdGhlIGNvbXBh
dGlibGl0eSBzdHJpbmc6ICJ4ZW4sY3B1cG9vbCIuDQo+Pj4+PiArDQo+Pj4+PiArLSBjcHVw
b29sLWlkIChtYW5kYXRvcnkpDQo+Pj4+PiArDQo+Pj4+PiArICAgIE11c3QgYmUgYSBwb3Np
dGl2ZSBpbnRlZ2VyIG51bWJlci4NCj4+Pj4NCj4+PiBIaSBTdGVmYW5vLA0KPj4+IFRoYW5r
IHlvdSBmb3IgeW91ciByZXZpZXcsDQo+Pj4+IFdoeSBpcyBjcHVwb29sLWlkIG1hbmRhdG9y
eT8gSXQgbG9va3MgbGlrZSBpdCBjb3VsZCBiZSBnZW5lcmF0ZWQgYnkgWGVuLg0KPj4+PiBP
ciBpcyBpdCBhY3R1YWxseSBiZXR0ZXIgdG8gaGF2ZSB0aGUgdXNlciBzcGVjaWZ5IGl0IGFu
eXdheT8NCj4+Pj4NCj4+PiBZZXMgYXQgZmlyc3QgSSB0aG91Z2h0IHRvIGF1dG9tYXRpY2Fs
bHkgZ2VuZXJhdGUgdGhhdCwgaG93ZXZlciBJIG5lZWRlZCBhIHN0cnVjdHVyZQ0KPj4+IHRv
IG1hcCB0aGUgaWQgdG8gdGhlIGNwdXBvb2wgRFQgbm9kZS4gSGVyZSBteSBkb3VidCB3YXMg
YWJvdXQgdGhlIHNpemUgb2YgdGhlDQo+Pj4gc3RydWN0dXJlLCBiZWNhdXNlIHRoZSB1c2Vy
IGNvdWxkIGV2ZW4gc3BlY2lmeSBhIGNwdXBvb2wgZm9yIGVhY2ggY3B1LiBJIGNvdWxkIGFs
bG9jYXRlDQo+Pj4gSXQgZHluYW1pY2FsbHkgYW5kIGZyZWUgaXQgYWZ0ZXIgZG9tVXMgY3Jl
YXRpb24gaW4gc2V0dXBfeGVuLg0KPj4+IFdoYXQgZG8geW91IHRoaW5rIGNvdWxkIGJlIHRo
ZSByaWdodCB3YXk/DQo+Pj4gT3IgdGhlIGRvbTBsZXNzIGd1ZXN0IGNvdWxkIHNwZWNpZnkg
dGhlIGlkLCBidXQgSSBsaWtlIGl0IG1vcmUgd2hlbiB1c2luZyBhIHBoYW5kbGUgdG8gdGhl
DQo+Pj4gWGVuLGNwdXBvb2wgbm9kZS4NCj4+Pj4NCj4+Pj4+ICstIGNwdXBvb2wtY3B1cyAo
bWFuZGF0b3J5KQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBNdXN0IGJlIGEgbGlzdCBvZiBkZXZp
Y2UgdHJlZSBwaGFuZGxlIHRvIG5vZGVzIGRlc2NyaWJpbmcgY3B1cyAoZS5nLiBoYXZpbmcN
Cj4+Pj4+ICsgICAgZGV2aWNlX3R5cGUgPSAiY3B1IiksIGl0IGNhbid0IGJlIGVtcHR5Lg0K
Pj4+Pj4gKw0KPj4+Pj4gKy0gY3B1cG9vbC1zY2hlZCAob3B0aW9uYWwpDQo+Pj4+PiArDQo+
Pj4+PiArICAgIE11c3QgYmUgYSBzdHJpbmcgaGF2aW5nIHRoZSBuYW1lIG9mIGEgWGVuIHNj
aGVkdWxlciwgaXQgaGFzIG5vIGVmZmVjdCB3aGVuDQo+Pj4+PiArICAgIHVzZWQgaW4gY29u
anVuY3Rpb24gb2YgYSBjcHVwb29sLWlkIGVxdWFsIHRvIHplcm8sIGluIHRoYXQgY2FzZSB0
aGUNCj4+Pj4+ICsgICAgZGVmYXVsdCBYZW4gc2NoZWR1bGVyIGlzIHNlbGVjdGVkIChzY2hl
ZD08Li4uPiBib290IGFyZ3VtZW50KS4NCj4+Pj4NCj4+Pj4gSSBkb24ndCBnZXQgd2h5IGNw
dXBvb2wtaWQgPT0gMCBzaG91bGQgdHJpZ2dlciBhIHNwZWNpYWwgY3B1cG9vbC1zY2hlZA0K
Pj4+PiBiZWhhdmlvci4NCj4+PiBDcHVwb29sIHdpdGggaWQgMCBpcyBlbWJlZGRlZCBpbiBY
ZW4sIGl0IGhhcyBpdHMgb3duIHNwZWNpYWwgY2FzZSBoYW5kbGluZyBpbiBjcHVwb29sX2Ny
ZWF0ZQ0KPj4+IHRoYXQgaXMgZ2l2aW5nIGl0IHRoZSBkZWZhdWx0IHNjaGVkdWxlci4gSSB0
aG91Z2h0IGl0IHdhcyBiZXR0ZXIgdG8gbGVhdmUgaXQgYXMgaXQgd2FzLCBob3dldmVyIHRo
ZQ0KPj4+IGNwdXBvb2wwIHNjaGVkdWxlciBjYW4gYmUgbW9kaWZpZWQgdXNpbmcgc2NoZWQ9
IGJvb3QgYXJncyBhcyBpdCB3YXMgYmVmb3JlLg0KPj4+Pg0KPj4+Pg0KPj4+Pj4gK0NvbnN0
cmFpbnRzDQo+Pj4+PiArPT09PT09PT09PT0NCj4+Pj4+ICsNCj4+Pj4+ICtUaGUgY3B1cG9v
bCB3aXRoIGlkIHplcm8gaXMgaW1wbGljaXRseSBjcmVhdGVkIGV2ZW4gaWYgbm90IHNwZWNp
ZmllZCwgdGhhdCBwb29sDQo+Pj4+PiArbXVzdCBoYXZlIGF0IGxlYXN0IG9uZSBjcHUgYXNz
aWduZWQsIG90aGVyd2lzZSBYZW4gd2lsbCBzdG9wLg0KPj4+Pj4gKw0KPj4+Pj4gK0V2ZXJ5
IGNwdSBicm91Z2h0IHVwIGJ5IFhlbiB3aWxsIGJlIGFzc2lnbmVkIHRvIHRoZSBjcHVwb29s
IHdpdGggaWQgemVybyBpZiBpdCdzDQo+Pj4+PiArbm90IGFzc2lnbmVkIHRvIGFueSBvdGhl
ciBjcHVwb29sLg0KPj4+Pj4gKw0KPj4+Pj4gK0lmIGEgY3B1IGlzIGFzc2lnbmVkIHRvIGEg
Y3B1cG9vbCwgYnV0IGl0J3Mgbm90IGJyb3VnaHQgdXAgY29ycmVjdGx5LCBYZW4gd2lsbA0K
Pj4+Pj4gK3N0b3AuDQo+Pj4+DQo+Pj4+IFRoYW5rIHlvdSBmb3IgZG9jdW1lbnRpbmcgdGhl
IGNvbnN0cmFpbnRzLCBidXQgd2h5IGRvIHdlIGhhdmUgdGhlbT8NCj4+Pj4gSW1hZ2luZSBh
IHVzZXIgc3BlY2lmeWluZyAzIGNwdSBwb29scyBhbmQgaW1hZ2luZSB0aGUgY3B1cG9vbC1p
ZCBpcw0KPj4+PiBvcHRpb25hbCBhbmQgbWlzc2luZy4gV2UgY291bGQgdGFrZSBjYXJlIG9m
IHRoZSBjcHVwb29sLWlkIGdlbmVyYXRpb24gaW4NCj4+Pj4gWGVuIGFuZCB3ZSBjb3VsZCBh
bHNvIGFzc2lnbiB0aGUgZGVmYXVsdCBzY2hlZHVsZXIgZXZlcnl3aGVyZQ0KPj4+PiBjcHVw
b29sLXNjaGVkIGlzIG5vdCBzcGVjaWZpZWQuIE1heWJlIEkgYW0gbWlzc2luZyBzb21ldGhp
bmc/DQo+Pj4gWWVzIHdlIGNvdWxkIG1ha2UgdGhlIGNwdXBvb2wtaWQgb3B0aW9uYWwsIG15
IGRvdWJ0cyBhcmUgaW4gdGhlIGZpc3QgY29tbWVudCBhYm92ZS4NCj4+PiBXaGVuZXZlciB0
aGUgY3B1cG9vbC1zY2hlZCBpcyBub3Qgc3BlY2lmaWVkLCB0aGUgY3VycmVudCBiZWhhdmlv
dXIgaXMgdG8gdXNlIHRoZSBkZWZhdWx0IHNjaGVkdWxlci4NCj4+Pj4NCj4+Pj4gRG9lcyBj
cHVwb29sMCBoYXMgdG8gZXhpc3Q/IEkgZ3Vlc3MgdGhlIGFuc3dlciBjb3VsZCBiZSB5ZXMs
IGJ1dCBpZiBpdA0KPj4+PiBpcyBzcGVjaWZpZWQgYXMgaWQgb2Ygb25lIG9mIHRoZSBwb29s
cyB3ZSBhcmUgZmluZSwgb3RoZXJ3aXNlIGl0IGNvdWxkDQo+Pj4+IGJlIGF1dG9tYXRpY2Fs
bHkgZ2VuZXJhdGVkIGJ5IFhlbi4NCj4+PiBZZXMgY3B1cG9vbDAgbmVlZHMgdG8gZXhpc3Rz
LCBob3dldmVyIGl0IGlzIHN0aWxsIGdlbmVyYXRlZCBieSBYZW4gcmVnYXJkbGVzcyBvZiB0
aGUgRFQNCj4+PiBzcGVjaWZpY2F0aW9ucy4gSW4gZmFjdCB5b3UgY291bGQgbm90IHNwZWNp
ZnkgaW4gdGhlIERUIGFueSB4ZW4sY3B1cG9vbCBjb21wYXRpYmxlIG5vZGUNCj4+PiB3aXRo
IHRoZSBjcHVwb29sLWlkID09IDAgYW5kIFhlbiB3aWxsIGdlbmVyYXRlIHRoZSBjcHVwb29s
MCBhbnl3YXkNCj4+PiAoWGVuIGludGVybmFscyBhcmUgdGllZCB3aXRoIHRoZSBleGlzdGVu
Y2Ugb2YgYSBjcHVwb29sMCkuDQo+Pj4+DQo+Pj4+IEluIGFueSBjYXNlLCBJIGRvbid0IHRo
aW5rIHRoYXQgY3B1cG9vbDAgaGFzIHRvIGhhdmUgdGhlIGRlZmF1bHQNCj4+Pj4gc2NoZWR1
bGVyPw0KPj4+IE9rIEkgdGhpbmsgSSBjYW4gY3JlYXRlIGEgZnVuY3Rpb24gdG8gYXNzaWdu
IGEgc2NoZWR1bGVyIHRvIHRoZSBjcHVwb29sMCBhZnRlciBpdHMgY3JlYXRpb24sDQo+Pj4g
SSB3b3VsZCBuZWVkIHRvIHRlc3QgaXQgdG8gYmUgc3VyZSBJIGRvbuKAmXQgZmluZCBzb21l
dGhpbmcgc3RyYW5nZS4NCj4+Pj4NCj4+Pj4gTXkgc3VnZ2VzdGlvbiB3b3VsZCBiZToNCj4+
Pj4NCj4+Pj4gLSBtYWtlIGNwdXBvb2wtaWQgb3B0aW9uYWwNCj4+Pj4gLSBhc3NpZ24gYXV0
b21hdGljYWxseSBjcHVwb29sLWlkcyBzdGFydGluZyBmcm9tIDANCj4+Pj4gICAgIC0gcmVz
cGVjdCBjcHVwb29sLWlkcyBjaG9zZW4gYnkgdGhlIHVzZXINCj4+PiBPaywgaXQgd291bGQg
c3RhcnQgZnJvbSAxIGJlY2F1c2UgY3B1cG9vbDAgYWx3YXlzIGV4aXN0cw0KPj4+PiAtIGlm
IHNvbWUgQ1BVcyBhcmUgbGVmdCBvdXQgKG5vdCBzcGVjaWZpZWQgaW4gYW55IHBvb2wpIGFk
ZCBhbiBleHRyYSBjcHVwb29sDQo+Pj4+ICAgICAtIHRoZSBleHRyYSBjcHVwb29sIGRvZXNu
J3QgaGF2ZSB0byBiZSBjcHVwb29sLWlkID09IDAsIGl0IGNvdWxkIGJlDQo+Pj4+ICAgICAg
IGNwdXBvb2wtaWQgPT0gbg0KPj4+PiAgICAgLSB0aGUgZXh0cmEgY3B1cG9vbCB1c2VzIHRo
ZSBkZWZhdWx0IHNjaGVkdWxlcg0KPj4+IEkgZ2F2ZSBhbGwgdGhlIHVuYXNzaWduZWQgY3B1
cyB0byBjcHVwb29sMCB0byByZWZsZWN0IHRoZSBjdXJyZW50IGJlaGF2aW91ciwgc28gdGhh
dA0KPj4+IGEgdXNlciB0aGF0IGRvZXNu4oCZdCBzcGVjaWZ5IGFueSB4ZW4sY3B1cG9vbCBu
b2RlIGVuZHMgdXAgaW4gYSBzeXN0ZW0gcmVmbGVjdGluZyB0aGUNCj4+PiBjdXJyZW50IGJl
aGF2aW91ciBhcyB0aGUgZmVhdHVyZSBpcyBub3QgZW5hYmxlZC4NCj4+PiBIb3dldmVyIEkg
Y2FuIHNheSwgaWYgbm8geGVuLGNwdXBvb2wgbm9kZXMgYXJlIGZvdW5kIHRoZW4gYXNzaWdu
IGNwdXMgdG8gY3B1cG9vbDAsDQo+Pj4gZWxzZSBhc3NpZ24gdGhlbSB0byBhIG5ldyBjcHVw
b29sIGFuZC4uLg0KPj4+Pg0KPj4+PiBJZiB0aGUgdXNlciBjcmVhdGVkIGNwdXBvb2xzIGlu
IGRldmljZSB0cmVlIGNvdmVyaW5nIGFsbCBDUFVzIGFuZCBhbHNvDQo+Pj4+IHNwZWNpZmll
ZCBhbGwgY3B1cG9vbC1pZHMgZXZlcnl3aGVyZSwgYW5kIG5vbmUgb2YgdGhlbSBhcmUgMCAo
bm8gY3B1cG9vbA0KPj4+PiBpbiB0aGUgc3lzdGVtIGlzIGNwdXBvb2wwKSB0aGVuIHBhbmlj
LiAoQXNzdW1pbmcgdGhhdCBjcHVwb29sMCBpcw0KPj4+PiByZXF1aXJlZC4pDQo+Pj4g4oCm
IHBhbmljIGlmIGNwdXBvb2wwIGhhcyBubyBjcHVzLg0KPj4NCj4+IFRvZGF5IGNwdSAwIGlz
IGFsd2F5cyBtZW1iZXIgb2YgY3B1cG9vbDAsIGFuZCBjaGFuZ2luZyB0aGF0IG1pZ2h0IGJl
DQo+PiBoYXJkLg0KPiANCj4gT2gsIGFyZSB5b3Ugc3VyZT8gSSBkaWQgc29tZSB0ZXN0IGlu
IHRoZSBwYXN0IGZvciB0aGlzIHNlcmllIHVzaW5nIGEgSnVubyBib2FyZCwNCj4gZ2l2aW5n
IHRvIGNwdXBvb2wwIG9ubHkgYTcyIGNvcmVzIGFuZCB0aGUgYTUzIGNvcmVzIGluIGFub3Ro
ZXIgY3B1cG9vbCwgbXkgSnVubw0KPiBmaXJtd2FyZSBjb25maWd1cmF0aW9uIG1ha2VzIFhl
biBoYXZpbmcgdGhlIGJvb3QgY3B1IChjcHUgMCkgdG8gYmUgb25lIG9mIHRoZSBhNTMNCj4g
YW5kIGl0IHdhcyB3b3JraW5nIGZpbmUuIEJ1dCBpdCB3YXMgbG9uZyB0aW1lIGFnbyBzbyBJ
IHdvdWxkIG5lZWQgdG8gdHJ5IGl0IGFnYWluLg0KDQpNYXliZSBvbiBBcm0gdGhlIHJlc3Ry
aWN0aW9ucyBhcmUgbGVzcyBwcm9ibGVtYXRpYywgYnV0IEkgd291bGRuJ3QgYmV0DQp0aGF0
IGFsbCBvcGVyYXRpb25zIChsaWtlIG1vdmluZyBjcHVzIGJldHdlZW4gY3B1cG9vbHMsIGNw
dSBob3RwbHVnLA0KZGVzdHJveWluZyBjcHVwb29scywgc2h1dGRvd24gb2YgdGhlIGhvc3Qs
IC4uLikgYXJlIHdvcmtpbmcgaW4gYSBzYW5lDQp3YXkuDQoNCg0KSnVlcmdlbg0K
--------------IWY3wwzbe04gZE0J09kZbr2u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------IWY3wwzbe04gZE0J09kZbr2u--

--------------RWs5vHXUoPlS9rZSb0xQiggU--

--------------e3l56HugvGX0TaqW7JqvortL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIM9wIFAwAAAAAACgkQsN6d1ii/Ey9M
9Qf/ZaxoPoJncPlNK0T/z/+F7+ABLBCLlCz/oABISb9G3q3w1M2afct8ekKaivAOg4U4gdotFkZ8
n/uLvplTftfOpA3xBa4WIsaZ4Cp2Oj/TcsoNjwG+qsLngn1L8AxPEKdCgw0vaCZL8zCqEuejEJ8d
0wMVAQH1Gx8Zgg2oy46ZVoFC3/VzkvZ3uddg2WN/tfVH0xZhm5bBtHfpC+NtJIricslCm/sHGNmV
UhMNIhxhwbJqXSSkWzWDNHO6eoTxKCrAaAFiZvImyP0apeeNoMlRVqNaxow2mueBvxPVgsQm1cbc
EDiViqW79HK9ioZts65sI/tm/YoltzyTbqLeWW4eXA==
=DLDi
-----END PGP SIGNATURE-----

--------------e3l56HugvGX0TaqW7JqvortL--

