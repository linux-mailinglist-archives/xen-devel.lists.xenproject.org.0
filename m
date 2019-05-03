Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10F1311B
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:25:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMa0h-0003Kr-2x; Fri, 03 May 2019 15:22:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XpsL=TD=citrix.com=prvs=019780e18=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMa0g-0003K7-1r
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:22:02 +0000
X-Inumbo-ID: 2b833ba6-6db7-11e9-84c4-1f477d01fb0b
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b833ba6-6db7-11e9-84c4-1f477d01fb0b;
 Fri, 03 May 2019 15:21:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="89634793"
Date: Fri, 3 May 2019 17:21:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190503152142.icdzlax4arik3beg@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/9] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjM6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGNsZWFudXAgSVBJIG1heSBnZXQgc2VudCBpbW1lZGlhdGVseSBiZWZvcmUgYSBD
UFUgZ2V0cyByZW1vdmVkIGZyb20KPiB0aGUgb25saW5lIG1hcC4gSW4gc3VjaCBhIGNhc2UgdGhl
IElQSSB3b3VsZCBnZXQgaGFuZGxlZCBvbiB0aGUgQ1BVCj4gYmVpbmcgb2ZmbGluZWQgbm8gZWFy
bGllciB0aGFuIGluIHRoZSBpbnRlcnJ1cHRzIGRpc2FibGVkIHdpbmRvdyBhZnRlcgo+IGZpeHVw
X2lycXMoKScgbWFpbiBsb29wLiBUaGlzIGlzIHRvbyBsYXRlLCBob3dldmVyLCBiZWNhdXNlIGEg
cG9zc2libGUKPiBhZmZpbml0eSBjaGFuZ2UgbWF5IGluY3VyIHRoZSBuZWVkIGZvciB2ZWN0b3Ig
YXNzaWdubWVudCwgd2hpY2ggd2lsbAo+IGZhaWwgd2hlbiB0aGUgSVJRJ3MgbW92ZSBjbGVhbnVw
IGNvdW50IGlzIHN0aWxsIG5vbi16ZXJvLgo+IAo+IFRvIGZpeCB0aGlzCj4gLSByZWNvcmQgdGhl
IHNldCBvZiBDUFVzIHRoZSBjbGVhbnVwIElQSXMgZ2V0cyBhY3R1YWxseSBzZW50IHRvIGFsb25n
c2lkZQo+ICAgc2V0dGluZyB0aGVpciBjb3VudCwKPiAtIGFkanVzdCB0aGUgY291bnQgaW4gZml4
dXBfaXJxcygpLCBhY2NvdW50aW5nIGZvciBhbGwgQ1BVcyB0aGF0IHRoZQo+ICAgY2xlYW51cCBJ
UEkgd2FzIHNlbnQgdG8sIGJ1dCB0aGF0IGFyZSBubyBsb25nZXIgb25saW5lLAo+IC0gYmFpbCBl
YXJseSBmcm9tIHRoZSBjbGVhbnVwIElQSSBoYW5kbGVyIHdoZW4gdGhlIENQVSBpcyBubyBsb25n
ZXIKPiAgIG9ubGluZSwgdG8gcHJldmVudCBkb3VibGUgYWNjb3VudGluZy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpKdXN0IGFzIGEgbm90ZSwgdGhp
cyB3aG9sZSBpbnRlcnJ1cHQgbWlncmF0aW9uIGJ1c2luZXNzIHNlZW1zCmV4dHJlbWVseSBjb21w
bGV4LCBhbmQgSSB3b25kZXIgaWYgWGVuIGRvZXMgcmVhbGx5IG5lZWQgaXQsIG9yIHdoYXQncwpl
eGFjdGx5IGl0J3MgcGVyZm9ybWFuY2UgZ2FpbiBjb21wYXJlZCB0byBtb3JlIHNpbXBsZSBzb2x1
dGlvbnMuIEkKdW5kZXJzdGFuZCB0aGlzIGlzIGp1c3QgZml4ZXMsIGJ1dCBJTU8gaXQncyBtYWtp
bmcgdGhlIGxvZ2ljIGV2ZW4gbW9yZQpjb21wbGV4LgoKTWF5YmUgaXQgd291bGQgYmUgc2ltcGxl
ciB0byBoYXZlIHRoZSBpbnRlcnJ1cHRzIGhhcmQtYm91bmQgdG8gcENQVXMKYW5kIGluc3RlYWQg
aGF2ZSBhIHNvZnQtYWZmaW5pdHkgb24gdGhlIGd1ZXN0IHZDUFVzIHRoYXQgYXJlIGFzc2lnbmVk
CmFzIHRoZSBkZXN0aW5hdGlvbj8KCj4gLS0tCj4gVEJEOiBUaGUgcHJvcGVyIHJlY29yZGluZyBv
ZiB0aGUgSVBJIGRlc3RpbmF0aW9ucyBhY3R1YWxseSBtYWtlcyB0aGUKPiAgICAgIG1vdmVfY2xl
YW51cF9jb3VudCBmaWVsZCByZWR1bmRhbnQuIERvIHdlIHdhbnQgdG8gZHJvcCBpdCwgYXQgdGhl
Cj4gICAgICBwcmljZSBvZiBhIGZldyBtb3JlIENQVS1tYXNrIG9wZXJhdGlvbnM/CgpBRkFJQ1Qg
dGhpcyBpcyBub3QgYSBob3QgcGF0aCwgc28gSSB3b3VsZCByZW1vdmUgdGhlCm1vdmVfY2xlYW51
cF9jb3VudCBmaWVsZCBhbmQganVzdCB3ZWlnaHQgdGhlIGNwdSBiaXRtYXAgd2hlbiBuZWVkZWQu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
