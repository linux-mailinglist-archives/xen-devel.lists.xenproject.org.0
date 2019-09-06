Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC34ABD7A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 18:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6GrW-0003hy-0r; Fri, 06 Sep 2019 16:13:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHqG=XB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i6GrU-0003ht-5M
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 16:13:24 +0000
X-Inumbo-ID: 3fab273e-d0c1-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fab273e-d0c1-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567786404;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=y+bALxGx0Szg9zt4yagykD4q8xEthMtbYI+AgBNzTLs=;
 b=bzTaBESD7Lrwmp/oV6y2cqrzMBqa1JfVz+UkCbKiN2Pddn/9E45zPu46
 8mkFoi3kparzsscO4cvN5M8sQxVjH4FhVnGQc3mXpSJ37PDc4JCbbY8yr
 2J43IKeJmOileb5Gu9XXFQu8sM9nw+qnoHi2J/SaMPXyVW2BSM2Ts7NFq s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wkcP46OdFFZ7zwihSBbbvxld3V+VbzIz/MjMYJcfjuFiH6kBLO7Vciv3CiZP2p8tpOSohMRfXV
 C4X1d3zanukfu6UOZ750kUqMICCWsFWOCOq5z9Y/SLEEZIyYgswmOtfyHYY5dB1m3biHqYWhrk
 VroGk7iEDIvEK0t61gQF76ZIfmq1tMRB3r+ojRHBt31PNKi8nLUILiRhlYSa3Eah6Jpo5qbOow
 7hEu1VfM6swZu3P9njVkB2wZ48xhyFPObZe9i9UWMgmACZwoiH06pBUEgWaT//35HMZbRCfeOd
 ux8=
X-SBRS: 2.7
X-MesageID: 5297003
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5297003"
To: <xen-devel@lists.xenproject.org>, <jgross@suse.com>
References: <20190906074058.21782-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <5fe1d431-9727-25e1-e720-6a3286a5a549@citrix.com>
Date: Fri, 6 Sep 2019 17:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906074058.21782-1-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: luwei.kang@intel.com, wl@xen.org, konrad.wilk@oracle.com, puwen@hygon.cn,
 marmarek@invisiblethingslab.com, olekstysh@gmail.com, paul.durrant@citrix.com,
 JBeulich@suse.com, roger.pau@citrix.com, Volodymyr_Babchuk@epam.com,
 chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDkvMjAxOSAwODo0MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGlzIGVtYWlsIG9u
