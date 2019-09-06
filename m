Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4553ABC03
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:16:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Fv5-0005mc-V2; Fri, 06 Sep 2019 15:13:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CtaX=XB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i6Fv4-0005mW-Fb
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:13:02 +0000
X-Inumbo-ID: d0111527-d0b8-11e9-abf6-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0111527-d0b8-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567782780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XmtNbtx4hUUKQ7eJ0BcIoJPKbCbuij+yPYR68BsI6BI=;
 b=D14tHeTxsaU248UdR2xtVFv6tejt2HbpcMAC90q35JR+zjfdIu2c3Yav
 lYNeS8PTzM+gaDTUA+OZZrztbVPragPt6GeGve/IAk6uMofWExlC3YmGY
 XmNS2u0l0EqlKDc2soJWIAuzKo45fbQxyGzAB6lDnG42Bl7dU2w69VVqB c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w1VqM+KowTLt891t3/c1NsQJCaw5Xj5rs+5dVo0u2VilNBwDvzvUCh57x4G1dtwKacmRyI/JiK
 IeJin+/hUSvTlDCDjRMXN3QTxCghed/QxRupHbM1pIxBILzdve3PPiLZtAaTs+pJ0hERd6tQK4
 InEj7FHuNgrWtxze6XXsQDUrqrWTyyym9R/xlCbRcadN7ZHVGFCGzn7YYetkw7x9fWzDcCIHga
 pyJrZQlSy1qB0Q8zF1bUN7u1r0vfrUdoM7Hbh4dtUVj4vfTa0eUW7ZD3lJyKEA5doswjnYVlDR
 kYs=
X-SBRS: 2.7
X-MesageID: 5473644
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5473644"
Date: Fri, 6 Sep 2019 17:12:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Message-ID: <20190906151253.5wdykbusy3irxbaw@Air-de-Roger>
References: <97e1bfe4-3383-ff1d-bf61-48b8aa63bb2c@citrix.com>
 <ABC38D35-2227-467D-BE3C-B5459B52B199@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ABC38D35-2227-467D-BE3C-B5459B52B199@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Criteria for checking in core scheduling series
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Dario Faggioli <dario.faggioli@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>, 'Jan
 Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTI6NDY6MDNQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiAKPiAKPiDvu79PbiAwNi8wOS8yMDE5LCAxMjowOSwgIkdlb3JnZSBEdW5sYXAiIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+ICAgICBUaGVyZSB3YXMgYSBkaXNjdXNz
