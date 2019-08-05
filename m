Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D9819E5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 14:46:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hucKX-0000c9-R5; Mon, 05 Aug 2019 12:43:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hucKW-0000bs-Ir
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 12:43:12 +0000
X-Inumbo-ID: 95bc5cbc-b77e-11e9-a59d-033b08eeb3fc
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95bc5cbc-b77e-11e9-a59d-033b08eeb3fc;
 Mon, 05 Aug 2019 12:43:11 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SPjANT231gLeC0zLsrMZINjukTPdia3+ffk1aqdFLwe8lhgB3ZMtq4RkWs0OdIuFCjpSebFfnN
 jmuxqD3k4KvbLWQxuKGJvBx/EXwWvxqXF3ITHCshnLTiQahSt6SrJ2EWYH0AYf2Dky8YcPB5jf
 bwRqTatJNNuJN5AuwtG3A+dcTTtnK9w6MQMH09N8FgukaJok0zEmLVn0efhJg/bfACNPxwCNmH
 AWsBl3mScLdPKGuISngKMBjxSw3geRnc3vwL12qL9ZYAhn9p8Q6T466PNR1KTTeduWMCTd+Wb3
 XNg=
X-SBRS: 2.7
X-MesageID: 3859933
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,349,1559534400"; 
   d="scan'208";a="3859933"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 5 Aug 2019 13:42:59 +0100
Message-ID: <20190805124301.12887-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805124301.12887-1-andrew.cooper3@citrix.com>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/boot: Minor improvements to
 efi_arch_post_exit_boot()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3BsaXQgdXAgdGhlIGxvbmcgYXNtIGJsb2NrIGJ5IGNvbW1lbnRpbmcgdGhlIGxvZ2ljYWwgc3Vi
