Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F018D4E8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 17:53:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFKoy-0005Sw-Oj; Fri, 20 Mar 2020 16:48:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jFKox-0005Sr-78
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 16:48:31 +0000
X-Inumbo-ID: a0b0598f-6aca-11ea-bdc7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0b0598f-6aca-11ea-bdc7-12813bfff9fa;
 Fri, 20 Mar 2020 16:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584722910;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=57sRo8geQW3XFnzornSlKUQ+Dz4ZhY5NSfQwRMtDawo=;
 b=Fw07S1gEeLUS7kz2oKSFEJSdpmp88kb7Kxj3gqkKZLc49WS1VCp5YFIU
 Xxa///psI3tZSbMYPFslkLrTOA5c1B5bdvzknZu2exbWh5x54MeTVZApe
 NA03inYJD+Y0byCuIK5lXZDuvPrG1zzLlIMSawx1Dmr7YCpdTZuANF4rW I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zbsT37etKLZOSWJ4qpC7y7z7Vf9p9unrfvLjR8aPDYb6d12Pklr1E0eNFgSvwqagmzROXhLneC
 ncGrxyZQyHyD7R3Cw+2iqk+Wiwz425VIg0jDkNvOpuTQCYdkghddKv/mETGzN+1N3vCEKJEnRv
 Nwz4mTNKCs3cUBxKZgWx6MZtAmgD54s6802h1szNldV83t7L2P7vrYv76ozAtBAloFLuuDRxae
 Nca6DzoHwFQRJvkR7IG/Ia0o79mlqHK6RKINLBD4BtxkTOZqLw4VoLD0OXHdfbDyvSHmmQuvY9
 W1U=
X-SBRS: 2.7
X-MesageID: 15009628
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,285,1580792400"; d="scan'208";a="15009628"
To: Jan Beulich <jbeulich@suse.com>
References: <20200319152622.31758-1-andrew.cooper3@citrix.com>
 <20200319152622.31758-6-andrew.cooper3@citrix.com>
 <2acabccd-da3b-9e22-8f27-41ab1b3cde8a@suse.com>
 <5b5994ae-db1c-b0d7-16d2-c2f264dc5440@citrix.com>
 <d8475c22-3350-c536-6cf8-f3e64515ede2@suse.com>
 <6e8a9bbb-c534-46de-9510-2aa791e43b99@citrix.com>
 <bc893330-0019-e075-f92f-fe997f120546@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <de1f9711-1fc5-1afe-e5d7-700538a126bf@citrix.com>
