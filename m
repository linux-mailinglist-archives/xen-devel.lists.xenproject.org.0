Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE015FA3C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:45:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2wh-0003FX-4U; Thu, 04 Jul 2019 14:42:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj2wf-0003EK-A7
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:42:45 +0000
X-Inumbo-ID: faf3ec72-9e69-11e9-bcba-bb981a0739d6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id faf3ec72-9e69-11e9-bcba-bb981a0739d6;
 Thu, 04 Jul 2019 14:42:43 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: e3aeL0hkoFld3nP/bMLrhKmsxsWofztx6A8gStIF4QYlq0X/rO9spehq526rkOyDedAEO9zj9e
 e9DcXNLELM/4MArx/ldyJC0MDm6LScxR2OHJrqRP9l4sNNJxpLor51FOBw6a9TMcvYTWdMkW9R
 FhwZnLkJyyJt9f90vtbbR9Fi+dIyClG8zu7l0LFxKiS0wFVtV3Lm5IQlRkeAIqz1hGGUjmKIqr
 JxAODj3aAq5JMDTGfkDwLWqhjJfVNG1FnOkgge6LTpM4mPOnLvp95PGq+dV1i5zUXiVkHMVXLp
 foU=
X-SBRS: 2.7
X-MesageID: 2588787
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2588787"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:04 +0100
Message-ID: <20190704144233.27968-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new entry
 point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbmV3IGVudHJ5IHBvaW50IGZvciBYZW4gUFZIIHRoYXQgZW50ZXIgZGlyZWN0bHkgaW4g