c2VjdGlvbnMuCgpUaGUgbW92YWJzIGZvciBvYnRhaW5pbmcgX19zdGFydF94ZW4gY2FuIGJlIGEg
cmlwLXJlbGF0aXZlIGxlYSBpbnN0ZWFkLiAgVGhpcwpoYXMgdGhlIGFkZGVkIGFkdmFudGFnZSB0
aGF0IG9iamR1bXAgY2FuIG5vdyBjcm9zcyByZWZlcmVuY2UgaXQgZHVyaW5nCmRpc2Fzc2VtYmx5
LgoKVGhlIHN0YWNrIGhhbmRpbmcgaXMgY29uZnVzaW5nIHRvIGZvbGxvdy4gICVyc3AgaXMgc2V0
IHVwIGJ5IHJlYWRpbmcKc3RhY2tfc3RhcnQgd2hpY2ggaXMgYSBwb2ludGVyIHRvIGNwdTBfc3Rh
Y2ssIHRoZW4gY29uc3RydWN0aW5nIGFuIGxyZXQgZnJhbWUKdW5kZXIgJXJzcCAodG8gYXZvaWQg
Y2xvYmJlcmluZyB3aGF0ZXZlciBpcyBhZGphY2VudCB0byBjcHUwX3N0YWNrKSwgYW5kIHVzZXMK
dGhlIFBhc2NhbCBmb3JtIG9mIGxyZXQgdG8gbW92ZSAlcnNwIHRvIHRoZSBiYXNlIG9mIGNwdTBf
c3RhY2suCgpSZW1vdmUgc3RhY2tfc3RhcnQgZnJvbSB0aGUgbWl4IGFuZCB1c2UgYSBzaW5nbGUg
bGVhIHRvIGxvYWQgY3B1MF9zdGFjayBiYXNlCmRpcmVjdGx5LCBhbmQgdXNlIHRoZSBtb3JlIGNv
bW1vbiBwdXNoL3B1c2gvbHJldHEgc2VxdWVuY2UgZm9yIHJlbG9hZGluZyAlY3MuCgpVc2UgdW5y
ZWFjaGFibGUoKSByYXRoZXIgdGhhbiBhbiBpbmZpbml0ZSBmb3IgbG9vcCwgd2hpY2ggbGV0cyB0
aGUgY29tcGlsZXIKZGlzY2FyZCBhbGwgdGhlIGVwaWxvZ3VlIGNvZGUgdGhhdCBpdCBpbnNlcnRl
ZCBwcmV2aW91c2x5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpPdmVyYWxsLCB0aGUgYXNtIGJsb2NrIGlzIDEwIGJ5dGVzIHNob3J0ZXIsIG5v
dCB0aGF0IHRoaXMgd2FzIHRoZSBwb2ludCBvZiB0aGUKY2hhbmdlLgoKSW4gcHJpbmNpcGxlLCB0
aGUgY29uc3RyYWludHMgZm9yIFtjc10gYW5kIFtkc10gY291bGQgYmUgcmVsYXhlZCB0byBpbmNs
dWRlCiJtIiwgYnV0IENsYW5nIGRlY2lkZWQgdG8gaW5zZXJ0IDUgcmlwLXJlbGF0aXZlIG1lbW9y
eSBvcGVyYW5kcyBmb3IgdGhlCnNlZ21lbnQgbG9hZHMsIHdoaWNoIGlzbid0IGEgY2xldmVyIG9w
dGltaXNhdGlvbiB0byBtYWtlLgotLS0KIHhlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCB8IDE1
ICsrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4v
YXJjaC94ODYvZWZpL2VmaS1ib290LmgKaW5kZXggN2ExM2EzMGJjMC4uMmY1OWQ4YmRiZCAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9l
ZmkvZWZpLWJvb3QuaApAQCAtMjQ5LDE3ICsyNDksMjAgQEAgc3RhdGljIHZvaWQgX19pbml0IG5v
cmV0dXJuIGVmaV9hcmNoX3Bvc3RfZXhpdF9ib290KHZvaWQpCiAgICAgICAgICAgICAgICAgICAg
Im9yICAgICAkIl9fc3RyaW5naWZ5KFg4Nl9DUjRfUEdFKSIsICVbY3I0XVxuXHQiCiAgICAgICAg
ICAgICAgICAgICAgIm1vdiAgICAlW2NyNF0sICUlY3I0XG5cdCIKICNlbmRpZgotICAgICAgICAg
ICAgICAgICAgICJtb3ZhYnMgJF9fc3RhcnRfeGVuLCAlW3JpcF1cblx0IgorICAgICAgICAgICAg
ICAgICAgIC8qIExvYWQgZGF0YSBzZWdtZW50cy4gKi8KICAgICAgICAgICAgICAgICAgICAibGdk
dCAgIGdkdF9kZXNjciglJXJpcClcblx0IgotICAgICAgICAgICAgICAgICAgICJtb3YgICAgc3Rh
Y2tfc3RhcnQoJSVyaXApLCAlJXJzcFxuXHQiCiAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAl
W2RzXSwgJSVzc1xuXHQiCiAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVkc1xu
XHQiCiAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVlc1xuXHQiCiAgICAgICAg
ICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVmc1xuXHQiCiAgICAgICAgICAgICAgICAgICAg
Im1vdiAgICAlW2RzXSwgJSVnc1xuXHQiCi0gICAgICAgICAgICAgICAgICAgIm1vdmwgICAlW2Nz
XSwgOCglJXJzcClcblx0IgotICAgICAgICAgICAgICAgICAgICJtb3YgICAgJVtyaXBdLCAoJSVy
c3ApXG5cdCIKLSAgICAgICAgICAgICAgICAgICAibHJldHEgICVbc3Rrb2ZmXS0xNiIKKworICAg
ICAgICAgICAgICAgICAgIC8qIFN3aXRjaCBzdGFjaywgcmVsb2FkICVjcyBhbmQganVtcC4gKi8K
KyAgICAgICAgICAgICAgICAgICAibGVhICAgICVjW3N0a29mZl0gKyBjcHUwX3N0YWNrKCUlcmlw
KSwgJSVyc3Bcblx0IgorICAgICAgICAgICAgICAgICAgICJsZWEgICAgX19zdGFydF94ZW4oJSVy
aXApLCAlW3JpcF1cblx0IgorICAgICAgICAgICAgICAgICAgICJwdXNoICAgJVtjc11cblx0Igor
ICAgICAgICAgICAgICAgICAgICJwdXNoICAgJVtyaXBdXG5cdCIKKyAgICAgICAgICAgICAgICAg
ICAibHJldHEiCiAgICAgICAgICAgICAgICAgICAgOiBbcmlwXSAiPSZyIiAoZWZlci8qIGFueSBk
ZWFkIDY0LWJpdCB2YXJpYWJsZSAqLyksCiAgICAgICAgICAgICAgICAgICAgICBbY3I0XSAiKyZy
IiAoY3I0KQogICAgICAgICAgICAgICAgICAgIDogW2NyM10gInIiIChpZGxlX3BnX3RhYmxlKSwK
QEAgLTI2OCw3ICsyNzEsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbm9yZXR1cm4gZWZpX2FyY2hf
cG9zdF9leGl0X2Jvb3Qodm9pZCkKICAgICAgICAgICAgICAgICAgICAgIFtzdGtvZmZdICJpIiAo
U1RBQ0tfU0laRSAtIHNpemVvZihzdHJ1Y3QgY3B1X2luZm8pKSwKICAgICAgICAgICAgICAgICAg
ICAgICJEIiAoJm1iaSkKICAgICAgICAgICAgICAgICAgICA6ICJtZW1vcnkiICk7Ci0gICAgZm9y
KCA7IDsgKTsgLyogbm90IHJlYWNoZWQgKi8KKyAgICB1bnJlYWNoYWJsZSgpOwogfQogCiBzdGF0
aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfY2ZnX2ZpbGVfZWFybHkoRUZJX0ZJTEVfSEFORExFIGRp
cl9oYW5kbGUsIGNoYXIgKnNlY3Rpb24pCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
