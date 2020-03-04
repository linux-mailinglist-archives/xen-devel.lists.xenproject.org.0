Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA41791C4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:53:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9UQJ-0000Ov-6u; Wed, 04 Mar 2020 13:50:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/75R=4V=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9UQI-0000Oi-2X
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:50:54 +0000
X-Inumbo-ID: 29f365c9-5e1f-11ea-a3df-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29f365c9-5e1f-11ea-a3df-12813bfff9fa;
 Wed, 04 Mar 2020 13:50:53 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id e25so2397483edq.5
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 05:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nUOxF6a7YWDCkJQKwMw5WU/iZ3kgnizQnBTCbTp/G3M=;
 b=gxVAinIZOQEg4oCPuqKecZz+wiM7ryVGQ5jv3crMj/AQkYcmwILgAL5vYEcAG7E4K8
 m+vArnFMXvZ3qnkVmLVOzPCi2CDF41VdZLIpqIVdUEBFJv4vuDuB87LRKVugC01nxCrj
 p+AzEZz9AUJKVf9nQnMyDTFdNjemdHVxDLOvhOUuxTsahXADGR3+8aC7W2Wv2Yigq4eF
 gSNqBQNnKJr163H1GcH4ZxFaV/xYkBNeThT8NXTqcZ2d7k2qATwzKfjsotB163DVzKfU
 64B3UhwCkhk+dWQMxwQRjZNAfbuM9niX9vRSbOFcO9zLA7DtyqrHEgdipnB49sAEei44
 LhtQ==
X-Gm-Message-State: ANhLgQ38o+ZD2aOR/UJtZU36Gl+dwp3zLr/svYXqjt5DgkZTfA8wKAUA
 SKXxqex1iu4DgNzaUz2wAuw=
X-Google-Smtp-Source: ADFU+vvRs/8m17ncgBqBdzTJujYabyOfUGbiS2SlE8/I+XAXVPuKXJJGhzqox4bFzMMW7oq6yMBaTA==
X-Received: by 2002:a50:8a62:: with SMTP id i89mr2863379edi.173.1583329852681; 
 Wed, 04 Mar 2020 05:50:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id s10sm714333ejr.2.2020.03.04.05.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 05:50:52 -0800 (PST)
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20200303221423.21962-1-dongli.zhang@oracle.com>
 <20200303221423.21962-2-dongli.zhang@oracle.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3bc030fb-340e-434d-60a2-a54bce097680@xen.org>
Date: Wed, 4 Mar 2020 13:50:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303221423.21962-2-dongli.zhang@oracle.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xenbus: req->err should be updated
 before req->state
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
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joe.jin@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wMy8yMDIwIDIyOjE0LCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBiYXJyaWVyIHRvIGd1YXJhbnRlZSB0aGF0IHJlcS0+ZXJyIGlzIGFsd2F5cyB1
cGRhdGVkCj4gYmVmb3JlIHJlcS0+c3RhdGUuCj4gCj4gT3RoZXJ3aXNlLCByZWFkX3JlcGx5KCkg
d291bGQgbm90IHJldHVybiBFUlJfUFRSKHJlcS0+ZXJyKSBidXQKPiByZXEtPmJvZHksIHdoZW4g
cHJvY2Vzc193cml0ZXMoKS0+eGJfd3JpdGUoKSBpcyBmYWlsZWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKQ2hlZXJzLAoKLS0tCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
