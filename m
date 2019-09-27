Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D966C06B9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 15:54:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqfA-00012O-6G; Fri, 27 Sep 2019 13:52:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XzqE=XW=gmail.com=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iDqf8-00012D-1V
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 13:51:58 +0000
X-Inumbo-ID: f247e018-e12d-11e9-b588-bc764e2007e4
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by localhost (Halon) with ESMTPS
 id f247e018-e12d-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 13:51:46 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i30so3574458pgl.0;
 Fri, 27 Sep 2019 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gNsmJANuFRtv9BDWu9vEshkKqHkFbJbTP2ieODkMfEw=;
 b=KfEKvwAcFwb3pLQ478P8V4M2xTuOaM7xgMqL7fp7HF8A44Tl3wKsVvVMxDGXH1huvl
 dMfIAiDm2IBb4pwdI0tFrgXMaaP2jV17nXHRQh8VjvuowW1zy2ufpwFX+LqCk7JPTrMc
 ScoMgVuTrXBPE5FQbHSz1RpXYWF+X3pHzy1hH54a5hELUfy6XdKqdmkun7jhzz/xniz5
 NGUfpqXXQPagk9V0wcuoGCHGM1+2QPYc+k/NCUEl9kpPvQ+X24F+J1lot3YgxBx5hy39
 0WR/h4QIRj8ysFtv/l22z5OUtFFlZ560iJQhRJZXUsWd8DLxzk17sgqjN/wKvAGc6AYh
 TYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gNsmJANuFRtv9BDWu9vEshkKqHkFbJbTP2ieODkMfEw=;
 b=lmBWlUhdb5/zE+4SFnky7HPboELunx0HkomVv3iRKTsr1/TvxvkgPxFVYykRA/CxRu
 Ux9hdV14/awx9xcnJdDZ7dD7vnAmEd9TFCGeasbLr1n4u6mk77i3ehy5xEzT6f/FHzwj
 vPOctbJM1JnZRw/OsvWLLxRk40q41lHvkV0V1n4lLHCltnhbE60dHt8ew85PzP9K+vu+
 7GjCXTniVOjaHDA/VRACeIqvgBehDUKAj+YC1DEYHym0D8kEyOwX0zOXRX7uhMNgkUP/
 /o/nc90RvXS6E4C6yXWYem/i/PrDDF03TRkrD0PNSZXSTJ/KgrX4UbdDDJxre+/j3NHv
 sttw==
X-Gm-Message-State: APjAAAWxY3/Pv8BxQu+pVoA+XCWEqbI4/Uwoxvv1N4QAemislvXrct26
 xhbJMS5klr9HSGZbsoiq+l4D4oxx4Qh5Bu1sZCA=
X-Google-Smtp-Source: APXvYqxWacnZagW5BSDSZH9drb9PEYT1NIkdDNxIsGJ+IwHE+BeDbroR9p71gi2nfeeQtmjZBLXqRNIb3082VBlL684=
X-Received: by 2002:a63:225f:: with SMTP id t31mr9343294pgm.50.1569592305898; 
 Fri, 27 Sep 2019 06:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACJ1ZNsXOP-NHHhVTvxnsLvMx1FdJQgEibTsH4nj01b0WrO7fA@mail.gmail.com>
 <E8A267E0-2E8F-4C2A-A280-99E8C7684721@xenproject.org>
 <DE57D4C8-B621-4BDC-B0E5-7F59E812EC66@xenproject.org>
In-Reply-To: <DE57D4C8-B621-4BDC-B0E5-7F59E812EC66@xenproject.org>
From: Paul Durrant <pdurrant@gmail.com>
Date: Fri, 27 Sep 2019 14:51:36 +0100
Message-ID: <CACCGGhAJkb+0tNg+DMnkoSzSLqO2HC_+qvdZ5O9G5QXZtvHAGw@mail.gmail.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] [win-pv-devel] [Vote] XCP-ng subproject proposal
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 win-pv-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>,
 olivier.lambert@vates.fr, xen-api@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KzEgZnJvbSBtZQoKT24gRnJpLCAyNyBTZXAgMjAxOSBhdCAxNDowMCwgTGFycyBLdXJ0aCA8bGFy
