Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB04100F40
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 00:07:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWq4d-0004Ty-EI; Mon, 18 Nov 2019 23:04:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMPH=ZK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iWq4b-0004Tr-M9
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 23:04:45 +0000
X-Inumbo-ID: cf487e8a-0a57-11ea-a2e3-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf487e8a-0a57-11ea-a2e3-12813bfff9fa;
 Mon, 18 Nov 2019 23:04:44 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q70so1092259wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 15:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S+qWjmq5Xsy4cFy6DZIs+rZ/lO6TDlUoSeGbUWXfuV8=;
 b=T7XEahrivNDTzEKegtg37JZiIi3PsImWsqoXc7cuJb5Y8mK2D1R0F1ClWXeKqxDT6x
 EPF3RguDEuSyhw2WUZIos1HsG4lpY4pPh/87vHXW9z32ne61Lt67WYLUTIrbyEv1Wi63
 32CMqXgSzbKHXVSCWb5kRMw9Id+J6QpESf4jiFXsz+6YCbRnBkrxxhOrDDa3plWYZWVP
 cOWqgdOsW+Uj+bva99mk0MovDeXGrOP+DpxmjeKi7P2Y6Fn8g5NNkYZLL2d188oHqdL0
 M9o00b/dwPbvUeyvsQOhq9QMPNcyW54fQ/BSFheC1BJLvOat2jl18PasDufQFufvx47N
 lBQg==
X-Gm-Message-State: APjAAAXs+T+tRHM5WetvxfMC3n/NibQK62LZ+rMUO+fkE3UnhKHLjVF2
 fq7XLGqOwpUKXSLXIKwdX0s=
X-Google-Smtp-Source: APXvYqz7UiKgXLp2TIVGYYySJ0YE7fm5+sTkhaP6F5qNC9WThTjECjXNs/f0w55RGAQfBfachwowog==
X-Received: by 2002:a05:600c:20c9:: with SMTP id
 y9mr1917561wmm.72.1574118283608; 
 Mon, 18 Nov 2019 15:04:43 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id u26sm971757wmj.9.2019.11.18.15.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 15:04:43 -0800 (PST)
Date: Mon, 18 Nov 2019 23:04:41 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191118230441.weody5bylogbpyxz@debian>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
 <20191118171309.1459302-8-anthony.perard@citrix.com>
 <24018.54588.480226.416701@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24018.54588.480226.416701@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 7/7] libxl_qmp: Have a lock
 for QMP socket access
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDU6MzA6MzZQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MyA3Lzdd
IGxpYnhsX3FtcDogSGF2ZSBhIGxvY2sgZm9yIFFNUCBzb2NrZXQgYWNjZXNzIik6Cj4gPiBUaGlz
IHBhdGNoIHdvcmthcm91bmQgdGhlIGZhY3QgdGhhdCBpdCdzIG5vdCBwb3NzaWJsZSB0byBjb25u
ZWN0Cj4gPiBtdWx0aXBsZSB0aW1lIHRvIGEgc2luZ2xlIFFNUCBzb2NrZXQuIFFFTVUgbGlzdGVu
IG9uIHRoZSBzb2NrZXQgd2l0aAo+ID4gYSBiYWNrbG9nIHZhbHVlIG9mIDEsIHdoaWNoIG1lYW4g
dGhhdCBvbiBMaW51eCB3aGVuIGNvbmN1cnJlbnQgdGhyZWFkCj4gPiBjYWxsIGNvbm5lY3QoKSBv
biB0aGUgc29ja2V0LCB0aGV5IGdldCBFQUdBSU4uCj4gLi4uCj4gPiArICAgIGlmIChldi0+c3Rh
dGUgPT0gcW1wX3N0YXRlX3dhaXRpbmdfbG9jaykKPiA+ICsgICAgICAgIC8qIFdlIGNhbid0IG1v
ZGlmaWUgdGhlIGVmZCB5ZXQsIGFzIGl0IGlzbid0IHJlZ2lzdGVyZWQuICovCj4gICAgICAgICAg
ICAgICAgICAgICAgICBeCj4gICAgICAgICAgICAgICAgICAgICAgICBtb2RpZnkKPiAKCkZpeGVk
IHVwIHRoaXMgdHlwbyBhbmQgd2hvbGUgc2VyaWVzIHB1c2hlZC4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
