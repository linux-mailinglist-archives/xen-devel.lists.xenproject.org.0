Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0A10CAB4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:54:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaL9Y-0000rZ-1B; Thu, 28 Nov 2019 14:52:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ucib=ZU=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iaL9W-0000rL-Bu
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:52:18 +0000
X-Inumbo-ID: 9e40c593-11ee-11ea-a3d3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e40c593-11ee-11ea-a3d3-12813bfff9fa;
 Thu, 28 Nov 2019 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574952715;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=scER5HjcJ8zrdeq/3gR1teJNfAFI5ApODZI6q8/OHX8=;
 b=Dq/zM1APztRR33/xANO7YoVPvupacAz6O/lxEEe33jInVWwWh9yZbQzO
 PQCJJhFw+vXUG0syZv6pa3igF648IZoI7++7Xy+zSsLfbutJyvvfEo+Gw
 wKFTx8yeTri1UcsVgmCqQ24F8xsqL6i7L6EbpdlwIDhhwvNVsEMs5YNYq g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qb8jBFjlPzRBjd/sXja3McXf1xMkfscUW3oetgEK+6eFF4QrUc4YT+SUEAsK0jFmxXZWBqMW7s
 HTg4+Im12IcfO4sa334ATFE/xyT91o+v3bxwcxPcPJdRNqH06/+WcXwLjAhlQV3D8kqNlw2HUy
 NFM1FL8nWVTZ3H67uH9XcvjL1BufE+hxm0BFxkAT7kAemsWw7fmi+tQ4Q4eT8PDuwJB9K2F5eF
 EGopbdDcsYs6TOakkQj/a0D867QH4gt6hUHAQJjMHhp6WEGdOQA2CjzT3T8z2/Kb/AvoEjKSKh
 QlI=
X-SBRS: 2.7
X-MesageID: 8950589
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8950589"
To: Jan Beulich <jbeulich@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <b5ab956e-36af-a07d-8698-79bf61eb514c@citrix.com>
 <89e137c0-b8ca-436d-b425-705df3506c2c@suse.com>
 <8407b785-8b2c-2f94-cab6-a9ceed502b18@citrix.com>
 <be8aa6ff-36f7-0572-4711-a8434a18b88e@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <364ba4a5-c458-3b75-e433-f33e4c6e2ae0@citrix.com>
