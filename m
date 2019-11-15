Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2B5FDF60
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:53:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc1B-0000EJ-Qh; Fri, 15 Nov 2019 13:52:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UCxP=ZH=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iVc1A-0000EB-Go
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:52:08 +0000
X-Inumbo-ID: 1ceb8f8e-07af-11ea-a26f-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ceb8f8e-07af-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RtKOlAjGU6sJHKEUqYP8SVhT5G9su97c5q4R0HgzGaM=; b=a1ox8aGI8fjDEiSh5Iuz0md54u
 0qQSNqvhrrxfMHfcjfzO3OCAlNH3GwgzILs5917znbVZ4W34wNibhNGZDf+vCgdE8RtNwKxsTG3Gv
 RmkbwyoQOg9uz1x/zF2P3rHvL6RSHh2MYGLM8xVrT0q8K3RouPHQEVTJh5UqSCCxwdxo=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:53824
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iVc1z-0001D6-LR; Fri, 15 Nov 2019 14:52:59 +0100
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191031121727.287419-1-anthony.perard@citrix.com>
 <31745372-dc15-de50-679f-d79c2d5a495e@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <1fa2f5e5-2a15-972f-dae8-03db5e849ebc@eikelenboom.it>
Date: Fri, 15 Nov 2019 14:52:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <31745372-dc15-de50-679f-d79c2d5a495e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl_pci: Don't hold QMP
 connection while waiting
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTEvMjAxOSAwNzowNywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAzMS4xMC4xOSAx
MzoxNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IEFmdGVyIHNlbmRpbmcgdGhlICdkZXZpY2Vf
ZGVsJyBjb21tYW5kIGZvciBhIFBDSSBwYXNzdGhyb3VnaCBkZXZpY2UsCj4+IHdlIHdhaXQgdW50
aWwgUUVNVSBoYXMgZWZmZWN0aXZlbHkgZGVsZXRlZCB0aGUgZGV2aWNlLCB0aGlzIGludm9sdmVz
Cj4+IGV4ZWN1dGluZyBtb3JlIFFNUCBjb21tYW5kcy4gV2hpbGUgd2FpdGluZywgbGlieGwgaG9s
ZCB0aGUgY29ubmVjdGlvbi4KPj4KPj4gSXQgaXNuJ3QgbmVjZXNzYXJ5IHRvIGhvbGQgdGhlIGNv
bm5lY3Rpb24gYW5kIGl0IHByZXZlbnRzIG90aGVycyBmcm9tCj4+IG1ha2luZyBwcm9ncmVzcywg
c28gdGhpcyBwYXRjaCByZWxlYXNlcyB0aGUgUU1QIGNvbm5lY3Rpb24uCj4+Cj4+IEZvciBiYWNr
Z3JvdW5kOgo+PiAgICAgIGUuZy4sIHdoZW4gYSBndWVzdCBpcyBjcmVhdGVkIHdpdGggc2V2ZXJh
bCBwY2kgcGFzc3Rocm91Z2gKPj4gICAgICBhdHRhY2hlZCwgb24gYHhsIGRlc3Ryb3lgIGFsbCB0
aGUgZGV2aWNlcyBuZWVkcyB0byBiZSBkZXRhY2gsIGFuZAo+PiAgICAgIHRoaXMgaXMgdXN1YWxs
eSB3aGF0IGhhcHBlbnM6Cj4+IAktICdkZXZpY2VfZGVsJyBjYWxsZWQgZm9yIHRoZSAxc3QgcGNp
IGRldmljZQo+PiAJLSAncXVlcnktcGNpJyBjaGVja2luZyBpZiBwY2kgc3RpbGwgdGhlcmUsIGl0
IGlzCj4+IAktIHdhaXQgMXMKPj4gCS0gJ3F1ZXJ5LXBjaScgY2hlY2tpbmcgYWdhaW4sIGFuZCBp
dCdzIGdvbmUKPj4gCS0+IG5vdyB0aGUgc2FtZSBjYW4gYmUgZG9uZSBmb3IgdGhlIHNlY29uZCBw
Y2kgZGV2aWNlLCBzbwo+PiAJcGxlbnR5IG9mIHdhaXRpbmcgb24gb3RoZXJzIHdoZW4gcGNpIGRl
dGFjaCBjYW4gYmUgZG9uZSBpbgo+PiAJcGFyYWxsZWwuCj4+Cj4+ICAgICAgT24gc2h1dGRvd24s
IGxpYnhsIHVzdWFsbHkga2VlcHMgd2FpdGluZyBiZWNhdXNlIFFFTVUgbmV2ZXIKPj4gICAgICBy
ZWxlYXNlcyB0aGUgZGV2aWNlIGJlY2F1c2UgdGhlIGd1ZXN0IGtlcm5lbCBuZXZlciByZXNwb25k
cyBRRU1VJ3MKPj4gICAgICB1bnBsdWcgcXVlcmllcy4gU28gZGV0YWNoaW5nIG9mIHRoZSAxc3Qg
ZGV2aWNlIHdhaXRzIHVudGlsIGEKPj4gICAgICB0aW1lb3V0IHN0b3BzIGl0LCBhbmQgc2luY2Ug
dGhlIHNhbWUgdGltZW91dCBpcyBzZXR1cCBhdCB0aGUgc2FtZQo+PiAgICAgIHRpbWUgZm9yIHRo
ZSBvdGhlciBkZXZpY2VzIHRvIGRldGFjaCwgdGhlICdkZXZpY2VfZGVsJyBjb21tYW5kIGlzCj4+
ICAgICAgbmV2ZXIgc2VudCBmb3IgdGhvc2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiAKPiBKdWVyZ2VuCgoKSGkgSnVl
cmdlbiwKClNpbmNlIGEgbG90IG1vcmUgcmVjZW50IHBhdGNoZXMgaGF2ZSBiZWVuIGNvbW1pdHRl
ZCwgYnV0IHRoZXNlIGRvbid0CnNlZW0gdG8uCkkgd2FzIHdvbmRlcmluZyBpZiB0aGlzIG9uZSBm
ZWxsIHRocm91Z2ggdGhlIGNyYWNrcy4KCi0tClNhbmRlcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
