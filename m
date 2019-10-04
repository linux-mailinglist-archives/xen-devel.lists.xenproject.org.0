Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DACBE50
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 16:58:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGP0H-0007cQ-HD; Fri, 04 Oct 2019 14:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T2rb=X5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iGP0G-0007cK-TK
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 14:56:20 +0000
X-Inumbo-ID: 1f54829e-e6b7-11e9-975c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f54829e-e6b7-11e9-975c-12813bfff9fa;
 Fri, 04 Oct 2019 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570200980;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BXqfwxy07AJiYfhrCBIBWZZ+m+PdIAtXY6n7jiI29lE=;
 b=BkE4jdj+JRRiRmW7ZDIxz+TKN4b3GuqrJLq+TZJxdd6AcHkiRRPtLrvk
 gvH/w8AbdyFmiNt8DzzeQec7b/7i4d1UUXTPALGIn/sB0LhS4nAYCgTl9
 cLWYrvChFzSMWQBa5zRnedgKDCUgVZaFXTjeMjDWW/u8ZBohvpn6TzO0U 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ieMC28sULzVT/MCV513V0DXv9TSVwCZVEPs+GWSdK9TW64U03hGn494atH3OCXrr0YL+NuhfCL
 pyp1QJZ9nPzXQ07zA3AdvDOYKTBB+cxRz4UwdIEF3n1WTDZBv/5Imil69KNiA1Ih2ZCLp6Te8x
 rcXHW+4hQC3JRHhPqNBqUK0VRpIS6BQILwm7OKae4frFZc8uwG9iC4z1YUct9t7sn+7MvkPit+
 tYDfEgE47uDf/Zt0lVTNmKDb5Ec5zebHVIR7GJoKnhL6A/Nt2sJQf7Ax8yjvGnyoIgxu9ynr0U
 kJg=
X-SBRS: 2.7
X-MesageID: 6551308
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6551308"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20191004064010.25646-1-jgross@suse.com>
 <a2e23594-04ae-a87d-5512-f8775a21552b@citrix.com>
 <e8364443-4f7f-62b7-f00d-4687ae07628b@suse.com>
 <2965839e-6be2-720f-ad1a-8e725f0bffaa@citrix.com>
 <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <25238153-6769-19d7-fa17-4fc9cf8652a1@citrix.com>
