Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47211778C1
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:25:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j98QI-0006i7-P5; Tue, 03 Mar 2020 14:21:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j98QH-0006i2-SI
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:21:25 +0000
X-Inumbo-ID: 4327ff1a-5d5a-11ea-8adc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4327ff1a-5d5a-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 14:21:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9B8CCB2D2;
 Tue,  3 Mar 2020 14:21:23 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
 <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
Date: Tue, 3 Mar 2020 15:21:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
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
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxNDoxNiwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDAz
IE1hcmNoIDIwMjAgMTA6MTcKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBh
dSBNb25uw6kKPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBbRVhURVJOQUxdW1hlbi1k
ZXZlbF0gW1BBVENIIHY1IDEvNF0geDg2L0hWTTogY2FuY2VsIGVtdWxhdGlvbgo+PiB3aGVuIHJl
Z2lzdGVyIHN0YXRlIGdvdCBhbHRlcmVkCj4+Cj4+IFJlLWV4ZWN1dGlvbiAoYWZ0ZXIgaGF2aW5n
IHJlY2VpdmVkIGRhdGEgZnJvbSBhIGRldmljZSBtb2RlbCkgcmVsaWVzIG9uCj4+IHRoZSBzYW1l
IHJlZ2lzdGVyIHN0YXRlIHN0aWxsIGJlaW5nIGluIHBsYWNlIGFzIGl0IHdhcyB3aGVuIHRoZSBy
ZXF1ZXN0Cj4+IHdhcyBmaXJzdCBzZW50IHRvIHRoZSBkZXZpY2UgbW9kZWwuIFRoZXJlZm9yZSB2
Q1BVIHN0YXRlIGNoYW5nZXMKPj4gZWZmZWN0ZWQgYnkgcmVtb3RlIHNvdXJjZXMgbmVlZCB0byBy
ZXN1bHQgaW4gbm8gYXR0ZW1wdCBvZiByZS1leGVjdXRpb24uCj4+IEluc3RlYWQgdGhlIHJldHVy
bmVkIGRhdGEgaXMgdG8gc2ltcGx5IGJlIGlnbm9yZWQuCj4+Cj4+IE5vdGUgdGhhdCBhbnkgc3Vj
aCBhc3luY2hyb25vdXMgc3RhdGUgY2hhbmdlcyBoYXBwZW4gd2l0aCB0aGUgdkNQVSBhdAo+PiBs
ZWFzdCBwYXVzZWQgKHBvdGVudGlhbGx5IGRvd24gYW5kL29yIG5vdCBtYXJrZWQgLT5pc19pbml0
aWFsaXNlZCksIHNvCj4+IHRoZXJlJ3Mgbm8gaXNzdWUgd2l0aCBmaWRkbGluZyB3aXRoIHJlZ2lz
dGVyIHN0YXRlIGJlaGluZCB0aGUgYWN0aXZlbHkKPj4gcnVubmluZyBlbXVsYXRvcidzIGJhY2su
IEhlbmNlIHRoZSBuZXcgZnVuY3Rpb24gZG9lc24ndCBuZWVkIHRvCj4+IHN5bmNocm9uaXplIHdp
dGggdGhlIGNvcmUgZW11bGF0aW9uIGxvZ2ljLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBOZWVkIHdlIGJlIGNvbmNlcm5lZCB3aXRo
IGFueSBwYWdlLXNwbGl0IEkvTyBoZXJlPyBUaGF0IG1heSBtYW5pZmVzdCBhcwo+IHR3byBzZXBh
cmF0ZSBlbXVsYXRpb25zIGFuZCBBRkFJQ1QgaXQgd291bGQgYmUgcG9zc2libGUgZm9yIG9ubHkg
dGhlCj4gc2Vjb25kIHBhcnQgdG8gYmUgYWJvcnRlZCBieSB0aGlzIGNoYW5nZS4KCkknbSBub3Qg
c3VyZSB3aGV0aGVyIGUuZy4gSU5JVCBpcyByZWNvZ25pemVkIG9ubHkgb24gaW5zbiBib3VuZGFy
aWVzLgpJLmUuIHRoaXMgbWF5IG5vdCBiZSB0aGF0IGRpZmZlcmVudCBmcm9tIHJlYWwgaGFyZHdh
cmUgYmVoYXZpb3IuIF9JZl8Kd2Ugd2VyZSB0byB0YWtlIGNhcmUgb2YgdGhpcywgaG93IHdvdWxk
IHlvdSBlbnZpc2lvbiB1bmRvaW5nIHRoZQpmaXJzdCBwYXJ0IG9mIHN1Y2ggYW4gYWNjZXNzLCBt
b3N0IG5vdGFibHkgd2hlbiB0aGUgYWNjZXNzIGhhcyBzaWRlCmVmZmVjdHM/CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
