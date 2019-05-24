Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E029547
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 11:57:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU6ul-00069g-RX; Fri, 24 May 2019 09:55:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EC9e=TY=amazon.de=prvs=040633b49=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hU6uk-00069b-HU
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 09:55:02 +0000
X-Inumbo-ID: fda9fa90-7e09-11e9-a8ca-4fc99176cc6d
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fda9fa90-7e09-11e9-a8ca-4fc99176cc6d;
 Fri, 24 May 2019 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1558691699; x=1590227699;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fttcVY9rG7wI3dJzbjpaRC6yBE7LlmgzumSpKt4LD2w=;
 b=nTYAGQTfO8SjJtuy17rfEHEERqs7JuRLih9U61PJJgaXqoSR1fROIpPX
 69Ufi9I4SXjRQfbaEZrKbNvmWvqllMGdTcneGYWgjLF2X1fp2ZhzCUuYX
 +CZuJRemDTm1a4xY03rqf26FVIf1odwjC+NB/VslX7LCprjiTuWDwGgNM g=;
X-IronPort-AV: E=Sophos;i="5.60,506,1549929600"; d="scan'208";a="801520625"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-53356bf6.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 24 May 2019 09:54:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-53356bf6.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4O9srZ4074121
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 24 May 2019 09:54:54 GMT
Received: from EX13D02EUB004.ant.amazon.com (10.43.166.221) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 May 2019 09:54:54 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.160.180) by
 EX13D02EUB004.ant.amazon.com (10.43.166.221) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 May 2019 09:54:47 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
 <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
Date: Fri, 24 May 2019 11:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.180]
X-ClientProxiedBy: EX13D20UWC003.ant.amazon.com (10.43.162.18) To
 EX13D02EUB004.ant.amazon.com (10.43.166.221)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 2/3] common/grant_table:
 harden bound accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yMy8xOSAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDUuMTkgYXQg
