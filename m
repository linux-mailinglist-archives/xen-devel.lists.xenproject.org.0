Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94089E46F4
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 11:19:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNviA-0007lw-91; Fri, 25 Oct 2019 09:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cMeb=YS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNvi8-0007li-My
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 09:16:44 +0000
X-Inumbo-ID: 294333b6-f708-11e9-beca-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 294333b6-f708-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 09:16:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a11so1436629wra.6
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUjvS26V+6Ayn8aWMZZsb7UEm0WpdBsfjg+osF6kr3E=;
 b=agu1i4zIDKdAf5YMSyGwnWMZhVq0yXBDIkmn2gkwWsB0sMcEc90lfrzTaLxYcoEHIz
 l8hqtcZ1yioBfWxC7Vk5Tb3LWIX2BR9kI11IjB0c8vqN1EYbCDbLCDCEPKHndq29GVvx
 1C8gMRN3fM80WvWpcYvb2Lr+dvWl3LFr30rZtxwr4MkWMznj+oL/h9+PeyXSpzfwo2Qc
 LOTdqdDJDIGTbjaMVsARa80dQoqC9tlwACM3yrw4fLATIxYnRJcKB6Zq++qeox7RSYQD
 OxBcr57KaeDmuzHn66padKpPZZKLTPW0snIaYvNCgEH9xaQUEXkx/ZF90uxx52n3UIuk
 /otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yUjvS26V+6Ayn8aWMZZsb7UEm0WpdBsfjg+osF6kr3E=;
 b=I5Oobh+zii5o5LsMpf5RM7Hc0mMU7mxG46s3I58przWqR7OM2cMn45QxkHiC6EMXOa
 WQQcyiugVr6DjbKzvQDAuE8r2UbMpLthSolZPFZhDnIBWm/F1okahX5erlKurGTkrLqB
 /LureUyRBw4l7QADb7ugL2sN3EU7rWiLWL12eyR6whphyfiZ26a+tqSUuwgiq1ZlIq8A
 wjJcx3wTh368lYphuPgTMSGVd5wsPC/NHfWHOaUJzg9w7F+ClYKM04JktRkmbHWM5a6A
 K3F7c8GwtxJYEeKMu0Cfh9RgEQBjCm2ws8+2A/Iv/MaUrix130d5En7KYbpSbGtxTyQ7
 t3gQ==
X-Gm-Message-State: APjAAAXr80BM3jZrCmf2a+2P2wFor5Dh2Spjg0oMsnc45NFWkX5p8Z/D
 DWidWQXNCZpLYjnk9N/LRrLSy50C3I8=
X-Google-Smtp-Source: APXvYqwcnOy76Ahkd54ZHOPr/ICGd6KIqRXN+iq671jGK2G/LZROi54eRmDhC1C06Y6rOnXBVwnFuA==
X-Received: by 2002:adf:db42:: with SMTP id f2mr2088042wrj.287.1571995003075; 
 Fri, 25 Oct 2019 02:16:43 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b62sm1873283wmc.13.2019.10.25.02.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:16:42 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 10:16:11 +0100
Message-Id: <20191025091618.10153-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next 0/7] Implement Hyper-V reference TSC
 based clock source
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

SGkgYWxsCgpUaGlzIHNlcmllcyBhZGRzIGEgY2xvY2sgc291cmNlIGJhc2VkIG9uIEh5cGVyLVYn
cyByZWZlcmVuY2UgVFNDLiBUaGUgbWVhdAppcyBpbiB0aGUgbGFzdCBwYXRjaC4KCldpdGggdGhp
cyBzZXJpZXMsIFhlbiBvbiBIeXBlci1WIG5vIGxvbmdlciBydW5zIG9uIGVtdWxhdGVkIFBJVC4K
CihYRU4pIFBsYXRmb3JtIHRpbWVyIGlzIDIyOTQuNjg2TUh6IEhZUEVSLVYgUkVGRVJFTkNFIFRT
QwoKVGhpcyBzZXJpZXMgZGVwZW5kcyBvbiBbMF0uCgpXZWkuCgowOiBodHRwczovL2xpc3RzLnhl
bi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMC9tc2cwMTQyMC5odG1sCgpDYzog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGF1bEB4
ZW4ub3JnPgoKV2VpIExpdSAoNyk6CiAgeDg2OiBpbXBvcnQgaHlwZXJ2LXRsZnMuaCBmcm9tIExp
bnV4CiAgeDg2OiBmaXggdXAgaHlwZXJ2LXRsZnMuaAogIHg4Ni9oeXBlcnY6IGV4dHJhY3QgbW9y
ZSBpbmZvcm1hdGlvbiBmcm9tIEh5cGVyLVYKICB4ODY6IGFkZCBhIGNvbW1lbnQgcmVnYXJkaW5n
IHRoZSBsb2NhdGlvbiBvZiBoeXBlcnZpc29yX3Byb2JlCiAgeDg2OiB1c2UgcnVubmluZ19vbl9o
eXBlcnZpc29yIHRvIGdhdGUgaHlwZXJ2aXNvcl9zZXR1cAogIHg4Ni9oeXBlcnY6IHByb3ZpZGUg
aHlwZXJ2X2d1ZXN0IHZhcmlhYmxlCiAgeDg2OiBpbXBsZW1lbnQgSHlwZXItViBjbG9jayBzb3Vy
Y2UKCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgfCAgMTcgKwogeGVu
L2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiB4ZW4vYXJjaC94
ODYvdGltZS5jICAgICAgICAgICAgICAgICAgICAgfCAgODcgKysrCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi10bGZzLmggfCA5MDcgKysrKysrKysrKysrKysrKysrKysrKysrCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oICAgICAgfCAgMTQgKwogNSBmaWxlcyBj
aGFuZ2VkLCAxMDMwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKCi0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
