Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EFB140E74
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:00:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isU0r-0002jn-Qd; Fri, 17 Jan 2020 15:58:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V5CB=3G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1isU0q-0002j3-Ad
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:58:20 +0000
X-Inumbo-ID: 20c0987e-3942-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20c0987e-3942-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579276676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AM8Xf7hx61ynSqs8IBtGz549ZAkR2Wzi3DTSNGi918Q=;
 b=baalfIp+TaF1I5wZ2Pj88nw5AiPDMPsw9R+l9CVSdwwH+Lje06ZuegKK
 2hoAQ37IMgiS6HW4zkgVcNHGUkqt59XDNVb6Y1DSfyezGNrT0ZriZmkeM
 ikYJF/6vakSHozbGa67i0/qyTB2WJpqnlWHpz37vIqFG/vD1W+TMWyWY5 c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: phDJsRD1+0pRTgV+tA2Wf07jXibt+z2i1gIbzgkboJ11U5Tzcljcv8DW41uwcNIwlAhADCL1sc
 U/VnphM3S3uxkHx5mOyEFPlvv2nP79uQnFCLaJHjQZeIF8BrkD4uFZgW6KnPBTtcFBn7xxn4wU
 INbIuxcI4KZj6ysGPpAXILDnASiLZp4OZqEj0sNpn00/lLXDykyk4TrbTQJ0sDMzU0+K3EHQ+a
 tw2SB9REVWkxqcc2guZrhQV9CPt4HxNUDagh68Qa++P4xTR6vgdyYEpiL5KwGDYkepoaqzJVZn
 Z5Q=
