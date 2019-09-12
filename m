Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30DB0EA7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:12:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NuO-0006Sq-W9; Thu, 12 Sep 2019 12:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyaC=XH=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i8NuO-0006Sj-6t
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:09:08 +0000
X-Inumbo-ID: 1e9e0496-d556-11e9-978d-bc764e2007e4
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e9e0496-d556-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 12:09:07 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u14so23321575ljj.11
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2019 05:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wgC6z8LzPUe+1Q92UdHA71pZPZfvvMi/bIZsRfZguh0=;
 b=L0xf/30xOCM8rao5xyqlsHgDnFz4Ax4ds8EeAg0gV11ZklSoIgADImKpKmneMkWthe
 VtOqsaWZjFCEYyySv4ilJAevk5TxDNcwHx0Ji9E8H4v8JYWJpfj2l5Ky9njrj4gqsnWR
 F7CNGbAk/pzgSIiGsFLFwY+OK/FDS65sCJwSiMF7Xz6CUMNq4L6VP25Dei+LJlnrvV++
 JqmfcGlSnU6UbRvVvSag4W3+S2I01kTTVy0W2mjxX+oVsLq/awWcgFyULyIFsjGEpsPb
 597UnjyEtsP9FlIAwkOeEKr3ENSSzi8BkndkNVQ8OQPk4fMr2gbpVkyee39XiCcxsC5r
 WxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wgC6z8LzPUe+1Q92UdHA71pZPZfvvMi/bIZsRfZguh0=;
 b=L0xntURSSarZmiQd7IImr3+Ceq1GkFDzTdnVydzRui+5IjpeDmiOuyVXXe3brXqfQP
 46u34tRMO50TcVI2nYl9v17XvZmS4VhvtqeeLHAYYgmi74aj930+Kj1GZJfWat0cSdQR
 y6LgocXnb/Wbnx7tns2thkDHXFbAL0hoGV9ijZ3sNM4+cosl9+fCNsvtroegwCsjQnsB
 XAhwFGw1axbElEvp198r8yNUjgewws6w9zavXXHl0Wlf6iM9gKx0TXCnlcAEoTphdMQx
 t0o6DW/pHamHbGuSwqsGPDsawx7viNMpG2SffG0TWOFCJSfNFXwK6j/QiVrWC432pAH0
 SiUQ==
X-Gm-Message-State: APjAAAXnprtOdnmE/KqRp42uP2tCFqDUuLrch2ZtH6B0GzO8Oy7A3eEI
 EXRmDoIOTMi/2/IuwBdOMco=
X-Google-Smtp-Source: APXvYqzNeoQrGSTL9eE/AMCFS8rJOet3SEXfrTIPnDqCSc9MtY1a6uLQ2srYh2odtjmC94JkXDvrAQ==
X-Received: by 2002:a2e:7410:: with SMTP id p16mr26843011ljc.186.1568290146266; 
 Thu, 12 Sep 2019 05:09:06 -0700 (PDT)
Received: from [10.17.180.84] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 u10sm6166488lfk.34.2019.09.12.05.09.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 05:09:05 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-5-git-send-email-andrii.anisov@gmail.com>
 <87pnk6g1vz.fsf@epam.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3d39ee7e-f63a-0fa6-c323-ff4742627ea4@gmail.com>
Date: Thu, 12 Sep 2019 15:09:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87pnk6g1vz.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 4/9] arm64: utilize time accounting
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gVm9sb2R5bXlyLAoKT24gMTEuMDkuMTkgMjA6NDgsIFZvbG9keW15ciBCYWJjaHVrIHdy
b3RlOgo+IAo+IEhpIEFuZHJpaSwKPiAKCkFzIHdlIGFncmVlZCwgSSdsbCB3aXBlIG91dCBkZWJ1
Z2dpbmcgcmVtYWlucyBhcyB3ZWxsIGFzIGNsZWFudXAgY29kaW5nIHN0eWxlIG5pdHMgYW5kIHJl
c2VuZCB0aGUgc2VyaWVzLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
