Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB031230D1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:49:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihF3d-0003Tt-Hy; Tue, 17 Dec 2019 15:46:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6FKB=2H=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ihF3b-0003Tk-VO
 for xen-devel@lists.xen.org; Tue, 17 Dec 2019 15:46:43 +0000
X-Inumbo-ID: 6bbe5e68-20e4-11ea-8f00-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bbe5e68-20e4-11ea-8f00-12813bfff9fa;
 Tue, 17 Dec 2019 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576597603;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=JFlCHNsOyIZjydDC6J9E8GuCFd5W5QfHmY0eOY2YgDo=;
 b=gHesHr3ivkoNNlsoCJn18tL88P/pHrs1ZkPT0d+ekQfa0J3ymqXzZQzP
 Z/GivaZM4fA0B5XSxJhJi00qsbH5zY74ffJvQvTg9oLC49BiBb07NArZn
 7ioz2+aSy18yzHDeIGS7JzIk45OJ4L438qrzg2K5NjAu/AtCUKPGl68gg 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RzfMFzTjI8lKoVyeINpgANBXFtdOUWZBviiTLaDSXt6QRKeby0Dku0cajZxFAIzBgcqKxVjzNK
 Bw5P4kbsuhgqvW+DzAOQSVzYEjRArtxTuQ6RDyma14jQnpLknwb+wZ1FIlHENetEoa4B/mfSpt
 VyuaaPuufPfcejJg2Xsb8bN1FVlq2kGwdWPyR7SSmBQ7ArjRT8VYOsgmPySQah7F/XZpprVVYr
 QHV542SfNRGx3B5H+MNLdvt57noNiee8VMNXyz8Nxsbkbx9/XvlkAeVyYwSFrey4UGyei7rbHy
 yG4=
X-SBRS: 2.7
X-MesageID: 9826433
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,326,1571716800"; 
   d="scan'208";a="9826433"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Tue, 17 Dec 2019 15:46:25 +0000
Message-ID: <20191217154625.31561-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGlkZSB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uIHRoYXQgY2FuIGhlbHAgaWRlbnRpZnkgdGhl
IHJ1bm5pbmcgWGVuCmJpbmFyeSB2ZXJzaW9uOgoKICAgIFhFTlZFUl9leHRyYXZlcnNpb24KICAg
IFhFTlZFUl9jb21waWxlX2luZm8KICAgIFhFTlZFUl9jYXBhYmlsaXRpZXMKICAgIFhFTlZFUl9j
aGFuZ2VzZXQKICAgIFhFTlZFUl9jb21tYW5kbGluZQogICAgWEVOVkVSX2J1aWxkX2lkCgpSZXR1
cm4gYSBtb3JlIGN1c3RvbWVyIGZyaWVuZGx5IGVtcHR5IHN0cmluZyBpbnN0ZWFkIG9mICI8ZGVu
aWVkPiIKd2hpY2ggd291bGQgYmUgc2hvd24gaW4gdG9vbHMgbGlrZSBkbWlkZWNvZGUuCgpCdXQg
YWxsb3cgZ3Vlc3RzIHRvIHNlZSB0aGlzIGluZm9ybWF0aW9uIGluIERlYnVnIGJ1aWxkcyBvZiBY
ZW4uCgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5j
b20+Ci0tLQpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ0M6IEtvbnJhZCBS
emVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkND
OiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4KLS0tCiB4ZW4vY29tbW9u
L3ZlcnNpb24uYyAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS94c20vZHVtbXkuaCB8IDE1ICsrKysr
KysrKystLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vdmVyc2lvbi5jIGIveGVuL2NvbW1vbi92ZXJz
aW9uLmMKaW5kZXggOTM3ZWIxMjgxYy4uY2M2MjFhYjc2YSAxMDA2NDQKLS0tIGEveGVuL2NvbW1v
bi92ZXJzaW9uLmMKKysrIGIveGVuL2NvbW1vbi92ZXJzaW9uLmMKQEAgLTY3LDcgKzY3LDcgQEAg
Y29uc3QgY2hhciAqeGVuX2Jhbm5lcih2b2lkKQogCiBjb25zdCBjaGFyICp4ZW5fZGVueSh2b2lk
KQogewotICAgIHJldHVybiAiPGRlbmllZD4iOworICAgIHJldHVybiAiIjsKIH0KIAogc3RhdGlj
IGNvbnN0IHZvaWQgKmJ1aWxkX2lkX3AgX19yZWFkX21vc3RseTsKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hzbS9kdW1teS5oIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKaW5kZXggYjhlMTg1
ZTZmYS4uNGExYTFiZjJiZCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKKysr
IGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKQEAgLTc1MCwxNiArNzUwLDIxIEBAIHN0YXRpYyBY
U01fSU5MSU5FIGludCB4c21feGVuX3ZlcnNpb24gKFhTTV9ERUZBVUxUX0FSRyB1aW50MzJfdCBv
cCkKICAgICBjYXNlIFhFTlZFUl9nZXRfZmVhdHVyZXM6CiAgICAgICAgIC8qIFRoZXNlIHN1Yi1v
cHMgaWdub3JlIHRoZSBwZXJtaXNzaW9uIGNoZWNrcyBhbmQgcmV0dXJuIGRhdGEuICovCiAgICAg
ICAgIHJldHVybiAwOwotICAgIGNhc2UgWEVOVkVSX2V4dHJhdmVyc2lvbjoKLSAgICBjYXNlIFhF
TlZFUl9jb21waWxlX2luZm86Ci0gICAgY2FzZSBYRU5WRVJfY2FwYWJpbGl0aWVzOgotICAgIGNh
c2UgWEVOVkVSX2NoYW5nZXNldDoKICAgICBjYXNlIFhFTlZFUl9wYWdlc2l6ZToKICAgICBjYXNl
IFhFTlZFUl9ndWVzdF9oYW5kbGU6CiAgICAgICAgIC8qIFRoZXNlIE1VU1QgYWx3YXlzIGJlIGFj
Y2Vzc2libGUgdG8gYW55IGd1ZXN0IGJ5IGRlZmF1bHQuICovCiAgICAgICAgIHJldHVybiB4c21f
ZGVmYXVsdF9hY3Rpb24oWFNNX0hPT0ssIGN1cnJlbnQtPmRvbWFpbiwgTlVMTCk7CisKKyAgICBj
YXNlIFhFTlZFUl9leHRyYXZlcnNpb246CisgICAgY2FzZSBYRU5WRVJfY29tcGlsZV9pbmZvOgor
ICAgIGNhc2UgWEVOVkVSX2NhcGFiaWxpdGllczoKKyAgICBjYXNlIFhFTlZFUl9jaGFuZ2VzZXQ6
CisgICAgY2FzZSBYRU5WRVJfY29tbWFuZGxpbmU6CisgICAgY2FzZSBYRU5WRVJfYnVpbGRfaWQ6
CiAgICAgZGVmYXVsdDoKLSAgICAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fUFJJ
ViwgY3VycmVudC0+ZG9tYWluLCBOVUxMKTsKKyAgICAgICAgLyogSGlkZSBpbmZvcm1hdGlvbiBm
cm9tIGd1ZXN0cyBvbmx5IGluIFJlbGVhc2UgYnVpbGRzLiAqLworICAgICAgICByZXR1cm4geHNt
X2RlZmF1bHRfYWN0aW9uKGRlYnVnX2J1aWxkKCkgPyBYU01fSE9PSyA6IFhTTV9QUklWLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN1cnJlbnQtPmRvbWFpbiwgTlVMTCk7CiAg
ICAgfQogfQogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
