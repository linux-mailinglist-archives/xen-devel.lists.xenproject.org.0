Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEFD16439E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 12:46:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Nm5-000453-P8; Wed, 19 Feb 2020 11:44:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2RTJ=4H=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j4Nm4-00044x-Ap
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 11:44:16 +0000
X-Inumbo-ID: 27a86d80-530d-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27a86d80-530d-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 11:44:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n10so182349wrm.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 03:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tqtA/at6nznMM8z1Ao2qqWvMCxIL6kTVX4e4Ch0v34w=;
 b=UCbom59FzofrG5ppKFh7CpQOJiHt7A7OJ2APStX98++OSh3+AsYSiUSIjsuLp0Hv/p
 YGSyYs66UUCzMGiPHpREOGbNOHimatSAkYgdyZv6srsovU3AlgTLnw9oHiXRUzbFLyaB
 cRsvsB1k72w60OU7z1AKIqfoeqLZAkPDkBeF8Z2NoPur8o4/DfmO/SVREZHSDCzGJkg6
 rxe++IRul/5tdWQAGtGyWenYTXI4sfa3Et3e3A6bv2rv9ENSzTRX4Sgy7Cm9EFp6j92f
 4dRsk4ACXxDV7CxN8XxWLOEfsuLzHTgCe3H+yk01UKVYJ4IAz1uGXxkvk5tbVa9p/t8w
 LSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tqtA/at6nznMM8z1Ao2qqWvMCxIL6kTVX4e4Ch0v34w=;
 b=AaZuQYAhBErQ0r6EWXTiPH+z0fVUe4VwoPkZIgxjpTKtfDVkH69mcBnsR7oHRZCuQE
 axIZ0QOJddX8Xejk3E682dfu2uEt9LVhU2ROsiijsjDQEuFJwvdrfcUDUW4/0mJXb8gQ
 HdCLtZXhf43MjbQQlJl8Y/+xB8CxIzD21//uPB/W0n8vGLxqcv2NXFOZMPX6V1iDzjOZ
 0WLdTbnmT3QsHMThpRSrmGybAlW8RSSmIdKOLbh27aW3GPDbF96r3Cly1nBKWbGU5pNc
 qtlHjUQk1FgvnP8T17LICDvh3m7Gi/pdKY08+o81QpPEJCSv0xEU2rnCHd4Pk+Y9Nqyo
 mNXg==
X-Gm-Message-State: APjAAAV4A4zANuuR307iUnDqFvrfM1ig3VPex6vni05AU3rRzML0Ngei
 0WOK2CK1BlQ3n3nm2jrcobRf6Q1TGQE=
X-Google-Smtp-Source: APXvYqzB1MIJojhopSa9T6g3GzBQTSOi0TrXs9DPvk+/eo3rIJPLeisiU6V6FZzDbcXfyRmXKz4+9Q==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr35036876wrw.244.1582112654601; 
 Wed, 19 Feb 2020 03:44:14 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 q3sm2534657wmj.38.2020.02.19.03.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 03:44:14 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 11:44:08 +0000
Message-Id: <20200219114411.26922-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/3] Xen on Hyper-V: Implement L0 assisted
 TLB flush
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
ZHVycmFudEBhbWF6b24uY29tPgoKV2VpIExpdSAoMyk6CiAgeDg2L2h5cGVydmlzb3I6IHBhc3Mg
ZmxhZ3MgdG8gaHlwZXJ2aXNvcl9mbHVzaF90bGIKICB4ODYvaHlwZXJ2OiBza2VsZXRvbiBmb3Ig
TDAgYXNzaXN0ZWQgVExCIGZsdXNoCiAgeDg2L2h5cGVydjogTDAgYXNzaXN0ZWQgVExCIGZsdXNo
CgogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZSAgICAgfCAgIDIgKwogeGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyAgICAgfCAgMTcgKysKIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvcHJpdmF0ZS5oICAgIHwgIDEyICsrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3RsYi5jICAgICAgICB8IDIxNCArKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L3V0aWwuYyAgICAgICB8ICA3NSArKysrKysrKysKIHhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwgICA3ICstCiB4ZW4vYXJjaC94ODYvZ3Vl
c3QveGVuL3hlbi5jICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L3NtcC5jICAgICAg
ICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaCAg
ICAgICAgIHwgICAzICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oIHwg
IDEwICstCiAxMCBmaWxlcyBjaGFuZ2VkLCAzMzYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdXRpbC5jCgotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