MzJiaXRzLgoKSW5mb3JtYXRpb24gb24gdGhlIGV4cGVjdGVkIHN0YXRlIG9mIHRoZSBtYWNoaW5l
IHdoZW4gdGhpcyBlbnRyeSBwb2ludAppcyB1c2VkIGNhbiBiZSBmb3VuZCBhdDoKaHR0cHM6Ly94
ZW5iaXRzLnhlbnByb2plY3Qub3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbAoKUmVmOiBo
dHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoK
Tm90ZXM6CiAgICB2MzoKICAgIC0gcmViYXNlZCwgU1BEWAogICAgLSByZW1vdmUgYGNsaScgYXMg
dmlhIFBWSCB0aGUgaW50ZXJydXB0cyBhcmUgZ3VhcmFudGVlZCB0byBiZSBvZmYKICAgIC0gcmV3
cml0ZSBzb21lIGNvbW1lbnRzCgogLi4uL1hlblJlc2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JW
dGYwLmFzbSAgIHwgODEgKysrKysrKysrKysrKysrKysrKwogT3ZtZlBrZy9YZW5SZXNldFZlY3Rv
ci9JYTMyL1hlblBWSE1haW4uYXNtICAgIHwgNDkgKysrKysrKysrKysKIE92bWZQa2cvWGVuUmVz
ZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwg
MTMxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL1hlblJlc2V0VmVj
dG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbQogY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cv
WGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQoKZGlmZiAtLWdpdCBhL092bWZQa2cv
WGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtIGIvT3ZtZlBrZy9YZW5SZXNl
dFZlY3Rvci9JYTE2L1Jlc2V0VmVjdG9yVnRmMC5hc20KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uOTU4MTk1YmM1ZQotLS0gL2Rldi9udWxsCisrKyBiL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCkBAIC0wLDAgKzEsODEgQEAKKzst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCis7IEBmaWxlDQorOyBGaXJzdCBjb2RlIGV4ZWN1dGVkIGJ5
IHByb2Nlc3NvciBhZnRlciByZXNldHRpbmcuDQorOw0KKzsgQ29weXJpZ2h0IChjKSAyMDA4IC0g
MjAxNCwgSW50ZWwgQ29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuPEJSPg0KKzsgQ29w
eXJpZ2h0IChjKSAyMDE5LCBDaXRyaXggU3lzdGVtcywgSW5jLg0KKzsNCis7IFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UtUGF0ZW50DQorOw0KKzstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCisNCitCSVRTICAgIDE2DQorDQorQUxJR04gICAxNg0KKw0KKzsNCis7IFBhZCB0aGUg
aW1hZ2Ugc2l6ZSB0byA0ayB3aGVuIHBhZ2UgdGFibGVzIGFyZSBpbiBWVEYwDQorOw0KKzsgSWYg
dGhlIFZURjAgaW1hZ2UgaGFzIHBhZ2UgdGFibGVzIGJ1aWx0IGluLCB0aGVuIHdlIG5lZWQgdG8g
bWFrZQ0KKzsgc3VyZSB0aGUgZW5kIG9mIFZURjAgaXMgNGsgYWJvdmUgd2hlcmUgdGhlIHBhZ2Ug
dGFibGVzIGVuZC4NCis7DQorOyBUaGlzIGlzIHJlcXVpcmVkIHNvIHRoZSBwYWdlIHRhYmxlcyB3
aWxsIGJlIDRrIGFsaWduZWQgd2hlbiBWVEYwIGlzDQorOyBsb2NhdGVkIGp1c3QgYmVsb3cgMHgx
MDAwMDAwMDAgKDRHQikgaW4gdGhlIGZpcm13YXJlIGRldmljZS4NCis7DQorJWlmZGVmIEFMSUdO
X1RPUF9UT180S19GT1JfUEFHSU5HDQorICAgIFRJTUVTICgweDEwMDAgLSAoJCAtIEVuZE9mUGFn
ZVRhYmxlcykgLSAoZm91ckdpZ2FieXRlcyAtIHhlblBWSEVudHJ5UG9pbnQpKSBEQiAwDQorJWVu
ZGlmDQorDQorQklUUyAgICAzMg0KK3hlblBWSEVudHJ5UG9pbnQ6DQorOw0KKzsgRW50cnkgcG9p
bnQgdG8gdXNlIHdoZW4gcnVubmluZyBhcyBhIFhlbiBQVkggZ3Vlc3QuICgweGZmZmZmZmQwKQ0K
KzsNCis7IERlc2NyaXB0aW9uIG9mIHRoZSBleHBlY3RlZCBzdGF0ZSBvZiB0aGUgbWFjaGluZSB3
aGVuIHRoaXMgZW50cnkgcG9pbnQgaXMNCis7IHVzZWQgY2FuIGJlIGZvdW5kIGF0Og0KKzsgaHR0
cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbA0K
KzsNCisgICAgam1wICAgICB4ZW5QVkhNYWluDQorDQorQklUUyAgICAxNg0KK0FMSUdOICAgMTYN
CisNCithcHBsaWNhdGlvblByb2Nlc3NvckVudHJ5UG9pbnQ6DQorOw0KKzsgQXBwbGljYXRpb24g
UHJvY2Vzc29ycyBlbnRyeSBwb2ludA0KKzsNCis7IEdlbkZ2IGdlbmVyYXRlcyBjb2RlIGFsaWdu
ZWQgb24gYSA0ayBib3VuZGFyeSB3aGljaCB3aWxsIGp1bXAgdG8gdGhpcw0KKzsgbG9jYXRpb24u
ICAoMHhmZmZmZmZlMCkgIFRoaXMgYWxsb3dzIHRoZSBMb2NhbCBBUElDIFN0YXJ0dXAgSVBJIHRv
IGJlDQorOyB1c2VkIHRvIHdha2UgdXAgdGhlIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMuDQorOw0K
KyAgICBqbXAgICAgIEVhcmx5QXBJbml0UmVhbDE2DQorDQorQUxJR04gICA4DQorDQorICAgIERE
ICAgICAgMA0KKw0KKzsNCis7IFRoZSBWVEYgc2lnbmF0dXJlDQorOw0KKzsgVlRGLTAgbWVhbnMg
dGhhdCB0aGUgVlRGIChWb2x1bWUgVG9wIEZpbGUpIGNvZGUgZG9lcyBub3QgcmVxdWlyZQ0KKzsg
YW55IGZpeHVwcy4NCis7DQordnRmU2lnbmF0dXJlOg0KKyAgICBEQiAgICAgICdWJywgJ1QnLCAn
RicsIDANCisNCitBTElHTiAgIDE2DQorDQorcmVzZXRWZWN0b3I6DQorOw0KKzsgUmVzZXQgVmVj
dG9yDQorOw0KKzsgVGhpcyBpcyB3aGVyZSB0aGUgcHJvY2Vzc29yIHdpbGwgYmVnaW4gZXhlY3V0
aW9uDQorOw0KKyAgICBub3ANCisgICAgbm9wDQorICAgIGptcCAgICAgRWFybHlCc3BJbml0UmVh
bDE2DQorDQorQUxJR04gICAxNg0KKw0KK2ZvdXJHaWdhYnl0ZXM6DQorDQpkaWZmIC0tZ2l0IGEv
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtIGIvT3ZtZlBrZy9YZW5S
ZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjJhMTdmZWQ1MmYKLS0tIC9kZXYvbnVsbAorKysgYi9Pdm1mUGtnL1hlblJl
c2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KQEAgLTAsMCArMSw0OSBAQAorOy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KKzsgQGZpbGUNCis7IEFuIGVudHJ5IHBvaW50IHVzZSBieSBYZW4gd2hl
biBhIGd1ZXN0IGlzIHN0YXJ0ZWQgaW4gUFZIIG1vZGUuDQorOw0KKzsgQ29weXJpZ2h0IChjKSAy
MDE5LCBDaXRyaXggU3lzdGVtcywgSW5jLg0KKzsNCis7IFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBCU0QtMi1DbGF1c2UtUGF0ZW50DQorOw0KKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCisNCitC
SVRTICAgIDMyDQorDQoreGVuUFZITWFpbjoNCisgICAgOw0KKyAgICA7ICdCUCcgdG8gaW5kaWNh
dGUgYm9vdC1zdHJhcCBwcm9jZXNzb3INCisgICAgOw0KKyAgICBtb3YgICAgIGRpLCAnQlAnDQor
DQorICAgIDsNCisgICAgOyBFU1Agd2lsbCBiZSB1c2VkIGFzIGluaXRpYWwgdmFsdWUgb2YgdGhl
IEVBWCByZWdpc3Rlcg0KKyAgICA7IGluIE1haW4uYXNtDQorICAgIDsNCisgICAgeG9yICAgICBl
c3AsIGVzcA0KKw0KKyAgICBtb3YgICAgIGVieCwgQUREUl9PRihnZHRyKQ0KKyAgICBsZ2R0ICAg
IFtlYnhdDQorDQorICAgIG1vdiAgICAgZWF4LCBTRUNfREVGQVVMVF9DUjANCisgICAgbW92ICAg
ICBjcjAsIGVheA0KKw0KKyAgICBqbXAgICAgIExJTkVBUl9DT0RFX1NFTDpBRERSX09GKC5qbXBU
b05ld0NvZGVTZWcpDQorLmptcFRvTmV3Q29kZVNlZzoNCisNCisgICAgbW92ICAgICBlYXgsIFNF
Q19ERUZBVUxUX0NSNA0KKyAgICBtb3YgICAgIGNyNCwgZWF4DQorDQorICAgIG1vdiAgICAgYXgs
IExJTkVBUl9TRUwNCisgICAgbW92ICAgICBkcywgYXgNCisgICAgbW92ICAgICBlcywgYXgNCisg
ICAgbW92ICAgICBmcywgYXgNCisgICAgbW92ICAgICBncywgYXgNCisgICAgbW92ICAgICBzcywg
YXgNCisNCisgICAgOw0KKyAgICA7IEp1bXAgdG8gdGhlIG1haW4gcm91dGluZSBvZiB0aGUgcHJl
LVNFQyBjb2RlDQorICAgIDsgc2tpcGluZyB0aGUgMTYtYml0IHBhcnQgb2YgdGhlIHJvdXRpbmUg
YW5kDQorICAgIDsgaW50byB0aGUgMzItYml0IGZsYXQgbW9kZSBwYXJ0DQorICAgIDsNCisgICAg
T25lVGltZUNhbGxSZXQgVHJhbnNpdGlvbkZyb21SZWFsMTZUbzMyQml0RmxhdA0KZGlmZiAtLWdp
dCBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIgYi9Pdm1mUGtn
L1hlblJlc2V0VmVjdG9yL1hlblJlc2V0VmVjdG9yLm5hc21iCmluZGV4IDg5YTRiMDhiYzMuLjBk
YmM0ZjJjMWQgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0
b3IubmFzbWIKKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5uYXNt
YgpAQCAtNjMsNiArNjMsNyBAQAogJWluY2x1ZGUgIklhMTYvSW5pdDE2LmFzbSINCiANCiAlaW5j
bHVkZSAiTWFpbi5hc20iDQorJWluY2x1ZGUgIklhMzIvWGVuUFZITWFpbi5hc20iDQogDQogJWlu
Y2x1ZGUgIklhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbSINCiANCi0tIApBbnRob255IFBFUkFSRAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
