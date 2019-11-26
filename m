Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03810A5A1
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 21:49:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZhkU-0003qe-5T; Tue, 26 Nov 2019 20:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFuF=ZS=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZhkT-0003qY-GK
 for xen-devel@lists.xen.org; Tue, 26 Nov 2019 20:47:49 +0000
X-Inumbo-ID: 018db478-108e-11ea-b155-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 018db478-108e-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 20:47:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t26so4929470wmi.4
 for <xen-devel@lists.xen.org>; Tue, 26 Nov 2019 12:47:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=grvbMhRSykORAy9EqA/L7I5w8oEEipMeAkz1esF6eLU=;
 b=bHaHJ9s+aMEyHOm6NQpcgY5TInjNGwFGFTY8EalAQ4TLrJjJ3cNGclOho4dD9LHGgu
 YVVrWLZtIAFmw1BZ58FqcldXBg73dcWeO1EqgBheb86wilypOroUppSUNCKGnQK/rASZ
 louwkl5mWobgN7dTskNGFST89sj3X3RbGkOwzYTx1jja5Q0pnqShjOPIVPyhL5oSjjsy
 4QmBzelbL3R3b21rLWeiM1S5ep00hA7R+C+PywVkVC2BoIsMetqkWBjB6FfMh875jpJN
 aI+TIpqTJNU5N23HbndrGrS5Qo8jhaA4WA0KeG1+kfyvuZEAhtQeOi73lnagvjBOlSwq
 ybNg==
X-Gm-Message-State: APjAAAXqjG5r8wtCl/7tpDcPiJ4KAi1pQDfxrjMN8/jAunRNyMLXhhor
 KJMoWdauvg1JQ1vfwTmIp+0=
X-Google-Smtp-Source: APXvYqwD76aJz+F92PXcVJydlJShxu/WOp7gCM6GiaELomoGZXVx9qsV7IZFqwLdxizNx/G8BdSrlw==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr860198wmc.121.1574801268234; 
 Tue, 26 Nov 2019 12:47:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id x7sm15942178wrq.41.2019.11.26.12.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 12:47:47 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
Date: Tue, 26 Nov 2019 20:47:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: peng.fan@nxp.com, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>, Alice Guo <alice.guo@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8xMS8yMDE5IDIwOjQzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gKyBK
dWVyZ2VuCj4gCj4gSSBtaXNzZWQgdGhhdCB5b3Ugd2VyZW4ndCBpbiBDQyB0byB0aGUgb3JpZ2lu
YWwgcGF0Y2gsIHNvcnJ5Lgo+IEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgZ28gaW4sIGFzIG90
aGVyd2lzZSBMaW51eCA1LjQgY291bGQgcnVuIGludG8KPiBwcm9ibGVtcy4gSXQgaXMgYWxzbyBh
IHByZXR0eSBzdHJhaWdodGZvcndhcmQgNCBsaW5lcyBwYXRjaC4KCjUuNSAob3IgNS42KSBpcyBu
b3QgZ29pbmcgdG8gcnVuIG9uIFhlbiBmb3Igb3RoZXIgcmVhc29ucyAoc3RpbGwgaW4gdGhlIAp2
R0lDKS4uLiBTbyBJIHdvdWxkIG5vdCB2aWV3IHRoaXMgYXMgY3JpdGljYWwuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
