Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 448628F35D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 20:28:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyKRN-0003HD-Vu; Thu, 15 Aug 2019 18:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pv8v=WL=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hyKRM-0003H5-Gi
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 18:25:36 +0000
X-Inumbo-ID: 12bebbf2-bf8a-11e9-a661-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12bebbf2-bf8a-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 18:25:35 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j17so2294738lfp.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W5ebkPIhJ9mc7DC/QHo0LN1el897v2/7ZndzS3eLGTw=;
 b=AEYyttPqnPczVm2evKMs1ePAM1/pChjNbrPbEPuO61F4gt/XGIt7S/JEOoU33uSQO6
 3N7kcHfP6ty3xV/7VPLPV6Igng6S1e4PJTJiJEd1dJ5Tzxgub/r4XzZEyX7bzgMMNwFO
 29qyj3gXoBLv14uA0E/XLa8YN+ls13XNtW9T5nMbyDD6E+V316VirSjbxzxoxtdCqflr
 /eCSR7ACMutvoS1gE08ABRylSrWRXe4qn99O76ZhHXhqt6c3IK+0l58meM19o0Hh09Ex
 73DnxkBzunBHg9UVX90vG9Sp1ub69aXj9lyqyETSFO9RQiylnhLsrUvELVY6p1jMY6vt
 TbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W5ebkPIhJ9mc7DC/QHo0LN1el897v2/7ZndzS3eLGTw=;
 b=V41MPP7NI+htlv1BE/w112LxFEO2AM2hRrl4a4c1TL3h2ivgXeJAZOWsnHLdDt8KRX
 oHZF59glE0SwMdWYauEe1FwOSLJsdueq6J+is1cbtnn+Wqgj0k4wlvsyK2cZdO3CvFwo
 n26j167yEWJx0BB8psYBqdHxNG8sbyvRfX6cg+fJl1wm9oFG0Ze2GksOSh1TCZsKfihQ
 boqnZrHRq1uYGctuFkz7m1Tzb8V2PUIdhLKpVAX4VbqfLfAZFNo7cfzfuCNFs26UOdCN
 4tLDA0WCGkqbdMuI4Zv3337bQ7Luc4PVUhADPz5b9XNOy/91cwmvMKxqMNpz3+9GiBJF
 tzRw==
X-Gm-Message-State: APjAAAX33M7dHEcNT424D46G1ZXPrkZ9clRQVdEL7eCzR7mgPbayhVin
 UtT5CrRdQynL2KrSsNtRujA=
X-Google-Smtp-Source: APXvYqxFqnQrIggZFsgUgjB26cPJhLYmZYyDsYTE5vOK6acS/Xw/PeFTo+JeKuYzJPo/yIMa9E8Jsg==
X-Received: by 2002:a05:6512:244:: with SMTP id
 b4mr3270803lfo.114.1565893534501; 
 Thu, 15 Aug 2019 11:25:34 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 v2sm565384lfb.88.2019.08.15.11.25.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 11:25:33 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <3d07492e9a9e1ebb1bff17a4f42afa2bd9ec1723.camel@suse.com>
 <a71ddd42-173d-32be-0674-47818316232e@gmail.com>
 <189da8d7-dee8-18f8-fbbf-699761f0b656@arm.com>
 <d92cecb0-397a-004f-aa80-e2761d9fadb5@gmail.com>
 <9c12cfb7c9b9b6c278f3f9e075d8ff117ac45190.camel@suse.com>
 <2476d08e-91cd-83ed-6637-9a801272570c@gmail.com>
 <5ec9039f-5b97-cfd3-a5a2-9adbdb4a7808@gmail.com>
 <8d5c4fdfacea5fa2fd4c209b80cf28cb9f0ae883.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <5a4eabeb-4d8f-ed49-444d-acf775cbaafa@gmail.com>
Date: Thu, 15 Aug 2019 21:25:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d5c4fdfacea5fa2fd4c209b80cf28cb9f0ae883.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8sCgoKT24gMTMuMDguMTkgMTc6NDUsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+
IFdoYXQgZG8geW91IG1lYW4gd2l0aCAiWWV0IGl0cyBzY2hlZHVsaW5nIGlzIHZlcnkgaW1wbGVt
ZW50YXRpb24KPiBkZXBlbmRhbnQiPwoKVGhlIGZyZWVydG9zIHByb3ZpZGVzIGFuIGludGVyZmFj
ZSB0byBpdHMgc2NoZWR1bGluZyBpbnRlcm5hbHMgbGlrZSBgdlRhc2tTd2l0Y2hDb250ZXh0YCBh
bmQgYHhUYXNrSW5jcmVtZW50VGljaygpYCwgd2hpY2ggc2hvdWxkIGJlIGNhbGxlZCBieSB0aGUg
cGxhdGZvcm0tc3BlY2lmaWMgY29kZS4gSSB0aG91Z2h0IGl0IGlzIHBvc3NpYmxlIHRvIGFsdGVy
bmF0ZSBzY2hlZHVsaW5nIGJlaGF2aW9yIGNhbGxpbmcgdGhvc2UgaW50ZXJmYWNlcyBkaWZmZXJl
bnRseS4KVGhvdWdoLCBvbiB0aGUgc2Vjb25kIHRob3VnaHQsIGl0IHdvdWxkIG5vdCBwcm92aWRl
IGVub3VnaCBmcmVlZG9tIHRvIGJ1aWxkIHNvbWV0aGluZyByZWFsbHkgZGlmZmVyZW50LgoKPiBa
ZXBoeXIsIG1heWJlPwoKT0ssIHdpbGwgbG9vayB0aHJvdWdoIGl0IGEgYml0IGxhdGVyLgoKLS0g
ClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
