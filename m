Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411AC85964
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 06:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hva8l-0006wn-PH; Thu, 08 Aug 2019 04:35:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hva8l-0006wi-5s
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 04:35:03 +0000
X-Inumbo-ID: e0f9ba94-b995-11e9-acbb-df41504eac74
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0f9ba94-b995-11e9-acbb-df41504eac74;
 Thu, 08 Aug 2019 04:34:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27ADCABD4;
 Thu,  8 Aug 2019 04:34:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <dc907eb1-fa33-cd1e-ee88-e64bd62f5a67@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fdfe4bae-4280-3a2e-bc77-3be8ad709d3d@suse.com>
Date: Thu, 8 Aug 2019 06:34:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dc907eb1-fa33-cd1e-ee88-e64bd62f5a67@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMTkgMTk6MDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gCj4gT24gMDcvMDgvMjAx
OSAxNTozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQWRkIHRoZSBjcHUgY3VycmVudGx5IGhv
bGRpbmcgdGhlIGxvY2sgdG8gc3RydWN0IGxvY2tfZGVidWcuIFRoaXMgbWFrZXMKPj4gYW5hbHlz
aXMgb2YgbG9ja2luZyBlcnJvcnMgZWFzaWVyIGFuZCBpdCBjYW4gYmUgdGVzdGVkIHdoZXRoZXIg
dGhlCj4+IGNvcnJlY3QgY3B1IGlzIHJlbGVhc2luZyBhIGxvY2sgYWdhaW4uCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBMb29raW5nIGF0
IHRoZSBzdHJ1Y3R1cmU6Cj4gCj4geGVuLmdpdC94ZW4kIHBhaG9sZSB4ZW4tc3ltcyAtRSAtQyBz
cGlubG9jawo+IHN0cnVjdCBzcGlubG9jayB7Cj4gCS8qIHR5cGVkZWYgc3BpbmxvY2tfdGlja2V0
c190ICovIHVuaW9uIHsKPiAJCS8qIHR5cGVkZWYgdTMyICovIHVuc2lnbmVkIGludCAgICAgICBo
ZWFkX3RhaWw7ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgNCAqLwo+IAkJ
c3RydWN0IHsKPiAJCQkvKiB0eXBlZGVmIHUxNiAqLyBzaG9ydCB1bnNpZ25lZCBpbnQgaGVhZDsg
ICAgICAgICAgICAgICAgICAgICAgIC8qICAgICAwICAgICAyICovCj4gCQkJLyogdHlwZWRlZiB1
MTYgKi8gc2hvcnQgdW5zaWduZWQgaW50IHRhaWw7ICAgICAgICAgICAgICAgICAgICAgICAvKiAg
ICAgMiAgICAgMiAqLwo+IAkJfTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qICAgICAgICAgICA0ICovCj4gCX0g
dGlja2V0czsgLyogICAgIDAgICAgIDQgKi8KPiAJLyogdHlwZWRlZiB1MTYgKi8gc2hvcnQgdW5z
aWduZWQgaW50ICAgICAgICAgcmVjdXJzZV9jcHU6MTI7ICAgICAgICAgICAgICAgICAgICAgLyog
ICAgIDQ6IDQgIDIgKi8KPiAJLyogdHlwZWRlZiB1MTYgKi8gc2hvcnQgdW5zaWduZWQgaW50ICAg
ICAgICAgcmVjdXJzZV9jbnQ6NDsgICAgICAgICAgICAgICAgICAgICAgLyogICAgIDQ6IDAgIDIg
Ki8KPiAJdW5pb24gbG9ja19kZWJ1ZyB7Cj4gCQlzaG9ydCB1bnNpZ25lZCBpbnQgdmFsOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogICAgICAgICAg
IDIgKi8KPiAJCXN0cnVjdCB7Cj4gCQkJc2hvcnQgdW5zaWduZWQgaW50IHVudXNlZDoxOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAgICAgNjoxNSAgMiAqLwo+IAkJCXNo
b3J0IHVuc2lnbmVkIGludCBpcnFfc2FmZToxOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLyogICAgIDY6MTQgIDIgKi8KPiAJCQlzaG9ydCB1bnNpZ25lZCBpbnQgcGFkOjI7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qICAgICA2OjEyICAyICovCj4g
CQkJc2hvcnQgdW5zaWduZWQgaW50IGNwdToxMjsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiAgICAgNjogMCAgMiAqLwo+IAkJfTsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qICAgICAg
ICAgICAyICovCj4gCX0gZGVidWc7IC8qICAgICA2ICAgICAyICovCj4gCj4gCS8qIHNpemU6IDgs
IGNhY2hlbGluZXM6IDEsIG1lbWJlcnM6IDQgKi8KPiAJLyogbGFzdCBjYWNoZWxpbmU6IDggYnl0
ZXMgKi8KPiB9Owo+IAo+IAo+IHdlIG5vdyBnZXQgdHdvIDEyLWJpdCBDUFUgZmllbGRzIHRyeWlu
ZyB0byBmaXQgaW50byA0IGJ5dGVzLiAgSXMgaXQKPiBwb3NzaWJsZSB0byByZXVzZSB0aGUgcmVj
dXJzZV9jcHUgZmllbGQgZm9yIGRlYnVnZ2luZyBhcyB3ZWxsPwoKSSBkb24ndCB0aGluayB0aGlz
IHdvdWxkIGJlIGEgZ29vZCBpZGVhIGZvciB0d28gcmVhc29uczoKCi0gQ2hhbmdpbmcgdGhlIHdh
eSByZWN1cnNlX2NwdSBpcyBiZWluZyB1c2VkIGluIGRlYnVnIGJ1aWxkcyBtaWdodAogICByZXN1
bHQgaW4gd2VpcmQgYmVoYXZpb3IgaW4gY29yZXIgY2FzZXMuIFRoYXQncyBub3Qgd2hhdCBkZWJ1
ZwogICBhZGRpdGlvbnMgYXJlIG1lYW50IGZvci4KCi0gV2UgbWlnaHQgYmUgYWJsZSB0byBzYXZl
IDIgYnl0ZXMsIHdoaWNoIHdpbGwgdGhlbiBqdXN0IGJlIHVudXNlZC4KICAgU28gbm8gbWVtb3J5
IHNhdmVkLCBidXQgY29tcGxleGl0eSBnYWluZWQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
