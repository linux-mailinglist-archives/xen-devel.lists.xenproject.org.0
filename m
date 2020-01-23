Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20CE146191
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 06:34:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuV5h-0002UE-F1; Thu, 23 Jan 2020 05:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=264E=3M=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iuV5f-0002U9-WF
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 05:31:40 +0000
X-Inumbo-ID: a158fbb2-3da1-11ea-b833-bc764e2007e4
Received: from mail-yw1-xc41.google.com (unknown [2607:f8b0:4864:20::c41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a158fbb2-3da1-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 05:31:39 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id h126so1053522ywc.6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 21:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S3EfJSPLLOqzmBmq9LSqMW+59aqrMGbSHlHVnSLqKUI=;
 b=luvb1denA5fdjLYhme8N/tbC1Ft/tfu2J4ySs7R2iuqJSbc51H8MBvqTArAPnHLMdQ
 zAjPKakAHPWhZX8bVQxGx2Rp20GJlApEEhnzuptgZfjVFqCZA6/PbsXlGRCXY7kgeUN+
 7AL6enssDkUuWEv1NJxDUdEhYouyNhooDnnNmJX1hu60gtB59WcqGnr6nIimK+Lq9Pfd
 aEyPC+JlRepTlYOxD/uBgUnFanlkHzynWHnVFYIu3QoTnnDnZvrapijqgaUdBzxukTCq
 6qL+pyDMCFVA6RQlcPF2dIpAxPNIzuQQK5Uq+AiL3EVNzhAluQkcYnt4q0SsrKmpQOKZ
 E+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S3EfJSPLLOqzmBmq9LSqMW+59aqrMGbSHlHVnSLqKUI=;
 b=ZB6D26xQc8WffYVejr7W+iE5MsAtg6vSLyrWGaAREgSbkZPErX7PKP6Q7ck28MX3hC
 NfLZf/W4DwjrqVSF1ARrJ8j3HT0XVSIIGm7T7vGCWSo6o0VWeKVq+5Z4/IoLcTy+oh9T
 ZDT7aH0XdI/4HwO0/Codmsv55gAOyXZ6Vx1Qn4MP74/mXUQqnW2Oh1TuvR2ZVxbxotvH
 OshuouHbDd+yei8weQfJCbtMwIezrBGQC8unMAuh7OzBUtu0ej/ae85O4l2hK0vK4pOy
 rCA/xM6LEySCPz3OtGwvFtI1WlwxREHMuGzxwbkwRdqQBQdNKTSeI1pUlzSYu7PaUkq2
 RTng==
X-Gm-Message-State: APjAAAU2W1K9fz85uB2a8BYNbd4l+ATV+SmZrzuIQjQd+jFmWmNF+FYD
 eCK3l54PczcVge5gJr26p5g=
X-Google-Smtp-Source: APXvYqwSf/D0SaCarZqoXPXJTGiiaxcIchOrizEKLmKhFK1BKmi84of7IrS/mcvnEHNrBno47ggwlg==
X-Received: by 2002:a0d:cc88:: with SMTP id
 o130mr10503803ywd.498.1579757499070; 
 Wed, 22 Jan 2020 21:31:39 -0800 (PST)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id w74sm401691ywa.71.2020.01.22.21.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 21:31:38 -0800 (PST)
Date: Wed, 22 Jan 2020 23:31:36 -0600
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Message-ID: <20200123053136.GC6612@bobbye-pc>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
 <f8ca4739-83c7-5829-4663-b1e5796e6490@citrix.com>
 <052081D4-2F9F-401A-A6F6-8A9CDC1069AC@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <052081D4-2F9F-401A-A6F6-8A9CDC1069AC@xenproject.org>
Subject: Re: [Xen-devel] [RFC XEN PATCH 00/23] xen: beginning support for
 RISC-V
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDQ6Mjc6MzlQTSArMDAwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiAKPiBZb3Ugc2hvdWxkIGFsc28gbGV2ZXJhZ2UgdGhlIGRldmVsb3BlciBzdW1taXQ6IHNl
ZSBodHRwczovL2V2ZW50cy5saW51eGZvdW5kYXRpb24ub3JnL3hlbi1zdW1taXQvcHJvZ3JhbS9j
ZnAvIDxodHRwczovL2V2ZW50cy5saW51eGZvdW5kYXRpb24ub3JnL3hlbi1zdW1taXQvcHJvZ3Jh
bS9jZnAvPgo+IENmUCBjbG9zZXMgTWFyY2ggNnRoLiBEZXNpZ24gc2Vzc2lvbnMgY2FuIGJlIHN1
Ym1pdHRlZCBhZnRlcndhcmRzCj4gCj4gQ29tbXVuaXR5IGNhbGxzIG1heSBhbHNvIGJlIGEgZ29v
ZCBvcHRpb24gdG8gZGVhbCB3aXRoIHNwZWNpZmljIGlzc3VlcyAvIHF1ZXN0aW9ucywgZS5nLiBh
cm91bmQgY29tcGlsZSBzdXBwb3J0IGluIHRoZSBDSSwgZXRjLgo+IAo+IExhcnMKPgoKVGhhdCdz
IGEgcmVhbGx5IGdvb2QgaWRlYS4gIEknbGwgc3VibWl0IGFzIEkgZG8gdGhpbmsgSSBjYW4gZ2V0
IHRoZXJlIGlmIGFjY2VwdGVkLiAgVGhhbmtzIGZvciB0aGUgdGlwIG9uCmNvbW11bml0eSBjYWxs
cywgSSBkaWQgbm90IHJlYWxpemUgWGVuIGRpZCB0aG9zZSEKCi1Cb2JieQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
