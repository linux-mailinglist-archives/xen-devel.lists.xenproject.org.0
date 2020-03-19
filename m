Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217318B297
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 12:50:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEteW-000159-QF; Thu, 19 Mar 2020 11:47:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UtS+=5E=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jEteV-00014z-HA
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 11:47:55 +0000
X-Inumbo-ID: 77c22fc8-69d7-11ea-bbed-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77c22fc8-69d7-11ea-bbed-12813bfff9fa;
 Thu, 19 Mar 2020 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j3dq9jyk0Cufe/tkTRkitGq3uFtK6PzazZ9ACcvBKg8=; b=pbwqWDCH/ug55zBuuvLs6p8MsZ
 7EIGV79p3zXkPhNTOT2LEZtS1ZFvZN0co6fs91MoyzYXinSgITTPBhBadB14Cs7z3IkuK8acODDKd
 i2PxGIAO2ToNlvnihddig1T4QZMy2YE+78u2517eEHOlpHr2eWJvgCInL8aChIPkdWtY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jEteT-0007SF-2d; Thu, 19 Mar 2020 11:47:53 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jEteS-0008Up-OT; Thu, 19 Mar 2020 11:47:52 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 19 Mar 2020 11:47:46 +0000
Message-Id: <20200319114748.5168-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/2] PV driver compatibility fixes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICgyKToKICBsaWJ4bDogY3JlYXRlIGRvbWFpbiAnZXJyb3InIG5vZGUgaW4g
eGVuc3RvcmUKICBsaWJ4bDogbWFrZSBjcmVhdGlvbiBvZiB4ZW5zdG9yZSAnc3VzcGVuZCBldmVu
dCBjaGFubmVsJyBub2RlCiAgICBvcHRpb25hbC4uLgoKIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5p
biAgICAgICAgfCAxMyArKysrKysrKysrKysrCiBkb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFu
ZG9jIHwgMTcgKysrKysrKysrKysrKy0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAg
ICAgfCAxMSArKysrKysrKysrLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgICAgICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRs
ICAgICB8ICAxICsKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICAgICAgfCAgMyArKysKIDYg
ZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCi0tLQpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
