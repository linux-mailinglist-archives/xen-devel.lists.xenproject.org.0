Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13E2182C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 14:31:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRbz9-0006pn-DZ; Fri, 17 May 2019 12:29:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRbz6-0006pf-UQ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 12:29:12 +0000
X-Inumbo-ID: 5dfd5236-789f-11e9-ad83-07ccb2e9b8d2
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dfd5236-789f-11e9-ad83-07ccb2e9b8d2;
 Fri, 17 May 2019 12:29:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 06:29:08 -0600
Message-Id: <5CDEA912020000780023016F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 06:29:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CDEA72D020000780023015E@prv1-mh.provo.novell.com>
In-Reply-To: <5CDEA72D020000780023015E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 2/2] x86emul: support CPUID subleaves for
 vcpu_has_*()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEFWWDUxMl9CRjE2IGZlYXR1cmUgZmxhZyByZXNpZGVzIGluIGxlYWYgNyBzdWItbGVhZiAx
LiBFeHBhbmQKaW5mcmFzdHJ1Y3R1cmUgYWNjb3JkaW5nbHkgYmVmb3JlIGVuYWJsaW5nIHN1cHBv
cnQgZm9yIHRob3NlIGluc25zLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMK
KysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTE4NDUsNiAr
MTg0NSw3IEBAIGluX3Byb3Rtb2RlKAogCiBzdGF0aWMgYm9vbCB2Y3B1X2hhcygKICAgICB1bnNp
Z25lZCBpbnQgZWF4LAorICAgIHVuc2lnbmVkIGludCBlY3gsCiAgICAgdW5zaWduZWQgaW50IHJl
ZywKICAgICB1bnNpZ25lZCBpbnQgYml0LAogICAgIHN0cnVjdCB4ODZfZW11bGF0ZV9jdHh0ICpj
dHh0LApAQCAtMTg1NCw3ICsxODU1LDcgQEAgc3RhdGljIGJvb2wgdmNwdV9oYXMoCiAgICAgaW50
IHJjID0gWDg2RU1VTF9PS0FZOwogCiAgICAgZmFpbF9pZighb3BzLT5jcHVpZCk7Ci0gICAgcmMg
PSBvcHMtPmNwdWlkKGVheCwgMCwgJnJlcywgY3R4dCk7CisgICAgcmMgPSBvcHMtPmNwdWlkKGVh
eCwgZWN4LCAmcmVzLCBjdHh0KTsKICAgICBpZiAoIHJjID09IFg4NkVNVUxfT0tBWSApCiAgICAg
ewogICAgICAgICBzd2l0Y2ggKCByZWcgKQpAQCAtMTg3Myw3NiArMTg3NCw3OCBAQCBzdGF0aWMg
Ym9vbCB2Y3B1X2hhcygKICAgICByZXR1cm4gcmMgPT0gWDg2RU1VTF9PS0FZOwogfQogCi0jZGVm
aW5lIHZjcHVfaGFzX2ZwdSgpICAgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgRURYLCAgMCwg
Y3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19zZXAoKSAgICAgICAgIHZjcHVfaGFzKCAgICAg
ICAgIDEsIEVEWCwgMTEsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfY3g4KCkgICAgICAg
ICB2Y3B1X2hhcyggICAgICAgICAxLCBFRFgsICA4LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVf
aGFzX2Ntb3YoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgRURYLCAxNSwgY3R4dCwgb3Bz
KQotI2RlZmluZSB2Y3B1X2hhc19jbGZsdXNoKCkgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIEVE
WCwgMTksIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfbW14KCkgICAgICAgICB2Y3B1X2hh
cyggICAgICAgICAxLCBFRFgsIDIzLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX3NzZSgp
ICAgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgRURYLCAyNSwgY3R4dCwgb3BzKQotI2RlZmlu
ZSB2Y3B1X2hhc19zc2UyKCkgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIEVEWCwgMjYsIGN0
eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfc3NlMygpICAgICAgICB2Y3B1X2hhcyggICAgICAg
ICAxLCBFQ1gsICAwLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX3BjbG11bHFkcSgpICAg
dmNwdV9oYXMoICAgICAgICAgMSwgRUNYLCAgMSwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hh
c19zc3NlMygpICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIEVDWCwgIDksIGN0eHQsIG9wcykK
LSNkZWZpbmUgdmNwdV9oYXNfZm1hKCkgICAgICAgICB2Y3B1X2hhcyggICAgICAgICAxLCBFQ1gs
IDEyLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2N4MTYoKSAgICAgICAgdmNwdV9oYXMo
ICAgICAgICAgMSwgRUNYLCAxMywgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19zc2U0XzEo
KSAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIEVDWCwgMTksIGN0eHQsIG9wcykKLSNkZWZpbmUg
dmNwdV9oYXNfc3NlNF8yKCkgICAgICB2Y3B1X2hhcyggICAgICAgICAxLCBFQ1gsIDIwLCBjdHh0
LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX21vdmJlKCkgICAgICAgdmNwdV9oYXMoICAgICAgICAg
MSwgRUNYLCAyMiwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19wb3BjbnQoKSAgICAgIHZj
cHVfaGFzKCAgICAgICAgIDEsIEVDWCwgMjMsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNf
YWVzbmkoKSAgICAgICB2Y3B1X2hhcyggICAgICAgICAxLCBFQ1gsIDI1LCBjdHh0LCBvcHMpCi0j
ZGVmaW5lIHZjcHVfaGFzX2F2eCgpICAgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgRUNYLCAy
OCwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19mMTZjKCkgICAgICAgIHZjcHVfaGFzKCAg
ICAgICAgIDEsIEVDWCwgMjksIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfcmRyYW5kKCkg
ICAgICB2Y3B1X2hhcyggICAgICAgICAxLCBFQ1gsIDMwLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZj
cHVfaGFzX21teGV4dCgpICAgICAodmNwdV9oYXMoMHg4MDAwMDAwMSwgRURYLCAyMiwgY3R4dCwg
b3BzKSB8fCBcCisjZGVmaW5lIE5BIDAKKworI2RlZmluZSB2Y3B1X2hhc19mcHUoKSAgICAgICAg
IHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFRFgsICAwLCBjdHh0LCBvcHMpCisjZGVmaW5lIHZj
cHVfaGFzX3NlcCgpICAgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgTkEsIEVEWCwgMTEsIGN0
eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfY3g4KCkgICAgICAgICB2Y3B1X2hhcyggICAgICAg
ICAxLCBOQSwgRURYLCAgOCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19jbW92KCkgICAg
ICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFRFgsIDE1LCBjdHh0LCBvcHMpCisjZGVmaW5l
IHZjcHVfaGFzX2NsZmx1c2goKSAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgTkEsIEVEWCwgMTks
IGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfbW14KCkgICAgICAgICB2Y3B1X2hhcyggICAg
ICAgICAxLCBOQSwgRURYLCAyMywgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19zc2UoKSAg
ICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFRFgsIDI1LCBjdHh0LCBvcHMpCisjZGVm
aW5lIHZjcHVfaGFzX3NzZTIoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgTkEsIEVEWCwg
MjYsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfc3NlMygpICAgICAgICB2Y3B1X2hhcygg
ICAgICAgICAxLCBOQSwgRUNYLCAgMCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19wY2xt
dWxxZHEoKSAgIHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFQ1gsICAxLCBjdHh0LCBvcHMpCisj
ZGVmaW5lIHZjcHVfaGFzX3Nzc2UzKCkgICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgTkEsIEVD
WCwgIDksIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfZm1hKCkgICAgICAgICB2Y3B1X2hh
cyggICAgICAgICAxLCBOQSwgRUNYLCAxMiwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19j
eDE2KCkgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFQ1gsIDEzLCBjdHh0LCBvcHMp
CisjZGVmaW5lIHZjcHVfaGFzX3NzZTRfMSgpICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwgTkEs
IEVDWCwgMTksIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfc3NlNF8yKCkgICAgICB2Y3B1
X2hhcyggICAgICAgICAxLCBOQSwgRUNYLCAyMCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hh
c19tb3ZiZSgpICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFQ1gsIDIyLCBjdHh0LCBv
cHMpCisjZGVmaW5lIHZjcHVfaGFzX3BvcGNudCgpICAgICAgdmNwdV9oYXMoICAgICAgICAgMSwg
TkEsIEVDWCwgMjMsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYWVzbmkoKSAgICAgICB2
Y3B1X2hhcyggICAgICAgICAxLCBOQSwgRUNYLCAyNSwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1
X2hhc19hdngoKSAgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDEsIE5BLCBFQ1gsIDI4LCBjdHh0
LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX2YxNmMoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAg
MSwgTkEsIEVDWCwgMjksIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfcmRyYW5kKCkgICAg
ICB2Y3B1X2hhcyggICAgICAgICAxLCBOQSwgRUNYLCAzMCwgY3R4dCwgb3BzKQorI2RlZmluZSB2
Y3B1X2hhc19tbXhleHQoKSAgICAgKHZjcHVfaGFzKDB4ODAwMDAwMDEsIE5BLCBFRFgsIDIyLCBj
dHh0LCBvcHMpIHx8IFwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2Y3B1X2hhc19z
c2UoKSkKLSNkZWZpbmUgdmNwdV9oYXNfM2Rub3dfZXh0KCkgICB2Y3B1X2hhcygweDgwMDAwMDAx
LCBFRFgsIDMwLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzXzNkbm93KCkgICAgICAgdmNw
dV9oYXMoMHg4MDAwMDAwMSwgRURYLCAzMSwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19s
YWhmX2xtKCkgICAgIHZjcHVfaGFzKDB4ODAwMDAwMDEsIEVDWCwgIDAsIGN0eHQsIG9wcykKLSNk
ZWZpbmUgdmNwdV9oYXNfY3I4X2xlZ2FjeSgpICB2Y3B1X2hhcygweDgwMDAwMDAxLCBFQ1gsICA0
LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2x6Y250KCkgICAgICAgdmNwdV9oYXMoMHg4
MDAwMDAwMSwgRUNYLCAgNSwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19zc2U0YSgpICAg
ICAgIHZjcHVfaGFzKDB4ODAwMDAwMDEsIEVDWCwgIDYsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNw
dV9oYXNfbWlzYWxpZ25zc2UoKSB2Y3B1X2hhcygweDgwMDAwMDAxLCBFQ1gsICA3LCBjdHh0LCBv
cHMpCi0jZGVmaW5lIHZjcHVfaGFzX3hvcCgpICAgICAgICAgdmNwdV9oYXMoMHg4MDAwMDAwMSwg
RUNYLCAxMiwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19mbWE0KCkgICAgICAgIHZjcHVf
aGFzKDB4ODAwMDAwMDEsIEVDWCwgMTYsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfdGJt
KCkgICAgICAgICB2Y3B1X2hhcygweDgwMDAwMDAxLCBFQ1gsIDIxLCBjdHh0LCBvcHMpCi0jZGVm
aW5lIHZjcHVfaGFzX21vbml0b3J4KCkgICAgdmNwdV9oYXMoMHg4MDAwMDAwMSwgRUNYLCAyOSwg
Y3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19ibWkxKCkgICAgICAgIHZjcHVfaGFzKCAgICAg
ICAgIDcsIEVCWCwgIDMsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfaGxlKCkgICAgICAg
ICB2Y3B1X2hhcyggICAgICAgICA3LCBFQlgsICA0LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVf
aGFzX2F2eDIoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywgRUJYLCAgNSwgY3R4dCwgb3Bz
KQotI2RlZmluZSB2Y3B1X2hhc19ibWkyKCkgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVC
WCwgIDgsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfaW52cGNpZCgpICAgICB2Y3B1X2hh
cyggICAgICAgICA3LCBFQlgsIDEwLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX3J0bSgp
ICAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywgRUJYLCAxMSwgY3R4dCwgb3BzKQotI2RlZmlu
ZSB2Y3B1X2hhc19tcHgoKSAgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVCWCwgMTQsIGN0
eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyZigpICAgICB2Y3B1X2hhcyggICAgICAg
ICA3LCBFQlgsIDE2LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2F2eDUxMmRxKCkgICAg
dmNwdV9oYXMoICAgICAgICAgNywgRUJYLCAxNywgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hh
c19yZHNlZWQoKSAgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVCWCwgMTgsIGN0eHQsIG9wcykK
LSNkZWZpbmUgdmNwdV9oYXNfYWR4KCkgICAgICAgICB2Y3B1X2hhcyggICAgICAgICA3LCBFQlgs
IDE5LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX3NtYXAoKSAgICAgICAgdmNwdV9oYXMo
ICAgICAgICAgNywgRUJYLCAyMCwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19hdng1MTJf
aWZtYSgpIHZjcHVfaGFzKCAgICAgICAgIDcsIEVCWCwgMjEsIGN0eHQsIG9wcykKLSNkZWZpbmUg
dmNwdV9oYXNfY2xmbHVzaG9wdCgpICB2Y3B1X2hhcyggICAgICAgICA3LCBFQlgsIDIzLCBjdHh0
LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2Nsd2IoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAg
NywgRUJYLCAyNCwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19hdng1MTJwZigpICAgIHZj
cHVfaGFzKCAgICAgICAgIDcsIEVCWCwgMjYsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNf
YXZ4NTEyZXIoKSAgICB2Y3B1X2hhcyggICAgICAgICA3LCBFQlgsIDI3LCBjdHh0LCBvcHMpCi0j
ZGVmaW5lIHZjcHVfaGFzX2F2eDUxMmNkKCkgICAgdmNwdV9oYXMoICAgICAgICAgNywgRUJYLCAy
OCwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19zaGEoKSAgICAgICAgIHZjcHVfaGFzKCAg
ICAgICAgIDcsIEVCWCwgMjksIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyYnco
KSAgICB2Y3B1X2hhcyggICAgICAgICA3LCBFQlgsIDMwLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZj
cHVfaGFzX2F2eDUxMnZsKCkgICAgdmNwdV9oYXMoICAgICAgICAgNywgRUJYLCAzMSwgY3R4dCwg
b3BzKQotI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfdmJtaSgpIHZjcHVfaGFzKCAgICAgICAgIDcs
IEVDWCwgIDEsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyX3ZibWkyKCkgdmNw
dV9oYXMoICAgICAgICA3LCBFQ1gsICA2LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2dm
bmkoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywgRUNYLCAgOCwgY3R4dCwgb3BzKQotI2Rl
ZmluZSB2Y3B1X2hhc192YWVzKCkgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVDWCwgIDks
IGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9oYXNfdnBjbG11bHFkcSgpICB2Y3B1X2hhcyggICAg
ICAgICA3LCBFQ1gsIDEwLCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl92bm5p
KCkgdmNwdV9oYXMoICAgICAgICAgNywgRUNYLCAxMSwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1
X2hhc19hdng1MTJfYml0YWxnKCkgdmNwdV9oYXMoICAgICAgIDcsIEVDWCwgMTIsIGN0eHQsIG9w
cykKLSNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyX3Zwb3BjbnRkcSgpIHZjcHVfaGFzKCAgICA3LCBF
Q1gsIDE0LCBjdHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX3JkcGlkKCkgICAgICAgdmNwdV9o
YXMoICAgICAgICAgNywgRUNYLCAyMiwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19tb3Zk
aXJpKCkgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsIEVDWCwgMjcsIGN0eHQsIG9wcykKLSNkZWZp
bmUgdmNwdV9oYXNfbW92ZGlyNjRiKCkgICB2Y3B1X2hhcyggICAgICAgICA3LCBFQ1gsIDI4LCBj
dHh0LCBvcHMpCi0jZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl80dm5uaXcoKSB2Y3B1X2hhcyggICAg
ICAgNywgRURYLCAgMiwgY3R4dCwgb3BzKQotI2RlZmluZSB2Y3B1X2hhc19hdng1MTJfNGZtYXBz
KCkgdmNwdV9oYXMoICAgICAgIDcsIEVEWCwgIDMsIGN0eHQsIG9wcykKLSNkZWZpbmUgdmNwdV9o
YXNfY2x6ZXJvKCkgICAgICB2Y3B1X2hhcygweDgwMDAwMDA4LCBFQlgsICAwLCBjdHh0LCBvcHMp
Ci0jZGVmaW5lIHZjcHVfaGFzX3dibm9pbnZkKCkgICAgdmNwdV9oYXMoMHg4MDAwMDAwOCwgRUJY
LCAgOSwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc18zZG5vd19leHQoKSAgIHZjcHVfaGFz
KDB4ODAwMDAwMDEsIE5BLCBFRFgsIDMwLCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzXzNk
bm93KCkgICAgICAgdmNwdV9oYXMoMHg4MDAwMDAwMSwgTkEsIEVEWCwgMzEsIGN0eHQsIG9wcykK
KyNkZWZpbmUgdmNwdV9oYXNfbGFoZl9sbSgpICAgICB2Y3B1X2hhcygweDgwMDAwMDAxLCBOQSwg
RUNYLCAgMCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19jcjhfbGVnYWN5KCkgIHZjcHVf
aGFzKDB4ODAwMDAwMDEsIE5BLCBFQ1gsICA0LCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFz
X2x6Y250KCkgICAgICAgdmNwdV9oYXMoMHg4MDAwMDAwMSwgTkEsIEVDWCwgIDUsIGN0eHQsIG9w
cykKKyNkZWZpbmUgdmNwdV9oYXNfc3NlNGEoKSAgICAgICB2Y3B1X2hhcygweDgwMDAwMDAxLCBO
QSwgRUNYLCAgNiwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19taXNhbGlnbnNzZSgpIHZj
cHVfaGFzKDB4ODAwMDAwMDEsIE5BLCBFQ1gsICA3LCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVf
aGFzX3hvcCgpICAgICAgICAgdmNwdV9oYXMoMHg4MDAwMDAwMSwgTkEsIEVDWCwgMTIsIGN0eHQs
IG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfZm1hNCgpICAgICAgICB2Y3B1X2hhcygweDgwMDAwMDAx
LCBOQSwgRUNYLCAxNiwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc190Ym0oKSAgICAgICAg
IHZjcHVfaGFzKDB4ODAwMDAwMDEsIE5BLCBFQ1gsIDIxLCBjdHh0LCBvcHMpCisjZGVmaW5lIHZj
cHVfaGFzX21vbml0b3J4KCkgICAgdmNwdV9oYXMoMHg4MDAwMDAwMSwgTkEsIEVDWCwgMjksIGN0
eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYm1pMSgpICAgICAgICB2Y3B1X2hhcyggICAgICAg
ICA3LCAgMCwgRUJYLCAgMywgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19obGUoKSAgICAg
ICAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsICA0LCBjdHh0LCBvcHMpCisjZGVmaW5l
IHZjcHVfaGFzX2F2eDIoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywgIDAsIEVCWCwgIDUs
IGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYm1pMigpICAgICAgICB2Y3B1X2hhcyggICAg
ICAgICA3LCAgMCwgRUJYLCAgOCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19pbnZwY2lk
KCkgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsIDEwLCBjdHh0LCBvcHMpCisjZGVm
aW5lIHZjcHVfaGFzX3J0bSgpICAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywgIDAsIEVCWCwg
MTEsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfbXB4KCkgICAgICAgICB2Y3B1X2hhcygg
ICAgICAgICA3LCAgMCwgRUJYLCAxNCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19hdng1
MTJmKCkgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsIDE2LCBjdHh0LCBvcHMpCisj
ZGVmaW5lIHZjcHVfaGFzX2F2eDUxMmRxKCkgICAgdmNwdV9oYXMoICAgICAgICAgNywgIDAsIEVC
WCwgMTcsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfcmRzZWVkKCkgICAgICB2Y3B1X2hh
cyggICAgICAgICA3LCAgMCwgRUJYLCAxOCwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hhc19h
ZHgoKSAgICAgICAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsIDE5LCBjdHh0LCBvcHMp
CisjZGVmaW5lIHZjcHVfaGFzX3NtYXAoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywgIDAs
IEVCWCwgMjAsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyX2lmbWEoKSB2Y3B1
X2hhcyggICAgICAgICA3LCAgMCwgRUJYLCAyMSwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1X2hh
c19jbGZsdXNob3B0KCkgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsIDIzLCBjdHh0LCBv
cHMpCisjZGVmaW5lIHZjcHVfaGFzX2Nsd2IoKSAgICAgICAgdmNwdV9oYXMoICAgICAgICAgNywg
IDAsIEVCWCwgMjQsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEycGYoKSAgICB2
Y3B1X2hhcyggICAgICAgICA3LCAgMCwgRUJYLCAyNiwgY3R4dCwgb3BzKQorI2RlZmluZSB2Y3B1
X2hhc19hdng1MTJlcigpICAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsIDI3LCBjdHh0
LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMmNkKCkgICAgdmNwdV9oYXMoICAgICAgICAg
NywgIDAsIEVCWCwgMjgsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfc2hhKCkgICAgICAg
ICB2Y3B1X2hhcyggICAgICAgICA3LCAgMCwgRUJYLCAyOSwgY3R4dCwgb3BzKQorI2RlZmluZSB2
Y3B1X2hhc19hdng1MTJidygpICAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQlgsIDMwLCBj
dHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMnZsKCkgICAgdmNwdV9oYXMoICAgICAg
ICAgNywgIDAsIEVCWCwgMzEsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYXZ4NTEyX3Zi
bWkoKSB2Y3B1X2hhcyggICAgICAgICA3LCAgMCwgRUNYLCAgMSwgY3R4dCwgb3BzKQorI2RlZmlu
ZSB2Y3B1X2hhc19hdng1MTJfdmJtaTIoKSB2Y3B1X2hhcyggICAgICAgIDcsICAwLCBFQ1gsICA2
LCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX2dmbmkoKSAgICAgICAgdmNwdV9oYXMoICAg
ICAgICAgNywgIDAsIEVDWCwgIDgsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfdmFlcygp
ICAgICAgICB2Y3B1X2hhcyggICAgICAgICA3LCAgMCwgRUNYLCAgOSwgY3R4dCwgb3BzKQorI2Rl
ZmluZSB2Y3B1X2hhc192cGNsbXVscWRxKCkgIHZjcHVfaGFzKCAgICAgICAgIDcsICAwLCBFQ1gs
IDEwLCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl92bm5pKCkgdmNwdV9oYXMo
ICAgICAgICAgNywgIDAsIEVDWCwgMTEsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNfYXZ4
NTEyX2JpdGFsZygpIHZjcHVfaGFzKCAgICAgICA3LCAgMCwgRUNYLCAxMiwgY3R4dCwgb3BzKQor
I2RlZmluZSB2Y3B1X2hhc19hdng1MTJfdnBvcGNudGRxKCkgdmNwdV9oYXMoICAgIDcsICAwLCBF
Q1gsIDE0LCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX3JkcGlkKCkgICAgICAgdmNwdV9o
YXMoICAgICAgICAgNywgIDAsIEVDWCwgMjIsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9oYXNf
bW92ZGlyaSgpICAgICB2Y3B1X2hhcyggICAgICAgICA3LCAgMCwgRUNYLCAyNywgY3R4dCwgb3Bz
KQorI2RlZmluZSB2Y3B1X2hhc19tb3ZkaXI2NGIoKSAgIHZjcHVfaGFzKCAgICAgICAgIDcsICAw
LCBFQ1gsIDI4LCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX2F2eDUxMl80dm5uaXcoKSB2
Y3B1X2hhcyggICAgICAgNywgIDAsIEVEWCwgIDIsIGN0eHQsIG9wcykKKyNkZWZpbmUgdmNwdV9o
YXNfYXZ4NTEyXzRmbWFwcygpIHZjcHVfaGFzKCAgICAgICA3LCAgMCwgRURYLCAgMywgY3R4dCwg
b3BzKQorI2RlZmluZSB2Y3B1X2hhc19jbHplcm8oKSAgICAgIHZjcHVfaGFzKDB4ODAwMDAwMDgs
IE5BLCBFQlgsICAwLCBjdHh0LCBvcHMpCisjZGVmaW5lIHZjcHVfaGFzX3dibm9pbnZkKCkgICAg
dmNwdV9oYXMoMHg4MDAwMDAwOCwgTkEsIEVCWCwgIDksIGN0eHQsIG9wcykKIAogI2RlZmluZSB2
Y3B1X211c3RfaGF2ZShmZWF0KSBcCiAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCF2Y3B1X2hh
c18jI2ZlYXQoKSwgRVhDX1VEKQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
