Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE1278FAA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:43:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs7km-00084C-TQ; Mon, 29 Jul 2019 15:40:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs7kl-00082a-BE
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:39:59 +0000
X-Inumbo-ID: 1e35b952-b217-11e9-89f5-a3fbc4035de1
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e35b952-b217-11e9-89f5-a3fbc4035de1;
 Mon, 29 Jul 2019 15:39:57 +0000 (UTC)
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
IronPort-SDR: kKQW3JKMqTC3M3dmXxvhx2uWW1KD10vDi0tCr9RCD2vcf5aFQ1iL8abf2hCN2aDFonCDi64Fb9
 BIUGMsPjhrCPLrqyOq97tLcnEjoiLF0FEibUSi0ONrO7Nik/Ksij103VRGnM6oilQa81i727b9
 vSzzFMIa37q/pU+1pSHKNBSwbRzBCCX3bfy2O9UT+yYsm4tjZ8lI0U/B/tX0S3S8mGn97wvHN3
 RuYrRrsb+2ya0wIKlUSmO8HTBOFa8FcBare3Jy7N3KZuC83QEbwWCS2jIYrA7CY0ZOUks3CR2R
 maI=
X-SBRS: 2.7
X-MesageID: 3564634
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3564634"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:17 +0100
Message-ID: <20190729153944.24239-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 08/35] OvmfPkg/XenResetVector: Allow
 jumpstart from either hvmloader or PVH
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

