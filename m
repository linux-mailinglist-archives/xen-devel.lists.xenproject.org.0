Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4C14A8E1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 18:24:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw854-0003Tt-FX; Mon, 27 Jan 2020 17:21:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5P7q=3Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iw852-0003To-O2
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 17:21:44 +0000
X-Inumbo-ID: 7c779bf7-4129-11ea-857d-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c779bf7-4129-11ea-857d-12813bfff9fa;
 Mon, 27 Jan 2020 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580145704;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=BCVQ58NTT/S7pJDtISKatl+b+YtdZu3mJyGOp8G5F38=;
 b=Xyij/l4xOUvwQbh6EicT51Jd9IQGpTn1+6LfusBetNCaEZiZbHf+DnDl
 P+ykG3jVN2ra+WH4Su1FYkVxdyrJQYkwbv+nBa9lPsbMYWiDcyC7otUAS
 aMo2NMfRMqMgSqg1VcyZqgTgy+cWes8FhF0IctFFqWuxZuqk6Lel59Q7m o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7Q9SKGhlbtnVfcdrUpY1RMNk9R6++riqpXWfV5a9pXxjTwfafdrTsLbMQci8nWfiXqnODEkBgp
 o+E/gAB/LAOFW9IGumdabZO3grYI3Xqb249WZWdnZoQ8vuQbzq1tqUdzYlvk1FO98Z8ndZGmHh
 NaJVfy3A6Vw734rTba6EbSqoD5rqBHIzKOvguUO7qH3S6zagA15PEpFmFQjmjyQF2kCipY02l4
 4wSFk1Ji2gXfi/Ed555OO83dIGHkDKQQMG1BHfwTPoxKkEpw51zbrOEpQvU0MoPYBxdd8/Kuwj
 oac=
