Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053063CBF5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:43:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hag4c-0007EJ-8N; Tue, 11 Jun 2019 12:40:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hag4b-0007EE-H9
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:40:21 +0000
X-Inumbo-ID: 12714196-8c46-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 12714196-8c46-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:40:20 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v24so7096137ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 05:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f5afrDbi1tlv/IBmiU8bKkJKJOoj8lYyLncmFxO1RAc=;
 b=D8ZgZdA4jIoBCGPlymNmnWdVB9BcgLOOpP444DUvV3kUo8i8cxV0CNjJ4JZ0GcWPX0
 nPfH2IqE0M5qNl9LtseF8AHYBQQusvHcnGbyaCcAfqQN3f73KetaGfN8+ayZGv1e36b8
 ybjwPyE7lx8dk0tJonvuhkixtBcvV1NgXVLP+mOms35Pd20xG0A457+S/U7mL4FZK3Jd
 tJzYruB+I2+TSiJRhnc2nZr3K/FBTSn/UknVvhmMJ9kC7WtIwRP4ioFCxqpqVZ31Nslj
 rNghMLzyrE8ncUyrzj1MwdmcB+cglsGGsv9LtRYNpfMCnYbfpW9ZGrTGQvhJGYTm9fW3
 tuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f5afrDbi1tlv/IBmiU8bKkJKJOoj8lYyLncmFxO1RAc=;
 b=YBGQPOPRbevP/SM5/Sjs9UHhf17t6MfAJOO9tSesOf80hUqIYkuzXWWFbkbkdvcKbp
 hUYQ8kHf+OE4XWhcv1gMTmglYElrjnWBpixSd1rFu3hZCyRctuPFYj2fb/ywbIoJDf67
 +XJ8xa5lbOBhjY2DBq8EKnVdMfO5vfmR5nLbMfwAD5pIz+2GrzOtfwpp2fBcKLcXRDuo
 32mV5htE+6x0jjUITsQ2HSFaA35lHF0/d4uHW0mLWWWRzUy0/WQGEWjlOOfBq3YRGQVo
 ZSaczrX8GklRA29x63vsPk/K6r4/evHz/KJIF6z6dDuShqa/WHid1gyKVoBX+ycrjLj5
 pGEQ==
X-Gm-Message-State: APjAAAVnKSt+Dg+ogiASbsgp4kGwovID43fkRKjQHiD5SAsSr0Kse6DB
 Hy1SH3eP6uznFb7go4C80xg=
X-Google-Smtp-Source: APXvYqxdmLg7CcOZAvwDR8UgE+IS/guefYQ2RcWXIinhdSzk7uWhtw9XM/86C7nPcEpeyiH5lR54DA==
X-Received: by 2002:a2e:5d9c:: with SMTP id v28mr39212410lje.32.1560256819074; 
 Tue, 11 Jun 2019 05:40:19 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p29sm2054721ljp.87.2019.06.11.05.40.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 05:40:18 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
 <b07c98a5-00cc-a51f-2eda-ba4038f0f667@arm.com>
 <4d747a77-408b-56b9-9404-60b3754ceccb@gmail.com>
 <4af4bd1e-17c1-d128-05af-865c5b79cb88@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e30fd795-1f90-5da5-8578-7ce75075d689@gmail.com>
Date: Tue, 11 Jun 2019 15:40:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4af4bd1e-17c1-d128-05af-865c5b79cb88@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS4wNi4xOSAxNTozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERpZCB5b3UgZXhwZWN0
IFhlbiB0byBiZSBmdWxseSBwcmVlbXB0aWJsZT8KPiAKPiBUaGUgZnVuY3Rpb24gdG8gZG8gdGhl
IHNjaGVkdWxpbmcgaXMgc2NoZWR1bGUoKS4gVGhpcyBpcyBlaXRoZXIgY2FsbCBmcm9tIGEgc29m
dGlycSBvciBkaXJlY3RseSBpbiBhIGZldyBwbGFjZXMgKGUuZyB3YWl0KCkpLgo+IAo+IFRoZSBv
bmx5IHBsYWNlIGluIHRoaXMgcGF0aCB3aGVyZSBkb19zb2Z0aXJxKCkgd2lsbCBiZSBjYWxsZWQg
aXMgb24gcmV0dXJuIHRvIHRoZSBndWVzdCAoc2VlIGxlYXZlX2h5cGVydmlzb3JfdGFpbCkuCgpS
aWdodCB5b3UgYXJlISBJIGZvcmdvdCB0aGF0IGJpdC4gV2Ugd2lsbCBub3QgcGFzcyB0aHJvdWdo
IGl0IG9uIHNlcnZpbmcgdGltZXIgaXJxIGludGVycnVwdGVkIHVzIGluIGh5cCBtb2RlLgoKLS0g
ClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
