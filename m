Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B424B69EE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273021.468060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvVz-0005sV-WD; Tue, 15 Feb 2022 10:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273021.468060; Tue, 15 Feb 2022 10:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJvVz-0005py-Sk; Tue, 15 Feb 2022 10:56:59 +0000
Received: by outflank-mailman (input) for mailman id 273021;
 Tue, 15 Feb 2022 10:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=az2O=S6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nJvVy-0005ps-Ai
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:56:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe32ff06-8e4d-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:56:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA03B1F391;
 Tue, 15 Feb 2022 10:56:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5196213C51;
 Tue, 15 Feb 2022 10:56:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZrjgEfiGC2LiLQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 15 Feb 2022 10:56:56 +0000
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
X-Inumbo-ID: fe32ff06-8e4d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1644922616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZBFecVMiidsBtQmzL01/lbLwNM5bY0txYko2q4tETJE=;
	b=hnE9hBBojrboGEy/4b/f8elDNaEfsqXRxyRa8Ku1Zw21pIm+Xgn/jxWbpLnnzcVJ/lliG+
	yWLyH+A00yKsfyoaxXLciwi14IhAqajk+TPosh8+bm8Dg+t7+j9hwrLw/Bwkj2/kVuY6kt
	AaoO3KzhR5ocfHk94sfEQKx3HhVCq5g=
Message-ID: <812858d6-3f39-87ed-b495-a15d34f6e930@suse.com>
Date: Tue, 15 Feb 2022 11:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-6-luca.fancellu@arm.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5/5] arm/dom0less: assign dom0less guests to cpupools
In-Reply-To: <20220215101551.23101-6-luca.fancellu@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sXbYd4uAD0j500VcPyIWXPS3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sXbYd4uAD0j500VcPyIWXPS3
Content-Type: multipart/mixed; boundary="------------wsR7P9fTHrsPlrF6ZT9c6yQj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <812858d6-3f39-87ed-b495-a15d34f6e930@suse.com>
Subject: Re: [PATCH 5/5] arm/dom0less: assign dom0less guests to cpupools
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-6-luca.fancellu@arm.com>
In-Reply-To: <20220215101551.23101-6-luca.fancellu@arm.com>

--------------wsR7P9fTHrsPlrF6ZT9c6yQj
Content-Type: multipart/mixed; boundary="------------D659Q4h09ZboVdOfQisu0DX1"

