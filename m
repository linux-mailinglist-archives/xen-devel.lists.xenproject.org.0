Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FD129044
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 00:24:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijAWl-0004Nc-Vb; Sun, 22 Dec 2019 23:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYd2=2M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ijAWk-0004NX-Eh
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2019 23:20:46 +0000
X-Inumbo-ID: abba8c04-2511-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abba8c04-2511-11ea-b6f1-bc764e2007e4;
 Sun, 22 Dec 2019 23:20:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so14892700wru.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Dec 2019 15:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iY5LVyaAwL0gYA7x7G9RR7noTcF6nrPiSr/rUqWtRQ=;
 b=dCepD/sP9qHmVqVOQviK+S0nwllSjCJr5ZSscJn61a3HYgXTAFPiS3U5lWae4Xxh+H
 qYsLYDUmQVK+GrmUeN64G3p2Lu+r9qg3eRJBWvlNbvyVT3mUpMQJqomH9UHL7qRK1c0N
 JgYxCLLxWoIj6fDgLjKFXuz6C1fmLWO8s2Lae06GcJ+urK7YC2jRtiE7aG+cGNZQ2Rme
 ZutYPzcGJonSyt2cbvoUxD84t1Kl+YFlq1Bb5ATE5hwUq09T/S7TWvyQ01Z4tlvaeyC2
 KskW/FqQxozobdZ33QuQOaucOPe2ta/e2RI9cDv9eIX8Oru4GghaYlRzRtuaOSZhvJ3p
 rs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4iY5LVyaAwL0gYA7x7G9RR7noTcF6nrPiSr/rUqWtRQ=;
 b=Df4ztu0L7kBvghxU8fBQLssxxFM5xBO9H5ylDeETsNOHbGTlVIOQM8ebzDwimmIq7K
 fi9rL5JxkjQMKpIwE64Sv/Bwjr3xPx4UdG4bqJaF71uz9YSHN2vTzUWg4LsrY10OqxtP
 BrqeVyBXbB6FnIUutD7KSKKoJ/SJgkKZYBqjpUewmuORRq28vTS6pY/82tBkbq6eGdzy
 GjIkTu5RVQHn70/AE+DlPA0YhfvESPKIjcKp/dD+Qf+nK4iDx28SHAQq1h/uZaZufOeF
 4U/e6LaIwqYjuAWS6OTTJIYXif2W7MQLc9c+XEAa1XTdjbcMRQA3R5rawLDVTRgZfg7U
 2lvA==
X-Gm-Message-State: APjAAAUze0PbKUtp9M+Qn1A/l9wUBpXmI+Zq7w9KZ917B/IIzQwq2oSO
 1CBenH5T+b7anz/zPxGq2wDFpsuB
X-Google-Smtp-Source: APXvYqxXO5fkORIasCIKFsqEizwh2cBiqac6wBuGubs592SlPuRKzpR2UiXHGkHE5Qv+4kMAwhI2yQ==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr27261504wrn.50.1577056840945; 
 Sun, 22 Dec 2019 15:20:40 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id h2sm19925613wrt.45.2019.12.22.15.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 15:20:40 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 22 Dec 2019 23:20:33 +0000
