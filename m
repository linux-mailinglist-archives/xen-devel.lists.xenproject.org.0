Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A178F4C478
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 02:33:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdkyy-00007j-JA; Thu, 20 Jun 2019 00:31:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7lb=UT=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1hdkyx-00007e-F9
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 00:31:15 +0000
X-Inumbo-ID: b5b28ac8-92f2-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b5b28ac8-92f2-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 00:31:14 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id r185so199547iod.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 17:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TIJKyX+DxtNccHhfqM+S2MDrRV/TffJ5fYTYlxW5yKo=;
 b=gQBroOi1x5WUWaU4W9Xx3bqK0P45Id1Z+KfL1Pzp9j9Rwx0lQbILiJNqZzSnubbqW+
 AJ3r5pkB4Bt8vobB4mWgARf23QdCrQjdt9Iktasi95CiBR63clozn188Iqx7WjoMPLzp
 4butUwEjgS5jtEpfdl1LspxLt63g1274YJBoEhx9Rbn6HwVnaAa6QinK5dGGyUUHMurb
 RedN8slZR6sgBAH1HAAjyAeyGMgvi2djxOCZXVyNLWFsi8wjEs135yv1M+GfR0ewow4B
 UyRYOCa3WtawZ1wsND4bPdICCJo4EGWidgaaPagGEF9oNUlfIlcFkuZ3NYejJiIVz3lZ
 l9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TIJKyX+DxtNccHhfqM+S2MDrRV/TffJ5fYTYlxW5yKo=;
 b=foU55ExmA+Q65vEO2EPCnw4Z/RFPLRwFo31XVuOK1pO1P7E1SMBQF9CmD9bb4W5crX
 a5y6Ul215H6JKP4JGzJb3AcWSRzDDkva/7biJTzL7PGDbaAvQAT/ChPApUBY8jPKVNyQ
 PE4o8AZ0HAUZhsjnzLDtqanemfO/2Jc9V7eE+lFfMfCpFbnSju2fvvTgyZNHiHT8Kg3t
 6o9PfdMe9pG8qyE0Km3pLNnCw0cXXBIxt4E7oVRw7TrpXG+nVKrvPmpYghxizFQyGnqQ
 OjX3lYh+HMPkP1pR7P+klJv9R4tYf1dQepRcIfK5WzPGfsBGnkTwZLIS5osf5kJS1l0G
 yP2w==
X-Gm-Message-State: APjAAAX9MB3HfLAacV5kQTmNzKK26dEapsTCggNcrezXWUKToN+C7V+I
 FW1oTcKaLZwdhdA74DOXuG5axJ9qBdk=
X-Google-Smtp-Source: APXvYqzuLCgFLtayC8Q25pH2xxuZjHrx6LpQ54EnB3JltSggAz8kSXYJZtEFSBh5XvpTq109jTSHAQ==
X-Received: by 2002:a02:cc76:: with SMTP id j22mr75822375jaq.9.1560990673277; 
 Wed, 19 Jun 2019 17:31:13 -0700 (PDT)