--------------D659Q4h09ZboVdOfQisu0DX1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjIgMTE6MTUsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IEludHJvZHVjZSBk
b21haW4tY3B1cG9vbCBwcm9wZXJ0eSBvZiBhIHhlbixkb21haW4gZGV2aWNlIHRyZWUgbm9k
ZSwNCj4gdGhhdCBzcGVjaWZpZXMgdGhlIGNwdXBvb2wgZGV2aWNlIHRyZWUgaGFuZGxlIG9m
IGEgeGVuLGNwdXBvb2wgbm9kZQ0KPiB0aGF0IGlkZW50aWZpZXMgYSBjcHVwb29sIGNyZWF0
ZWQgYXQgYm9vdCB0aW1lIHdoZXJlIHRoZSBndWVzdCB3aWxsDQo+IGJlIGFzc2lnbmVkIG9u
IGNyZWF0aW9uLg0KPiANCj4gQWRkIG1lbWJlciB0byB0aGUgeGVuX2FyY2hfZG9tYWluY29u
ZmlnIHB1YmxpYyBpbnRlcmZhY2Ugc28gdGhlDQo+IFhFTl9ET01DVExfSU5URVJGQUNFX1ZF
UlNJT04gdmVyc2lvbiBpcyBidW1wZWQuDQo+IA0KPiBVcGRhdGUgZG9jdW1lbnRhdGlvbiBh
Ym91dCB0aGUgcHJvcGVydHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQo+IC0tLQ0KPiAgIGRvY3MvbWlzYy9hcm0vZGV2
aWNlLXRyZWUvYm9vdGluZy50eHQgfCA1ICsrKysrDQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFp
bi5jICAgICAgICAgICAgICAgICB8IDYgKysrKysrDQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jICAgICAgICAgICB8IDkgKysrKysrKystDQo+ICAgeGVuL2FyY2gveDg2L2Rv
bWFpbi5jICAgICAgICAgICAgICAgICB8IDYgKysrKysrDQo+ICAgeGVuL2NvbW1vbi9kb21h
aW4uYyAgICAgICAgICAgICAgICAgICB8IDUgKysrKy0NCj4gICB4ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC1hcm0uaCAgICAgICAgIHwgMiArKw0KPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9k
b21jdGwuaCAgICAgICAgICAgfCAyICstDQo+ICAgeGVuL2luY2x1ZGUveGVuL2RvbWFpbi5o
ICAgICAgICAgICAgICB8IDMgKysrDQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9h
cm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgYi9kb2NzL21pc2MvYXJtL2RldmljZS10cmVl
L2Jvb3RpbmcudHh0DQo+IGluZGV4IDcxODk1NjYzYTRkZS4uMGYxZjIxMGZhNDQ5IDEwMDY0
NA0KPiAtLS0gYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3RpbmcudHh0DQo+ICsr
KyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCj4gQEAgLTE4Miw2
ICsxODIsMTEgQEAgd2l0aCB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6DQo+ICAgICAgIEJv
dGggI2FkZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzIG5lZWQgdG8gYmUgc3BlY2lmaWVk
IGJlY2F1c2UNCj4gICAgICAgYm90aCBzdWItbm9kZXMgKGRlc2NyaWJlZCBzaG9ydGx5KSBo
YXZlIHJlZyBwcm9wZXJ0aWVzLg0KPiAgIA0KPiArLSBkb21haW4tY3B1cG9vbA0KPiArDQo+
ICsgICAgT3B0aW9uYWwuIEhhbmRsZSB0byBhIHhlbixjcHVwb29sIGRldmljZSB0cmVlIG5v
ZGUgdGhhdCBpZGVudGlmaWVzIHRoZQ0KPiArICAgIGNwdXBvb2wgd2hlcmUgdGhlIGd1ZXN0
IHdpbGwgYmUgc3RhcnRlZCBhdCBib290Lg0KPiArDQo+ICAgVW5kZXIgdGhlICJ4ZW4sZG9t
YWluIiBjb21wYXRpYmxlIG5vZGUsIG9uZSBvciBtb3JlIHN1Yi1ub2RlcyBhcmUgcHJlc2Vu
dA0KPiAgIGZvciB0aGUgRG9tVSBrZXJuZWwgYW5kIHJhbWRpc2suDQo+ICAgDQo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMN
Cj4gaW5kZXggOTJhNmM1MDllNWM1Li5iZTM1MGIyOGI1ODggMTAwNjQ0DQo+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW4uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4g
QEAgLTc4OCw2ICs3ODgsMTIgQEAgZmFpbDoNCj4gICAgICAgcmV0dXJuIHJjOw0KPiAgIH0N
Cj4gICANCj4gK3Vuc2lnbmVkIGludA0KPiArYXJjaF9nZXRfZG9tYWluX2NwdXBvb2xfaWQo
Y29uc3Qgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25maWcpDQo+ICt7DQo+
ICsgICAgcmV0dXJuIGNvbmZpZy0+YXJjaC5jcHVwb29sX2lkOw0KPiArfQ0KPiArDQoNCkkg
ZG9uJ3Qgc2VlIHdoeSB0aGlzIHNob3VsZCBiZSBhcmNoIHNwZWNpZmljLg0KDQo+ICAgdm9p
ZCBhcmNoX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpDQo+ICAgew0KPiAgICAg
ICAvKiBJT01NVSBwYWdlIHRhYmxlIGlzIHNoYXJlZCB3aXRoIFAyTSwgYWx3YXlzIGNhbGwN
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYw0KPiBpbmRleCA2OTMxYzAyMmEyZTguLjRmMjM5ZTc1Njc3
NSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ICsrKyBi
L3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBAQCAtMzAxNSw3ICszMDE1LDggQEAg
c3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4g
ICB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkNCj4gICB7DQo+ICAgICAgIHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqbm9kZTsNCj4gLSAgICBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNl
X25vZGUgKmNob3NlbiA9IGR0X2ZpbmRfbm9kZV9ieV9wYXRoKCIvY2hvc2VuIik7DQo+ICsg
ICAgY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpjcHVwb29sX25vZGUsDQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICpjaG9zZW4gPSBkdF9maW5kX25vZGVfYnlf
cGF0aCgiL2Nob3NlbiIpOw0KPiAgIA0KPiAgICAgICBCVUdfT04oY2hvc2VuID09IE5VTEwp
Ow0KPiAgICAgICBkdF9mb3JfZWFjaF9jaGlsZF9ub2RlKGNob3Nlbiwgbm9kZSkNCj4gQEAg
LTMwNTMsNiArMzA1NCwxMiBAQCB2b2lkIF9faW5pdCBjcmVhdGVfZG9tVXModm9pZCkNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdVRVNUX1ZQTDAx
MV9TUEkgLSAzMiArIDEpOw0KPiAgICAgICAgICAgfQ0KPiAgIA0KPiArICAgICAgICAvKiBH
ZXQgdGhlIG9wdGlvbmFsIHByb3BlcnR5IGRvbWFpbi1jcHVwb29sICovDQo+ICsgICAgICAg
IGNwdXBvb2xfbm9kZSA9IGR0X3BhcnNlX3BoYW5kbGUobm9kZSwgImRvbWFpbi1jcHVwb29s
IiwgMCk7DQo+ICsgICAgICAgIGlmICggY3B1cG9vbF9ub2RlICkNCj4gKyAgICAgICAgICAg
IGR0X3Byb3BlcnR5X3JlYWRfdTMyKGNwdXBvb2xfbm9kZSwgImNwdXBvb2wtaWQiLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmRfY2ZnLmFyY2guY3B1cG9vbF9p
ZCk7DQo+ICsNCj4gICAgICAgICAgIC8qDQo+ICAgICAgICAgICAgKiBUaGUgdmFyaWFibGUg
bWF4X2luaXRfZG9taWQgaXMgaW5pdGlhbGl6ZWQgd2l0aCB6ZXJvLCBzbyBoZXJlIGl0J3MN
Cj4gICAgICAgICAgICAqIHZlcnkgaW1wb3J0YW50IHRvIHVzZSB0aGUgcHJlLWluY3JlbWVu
dCBvcGVyYXRvciB0byBjYWxsDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWlu
LmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gaW5kZXggZWYxODEyZGMxNDAyLi4zZTNj
Zjg4YzljODIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPiArKysg
Yi94ZW4vYXJjaC94ODYvZG9tYWluLmMNCj4gQEAgLTg4MCw2ICs4ODAsMTIgQEAgaW50IGFy
Y2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgICByZXR1cm4gcmM7
DQo+ICAgfQ0KPiAgIA0KPiArdW5zaWduZWQgaW50DQo+ICthcmNoX2dldF9kb21haW5fY3B1
cG9vbF9pZChjb25zdCBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykN
Cj4gK3sNCj4gKyAgICByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgIHZvaWQgYXJjaF9kb21h
aW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgIHsNCj4gICAgICAgaWYgKCBpc19o
dm1fZG9tYWluKGQpICkNCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94
ZW4vY29tbW9uL2RvbWFpbi5jDQo+IGluZGV4IDIwNDhlYmFkODZmZi4uZDQyY2E4MjkyMDI1
IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ICsrKyBiL3hlbi9jb21t
b24vZG9tYWluLmMNCj4gQEAgLTY2NSw2ICs2NjUsOCBAQCBzdHJ1Y3QgZG9tYWluICpkb21h
aW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsDQo+ICAgDQo+ICAgICAgIGlmICggIWlzX2lkbGVf
ZG9tYWluKGQpICkNCj4gICAgICAgew0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgZG9tYWlu
X2NwdXBvb2xfaWQ7DQo+ICsNCj4gICAgICAgICAgIHdhdGNoZG9nX2RvbWFpbl9pbml0KGQp
Ow0KPiAgICAgICAgICAgaW5pdF9zdGF0dXMgfD0gSU5JVF93YXRjaGRvZzsNCj4gICANCj4g
QEAgLTY5OCw3ICs3MDAsOCBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlk
X3QgZG9taWQsDQo+ICAgICAgICAgICBpZiAoICFkLT5wYnVmICkNCj4gICAgICAgICAgICAg
ICBnb3RvIGZhaWw7DQo+ICAgDQo+IC0gICAgICAgIGlmICggKGVyciA9IHNjaGVkX2luaXRf
ZG9tYWluKGQsIDApKSAhPSAwICkNCj4gKyAgICAgICAgZG9tYWluX2NwdXBvb2xfaWQgPSBh
cmNoX2dldF9kb21haW5fY3B1cG9vbF9pZChjb25maWcpOw0KPiArICAgICAgICBpZiAoIChl
cnIgPSBzY2hlZF9pbml0X2RvbWFpbihkLCBkb21haW5fY3B1cG9vbF9pZCkpICE9IDAgKQ0K
PiAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4gICANCj4gICAgICAgICAgIGlmICggKGVy
ciA9IGxhdGVfaHdkb21faW5pdChkKSkgIT0gMCApDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC1hcm0uaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5o
DQo+IGluZGV4IDk0YjMxNTExZGRlYS4uMmM1ZDFlYTdmMDFhIDEwMDY0NA0KPiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaA0KPiArKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC1hcm0uaA0KPiBAQCAtMzIxLDYgKzMyMSw4IEBAIHN0cnVjdCB4ZW5fYXJjaF9k
b21haW5jb25maWcgew0KPiAgICAgICB1aW50MTZfdCB0ZWVfdHlwZTsNCj4gICAgICAgLyog
SU4gKi8NCj4gICAgICAgdWludDMyX3QgbnJfc3BpczsNCj4gKyAgICAvKiBJTiAqLw0KPiAr
ICAgIHVuc2lnbmVkIGludCBjcHVwb29sX2lkOw0KDQpBcyBzYWlkIGFib3ZlOiB3aHkgaXMg
dGhpcyBhcmNoIHNwZWNpZmljPyBNb3ZpbmcgaXQgdG8gdGhlIGNvbW1vbiBwYXJ0DQp3b3Vs
ZCBlbmFibGUgbGlieGwgdG8gZ2V0IHJpZCBvZiBoYXZpbmcgdG8gY2FsbCB4Y19jcHVwb29s
X21vdmVkb21haW4oKQ0KaW4gbGlieGxfX2RvbWFpbl9tYWtlKCkuDQoNCg0KSnVlcmdlbg0K

