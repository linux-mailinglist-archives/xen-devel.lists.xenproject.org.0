Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA127FED2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htab3-0003fE-CJ; Fri, 02 Aug 2019 16:40:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/l75=V6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htab2-0003f5-Bm
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 16:40:00 +0000
X-Inumbo-ID: 2a2095e5-b544-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2a2095e5-b544-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 16:39:58 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r9so73447164ljg.5
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 09:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Uw+jv3JNkt6+knfySxxwH3jZ5VSifysIyy23XqbU+jE=;
 b=afYcsw871VoPfIB1O3RQP9cIVjTbXtiQgVjcZFC4fes178QdVzQcs3WosSSghhSI5b
 qDyoitVyNO5U5zW8Kzvln3Nx/QKRkSl7dF/58RlvufQLC+RL8X/yxp29HmkTxqYEtwnf
 0TUFsmYgFrP4hS79V54csDdHgorjpKi/sRyDMfluimFXRGBNwenCDS5mls2H7Ah1XRCj
 46AuxORs5g9Lwb9fGaUpDaLKZBg3YM5sy57qVqOMU6s1wkfiqmMK3mc/LLcilxSr1Hfy
 Biaa/bggKP6l2MN/el8eu8MTbd1m5QkV8+aNoP6yCFncLSQBFff81RSMqiO9MJg+14JH
 F8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uw+jv3JNkt6+knfySxxwH3jZ5VSifysIyy23XqbU+jE=;
 b=oW8d3qkT83pVJ9pFHk4gSAVHEHIsZJKpqUL1wMuRtpGS+t304ocTiHCATTQrvOs4Ts
 i0xKyi3+nvmQktIzBNxJ21ZpO1nSY0K2aXfELsEN3aFZ3L3Ac7hcWYHp1BbT05enzST4
 ocbCMBToepgP7W8iEQqPwBlbjb+I7W2DHxT6o0IiP6VyNE8xNCzGrraaNRn7VvLmE8r7
 lZXA4If/UsQ4pDNmLijCwwycnbk/QPUMtgilYkZZentPIMyRcnNyrB17D7Dc1uMz2gyp
 DPBbA95UMHGGXm10IHVct2XPYpn49z3tkR3s2zx9gTwIIObn7oHw6e18fHxOdsYlxvBD
 gSJw==
X-Gm-Message-State: APjAAAUH8iNL/IYi/paGVIoUUQXoBGICY0k+TIdwS22cq86RG1S7LALi
 3rf1iGacZS0YMv121VsjUSUvgvd8lNo=
X-Google-Smtp-Source: APXvYqy/KdT4awfRVW6od2NwBB3VWth231tdLMZqjEMt5TiJyeBm6HE8TIc+Xw4lAQrE3DcZBLq2/A==
X-Received: by 2002:a2e:980e:: with SMTP id a14mr13118687ljj.60.1564763997408; 
 Fri, 02 Aug 2019 09:39:57 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id q6sm15378998lji.70.2019.08.02.09.39.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Aug 2019 09:39:56 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  2 Aug 2019 19:39:39 +0300
