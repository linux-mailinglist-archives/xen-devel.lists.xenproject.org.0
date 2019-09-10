Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05399AECA3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 16:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gmW-0004DE-I0; Tue, 10 Sep 2019 14:06:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7gmV-0004D9-45
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 14:06:07 +0000
X-Inumbo-ID: 2103b8bc-d3d4-11e9-ac1f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2103b8bc-d3d4-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 14:06:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7389AF35;
 Tue, 10 Sep 2019 14:06:04 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-27-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <53f10944-0c99-f5f1-1eff-f1f240dceee4@suse.com>
Date: Tue, 10 Sep 2019 16:06:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-27-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 26/48] xen/sched: rework and rename
 vcpu_force_reschedule()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB2Y3B1X2ZvcmNlX3Jl
c2NoZWR1bGUoKSBpcyBvbmx5IHVzZWQgZm9yIG1vZGlmeWluZyB0aGUgcGVyaW9kaWMgdGltZXIK
PiBvZiBhIHZjcHUuCgpJIGRvbid0IHRoaW5rIHRoaXMgaXMgdHJ1ZSBwcmlvciB0byB0aGlzIHBh
dGNoLCBvciBlbHNlIC4uLgoKPiBAQCAtNDE5LDggKzQxOSw2IEBAIGludCBwdl9zaGltX3NodXRk
b3duKHVpbnQ4X3QgcmVhc29uKQo+ICAKPiAgICAgICAgICBpZiAoIHYgIT0gY3VycmVudCApCj4g
ICAgICAgICAgICAgIHZjcHVfdW5wYXVzZV9ieV9zeXN0ZW1jb250cm9sbGVyKHYpOwo+IC0gICAg
ICAgIGVsc2UKPiAtICAgICAgICAgICAgdmNwdV9mb3JjZV9yZXNjaGVkdWxlKHYpOwoKLi4uIHRo
ZXJlIHdvdWxkbid0IGJlIHRoaXMgZGVsZXRpb24gb2YgY29kZS4gV2l0aG91dCBmdXJ0aGVyCmV4
cGxhbmF0aW9uIGl0J3MgdW5jbGVhciB0byBtZSB3aGV0aGVyIHRoZSByZS1zY2hlZHVsZSBoZXJl
Cmlzbid0IGFsc28gbmVlZGVkIGZvciBvdGhlciB0aGFuIHByb2Nlc3NpbmcgdGhlIHJlc2V0IG9m
IHRoZQpwZXJpb2RpYyB0aW1lciBwZXJpb2QuCgo+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUu
Ywo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+IEBAIC04NzcsMjEgKzg3NywyNSBAQCBz
dGF0aWMgdm9pZCB2Y3B1X21pZ3JhdGVfZmluaXNoKHN0cnVjdCB2Y3B1ICp2KQo+ICB9Cj4gIAo+
ICAvKgo+IC0gKiBGb3JjZSBhIFZDUFUgdGhyb3VnaCBhIGRlc2NoZWR1bGUvcmVzY2hlZHVsZSBw
YXRoLgo+IC0gKiBGb3IgZXhhbXBsZSwgdXNpbmcgdGhpcyB3aGVuIHNldHRpbmcgdGhlIHBlcmlv
ZGljIHRpbWVyIHBlcmlvZCBtZWFucyB0aGF0Cj4gLSAqIG1vc3QgcGVyaW9kaWMtdGltZXIgc3Rh
dGUgbmVlZCBvbmx5IGJlIHRvdWNoZWQgZnJvbSB3aXRoaW4gdGhlIHNjaGVkdWxlcgo+IC0gKiB3
aGljaCBjYW4gdGh1cyBiZSBkb25lIHdpdGhvdXQgbmVlZCBmb3Igc3luY2hyb25pc2F0aW9uLgo+
ICsgKiBTZXQgdGhlIHBlcmlvZGljIHRpbWVyIG9mIGEgdmNwdS4KPiAgICovCj4gLXZvaWQgdmNw
dV9mb3JjZV9yZXNjaGVkdWxlKHN0cnVjdCB2Y3B1ICp2KQo+ICt2b2lkIHZjcHVfc2V0X3Blcmlv
ZGljX3RpbWVyKHN0cnVjdCB2Y3B1ICp2LCBzX3RpbWVfdCB2YWx1ZSkKPiAgewo+IC0gICAgc3Bp
bmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7Cj4g
KyAgICBzX3RpbWVfdCBub3c7Cj4gIAo+IC0gICAgaWYgKCB2LT5zY2hlZF91bml0LT5pc19ydW5u
aW5nICkKPiAtICAgICAgICB2Y3B1X21pZ3JhdGVfc3RhcnQodik7Cj4gKyAgICBpZiAoIHYgIT0g
Y3VycmVudCApCj4gKyAgICAgICAgdmNwdV9wYXVzZSh2KTsKPiArICAgIGVsc2UKPiArICAgICAg
ICBzdG9wX3RpbWVyKCZ2LT5wZXJpb2RpY190aW1lcik7Cj4gIAo+IC0gICAgdW5pdF9zY2hlZHVs
ZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwo+ICsgICAgbm93ID0gTk9XKCk7Cj4g
KyAgICB2LT5wZXJpb2RpY19wZXJpb2QgPSB2YWx1ZTsKPiArICAgIHYtPnBlcmlvZGljX2xhc3Rf
ZXZlbnQgPSBub3c7CgpJJ20gYWZyYWlkIHRoaXMgYWx0ZXJzIGFuIGltcGxpY2l0IHByb3BlcnR5
IG9mIHRoZSBwcmV2aW91cwppbXBsZW1lbnRhdGlvbjogcGVyaW9kaWNfbGFzdF9ldmVudCB3b3Vs
ZCBnZXQgcmUtc2V0IG9ubHkgd2hlbgp0aGUgbmV3bHkgY2FsY3VsYXRlZCBuZXh0IGV2ZW50IHdv
dWxkbid0IGJlIGluIHRoZSBmdXR1cmUuIFRoZQpnb2FsIG9mIHRoaXMgKGFpdWkpIGlzIHRvIG5v
dCBkaXN0dXJiIGEgcGVyaW9kaWMgdGltZXIgd2hpY2gKZ2V0cyAocmVkdW5kYW50bHkpIHNldCBh
Z2FpbiB0byB0aGUgc2FtZSBwZXJpb2QuCgo+IC0gICAgdmNwdV9taWdyYXRlX2ZpbmlzaCh2KTsK
PiArICAgIGlmICggdiAhPSBjdXJyZW50ICkKPiArICAgICAgICB2Y3B1X3VucGF1c2Uodik7Cj4g
KyAgICBlbHNlIGlmICggdmFsdWUgIT0gMCApCj4gKyAgICAgICAgc2V0X3RpbWVyKCZ2LT5wZXJp
b2RpY190aW1lciwgbm93ICsgdmFsdWUpOwo+ICB9CgpXaGlsZSBwZXJoYXBzIG5vdCBvdmVybHkg
aW1wb3J0YW50LCBhbm90aGVyIGRpZmZlcmVuY2UgdG8KdmNwdV9wZXJpb2RpY190aW1lcl93b3Jr
KCkgaXMgdGhlIGxhY2sgb2YgbWlncmF0ZV90aW1lcigpIGhlcmUuClRoZXJlIHdvdWxkIGluZGVl
ZCBiZSBubyBtaWdyYXRpb24gbmVlZGVkIGlmIGEgcGVyaW9kaWMgdGltZXIKd2FzIGFjdGl2ZSBh
bHJlYWR5IChhbmQgaWYgdiA9PSBjdXJyZW50KSwgYmVjYXVzZSBpdCB3b3VsZApoYXZlIGJlZW4g
bWlncmF0ZWQgZHVyaW5nIHRoZSBtb3N0IHJlY2VudCBzY2hlZHVsaW5nIGN5Y2xlLiBCdXQKaW4g
Y2FzZSB0aGlzIGlzIGFuIG9mZi0+b24gdHJhbnNpdGlvbiwgbm8gc3VjaCBtaWdyYXRpb24gbWF5
CmhhdmUgb2NjdXJyZWQgYmVmb3JlLgoKRmluYWxseSBhIHJlbWFyayB0b3dhcmRzIG9yZGVyaW5n
IGluIHRoZSBzZXJpZXM6IFRoaXMgbG9va3MgdG8KYmUgdGV4dHVhbGx5IGJ1dCBub3QgZnVuY3Rp
b25hbGx5IGRlcGVuZGVudCB1cG9uIGVhcmxpZXIKcGF0Y2hlcyBpbiB0aGUgc2VyaWVzLiBTdWNo
IHBhdGNoZXMsIHdoZW4gcGxhY2VkIGVhcmx5IGluIGEKc2VyaWVzLCBoYXZlIGEgZmFpciBjaGFu
Y2Ugb2YgZ29pbmcgaW4gYWhlYWQgb2YgdGhlIGJ1bGsgb2YKc3VjaCBzZXJpZXMuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
