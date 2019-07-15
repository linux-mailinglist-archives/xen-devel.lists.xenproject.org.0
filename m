Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5469999
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:15:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn4Uv-0001lw-SZ; Mon, 15 Jul 2019 17:10:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Co6f=VM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hn4Uv-0001lr-4P
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:10:45 +0000
X-Inumbo-ID: 7a533e60-a723-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a533e60-a723-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 17:10:43 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BOxSas1f8ZQkrMXHKQzV9Hbv5Hov0ES+r7dQ3CwwVp+71DlKIHtrlDq7jkcM/FXYFIm7a80d8p
 8E4SNtuWCgLNJgK/0YL+N+U3p9QmbEdx8kOmOUJaPkXAmhPmLshoZa2t6U99gpvJNx7UeTn9Mm
 hS5YqHkKBl3SIDcQA9mOAskdaiCrTL2sh0Nd4uxaJvTJrJO6tvYnPSZQ+nDPyzDLIEKTezVHYM
 A9p55fD6Q9nOi06es2wdZwe00281RuobPdAUpIbAuIARrZCCg3PAPSawO4RNKhBih5HjeNn8ZM
 grw=
X-SBRS: 2.7
X-MesageID: 3061111
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3061111"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 18:10:34 +0100
Message-ID: <20190715171034.29709-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/suspend: Don't save/restore %cr8
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

JWNyOCBpcyBhbiBhbGlhcyBvZiBBUElDX1RBU0tQUkksIHdoaWNoIGlzIGhhbmRsZWQgYnkKbGFw
aWNfe3N1c3BlbmQscmVzdW1lfSgpIHdpdGggdGhlIHJlc3Qgb2YgdGhlIExvY2FsIEFQSUMgc3Rh
dGUuICBTYXZpbmcKYW5kIHJlc3RvcmluZyB0aGUgVFBSIHN0YXRlIGluIGlzb2xhdGlvbiBpcyBu
b3QgYSBjbGV2ZXIgaWRlYS4KCkRyb3AgaXQgYWxsLgoKV2hpbGUgZWRpdGluZyB3YWtldXBfcHJv
dC5TLCB0cmltIGl0cyBpbmNsdWRlIGxpc3QgdG8ganVzdCB0aGUgaGVhZGVycwp3aGljaCBhcmUg
dXNlZCwgd2hpY2ggaXMgcHJlY2ljZWx5IG5vbmUgb2YgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKVGhpcyBpcyBhIFhlbiBtaXJyb3IgdG8gbXkgTGludXggcGF0Y2ggb2Yg
dGhlIHNhbWUgZWZmZWN0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNzE1MTUx
NjQxLjI5MjEwLTEtYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbS9ULyN1CgpXaXRoIGEgYml0IG9m
IGNhcmUsIEknbSBwcmV0dHkgc3VyZSB0aGUgd2hvbGUgb2Ygd2FrZXVwX3Byb3QuUyBjYW4KZGlz
YXBwZWFyLCBidXQgLUVUSU1FIHJpZ2h0IG5vdy4KCkkndmUgY29uZmlybWVkIHRoYXQgYWZ0ZXIg
cmVzdW1lIFRQUiByZXRhaW5zIGl0cyB2YWx1ZSBvZiAweDEwLiAgSG93ZXZlciwgYWxsCmF0dGVt
cHRzIHRvIGRlYnVnIHRoZSBpbnRlcm5hbHMgb2YgbGFwaWNfc3VzcGVuZC9yZXN1bWUgaGF2ZSBl
bHVkZWQgbWUsCmluY2x1ZGluZyBtYW51YWxseSBwb2tpbmcgdGhlIFVBUlQuICBBZ2FpbiwgLUVU
SU1FIHRvIGludmVzdGlnYXRlIGZ1cnRoZXIuCi0tLQogeGVuL2FyY2gveDg2L2FjcGkvd2FrZXVw
X3Byb3QuUyB8IDE1IC0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgYi94ZW4v
YXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TCmluZGV4IDM2MTc1MWQyOTAuLjRhOTI2Mjc0MzYg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKKysrIGIveGVuL2Fy
Y2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUwpAQCAtMSwxMyArMSw1IEBACiAgICAgICAgIC5maWxl
IF9fRklMRV9fCiAgICAgICAgIC50ZXh0Ci0KLSNpbmNsdWRlIDx4ZW4vbXVsdGlib290Lmg+Ci0j
aW5jbHVkZSA8cHVibGljL3hlbi5oPgotI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KLSNpbmNs
dWRlIDxhc20vZGVzYy5oPgotI2luY2x1ZGUgPGFzbS9wYWdlLmg+Ci0jaW5jbHVkZSA8YXNtL21z
ci5oPgotCiAgICAgICAgIC5jb2RlNjQKIAogI2RlZmluZSBHUkVHKHgpICAgICAgICAgJXIjI3gK
QEAgLTQwLDkgKzMyLDYgQEAgRU5UUlkoZG9fc3VzcGVuZF9sb3dsZXZlbCkKICAgICAgICAgcHVz
aGZxOwogICAgICAgICBwb3BxICAgIFNBVkVEX0dSRUcoZmxhZ3MpCiAKLSAgICAgICAgbW92ICAg
ICAlY3I4LCBHUkVHKGF4KQotICAgICAgICBtb3YgICAgIEdSRUcoYXgpLCBSRUYoc2F2ZWRfY3I4
KQotCiAgICAgICAgIG1vdiAgICAgJXNzLCBSRUYoc2F2ZWRfc3MpCiAKICAgICAgICAgc2dkdCAg
ICBSRUYoc2F2ZWRfZ2R0KQpAQCAtOTAsOSArNzksNiBAQCBFTlRSWShfX3JldF9wb2ludCkKICAg
ICAgICAgcHVzaHEgICAlcmF4CiAgICAgICAgIGxyZXRxCiAxOgotICAgICAgICBtb3YgICAgIFJF
RihzYXZlZF9jcjgpLCAlcmF4Ci0gICAgICAgIG1vdiAgICAgJXJheCwgJWNyOAotCiAgICAgICAg
IHB1c2hxICAgU0FWRURfR1JFRyhmbGFncykKICAgICAgICAgcG9wZnEKIApAQCAtMTQ5LDQgKzEz
NSwzIEBAIHNhdmVkX2xkdDogICAgICAucXVhZCAgIDAsMAogCiBzYXZlZF9jcjA6ICAgICAgLnF1
YWQgICAwCiBzYXZlZF9jcjM6ICAgICAgLnF1YWQgICAwCi1zYXZlZF9jcjg6ICAgICAgLnF1YWQg
ICAwCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
