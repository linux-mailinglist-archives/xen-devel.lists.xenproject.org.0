Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC78164A52
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:28:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4SAn-0001XC-CK; Wed, 19 Feb 2020 16:26:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gcDT=4H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j4SAm-0001X7-AQ
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:26:04 +0000
X-Inumbo-ID: 858c9f94-5334-11ea-ade5-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 858c9f94-5334-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 16:26:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w12so1291885wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 08:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9eAQjVB0hG/LE7tJUueuSJHUtb8E62xfP325AkAiJZs=;
 b=ucEYLxZpl6tWBIBZlzel4eJFaNwEQcxpWBu7edLSSOJEGJdzh1It1BwRZNpWSx2lk1
 JFhfMXLv9nLa9tFxTO7oIiKhaR2tVzqsoYGHV69VFy+xxs9B7gHxWmDkB3XSOR6uBGOd
 HULprl/8ooO8ds+RtgOH67aN/Vr8oJJLdpIdFKQdrAw/DfenzX23JhJYWWzEVGMbZ7hY
 14BEOvI0Vd0OGbDkB6468mTfWVSsXekEpBu97pBeKaMxkhl3NdI18pN79fe3zgASEBzO
 X6pvlsexZmilm2iHHH70tUEmAbKs/4iArdwGLILexsRd3nhFRZzx+0FD/MSvM6ScHaSW
 vgXg==
X-Gm-Message-State: APjAAAXQkilQEXB3/r1plYtkb5Rm0guZIgSNkDRI2XHX7K9O8Tz7qv6j
 o2ww8vemJ+RUMyk1i/j1xec=
X-Google-Smtp-Source: APXvYqyie2VEwausEfdPPchImEBdIORe9McbbwQv6HWlRML4aSCBADGc4w2mUTsNz2fUxyumqJrBUw==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr35352738wrn.85.1582129562824; 
 Wed, 19 Feb 2020 08:26:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id f207sm448178wme.9.2020.02.19.08.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 08:26:02 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ac088c1e-0326-b72a-e1bf-582493e4e712@xen.org>
Date: Wed, 19 Feb 2020 16:26:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219081126.29534-4-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v5 3/8] xen: add basic hypervisor filesystem
 support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wMi8yMDIwIDA4OjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ICtpbnQgaHlwZnNf
d3JpdGVfYm9vbChzdHJ1Y3QgaHlwZnNfZW50cnlfbGVhZiAqbGVhZiwKPiArICAgICAgICAgICAg
ICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSB1YWRkciwgdW5zaWduZWQgbG9u
ZyB1bGVuKQo+ICt7Cj4gKyAgICB1bmlvbiB7Cj4gKyAgICAgICAgY2hhciBidWZbOF07Cj4gKyAg
ICAgICAgdWludDhfdCB1ODsKPiArICAgICAgICB1aW50MTZfdCB1MTY7Cj4gKyAgICAgICAgdWlu
dDMyX3QgdTMyOwo+ICsgICAgICAgIHVpbnQ2NF90IHU2NDsKPiArICAgIH0gdTsKPiArCj4gKyAg
ICBBU1NFUlQobGVhZi0+ZS50eXBlID09IFhFTl9IWVBGU19UWVBFX1VJTlQgJiYgbGVhZi0+ZS5z
aXplIDw9IDgpOwoKU2hvdWxkbid0IHRoaXMgYmUgWEVOX0hZUEZTV19UWVBFX0JPT0w/IEJ1dCB0
aGVuLCB3aHkgYXJlIHdlIGFsbG93aW5nIGEgCmJvb2xlYW4gcGFyYW1ldGVyIHRvIGJlIGhlbGQg
aW4gYSA2NC1iaXQgdmFsdWU/CgpJSE1PLCBhIGJvb2xlYW4gc2hvdWxkIHJlYWxseSBiZSBob2xk
IGluIGEgYm9vbCBhbmQgbm90aGluZyBlbHNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
