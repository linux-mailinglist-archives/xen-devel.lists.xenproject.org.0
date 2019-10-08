Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60ABCFC11
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 16:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHqCB-0006tw-8b; Tue, 08 Oct 2019 14:10:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jabB=YB=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iHqC9-0006tr-8W
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 14:10:33 +0000
X-Inumbo-ID: 6333776a-e9d5-11e9-80e3-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6333776a-e9d5-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 14:10:32 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m13so17667792ljj.11
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2019 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BFNvk6/uRsN/nLO6lYEdySTeJPvtIorsHo2OuKC6ocU=;
 b=G5JktpLdkueISUQoch2RqH8bpSoUxzCNLJgCv3/EPorO/qPWhLE4jgFzIKYVejMY9d
 4DE+O0qct0XcmDUaDe/J3kXm98mu/Ki3FQRbHKdHBHou7OoSqz8MrvzMumov7wduTafN
 jC2a/QpHHbf9IUPvrDmHthe/RCTxJklTqFLTSgyRt50CVSJYAx/I8qWiXXE8ambCCbYX
 LUpYhk1QAB4kPJhSg41A8zVua0PJasTt4qXtACne3u8FRGvwA56B81/WHApGzlC5Uepi
 JQUCH0SdvgHgOy4+a9PvOjKEO5EUHtjqZB14AhTPw2yfTuK/ZQi/gU94q5kUMO27zjQm
 EeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BFNvk6/uRsN/nLO6lYEdySTeJPvtIorsHo2OuKC6ocU=;
 b=pB49o6uvIvYUjPXc8GC+j7WVhri9NR8K4AX/nmChNQVUYOwcyxV2rJPp4H3eBtof5f
 S5sewLDF8wRxLtGycwyYlxyMiY/xRrrZSk6NDMRp2UuaWvQfe8QTrO/xVCcgeUnGXpZ+
 q7U6IKpOmCTZjEHeAqyp0AHjEecBSLqvayXdTfHwC8gnEi636GwSLBzwizUaJpMc8B9N
 RfAN+6V6L5X6cKK8iovXRBjG+zs/MvGy0XsVVbFozRTxfY85XUEooRtLNG5YwYdj3gL7
 jhdfc4ne5qNLvWqsdJZiDmmnffe1WFMRHHL4zJM9FF4VUxVZU1noGvl75Vl14EnnZYOt
 m51w==
X-Gm-Message-State: APjAAAXvlqsHXNA0Vek/Ew9oLcDP4EKY5dZKS3nRlFWl8LGf3LLrIgx6
 31dZWxJeOVQJs9kkwgFBHfUswaJio5c=
X-Google-Smtp-Source: APXvYqzDKGkpCBRRdG3NiocRIEv2dgnEgnJRto7t0ONQdCF43HhFj0EwfFto47ggOjU7D4UTCkto2Q==
X-Received: by 2002:a2e:9d44:: with SMTP id y4mr22940131ljj.115.1570543830523; 
 Tue, 08 Oct 2019 07:10:30 -0700 (PDT)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z20sm4937764ljk.63.2019.10.08.07.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 07:10:30 -0700 (PDT)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  8 Oct 2019 17:10:22 +0300
Message-Id: <20191008141024.10885-1-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH v1 0/2] Remove backend xen store entry on domain
 destroy
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
Cc: Oleksandr Grytsov <oleksandr_grytsov@epam.com>, ian.jackson@eu.citrix.com,
 wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKV2Ug
aGF2ZSBhZGRlZCBWS0JEIGRldmljZSB3aXRoIHVzZXIgc3BhY2UgUFYgYmFja2VuZC4gQnV0IGxp
YnhsIGNhbid0CmRpZmZlcmVudGlhdGUgZG9tYWluIGtpbmQgZm9yIHRoaXMgZGV2aWNlLiBBcyBy
ZXN1bHQsIGl0IHBlcmZvcm1zIFFFTVUgcHJvY2VkdXJlCmZvciBhZGRpbmcgYW5kIHJlbW92aW5n
IFZLQiBkZXZpY2Ugd2l0aCB1c2VyIHNwYWNlIGJhY2tlbmQuIFRvIGZpeCB0aGlzIGlzc3VlLApu
ZXcgZGV2aWNlIGtpbmQgVklOUFVUIGlzIGludHJvZHVjZWQuIEl0IGlzIHVzZWQgYXMgYmFja2Vu
ZCBraW5kIGluIGNhc2Ugb2YKdXNlciBzcGFjZSBWS0JEIGJhY2tlbmQuIAoKQW5vdGhlciBpc3N1
ZSBhZGRyZXNzZXMgaW4gdGhpcyBwYXRjaCBzZXJpZXMgaXMgZXJyb3IgdGltZW91dCBvbiBndWVz
dCBkb21haW4KZGVzdHJveSBpbiBjYXNlIHVzaW5nIHVzZXIgc3BhY2UgUFYgYmFja2VuZHMuCgpX
ZSBoYXZlIGEgZHJpdmVyIGRvbWFpbiB3aXRoIHVzZXIgc3BhY2UgYmFja2VuZHMgKFZESVNQTCwg
VlNORCwgVktCRCkuIFdoZW4gYQpndWVzdCBkb21haW4gZGVzdHJveWVkLCB3ZSBzZWUgZm9sbG93
aW5nIGVycm9yOgoKICAgICJ0aW1lZCBvdXQgd2hpbGUgd2FpdGluZyBmb3IgLi4uIHRvIGJlIHJl
bW92ZWQiCgp4bCBleHBlY3RzIHRoYXQgUFYgZGV2aWNlIGJhY2tlbmQgZW50cmllcyBpcyByZW1v
dmVkLiB4bCBkZXZkIHJlbW92ZXMgdGhlc2UKZW50cmllcyBmb3Igc3BlY2lmaWMgZGV2aWNlcyBv
bmx5OiBWQkQsIFZJRiwgUURJU0sgYW5kIHRoZW4gZGVsZXRlcyB0aGUgZ3Vlc3QKZG9tYWluIGZy
b20gdGhlIGxpc3QuIFRoZSBmaXggaXMgdG8gZGVsZXRlIGd1ZXN0IGRvbWFpbiBvbmx5IGFmdGVy
IGFsbCBkZXZpY2VzCmFyZSByZW1vdmVkIGFuZCBwZXJmb3JtcyBnZW5lcmljIGRldmljZSByZW1v
dmUgcHJvY2VkdXJlIGZvciBmb2xsb3dpbmcgZGV2aWNlOgpWSU5QVVQsIFZESVNQTCwgVlNORC4K
Ck9sZWtzYW5kciBHcnl0c292ICgyKToKICBsaWJ4bDogaW50cm9kdWNlIG5ldyBiYWNrZW5kIHR5
cGUgVklOUFVUCiAgbGlieGw6IGFkZCByZW1vdmluZyBYUyBiYWNrZW5kIHBhdGggZm9yIFBWIGRl
dmljZXMgb24gZG9tYWluIGRlc3Ryb3kKCiB0b29scy9saWJ4bC9saWJ4bF9kZXZpY2UuYyAgICAg
ICAgICAgfCAxNCArKysrKy0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXNfaW50ZXJu
YWwuaWRsIHwgIDEgKwogdG9vbHMvbGlieGwvbGlieGxfdmtiLmMgICAgICAgICAgICAgIHwgMjkg
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