Date: Thu, 28 Nov 2019 14:51:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <be8aa6ff-36f7-0572-4711-a8434a18b88e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjgvMTkgMTo1NyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMTEuMjAxOSAx
NDo1NCwgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4+IE9uIDExLzI4LzE5IDE6NDkgUE0sIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjguMTEuMjAxOSAxMzoxNSwgU2VyZ2V5IER5YXNsaSB3cm90
ZToKPj4+PiBBcHBseWluZyB0aGUgcGF0Y2ggZGlkbid0IGVuZCB1cCB3ZWxsIGZvciBteSB0ZXN0
IExQIChmcm9tIGFub3RoZXIgdGhyZWFkKToKPj4+Pgo+Pj4+IFBlcmZvcm0gZnVsbCBpbml0aWFs
IGJ1aWxkIHdpdGggOCBDUFUocykuLi4KPj4+PiBSZWFkaW5nIHNwZWNpYWwgc2VjdGlvbiBkYXRh
Cj4+Pj4gQXBwbHkgcGF0Y2ggYW5kIGJ1aWxkIHdpdGggOCBDUFUocykuLi4KPj4+PiBVbmFwcGx5
IHBhdGNoIGFuZCBidWlsZCB3aXRoIDggQ1BVKHMpLi4uCj4+Pj4gRXh0cmFjdGluZyBuZXcgYW5k
IG1vZGlmaWVkIEVMRiBzZWN0aW9ucy4uLgo+Pj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21t
L3NoYWRvdy9ndWVzdF8yLm8KPj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cv
Z3Vlc3RfNC5vCj4+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2d1ZXN0XzMu
bwo+Pj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L21tL2d1ZXN0X3dhbGtfMy5vCj4+Pj4gUHJv
Y2Vzc2luZyB4ZW4vYXJjaC94ODYvbW0vaGFwL2d1ZXN0X3dhbGtfM2xldmVsLm8KPj4+PiBQcm9j
ZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbS9oYXAvZ3Vlc3Rfd2Fsa180bGV2ZWwubwo+Pj4+IFByb2Nl
c3NpbmcgeGVuL2FyY2gveDg2L21tL2hhcC9ndWVzdF93YWxrXzJsZXZlbC5vCj4+Pj4gUHJvY2Vz
c2luZyB4ZW4vYXJjaC94ODYvbW0vZ3Vlc3Rfd2Fsa18yLm8KPj4+PiBQcm9jZXNzaW5nIHhlbi9h
cmNoL3g4Ni9tbS9ndWVzdF93YWxrXzQubwo+Pj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L2Vm
aS9lZmkvY2hlY2subwo+Pj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L3B2L2dwcl9zd2l0Y2gu
bwo+Pj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gveDg2L2luZGlyZWN0LXRodW5rLm8KPj4+PiBQcm9j
ZXNzaW5nIHhlbi9hcmNoL3g4Ni9ib290L2hlYWQubwo+Pj4+IFByb2Nlc3NpbmcgeGVuL2FyY2gv
eDg2L3g4Nl82NC9rZXhlY19yZWxvYy5vCj4+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYveDg2
XzY0L2NvbXBhdC9lbnRyeS5vCj4+Pj4gUHJvY2Vzc2luZyB4ZW4vYXJjaC94ODYveDg2XzY0L2Vu
dHJ5Lm8KPj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9odm0vdm14L2VudHJ5Lm8KPj4+PiBQ
cm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL2VudHJ5Lm8KPj4+PiBQcm9jZXNzaW5nIHhl
bi9hcmNoL3g4Ni9tbnQvbWVkaWEvZ2l0L3Vwc3RyZWFtL3hlbi94ZW4vbW50L21lZGlhL2dpdC91
cHN0cmVhbS94ZW4veGVuLy54ZW4uZWZpLjBzLm8KPj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4
Ni9tbnQvbWVkaWEvZ2l0L3Vwc3RyZWFtL3hlbi94ZW4vbW50L21lZGlhL2dpdC91cHN0cmVhbS94
ZW4veGVuLy54ZW4uZWZpLjByLm8KPj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbnQvbWVk
aWEvZ2l0L3Vwc3RyZWFtL3hlbi94ZW4vbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuLy54
ZW4uZWZpLjFzLm8KPj4+PiBQcm9jZXNzaW5nIHhlbi9hcmNoL3g4Ni9tbnQvbWVkaWEvZ2l0L3Vw
c3RyZWFtL3hlbi94ZW4vbW50L21lZGlhL2dpdC91cHN0cmVhbS94ZW4veGVuLy54ZW4uZWZpLjFy
Lm8KPj4+PiBFUlJPUjogbm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGZvdW5kLgo+Pj4+Cj4+Pj4gU28g
dGhpcyBsb29rcyBsaWtlIGEgcmVncmVzc2lvbi4KPj4+Cj4+PiBUaGFua3MgZm9yIGRvaW5nIHRo
ZSB0ZXN0aW5nLiBCdXQgd2hhdCBhbSBJIHRvIGNvbmNsdWRlIGZyb20KPj4+IHRoZSBhYm92ZT8g
SSBjYW4ndCBldmVuIHRlbGwgd2h5ICJubyBmdW5jdGlvbmFsIGNoYW5nZXMgZm91bmQiCj4+PiBp
cyBhbiBlcnJvci4KPj4+Cj4+Cj4+IEl0J3MgZHVlIHRvIHRoZSB3YXkgbGl2ZXBhdGNoLWJ1aWxk
IHRvb2wgaW50ZXJwb3NlcyBvbiB0aGUgYnVpbGQgdG8gY2FwdHVyZQo+PiBjaGFuZ2VkIG9iamVj
dCBmaWxlcyBmb3IgbGF0ZXIgY29tcGFyaXNvbi4gIE5vdyB0aGF0IG9iamNvcHkgd3JpdGVzIG91
dCB0aGUKPj4gcHJvcGVyIG9iamVjdCBmaWxlcyByYXRoZXIgdGhhbiBnY2MgKHdoaWNoIGp1c3Qg
d3JpdGVzIGEgdGVtcG9yYXJ5IG9uZSksIHRoZQo+PiBsaXZlcGF0Y2gtYnVpbGQgdG9vbCBuZWVk
cyBzb21lIGFkanVzdG1lbnQgb3RoZXJ3aXNlIGl0IGRvZXNuJ3QgY2FwdHVyZSBhbnkKPj4gY2hh
bmdlZCBmaWxlcy4gSSdtIHdvcmtpbmcgb24gYSBwYXRjaC4KPiAKPiBGb3IgbXkgb3duIGVkdWNh
dGlvbiwgYW5kIGp1c3QgaWYgeW91IGhhdmUgdGhlIHRpbWU6IFdoeSB3b3VsZCB0aGVyZQo+IGJl
IGFueSBkZXBlbmRlbmN5IG9uIHdoaWNoIGJ1aWxkIHV0aWxpdHkgcHJvZHVjZXMgdGhlIG9iamVj
dCBmaWxlPwo+IAoKSXQgdXNlcyBDUk9TU19DT01QSUxFIHRvIGZ1bm5lbCBhbGwgYnVpbGQgb3V0
cHV0IHRvIGEgc2NyaXB0CihodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9bGl2ZXBh
dGNoLWJ1aWxkLXRvb2xzLmdpdDthPWJsb2I7Zj1saXZlcGF0Y2gtZ2NjKQp3aGljaCB0aGVuIG5v
dGVzIGNoYW5nZWQgb2JqZWN0IGZpbGVzIGJ5IHByb2Nlc3NpbmcgZ2NjJ3MgY29tbWFuZC1saW5l
LgoKSWYgb2JqY29weSBpcyB1c2VkIGluc3RlYWQgb2YgZ2NjIHRvIHByb2R1Y2UgdGhlIGZpbmFs
IG91dHB1dCB0aGVuIHRoZSBzY3JpcHQKcHJvY2Vzc2VzIGdjYydzIGNvbW1hbmQtbGluZSBidXQg
ZG9lc24ndCBnZXQgdGhlIG91dHB1dCBpdCBleHBlY3RzIHNvIG5vCmNoYW5nZXMgYXJlIGRldGVj
dGVkLgoKWWVzLCB0aGlzIGlzIGhhY2t5IC0tIGltcHJvdmVtZW50cyBhcmUgd2VsY29tZSEKCi0t
IApSb3NzIExhZ2Vyd2FsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
