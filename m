Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3FCB238E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:38:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8ncY-00028c-Ly; Fri, 13 Sep 2019 15:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QaHn=XI=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i8ncX-00028I-JI
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:36:25 +0000
X-Inumbo-ID: 322d91fc-d63c-11e9-978d-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 322d91fc-d63c-11e9-978d-bc764e2007e4;
 Fri, 13 Sep 2019 15:36:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h2so21033104ljk.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2019 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JiZ5P+lF28hqjSEly5GNv4UGoQtY/Pu7vhNcliJxRi8=;
 b=bCZJe4pMMv3hl6r7iW0+Wlt9jT/n6cT+CxOCFy0YDcL0q9waze1HlfcfDv/4ImtPS+
 FUBXC9t2vKML11LDHff/j7hcUwLWdpJua8MAvoLLgrIN5kwhv3dEY9b/Y6znvYig+WUm
 OQ+1agAyiDrbyVLvg57qKV3/zxzV67B2xM1NDUeo4JgQW0jYsm/1KQ1ecg6M/m5wvjdZ
 uBRKCYfDq79mOKLf6M5jH/tWcFcAXR6i8XmaHFsmYJHXTu2/uYlwB7SCpY8YIlgei2Kh
 WhB0pMa5rPFWEfVZ09XlS/jC0CDuvN0KxeeEXmEywcaBYboAol6qiikI3kKv+i5d28se
 42mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JiZ5P+lF28hqjSEly5GNv4UGoQtY/Pu7vhNcliJxRi8=;
 b=bV8+a+VBoTc9DMSR/6xo+P7Wsk4wad2s1LkXAP6LxC9mkl1vVJdqhW6qecR35N7qbd
 2XAoHB0qqF3HLxW22ZXntuE7bmBi8HMXFckAeRN6f+oFxYTVC8ngpDHojB/RN3mdVb4Y
 ptgzwy70+ZIOol4/PMNNU4fKVtRdm/dpiWh1joToGZvt619GZ/3TmAHenf0+KXLzlvxi
 pTF4B5MmfnTapX+VWb7hB9Ova7M36ve09bKqWnuTSo76ScrjAvGWzPTfx8odP7SJBqO3
 /ihYaQ7eRfgMRdSYqxRv15kcio+YYL+2R7DTlW6c6nwEDIPK718xOeMZpmMOQRr8MPR9
 +HZA==
X-Gm-Message-State: APjAAAWay5RGXL5Q0WxzlVuZO2knf4JST2ReKjtS5At899OoJGneVfxi
 4QWfpbHn7Bx91ONqDWAMxilO6ERalPo=
X-Google-Smtp-Source: APXvYqzC4cJ4lY+I3sCNAs4M75TO7a6llfjKfPdvLq+yDtTTmfCY8yT1ShsfYVpnqHQc2RObXbN7bw==
X-Received: by 2002:a2e:a168:: with SMTP id u8mr30398304ljl.170.1568388963428; 
 Fri, 13 Sep 2019 08:36:03 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id c16sm6969765lfj.8.2019.09.13.08.36.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 13 Sep 2019 08:36:02 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2019 18:35:14 +0300
