Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B2F17FE42
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 14:34:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBex2-0003FS-UI; Tue, 10 Mar 2020 13:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QuO/=43=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jBex0-0003FL-Ni
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 13:29:38 +0000
X-Inumbo-ID: 3056aad4-62d3-11ea-92cf-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3056aad4-62d3-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 13:29:37 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id y126so12654792qke.4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6HRNq9BAI9Jo3/+xbo/eArOFRBqLWGQURpBV+0mu0Zc=;
 b=DQBYGlcff3Fedmq1nMdO938TGb2kx5N8NH4qkl9my52UdhBo29amCQOzyXrt8hCXiU
 U1wbO69Iz3caI373YLibXTevBw2zgpLpmXaKL/H3X3BrzzZuBjwBW2xrOnw/bLKJhNP+
 CgswgdqhT+wyhVQZdvP7um0+yPSsbyubh9+nrtKAQ46fXaHgothPEF8cGuyhxampehat
 UuPoGOUHncp43o1RGUYfftbUOpqPlvudLg0d3oZPnNSE6lQBRsSzw2cDHNQo0cMqzhXW
 gLPAnsLNlByFJlPtfKX6gMCR/Gs/KWpRYZeoJ1tND1O21WgipDrbKIz4mFJ7pdNSZhAf
 vAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6HRNq9BAI9Jo3/+xbo/eArOFRBqLWGQURpBV+0mu0Zc=;
 b=Oa5WuC9uIlsE+1vU1x3nrnDLa6X3V8EIOhUYf/ZgT+I/9DC1TqfEX9NOAjn0jjsbSp
 H9flo0YgTudrsxIIPNA1N+LLRjv+bwgzzo0ItfzksHTQLfs9yJBNlc3+5oKnrGsK0bzg
 xl6WiRtvFZrsH0i6aDJQuxkvD+CjeTDgpqf5lohj8n4inn/bDELks2AV64/G7DlKFBFo
 wF0RVLFOjUIizSCvll6msmxJZHBBekegfc+v2sM2RDEUmvwmNnfivursGHmHc8i3ffZD
 QvvxKLIwQMvOmf3DtmH6lrNZLUV1pmQxbOtA/u7HwXr0/l4PA4SRh7VVmGmubhlvGKKJ
 BXYA==
X-Gm-Message-State: ANhLgQ04Cij+vUm/ExRWGb0q0gczKFpNNm548T4V3O5fXgcAf0aMf/Oo
 KkFCOHCU6EZHWisqi7UAbn5z0vlw
X-Google-Smtp-Source: ADFU+vtiGe7f7iOL7cVA1xMfQZWT4467b0V9dWMjN2DnlPRMx+wQpdkGQiie3u+qzuvl3eMWLAcG1Q==
X-Received: by 2002:a37:9f42:: with SMTP id i63mr19791871qke.192.1583846976955; 
 Tue, 10 Mar 2020 06:29:36 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 206sm11184689qkn.36.2020.03.10.06.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:29:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Mar 2020 09:29:04 -0400
