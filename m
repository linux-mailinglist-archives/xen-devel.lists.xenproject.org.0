Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A6118CFB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:50:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehkm-0003Ki-1R; Tue, 10 Dec 2019 15:48:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1/D=2A=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iehkj-0003J1-S3
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:48:45 +0000
X-Inumbo-ID: 73741506-1b64-11ea-a1e1-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73741506-1b64-11ea-a1e1-bc764e2007e4;
 Tue, 10 Dec 2019 15:48:03 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 38so3130825qtb.13
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2019 07:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c8eG9nY6uSAld50WZyo55/GW778waof2L41HLOEHCKQ=;
 b=bGd4ymgkVlVL1phXwcmu5aPmfqdTvLi6u5ExaiW9g829fXig+NFceUzr6jTqtV5gwf
 eYIuiTYlaXmrTnukn6XCoLjlQlBFSHZTtzP2RcN0w8sV70fqZ0jEnbs4a0e4Dp0UIcFD
 lT2eE3O1i09NHJ9ORk4nd6QBgdQjXc5o2CJXyQcytZmqOcmnbIfYiuOv7QV5MGCLUd/4
 CPWXCR+OdVwWhMtt/+sg+/5+HR1aIikUC+p4Twuo+tFE/QFWus64gOEPlRqi2PhMVwI2
 0ikez2OYCUS/T9Z7g96/PKv2GEyDwgFYeVC40PSXp0GCe/49mdokT8SwMlSs/JwDOkyc
 idzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8eG9nY6uSAld50WZyo55/GW778waof2L41HLOEHCKQ=;
 b=ai1fpvJmD0rhGP46/6x1a3x7wbIuiiKADNJbXpgwAqOvXK7a6wDMa0VS3gZx7PULXm
 qvX0/14f8Fa4AtFfaba2t7SDWVqBEAv8yMKWmGHctCiIOFoGg4G5Z5oXzdQO0iL2nCy1
 DqJa8nzaVeZP8CKbDYFk+S5mKVxh7myG6rsoj21RpzQDCXS+tHEqAQjAp188v+JejWsO
 lT/pH8o3UtQ2xrGsQsATKHMeTTp7+qP9HMFTzO7O1oqMxXkh4LEes4DYbJ95+j+uRAl9
 4fWeX3LGkv8Cv9fOWroWHVK0F7YfS7tgZCiawEkztSa6Juvw9tJDwTEEx3R9nV5CyuSw
 DAqQ==
X-Gm-Message-State: APjAAAUT5iik6+NFWhxJ+rRvurHkMVbyqehXgUE22qSJWXRE/9NoMQJo
 6LTOo4b8XCYYt0eQChCbTJbjZbG8
X-Google-Smtp-Source: APXvYqz8TJn17TN6D32LLH5uf7D2c0reXOGZrLTbJ9v2fyFuFDZQHnaIsX4Y0WMjgqTi4SuVUxxP4g==
X-Received: by 2002:ac8:5159:: with SMTP id h25mr31205583qtn.101.1575992882974; 
 Tue, 10 Dec 2019 07:48:02 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id m29sm1247848qtf.1.2019.12.10.07.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 07:48:02 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 10 Dec 2019 10:47:26 -0500
Message-Id: <0003ff86099be24d6b5a2131393189da6bf5bab7.1575990937.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1575990937.git.rosbrookn@ainfosec.com>
References: <cover.1575990937.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 11/22] golang/xenlight: re-factor Uuid type
 implementation
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClJlLWRlZmluZSBV
dWlkIGFzIFsxNl1ieXRlIGFuZCBpbXBsZW1lbnQgZnJvbUMsIHRvQywgYW5kIFN0cmluZyBmdW5j
dGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMu
Y29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBJbiBmcm9tQywgaXRlcmF0ZSBvdmVyIHRoZSBpbmRp
cmVjdCBvZiB1IGluc3RlYWQgb2YgY3JlYXRpbmcgYQogIHNsaWNlIGZyb20gdGhlIEMgdHlwZS4K
LS0tCiB0b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28gfCAzNSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQu
Z28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggNmI4N2JmODU3ZC4u
ZjljMmY4NGM4MSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0Lmdv
CisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtODYsNyArODYsMzgg
QEAgdHlwZSBEZXZpZCBpbnQKIAogdHlwZSBNZW1LQiB1aW50NjQKIAotdHlwZSBVdWlkIEMubGli
eGxfdXVpZAorLy8gVXVpZCBpcyBhIGRvbWFpbiBVVUlELgordHlwZSBVdWlkIFsxNl1ieXRlCisK
Ky8vIFN0cmluZyBmb3JtYXRzIGEgVXVpZCBpbiB0aGUgZm9ybSAieHh4eC14eC14eC14eC14eHh4
eHgiLgorZnVuYyAodSBVdWlkKSBTdHJpbmcoKSBzdHJpbmcgeworCXMgOj0gIiV4JXgleCV4LSV4
JXgtJXgleC0leCV4LSV4JXgleCV4JXgleCIKKwlvcHRzIDo9IG1ha2UoW11pbnRlcmZhY2V7fSwg
MTYpCisKKwlmb3IgaSwgdiA6PSByYW5nZSB1IHsKKwkJb3B0c1tpXSA9IHYKKwl9CisKKwlyZXR1
cm4gZm10LlNwcmludGYocywgb3B0cy4uLikKK30KKworZnVuYyAodSAqVXVpZCkgZnJvbUMoYyAq
Qy5saWJ4bF91dWlkKSBlcnJvciB7CisJZm9yIGkgOj0gcmFuZ2UgKnUgeworCQl1W2ldID0gYnl0
ZShjLnV1aWRbaV0pCisJfQorCisJcmV0dXJuIG5pbAorfQorCitmdW5jICh1ICpVdWlkKSB0b0Mo
KSAoQy5saWJ4bF91dWlkLCBlcnJvcikgeworCXZhciBjIEMubGlieGxfdXVpZAorCisJZm9yIGks
IHYgOj0gcmFuZ2UgdSB7CisJCWMudXVpZFtpXSA9IEMudWludDhfdCh2KQorCX0KKworCXJldHVy
biBjLCBuaWwKK30KIAogLy8gZGVmYm9vbFZhbCByZXByZXNlbnRzIGEgZGVmYm9vbCB2YWx1ZS4K
IHR5cGUgZGVmYm9vbFZhbCBpbnQKQEAgLTQ5NSw3ICs1MjYsNyBAQCB0eXBlIERvbWluZm8gc3Ry
dWN0IHsKIGZ1bmMgKGNkaSAqQy5saWJ4bF9kb21pbmZvKSB0b0dvKCkgKGRpICpEb21pbmZvKSB7
CiAKIAlkaSA9ICZEb21pbmZve30KLQlkaS5VdWlkID0gVXVpZChjZGkudXVpZCkKKwlkaS5VdWlk
LmZyb21DKCZjZGkudXVpZCkKIAlkaS5Eb21pZCA9IERvbWlkKGNkaS5kb21pZCkKIAlkaS5Tc2lk
cmVmID0gdWludDMyKGNkaS5zc2lkcmVmKQogCWRpLlNzaWRMYWJlbCA9IEMuR29TdHJpbmcoY2Rp
LnNzaWRfbGFiZWwpCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