Message-Id: <1568388917-7287-6-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V4 5/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHR5cGUtc2FmZSBoZWxwZXIgbWFjcm9zIHRvIHJlLWFs
bG9jYXRlIHNwYWNlCmZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlw
ZWQgb2JqZWN0cy4KCkZvciBleGFtcGxlLCBpZiB3ZSBuZWVkIHRvIHJlLXNpemUgYW4gYXJyYXkg
d2l0aCBhIHNpbmdsZSBlbGVtZW50OgoKICAgc3RydWN0IGFycmxlbgogICB7CiAgICAgIHNpemVf
dCBsZW47CiAgICAgIGludCBkYXRhWzFdOwogICB9OwoKV2UgY2FuIHVzZSB0aGUgcHJvcG9zZWQg
bWFjcm9zIGluIHRoZSBmb2xsb3dpbmcgd2F5OgoKICAgbmV3X3B0ciA9IHJlYWxsb2NfZmxleF9z
dHJ1Y3Qob2xkX3B0ciwgZGF0YSwgbnJfZWxlbSk7CgpTdWJzZXF1ZW50IHBhdGNoIHdpbGwgdXNl
IHRoaXMgbWFjcm9zLgoKQWxzbywgd2hpbGUgaGVyZSwgaW50cm9kdWNlIHhtYWxsb2NfZmxleF9z
dHJ1Y3QoKSB0byBhbGxvY2F0ZSBzcGFjZQpmb3IgYSBzdHJ1Y3R1cmUgd2l0aCBhIGZsZXhpYmxl
IGFycmF5IG9mIHR5cGVkIG9iamVjdHMuCgpTdWdnZXN0ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVr
IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5
c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgpDQzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5E
dW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpDQzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDQzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KQ0M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDQzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ0M6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgotLS0K
Q2hhbmdlcyBWMyAtPiBWNDoKICAgIC0gY2xhcmlmaWVkIHBhdGNoIGRlc2NyaXB0aW9uCiAgICAt
IG1vZGlmaWVkIHRvIG5vdCB1c2UgbGVhZGluZyB1bmRlcnNjb3JlcwogICAgLSByZW1vdmVkIHVu
bmVjZXNzYXJ5IHBhaXIgb2Ygb3V0ZXJtb3N0IHBhcmVudGhlc2VzCiAgICAtIG1vZGlmaWVkIHRv
IHVzZSAibnIiIGluc3RlYWQgb2YgImxlbiIKICAgIC0gcGxhY2VkIHhtYWxsb2NfZmxleF9zdHJ1
Y3QgYmVmb3JlIHhyZWFsbG9jX2ZsZXhfc3RydWN0CiAgICAtIHNpbXBsaWZpZWQgeHJlYWxsb2Nf
ZmxleF9zdHJ1Y3QgbWFjcm9zCi0tLQogeGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaCB8IDkgKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL3htYWxsb2MuaCBiL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmgKaW5kZXgg
ODMxMTUyZi4uZjA3MzZjZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAor
KysgYi94ZW4vaW5jbHVkZS94ZW4veG1hbGxvYy5oCkBAIC0zNSw2ICszNSwxNSBAQAogI2RlZmlu
ZSB4emFsbG9jX2FycmF5KF90eXBlLCBfbnVtKSBcCiAgICAgKChfdHlwZSAqKV94emFsbG9jX2Fy
cmF5KHNpemVvZihfdHlwZSksIF9fYWxpZ25vZl9fKF90eXBlKSwgX251bSkpCiAKKy8qIEFsbG9j
YXRlIHNwYWNlIGZvciBhIHN0cnVjdHVyZSB3aXRoIGEgZmxleGlibGUgYXJyYXkgb2YgdHlwZWQg
b2JqZWN0cy4gKi8KKyNkZWZpbmUgeG1hbGxvY19mbGV4X3N0cnVjdCh0eXBlLCBmaWVsZCwgbnIp
IFwKKyAgICAodHlwZSAqKV94bWFsbG9jKG9mZnNldG9mKHR5cGUsIGZpZWxkW25yXSksIF9fYWxp
Z25vZl9fKHR5cGUpKQorCisvKiBSZS1hbGxvY2F0ZSBzcGFjZSBmb3IgYSBzdHJ1Y3R1cmUgd2l0
aCBhIGZsZXhpYmxlIGFycmF5IG9mIHR5cGVkIG9iamVjdHMuICovCisjZGVmaW5lIHhyZWFsbG9j
X2ZsZXhfc3RydWN0KHB0ciwgZmllbGQsIG5yKSAgICAgICAgICAgICAgICAgICAgICAgICAgXAor
ICAgICh0eXBlb2YocHRyKSlfeHJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBlb2YoKihwdHIpKSwg
ZmllbGRbbnJdKSwgIFwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fYWxpZ25vZl9fKHR5
cGVvZigqKHB0cikpKSkKKwogLyogQWxsb2NhdGUgdW50eXBlZCBzdG9yYWdlLiAqLwogI2RlZmlu
ZSB4bWFsbG9jX2J5dGVzKF9ieXRlcykgX3htYWxsb2MoX2J5dGVzLCBTTVBfQ0FDSEVfQllURVMp
CiAjZGVmaW5lIHh6YWxsb2NfYnl0ZXMoX2J5dGVzKSBfeHphbGxvYyhfYnl0ZXMsIFNNUF9DQUNI
RV9CWVRFUykKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
