Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69913ECE2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 00:45:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLEzB-0001i0-39; Mon, 29 Apr 2019 22:42:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JedT=S7=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hLEz9-0001hv-Nh
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 22:42:55 +0000
X-Inumbo-ID: 206f7818-6ad0-11e9-843c-bc764e045a96
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 206f7818-6ad0-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 22:42:54 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0803A21FB7;
 Mon, 29 Apr 2019 18:42:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 29 Apr 2019 18:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Yq1ucv
 A489h2CHkR6Q9+P6k8g7+0IkiMStA0jH+/DLQ=; b=S+Htnf00GMXwHc0Q/tUKx+
 XRAoCmqExJo/JPAHyT2EpW4Jgw8HwwUk77EyMpKJy9i3XeRwotq4bjBZyrTvyz+O
 v58P7u2O4YqIWsalMArLBy26N/K9zwd0QDs/nsKQb7iJGWoSx2IT2YViOU5v0U/h
 P/Ey91PRbwk3bifB7ViF6Qe9ZIaQNiaPMnO0brlCtKm1SCfYQZeJz2FqtKb6Qmqz
 Ec/oUfkkjEDeXgqodIdhsCA5yldA1JA94hTOuPCQdXBV+i+3N25pCg8hmeYTmpse
 P9u5xeEVAd2O1pXmb/NoX9AGGZqos28g7wVftAA+uTlLD/2IQLqp9Gf6D/peJDNQ
 ==
X-ME-Sender: <xms:7H3HXKpsIFPSjMcaSS-lszlBPZfPCz4t1sdQ_zF4kp1nO0UGdLT23g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:7H3HXGcOR_joJYoE8lRUwEFz_u2uC0muqMH23kSgXuB1a2f8MSZwsw>
 <xmx:7H3HXJrhZtPNmDA6L8k4JOoGfraf29lol77NkP1-Zwo22yYGMHT38g>
 <xmx:7H3HXHG4DEbH9Nk8QlCdataBcoJNy0rEnkGieQHOWosr2EjB-Uth1g>
 <xmx:7n3HXK7UA40XJLrfgm5cOk0V0dr0cVAJt_LNPhd0QSXrXb_Mw5xZTA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5DDDE4122;
 Mon, 29 Apr 2019 18:42:51 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Apr 2019 00:42:52 +0200
