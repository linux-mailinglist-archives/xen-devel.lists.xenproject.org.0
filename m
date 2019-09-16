Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70795B396A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9pE1-0002xu-QE; Mon, 16 Sep 2019 11:31:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9pDz-0002xi-W0
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:31:20 +0000
X-Inumbo-ID: 80d071d6-d875-11e9-b76c-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80d071d6-d875-11e9-b76c-bc764e2007e4;
 Mon, 16 Sep 2019 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568633479; x=1600169479;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=myexTeR90JnIDGWCWHgW6wCd7Hk162+rCWbURSHFHAU=;
 b=ubgGJgkI+HDiUYr8T1Uk54SjPSOS63fXwojcvvk8/Ihx2cLjlxxDCyXU
 TOauHSJqKI4adpBBT4Nxiubkt7Vl3N7tDFCrRrgxH1eslQfapWGXwrK0D
 qu906IoL7BXAHK+MQ+hhuVGzIykPNO94SAl/QYaT36yYdSO2/UPTB76mc A=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="750939922"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 16 Sep 2019 11:31:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2D457A2D4A; Mon, 16 Sep 2019 11:31:16 +0000 (UTC)
Received: from EX13D05EUC001.ant.amazon.com (10.43.164.118) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:15 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC001.ant.amazon.com (10.43.164.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:14 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:31:11 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 11:30:50 +0000
Message-ID: <20190916113056.16592-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190916113056.16592-1-wipawel@amazon.de>
References: <20190916113056.16592-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 1/7] livepatch-build: Embed hypervisor build
 id into every hotpatch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBjaGFuZ2UgaXMgcGFydCBvZiBhIGluZGVwZW5kYW50IHN0YWNrZWQgaG90cGF0Y2ggbW9k
