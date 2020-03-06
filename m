Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CC217BF60
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:42:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADCI-0004nN-QQ; Fri, 06 Mar 2020 13:39:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jADCH-0004nH-4M
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:39:25 +0000
X-Inumbo-ID: e4021fc2-5faf-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4021fc2-5faf-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:39:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5FEB9AC67;
 Fri,  6 Mar 2020 13:39:23 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-4-pdurrant@amzn.com>
 <7d66a1b0-ca7b-500b-73c4-140ab32f0c4e@suse.com>
 <d49c47b701af4198bdb113dfe11ee08f@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <008c1b23-e347-2306-4ca7-e9b84aeabec6@suse.com>
Date: Fri, 6 Mar 2020 14:39:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d49c47b701af4198bdb113dfe11ee08f@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM when constructing dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "pdurrant@amzn.com" <pdurrant@amzn.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxMzowMywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoCj4+IFNlbnQ6IDA2IE1h
cmNoIDIwMjAgMTE6NTYKPj4gVG86IHBkdXJyYW50QGFtem4uY29tCj4+IENjOiB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51
az47IFJvZ2VyIFBhdSBNb25uw6kKPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpIExpdSA8
d2xAeGVuLm9yZz47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+
IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMgMy82XSB4ODYgLyBwdjogZG8gbm90
IHRyZWF0IFBHQ19leHRyYSBwYWdlcyBhcyBSQU0gd2hlbgo+PiBjb25zdHJ1Y3RpbmcgZG9tMAo+
Pgo+PiBPbiAwNS4wMy4yMDIwIDEzOjQ1LCBwZHVycmFudEBhbXpuLmNvbSB3cm90ZToKPj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9w
di9kb20wX2J1aWxkLmMKPj4+IEBAIC03OTIsNiArNzkyLDEwIEBAIGludCBfX2luaXQgZG9tMF9j
b25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwKPj4+ICAgICAgewo+Pj4gICAgICAgICAgbWZu
ID0gbWZuX3gocGFnZV90b19tZm4ocGFnZSkpOwo+Pj4gICAgICAgICAgQlVHX09OKFNIQVJFRF9N
MlAoZ2V0X2dwZm5fZnJvbV9tZm4obWZuKSkpOwo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCBwYWdl
LT5jb3VudF9pbmZvICYgUEdDX2V4dHJhICkKPj4+ICsgICAgICAgICAgICBjb250aW51ZTsKPj4K
Pj4gVGhpcyBzdXJlbHkgaXMgYSBwYXR0ZXJuLCBpLmUuIHRoZXJlIGFyZSBtb3JlIHNpbWlsYXIg
Y2hhbmdlcyB0bwo+PiBtYWtlOiB0Ym9vdF9nZW5fZG9tYWluX2ludGVncml0eSgpIGUuZy4gaWdu
b3JlcyBkLT54ZW5wYWdlX2xpc3QsCj4+IGFuZCBoZW5jZSB3aXRoIHRoZSBnb2FsIG9mIGNvbnZl
cnRpbmcgdGhlIHNoYXJlZCBpbmZvIHBhZ2Ugd291bGQKPj4gYWxzbyB3YW50IGFkanVzdG1lbnQu
IEZvciBkdW1wX251bWEoKSBpdCBtYXkgYmUgbGVzcyBpbXBvcnRhbnQsCj4+IGJ1dCBpdCB3b3Vs
ZCBzdGlsbCBsb29rIG1vcmUgY29ycmVjdCBpZiBpdCB0b28gZ290IGNoYW5nZWQuCj4+IGF1ZGl0
X3AybSgpIG1pZ2h0IGFwcGFyZW50bHkgY29tcGxhaW4gYWJvdXQgc3VjaCBwYWdlcyAoYW5kCj4+
IGhlbmNlIG1pZ2h0IGJlIGEgcHJvYmxlbSB3aXRoIHRoZSBvbmUgUEdDX2V4dHJhIHBhZ2UgVk1Y
IGRvbWFpbnMKPj4gbm93IGhhdmUpLiBBbmQgdGhpcyBpcyBvbmx5IGZyb20gbWUgbG9va2luZyBh
dAo+PiBwYWdlX2xpc3RfZm9yX2VhY2goLi4uLCAmZC0+cGFnZV9saXN0KSBjb25zdHJ1Y3RzOyB3
aG8ga25vd3MKPj4gd2hhdCBlbHNlIHRoZXJlIGlzLgo+Pgo+IAo+IFRob3NlIGFyZSBkZWFsdCB3
aXRoIGJ5IHRoZSBpc19zcGVjaWFsX3BhZ2UoKSBwYXRjaCBsYXRlciBvbiBJIHRoaW5rLgoKSGF2
aW5nIGFscmVhZHkgbG9va2VkIGF0IHRoYXQgcGF0Y2ggYXMgd2VsbCAtIEkgZG9uJ3QgdGhpbmsg
c28sIG5vLgpUaGF0IG9uZSBvbmx5IHJlcGxhY2VzIHVzZXMgb2YgaXNfeGVuX2hlYXBfcGFnZSgp
LCBidXQgZG9lc24ndCBhZGQKYW55IGNoZWNrcyB3aGVyZSBzdWNoIHVzZXMgc2ltcGx5IGFyZW4n
dCBuZWVkZWQgYmVjYXVzZSBjb2RlIGlzCmxvb2tpbmcgYXQgLT5wYWdlX2xpc3Qgb25seS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
