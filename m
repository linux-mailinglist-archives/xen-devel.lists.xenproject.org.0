Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2D11B20
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:16:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCTw-0001VA-Cy; Thu, 02 May 2019 14:14:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f+J5=TC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hMCTv-0001V0-AR
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:14:39 +0000
X-Inumbo-ID: 9de6f2ee-6ce4-11e9-843c-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9de6f2ee-6ce4-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:14:37 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j11so2030425lfm.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1urTjbYAyxY1VAWVmEF113vhEpT7fj7fWJxqvM0TVuk=;
 b=IOAfsLSQSJ3gr93/M6P+LOaCrLtU6ZSsf3M6GVbKhvxXNWij2xZ9WluAajXRbOnpPz
 ug+UuHtiNnNIdfZ+OAm9uUKNgWffjDrdz/EswEC+Q+rcJ+0pc9mC953qDBbiWgRhBAY8
 IwhyKX9NId8HuEGie/roNTpNz75Dy5k8/M36jhO25W63UYbVjcYRkSUBKeDFR0pYZ41F
 EH/5K7ATeSPIFxAlxjzgatWCPlwk6RxYei4R/HN4N1v+ztR/bMqiOj8coogJ4E3xbhrl
 TjBRLamJrqgdnzECf/mT5p7w1Hx0Yvs/O0lwGN0oaX9wDBMdjmLzH5IbSH9cCFdOadkY
 NgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1urTjbYAyxY1VAWVmEF113vhEpT7fj7fWJxqvM0TVuk=;
 b=CKqz3Fc0f8pG6GxnW5uRkfj/RbXCSfH3F9NKup7kaHAoV6Mrn+iUu53LP5izQLDcNW
 MB41TU9v513sxyu3RqzOoX+3ez55SBhKVhD+NEyJ5196K1MdNiQC/xjsNNRGrDQEaAhY
 1pUOS9egO6qwW2X+sP0E0J3eOf9Xr+gq0cdCuCqq6aqhM5rLfk0Fb96puRQL4zDup6Nh
 CzhtuZOwzuqkoH9d+NlIWrqeBj0UlfQY4BF8SwPgFqb7fC7pkM9suYfz4nOk71PAPESh
 GaSAoKJSMd9S28OjoFTKSv75iwYVIzOq8VQTr4CmOrl/wyIKA0ErbRII6bBtg/PAJ4CO
 V/rQ==
X-Gm-Message-State: APjAAAXdOB1WBY4NuUoldaCZYw9codPkvPy3y2GUQ42woQi4gf/gah3w
 8Q+0rzfTNZj6Ywk0nDc4UUMVJbaIEKY=
X-Google-Smtp-Source: APXvYqz+1eI0prlS9JWq2/zVPY4gpd7oclRWXskBl+TXoJ84/+JRwh0T6nEh4P0J4NbV6pP/vsdX4g==
X-Received: by 2002:ac2:5686:: with SMTP id 6mr2163305lfr.34.1556806476106;
 Thu, 02 May 2019 07:14:36 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id v11sm9447761lfb.68.2019.05.02.07.14.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 02 May 2019 07:14:35 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 17:13:54 +0300