X-SBRS: 2.7
X-MesageID: 11678942
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11678942"
Date: Mon, 27 Jan 2020 18:21:33 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200127172133.GI57924@desktop-tdan49n.eng.citrite.net>
References: <20200123180615.69370-1-roger.pau@citrix.com>
 <20200123180615.69370-3-roger.pau@citrix.com>
 <db22cea4-47cf-14b8-8ebf-6f65104920a4@suse.com>
 <1bd1ffed-709a-469d-d7e0-ccef16035f88@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bd1ffed-709a-469d-d7e0-ccef16035f88@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/apic: simplify
 disconnect_bsp_APIC setup of LVT{0/1}
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDQ6NDc6NDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wMS8yMDIwIDE2OjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDIz
LjAxLjIwMjAgMTk6MDYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+PiBUaGVyZSdzIG5vIG5l
ZWQgdG8gcmVhZCB0aGUgY3VycmVudCB2YWx1ZXMgb2YgTFZUezAvMX0gZm9yIHRoZQo+ID4+IHB1
cnBvc2VzIG9mIHRoZSBmdW5jdGlvbiwgd2hpY2ggc2VlbSB0byBiZSB0byBzYXZlIHRoZSBjdXJy
ZW50bHkKPiA+PiBzZWxlY3RlZCB2ZWN0b3I6IGluIHRoZSBkZXN0aW5hdGlvbiBtb2RlcyB1c2Vk
IChFeHRJTlQgYW5kIE5NSSkgdGhlCj4gPj4gdmVjdG9yIGZpZWxkIGlzIGlnbm9yZWQgYW5kIGhl
bmNlIGNhbiBiZSBzZXQgdG8gMC4KPiA+IFRoZSBxdWVzdGlvbiBpcyAtIGlzIHRoZXJlIGZpcm13
YXJlIHB1dHRpbmcgZGF0YSBpbiB0aGVzZSBmaWVsZHMKPiA+IHRoYXQgaXQgZXhwZWN0cyB0byBz
dXJ2aXZlIHVubW9kaWZpZWQ/IFN1Y2ggYmVoYXZpb3Igd291bGQgYmUKPiA+IGhpZ2hseSBzdXNw
ZWN0ICh0byBtZSBhdCBsZWFzdCksIGJ1dCB5b3UgbmV2ZXIga25vdy4gVGhlcmUgb3VnaHQKPiA+
IHRvIGJlIGEgcmVhc29uIGl0J3MgYmVlbiBkb25lIHRoaXMgd2F5IG5vdCBqdXN0IGluIFhlbiwg
YnV0IGFsc28KPiA+IGluIExpbnV4LiBJT1cgbWF5IEkgYXNrIHRoYXQgeW91IGF0IGxlYXN0IG1h
a2UgYW4gYXR0ZW1wdCB0bwo+ID4gc3VibWl0IHRoZSBzYW1lIGNoYW5nZSBmb3IgTGludXgsIHRv
IHNlZSB3aGF0IHRoZSBmZWVkYmFjayBpcz8KPiAKPiBJIGNhbiB0ZWxsIHlvdSB3aGF0IHRoZSBM
aW51eCBmZWVkYmFjayB3aWxsIGJlLgo+IAo+IFRoaXMgaXMgbm90IGEgZmFzdHBhdGguwqAgQWx3
YXlzIGRvIFJNVywgYmVjYXVzZSBsaWZlIGlzIHRvbyBzaG9ydCB0bwo+IGtlZXAgb24gdW5icmVh
a2luZyBoYXJkd2FyZSB3aGljaCBtYWtlcyBzdWNoIGFzc3VtcHRpb25zLgoKV2UgYWxyZWFkeSBk
byBzdWNoIGtpbmRzIG9mIGRpcmVjdCB3cml0ZXMgdG8gTFZUezAvMX0sIHNlZQpjbGVhcl9sb2Nh
bF9BUElDIHdoZXJlIFhlbiBjbGVhcnMgdGhlIHJlZ2lzdGVycyBieSBkaXJlY3RseSB3cml0aW5n
CkFQSUNfTFZUX01BU0tFRCB0byB0aGVtIChubyBSTVcpLiBBcyB0aGUgbW9kaWZpZWQgY29kZSBm
b2xsb3dzIGEgY2FsbAp0byBjbGVhcl9sb2NhbF9BUElDIHRoZXJlJ3Mgbm90aGluZyB0byBwcmVz
ZXJ2ZSBhdCB0aGlzIHBvaW50LgoKTm90ZSB0aGF0IGluaXRfYnNwX0FQSUMgYW5kIHNtcF9jYWxs
aW4gYWxzbyBjYWxsIGNsZWFyX2xvY2FsX0FQSUMsIHNvCnRoZXJlJ3Mgbm8gZGF0YSBpbiB0aG9z
ZSByZWdpc3RlcnMgdGhhdCBjb3VsZCBzdXJ2aXZlIChyZWdhcmRsZXNzIG9mCm15IGFkZGVkIGNh
bGwgdG8gY2xlYXJfbG9jYWxfQVBJQyBpbiB0aGUgcHJldmlvdXMgcGF0Y2gpLgoKSSdtIG5vdCBh
cmd1aW5nIHRoaXMgaXMgY29ycmVjdCAobm90IHN1cmUgaXQncyBpbmNvcnJlY3QgZWl0aGVyKSwg
YnV0CmdpdmVuIGhvdyB0aGluZ3MgYXJlIGhhbmRsZWQgQVRNIGl0IHNlZW1zIHF1aXRlIGR1bWIg
dG8gZG8gYSBSTVcgaW4KZGlzY29ubmVjdF9ic3BfQVBJQzogaXQgZ2l2ZXMgdGhlIGZhbHNlIGlt
cHJlc3Npb24gWGVuIGlzIHByZXNlcnZpbmcKc29tZXRoaW5nLCB3aGVuIHRoZSByZWdpc3RlciBo
YXMgYWxyZWFkeSBiZWVuIHdpcGVkIGF0IHN0YXJ0dXAuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