Date: Fri, 4 Oct 2019 15:56:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <36630890-ec4b-1404-7fbe-f8d924613c8e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvNC8xOSAzOjQzIFBNLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDA0LjEwLjE5IDE2
OjM0LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBPbiAxMC80LzE5IDM6MjQgUE0sIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBPbiAwNC4xMC4xOSAxNjowOCwgR2VvcmdlIER1bmxhcCB3cm90ZToK
Pj4+PiBPbiAxMC80LzE5IDc6NDAgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IHNjaGVk
X3RpY2tfc3VzcGVuZCgpIGFuZCBzY2hlZF90aWNrX3Jlc3VtZSgpIHNob3VsZCBub3QgY2FsbCB0
aGUKPj4+Pj4gc2NoZWR1bGVyIHNwZWNpZmljIHRpbWVyIGhhbmRsZXJzIGluIGNhc2UgdGhlIGNw
dSB0aGV5IGFyZSBydW5uaW5nIG9uCj4+Pj4+IGlzIGp1c3QgYmVpbmcgbW92ZWQgdG8gb3IgZnJv
bSBhIGNwdXBvb2wuCj4+Pj4+Cj4+Pj4+IFVzZSBhIG5ldyBwZXJjcHUgbG9jayBmb3IgdGhhdCBw
dXJwb3NlLgo+Pj4+Cj4+Pj4gSXMgdGhlcmUgYSByZWFzb24gd2UgY2FuJ3QgdXNlIHRoZSBwY3B1
X3NjaGVkdWxlX2xvY2soKSBpbnN0ZWFkIG9mCj4+Pj4gaW50cm9kdWNpbmcgYSBuZXcgb25lP8Kg
IFNvcnJ5IGlmIHRoaXMgaXMgb2J2aW91cywgYnV0IGl0J3MgYmVlbiBhIHdoaWxlCj4+Pj4gc2lu
Y2UgSSBwb2tlZCBhcm91bmQgdGhpcyBjb2RlLgo+Pj4KPj4+IExvY2sgY29udGVudGlvbiB3b3Vs
ZCBiZSBoaWdoZXIgZXNwZWNpYWxseSB3aXRoIGNyZWRpdDIgd2hpY2ggaXMgdXNpbmcgYQo+Pj4g
cGVyLWNvcmUgb3IgZXZlbiBwZXItc29ja2V0IGxvY2suIFdlIGRvbid0IGNhcmUgYWJvdXQgb3Ro
ZXIgc2NoZWR1bGluZwo+Pj4gYWN0aXZpdHkgaGVyZSwgYWxsIHdlIG5lZWQgaXMgYSBndWFyZCBh
Z2FpbnN0IG91ciBwZXItY3B1IHNjaGVkdWxlcgo+Pj4gZGF0YSBiZWluZyBjaGFuZ2VkIGJlbmVh
dGggb3VyIGZlZXQuCj4+Cj4+IElzIHRoaXMgY29kZSByZWFsbHkgYmVpbmcgY2FsbGVkIHNvIG9m
dGVuIHRoYXQgd2UgbmVlZCB0byB3b3JyeSBhYm91dAo+PiB0aGlzIGxldmVsIG9mIGNvbnRlbnRp
b24/Cj4gCj4gSXRzIGNhbGxlZCBlYWNoIHRpbWUgaWRsZSBpcyBlbnRlcmVkIGFuZCBsZWZ0IGFn
YWluLgo+IAo+IEVzcGVjaWFsbHkgd2l0aCBjb3JlIHNjaGVkdWxpbmcgdGhlcmUgaXMgYSBoaWdo
IHByb2JhYmlsaXR5IG9mIG11bHRpcGxlCj4gY3B1cyBsZWF2aW5nIGlkbGUgYXQgdGhlIHNhbWUg
dGltZSBhbmQgdGhlIHBlci1zY2hlZHVsZXIgbG9jayBiZWluZyB1c2VkCj4gaW4gcGFyYWxsZWwg
YWxyZWFkeS4KCkhybSwgdGhhdCBkb2VzIHNvdW5kIHByZXR0eSBiYWQuCgo+PiBXZSBhbHJlYWR5
IGhhdmUgYSAqbG90KiBvZiBsb2NrczsgYW5kIGluIHRoaXMgY2FzZSB5b3UncmUgYWRkaW5nIGEK
Pj4gc2Vjb25kIGxvY2sgd2hpY2ggaW50ZXJhY3RzIHdpdGggdGhlIHBlci1zY2hlZHVsZXIgY3B1
IGxvY2suwqAgVGhpcyBqdXN0Cj4+IHNlZW1zIGxpa2UgYXNraW5nIGZvciB0cm91YmxlLgo+IAo+
IEluIHdoaWNoIHdheSBkb2VzIGl0IGludGVyYWN0IHdpdGggdGhlIHBlci1zY2hlZHVsZXIgY3B1
IGxvY2s/Cj4gCj4+IEkgd29uJ3QgTmFjayB0aGUgcGF0Y2gsIGJ1dCBJIGRvbid0IHRoaW5rIEkg
d291bGQgYWNrIGl0IHdpdGhvdXQgY2xlYXIKPj4gZXZpZGVuY2UgdGhhdCB0aGUgZXh0cmEgbG9j
ayBoYXMgYSBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCB0aGF0J3Mgd29ydGgKPj4gdGhlIGNvc3Qg
b2YgdGhlIGV4dHJhIGNvbXBsZXhpdHkuCj4gCj4gSSB0aGluayBjb21wbGV4aXR5IGlzIGxvd2Vy
IHRoaXMgd2F5LiBFc3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoZSBwZXItCj4gc2NoZWR1bGVyIGxv
Y2sgY2hhbmdpbmcgd2l0aCBtb3ZpbmcgYSBjcHUgdG8gb3IgZnJvbSBhIGNwdXBvb2wuCgpUaGUg
a2V5IGFzcGVjdCBvZiB0aGUgcGVyLXNjaGVkdWxlciBsb2NrIGlzIHRoYXQgb25jZSB5b3UgaG9s
ZCBpdCwgdGhlCnBvaW50ZXIgdG8gdGhlIGxvY2sgY2FuJ3QgY2hhbmdlLgoKQWZ0ZXIgdGhpcyBw
YXRjaCwgdGhlIGZhY3QgcmVtYWlucyB0aGF0IHNvbWV0aW1lcyB5b3UgbmVlZCB0byBncmFiIG9u
ZQpsb2NrLCBzb21ldGltZXMgdGhlIG90aGVyLCBhbmQgc29tZXRpbWVzIGJvdGguCgpBbmQsIHRp
Y2tfc3VzcGVuZCgpIGxpdmVzIGluIHRoZSBwZXItc2NoZWR1bGVyIGNvZGUuICBFYWNoIHNjaGVk
dWxlciBoYXMKdG8gcmVtZW1iZXIgdGhhdCB0aWNrX3N1c3BlbmQgYW5kIHRpY2tfcmVzdW1lIGhv
bGQgYSBjb21wbGV0ZWx5CmRpZmZlcmVudCBsb2NrIHRvIHRoZSByZXN0IG9mIHRoZSBzY2hlZHVs
aW5nIGZ1bmN0aW9ucy4KCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
