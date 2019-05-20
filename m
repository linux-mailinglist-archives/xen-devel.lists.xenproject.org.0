Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6D23136
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:21:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfN8-00084q-Mu; Mon, 20 May 2019 10:18:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfN6-00084S-Ps
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:18:20 +0000
X-Inumbo-ID: 96d40ae5-7ae8-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 96d40ae5-7ae8-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 10:18:19 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: Qaq2mWysxf/SSS8UIpPHCAjxk7c2SN61H34G49UFI4fZOrg4ryl8X9dkRX6BbsDnWYItn2LAkr
 9Jg56tvrcGPwUpMsh2OieD7JCvzrHi/lTZOSeq5FRIhb5S1FVjcn+FRv7Cw3jBnwKTJMc8USth
 /7kuxmhyw4PLD3uCfdEeBvAS/3YtqknFo1rx6e023qbGNtSpDojEJSpxWai4vu8bmEHAkBJfTz
 SRiXgAkjopPdENTvIbYnOa2F/C3Qi4BtI5f4OI1JlZy03nyeicUsYR6U+v+01nQuGg+BT18x1B
 NDk=
X-SBRS: 2.7
X-MesageID: 641030
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="641030"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 11:18:13 +0100
Message-ID: <1558347494-21640-4-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] x86/boot: Wire up dom0=shadow for PV dom0
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3b3VsZCBoYXZlIGJlZW4gdmVyeSBoYW5keSB3aGVuIGRlYnVnZ2luZyBzb21lIHB2LWwx
dGYgaXNzdWVzLiAgQXMgdGhlcmUKaXMgbm8gY29zdCB0byBzdXBwb3J0aW5nIGl0LCB3aXJlIGl0
IHVwLgoKRHVlIHRvIHRoZSB3YXkgZG9tMCBpcyBjb25zdHJ1Y3RlZCwgc3dpdGNoaW5nIGludG8g
c2hhZG93IG1vZGUgbXVzdCBiZSBkb25lCmFmdGVyIHRoZSBwYWdldGFibGVzIGFyZSB3cml0dGVu
LCBhbmQgYmVjYXVzZSBvZiBwYXJ0aWFsbHkgYmVpbmcgaW4gZG9tMApjb250ZXh0LCBzaGFkb3df
ZW5hYmxlKCkgZG9lc24ndCBsaWtlIHRoZSBzdGF0ZSBpdCBmaW5kcy4KClJldXNlIHRoZSBwdl9s
MXRmIHRhc2tsZXQgZm9yIGNvbnZlbmllbmNlLCB3aGljaCB3aWxsIHN3aXRjaCBkb20wIGludG8g
c2hhZG93Cm1vZGUganVzdCBiZWZvcmUgaXQgc3RhcnRzIGV4ZWN1dGluZy4KClNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIGRv
Y3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDE0ICsrKysrKysrKy0tLS0tCiB4ZW4v
YXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAgfCAgOCAtLS0tLS0tLQogeGVuL2FyY2gveDg2
L3B2L2RvbTBfYnVpbGQuYyAgICAgIHwgIDkgKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94
ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRv
YwppbmRleCAxZmMxODAyLi5lNmQyNDFlIDEwMDY0NAotLS0gYS9kb2NzL21pc2MveGVuLWNvbW1h
bmQtbGluZS5wYW5kb2MKKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCkBA
IC02NzUsMTIgKzY3NSwxNiBAQCBDb250cm9scyBmb3IgaG93IGRvbTAgaXMgY29uc3RydWN0ZWQg
b24geDg2IHN5c3RlbXMuCiAgICAgICAgIHNlbGVjdGVkIG1vZGUuCiAgICAgKiAgIEZvciBhIFBW
SCBkb20wLCB0aGUgaGFyZHdhcmUgbXVzdCBoYXZlIFZULXgvU1ZNIGV4dGVuc2lvbnMgYXZhaWxh
YmxlLgogCi0qICAgVGhlIGBzaGFkb3dgIGJvb2xlYW4gaXMgb25seSBhcHBsaWNhYmxlIHdoZW4g
ZG9tMCBpcyBjb25zdHJ1Y3RlZCBhcyBhIFBWSAotICAgIGd1ZXN0LCBhbmQgY29udHJvbHMgd2hl
dGhlciBkb20wIHVzZXMgaGFyZHdhcmUgYXNzaXN0ZWQgcGFnaW5nLCBvciBzaGFkb3cKLSAgICBw
YWdpbmcuICBUaGUgZGVmYXVsdCBpcyBIQVAgd2hlbiBhdmFpbGFibGUsIGFuZCBzaGFkb3cgb3Ro
ZXJ3aXNlLgorKiAgIFRoZSBgc2hhZG93YCBib29sZWFuIGFsbG93cyBkb20wIHRvIGJlIGV4cGxp
Y2l0bHkgY29uc3RydWN0ZWQgdXNpbmcgc2hhZG93CisgICAgcGFnaW5nLiAgVGhpcyBvcHRpb24g
aXMgdW5hdmFpbGFibGUgd2hlbiBgQ09ORklHX1NIQURPV19QQUdJTkdgIGlzCisgICAgZGlzYWJs
ZWQuCiAKLSAgICBUaGlzIG9wdGlvbiBpcyB1bmF2YWlsYWJsZSB3aGVuIGBDT05GSUdfU0hBRE9X
X1BBR0lOR2AgaXMgZGlzYWJsZWQuICBTdWNoCi0gICAgYnVpbGRzIG9mIFhlbiByZXF1aXJlIEhB
UC1jYXBhYmxlIGhhcmR3YXJlIHRvIHVzZSBhIFBWSCBkb20wLgorICAgIEZvciBQVkgsIGRvbTAg
ZGVmYXVsdHMgdG8gdXNpbmcgSEFQIG9uIGNhcGFibGUgaGFyZHdhcmUsIGFuZCBmYWxscyBiYWNr
IHRvCisgICAgc2hhZG93IHBhZ2luZyBvdGhlcndpc2UuICBBIFBWSCBkb20wIGNhbm5vdCBiZSB1
c2VkIGlmIFhlbiBpcyBjb21waWxlZAorICAgIHdpdGhvdXQgcGFnaW5nIHN1cHBvcnQsIGFuZCB0
aGUgaGFyZHdhcmUgbGFja3MgSEFQIHN1cHBvcnQuCisKKyAgICBGb3IgUFYsIHRoZSB1c2Ugb2Yg
ZG9tMCBzaGFkb3cgbW9kZSBpcyBvbmx5IGZvciBkZXZlbG9wbWVudCBwdXJwb3Nlcy4gIFBWCisg
ICAgZ3Vlc3RzIGRvIG5vIHJlcXVpcmUgYW55IHBhZ2luZyBzdXBwb3J0IGJ5IGRlZmF1bHQuCiAK
ICogICBUaGUgYHZlcmJvc2VgIGJvb2xlYW4gaXMgaW50ZW5kZWQgZm9yIGRpYWdub3N0aWNzLCBh
bmQgcHJpbnRzIG91dCBleHRyYQogICAgIGluZm9ybWF0aW9uIGR1cmluZyB0aGUgZG9tMCBidWls
ZC4gIEl0IGRlZmF1bHRzIHRvIGZhbHNlLgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbTBf
YnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKaW5kZXggMjczMTVkNS4uOTNlNTUz
MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94
ODYvZG9tMF9idWlsZC5jCkBAIC01ODgsMTQgKzU4OCw2IEBAIGludCBfX2luaXQgY29uc3RydWN0
X2RvbTAoc3RydWN0IGRvbWFpbiAqZCwgY29uc3QgbW9kdWxlX3QgKmltYWdlLAogCiAgICAgcHJv
Y2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7CiAKLSNpZmRlZiBDT05GSUdfU0hBRE9XX1BBR0lORwot
ICAgIGlmICggb3B0X2RvbTBfc2hhZG93ICYmICFkb20wX3B2aCApCi0gICAgewotICAgICAgICBv
cHRfZG9tMF9zaGFkb3cgPSBmYWxzZTsKLSAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICJT
aGFkb3cgRG9tMCByZXF1aXJlcyBQVkguIE9wdGlvbiBpZ25vcmVkLlxuIik7Ci0gICAgfQotI2Vu
ZGlmCi0KICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQogICAgICAgICByYyA9IGRvbTBfY29u
c3RydWN0X3B2aChkLCBpbWFnZSwgaW1hZ2VfaGVhZHJvb20sIGluaXRyZCwgY21kbGluZSk7CiAg
ICAgZWxzZSBpZiAoIGlzX3B2X2RvbWFpbihkKSApCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
cHYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwppbmRleCAwNjRh
MTBlLi40YTE1MjZhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKQEAgLTkwNiw2ICs5MDYsMTUgQEAgaW50
IF9faW5pdCBkb20wX2NvbnN0cnVjdF9wdihzdHJ1Y3QgZG9tYWluICpkLAogICAgIGlmICggZC0+
ZG9tYWluX2lkID09IGhhcmR3YXJlX2RvbWlkICkKICAgICAgICAgaW9tbXVfaHdkb21faW5pdChk
KTsKIAorICAgIC8qIEFjdGl2YXRlIHNoYWRvdyBtb2RlLCBpZiByZXF1ZXN0ZWQuICBSZXVzZSB0
aGUgcHZfbDF0ZiB0YXNrbGV0LiAqLworI2lmZGVmIENPTkZJR19TSEFET1dfUEFHSU5HCisgICAg
aWYgKCBvcHRfZG9tMF9zaGFkb3cgKQorICAgIHsKKyAgICAgICAgcHJpbnRrKCJTd2l0Y2hpbmcg
ZG9tMCB0byB1c2luZyBzaGFkb3cgcGFnaW5nXG4iKTsKKyAgICAgICAgdGFza2xldF9zY2hlZHVs
ZSgmZC0+YXJjaC5wYWdpbmcuc2hhZG93LnB2X2wxdGZfdGFza2xldCk7CisgICAgfQorI2VuZGlm
CisKICAgICB2LT5pc19pbml0aWFsaXNlZCA9IDE7CiAgICAgY2xlYXJfYml0KF9WUEZfZG93biwg
JnYtPnBhdXNlX2ZsYWdzKTsKIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
