Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AAE3D3D0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 19:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hakMy-0006YT-Iv; Tue, 11 Jun 2019 17:15:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r+TN=UK=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hakJ6-0006Tt-D5
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 17:11:36 +0000
X-Inumbo-ID: f76efcdc-8c6b-11e9-8980-bc764e045a96
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f76efcdc-8c6b-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 17:11:35 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so15470498qtk.4
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 10:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=ziayDw4v7TqaC+TVnep2nFZ1Iu6htXCoSZGt4yUQ1yQ=;
 b=qvogJPHFOAmq6kcPdhGrvi1r5/HKQywxwG2470t6ecePqm9OF0Gc1ZXUjgtslZjKiw
 2M+BiKUKu+AsimnrDelsnDApxUyJKH+X2WCNb+jXn5XuJOmXFNZkaIppQm0qbyL5MB6R
 TULQm3Eu413c9S8KmFnFMjq9K6rZheaFm0G5TeAwTtXjWujZM2r3om8rhGwcs9Q1rrEh
 WM9WnNwxMfMGqiUiJU4MA8Z3grxqGg8LuBrjWeHgQ5phwOZUa6Np8FCVW88ftHI+s7oi
 7nvxBRSbEXP+CcUrecHVhkHF6vJKAelNvusXFfmv4ZgEYQMuWPQlQy18QtU7YydvEIeC
 mIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=ziayDw4v7TqaC+TVnep2nFZ1Iu6htXCoSZGt4yUQ1yQ=;
 b=A8SMJIMCnGAjwgGCxX9yXOqPMCqdE9srSK5DP0qlhlGHrhKtFyPg2OITNZn8USjVP8
 Yh6kfpAMP0kxwmvzr4sA/D0YhymEX7lWKTpk5YFrp2JCxo59CX5z6fF4RgajM5FAvgDd
 OTBXHwxiwx8oxlnqOk2nPNPpT+N+oehQ4PqJWDIIWEhSSDbWjmg1G34eM4eaYZCZTqJG
 rGynKAieMS/rHc6GE5kDORIJvL66oUTswWX4URp9ZYTFJcoM1VGfQtG3A1lwef5q0r2Z
 Yol2z4y7GiyGbvAE5RL58N8upfWKSyVM8IjY61/bZ0hnUQTOyHlizzgrlA7DsW6dB2aQ
 xBEw==
X-Gm-Message-State: APjAAAWZbMFM8Y1Uh6Haz0qPoh8yCJTG6JrMK4X/2Od1YTrLkQUSNGlt
 rNJ34/MNpMiNX/tCLvMPJJnWT9O6pdDW8g==
X-Google-Smtp-Source: APXvYqyzO/aAsZE/ZIuyekdXuIpc71vy8N+rUuRp7B4SfmYLbhRuIsOsrZ3hyeGy58xn/GXUIa/LwQ==
X-Received: by 2002:ac8:17c8:: with SMTP id r8mr66281608qtk.319.1560273094537; 
 Tue, 11 Jun 2019 10:11:34 -0700 (PDT)