Received: from desktop.ice.pyrology.org
 (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
 by smtp.gmail.com with ESMTPSA id e188sm22579016ioa.3.2019.06.19.17.31.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 17:31:12 -0700 (PDT)
From: Christopher Clark <christopher.w.clark@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 19 Jun 2019 17:30:44 -0700
Message-Id: <20190620003053.21993-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [RFC 0/9] The Xen Blanket: hypervisor interface for PV
 drivers on nested Xen
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Christopher Clark <christopher.clark@starlab.io>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBSRkMgcGF0Y2ggc2VyaWVzIGFkZHMgYSBuZXcgaHlwZXJ2aXNvciBpbnRlcmZhY2UgdG8g
c3VwcG9ydCBydW5uaW5nCmEgc2V0IG9mIFBWIGZyb250IGVuZCBkZXZpY2UgZHJpdmVycyB3aXRo
aW4gZG9tMCBvZiBhIGd1ZXN0IFhlbiBydW5uaW5nCm9uIFhlbi4KCkEgcHJhY3RpY2FsIGRlcGxv
eW1lbnQgc2NlbmFyaW8gaXMgYSBzeXN0ZW0gcnVubmluZyBQViBndWVzdCBWTXMgdGhhdCB1c2UK
dW5tb2RpZmllZCBYZW4gUFYgZGV2aWNlIGRyaXZlcnMsIG9uIGEgZ3Vlc3QgWGVuIGh5cGVydmlz
b3Igd2l0aCBhIGRvbTAKdXNpbmcgUFYgZHJpdmVycyBpdHNlbGYsIGFsbCB3aXRoaW4gYSBIVk0g
Z3Vlc3Qgb2YgYSBob3N0aW5nIFhlbgpoeXBlcnZpc29yIChlZy4gZnJvbSBhIGNsb3VkIHByb3Zp
ZGVyKS4gTXVsdGlwbGUgUFYgZ3Vlc3QgVk1zIGNhbiByZXNpZGUKd2l0aGluIGEgc2luZ2xlIGNs
b3VkIGluc3RhbmNlOyBndWVzdHMgY2FuIGJlIGxpdmUtbWlncmF0ZWQgYmV0d2VlbgpjbG91ZCBp
bnN0YW5jZXMgdGhhdCBydW4gbmVzdGVkIFhlbiwgYW5kIHZpcnR1YWwgbWFjaGluZSBpbnRyb3Nw
ZWN0aW9uCm9mIGd1ZXN0cyBjYW4gYmUgcGVyZm9ybWVkIHdpdGhvdXQgcmVxdWlyaW5nIGNsb3Vk
IHByb3ZpZGVyIHN1cHBvcnQuCgpUaGUgbmFtZSAiVGhlIFhlbiBCbGFua2V0IiB3YXMgZ2l2ZW4g
YnkgcmVzZWFyY2hlcnMgZnJvbSBJQk0gYW5kIENvcm5lbGwKd2hlbiB0aGUgb3JpZ2luYWwgd29y
ayB3YXMgcHVibGlzaGVkIGF0IHRoZSBBQ00gRXVyb3N5cyAyMDEyIGNvbmZlcmVuY2UuCiAgICBo
dHRwOi8vd3d3MS51bmluZS5jaC9ldXJvc3lzMjAxMi9wcm9ncmFtL2NvbmZlcmVuY2UuaHRtbAog
ICAgaHR0cHM6Ly9kbC5hY20ub3JnL2NpdGF0aW9uLmNmbT9kb2lkPTIxNjg4MzYuMjE2ODg0OQpU
aGlzIHBhdGNoIHNlcmllcyBpcyBhIHJlaW1wbGVtZW50YXRpb24gb2YgdGhpcyBhcmNoaXRlY3R1
cmUgb24gbW9kZXJuIFhlbgpieSBTdGFyIExhYi4KCkEgcGF0Y2ggdG8gdGhlIExpbnV4IGtlcm5l
bCB0byBhZGQgZGV2aWNlIGRyaXZlcnMgdXNpbmcgdGhpcyBibGFua2V0IGludGVyZmFjZQppcyBh
dDoKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGFybGFiLWlvL3hlbmJsYW5rZXQtbGludXgKKFRo
aXMgaXMgYW4gZXhhbXBsZSwgZW5hYmxpbmcgb3BlcmF0aW9uIGFuZCB0ZXN0aW5nIG9mIGEgWGVu
IEJsYW5rZXQgbmVzdGVkCnN5c3RlbS4gRnVydGhlciB3b3JrIHdvdWxkIGJlIG5lY2Vzc2FyeSBm
b3IgTGludXggdXBzdHJlYW1pbmcuKQpSZWxldmFudCBvdGhlciBjdXJyZW50IExpbnV4IHdvcmsg
aXMgb2NjdXJyaW5nIGhlcmU6CiAgICBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS80LzgvNjcK
ICAgIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwv
MjAxOS0wNS9tc2cwMDc0My5odG1sCgp0aGFua3MsCgpDaHJpc3RvcGhlcgoKQ2hyaXN0b3BoZXIg
Q2xhcmsgKDkpOgogIHg4Ni9ndWVzdDogY29kZSBtb3ZlbWVudCB0byBzZXBhcmF0ZSBYZW4gZGV0
ZWN0aW9uIGZyb20gZ3Vlc3QKICAgIGZ1bmN0aW9ucwogIHg4NjogSW50cm9kdWNlIFhlbiBkZXRl
Y3Rpb24gYXMgc2VwYXJhdGUgbG9naWMgZnJvbSBYZW4gR3Vlc3Qgc3VwcG9ydC4KICB4ODYvbmVz
dGVkOiBhZGQgbmVzdGVkX3hlbl92ZXJzaW9uIGh5cGVyY2FsbAogIFhTTTogQWRkIGhvb2sgZm9y
IG5lc3RlZCB4ZW4gdmVyc2lvbiBvcDsgcmV2aXNlcyBub24tbmVzdGVkIHZlcnNpb24gb3AKICB4
ODYvbmVzdGVkLCB4c206IGFkZCBuZXN0ZWRfbWVtb3J5X29wIGh5cGVyY2FsbAogIHg4Ni9uZXN0
ZWQsIHhzbTogYWRkIG5lc3RlZF9odm1fb3AgaHlwZXJjYWxsCiAgeDg2L25lc3RlZCwgeHNtOiBh
ZGQgbmVzdGVkX2dyYW50X3RhYmxlX29wIGh5cGVyY2FsbAogIHg4Ni9uZXN0ZWQsIHhzbTogYWRk
IG5lc3RlZF9ldmVudF9jaGFubmVsX29wIGh5cGVyY2FsbAogIHg4Ni9uZXN0ZWQsIHhzbTogYWRk
IG5lc3RlZF9zY2hlZG9wX3NodXRkb3duIGh5cGVyY2FsbAoKIHRvb2xzL2ZsYXNrL3BvbGljeS9t
b2R1bGVzL2RvbTAudGUgICAgICAgICAgIHwgIDE0ICstCiB0b29scy9mbGFzay9wb2xpY3kvbW9k
dWxlcy9ndWVzdF9mZWF0dXJlcy50ZSB8ICAgNSArLQogdG9vbHMvZmxhc2svcG9saWN5L21vZHVs
ZXMveGVuLnRlICAgICAgICAgICAgfCAgIDMgKwogdG9vbHMvZmxhc2svcG9saWN5L3BvbGljeS9p
bml0aWFsX3NpZHMgICAgICAgfCAgIDMgKwogeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgMzMgKy0KIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvYXBpYy5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgfCAgIDQgKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMgICAg
ICAgICAgfCAgIDYgKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi1ndWVzdC5jICAgICAgICAgICAg
ICAgfCAzMTEgKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi1uZXN0ZWQu
YyAgICAgICAgICAgICAgfCAzNTAgKysrKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi5jICAgICAgICAgICAgICAgICAgICAgfCAyNjQgKy0tLS0tLS0tLS0tLS0KIHhlbi9h
cmNoL3g4Ni9oeXBlcmNhbGwuYyAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIHhlbi9hcmNo
L3g4Ni9wdi9oeXBlcmNhbGwuYyAgICAgICAgICAgICAgICAgIHwgICA4ICsKIHhlbi9hcmNoL3g4
Ni9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJjYWxsLmggICAgICAgIHwgICA3ICstCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L3hlbi5oICAgICAgICAgICAgICB8ICAzNiArLQogeGVuL2luY2x1ZGUvcHVibGlj
L3hlbi5oICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogeGVuL2luY2x1ZGUveGVuL2h5cGVy
Y2FsbC5oICAgICAgICAgICAgICAgICAgfCAgMzMgKysKIHhlbi9pbmNsdWRlL3hzbS9kdW1teS5o
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQ4ICsrLQogeGVuL2luY2x1ZGUveHNtL3hzbS5oICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNDkgKysrCiB4ZW4veHNtL2R1bW15LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgOCArCiB4ZW4veHNtL2ZsYXNrL2hvb2tzLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8IDEzMyArKysrKystCiB4ZW4veHNtL2ZsYXNrL3BvbGljeS9hY2Nl
c3NfdmVjdG9ycyAgICAgICAgICB8ICAyNiArKwogeGVuL3hzbS9mbGFzay9wb2xpY3kvaW5pdGlh
bF9zaWRzICAgICAgICAgICAgfCAgIDEgKwogeGVuL3hzbS9mbGFzay9wb2xpY3kvc2VjdXJpdHlf
Y2xhc3NlcyAgICAgICAgfCAgIDEgKwogMjYgZmlsZXMgY2hhbmdlZCwgMTA4NiBpbnNlcnRpb25z
KCspLCAyODAgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi1ndWVzdC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L3hl
bi1uZXN0ZWQuYwoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
