Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA489C1FC1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:07:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtUO-00088U-Gl; Mon, 30 Sep 2019 11:05:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XJln=XZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iEtUM-00088P-VA
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:05:11 +0000
X-Inumbo-ID: 2ad889be-e372-11e9-97fb-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id 2ad889be-e372-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 11:05:10 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id d1so8939279ljl.13
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gh9lesR+dLfYwgsDfJhnybxTc59I4lvOMY7nYgkz6Ho=;
 b=MM6j/bWYc2AbZBbgng+t62KxjfKa+plspFqYT/zwO2VKwulFsEMkVUM+GPM2TwKAZV
 KCXHPaj2P80Ko5lCI8p41xP4E6EaD2xdKtIoQTAQ841TlIG85ezpGg4d6Dg6jv8Ng8vu
 jMos363PZxAdueTHW23aBGmFhj7EdwU8+MBvf4hf9HJThBnmOBV/57/yXqjrkhjlojic
 YazjkL9NvwutXH1ICUujwwsJG4c/yV24Oj7lv+KA37gp5ALMckzCiMWkWKpllwbjmDKF
 W91ejVvGu5rJTpjP1EFaBxqgseCNBFrm9b/HXZVpuSJ3XvcRpoxHhquCbH57WzaoAkUN
 w+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gh9lesR+dLfYwgsDfJhnybxTc59I4lvOMY7nYgkz6Ho=;
 b=lU/olAlQlea5iCqidSJ7bb4fmlUejPEbTVpKQxLLA4arv/7qWQG5mQhb7/fmuRNeac
 jA7YMd6Id4wOphhszQ/yl+XbjXniaMBzqNztPPmg1Xe6nOzC53DUQV2QYPZENLIzLHTi
 CEhngJ7VBbyfKIcvXuClRp4M5Rww8JC6I2snHf162DpzilOq1npqtC5ycA/lEPICZs1o
 vZ00cBiyhuhGwTEJsWyFmLi9ILzrMZduiZIVGQ1OAvsLwMe5NIqho5UVQxLhaUvfW/8s
 Fk7imNAauRM2HjGEOrtZJM5SJ+kBRmXhPd3KxnR5m+t8aQC+6iDifjhrosUEruONTHjy
 lLsQ==
X-Gm-Message-State: APjAAAVrFKi6MxZBfv+26tjHpozAYh743XjCo3bjiViHrwtnHjm2+fUF
 dlxKw/gFWs4UtisrnOsz6/0=
X-Google-Smtp-Source: APXvYqxy7B9mqdMNkn6vc7dzq7tkT+VFHG9bB2t/LzIFWQBFri+KIV3MfVvYmGPXQwaL15WdgnSa1w==
X-Received: by 2002:a2e:3808:: with SMTP id f8mr11596208lja.7.1569841509092;
 Mon, 30 Sep 2019 04:05:09 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id d28sm3167001lfq.88.2019.09.30.04.05.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 04:05:08 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <1569839671-772-1-git-send-email-olekstysh@gmail.com>
 <49a1c980-6e2c-5dcf-f17e-64b6432a8ea3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <17cf0fd0-8a54-41fe-9372-e52e9e7cbb4d@gmail.com>
Date: Mon, 30 Sep 2019 14:05:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <49a1c980-6e2c-5dcf-f17e-64b6432a8ea3@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] iommu/arm: Remove
 arch_iommu_populate_page_table() completely
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 paul.durrant@citrix.com, volodymyr_babchuk@epam.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpCgoKT24gMzAuMDkuMTkgMTM6NDQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMzAuMDku
MTkgMTI6MzQsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IFRoZSBBcm0g
cmVhbGl6YXRpb24gc2hvdWxkIGhhdmUgYmVlbiByZW1vdmVkIGluIHRoZSBmb2xsb3dpbmcgY29t
bWl0Cj4+IGFzIHJlZHVuZGFudDoKPj4gZjg5ZjU1NSByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBj
b25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMKPj4KPj4gU28sIHJlbW92ZSB1bnVzZWQg
ZnVuY3Rpb24gY29tcGxldGVseS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hj
aGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Cj4gUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKClRoYW5rIHlvdSBhbGwuCgoKLS0g
ClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
