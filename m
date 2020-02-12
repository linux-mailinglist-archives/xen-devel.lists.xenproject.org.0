Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4E15ACE2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:12:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1uZp-0003MY-5C; Wed, 12 Feb 2020 16:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MKKR=4A=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j1uZn-0003MS-Ha
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:09:23 +0000
X-Inumbo-ID: 0814e4b8-4db2-11ea-bc8e-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0814e4b8-4db2-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 16:09:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w12so3071224wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2020 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FvtrUfESpP1af0D5iJuW1Q1zTMIMzEbM8jOIQcDUYbo=;
 b=vYOT17+hsC5UeKRyb2q0u/Za0fWM7jqmBC6Fm3q0H2WVxJm52c20sV5Yp7PGPM3WtZ
 E1jKVgGy3gn7wMayzgaSdfNJ2TIQDRTlVX3B1d5hUTA6xUsZB3KtVMUKbsrz1/ZnAvHY
 /JeJ+p+Pv3SKqBNA7kTQ9WbbsASG3skDDm7X4gn2OSAX7PzPZMd+a89bt3MKoE1PHKFu
 kTGnFPu53ltQ9O3NO/yJM87kRhETI0ZLX9EsmntR0Q1J6eVsdJOdRk5hYXg/LXPXgElk
 Oina0UR6/UZsHGiuHmqZLMwa4JFH1f8DOWcpEaw738xW6OFTjOXqM9Ah27g1Hv8jOpWP
 /vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FvtrUfESpP1af0D5iJuW1Q1zTMIMzEbM8jOIQcDUYbo=;
 b=U0AfuT76KldGN2g2udmnt+7NSpTJDCyib8DYukENiwQlnltZTw4uoPaSWc+UljNRyl
 7++2fIz0CpGvEa96+HLHH4sDilkSCO1Dpst5tZfZ0PdQll9odVPG0sXHk94j9EuCiTq4
 4phSJXneJYhr11STHRzEgwvPZ5GlGYuQClixNNqtnh6+H7JA34BAaSnYV5lnq9Uo8Yj/
 JWB3pV5MdmWgWcDTJLxofAqTwugieG67G14QbHOfI5PT+7tJN7xMJ3918NwHyaynUvVE
 PewXSv99dltM8uq6hDKz8n+A72UFjaE8qMCMszeEQkuGW2AT6Cr4s9PLxAzgEipyIOnf
 4MPw==
X-Gm-Message-State: APjAAAVQJG+U963Z6f0CV1MbymLi0Rnix/rWazU/+mvV4UHBhVs44Zaq
 FtGisS95X3a3JEY/agtJ9+YyMXHe
X-Google-Smtp-Source: APXvYqwDeB6GxCiYmbAIgzvE4j26GLu4RfupTLMhtDy+yoCkPdJM92ui19Pt9fj+d8mA1ZmOS2V0Sg==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr16605677wrs.255.1581523761717; 
 Wed, 12 Feb 2020 08:09:21 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 o4sm1142500wrx.25.2020.02.12.08.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 08:09:20 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 16:09:14 +0000
