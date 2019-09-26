Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D929BEF04
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPj-00085b-2G; Thu, 26 Sep 2019 09:50:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPf-00081e-RK
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:15 +0000
X-Inumbo-ID: eb9d974f-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id eb9d974f-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491363; x=1601027363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=13mM5dRGLSEYhfnX5pNRRWDPwuo7bv2jjXzInhU8Nh0=;
 b=a24FeU50khJGpV/1l4vjgYHfMVfpNyb3sVH7fbdZHa+sBsa4dahYW8Wo
 ECv3usDrUeBNazbg2O5Cb5QofgXTRFEmu1+LQ/OlIHKt6KOC411PY6P8v
 IHIFAutNHE48d52GHdSXfrkShBg7wEd4Wx+ETq7g06YHEGSyExRjq7clE o=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423750699"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 09:49:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 497AC141773; Thu, 26 Sep 2019 09:49:21 +0000 (UTC)
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:03 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D28EUB003.ant.amazon.com (10.43.166.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:49:02 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:59 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:27 +0100
Message-ID: <d6b26c63a2d870dcb3a595a41fc1b51642123662.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 64/84] mapcache: initialise the mapcache
 even for the idle domain.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Hongyan Xia <hongyax@amazon.com>,
 George Dunlap <george.dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KCkluIHNpdHVhdGlvbnMgbGlr
ZSBpbiBpcnFzIG9yIGRvbWFpbiBjcmVhdGlvbiwgUE1BUCBjYW5ub3QgYmUgdXNlZCBvcgp0aGUg
bWFwY2FjaGUgb2YgdGhhdCBkb21haW4gaXMgc2ltcGx5IG5vdCByZWFkeS4gV2UgbmVlZCB0byBo
YXZlIGEKbWFwY2FjaGUgaW4gdGhlIGlkbGUgZG9tYWluIHRvIG1hcCBwYWdlcyB0byBkZWFsIHdp
dGggdGhlc2UuCgpBZnRlciB0aGlzIHBhdGNoLCBtYXBfZG9tYWluX3BhZ2UoKSBjb21wbGV0ZWx5
IGdldHMgcmlkIG9mIHRoZSBkaXJlY3QKbWFwLiBUaGUgYXNzZXJ0aW9ucyBlbnN1cmUgbWFwcGlu
Z3Mgb25seSBoYXBwZW4gd2l0aGluIFBNQVAgb3IgTUFQQ0FDSEUKcmVnaW9ucy4gQXMgYSByZXN1
bHQsIG1hcF94ZW5fcGFnZXRhYmxlKCkgZ2V0cyByaWQgb2YgdGhlIGRpcmVjdCBtYXAgYXMKd2Vs
bC4KClNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L21tLmMgICAgIHwgMyArKysKIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8IDEg
KwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IDk2MTkxODJmNTIuLmYzMGI1YjM5
NTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5j
CkBAIC01ODU4LDYgKzU4NTgsOSBAQCBpbnQgY3JlYXRlX3BlcmRvbWFpbl9tYXBwaW5nKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgdmEsCiAgICAgICAgIGwzdGFiID0gX19tYXBfZG9t
YWluX3BhZ2UocGcpOwogICAgICAgICBjbGVhcl9wYWdlKGwzdGFiKTsKICAgICAgICAgZC0+YXJj
aC5wZXJkb21haW5fbDNfcGcgPSBwZzsKKyAgICAgICAgaWYgKCBpc19pZGxlX2RvbWFpbihkKSAp
CisgICAgICAgICAgICBpZGxlX3BnX3RhYmxlW2w0X3RhYmxlX29mZnNldChQRVJET01BSU5fVklS
VF9TVEFSVCldID0KKyAgICAgICAgICAgICAgICAgICAgbDRlX2Zyb21fcGFnZShwZywgX19QQUdF
X0hZUEVSVklTT1JfUlcpOwogICAgICAgICBpZiAoICFuciApCiAgICAgICAgIHsKICAgICAgICAg
ICAgIHVubWFwX2RvbWFpbl9wYWdlKGwzdGFiKTsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2No
ZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCA3YjcxNTgxNzU2Li5lNjg3YmUz
M2EzIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jCkBAIC0xODE0LDYgKzE4MTQsNyBAQCB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5p
dCh2b2lkKQogICAgIEJVR19PTihucl9jcHVfaWRzID4gQVJSQVlfU0laRShpZGxlX3ZjcHUpKTsK
ICAgICBpZGxlX2RvbWFpbi0+dmNwdSA9IGlkbGVfdmNwdTsKICAgICBpZGxlX2RvbWFpbi0+bWF4
X3ZjcHVzID0gbnJfY3B1X2lkczsKKyAgICBtYXBjYWNoZV9kb21haW5faW5pdChpZGxlX2RvbWFp
bik7CiAgICAgaWYgKCB2Y3B1X2NyZWF0ZShpZGxlX2RvbWFpbiwgMCwgMCkgPT0gTlVMTCApCiAg
ICAgICAgIEJVRygpOwogICAgIHRoaXNfY3B1KHNjaGVkdWxlX2RhdGEpLnNjaGVkX3ByaXYgPSBz
Y2hlZF9hbGxvY19wZGF0YSgmb3BzLCAwKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
