Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD31092BF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:25:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZI4Q-0002PV-Lx; Mon, 25 Nov 2019 17:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgds=ZR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZI4P-0002PC-G4
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:22:41 +0000
X-Inumbo-ID: 2aa3992c-0fa8-11ea-a393-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2aa3992c-0fa8-11ea-a393-12813bfff9fa;
 Mon, 25 Nov 2019 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574702553;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X8uBMi0BI2MSZvC+g2bWcep//NlrScsnAygD7N0hY0k=;
 b=Z1DvUmOoJsi89hqZTFo21pFqKcyEJ3CDvWVRWwT7GSg+epkFfnvHodLI
 +ndxSCxaFBIB8IffS+ammyS0nhkxuct1+fySVIFlt5ZgvzdYPCH1lAbuH
 ujIKUh5624SOempl14Y/KP0ISzn/TRAOnZyVmevNQdARZ6muvvUgG7ARY E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DwPu4g3a0xLC+dlfVkFIyK61jwVo0XMhVmRAkoU4toz52thRMGVNQX7lGhX13GXNnvQ+JqTLrh
 NnOjXmbcoW0PKlXD/2X9C1i4yYdh6YQUfFJUCSYEhz1rJCd3VigqcBKKo7xVkWRxA5oAclSDcR
 i79eFft1BlFzIJaRWaxWwR/ag56g9+UJKumocP/yrGX+Dx+6kq50cd9hVEZLnZkY6no1JLSa5q
 f3p9UlgGr64JF9nVdzaC9RR/hkcdLe8h1toFUtOZ0W2nf88ULl2BR4HOi+XTTv3+6laJSDDEDy
 ibo=
X-SBRS: 2.7
X-MesageID: 9352181
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,242,1571716800"; 
   d="scan'208";a="9352181"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 18:22:13 +0100