Message-Id: <20200310132904.16992-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] scripts: Use stat to check lock claim
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwbGFjZSB0aGUgcGVybCBsb2NraW5nIGNoZWNrIHdpdGggc3RhdCgxKS4gIFN0YXQgaXMgYWJs
ZSB0byBmc3RhdApzdGRpbiAoZmlsZSBkZXNjcmlwdG9yIDApIHdoZW4gcGFzc2VkICctJyBhcyBh
biBhcmd1bWVudC4gIFRoaXMgaXMgbm93CnVzZWQgdG8gY2hlY2sgJF9sb2NrZmQuICBzdGF0KDEp
IHN1cHBvcnQgZm9yICctJyB3YXMgaW50cm9kdWNlZCB0bwpjb3JldXRpbHMgaW4gMjAwOS4KCkFm
dGVyIEEgcmVsZWFzZXMgaXRzIGxvY2ssIHNjcmlwdCBCIHdpbGwgcmV0dXJuIGZyb20gZmxvY2sg
YW5kIGV4ZWN1dGUKc3RhdC4gIFNpbmNlIHRoZSBsb2NrZmlsZSBoYXMgYmVlbiByZW1vdmVkIGZy
b20gQSwgc3RhdCBwcmludHMgYW4gZXJyb3IKdG8gc3RkZXJyIGFuZCBleGl0cyBub24temVyby4g
ICd8fCA6JyBpcyBuZWVkZWQgdG8gc3F1YXNoIHRoZSBub24temVybwpleGl0IHN0YXR1cyAtIG90
aGVyd2lzZSB0aGUgc2NyaXB0IHRlcm1pbmF0ZXMgc2luY2UgYHNldCAtZWAgaXMgZW5hYmxlZC4K
c3RkZXJyIG5lZWRzIHRvIGJlIHJlZGlyZWN0ZWQgdG8gL2Rldi9udWxsIG90aGVyd2lzZQovdmFy
L2xvZy94ZW4veGVuLWhvdHBsdWcubG9nIHdpbGwgZ2V0IGZpbGxlZCB3aXRoICJObyBzdWNoIGZp
bGUgb3IKZGlyZWN0b3J5IiBtZXNzYWdlcy4KClRoaXMgY2hhbmdlIHJlbW92ZXMgdGhlIG9ubHkg
cnVudGltZSBkZXBlbmRlbmN5IG9mIHRoZSB4ZW4gdG9vbHN0YWNrIG9uCnBlcmwuCgpXaGlsZSBo
ZXJlLCByZXBsYWNlIHNvbWUgdGFicyB3aXRoIHNwYWNlcyB0byBtYXRjaCB0aGUgcmVzdCBvZiB0
aGUgZmlsZS4KClN1Z2dlc3RlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5j
b20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KLS0t
CiB0b29scy9ob3RwbHVnL0xpbnV4L2xvY2tpbmcuc2ggfCAyOCArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9sb2NraW5nLnNoIGIvdG9vbHMv
aG90cGx1Zy9MaW51eC9sb2NraW5nLnNoCmluZGV4IGM2YTdlOTZmZjkuLjAzMzYxZjQwNWYgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgvbG9ja2luZy5zaAorKysgYi90b29scy9ob3Rw
bHVnL0xpbnV4L2xvY2tpbmcuc2gKQEAgLTQxLDcgKzQxLDkgQEAgY2xhaW1fbG9jaygpCiAgICAg
IyBmcm9tIGNoaWFyay11dGlscywgZXhjZXB0IHVzaW5nIGZsb2NrLiAgSXQgaGFzIHRoZSBiZW5l
Zml0IG9mCiAgICAgIyBpdCBiZWluZyBwb3NzaWJsZSB0byBzYWZlbHkgcmVtb3ZlIHRoZSBsb2Nr
ZmlsZSB3aGVuIGRvbmUuCiAgICAgIyBTZWUgYmVsb3cgZm9yIGEgY29ycmVjdG5lc3MgcHJvb2Yu
Ci0gICAgbG9jYWwgcmlnaHRmaWxlCisgICAgbG9jYWwgc3RhdAorICAgIGxvY2FsIGZkX3N0YXQK
KyAgICBsb2NhbCBmaWxlX3N0YXQKICAgICB3aGlsZSB0cnVlOyBkbwogICAgICAgICBldmFsICJl
eGVjICRfbG9ja2ZkPD4kX2xvY2tmaWxlIgogICAgICAgICBmbG9jayAteCAkX2xvY2tmZCB8fCBy
ZXR1cm4gJD8KQEAgLTUwLDE2ICs1MiwyMCBAQCBjbGFpbV9sb2NrKCkKICAgICAgICAgIyBhY3R1
YWxseSBhIHN5bnRoZXRpYyBzeW1saW5rIGluIC9wcm9jIGFuZCB3ZSBhcmVuJ3QKICAgICAgICAg
IyBndWFyYW50ZWVkIHRoYXQgb3VyIHN0YXQoMikgd29uJ3QgbG9zZSB0aGUgcmFjZSB3aXRoIGFu
CiAgICAgICAgICMgcm0oMSkgYmV0d2VlbiByZWFkaW5nIHRoZSBzeW50aGV0aWMgbGluayBhbmQg
dHJhdmVyc2luZyB0aGUKLSAgICAgICAgIyBmaWxlIHN5c3RlbSB0byBmaW5kIHRoZSBpbnVtLiAg
UGVybCBpcyB2ZXJ5IGZhc3Qgc28gdXNlIHRoYXQuCi0gICAgICAgIHJpZ2h0ZmlsZT0kKCBwZXJs
IC1lICcKLSAgICAgICAgICAgIG9wZW4gU1RESU4sICI8JickX2xvY2tmZCciIG9yIGRpZSAkITsK
LSAgICAgICAgICAgIG15ICRmZF9pbnVtID0gKHN0YXQgU1RESU4pWzFdOyBkaWUgJCEgdW5sZXNz
IGRlZmluZWQgJGZkX2ludW07Ci0gICAgICAgICAgICBteSAkZmlsZV9pbnVtID0gKHN0YXQgJEFS
R1ZbMF0pWzFdOwotICAgICAgICAgICAgcHJpbnQgInlcbiIgaWYgJGZkX2ludW0gZXEgJGZpbGVf
aW51bTsKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJyAiJF9sb2NrZmlsZSIgKQotICAg
ICAgICBpZiBbIHgkcmlnaHRmaWxlID0geHkgXTsgdGhlbiBicmVhazsgZmkKLQkjIFNvbWUgdmVy
c2lvbnMgb2YgYmFzaCBhcHBlYXIgdG8gYmUgYnVnZ3kgaWYgdGhlIHNhbWUKLQkjICRfbG9ja2Zp
bGUgaXMgb3BlbmVkIHJlcGVhdGVkbHkuIENsb3NlIHRoZSBjdXJyZW50IGZkIGhlcmUuCisgICAg
ICAgICMgZmlsZSBzeXN0ZW0gdG8gZmluZCB0aGUgaW51bS4gIHN0YXQoMSkgdHJhbnNsYXRlcyAn
LScgaW50byBhbgorICAgICAgICAjIGZzdGF0KDIpIG9mIEZEIDAuICBTbyB3ZSBqdXN0IG5lZWQg
dG8gYXJyYW5nZSB0aGUgRkRzIHByb3Blcmx5CisgICAgICAgICMgdG8gZ2V0IHRoZSBmc3RhdCgy
KSB3ZSBuZWVkLiAgc3RhdCB3aWxsIG91dHB1dCB0d28gbGluZXMgbGlrZToKKyAgICAgICAgIyBX
Vy5YWFgKKyAgICAgICAgIyBZWS5aWloKKyAgICAgICAgIyB3aGljaCBuZWVkIHRvIGJlIHNlcGFy
YXRlZCBhbmQgY29tcGFyZWQuCisgICAgICAgIHN0YXQ9JCggc3RhdCAtTCAtYyAnJUQuJWknIC0g
JF9sb2NrZmlsZSAwPCYkX2xvY2tmZCAyPi9kZXYvbnVsbCB8fCA6ICkKKyAgICAgICAgaWYgWyAt
biAiJHN0YXQiIF07IHRoZW4KKyAgICAgICAgICAgIGZkX3N0YXQ9JCggZWNobyAiJHN0YXQiIHwg
c2VkIC1uICcxcCcgKQorICAgICAgICAgICAgZmlsZV9zdGF0PSQoIGVjaG8gIiRzdGF0IiB8IHNl
ZCAtbiAnMnAnICkKKyAgICAgICAgICAgIGlmIFsgIiRmZF9zdGF0IiA9ICIkZmlsZV9zdGF0IiBd
IDsgdGhlbiBicmVhazsgZmkKKyAgICAgICAgZmkKKyAgICAgICAgIyBTb21lIHZlcnNpb25zIG9m
IGJhc2ggYXBwZWFyIHRvIGJlIGJ1Z2d5IGlmIHRoZSBzYW1lCisgICAgICAgICMgJF9sb2NrZmls
ZSBpcyBvcGVuZWQgcmVwZWF0ZWRseS4gQ2xvc2UgdGhlIGN1cnJlbnQgZmQgaGVyZS4KICAgICAg
ICAgZXZhbCAiZXhlYyAkX2xvY2tmZDwmLSIKICAgICBkb25lCiB9Ci0tIAoyLjI0LjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
