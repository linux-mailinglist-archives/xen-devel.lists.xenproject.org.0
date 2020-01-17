Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3C14123C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:23:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isY6e-0003Dn-K5; Fri, 17 Jan 2020 20:20:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Omz=3G=amazon.com=prvs=2780aa402=elnikety@srs-us1.protection.inumbo.net>)
 id 1isY6d-0003Di-7g
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:20:35 +0000
X-Inumbo-ID: d0476f07-3966-11ea-b612-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0476f07-3966-11ea-b612-12813bfff9fa;
 Fri, 17 Jan 2020 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579292433; x=1610828433;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+tlD41CSHCxgVGhkNLdxyNpabgGqVmtU69pGCh2cnlU=;
 b=kGKg17dm5edxUWtt5dIsDARuvyW8G8sN8OEwABGqI+IY578EGHdkSgqZ
 vP7lVwrnTdBGgNFaqHssX3+0YLGkmZW8mRpvCWTJ8WoCOE5nR2gUMWNcA
 +Ht1wdFyQ8iWnD1nqj3p4apPabKQOazasIjleDCh0PaO5S7Df8JBtIsqM c=;
IronPort-SDR: GWlQdruJkHkATOXWlcLtM+XPyUwfIs/5HoE2adi7sl3yCZx8bdYq323FdlxcW1FFOSAqsXG6jw
 z8ukbauBZbEQ==
X-IronPort-AV: E=Sophos;i="5.70,331,1574121600"; d="scan'208";a="12048875"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 17 Jan 2020 20:20:33 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3C7D9A25DF; Fri, 17 Jan 2020 20:20:29 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 17 Jan 2020 20:20:29 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.162.7) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 17 Jan 2020 20:20:23 +0000
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <cf29db3bde903a5788322381ef6eac1a6ed9b2b9.1576630344.git.elnikety@amazon.com>
 <729be010-5721-3eca-8a95-63987b61d897@suse.com>
 <e456ffdd-6c93-8f8c-9385-f169fa984dfb@amazon.com>
 <980abeb1-4c86-2618-9ab2-094af86d47ab@suse.com>
 <35344302-b1e6-01a5-955c-f600b3e94d5a@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <96ddd0d4-fb2f-c69b-997e-82738b7693bf@amazon.com>
Date: Fri, 17 Jan 2020 21:20:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <35344302-b1e6-01a5-955c-f600b3e94d5a@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.7]
X-ClientProxiedBy: EX13D11UWB001.ant.amazon.com (10.43.161.53) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/microcode: Support builtin CPU
 microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMTkgMTE6MzQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMjAuMTIuMTkgMTE6
MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxOS4xMi4yMDE5IDIzOjExLCBFc2xhbSBFbG5p
a2V0eSB3cm90ZToKPj4+IE9uIDE4LjEyLjE5IDEzOjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
PiBPbiAxOC4xMi4yMDE5IDAyOjMyLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4+Pj4gLS0tIC9k
ZXYvbnVsbAo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlL01ha2VmaWxlCj4+Pj4+
IEBAIC0wLDAgKzEsNDYgQEAKPj4+Pj4gKyMgQ29weXJpZ2h0IChDKSAyMDE5IEFtYXpvbi5jb20s
IEluYy4gb3IgaXRzIGFmZmlsaWF0ZXMuCj4+Pj4+ICsjIEF1dGhvcjogRXNsYW0gRWxuaWtldHkg
PGVsbmlrZXR5QGFtYXpvbi5jb20+Cj4+Pj4+ICsjCj4+Pj4+ICsjIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgCj4+Pj4+IG1vZGlm
eQo+Pj4+PiArIyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzIAo+Pj4+PiBwdWJsaXNoZWQgYnkKPj4+Pj4gKyMgdGhlIEZyZWUgU29mdHdhcmUg
Rm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKPj4+Pj4gKyMg
KGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPj4+Pj4gKyMKPj4+Pj4gKyMgVGhp
cyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2Vm
dWwsCj4+Pj4+ICsjIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBp
bXBsaWVkIHdhcnJhbnR5IG9mCj4+Pj4+ICsjIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS7CoCBTZWUgdGhlCj4+Pj4+ICsjIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4+Pj4+ICsKPj4+Pj4gKyMgUmVtb3ZlIHF1
b3RlcyBhbmQgZXhjZXNzIHNwYWNlcyBmcm9tIGNvbmZpZ3VyYXRpb24gc3RyaW5ncwo+Pj4+PiAr
VUNPREVfRElSPSQoc3RyaXAgJChzdWJzdCAkXCIsLCQoQ09ORklHX0JVSUxUSU5fVUNPREVfRElS
KSkpCj4+Pj4+ICtVQ09ERV9BTUQ9JChzdHJpcCAkKHN1YnN0ICRcIiwsJChDT05GSUdfQlVJTFRJ
Tl9VQ09ERV9BTUQpKSkKPj4+Pj4gK1VDT0RFX0lOVEVMPSQoc3RyaXAgJChzdWJzdCAkXCIsLCQo
Q09ORklHX0JVSUxUSU5fVUNPREVfSU5URUwpKSkKPj4+Pj4gKwo+Pj4+PiArIyBBTUQgYW5kIElO
VEVMIG1pY3JvY29kZSBibG9icy4gVXNlICd3aWxkY2FyZCcgdG8gZmlsdGVyIGZvciAKPj4+Pj4g
ZXhpc3RpbmcgYmxvYnMuCj4+Pj4+ICthbWQtYmxvYnMgOj0gJCh3aWxkY2FyZCAkKGFkZHByZWZp
eCAkKFVDT0RFX0RJUiksJChVQ09ERV9BTUQpKSkKPj4+Pj4gK2ludGVsLWJsb2JzIDo9ICQod2ls
ZGNhcmQgJChhZGRwcmVmaXggJChVQ09ERV9ESVIpLCQoVUNPREVfSU5URUwpKSkKPj4+Pj4gKwo+
Pj4+PiAraWZuZXEgKCQoYW1kLWJsb2JzKSwpCj4+Pj4+ICtvYmoteSArPSB1Y29kZV9hbWQubwo+
Pj4+PiArZW5kaWYKPj4+Pj4gKwo+Pj4+PiAraWZuZXEgKCQoaW50ZWwtYmxvYnMpLCkKPj4+Pj4g
K29iai15ICs9IHVjb2RlX2ludGVsLm8KPj4+Pj4gK2VuZGlmCj4+Pj4+ICsKPj4+Pj4gK2lmZXEg
KCQoYW1kLWJsb2JzKSQoaW50ZWwtYmxvYnMpLCkKPj4+Pj4gK29iai15ICs9IHVjb2RlX2R1bW15
Lm8KPj4+Pj4gK2VuZGlmCj4+Pj4+ICsKPj4+Pj4gK3Vjb2RlX2FtZC5vOiBNYWtlZmlsZSAkKGFt
ZC1ibG9icykKPj4+Pj4gK8KgwqDCoCBjYXQgJChhbWQtYmxvYnMpID4gJEAuYmluCj4+Pj4+ICvC
oMKgwqAgJChPQkpDT1BZKSAtSSBiaW5hcnkgLU8gZWxmNjQteDg2LTY0IC1CIGkzODY6eDg2LTY0
IAo+Pj4+PiAtLXJlbmFtZS1zZWN0aW9uIAo+Pj4+PiAuZGF0YT0uYnVpbHRpbl9hbWRfdWNvZGUs
YWxsb2MsbG9hZCxyZWFkb25seSxkYXRhLGNvbnRlbnRzICRALmJpbiAkQAo+Pj4+PiArwqDCoMKg
IHJtIC1mICRALmJpbgo+Pj4+PiArCj4+Pj4+ICt1Y29kZV9pbnRlbC5vOiBNYWtlZmlsZSAkKGlu
dGVsLWJsb2JzKQo+Pj4+PiArwqDCoMKgIGNhdCAkKGludGVsLWJsb2JzKSA+ICRALmJpbgo+Pj4+
PiArwqDCoMKgICQoT0JKQ09QWSkgLUkgYmluYXJ5IC1PIGVsZjY0LXg4Ni02NCAtQiBpMzg2Ong4
Ni02NCAKPj4+Pj4gLS1yZW5hbWUtc2VjdGlvbiAKPj4+Pj4gLmRhdGE9LmJ1aWx0aW5faW50ZWxf
dWNvZGUsYWxsb2MsbG9hZCxyZWFkb25seSxkYXRhLGNvbnRlbnRzICRALmJpbiAkQAo+Pj4+PiAr
wqDCoMKgIHJtIC1mICRALmJpbgo+Pj4+Cj4+Pj4gVGhpcyBjYW4gYmUgaGFkIHdpdGggYSBwYXR0
ZXJuIHJ1bGUgKHdpdGggdGhlIHZlbmRvciBiZWluZyB0aGUgc3RlbSkKPj4+PiBhbmQgaGVuY2Ug
d2l0aG91dCBkdXBsaWNhdGlvbiwgSSB0aGluay4KPj4+Pgo+Pj4+IEFsc28gLSBpcyBzaW1wbHkg
Y29uY2F0ZW5hdGluZyB0aGUgYmxvYnMgcmVsaWFibGUgZW5vdWdoPyBUaGVyZSdzIG5vCj4+Pj4g
YnVpbGQgdGltZSBkaWFnbm9zdGljIHRoYXQgdGhlIHJlc3VsdCB3b3VsZCBhY3R1YWxseSBiZSB1
bmRlcnN0b29kCj4+Pj4gYXQgcnVudGltZS4KPj4+Pgo+Pj4KPj4+IENvbmNhdGVuYXRpb24gaXMg
cmVsaWFibGUgKGFzIGxvbmcgYXMgdGhlIGluZGl2aWR1YWwgbWljcm9jb2RlIGJsb2JzIGFyZQo+
Pj4gbm90IG1hbGZvcm1lZCwgYW5kIGluIHRoYXQgY2FzZSB0aGUgYnVpbHRpbiBpcyBub3QgbWFr
aW5nIG1hdHRlcnMgd29yc2UKPj4+IGNvbXBhcmVkIHRvIHByZXNlbnRpbmcgdGhlIG1hbGZvcm1l
ZCB1cGRhdGUgdmlhIDxpbnRlZ2VyPiB8IHNjYW4pLgo+Pgo+PiBBIG1hbGZvcm1lZCB1cGRhdGUg
Zm91bmQgdGhlIG90aGVyIHdheSBpcyBhIGJ1ZyBpbiB0aGUgdG9vbHMKPj4gY29uc3RydWN0aW5n
IHRoZSByZXNwZWN0aXZlIGltYWdlcy4gQSBtYWxmb3JtZWQgYnVpbHQtaW4KPj4gdXBkYXRlIGlz
IGEgYnVnIGluIHRoZSBYZW4gYnVpbGQgc3lzdGVtLiBUaGUgcHV0IHRoZSBxdWVzdGlvbgo+PiBk
aWZmZXJlbnRseTogSXMgaXQgc3BlY2lmaWVkIHNvbWV3aGVyZSB0aGF0IHRoZSBibG9icyBhbGwg
aGF2ZQo+PiB0byBoYXZlIGNlcnRhaW4gcHJvcGVydGllcywgd2hpY2ggdGhlIHN0cmFpZ2h0IGNv
bmNhdGVuYXRpb24KPj4gcmVsaWVzIHVwb24/Cj4+Cj4+Pj4+ICt1Y29kZV9kdW1teS5vOiBNYWtl
ZmlsZQo+Pj4+PiArwqDCoMKgICQoQ0MpICQoQ0ZMQUdTKSAtYyAteCBjIC9kZXYvbnVsbCAtbyAk
QDsKPj4+Pgo+Pj4+IFNpbmNlIHRoZSBjb21taXQgbWVzc2FnZSBkb2Vzbid0IGV4cGxhaW4gd2h5
IHRoaXMgaXMgbmVlZGVkLCBJCj4+Pj4gaGF2ZSB0byBhc2sgKEkgZ3Vlc3Mgd2Ugc29tZXdoZXJl
IGhhdmUgYSBkZXBlbmRlbmN5IG9uICQob2JqLXkpCj4+Pj4gbm90IGJlaW5nIGVtcHR5KS4KPj4+
Cj4+PiBZb3VyIGd1ZXNzIGlzIGNvcnJlY3QuIEFsbCBzdWItZGlyZWN0b3JpZXMgb2YgeGVuL2Fy
Y2gveDg2IGFyZSBleHBlY3RlZAo+Pj4gdG8gcHJvZHVjZSBidWlsdF9pbi5vLiBJZiB0aGVyZSBh
cmUgbm90IGFtZCBub3IgaW50ZWwgbWljcm9jb2RlIGJsb2JzLAo+Pj4gdGhlcmUgd2lsbCBiZSBu
byBidWlsZCBkZXBlbmRlbmNpZXMgYW5kIHRoZSBidWlsZCBmYWlscyBwcmVwYXJpbmcgdGhlCj4+
PiBidWlsdF9pbi5vCj4+Cj4+IFRoYXQncyByYXRoZXIgcG9vciwgYnV0IGl0J3Mgb2YgY291cnNl
IG5vdCB5b3VyIHRhc2sgdG8gZ2V0IHRoaXMKPj4gZml4ZWQgKGl0IHNob3VsZG4ndCBiZSB2ZXJ5
IGRpZmZpY3VsdCB0byBjcmVhdGUgYW4gZW1wdHkKPj4gYnVpbHRfaW4ubyBmb3IgYW4gZW1wdHkg
JChvYmoteSkpLgo+Pgo+Pj4+IF9JZl8gaXQgaXMgbmVlZGVkLCBJIGRvbid0IHNlZSB3aHkgeW91
IG5lZWQKPj4+PiBpZmVxKCkgYXJvdW5kIGl0cyB1c2UuIEluIGZhY3QgeW91IGNvdWxkIGhhdmUK
Pj4+Pgo+Pj4+IG9iai15IDo9IHVjb2RlLWR1bW15Lm8KPj4+Pgo+Pj4+IHJpZ2h0IGF0IHRoZSB0
b3Agb2YgdGhlIGZpbGUuCj4+Pj4KPj4+PiBGdXJ0aGVybW9yZSBJIGRvbid0IHJlYWxseSB1bmRl
cnN0YW5kIHdoeSB5b3UgbmVlZCB0aGlzIGluIHRoZQo+Pj4+IGZpcnN0IHBsYWNlLiBXaGlsZSBj
YXQgd29uJ3QgZG8gd2hhdCB5b3Ugd2FudCB3aXRoIGFuIGVtcHR5Cj4+Pj4gYXJndW1lbnQgbGlz
dCwgY2FuJ3QgeW91IHNpbXBseSBwcmVwZW5kIC8gYXBwZW5kIC9kZXYvbnVsbD8KPj4+Pgo+Pj4K
Pj4+IFRvIG1ha2Ugc3VyZSB3ZSBhcmUgb24gdGhlIHNhbWUgcGFnZS4gWW91IGFyZSBzdWdnZXN0
aW5nIHVzaW5nCj4+PiAiL2Rldi9udWxsIiBpbiBjYXNlIHRoZXJlIGFyZSBubyBhbWQvaW50ZWwg
dWNvZGUgdG8gZ2VuZXJhdGUgdGhlCj4+PiB1Y29kZV9hbWQvaW50ZWwubz8gSWYgc28sIG9iamNv
cHkgZG9lcyBub3QgYWxsb3cgdXNpbmcgL2Rldi9udWxsIGFzCj4+PiBpbnB1dCAoY29tcGxhaW5z
IGFib3V0IGVtcHR5IGJpbmFyeSkuCj4+Cj4+IFRoYXQncyBhZ2FpbiByYXRoZXIgcG9vciwgdGhp
cyB0aW1lIG9mIHRoZSB1dGlsaXR5IC0gaXQgc2hvdWxkIGJlCj4+IGVhc3kgZW5vdWdoIHRvIHBy
b2R1Y2UgYW4gb2JqZWN0IHdpdGggYW4gZW1wdHkgLmRhdGEgKG9yIHdoYXRldmVyCj4+IGl0IGlz
KSBzZWN0aW9uLiBBcyBhYm92ZSAtIEknbSBmaW5lIHdpdGggeW91IGtlZXBpbmcgdGhlIGxvZ2lj
Cj4+IHRoZW4gYXMgaXMsIHByb3ZpZGVkIHlvdSBzYXkgaW4gdGhlIGRlc2NyaXB0aW9uIHdoeSBp
dCBjYW4ndCBiZQo+PiBzaW1wbGlmaWVkLgo+IAo+IFdoYXQgYWJvdXQgdXNpbmcgdGhlIGF0dGFj
aGVkIHBhdGNoIGZvciBpbmNsdWRpbmcgdGhlIGJpbmFyeSBmaWxlcz8KPiAKPiBJIHdhbnRlZCB0
byBwb3N0IHRoYXQgZm9yIG15IGh5cGVydmlzb3ItZnMgc2VyaWVzLCBidXQgSSB0aGluayBpdCB3
b3VsZAo+IGZpdCBoZXJlIHF1aXRlIG5pY2UuCgpUaGFua3MsIErDvHJnZW4uIFRoYXQgdG9vbCBp
cyBpbmRlZWQgdXNlZnVsIG9uIGl0cyBvd24gcmlnaHQgZm9yIApmbGFzay9wb2xpY2llcy4gSG93
ZXZlciwgaXQgc2VlbXMgdG8gbWUgdGhhdCBjcmVhdGluZyBhIGJ1aWx0X2luLm8gcmlnaHQgCm91
dCBvZiB0aGUgbWljcm9jb2RlIGJsb2JzIGlzIHNpbXBsZXIgYW5kIGtlZXBzIHRoZSB3aG9sZSBi
dXNpbmVzcyAKY29udGFpbmVkIHdpdGhpbiB4ZW4vYXJjaC94ODYvbWljcm9jb2RlLy4KCi0tIEVz
bGFtCgo+IAo+IAo+IEp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