Message-ID: <20191125172213.1904-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125172213.1904-1-roger.pau@citrix.com>
References: <20191125172213.1904-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] x86/pvshim: do not enable global pages in
 shim mode
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB1c2luZyBnbG9iYWwgcGFnZXMgYSBmdWxsIHRsYiBmbHVzaCBjYW4gb25seSBiZSBwZXJm
b3JtZWQgYnkKdG9nZ2xpbmcgdGhlIFBHRSBiaXQgaW4gQ1I0LCB3aGljaCBpcyB1c3VhbGx5IHF1
aXRlIGV4cGVuc2l2ZSBpbiB0ZXJtcwpvZiBwZXJmb3JtYW5jZSB3aGVuIHJ1bm5pbmcgdmlydHVh
bGl6ZWQuIFRoaXMgaXMgc3BlY2lhbGx5IHJlbGV2YW50IG9uCkFNRCBoYXJkd2FyZSwgd2hpY2gg
ZG9lc24ndCBoYXZlIHRoZSBhYmlsaXR5IHRvIGRvIHNlbGVjdGl2ZSBDUjQKdHJhcHBpbmcsIGJ1
dCBjYW4gYWxzbyBiZSByZWxldmFudCBvbiBJbnRlbCBpZiB0aGUgdW5kZXJseWluZwpoeXBlcnZp
c29yIGFsc28gdHJhcHMgb24gYWNjZXNzZXMgdG8gdGhlIFBHRSBDUjQgYml0LgoKSW4gb3JkZXIg
dG8gYXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkbyBub3QgdXNlIGdsb2JhbCBwYWdl
cwp3aGVuIHJ1bm5pbmcgaW4gc2hpbSBtb2RlLiBOb3RlIHRoaXMgaXMgZG9uZSB3aGVuIHJ1bm5p
bmcgb24gYm90aApJbnRlbCBvciBBTUQgaGFyZHdhcmUsIHNpbmNlIG9sZGVyIHZlcnNpb25zIG9m
IFhlbiBjYXBhYmxlIG9mIHJ1bm5pbmcKdGhlIHNoaW0gZG9uJ3QgbWFrZSB1c2Ugb2YgSW50ZWwg
c2VsZWN0aXZlIENSNCB0cmFwcGluZyBmZWF0dXJlIGFuZAp3aWxsIHZtZXhpdCBvbiBldmVyeSBh
Y2Nlc3MgdG8gQ1I0LgoKVGhlIGFib3ZlIGZpZ3VyZXMgYXJlIGZyb20gYSBQViBzaGltIHJ1bm5p
bmcgb24gQU1EIGhhcmR3YXJlIHdpdGgKMzIgdkNQVXM6CgpQR0UgZW5hYmxlZCwgeDJBUElDIG1v
ZGU6CgooWEVOKSBHbG9iYWwgbG9jayBmbHVzaF9sb2NrOiBhZGRyPWZmZmY4MmQwODA0YjAxYzAs
IGxvY2t2YWw9MWFkYjFhZGIsIG5vdCBsb2NrZWQKKFhFTikgICBsb2NrOjE4NDE4ODMoMTM3NTEy
ODk5ODU0MyksIGJsb2NrOjE2NTg3MTYoMTAxOTMwNTQ4OTA3ODEpCgpBdmVyYWdlIGxvY2sgdGlt
ZTogICA3NDY1ODhucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDYxNDUxNDducwoKUEdFIGRpc2FibGVk
LCB4MkFQSUMgbW9kZToKCihYRU4pIEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgy
ZDA4MDRhZjFjMCwgbG9ja3ZhbD1hOGJmYThiZiwgbm90IGxvY2tlZAooWEVOKSAgIGxvY2s6Mjcz
MDE3NSg2NTc1MDUzODk4ODYpLCBibG9jazoyMDM5NzE2KDI5NjM3NjgyNDc3MzgpCgpBdmVyYWdl
IGxvY2sgdGltZTogICAyNDA4MjlucwpBdmVyYWdlIGJsb2NrIHRpbWU6IDE0NTMwMjlucwoKQXMg
c2VlbiBmcm9tIHRoZSBhYm92ZSBmaWd1cmVzIHRoZSBibG9jayB0aW1lIG9mIHRoZSBmbHVzaCBs
b2NrIGlzCnJlZHVjZWQgdG8gYXBwcm94aW1hdGVseSAxLzMgb2YgdGhlIG9yaWdpbmFsIHZhbHVl
LgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
cHYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKaW5kZXggNGI2ZjQ4ZGVhMi4u
MzZmMzkwM2RjYiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9wdi9kb21haW4uYwpAQCAtMTMsNiArMTMsNyBAQAogI2luY2x1ZGUgPGFzbS9p
bnZwY2lkLmg+CiAjaW5jbHVkZSA8YXNtL3NwZWNfY3RybC5oPgogI2luY2x1ZGUgPGFzbS9wdi9k
b21haW4uaD4KKyNpbmNsdWRlIDxhc20vcHYvc2hpbS5oPgogI2luY2x1ZGUgPGFzbS9zaGFkb3cu
aD4KIAogc3RhdGljIF9fcmVhZF9tb3N0bHkgZW51bSB7CkBAIC0xMzAsNyArMTMxLDcgQEAgdW5z
aWduZWQgbG9uZyBwdl9tYWtlX2NyNChjb25zdCBzdHJ1Y3QgdmNwdSAqdikKICAgICAgKi8KICAg
ICBpZiAoIGQtPmFyY2gucHYucGNpZCApCiAgICAgICAgIGNyNCB8PSBYODZfQ1I0X1BDSURFOwot
ICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54cHRpICkKKyAgICBlbHNlIGlmICggIWQtPmFyY2gu
cHYueHB0aSAmJiAhcHZfc2hpbSApCiAgICAgICAgIGNyNCB8PSBYODZfQ1I0X1BHRTsKIAogICAg
IC8qCi0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
