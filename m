Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5E4386FD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZB5W-0002US-Hs; Fri, 07 Jun 2019 09:23:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GsDR=UG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hZB5V-0002U3-4o
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:23:05 +0000
X-Inumbo-ID: d8c95714-8905-11e9-b0f8-df77dc23082e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8c95714-8905-11e9-b0f8-df77dc23082e;
 Fri, 07 Jun 2019 09:23:02 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A7M1zrWLyt+hRHXziFfL0/vd9rmwz0xrAqSdP00S4aQEU/NewzXfVMdHAxft7xOYytq88j6UOF
 7Zsl77kqcyugEoiZw+6oDdo8yo1BjFB1SvJ4OZ8gp/MHEuyvFs9WcggHSxR3kenBiClQKmutxP
 6UrGKNbrVYnFPEEJNnQNW86N4zAIPB+/+3m7v/yhnliLZiKqaGDq0WRq99m4v9BlamN1+wdEZY
 hTlvpwgGn9+SueYkzXt8odL4E6CkRc3o9v6Tlmb6iQRh4iVrJ+ucjHh/+9PcYNGHZX855hzMd3
 rAc=
X-SBRS: -0.9
X-MesageID: 1440968
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1440968"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 7 Jun 2019 11:22:21 +0200
Message-ID: <20190607092232.83179-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190607092232.83179-1-roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 02/13] pci: introduce a devfn field to
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBlcXVpdmFsZW50IHRvIHRoZSBjdXJyZW50IGV4dGZ1bmMgZmllbGQgaW4gdGVybSBv
ZiBjb250ZW50cy4KClN3aXRjaCB0aGUgdHdvIGN1cnJlbnQgdXNlcnMgb2YgZXh0ZnVuYyB0byB1
c2UgZGV2Zm4gaW5zdGVhZCBmb3IKY29ycmVjdG5lc3MuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4K
ClJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8
R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKIC0gU3dpdGNoIGRlY2xhcmF0
aW9uIG9yZGVyIG9mIHRoZSBkZXZmbiBhbmQgZXh0ZnVuYyBmaWVsZHMuCgpDaGFuZ2VzIHNpbmNl
IHYxOgogLSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgotLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
IHwgNCArKy0tCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICB8IDMgKystCiAyIGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCmluZGV4IGIwMzIzMmZl
MzAuLmNhNTk4Njc1ZWEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCisrKyBi
L3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC0zMjcsNyArMzI3LDcgQEAgdWludDMyX3QgdnBj
aV9yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywgdW5zaWduZWQgaW50IHNp
emUpCiAgICAgfQogCiAgICAgLyogRmluZCB0aGUgUENJIGRldiBtYXRjaGluZyB0aGUgYWRkcmVz
cy4gKi8KLSAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2Jk
Zi5idXMsIHNiZGYuZXh0ZnVuYyk7CisgICAgcGRldiA9IHBjaV9nZXRfcGRldl9ieV9kb21haW4o
ZCwgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuKTsKICAgICBpZiAoICFwZGV2ICkKICAg
ICAgICAgcmV0dXJuIHZwY2lfcmVhZF9odyhzYmRmLCByZWcsIHNpemUpOwogCkBAIC00MzIsNyAr
NDMyLDcgQEAgdm9pZCB2cGNpX3dyaXRlKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJl
ZywgdW5zaWduZWQgaW50IHNpemUsCiAgICAgICogRmluZCB0aGUgUENJIGRldiBtYXRjaGluZyB0
aGUgYWRkcmVzcy4KICAgICAgKiBQYXNzdGhyb3VnaCBldmVyeXRoaW5nIHRoYXQncyBub3QgdHJh
cHBlZC4KICAgICAgKi8KLSAgICBwZGV2ID0gcGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRm
LnNlZywgc2JkZi5idXMsIHNiZGYuZXh0ZnVuYyk7CisgICAgcGRldiA9IHBjaV9nZXRfcGRldl9i
eV9kb21haW4oZCwgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldmZuKTsKICAgICBpZiAoICFw
ZGV2ICkKICAgICB7CiAgICAgICAgIHZwY2lfd3JpdGVfaHcoc2JkZiwgcmVnLCBzaXplLCBkYXRh
KTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9w
Y2kuaAppbmRleCBkYWIxYTg2ZGQ0Li5jNjFmZDdlMjYyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCkBAIC00OSw3ICs0OSw4IEBA
IHR5cGVkZWYgdW5pb24gewogICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCBmbiAgIDog
MywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2ICA6IDU7CiAgICAgICAgICAg
ICAgICAgICAgIH07Ci0gICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgICAgIGV4dGZ1bmM7Cisg
ICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgICAgIGRldmZuLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBleHRmdW5jOwogICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAg
ICAgdWludDhfdCAgICAgICAgIGJ1czsKICAgICAgICAgICAgIH07Ci0tIAoyLjIwLjEgKEFwcGxl
IEdpdC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
