Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C410BF3F7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:23:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTi0-0006yf-6i; Thu, 26 Sep 2019 13:21:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDThz-0006ya-7h
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:21:23 +0000
X-Inumbo-ID: 884c681e-e060-11e9-9652-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by localhost (Halon) with ESMTPS
 id 884c681e-e060-11e9-9652-12813bfff9fa;
 Thu, 26 Sep 2019 13:21:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b24so2547561wmj.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 06:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tv4wKkA5lfpBLEfDf4P4Xbss+JICd+JQhxvWdsIjNNk=;
 b=nZIDjxvb4GIaEt4ynvwv0IJ9AWeRvuODMOKk8uW/Zeyaauz40yQQcJRGJ6nUXo1Dle
 /qEGpUXDnaHnBrapf0AE7IOgu2CnH6tT3G7lV3bYL/Bkje7qa8aNW+Jtda35rFpDlpyO
 5iWSauf9lT8wOktOU4L7e8RLIXkz79OTZuw83Deh+cWqWmBWaAt/Oxd525e2qOtxethx
 wCwiqkXgLWFn89TTq63Tmb2NBpk5efieOoPWUXEfVkUiCoxWV9MhgVUQI1Y3MD0XsmNL
 LsIvfnfQ/KMdd+woloaSgNUfKzxnKUc4ZBA/0/hTZ3RLQ6P8qJALJMK9ZG2JQtEQece9
 XRig==
X-Gm-Message-State: APjAAAWgQCOieEqhCSqgaoai1YJrLu2bbpOkdQfiwpJbkzZhm21ZGjmZ
 kFgx7jms1oZrswXE1LHnUt8=
X-Google-Smtp-Source: APXvYqwBSqSpK2UHK8P5TUU5NF3Z+DKR3+fat9WFmRKC4OO5s01okMcKrFakC9qqz0SyiZyxGhmF3g==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr2845947wml.173.1569504081666; 
 Thu, 26 Sep 2019 06:21:21 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id v2sm4224938wmf.18.2019.09.26.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 06:21:21 -0700 (PDT)
Date: Thu, 26 Sep 2019 14:21:19 +0100
From: Wei Liu <wl@xen.org>
To: hongyax@amazon.com
Message-ID: <20190926132119.jf4wnqirffisdcxp@debian>
References: <cover.1569489002.git.hongyax@amazon.com>
 <3dba7fe6e3a9be5f41d02d41bc4ec6dbb1ba734c.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3dba7fe6e3a9be5f41d02d41bc4ec6dbb1ba734c.1569489002.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [RFC PATCH 59/84] x86/pmap: break the loop in pmap
 APIs.
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTA6NDY6MjJBTSArMDEwMCwgaG9uZ3lheEBhbWF6b24u
Y29tIHdyb3RlOgo+IEZyb206IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4gCj4g
TW9kaWZ5IHRoZSBwbWFwIFBURXMgZGlyZWN0bHkuIFVzaW5nIHNldC9jbGVhcl9maXhtYXAoKSBt
YXkgcmVzdWx0IGluCj4gaW52b2NhdGlvbiBsb29wcy4KPiAKClRoYW5rcy4gVGhpcyBpcyBhIGdv
b2QgY2F0Y2guIEkgbmV2ZXIgZ290IHRvIHRlc3QgUE1BUCBzZXJpb3VzbHkuCgpUaGlzIHBhdGNo
IHNob3VsZCBiZSBzcXVhc2hlZCBpbnRvIHRoZSBwYXRjaCB0aGF0IGludHJvZHVjZWQgUE1BUC4g
WW91CndpbGwgbmVlZCB0b28ga2VlcCB5b3VyIFNvQiB0aGVyZS4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
