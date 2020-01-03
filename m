Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4C12FA1A
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:11:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVr-0005Wl-W8; Fri, 03 Jan 2020 16:09:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVq-0005WC-LG
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:22 +0000
X-Inumbo-ID: 5b7ce030-2e43-11ea-a914-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b7ce030-2e43-11ea-a914-bc764e2007e4;
 Fri, 03 Jan 2020 16:09:02 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so9045937wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUfnlZlwFuHWpde6sRvjxDfadwPtw2oJdC3k1kQv/fc=;
 b=tUbHi0DpRaYWZ3lxVGLFpcaSMEAc4PBWX+py0GYk/V1mca4StnwqTGD2Z8bGwK0gHF
 TP0q8tHZ1laPI1bmR1NaekYETPtGvI/oDtHmd9u0I/nTOFwudnzDUBjQ2rSAuQyfEH0X
 EbD4j5U0WdVJ1bOFO1IUN0bYFvMBgO0yWjWyFtadcVgF06PxsXKCxX4FrDmsmm35YuOT
 c/jT/Ups37cbNsCJNfZaBFqzPK5Y2tzG08cGxkiqLb1wQXLrJTF4eZ07XEhlIEou0ziz
 Rgu9RM3A8Ran/Goz8ne0+v3qZ1I4AmDZRM5qLX3qlx9e3RJhxNRyYS8+FktP4OMVES2t
 ASzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RUfnlZlwFuHWpde6sRvjxDfadwPtw2oJdC3k1kQv/fc=;
 b=YLXS77vRzpJfoJ39+ceA06ITZhwkFdpk0lh+8JxadXFNy7gF5kqnQFtzqOyaolWsH+
 Fp7eZtRcIz4cfnhXD02E58G4Ixun5rC8cQ2iwSO29XNCwR30jJ/2xO+BZKMAwkAssLCR
 jhuVk65fo2v/HPj/PUGKcVyp4cqnGUsf5YUuZ7aomUEvdW05D7CNMUtKMuoAJNAPGMSy
 4ZIaDgXjqSPgcoonY7Fvr9Og5hYo5d16nWfpn81qTNT6wfKB5k0MsDKNS53p02oab+XD
 OlM/rEDMau2jBAaP9xaxMo0qlR4yAx4LWCj87kdgLgS2Dt/P8tME7Q2K7/O/qKVMVw+X
 dwEg==
X-Gm-Message-State: APjAAAW5YAST86MrsxCxHquqR8BPf88pH8eicJp7KX8zYGsCs29GjPgR
 7ANcS13juMadq697VC0vYbqLLOKrMg7YWA==
X-Google-Smtp-Source: APXvYqxOVtQLjKCVbZacFTlx6nzgZtiAYBluSMVrihTmit9tKrvWHb/2hHm9MhvYZCCKCRH5ezfz1A==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr21771776wmg.66.1578067741581; 
 Fri, 03 Jan 2020 08:09:01 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:09:01 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:22 +0000
