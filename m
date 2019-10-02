Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF614C8D95
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFh4q-00010f-PS; Wed, 02 Oct 2019 16:02:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLuE=X3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFh4o-00010a-SQ
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 16:02:06 +0000
X-Inumbo-ID: fa59a99a-e52d-11e9-9719-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id fa59a99a-e52d-11e9-9719-12813bfff9fa;
 Wed, 02 Oct 2019 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570032125;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=X6lKk43lB7igN2Xyeg8A5EsSz0Ap1WAoFGMoZw3aEe8=;
 b=enOT31b28n+JskQ9yDAoCE/CxDQuMg0tFmdXQC4ryRa9TeWmZk+dqWqU
 59b0MU4XiO/LXl+XiAknqG6gs6sKZjJbx3FZ7PUZ5yljn09PC2Tsrw/af
 N1ULk8colGlCYY0QiZcNgCYOLUNiPuzfWWyggy+TLlntHimBf4iPvYeqD k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PnFab+2pw0N8CYDvbU4DE/t4OPOGBWLG8nOp+cYrJXE7XK6X7whpmKhkO6UU7cY733Umt214MX
 +dCAXJ+0Z4NvsIc/xsaNtErclagHERmThHwbbfpUi4ajROkJOpYRaY1WXk93UZFOhO4fq+hRSo
 SMuj2Zl4lhR3lve0PGbAyqYelYkSLIZ+fg/WMMT56eTcfd2aN2KY237HABqt/FhiprKv0c8zXW
 iKBej/EGT/FG40oYrrtgcHGcLi17TaF5Ii6pgZ0jrcOdN0ZHXGK5uDvqEaqf5ZLhwdGpyvZB7w
 b/M=
X-SBRS: 2.7
X-MesageID: 6624024
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,249,1566878400"; d="scan'208,223";a="6624024"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23956.51705.860315.343098@mariner.uk.xensource.com>
Date: Wed, 2 Oct 2019 17:02:01 +0100
To: Paul Durrant <paul.durrant@citrix.com>
In-Reply-To: <20191001145714.556-1-paul.durrant@citrix.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2 0/2] libxl: fix assertion failure
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSC1mb3ItNC4xMyB2MiAwLzJdIGxpYnhsOiBmaXgg
YXNzZXJ0aW9uIGZhaWx1cmUiKToKPiBUaGlzIHdhcyBvcmlnaW5hbGx5IGEgc2luZ2xlIHBhdGNo
LCB3aGljaCBpcyBub3cgcGF0Y2ggIzIgb2YgdGhpcyBzZXJpZXMuCj4gCj4gUGF1bCBEdXJyYW50
ICgyKToKPiAgIGxpYnhsOiByZXBsYWNlICdlbmFibGVkJyB3aXRoICd1bmtub3duJyBpbiBsaWJ4
bF9wYXNzdGhyb3VnaAo+ICAgICBlbnVtZXJhdGlvbgo+ICAgbGlieGw6IGNob29zZSBhbiBhcHBy
b3ByaWF0ZSBkZWZhdWx0IGZvciBwYXNzdGhyb3VnaC4uLgoKVGhhbmtzLiAgSSBoYXZlIGFwcGxp
ZWQgdGhlc2UsIGFuZCBhbHNvIGEgc3R5bGUgZml4dXAgKGJlbG93KS4KCkkgYW0gY29udGludWlu
ZyB0byBsb29rIGF0IHRoZSBkZWZhdWx0aW5nIGFuZCBjb25maWcgbWFuYWdlbWVudCBoZXJlCndp
dGggYSB2aWV3IHRvIGdldHRpbmcgcmlkIG9mIHNvbWUgb2YgdGhlIGR1cGxpY2F0ZWQgY29kZSBh
bmQgbW92aW5nCml0IGFsbCBpbnRvIGxpYnhsLgoKSWFuLgoKRnJvbSBiMDFiMWRjMDQ2ZGE3MGEy
NjIxYTRkMWYwMzJkZGIyMmIwY2RkZTZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KRGF0ZTogV2VkLCAyIE9jdCAy
MDE5IDE2OjU1OjQ3ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gbGlieGw6IGNyZWF0ZTogc3R5bGU6
IEFkZCBhIHBhaXIgb2YgbWlzc2luZyB7IF0KCkZyb20gQ09ESU5HX1NUWUxFOgoKICBFdmVyeSBp
bmRlbnRlZCBzdGF0ZW1lbnQgaXMgYnJhY2VkLCBidXQgYmxvY2tzIHRoYXQgY29udGFpbiBqdXN0
IG9uZQogIHN0YXRlbWVudCBtYXkgaGF2ZSB0aGUgYnJhY2VzIG9taXR0ZWQuICBUbyBhdm9pZCBj
b25mdXNpb24sIGVpdGhlciBhbGwKICB0aGUgYmxvY2tzIGluIGFuIGlmLi4uZWxzZSBjaGFpbiBo
YXZlIGJyYWNlcywgb3Igbm9uZSBvZiB0aGVtIGRvLgoKQ0M6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0
ZS5jCmluZGV4IDYyZTEzZjNlN2MuLjA5OTc2MWEyZDcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC02OCw4
ICs2OCw5IEBAIGludCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxf
X2djICpnYywKICAgICAgICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9ICgoY19pbmZvLT50eXBlID09
IExJQlhMX0RPTUFJTl9UWVBFX1BWKSB8fAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICFpbmZvLmNhcF9pb21tdV9oYXBfcHRfc2hhcmUpID8KICAgICAgICAgICAgIExJQlhMX1BBU1NU
SFJPVUdIX1NZTkNfUFQgOiBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVDsKLSAgICB9IGVsc2Ug
aWYgKCFpbmZvLmNhcF9odm1fZGlyZWN0aW8pCisgICAgfSBlbHNlIGlmICghaW5mby5jYXBfaHZt
X2RpcmVjdGlvKSB7CiAgICAgICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSBMSUJYTF9QQVNTVEhS
T1VHSF9ESVNBQkxFRDsKKyAgICB9CiAKICAgICAvKiBBbiBleHBsaWNpdCBzZXR0aW5nIHNob3Vs
ZCBub3cgaGF2ZSBiZWVuIGNob3NlbiAqLwogICAgIGFzc2VydChjX2luZm8tPnBhc3N0aHJvdWdo
ICE9IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV04pOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
