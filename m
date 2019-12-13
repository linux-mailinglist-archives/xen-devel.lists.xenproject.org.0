Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AE311E6B8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:38:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmzW-00039H-Pi; Fri, 13 Dec 2019 15:36:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tyHa=2D=gmail.com=sj38.park@srs-us1.protection.inumbo.net>)
 id 1ifmzV-00038j-80
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:36:29 +0000
X-Inumbo-ID: 4cac3b86-1dbe-11ea-b6f1-bc764e2007e4
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cac3b86-1dbe-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 15:36:15 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id b9so1732741pgk.12
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 07:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HItEjzDojjooTRgp7O+9O0H7zbWi0kBed0e15OEYpt0=;
 b=WGmHyUFRPZ2ZOsbgcmAPSFO/Jexvz5NhLELGWHpv4Tl7qQZg36Vg1cx8oxxQ1a/E/l
 EpkpKqjdaGAGiWyOm+O7jp87MuU04zC2UgwiOV71LLy4XY6o2Ai499milKGvgTZClPXd
 8cXbdDeNoLvi/fBx35UA9HHFm8dpmuGDNYDAltfHpPiutYGj2dPxtvwOEBxRyti/aA89
 l3D1qL3yyee9OuIAkYTHYJP/KJoLRnMdh4oqoE5+3R0TrgiP0pLEbjmjX/nLxEVtgcZx
 n4PYI+yrps2gpGDaMFk8KaqSqtDKEQaECLkTtO1OIuv5l43esfdmWGkDyuEwfX9MJgHf
 o0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HItEjzDojjooTRgp7O+9O0H7zbWi0kBed0e15OEYpt0=;
 b=Ft7ronezrrwFXp6XUQoWdLJiLm5f5JhXjAg74Tan40coELZaEdo54PezwGZPbfD7Gt
 6l2aHqnOhR8FNKgZViNkiyz7IOBqd7WJtV/euxCmrC7Uzvmx3XXBXqBMAsHpGwA9DbQy
 sUfwi8C2d8rAdhudNAOOfKsMahuHpVg1RNik4N8QMuqQaY38yQuxthf0GhGsr8ERJ5Pg
 8De3zj3h09metNYbiS6NyVr8idrOqzEtu3H4i2kEcAaPZhFm/kqq5OZzMrOPqz2YnH5R
 kjomYUKPPshM3RKDQTUz4VIB+NhlUKc9Nwg0ROLskkXkIyQCZaZy6Pb3/6d3RatcbZl0
 GdDA==
X-Gm-Message-State: APjAAAVMW0JGx9TZBjvvz0nXkoKeYTWIMhayvQLSSVO/xtY6pVhdbp4p
 rFrTKTmJ0l8p9N71RBtXqEY=
X-Google-Smtp-Source: APXvYqxC4ktjLQPkeK71MAy6/aFEcGoWvqtBT2iJQcTdeQzmCeLS4XtlZzU1Y8SN2p03/7qGvSO/4A==
X-Received: by 2002:a62:1a16:: with SMTP id a22mr69199pfa.34.1576251375146;
 Fri, 13 Dec 2019 07:36:15 -0800 (PST)
Received: from localhost.localdomain ([12.176.148.120])
 by smtp.gmail.com with ESMTPSA id w131sm12039217pfc.16.2019.12.13.07.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 07:36:14 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