Message-Id: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [RFC PATCH 0/2] Add ability to handle nodes with
 interrupts-extended property
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKSGVsbG8sIGFsbC4KClRoZSBwdXJwb3NlIG9mIHRoaXMgc21hbGwgc2VyaWVzIGlzIHRvIGFk
ZCBtaW5pbWFsIHJlcXVpcmVkIHN1cHBvcnQgZm9yIFhlbiB0byBiZSBhYmxlIHRvCmhhbmRsZSBk
ZXZpY2UtdHJlZSBub2RlcyB3aXRoICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eSBbMV0u
CgpUaGUgcmVhc29uOgpYZW4gZXhwZWN0cyB0byBzZWUgImludGVycnVwdHMiIHByb3BlcnR5IHdo
ZW4gcGFyc2luZyBob3N0IGRldmljZS10cmVlLgpCdXQsIHRoZXJlIGFyZSBjYXNlcyB3aGVuIHNv
bWUgZGV2aWNlIG5vZGVzIGNvbnRhaW4gImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlu
c3RlYWQuCiAgICAKVGhlIGdvb2QgZXhhbXBsZSBoZXJlIGlzIGFyY2ggdGltZXIgbm9kZSBmb3Ig
Ui1DYXIgR2VuMy9HZW4yIGZhbWlseSBbMl0sIHdoaWNoIGlzIG1hbmRhdG9yeSBkZXZpY2UKZm9y
IFhlbiB1c2FnZSBvbiBBUk0uIEFuZCB3aXRob3V0IGFiaWxpdHkgdG8gaGFuZGxlIHN1Y2ggbm9k
ZXMsIFhlbiBmYWlscyB0byBvcGVyYXRlOgogICAgCihYRU4pICoqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKKFhFTikgUGFuaWMgb24gQ1BVIDA6CihYRU4pIFRpbWVyOiBV
bmFibGUgdG8gcmV0cmlldmUgSVJRIDAgZnJvbSB0aGUgZGV2aWNlIHRyZWUKKFhFTikgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgoKLS0tLS0tLS0tLQoKUHJlbGltaW5h
cnkgdGVzdGVkIG9uIFItQ2FyIEdlbjMgYmFzZWQgYm9hcmQuIExvZyAod2l0aCBkZWJ1ZyBlbmFi
bGVkKSBzaG93cyB0aGF0IFhlbiByZWNvZ25pemVkIGFyY2ggdGltZXIKaW50ZXJydXB0cyByZXBy
ZXNlbnRlZCB3aXRoICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eToKCnRpbWVyIHsKCWNv
bXBhdGlibGUgPSAiYXJtLGFybXY4LXRpbWVyIjsKCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8Jmdp
YyBHSUNfUFBJIDEzIChHSUNfQ1BVX01BU0tfU0lNUExFKDgpIHwgSVJRX1RZUEVfTEVWRUxfTE9X
KT4sCgkJCSAgICAgIDwmZ2ljIEdJQ19QUEkgMTQgKEdJQ19DUFVfTUFTS19TSU1QTEUoOCkgfCBJ
UlFfVFlQRV9MRVZFTF9MT1cpPiwKCQkJICAgICAgPCZnaWMgR0lDX1BQSSAxMSAoR0lDX0NQVV9N
QVNLX1NJTVBMRSg4KSB8IElSUV9UWVBFX0xFVkVMX0xPVyk+LAoJCQkgICAgICA8JmdpYyBHSUNf
UFBJIDEwIChHSUNfQ1BVX01BU0tfU0lNUExFKDgpIHwgSVJRX1RZUEVfTEVWRUxfTE9XKT47Cn07
CgouLi4KKFhFTikgZHRfZGV2aWNlX2dldF9yYXdfaXJxOiBkZXY9L3RpbWVyLCBpbmRleD0wCihY
RU4pICBpbnRzcGVjPTEgaW50c2l6ZT0zCihYRU4pIGR0X2lycV9tYXBfcmF3OiBwYXI9L3NvYy9p
bnRlcnJ1cHQtY29udHJvbGxlckBmMTAxMDAwMCxpbnRzcGVjPVsweDAwMDAwMDAxIDB4MDAwMDAw
MGQuLi5dLG9pbnRzaXplPTMKKFhFTikgZHRfaXJxX21hcF9yYXc6IGlwYXI9L3NvYy9pbnRlcnJ1
cHQtY29udHJvbGxlckBmMTAxMDAwMCwgc2l6ZT0zCihYRU4pICAtPiBhZGRyc2l6ZT0wCihYRU4p
ICAtPiBnb3QgaXQgIQooWEVOKSBkdF9kZXZpY2VfZ2V0X3Jhd19pcnE6IGRldj0vdGltZXIsIGlu
ZGV4PTEKKFhFTikgIGludHNwZWM9MSBpbnRzaXplPTMKKFhFTikgZHRfaXJxX21hcF9yYXc6IHBh
cj0vc29jL2ludGVycnVwdC1jb250cm9sbGVyQGYxMDEwMDAwLGludHNwZWM9WzB4MDAwMDAwMDEg
MHgwMDAwMDAwZS4uLl0sb2ludHNpemU9MwooWEVOKSBkdF9pcnFfbWFwX3JhdzogaXBhcj0vc29j
L2ludGVycnVwdC1jb250cm9sbGVyQGYxMDEwMDAwLCBzaXplPTMKKFhFTikgIC0+IGFkZHJzaXpl
PTAKKFhFTikgIC0+IGdvdCBpdCAhCihYRU4pIGR0X2RldmljZV9nZXRfcmF3X2lycTogZGV2PS90
aW1lciwgaW5kZXg9MgooWEVOKSAgaW50c3BlYz0xIGludHNpemU9MwooWEVOKSBkdF9pcnFfbWFw
X3JhdzogcGFyPS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJAZjEwMTAwMDAsaW50c3BlYz1bMHgw
MDAwMDAwMSAweDAwMDAwMDBiLi4uXSxvaW50c2l6ZT0zCihYRU4pIGR0X2lycV9tYXBfcmF3OiBp
cGFyPS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJAZjEwMTAwMDAsIHNpemU9MwooWEVOKSAgLT4g
YWRkcnNpemU9MAooWEVOKSAgLT4gZ290IGl0ICEKKFhFTikgZHRfZGV2aWNlX2dldF9yYXdfaXJx
OiBkZXY9L3RpbWVyLCBpbmRleD0zCihYRU4pICBpbnRzcGVjPTEgaW50c2l6ZT0zCihYRU4pIGR0
X2lycV9tYXBfcmF3OiBwYXI9L3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckBmMTAxMDAwMCxpbnRz
cGVjPVsweDAwMDAwMDAxIDB4MDAwMDAwMGEuLi5dLG9pbnRzaXplPTMKKFhFTikgZHRfaXJxX21h
cF9yYXc6IGlwYXI9L3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckBmMTAxMDAwMCwgc2l6ZT0zCihY
RU4pICAtPiBhZGRyc2l6ZT0wCihYRU4pICAtPiBnb3QgaXQgIQooWEVOKSBHZW5lcmljIFRpbWVy
IElSUTogcGh5cz0zMCBoeXA9MjYgdmlydD0yNyBGcmVxOiA4MzMzIEtIegouLi4KCi0tLS0tLS0t
LS0KVGhlIGZpcnN0IHBhdGNoIGhhZCBKdWxpZW4ncyBSLUIgc29tZSB0aW1lIGFnbywgYnV0IEkg
ZHJvcHBlZCBpdC4gIAoKClsxXQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4x
LXJjNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1j
b250cm9sbGVyL2ludGVycnVwdHMudHh0CgpbMl0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20v
bGludXgvdjUuMS1yYzcvc291cmNlL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk1
LmR0c2kjTDMxODUKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMS1yYzcvc291
cmNlL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3OTAuZHRzaSNMMTg1NgoKT2xla3NhbmRyIFR5c2hj
aGVua28gKDIpOgogIHhlbi9kZXZpY2UtdHJlZTogQWRkIGR0X2NvdW50X3BoYW5kbGVfd2l0aF9h
cmdzIGhlbHBlcgogIHhlbi9kZXZpY2UtdHJlZTogQWRkIGFiaWxpdHkgdG8gaGFuZGxlIG5vZGVz
IHdpdGggaW50ZXJydXB0cy1leHRlbmRlZAogICAgcHJvcAoKIHhlbi9jb21tb24vZGV2aWNlX3Ry
ZWUuYyAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiB4
ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
