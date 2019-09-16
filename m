Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014AB4012
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 20:11:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9vQb-00036C-O5; Mon, 16 Sep 2019 18:08:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xTZH=XL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i9vQZ-000365-UG
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 18:08:43 +0000
X-Inumbo-ID: 046043dc-d8ad-11e9-b299-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 046043dc-d8ad-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 18:08:43 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a22so881618ljd.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 11:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PLMSsFbaHeFuEImdB4FNwcH4mNUxCkMn/A3QC8Ap4Lk=;
 b=EEo2snRyi9mVRBMrS+7Uu3cxRUJOG7RWy48m7xbh7TWRmKlNz0mS/jwvAycirYVld8
 ZNF/UsV3/RaKTJvzcf4l+G/qo6+TrQDzOI9OUg3cCBMSKKgUET0pT+rIJQwEkfitDqWG
 WIpSZAfpFgIuq7JVOKlkI9e8eJTSZ5zb2jJ03ENsvF1yCGXhp+PW+YPuH04FtNleqiQ+
 hL9sVt7xutp3d4RQWYkbmWwvZgyIFMLOuWeWKQULIx/b40N2W0efmnHDZ2q9zgVfqUdi
 o76+nvjNAyjdUImUFMnl1oRosRv4kdn0fPpDHuJF6g44+hFdCbenYce6yTxqhgeQgguU
 fG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=PLMSsFbaHeFuEImdB4FNwcH4mNUxCkMn/A3QC8Ap4Lk=;
 b=SNJ892IYwYCuwK4ZgAmk1lSQSqKR7McoQyBakiFNkvmTyUoLMGngjMa+j9bG7e151+
 eSsGVbGMlOSstJvPL2UATmDXt6jEtjyMrv1Y1lc6DvcYhBRevPeBQNvCHsIJIFcTzrKl
 S5fN+nBAUIwtxogv+djXzeQzZsZNRA9sNOkZN+Ci9PMtAF8qrCrRcjmXWHewl3fWKgIl
 HQwfyEwooE0BBUS3w5wqVgT7+vj4GFmVJdKKswE9ViHS8hxK/ZsZBwmD1GQcxOTa5Z8m
 sVx+9H4jTwCDyADugpVyTc3X+FC6XRvBVk1PL7euBnZVljN0jxnvGXPuBd4DF9KfB7XW
 oz0g==
X-Gm-Message-State: APjAAAUgYhn+sa7wTi0lrBQHQmTIJ8AuLmzMg+/qMxZcFcddJk4H8xbt
 juwu2aAa8iKEG95lJIBy9xc=
X-Google-Smtp-Source: APXvYqxxP/+910288rOpoCsjBc/bBFDEHKJAsWS5cg6TM4/nddKCT2m3jE7fMwD8oQUHahC5gsKf0g==
X-Received: by 2002:a2e:2b89:: with SMTP id r9mr520623ljr.34.1568657322073;
 Mon, 16 Sep 2019 11:08:42 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id e8sm8394730ljk.54.2019.09.16.11.08.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 11:08:41 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
Date: Mon, 16 Sep 2019 21:08:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA5LjE5IDEzOjQwLCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4KPj4gKwo+
PiArLyogcGVyLWRldmljZSBJT01NVSBpbnN0YW5jZSBkYXRhICovCj4+ICtzdHJ1Y3QgaW9tbXVf
ZndzcGVjIHsKPj4gKyAgICAvKiB0aGlzIGRldmljZSdzIElPTU1VICovCj4+ICsgICAgc3RydWN0
IGRldmljZSAqaW9tbXVfZGV2Owo+PiArICAgIC8qIElPTU1VIGRyaXZlciBwcml2YXRlIGRhdGEg
Zm9yIHRoaXMgZGV2aWNlICovCj4+ICsgICAgdm9pZCAqaW9tbXVfcHJpdjsKPj4gKyAgICAvKiBu
dW1iZXIgb2YgYXNzb2NpYXRlZCBkZXZpY2UgSURzICovCj4+ICsgICAgdW5zaWduZWQgaW50IG51
bV9pZHM7Cj4+ICsgICAgLyogSURzIHdoaWNoIHRoaXMgZGV2aWNlIG1heSBwcmVzZW50IHRvIHRo
ZSBJT01NVSAqLwo+PiArICAgIHVpbnQzMl90IGlkc1sxXTsKPj4gK307Cj4gTm90ZSB0aGF0IHlv
dSBhYnVzZSB4cmVhbGxvY19mbGV4X3N0cnVjdCgpIHdoZW4gdXNpbmcgaXQgd2l0aCBzdWNoCj4g
YSB0eXBlOiBUaGUgbGFzdCBmaWVsZCBpcyBfbm90XyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlci4g
Q29tcGlsZXJzCj4gbWlnaHQgbGVnaXRpbWF0ZWx5IHdhcm4gaWYgdGhleSBjYW4gcHJvdmUgdGhh
dCB5b3UgYWNjZXNzCj4gcC0+aWRzWzFdIGFueXdoZXJlLCBkZXNwaXRlIHlvdSAocHJlc3VtYWJs
eSkgaGF2aW5nIGFsbG9jYXRlZCBlbm91Z2gKPiBzcGFjZS4gKEkgaGF2ZW4ndCBiZWVuIGFibGUg
dG8gdGhpbmsgb2YgYSB3YXkgZm9yIHRoZSBtYWNybyB0bwo+IGFjdHVhbGx5IGRldGVjdCBhbmQg
aGVuY2UgcmVmdXNlIHN1Y2ggd3JvbmcgdXNlcy4pCgpJbmRlZWQsIHlvdSBhcmUgcmlnaHQuIEkg
YW0gaW4gZG91YnQsIHdoZXRoZXIgdG8gcmV0YWluIHBvcnRlZCBmcm9tIApMaW51eCBjb2RlIChp
ZHNbMV0pCgphbmQgbWVudGlvbiBhYm91dCBzdWNoIGFidXNlIG9yIGNoYW5nZSBpdCB0byBkZWFs
IHdpdGggcmVhbCBmbGV4aWJsZSAKYXJyYXkgbWVtYmVyIChpZHNbXSkuIEFueSB0aG91Z2h0cz8K
Ci0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
