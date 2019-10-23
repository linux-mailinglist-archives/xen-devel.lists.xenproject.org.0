Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A673FE1E7F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHrG-0002Gu-9z; Wed, 23 Oct 2019 14:43:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNHrE-0002Gp-Fd
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:43:28 +0000
X-Inumbo-ID: 78b040f8-f5a3-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78b040f8-f5a3-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 14:43:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14006B2E8;
 Wed, 23 Oct 2019 14:43:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-5-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <78a1591c-07d0-f621-45a1-c2fcde2cbf9b@suse.com>
Date: Wed, 23 Oct 2019 16:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-5-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/7] x86/nospec: Rename and rework
 l1tf-barrier as branch-harden
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gbDF0Zi1iYXJyaWVyIGlz
IGFuIGluYXBwcm9wcmlhdGUgbmFtZSwgYW5kIGNhbWUgYWJvdXQgYmVjYXVzZSBvZiByZXN0cmlj
dGlvbnMKPiBvbiBjb3VsZCBiZSBkaXNjdXNzZWQgcHVibGljbHkgd2hlbiB0aGUgcGF0Y2hlcyB3
ZXJlIHByb3Bvc2VkLgo+IAo+IEluIHByYWN0aWNlLCBpdCBpcyBmb3IgZ2VuZXJhbCBTcGVjdHJl
IHYxIG1pdGlnYXRpb25zLCBhbmQgaXMgbmVjZXNzYXJ5IGluIGFsbAo+IGNhc2VzLiAgQW4gYWR2
ZXJzYXJ5IHdoaWNoIGNhbiBjb250cm9sIHNwZWN1bGF0aW9uIGluIFhlbiBjYW4gbGVhayBkYXRh
IGluCj4gY3Jvc3MtY29yZSAoQkNCUywgZXRjKSBvciByZW1vdGUgKE5ldFNwZWN0cmUpIHNjZW5h
cmlvcyAtIHRoZSBwcm9ibGVtIGlzIG5vdAo+IGxpbWl0ZWQgdG8ganVzdCBMMVRGIHdpdGggSFQg
YWN0aXZlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgouLi4gb25lIG5pdCBiZWxvdy4KCj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPiAKPiB2MzoKPiAgICogTmV3Cj4gCj4gSW4gcHJpbmNpcGxlIGl0IHNob3Vs
ZCBiZSB0cmlzdGF0ZSBhbmQgYmVpbmcgZGlzYWJsZWQgYnkgZGVmYXVsdCBvbiBwYXJ0cwo+IHdo
aWNoIGRvbid0IHNwZWN1bGF0ZSwgYnV0IGl0IGlzIHRvbyBsYXRlIGluIDQuMTMgdG8gb3JnYW5p
c2UgdGhpcy4KPiAtLS0KPiAgIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDEx
ICsrKysrLS0tLS0tCj4gICB4ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMgICAgICAgICAgfCAxNyAr
KysrKysrLS0tLS0tLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9jcHVmZWF0dXJlcy5oIHwg
IDIgKy0KPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvbm9zcGVjLmggICAgICB8ICAyICstCj4gICB4
ZW4vaW5jbHVkZS9hc20teDg2L3NwZWNfY3RybC5oICAgfCAgMiArLQo+ICAgNSBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5k
LWxpbmUucGFuZG9jCj4gaW5kZXggNjdkZjgwYzUwZC4uZTM3YTEzZWQxMSAxMDA2NDQKPiAtLS0g
YS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiArKysgYi9kb2NzL21pc2MveGVu
LWNvbW1hbmQtbGluZS5wYW5kb2MKPiBAQCAtMTk2MCw3ICsxOTYwLDcgQEAgQnkgZGVmYXVsdCBT
U0JEIHdpbGwgYmUgbWl0aWdhdGVkIGF0IHJ1bnRpbWUgKGkuZSBgc3NiZD1ydW50aW1lYCkuCj4g
ICAjIyMgc3BlYy1jdHJsICh4ODYpCj4gICA+IGA9IExpc3Qgb2YgWyA8Ym9vbD4sIHhlbj08Ym9v
bD4sIHtwdixodm0sbXNyLXNjLHJzYixtZC1jbGVhcn09PGJvb2w+LAo+ICAgPiAgICAgICAgICAg
ICAgYnRpLXRodW5rPXJldHBvbGluZXxsZmVuY2V8am1wLCB7aWJycyxpYnBiLHNzYmQsZWFnZXIt
ZnB1LAo+IC0+ICAgICAgICAgICAgICBsMWQtZmx1c2gsbDF0Zi1iYXJyaWVyfT08Ym9vbD4gXWAK
PiArPiAgICAgICAgICAgICAgbDFkLWZsdXNoLGJyYW5jaC1oYXJkZW59PTxib29sPiBdYAo+ICAg
Cj4gICBDb250cm9scyBmb3Igc3BlY3VsYXRpdmUgZXhlY3V0aW9uIHNpZGVjaGFubmVsIG1pdGln
YXRpb25zLiAgQnkgZGVmYXVsdCwgWGVuCj4gICB3aWxsIHBpY2sgdGhlIG1vc3QgYXBwcm9wcmlh
dGUgbWl0aWdhdGlvbnMgYmFzZWQgb24gY29tcGlsZWQgaW4gc3VwcG9ydCwKPiBAQCAtMjAzMiwx
MSArMjAzMiwxMCBAQCBJcnJlc3BlY3RpdmUgb2YgWGVuJ3Mgc2V0dGluZywgdGhlIGZlYXR1cmUg
aXMgdmlydHVhbGlzZWQgZm9yIEhWTSBndWVzdHMgdG8KPiAgIHVzZS4gIEJ5IGRlZmF1bHQsIFhl
biB3aWxsIGVuYWJsZSB0aGlzIG1pdGlnYXRpb24gb24gaGFyZHdhcmUgYmVsaWV2ZWQgdG8gYmUK
PiAgIHZ1bG5lcmFibGUgdG8gTDFURi4KPiAgIAo+IC1PbiBoYXJkd2FyZSB2dWxuZXJhYmxlIHRv
IEwxVEYsIHRoZSBgbDF0Zi1iYXJyaWVyPWAgb3B0aW9uIGNhbiBiZSB1c2VkIHRvIGZvcmNlCj4g
LW9yIHByZXZlbnQgWGVuIGZyb20gcHJvdGVjdGluZyBldmFsdWF0aW9ucyBpbnNpZGUgdGhlIGh5
cGVydmlzb3Igd2l0aCBhIGJhcnJpZXIKPiAtaW5zdHJ1Y3Rpb24gdG8gbm90IGxvYWQgcG90ZW50
aWFsbHkgc2VjcmV0IGluZm9ybWF0aW9uIGludG8gTDEgY2FjaGUuICBCeQo+IC1kZWZhdWx0LCBY
ZW4gd2lsbCBlbmFibGUgdGhpcyBtaXRpZ2F0aW9uIG9uIGhhcmR3YXJlIGJlbGlldmVkIHRvIGJl
IHZ1bG5lcmFibGUKPiAtdG8gTDFURi4KPiArSWYgWGVuIGlzIGNvbXBpbGVkIHdpdGggYENPTkZJ
R19TUEVDVUxBVElWRV9IQVJERU5fQlJBTkNIYCwgdGhlCj4gK2BicmFuY2gtaGFyZGVuPWAgYm9v
bGVhbiBjYW4gYmUgdXNlZCB0byBmb3JjZSBvciBwcmV2ZW50IFhlbiBmcm9tIHVzaW5nCj4gK3Nw
ZWN1bGF0aW9uIGJhcnJpZXJzIHRvIHByb3RlY3Qgc2VsZWN0ZWQgY29uZGl0aW9uYWwgYnJhbmNo
ZXMuICBCeSBkZWZhdWx0LAo+ICtYZW4gd2lsbCBlbmFibGVkIHRoaXMgbWl0aWdhdGlvbi4KCnMv
ZW5hYmxlZC9lbmFibGUvCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