--------------D659Q4h09ZboVdOfQisu0DX1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------D659Q4h09ZboVdOfQisu0DX1--

--------------wsR7P9fTHrsPlrF6ZT9c6yQj--

--------------sXbYd4uAD0j500VcPyIWXPS3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmILhvcFAwAAAAAACgkQsN6d1ii/Ey/s
6Af/XTtRR6pij8LgrJYf/C5KpzaslYH2tRbmKhyafs9P4tkESFkVZd2hM1AW4UpJpjku1VjBrG2L
QCLx7K/NgTtjtobkrmHSmgjebE4Mv+N7j7KRRAcPfjMbt6raAN3tnkeJMM9TV1FR2NLNn7G5cxkE
SDIT2Gk+AOPpLhYuVwRBVxLdO6mClnxB5dQwIsLMpNEsahQMJL5HKsUxYhe0R6KISzpi8wwUNcvS
HXZ66ROBA0X7vYSoE1+CjTrACqqpRm0A0wCUCnObNqz/1297H/BePN1/gaHungpEBuUPZN5UeFz1
/sz1js9C2yW+EKRPKgI31nJXu6ywf+RNO28NcS9zXw==
=TFoi
-----END PGP SIGNATURE-----

--------------sXbYd4uAD0j500VcPyIWXPS3--