X-SBRS: 2.7
X-MesageID: 11674368
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11674368"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 15:57:34 +0000
Message-ID: <20200117155734.1067550-8-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117155734.1067550-1-george.dunlap@citrix.com>
References: <20200117155734.1067550-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 8/8] RFC: Sketch constructors, DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHNrZXRjaCBvZiBmdW5jdGlvbmFsaXR5IHN1aXRhYmxlIGZvciBjcmVhdGluZyBh
IGJhc2ljCmRvbWFpbiwgd2l0aCBhIGRpc2sgYW5kIGEgdmlmLiAgRG9tYWluQ29uZmlnLCBEZXZp
Y2VEaXNrLCBhbmQKRGV2aWNlTmljIHR5cGVzIGFyZSBhbGwgY3JlYXRlZCB1c2luZyBjb25zdHJ1
Y3RvciBmdW5jdGlvbnMsIHdoaWNoCmluaXRpYWxpemUgdGhlbSB3aXRoIGxpYnhsJ3MgZGVmYXVs
dHMuCgpEb21haW5DcmVhdGVOZXcgdGFrZXMgdGhlIGNvbmZpZyBhbmQgY2FsbHMgd2l0aG91dCBh
bnkgdXBkYXRlcy4KCk9idmlvdXNseSBzb21lIG9mIHRoZXNlIHdpbGwgbmVlZCB0byBiZSBjaGFu
Z2VkIGl0IHdlIHN3aXRjaCB0bwpwYXNzaW5nIHJlZmVyZW5jZXMgdG8gLnRvQygpIHJhdGhlciB0
aGFuIHBhc3NpbmcgYmFjayBieSB2YWx1ZS4KClRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBpcyB0
byBhbGxvdyB0ZXN0aW5nIG9mIGNyZWF0aW5nIGEgaGFyZC1jb2RlZApkb21haW4uCgpDcmVhdGlu
ZyBhIGRvbWFpbiB3b3VsZCBsb29rIGxpa2UgdGhpczoKCgkvLyB0eXBlID0gInB2IgoJZGNvbmYs
IGVyciA6PSB4bC5OZXdEb21haW5Db25maWcoeGwuRG9tYWluVHlwZVB2KQoJaWYgZXJyICE9IG5p
bCB7CgkJZm10LlByaW50ZigiTmV3RG9tYWluQ29uZmlnOiAldlxuIiwgZXJyKQoJCXJldHVybgoJ
fQoJZGNvbmYuQ0luZm8uVHlwZSA9IHhsLkRvbWFpblR5cGVQdgoJLy8gbmFtZSA9ICJjNi0wMSIK
CWRjb25mLkNJbmZvLk5hbWUgPSAiYzYtMDEiCgkvLyB2Y3B1cz00CglkY29uZi5CSW5mby5NYXhW
Y3B1cyA9IDQKCS8vIG1lbW9yeSA9ICIyMDQ4IgoJZGNvbmYuQkluZm8uTWF4TWVta2IgPSAyMDQ4
ICogMTAyNAoJZGNvbmYuQkluZm8uVGFyZ2V0TWVta2IgPSAyMDQ4ICogMTAyNAoJLy8gb25fY3Jh
c2ggPSAnZGVzdHJveScKCWRjb25mLk9uQ3Jhc2ggPSB4bC5BY3Rpb25PblNodXRkb3duRGVzdHJv
eQoJLy8gYm9vdGxvYWRlciA9ICJweWdydWIiCglkY29uZi5CSW5mby5Cb290bG9hZGVyID0gInB5
Z3J1YiIKCS8vIGRpc2sgPSBbICd2ZGV2PWhkYSxmb3JtYXQ9cmF3LHRhcmdldD0vaW1hZ2VzL2M2
LTAxLnJhdyddCgl7CgkJZGlzaywgZXJyIDo9IHhsLk5ld0RldmljZURpc2soKQoJCWlmIGVyciAh
PSBuaWwgewoJCQlmbXQuUHJpbnRmKCJOZXdEZXZpY2VEaXNrOiAldlxuIiwgZXJyKQoJCQlyZXR1
cm4KCQl9CgkJZGlzay5WZGV2ID0gImhkYSIKCQkvL2Rpc2suRGlza0JhY2tlbmQgPSB4bC5EaXNr
QmFja2VuZFBoeQoJCWRpc2suRm9ybWF0ID0geGwuRGlza0Zvcm1hdFJhdwoJCWRpc2suUmVhZHdy
aXRlID0gMQoJCWRpc2suUGRldlBhdGggPSAiL2ltYWdlcy9jNi0wMS5yYXciCgkJZGNvbmYuRGlz
a3MgPSBhcHBlbmQoZGNvbmYuRGlza3MsICpkaXNrKQoJfQoJLy8gdmlmID0gWyAnbWFjPTVhOjVi
OmQ2OmYxOmQ2OmI0JyBdCgl7CgkJdmlmLCBlcnIgOj0geGwuTmV3RGV2aWNlTmljKCkKCQlpZiBl
cnIgIT0gbmlsIHsKCQkJZm10LlByaW50ZigiTmV3RGV2aWNlTmljOiAldlxuIiwgZXJyKQoJCQly
ZXR1cm4KCQl9CgkJdmlmLk1hYyA9IHhsLk1hY3sgMHg1YSwgMHg1YiwgMHhkNiwgMHgzMSwgMHhk
NiwgMHhiNCB9CgkJZGNvbmYuTmljcyA9IGFwcGVuZChkY29uZi5OaWNzLCAqdmlmKQoJfQoJLy8g
c2VyaWFsPSdwdHknICMgSFZNIG9ubHkKCglkaWQsIGVyciA6PSBjdHguRG9tYWluQ3JlYXRlTmV3
KGRjb25mKQoKCWlmIGVyciAhPSBuaWwgewoJCWZtdC5QcmludGYoIkNyZWF0aW5nIGRvbWFpbjog
JXZcbiIsIGVycikKCQlyZXR1cm4KCX0KCglmbXQuUHJpbnRmKCJEb21haW4gJXMoJWQpIGNyZWF0
ZWQgc3VjY2Vzc2Z1bGx5IiwgZGNvbmYuQ0luZm8uTmFtZSwgZGlkKQoKClNpZ25lZC1vZmYtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCkNDOiBOaWNrIFJv
c2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgotLS0KIHRvb2xzL2dvbGFuZy94ZW5saWdo
dC94ZW5saWdodC5nbyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hl
bmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmlu
ZGV4IGM0NjJlNGJiNDIuLjVhMjFhMmI5YjggMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5s
aWdodC94ZW5saWdodC5nbworKysgYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28K
QEAgLTExMTMsMyArMTExMyw2OSBAQCBmdW5jIChDdHggKkNvbnRleHQpIFByaW1hcnlDb25zb2xl
R2V0VHR5KGRvbWlkIHVpbnQzMikgKHBhdGggc3RyaW5nLCBlcnIgZXJyb3IpCiAJcGF0aCA9IEMu
R29TdHJpbmcoY3BhdGgpCiAJcmV0dXJuCiB9CisKK2Z1bmMgTmV3RG9tYWluQ29uZmlnKHQgRG9t
YWluVHlwZSkgKCpEb21haW5Db25maWcsIGVycm9yKSB7CisJdmFyIGNjb25maWcgQy5saWJ4bF9k
b21haW5fY29uZmlnCisKKwlDLmxpYnhsX2RvbWFpbl9jb25maWdfaW5pdCgmY2NvbmZpZykKKwlD
LmxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX2luaXRfdHlwZSgmY2NvbmZpZy5iX2luZm8sIEMubGli
eGxfZG9tYWluX3R5cGUodCkpCisKKwlnY29uZmlnIDo9ICZEb21haW5Db25maWd7fQorCWVyciA6
PSBnY29uZmlnLmZyb21DKCZjY29uZmlnKQorCWlmIGVyciAhPSBuaWwgeworCQlyZXR1cm4gbmls
LCBlcnIKKwl9CisKKwlyZXR1cm4gZ2NvbmZpZywgbmlsCit9CisKK2Z1bmMgTmV3RGV2aWNlRGlz
aygpICgqRGV2aWNlRGlzaywgZXJyb3IpIHsKKwl2YXIgY3R5cGUgQy5saWJ4bF9kZXZpY2VfZGlz
aworCisJQy5saWJ4bF9kZXZpY2VfZGlza19pbml0KCZjdHlwZSkKKworCWd0eXBlIDo9ICZEZXZp
Y2VEaXNre30KKwllcnIgOj0gZ3R5cGUuZnJvbUMoJmN0eXBlKQorCisJaWYgZXJyICE9IG5pbCB7
CisJCXJldHVybiBuaWwsIGVycgorCX0KKworCXJldHVybiBndHlwZSwgbmlsCit9CisKK2Z1bmMg
TmV3RGV2aWNlTmljKCkgKCpEZXZpY2VOaWMsIGVycm9yKSB7CisJdmFyIGN0eXBlIEMubGlieGxf
ZGV2aWNlX25pYworCisJQy5saWJ4bF9kZXZpY2VfbmljX2luaXQoJmN0eXBlKQorCisJZ3R5cGUg
Oj0gJkRldmljZU5pY3t9CisJZXJyIDo9IGd0eXBlLmZyb21DKCZjdHlwZSkKKworCWlmIGVyciAh
PSBuaWwgeworCQlyZXR1cm4gbmlsLCBlcnIKKwl9CisKKwlyZXR1cm4gZ3R5cGUsIG5pbAorfQor
CisvLyBpbnQgbGlieGxfZG9tYWluX2NyZWF0ZV9uZXcobGlieGxfY3R4ICpjdHgsIGxpYnhsX2Rv
bWFpbl9jb25maWcgKmRfY29uZmlnLAorLy8gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90ICpkb21pZCwKKy8vICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4
bF9hc3luY29wX2hvdyAqYW9faG93LAorLy8gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IGxpYnhsX2FzeW5jcHJvZ3Jlc3NfaG93ICphb3BfY29uc29sZV9ob3cpCitmdW5jIChDdHgg
KkNvbnRleHQpIERvbWFpbkNyZWF0ZU5ldyhjb25maWcgKkRvbWFpbkNvbmZpZykgKERvbWlkLCBl
cnJvcikgeworCXZhciBjZG9taWQgQy51aW50MzJfdAorCXZhciBjY29uZmlnIEMubGlieGxfZG9t
YWluX2NvbmZpZworCWVyciA6PSBjb25maWcudG9DKCZjY29uZmlnKQorCWlmIGVyciAhPSBuaWwg
eworCQlyZXR1cm4gRG9taWQoMCksIGZtdC5FcnJvcmYoImNvbnZlcnRpbmcgZG9tYWluIGNvbmZp
ZyB0byBDOiAldiIsIGVycikKKwl9CisJZGVmZXIgQy5saWJ4bF9kb21haW5fY29uZmlnX2Rpc3Bv
c2UoJmNjb25maWcpCisKKwlyZXQgOj0gQy5saWJ4bF9kb21haW5fY3JlYXRlX25ldyhDdHguY3R4
LCAmY2NvbmZpZywgJmNkb21pZCwgbmlsLCBuaWwpCisJaWYgcmV0ICE9IDAgeworCQlyZXR1cm4g
RG9taWQoMCksIEVycm9yKHJldCkKKwl9CisKKwlyZXR1cm4gRG9taWQoY2RvbWlkKSwgbmlsCit9
Ci0tIAoyLjI0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
