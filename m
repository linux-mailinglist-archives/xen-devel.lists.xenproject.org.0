Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E48AF73
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:12:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQ10-0005br-8q; Tue, 13 Aug 2019 06:10:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/QrK=WJ=gmail.com=hslester96@srs-us1.protection.inumbo.net>)
 id 1hxQ0z-0005bm-AU
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:10:37 +0000
X-Inumbo-ID: 109a206b-bd91-11e9-8980-bc764e045a96
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 109a206b-bd91-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 06:10:36 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id r12so3032141edo.5
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2019 23:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nDqwpC1PppEk839MgFZPsscd9ykxNNHqiMTtehSc/zo=;
 b=Fe5iapZq7OOYHH5az8a2OmwaeUZo7LYmEH/pXBcrEYRZLstiljVxGNHow5U4z5RIh8
 RJDBweOkt4NWgKKYdysVug58aW7GzWS4TJHTsr/o8F5Wnz4EEtHs9wv5MphGnEHY7mMR
 vKeD0pwuU6ri0O2sMuZDAtkLLv+KV0VeKRReP65rVMvLxtzrKS3TajypcHyVRsE0ysXT
 EXJ1QHOMF+XF17gAHIyHOK4Z/T4jVHQM/mWjB8BdEHca0uCS6mrYJr7CdK5rn9JAluyX
 lefiA/s1W1YxedERV4XyQv5wmtwOtKYn//hlCE6T6kd0H25v+BNJ+EOE8a5FLVP02kPx
 8VEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nDqwpC1PppEk839MgFZPsscd9ykxNNHqiMTtehSc/zo=;
 b=hY1fqCGu7fPpgaUWf24/ZLEP+27GB2CGnRGWMC4XRjgyoYgtVZSDYFjrcc2fMphsfp
 tS3rhpOO9ve6w0x0bXATTVirO62fK0k9Yli43pVgmvNArIAwiyn4K3xP8nvtJ079WToC
 yS7TwV/8VhkrPSIkuZ30ZtSVUek+p1DDboB7OfLgpKyYgac/hKNLqku+vAgxOqVDeRTl
 KgPwM9UdeSaKEZRQ4yf4Jq03qP9yBpxg/XW9C2uAzWBFY3G7DpZAWOiknsKu0wvJmZAr
 7Ug/gubos4HuEnrRvbQhC8RCN5gBs1j9YQLlwRJD2XLYiQFiTXvOtxVRh2+xdoIGu8q5
 R6QA==
X-Gm-Message-State: APjAAAU1+n9+z8PsIWMzP5BKBCczWLxdXhWq5b62+LhyDLR28jzdEnWJ
 wm03FmfqweFYnutXZ+ERmy5iLhksRl77SlEMpKM=
X-Google-Smtp-Source: APXvYqyHX5dcmE4UHIKGY5NpLFRCXSJoPQaFcBUcTG6uiWonwqF2tldHAIbIEtrKDwn1CYazb48p3zjt9Wk/kLjTztA=
X-Received: by 2002:aa7:d781:: with SMTP id s1mr40421978edq.20.1565676635498; 
 Mon, 12 Aug 2019 23:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190808131100.24751-1-hslester96@gmail.com>
 <20190808133510.tre6twn764pv3e7m@Air-de-Roger>
In-Reply-To: <20190808133510.tre6twn764pv3e7m@Air-de-Roger>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Tue, 13 Aug 2019 14:10:24 +0800
Message-ID: <CANhBUQ3rN+nLOHFGEAaQV6rB7Ob2wf9iLUiP8pjWM0NDMC4Qxg@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH 3/3] xen/blkback: Use refcount_t for refcount
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
Cc: Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgOCwgMjAxOSBhdCA5OjM1IFBNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDA4LCAyMDE5IGF0IDA5OjExOjAw
UE0gKzA4MDAsIENodWhvbmcgWXVhbiB3cm90ZToKPiA+IFJlZmVyZW5jZSBjb3VudGVycyBhcmUg
cHJlZmVycmVkIHRvIHVzZSByZWZjb3VudF90IGluc3RlYWQgb2YKPiA+IGF0b21pY190Lgo+ID4g
VGhpcyBpcyBiZWNhdXNlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiByZWZjb3VudF90IGNhbiBwcmV2
ZW50Cj4gPiBvdmVyZmxvd3MgYW5kIGRldGVjdCBwb3NzaWJsZSB1c2UtYWZ0ZXItZnJlZS4KPiA+
IFNvIGNvbnZlcnQgYXRvbWljX3QgcmVmIGNvdW50ZXJzIHRvIHJlZmNvdW50X3QuCj4KPiBUaGFu
a3MhCj4KPiBJIHRoaW5rIHRoZXJlIGFyZSBtb3JlIHJlZmVyZW5jZSBjb3VudGVycyBpbiBibGti
YWNrIHRoYW4KPiB0aGUgb25lIHlvdSBmaXhlZC4gVGhlcmUncyBhbHNvIGFuIGluZmxpZ2h0IGZp
ZWxkIGluIHhlbl9ibGtpZl9yaW5nLAo+IGFuZCBhIHBlbmRjbnQgaW4gcGVuZGluZ19yZXEgd2hp
Y2ggbG9vayBsaWtlIHBvc3NpYmxlIGNhbmRpZGF0ZXMgdG8KPiBzd2l0Y2ggdG8gdXNlIHJlZmNv
dW50X3QsIGhhdmUgeW91IGxvb2tlZCBpbnRvIHN3aXRjaGluZyB0aG9zZSB0d28KPiBhbHNvPwo+
CgpJdCBzZWVtcyB0aGF0IHhlbl9ibGtpZl9yaW5nOjppbmZsaWdodCBpcyAwLWJhc2VkIGFuZCBj
YW5ub3QgYmUgZGlyZWN0bHkKY29udmVydGVkIHRvIHJlZmNvdW50X3QuClRoaXMgaXMgYmVjYXVz
ZSB0aGUgaW1wbGVtZW50YXRpb24gb2YgcmVmY291bnRfdCB3aWxsIHdhcm4gb24gaW5jcmVhc2lu
ZwphIDAgcmVmIGNvdW50LgpUaGVyZWZvcmUgSSBvbmx5IGNvbnZlcnQgcGVuZGluZ19yZXE6OnBl
bmRjbnQgaW4gdjIuCgo+IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