Message-Id: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH V2 0/6] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8gYWRkIElQTU1VLVZNU0Eg
c3VwcG9ydCB0byBYZW4gb24gQVJNLgoKQmVzaWRlcyBuZXcgSU9NTVUgZHJpdmVyLCB0aGlzIHNl
cmllcyBjb250YWlucyAiaW9tbXVfZndzcGVjIiBzdXBwb3J0CmFuZCBuZXcgQVBJIGlvbW11X2Fk
ZF9kdF9kZXZpY2UoKSBmb3IgYWRkaW5nIERUIGRldmljZSB0byBJT01NVS4KClRoZSBJUE1NVS1W
TVNBIGlzIFZNU0EtY29tcGF0aWJsZSBJL08gTWVtb3J5IE1hbmFnZW1lbnQgVW5pdCAoSU9NTVUp
CndoaWNoIHByb3ZpZGVzIGFkZHJlc3MgdHJhbnNsYXRpb24gYW5kIGFjY2VzcyBwcm90ZWN0aW9u
IGZ1bmN0aW9uYWxpdGllcwp0byBwcm9jZXNzaW5nIHVuaXRzIGFuZCBpbnRlcmNvbm5lY3QgbmV0
d29ya3MuCgpQbGVhc2Ugbm90ZSwgdGhpcyBkcml2ZXIgaXMgc3VwcG9zZWQgdG8gd29yayBvbmx5
IHdpdGggbmV3ZXN0CkdlbjMgU29DcyByZXZpc2lvbnMgd2hpY2ggSVBNTVUgaGFyZHdhcmUgc3Vw
cG9ydHMgc3RhZ2UgMiB0cmFuc2xhdGlvbgp0YWJsZSBmb3JtYXQgYW5kIGlzIGFibGUgdG8gdXNl
IENQVSdzIFAyTSB0YWJsZSBhcyBpcyBpZiBvbmUgaXMKMy1sZXZlbCBwYWdlIHRhYmxlICh1cCB0
byA0MCBiaXQgSVBBKS4KCi0tLS0tLS0tLS0KVGhpcyBkcml2ZXIgaXMgYmFzZWQgb24gTGludXgn
cyBJUE1NVS1WTVNBIGRyaXZlciBmcm9tIFJlbmVzYXMgQlNQOgpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ob3Jtcy9yZW5lc2FzLWJzcC5naXQvdHJlZS9k
cml2ZXJzL2lvbW11L2lwbW11LXZtc2EuYz9oPXY0LjE0Ljc1LWx0c2kvcmNhci0zLjkuNgphbmQg
WGVuJ3MgU01NVSBkcml2ZXI6Cnhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKCkFs
dGhvdWdoIFhlbiBkcml2ZXIgaGFzIGEgbG90IGluIGNvbW1vbiB3aXRoIExpbnV4IGRyaXZlciwg
aXQgaXMgbm90CmEgImRpcmVjdCBwb3J0ZWQiIGNvcHkgYW5kIHNob3VsZCBiZSB0cmVhdGVkIGFz
IHN1Y2guCgpUaGUgbWFqb3IgZGlmZmVyZW5jZXMgY29tcGFyZSB0byB0aGUgTGludXggZHJpdmVy
IGFyZToKCjEuIFN0YWdlIDEvU3RhZ2UgMiB0cmFuc2xhdGlvbi4gTGludXggZHJpdmVyIHN1cHBv
cnRzIFN0YWdlIDEKdHJhbnNsYXRpb24gb25seSAod2l0aCBTdGFnZSAxIHRyYW5zbGF0aW9uIHRh
YmxlIGZvcm1hdCkuIEl0IG1hbmFnZXMKcGFnZSB0YWJsZSBieSBpdHNlbGYuIEJ1dCBYZW4gZHJp
dmVyIHN1cHBvcnRzIFN0YWdlIDIgdHJhbnNsYXRpb24KKHdpdGggU3RhZ2UgMiB0cmFuc2xhdGlv
biB0YWJsZSBmb3JtYXQpIHRvIGJlIGFibGUgdG8gc2hhcmUgdGhlIFAyTQp3aXRoIHRoZSBDUFUu
IFN0YWdlIDEgdHJhbnNsYXRpb24gaXMgYWx3YXlzIGJ5cGFzc2VkIGluIFhlbiBkcml2ZXIuCgpT
bywgWGVuIGRyaXZlciBpcyBzdXBwb3NlZCB0byBiZSB1c2VkIHdpdGggbmV3ZXN0IEdlbjMgU29D
IHJldmlzaW9ucyBvbmx5CihIMyBFUzMuMCwgTTMgRVMzLjAsIGV0Yy4pIHdoaWNoIElQTU1VIEgv
VyBzdXBwb3J0cyBzdGFnZSAyIHRyYW5zbGF0aW9uCnRhYmxlIGZvcm1hdC4KCjIuIEFBcmNoNjQg
c3VwcG9ydC4gTGludXggZHJpdmVyIHVzZXMgVk1TQXY4LTMyIG1vZGUsIHdoaWxlIFhlbiBkcml2
ZXIKZW5hYmxlcyBBcm12OCBWTVNBdjgtNjQgbW9kZSB0byBjb3ZlciB1cCB0byA0MCBiaXQgaW5w
dXQgYWRkcmVzcy4KCjMuIENvbnRleHQgYmFuayAoc2V0cyBvZiBwYWdlIHRhYmxlKSB1c2FnZS4g
SW4gWGVuLCBlYWNoIGNvbnRleHQgYmFuayBpcwptYXBwZWQgdG8gb25lIFhlbiBkb21haW4uIFNv
LCBhbGwgZGV2aWNlcyBiZWluZyBwYXNzIHRocm91Z2hlZCB0byB0aGUKc2FtZSBYZW4gZG9tYWlu
IHNoYXJlIHRoZSBzYW1lIGNvbnRleHQgYmFuay4KCi0tLS0tLS0tLS0KRHJpdmVyIHdhcyB0ZXN0
ZWQgb24gR2VuMyBIMyBFUzMuMCBiYXNlZCBib2FyZHMgdXNpbmcgY3VycmVudCBzdGFnaW5nCig3
ZDE0NjBjIHhlbi9hcm06IG9wdGVlOiBmaXggY29tcGlsYXRpb24gd2l0aCBHQ0MgNC44KQppbiBh
IHN5c3RlbSB3aXRoIHNldmVyYWwgRE1BIG1hc3RlcnMgYmVpbmcgYXNzaWduZWQgdG8gZGlmZmVy
ZW50IGd1ZXN0IGRvbWFpbnMuCgpZb3UgY2FuIGZpbmQgaXQgaGVyZToKcmVwbzogaHR0cHM6Ly9n
aXRodWIuY29tL290eXNoY2hlbmtvMS94ZW4uZ2l0IGJyYW5jaDogaXBtbXVfdXBzdHJlYW0yCgpZ
b3UgY2FuIGZpbmQgcHJldmlvdXMgZGlzY3Vzc2lvbnMgaGVyZToKW1YxXSBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDYvbXNnMDE3NTUu
aHRtbAoKCk9sZWtzYW5kciBUeXNoY2hlbmtvICg2KToKICBpb21tdS9hcm06IEFkZCBpb21tdV9o
ZWxwZXJzLmMgZmlsZSB0byBrZWVwIGNvbW1vbiBmb3IgSU9NTVVzIHN0dWZmCiAgaW9tbXUvYXJt
OiBBZGQgYWJpbGl0eSB0byBoYW5kbGUgZGVmZXJyZWQgcHJvYmluZyByZXF1ZXN0CiAgW1JGQ10g
eGVuL2NvbW1vbjogSW50cm9kdWNlIF94cmVhbGxvYyBmdW5jdGlvbgogIGlvbW11L2FybTogQWRk
IGxpZ2h0d2VpZ2h0IGlvbW11X2Z3c3BlYyBzdXBwb3J0CiAgaW9tbXUvYXJtOiBJbnRyb2R1Y2Ug
aW9tbXVfYWRkX2R0X2RldmljZSBBUEkKICBpb21tdS9hcm06IEFkZCBSZW5lc2FzIElQTU1VLVZN
U0Egc3VwcG9ydAoKIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgICAgICAgICAgICAg
fCAgIDEyICsKIHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZyAgICAgICAgICAgICAgfCAg
ICAxICsKIHhlbi9jb21tb24vZGV2aWNlX3RyZWUuYyAgICAgICAgICAgICAgICAgICAgfCAgICAx
ICsKIHhlbi9jb21tb24veG1hbGxvY190bHNmLmMgICAgICAgICAgICAgICAgICAgfCAgIDIxICsK
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcgICAgICAgICAgICAgfCAgIDEzICsKIHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZSAgICAgICAgfCAgICAzICstCiB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyAgICAgICAgIHwgICA4MCArLQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11X2Z3c3BlYy5jICB8ICAgOTEgKysKIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdV9oZWxwZXJzLmMgfCAgIDc4ICsrCiB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jICAgIHwgMTM0MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgICAgICAgICAg
fCAgIDQ4ICstCiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RldmljZS5oICAgICAgICAgICAgICAgIHwg
ICAgNyArLQogeGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5oICAgICAgICAgICAgICAgICB8ICAg
MTIgKwogeGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdV9md3NwZWMuaCAgICAgICAgICB8ICAgNjUg
KysKIHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oICAgICAgICAgICAgICAgfCAgICAxICsK
IHhlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmggICAgICAgICAgICAgICAgICAgfCAgICAxICsKIDE2
IGZpbGVzIGNoYW5nZWQsIDE3MjcgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11X2Z3c3BlYy5j
CiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11X2hl
bHBlcnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9p
cG1tdS12bXNhLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20tYXJtL2lvbW11
X2Z3c3BlYy5oCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
