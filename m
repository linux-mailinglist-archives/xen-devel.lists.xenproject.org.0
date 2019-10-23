Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7176E1D9B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:02:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNH9t-0004qY-2g; Wed, 23 Oct 2019 13:58:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xo40=YQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNH9r-0004py-Nu
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:58:39 +0000
X-Inumbo-ID: 2b3cf092-f59d-11e9-947f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b3cf092-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 13:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571839100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m2kh9QpgbBW0t3CfPqyCV8pyy7mWwqyKUQok2IrkiPo=;
 b=HGGjXnyTF270p7N7zM/A9UGlGzagUxng66tZjJOcQJyiebiyU3e0i9Mv
 MZAc+exFldhSjS6F0QgVac9rfWcUdlyOW1nuJOKoT+Phr6GnI5GkJYcZI
 uYZssPs+YVUbFEtGHGDSKI+7v5gNKR2KQG8UU0rlR8Ifn1aUXDtm3FlBs 8=;
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
IronPort-SDR: 1Xv42v6vv9H4f21Bp8k5eR3v/Mwfm/KnI79Abul3Wm3J7gMqlTPdIjlDgVvBCg+pbtibGct67q
 v4HAGsJ3nz82Q5ynZgDfGVbeJe7Hi2sHLJjwvrFuHSisba8wlxFqtO/zQaYWkjaFmyVnPNnLFH
 /38bg0WC/p/EG7Er9vVHXoQm3ugF2v0l1TWzx9HZYQMm3MMsksMCXG/R+fdXhEmrTxwKaRwRFV
 sIe1gaOwmJ6sT4bzFNexpsZcK8GMxlWqwMcxDVQxXW/IvK0QVq9e3v10nr2w7SmpeKJ1HQp58g
 +TU=
