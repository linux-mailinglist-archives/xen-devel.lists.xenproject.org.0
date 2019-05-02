Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8711B21
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:16:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCTy-0001Vd-W6; Thu, 02 May 2019 14:14:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f+J5=TC=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hMCTw-0001VI-QA
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:14:40 +0000
X-Inumbo-ID: 9f4075ee-6ce4-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f4075ee-6ce4-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:14:40 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s7so2354647ljh.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Bhy8ERTYdfSjiRGGOCL7/5SLLcwd2wNxUdxXkfyMshc=;
 b=oL7gET7CqS0nwJMPi9sVDkudmZ6vHVbWK4OxvW9b1QuKabOXthovk/BTUqFv1zIgL9
 jCiDBY6pQfRVE2ZhC05l/kLlug3xDaor35IPKkfSmfpClpPxr4uOaUNDIFq05MR7LCHi
 TF6wGnnacoc0KbXs88InyJtXhpaKirStL53ZDW3DVk4MzKBKacGVD8xZDPXLHhsuAe48
 lluUKExaXou/9mRZSRPR8lIsU7hFbz12uuH/hDy5AWmIhfoanSm2AGSYRDi3posP8o63
 N+kBWh9IXVqZHb8COgB3DIypyOtKyox19W3qvdr4B0+jBcbYqfIscqdlmY/ILX7ggTZF
 vfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Bhy8ERTYdfSjiRGGOCL7/5SLLcwd2wNxUdxXkfyMshc=;
 b=mnm6eF72kODH3Mv2dj2zbxHo64qsK8vSWKNW93hpo46+x9nn3sEcVUP5XjF0Kc6bIN
 cQ079WIquTxo+9y2YLNrAAC24Ytlgy+Bi0cMxK2Ps3LNHoY+1U2Y7Q7O6YvTyRPiwhza
 LpI+1uacNsnHoFG+BdWpdK0AbNYdqyTqzuESsnq89AQ5A6Iu5NUC32h5st+bnvU4RDF5
 FP1xe6J4QURin739Kig/P5FpvFD7ot87jcuFVqMoPKVfm5CaIrDhPEh/uUR3TCCMVU/G
 rYSm3rYfaML/DmZ9NBeicPu+rw4Rwp6FhX37XguZSUGX9SL1bpnGcuQgPUgCSmJoXq3z
 9ZwQ==
X-Gm-Message-State: APjAAAXsJmy2CLtgzEsD7jm3vt5BvAMlCm/VxfEeKRQjEH6uo+xNGgcu
 oqaviR9Qu78OW4jaCOdXiP73BOofRo0=
X-Google-Smtp-Source: APXvYqzkfAPQBzM3yV+K++/uKYeax21hyP5PpNdsLi4HIMAENkQK/EK2uervWNIe2rf6A8k1HGYaLg==
X-Received: by 2002:a2e:428c:: with SMTP id h12mr2047959ljf.26.1556806478511; 
 Thu, 02 May 2019 07:14:38 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id v11sm9447761lfb.68.2019.05.02.07.14.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 02 May 2019 07:14:37 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  2 May 2019 17:13:56 +0300
