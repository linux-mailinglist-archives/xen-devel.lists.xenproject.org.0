Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFED3F7C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 14:27:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iItxr-0003yX-Of; Fri, 11 Oct 2019 12:24:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bhp3=YE=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1iItxq-0003yS-OP
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 12:24:10 +0000
X-Inumbo-ID: 06937b3c-ec22-11e9-8aca-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06937b3c-ec22-11e9-8aca-bc764e2007e4;
 Fri, 11 Oct 2019 12:24:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id r9so8486387edl.10
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2019 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=siBjVc4QaVpsVwnC47sg9qqLyumUDnmOxIEB9GMXvXE=;
 b=ICCF7CEOPXPy+98vX1XbXza+ddaoXSlBvC7o9NJiD8gsqHSa/27aj88StGuECJZHko
 wbRzNzUl3PefrztpowSfhRknGcpkFcv3H5OLrXsNo60yrvfv2SaQLx6sRLL9TlMV1z51
 sE5Rznn+o1pKlT+2I8n93+4pwk1yyYd/vNY+GwtUJAVemyozTsSwQEYOxGPr7MrGhRxG
 purUMeL2b+OnNtcAYFG+q8MV52UnaQnXkrpWZtGS49zpA1ZVIcPu9/tjAqVx6RZwRRKg
 2kYhtorqNp6pd8Bpw8l8wxYRNEPcQOH6TSsBL2+CFho+TUs0ciw+RdAxJD/4cwcMECKL
 m5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=siBjVc4QaVpsVwnC47sg9qqLyumUDnmOxIEB9GMXvXE=;
 b=TcrrVuhZWA0KFiCoJUv2M6tzvVX1uENH1hS0odVQTdXG132tTX6QbT2ZQqC5+6K8dr
 TM0bo8rPY/KKkCQKBEnyReb6mPRbKaciq2g/ktFsDzKXK/ZmfADy+8DbPGbEL4Rg8y6d
 wzCerOZvLHKyV3eXt0Rr7/Y0QtIDl7qJCV70hEs2I7myM+1nJ89JPApcUVOG7NuPpZZU
 5rZDLhiTcROlz8Q6C/Hwpo1WCdwIZgXgw9G5JGOZWZWd8A96nKVBo5Y8W712vLx/Nv1Y
 iK7+c4It3vS61EhK4vJW1G1L/3Aa3tJIpYfweBI4LUAxU0xjiiSje/2s9xATSdveKCfk
 PJwg==
X-Gm-Message-State: APjAAAVEbrqg5+RCKKyEBKJMVLG3lO/S6mIXDmfnb7yFMck7DJUVMEnd
 dHSg4+MG9IJtk87FJOzlcVj/l6Gg7QQSISvQopo=
X-Google-Smtp-Source: APXvYqwnCfAcsCFlT/hVbuXAl8DGmZ8gz7bUG6mL9Ytg2KJCOFkSwnzlnd3Xj71hqoxz+mF4fqpXgNpM5a97w/ifpjs=
X-Received: by 2002:a17:906:154a:: with SMTP id
 c10mr13066203ejd.238.1570796649169; 
 Fri, 11 Oct 2019 05:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
In-Reply-To: <20191010151111.22125-10-ian.jackson@eu.citrix.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Fri, 11 Oct 2019 13:23:58 +0100
Message-ID: <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNDoxMiBQTSBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBMSUJYTF9QQVNTVEhST1VHSF9VTktOT1dOIChha2Eg
IkVOQUJMRUQiIGluIGFuIGVhcmxpZXIgdW5jb21taXR0ZWQKPiB2ZXJzaW9uIG9mIHRoaXMgY29k
ZSkgaXMgZG9pbmcgZG91YmxlIGR1dHkuICBXZSBhY3R1YWxseSBuZWVkIGFsbCBvZgo+IHRoZSBm
b2xsb3dpbmcgdG8gYmUgc3BlY2lmaWNhYmxlOgo+ICAgKiBkZWZhdWx0ICgidW5rbm93biIpOiBl
bmFibGUgUFQgaWZmIHdlIGhhdmUgZGV2aWNlcyB0bwo+ICAgICBwYXNzIHRocm91Z2ggc3BlY2lm
aWVkIGluIHRoZSBpbml0aWFsIGNvbmZpZyBmaWxlLgoKSSByZWFsaXplIHRoaXMgbWF5IGJlIGEg
Yml0IGxhdGUsIGJ1dCBJIGZpbmQgInVua25vd24iIHRvIGJlIGEgdmVyeQpzdHJhbmdlIHdvcmQg
dG8gdXNlIHRvIGluZGljYXRlLCAicGxlYXNlIGNob29zZSB0aGUgYmVzdCBvcHRpb24gZm9yCm1l
Ii4gIEZvciBVU0IgZGV2aWNlIHR5cGUgSSB1c2VkICJhdXRvIiwgbWVhbmluZywgImF1dG9tYXRp
Y2FsbHkKY2hvb3NlIHRoZSBiZXN0IG9wdGlvbiBmb3IgbWUiLiAgUGF1bCBkaWRuJ3QgbGlrZSAi
YXV0byIsIHdoaWNoIGlzCmZhaXIgZW5vdWdoLCBidXQgSSByZWFsbHkgZG9uJ3Qgc2VlIGhvdyAi
dW5rbm93biIgaXMgYmV0dGVyLgoKQW55d2F5LCBub3QgbWVhbmluZyB0byBibG9jaywganVzdCBh
IHN1Z2dlc3Rpb24uCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
