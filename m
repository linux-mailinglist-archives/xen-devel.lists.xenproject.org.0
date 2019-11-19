Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39532102A75
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 18:03:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6ra-0006aF-Ff; Tue, 19 Nov 2019 17:00:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cho0=ZL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iX6rY-0006a4-Ub
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 17:00:24 +0000
X-Inumbo-ID: 1347c820-0aee-11ea-a2ff-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1347c820-0aee-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574182824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lm0IcebzmnEkqFfB+7IqNSQQDnW680qptd0rYOcoBGQ=;
 b=VGnDhxa7ons+LahVcxMuzS7pVvO9z57LQ1aKkXuXZu4B/Bk4iQqD/hFv
 K5C/tGdfPxStIO7hvpsb9Y3FvVX6Ry3bxbqm7GMF/DzlHWmqsRMPbWmBa
 ugkdc/K45efTO7HEhvWdYB2SWPQYxTaiYH/RTRKS2snmQWYYw69w217Pc E=;
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
IronPort-SDR: SZcS0DGyQKLuaYmLAf6OXr3TzhNvthHqBX4C2IRVcetpsWEtQgCc+x4dXgO87bE6svFtmzzHTc
 zUTq4OT1qvTqTDmXiTnqb8nNyHch7g9lp5Nk8vYZ1JgU+oERG+Rs9tvrDbqDC1bfZiqdUVOrUo
 e0LJZDsLTi5RfRGM9WMMuqyZhYHOLaZD8DWMLzDxr1Y/FMp2GhBL7hDjFrAKebq0TO2fc4AHCp
 sg6Ls9cwX/RY8X+p3owmLkiLiWoZsOuDWV5cbI+u0w4lnGh1BlOdPRcFpF3u0Mh4dSbSEpV+mP
 o/8=
X-SBRS: 2.7
X-MesageID: 8543847
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,218,1571716800"; 
   d="scan'208";a="8543847"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 19 Nov 2019 17:00:19 +0000
Message-ID: <20191119170019.18450-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] x86/cpuid: Fix Lisbon/Magny-Cours
 Opterons WRT SSSE3/SSE4A
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

Yy9zIGZmNjZjY2VmZTUgIng4Ni9DUFVJRDogYWRqdXN0IFNTRW4gZGVwZW5kZW5jaWVzIiBtYWRl
IFNTRTRBIGRlcGVuZCBvbgpTU1NFMywgYnV0IHRoZXNlIHByb2Nlc3NvcnMgcmVhbGx5IGRvIGhh
dmUgaGF2ZSBTU0U0QSB3aXRob3V0IFNTU0UzLgoKVGhpcyBtYW5pZmVzdHMgYXMgYW4gdXBncmFk
ZSByZWdyZXNzaW9uLCBhcyB0aGUgU1NFNEEgZmVhdHVyZSBkaXNhcHBlYXJzIGZyb20Kdmlldy4K
CkFkanVzdCB0aGUgU1NFNEEgZmVhdHVyZSB0byBkZXBlbmQgb24gU1NFMyByYXRoZXIgdGhhbiBT
U1NFMy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKRm9yIDQuMTMuICBSZWdyZXNz
aW9uIGZyb20gNC4xMgotLS0KIHhlbi90b29scy9nZW4tY3B1aWQucHkgfCA3ICsrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5weSBiL3hlbi90b29scy9nZW4tY3B1aWQucHkKaW5kZXgg
NDM0YTZlYmYwNC4uMmU3NmY5YWJjMCAxMDA3NTUKLS0tIGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5w
eQorKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5CkBAIC0yMDUsOSArMjA1LDEwIEBAIGRlZiBj
cnVuY2hfbnVtYmVycyhzdGF0ZSk6CiAgICAgICAgICMgdGhhbiB0byBTU0UuCiAgICAgICAgIFNT
RTI6IFtTU0UzLCBMTSwgQUVTTkksIFBDTE1VTFFEUSwgU0hBLCBHRk5JXSwKIAotICAgICAgICAj
IE90aGVyIFNTRW4gZWFjaCBkZXBlbmQgb24gdGhlaXIgcHJlZGVjZXNzb3IgdmVyc2lvbnMuCi0g
ICAgICAgIFNTRTM6IFtTU1NFM10sCi0gICAgICAgIFNTU0UzOiBbU1NFNF8xLCBTU0U0QV0sCisg
ICAgICAgICMgT3RoZXIgU1NFbiBlYWNoIGRlcGVuZCBvbiB0aGVpciBwcmVkZWNlc3NvciB2ZXJz
aW9ucy4gIEFNRAorICAgICAgICAjIExpc2Jvbi9NYWdueS1Db3VycyBwcm9jZXNzb3JzIGltcGxl
bWVudGVkIFNTRTRBIHdpdGhvdXQgU1NTRTMuCisgICAgICAgIFNTRTM6IFtTU1NFMywgU1NFNEFd
LAorICAgICAgICBTU1NFMzogW1NTRTRfMV0sCiAgICAgICAgIFNTRTRfMTogW1NTRTRfMl0sCiAK
ICAgICAgICAgIyBBTUQgc3BlY2lmeSBubyByZWxhdGlvbnNoaXAgYmV0d2VlbiBQT1BDTlQgYW5k
IFNTRTQuMi4gIEludGVsCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
