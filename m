Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED676974DB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lsi-0002SX-BN; Wed, 21 Aug 2019 08:22:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lsg-0002Pn-9R
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:10 +0000
X-Inumbo-ID: b645c124-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b645c124-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375704; x=1597911704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=6v85FnJUP3YBpXSq0qwmcwthWxjgkPDkGI13doZjKzQ=;
 b=MHmgKAHtS1k+axEBfzatYhJes5xhj1AeMnkCfpqDiwbNam3nAF+e3fp9
 ohXL+MFVg5d5/cl6bA8xdtTUT0FJn7YkoNKYmVgqyu6E72QwgTMBXd5bg
 BxSKe0GcuyGiMFdBi7IJXJPIElzkXHIhrzHCD/XicYxbme2xNgI5Mhkt8 0=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="780419122"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Aug 2019 08:21:44 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-d0be17ee.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9FE83A1E80; Wed, 21 Aug 2019 08:21:43 +0000 (UTC)
Received: from EX13D05EUC003.ant.amazon.com (10.43.164.207) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:30 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC003.ant.amazon.com (10.43.164.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:29 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:28 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:50 +0000
Message-ID: <20190821082056.91090-15-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 14/20] livepatch-build: Embed hypervisor build
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
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
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
aXZlcGF0Y2gtYnVpbGQKaW5kZXggNzA2OGZhZi4uM2YwNTMwZSAxMDA3NTUKLS0tIGEvbGl2ZXBh
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