Message-Id: <20200212160918.18470-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] Xen on Hyper-V: Implement L0 assisted TLB
 flush
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpUaGlzIHNlcmlzIGlzIGJhc2VkIG9uIFJvZ2VyJ3MgTDAgYXNzaXN0ZWQgZmx1c2gg
c2VyaWVzLgoKSSBoYXZlIGRvbmUgc29tZSB0ZXN0aW5nIGFnYWluc3QgYSBMaW51eCBvbiBIeXBl
ci1WIGluIGEgMzItdmNwdSBWTS4KQWxsIGJ1aWxkcyB3ZXJlIGRvbmUgd2l0aCAtajMyLgoKCgpC
dWlsZGluZyBYZW4gb24gTGludXg6CnJlYWwgICAgMG00NS4zNzZzCnVzZXIgICAgMm0yOC4xNTZz
CnN5cyAgICAgMG01MS42NzJzCgpCdWlsZGluZyBYZW4gb24gTGludXggb24gWGVuIG9uIEh5cGVy
LVYsIG5vIGFzc2lzdGVkIGZsdXNoOgpyZWFsICAgIDNtOC43NjJzCnVzZXIgICAgMTBtNDYuNzg3
cwpzeXMgICAgIDMwbTE0LjQ5MnMKCkJ1aWxkaW5nIFhlbiBvbiBMaW51eCBvbiBYZW4gb24gSHlw
ZXItViwgd2l0aCBhc3Npc3RlZCBmbHVzaDoKcmVhbCAgICAwbTQ0LjM2OXMKdXNlciAgICAzbTE2
LjIzMXMKc3lzICAgICAzbTMuMzMwcwoKCgpCdWlsZGluZyBMaW51eCB4ODZfNjRfZGVmY29uZmln
IG9uIExpbnV4OgpyZWFsICAgIDBtNTkuNjk4cwp1c2VyICAgIDIxbTE0LjAxNHMKc3lzICAgICAy
bTU4Ljc0MnMKCkJ1aWxkaW5nIExpbnV4IHg4Nl82NF9kZWZjb25maWcgb24gTGludXggb24gWGVu
IG9uIEh5cGVyLVYsIG5vIGFzc2lzdGVkCmZsdXNoOgpyZWFsICAgIDJtNi4yODRzCnVzZXIgICAg
MzFtMTguNzA2cwpzeXMgICAgIDIwbTMxLjEwNnMKCkJ1aWxkaW5nIExpbnV4IHg4Nl82NF9kZWZj
b25maWcgb24gTGludXggb24gWGVuIG9uIEh5cGVyLVYsIHdpdGggYXNzaXN0ZWQKZmx1c2g6CnJl
YWwgICAgMW0zOC45NjhzCnVzZXIgICAgMjhtNDAuMzk4cwpzeXMgICAgIDExbTIwLjE1MXMKCgoK
VGhlcmUgYXJlIHZhcmlvdXMgZGVncmVlcyBvZiBpbXByb3ZlbWVudCBkZXBlbmRpbmcgb24gdGhl
IHdvcmtsb2FkLiBYZW4KY2FuIHBlcmhhcHMgYmUgb3B0bWlzZWQgYSBiaXQgbW9yZSBiZWNhdXNl
IGl0IGN1cnJlbnRseSBkb2Vzbid0IHBhc3MgdGhlCmFkZHJlc3Mgc3BhY2UgaWQgKGNyMykgdG8g
SHlwZXItViwgYnV0IHRoYXQgcmVxdWlyZXMgcmV3b3JraW5nIFRMQiBmbHVzaApBUElzIHdpdGhp
biBYZW4uCgpXZWkuCgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+CkNjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IE1p
Y2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPgpDYzogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgoKV2VpIExpdSAoNCk6CiAgeDg2L2h5cGVydjogbWlzYyBjbGVh
bnVwCiAgeDg2L2h5cGVydmlzb3I6IHBhc3MgZmxhZ3MgdG8gaHlwZXJ2aXNvcl9mbHVzaF90bGIK
ICB4ODYvaHlwZXJ2OiBza2VsZXRvbiBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoCiAgeDg2L2h5
cGVydjogTDAgYXNzaXN0ZWQgVExCIGZsdXNoCgogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZSAgICAgICB8ICAgMiArCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
ICAgICAgIHwgIDE5ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCAgICAg
IHwgIDE1ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAgICAgICAgIHwgMjEx
ICsrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3V0aWwu
YyAgICAgICAgIHwgIDcyICsrKysrKysrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5j
ICAgICAgICAgIHwgICA0ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jICAgICAgICAg
ICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvc21wLmMgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi1oY2FsbC5oIHwgICA1ICst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCAgIHwgIDEwICstCiAxMCBm
aWxlcyBjaGFuZ2VkLCAzMjkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBjcmVhdGUg
bW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwogY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdXRpbC5jCgotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
