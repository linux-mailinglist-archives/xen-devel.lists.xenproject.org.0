Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902995FCAD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 20:00:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj5zJ-0000AF-AW; Thu, 04 Jul 2019 17:57:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj5zH-0000AA-Id
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 17:57:39 +0000
X-Inumbo-ID: 34420552-9e85-11e9-ae1c-a792ea221c88
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34420552-9e85-11e9-ae1c-a792ea221c88;
 Thu, 04 Jul 2019 17:57:36 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SDAk2dBxItClEqB0tW2kUg5FIpvpP4sTKFIfoVTY8XKFNte/W3CSM+P+HCKYGFvM/lOHMQ5DGa
 r9v1ZD2EPNrH/2wNOzmUFsoGFKyHtTdJtUz6EzouQ3avOwMPMxcb3Js3fqycSrGwuHn553wIjS
 OzvZCdU63KuSpCNg2/X3ut0MfUFckbH37F61u0VlbGle9rwqbyse2Od8ydn2PBAUzIXDxsAR32
 kmzDZxwSZv4HjML8hHZrV1xvTA6wH4NcP4ek33dGU9fxPQODPh4wo5UagwlMijMkwf32ng7aDp
 IFM=
X-SBRS: 2.7
X-MesageID: 2630108
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2630108"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 4 Jul 2019 18:57:32 +0100
Message-ID: <20190704175732.5943-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/ctxt-switch: Document and improve GDT
 handling
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

