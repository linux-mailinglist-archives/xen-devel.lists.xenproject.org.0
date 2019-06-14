Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C309946405
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 18:27:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbp1S-0003Mh-LR; Fri, 14 Jun 2019 16:25:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztYt=UN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbp1R-0003Mb-KJ
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 16:25:49 +0000
X-Inumbo-ID: 10f2d397-8ec1-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 10f2d397-8ec1-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 16:25:48 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b11so2145137lfa.5
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2019 09:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=16zqv3I+Dh4iH2tcXo/Jz0xP4ivnNinWRKieLKh+FUc=;
 b=c/HRk/fo/3A9XYeYAHybp3Mu+N2mWkUv0CJKnHwiJOX2Hw/WJlh3ddOFnQLUeSzU9m
 gzjxpN7mSNhNOrp2nDEbH3Hej5/H+DSOgyw6KMOgYB3xElCjt5lgVf9AIGZjxNOScEm1
 waL+PapMLhzZJYwhhRk2S6BNcRxMq73AXm77ZOI9R4Ke8Ip236yuyKl9LPWOLZPxwQKd
 I54vVnzycu41Nn9A/9KmCzZXVr5J+jvPn+RP8eWEZ69p1dFJyWBEVwjlyc/5mEvaLufX
 0QxeZWHPywFlw0EMj9/zVdGF6jT+DwUlCp/3YAKrkMmUHucJSuVHg9xxLMxOo/IFJI2m
 20pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=16zqv3I+Dh4iH2tcXo/Jz0xP4ivnNinWRKieLKh+FUc=;
 b=SUXqlQ2gswYcmiTLC/7Gdu7bbIbvPmU0JAJfDdATMmZwWtDmFH9R4grgV1fImiTkEk
 tzRhtFlcf2S1LYoXBCUcqE2/ImmEAeD4uLDXBwtps4Bx5nZz9f+DQ7qe+MQp3Rcwbp3r
 m1pp2hp8xAZNCMb9a/jM6RaWGunM/xHHUgPGkWqKFEzt9ej7IJB9WfiBa+WJYnqdKo6E
 E/WDRomKVFNn/SBViFcDSutATYrtxZMIzbj0l+oCiutb7LxGGCLGd1Gbxl4lNjtXAtlM
 ErJj09hC910ahDjhU96PEBohcVUG1P7gna3PqJHqIhx+UxBr+TfVA+ndBtqiE7ZxYYu4
 vG4Q==
X-Gm-Message-State: APjAAAUnDj4stecU1INAPYAh/oydvI0vPsYxd4Ie3NGrKiFlmYgB/19X
 n2/JMWaU0HGz7o3U+V2rJcg=
X-Google-Smtp-Source: APXvYqzxnWbxIoI0UAnglVR7Tt1XmLEYjG1AwVhR8GJinxu/pQkk+j3KBLufk7+8Z1W+gGn7Rzg29Q==
X-Received: by 2002:ac2:43bb:: with SMTP id t27mr27916393lfl.187.1560529547082; 
 Fri, 14 Jun 2019 09:25:47 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 g5sm665290ljj.69.2019.06.14.09.25.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:25:46 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
 <c1094660-9c41-9883-8869-f04f95976728@arm.com>
 <848e4c57-7cc2-2d68-bc23-1c01c0329c80@gmail.com>
 <210a3749-46e4-d659-ee5f-6b14990b6ab0@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <12bf2d15-32a1-4978-1cd5-2b365bc61308@gmail.com>
Date: Fri, 14 Jun 2019 19:25:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <210a3749-46e4-d659-ee5f-6b14990b6ab0@arm.com>
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

CgpPbiAxNC4wNi4xOSAxOToyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdlbGwsIHRoYXQgYSBz
dGFibGUgQUJJLi4uIEV2ZW4gaWYgSSB3b3VsZCBsb3ZlIHRvIHJlbW92ZSBpdCwgeW91IGNhbid0
IGdldCByaWQgb2Ygb2xkIGd1ZXN0cyB0aGF0IGVhc2lseS4uLgoKSW4gNSB5ZWFycywgYXMgWEVO
IGRpZCBmb3IgTEsgMy4xOD8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
