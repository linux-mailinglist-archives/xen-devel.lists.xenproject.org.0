Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B71303D1
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 19:04:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1innjY-0004ro-Hq; Sat, 04 Jan 2020 18:01:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1innjX-0004rj-A7
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 18:01:07 +0000
X-Inumbo-ID: 2d9eee40-2f1c-11ea-a914-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d9eee40-2f1c-11ea-a914-bc764e2007e4;
 Sat, 04 Jan 2020 18:01:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w1so24908657ljh.5
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 10:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OzgtBko95gFNPg4NoPVCCviCsJXp11BFZDOffydrK9U=;
 b=S5FZuq22cD57TKn1GVjVeW8o3jOWcwF5Rtnd3fXTuK9VYC8LXs1oyNrYFXnXe/D+Fz
 NMfcNs0eje5svyRdMq8Hx1QDLQ7dWCU9h9LSsUnfEuL3ilZ7NHHcLplT9nPN+zxTx9Zj
 ia05YtsY9169z5GUZGFNwcsl2Ttgf/LYiKgB5EHsKZrU6v5jaO1FZMIE+bhEX587fk16
 hG1ZVlfq7QGMgSrgH0dTzBNa/kTqfAYxYWKC/DIL/TkrSDJ78nmFlQCJrCqmrvCDShLg
 AJ222aQhzZbKPg0hmbKHNNGdCnMU7O/lT/r66t/vN7we+7gl6kPB4neksZf78k0GqWXI
 ghnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzgtBko95gFNPg4NoPVCCviCsJXp11BFZDOffydrK9U=;
 b=cNVucSRo9c7f6pUQnBZDU4Y5oKTDMpPsXdpOVcXx+yTxbsX69d1v9O0WqCv2ui9GCr
 691T8bcNJRyW1vEIBSUZ+ptncfh5YYgySGfzdDQE5Mnd/pLNWu6fQNYZPbRUox1+zFnn
 0Uea72i9OavZArg2QBwmyL4niBgMWfXsaqx4VIAdqtMHWXYQWk8boH3xDijGlIBcdxb9
 7+zUCjzhXLef0veuZ5A3zD4/obZo9PSXTVWS5k/JrJCNV00WSsc6LvHY+YeZTSGirNI0
 IFA4E7DmGl0pllVhmybdrVeCTyasdkw+aAsVCfutA/ORlfJaMuQQpKfrhTF/OgzK+jOA
 mOgQ==
X-Gm-Message-State: APjAAAWP/gXFPR9YP3Y5yHRJFa6QB0sPHnIzyo53/ozTl59McfZGempa
 MI13yjT31jqXjyRju6eMNOpgvzwSsFOfyB/uLA8=
X-Google-Smtp-Source: APXvYqyv5p2Gdp84NBn+ILOUJWwGiCC+zN5bWoNRmiW+zDhCspAdUfEq4mPbaXndpjUs+gm+6F7ECpaxKzEjfocajpk=
X-Received: by 2002:a2e:8916:: with SMTP id d22mr55455697lji.19.1578160865497; 
 Sat, 04 Jan 2020 10:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
 <20191227163224.4113837-2-george.dunlap@citrix.com>
In-Reply-To: <20191227163224.4113837-2-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 4 Jan 2020 13:00:53 -0500
Message-ID: <CAEBZRSeLUsi95sGTMUxqeJ=co2q_=cJ7TmtsJA3hUJjxonG8fw@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 2/9] golang/xenlight: Do proper nil / NULL
 conversions for builtin Bitmap type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMTE6MzMgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IFNpbWlsYXIgdG8gdGhlIGF1dG9nZW5lcmF0ZWQg
dHlwZXMsIGJ1dCBmb3IgYGJ1aWx0aW5gIEJpdG1hcCB0eXBlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTogTmlj
ayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
