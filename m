Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 283AAB9061
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 15:09:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBIbg-0001Rm-C8; Fri, 20 Sep 2019 13:05:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5Xb=XP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iBIbe-0001Rh-3a
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 13:05:50 +0000
X-Inumbo-ID: 5da04b0c-dba7-11e9-b299-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5da04b0c-dba7-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 13:05:49 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w67so5020136lff.4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2019 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aalR6us1OFogSOnfCa8Sla7CtUyrzBXSen7wv/AGdZc=;
 b=iUXmZuu5WYxQSfse2sk7nxxU+bcChB+Jcm14YgW2U2tuTKOlFYntToVKYiTbqXAWkq
 NkeJ/2jSC2NAGqoEJWVNy4lumQYG4j8Se77iwqYmBvNvI7G/qT0IgNIOIr5roFbohHZg
 Cs6LJcIwXqeD4gGZmAIzUnQKyXhW/Z/+2o9hleSrN9JgwO1Rm855QF45w0YcA+6W+8vX
 o7T5Ctpp3A3xS6na3t5va3UuRCBfHxNqOQzpcAnJ20yLfHeGzBCdKTH7ftqPR+zhE6dg
 kBEfWTwvTsNDNrIeb5dKiJfzAizfnuPVxqTT7GHtO7Xf450Isb8aZN3vj6KRwQPfR8EZ
 5j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aalR6us1OFogSOnfCa8Sla7CtUyrzBXSen7wv/AGdZc=;
 b=JydPe0NRG3+SFUaJfq2ufAqahzJoe0CvGuPN65TT4mQAiB2JkvvBxT5YkNqPg96R5E
 3GTzo6HKKRscbTzkTRS+7/3o9V+bl2zeca9L3vVUblO6SavXtbzGKBeFe4R1oISQAV62
 OZkl5/lAUG5BAZ8pdemSlS81u33nSb25aj7HeJp9bM3XWI8JjEhqcWeRzGtmox59QO2B
 RiTsENW8koL/U8SMMtKVO1HiImHBGL5wFr+Xr8UxUDrBg/sP9xWzbPqDXM1I/7nNhB2m
 YYheMpmAbhZphyNVi6OIE2UfyULxpgiZAqxRu/ndSqzfqLlNcb8h5J2d3Nw8911RgHJ6
 Xtlg==
X-Gm-Message-State: APjAAAVjdUC9/dHPqkOKlrqpegDh1USuH/VMzYiQP79SEx8FaoCotIrY
 TNhKLh6SThSw2KNxakE8oA8=
X-Google-Smtp-Source: APXvYqysbTuC8M7fUTGjaLWN+/XCRyitZS8zzIdHv2np8IDjnQHP8u+P8PdQ7GouMGFFk8t7OP0F+g==
X-Received: by 2002:a19:c6d5:: with SMTP id w204mr8487988lff.53.1568984748382; 
 Fri, 20 Sep 2019 06:05:48 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id d6sm463668lfa.50.2019.09.20.06.05.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 06:05:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190820122255.9864-1-julien.grall@arm.com>
 <ccfee255-79e1-43f1-a92b-28c6c3ab6606@gmail.com>
 <alpine.DEB.2.21.1909191730070.19418@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <87749613-d242-32db-4a9c-76fa67cc3b4d@gmail.com>
Date: Fri, 20 Sep 2019 16:05:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909191730070.19418@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: iommu: Panic if not all IOMMUs are
 initialized
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwLjA5LjE5IDAzOjMxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSwgU3RlZmFu
by4KCj4gT24gVHVlLCAyMCBBdWcgMjAxOSwgT2xla3NhbmRyIHdyb3RlOgo+PiBPbiAyMC4wOC4x
OSAxNToyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pgo+PiBIaSwgSnVsaWVuCj4+Cj4+PiAgICAt
ICAgIGlvbW11X3NldHVwKCk7Cj4+PiArICAgIHJjID0gaW9tbXVfc2V0dXAoKTsKPj4+ICsgICAg
aWYgKCAhaW9tbXVfZW5hYmxlZCAmJiByYyAhPSAtRU5PREVWICkKPj4+ICsgICAgICAgIHBhbmlj
KCJDb3VsZG4ndCBjb25maWd1cmUgY29ycmVjdGx5IGFsbCB0aGUgSU9NTVVzLiIpOwo+Pj4gICAg
Cj4+IFBsZWFzZSBhZGQgIlxuIgo+Pgo+Pgo+PiBZb3UgY2FuIGFkZDoKPj4KPj4gVGVzdGVkLWJ5
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
Pgo+IEkgYWRkZWQgdGhlICJcbiIsIGZpeGVkIGEgdHlwbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2Us
IGFuZCBjb21taXR0ZWQgdGhlCj4gcGF0Y2guCgoKVGhhbmsgeW91LCBJIHdpbGwgcmUtYmFzZSBh
bmQgZHJvcCBkZXBlbmRlbmN5IGZyb20gdGhlIGNvdmVyIGxldHRlciBmb3IgCnRoZSBjb21pbmcg
VjUgKElQTU1VK2lvbW11X2Z3c3BlYykuCgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNo
ZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