X-Google-Original-From: SeongJae Park <sjpark@amazon.de>
To: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 roger.pau@citrix.com
Date: Fri, 13 Dec 2019 15:35:46 +0000
Message-Id: <20191213153546.17425-5-sjpark@amazon.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213153546.17425-1-sjpark@amazon.de>
References: <20191213153546.17425-1-sjpark@amazon.de>
Subject: [Xen-devel] [PATCH v9 4/4] xen/blkback: Consistently insert one
 empty line between functions
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
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG51bWJlciBvZiBlbXB0eSBsaW5lcyBiZXR3ZWVuIGZ1bmN0aW9ucyBpbiB0aGUgeGVuYnVz
LmMgaXMKaW5jb25zaXN0ZW50LiAgVGhpcyB0cml2aWFsIHN0eWxlIGNsZWFudXAgY29tbWl0IGZp
eGVzIHRoZSBmaWxlIHRvCmNvbnNpc3RlbnRseSBwbGFjZSBvbmx5IG9uZSBlbXB0eSBsaW5lLgoK
U2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KLS0tCiBkcml2
ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCmluZGV4IDRmNmVhNGZlY2E3OS4uZGMwZWExMjNjNzRjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJs
a2JhY2sveGVuYnVzLmMKQEAgLTQzMiw3ICs0MzIsNiBAQCBzdGF0aWMgdm9pZCB4ZW52YmRfc3lz
ZnNfZGVsaWYoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKIAlkZXZpY2VfcmVtb3ZlX2ZpbGUo
JmRldi0+ZGV2LCAmZGV2X2F0dHJfcGh5c2ljYWxfZGV2aWNlKTsKIH0KIAotCiBzdGF0aWMgdm9p
ZCB4ZW5fdmJkX2ZyZWUoc3RydWN0IHhlbl92YmQgKnZiZCkKIHsKIAlpZiAodmJkLT5iZGV2KQpA
QCAtNDg5LDYgKzQ4OCw3IEBAIHN0YXRpYyBpbnQgeGVuX3ZiZF9jcmVhdGUoc3RydWN0IHhlbl9i
bGtpZiAqYmxraWYsIGJsa2lmX3ZkZXZfdCBoYW5kbGUsCiAJCWhhbmRsZSwgYmxraWYtPmRvbWlk
KTsKIAlyZXR1cm4gMDsKIH0KKwogc3RhdGljIGludCB4ZW5fYmxrYmtfcmVtb3ZlKHN0cnVjdCB4
ZW5idXNfZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUgPSBkZXZfZ2V0
X2RydmRhdGEoJmRldi0+ZGV2KTsKQEAgLTU3Miw2ICs1NzIsNyBAQCBzdGF0aWMgdm9pZCB4ZW5f
YmxrYmtfZGlzY2FyZChzdHJ1Y3QgeGVuYnVzX3RyYW5zYWN0aW9uIHhidCwgc3RydWN0IGJhY2tl
bmRfaW5mbwogCWlmIChlcnIpCiAJCWRldl93YXJuKCZkZXYtPmRldiwgIndyaXRpbmcgZmVhdHVy
ZS1kaXNjYXJkICglZCkiLCBlcnIpOwogfQorCiBpbnQgeGVuX2Jsa2JrX2JhcnJpZXIoc3RydWN0
IHhlbmJ1c190cmFuc2FjdGlvbiB4YnQsCiAJCSAgICAgIHN0cnVjdCBiYWNrZW5kX2luZm8gKmJl
LCBpbnQgc3RhdGUpCiB7CkBAIC02NTYsNyArNjU3LDYgQEAgc3RhdGljIGludCB4ZW5fYmxrYmtf
cHJvYmUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAlyZXR1cm4gZXJyOwogfQogCi0KIC8q
CiAgKiBDYWxsYmFjayByZWNlaXZlZCB3aGVuIHRoZSBob3RwbHVnIHNjcmlwdHMgaGF2ZSBwbGFj
ZWQgdGhlIHBoeXNpY2FsLWRldmljZQogICogbm9kZS4gIFJlYWQgaXQgYW5kIHRoZSBtb2RlIG5v
ZGUsIGFuZCBjcmVhdGUgYSB2YmQuICBJZiB0aGUgZnJvbnRlbmQgaXMKQEAgLTc0OCw3ICs3NDgs
NiBAQCBzdGF0aWMgdm9pZCBiYWNrZW5kX2NoYW5nZWQoc3RydWN0IHhlbmJ1c193YXRjaCAqd2F0
Y2gsCiAJfQogfQogCi0KIC8qCiAgKiBDYWxsYmFjayByZWNlaXZlZCB3aGVuIHRoZSBmcm9udGVu
ZCdzIHN0YXRlIGNoYW5nZXMuCiAgKi8KQEAgLTgyMyw3ICs4MjIsNiBAQCBzdGF0aWMgdm9pZCBm
cm9udGVuZF9jaGFuZ2VkKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCiAJfQogfQogCi0KIC8q
IE9uY2UgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsIHNxdWVlemUgZnJlZSBwYWdlIHBv
b2xzIGZvciBhIHdoaWxlLiAqLwogc3RhdGljIHVuc2lnbmVkIGludCBidWZmZXJfc3F1ZWV6ZV9k
dXJhdGlvbl9tcyA9IDEwOwogbW9kdWxlX3BhcmFtX25hbWVkKGJ1ZmZlcl9zcXVlZXplX2R1cmF0
aW9uX21zLApAQCAtODQ0LDcgKzg0Miw2IEBAIHN0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0
cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCiAKIC8qICoqIENvbm5lY3Rpb24gKiogKi8KIAotCiAv
KgogICogV3JpdGUgdGhlIHBoeXNpY2FsIGRldGFpbHMgcmVnYXJkaW5nIHRoZSBibG9jayBkZXZp
Y2UgdG8gdGhlIHN0b3JlLCBhbmQKICAqIHN3aXRjaCB0byBDb25uZWN0ZWQgc3RhdGUuCi0tIAoy
LjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
