Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1A07E0A9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 18:59:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htENU-00007z-3a; Thu, 01 Aug 2019 16:56:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htENS-00007r-GD
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 16:56:30 +0000
X-Inumbo-ID: 4e2fddf8-b47d-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4e2fddf8-b47d-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 16:56:28 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m24so145910899ioo.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6PwEch/59rauOMkuY+6PiXLbWYp1lrl/KmTdglOj514=;
 b=NnB1bIedDre6vSavsM8XY0otmTbtSZWD8ThXxiojnYKSw/1yBvS4mJHb+Q8v/7kQTP
 XvOV2BlI/uM4oI+OV5qysZZQ+tZICsdhVqYQzYpG5vbNi7qtFj2Jko295M3RGvDGwH+T
 n3+2jghpLC2KP1qH4N2HSZsdzaz2l4wmq2hPGfWDUPzuncY0lC2tYKWFRMr6g39AZ7Gs
 I1OA0wt7gNwic1RHptXd0qdZRjXIOaAVKSzs/7md5mtXJ235jy9UcjM128vfc0iANwMy
 PdFnJbMZNVwPEJ+BfnudWC9t/o3gwwunB29IMIw/SN0I8pEpv7oQ0l/jG+PXV96uDGVl
 /lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6PwEch/59rauOMkuY+6PiXLbWYp1lrl/KmTdglOj514=;
 b=N6M88TAzd3HTSp47B52ZhtIWhcKyCPVmSZNtxKDGRB4k+O4mUuZ5FczqVQa3vkovy4
 AOOk7wRD2rLTf0IdDgRzHphGL6cZBU1+04G0IqppqcJydyAsBWsqVfxXduAAH+wH8W6b
 4k3zkZ8ElgtwV6StVi5Bpes+GfLlvZwDPDNAMZ34wwWbAOGhYGYJagN/YcLICIF/x62H
 ebw3B73iRHLhjey/YnyMwnYEzOHDsfiLjbVpOvALgWfLq56YDlY5lAHBxhUROxDbSfVD
 flVFp+hmCBWTO5DxHMcbMjTdtqIvtRxGU0+stOjzOwoBKX4ImWbKIAtmyW+TFkoB/+vb
 ZxZw==
X-Gm-Message-State: APjAAAWZF9hRb0vHa69fAQ9bwFjPenUftvGTOg57sxlRnyM3N1yPx7I3
 LTR6qgSvrQBSeHvMCuHPXPICTJZ/AlY+6pM9X6s=
X-Google-Smtp-Source: APXvYqybt2Z0nzSB7sV81wEjNjFi9QCWsjI68qWnK+snkEK5qYy5yLXksJ/bZZETwUAsbNsfxhQlYGgrU4oEOvIRszk=
X-Received: by 2002:a02:16c5:: with SMTP id
 a188mr136594300jaa.86.1564678588360; 
 Thu, 01 Aug 2019 09:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com> <87y30dget5.fsf@epam.com>
 <e022de0d-2515-007f-0a66-2f7a94c68777@arm.com> <87wofxgct5.fsf@epam.com>
In-Reply-To: <87wofxgct5.fsf@epam.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 19:56:17 +0300
Message-ID: <CAOcoXZYU+CF2T=QEo8UL73sDvELW9LVckueqNvQXrNogNHo9RA@mail.gmail.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA1OjUwIFBNIFZvbG9keW15ciBCYWJjaHVrCjxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cgo+ID4+IEluIHRoaXMgY2FzZSB3ZSBhbHNvIGNh
biBkZWNsYXJlIGFuZCB1c2UgaW50cnNbXSBpbiB0aGUgc2FtZSB3YXkuCj4gPgo+ID4gVGhlcmUg
aXMgbm8gZ3VhcmFudGVlIHRoZSBpbmRleCBpbiBpcnEgd2lsbCBtYXRjaCBpbnRyc1suLi5dLiBT
byB5b3UKPiA+IG5lZWQgdG8ga2VlcCB0aGVtIGhhcmRjb2RlZCBpbiB0aGUgbGF0dGVyIGNhc2Uu
Cj4gT2gsIHJpZ2h0LgoKSSBkb24ndCBsaWtlIHRoZSBpZGVhIG9mIHVzaW5nIGhhcmRjb2RlZCBu
dW1iZXJzIGluIHRoZSBjb2RlLiBCVFcsCk1pc3JhIHJ1bGUgc2F5cyBpdCBzaG91bGQgbm90IGJl
IHVzZWQgYXMgd2VsbC4gSG93ZXZlciwgaW4gdGhpcyBjYXNlLApJIGRpZCBub3QgY2hhbmdlIGl0
LCBiZWNhdXNlIGl0IHNob3VsZCBiZSBkb25lIGluIGFub3RoZXIgcGF0Y2guCkFueXdheSwgaGFy
ZGNvZGVkIG51bWJlcnMgc2hvdWxkIGJlIGF2b2lkZWQgaW4gdGhlIGNvZGUsIGl0IHNlZW1zIHRo
aXMKaXMgYSBnb29kIGNhbmRpZGF0ZSBmb3IgYSBuZXcgWGVuIGNvZGluZyBzdHlsZSBydWxlIGlm
IHdlIHdhbnQgdG8KYWNoaWV2ZSBNaXNyYSBjb21wbGlhbmNlIHNvbWVkYXkuCgpUaGFua3MKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
