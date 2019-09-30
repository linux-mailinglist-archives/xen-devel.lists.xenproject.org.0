Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44EC23E9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExEa-0007AL-3s; Mon, 30 Sep 2019 15:05:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExEY-0007A9-M8
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:05:06 +0000
X-Inumbo-ID: af1bc314-e393-11e9-96d6-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by localhost (Halon) with ESMTPS
 id af1bc314-e393-11e9-96d6-12813bfff9fa;
 Mon, 30 Sep 2019 15:05:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 7so13856723wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pwsRGYKNji+p0OJhxq1ld3nZGnFIJHo001m56AgsfGo=;
 b=Nm/OsLYGBml7cuTmtCcsWDUc6/LzTyl6bx/yXAHlwEUKgaTLMoN6hZQfX2jJTDy2jd
 BZkArvHpBdN220Sqe2EPNMat9ZRM2Zyi7hrYRAiPjYGUc0Z9yTf14DFT94MTRW9NDgXa
 znQ84ATtGcx9Qj5ctbJgS8NROfGHxMqdqT/Yrq+xvjNcUMxeWTYMiPkrCRmttde667+k
 8lbLe83ydPu7/7eWKxJLVaYprQXvrcem3Wjd5r0gXCnCOwZMnI5O8G7E2mlzVZDxAl6z
 7j2XJa0Y2MEnKsc67zISVhNvnpdBx4liw2NC4mOxZTEvFxCXqOS+sRitQw6snwpvAENR
 G+ug==
X-Gm-Message-State: APjAAAXz9Yl2EYxsv2JpPkv4aET5LY79SU4eVN216IqzG0W0Ii8HOndI
 MQx4U26nczCjyUaSn+HA5RU=
X-Google-Smtp-Source: APXvYqwgvbLbBc6NOdN9+6ysESfi9LyJYfsRyvKt9mmn02U4y0Y6idgprq/c/J+kG3EGEIHipQ0HRQ==
X-Received: by 2002:a1c:454:: with SMTP id 81mr17120452wme.119.1569855904661; 
 Mon, 30 Sep 2019 08:05:04 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f20sm13356859wmb.6.2019.09.30.08.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:05:04 -0700 (PDT)
Date: Mon, 30 Sep 2019 16:05:02 +0100
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyax@amazon.com>
Message-ID: <20190930150502.vv3vtgg5qmdreitv@debian>
References: <cover.1569833766.git.hongyax@amazon.com>
 <e16d11bb1dc1dc973476d0ca3b26844ff9d738a4.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e16d11bb1dc1dc973476d0ca3b26844ff9d738a4.1569833766.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 01/55] x86/mm: defer clearing page in
 virt_to_xen_lXe
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MzI6NTNBTSArMDEwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBEZWZlciB0aGUg
Y2FsbCB0byBjbGVhcl9wYWdlIHRvIHRoZSBwb2ludCB3aGVuIHdlJ3JlIHN1cmUgdGhlIHBhZ2Ug
aXMKPiBnb2luZyB0byBiZWNvbWUgYSBwYWdlIHRhYmxlLgo+IAo+IFRoaXMgaXMgYSBtaW5vciBv
cHRpbWlzYXRpb24uIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpUaGUgYmVuZWZpdCBvZiB0aGlzIHBhdGNoIHdh
cyBxdWVzdGlvbmFibGUsIGJlY2F1c2UgaXQgbWFkZSB0aGUgbG9jawpoZWxkIGxvbmdlci4gSSBo
YWQgZGVjaWRlZCB0byBkcm9wIGl0LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
