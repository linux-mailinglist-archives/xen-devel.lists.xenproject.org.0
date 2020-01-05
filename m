Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6EE130938
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:50:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io94k-0003lp-PQ; Sun, 05 Jan 2020 16:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io94j-0003lc-GK
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:48:25 +0000
X-Inumbo-ID: 2b4e09f4-2fdb-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b4e09f4-2fdb-11ea-88e7-bc764e2007e4;
 Sun, 05 Jan 2020 16:48:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so47138754wrq.0
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZghIdEEuygXxe0vKMiX29LXHwMAJ7Mkp6vmawf/dbA=;
 b=mQmEZXhB7VPIFcfgOi698RXGYpFhpBbpFa2D0mmd9VFRtWPYhRCizWsQ0UmyDTu6xZ
 ViFGHO5Med49c4oPX4gWvDDt3AeXRxJBuYlweslOZ4EmIz7AkL5xs+VoBAgplX+BT40g
 b2ubVZ8CrnyOxIQlgUGxlDDeBhcS6xHN/lPezi4tir3yHdwPMUgE3ZUG+22BnjCd/hbx
 v5iUhGdZ68ELJoMXR8l3nyegof4DVyMT6bohg8A8IYj49FXLWOMtupy7PgMkg74rTjpG
 t3kB/wXLsT+PHUAtqFMD3vRdwNboMi9j5fzJ/3V2OOuaEpC1e9XuNq/YRLMX99VCFBeJ
 fQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UZghIdEEuygXxe0vKMiX29LXHwMAJ7Mkp6vmawf/dbA=;
 b=an6GPKQRqpX+CvMW8PdDQ7XaxPhPgr/aCBZBcfrf/JjYPd7esYwzF/skqMxUNAg8f4
 iajFjzIPbKyn42sQFQvnLHKfMueNjK4fCGxFiMykjEqvO/CIUHmJ6ZhSvt3Tuhq+bVxq
 ocB9k5/dEeS02+AK5gqCQJK6xJJevZCS1Q8Pdk0Z1fkfsBhYIT6AkKwphRR31ekMbYXg
 2x9nq1I2GOVzUzZzzMaGxgHptX8BmlzWVr2a5fK14X0Vt8RmDRmWVbJESVR8zdl5fu7t
 bSLRw+/rZHUWlDBOU8mcpbvxxS2XVCfJAt6NREp6JGpn6mRzn2n2TPXW+ZSCsWxhc2wI
 tx4Q==
X-Gm-Message-State: APjAAAVVwuLYTByAg7fR0k+MwfJwhJwL1hh9YnmIyBvgzHOKZhtoFLra
 d5tn1u64Z9iT00ZraFrXqwm7OFEs3yE=
X-Google-Smtp-Source: APXvYqxe+PMLJlbq5uHUsneNkt9zW2JDyI5rUmbq/nJE4tjK2l+RPX25Uym2WdbACXpflObTy9PHIA==
X-Received: by 2002:adf:c147:: with SMTP id w7mr102064995wre.389.1578242895459; 
 Sun, 05 Jan 2020 08:48:15 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y139sm20834028wmd.24.2020.01.05.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:48:15 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun,  5 Jan 2020 16:47:58 +0000