Message-Id: <20200103160825.19377-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 5/8] x86/hyperv: provide Hyper-V hypercall
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
PGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQp2MjoKMS4gVXNlIGRpcmVjdCBjYWxsCi0tLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmggfCA5NSArKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oeXBlcmNhbGwuaAoKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWh5cGVyY2FsbC5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaHlwZXJjYWxsLmgKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uOTI4ZDg1YWU3ZQotLS0gL2Rldi9udWxsCisrKyBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWh5cGVyY2FsbC5oCkBAIC0wLDAgKzEs
OTUgQEAKKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAqIGFzbS14ODYvZ3Vlc3QvaHlwZXJ2LWh5
cGVyY2FsbC5oCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vcgorICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBhbmQg
Y29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlLCB2ZXJzaW9u
IDIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorICoKKyAq
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLAorICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGlt
cGxpZWQgd2FycmFudHkgb2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCisgKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBw
cm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKgor
ICogQ29weXJpZ2h0IChjKSAyMDE5IE1pY3Jvc29mdC4KKyAqLworCisjaWZuZGVmIF9fWDg2X0hZ
UEVSVl9IWVBFUkNBTExfSF9fCisjZGVmaW5lIF9fWDg2X0hZUEVSVl9IWVBFUkNBTExfSF9fCisK
KyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KKworI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KKyNp
bmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KKyNpbmNsdWRlIDxhc20vcGFnZS5oPgor
CitzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50NjRfdCBjb250cm9s
LCBwYWRkcl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKK3sKKyAgICB1aW50NjRfdCBzdGF0dXM7
CisKKyAgICBhc20gdm9sYXRpbGUgKCJtb3YgJVtvdXRwdXRdLCAlJXI4XG4iCisgICAgICAgICAg
ICAgICAgICAiY2FsbCBodl9oeXBlcmNhbGxfcGFnZSIKKyAgICAgICAgICAgICAgICAgIDogIj1h
IiAoc3RhdHVzKSwgIitjIiAoY29udHJvbCksCisgICAgICAgICAgICAgICAgICAgICIrZCIgKGlu
cHV0KSBBU01fQ0FMTF9DT05TVFJBSU5UCisgICAgICAgICAgICAgICAgICA6IFtvdXRwdXRdICJy
bSIgKG91dHB1dCkKKyAgICAgICAgICAgICAgICAgIDogImNjIiwgIm1lbW9yeSIsICJyOCIsICJy
OSIsICJyMTAiLCAicjExIik7CisKKyAgICByZXR1cm4gc3RhdHVzOworfQorCitzdGF0aWMgaW5s
aW5lIHVpbnQ2NF90IGh2X2RvX2Zhc3RfaHlwZXJjYWxsKHVpbnQxNl90IGNvZGUsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGlucHV0MSwgdWlu
dDY0X3QgaW5wdXQyKQoreworICAgIHVpbnQ2NF90IHN0YXR1czsKKyAgICB1aW50NjRfdCBjb250
cm9sID0gKHVpbnQ2NF90KWNvZGUgfCBIVl9IWVBFUkNBTExfRkFTVF9CSVQ7CisKKyAgICBhc20g
dm9sYXRpbGUgKCJtb3YgJVtpbnB1dDJdLCAlJXI4XG4iCisgICAgICAgICAgICAgICAgICAiY2Fs
bCBodl9oeXBlcmNhbGxfcGFnZSIKKyAgICAgICAgICAgICAgICAgIDogIj1hIiAoc3RhdHVzKSwg
IitjIiAoY29udHJvbCksCisgICAgICAgICAgICAgICAgICAgICIrZCIgKGlucHV0MSkgQVNNX0NB
TExfQ09OU1RSQUlOVAorICAgICAgICAgICAgICAgICAgOiBbaW5wdXQyXSAicm0iIChpbnB1dDIp
CisgICAgICAgICAgICAgICAgICA6ICJjYyIsICJyOCIsICJyOSIsICJyMTAiLCAicjExIik7CisK
KyAgICByZXR1cm4gc3RhdHVzOworfQorCitzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX3Jl
cF9oeXBlcmNhbGwodWludDE2X3QgY29kZSwgdWludDE2X3QgcmVwX2NvdW50LAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZhcmhlYWRfc2l6ZSwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IGlucHV0
LCBwYWRkcl90IG91dHB1dCkKK3sKKyAgICB1aW50NjRfdCBjb250cm9sID0gY29kZTsKKyAgICB1
aW50NjRfdCBzdGF0dXM7CisgICAgdWludDE2X3QgcmVwX2NvbXA7CisKKyAgICBjb250cm9sIHw9
ICh1aW50NjRfdCl2YXJoZWFkX3NpemUgPDwgSFZfSFlQRVJDQUxMX1ZBUkhFQURfT0ZGU0VUOwor
ICAgIGNvbnRyb2wgfD0gKHVpbnQ2NF90KXJlcF9jb3VudCA8PCBIVl9IWVBFUkNBTExfUkVQX0NP
TVBfT0ZGU0VUOworCisgICAgZG8geworICAgICAgICBzdGF0dXMgPSBodl9kb19oeXBlcmNhbGwo
Y29udHJvbCwgaW5wdXQsIG91dHB1dCk7CisgICAgICAgIGlmICggKHN0YXR1cyAmIEhWX0hZUEVS
Q0FMTF9SRVNVTFRfTUFTSykgIT0gSFZfU1RBVFVTX1NVQ0NFU1MgKQorICAgICAgICAgICAgYnJl
YWs7CisKKyAgICAgICAgcmVwX2NvbXAgPSAoc3RhdHVzICYgSFZfSFlQRVJDQUxMX1JFUF9DT01Q
X01BU0spID4+CisgICAgICAgICAgICBIVl9IWVBFUkNBTExfUkVQX0NPTVBfT0ZGU0VUOworCisg
ICAgICAgIGNvbnRyb2wgJj0gfkhWX0hZUEVSQ0FMTF9SRVBfU1RBUlRfTUFTSzsKKyAgICAgICAg
Y29udHJvbCB8PSAodWludDY0X3QpcmVwX2NvbXAgPDwgSFZfSFlQRVJDQUxMX1JFUF9DT01QX09G
RlNFVDsKKworICAgIH0gd2hpbGUgKCByZXBfY29tcCA8IHJlcF9jb3VudCApOworCisgICAgcmV0
dXJuIHN0YXR1czsKK30KKworI2VuZGlmIC8qIF9fWDg2X0hZUEVSVl9IWVBFUkNBTExfSF9fICov
CisKKy8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6
ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQt
dGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