d3JpdGVfZnVsbF9nZHRfcHRlcygpIGhhcyBhIGxhdGVudCBidWcuICBVc2luZyB2aXJ0X3RvX21m
bigpIGFuZCBpdGVyYXRpbmcKd2l0aCAobWZuICsgaSkgaXMgd3JvbmcsIGJlY2F1c2Ugb2YgUERY
IGNvbXByZXNzaW9uLiAgVGhlIGNvbnRleHQgc3dpdGNoIHBhdGgKb25seSBmdW5jdGlvbnMgY29y
cmVjdGx5IGJlY2F1c2UgTlJfUkVTRVJWRURfR0RUX1BBR0VTIGlzIDEuCgpBcyB0aGlzIGlzIGV4
Y2VlZGluZ2x5IHVubGlrZWx5IHRvIGNoYW5nZSBtb3ZpbmcgZm93YXJkLCBkcm9wIHRoZSBsb29w
CnJhdGhlciB0aGFuIGluc2VydGluZyBhIEJVSUxEX0JVR19PTihOUl9SRVNFUlZFRF9HRFRfUEFH
RVMgIT0gMSkuCgpXaXRoIHRoZSBsb29wIGRyb3BwZWQsIHdyaXRlX2Z1bGxfZ2R0X3B0ZXMoKSBi
ZWNvbWVzIG1vcmUgb2J2aW91c2x5IGEgcG9vcgpuYW1lLCBzbyByZW5hbWUgaXQgdG8gdXBkYXRl
X3hlbl9zbG90X2luX2Z1bGxfZ2R0KCkuCgpGdXJ0aGVybW9yZSwgY2FsbGluZyB2aXJ0X3RvX21m
bigpIGluIHRoZSBjb250ZXh0IHN3aXRjaCBwYXRoIGlzIGEgbG90IG9mCndhc3RlZCBjeWNsZXMg
Zm9yIGEgcmVzdWx0IHdoaWNoIGlzIGNvbnN0YW50IGFmdGVyIGJvb3QuCgpCZWdpbiBieSBkb2N1
bWVudGluZyBob3cgWGVuIGhhbmRsZXMgdGhlIEdEVHMgYWNyb3NzIGNvbnRleHQgc3dpdGNoLgoK
RnJvbSB0aGlzLCB3ZSBvYnNlcnZlIHRoYXQgbG9hZF9mdWxsX2dkdCgpIGlzIGNvbXBsZXRlbHkg
aW5kZXBlbmRlbnQgb2YgdGhlCmN1cnJlbnQgQ1BVLCBhbmQgbG9hZF9kZWZhdWx0X2dkdCgpIG9u
bHkgZ2V0cyBwYXNzZWQgdGhlIGN1cnJlbnQgQ1BVIHJlZ3VsYXIKR0RULgoKQWRkIHR3byBleHRy
YSBwZXItY3B1IHZhcmlhYmxlcyB3aGljaCBjYWNoZSB0aGUgTDFlIGZvciB0aGUgcmVndWxhciBh
bmQgY29tcGF0CkdEVCwgY2FsY3VsYXRlZCBpbiBjcHVfc21wYm9vdF9hbGxvYygpL3RyYXBfaW5p
dCgpIGFzIGFwcHJvcHJpYXRlLCBzbwp1cGRhdGVfeGVuX3Nsb3RfaW5fZnVsbF9nZHQoKSBkb2Vz
bid0IG5lZWQgdG8gd2FzdGUgdGltZSBwZXJmb3JtaW5nIHRoZSBzYW1lCmNhbGN1bGF0aW9uIG9u
IGV2ZXJ5IGNvbnRleHQgc3dpdGNoLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpT
bGlnaHRseSBSRkMuCgpJJ20gZmFpcmx5IGNvbmZpZGVudCB0aGlzIGlzIGJldHRlciwgYnV0IEp1
ZXJnZW4gc2F5cyB0aGF0IHRoZSBzb21lIG9mIGhpcwpzY2hlZHVsaW5nIHBlcmYgdGVzdHMgbm90
aWNlIGxhcmdlIGRpZmZlcmVuY2UgZnJvbSBzdWJ0bGUgY2hhbmdlcyBpbgpfX2NvbnRleHRfc3dp
dGNoKCksIHNvIGl0IHdvdWxkIGJlIHVzZWZ1bCB0byBnZXQgc29tZSBudW1iZXJzIGZyb20gdGhp
cwpjaGFuZ2UuCgpUaGUgZGVsdGEgZnJvbSB0aGlzIGNoYW5nZSBpczoKCiAgYWRkL3JlbW92ZTog
Mi8wIGdyb3cvc2hyaW5rOiAxLzEgdXAvZG93bjogMzIwLy0xMjcgKDE5MykKICBGdW5jdGlvbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhCiAg
Y3B1X3NtcGJvb3RfY2FsbGJhY2sgICAgICAgICAgICAgICAgICAgICAgICAxMTUyICAgIDE0NTYg
ICAgKzMwNAogIHBlcl9jcHVfX2dkdF90YWJsZV9sMWUgICAgICAgICAgICAgICAgICAgICAgICAg
LSAgICAgICA4ICAgICAgKzgKICBwZXJfY3B1X19jb21wYXRfZ2R0X3RhYmxlX2wxZSAgICAgICAg
ICAgICAgICAgIC0gICAgICAgOCAgICAgICs4CiAgX19jb250ZXh0X3N3aXRjaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAxMjM4ICAgIDExMTEgICAgLTEyNwogIFRvdGFsOiBCZWZvcmU9MzMz
OTIyNywgQWZ0ZXI9MzMzOTQyMCwgY2hnICswLjAxJQoKSSdtIG5vdCBvdmVybHkgaGFwcHkgYWJv
dXQgdGhlIHNwZWNpYWwgY2FzZSBpbiB0cmFwX2luaXQoKSBidXQgSSBjYW4ndCB0aGluawpvZiBh
IGJldHRlciBwbGFjZSB0byBwdXQgdGhpcy4KCkFsc28sIGl0IHNob3VsZCBub3cgYmUgdmVyeSBv
YnZpb3VzIHRvIHBlb3BsZSB0aGF0IFhlbidzIGN1cnJlbnQgR0RUIGhhbmRsaW5nCmZvciBub24t
UFYgdmNwdXMgaXMgYSByZWNpcGUgc3VidGxlIGJ1Z3MsIGlmIHdlIGV2ZXIgbWFuYWdlIHRvIGV4
ZWN1dGUgYSBzdHJheQptb3YvcG9wICVzcmVnIGluc3RydWN0aW9uLiAgV2UgcmVhbGx5IG91Z2h0
IHRvIGhhdmUgWGVuJ3MgcmVndWxhciBHRFQgaW4gYW4KYXJlYSB3aGVyZSBzbG90cyAwLTEzIGFy
ZSBlaXRoZXIgbWFwcGVkIHRvIHRoZSB6ZXJvIHBhZ2UsIG9yIG5vdCBwcmVzZW50LCBzbwp3ZSBk
b24ndCByaXNrIGxvYWRpbmcgYSBub24tZmF1bHRpbmcgZ2FyYmFnZSBzZWxlY3Rvci4KLS0tCiB4
ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9zbXBib290LmMgICAgIHwgIDQgKysr
KwogeGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgfCAxMCArKysrKysrKysKIHhlbi9pbmNsdWRl
L2FzbS14ODYvZGVzYy5oIHwgIDIgKysKIDQgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygr
KSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIv
eGVuL2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IDg0Y2FmYmU1NTguLjE0N2Y5NmEwOWUgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMK
QEAgLTE2MzUsMjMgKzE2MzUsNDIgQEAgc3RhdGljIHZvaWQgX3VwZGF0ZV9ydW5zdGF0ZV9hcmVh
KHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICB2LT5hcmNoLnB2Lm5lZWRfdXBkYXRlX3J1bnN0YXRl
X2FyZWEgPSAxOwogfQogCisvKgorICogT3ZlcnZpZXcgb2YgWGVuJ3MgR0RUcy4KKyAqCisgKiBY
ZW4gbWFpbnRhaW5zIHBlci1DUFUgY29tcGF0IGFuZCByZWd1bGFyIEdEVHMgd2hpY2ggYXJlIGJv
dGggYSBzaW5nbGUgcGFnZQorICogaW4gc2l6ZS4gIFNvbWUgY29udGVudCBpcyBzcGVjaWZpYyB0
byBlYWNoIENQVSAodGhlIFRTUywgdGhlIHBlci1DUFUgbWFya2VyCisgKiBmb3IgI0RGIGhhbmRs
aW5nLCBhbmQgb3B0aW9uYWxseSB0aGUgTERUKS4gIFRoZSBjb21wYXQgYW5kIHJlZ3VsYXIgR0RU
cworICogZGlmZmVyIGJ5IHRoZSBsYXlvdXQgYW5kIGNvbnRlbnQgb2YgdGhlIGd1ZXN0IGFjY2Vz
c2libGUgc2VsZWN0b3JzLgorICoKKyAqIFRoZSBYZW4gc2VsZWN0b3JzIGxpdmUgZnJvbSAweGUw
MDAgKHNsb3QgMTQgb2YgMTYpLCBhbmQgbmVlZCB0byBhbHdheXMKKyAqIGFwcGVhciBpbiB0aGlz
IHBvc2l0aW9uIGZvciBpbnRlcnJ1cHQvZXhjZXB0aW9uIGhhbmRsaW5nIHRvIHdvcmsuCisgKgor
ICogQSBQViBndWVzdCBtYXkgc3BlY2lmeSBHRFQgZnJhbWVzIG9mIHRoZWlyIG93biAoc2xvdHMg
MCB0byAxMykuICBSb29tIGZvciBhCisgKiBmdWxsIEdEVCBleGlzdHMgaW4gdGhlIHBlci1kb21h
aW4gbWFwcGluZ3MuCisgKgorICogVG8gc2NoZWR1bGUgYSBQViB2Y3B1LCB3ZSBwb2ludCBzbG90
IDE0IG9mIHRoZSBndWVzdCdzIGZ1bGwgR0RUIGF0IHRoZQorICogY3VycmVudCBDUFUncyBjb21w
YXQgb3IgcmVndWxhciAoYXMgYXBwcm9wcmlhdGUpIEdEVCBmcmFtZS4gIFRoaXMgaXMgc28KKyAq
IHRoYXQgdGhlIHBlci1DUFUgcGFydHMgc3RpbGwgd29yayBjb3JyZWN0bHkgYWZ0ZXIgc3dpdGNo
aW5nIHBhZ2V0YWJsZXMgYW5kCisgKiBsb2FkaW5nIHRoZSBndWVzdHMgZnVsbCBHRFQgaW50byBH
RFRSLgorICoKKyAqIFRvIHNjaGVkdWxlIElkbGUgb3IgSFZNIHZjcHVzLCB3ZSBsb2FkIGEgR0RU
IGJhc2UgYWRkcmVzcyB3aGljaCBjYXVzZXMgdGhlCisgKiByZWd1bGFyIHBlci1DUFUgR0RUIGZy
YW1lIHRvIGFwcGVhciB3aXRoIHNlbGVjdG9ycyBhdCB0aGUgYXBwcm9wcmlhdGUKKyAqIG9mZnNl
dC4KKyAqLwogc3RhdGljIGlubGluZSBib29sIG5lZWRfZnVsbF9nZHQoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkKIHsKICAgICByZXR1cm4gaXNfcHZfZG9tYWluKGQpICYmICFpc19pZGxlX2RvbWFp
bihkKTsKIH0KIAotc3RhdGljIHZvaWQgd3JpdGVfZnVsbF9nZHRfcHRlcyhzZWdfZGVzY190ICpn
ZHQsIGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHZvaWQgdXBkYXRlX3hlbl9zbG90X2lu
X2Z1bGxfZ2R0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgY3B1KQogewotICAg
IHVuc2lnbmVkIGxvbmcgbWZuID0gdmlydF90b19tZm4oZ2R0KTsKLSAgICBsMV9wZ2VudHJ5X3Qg
KnBsMWUgPSBwdl9nZHRfcHRlcyh2KTsKLSAgICB1bnNpZ25lZCBpbnQgaTsKLQotICAgIGZvciAo
IGkgPSAwOyBpIDwgTlJfUkVTRVJWRURfR0RUX1BBR0VTOyBpKysgKQotICAgICAgICBsMWVfd3Jp
dGUocGwxZSArIEZJUlNUX1JFU0VSVkVEX0dEVF9QQUdFICsgaSwKLSAgICAgICAgICAgICAgICAg
IGwxZV9mcm9tX3BmbihtZm4gKyBpLCBfX1BBR0VfSFlQRVJWSVNPUl9SVykpOworICAgIGwxZV93
cml0ZShwdl9nZHRfcHRlcyh2KSArIEZJUlNUX1JFU0VSVkVEX0dEVF9QQUdFLAorICAgICAgICAg
ICAgICAhaXNfcHZfMzJiaXRfdmNwdSh2KSA/IHBlcl9jcHUoZ2R0X3RhYmxlX2wxZSwgY3B1KQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IHBlcl9jcHUoY29tcGF0X2dkdF90
YWJsZV9sMWUsIGNwdSkpOwogfQogCi1zdGF0aWMgdm9pZCBsb2FkX2Z1bGxfZ2R0KGNvbnN0IHN0
cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgY3B1KQorc3RhdGljIHZvaWQgbG9hZF9mdWxsX2dk
dChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBzdHJ1Y3QgZGVzY19wdHIgZ2R0X2Rlc2Mg
PSB7CiAgICAgICAgIC5saW1pdCA9IExBU1RfUkVTRVJWRURfR0RUX0JZVEUsCkBAIC0xNjYxLDEx
ICsxNjgwLDEyIEBAIHN0YXRpYyB2b2lkIGxvYWRfZnVsbF9nZHQoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgbGdkdCgmZ2R0X2Rlc2MpOwogfQogCi1zdGF0aWMg
dm9pZCBsb2FkX2RlZmF1bHRfZ2R0KGNvbnN0IHNlZ19kZXNjX3QgKmdkdCwgdW5zaWduZWQgaW50
IGNwdSkKK3N0YXRpYyB2b2lkIGxvYWRfZGVmYXVsdF9nZHQodW5zaWduZWQgaW50IGNwdSkKIHsK
ICAgICBzdHJ1Y3QgZGVzY19wdHIgZ2R0X2Rlc2MgPSB7CiAgICAgICAgIC5saW1pdCA9IExBU1Rf
UkVTRVJWRURfR0RUX0JZVEUsCi0gICAgICAgIC5iYXNlICA9ICh1bnNpZ25lZCBsb25nKShnZHQg
LSBGSVJTVF9SRVNFUlZFRF9HRFRfRU5UUlkpLAorICAgICAgICAuYmFzZSAgPSAodW5zaWduZWQg
bG9uZykocGVyX2NwdShnZHRfdGFibGUsIGNwdSkgLQorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRklSU1RfUkVTRVJWRURfR0RUX0VOVFJZKSwKICAgICB9OwogCiAgICAgbGdkdCgm
Z2R0X2Rlc2MpOwpAQCAtMTY3OCw3ICsxNjk4LDYgQEAgc3RhdGljIHZvaWQgX19jb250ZXh0X3N3
aXRjaCh2b2lkKQogICAgIHN0cnVjdCB2Y3B1ICAgICAgICAgICpwID0gcGVyX2NwdShjdXJyX3Zj
cHUsIGNwdSk7CiAgICAgc3RydWN0IHZjcHUgICAgICAgICAgKm4gPSBjdXJyZW50OwogICAgIHN0
cnVjdCBkb21haW4gICAgICAgICpwZCA9IHAtPmRvbWFpbiwgKm5kID0gbi0+ZG9tYWluOwotICAg
IHNlZ19kZXNjX3QgICAgICAgICAgICpnZHQ7CiAKICAgICBBU1NFUlQocCAhPSBuKTsKICAgICBB
U1NFUlQoIXZjcHVfY3B1X2RpcnR5KG4pKTsKQEAgLTE3MTgsMTUgKzE3MzcsMTIgQEAgc3RhdGlj
IHZvaWQgX19jb250ZXh0X3N3aXRjaCh2b2lkKQogCiAgICAgcHNyX2N0eHRfc3dpdGNoX3RvKG5k
KTsKIAotICAgIGdkdCA9ICFpc19wdl8zMmJpdF9kb21haW4obmQpID8gcGVyX2NwdShnZHRfdGFi
bGUsIGNwdSkgOgotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVyX2NwdShj
b21wYXRfZ2R0X3RhYmxlLCBjcHUpOwotCiAgICAgaWYgKCBuZWVkX2Z1bGxfZ2R0KG5kKSApCi0g
ICAgICAgIHdyaXRlX2Z1bGxfZ2R0X3B0ZXMoZ2R0LCBuKTsKKyAgICAgICAgdXBkYXRlX3hlbl9z
bG90X2luX2Z1bGxfZ2R0KG4sIGNwdSk7CiAKICAgICBpZiAoIG5lZWRfZnVsbF9nZHQocGQpICYm
CiAgICAgICAgICAoKHAtPnZjcHVfaWQgIT0gbi0+dmNwdV9pZCkgfHwgIW5lZWRfZnVsbF9nZHQo
bmQpKSApCi0gICAgICAgIGxvYWRfZGVmYXVsdF9nZHQoZ2R0LCBjcHUpOworICAgICAgICBsb2Fk
X2RlZmF1bHRfZ2R0KGNwdSk7CiAKICAgICB3cml0ZV9wdGJhc2Uobik7CiAKQEAgLTE3MzksNyAr
MTc1NSw3IEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2godm9pZCkKIAogICAgIGlmICgg
bmVlZF9mdWxsX2dkdChuZCkgJiYKICAgICAgICAgICgocC0+dmNwdV9pZCAhPSBuLT52Y3B1X2lk
KSB8fCAhbmVlZF9mdWxsX2dkdChwZCkpICkKLSAgICAgICAgbG9hZF9mdWxsX2dkdChuLCBjcHUp
OworICAgICAgICBsb2FkX2Z1bGxfZ2R0KG4pOwogCiAgICAgaWYgKCBwZCAhPSBuZCApCiAgICAg
ICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgcGQtPmRpcnR5X2NwdW1hc2spOwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXgg
NzMwZmUxNDFmYS4uMDA0Mjg1ZDE0YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC05ODUsNiArOTg1LDggQEAgc3RhdGlj
IGludCBjcHVfc21wYm9vdF9hbGxvYyh1bnNpZ25lZCBpbnQgY3B1KQogICAgIGlmICggZ2R0ID09
IE5VTEwgKQogICAgICAgICBnb3RvIG91dDsKICAgICBwZXJfY3B1KGdkdF90YWJsZSwgY3B1KSA9
IGdkdDsKKyAgICBwZXJfY3B1KGdkdF90YWJsZV9sMWUsIGNwdSkgPQorICAgICAgICBsMWVfZnJv
bV9wZm4odmlydF90b19tZm4oZ2R0KSwgX19QQUdFX0hZUEVSVklTT1JfUlcpOwogICAgIG1lbWNw
eShnZHQsIGJvb3RfY3B1X2dkdF90YWJsZSwgTlJfUkVTRVJWRURfR0RUX1BBR0VTICogUEFHRV9T
SVpFKTsKICAgICBCVUlMRF9CVUdfT04oTlJfQ1BVUyA+IDB4MTAwMDApOwogICAgIGdkdFtQRVJf
Q1BVX0dEVF9FTlRSWSAtIEZJUlNUX1JFU0VSVkVEX0dEVF9FTlRSWV0uYSA9IGNwdTsKQEAgLTk5
Miw2ICs5OTQsOCBAQCBzdGF0aWMgaW50IGNwdV9zbXBib290X2FsbG9jKHVuc2lnbmVkIGludCBj
cHUpCiAgICAgcGVyX2NwdShjb21wYXRfZ2R0X3RhYmxlLCBjcHUpID0gZ2R0ID0gYWxsb2NfeGVu
aGVhcF9wYWdlcyhvcmRlciwgbWVtZmxhZ3MpOwogICAgIGlmICggZ2R0ID09IE5VTEwgKQogICAg
ICAgICBnb3RvIG91dDsKKyAgICBwZXJfY3B1KGNvbXBhdF9nZHRfdGFibGVfbDFlLCBjcHUpID0K
KyAgICAgICAgbDFlX2Zyb21fcGZuKHZpcnRfdG9fbWZuKGdkdCksIF9fUEFHRV9IWVBFUlZJU09S
X1JXKTsKICAgICBtZW1jcHkoZ2R0LCBib290X2NwdV9jb21wYXRfZ2R0X3RhYmxlLCBOUl9SRVNF
UlZFRF9HRFRfUEFHRVMgKiBQQUdFX1NJWkUpOwogICAgIGdkdFtQRVJfQ1BVX0dEVF9FTlRSWSAt
IEZJUlNUX1JFU0VSVkVEX0dEVF9FTlRSWV0uYSA9IGNwdTsKIApkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3RyYXBzLmMgYi94ZW4vYXJjaC94ODYvdHJhcHMuYwppbmRleCA4MDk3ZWYzYmY1Li4y
NWI0YjQ3ZTVlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdHJhcHMuYworKysgYi94ZW4vYXJj
aC94ODYvdHJhcHMuYwpAQCAtOTcsNyArOTcsOSBAQCBERUZJTkVfUEVSX0NQVSh1aW50NjRfdCwg
ZWZlcik7CiBzdGF0aWMgREVGSU5FX1BFUl9DUFUodW5zaWduZWQgbG9uZywgbGFzdF9leHRhYmxl
X2FkZHIpOwogCiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShzZWdfZGVzY190ICosIGdkdF90
YWJsZSk7CitERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShsMV9wZ2VudHJ5X3QsIGdkdF90YWJs
ZV9sMWUpOwogREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc2VnX2Rlc2NfdCAqLCBjb21wYXRf
Z2R0X3RhYmxlKTsKK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGwxX3BnZW50cnlfdCwgY29t
cGF0X2dkdF90YWJsZV9sMWUpOwogCiAvKiBNYXN0ZXIgdGFibGUsIHVzZWQgYnkgQ1BVMC4gKi8K
IGlkdF9lbnRyeV90IF9fc2VjdGlvbigiLmJzcy5wYWdlX2FsaWduZWQiKSBfX2FsaWduZWQoUEFH
RV9TSVpFKQpAQCAtMjA1OSw2ICsyMDYxLDE0IEBAIHZvaWQgX19pbml0IHRyYXBfaW5pdCh2b2lk
KQogICAgICAgICB9CiAgICAgfQogCisgICAgLyogQ2FjaGUgeyxjb21wYXRffWdkdF90YWJsZV9s
MWUgbm93IHRoYXQgcGh5c2ljYWxseSByZWxvY2F0aW9uIGlzIGRvbmUuICovCisgICAgdGhpc19j
cHUoZ2R0X3RhYmxlX2wxZSkgPQorICAgICAgICBsMWVfZnJvbV9wZm4odmlydF90b19tZm4oYm9v
dF9jcHVfZ2R0X3RhYmxlKSwKKyAgICAgICAgICAgICAgICAgICAgIF9fUEFHRV9IWVBFUlZJU09S
X1JXKTsKKyAgICB0aGlzX2NwdShjb21wYXRfZ2R0X3RhYmxlX2wxZSkgPQorICAgICAgICBsMWVf
ZnJvbV9wZm4odmlydF90b19tZm4oYm9vdF9jcHVfY29tcGF0X2dkdF90YWJsZSksCisgICAgICAg
ICAgICAgICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7CisKICAgICBwZXJjcHVfdHJhcHNf
aW5pdCgpOwogCiAgICAgY3B1X2luaXQoKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZGVzYy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kZXNjLmgKaW5kZXggODVlODNiY2VmYi4u
ZTU2NTcyN2RjMCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9kZXNjLmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9kZXNjLmgKQEAgLTIwNiw4ICsyMDYsMTAgQEAgc3RydWN0IF9f
cGFja2VkIGRlc2NfcHRyIHsKIAogZXh0ZXJuIHNlZ19kZXNjX3QgYm9vdF9jcHVfZ2R0X3RhYmxl
W107CiBERUNMQVJFX1BFUl9DUFUoc2VnX2Rlc2NfdCAqLCBnZHRfdGFibGUpOworREVDTEFSRV9Q
RVJfQ1BVKGwxX3BnZW50cnlfdCwgZ2R0X3RhYmxlX2wxZSk7CiBleHRlcm4gc2VnX2Rlc2NfdCBi
b290X2NwdV9jb21wYXRfZ2R0X3RhYmxlW107CiBERUNMQVJFX1BFUl9DUFUoc2VnX2Rlc2NfdCAq
LCBjb21wYXRfZ2R0X3RhYmxlKTsKK0RFQ0xBUkVfUEVSX0NQVShsMV9wZ2VudHJ5X3QsIGNvbXBh
dF9nZHRfdGFibGVfbDFlKTsKIAogZXh0ZXJuIHZvaWQgbG9hZF9UUih2b2lkKTsKIAotLSAKMi4x
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
