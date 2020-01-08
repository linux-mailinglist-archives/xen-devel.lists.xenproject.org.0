Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B71346BF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:55:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDcT-0000Qp-3c; Wed, 08 Jan 2020 15:51:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipDcR-0000Qd-N3
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:51:39 +0000
X-Inumbo-ID: bca18a3e-322e-11ea-a38f-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bca18a3e-322e-11ea-a38f-bc764e2007e4;
 Wed, 08 Jan 2020 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578498691;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=SIwnXLyrtVHm1MP9H3qz4vcyHMgZ1KdABztK8nH9JtQ=;
 b=Hfe89tKJSIswfIFNaJ01n3i/ZEQyQe+YSUp4ETcIVdRuJM4WAbogBwdZ
 sKmtpGd8MDpWi78PBC6D3N2yMeJ8sal3nlehtfQhyLxZAjbNS5B0aQFCO
 6R9aHfnuklxymFgXB/Zlj/epqQq874753dzpkEf9ySx+7qumbd8duSRb7 g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kgJBsUs7YjG6dqEJNxa5RRurFKR9rq4t22DWc1ykWxbKmzfeFKh26EV7YycslT/0SXWpvV9h6R
 wXAjSNV2Ovnc+RpIbsY25aqsHFQeRAR0lh2j6q/4/+SC83vWxzO9FfZVG4990DzMKG7UujB0mT
 BsRUX/linyRhlGxbsz5z2HMLAplNj4M2ENUE3L40pDDOdLdMUQAzQB+layarmwUkMOH86WmVCr
 0cWb3zSrfZR2at1jDxQSKTVzV/OMywKmleGiwIrdua9zi+K/EP/EfyxX2v96RxV22j+r86Gpfg
 Jtk=
X-SBRS: 2.7
X-MesageID: 10791625
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10791625"
To: Jan Beulich <jbeulich@suse.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-3-andrew.cooper3@citrix.com>
 <145d6e59-b50e-b617-cbb5-48ebed002c23@suse.com>
 <fd2d333a-8127-2688-acb7-b082955f9eb5@citrix.com>
 <b07c66db-193e-7bb0-7ea2-12d876b3ccac@suse.com>
 <b60a3b8b-351f-5756-3726-fedd3b8bcec9@citrix.com>
 <6bcf8801-ae9b-7216-6998-564b682d95f3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <45b578fe-15df-0f44-b341-e659a0419414@citrix.com>
Date: Wed, 8 Jan 2020 15:51:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6bcf8801-ae9b-7216-6998-564b682d95f3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/6] x86/boot: Map the trampoline as
 read-only
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