dWxlcwpmZWF0dXJlLiBUaGlzIGZlYXR1cmUgYWxsb3dzIHRvIGJ5cGFzcyBkZXBlbmRlbmNpZXMg
YmV0d2VlbiBtb2R1bGVzCnVwb24gbG9hZGluZywgYnV0IHN0aWxsIHZlcmlmaWVzIFhlbiBidWls
ZCBJRCBtYXRjaGluZy4KCldpdGggc3RhY2tlZCBob3RwYXRjaCBtb2R1bGVzIGl0IGlzIGVzc2Vu
dGlhbCB0aGF0IGVhY2ggYW5kIGV2ZXJ5CmhvdHBhdGNoIGlzIHZlcmlmaWVkIGFnYWluc3QgdGhl
IGh5cGVydmlzb3IgYnVpbGQgaWQgdXBvbiB1cGxvYWQuCkl0IG11c3Qgbm90IGJlIHBvc3NpYmxl
IHRvIHN1Y2Nlc3NmdWxseSB1cGxvYWQgaG90cGF0Y2hlcyBidWlsdCBmb3IKaW5jb3JyZWN0IHZl
cnNpb24gb2YgdGhlIGh5cGVydmlzb3IuCgpUbyBhY2hpZXZlIHRoYXQgYWx3YXlzIGVtYmVkIGFu
IGFkZGl0aW9uYWwgRUxGIHNlY3Rpb246CicubGl2cGF0Y2gueGVuX2RlcGVuZHMnIGNvbnRhaW5p
bmcgdGhlIGh5cGVydmlzb3IgYnVpbGQgaWQuCgpUaGUgaHlwZXJ2aXNvciBidWlsZCBpZCBtdXN0
IGJlIGFsd2F5cyBwcm92aWRlZCBhcyBhIGNvbW1hbmQgbGluZQpwYXJhbWV0ZXI6IC0teGVuLWRl
cGVuZHMuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6
b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpv
bi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZp
ZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Ci0tLQogbGl2ZXBh
dGNoLWJ1aWxkIHwgMTYgKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saXZlcGF0Y2gtYnVpbGQgYi9s
aXZlcGF0Y2gtYnVpbGQKaW5kZXggYjE5OGM5Ny4uYjhhMTcyOCAxMDA3NTUKLS0tIGEvbGl2ZXBh
dGNoLWJ1aWxkCisrKyBiL2xpdmVwYXRjaC1idWlsZApAQCAtMzAsNiArMzAsNyBAQCBERUJVRz1u
CiBYRU5fREVCVUc9bgogU0tJUD0KIERFUEVORFM9CitYRU5fREVQRU5EUz0KIFBSRUxJTks9CiBY
RU5TWU1TPXhlbi1zeW1zCiAKQEAgLTE2Myw2ICsxNjQsOSBAQCBmdW5jdGlvbiBjcmVhdGVfcGF0
Y2goKQogICAgICMgQ3JlYXRlIGEgZGVwZW5kZW5jeSBzZWN0aW9uCiAgICAgcGVybCAtZSAicHJp
bnQgcGFjayAnVlZWWipIKicsIDQsIDIwLCAzLCAnR05VJywgJyR7REVQRU5EU30nIiA+IGRlcGVu
ZHMuYmluCiAKKyAgICAjIENyZWF0ZSBhIFhlbiBkZXBlbmRlbmN5IHNlY3Rpb24KKyAgICBwZXJs
IC1lICJwcmludCBwYWNrICdWVlZaKkgqJywgNCwgMjAsIDMsICdHTlUnLCAnJHtYRU5fREVQRU5E
U30nIiA+IHhlbl9kZXBlbmRzLmJpbgorCiAgICAgZWNobyAiQ3JlYXRpbmcgcGF0Y2ggbW9kdWxl
Li4uIgogICAgIGlmIFsgLXogIiRQUkVMSU5LIiBdOyB0aGVuCiAgICAgICAgIGxkIC1yIC1vICIk
e1BBVENITkFNRX0ubGl2ZXBhdGNoIiAtLWJ1aWxkLWlkPXNoYTEgJChmaW5kIG91dHB1dCAtdHlw
ZSBmIC1uYW1lICIqLm8iKSB8fCBkaWUKQEAgLTE3NCw2ICsxNzgsOSBAQCBmdW5jdGlvbiBjcmVh
dGVfcGF0Y2goKQogCiAgICAgb2JqY29weSAtLWFkZC1zZWN0aW9uIC5saXZlcGF0Y2guZGVwZW5k
cz1kZXBlbmRzLmJpbiAiJHtQQVRDSE5BTUV9LmxpdmVwYXRjaCIKICAgICBvYmpjb3B5IC0tc2V0
LXNlY3Rpb24tZmxhZ3MgLmxpdmVwYXRjaC5kZXBlbmRzPWFsbG9jLHJlYWRvbmx5ICIke1BBVENI
TkFNRX0ubGl2ZXBhdGNoIgorCisgICAgb2JqY29weSAtLWFkZC1zZWN0aW9uIC5saXZlcGF0Y2gu
eGVuX2RlcGVuZHM9eGVuX2RlcGVuZHMuYmluICIke1BBVENITkFNRX0ubGl2ZXBhdGNoIgorICAg
IG9iamNvcHkgLS1zZXQtc2VjdGlvbi1mbGFncyAubGl2ZXBhdGNoLnhlbl9kZXBlbmRzPWFsbG9j
LHJlYWRvbmx5ICIke1BBVENITkFNRX0ubGl2ZXBhdGNoIgogfQogCiB1c2FnZSgpIHsKQEAgLTE4
OSwxMiArMTk2LDEzIEBAIHVzYWdlKCkgewogICAgIGVjaG8gIiAgICAgICAgLS14ZW4tZGVidWcg
ICAgICAgIEJ1aWxkIGRlYnVnIFhlbiAoaWYgeW91ciAuY29uZmlnIGRvZXMgbm90IGhhdmUgdGhl
IG9wdGlvbnMpIiA+JjIKICAgICBlY2hvICIgICAgICAgIC0teGVuLXN5bXMgICAgICAgICBCdWls
ZCBhZ2FpbnN0IGEgeGVuLXN5bXMiID4mMgogICAgIGVjaG8gIiAgICAgICAgLS1kZXBlbmRzICAg
ICAgICAgIFJlcXVpcmVkIGJ1aWxkLWlkIiA+JjIKKyAgICBlY2hvICIgICAgICAgIC0teGVuLWRl
cGVuZHMgICAgICBSZXF1aXJlZCBYZW4gYnVpbGQtaWQiID4mMgogICAgIGVjaG8gIiAgICAgICAg
LS1wcmVsaW5rICAgICAgICAgIFByZWxpbmsiID4mMgogfQogCiBmaW5kX3Rvb2xzIHx8IGRpZSAi
Y2FuJ3QgZmluZCBzdXBwb3J0aW5nIHRvb2xzIgogCi1vcHRpb25zPSQoZ2V0b3B0IC1vIGhzOnA6
YzpvOmo6azpkIC1sICJoZWxwLHNyY2RpcjoscGF0Y2g6LGNvbmZpZzosb3V0cHV0OixjcHVzOixz
a2lwOixkZWJ1Zyx4ZW4tZGVidWcseGVuLXN5bXM6LGRlcGVuZHM6LHByZWxpbmsiIC0tICIkQCIp
IHx8IGRpZSAiZ2V0b3B0IGZhaWxlZCIKK29wdGlvbnM9JChnZXRvcHQgLW8gaHM6cDpjOm86ajpr
OmQgLWwgImhlbHAsc3JjZGlyOixwYXRjaDosY29uZmlnOixvdXRwdXQ6LGNwdXM6LHNraXA6LGRl
YnVnLHhlbi1kZWJ1Zyx4ZW4tc3ltczosZGVwZW5kczoseGVuLWRlcGVuZHM6LHByZWxpbmsiIC0t
ICIkQCIpIHx8IGRpZSAiZ2V0b3B0IGZhaWxlZCIKIAogZXZhbCBzZXQgLS0gIiRvcHRpb25zIgog
CkBAIC0yNTMsNiArMjYxLDExIEBAIHdoaWxlIFtbICQjIC1ndCAwIF1dOyBkbwogICAgICAgICAg
ICAgREVQRU5EUz0iJDEiCiAgICAgICAgICAgICBzaGlmdAogICAgICAgICAgICAgOzsKKyAgICAg
ICAgLS14ZW4tZGVwZW5kcykKKyAgICAgICAgICAgIHNoaWZ0CisgICAgICAgICAgICBYRU5fREVQ
RU5EUz0iJDEiCisgICAgICAgICAgICBzaGlmdAorICAgICAgICAgICAgOzsKICAgICAgICAgLS1w
cmVsaW5rKQogICAgICAgICAgICAgUFJFTElOSz0tLXJlc29sdmUKICAgICAgICAgICAgIHNoaWZ0
CkBAIC0yNjksNiArMjgyLDcgQEAgZG9uZQogWyAteiAiJGNvbmZpZ2FyZyIgXSAmJiBkaWUgIi5j
b25maWcgbm90IGdpdmVuIgogWyAteiAiJG91dHB1dGFyZyIgXSAmJiBkaWUgIk91dHB1dCBkaXJl
Y3Rvcnkgbm90IGdpdmVuIgogWyAteiAiJERFUEVORFMiIF0gJiYgZGllICJCdWlsZC1pZCBkZXBl
bmRlbmN5IG5vdCBnaXZlbiIKK1sgLXogIiRYRU5fREVQRU5EUyIgXSAmJiBkaWUgIlhlbiBCdWls
ZC1pZCBkZXBlbmRlbmN5IG5vdCBnaXZlbiIKIAogU1JDRElSPSIkKHJlYWRsaW5rIC1tIC0tICIk
c3JjYXJnIikiCiAjIFdlIG5lZWQgYW4gYWJzb2x1dGUgcGF0aCBiZWNhdXNlIHdlIG1vdmUgYXJv
dW5kLCBidXQgd2UgbmVlZCB0bwotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1
ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJs
aW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
