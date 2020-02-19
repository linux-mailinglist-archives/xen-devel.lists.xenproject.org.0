Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE25164AE5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:47:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4ST6-0003fF-Bs; Wed, 19 Feb 2020 16:45:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rwKB=4H=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j4ST4-0003eu-Dz
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:44:58 +0000
X-Inumbo-ID: 299e0c4c-5337-11ea-ade5-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 299e0c4c-5337-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 16:44:57 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t23so1417615wmi.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 08:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TrG1L2VGzXZTkpSwWyl6DCEmpwmLxsHAtrfzv+YSGlg=;
 b=RQWOYYOWjupx5XHFt7oLflvM7ynEi39rDuME/3B4I9xOY0ptK7a8lgQbxeYrbr1MKK
 +M4nz8goXgFxYSpCvErzu7QtOYeBGVvoUtZqZUviuIviVSQNiYN0KCkaWkqqIPrCcYnm
 /2tg5omBFzFU+UfnhzkriQrZDsnlpUVNg85SlQcWjhbXuq4IDNbQFR8HLLQPHmC7WEXV
 dx6bM1Yz6hgLS1fSRnJZo399TR7pJ85oStT1mnquG9VSWLASaB/f3/Q9kKSpS5mNQrXi
 ydsw8AaqAS4SeIK8XbhBee3GGog0hgC2NChoOkI1AyYQrePVs1nDNkvo+36dXYAZSEQj
 8niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TrG1L2VGzXZTkpSwWyl6DCEmpwmLxsHAtrfzv+YSGlg=;
 b=BvvdzJ/8Iwtf6QiFUOGy71txpNzEktesq1rCHXy2X2YNVjY/o7agQcHCxYDEUz90OJ
 F/jLIb8I10gZ0X5THD5W0Ad3F6EZZh9eznvQhqj163PSl7TlvdZbToufm8CrrZsPKz2T
 fhF8lvONyR0tdhv2kXvdfmwLpFC4hRZA5RRZARyhls30xGir18gML+6eqIyERNTo6MOy
 FxHDj/wzpjNglLwIuVWueEU9NHeLJ+JHwWVEmi8b48pWTIn8Ze18uEvY1f334HbQ93SO
 26Zh/BTXnvtFMoAtlSLawxL+5w2CpFI3u0nzqq7tUYAW1xcwcPSUmrFDE5bwh+zmuzxF
 ehLw==
X-Gm-Message-State: APjAAAUAf2QfHGtpBrzosN7pMSMI5TNU+w9vL9GYKjRjksIuj5wRdJKl
 GZCGJtxgmjDbnQUFbT8/da0FgxRxVipUg1OwDws=
X-Google-Smtp-Source: APXvYqx4KkSvaoYDTfYvDEkkRS/mHopfO1PUajSBHe0qMr+9S7cPp5ADATz1yEaGgizzBuJ52EFdzDx/7v/9LXN6yp8=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr11179456wmm.77.1582130697131; 
 Wed, 19 Feb 2020 08:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20200210184549.28707-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200210184549.28707-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 19 Feb 2020 09:44:20 -0700
Message-ID: <CABfawh==BEes5nvt=FD4waOb4pAgANGV+nPG1+XQ=CkgZ8FRGA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: Restrict access to most HVM_PARAM's
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMTE6NDYgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBBUk0gY3VycmVudGx5IGhhcyBubyByZXN0cmlj
dGlvbnMgb24gdG9vbHN0YWNrIGFuZCBndWVzdCBhY2Nlc3MgdG8gdGhlIGVudGlyZQo+IEhWTV9Q
QVJBTSBibG9jay4gIEFzIHRoZSBwYWdpbmcvbW9uaXRvci9zaGFyaW5nIGZlYXR1cmVzIGFyZW4n
dCB1bmRlciBzZWN1cml0eQo+IHN1cHBvcnQsIHRoaXMgZG9lc24ndCBuZWVkIGFuIFhTQS4KClRo
ZXJlIGlzIG5vIHBhZ2luZyBvciBzaGFyaW5nIGltcGxlbWVudGF0aW9uIG9uIEFSTSBhbnl3YXku
IEEgY2Mgd291bGQKaGF2ZSBiZWVuIG5pY2UgdGhvdWdoLgoKVGhhbmtzLApUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
