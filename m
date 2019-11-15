Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83B2FE5F7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:48:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhYR-0002cT-JU; Fri, 15 Nov 2019 19:46:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1SQg=ZH=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iVhYP-0002ao-J1
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:46:49 +0000
X-Inumbo-ID: 78fe067c-07e0-11ea-984a-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78fe067c-07e0-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 19:45:27 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id w11so4214811qvu.13
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egIM9yCGWbdecCrAFUBjEjOn4j3q9tSDSDea7oC7rr8=;
 b=H4/BTJzhowbQudbGlUu2y2yu3ohdaDXN4m35scKXn7VM5ZTTcckffHXXFeB1lGeqfJ
 DljoBg2YxHm3akcFieuKNqF4E/nl+5pxVoBXZdjv8NX+kyeR/4Nte6yOhd7AYczGz6YV
 skZeUmO5CbL/QPjLf5RtupNah2CwrtYmBr5NmBsKlU0GC0kUOueg6aORDmQTJsSeEKDG
 dkwycdTBSi/NxiLcJ1PUzkwbHGPwRMMdsiz3sA5Gli+i/UJmqwXNKT0x9O3EkRf3C42m
 uScj3FAxoKQTHUV3KoUeruxqfgVicMX4mWKh2yR/V6VaHYnwiwVYVYZ7RjI8kmlrQwoZ
 dovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egIM9yCGWbdecCrAFUBjEjOn4j3q9tSDSDea7oC7rr8=;
 b=gKOCbkAGmWCcDZ2k1fgk7s4ysc46n+HbTgxAfz2LY63KWmWSDcO8/G4+0NWEna+A0V
 H5aIbRcCHG71ev2I0paEvbhbq7wC1GYVv9mS1GEFWCDwXHG3HWbeKONXTVgO1Ujo69em
 9z3MAL+IP2fox/3iBvoEv4paQ6IbOg7WtSfeCs0KrPabaW4e3skIOc4Ou57FQSlLSooT
 +QCCdCZOD5idlQ09WY7sDJdfunH+4wz8JLbPdbbc/lvDBS1OZWuRjot7V+bDpPnvlZlq
 LdwE6uxWahh7mlxucEucuENqDqs44Wlkx4r59QSdQe3PIgr7SZfmb2tub31F609NxU8B
 3w8A==
X-Gm-Message-State: APjAAAWIRz79gpJiBDdIkXtZR4uHt4lYymAijvdnJivjHXoFku+gwqM7
 Uw8A3aDo6uaWFIPeezT1qQ+yTAvy
X-Google-Smtp-Source: APXvYqxeh+EiRrpVmslLrzkou8tKzpPqwcB8kEp9mS+xwPoIPUMchMQsqucQXHEDj6bM7E4zGo5ipg==
X-Received: by 2002:ad4:4c4d:: with SMTP id
 cs13mr15555360qvb.165.1573847126507; 
 Fri, 15 Nov 2019 11:45:26 -0800 (PST)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id y10sm4649679qkb.55.2019.11.15.11.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 11:45:25 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 15 Nov 2019 14:44:29 -0500
Message-Id: <b9b0c1f4cee5ef5e1a366a0ba96bdbc16b415062.1573840474.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1573840473.git.rosbrookn@ainfosec.com>
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 22/22] golang/xenlight: add error return type
 to Context.Cpupoolinfo
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

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkEgcHJldmlvdXMg
Y29tbWl0IHRoYXQgcmVtb3ZlZCBDb250ZXh0LkNoZWNrT3BlbiByZXZlYWxlZAphbiBpbmVmZmVj
dHVhbCBhc3NpZ25lbnQgdG8gZXJyIGluIENvbnRleHQuQ3B1cG9vbGluZm8sIGFzCnRoZXJlIGlz
IG5vIGVycm9yIHJldHVybiB0eXBlLgoKU2luY2UgaXQgYXBwZWFycyB0aGF0IHRoZSBpbnRlbnQg
aXMgdG8gcmV0dXJuIGFuIGVycm9yIGhlcmUsCmFkZCBhbiBlcnJvciByZXR1cm4gdmFsdWUgdG8g
dGhlIGZ1bmN0aW9uIHNpZ25hdHVyZS4KClNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sgPHJv
c2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvCmluZGV4IDRlMTJjZWJhYzEuLmJlY2Qw
N2IwYjYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbworKysg
Yi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KQEAgLTUxMywxNyArNTEzLDE3IEBA
IGZ1bmMgKEN0eCAqQ29udGV4dCkgTGlzdENwdXBvb2woKSAobGlzdCBbXUNwdXBvb2xpbmZvKSB7
CiB9CiAKIC8vIGludCBsaWJ4bF9jcHVwb29sX2luZm8obGlieGxfY3R4ICpjdHgsIGxpYnhsX2Nw
dXBvb2xpbmZvICppbmZvLCB1aW50MzJfdCBwb29saWQpOwotZnVuYyAoQ3R4ICpDb250ZXh0KSBD
cHVwb29sSW5mbyhQb29saWQgdWludDMyKSAocG9vbCBDcHVwb29saW5mbykgeworZnVuYyAoQ3R4
ICpDb250ZXh0KSBDcHVwb29sSW5mbyhQb29saWQgdWludDMyKSAocG9vbCBDcHVwb29saW5mbywg
ZXJyIGVycm9yKSB7CiAJdmFyIGNfY3B1cG9vbCBDLmxpYnhsX2NwdXBvb2xpbmZvCiAKIAlyZXQg
Oj0gQy5saWJ4bF9jcHVwb29sX2luZm8oQ3R4LmN0eCwgJmNfY3B1cG9vbCwgQy51aW50MzJfdChQ
b29saWQpKQogCWlmIHJldCAhPSAwIHsKLQkJLy9lcnIgPSBFcnJvcigtcmV0KQorCQllcnIgPSBF
cnJvcigtcmV0KQogCQlyZXR1cm4KIAl9CiAJZGVmZXIgQy5saWJ4bF9jcHVwb29saW5mb19kaXNw
b3NlKCZjX2NwdXBvb2wpCiAKLQlfID0gcG9vbC5mcm9tQygmY19jcHVwb29sKQorCWVyciA9IHBv
b2wuZnJvbUMoJmNfY3B1cG9vbCkKIAogCXJldHVybgogfQotLSAKMi4xOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