Message-Id: <1556806436-26283-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [RFC PATCH 2/2] xen/device-tree: Add ability to handle
 nodes with interrupts-extended prop
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
PgoKWGVuIGV4cGVjdHMgdG8gc2VlICJpbnRlcnJ1cHRzIiBwcm9wZXJ0eSB3aGVuIHBhcnNpbmcg
aG9zdApkZXZpY2UtdHJlZS4gQnV0LCB0aGVyZSBhcmUgY2FzZXMgd2hlbiBzb21lIGRldmljZSBu
b2RlcyBjb250YWluCiJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eSBpbnN0ZWFkLgoKVGhl
IGdvb2QgZXhhbXBsZSBoZXJlIGlzIGFyY2ggdGltZXIgbm9kZSBmb3IgUi1DYXIgR2VuMy9HZW4y
IGZhbWlseSwKd2hpY2ggaXMgbWFuZGF0b3J5IGRldmljZSBmb3IgWGVuIHVzYWdlIG9uIEFSTS4g
QW5kIHdpdGhvdXQgYWJpbGl0eQp0byBoYW5kbGUgc3VjaCBub2RlcywgWGVuIGZhaWxzIHRvIG9w
ZXJhdGU6CgooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihY
RU4pIFBhbmljIG9uIENQVSAwOgooWEVOKSBUaW1lcjogVW5hYmxlIHRvIHJldHJpZXZlIElSUSAw
IGZyb20gdGhlIGRldmljZSB0cmVlCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioKClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2RldmljZV90cmVlLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kZXZp
Y2VfdHJlZS5jIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jCmluZGV4IDY1ODYyYjUuLjAwYWRh
NmUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYworKysgYi94ZW4vY29tbW9u
L2RldmljZV90cmVlLmMKQEAgLTk4Nyw5ICs5ODcsMTkgQEAgdW5zaWduZWQgaW50IGR0X251bWJl
cl9vZl9pcnEoY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXZpY2UpCiAgICAgY29uc3Qg
c3RydWN0IGR0X2RldmljZV9ub2RlICpwOwogICAgIGNvbnN0IF9fYmUzMiAqaW50c3BlYywgKnRt
cDsKICAgICB1MzIgaW50c2l6ZSwgaW50bGVuOworICAgIGludCBpbnRudW07CiAKICAgICBkdF9k
cHJpbnRrKCJkdF9pcnFfbnVtYmVyOiBkZXY9JXNcbiIsIGRldmljZS0+ZnVsbF9uYW1lKTsKIAor
ICAgIC8qIFRyeSB0aGUgbmV3LXN0eWxlIGludGVycnVwdHMtZXh0ZW5kZWQgZmlyc3QgKi8KKyAg
ICBpbnRudW0gPSBkdF9jb3VudF9waGFuZGxlX3dpdGhfYXJncyhkZXZpY2UsICJpbnRlcnJ1cHRz
LWV4dGVuZGVkIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiI2lu
dGVycnVwdC1jZWxscyIpOworICAgIGlmICggaW50bnVtID4gMCApCisgICAgeworICAgICAgICBk
dF9kcHJpbnRrKCIgaW50bnVtPSVkXG4iLCBpbnRudW0pOworICAgICAgICByZXR1cm4gaW50bnVt
OworICAgIH0KKwogICAgIC8qIEdldCB0aGUgaW50ZXJydXB0cyBwcm9wZXJ0eSAqLwogICAgIGlu
dHNwZWMgPSBkdF9nZXRfcHJvcGVydHkoZGV2aWNlLCAiaW50ZXJydXB0cyIsICZpbnRsZW4pOwog
ICAgIGlmICggaW50c3BlYyA9PSBOVUxMICkKQEAgLTE0MjAsMTAgKzE0MzAsMjkgQEAgaW50IGR0
X2RldmljZV9nZXRfcmF3X2lycShjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldmljZSwK
ICAgICBjb25zdCBfX2JlMzIgKmludHNwZWMsICp0bXAsICphZGRyOwogICAgIHUzMiBpbnRzaXpl
LCBpbnRsZW47CiAgICAgaW50IHJlcyA9IC1FSU5WQUw7CisgICAgc3RydWN0IGR0X3BoYW5kbGVf
YXJncyBhcmdzOworICAgIGludCBpOwogCiAgICAgZHRfZHByaW50aygiZHRfZGV2aWNlX2dldF9y
YXdfaXJxOiBkZXY9JXMsIGluZGV4PSV1XG4iLAogICAgICAgICAgICAgICAgZGV2aWNlLT5mdWxs
X25hbWUsIGluZGV4KTsKIAorICAgIC8qIEdldCB0aGUgcmVnIHByb3BlcnR5IChpZiBhbnkpICov
CisgICAgYWRkciA9IGR0X2dldF9wcm9wZXJ0eShkZXZpY2UsICJyZWciLCBOVUxMKTsKKworICAg
IC8qIFRyeSB0aGUgbmV3LXN0eWxlIGludGVycnVwdHMtZXh0ZW5kZWQgZmlyc3QgKi8KKyAgICBy
ZXMgPSBkdF9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhkZXZpY2UsICJpbnRlcnJ1cHRzLWV4dGVu
ZGVkIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiI2ludGVycnVwdC1j
ZWxscyIsIGluZGV4LCAmYXJncyk7CisgICAgaWYgKCAhcmVzICkKKyAgICB7CisgICAgICAgIGR0
X2RwcmludGsoIiBpbnRzcGVjPSVkIGludHNpemU9JWRcbiIsIGFyZ3MuYXJnc1swXSwgYXJncy5h
cmdzX2NvdW50KTsKKworICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFyZ3MuYXJnc19jb3VudDsg
aSsrICkKKyAgICAgICAgICAgIGFyZ3MuYXJnc1tpXSA9IGNwdV90b19iZTMyKGFyZ3MuYXJnc1tp
XSk7CisKKyAgICAgICAgcmV0dXJuIGR0X2lycV9tYXBfcmF3KGFyZ3MubnAsIGFyZ3MuYXJncywg
YXJncy5hcmdzX2NvdW50LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkciwgb3V0
X2lycSk7CisgICAgfQorCiAgICAgLyogR2V0IHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5ICovCiAg
ICAgaW50c3BlYyA9IGR0X2dldF9wcm9wZXJ0eShkZXZpY2UsICJpbnRlcnJ1cHRzIiwgJmludGxl
bik7CiAgICAgaWYgKCBpbnRzcGVjID09IE5VTEwgKQpAQCAtMTQzMiw5ICsxNDYxLDYgQEAgaW50
IGR0X2RldmljZV9nZXRfcmF3X2lycShjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldmlj
ZSwKIAogICAgIGR0X2RwcmludGsoIiBpbnRzcGVjPSVkIGludGxlbj0lZFxuIiwgYmUzMl90b19j
cHVwKGludHNwZWMpLCBpbnRsZW4pOwogCi0gICAgLyogR2V0IHRoZSByZWcgcHJvcGVydHkgKGlm
IGFueSkgKi8KLSAgICBhZGRyID0gZHRfZ2V0X3Byb3BlcnR5KGRldmljZSwgInJlZyIsIE5VTEwp
OwotCiAgICAgLyogTG9vayBmb3IgdGhlIGludGVycnVwdCBwYXJlbnQuICovCiAgICAgcCA9IGR0
X2lycV9maW5kX3BhcmVudChkZXZpY2UpOwogICAgIGlmICggcCA9PSBOVUxMICkKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
