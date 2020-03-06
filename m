Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7217BDB9
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:08:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jACgR-0000cI-F4; Fri, 06 Mar 2020 13:06:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jACgQ-0000c8-64
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:06:30 +0000
X-Inumbo-ID: 4b1564ee-5fab-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b1564ee-5fab-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:06:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6C55AEF5;
 Fri,  6 Mar 2020 13:06:28 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-3-pdurrant@amzn.com>
 <5c8e1d01-74e8-ed77-5900-9419c010b407@suse.com>
 <a135e3321e9941a9b25055e858fc5313@EX13D32EUC003.ant.amazon.com>
 <9beb5129-68c0-ce68-2778-748a4485f6fb@suse.com>
 <cddc7c8d65b6444a9c44f075fdca3b93@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e5296fe-4162-8f1e-7497-57359334a902@suse.com>
Date: Fri, 6 Mar 2020 14:06:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <cddc7c8d65b6444a9c44f075fdca3b93@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amzn.com" <pdurrant@amzn.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzo1MCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAwNiBNYXJjaCAyMDIwIDEyOjQ3Cj4+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY28udWs+Cj4+IENjOiBwZHVycmFudEBhbXpuLmNvbTsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsKPj4gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiBT
dWJqZWN0OiBSZTogW1BBVENIIHYzIDIvNl0geDg2IC8gcDJtOiByZW1vdmUgcGFnZV9saXN0IGNo
ZWNrIGluIHAybV9hbGxvY190YWJsZQo+Pgo+PiBPbiAwNi4wMy4yMDIwIDEzOjA3LCBEdXJyYW50
LCBQYXVsIHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4+IFNlbnQ6IDA2IE1hcmNoIDIwMjAg
MTE6NDYKPj4+PiBUbzogcGR1cnJhbnRAYW16bi5jb20KPj4+PiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+OyBB
bmRyZXcgQ29vcGVyCj4+Pj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9n
ZXIKPj4gUGF1Cj4+Pj4gTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+PiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDIvNl0geDg2IC8gcDJtOiByZW1vdmUgcGFnZV9saXN0IGNoZWNrIGlu
IHAybV9hbGxvY190YWJsZQo+Pj4+Cj4+Pj4gT24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRA
YW16bi5jb20gd3JvdGU6Cj4+Pj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9u
LmNvbT4KPj4+Pj4KPj4+Pj4gVGhlcmUgZG9lcyBub3Qgc2VlbSB0byBiZSBhbnkganVzdGlmaWNh
dGlvbiBmb3IgcmVmdXNpbmcgdG8gY3JlYXRlIHRoZQo+Pj4+PiBkb21haW4ncyBwMm0gdGFibGUg
c2ltcGx5IGJlY2F1c2UgaXQgbWF5IGhhdmUgYXNzaWduZWQgcGFnZXMuCj4+Pj4KPj4+PiBJIHRo
aW5rIHRoZXJlIGlzOiBJZiBhbnkgc3VjaCBhbGxvY2F0aW9uIGhhZCBoYXBwZW5lZCBiZWZvcmUs
IGhvdwo+Pj4+IHdvdWxkIGl0IGJlIHJlcHJlc2VudGVkIGluIHRoZSBkb21haW4ncyBwMm0/Cj4+
Pgo+Pj4gSW5zZXJ0aW9uIGludG8gdGhlIHAybSBpcyBhIHNlcGFyYXRlIGFjdGlvbiBmcm9tIHBh
Z2UgYWxsb2NhdGlvbi4gV2h5IHNob3VsZCB0aGV5IGJlIGxpbmtlZD8KPj4KPj4gVGhleSBhcmUs
IGJlY2F1c2Ugb2YgaG93IFhFTk1FTV9wb3B1bGF0ZV9waHlzbWFwIHdvcmtzLiBZZXMsCj4+IHRo
ZXkgX2NvdWxkXyBiZSBzZXBhcmF0ZSBzdGVwcywgYnV0IHRoYXQncyBvbmx5IGEgdGhlb3JldGlj
YWwKPj4gY29uc2lkZXJhdGlvbi4KPiAKPiBUaGVuIHN1cmVseSB0aGUgY2hlY2sgc2hvdWxkIGJl
IGluIHRoZSBYRU5NRU1fcG9wdWxhdGVfcGh5c21hcCBjb2RlPwoKSG93IHRoYXQ/IHBvcHVsYXRl
LXBoeXNtYXAgY2FuIGJlIGNhbGxlZCBhbnkgbnVtYmVyIG9mIHRpbWVzLiBXZQpjYW4ndCByZWZ1
c2UgYSAybmQgY2FsbCB0aGVyZSBqdXN0IGJlY2F1c2UgYSAxc3Qgb25lIGhhZCBoYXBwZW5lZAph
bHJlYWR5LiBPciBkaWQgeW91IG1lYW4gdGhlIGludmVyc2UgY2hlY2sgKGkuZS4gdGhhdCB0aGVy
ZQphbHJlYWR5IGlzIGEgcDJtKT8gVGhpcyBzdXJlbHkgd291bGRuJ3QgYmUgYSBiYWQgaWRlYSwg
YXMKb3RoZXJ3aXNlIGJvdGggZXB0X2dldF9lbnRyeSgpIGFuZCBwMm1fcHRfZ2V0X2VudHJ5KCkg
d291bGQKYmxpbmRseSBtYXAgTUZOIDAuIEJ1dCBhZGRpbmcgc3VjaCBhIGNoZWNrIHdvdWxkbid0
IGVsaW1pbmF0ZQp0aGUgcmVhc29uIHRvIGFsc28gaGF2ZSB0aGUgY2hlY2sgdGhhdCB5b3UncmUg
cHJvcG9zaW5nIHRvIGRyb3AuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
