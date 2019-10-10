Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681AD2D7A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:16:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIa6C-0006HG-BM; Thu, 10 Oct 2019 15:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubId=YD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIa6A-0006GX-LH
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:11:26 +0000
X-Inumbo-ID: 352c6c54-eb70-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 352c6c54-eb70-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570720277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=EC/p7dFqW1O3fooTwz3LRS6pXql71arf+qD/wOUYIZg=;
 b=BWL5sX5nvi2JVROT2UC4Rk1rFtDLmvK8v71Gf0QzkOFRTAFYC1syt00Y
 WCfg40JiFIkUahmaBRsr//KZrLbhxJWg+JiLRP0dzET4aLyv1yVf5HBCF
 pMS8ZJqzlT3M3yGfGuskso2oS58FfhiJIY7u+Fhqbb1xIWS7yAfQLfg/6 o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ij4hj4oBsVFqSrOKqkPwV0oCFcWKlPCBw4CevGnupj9soO/qeJkY7ft5EMk8nrrNylTPHoBSxC
 HOb73C2FmHcpZedR7VRhRWGo017TC68bPQUVWP3JtXWlhGl3iRbkqpssSmg72lcHsGP7IhWeYn
 BXeoctRgEeLejWTGOpRPL0SAh02Re4muMtCBdMxsqxfXY9vUCSsGKZwP9X3f0ItO/xftVUCVUw
 wRFdOVz6+wV6LFtcvhKnK6JZOA2O6Jq5MGubStJXL/qjkP/dnTKXksZTBtSxda7Q+fJoNWhnH/
 JkU=
