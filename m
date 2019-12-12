Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5270311D79E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 21:03:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifUak-000806-7K; Thu, 12 Dec 2019 19:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Md0W=2C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifUai-000801-Cm
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 19:57:40 +0000
X-Inumbo-ID: a64e02aa-1d19-11ea-8e0c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a64e02aa-1d19-11ea-8e0c-12813bfff9fa;
 Thu, 12 Dec 2019 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576180659;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2XawxQCMpb0VG7AXyCo8VF0vBzwcojwGRuLZrm5WyqA=;
 b=TEqN8OVqVybSEl8kR/UWyj9HSJbM/TNfehkqxWhBwlGdvIFgpU2SjW2E
 1Ip3Wcew3Q73wmkrkwTk31FAd8BD3OoB80JZQEFPBJbEZgh/BF09VLMzQ
 r/uuz0UYRV01HmEEluullIfMhnuNyeTnvLCt2fwSpirrmAbfhKZUdNUTa k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rTcZGfv0iIBt926LZtX/TuCuTlLSiIJspgxrXckKYn5/FkxKi0Co2I3xQ3VX1uPrDct6EiVKWn
 pkAblB/09gtwa3qfhmd2CTwHGXr8Yg1MIveGK3KZd6lCRbmM1BFXogFq/9+t4khOLjTDw3fJNd
 H5K0EAGf6w6Bn4brpCEz2jmXnAPJ/HQJtbLr1nJ24xd4UXcwJ8q21ZGYQr4XVtwoYt4PZcB4d7
 wslDGCt6R+i2NyuFiXAmrJvOvp4DjWrnU79j6+ZTkR2WH5HZJB9gBQxkzrt0xytjb+pTnoG2kt
 GWQ=
X-SBRS: 2.7
X-MesageID: 9969094
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9969094"
To: George Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
 <20191212173203.1692762-3-george.dunlap@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <adebcf25-51d5-3f10-0910-e4fbabea8583@citrix.com>