MDk6NDUsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBHdWVzdHMgY2FuIGlzc3VlIGdy
YW50IHRhYmxlIG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxlZAo+PiBkYXRh
IHRvIHRoZW0uIFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkgbG9hZHMgYWZ0
ZXIgYm91bmQKPj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVjdWxhdGl2ZSBv
dXQtb2YtYm91bmQgYWNjZXNzZXMsIHdlCj4+IHVzZSB0aGUgYXJyYXlfaW5kZXhfbm9zcGVjIG1h
Y3JvIHdoZXJlIGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybwo+PiBibG9ja19zcGVjdWxhdGlvbi4g
Tm90ZSwgdGhhdCB0aGUgYmxvY2tfc3BlY3VsYXRpb24gaXMgYWx3YXlzIHVzZWQgaW4KPiBzL2Fs
d2F5cy9hbHJlYWR5LyA/ClRoZXkgYm90aCB3b3JrLCBidXQgdGhlICdhbHdheXMnIHVuZGVybGlu
ZXMgdGhhdCBhIGNhbGxlciBjYW4gcmVseSBvbgp0aGUgZmFjdCB0aGF0IHRoaXMgd2lsbCBoYXBw
ZW4gb24gYWxsIGV4ZWN1dGlvbiBwYXRoIG9mIHRoYXQgZnVuY3Rpb24uCkhlbmNlLCBJIGxpa2Ug
dG8gc3RpY2sgdG8gJ2Fsd2F5cycgaGVyZS4KPgo+PiB0aGUgY2FsbHMgdG8gc2hhcmVkX2VudHJ5
X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcywgc28gdGhhdCBubwo+PiBhZGRpdGlvbmFsIHBy
b3RlY3Rpb24gaXMgcmVxdWlyZWQgb25jZSB0aGVzZSBmdW5jdGlvbnMgaGF2ZSBiZWVuCj4+IGNh
bGxlZC4KPiBJc24ndCB0aGlzIHRvbyBicm9hZCBhIHN0YXRlbWVudD8gVGhlcmUncyBzb21lIHBy
b3RlY3Rpb24sIGJ1dCBub3QKPiBmb3IganVzdCBhbnl0aGluZyB0aGF0IGZvbGxvd3MuCllvdSBh
cmUgcmlnaHQsIHRvIGdpdmVuIHByb3RlY3Rpb24gaXMgdGhhdCBhbnkgYm91bmQgY2hlY2sgdGhh
dCBjb3VsZApoYXZlIGJlZW4gYnlwYXNzZWQgc3BlY3VsYXRpdmVseSBpcyBlbmZvcmNlZCBhZnRl
ciBjYWxsaW5nIG9uZSBvZiB0aGUKdHdvIGZ1bmN0aW9ucy4gSSB3aWxsIHJlcGhyYXNlIHRoZSBj
b21taXQgbWVzc2FnZSBhY2NvcmRpbmdseS4KPgo+PiAtLS0gYS94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+IEBAIC05ODgsOSArOTg4
LDEwIEBAIG1hcF9ncmFudF9yZWYoCj4+ICAgICAgICAgIFBJTl9GQUlMKHVubG9ja19vdXQsIEdO
VFNUX2JhZF9nbnRyZWYsICJCYWQgcmVmICUjeCBmb3IgZCVkXG4iLAo+PiAgICAgICAgICAgICAg
ICAgICBvcC0+cmVmLCByZ3QtPmRvbWFpbi0+ZG9tYWluX2lkKTsKPj4gIAo+PiAtICAgIGFjdCA9
IGFjdGl2ZV9lbnRyeV9hY3F1aXJlKHJndCwgb3AtPnJlZik7Cj4+ICsgICAgLyogVGhpcyBjYWxs
IGFsc28gZW5zdXJlcyB0aGUgYWJvdmUgY2hlY2sgY2Fubm90IGJlIHBhc3NlZCBzcGVjdWxhdGl2
ZWx5ICovCj4+ICAgICAgc2hhaCA9IHNoYXJlZF9lbnRyeV9oZWFkZXIocmd0LCBvcC0+cmVmKTsK
Pj4gICAgICBzdGF0dXMgPSByZ3QtPmd0X3ZlcnNpb24gPT0gMSA/ICZzaGFoLT5mbGFncyA6ICZz
dGF0dXNfZW50cnkocmd0LCBvcC0+cmVmKTsKPj4gKyAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNx
dWlyZShyZ3QsIG9wLT5yZWYpOwo+IEkga25vdyB3ZSd2ZSBiZWVuIHRoZXJlIGJlZm9yZSwgYnV0
IHdoYXQgZ3VhcmFudGVlcyB0aGF0IHRoZQo+IGNvbXBpbGVyIHdvbid0IHJlbG9hZCBvcC0+cmVm
IGZyb20gbWVtb3J5IGZvciBlaXRoZXIgb2YgdGhlCj4gbGF0dGVyIHR3byBhY2Nlc3Nlcz8gSW4g
ZmFjdCBhZmFpY3QgaXQgYWx3YXlzIHdpbGwsIGR1ZSB0byB0aGUKPiBtZW1vcnkgY2xvYmJlciBp
biBhbHRlcm5hdGl2ZSgpLgpUaGUgY29tcGlsZXIgY2FuIHJlbG9hZCBvcC0+cmVmIGZyb20gbWVt
b3J5LCB0aGF0IGlzIGZpbmUgaGVyZSwgYXMgdGhlCmJvdW5kIGNoZWNrIGhhcHBlbnMgYWJvdmUs
IGFuZCB0aGUgc2hhcmVkX2VudHJ5IGNhbGwgY29tZXMgd2l0aCBhbgpsZmVuY2UoKSBieSBub3cs
IHNvIHRoYXQgd2Ugd2lsbCBub3QgY29udGludWUgZXhlY3V0aW5nIHNwZWN1bGF0aXZlbHkKd2l0
aCBvcC0+cmVmIGJlaW5nIG91dC1vZi1ib3VuZHMsIGluZGVwZW5kZW50bHkgb2Ygd2hldGhlciBp
dCdzIGZyb20KbWVtb3J5IG9yIHJlZ2lzdGVycy4KPgo+PiBAQCAtMzg2Myw2ICszODgzLDkgQEAg
c3RhdGljIGludCBnbnR0YWJfZ2V0X3N0YXR1c19mcmFtZV9tZm4oc3RydWN0IGRvbWFpbiAqZCwK
Pj4gICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiAgICAgIH0KPj4gIAo+PiArICAgIC8q
IE1ha2Ugc3VyZSBpZHggaXMgYm91bmRlZCB3cnQgbnJfc3RhdHVzX2ZyYW1lcyAqLwo+PiArICAg
IGJsb2NrX3NwZWN1bGF0aW9uKCk7Cj4+ICsKPj4gICAgICAqbWZuID0gX21mbih2aXJ0X3RvX21m
bihndC0+c3RhdHVzW2lkeF0pKTsKPj4gICAgICByZXR1cm4gMDsKPj4gIH0KPiBXaHkgZG9uJ3Qg
eW91IHVzZSBhcnJheV9pbmRleF9ub3NwZWMoKSBoZXJlPyBBbmQgaG93IGNvbWUKVGhlcmUgaXMg
bm8gc3BlY2lmaWMgcmVhc29uLiBJIHdpbGwgc3dhcC4KPiBzcGVjdWxhdGlvbiBpbnRvIGdudHRh
Yl9ncm93X3RhYmxlKCkgaXMgZmluZSBhIGZldyBsaW5lcyBhYm92ZT8KSSBkbyBub3Qgc2VlIGEg
cmVhc29uIHdoeSBpdCB3b3VsZCBiZSBiYWQgdG8gZW50ZXIgdGhhdCBmdW5jdGlvbgpzcGVjdWxh
dGl2ZWx5LiBUaGVyZSBhcmUgbm8gYWNjZXNzZXMgdGhhdCB3b3VsZCBoYXZlIHRvIGJlIHByb3Rl
Y3RlZCBieQpleHRyYSBjaGVja3MsIGFmYWljdC4gT3RoZXJ3aXNlLCB0aGF0IGZ1bmN0aW9uIHNo
b3VsZCBiZSBwcm90ZWN0ZWQgYnkKaXRzIG93bi4KPiBBbmQgd2hhdCBhYm91dCB0aGUgc2ltaWxh
ciBjb2RlIGluIGdudHRhYl9nZXRfc2hhcmVkX2ZyYW1lX21mbigpPwpJIHdpbGwgYWRkIGFuIGFy
cmF5X25vc3BlY19pbmRleCB0aGVyZSBhcyB3ZWxsLgo+Cj4gSmFuCj4KPgoKCgoKQW1hem9uIERl
dmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGlu
Ckdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVz
dC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRl
bmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
