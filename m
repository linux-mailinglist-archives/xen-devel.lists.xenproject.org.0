Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39AE6B0BF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 23:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnUdg-0006NO-Hr; Tue, 16 Jul 2019 21:05:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnUde-0006NJ-Gg
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 21:05:30 +0000
X-Inumbo-ID: 70628db8-a80d-11e9-92fc-1b662f9140c8
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70628db8-a80d-11e9-92fc-1b662f9140c8;
 Tue, 16 Jul 2019 21:05:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563311128; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=eJS3M0Iuq2hqyjfY2AAP3WJ3WzuEsvh3RGi7ISPnE7Y=;
 b=cu7wtumRReVp66C4+FWH9hndDg2k0lfP/madeBhILoyCOyEK16ifyTjxiDoK+wos7HeUc/bl
 ZZkpa2ccUzHhFflQ2+9L/9Ey9CS41MkwcE91VvkztmYN7PRtYjezoMxxcfx02KQz/uHuCQRa
 /mi77iMHCY6MFIRZCTtfTC+yoro=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mxa.mailgun.org with ESMTP id 5d2e3c17.7efb49d36270-smtp-out-n01;
 Tue, 16 Jul 2019 21:05:27 -0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id y4so22445656wrm.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 14:05:27 -0700 (PDT)
X-Gm-Message-State: APjAAAUfblb2DoYkOaKv9xITQmccxoEOIe5foGW5eClSA650yp3nRz8P
 DeYC4T9MEI+tH8Hy9Vm5NfmjIzBpGQ54Ki3cffU=
X-Google-Smtp-Source: APXvYqz8WwwsGrsX/4ZM92YJsCGkaY/TlIjonN6998mwKkR7lGQLjSoq6aW5Sch1WMPxsDcME7bYMRSda4KA+bNId5o=
X-Received: by 2002:a5d:4212:: with SMTP id n18mr36846780wrq.261.1563311126681; 
 Tue, 16 Jul 2019 14:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <46863526d6b28433a75914399d52954c4ca19950.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <46863526d6b28433a75914399d52954c4ca19950.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 15:04:50 -0600
X-Gmail-Original-Message-ID: <CABfawhkko9CeJyk_Y8qNe1PJr2tT3Mvb7UnFsm8GCPp6NZbukw@mail.gmail.com>
Message-ID: <CABfawhkko9CeJyk_Y8qNe1PJr2tT3Mvb7UnFsm8GCPp6NZbukw@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 04/10] vm_event: Simplify vm_event
 interface
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
Cc: Razvan Cojocaru <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MDYgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBSZW1vdmUgdGhlIGRvbWFpbiByZWZlcmVu
Y2UgZnJvbSBjYWxscyB0byB2bV9ldmVudCBpbnRlcmZhY2UgZnVuY3Rpb24KPiBhbmQgdXNlIHRo
ZSBiYWNrcG9pbnRlciBmcm9tIHZtX2V2ZW50X2RvbWFpbi4KPgo+IEFmZmVjdGVkIGZ1bmN0aW9u
czoKPiAtIF9fdm1fZXZlbnRfY2xhaW1fc2xvdCAvIHZtX2V2ZW50X2NsYWltX3Nsb3QgLyB2bV9l
dmVudF9jbGFpbV9zbG90X25vc2xlZXAKPiAtIHZtX2V2ZW50X2NhbmNlbF9zbG90Cj4gLSB2bV9l
dmVudF9wdXRfcmVxdWVzdAo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGly
Y2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KCkFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