bHkgdHJhY2tzIGJpZyBpdGVtcyBmb3IgeGVuLmdpdCB0cmVlLiBQbGVhc2UgcmVwbHkgZm9yIGl0
ZW1zIHlvdQo+IHdvdWxkIGxpa2UgdG8gc2VlIGluIDQuMTMgc28gdGhhdCBwZW9wbGUgaGF2ZSBh
biBpZGVhIHdoYXQgaXMgZ29pbmcgb24gYW5kCj4gcHJpb3JpdGlzZSBhY2NvcmRpbmdseS4KPgo+
IFlvdSdyZSB3ZWxjb21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNlcyBvZiB0
aGUgZmVhdHVyZSB5b3UncmUKPiB3b3JraW5nIG9uLgo+Cj4gPSBUaW1lbGluZSA9Cj4KPiBXZSBu
b3cgYWRvcHQgYSBmaXhlZCBjdXQtb2ZmIGRhdGUgc2NoZW1lLiBXZSB3aWxsIHJlbGVhc2UgYWJv
dXQgZXZlcnkgOCBtb250aHMuCj4gVGhlIHVwY29taW5nIDQuMTMgdGltZWxpbmUgYXJlIGFzIGZv
bGxvd2VkOgo+Cj4gKiBMYXN0IHBvc3RpbmcgZGF0ZTogU2VwdGVtYmVyIDEzdGgsIDIwMTkKPiAq
IEhhcmQgY29kZSBmcmVlemU6IFNlcHRlbWJlciAyN3RoLCAyMDE5Cj4gKiBSQzE6IFRCRAo+ICog
UmVsZWFzZTogTm92ZW1iZXIgN3RoLCAyMDE5CgpXb3cgdGhpcyBoYXMgY3JlcHQgdXAgc3VkZGVu
bHkuLi4KCkknbSBnb2luZyB0byBicmFpbmR1bXAgbXkgIm5lZWRzIHRvIGJlIGRvbmUgZm9yIDQu
MTMiIGxpc3QuCgpCZWZvcmUgY29kZSBmcmVlemU6CjEpIFJlZnJlc2ggYW5kIHJlcG9zdCBNU1Jf
VklSVF9TUEVDX0NUUkwuwqAgU3RpbGwgdmVyeSBpbXBvcnRhbnQgZm9yIHBlcmYKb24gQU1EIEZh
bTE3aCBoYXJkd2FyZS4KMikgUHV0IHRvZ2V0aGVyIHRoZSAic2tlbGV0b24gc2V0X2NwdV9wb2xp
Y3kiIHBsYW4uwqAgVGhpcyB3aWxsIGhlbHAgdG8KdW5ibG9jayBzb21lIG9mIHRoZSBDUFVJRC9N
U1Igd29yaywgYW5kIHdpbGwgYWxsb3cgdXMgdG8gdGFrZQooL2JhY2twb3J0KSBNU1JfQVJDSF9D
QVBTIHN1cHBvcnQsIHdoaWNoIGlzIHZlcnkgY3JpdGljYWwgZm9yIHBlcmYgb24KSW50ZWwgQ2Fz
Y2FkZSBMYWtlIGhhcmR3YXJlLgoyYSkgU3RyZXRjaCBnb2FsLsKgIFNlZSBhYm91dCBnZXR0aW5n
IE1TUl9BUkNIX0NBUFMgd29ya2luZy7CoCBNb3JlIGxpa2VseQp0byBiZSBlYXJseSBpbiB0aGUg
NC4xNCBkZXYgY3ljbGUgYW5kIGJhY2twb3J0IGZvciA0LjEzLjEKMykgU3RyZXRjaCBnb2FsLsKg
IER1c3Qgb2ZmIHRoZSBkb21haW5fY3Jhc2goKSBjaGFuZ2VzIHdoaWNoIGhhdmUgYmVlbgpwZW5k
aW5nIGZvciBhIGNvdXBsZSBvZiByZWxlYXNlcyBub3cuCgpCbG9ja2VyczoKMSkgTDFURl9CQVJS
SUVSIG1vZGUuwqAgV2hhdCB3ZSBoYXZlIGN1cnJlbnRseSBpbiB0cmVlIHRha2VzIGEgcGVyZiBo
aXQKd2hpbGUgcHJvdmlkaW5nIDAgc2VjdXJpdHkgYW5kIGJyZWFraW5nIHRoZSBhYmlsaXR5IHRv
IGJ1aWxkIGxpdmVwYXRjaGVzCmFnYWluc3QgNC4xMy7CoCBNeSBwbGFuIGhlcmUgaXMgdG8gcHV0
IGl0IGJlaGluZCBhbiBvZmYtYnktZGVmYXVsdApLY29uZmlnIG9wdGlvbi4KMikgR2V0IHRoZSBT
cGhpbnggZG9jcyBsaWNlbnNlZCBhcyBDQy1CWSwgc2VlaW5nIGFzIHRoaXMgaXMgdGhlIGZpcnN0
CnJlbGVhc2Ugd2l0aCB0aGVtIGluLgoKTWlzYyBvdWdodC10by1oYXZlczoKMSkgUmVmcmVzaCBh
bmQgcmVwb3N0IHRoZSAiSW50cm9kdWN0aW9uIiBhbmQgIndpc2hsaXN0IiBkb2NzLgoyKSBQb3N0
IHRoZSBjb252ZXJzaW9uIG9mIHhlbi1jb21tYW5kLWxpbmUucGFuZG9jIHRvIHNwaGlueCB3aGlj
aCBJJ3ZlCmJlZW4gY2FycnlpbmcgbG9jYWxseSByYXRoZXIgdG9vIGxvbmcgbm93LgoKVGhpcyBz
aG91bGQgZ2V0IHRoZSBzcGhpbnggZG9jcyBpbnRvIGEgc3RhdGUgb2YgaGF2aW5nIHNldmVyYWwg
dXNlZnVsCmJpdHMgaW4sIGV2ZW4gdGhvdWdoIHdlIGhhdmVuJ3QgbW92ZWQgb3ZlciB3aG9sZXNh
bGUgeWV0LgoKSSd2ZSBwcm9iYWJseSBtaXNzZWQgc29tZSB0aGluZ3MsIGJ1dCB0aGlzIHNob3Vs
ZCBkbyBmb3Igbm93LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
