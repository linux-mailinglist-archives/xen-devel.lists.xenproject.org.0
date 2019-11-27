Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399810B2DF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzkn-0004Dm-8D; Wed, 27 Nov 2019 16:01:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZzkl-0004Dh-Mj
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:01:19 +0000
X-Inumbo-ID: 24d643c3-112f-11ea-a3b8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24d643c3-112f-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574870479;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vGoR7njbbykPr+XqCa+IXU0Hsk1l6YjIlNElaoNXbjo=;
 b=XLFWaNmWv9I0wNkJJ/O6BUB5krnHxBOfEZnrk1hvZTnOmiX/Gee0scGX
 sQ0F6M97VvX6ug3tF/ivLkfxUfR6YU86jwl61p7i5laAsVIm3oYHqpeTP
 bt1t744Lsl1pHRZaLlDpMO4vfc9Dte3UR7cA3A/F3HJskD4SfPtXWEi44 Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M9UszRuKnnczQOy7tEu0hnFKTbd2mBgsOJjrJdML4hpy8wFOB5tljEJ5YKeijaHmMEqaEnM6aV
 FPAvUD93nzFj091QnxfgDkchXt8YglzgcJCELG9V7rIsiOmG/TTIRKFm8+0/UFIl+7iV0n4oKk
 9iOLaAQV9KbZazRQ8pQ95E/9S1P8sg1iNSCdAgy3jNRMWrQvg1kxfRjVuNz/kdT0I3J4TcD3JS
 zim0jE70ILmxCZXbiyNhKfDSl4K56trjSMfZDYvPglt+91eTUkbjP5/RrQYZM2ZAXZKaEzCYnU
 CmM=
X-SBRS: 2.7
X-MesageID: 8908518
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,250,1571716800"; 
   d="scan'208";a="8908518"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 27 Nov 2019 17:01:08 +0100
