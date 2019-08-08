Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C839A85B88
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:26:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcm9-0002ff-Vo; Thu, 08 Aug 2019 07:23:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvcm8-0002fa-2o
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:23:52 +0000
X-Inumbo-ID: 75f23664-b9ad-11e9-a690-e72accf20e74
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75f23664-b9ad-11e9-a690-e72accf20e74;
 Thu, 08 Aug 2019 07:23:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B704AD3E;
 Thu,  8 Aug 2019 07:23:46 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-3-jgross@suse.com>
 <ab0314ec-9af8-e1b3-343c-b7183152418d@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0db0162e-6d43-7540-4d4a-c53605b57eeb@suse.com>
Date: Thu, 8 Aug 2019 09:23:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ab0314ec-9af8-e1b3-343c-b7183152418d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG
 option
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMDg6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA3LjA4LjIwMTkgMTY6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCj4+ICsr
KyBiL3hlbi9LY29uZmlnLmRlYnVnCj4+IEBAIC00NCw2ICs0NCwxMyBAQCBjb25maWcgQ09WRVJB
R0UKPj4gwqDCoMKgwqDCoMKgwqAgSWYgdW5zdXJlLCBzYXkgTiBoZXJlLgo+PiArY29uZmlnIFNQ
SU5MT0NLX0RFQlVHCj4+ICvCoMKgwqAgYm9vbCAiU3BpbmxvY2sgZGVidWdnaW5nIgo+PiArwqDC
oMKgIGRlZmF1bHQgREVCVUcKPj4gK8KgwqDCoCAtLS1oZWxwLS0tCj4+ICvCoMKgwqDCoMKgIEVu
YWJsZSBkZWJ1Z2dpbmcgZmVhdHVyZXMgb2Ygc3BpbmxvY2sgaGFuZGxpbmcuwqAgU29tZSBhZGRp
dGlvbmFsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY2hlY2tzIHdpbGwgYmUgcGVyZm9ybWVkIHdo
ZW4gYWNxdWlyaW5nIGFuZCByZWxlYXNpbmcgbG9ja3MuCj4+ICsKPj4gwqAgY29uZmlnIExPQ0tf
UFJPRklMRQo+IAo+IFdoaWxlIHRoZSBwcmUtZXhpc3RpbmcgTE9DS19QUk9GSUxFIHN1Z2dlc3Rz
IHRoZSBvcHBvc2l0ZSwgSSdkCj4gc3RpbGwgbGlrZSB0byBwcm9wb3NlIHRoYXQgd2UgdW5pZm9y
bWx5IG5hbWUgYWxsIGRlYnVnZ2luZwo+IG9wdGlvbnMgQ09ORklHX0RFQlVHXyogKHJhdGhlciB0
aGFuIGhhdmluZyB0aGUgREVCVUcgYXQgdGhlCj4gZW5kKS4gVGhvdWdodHM/CgpGaW5lIHdpdGgg
bWUuIEkgY2FuIHJlbmFtZSB0aGUgTE9DS19QUk9GSUxFIG9wdGlvbiBpbiBwYXRjaCA0IGFzIEkn
bQp0b3VjaGluZyBpdCBhbnl3YXkuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
