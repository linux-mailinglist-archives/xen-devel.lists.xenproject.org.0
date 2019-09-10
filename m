Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456ECAE7AE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 12:13:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7d5f-00060D-Hu; Tue, 10 Sep 2019 10:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I4Uw=XF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i7d5d-000608-8p
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 10:09:37 +0000
X-Inumbo-ID: 03411c79-d3b3-11e9-ac1a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03411c79-d3b3-11e9-ac1a-12813bfff9fa;
 Tue, 10 Sep 2019 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568110143;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pBz+UuMi9t93ue09GBBv3yYtxQyJZrHCSoPQj54RG68=;
 b=YvLGqlpeBS7qwmX0vGfykOR1zlLSow+dH35RK304ZeUffP8u2HnSnxke
 U6RJS5aOTlL80W3kdB3jYZG6cHS55wZtB119OOSpmLnnzXAMiF0U7fObp
 pdvm+F5fIIZwHBmrSU43UlFjwQAd13fMB0jPsaSg4/safIpApQ67ZhmMW c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TBU9T7jchkQ1P6Nrhbf6mhdO6bD+/m42BsdXyRYJtPpVp/Rs3BiRhYYuEDtYOV+OYR0sXCTfV3
 i9xCXGd7TleNz75eYywzvFE9JqvxK+Avt2qtc2hWfvBvzVOcVwbohM15EKXFGzitdShIprtrJK
 tmAk/VYBahVFLE1fRtlTuyEo0c8uMtiDP/nqz4L1UD6xaERdMa1SfhX2dc8mk6jEeeANJTDgrj
 6DA51xzX8DCoggt7+BSzLGh8d/VkQVUuu8T50AI0xpZ8LYO2EMD6Fm25u46HxewvhDOFFtfsXi
 Bck=
X-SBRS: 2.7
X-MesageID: 5361133
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5361133"
To: Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
 <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
 <43e492ff-f967-7218-65c4-d16581fabea3@oracle.com>
 <416ff4b7-3186-f61a-75fa-bcfc968f8117@citrix.com>
 <64d52960-28d5-fb23-8892-35c9d4ed9d90@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <8fa50f93-bc83-3474-8bca-3437f3b47a6e@citrix.com>
Date: Tue, 10 Sep 2019 11:08:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <64d52960-28d5-fb23-8892-35c9d4ed9d90@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMDkvMjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMDkuMjAxOSAx
MTo0NiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDEwLzA5LzIwMTkgMDI6NDcsIEJvcmlz
IE9zdHJvdnNreSB3cm90ZToKPj4+IE9uIDkvOS8xOSA1OjQ4IFBNLCBJZ29yIERydXpoaW5pbiB3
cm90ZToKPj4+PiBBY3R1YWxseSwgcGNpX21tY2ZnX2xhdGVfaW5pdCgpIHRoYXQncyBjYWxsZWQg
b3V0IG9mIGFjcGlfaW5pdCgpIC0KPj4+PiB0aGF0J3Mgd2hlcmUgTUNGRyBhcmVhcyBhcmUgcHJv
cGVybHkgc2l6ZWQuIAo+Pj4KPj4+IHBjaV9tbWNmZ19sYXRlX2luaXQoKSByZWFkcyB0aGUgKHN0
YXRpYykgTUNGRywgd2hpY2ggZG9lc24ndCBuZWVkIERTRFQgcGFyc2luZywgZG9lcyBpdD8gc2V0
dXBfbWNmZ19tYXAoKSBPVE9IIGRvZXMgbmVlZCBpdCBhcyBpdCB1c2VzIGRhdGEgZnJvbSBfQ0JB
IChvciBpcyBpdCBfQ1JTPyksIGFuZCBJIHRoaW5rIHRoYXQncyB3aHkgd2UgY2FuJ3QgcGFyc2Ug
TUNGRyBwcmlvciB0byBhY3BpX2luaXQoKS4gU28gd2hhdCBJIHNhaWQgYWJvdmUgaW5kZWVkIHdv
bid0IHdvcmsuCj4+Pgo+Pgo+PiBObywgaXQgdXNlcyBpc19hY3BpX3Jlc2VydmVkKCkgKGl0J3Mg
Y2FsbGVkIGluZGlyZWN0bHkgc28gbWlnaHQgYmUgd2VsbAo+PiBoaWRkZW4pIHRvIHBhcnNlIERT
RFQgdG8gZmluZCBhIHJlc2VydmVkIHJlc291cmNlIGluIGl0IGFuZCBzaXplIE1DRkcKPj4gYXJl
YSBhY2NvcmRpbmdseS4gc2V0dXBfbWNmZ19tYXAoKSBpcyBjYWxsZWQgZm9yIGV2ZXJ5IHJvb3Qg
YnVzCj4+IGRpc2NvdmVyZWQgYW5kIGluZGVlZCB0cmllcyB0byBldmFsdWF0ZSBfQ0JBIGJ1dCBh
dCB0aGlzIHBvaW50Cj4+IHBjaV9tbWNmZ19sYXRlX2luaXQoKSBoYXMgYWxyZWFkeSBmaW5pc2hl
ZCBNQ0ZHIHJlZ2lzdHJhdGlvbiBmb3IgZXZlcnkKPj4gY29sZC1wbHVnZ2VkIGJ1cyAod2hpY2gg
aW5mb3JtYXRpb24gaXMgZGVzY3JpYmVkIGluIE1DRkcgdGFibGUpIHNvIHRob3NlCj4+IGNhbGxz
IGFyZSBkdW1teS4KPiAKPiBJIGRvbid0IHRoaW5rIHRoZXkncmUgc3RyaWN0bHkgZHVtbXkuIEV2
ZW4gZm9yIGJvb3QgdGltZSBhdmFpbGFibGUgZGV2aWNlcwo+IGlpcmMgdGhlcmUncyBubyBzdHJp
Y3QgcmVxdWlyZW1lbnQgZm9yIHRoZXJlIHRvIGJlIHJlc3BlY3RpdmUgZGF0YSBpbiBNQ0ZHLgo+
IFN1Y2ggYSByZXF1aXJlbWVudCBleGlzdHMgb25seSBmb3IgZGV2aWNlcyB3aGljaCBhcmUgYWN0
dWFsbHkgbmVlZGVkIHRvCj4gc3RhcnQgdGhlIE9TIChkaXNrIG9yIG5ldHdvcmssIHBlcmhhcHMg
dmlkZW8gb3IgYWxpa2UpLCBvciBtYXliZSBldmVuIGp1c3QKPiBpdHMgbG9hZGVyLgo+IAoKVGhp
cyB3YXMgbXkgaW50ZXJwcmV0YXRpb24gb2YgNC4xLjMgb2YgIlBDSSBGcmltd2FyZSBzcGVjaWZp
Y2F0aW9uIjoKIk1lbW9yeSBtYXBwZWQgY29uZmlndXJhdGlvbiBiYXNlIGFkZHJlc3NlcyBmb3Ig
bm9uLWhvdCBwbHVnZ2FibGUgaG9zdApicmlkZ2VzIG11c3QgYmUgZGVzY3JpYmVkIHVzaW5nIE1D
RkcgdGFibGUuIiBBbHRob3VnaCwgSSBhZG1pdCB0aGF0CiJub24taG90IHBsdWdnYWJsZSIgbWln
aHQgbWVhbiBhdmFpbGFibGUgYXQgYm9vdCBhcyB3ZWxsLgoKSWdvcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