aW9uIG9uIHRoZSBjb21tdW5pdHkgY2FsbCBhYm91dCB0aGUgY29yZSBzY2hlZHVsaW5nCj4gICAg
IHNlcmllcyBiZWluZyBkZXZlbG9wZWQgYnkgSnVlcmdlbiBHcm9zcyBbMV0uICBUaGUgY29uY2x1
c2lvbiBjYW4gYmUKPiAgICAgc3VtbWFyaXplZCBhcyBmb2xsb3dzOgo+ICAgICAKPiAgICAgKiBX
ZSBub3JtYWxseSB3YWl0IHRvIGNoZWNrIGluIHNlcmllcyB1bnRpbCB0aGV5IGFyZSBxdWl0ZSBn
b29kIC0tIGFsbAo+ICAgICB0aGUgaSdzIGRvdHRlZCBhbmQgYWxsIHRoZSB0J3MgY3Jvc3NlZAo+
ICAgICAKPiAgICAgKiBUaGlzIGlzIGZvciBzZXZlcmFsIHJlYXNvbnM7IHByaW1hcmlseSBiZWNh
dXNlIG9uY2UgY29kZSBnZXRzIGNoZWNrZWQKPiAgICAgaW4sIGl0IHJhcmVseSBnZXRzIGxvb2tl
ZCBhdCBhZ2Fpbi4gIEluIHBhcnRpY3VsYXIsIHRoZXJlJ3Mgbm90aGluZwo+ICAgICBzdG9wcGlu
ZyB0aGUgc3VibWl0dGVyIGZyb20gbmVnbGVjdGluZyB0byBkbyBpbXBvcnRhbnQgY2xlYW4tdXBz
LCBpbgo+ICAgICBzcGl0ZSBvZiB0aGVpciBiZXN0IGludGVudGlvbnM7IGxlYXZpbmcgdGhlIG1h
aW50YWluZXIgb3IgdGhlIHJlc3Qgb2YKPiAgICAgdGhlIGNvbW11bml0eSB0byBkbyBpdC4KPiAg
ICAgCj4gICAgICogSG93ZXZlciwgZm9yIHBhcnRpY3VsYXJseSBsb25nLCBjb21wbGljYXRlZCBz
ZXJpZXMgbGlrZSB0aGUgY29yZQo+ICAgICBzY2hlZHVsaW5nIHNlcmllcywgdGhpcyBjYW4gaGF2
ZSBzaWduaWZpY2FudCBkb3duc2lkZXMuICBSZWJhc2luZyBhCj4gICAgIDYwLXBhdGNoIGJyYW5j
aCByZWd1bGFybHkgaXMgYSBsb3Qgb2YgY2h1cm4gZm9yIGxpdHRsZSB2YWx1ZTsgYW5kIGNvcmUK
PiAgICAgcGFydHMgb2YgdGhlIHNlcmllcyB3aGljaCBhcmUgbW9zdGx5IGNvbXBsZXRlIGFyZSBj
dXJyZW50bHkgb25seSBnZXR0aW5nCj4gICAgIHNwb3JhZGljIGRldiB0ZXN0aW5nIHJhdGhlciB0
aGFuIHRoZSB3aWRlIHJhbmdlIG9mIHRlc3RpbmcgdGhleSB3b3VsZAo+ICAgICBnZXQgZnJvbSBi
ZWluZyBpbiBzdGFnaW5nLgo+ICAgICAKPiAgICAgKiBYZW5TZXJ2ZXIgYW5kIFN1U0UgYXJlIGJv
dGggbG9uZy10ZXJtIGNvbW11bml0eSBtZW1iZXJzIHdpdGggYSBzdHJvbmcKPiAgICAgaW5jZW50
aXZlIHRvIG1haW50YWluIGFuZCBpbXByb3ZlIHRoZSBmZWF0dXJlOyBzbyB0aGUgcmlzayBvZiB0
aGUKPiAgICAgZmVhdHVyZSBiZWluZyBsZWZ0IGZvciB0aGUgY29tbXVuaXR5IHRvIG1haW50aWFu
IGlzIHJlbGF0aXZlbHkgbm93Lgo+ICAgICAKPiAgICAgV2l0aCBhbGwgdGhvc2UgdGhpbmdzIGlu
IG1pbmQsIHRoZSBjb25jbHVzaW9uIHdhcyB0byBsb3dlciB0aGUKPiAgICAgImNoZWNrLWluIiB0
aHJlc2hvbGQgZnJvbSB3aGF0IGl0IG5vcm1hbGx5IGlzLCBpbiBvcmRlciB0byBhbGxvdyB0aGUK
PiAgICAgc2VyaWVzIHRvIGJlIGNoZWNrZWQgaW4gaW4gdGhlIG5lYXIgZnV0dXJlLCBpbiBlbm91
Z2ggdGltZSBhdCBsZWFzdCBmb3IKPiAgICAgdGhlICJkZWZhdWx0IG9mZiIgdG8gYmUgd2VsbC10
ZXN0ZWQgYnkgdGhlIDQuMTMgcmVsZWFzZS4KPiAgICAgCj4gICAgIFRoZSBjcml0ZXJpYSB3ZSBz
a2V0Y2hlZCBvdXQgd2VyZToKPiAgICAgCj4gICAgICogQWxsIHRoZSBwYXRjaGVzIHN0aWxsIG5l
ZWQgYXBwcm9wcmlhdGUgQWNrIC8gUi1iJ3MKPiAgICAgCj4gICAgICogVGhlcmUgc2hvdWxkIGJl
IHJlYXNvbiB0byBiZWxpZXZlIHRoYXQgdGhlIHNlcmllcyB3aWxsIGhhdmUgbGl0dGxlIHRvCj4g
ICAgIG5vIGltcGFjdCBvbiAidGhyZWFkIG1vZGUiICh0aHJlYWRzIGJlaW5nIHRoZSB1bml0IG9m
IHNjaGVkdWxpbmc7IGkuZS4sCj4gICAgIHRoZSBzdGF0dXMgcXVvKQo+ICAgICAKPiAgICAgV1JU
IHRoZSBzZWNvbmQgcG9pbnQsIGFwcGFyZW50bHkgWGVuU2VydmVyIGhhdmUgYmVlbiB0ZXN0aW5n
IHRoZSBzZXJpZXMKPiAgICAgcmVndWxhcmx5IGZvciBzb21lIHRpbWUsIGFuZCBhcmUgc2F0aXNm
aWVkIGZyb20gYSB0ZXN0aW5nIHBlcnNwZWN0aXZlCj4gICAgIHRoYXQgdGhlcmUgaXMgbm8gc2ln
bmlmaWNhbnQgZGVncmFkYXRpb24gZm9yIHRoZSBzZXJpZXMgd2hlbiBpbiAidGhyZWFkCj4gICAg
IG1vZGUiLgo+ICAgICAKPiAgICAgU28gdGhpcyB3b3VsZCByZWFsbHkgYmUgYSByZWNvbW1lbmRh
dGlvbiAvIGxpY2Vuc2UgdG8gdGhlIHZhcmlvdXMKPiAgICAgbWFpbnRhaW5lcnMgaW52b2x2ZWQ7
IHByaW1hcmlseSBEYXJpbywgSSB0aGluayAoc2luY2UgSSBwcm9iYWJseSB3b24ndAo+ICAgICBo
YXZlIHRpbWUgdG8gcmV2aWV3IHRoZSBzZXJpZXMpLgo+ICAgICAKPiAgICAgTm8gZGVjaXNpb25z
IGFyZSBvZmZpY2lhbCB1bnRpbCBkaXNjdXNzZWQgb24geGVuLWRldmVsOyBzbyB0aGUgZGVjaXNp
b24KPiAgICAgd2lsbCBub3QgYmUgY29uc2lkZXJlZCBvZmZpY2lhbCB1bnRpbCBhIGZldyBkYXlz
IGhhdmUgcGFzc2VkIHdpdGhvdXQKPiAgICAgb2JqZWN0aW9uLiAgQW5kIG9mIGNvdXJzZSwgaWYg
YW55b25lIGF0IHRoZSBtZWV0aW5nIGhhZCBhIGRpZmZlcmVudAo+ICAgICB1bmRlcnN0YW5kaW5n
IG9mIHdoYXQgd2FzIHNhaWQsIG9yIGhhcyBzb21ldGhpbmcgdG8gYWRkLCBwbGVhc2UgZG8gc28u
Cj4gICAgIAo+IEkgYmVsaWV2ZSB0aGUgZm9sbG93aW5nIHBlb3BsZSB3ZXJlIG9uIHRoZSBjb21t
dW5pdHkgY2FsbCBhbmQgZGlkIE5PVCBoYXZlIG9iamVjdGlvbnMgd2hlbiBhc2tlZAo+IFNlcmdl
eSwgSmFuLCBKdWVyZ2VuLCBBbmRyZXcsIEdlb3JnZSwgUm9nZXIsIENocmlzdG9waGVyIENsYXJr
LCBEYW5pZWwgUCBTbWl0aCwgUmljaCAobGlzdCBtYXkgYmUgaW5jb21wbGV0ZSkKCkkgaGF2ZSBu
byBvYmplY3Rpb24gd2l0aCB0aGlzIGdvaW5nIGluIG9uIHRoZSBhYm92ZSB0ZXJtcy4KClRoYW5r
cyBmb3Igd3JpdGluZyB0aGlzIGRvd24uCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
