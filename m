Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05127108A3
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 16:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLpl2-0000FT-B9; Wed, 01 May 2019 13:58:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLpl1-0000FO-Id
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 13:58:47 +0000
X-Inumbo-ID: 3c0f8550-6c19-11e9-b5b8-3309ebae8599
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c0f8550-6c19-11e9-b5b8-3309ebae8599;
 Wed, 01 May 2019 13:58:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556719125; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=WMEPIFAOb40jKincrn4kWT0Xido/8iRAIIVylC7VLHk=;
 b=JxbgbUqXvBFTXKWUTu/EzprS+HNxGdOmWE0329wbxlF8SxltUMePVqjTAu3l2LYlobgoi/2P
 B1IAfN5J0vuR1neIie8oWCGaXOCTVm2DmuSU0EvPCkkViHiMMONePsqNNmSrvEKuor6/7COD
 C75EWCXCHRk9+IE/isCvadxkvLI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5cc9a613.7ff75054f470-smtp-out-n01;
 Wed, 01 May 2019 13:58:43 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b188so1393953wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 06:58:43 -0700 (PDT)
X-Gm-Message-State: APjAAAV/La0x4vg4qIkTFiXvYO6VuAW5BjVbFbbuVX86bemx51zwYEGO
 UJpgwo+WTj1JKqAmDKoDNxTNO6InQZirx2jEu6M=
X-Google-Smtp-Source: APXvYqwbL38IWoU0iDlaOOSwiuIh2QWCvujeYrK2n6LwMPms4ikHpwrwFDa0etnRU+5Sr5oFjrKPeeH+YczQRb1gHCM=
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr7012822wma.53.1556719121906; 
 Wed, 01 May 2019 06:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
In-Reply-To: <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 1 May 2019 07:58:05 -0600
X-Gmail-Original-Message-ID: <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
Message-ID: <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow
 value
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEl0IG1pZ2h0IGJlIHdvcnRoIGludHJvZHVjaW5nIGEgInN5bmMgc3RhdGUgZnJvbSBodyIg
aG9vayB3aGljaCBjb2xsZWN0cwo+ID4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRv
IHRoZSBpbnRyb3NwZWN0aW9uIGFnZW50Lgo+Cj4gWW91IG1lYW4gYWRkaW5nIGFub3RoZXIgaHZt
IGhvb2s/CgpBY3R1YWxseSwgaW5zdGVhZCBvZiBhbm90aGVyIGhvb2sgSSB0aGluayB3aGF0IHdv
dWxkIG1ha2Ugc2Vuc2UgaXQgdG8KanVzdCB1cGRhdGUgdm14X3NhdmVfdm1jc19jdHh0IHRvIGF1
dG9tYXRpY2FsbHkgcmVmcmVzaCB0aGUgY2FjaGVkCnJlZ2lzdGVyIHZhbHVlcyB3aGVuIGl0J3Mg
Y2FsbGVkIHdpdGggInYgPT0gY3VycmVudCIuIFRob3VnaHRzPwoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
