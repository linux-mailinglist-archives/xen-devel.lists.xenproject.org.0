Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11F12D1F5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:26:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxqI-0004t1-Ty; Mon, 30 Dec 2019 16:24:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4aY4=2U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ilxqH-0004sj-Hq
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:24:29 +0000
X-Inumbo-ID: d5345fa0-2b20-11ea-88e7-bc764e2007e4
Received: from mail-lj1-f181.google.com (unknown [209.85.208.181])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5345fa0-2b20-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 16:24:21 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id o13so22372677ljg.4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 08:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=mEZTPfkr5byKEZcXiaVGnmJ994zUZxUhL3zfhX1hUr4=;
 b=Ey08DENXFYMzTmptTFkS0nANBanQVHn/LD03AizosDc/4ES4RWAhshm7sfEAW5qMSn
 urwu+c0wck5whpyGsch+MQC5/O9HxiLfnH1ROC6G8HDuGarwX2MXF8gGlYUPstGwdcuP
 hF6NqDBjtUWB5qvgjciuU+rz+FMMhZYzlmk2E6miHn0clbzNVXSdDxP06lHhDYdE4RVB
 y/jxw45YOLTLXjrO6IqFcLhXOZUghq7/yimFv19qJP+nJ56ydWZS+gc5jzqHh6Q6Hl1W
 EnFqM5UlfjLvDFRof9uZ9DmvBeHS7V7zwHZC18zNpSAsQ4y/T3cJQ9CJEAxRjXBmckb0
 VMCQ==
X-Gm-Message-State: APjAAAU9CznBTewDvfpoOrVlz3F+oZCEBO2Zkmokpaisu8DDmi7pOoIu
 MeRwUnzHC27L9IdTpsy/LUMziQC7KZQ=
X-Google-Smtp-Source: APXvYqyQa6wM91y7FJvX9vqt2d1INo07jA0J3tumnNkGMw+8F9Cs8L1MEU3oHNyJ2z8p0WpLkIvtEA==
X-Received: by 2002:a2e:7005:: with SMTP id l5mr40035214ljc.230.1577723059930; 
 Mon, 30 Dec 2019 08:24:19 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id z3sm17977591ljh.83.2019.12.30.08.24.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 08:24:19 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id j26so33774448ljc.12
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 08:24:19 -0800 (PST)
X-Received: by 2002:a05:651c:1a8:: with SMTP id
 c8mr27422082ljn.207.1577723059377; 
 Mon, 30 Dec 2019 08:24:19 -0800 (PST)
MIME-Version: 1.0
From: Wei Liu <wl@xen.org>
Date: Mon, 30 Dec 2019 16:24:03 +0000
X-Gmail-Original-Message-ID: <CAK9nU=p6vCHsq2aGs4NND=qdRHekPLWoxwULP7-iY1d7JsSbWg@mail.gmail.com>
Message-ID: <CAK9nU=p6vCHsq2aGs4NND=qdRHekPLWoxwULP7-iY1d7JsSbWg@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [Xen-devel] Proxying Hyper-V hypercalls from L2 to L0
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <liuwe@microsoft.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpBcyBtdWNoIGFzIEkgdHJ5IHRvIGF2b2lkIHdyaXRpbmcgY29kZSB0byBwcm94eSBI
eXBlci1WIGh5cGVyY2FsbHMsIGl0CnNlZW1zIHVuYXZvaWRhYmxlIGZvciBQViBndWVzdHMsIGJl
Y2F1c2UgSHlwZXItViByZXF1aXJlcyBoeXBlcmNhbGxzCnRvIGJlIGlzc3VlZCB3aXRoIENQTD0w
LgoKVGhpcyBtZWFucyBmb3IgUFYgRG9tMCBJIHdpbGwgbmVlZCB0byBhZGQgY29kZSBpbiBYZW4g
dG8gc3VwcG9ydApIeXBlci1WJ3MgQUJJcywgYWxvbmcgd2l0aCBhcHByb3ByaWF0ZSB2YWxpZGF0
aW9ucy4KCkhvdyBtdWNoIGRvIHlvdSBjYXJlIGFib3V0IHJ1bm5pbmcgYSBQViBEb20wIGluIHRo
aXMgWGVuIG9uIEh5cGVyLVYKc2V0dXA/IEkgcGVyc29uYWxseSB3b3VsZCBjZXJ0YWlubHkgZ28g
ZnVsbCBvbiBQVkggaWYgcG9zc2libGUuIDotKQoKVGhhbmtzLApXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