T24gMDgvMDEvMjAyMCAxMTowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMDEuMjAyMCAy
MDowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDcvMDEvMjAyMCAxNjoxOSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwNy4wMS4yMDIwIDE2OjUxLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDA3LzAxLzIwMjAgMTU6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAw
Ni4wMS4yMDIwIDE2OjU0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gYy9zIGVjOTJmY2Qx
ZDA4LCB3aGljaCBjYXVzZWQgdGhlIHRyYW1wb2xpbmUgR0RUIEFjY2VzcyBiaXRzIHRvIGJlIHNl
dCwKPj4+Pj4+IHJlbW92ZWQgdGhlIGZpbmFsIHdyaXRlcyB3aGljaCBvY2N1cnJlZCBiZXR3ZWVu
IGVuYWJsaW5nIHBhZ2luZyBhbmQgc3dpdGNoaW5nCj4+Pj4+PiB0byB0aGUgaGlnaCBtYXBwaW5n
cy4gIFRoZXJlIGRvbid0IHBsYXVzaWJseSBuZWVkIHRvIGJlIGFueSBtZW1vcnkgd3JpdGVzIGlu
Cj4+Pj4+PiBmZXcgaW5zdHJ1Y3Rpb25zIGlzIHRha2VzIHRvIHBlcmZvcm0gdGhpcyB0cmFuc2l0
aW9uLgo+Pj4+Pj4KPj4+Pj4+IEFzIGEgY29uc2VxdWVuY2UsIHdlIGNhbiByZW1vdmUgdGhlIFJX
WCBtYXBwaW5nIG9mIHRoZSB0cmFtcG9saW5lLiAgSXQgaXMgUlgKPj4+Pj4+IHZpYSBpdHMgaWRl
bnRpdHkgbWFwcGluZyBiZWxvdyAxTSwgYW5kIFJXIHZpYSB0aGUgZGlyZWN0bWFwLgo+Pj4+Pj4K
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4+Pj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+Pj4+Cj4+Pj4+PiBUaGlzIHByb2JhYmx5IHdhbnRzIGJhY2twb3J0aW5nLCBhbG9uZ3NpZGUg
ZWM5MmZjZDFkMDggaWYgaXQgaGFzbid0IHlldC4KPj4+Pj4gVGhpcyBpcyBqdXN0IGNsZWFudXAs
IGxhcmdlbHkgY29zbWV0aWMgaW4gbmF0dXJlLiBJdCBjb3VsZCBiZSBhcmd1ZWQKPj4+Pj4gdGhh
dCBvbmNlIHRoZSBkaXJlY3RtYXAgaGFzIGRpc2FwcGVhcmVkIHRoaXMgY2FuIHNlcnZlIGFzIGFk
ZGl0aW9uYWwKPj4+Pj4gcHJvb2YgdGhhdCB0aGUgdHJhbXBvbGluZSByYW5nZSBoYXMgbm8gKGlu
dGVuZGVkKSB3cml0YWJsZSBtYXBwaW5ncwo+Pj4+PiBhbnltb3JlLCBidXQgcHJpb3IgdG8gdGhh
dCBwb2ludCBJIGRvbid0IHNlZSBtdWNoIGZ1cnRoZXIgYmVuZWZpdC4KPj4+Pj4gQ291bGQgeW91
IGV4cGFuZCBvbiB0aGUgcmVhc29ucyB3aHkgeW91IHNlZSBib3RoIGFzIGJhY2twb3J0aW5nCj4+
Pj4+IGNhbmRpZGF0ZXM/Cj4+Pj4gRGVmZW5jZSBpbiBkZXB0aC4KPj4+Pgo+Pj4+IEFuIFJXWCBt
YXBwaW5nIGlzIHZlcnkgYXR0cmFjdGl2ZSBmb3IgYW4gYXR0YWNrZXIgd2hvJ3MgYnJva2VuIGlu
dG8gWGVuCj4+Pj4gYW5kIGlzIGxvb2tpbmcgdG8gZXhwYW5kIHRoZSBkYW1hZ2UgdGhleSBjYW4g
ZG8uCj4+PiBTdWNoIGFuIGF0dGFja2VyIGlzIHR5cGljYWxseSBpbiB0aGUgcG9zaXRpb24gdGhv
dWdoIHRvIG1ha2UKPj4+IHRoZW1zZWx2ZXMgUldYIG1hcHBpbmdzLgo+PiBUaGlzIGlzIG9uZSBl
eGFtcGxlIG9mIGEgcG9zc2liaWxpdHkuwqAgSSB3b3VsZG4ndCBwdXQgaXQgaW4gdGhlICJsaWtl
bHkiCj4+IGNhdGVnb3J5LCBhbmQgaXQgZGVmaW5pdGVseSBpc24ndCBhIGd1YXJhbnRlZS4KPj4K
Pj4+ICBIYXZpbmcgYXMgbGl0dGxlIGFzIHBvc3NpYmxlIGlzIG9ubHkKPj4+IGNvbXBsaWNhdGlu
ZyB0aGVpciBqb2IsIG5vdCBtYWtpbmcgaXQgaW1wb3NzaWJsZSwgSSB3b3VsZCBzYXkuCj4+IFll
cywgYW5kPwo+Pgo+PiBUaGlzIGlzIHRoZSBlbnRpcmUgcG9pbnQgb2YgZGVmZW5jZSBpbiBkZXB0
aC7CoCBNYWtlIGFuIGF0dGFja2VycyBqb2IgaGFyZGVyLgo+Pgo+PiBFbmZvcmNpbmcgV15YIGlz
IHVuaXZlcnNhbGx5IGNvbnNpZGVyZWQgYSBnb29kIHRoaW5nIGZyb20gYSBzZWN1cml0eQo+PiBw
ZXJzcGVjdGl2ZSwgYmVjYXVzZSBpdCByZW1vdmVzIGEgbG9hZCBvZiB0cml2aWFsIGNhc2VzIGNh
c2VzIHdoZXJlIGEKPj4gc3RhY2sgb3Zlci13cml0ZSBjYW4gZWFzaWx5IGJlIHR1cm5lZCBpbnRv
IGFyYml0cmFyeSBjb2RlIGV4ZWN1dGlvbi4KPiBUaGVuIGxldCBtZSBhc2sgdGhlIHF1ZXN0aW9u
IGRpZmZlcmVudGx5OiBEaWQgd2UgYmFja3BvcnQgYW55IG9mIHRoZQo+IGVhcmxpZXIgUldYIGVs
aW1pbmF0aW9uIGNoYW5nZXM/IEkgZG9uJ3QgcmVjYWxsIHVzIGRvaW5nIHNvLgoKSSBkb24ndCBr
bm93IGlmIHdlIGRpZCBvciBub3QuCgo+IFBsZWFzZQo+IGRvbid0IGdldCBtZSB3cm9uZyAtIEkn
bSBoYXBweSB0byBiZSBjb252aW5jZWQgb2YgdGhlIGJhY2twb3J0IG5lZWQsCj4gYnV0IGFzIGFs
d2F5cyBJJ2QgbGlrZSB0byB0YWtlIHN1Y2ggYSBkZWNpc2lvbiBpbiBhIGNvbnNpc3RlbnQgKGFu
ZAo+IGhlbmNlIHN1ZmZpY2llbnRseSBwcmVkaWN0YWJsZSkgbWFubmVyLCBvciBhbHRlcm5hdGl2
ZWx5IHdpdGggYSBnb29kCj4gZW5vdWdoIHJlYXNvbiB0byBpZ25vcmUgdGhpcyBnZW5lcmFsIGdv
YWwuCgpJZiB3ZSBkaWRuJ3QsIHRoZW4gd2UgcmVhbGx5IG91Z2h0IHRvIGhhdmUgZG9uZS7CoCBU
aGVyZSBhcmUgcmVhbCwKY29uY3JldGUgc2VjdXJpdHkgbmljZS10by1oYXZlcyBmcm9tIGl0LgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
