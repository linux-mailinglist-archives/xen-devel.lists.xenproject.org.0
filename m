Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8E9960D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 16:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0nnf-0007Vq-7W; Thu, 22 Aug 2019 14:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D95g=WS=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1i0nnd-0007Vl-Ea
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 14:10:49 +0000
X-Inumbo-ID: a3a6971e-c4e6-11e9-ac23-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3a6971e-c4e6-11e9-ac23-bc764e2007e4;
 Thu, 22 Aug 2019 14:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566483049;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EzZrxYj0ztR42/X9e5yaXKfXB5NdeBkJGmWjhazF1qo=;
 b=JUmhI/AWZslEGbFHq1zm7YlZp9skIorgC0cWidGva6sHUZ1dYCzzWHvX
 JQ0RMjzu7ObdNU8cKkKXI1DbIy2UXOVFETFTCIRc4+h5CWnrkjYAw0Gta
 z0cyWCuMoVUpIlemYkuuXydOT9820S48lEc+MmBK0iFpihpDHeoSAzsCW 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: q5z4Kmp9RXUXHunyv/QwqMVbAhXAfmUyAiIGiux8P5s9GUNjastVlihOjaTD/0ga5pUtxwsbcU
 vVRyW0JVylJnbOYJcUK4upsZpKKqk5lZJsR+WIFKUkYp3h2zhJKWoP/B69Xy14QxKcFftCruuy
 40GL9jNq36xkmDzjqmEHwsCtUvrWe3Y6XN4ZGH0xAzkNBd38ouzqrBssGkRJQgdfDkDUrfv1X6
 XEM5veJrG6xxy1FnEzKnPObwDfSpODkDmMNxVwTmETczTnMcLHeR1GsVnJVAwcB8UrEu2+IiR7
 8SI=
X-SBRS: 2.7
X-MesageID: 4586023
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4586023"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190821082056.91090-1-wipawel@amazon.de>
 <20190821082056.91090-14-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <71875c16-4676-db99-abd2-87d1b1b7b3c2@citrix.com>
Date: Thu, 22 Aug 2019 15:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821082056.91090-14-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/20] create-diff-object: Strip all
 undefined entires of known size
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, wipawel@amazon.com,
 mpohlack@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yMS8xOSA5OjIwIEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPiBUaGUgcGF0