Message-ID: <20191127160108.12490-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGl2ZS1wYXRjaGluZyByZXF1aXJlcyB1bmlxdWUgc3ltYm9scywgYW5kIHNhZGx5IHRoZSBjbGFu
ZyBidWlsZApnZW5lcmF0ZXMgYSBsb3Qgb2YgZHVwbGljYXRlIHN5bWJvbHM6CgpEdXBsaWNhdGUg
c3ltYm9sICdhc2lkLmMjZ2V0X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDMwMzJjMCAhPSBmZmZmODJk
MDgwMmUwZjUwKQpEdXBsaWNhdGUgc3ltYm9sICdhc2lkLmMjZ2V0X2NwdV9pbmZvX2Zyb21fc3Rh
Y2snIChmZmZmODJkMDgwMmUxMDgwICE9IGZmZmY4MmQwODAzMDMyZjApCkR1cGxpY2F0ZSBzeW1i
b2wgJ2F0cy5jI19fbGlzdF9hZGQnIChmZmZmODJkMDgwMjYwYTAwICE9IGZmZmY4MmQwODAyNjdj
NzApCkR1cGxpY2F0ZSBzeW1ib2wgJ2Jvb3QuYyNjb25zdGFudF90ZXN0X2JpdCcgKGZmZmY4MmQw
ODA0MGVhNjAgIT0gZmZmZjgyZDA4MDQzNzJmMCkKRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMj
Y2xlYXJfYml0JyAoZmZmZjgyZDA4MDMzMjQ0MCAhPSBmZmZmODJkMDgwMmQzM2IwKQpEdXBsaWNh
dGUgc3ltYm9sICdjb21tb24uYyNjb25zdGFudF90ZXN0X2JpdCcgKGZmZmY4MmQwODAzMzIzNDAg
IT0gZmZmZjgyZDA4MDJkMjIyMCkKRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjY3B1bWFza19j
aGVjaycgKGZmZmY4MmQwODAyZDMzNzAgIT0gZmZmZjgyZDA4MDMzN2I2MCkKRHVwbGljYXRlIHN5
bWJvbCAnY29tbW9uLmMjZ2V0X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDJkMjJiMCAhPSBmZmZmODJk
MDgwMzMxNTkwKQpEdXBsaWNhdGUgc3ltYm9sICdjb21tb24uYyNnZXRfY3B1X2luZm9fZnJvbV9z
dGFjaycgKGZmZmY4MmQwODAyZDMxYzAgIT0gZmZmZjgyZDA4MDMzNzRiMCkKRHVwbGljYXRlIHN5
bWJvbCAnY29tbW9uLmMjcGZuX3RvX3BkeCcgKGZmZmY4MmQwODAyZDMyNzAgIT0gZmZmZjgyZDA4
MDMzMWUwMCkKRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjdGVzdF9hbmRfc2V0X2JpdCcgKGZm
ZmY4MmQwODAyZDMzNjAgIT0gZmZmZjgyZDA4MDMzMjI1MCkKRHVwbGljYXRlIHN5bWJvbCAnY29t
bW9uLmMjdmFyaWFibGVfY2xlYXJfYml0JyAoZmZmZjgyZDA4MDJkMjI3MCAhPSBmZmZmODJkMDgw
MzM3YjUwKQpEdXBsaWNhdGUgc3ltYm9sICdjb21wYXQuYyNnZXRfY3B1X2luZm8nIChmZmZmODJk
MDgwMjZlYWIwICE9IGZmZmY4MmQwODAyMDA0NjApCkR1cGxpY2F0ZSBzeW1ib2wgJ2NvbXBhdC5j
I2dldF9jcHVfaW5mb19mcm9tX3N0YWNrJyAoZmZmZjgyZDA4MDI2ZWJkMCAhPSBmZmZmODJkMDgw
MjAwZjcwKQpEdXBsaWNhdGUgc3ltYm9sICdjcHVfaWRsZS5jI2dldF9jcHVfaW5mbycgKGZmZmY4
MmQwODAyY2NiMDAgIT0gZmZmZjgyZDA4MDM1ZmNjMCkKWy4uLl0KCkZvciB0aGUgdGltZSBiZWlu
ZyBkaXNhYmxlIGxpdmUtcGF0Y2hpbmcgd2hlbiBidWlsZGluZyB3aXRoIGNsYW5nLApzaW5jZSBk
dXBsaWNhdGUgc3ltYm9scyB3aWxsIHRyaWdnZXIgYSBidWlsZCBmYWlsdXJlIGJlY2F1c2UKRU5G
T1JDRV9VTklRVUVfU1lNQk9MUyBpcyBub3cgYWxzbyBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gY29u
anVuY3Rpb24Kd2l0aCBsaXZlLXBhdGNoaW5nLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSsO8cmdlbiBHcm/DnyA8amdyb3Nz
QHN1c2UuY29tPgotLS0KIENvbmZpZy5tayAgICAgICAgICB8IDIgKysKIHhlbi9jb21tb24vS2Nv
bmZpZyB8IDYgKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5tawppbmRleCBkOGY5MGQ3
NWIzLi4wMDlhYmRhMjI1IDEwMDY0NAotLS0gYS9Db25maWcubWsKKysrIGIvQ29uZmlnLm1rCkBA
IC0xNTcsNiArMTU3LDggQEAgaWZuZGVmIFhFTl9IQVNfQ0hFQ0tQT0xJQ1kKICAgICBleHBvcnQg
WEVOX0hBU19DSEVDS1BPTElDWQogZW5kaWYKIAorZXhwb3J0IFhFTl9CVUlMRF9XSVRIX0NMQU5H
ID0gJChjbGFuZykKKwogIyBhcy1pbnNuOiBDaGVjayB3aGV0aGVyIGFzc2VtYmxlciBzdXBwb3J0
cyBhbiBpbnN0cnVjdGlvbi4KICMgVXNhZ2U6IGNmbGFncy15ICs9ICQoY2FsbCBhcy1pbnNuLEND
IEZMQUdTLCJpbnNuIixvcHRpb24teWVzLG9wdGlvbi1ubykKIGFzLWluc24gPSAkKGlmICQoc2hl
bGwgZWNobyAndm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggJCgyKSApOyB9JyBcCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tjb25maWcKaW5kZXggZjc1
NDc0MTk3Mi4uMDk3OTk2ZmM2YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBi
L3hlbi9jb21tb24vS2NvbmZpZwpAQCAtODAsNiArODAsMTAgQEAgY29uZmlnIEhBU19DSEVDS1BP
TElDWQogCXN0cmluZwogCW9wdGlvbiBlbnY9IlhFTl9IQVNfQ0hFQ0tQT0xJQ1kiCiAKK2NvbmZp
ZyBCVUlMRF9XSVRIX0NMQU5HCisJc3RyaW5nCisJb3B0aW9uIGVudj0iWEVOX0JVSUxEX1dJVEhf
Q0xBTkciCisKIG1lbnUgIlNwZWN1bGF0aXZlIGhhcmRlbmluZyIKIAogY29uZmlnIFNQRUNVTEFU
SVZFX0hBUkRFTl9BUlJBWQpAQCAtMzUwLDcgKzM1NCw3IEBAIGNvbmZpZyBDUllQVE8KIGNvbmZp
ZyBMSVZFUEFUQ0gKIAlib29sICJMaXZlIHBhdGNoaW5nIHN1cHBvcnQiCiAJZGVmYXVsdCBYODYK
LQlkZXBlbmRzIG9uIEhBU19CVUlMRF9JRCA9ICJ5IgorCWRlcGVuZHMgb24gSEFTX0JVSUxEX0lE
ID0gInkiICYmIEJVSUxEX1dJVEhfQ0xBTkcgIT0gInkiCiAJLS0taGVscC0tLQogCSAgQWxsb3dz
IGEgcnVubmluZyBYZW4gaHlwZXJ2aXNvciB0byBiZSBkeW5hbWljYWxseSBwYXRjaGVkIHVzaW5n
CiAJICBiaW5hcnkgcGF0Y2hlcyB3aXRob3V0IHJlYm9vdGluZy4gVGhpcyBpcyBwcmltYXJpbHkg
dXNlZCB0byBiaW5hcmlseQotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