Date: Thu, 12 Dec 2019 19:57:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212173203.1692762-3-george.dunlap@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/4] x86/mm: Implement common put_data_pages
 for put_page_from_l[23]e
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
Cc: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAxNzozMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBCb3RoIHB1dF9wYWdl
X2Zyb21fbDJlIGFuZCBwdXRfcGFnZV9mcm9tX2wzZSBoYW5kbGUgaGF2aW5nIHN1cGVycGFnZQo+
IGVudHJpZXMgYnkgbG9vcGluZyBvdmVyIGVhY2ggcGFnZSBhbmQgInB1dCItaW5nIGVhY2ggb25l
IGluZGl2aWR1YWxseS4KPiBBcyB3aXRoIHB1dHRpbmcgcGFnZSB0YWJsZSBlbnRyaWVzLCB0aGlz
IGNvZGUgaXMgZnVuY3Rpb25hbGx5Cj4gaWRlbnRpY2FsLCBidXQgZm9yIHNvbWUgcmVhc29uIGRp
ZmZlcmVudC4gIE1vcmVvdmVyLCB0aGVyZSBpcyBhbHJlYWR5Cj4gYSBjb21tb24gZnVuY3Rpb24s
IHB1dF9kYXRhX3BhZ2UoKSwgdG8gaGFuZGxlIGF1dG9tYXRpY2FsbHkgc3dhcHBpbmcKPiBiZXR3
ZWVuIHB1dF9wYWdlKCkgKGZvciByZWFkLW9ubHkgcGFnZXMpIG9yIHB1dF9wYWdlX2FuZF90eXBl
KCkgKGZvcgo+IHJlYWQtd3JpdGUgcGFnZXMpLgo+Cj4gUmVwbGFjZSB0aGlzIHdpdGggcHV0X2Rh
dGFfcGFnZXMoKSAocGx1cmFsKSwgd2hpY2ggZG9lcyB0aGUgZW50aXJlCj4gbG9vcCwgYXMgd2Vs
bCBhcyB0aGUgcHV0X3BhZ2UgLyBwdXRfcGFnZV9hbmRfdHlwZSBzd2l0Y2guCj4KPiBTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gLS0tCj4g
TkIgdGhhdCBJJ3ZlIHVzZWQgdGhlICJzaW1wbGUgZm9yIGxvb3AiIHZlcnNpb24gdG8gbWFrZSBp
dCBlYXN5IHRvIHNlZQo+IHdoYXQncyBnb2luZyBvbiwgcmF0aGVyIHRoYW4gdGhlICJkbyB7IH0g
d2hpbGUoKSIgdmVyc2lvbiB3aGljaCB1c2VzICYKPiBhbmQgY29tcGFyZSB0byB6ZXJvIHJhdGhl
ciB0aGFuIGNvbXBhcmluZyB0byB0aGUgbWF4LgoKU28gd2hpbGUgSSB0aGluayB0aGUgY2hhbmdl
IGlzIGFuIGltcHJvdmVtZW50LCBhbmQgYXJlIGZpbmUgYXMKcHJlc2VudGVkLCBJJ20gLTEgdG93
YXJkcyBpdCBvdmVyYWxsLgoKSSBhbSBnb2luZyB0byBvbmNlIGFnYWluIGV4cHJlc3MgbXkgZmly
bSBvcGluaW9uIHRoYXQgdGhlIHJlbWFpbmluZyB1c2UKb2YgUFYgc3VwZXJwYWdlcyBkbyBmYXIg
bW9yZSBoYXJtIHRoYW4gZ29vZCwgYW5kIHNob3VsZCBiZSByZW1vdmVkCmNvbXBsZXRlbHkuCgpX
ZSBjb25zdHJ1Y3QgZG9tMCB3aXRoIHNvbWUgc3VwZXJwYWdlcyBmb3IgaXRzIHAybSBhbmQvb3Ig
aW5pdHJkLgoKVGhpcyB0dXJuZWQgb3V0IHRvIGJlIHRoZSBpc3N1ZSBiZWhpbmQgcHYtbDF0ZiBi
cmVha2luZyBmb3IgZG9tMCAoYy9zCjk2ZjZlZTE1YWQ3YyksIGFuZCB3aHkgd2UgaGFkIHRvIHNo
aXAgWFNBLTI3MyBpbiBhbiBpbnNlY3VyZQpjb25maWd1cmF0aW9uIChhbmQgSSdkIGxpa2UgdG8g
cG9pbnQgb3V0IHRoYXQgWGVuIGlzIHN0aWxsIGluIGFuCmluc2VjdXJlIGNvbmZpZ3VyYXRpb24g
YnkgZGVmYXVsdC4pCgpUaGVyZSBpcyBhIHN0aWxsLW91dHN0YW5kaW5nIGlzc3VlIHdpdGggZ3Jh
bnQgbWFwIGJ5IGxpbmVhciBhZGRyZXNzIG92ZXIKYSBzdXBlcnBhZ2Ugd2hlcmUgdGhpbmdzIG1h
bGZ1bmN0aW9uLCBhbmQgdGhlIG9ubHkgcmVhc29uIHRoaXMgZG9lc24ndApoYXZlIGFuIFhTQSBp
cyB0aGF0IGl0IGlzIGJlbGlldmVkIHRvIGJlIHJlc3RyaWN0ZWQgdG8gZG9tMCBvbmx5LgoKRmlu
YWxseSwgYW4gTDNfU0hJRlQgbG9vcCBpcyBhIGxvbmcgcnVubmluZyBvcGVyYXRpb24gd2hpY2gg
d2UgY2FuJ3QgcHV0CmEgY29udGludWF0aW9uIGludG8gdGhlIG1pZGRsZSBvZiwgYW5kIEkgYmV0
IHRoZXJlIGFyZSBmdW4gdGhpbmdzIHdoaWNoCmNhbiBiZSBkb25lIHRoZXJlIGluIHRoZSBnZW5l
cmFsIGNhc2UuCgpTZWVpbmcgYXMgUFYgZ3Vlc3RzIGRlY29tcHJlc3MgYW5kIGZyZWUgdGhlIGlu
aXRyZCwgYW5kIHJlcG9zaXRpb25zIHRoZQpwMm0sIG5vbmUgb2YgdGhlc2Ugc3VwZXJwYWdlcyB0
ZW5kIHRvIHN1cnZpdmUgcG9zdCBib290LCBzbyBJIGFtCmN1cnJlbnRseSB1bmNvbnZpbmNlZCB0
aGF0IGEgcGVyZiBpbXByb3ZlbWVudCB3b3VsZCBiZSBhbnl0aGluZyBidXQKbWFyZ2luYWwuCgpJ
IGNlcnRhaW5seSBkb24ndCB0aGluayBpdCBpcyB3b3J0aCB0aGUgY29tcGxleGl0eSBhbmQgY29y
bmVyIGNhc2VzIGl0CmNhdXNlcyBpcyBYZW4uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
