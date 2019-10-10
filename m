Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F94D2898
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 14:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIX67-0003uG-JC; Thu, 10 Oct 2019 11:59:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIX66-0003uB-6Z
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:59:10 +0000
X-Inumbo-ID: 5d14c830-eb55-11e9-9800-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d14c830-eb55-11e9-9800-12813bfff9fa;
 Thu, 10 Oct 2019 11:59:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5EBBCB19A;
 Thu, 10 Oct 2019 11:59:07 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191010113345.6867-1-roger.pau@citrix.com>
 <20191010113345.6867-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <189c6d8f-6e48-fdb2-7fa8-de870730cdc4@suse.com>
Date: Thu, 10 Oct 2019 13:59:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010113345.6867-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] iommu: translate IO-APIC pins when
 enabling interrupt remapping
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMjAxOSAxMzozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IE9uIEludGVsIGhh
cmR3YXJlIHRoZXJlJ3MgY3VycmVudGx5IG5vIHRyYW5zbGF0aW9uIG9mIGFscmVhZHkgZW5hYmxl
ZAo+IElPLUFQSUMgcGlucyB3aGVuIGludGVycnVwdCByZW1hcHBpbmcgaXMgZW5hYmxlZCBvbiB0
aGUgSU9NTVUsIGhlbmNlCj4gaW50cm9kdWNlIGEgbG9naWMgc2ltaWxhciB0byB0aGUgb25lIHVz
ZWQgaW4geDJhcGljX2JzcF9zZXR1cCBpbiBvcmRlcgo+IHRvIHNhdmUgYW5kIG1hc2sgYWxsIElP
LUFQSUMgcGlucywgYW5kIHRoZW4gdHJhbnNsYXRlIGFuZCByZXN0b3JlIHRoZW0KPiBhZnRlciBp
bnRlcnJ1cHQgcmVtYXBwaW5nIGhhcyBiZWVuIGVuYWJsZWQuCj4gCj4gV2l0aCB0aGlzIGNoYW5n
ZSB0aGUgQU1EIHNwZWNpZmljIGxvZ2ljIHRvIGRlYWwgd2l0aCBlbmFibGVkIHBpbnMKPiAoYW1k
X2lvbW11X3NldHVwX2lvYXBpY19yZW1hcHBpbmcpIGNhbiBiZSByZW1vdmVkLCB0aHVzIHVuaWZ5
aW5nIHRoZQo+IGhhbmRsaW5nIG9mIElPLUFQSUMgd2hlbiBlbmFibGluZyBpbnRlcnJ1cHQgcmVt
YXBwaW5nIHJlZ2FyZGxlc3Mgb2YKPiB0aGUgSU9NTVUgdmVuZG9yLgo+IAo+IFJlcG9ydGVkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhlIGFjdHVhbCBj
b2RlIGNoYW5nZQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpi
dXQgcGxlYXNlIG1lbnRpb24gaGVyZSBhcyB3ZWxsIHRoYXQgdGhlIEV4dEludCBjYXNlIGNvbnRp
bnVlcyB0byBiZQpicm9rZW4gaW4gdGhlIEFNRCBjYXNlLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