X-SBRS: 2.7
X-MesageID: 7320436
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7320436"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:58:10 +0100
Message-ID: <20191023135812.21348-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023135812.21348-1-andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 5/7] x86/livepatch: Fail the build if
 duplicate symbols exist
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpUaGUgYmlu
YXJ5IGRpZmZpbmcgYWxnb3JpdGhtIHVzZWQgYnkgeGVuLWxpdmVwYXRjaCBkZXBlbmRzIG9uIGhh
dmluZyB1bmlxdWUKc3ltYm9scy4KClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3Nz
LmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKVGhlIGxpdmVwYXRjaCBsb2FkaW5nIGFsZ29yaXRobSB1
c2VkIGJ5IFhlbiByZXNvbHZlcyByZWxvY2F0aW9ucyBieSBzeW1ib2wKbmFtZSwgYW5kIHRodXMg
YWxzbyBkZXBlbmRzIG9uIGhhdmluZyB1bmlxdWUgc3ltYm9scy4KCkludHJvZHVjZSBDT05GSUdf
RU5GT1JDRV9VTklRVUVfU1lNQk9MUyB0byBjb250cm9sIGZhaWxpbmcgdGhlIGJ1aWxkIGlmCmR1
cGxpY2F0ZSBzeW1ib2xzIGFyZSBmb3VuZCwgYW5kIGRpc2FibGUgaXQgaW4gdGhlIFJBTkRDT05G
SUcgYnVpbGQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KQ0M6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgpDQzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzogTm9yYmVy
dCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+Cgp2MzoKICogVXNlIGEgbmV3IGNvbmZpZyBvcHRpb24KLS0tCiB4ZW4vYXJjaC94
ODYvTWFrZWZpbGUgICAgICAgICAgICAgIHwgIDEgKwogeGVuL2NvbW1vbi9LY29uZmlnICAgICAg
ICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKystLQogeGVuL3Rvb2xzL2tjb25maWcvYWxs
cmFuZG9tLmNvbmZpZyB8ICAxICsKIHhlbi90b29scy9zeW1ib2xzLmMgICAgICAgICAgICAgICAg
fCAxMSArKysrKysrKystLQogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNo
L3g4Ni9NYWtlZmlsZQppbmRleCAyNDQzZmQyY2M1Li42YjM2OWYyMWNiIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCkBAIC05OSw2
ICs5OSw3IEBAIGVuZGlmCiAKIHN5bXMtd2Fybi1kdXAteSA6PSAtLXdhcm4tZHVwCiBzeW1zLXdh
cm4tZHVwLSQoQ09ORklHX1NVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MpIDo9Citz
eW1zLXdhcm4tZHVwLSQoQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFMpIDo9IC0tZXJyb3It
ZHVwCiAKICQoVEFSR0VUKTogVE1QID0gJChARCkvLiQoQEYpLmVsZjMyCiAkKFRBUkdFVCk6ICQo
VEFSR0VUKS1zeW1zICQoZWZpLXkpIGJvb3QvbWtlbGYzMgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1v
bi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCmluZGV4IGM5ZTY3MTg2OWUuLjRjODM3ZDY4
OTIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vS2NvbmZpZworKysgYi94ZW4vY29tbW9uL0tjb25m
aWcKQEAgLTM2MSw5ICszNjEsMjMgQEAgY29uZmlnIEZBU1RfU1lNQk9MX0xPT0tVUAogCiAJICBJ
ZiB1bnN1cmUsIHNheSBZLgogCitjb25maWcgRU5GT1JDRV9VTklRVUVfU1lNQk9MUworCWJvb2wg
IkVuZm9yY2UgdW5pcXVlIHN5bWJvbHMiIGlmIExJVkVQQVRDSAorCWRlZmF1bHQgeSBpZiBMSVZF
UEFUQ0gKKwktLS1oZWxwLS0tCisJICBNdWx0aXBsZSBzeW1ib2xzIHdpdGggdGhlIHNhbWUgbmFt
ZSBhcmVuJ3QgZ2VuZXJhbGx5IGEgcHJvYmxlbQorCSAgdW5sZXNzIExpdmUgcGF0Y2hpbmcgaXMg
dG8gYmUgdXNlZC4KKworCSAgTGl2ZXBhdGNoIGxvYWRpbmcgaW52b2x2ZXMgcmVzb2x2aW5nIHJl
bG9jYXRpb25zIGFnYWluc3Qgc3ltYm9sCisJICBuYW1lcywgYW5kIGF0dGVtcHRpbmcgdG8gYSBk
dXBsaWNhdGUgc3ltYm9sIGluIGEgbGl2ZXBhdGNoIHdpbGwKKwkgIHJlc3VsdCBpbiBpbmNvcnJl
Y3QgbGl2ZXBhdGNoIGFwcGxpY2F0aW9uLgorCisJICBUaGlzIG9wdGlvbiBzaG91bGQgYmUgdXNl
ZCB0byBlbnN1cmUgdGhhdCBhIGJ1aWxkIG9mIFhlbiBjYW4gaGF2ZSBhCisJICBsaXZlcGF0Y2gg
YnVpbGQgYW5kIGFwcGx5IGNvcnJlY3RseS4KKwogY29uZmlnIFNVUFBSRVNTX0RVUExJQ0FURV9T
WU1CT0xfV0FSTklOR1MKLQlib29sICJTdXBwcmVzcyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdz
IiBpZiAhTElWRVBBVENICi0JZGVmYXVsdCB5IGlmICFMSVZFUEFUQ0gKKwlib29sICJTdXBwcmVz
cyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIiBpZiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwor
CWRlZmF1bHQgeSBpZiAhRU5GT1JDRV9VTklRVUVfU1lNQk9MUwogCS0tLWhlbHAtLS0KIAkgIE11
bHRpcGxlIHN5bWJvbHMgd2l0aCB0aGUgc2FtZSBuYW1lIGFyZW4ndCBnZW5lcmFsbHkgYSBwcm9i
bGVtCiAJICB1bmxlc3MgTGl2ZSBwYXRjaGluZyBpcyB0byBiZSB1c2VkLCBzbyB0aGVzZSB3YXJu
aW5ncyBjYW4gYmUKZGlmZiAtLWdpdCBhL3hlbi90b29scy9rY29uZmlnL2FsbHJhbmRvbS5jb25m
aWcgYi94ZW4vdG9vbHMva2NvbmZpZy9hbGxyYW5kb20uY29uZmlnCmluZGV4IDc2Zjc0MzIwYjUu
LmM0ODA4OTZiOTYgMTAwNjQ0Ci0tLSBhL3hlbi90b29scy9rY29uZmlnL2FsbHJhbmRvbS5jb25m
aWcKKysrIGIveGVuL3Rvb2xzL2tjb25maWcvYWxscmFuZG9tLmNvbmZpZwpAQCAtMiwzICsyLDQg
QEAKIAogQ09ORklHX0dDT1ZfRk9STUFUX0FVVE9ERVRFQ1Q9eQogQ09ORklHX1VCU0FOPW4KK0NP
TkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xTPW4KZGlmZiAtLWdpdCBhL3hlbi90b29scy9zeW1i
b2xzLmMgYi94ZW4vdG9vbHMvc3ltYm9scy5jCmluZGV4IDA1MTM5ZDE2MDAuLjlmOWUyYzk5MDAg
MTAwNjQ0Ci0tLSBhL3hlbi90b29scy9zeW1ib2xzLmMKKysrIGIveGVuL3Rvb2xzL3N5bWJvbHMu
YwpAQCAtNTk5LDcgKzU5OSw3IEBAIHN0YXRpYyBpbnQgY29tcGFyZV9uYW1lKGNvbnN0IHZvaWQg
KnAxLCBjb25zdCB2b2lkICpwMikKIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIHsK
IAl1bnNpZ25lZCBpbnQgaTsKLQlib29sIHVuc29ydGVkID0gZmFsc2UsIHdhcm5fZHVwID0gZmFs
c2U7CisJYm9vbCB1bnNvcnRlZCA9IGZhbHNlLCB3YXJuX2R1cCA9IGZhbHNlLCBlcnJvcl9kdXAg
PSBmYWxzZSwgZm91bmRfZHVwID0gZmFsc2U7CiAKIAlpZiAoYXJnYyA+PSAyKSB7CiAJCWZvciAo
aSA9IDE7IGkgPCBhcmdjOyBpKyspIHsKQEAgLTYxOSw2ICs2MTksOCBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCiAJCQkJc29ydF9ieV9uYW1lID0gMTsKIAkJCWVsc2UgaWYgKHN0
cmNtcChhcmd2W2ldLCAiLS13YXJuLWR1cCIpID09IDApCiAJCQkJd2Fybl9kdXAgPSB0cnVlOwor
CQkJZWxzZSBpZiAoc3RyY21wKGFyZ3ZbaV0sICItLWVycm9yLWR1cCIpID09IDApCisJCQkJd2Fy
bl9kdXAgPSBlcnJvcl9kdXAgPSB0cnVlOwogCQkJZWxzZSBpZiAoc3RyY21wKGFyZ3ZbaV0sICIt
LXhlbnN5bXMiKSA9PSAwKQogCQkJCW1hcF9vbmx5ID0gdHJ1ZTsKIAkJCWVsc2UKQEAgLTYzNCwx
NCArNjM2LDE5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAkJZm9yIChpID0g
MTsgaSA8IHRhYmxlX2NudDsgKytpKQogCQkJaWYgKHN0cmNtcChTWU1CT0xfTkFNRSh0YWJsZSAr
IGkgLSAxKSwKIAkJCQkgICBTWU1CT0xfTkFNRSh0YWJsZSArIGkpKSA9PSAwICYmCi0JCQkgICAg
dGFibGVbaSAtIDFdLmFkZHIgIT0gdGFibGVbaV0uYWRkcikKKwkJCSAgICB0YWJsZVtpIC0gMV0u
YWRkciAhPSB0YWJsZVtpXS5hZGRyKSB7CiAJCQkJZnByaW50ZihzdGRlcnIsCiAJCQkJCSJEdXBs
aWNhdGUgc3ltYm9sICclcycgKCVsbHggIT0gJWxseClcbiIsCiAJCQkJCVNZTUJPTF9OQU1FKHRh
YmxlICsgaSksCiAJCQkJCXRhYmxlW2ldLmFkZHIsIHRhYmxlW2kgLSAxXS5hZGRyKTsKKwkJCQlm
b3VuZF9kdXAgPSB0cnVlOworCQkJfQogCQl1bnNvcnRlZCA9IHRydWU7CiAJfQogCisJaWYgKGVy
cm9yX2R1cCAmJiBmb3VuZF9kdXApCisJCWV4aXQoMSk7CisKIAlpZiAodW5zb3J0ZWQpCiAJCXFz
b3J0KHRhYmxlLCB0YWJsZV9jbnQsIHNpemVvZigqdGFibGUpLCBjb21wYXJlX3ZhbHVlKTsKIAot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
