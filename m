Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D5D1118
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 16:23:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iICpU-0007Wt-6Q; Wed, 09 Oct 2019 14:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Wiy=YC=gmail.com=joculator@srs-us1.protection.inumbo.net>)
 id 1iICpS-0007WQ-ML
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 14:20:38 +0000
X-Inumbo-ID: f043e430-ea9f-11e9-8c93-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f043e430-ea9f-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 14:20:27 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q64so2659684ljb.12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2019 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGgtXiJIJl4Hr2B92YhsDwNUlTE+vt8BHFmgy66Qd2w=;
 b=D2q4aFYgkIf+3Gspn7QlwYzwEFtdtDUdHpoOapmursuo1fZZn7Ovbv0l504uxncVkp
 eQMuRsxgrqxeQAcC41YJ0SPpxQnyC5ndtoDsTqWX/eunb7yplfGGTdLmHKI3rBMz2/P3
 bcPKdkk58E50z+zUwpxRDHoJVaPJFS1UeqlT5v5wV9sgtQFsGI/hPj5jPr9h3HWU/pUS
 AlZA/uENeUPlUIssy2R+B6nTiw0oH8lGnhog88DLvNIWXO3OEOHBmLKgQKQQXY2bs6+Y
 vzKkEbog0H7pmSb7TgtG/w9y4JQEtwAU+oq9NE5XBgeqX5hMXDh3/vKjO5AWIbyDNfi/
 TG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGgtXiJIJl4Hr2B92YhsDwNUlTE+vt8BHFmgy66Qd2w=;
 b=GN1arMG1GdplhljANJCHbG9mJuZ9UPuhqI8nlk9XZvJdeUrAexZvBksJ8Jr5yV3Vwv
 S3OkMIiDyBZ3yVtbpq/hVBUvTz/R32WdG/JXwO8XFOdfFTcnTnbjRsnslTmAb6ShM1cy
 ZWCxccxBhmmTaS5j6nOy1kEnIX6jFO7ej9VdurcRbwxZwsrRqvTRmVOyzPailkQ2YVz6
 I0iugfkN3NmSjNTbhFxWszF6+PTl/5CHupAvg9A0RCWEyeUSEyxeqczba4jlka7SNjZL
 vWU+7c/P4+u5SQnZxNAfCKem+zFVrSHafhGjq40JBxHumPwaZTj4jWb2On9htGbDpmL+
 5zuQ==
X-Gm-Message-State: APjAAAXpY+tr3EalW3iGh2FqNUqI0FkFk1q8tvCIAEAb5y8+B35YWyVi
 e33C8Cx42ylDKWx14Z92etwELZs9OFP2nQ==
X-Google-Smtp-Source: APXvYqwjwHCxuDo9hL6xLBnAdVT7U5XmSy9bDqSX9ttaKDnAxl8Mt8Ux+n0rV+MonN5FdTcByjTt0A==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr2566135ljg.82.1570630825577; 
 Wed, 09 Oct 2019 07:20:25 -0700 (PDT)
Received: from EPUAKYIW0594.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id i142sm526702lfi.5.2019.10.09.07.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 07:20:24 -0700 (PDT)
From: Artem Mygaiev <joculator@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  9 Oct 2019 17:20:17 +0300
Message-Id: <6575cd1b9c82f5b28cd29d78308dc23821c9d246.1570628924.git.artem_mygaiev@epam.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1570628924.git.artem_mygaiev@epam.com>
References: <cover.1570628924.git.artem_mygaiev@epam.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] Free allocated resource on error
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <joculator@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxzbyBkbyBub3Qgc2V0IG1hcmsgZGV2aWNlIGFzIFNNTVUgcHJvdGVjdGVkIHdoZW4gdGhlcmUg
YXJlIG5vIG1vcmUKU01NVSByZXNvdXJjZXMgbGVmdAoKQ292ZXJpdHktSUQ6IDEzODE4NjIKU2ln
bmVkLW9mZi1ieTogQXJ0ZW0gTXlnYWlldiA8YXJ0ZW1fbXlnYWlldkBlcGFtLmNvbT4KLS0tCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIHwgOCArKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL3NtbXUuYwppbmRleCBmMTUxYjlmNWI1Li5jZjQyMzM1ZWVkIDEwMDY0NAotLS0gYS94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FybS9zbW11LmMKQEAgLTgwNCw5ICs4MDQsNiBAQCBzdGF0aWMgaW50IHJlZ2lzdGVyX3Nt
bXVfbWFzdGVyKHN0cnVjdCBhcm1fc21tdV9kZXZpY2UgKnNtbXUsCiAJbWFzdGVyLT5vZl9ub2Rl
CQkJPSBtYXN0ZXJzcGVjLT5ucDsKIAltYXN0ZXItPmNmZy5udW1fc3RyZWFtaWRzCT0gbWFzdGVy
c3BlYy0+YXJnc19jb3VudDsKIAotCS8qIFhlbjogTGV0IFhlbiBrbm93IHRoYXQgdGhlIGRldmlj
ZSBpcyBwcm90ZWN0ZWQgYnkgYW4gU01NVSAqLwotCWR0X2RldmljZV9zZXRfcHJvdGVjdGVkKG1h
c3RlcnNwZWMtPm5wKTsKLQogCWZvciAoaSA9IDA7IGkgPCBtYXN0ZXItPmNmZy5udW1fc3RyZWFt
aWRzOyArK2kpIHsKIAkJdTE2IHN0cmVhbWlkID0gbWFzdGVyc3BlYy0+YXJnc1tpXTsKIApAQCAt
ODE1LDEwICs4MTIsMTUgQEAgc3RhdGljIGludCByZWdpc3Rlcl9zbW11X21hc3RlcihzdHJ1Y3Qg
YXJtX3NtbXVfZGV2aWNlICpzbW11LAogCQkJZGV2X2VycihkZXYsCiAJCQkJInN0cmVhbSBJRCBm
b3IgbWFzdGVyIGRldmljZSAlcyBncmVhdGVyIHRoYW4gbWF4aW11bSBhbGxvd2VkICglZClcbiIs
CiAJCQkJbWFzdGVyc3BlYy0+bnAtPm5hbWUsIHNtbXUtPm51bV9tYXBwaW5nX2dyb3Vwcyk7CisJ
CQlkZXZtX2ZyZWUobWFzdGVyKTsKIAkJCXJldHVybiAtRVJBTkdFOwogCQl9CiAJCW1hc3Rlci0+
Y2ZnLnN0cmVhbWlkc1tpXSA9IHN0cmVhbWlkOwogCX0KKworICAgICAgICAvKiBYZW46IExldCBY
ZW4ga25vdyB0aGF0IHRoZSBkZXZpY2UgaXMgcHJvdGVjdGVkIGJ5IGFuIFNNTVUgKi8KKyAgICAg
ICAgZHRfZGV2aWNlX3NldF9wcm90ZWN0ZWQobWFzdGVyc3BlYy0+bnApOworCiAJcmV0dXJuIGlu
c2VydF9zbW11X21hc3RlcihzbW11LCBtYXN0ZXIpOwogfQogCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