Received: from niko-Latitude-E7470.fios-router.home
 (pool-108-54-183-56.nycmny.fios.verizon.net. [108.54.183.56])
 by smtp.gmail.com with ESMTPSA id q2sm7072848qkf.44.2019.06.11.10.11.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 10:11:34 -0700 (PDT)
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
X-Google-Original-From: Nicholas Tsirakis <tsirakisn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 13:11:25 -0400
Message-Id: <43766a806049b9556dd73ed8c1d6368ab2b26c4f.1560272437.git.tsirakisn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
In-Reply-To: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
X-Mailman-Approved-At: Tue, 11 Jun 2019 17:15:35 +0000
Subject: [Xen-devel] [PATCH 2/2] argo: correctly report pending message
 length
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
Cc: Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIG1lc3NhZ2UgaXMgcmVxdWV1ZSdkIGluIFhlbidzIGludGVybmFsIHF1ZXVlLCB0aGUg
cXVldWUKZW50cnkgY29udGFpbnMgdGhlIGxlbmd0aCBvZiB0aGUgbWVzc2FnZSBzbyB0aGF0IFhl
biBrbm93cyB0bwpzZW5kIGEgVklSUSB0byB0aGUgcmVzcGVjdGl2ZSBkb21haW4gd2hlbiBlbm91
Z2ggc3BhY2UgZnJlZXMgdXAKaW4gdGhlIHJpbmcuIER1ZSB0byBhIHNtYWxsIGJ1ZywgaG93ZXZl
ciwgWGVuIGRvZXNuJ3QgcG9wdWxhdGUKdGhlIGxlbmd0aCBvZiB0aGUgbXNnIGlmIGEgZ2l2ZW4g
d3JpdGUgZmFpbHMsIHNvIHRoaXMgbGVuZ3RoIGlzCmFsd2F5cyByZXBvcnRlZCBhcyB6ZXJvLiBU
aGlzIGNhdXNlcyBYZW4gdG8gc3B1cnJpb3VzbHkgd2FrZSB1cAphIGRvbWFpbiBldmVuIHdoZW4g
dGhlIHJpbmcgZG9lc24ndCBoYXZlIGVub3VnaCBzcGFjZS4KClRoaXMgcGF0Y2ggbWFrZXMgc3Vy
ZSB0aGF0IHRoZSBtc2cgbGVuIGlzIHByb3Blcmx5IHJlcG9ydGVkIGJ5CnBvcHVsYXRpbmcgaXQg
aW4gdGhlIGV2ZW50IG9mIGEgd3JpdGUgZmFpbHVyZS4KClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFz
IFRzaXJha2lzIDx0c2lyYWtpc25AYWluZm9zZWMuY29tPgotLS0KIHhlbi9jb21tb24vYXJnby5j
IHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2FyZ28uYyBiL3hlbi9jb21tb24vYXJnby5jCmluZGV4IDJmODc0YTU3MGQu
LmViNTQxODI5ZDYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vYXJnby5jCisrKyBiL3hlbi9jb21t
b24vYXJnby5jCkBAIC0yMDUwLDYgKzIwNTAsMTIgQEAgc2VuZHYoc3RydWN0IGRvbWFpbiAqc3Jj
X2QsIHhlbl9hcmdvX2FkZHJfdCAqc3JjX2FkZHIsCiAgICAgICAgIHsKICAgICAgICAgICAgIGlu
dCByYzsKIAorICAgICAgICAgICAgLyoKKyAgICAgICAgICAgICAqIGlmIHJpbmdidWZfaW5zZXJ0
IGZhaWxzLCB0aGVuIGxlbiB3aWxsIG5ldmVyIGJlIHBvcHVsYXRlZC4KKyAgICAgICAgICAgICAq
IG1ha2Ugc3VyZSB0byBwb3B1bGF0ZSBpdCBoZXJlLgorICAgICAgICAgICAgICovCisgICAgICAg
ICAgICBpb3ZfY291bnQoaW92cywgbmlvdiwgJmxlbik7CisKICAgICAgICAgICAgIGFyZ29fZHBy
aW50aygiYXJnb19yaW5nYnVmX3NlbmR2IGZhaWxlZCwgRUFHQUlOXG4iKTsKICAgICAgICAgICAg
IC8qIHJlcXVldWUgdG8gaXNzdWUgYSBub3RpZmljYXRpb24gd2hlbiBzcGFjZSBpcyB0aGVyZSAq
LwogICAgICAgICAgICAgcmMgPSBwZW5kaW5nX3JlcXVldWUoZHN0X2QsIHJpbmdfaW5mbywgc3Jj
X2lkLmRvbWFpbl9pZCwgbGVuKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
