Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6076912B5DE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 17:34:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iksXX-0001XD-R1; Fri, 27 Dec 2019 16:32:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CFv7=2R=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iksXX-0001X6-2O
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 16:32:39 +0000
X-Inumbo-ID: 7b70c3cb-28c6-11ea-9c5f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b70c3cb-28c6-11ea-9c5f-12813bfff9fa;
 Fri, 27 Dec 2019 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577464353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hdWjsu2Gy7MJf+V0tGROoM/enlaDpy5pytM3WIJ/Osw=;
 b=HoF5ycPLDuLoD/t8MpM+GXJGpDho/5s/TfWPXsSc5182rgZS4dqEelFo
 dImlZy113VdRwJmtHGpZlpgAKcucG0knO3pIvPMVtuVh2vKKkrfdBPoxJ
 sCuPUIrxm5zsyqk3Yk+xM3P1vrHMRcHJtnorcT01lYDv3TnTtZd1uusKf U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ddYDGCptShwUPMFvFwd0FVHAjid1Wf8+QxNzn/RShDzsWiG30IpjVkO+uPQ3C2wiFxHaVZRbEi
 sSqUs4Hm92Kh6+PEQGZ1JHRbNADYbKDLXT7y76vk4ajOaZJd361c1MV3T9BKgJyK2jLrdiHe5K
 qYFW1gvkaXd1M1mFT7A6iQ0JO6MjrqDUw69imNksj6mUWgWp/+C7Es0c7SkSenkxWqtgTQEIJU
 GKTHJHe+CIM/dPJPW3E/j6t2CsAmLNXe3ykWZ7O+nehjjaRYhdLGNyLwjnKANclLOrxHZkad1q
 ilU=
X-SBRS: 2.7
X-MesageID: 10626139
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,363,1571716800"; d="scan'208";a="10626139"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Dec 2019 16:32:21 +0000
Message-ID: <20191227163224.4113837-6-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227163224.4113837-1-george.dunlap@citrix.com>
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/9] golang/xenlight: Errors are negative
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDg3MWU1MWQyZDQgY2hhbmdlZCB0aGUgc2lnbiBvbiB0aGUgeGVubGlnaHQgZXJyb3Ig
dHlwZXMgKG1ha2luZwp0aGUgdmFsdWVzIG5lZ2F0aXZlLCBzYW1lIGFzIHRoZSBDLWdlbmVyYXRl
ZCBjb25zdGFudHMpLCBidXQgZmFpbGVkIHRvCmZsaXAgdGhlIHNpZ24gaW4gdGhlIEVycm9yKCkg
c3RyaW5nIGZ1bmN0aW9uLiAgVGhlIHJlc3VsdCBpcyB0aGF0CkVycm9yTm9uc3BlY2lmaWMuU3Ry
aW5nKCkgcHJpbnRzICJsaWJ4bCBlcnJvcjogMSIgcmF0aGVyIHRoYW4gdGhlCmh1bWFuLXJlYWRh
YmxlIGVycm9yIG1lc3NhZ2UuCgpHZXQgdGhlIGVycm9yIG1lc3NhZ2UgaW5kZXggYnkgaW52ZXJ0
aW5nIHRoZSBlcnJvciBudW1iZXIgb25jZS4KCkFsc28sIGFsd2F5cyBwcmludCB0aGUgYWN0dWFs
IGVycm9yIHZhbHVlLCByYXRoZXIgdGhhbiB0aGUgaW52ZXJ0ZWQKdmFsdWUsIGZvciBjbGFyaXR5
LgoKU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
PgotLS0KQ0M6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQogdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2dv
bGFuZy94ZW5saWdodC94ZW5saWdodC5nbyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdo
dC5nbwppbmRleCA5OWRlNjgzMjBiLi5jODBmNjIyZTZiIDEwMDY0NAotLS0gYS90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28KKysrIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCkBAIC02NSwxMyArNjUsMTQgQEAgdmFyIGxpYnhsRXJyb3JzID0gWy4uLl1zdHJpbmd7
CiB9CiAKIGZ1bmMgKGUgRXJyb3IpIEVycm9yKCkgc3RyaW5nIHsKLQlpZiAwIDwgaW50KGUpICYm
IGludChlKSA8IGxlbihsaWJ4bEVycm9ycykgewotCQlzIDo9IGxpYnhsRXJyb3JzW2VdCisJZWlk
eCA6PSAtaW50KGUpCisJaWYgMCA8IGVpZHggJiYgZWlkeCA8IGxlbihsaWJ4bEVycm9ycykgewor
CQlzIDo9IGxpYnhsRXJyb3JzW2VpZHhdCiAJCWlmIHMgIT0gIiIgewogCQkJcmV0dXJuIHMKIAkJ
fQogCX0KLQlyZXR1cm4gZm10LlNwcmludGYoImxpYnhsIGVycm9yOiAlZCIsIC1lKQorCXJldHVy
biBmbXQuU3ByaW50ZigibGlieGwgZXJyb3I6ICVkIiwgZSkKIH0KIAogLy8gQ29udGV4dCByZXBy
ZXNlbnRzIGEgbGlieGxfY3R4LgotLSAKMi4yNC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
