Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AE23135
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfN9-000852-AR; Mon, 20 May 2019 10:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfN7-00084l-Nq
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:18:21 +0000
X-Inumbo-ID: 9621b350-7ae8-11e9-a659-039fc2ce5bac
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9621b350-7ae8-11e9-a659-039fc2ce5bac;
 Mon, 20 May 2019 10:18:18 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: AGfejWn/EUGs4O8uUIPMt7VfhVcFNncIj+L313f8AGgS9Jud2KEhszvkjinmSHehseb5zeNKLc
 V9oGp/Ejry6SlA+PGoihexxcWE3OeppSGpCOOpUvfGNlEqNxA4bhsnxY+j9DYrWu9sUJzzKB3G
 Rp8QVbCCiZFHw6GicqAePDu0E6UHTN3ybRT4zP9ZbT7Yz4LydozZZ8dEDrAw7VfePu21p6qnGP
 0KYWOiSe8Hd0Hq5f7Vx9Moemtqc7XlJ1Sqsl6dCl/iDOHCpQbgG/mK4xYSts/gex2ldyhKXFYo
 7hM=
X-SBRS: 2.7
X-MesageID: 629045
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="629045"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 11:18:11 +0100
Message-ID: <1558347494-21640-2-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] x86/pv: Fix error handling in
 dom0_construct_pv()
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

T25lIHBhdGggaW4gZG9tMF9jb25zdHJ1Y3RfcHYoKSByZXR1cm5zIC0xIHVubGlrZSBhbGwgb3Ro
ZXIgZXJyb3IgcGF0aHMuClN3aXRjaCBpdCB0byByZXR1cm5pbmcgLUVJTlZBTC4KClRoaXMgd2Fz
IGxhc3QgbW9kaWZpZWQgYnkgYy9zIGM4NDQ4MWZiIFhTQS01NSwgYnV0IHRoZSBidWcgcHJlZGF0
ZXMgdGhhdApzZXJpZXMuICBIb3dldmVyLCB0aGlzIHBhdGNoIGRpZCAoZm9yIG5vIG9idmlvdXMg
cmVhc29uKSBpbnRyb2R1Y2UgYQpiaWZ1cmNhdGVkIHRhaWwgdG8gdGhlIGZ1bmN0aW9uIHdpdGgg
dHdvIHN1YnRseSBkaWZmZXJlbnQgZWxmX2NoZWNrX2Jyb2tlbigpCmNsYXVzZXMuCgpBcyB0aGUg
ZWxmX2NoZWNrX2Jyb2tlbigpIGlzIGp1c3QgYSB3YXJuaW5nIGFuZCBkb2Vzbid0IGluZmx1ZW5j
ZSB0aGUgZnVydGhlcgpib290LCBmb2xkIHRoZSBleGl0IHBhdGhzIHRvZ2V0aGVyIGFuZCB1c2Ug
YSBzaW5nbGUgY2xhdXNlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyB8
IDEwICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9h
cmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggY2VmMmQ0Mi4uMDY0YTEwZSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYvZG9t
MF9idWlsZC5jCkBAIC03MzUsNyArNzM1LDcgQEAgaW50IF9faW5pdCBkb20wX2NvbnN0cnVjdF9w
dihzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgbWFwY2FjaGVfb3ZlcnJpZGVfY3VycmVu
dChOVUxMKTsKICAgICAgICAgICAgIHN3aXRjaF9jcjNfY3I0KGN1cnJlbnQtPmFyY2guY3IzLCBy
ZWFkX2NyNCgpKTsKICAgICAgICAgICAgIHByaW50aygiSW52YWxpZCBIWVBFUkNBTExfUEFHRSBm
aWVsZCBpbiBFTEYgbm90ZXMuXG4iKTsKLSAgICAgICAgICAgIHJjID0gLTE7CisgICAgICAgICAg
ICByYyA9IC1FSU5WQUw7CiAgICAgICAgICAgICBnb3RvIG91dDsKICAgICAgICAgfQogICAgICAg
ICBoeXBlcmNhbGxfcGFnZV9pbml0aWFsaXNlKApAQCAtOTAzLDIxICs5MDMsMTUgQEAgaW50IF9f
aW5pdCBkb20wX2NvbnN0cnVjdF9wdihzdHJ1Y3QgZG9tYWluICpkLAogICAgIHJjID0gZG9tMF9z
ZXR1cF9wZXJtaXNzaW9ucyhkKTsKICAgICBCVUdfT04ocmMgIT0gMCk7CiAKLSAgICBpZiAoIGVs
Zl9jaGVja19icm9rZW4oJmVsZikgKQotICAgICAgICBwcmludGsoIiBYZW4gd2FybmluZzogZG9t
MCBrZXJuZWwgYnJva2VuIEVMRjogJXNcbiIsCi0gICAgICAgICAgICAgICBlbGZfY2hlY2tfYnJv
a2VuKCZlbGYpKTsKLQogICAgIGlmICggZC0+ZG9tYWluX2lkID09IGhhcmR3YXJlX2RvbWlkICkK
ICAgICAgICAgaW9tbXVfaHdkb21faW5pdChkKTsKIAogICAgIHYtPmlzX2luaXRpYWxpc2VkID0g
MTsKICAgICBjbGVhcl9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpOwogCi0gICAgcmV0
dXJuIDA7Ci0KIG91dDoKICAgICBpZiAoIGVsZl9jaGVja19icm9rZW4oJmVsZikgKQotICAgICAg
ICBwcmludGsoIiBYZW4gZG9tMCBrZXJuZWwgYnJva2VuIEVMRjogJXNcbiIsCisgICAgICAgIHBy
aW50ayhYRU5MT0dfV0FSTklORyAiRG9tMCBrZXJuZWwgYnJva2VuIEVMRjogJXNcbiIsCiAgICAg
ICAgICAgICAgICBlbGZfY2hlY2tfYnJva2VuKCZlbGYpKTsKIAogICAgIHJldHVybiByYzsKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
