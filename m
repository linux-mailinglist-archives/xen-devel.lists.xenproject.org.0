Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3796D5D32
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 10:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJvGY-000059-Fv; Mon, 14 Oct 2019 07:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=flUq=YH=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iJvGW-000052-Ig
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 07:59:40 +0000
X-Inumbo-ID: 9239c690-ee58-11e9-bbab-bc764e2007e4
Received: from mail-pg1-x541.google.com (unknown [2607:f8b0:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9239c690-ee58-11e9-bbab-bc764e2007e4;
 Mon, 14 Oct 2019 07:59:39 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id r1so8427253pgj.12
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2019 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=btASrOz1J5KkVgWI6xoF+Hve/vj7fp/tCEMdJAUqKLU=;
 b=FnUz3cG/2VnQrP2ZBWMF8qO2Eo0opci1qc+2lqL4NFmh8EHBgN/+jeqwyAJQuu7WFr
 M8k958j07W3zZdG53hrnZiVuIcTJu8aYx34d/sCbHi6xN5RpgcGt2ngEcXCBK6RMFBM7
 LgtwE9pnIacvDqpFkbSCdRUODyBsT2pwuPm4F6LE7hj91TLZzKCPwQa395NEvcL0R+IQ
 QeKSciLF5qBBy6tC+S/iLQGMfB7xL5PJ6xRidWq3V7cN4fbXNTSXKg++WQFEGJBov1Or
 ANRWXAbpxjf3fP32ea6W2QT3XF2qKLhm7EziluMsEO5D3Et/V1hkQB1vfEZhjcZ0KYDC
 zMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=btASrOz1J5KkVgWI6xoF+Hve/vj7fp/tCEMdJAUqKLU=;
 b=iBZakPU9eNACJqj2Pa9R+++V5IzxcJUdchiDTSe8eGxmmm4dql0f+Kxy0y86sndQS6
 ugs0i1X88xm1HdlHhxie4xVBZ3Gqf44D/pQGK3t+D+H0S/fDLcgjBlBKj5lbRhLBXMUK
 XFod3S/6og8wpQ00dgLDsrAu+Qtd5sWt7D5OKuGTNslhtS+c2yw5wYJcGY9dubASecEb
 gCIJuvc0mbuOvsEohaPGXSoi8FIpwgYJnhohW62+fBbjx/tl0TqRB5f1k1f/CDBuZcUm
 EYf0oIYoCvY7TQmWvdQebQXf6e7+zmHrhXUOefebHMX/u2LIj2K7nxKmWmKdNvibC/sX
 tOAA==
X-Gm-Message-State: APjAAAWzovGa7rPryoyZBAKRxieuQNtdhVPjBdlo9CVJLJEZQjsI0Cs7
 xSJ+FO+rGYbRJwMECtmYK5uIdVCetD4x2XdYSaE=
X-Google-Smtp-Source: APXvYqwmJskvPmFIjx7lMVSjx5AmKRYoB1dFvYVBEnlAGhDxSaK6os0+LGq5kg0+u99R12yK7H2GrKBRP96VeM6C5ZE=
X-Received: by 2002:a63:1f25:: with SMTP id f37mr31439024pgf.50.1571039978463; 
 Mon, 14 Oct 2019 00:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
In-Reply-To: <23968.44828.940652.851219@mariner.uk.xensource.com>
From: Paul Durrant <pdurrant@gmail.com>
Date: Mon, 14 Oct 2019 08:59:26 +0100
Message-ID: <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxMSBPY3QgMjAxOSBhdCAxNzozNCwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNp
dHJpeC5jb20+IHdyb3RlOgo+Cj4gSsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZl
bF0gW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA5LzldIGxpYnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhy
b3VnaCBzZXR0aW5nIGxvZ2ljIik6Cj4gPiBPbiAxMS4xMC4xOSAxNTozMSwgSWFuIEphY2tzb24g
d3JvdGU6Cj4gPiA+IEkgZG8gbm90IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBhYm91dCB0aGlzLiAg
SSB3b3VsZCBiZSBoYXBweSB3aXRoCj4gPiA+ICJhdXRvIiAob3IgImRlZmF1bHQiIG1heWJlKS4K
PiA+Cj4gPiAidW5zcGVjaWZpZWQiPwo+Cj4gVGhhdCBpcyBJTU8gdGhlIGJlc3Qgc3VnZ2VzdGlv
biBzbyBmYXIgc28gSSB3aWxsIGdvIHdpdGggdGhhdCBpbiBteQo+IHYzLgoKU2VlbXMgb2RkIHRv
IHNwZWNpZnkgYSBwYXJhbWV0ZXIgd2l0aCBhIHZhbHVlIG9mICd1bnNwZWNpZmllZCcgOy0pCgog
IFBhdWwKCj4KPiBJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