cy5rdXJ0aC54ZW5AZ21haWwuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiA5IFNlcCAyMDE5LCBhdCAx
NTo0NCwgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEB4ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6Cj4KPiBI
ZWxsbyBldmVyeW9uZSwKPgo+IE9saXZpZXIgaGFkIHBvc3RlZCBhbiBSRkMgZm9yIHRoaXMgcHJv
cG9zYWwgb24geGVuLWRldmVsQC0gc2VlIGh0dHBzOi8veGVuLm1hcmttYWlsLm9yZy90aHJlYWQv
ZXJtbnJiM3BzM29rdm5qcgo+Cj4gVGhlIHByb3Bvc2FsIGFsc28gaGFzIGJlZW4gZGlzY3Vzc2Vk
IGJ5IHRoZSBBZHZpc29yeSBCb2FyZCBhbmQgd2FzIGFwcHJvdmVkCj4KPiBIb3dldmVyLCBmb3Ig
dGhlIHByb3Bvc2FsIHRvIGZ1bGx5IHBhc3MgdGhlIHByb3Bvc2FsIG11c3QgYmUgcnVuIGJ5IHBh
c3QgYWxsIG1hdHVyZSBzdWJwcm9qZWN0LCB3aGljaCBhcmUgSHlwZXJ2aXNvcnMsIFdpbmRvd3Mg
UFYgRHJpdmVycyBhbmQgWEFQSSAoc2VlIGh0dHBzOi8veGVucHJvamVjdC5vcmcvZGV2ZWxvcGVy
cy9nb3Zlcm5hbmNlLyNwcm9qZWN0LWRlY2lzaW9ucykuIFBlb3BsZSBsaXN0ZWQgdW5kZXIgUHJv
amVjdCB0ZWFtIHZpc2libGUgb24gdGhlIHJpZ2h0IGNvbHVtbnMgb2YgZm9sbG93aW5nIHBhZ2Vz
IGNhbiB2b3RlCj4gKiBodHRwczovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvdGVhbXMveGVu
LWh5cGVydmlzb3IvIC0gYWxyZWFkeSB2b3RlZDogSmFuLCBJYW4sIFdlaSwgR2VvcmdlCj4gKiBo
dHRwczovL3hlbnByb2plY3Qub3JnL2RldmVsb3BlcnMvdGVhbXMvd2luZG93cy1wdi1kcml2ZXJz
Lwo+ICogaHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9kZXZlbG9wZXJzL3RlYW1zL3hlbi1hcGkvCj4K
PiBUaGUgUkZDIHByb3Bvc2FsIGhhcyBwYXNzZWQgdGhlIEh5cGVydmlzb3IgdGVhbSB3aXRoIDQv
OCB2b3RlcyAoc2VlIGh0dHBzOi8veGVuLm1hcmttYWlsLm9yZy90aHJlYWQvZXJtbnJiM3BzM29r
dm5qciksIGJ1dCBtb3JlIHN1cHBvcnQgd291bGQgYmUgYXBwcmVjaWF0ZWQKPgo+IFRoZSBwcm9w
b3NhbCBpcyBhdHRhY2hlZCBiZWxvdy4gUGxlYXNlIHZvdGUgYmVmb3JlIG5leHQgVHVlc2RheQo+
Cj4gQmVzdCBSZWdhcmRzCj4gTGFycwo+Cj4KPiBIaSBhbGwuCj4gc28gbm8gbW9yZSB2b3RlcyB3
aGljaCBtZWFucyB0aGUgcHJvcG9zYWwgaGFzIHBhc3NlZAo+IExhcmQKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gd2luLXB2LWRldmVsIG1haWxp
bmcgbGlzdAo+IHdpbi1wdi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby93aW4tcHYtZGV2ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
