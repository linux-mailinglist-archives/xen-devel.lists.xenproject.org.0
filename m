Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AB424C3C
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:06:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1cu-0003U1-NR; Tue, 21 May 2019 10:04:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1ct-0003Tj-AQ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:04:07 +0000
X-Inumbo-ID: c42fccac-7baf-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c42fccac-7baf-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 10:04:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a10so15316126ljf.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V5k2+XMDtSV2ii0viJGCvzElHj0i45Dlrt2K+6CcZqY=;
 b=V0AMgOLwm1mnweVXU9kiawJyFp1wViw4DoUkHM7wzdI8pXIDfmS6FUU19dQ5dNONCY
 JjM5Mj5edO/+jG/4yUELhFWs7Et+dCdUafMZnEfblUTVPICi6/Qdg90Xozn0X/8Jiw9i
 lvWq/MPq9bD9Y3UMbIRSnbHF5M6n/mHDwD8XKxqwteXZPReaTTyTBQQAdXrWOLYjresd
 q7KfSnWJ0vpjVOPva4p+I6EoeIVRNgxU9CoP+UkogWjHcNRMi1ZdgwtR2x3lWMoFoO5z
 dyLGS/Mu6DhVGGnhK3rZXtVc+zc6pcaxeWsDp8rLL7BBE1ov5K/a8h7f70K+d3kiVb6d
 sKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V5k2+XMDtSV2ii0viJGCvzElHj0i45Dlrt2K+6CcZqY=;
 b=s05QMP4JxoYQgyotCmCp93PqAYx9bfNWbv/Vr19UH8jHItQLhOFYV336kzIlITR6WV
 p2fKQA+/sLgnbbnNo5YUcjy95Uoma1dMPg+4361OIsvZFfT8MfjL5K0hMaDzwn2w/LJT
 wNFSoUhcR229aZVkbMN3B7r2Je0XBuZ0bVRY1xUYTg0Lm2JrvgCTeWDic+xqsLkHKi7R
 Sdb0BbbPZtPFVTJFdsHWp/949ZvGMTlYWFh8avkx/tAzy44VLj13MDaBa7iNQJzvZLQs
 J6rh+iHnVcvs/McrM8G4eRkmsLjvYhQKYD3KwPdle/4E6/I3jS+n58o17ub1hV6CuSLb
 AurQ==
X-Gm-Message-State: APjAAAUzoB5oDybKtwXQ6vvkyZdv7w+vfi6XVMF93kVrq3RZkUWjRuw8
 vX/8m9toeXSzG356VMafnJU=
X-Google-Smtp-Source: APXvYqwyWTIL5nEG5j74VF6qSVLco3EpOURkf6WAXr7fI3VdG2+z0+NPAN7r6k0KydGfy2LKIVlpCg==
X-Received: by 2002:a2e:2e04:: with SMTP id u4mr4675757lju.144.1558433044749; 
 Tue, 21 May 2019 03:04:04 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 v24sm4534291lje.25.2019.05.21.03.04.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 03:04:03 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-17-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <76eaa8e2-3bff-6046-a06d-870f2f284560@gmail.com>
Date: Tue, 21 May 2019 13:04:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122456.28559-17-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 16/19] xen/arm: mm:
 Protect Xen page-table update with a spinlock
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMoKSBtYXkgYmUgY2FsbGVkIGNvbmN1cnJlbnRseS4gRm9yCj4gaW5z
dGFuY2UsIHdoaWxlIHRoZSB2bWFwIGFsbG9jYXRpb24gaXMgcHJvdGVjdGVkIGJ5IGEgc3Bpbmxv
Y2ssIHRoZQo+IG1hcHBpbmcgaXMgbm90Lgo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBjcmVhdGVf
eGVuX2VudHJpZXMoKSBjb250YWlucyBxdWl0ZSBhIGZldyBUT0NUT1UKPiByYWNlcyBzdWNoIGFz
IHdoZW4gYWxsb2NhdGluZyB0aGUgM3JkLWxldmVsIHBhZ2UtdGFibGVzLgo+IAo+IFRoYW5rZnVs
bHksIHRoZXkgYXJlIHByZXR0eSBoYXJkIHRvIHJlYWNoIGFzIHBhZ2UtdGFibGVzIGFyZSBhbGxv
Y2F0ZWQKPiBvbmNlIGFuZCBuZXZlciByZWxlYXNlZC4gWWV0IGl0IGlzIHBvc3NpYmxlLCBzbyB3
ZSBuZWVkIHRvIHByb3RlY3Qgd2l0aAo+IGEgc3BpbmxvY2sgdG8gYXZvaWQgY29ycnVwdGluZyB0
aGUgcGFnZS10YWJsZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAgICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAg
LSBSZXdvcmsgdGhlIGNvbW1pdCBtZXNzYWdlCj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