Message-Id: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH v2] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IGYwODlmZGRkOTQgInhlbjogcmVwb3J0IFBWIGNhcGFiaWxpdHkgaW4gc3lzY3RsIGFu
ZCB1c2UgaXQgaW4KdG9vbHN0YWNrIiBjaGFuZ2VkIG1lYW5pbmcgb2YgdmlydF9jYXBzIGJpdCAx
IC0gcHJldmlvdXNseSBpdCB3YXMKImRpcmVjdGlvIiwgYnV0IHdhcyBjaGFuZ2VkIHRvICJwdiIg
YW5kICJkaXJlY3RpbyIgd2FzIG1vdmVkIHRvIGJpdCAyLgpBZGp1c3QgcHl0aG9uIHdyYXBwZXIg
dG8gdXNlICNkZWZpbmVzIGZvciB0aGUgYml0cyB2YWx1ZXMsIGFuZCBhZGQKcmVwb3J0aW5nIG9m
IGJvdGggInB2X2RpcmVjdGlvIiBhbmQgImh2bV9kaXJlY3RpbyIuCgpTaWduZWQtb2ZmLWJ5OiBN
YXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5j
b20+Ci0tLQpUaGlzIHNob3VsZCBiZSBiYWNrcG9ydGVkIHRvIDQuMTIKQ2M6IElhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKQ2hhbmdlcyBpbiB2MjoKIC0gQ2hlY2sgWEVO
X1NZU0NUTF9QSFlTQ0FQXyogaW5zdGVhZCBvZiBoYXJkY29kaW5nIGJpdHMgdmFsdWVzCiAtIERv
IG5vdCBkdXBsaWNhdGUgdmlydGNhcF9uYW1lcyBlbnRyaWVzLCBpbnN0ZWFkIGFwcGVuZCBfZGly
ZWN0aW8gaW4KICAgc3ByaW50ZigpCi0tLQogdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94
Yy5jIHwgMTYgKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZl
bC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jCmluZGV4IGNjODE3
NWExMWUuLjljMDNjODI3MmUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwv
eGMveGMuYworKysgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMKQEAgLTk3Mywx
MSArOTczLDE3IEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19waHlzaW5mbyhYY09iamVjdCAqc2Vs
ZikKICAgICB4Y19waHlzaW5mb190IHBpbmZvOwogICAgIGNoYXIgY3B1X2NhcFsxMjhdLCB2aXJ0
X2NhcHNbMTI4XSwgKnA7CiAgICAgaW50IGk7Ci0gICAgY29uc3QgY2hhciAqdmlydGNhcF9uYW1l
c1tdID0geyAiaHZtIiwgImh2bV9kaXJlY3RpbyIgfTsKKyAgICBjb25zdCBjaGFyICp2aXJ0Y2Fw
X25hbWVzW10gPSB7ICJodm0iLCAicHYiIH07CisgICAgY29uc3QgdW5zaWduZWQgdmlydGNhcHNf
Yml0c1tdID0geyBYRU5fU1lTQ1RMX1BIWVNDQVBfaHZtLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgWEVOX1NZU0NUTF9QSFlTQ0FQX3B2IH07CiAKICAgICBpZiAoIHhj
X3BoeXNpbmZvKHNlbGYtPnhjX2hhbmRsZSwgJnBpbmZvKSAhPSAwICkKICAgICAgICAgcmV0dXJu
IHB5eGNfZXJyb3JfdG9fZXhjZXB0aW9uKHNlbGYtPnhjX2hhbmRsZSk7CiAKKyAgICAvKgorICAg
ICAqIEtlZXAgaW4gc3luYyB3aXRoIHRvb2xzL3hsL3hsX2luZm8uYzpvdXRwdXRfeGVuaW5mbwor
ICAgICAqIGFuZCBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAoZXNwZWNpYWxseSBiaXQgZmll
bGRzKS4KKyAgICAgKi8KICAgICBwID0gY3B1X2NhcDsKICAgICAqcCA9ICdcMCc7CiAgICAgZm9y
ICggaSA9IDA7IGkgPCBzaXplb2YocGluZm8uaHdfY2FwKS80OyBpKysgKQpAQCAtOTg2LDkgKzk5
MiwxMyBAQCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3QgKnNlbGYpCiAK
ICAgICBwID0gdmlydF9jYXBzOwogICAgICpwID0gJ1wwJzsKLSAgICBmb3IgKCBpID0gMDsgaSA8
IDI7IGkrKyApCi0gICAgICAgIGlmICggKHBpbmZvLmNhcGFiaWxpdGllcyA+PiBpKSAmIDEgKQor
ICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRSh2aXJ0Y2Fwc19iaXRzKTsgaSsrICkKKyAg
ICAgICAgaWYgKCBwaW5mby5jYXBhYmlsaXRpZXMgJiB2aXJ0Y2Fwc19iaXRzW2ldICkKICAgICAg
ICAgICBwICs9IHNwcmludGYocCwgIiVzICIsIHZpcnRjYXBfbmFtZXNbaV0pOworICAgIGlmICgg
cGluZm8uY2FwYWJpbGl0aWVzICYgWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvICkKKyAgICAg
ICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZpcnRjYXBzX2JpdHMpOyBpKysgKQorICAg
ICAgICAgICAgaWYgKCBwaW5mby5jYXBhYmlsaXRpZXMgJiB2aXJ0Y2Fwc19iaXRzW2ldICkKKyAg
ICAgICAgICAgICAgcCArPSBzcHJpbnRmKHAsICIlc19kaXJlY3RpbyAiLCB2aXJ0Y2FwX25hbWVz
W2ldKTsKICAgICBpZiAoIHAgIT0gdmlydF9jYXBzICkKICAgICAgICoocC0xKSA9ICdcMCc7CiAK
LS0gCjIuMTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