Message-Id: <20200105164801.26278-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200105164801.26278-1-liuwe@microsoft.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V hypercall
 functions
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgZnVuY3Rpb25zIHdpbGwgYmUgdXNlZCBsYXRlciB0byBtYWtlIGh5cGVyY2FsbHMgdG8g
SHlwZXItVi4KCkkgY291bGRuJ3QgZmluZCByZWZlcmVuY2UgaW4gVExGUyB0aGF0IEh5cGVyLVYg
Y2xvYmJlcnMgZmxhZ3MgYW5kCnI5LXIxMSwgYnV0IExpbnV4J3MgY29tbWl0IG1lc3NhZ2Ugc2F5
cyBpdCBkb2VzLiBFcnIgb24gdGhlIHNhZmUgc2lkZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUg
PGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQp2MzoKMS4gTmFtZSB0aGUgZmlsZSBoeXBlcnYtaGNh
bGwuaAoKdjI6CjEuIFVzZSBkaXJlY3QgY2FsbAotLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QvaHlwZXJ2LWhjYWxsLmggfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUv
YXNtLXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaAoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydi1oY2FsbC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjRiODdk
Y2ZlNjQKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di1oY2FsbC5oCkBAIC0wLDAgKzEsOTUgQEAKKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAqIGFz
bS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmgKKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCisgKiBtb2RpZnkgaXQgdW5k
ZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyAq
IExpY2Vuc2UsIHZlcnNpb24gMiwgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24uCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdp
dGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9y
IEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAqIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhh
dmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2Ug
YWxvbmcgd2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4KKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0LgorICovCisK
KyNpZm5kZWYgX19YODZfSFlQRVJWX0hDQUxMX0hfXworI2RlZmluZSBfX1g4Nl9IWVBFUlZfSENB
TExfSF9fCisKKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KKworI2luY2x1ZGUgPGFzbS9hc21fZGVm
bnMuaD4KKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KKyNpbmNsdWRlIDxhc20v
cGFnZS5oPgorCitzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50NjRf
dCBjb250cm9sLCBwYWRkcl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKK3sKKyAgICB1aW50NjRf
dCBzdGF0dXM7CisKKyAgICBhc20gdm9sYXRpbGUgKCJtb3YgJVtvdXRwdXRdLCAlJXI4XG4iCisg
ICAgICAgICAgICAgICAgICAiY2FsbCBodl9oeXBlcmNhbGxfcGFnZSIKKyAgICAgICAgICAgICAg
ICAgIDogIj1hIiAoc3RhdHVzKSwgIitjIiAoY29udHJvbCksCisgICAgICAgICAgICAgICAgICAg
ICIrZCIgKGlucHV0KSBBU01fQ0FMTF9DT05TVFJBSU5UCisgICAgICAgICAgICAgICAgICA6IFtv
dXRwdXRdICJybSIgKG91dHB1dCkKKyAgICAgICAgICAgICAgICAgIDogImNjIiwgIm1lbW9yeSIs
ICJyOCIsICJyOSIsICJyMTAiLCAicjExIik7CisKKyAgICByZXR1cm4gc3RhdHVzOworfQorCitz
dGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2Zhc3RfaHlwZXJjYWxsKHVpbnQxNl90IGNvZGUs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGlu
cHV0MSwgdWludDY0X3QgaW5wdXQyKQoreworICAgIHVpbnQ2NF90IHN0YXR1czsKKyAgICB1aW50
NjRfdCBjb250cm9sID0gKHVpbnQ2NF90KWNvZGUgfCBIVl9IWVBFUkNBTExfRkFTVF9CSVQ7CisK
KyAgICBhc20gdm9sYXRpbGUgKCJtb3YgJVtpbnB1dDJdLCAlJXI4XG4iCisgICAgICAgICAgICAg
ICAgICAiY2FsbCBodl9oeXBlcmNhbGxfcGFnZSIKKyAgICAgICAgICAgICAgICAgIDogIj1hIiAo
c3RhdHVzKSwgIitjIiAoY29udHJvbCksCisgICAgICAgICAgICAgICAgICAgICIrZCIgKGlucHV0
MSkgQVNNX0NBTExfQ09OU1RSQUlOVAorICAgICAgICAgICAgICAgICAgOiBbaW5wdXQyXSAicm0i
IChpbnB1dDIpCisgICAgICAgICAgICAgICAgICA6ICJjYyIsICJyOCIsICJyOSIsICJyMTAiLCAi
cjExIik7CisKKyAgICByZXR1cm4gc3RhdHVzOworfQorCitzdGF0aWMgaW5saW5lIHVpbnQ2NF90
IGh2X2RvX3JlcF9oeXBlcmNhbGwodWludDE2X3QgY29kZSwgdWludDE2X3QgcmVwX2NvdW50LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZhcmhl
YWRfc2l6ZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRk
cl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKK3sKKyAgICB1aW50NjRfdCBjb250cm9sID0gY29k
ZTsKKyAgICB1aW50NjRfdCBzdGF0dXM7CisgICAgdWludDE2X3QgcmVwX2NvbXA7CisKKyAgICBj
b250cm9sIHw9ICh1aW50NjRfdCl2YXJoZWFkX3NpemUgPDwgSFZfSFlQRVJDQUxMX1ZBUkhFQURf
T0ZGU0VUOworICAgIGNvbnRyb2wgfD0gKHVpbnQ2NF90KXJlcF9jb3VudCA8PCBIVl9IWVBFUkNB
TExfUkVQX0NPTVBfT0ZGU0VUOworCisgICAgZG8geworICAgICAgICBzdGF0dXMgPSBodl9kb19o
eXBlcmNhbGwoY29udHJvbCwgaW5wdXQsIG91dHB1dCk7CisgICAgICAgIGlmICggKHN0YXR1cyAm
IEhWX0hZUEVSQ0FMTF9SRVNVTFRfTUFTSykgIT0gSFZfU1RBVFVTX1NVQ0NFU1MgKQorICAgICAg
ICAgICAgYnJlYWs7CisKKyAgICAgICAgcmVwX2NvbXAgPSAoc3RhdHVzICYgSFZfSFlQRVJDQUxM
X1JFUF9DT01QX01BU0spID4+CisgICAgICAgICAgICBIVl9IWVBFUkNBTExfUkVQX0NPTVBfT0ZG
U0VUOworCisgICAgICAgIGNvbnRyb2wgJj0gfkhWX0hZUEVSQ0FMTF9SRVBfU1RBUlRfTUFTSzsK
KyAgICAgICAgY29udHJvbCB8PSAodWludDY0X3QpcmVwX2NvbXAgPDwgSFZfSFlQRVJDQUxMX1JF
UF9DT01QX09GRlNFVDsKKworICAgIH0gd2hpbGUgKCByZXBfY29tcCA8IHJlcF9jb3VudCApOwor
CisgICAgcmV0dXJuIHN0YXR1czsKK30KKworI2VuZGlmIC8qIF9fWDg2X0hZUEVSVl9IQ0FMTF9I
X18gKi8KKworLyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1z
dHlsZTogIkJTRCIKKyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGlu
ZGVudC10YWJzLW1vZGU6IG5pbAorICogRW5kOgorICovCi0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
