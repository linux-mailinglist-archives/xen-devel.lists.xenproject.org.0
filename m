Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D6EC8A7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 19:52:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQbzY-0000SN-Gu; Fri, 01 Nov 2019 18:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6PC9=YZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iQbzX-0000SG-9p
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 18:49:47 +0000
X-Inumbo-ID: 5f7e0a52-fcd8-11e9-956b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f7e0a52-fcd8-11e9-956b-12813bfff9fa;
 Fri, 01 Nov 2019 18:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572634187;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=tr/HR9EMgZo5nh2Rhs6kApxq1802H5AP7nLSXvqVV0w=;
 b=YPNF0lTbqTR0MEJP0vaSYCYvQ9aSyiaXmqkGy5uK3/ZGHX+uyoeegnyl
 DOLHdeJ3tKg0icnZbiW5qpvu5pPuAEuUO5AuhcJOioC5pveY04GEf76dB
 mDdN8tOXxMVlFKHaZAD2YCdSQASMFQN+xUN4+8zW56RHNcdmEO4lGAoel U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c/H8peE9ZtamArZv+X07lIVuymzvvJwUbpggGHlk4Qd6B0Rzmg/p9kbenXM2uHqnFH+3EVVi9H
 iQeDkIeoSfClZKYlfXw9xaIDWoBINQpoAID9leHizEcxCYsmbk/5DUPGqBLHpCl9OXIru78EAX
 y0yP44LUFRqw21Gg+VdJ9T8VZtRYaIYP61IqM5XRkBOe0C9ykn0YlsZu/nJuDOQSk9X/6bRrA7
 QTGp68593z64oE8q7BqNmzhzW3QWoKpT1tvtYuM7fH8p1iKF6EAuELku952tbrMgyhswR2Yrma
 wxs=
X-SBRS: 2.7
X-MesageID: 7742235
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,256,1569297600"; 
   d="scan'208";a="7742235"
To: <xen-devel@lists.xenproject.org>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
 <6e358e65-2efe-9e4c-01e9-d9e317c6dfbc@amazon.com>
 <6b27b379-f996-4b33-bf24-178bec5ff6b9@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d002b40f-1316-a968-4860-186db54bb07f@citrix.com>
Date: Fri, 1 Nov 2019 18:49:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b27b379-f996-4b33-bf24-178bec5ff6b9@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMTEvMjAxOSAxNDoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8xMS8yMDE5
IDE0OjAwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4gVGhhbmtzIGZvciB0aGlzIHNlcmllcywg
SmFuLgo+Pgo+PiBPbiAzMC4xMC4xOSAxMTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBUbyBm
dWxmaWxsIHRoZSAicHJvdGVjdGVkIiBpbiBpdHMgbmFtZSwgZG9uJ3QgbGV0IHRoZSByZWFsIGhh
cmR3YXJlCj4+PiB2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBSZXBvcnQgYSBjb250cm9sIHJlZ2lz
dGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+PiAtLS0KPj4+IFRCRDogRG8gd2Ugd2FudCB0byBw
ZXJtaXQgRG9tMCBhY2Nlc3M/Cj4+IEl0IHdvdWxkIGJlIG5pY2UgdG8gZ2l2ZSBhbiBhZG1pbmlz
dHJhdG9yIGEgd2F5IHRvIGdldCBQUElOIG91dHNpZGUKPj4gdGhlIGNvbnRleHQgb2YgYW4gTUNF
IHdoZW4gbmVlZGVkLgo+IEkgc3VwcG9zZSB0aGlzIGlzIGEgcmVhc29uYWJsZSByZXF1ZXN0LsKg
IFdlIHNob3VsZCBleHBvc2UgaXQgdG8gdGhlCj4gaGFyZHdhcmUgZG9tYWluLgoKQWN0dWFsbHkg
b24gZnVydGhlciB0aG91Z2h0cywgSSdtIGdvaW5nIHRvIGJhY2t0cmFjayBzbGlnaHRseS4KCkl0
IGlzIHJlYXNvbmFibGUgdG8gZ2l2ZSB0byBkb20wLCBidXQgaXQgaXMgbm90IHJlYXNvbmFibGUg
dG8gcHJvdmlkZSBpdApieSBlbXVsYXRpbmcgdGhlIE1TUiBpbnRlcmZhY2UuwqAgVGhlIHByb2Js
ZW0gaXMgdGhhdCBkb20wJ3MgcmVzdWx0IGlzCnNlbnNpdGl2ZSB0byB3aGVyZSBpdCBoYXBwZW5z
IHRvIGJlIHNjaGVkdWxlZC4KClRoZSBvbmx5IHNhbmUgd2F5IG9mIGxldHRpbmcgZG9tMCBoYXZl
IGFjY2VzcyBpcyB2aWEgYSBoeXBlcmNhbGwgd2hpY2gKcmV0dXJucyAibm8gUFBJTiIgb3IgYWxs
IHNvY2tldHMgaW5mb3JtYXRpb24gaW4gb25lIGdvLCBpcnJlc3BlY3RpdmUgb2YKd2hpY2ggc29j
a2V0IHRoZSBjdXJyZW50IHZjcHUgaGFwcGVucyB0byBiZSBleGVjdXRpbmcgb24uCgpUaGlzIGxl
YXZlcyB1cyBiYWNrIGluIHRoZSAoc3Vic3RhbnRpYWxseSBlYXNpZXIpIHBvc2l0aW9uIG9mIG5v
dCBoYXZpbmcKdG8gdmlydHVhbGlzZSB0aGUgTVNSIGludGVyZmFjZSB0byBiZWdpbiB3aXRoLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
