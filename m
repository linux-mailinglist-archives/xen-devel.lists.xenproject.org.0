Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9808C14DF4F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:39:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCp3-0008MH-Vh; Thu, 30 Jan 2020 16:37:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixCp2-0008MC-8H
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:37:40 +0000
X-Inumbo-ID: d3f237e0-437e-11ea-8ab9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3f237e0-437e-11ea-8ab9-12813bfff9fa;
 Thu, 30 Jan 2020 16:37:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 75075AD5D;
 Thu, 30 Jan 2020 16:37:38 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-3-pdurrant@amazon.com>
 <93af32a7-963f-6978-4d37-80e471c1832f@suse.com>
 <700c3e466b8245a28bcb530bb15d4c4e@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b7e8208-6b05-479d-ca3b-5c548cb235b2@suse.com>
Date: Thu, 30 Jan 2020 17:37:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <700c3e466b8245a28bcb530bb15d4c4e@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 2/4] add a domain_tot_pages() helper
 function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNzozMiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAzMCBKYW51YXJ5IDIwMjAgMTY6MjkKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4KPj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
QW5kcmV3IENvb3Blcgo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpCj4+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT47IElhbgo+PiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IEtvbnJhZAo+PiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFN0
ZWZhbm8gU3RhYmVsbGluaQo+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSBEZWVnYW4g
PHRpbUB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIvNF0gYWRkIGEgZG9tYWlu
X3RvdF9wYWdlcygpIGhlbHBlciBmdW5jdGlvbgo+Pgo+PiBPbiAzMC4wMS4yMDIwIDE1OjU3LCBQ
YXVsIER1cnJhbnQgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+Pj4gQEAgLTIxOCw3ICsyMTgsNyBAQCB2b2lkIGR1
bXBfcGFnZWZyYW1lX2luZm8oc3RydWN0IGRvbWFpbiAqZCkKPj4+Cj4+PiAgICAgIHByaW50aygi
TWVtb3J5IHBhZ2VzIGJlbG9uZ2luZyB0byBkb21haW4gJXU6XG4iLCBkLT5kb21haW5faWQpOwo+
Pj4KPj4+IC0gICAgaWYgKCBkLT50b3RfcGFnZXMgPj0gMTAgJiYgZC0+aXNfZHlpbmcgPCBET01E
WUlOR19kZWFkICkKPj4+ICsgICAgaWYgKCBkb21haW5fdG90X3BhZ2VzKGQpID49IDEwICYmIGQt
PmlzX2R5aW5nIDwgRE9NRFlJTkdfZGVhZCApCj4+Cj4+IEJlZm9yZSBJIGdvIGFueSBmdXJ0aGVy
IC0gYXJlIHlvdSBzaW1wbHkgcmVwbGFjaW5nIF9hbGxfCj4+IC0+dG90X3BhZ2VzIHVzZXMgYnkg
dGhlIG5ldyBoZWxwZXI/Cj4gCj4gQmFzaWNhbGx5LCBhcGFydCBmcm9tIGRvbWFpbl9hZGp1c3Rf
dG90X3BhZ2VzKCksIHllcy4KPiAKPj4gSW4gdGhlIGNhc2UgaGVyZSwgZm9yCj4+IGV4YW1wbGUs
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB3aGF0IHdlIHdhbnQuCj4+Cj4gCj4gV2h5IG5vdD8gSSB3
b3VsZCBoYXZlIHRob3VnaHQgYW55ICdleHRyYScgcGFnZXMgd291bGQgYWx3YXlzIGJlIG9mIGlu
dGVyZXN0LgoKQ291bGQgYmUgaHVuZHJlZHMgb3IgdGhvdXNhbmRzIGluIHRoZSBmdXR1cmUuIEFz
IGxvbmcgYXMgaXQncyBpbgpyZWFsaXR5IGp1c3Qgb25lLCBwZXJoYXBzIGl0IGluZGVlZCBkb2Vz
bid0IG1hdHRlciBtdWNoLiBJJ2xsCnRha2UgYSBjbG9zZXIgbG9vayB0b21vcnJvdywgdG8gc2Vl
IGlmIHRoZXJlIGFyZSBvdGhlciBwbGFjZXMKd2hlcmUgdGhlIGFkanVzdGVkIGNvdW50IHdvdWxk
IGJldHRlciBub3QgYmUgdXNlZC4gRnJvbSBteQpwYXJ0aWFsIGF1ZGl0IGluIHRoZSBtb3JuaW5n
IEkgc2VlbSB0byByZWNhbGwgdGhhdCB0aGVyZSB3ZXJlCmJvdGgga2luZHMgb2Ygc2l0dWF0aW9u
cy4uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
