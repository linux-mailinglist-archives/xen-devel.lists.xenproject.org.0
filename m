Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3FD11470A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 19:42:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icw2e-00086n-PZ; Thu, 05 Dec 2019 18:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RYm=Z3=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1icw2d-00086i-QR
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 18:39:55 +0000
X-Inumbo-ID: a12d4db6-178e-11ea-8237-12813bfff9fa
Received: from mail-lj1-f196.google.com (unknown [209.85.208.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a12d4db6-178e-11ea-8237-12813bfff9fa;
 Thu, 05 Dec 2019 18:39:55 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k8so4761285ljh.5
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2019 10:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KiRxIdISqVkFSTpuh3QCvlgu3L8Bc/t6PapPtsSj5h4=;
 b=O4CnhOm8qHxhCuzLl4Ge1oFHZghyBrJC2HKDh+NgEWBkI1rqwRuSJtQbRm5uhqRMBA
 9JZxm7APz3WvhyxBjP30ngUuWK6D/mVmjdKGIzh5HM5mRFfN86tbMrb9DfuBTR1NqLP5
 u0woPz+exw74heS+hHwP0olBRV6HP2DXOGDY32ebfVkxEAybjJDZUuiWL2Rc2F7NbjTR
 k2O58Vo0m0svFOgoGCrtnSpCbiU5BXcSkOxONG6BXQEGmCl3DWGTvNt3d85UWY2uZZQO
 VVcQSlw2S2LUf8itpdymjmwU91i0sK/d3C5qqwhkKUX9dNJNDddI9ip6pz2orupqsxo0
 seHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KiRxIdISqVkFSTpuh3QCvlgu3L8Bc/t6PapPtsSj5h4=;
 b=MVGIQUNDUQ2kzsNNU5KIZ1ilQXim7ULWFXxRF7gGZ2IJQCELYqJ6D65uSBlkW94kxs
 tnYqmACrOtTANWAwZjkoz1iff0q6RVpWITqp5ZXO+owxOnTzK8llrIbccoNdEiB0sHJy
 PxFV/DOFXGSeZLXmVqvBcpyt9HwOB/SXn9lLGMELuz+q9h24/18tSMNvyyoyytApndnC
 EDEwJW+tyKovxOZhkMuyFnK+kfxnTdEDxGoom8ruGJ+PiQ7EVqv9zcVpZVn3k+NQRszf
 WL4Yg/O3TTeaAV9VK4lkUmP64yRJNNPYEPW+dGTvt4YIoZnEtkVohwZhYgrKbloPW/8w
 aJnQ==
X-Gm-Message-State: APjAAAXY43lLcTA8BzD57t4MWegrdRLKpTiTnRaQKmvsej/i8i7hiT69
 brp8ASuNibez5/ZIDRuAWZdtKFApWCzr6LbItkg=
X-Google-Smtp-Source: APXvYqzH6wIkvk7elNygSc42vWYdvABS3mXnE3yJnyP8TkSoy/wejSo188swZvSH/4EioWr0oqN4YvHjtBGZrgYfUfg=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr5564021ljh.44.1575571193868; 
 Thu, 05 Dec 2019 10:39:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573840473.git.rosbrookn@ainfosec.com>
 <938dbf7c3a083ec050c16729805f4ce5f3f2891f.1573840474.git.rosbrookn@ainfosec.com>
 <cabd32fd-7c1e-ad7a-c4ce-1ae716894746@citrix.com>
 <d4061074-0825-d4ad-4ece-4da0d3c9049c@citrix.com>
 <CAEBZRScC3J6-6F79Cw3_SN=z-VguCkt3dM5YWer2pm8gfTrTww@mail.gmail.com>
 <a6f04edb-4889-0047-31b8-663394ed2196@citrix.com>
In-Reply-To: <a6f04edb-4889-0047-31b8-663394ed2196@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Dec 2019 13:39:42 -0500
Message-ID: <CAEBZRSeXWcdVEiReG1Y44jLe=krxhKMFaL4xLx+hrFCCT+LKyA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 16/22] golang/xenlight: implement keyed
 union C to Go marshaling
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
 Xen-devel <xen-devel@lists.xenproject.org>, kerriganb@ainfosec.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBJdCBhY3R1YWxseSBvY2N1cnMgdG8gbWUgdGhhdCB0aGUgIm5hbWVkIHN0cnVjdCBlbGVtZW50
cyBvZiB1bmlvbiIgd291bGQKPiBzdGlsbCB0ZWNobmljYWxseSBvcGVuIHVwIGEgd2luZG93IGZv
ciBkaXZlcmdlbmNlOiBpLmUuLCBpZiBzb21laG93IHRoZQo+IHR5cGUgb2YgdGhlIG5hbWVkIHN0
cnVjdCBkaWRuJ3QgbWF0Y2ggdXAgd2l0aCB0aGUgdW5pb24gZWxlbWVudC4KPgo+IEkuZS4sIHRo
ZSBmb2xsb3dpbmcgKnNob3VsZG4ndCogaGFwcGVuLCBidXQgdGVjaG5pY2FsbHkgaXQgKmNvdWxk
KjoKPgo+IC0tLS0KPiBzdHJ1Y3QgbGlieGxfZG9tYWluX2J1aWxkX2luZm9fdW5pb25faHZtIHsK
PiAgLi4uCj4gfQo+Cj4gc3RydWN0IGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIHsKPiAgIHVuaW9u
IHsKPiAgICAgbGlieGxfZG9tYWluX3N0cnVjdF9idWlsZF9pbmZvX2h2bTIgaHZtOwo+ICAgfSB1
Owo+IH0KPiAtLS0KPgo+IFVzaW5nIHRoZSBgdHlwZW9mYCB0cmljayBhYm92ZSBndWFyYW50ZWVz
IHRoYXQgdGhlIHR5cGVzIHRoZSBtYXJzaGFsaW5nCj4gZnVuY3Rpb25zIGFyZSB1c2luZyBhcmUg
aWRlbnRpY2FsIHRvIHRoZSB0eXBlcyBhY3R1YWxseSBzcGVjaWZpZWQgaW4gdGhlCj4gdW5pb24g
aXRzZWxmLiAgUGFydGljdWxhcmx5IGFzIHRoaXMgaXMganVzdCBnZW5lcmF0ZWQgY29kZSBub2Jv
ZHkncwo+IGdvaW5nIHRvIGxvb2sgYXQsIEknbSBpbmNsaW5lZCB0byB0aGluayB0aGUgY29zdCBp
cyBuZWFyLXplcm8uICBTaW5jZQo+IHRoZSBiZW5lZml0IGlzIG5vbi16ZXJvLCBJJ2QgYmUgaW5j
bGluZWQgdG8gc2F5IGp1c3QgZ28gd2l0aCB0aGF0IGluc3RlYWQuCj4KPiBBbmQgaXQncyBlYXNp
ZXIhCj4KPiBUaG91Z2h0cz8KCkluIHRoYXQgY2FzZSBJJ2xsIGp1c3QgdXNlIHRoZSB0eXBlb2Yg
dHJpY2sgOikKCi1OUgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