Message-Id: <20191222232035.31613-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191222232035.31613-1-liuwe@microsoft.com>
References: <20191222232035.31613-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] x86/viridian: drop a wrong invalid value
 from reference TSC implementation
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9ubHkgaW52YWxpZCB2YWx1ZSBtZW50aW9uZWQgaW4gSHlwZXItViBUTEZTIDUuMGMgaXMg
MC4gTWljaGFlbApLZWxsZXkgY29uZmlybWVkIHRoYXQgMHhGRkZGRkZGRiB3YXMgbmV2ZXIgdXNl
ZCBbMF0uCgpbMF0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTktMTIvbXNnMDE1NjQuaHRtbAoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYyB8IDE2ICsr
KystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jIGIv
eGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKaW5kZXggNmIyZDc0NWYzYS4uMGYxY2Q5
ZTIwOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKKysrIGIv
eGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMKQEAgLTQ1LDE0ICs0NSw5IEBAIHN0YXRp
YyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2VfdHNjKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsIGJvb2wg
aW5pdGlhbGl6ZSkKICAgICBpZiAoICFob3N0X3RzY19pc19zYWZlKCkgfHwgZC0+YXJjaC52dHNj
ICkKICAgICB7CiAgICAgICAgIC8qCi0gICAgICAgICAqIFRoZSBzcGVjaWZpY2F0aW9uIHN0YXRl
cyB0aGF0IHZhbGlkIHZhbHVlcyBvZiBUc2NTZXF1ZW5jZSByYW5nZQotICAgICAgICAgKiBmcm9t
IDAgdG8gMHhGRkZGRkZGRS4gVGhlIHZhbHVlIDB4RkZGRkZGRkYgaXMgdXNlZCB0byBpbmRpY2F0
ZQotICAgICAgICAgKiB0aGlzIG1lY2hhbmlzbSBpcyBubyBsb25nZXIgYSByZWxpYWJsZSBzb3Vy
Y2Ugb2YgdGltZSBhbmQgdGhhdAotICAgICAgICAgKiB0aGUgVk0gc2hvdWxkIGZhbGwgYmFjayB0
byBhIGRpZmZlcmVudCBzb3VyY2UuCi0gICAgICAgICAqCi0gICAgICAgICAqIFNlcnZlciAyMDEy
ICg2LjIga2VybmVsKSBhbmQgMjAxMiBSMiAoNi4zIGtlcm5lbCkgYWN0dWFsbHkKLSAgICAgICAg
ICogdmlvbGF0ZSB0aGUgc3BlYy4gYW5kIHJlbHkgb24gYSB2YWx1ZSBvZiAwIHRvIGluZGljYXRl
IHRoYXQgdGhpcwotICAgICAgICAgKiBlbmxpZ2h0ZW5tZW50IHNob3VsZCBubyBsb25nZXIgYmUg
dXNlZC4KKyAgICAgICAgICogVGhlIHZhbHVlIDAgaXMgdXNlZCB0byBpbmRpY2F0ZSB0aGlzIG1l
Y2hhbmlzbSBpcyBubyBsb25nZXIgYQorICAgICAgICAgKiByZWxpYWJsZSBzb3VyY2Ugb2YgdGlt
ZSBhbmQgdGhhdCB0aGUgVk0gc2hvdWxkIGZhbGwgYmFjayB0byBhCisgICAgICAgICAqIGRpZmZl
cmVudCBzb3VyY2UuCiAgICAgICAgICAqLwogICAgICAgICBwLT50c2Nfc2VxdWVuY2UgPSAwOwog
CkBAIC03NywxMCArNzIsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVmZXJlbmNlX3RzYyhjb25z
dCBzdHJ1Y3QgZG9tYWluICpkLCBib29sIGluaXRpYWxpemUpCiAgICAgc21wX3dtYigpOwogCiAg
ICAgc2VxID0gcC0+dHNjX3NlcXVlbmNlICsgMTsKLSAgICBpZiAoIHNlcSA9PSAweEZGRkZGRkZG
IHx8IHNlcSA9PSAwICkgLyogQXZvaWQgYm90aCAnaW52YWxpZCcgdmFsdWVzICovCi0gICAgICAg
IHNlcSA9IDE7Ci0KLSAgICBwLT50c2Nfc2VxdWVuY2UgPSBzZXE7CisgICAgcC0+dHNjX3NlcXVl
bmNlID0gc2VxID8gc2VxIDogMTsgLyogQXZvaWQgJ2ludmFsaWQnIHZhbHVlIDAgKi8KIH0KIAog
c3RhdGljIHVpbnQ2NF90IHRyY192YWwoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgaW50NjRfdCBv
ZmZzZXQpCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
