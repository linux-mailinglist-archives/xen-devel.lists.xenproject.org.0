Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0363B77F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 16:35:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haLLW-0008Ct-Jr; Mon, 10 Jun 2019 14:32:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKNi=UJ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1haLLU-0008Co-P1
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 14:32:24 +0000
X-Inumbo-ID: 8f45f4ea-8b8c-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f45f4ea-8b8c-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 14:32:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o13so8174178lji.5
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QSKvB72gfkbQ8G+0lVDQrSfT6VZC0D7ScZwRgQoBBFI=;
 b=nATod7CTSjo40jAkHiBS74b75MzOOGg4vTtPQpkzQmKhHUlAuanJYdwoLZ6/d/bdIg
 W1MNSj9qfl1hW+YAG89q8TIGCooFPaJXorr48q+QdL0/QxppwdLMBm2Ywe/spuQ0FFEy
 j9Vs15W8vFSzq26Vf34lygZX8i/ATHO1C8zGt4lc/ckD8+/Eos/znrCa+Z4Yi1MMyB5B
 Rzmf4c5dO8ZIfPDK4gQGYkeGyHoOcsOC5aPs0RacQM6ZpqcuX6wcuDUCSYLt1LoQ8lB1
 gRzqM00X26yEGrRQPNbjv9cSkk9IZH7F65CBpgNPxBqRA4++9upRpgIgozAQEq3uCtgK
 1YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QSKvB72gfkbQ8G+0lVDQrSfT6VZC0D7ScZwRgQoBBFI=;
 b=njEUarIGvPPd+cczNPwIFBhm5cLBU5G9Dyd0Byqd2Me0lBWwclZOA0sz5PWCndLiaB
 9KzL3qW1lGKF0aBNaGZS5izTA34Mna8yWALtn6admcrw5YLJ4SBchVojLuG3XpXk9mZ3
 +GDKfEsiuW1vnKjMCjxRiRe1nCC/5/+HHnxWhT5IS3Cvp1NZzHcyvPmnG9Js1Jp5WHK0
 CbVU7ksro+Fajdv+fYDimGyT5oh5nCuE3rqP+922OjsWldnGyW5I6Tmh1RQyrU43Hhk5
 PL4qL+4EF0bmd6madD3MLudZ7tOQCcVOyk7GHOffr7knn910fAoKXw8zZgqc9qFSRVde
 /5vg==
X-Gm-Message-State: APjAAAWJi80g0vlkaQ1yJ3ta/0wAtG50DKubF5vU2fftIfJ0Nwm6jMRd
 P/dFcPwk+JXhg6M5LsFEpMM=
X-Google-Smtp-Source: APXvYqzRIbcDFi16Oklyrhrlmg+TKgCk1gEQ5TWDf2cpp3VgxclMDxDJxJXzecFGhopdhcjEbarAJA==
X-Received: by 2002:a2e:9753:: with SMTP id f19mr12965452ljj.113.1560177142144; 
 Mon, 10 Jun 2019 07:32:22 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 80sm2027439lfz.56.2019.06.10.07.32.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 07:32:21 -0700 (PDT)
To: George Dunlap <George.Dunlap@citrix.com>
References: <1559225751-30736-1-git-send-email-andrii.anisov@gmail.com>
 <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <736c676e-cdeb-8a3f-53ea-4fa53ea6ca5a@gmail.com>
Date: Mon, 10 Jun 2019 17:32:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <16B40EA2-7781-48E7-94CA-52B328CE197B@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] schedule: move last_run_time to the
 credit scheduler privates
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gR2VvcmdlLAoKT24gMzEuMDUuMTkgMTM6MjYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4g
VGhpcyBzZWVtcyBsaWtlIGEgdXNlZnVsIGNoYW5nZSwgYW5kIHRoZSBjb21taXQgbWVzc2FnZSBo
YXMgYSBsb3Qgb2YgZ29vZCBkZXRhaWwsIHRoYW5rcy4gIEJ1dCBJ4oCZbSBsZWZ0IHdvbmRlcmlu
ZzogSXMgdGhlIG1haW4gaWRlYSBoZXJlIGp1c3QgdG8gZ2VuZXJhbGx5IHJlZHVjZSBjb2RlIGFu
ZCBkYXRhIHVzYWdlIHdoZW4gbm90IHJ1bm5pbmcgdGhlIGNyZWRpdCBzY2hlZHVsZXIsIG9yIGlz
IHRoZXJlIGFub3RoZXIgcmVhc29uPwoKVGhlIGluaXRpYWwgaW50ZW50aW9uIHdhcyBhdm9pZGlu
ZyBsYXllcmluZy9lbmNhcHN1bGF0aW9uIHZpb2xhdGlvbiAoYXMgRGFyaW8gbWVudGlvbmVkKS4g
QW5kIGl0IGlzIHN0YXRlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuClN0cnVjdHVyZSBzaXplIHJl
ZHVjdGlvbiBpcyBqdXN0IGEgZmluZSBzaWRlIGVmZmVjdCBGTVBPVi4gSWYgeW91IGxpa2UgSSBj
YW4gYWRkIGEgc2hvcnQgbm90aWNlIGFib3V0IHRoYXQgaW50byB0aGUgbWVzc2FnZS4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