Date: Fri, 20 Mar 2020 16:48:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bc893330-0019-e075-f92f-fe997f120546@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/6] x86/ucode: Alter ops->free_patch() to
 free the entire patch
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDMvMjAyMCAxNjoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMDMuMjAyMCAx
NzoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjAvMDMvMjAyMCAxNToxNSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMC4wMy4yMDIwIDE1OjUwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDIwLzAzLzIwMjAgMTM6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAx
OS4wMy4yMDIwIDE2OjI2LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gVGhlIGRhdGEgbGF5
b3V0IGZvciBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoIGlzIGV4dHJlbWVseSBwb29yLCBhbmQKPj4+
Pj4+IHVubmVjZXNzYXJpbHkgY29tcGxpY2F0ZWQuICBBbG1vc3QgYWxsIG9mIGl0IGlzIG9wYXF1
ZSB0byBjb3JlLmMsIHdpdGggdGhlCj4+Pj4+PiBleGNlcHRpb24gb2YgZnJlZV9wYXRjaCgpLgo+
Pj4+Pj4KPj4+Pj4+IE1vdmUgdGhlIHJlc3BvbnNpYmlsaXR5IGZvciBmcmVlaW5nIHRoZSBwYXRj
aCBpbnRvIHRoZSBmcmVlX3BhdGNoKCkgaG9vaywKPj4+Pj4+IHdoaWNoIHdpbGwgYWxsb3cgZWFj
aCBkcml2ZXIgdG8gZG8gYSBiZXR0ZXIgam9iLgo+Pj4+PiBCdXQgdGhhdCB3cmFwcGVyIHN0cnVj
dHVyZSBpcyBzb21ldGhpbmcgY29tbW9uLCBpLmUuIHRvIGJlCj4+Pj4+IGFsbG9jYXRlZCBhcyB3
ZWxsIGFzIHRvIGJlIGZyZWVkIChwcmVmZXJhYmx5KSBieSBjb21tb24gY29kZS4KPj4+Pj4gV2Ug
ZGlkIHNwZWNpZmljYWxseSBtb3ZlIHRoZXJlIGR1cmluZyByZXZpZXcgb2YgdGhlIG1vc3QKPj4+
Pj4gcmVjZW50IHJlLXdvcmsuCj4+Pj4gVGhlIGN1cnJlbnQgYmVoYXZpb3VyIG9mIGhhdmluZyBp
dCBhbGxvY2F0ZWQgYnkgdGhlIHJlcXVlc3QoKSBob29rLCBidXQKPj4+PiAiZnJlZWQiIGluIGEg
bWl4IG9mIGNvbW1vbiBjb2RlIGFuZCBhIGZyZWUoKSBob29rLCBjYW5ub3QgcG9zc2libHkgaGF2
ZQo+Pj4+IGJlZW4gYW4gaW50ZW5kZWQgY29uc2VxdWVuY2UgZnJvbSBtb3ZpbmcgaXQuCj4+Pj4K
Pj4+PiBUaGUgZnJlZSgpIGhvb2sgaXMgY3VycmVudGx5IG5lY2Vzc2FyeSwgYXMgaXMgdGhlIHZl
bmRvci1zcGVjaWZpYwo+Pj4+IGFsbG9jYXRpb24gbG9naWMsIHNvIHNwbGl0dGluZyBmcmVlaW5n
IHJlc3BvbnNpYmlsaXR5IHdpdGggdGhlIGNvbW1vbgo+Pj4+IGNvZGUgaXMgd3JvbmcuCj4+PiBI
bW0sIHllcywgd2l0aCB0aGUgYWxsb2NhdGlvbiBkb25lIGluIHZlbmRvciBjb2RlLCB0aGUgZnJl
ZWluZwo+Pj4gY291bGQgYmUsIHRvby4gQnV0IHRoZSB3cmFwcGVyIHN0cnVjdCBnZXRzIGFsbG9j
YXRlZCBsYXN0IGluCj4+PiBjcHVfcmVxdWVzdF9taWNyb2NvZGUoKSAoZm9yIGJvdGggSW50ZWwg
YW5kIEFNRCksIGFuZCBoZW5jZSBvdWdodAo+Pj4gdG8gYmUgcmVsYXRpdmVseSBlYXN5IHRvIGdl
dCByaWQgb2YsIGluc3RlYWQgb2YgbW92aW5nIGFyb3VuZAo+Pj4gdGhlIGZyZWVpbmcgKHRoZSBj
b21tb24gY29kZSBwYXJ0IG9mIHRoZSBmcmVlaW5nIHdvdWxkIHRoZW4KPj4+IHNpbXBseSBnbyBh
d2F5KS4KPj4gSSBhbSB3b3JraW5nIG9uIHJlbW92aW5nIGFsbCB1bm5lY2Vzc2FyeSBhbGxvY2F0
aW9ucywgaW5jbHVkaW5nIGZvbGRpbmcKPj4gbWljcm9jb2RlX3tpbnRlbCxhbWR9IGludG8gbWlj
cm9jb2RlX3BhdGNoLCBidXQgSSdtIHN0aWxsIGNvbmZpZGVudCB0aGlzCj4+IHdhbnRzIHRvIGJl
IGRvbmUgd2l0aCBtaWNyb2NvZGVfcGF0Y2ggYmVpbmcgcHJvcGVybHkgb3BhcXVlIHRvIGNvcmUu
Ywo+IE9oLCBzdXJlIC0gSSBkaWRuJ3QgbWVhbiB0byBwdXQgdGhpcyB1bmRlciBxdWVzdGlvbi4g
SXQganVzdCBzZWVtcwo+IHRvIG1lIHRoZSB0aGUgcm91dGUgdGhlcmUgbWF5IGJldHRlciBiZSBz
b21ld2hhdCBkaWZmZXJlbnQgZnJvbSB0aGlzCj4gYW5kIHRoZSBmb2xsb3dpbmcgcGF0Y2guCgpI
b3c/CgpXZSB3YW50IHRvIHJlbW92ZSB0aGUgcG9pbnRlciBmcm9tIG1pY3JvY29kZV9wYXRjaCwg
YW5kIGRvbid0IHdhbnQgdGhlCmN1cnJlbnQgY29udGVudHMgb2YgbWljcm9jb2RlX3tpbnRlbCxh
bWR9IGVzY2FwaW5nIGZyb20gdGhlaXIgY3VycmVudApzb3VyY2UgZmlsZXMuCgpJIGRvbid0IHNl
ZSBhbnkgb3B0aW9uIGJ1dCB0byByZWFycmFuZ2UgaXQgdG8gYmUgb3BhcXVlLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