VGhpcyBwYXRjaCBhbGxvd3MgdGhlIFJlc2V0VmVjdG9yIHRvIGJlIHJ1biBpbmRlbnBlbmRlbnRs
eSBmcm9tIGJ1aWxkCnRpbWUgYWRkcmVzc2VzLgoKVGhlIGdvYWwgb2YgdGhlIHBhdGNoIGlzIHRv
IGF2b2lkIGhhdmluZyB0byBjcmVhdGUgUkFNIGp1c3QgYmVsb3cgNEcKd2hlbiBjcmVhdGluZyBh
IFhlbiBQVkggZ3Vlc3Qgd2hpbGUgYmVpbmcgY29tcGF0aWJsZSB3aXRoIHRoZSB3YXkKaHZtbG9h
ZGVyIGN1cnJlbnRseSBsb2FkIE9WTUYsIGp1c3QgYmVsb3cgNEcuCgpPbmx5IHRoZSBuZXcgUFZI
IGVudHJ5IHBvaW50IHdpbGwgZG8gdGhlIGNhbGN1bGF0aW9uLgoKVGhlIFJlc2V0VmVjdG9yIHdp
bGwgZmlndXJlIG91dCBpdHMgY3VycmVudCBydW5uaW5nIGFkZHJlc3MgYnkgY3JlYXRpbmcKYSB0
ZW1wb3Jhcnkgc3RhY2ssIG1ha2UgYSBjYWxsIGFuZCBjYWxjdWxhdGUgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUKYnVpbGQgdGltZSBhZGRyZXNzIGFuZCB0aGUgYWRkcmVzcyBhdCBydW4gdGlt
ZS4KClRoaXMgcGF0Y2ggY29waWVzIGFuZCBtYWtlIHRoZSBuZWNlc3NhcnkgbW9kaWZpY2F0aW9u
IHRvIHNvbWUgb3RoZXIgYXNtCmZpbGVzOgotIGNvcHkgb2YgVWVmaUNwdVBrZy8uLi4vRmxhdDMy
VG9GbGF0NjQuYXNtOgogIEFsbG93IFRyYW5zaXRpb24zMkZsYXRUbzY0RmxhdCB0byBiZSBydW4g
ZnJvbSBhbnl3aGVyZSBpbiBtZW1vcnkKLSBjb3B5IG9mIFVlZmlDcHVQa2cvLi4vU2VhcmNoRm9y
QmZ2QmFzZS5hc206CiAgQWRkIGEgZXh0cmEgcGFyYW1ldGVyIHRvIGluZGljYXRlIHdoZXJlIHRv
IHN0YXJ0IHRoZSBzZWFyY2ggZm9yIHRoZQogIGJvb3QgZmlybXdhcmUgdm9sdW1lLgoKUmVmOiBo
dHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVk
LW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFja2Vk
LWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgogICAgdjM6
CiAgICAtIHJlYmFzZWQsIFNQRFgKICAgIC0gZml4IGNvbW1pdCBtZXNzYWdlCgogLi4uL1hlblJl
c2V0VmVjdG9yL0lhMTYvUmVhbDE2VG9GbGF0MzIuYXNtICAgIHwgIDMgKwogLi4uL1hlblJlc2V0
VmVjdG9yL0lhMzIvRmxhdDMyVG9GbGF0NjQuYXNtICAgIHwgNjggKysrKysrKysrKysrKysrCiAu
Li4vWGVuUmVzZXRWZWN0b3IvSWEzMi9TZWFyY2hGb3JCZnZCYXNlLmFzbSAgfCA4NyArKysrKysr
KysrKysrKysrKysrCiBPdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20g
ICAgfCA0MyArKysrKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTk0IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9J
YTMyL0ZsYXQzMlRvRmxhdDY0LmFzbQogY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvWGVuUmVz
ZXRWZWN0b3IvSWEzMi9TZWFyY2hGb3JCZnZCYXNlLmFzbQoKZGlmZiAtLWdpdCBhL092bWZQa2cv
WGVuUmVzZXRWZWN0b3IvSWExNi9SZWFsMTZUb0ZsYXQzMi5hc20gYi9Pdm1mUGtnL1hlblJlc2V0
VmVjdG9yL0lhMTYvUmVhbDE2VG9GbGF0MzIuYXNtCmluZGV4IDVjMzI5YmZhZWEuLjM2ZWE3NGY3
ZmUgMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZWFsMTZUb0ZsYXQz
Mi5hc20KKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTE2L1JlYWwxNlRvRmxhdDMyLmFz
bQpAQCAtNTQsNiArNTQsOSBAQCBqdW1wVG8zMkJpdEFuZExhbmRIZXJlOgogICAgIG1vdiAgICAg
Z3MsIGF4DQogICAgIG1vdiAgICAgc3MsIGF4DQogDQorICAgIDsgcGFyYW1ldGVyIGZvciBGbGF0
MzJTZWFyY2hGb3JCZnZCYXNlDQorICAgIHhvciAgICAgZWF4LCBlYXggOyBTdGFydCBzZWFyY2hp
bmcgZnJvbSB0b3Agb2YgNEdCIGZvciBCZnZCYXNlDQorDQogICAgIE9uZVRpbWVDYWxsUmV0IFRy
YW5zaXRpb25Gcm9tUmVhbDE2VG8zMkJpdEZsYXQNCiANCiBBTElHTiAgIDINCmRpZmYgLS1naXQg
YS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvRmxhdDMyVG9GbGF0NjQuYXNtIGIvT3ZtZlBr
Zy9YZW5SZXNldFZlY3Rvci9JYTMyL0ZsYXQzMlRvRmxhdDY0LmFzbQpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi42NjFhOGU3MDI4Ci0tLSAvZGV2L251bGwKKysrIGIvT3Zt
ZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL0ZsYXQzMlRvRmxhdDY0LmFzbQpAQCAtMCwwICsxLDY4
IEBACis7LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQorOyBAZmlsZQ0KKzsgVHJhbnNpdGlvbiBmcm9t
IDMyIGJpdCBmbGF0IHByb3RlY3RlZCBtb2RlIGludG8gNjQgYml0IGZsYXQgcHJvdGVjdGVkIG1v
ZGUNCis7DQorOyBDb3B5cmlnaHQgKGMpIDIwMDggLSAyMDE4LCBJbnRlbCBDb3Jwb3JhdGlvbi4g
QWxsIHJpZ2h0cyByZXNlcnZlZC48QlI+DQorOyBDb3B5cmlnaHQgKGMpIDIwMTksIENpdHJpeCBT
eXN0ZW1zLCBJbmMuDQorOw0KKzsgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVz
ZS1QYXRlbnQNCis7DQorOy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKw0KK0JJVFMgICAgMzINCisN
Cis7DQorOyBNb2RpZmllZDogIEVBWCwgRUJYLCBFQ1gsIEVEWCwgRVNQDQorOw0KK1RyYW5zaXRp
b24zMkZsYXRUbzY0RmxhdDoNCisNCisgICAgT25lVGltZUNhbGwgU2V0Q3IzRm9yUGFnZVRhYmxl
czY0DQorDQorICAgIG1vdiAgICAgZWF4LCBjcjQNCisgICAgYnRzICAgICBlYXgsIDUgICAgICAg
ICAgICAgICAgICAgICAgOyBlbmFibGUgUEFFDQorICAgIG1vdiAgICAgY3I0LCBlYXgNCisNCisg
ICAgbW92ICAgICBlY3gsIDB4YzAwMDAwODANCisgICAgcmRtc3INCisgICAgYnRzICAgICBlYXgs
IDggICAgICAgICAgICAgICAgICAgICAgOyBzZXQgTE1FDQorICAgIHdybXNyDQorDQorICAgIG1v
diAgICAgZWF4LCBjcjANCisgICAgYnRzICAgICBlYXgsIDMxICAgICAgICAgICAgICAgICAgICAg
OyBzZXQgUEcNCisgICAgbW92ICAgICBjcjAsIGVheCAgICAgICAgICAgICAgICAgICAgOyBlbmFi
bGUgcGFnaW5nDQorDQorICAgIDsNCisgICAgOyBiYWNrdXAgRVNQDQorICAgIDsNCisgICAgbW92
ICAgICBlYngsIGVzcA0KKw0KKyAgICA7DQorICAgIDsgcmVjYWxjdWxhdGUgZGVsdGENCisgICAg
Ow0KKyAgICBtb3YgICAgIGVzcCwgUFZIX1NQQUNFKDE2KQ0KKyAgICBjYWxsICAgIC5kZWx0YQ0K
Ky5kZWx0YToNCisgICAgcG9wICAgICBlZHgNCisgICAgc3ViICAgICBlZHgsIEFERFJfT0YoLmRl
bHRhKQ0KKw0KKyAgICA7DQorICAgIDsgcHVzaCByZXR1cm4gYWRkciBhbmQgc2VnIHRvIHRoZSBz
dGFjaywgdGhlbiByZXR1cm4gZmFyDQorICAgIDsNCisgICAgcHVzaCAgICBkd29yZCBMSU5FQVJf
Q09ERTY0X1NFTA0KKyAgICBtb3YgICAgIGVheCwgQUREUl9PRihqdW1wVG82NEJpdEFuZExhbmRI
ZXJlKQ0KKyAgICBhZGQgICAgIGVheCwgZWR4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA7
IGFkZCBkZWx0YQ0KKyAgICBwdXNoICAgIGVheA0KKyAgICByZXRmDQorDQorQklUUyAgICA2NA0K
K2p1bXBUbzY0Qml0QW5kTGFuZEhlcmU6DQorDQorICAgIDsNCisgICAgOyByZXN0b3JlIEVTUA0K
KyAgICA7DQorICAgIG1vdiAgICAgZXNwLCBlYngNCisNCisgICAgZGVidWdTaG93UG9zdENvZGUg
UE9TVENPREVfNjRCSVRfTU9ERQ0KKw0KKyAgICBPbmVUaW1lQ2FsbFJldCBUcmFuc2l0aW9uMzJG
bGF0VG82NEZsYXQNCisNCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIv
U2VhcmNoRm9yQmZ2QmFzZS5hc20gYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvU2VhcmNo
Rm9yQmZ2QmFzZS5hc20KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTkw
Mzg5YzQ2ZgotLS0gL2Rldi9udWxsCisrKyBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9T
ZWFyY2hGb3JCZnZCYXNlLmFzbQpAQCAtMCwwICsxLDg3IEBACis7LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQorOyBAZmlsZQ0KKzsgU2VhcmNoIGZvciB0aGUgQm9vdCBGaXJtd2FyZSBWb2x1bWUgKEJG
VikgYmFzZSBhZGRyZXNzDQorOw0KKzsgQ29weXJpZ2h0IChjKSAyMDA4IC0gMjAwOSwgSW50ZWwg
Q29ycG9yYXRpb24uIEFsbCByaWdodHMgcmVzZXJ2ZWQuPEJSPg0KKzsgQ29weXJpZ2h0IChjKSAy
MDE5LCBDaXRyaXggU3lzdGVtcywgSW5jLg0KKzsNCis7IFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBCU0QtMi1DbGF1c2UtUGF0ZW50DQorOw0KKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCisNCis7
I2RlZmluZSBFRklfRklSTVdBUkVfRklMRV9TWVNURU0yX0dVSUQgXA0KKzsgIHsgMHg4YzhjZTU3
OCwgMHg4YTNkLCAweDRmMWMsIHsgMHg5OSwgMHgzNSwgMHg4OSwgMHg2MSwgMHg4NSwgMHhjMywg
MHgyZCwgMHhkMyB9IH0NCislZGVmaW5lIEZGU19HVUlEX0RXT1JEMCAweDhjOGNlNTc4DQorJWRl
ZmluZSBGRlNfR1VJRF9EV09SRDEgMHg0ZjFjOGEzZA0KKyVkZWZpbmUgRkZTX0dVSURfRFdPUkQy
IDB4NjE4OTM1OTkNCislZGVmaW5lIEZGU19HVUlEX0RXT1JEMyAweGQzMmRjMzg1DQorDQorQklU
UyAgICAzMg0KKw0KKzsNCis7IE1vZGlmaWVkOiAgRUFYLCBFQlgsIEVDWA0KKzsgUHJlc2VydmVk
OiBFREksIEVTUA0KKzsNCis7IEBwYXJhbVtpbl0gICBFQVggIFN0YXJ0IHNlYXJjaCBmcm9tIGhl
cmUNCis7IEBwYXJhbVtvdXRdICBFQlAgIEFkZHJlc3Mgb2YgQm9vdCBGaXJtd2FyZSBWb2x1bWUg
KEJGVikNCis7DQorRmxhdDMyU2VhcmNoRm9yQmZ2QmFzZToNCisNCisgICAgbW92ICAgICBlY3gs
IGVheA0KK3NlYXJjaGluZ0ZvckJmdkhlYWRlckxvb3A6DQorICAgIDsNCisgICAgOyBXZSBjaGVj
ayBmb3IgYSBmaXJtd2FyZSB2b2x1bWUgYXQgZXZlcnkgNEtCIGFkZHJlc3MgaW4gdGhlIDE2TUIN
CisgICAgOyBqdXN0IGJlbG93IHdoZXJlIHdlIHN0YXJ0ZWQsIEVDWC4NCisgICAgOw0KKyAgICBz
dWIgICAgIGVheCwgMHgxMDAwDQorICAgIG1vdiAgICAgZWJ4LCBlY3gNCisgICAgc3ViICAgICBl
YngsIGVheA0KKyAgICBjbXAgICAgIGVieCwgMHgwMTAwMDAwMA0KKyAgICA7IGlmIEVDWC1FQVgg
PiAxNk1COyBqdW1wIG5vdGZvdW5kDQorICAgIGphICAgICAgc2VhcmNoZWRGb3JCZnZIZWFkZXJC
dXROb3RGb3VuZA0KKw0KKyAgICA7DQorICAgIDsgQ2hlY2sgRkZTIEdVSUQNCisgICAgOw0KKyAg
ICBjbXAgICAgIGR3b3JkIFtlYXggKyAweDEwXSwgRkZTX0dVSURfRFdPUkQwDQorICAgIGpuZSAg
ICAgc2VhcmNoaW5nRm9yQmZ2SGVhZGVyTG9vcA0KKyAgICBjbXAgICAgIGR3b3JkIFtlYXggKyAw
eDE0XSwgRkZTX0dVSURfRFdPUkQxDQorICAgIGpuZSAgICAgc2VhcmNoaW5nRm9yQmZ2SGVhZGVy
TG9vcA0KKyAgICBjbXAgICAgIGR3b3JkIFtlYXggKyAweDE4XSwgRkZTX0dVSURfRFdPUkQyDQor
ICAgIGpuZSAgICAgc2VhcmNoaW5nRm9yQmZ2SGVhZGVyTG9vcA0KKyAgICBjbXAgICAgIGR3b3Jk
IFtlYXggKyAweDFjXSwgRkZTX0dVSURfRFdPUkQzDQorICAgIGpuZSAgICAgc2VhcmNoaW5nRm9y
QmZ2SGVhZGVyTG9vcA0KKw0KKyAgICA7DQorICAgIDsgQ2hlY2sgRlYgTGVuZ3RoDQorICAgIDsN
CisgICAgY21wICAgICBkd29yZCBbZWF4ICsgMHgyNF0sIDANCisgICAgam5lICAgICBzZWFyY2hp
bmdGb3JCZnZIZWFkZXJMb29wDQorICAgIG1vdiAgICAgZWJ4LCBlYXgNCisgICAgYWRkICAgICBl
YngsIGR3b3JkIFtlYXggKyAweDIwXQ0KKyAgICBjbXAgICAgIGVieCwgZWN4DQorICAgIGpueiAg
ICAgc2VhcmNoaW5nRm9yQmZ2SGVhZGVyTG9vcA0KKw0KKyAgICBqbXAgICAgIHNlYXJjaGVkRm9y
QmZ2SGVhZGVyQW5kSXRXYXNGb3VuZA0KKw0KK3NlYXJjaGVkRm9yQmZ2SGVhZGVyQnV0Tm90Rm91
bmQ6DQorICAgIDsNCisgICAgOyBIYW5nIGlmIHRoZSBTRUMgZW50cnkgcG9pbnQgd2FzIG5vdCBm
b3VuZA0KKyAgICA7DQorICAgIGRlYnVnU2hvd1Bvc3RDb2RlIFBPU1RDT0RFX0JGVl9OT1RfRk9V
TkQNCisNCisgICAgOw0KKyAgICA7IDB4YmZiZmJmYmYgaW4gdGhlIEVBWCAmIEVCUCByZWdpc3Rl
cnMgaGVscHMgc2lnbmFsIHdoYXQgZmFpbGVkDQorICAgIDsgZm9yIGRlYnVnZ2luZyBwdXJwb3Nl
cy4NCisgICAgOw0KKyAgICBtb3YgICAgIGVheCwgMHhCRkJGQkZCRg0KKyAgICBtb3YgICAgIGVi
cCwgZWF4DQorICAgIGptcCAgICAgJA0KKw0KK3NlYXJjaGVkRm9yQmZ2SGVhZGVyQW5kSXRXYXNG
b3VuZDoNCisgICAgbW92ICAgICBlYnAsIGVheA0KKw0KKyAgICBkZWJ1Z1Nob3dQb3N0Q29kZSBQ
T1NUQ09ERV9CRlZfRk9VTkQNCisNCisgICAgT25lVGltZUNhbGxSZXQgRmxhdDMyU2VhcmNoRm9y
QmZ2QmFzZQ0KKw0KZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5Q
VkhNYWluLmFzbSBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQpp
bmRleCBmNDJkZjNkYmEyLi4yZGYwZjEyZTE4IDEwMDY0NAotLS0gYS9Pdm1mUGtnL1hlblJlc2V0
VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9J
YTMyL1hlblBWSE1haW4uYXNtCkBAIC0xNiwyNSArMTYsNDIgQEAgeGVuUFZITWFpbjoKICAgICA7
DQogICAgIG1vdiAgICAgZGksICdCUCcNCiANCi0gICAgOw0KLSAgICA7IEVTUCB3aWxsIGJlIHVz
ZWQgYXMgaW5pdGlhbCB2YWx1ZSBvZiB0aGUgRUFYIHJlZ2lzdGVyDQotICAgIDsgaW4gTWFpbi5h
c20NCi0gICAgOw0KLSAgICB4b3IgICAgIGVzcCwgZXNwDQotDQogICAgIDsNCiAgICAgOyBTdG9y
ZSAiU3RhcnQgb2YgZGF5IiBzdHJ1Y3QgcG9pbnRlciBmb3IgbGF0ZXIgdXNlDQogICAgIDsNCiAg
ICAgbW92ICAgICBkd29yZFtQVkhfU1BBQ0UgKDApXSwgZWJ4DQogICAgIG1vdiAgICAgZHdvcmRb
UFZIX1NQQUNFICg0KV0sICdYUFZIJw0KIA0KKyAgICA7DQorICAgIDsgY2FsY3VsYXRlIGRlbHRh
IGJldHdlZW4gYnVpbGQtYWRkciBhbmQgcnVuIHBvc2l0aW9uDQorICAgIDsNCisgICAgbW92ICAg
ICBlc3AsIFBWSF9TUEFDRSgxNikgICAgICAgICAgOyBjcmVhdGUgYSB0ZW1wb3Jhcnkgc3RhY2sN
CisgICAgY2FsbCAgICAuZGVsdGENCisuZGVsdGE6DQorICAgIHBvcCAgICAgZWR4ICAgICAgICAg
ICAgICAgICAgICAgICAgIDsgZ2V0IGFkZHIgb2YgLmRlbHRhDQorICAgIHN1YiAgICAgZWR4LCBB
RERSX09GKC5kZWx0YSkgICAgICAgIDsgY2FsY3VsYXRlIGRlbHRhDQorDQorICAgIDsNCisgICAg
OyBGaW5kIGFkZHJlc3Mgb2YgR0RUIGFuZCBnZHRyIGFuZCBmaXggdGhlIGxhdGVyDQorICAgIDsN
CiAgICAgbW92ICAgICBlYngsIEFERFJfT0YoZ2R0cikNCisgICAgYWRkICAgICBlYngsIGVkeCAg
ICAgICAgICAgICAgICAgICAgOyBhZGQgZGVsdGEgZ2R0cg0KKyAgICBtb3YgICAgIGVheCwgQURE
Ul9PRihHRFRfQkFTRSkNCisgICAgYWRkICAgICBlYXgsIGVkeCAgICAgICAgICAgICAgICAgICAg
OyBhZGQgZGVsdGEgdG8gR0RUX0JBU0UNCisgICAgbW92ICAgICBkd29yZFtlYnggKyAyXSwgZWF4
ICAgICAgICAgOyBmaXggR0RUX0JBU0UgYWRkciBpbiBnZHRyDQogICAgIGxnZHQgICAgW2VieF0N
CiANCiAgICAgbW92ICAgICBlYXgsIFNFQ19ERUZBVUxUX0NSMA0KICAgICBtb3YgICAgIGNyMCwg
ZWF4DQogDQotICAgIGptcCAgICAgTElORUFSX0NPREVfU0VMOkFERFJfT0YoLmptcFRvTmV3Q29k
ZVNlZykNCisgICAgOw0KKyAgICA7IHB1c2ggcmV0dXJuIGFkZHIgdG8gdGhlIHN0YWNrLCB0aGVu
IHJldHVybiBmYXINCisgICAgOw0KKyAgICBwdXNoICAgIGR3b3JkIExJTkVBUl9DT0RFX1NFTCAg
ICAgICAgICA7IHNlZ21lbnQgdG8gc2VsZWN0DQorICAgIG1vdiAgICAgZWF4LCBBRERSX09GKC5q
bXBUb05ld0NvZGVTZWcpIDsgcmV0dXJuIGFkZHINCisgICAgYWRkICAgICBlYXgsIGVkeCAgICAg
ICAgICAgICAgICAgICAgICAgOyBhZGQgZGVsdGEgdG8gcmV0dXJuIGFkZHINCisgICAgcHVzaCAg
ICBlYXgNCisgICAgcmV0Zg0KIC5qbXBUb05ld0NvZGVTZWc6DQogDQogICAgIG1vdiAgICAgZWF4
LCBTRUNfREVGQVVMVF9DUjQNCkBAIC00Nyw2ICs2NCwxOCBAQCB4ZW5QVkhNYWluOgogICAgIG1v
diAgICAgZ3MsIGF4DQogICAgIG1vdiAgICAgc3MsIGF4DQogDQorICAgIDsNCisgICAgOyBFU1Ag
d2lsbCBiZSB1c2VkIGFzIGluaXRpYWwgdmFsdWUgb2YgdGhlIEVBWCByZWdpc3Rlcg0KKyAgICA7
IGluIE1haW4uYXNtDQorICAgIDsNCisgICAgeG9yICAgICBlc3AsIGVzcA0KKw0KKyAgICA7DQor
ICAgIDsgcGFyYW1ldGVyIGZvciBGbGF0MzJTZWFyY2hGb3JCZnZCYXNlDQorICAgIDsNCisgICAg
bW92ICAgICBlYXgsIEFERFJfT0YoZm91ckdpZ2FieXRlcykNCisgICAgYWRkICAgICBlYXgsIGVk
eCA7IGFkZCBkZWx0YQ0KKw0KICAgICA7DQogICAgIDsgSnVtcCB0byB0aGUgbWFpbiByb3V0aW5l
IG9mIHRoZSBwcmUtU0VDIGNvZGUNCiAgICAgOyBza2lwaW5nIHRoZSAxNi1iaXQgcGFydCBvZiB0
aGUgcm91dGluZSBhbmQNCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
