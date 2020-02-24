Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A116B3F3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 23:28:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6MAX-00024G-Hx; Mon, 24 Feb 2020 22:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BoNe=4M=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j6MAV-000249-82
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 22:25:39 +0000
X-Inumbo-ID: 954d790d-5754-11ea-925a-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 954d790d-5754-11ea-925a-12813bfff9fa;
 Mon, 24 Feb 2020 22:25:38 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id j17so13863454edp.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2020 14:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VffZftm/QJGN4h/pBtVe0q9s3h+Dt0JntOHrYPwK6uA=;
 b=M+8oO6ZhJntBuHQLY8XefdKlHgfdaaTpbJNYiiBYNoO4luy1e+tRb5IH5XoI9LyM+y
 u/VK/lqSbVGEJhmFjKKx9LjLUD8z2qGi8pg+FkfT2zAFSweRmcNSO0Y53ey5IifqsjXv
 wG+hhQVPDCKUje1ODn0apE7k1EedSfspUe13AC/fBA5Fkhd5qdDGivnkQeo/um604pB4
 GYSlYoDHzJlr2+sBkbD0shddEuL0FKwjsJbbJNFWcwP1e3MeGJYNqtOMc9UoKVEQ3Raa
 3Y0gXm5TfNmlgeQy59KWbEpxYaMjROzWXt5H+QPK7QzzSeeQtUMRz2IQOsCWzSunMuAN
 l0vw==
X-Gm-Message-State: APjAAAVNgZ1wFdD6mCySQcSOmBSjmviRtRlmfLKjop3QDBsTiOaRRgVE
 s7l71dvY7AzYdbNlFrwmySI=
X-Google-Smtp-Source: APXvYqy0cYttATrxx2qQEvu1ANpBbAwh5GrAQD7JDB6uRq2lfDkz7TOWmAMzeWHNaHZP3Bk565FgPg==
X-Received: by 2002:aa7:da5a:: with SMTP id w26mr49493705eds.274.1582583137846; 
 Mon, 24 Feb 2020 14:25:37 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-228.amazon.com.
 [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id co19sm1086437edb.35.2020.02.24.14.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 14:25:37 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200211093122.5644-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <818b1594-87b3-477d-db37-4ee598793ab7@xen.org>
Date: Mon, 24 Feb 2020 22:25:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200211093122.5644-1-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDExLzAyLzIwMjAgMDk6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMK
PiBpbmRleCA2ZjliZWMyMmQzLi4zMGM0YzE4MzBiIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiBAQCAtMjMsNyArMjMsNiBA
QAo+ICAgI2luY2x1ZGUgPHhlbi9pb2NhcC5oPgo+ICAgI2luY2x1ZGUgPHhlbi9pcnEuaD4KPiAg
ICNpbmNsdWRlIDx4ZW4vbGliLmg+Cj4gLSNpbmNsdWRlIDx4ZW4vbGl2ZXBhdGNoLmg+Cj4gICAj
aW5jbHVkZSA8eGVuL21lbV9hY2Nlc3MuaD4KPiAgICNpbmNsdWRlIDx4ZW4vbW0uaD4KPiAgICNp
bmNsdWRlIDx4ZW4vcGFyYW0uaD4KPiBAQCAtMjIzOSwxMSArMjIzOCw2IEBAIHN0YXRpYyB2b2lk
IGNoZWNrX2Zvcl9wY3B1X3dvcmsodm9pZCkKPiAgICAgICB7Cj4gICAgICAgICAgIGxvY2FsX2ly
cV9lbmFibGUoKTsKPiAgICAgICAgICAgZG9fc29mdGlycSgpOwo+IC0gICAgICAgIC8qCj4gLSAg
ICAgICAgICogTXVzdCBiZSB0aGUgbGFzdCBvbmUgLSBhcyB0aGUgSVBJIHdpbGwgdHJpZ2dlciB1
cyB0byBjb21lIGhlcmUKPiAtICAgICAgICAgKiBhbmQgd2Ugd2FudCB0byBwYXRjaCB0aGUgaHlw
ZXJ2aXNvciB3aXRoIGFsbW9zdCBubyBzdGFjay4KPiAtICAgICAgICAgKi8KPiAtICAgICAgICBj
aGVja19mb3JfbGl2ZXBhdGNoX3dvcmsoKTsKClRoZSBjaGVjayBoZXJlIHdhcyBtZWFudCB0byBt
YXRjaCB0aGUgeDg2IGNvdW50ZXJwYXJ0IGluIApyZXNldF9zdGFja19hbmRfanVtcCgpLiBJIHN1
c3BlY3QgeW91IGFsc28gbmVlZCB0byByZW1vdmUgaXQuCgo+ICAgICAgICAgICBsb2NhbF9pcnFf
ZGlzYWJsZSgpOwo+ICAgICAgIH0KPiAgIH0KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