X-SBRS: 2.7
X-MesageID: 7110095
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="7110095"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 16:11:10 +0100
Message-ID: <20191010151111.22125-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 8/9] libxl: create: setdefault:
 Move physinfo into config_setdefault
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBUaGlzIHdpbGwgbGV0IHVzIHJlZmVyIHRvIGl0IGluIGNv
ZGUgd2UgYXJlCmFib3V0IHRvIGFkZCB0byB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQp2MjogTmV3IHBhdGNo
IGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2Ny
ZWF0ZS5jICAgfCAxNyArKysrKysrKy0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZG0uYyAg
ICAgICB8ICA3ICsrKysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgMyArKy0K
IDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYwppbmRleCA5YzU2YTkxNGNhLi42OTk3MWM5N2I2IDEwMDY0NAotLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwpAQCAt
MjgsMTUgKzI4LDkgQEAKICNpbmNsdWRlIDx4ZW4teHNtL2ZsYXNrL2ZsYXNrLmg+CiAKIGludCBs
aWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpnYywKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NyZWF0ZV9p
bmZvICpjX2luZm8pCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxp
YnhsX2RvbWFpbl9jcmVhdGVfaW5mbyAqY19pbmZvLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9waHlzaW5mbyAqaW5mbykKIHsKLSAgICBsaWJ4
bF9waHlzaW5mbyBpbmZvWzFdOwotICAgIGludCByYzsKLQotICAgIHJjID0gbGlieGxfZ2V0X3Bo
eXNpbmZvKENUWCwgaW5mbyk7Ci0gICAgaWYgKHJjKQotICAgICAgICByZXR1cm4gcmM7Ci0KICAg
ICBpZiAoIWNfaW5mby0+dHlwZSkgewogICAgICAgICBMT0coRVJST1IsICJkb21haW4gdHlwZSB1
bnNwZWNpZmllZCIpOwogICAgICAgICByZXR1cm4gRVJST1JfSU5WQUw7CkBAIC05MTEsNiArOTA1
LDEwIEBAIGludCBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2Ms
CiAgICAgaW50IHJldDsKICAgICBib29sIHBvZF9lbmFibGVkID0gZmFsc2U7CiAKKyAgICBsaWJ4
bF9waHlzaW5mbyBwaHlzaW5mbzsKKyAgICByZXQgPSBsaWJ4bF9nZXRfcGh5c2luZm8oQ1RYLCAm
cGh5c2luZm8pOworICAgIGlmIChyZXQpIGdvdG8gZXJyb3Jfb3V0OworCiAgICAgaWYgKGRfY29u
ZmlnLT5jX2luZm8uc3NpZF9sYWJlbCkgewogICAgICAgICBjaGFyICpzID0gZF9jb25maWctPmNf
aW5mby5zc2lkX2xhYmVsOwogICAgICAgICByZXQgPSBsaWJ4bF9mbGFza19jb250ZXh0X3RvX3Np
ZChjdHgsIHMsIHN0cmxlbihzKSwKQEAgLTEwMDksNyArMTAwNyw4IEBAIGludCBsaWJ4bF9fZG9t
YWluX2NvbmZpZ19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIGdvdG8gZXJyb3Jf
b3V0OwogICAgIH0KIAotICAgIHJldCA9IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVm
YXVsdChnYywgJmRfY29uZmlnLT5jX2luZm8pOworICAgIHJldCA9IGxpYnhsX19kb21haW5fY3Jl
YXRlX2luZm9fc2V0ZGVmYXVsdChnYywgJmRfY29uZmlnLT5jX2luZm8sCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwaHlzaW5mbyk7CiAgICAgaWYgKHJl
dCkgewogICAgICAgICBMT0dEKEVSUk9SLCBkb21pZCwgIlVuYWJsZSB0byBzZXQgZG9tYWluIGNy
ZWF0ZSBpbmZvIGRlZmF1bHRzIik7CiAgICAgICAgIGdvdG8gZXJyb3Jfb3V0OwpkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXgg
YzAwMzU2YTJmMS4uZTZhNDg5NzRmOCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0u
YworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCkBAIC0yMTY3LDcgKzIxNjcsMTIgQEAgdm9p
ZCBsaWJ4bF9fc3Bhd25fc3R1Yl9kbShsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19zdHViX2RtX3Nw
YXduX3N0YXRlICpzZHNzKQogICAgIGRtX2NvbmZpZy0+Y19pbmZvLnJ1bl9ob3RwbHVnX3Njcmlw
dHMgPQogICAgICAgICBndWVzdF9jb25maWctPmNfaW5mby5ydW5faG90cGx1Z19zY3JpcHRzOwog
Ci0gICAgcmV0ID0gbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGdjLCAmZG1f
Y29uZmlnLT5jX2luZm8pOworICAgIGxpYnhsX3BoeXNpbmZvIHBoeXNpbmZvOworICAgIHJldCA9
IGxpYnhsX2dldF9waHlzaW5mbyhDVFgsICZwaHlzaW5mbyk7CisgICAgaWYgKHJldCkgZ290byBv
dXQ7CisKKyAgICByZXQgPSBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoZ2Ms
ICZkbV9jb25maWctPmNfaW5mbywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJnBoeXNpbmZvKTsKICAgICBpZiAocmV0KSBnb3RvIG91dDsKICAgICByZXQg
PSBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChnYywgJmRtX2NvbmZpZy0+Yl9p
bmZvKTsKICAgICBpZiAocmV0KSBnb3RvIG91dDsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IDAxODVi
OGZmMDEuLjZhNjE0NjU4YzIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMTQ0Nyw3ICsxNDQ3LDgg
QEAgX2hpZGRlbiBpbnQgbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2Mg
KmdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9k
b21haW5fY29uZmlnICpkX2NvbmZpZywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDMyX3QgZG9taWQgLyogbG9nZ2luZyBvbmx5ICovKTsKIF9oaWRkZW4g
aW50IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jcmVh
dGVfaW5mbyAqY19pbmZvKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8gKmNfaW5mbywKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9waHlzaW5mbyAqaW5mbyk7CiBfaGlkZGVu
IGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9idWls
ZF9pbmZvICpiX2luZm8pOwogX2hpZGRlbiB2b2lkIGxpYnhsX19yZG1fc2V0ZGVmYXVsdChsaWJ4
bF9fZ2MgKmdjLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