Y2hlZCBFTEYgb2JqZWN0IGZpbGUgY29udGFpbnMgYWxsIHNlY3Rpb25zIGFuZCBzeW1ib2xzIGFz
Cj4gcmVzdWx0ZWQgZnJvbSB0aGUgY29tcGlsYXRpb24uIEhvd2V2ZXIsIGNlcnRhaW4gc3ltYm9s
cyBtYXkgbm90IGJlCj4gY29waWVkIG92ZXIgdG8gdGhlIHJlc3VsdGluZyBvYmplY3QgZmlsZSwg
ZHVlIHRvIGJlaW5nIHVuY2hhbmdlZCBvcgo+IG5vdCBpbmNsdWRlZCBmb3Igb3RoZXIgcmVhc29u
cy4KPiBJbiBzdWNoIHNpdHVhdGlvbiB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlIGhhcyB0aGUg
ZW50aXJlIHNlY3Rpb25zCj4gY29waWVkIGFsb25nICh3aXRoIGFsbCB0aGVpciBlbnRyaWVzIHVu
Y2hhbmdlZCksIHdoaWxlIHNvbWUgb2YgdGhlCj4gY29ycmVzcG9uZGluZyBzeW1ib2xzIGFyZSBu
b3QgY29waWVkIGFsb25nIGF0IGFsbC4KPiBUaGlzIGxlYWRzIHRvIGhhdmluZyBpbmNvcnJlY3Qg
dW5kZWZpbmVkIChTVE5fVU5ERUYpIGVudHJpZXMgaW4gdGhlCj4gZmluYWwgaG90cGF0Y2ggRUxG
IGZpbGUuCj4gCj4gVGhlIG5ld2x5IGFkZGVkIGZ1bmN0aW9uIGxpdmVwYXRjaF9zdHJpcF91bmRl
ZmluZWRfZWxlbWVudHMoKSBkZXRlY3RzCj4gYW5kIHJlbW92ZXMgYWxsIHVuZGVmaW5lZCBSRUxB
IGVudHJpZXMgYXMgd2VsbCBhcyB0aGVpciBjb3JyZXNwb25kaW5nCj4gUFJPR0JJVFMgc2VjdGlv
biBlbnRyaWVzLgo+IFNpbmNlIHRoZSBzZWN0aW9ucyBtYXkgY29udGFpbiBlbGVtZW50cyBvZiB1
bmtub3duIHNpemUgKHNoLnNoX2VudHNpemUKPiA9PSAwKSwgcGVyZm9ybSB0aGUgc3RyaXAgb25s
eSBvbiBzZWN0aW9ucyB3aXRoIHdlbGwgZGVmaW5lZCBlbnRyeQo+IHNpemVzLgo+IAo+IEFmdGVy
IHJlcGxhY2luZyB0aGUgc3RyaXBwZWQgcmVsYSBsaXN0LCBpdCBpcyBhc3N1bWVkIHRoYXQgdGhl
IG5leHQKPiBpbnZvY2F0aW9uIG9mIHRoZSBrcGF0Y2hfcmVidWlsZF9yZWxhX3NlY3Rpb25fZGF0
YSgpIHdpbGwgYWRqdXN0IGFsbAo+IHNlY3Rpb24gaGVhZGVyIHBhcmFtZXRlcnMgYWNjb3JkaW5n
IHRvIHRoZSBjdXJyZW50IHN0YXRlLgo+IAo+IFRoZSBsaXZlcGF0Y2hfc3RyaXBfdW5kZWZpbmVk
X2VsZW1lbnRzKCkgaXMgYSBzdXBlcnNldCBvZiB0aGUKPiBrcGF0Y2hfcmVnZW5lcmF0ZV9zcGVj
aWFsX3NlY3Rpb24oKSBpbiBib3RoIHNjb3BlIChjb3ZlcnMgYWxsIFJFTEEKPiBzZWN0aW9ucyBp
bnN0ZWFkIG9mIGp1c3Qgc3BlY2lhbCBzZWN0aW9ucykgYW5kIGdyYW51bGFyaXR5IChjaGVja3MK
PiBhbGwgZW50cmllcyBpbnN0ZWFkIG9mIHdob2xlIGdyb3VwcykgbW9kdWxvIHRoZSBlbnRyaWVz
IHZhbGlkaXR5Cj4gcHJlZGljYXRlLgo+IFVuaWZ5aW5nIHRoZSBmdW5jdGlvbnMgcmVzdWx0cyBp
biBhIGNvbXBsaWNhdGVkIGNvZGUsIHdoaWNoIGlzIGhhcmQKPiB0byByZWFzb24gYWJvdXQuIFRo
dXMsIHRoZSBrcGF0Y2hfcmVnZW5lcmF0ZV9zcGVjaWFsX3NlY3Rpb24oKSBpcwo+IGtlcHQgc2Vw
YXJhdGUgd2l0aCBpdHMgb3duIHByZWRpY2F0ZSBmb3Igc3BlY2lhbCBzZWN0aW9ucyBvbmx5LCBh
bmQKPiBsaXZlcGF0Y2hfc3RyaXBfdW5kZWZpbmVkX2VsZW1lbnRzKCkgZm9sbG93cyBmb3IgYWxs
IHNlY3Rpb25zIHdpdGgKPiB0aGUgdW5kZWZpbmVkIHN5bWJvbCBkZXRlY3RpbmcgcHJlZGljYXRl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KPiBSZXZpZXdlZC1ieTogTWFydGluIFBvaGxhY2sgPG1wb2hsYWNrQGFtYXpvbi5kZT4K
PiBSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4KPiBSZXZpZXdl
ZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6
IEFuZHJhLUlyaW5hIFBhcmFzY2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4KPiAtLS0KClJldmll
d2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxAY2l0cml4LmNvbT4KClRoYW5r
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
