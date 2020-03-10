Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF869181009
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 06:28:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBtt3-000732-2L; Wed, 11 Mar 2020 05:26:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1V1o=43=cloud.ionos.com=guoqing.jiang@srs-us1.protection.inumbo.net>)
 id 1jBo0l-0004CT-Gl
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 23:10:07 +0000
X-Inumbo-ID: 47bfa18e-6324-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47bfa18e-6324-11ea-92cf-bc764e2007e4;
 Tue, 10 Mar 2020 23:10:06 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a24so492452edy.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 16:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZjzfLVKcrEVYs6WhxkjJMrt4JgyDW89UP2lOPu52OFg=;
 b=AFnM8/qVZ5INpBhagP0TzCOiNgkxgenab2JvoMJ9TochGwwsyROWvjIewmaXHDUmar
 l+T11XTf3Z5/Ln3tLw8rQzmHYyAEoebfFfwlJsw4tdw5dINkokIRH6NS2P54C8D6wCSe
 ws5FELqRVVqhVPNU17Zok/L7q8FpBv0xeV2Yx/a7IwZ+YYOXOhMa8eTAabzdA20EG7IY
 J84WyBNSEyA/7FhPiNt9Zcn8JPOOzmRwoHz4R7hn1NRoq0KTMVjRHrmh0e6pxHuZgivu
 ZZqYfgk18R1hF/eFxnc6c5j6COc0wlMKtMCm0st1cu2neOcTZro4+BlqXr2NtmU9v/Vs
 2n4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZjzfLVKcrEVYs6WhxkjJMrt4JgyDW89UP2lOPu52OFg=;
 b=X7fqFjNKThSm1oFuwcRVl4xG7S8t1CVl6pHWz6MFvKLChsitTiRzlcZLfexp+oz1jq
 viKYSZyUNz8RZ8N4SvDRVZETmMdymfFNYrQzHI022uZcAPG9cxL1mxqiZDPPVTBlQOxN
 vJYL26n86CQWAh77f7OM3W8dLXj4yGQVui0Bfim9N3843K98i8V/9hrhN/qwSk+Scdcw
 1hRBuLFXOO/3ShH8BhUBUN7ZLsuddNGPcticFdGxH/mr0HP5nWHfxE+/Qf3J8TmbfxId
 TGWzLLneTmfVcn4pRzqUxkPU6NxsCGqzIZ9m8BwhFfpZN3LZzhs2tph34/UcKqMkIJjZ
 ZICQ==
X-Gm-Message-State: ANhLgQ0a9gLYjax7Cy1ymXyIjWVOkIuLJ1Ji+c1gfs2DG8R8E2cGcdmr
 LOGcx25s3IoqcencYSQ4icR69g==
X-Google-Smtp-Source: ADFU+vuw/QrLgknOBSnLL6UEPd5ZmG0mMBAvF0lDukG/ngJ9XGt+BMvhR1Vfo0DVxEJ2jx46GiOIfQ==
X-Received: by 2002:a05:6402:549:: with SMTP id
 i9mr174325edx.323.1583881805877; 
 Tue, 10 Mar 2020 16:10:05 -0700 (PDT)
Received: from ?IPv6:2001:16b8:4849:2c00:55b0:6e1e:26ab:27a5?
 ([2001:16b8:4849:2c00:55b0:6e1e:26ab:27a5])
 by smtp.gmail.com with ESMTPSA id h22sm3715651eds.88.2020.03.10.16.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 16:10:05 -0700 (PDT)
To: Matteo Croce <mcroce@redhat.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-scsi@vger.kernel.org, linux-nfs@vger.kernel.org
References: <20200310223516.102758-1-mcroce@redhat.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <d473061b-688f-f4a6-c0e8-61c22b8a2b10@cloud.ionos.com>
Date: Wed, 11 Mar 2020 00:10:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200310223516.102758-1-mcroce@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Mar 2020 05:26:31 +0000
Subject: Re: [Xen-devel] [PATCH v2] block: refactor duplicated macros
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
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Song Liu <song@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzLzEwLzIwIDExOjM1IFBNLCBNYXR0ZW8gQ3JvY2Ugd3JvdGU6Cj4gKysrIGIvZHJpdmVy
cy9tZC9yYWlkMS5jCj4gQEAgLTIxMjksNyArMjEyOSw3IEBAIHN0YXRpYyB2b2lkIHByb2Nlc3Nf
Y2hlY2tzKHN0cnVjdCByMWJpbyAqcjFfYmlvKQo+ICAgCWludCB2Y250Owo+ICAgCj4gICAJLyog
Rml4IHZhcmlhYmxlIHBhcnRzIG9mIGFsbCBiaW9zICovCj4gLQl2Y250ID0gKHIxX2Jpby0+c2Vj
dG9ycyArIFBBR0VfU0laRSAvIDUxMiAtIDEpID4+IChQQUdFX1NISUZUIC0gOSk7Cj4gKwl2Y250
ID0gKHIxX2Jpby0+c2VjdG9ycyArIFBBR0VfU0VDVE9SUyAtIDEpID4+IChQQUdFX1NISUZUIC0g
OSk7CgpNYXliZSByZXBsYWNlICJQQUdFX1NISUZUIC0gOSIgd2l0aCAiUEFHRV9TRUNUT1JTX1NI
SUZUIiB0b28uCgpUaGFua3MsCkd1b3FpbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
