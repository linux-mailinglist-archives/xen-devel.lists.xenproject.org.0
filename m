Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304681C0C14
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 04:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jULHp-0004sM-9A; Fri, 01 May 2020 02:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eoOh=6P=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jULHn-0004sH-0M
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 02:20:19 +0000
X-Inumbo-ID: 4c2a4be2-8b52-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c2a4be2-8b52-11ea-ae69-bc764e2007e4;
 Fri, 01 May 2020 02:20:17 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v26so7011858qto.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 19:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=HtFIjs5xEn8d8PuX7TrdCdC6yeVtAmN+ZGcg3en1R4c=;
 b=dybE9p5judQJPa50cpBMEUeZHtcuiQjp+1Ays1kHXlwKZWA3Vqxzt+sobfk7d6dqEg
 047Egilj+SNzqWR6idhjDDYeUqj+YUxulDqgH20wHEqnkUpagTuxot8l8yDMTINTZUIw
 loL8uoxoyG02xoRsRBQT83fttQwCmaiGZg/dMkEFZZqCSZLx7tEAJ3VFF54mX0k7SjZ1
 xx0GqJ22qEI8LcJa7Mj6d3muBWZcbkt0rOAi4PUYMjVbkK/hi0lHJufsr2eak2EdY/cB
 H5puEkTf/Pai1vWI8aMHwkj9JX4GFHPb9YVQvprgLTPYGF2ja/u2nk7jJC6j6ZKvwuM5
 yWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=HtFIjs5xEn8d8PuX7TrdCdC6yeVtAmN+ZGcg3en1R4c=;
 b=ZTWaKE9pmVeI30QWSJOPE2GdBD5o42r67hzXWndmSBBNvVLc5+dcU+gUM4yHkCLWPA
 tuIf5c1AmCwfMA8D98dap0iTgl7FnoNlXDY7KylA04fM9VJbYILHixly3kDjFnJs+AP2
 1X/oZC/sBdKY33w4b2tcp7HWpbxVC9j0y1HoySIB/y9HN0c91cmKQ7lb9CaG1KcrYjcq
 Fl3CRLDFXL+bp15P1qvHFvCcip97o0p2YrlLQVLMOY3xUkySbfxhzmLr7OthvCkrOWWr
 RyVRdacGm2HuoKySmEI/Wn3E581cQyir4MJ79DQ7cJbguitQ9gJ+X0sXqgOyQLok4r2v
 XA1A==
X-Gm-Message-State: AGi0PuajJOiHI7wW4vKrU5Ly8I6yqQCDI6VTuLAY4ClPN6NMD/aF+7RN
 CgP9BdNGO0SYgGmPRpqUxUbswhBrM3uBElnV1TMSiE/P+6J3Dg==
X-Google-Smtp-Source: APiQypLgx09iR3/Q/jCqjE6Kic7aDPu0y/hta7MksFA8RehoUH+t+95OV9+9S3hgYeKKKshFL2Rs9usDGAaCHQ3VcRs=
X-Received: by 2002:ac8:3fc2:: with SMTP id v2mr1627438qtk.113.1588299616235; 
 Thu, 30 Apr 2020 19:20:16 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 30 Apr 2020 19:20:05 -0700
Message-ID: <CAMmSBy_A4xJmCo-PiWukv0+vkEhXXDpYwZAKAiJ=mmpuY1CbMA@mail.gmail.com>
Subject: Troubles running Xen on Raspberry Pi 4 with 5.6.1 DomU
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="0000000000006c6fd005a48cd2eb"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, Roman Shaposhnik <roman@zededa.com>,
 jeff.kubascik@dornerworks.com, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000006c6fd005a48cd2eb
Content-Type: text/plain; charset="UTF-8"

Hi!

I'm trying to run Xen on Raspberry Pi 4 with 5.6.1 stock,
upstream kernel. The kernel itself works perfectly well
on the board. When I try booting it as Dom0 under Xen,
it goes into a stacktrace (attached).

Looking at what nice folks over at Dornerworks have previously
done to make RPi kernels boot as Dom0 I've come across these
3 patches:
    https://github.com/dornerworks/xen-rpi4-builder/tree/master/patches/linux

The first patch seems irrelevant (unless I'm missing something
really basic here). The 2nd patch applied with no issue (but
I don't think it is related) but the 3d patch failed to apply on
account of 5.6.1 kernel no longer having:
    dev->archdata.dev_dma_ops
E.g.
    https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/mm/dma-mapping.c?h=v5.6.1#n55

I've tried to emulate the effect of the patch by simply introducing
a static variable that would signal that we already initialized
dev->dma_ops -- but that didn't help at all.

I'm CCing Jeff Kubascik to see if the original authors of that Corey Minyard
to see if may be they have any suggestions on how this may be dealt
with.

Any advice would be greatly appreciated!

Thanks,
Roman.

--0000000000006c6fd005a48cd2eb
Content-Type: text/plain; charset="US-ASCII"; name="xen.rpi.txt"
Content-Disposition: attachment; filename="xen.rpi.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k9nkjpi90>
X-Attachment-Id: f_k9nkjpi90

Z3J1Yj4geGVuX2h5cGVydmlzb3IgKGhkMCxncHQxKS94ZW4gZG9tMF9tZW09MTAyNE0sbWF4OjEw
MjRNIGRvbTBfbWF4X3ZjcHVzPTEKZ3J1Yj4geGVuX21vZHVsZSAoaGQwLGdwdDEpL2tlcm5lbCBj
b25zb2xlPWh2YzAgZWFybHlwcmludGs9eGVuIG5vbW9kZXNldApncnViPiBkZXZpY2V0cmVlICho
ZDAsZ3B0MSkvYmNtMjcxMS1ycGktNC1iLmR0YgpncnViPiBib290ClVzaW5nIG1vZHVsZXMgcHJv
dmlkZWQgYnkgYm9vdGxvYWRlciBpbiBGRFQKWGVuIDQuMTMuMCAoYy9zIFR1ZSBEZWMgMTcgMTQ6
MTk6NDkgMjAxOSArMDAwMCBnaXQ6YTJlODRkOGU0Mi1kaXJ0eSkgRUZJIGxvYWRlcgpXYXJuaW5n
OiBDb3VsZCBub3QgcXVlcnkgdmFyaWFibGUgc3RvcmU6IDB4ODAwMDAwMDAwMDAwMDAwMwotIFVB
UlQgZW5hYmxlZCAtCi0gQm9vdCBDUFUgYm9vdGluZyAtCi0gQ3VycmVudCBFTCAwMDAwMDAwOCAt
Ci0gSW5pdGlhbGl6ZSBDUFUgLQotIFR1cm5pbmcgb24gcGFnaW5nIC0KLSBSZWFkeSAtCihYRU4p
IENoZWNraW5nIGZvciBpbml0cmQgaW4gL2Nob3NlbgooWEVOKSBSQU06IDAwMDAwMDAwMDAwMDEw
MDAgLSAwMDAwMDAwMDA3ZWYxZmZmCihYRU4pIFJBTTogMDAwMDAwMDAwN2VmMjAwMCAtIDAwMDAw
MDAwMDdmMGRmZmYKKFhFTikgUkFNOiAwMDAwMDAwMDA3ZjBlMDAwIC0gMDAwMDAwMDAyYmM0ZGZm
ZgooWEVOKSBSQU06IDAwMDAwMDAwM2NiMTAwMDAgLSAwMDAwMDAwMDNjYjEwZmZmCihYRU4pIFJB
TTogMDAwMDAwMDAzY2IxMjAwMCAtIDAwMDAwMDAwM2NiMTNmZmYKKFhFTikgUkFNOiAwMDAwMDAw
MDNjYjFiMDAwIC0gMDAwMDAwMDAzY2IxY2ZmZgooWEVOKSBSQU06IDAwMDAwMDAwNDAwMDAwMDAg
LSAwMDAwMDAwMGZiZmZmZmZmCihYRU4pCihYRU4pIE1PRFVMRVswXTogMDAwMDAwMDAyYmM1ZDAw
MCAtIDAwMDAwMDAwMmJkOTc4ZjAgWGVuCihYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDAyYmM0ZjAw
MCAtIDAwMDAwMDAwMmJjNWQwMDAgRGV2aWNlIFRyZWUKKFhFTikgTU9EVUxFWzJdOiAwMDAwMDAw
MDJiZGE1MDAwIC0gMDAwMDAwMDAyZDY4NDIwMCBLZXJuZWwKKFhFTikKKFhFTikgQ01ETElORVsw
MDAwMDAwMDJiZGE1MDAwXTpjaG9zZW4gY29uc29sZT1odmMwIGVhcmx5cHJpbnRrPXhlbiBub21v
ZGVzZXQKKFhFTikKKFhFTikgQ29tbWFuZCBsaW5lOiBkb20wX21lbT0xMDI0TSxtYXg6MTAyNE0g
ZG9tMF9tYXhfdmNwdXM9MQooWEVOKSBwYXJhbWV0ZXIgImRvbTBfbWVtIiBoYXMgaW52YWxpZCB2
YWx1ZSAiMTAyNE0sbWF4OjEwMjRNIiwgcmM9LTIyIQooWEVOKSBEb21haW4gaGVhcCBpbml0aWFs
aXNlZAooWEVOKSBCb290aW5nIHVzaW5nIERldmljZSBUcmVlCihYRU4pIFBsYXRmb3JtOiBSYXNw
YmVycnkgUGkgNAooWEVOKSBObyBkdHVhcnQgcGF0aCBjb25maWd1cmVkCihYRU4pIEJhZCBjb25z
b2xlPSBvcHRpb24gJ2R0dWFydCcKIFhlbiA0LjEzLjAKKFhFTikgWGVuIHZlcnNpb24gNC4xMy4w
IChAKSAoYWFyY2g2NC1saW51eC1nbnUtZ2NjIChVYnVudHUgOS4zLjAtMTB1YnVudHUyKSA5LjMu
MCkgZGVidWc9eSAgVGh1IEFwciAzMCAxNzowNjo0MCBQRFQgMjAyMAooWEVOKSBMYXRlc3QgQ2hh
bmdlU2V0OiBUdWUgRGVjIDE3IDE0OjE5OjQ5IDIwMTkgKzAwMDAgZ2l0OmEyZTg0ZDhlNDItZGly
dHkKKFhFTikgYnVpbGQtaWQ6IDdlZmEzYzVjYjI3YTk4ZTllYjJlNzUwZmE3MWM4YTA2NWI5YjVj
YjYKKFhFTikgUHJvY2Vzc29yOiA0MTBmZDA4MzogIkFSTSBMaW1pdGVkIiwgdmFyaWFudDogMHgw
LCBwYXJ0IDB4ZDA4LCByZXYgMHgzCihYRU4pIDY0LWJpdCBFeGVjdXRpb246CihYRU4pICAgUHJv
Y2Vzc29yIEZlYXR1cmVzOiAwMDAwMDAwMDAwMDAyMjIyIDAwMDAwMDAwMDAwMDAwMDAKKFhFTikg
ICAgIEV4Y2VwdGlvbiBMZXZlbHM6IEVMMzo2NCszMiBFTDI6NjQrMzIgRUwxOjY0KzMyIEVMMDo2
NCszMgooWEVOKSAgICAgRXh0ZW5zaW9uczogRmxvYXRpbmdQb2ludCBBZHZhbmNlZFNJTUQKKFhF
TikgICBEZWJ1ZyBGZWF0dXJlczogMDAwMDAwMDAxMDMwNTEwNiAwMDAwMDAwMDAwMDAwMDAwCihY
RU4pICAgQXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDAKKFhFTikgICBNZW1vcnkgTW9kZWwgRmVhdHVyZXM6IDAwMDAwMDAwMDAwMDExMjQgMDAwMDAw
MDAwMDAwMDAwMAooWEVOKSAgIElTQSBGZWF0dXJlczogIDAwMDAwMDAwMDAwMTAwMDAgMDAwMDAw
MDAwMDAwMDAwMAooWEVOKSAzMi1iaXQgRXhlY3V0aW9uOgooWEVOKSAgIFByb2Nlc3NvciBGZWF0
dXJlczogMDAwMDAxMzE6MDAwMTEwMTEKKFhFTikgICAgIEluc3RydWN0aW9uIFNldHM6IEFBcmNo
MzIgQTMyIFRodW1iIFRodW1iLTIgSmF6ZWxsZQooWEVOKSAgICAgRXh0ZW5zaW9uczogR2VuZXJp
Y1RpbWVyIFNlY3VyaXR5CihYRU4pICAgRGVidWcgRmVhdHVyZXM6IDAzMDEwMDY2CihYRU4pICAg
QXV4aWxpYXJ5IEZlYXR1cmVzOiAwMDAwMDAwMAooWEVOKSAgIE1lbW9yeSBNb2RlbCBGZWF0dXJl
czogMTAyMDExMDUgNDAwMDAwMDAgMDEyNjAwMDAgMDIxMDIyMTEKKFhFTikgIElTQSBGZWF0dXJl
czogMDIxMDExMTAgMTMxMTIxMTEgMjEyMzIwNDIgMDExMTIxMzEgMDAwMTExNDIgMDAwMTAwMDEK
KFhFTikgU01QOiBBbGxvd2luZyA0IENQVXMKKFhFTikgZW5hYmxlZCB3b3JrYXJvdW5kIGZvcjog
QVJNIGVycmF0dW0gMTMxOTUzNwooWEVOKSBHZW5lcmljIFRpbWVyIElSUTogcGh5cz0zMCBoeXA9
MjYgdmlydD0yNyBGcmVxOiA1NDAwMCBLSHoKKFhFTikgR0lDdjIgaW5pdGlhbGl6YXRpb246CihY
RU4pICAgICAgICAgZ2ljX2Rpc3RfYWRkcj0wMDAwMDAwMGZmODQxMDAwCihYRU4pICAgICAgICAg
Z2ljX2NwdV9hZGRyPTAwMDAwMDAwZmY4NDIwMDAKKFhFTikgICAgICAgICBnaWNfaHlwX2FkZHI9
MDAwMDAwMDBmZjg0NDAwMAooWEVOKSAgICAgICAgIGdpY192Y3B1X2FkZHI9MDAwMDAwMDBmZjg0
NjAwMAooWEVOKSAgICAgICAgIGdpY19tYWludGVuYW5jZV9pcnE9MjUKKFhFTikgR0lDdjI6IDI1
NiBsaW5lcywgNCBjcHVzLCBzZWN1cmUgKElJRCAwMjAwMTQzYikuCihYRU4pIFhTTSBGcmFtZXdv
cmsgdjEuMC4wIGluaXRpYWxpemVkCihYRU4pIEluaXRpYWxpc2luZyBYU00gU0lMTyBtb2RlCihY
RU4pIFVzaW5nIHNjaGVkdWxlcjogU01QIENyZWRpdCBTY2hlZHVsZXIgcmV2MiAoY3JlZGl0MikK
KFhFTikgSW5pdGlhbGl6aW5nIENyZWRpdDIgc2NoZWR1bGVyCihYRU4pICBsb2FkX3ByZWNpc2lv
bl9zaGlmdDogMTgKKFhFTikgIGxvYWRfd2luZG93X3NoaWZ0OiAzMAooWEVOKSAgdW5kZXJsb2Fk
X2JhbGFuY2VfdG9sZXJhbmNlOiAwCihYRU4pICBvdmVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTog
LTMKKFhFTikgIHJ1bnF1ZXVlcyBhcnJhbmdlbWVudDogc29ja2V0CihYRU4pICBjYXAgZW5mb3Jj
ZW1lbnQgZ3JhbnVsYXJpdHk6IDEwbXMKKFhFTikgbG9hZCB0cmFja2luZyB3aW5kb3cgbGVuZ3Ro
IDEwNzM3NDE4MjQgbnMKKFhFTikgQWxsb2NhdGVkIGNvbnNvbGUgcmluZyBvZiAzMiBLaUIuCihY
RU4pIENQVTA6IEd1ZXN0IGF0b21pY3Mgd2lsbCB0cnkgNiB0aW1lcyBiZWZvcmUgcGF1c2luZyB0
aGUgZG9tYWluCihYRU4pIEJyaW5naW5nIHVwIENQVTEKLSBDUFUgMDAwMDAwMDEgYm9vdGluZyAt
Ci0gQ3VycmVudCBFTCAwMDAwMDAwOCAtCi0gSW5pdGlhbGl6ZSBDUFUgLQotIFR1cm5pbmcgb24g
cGFnaW5nIC0KLSBSZWFkeSAtCihYRU4pIENQVTE6IEd1ZXN0IGF0b21pY3Mgd2lsbCB0cnkgNSB0
aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4pIENQVSAxIGJvb3RlZC4KKFhFTikg
QnJpbmdpbmcgdXAgQ1BVMgotIENQVSAwMDAwMDAwMiBib290aW5nIC0KLSBDdXJyZW50IEVMIDAw
MDAwMDA4IC0KLSBJbml0aWFsaXplIENQVSAtCi0gVHVybmluZyBvbiBwYWdpbmcgLQotIFJlYWR5
IC0KKFhFTikgQ1BVMjogR3Vlc3QgYXRvbWljcyB3aWxsIHRyeSA1IHRpbWVzIGJlZm9yZSBwYXVz
aW5nIHRoZSBkb21haW4KKFhFTikgQ1BVIDIgYm9vdGVkLgooWEVOKSBCcmluZ2luZyB1cCBDUFUz
Ci0gQ1BVIDAwMDAwMDAzIGJvb3RpbmcgLQotIEN1cnJlbnQgRUwgMDAwMDAwMDggLQotIEluaXRp
YWxpemUgQ1BVIC0KLSBUdXJuaW5nIG9uIHBhZ2luZyAtCi0gUmVhZHkgLQooWEVOKSBDUFUzOiBH
dWVzdCBhdG9taWNzIHdpbGwgdHJ5IDUgdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhlIGRvbWFpbgoo
WEVOKSBDUFUgMyBib290ZWQuCihYRU4pIEJyb3VnaHQgdXAgNCBDUFVzCihYRU4pIEkvTyB2aXJ0
dWFsaXNhdGlvbiBkaXNhYmxlZAooWEVOKSBQMk06IDQ0LWJpdCBJUEEgd2l0aCA0NC1iaXQgUEEg
YW5kIDgtYml0IFZNSUQKKFhFTikgUDJNOiA0IGxldmVscyB3aXRoIG9yZGVyLTAgcm9vdCwgVlRD
UiAweDgwMDQzNTk0CihYRU4pIEFkZGluZyBjcHUgMCB0byBydW5xdWV1ZSAwCihYRU4pICBGaXJz
dCBjcHUgb24gcnVucXVldWUsIGFjdGl2YXRpbmcKKFhFTikgQWRkaW5nIGNwdSAxIHRvIHJ1bnF1
ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSAyIHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSAz
IHRvIHJ1bnF1ZXVlIDAKKFhFTikgYWx0ZXJuYXRpdmVzOiBQYXRjaGluZyB3aXRoIGFsdCB0YWJs
ZSAwMDAwMDAwMDAwMmNjMGI4IC0+IDAwMDAwMDAwMDAyY2M3Y2MKKFhFTikgKioqIExPQURJTkcg
RE9NQUlOIDAgKioqCihYRU4pIExvYWRpbmcgZDAga2VybmVsIGZyb20gYm9vdCBtb2R1bGUgQCAw
MDAwMDAwMDJiZGE1MDAwCihYRU4pIEFsbG9jYXRpbmcgMToxIG1hcHBpbmdzIHRvdGFsbGluZyAx
MDI0TUIgZm9yIGRvbTA6CihYRU4pIEJBTktbMF0gMHgwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDgw
MDAwMDAwICgxMDI0TUIpCihYRU4pIEdyYW50IHRhYmxlIHJhbmdlOiAweDAwMDAwMDJiYzVkMDAw
LTB4MDAwMDAwMmJjOWQwMDAKKFhFTikgQWxsb2NhdGluZyBQUEkgMTYgZm9yIGV2ZW50IGNoYW5u
ZWwgaW50ZXJydXB0CihYRU4pIExvYWRpbmcgekltYWdlIGZyb20gMDAwMDAwMDAyYmRhNTAwMCB0
byAwMDAwMDAwMDQwMDgwMDAwLTAwMDAwMDAwNDE5NWYyMDAKKFhFTikgTG9hZGluZyBkMCBEVEIg
dG8gMHgwMDAwMDAwMDQ4MDAwMDAwLTB4MDAwMDAwMDA0ODAwYTQ1ZAooWEVOKSBJbml0aWFsIGxv
dyBtZW1vcnkgdmlycSB0aHJlc2hvbGQgc2V0IGF0IDB4NDAwMCBwYWdlcy4KKFhFTikgU2NydWJi
aW5nIEZyZWUgUkFNIGluIGJhY2tncm91bmQKKFhFTikgU3RkLiBMb2dsZXZlbDogQWxsCihYRU4p
IEd1ZXN0IExvZ2xldmVsOiBBbGwKKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqCihYRU4pIE5vIHN1cHBvcnQgZm9yIEFSTV9TTUNDQ19BUkNI
X1dPUktBUk9VTkRfMS4KKFhFTikgUGxlYXNlIHVwZGF0ZSB5b3VyIGZpcm13YXJlLgooWEVOKSAq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKFhFTikg
Tm8gc3VwcG9ydCBmb3IgQVJNX1NNQ0NDX0FSQ0hfV09SS0FST1VORF8xLgooWEVOKSBQbGVhc2Ug
dXBkYXRlIHlvdXIgZmlybXdhcmUuCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgooWEVOKSBObyBzdXBwb3J0IGZvciBBUk1fU01DQ0NfQVJD
SF9XT1JLQVJPVU5EXzEuCihYRU4pIFBsZWFzZSB1cGRhdGUgeW91ciBmaXJtd2FyZS4KKFhFTikg
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihYRU4p
IDMuLi4gMi4uLiAxLi4uCihYRU4pICoqKiBTZXJpYWwgaW5wdXQgdG8gRE9NMCAodHlwZSAnQ1RS
TC1hJyB0aHJlZSB0aW1lcyB0byBzd2l0Y2ggaW5wdXQpCihYRU4pIEZyZWVkIDMzNmtCIGluaXQg
bWVtb3J5LgooWEVOKSBkMHYwOiB2R0lDRDogdW5oYW5kbGVkIHdvcmQgd3JpdGUgMHgwMDAwMDBm
ZmZmZmZmZiB0byBJQ0FDVElWRVI0CihYRU4pIGQwdjA6IHZHSUNEOiB1bmhhbmRsZWQgd29yZCB3
cml0ZSAweDAwMDAwMGZmZmZmZmZmIHRvIElDQUNUSVZFUjgKKFhFTikgZDB2MDogdkdJQ0Q6IHVu
aGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8gSUNBQ1RJVkVSMTIKKFhFTikg
ZDB2MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8gSUNB
Q1RJVkVSMTYKKFhFTikgZDB2MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAw
ZmZmZmZmZmYgdG8gSUNBQ1RJVkVSMjAKKFhFTikgZDB2MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3Jk
IHdyaXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8gSUNBQ1RJVkVSMjQKKFhFTikgZDB2MDogdkdJQ0Q6
IHVuaGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8gSUNBQ1RJVkVSMjgKKFhF
TikgZDB2MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8g
SUNBQ1RJVkVSMApbICAgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2FsIENQVSAw
eDAwMDAwMDAwMDAgWzB4NDEwZmQwODNdClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNpb24gNS42
LjEtZGVmYXVsdCAocm9vdEAwZmQ2ZDEzM2RkMTIpIChnY2MgdmVyc2lvbiA4LjMuMCAoQWxwaW5l
IDguMy4wKSkgIzEgU01QIEZyaSBNYXkgMSAwMDo1NzoyNiBVVEMgMjAyMApbICAgIDAuMDAwMDAw
XSBNYWNoaW5lIG1vZGVsOiBSYXNwYmVycnkgUGkgNCBNb2RlbCBCClsgICAgMC4wMDAwMDBdIFhl
biA0LjEzIHN1cHBvcnQgZm91bmQKWyAgICAwLjAwMDAwMF0gZWZpOiBHZXR0aW5nIEVGSSBwYXJh
bWV0ZXJzIGZyb20gRkRUOgpbICAgIDAuMDAwMDAwXSBlZmk6IFVFRkkgbm90IGZvdW5kLgpbICAg
IDAuMDAwMDAwXSBOVU1BOiBObyBOVU1BIGNvbmZpZ3VyYXRpb24gZm91bmQKWyAgICAwLjAwMDAw
MF0gTlVNQTogRmFraW5nIGEgbm9kZSBhdCBbbWVtIDB4MDAwMDAwMDA0MDAwMDAwMC0weDAwMDAw
MDAwN2ZmZmZmZmZdClsgICAgMC4wMDAwMDBdIE5VTUE6IE5PREVfREFUQSBbbWVtIDB4N2ZkYzYy
YzAtMHg3ZmRjOWZmZl0KWyAgICAwLjAwMDAwMF0gWm9uZSByYW5nZXM6ClsgICAgMC4wMDAwMDBd
ICAgRE1BICAgICAgW21lbSAweDAwMDAwMDAwNDAwMDAwMDAtMHgwMDAwMDAwMDdmZmZmZmZmXQpb
ICAgIDAuMDAwMDAwXSAgIERNQTMyICAgIGVtcHR5ClsgICAgMC4wMDAwMDBdICAgTm9ybWFsICAg
ZW1wdHkKWyAgICAwLjAwMDAwMF0gTW92YWJsZSB6b25lIHN0YXJ0IGZvciBlYWNoIG5vZGUKWyAg
ICAwLjAwMDAwMF0gRWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzClsgICAgMC4wMDAwMDBdICAgbm9k
ZSAgIDA6IFttZW0gMHgwMDAwMDAwMDQwMDAwMDAwLTB4MDAwMDAwMDA3ZmZmZmZmZl0KWyAgICAw
LjAwMDAwMF0gSW5pdG1lbSBzZXR1cCBub2RlIDAgW21lbSAweDAwMDAwMDAwNDAwMDAwMDAtMHgw
MDAwMDAwMDdmZmZmZmZmXQpbICAgIDAuMDAwMDAwXSBwc2NpOiBwcm9iaW5nIGZvciBjb25kdWl0
IG1ldGhvZCBmcm9tIERULgpbICAgIDAuMDAwMDAwXSBwc2NpOiBQU0NJdjEuMSBkZXRlY3RlZCBp
biBmaXJtd2FyZS4KWyAgICAwLjAwMDAwMF0gcHNjaTogVXNpbmcgc3RhbmRhcmQgUFNDSSB2MC4y
IGZ1bmN0aW9uIElEcwpbICAgIDAuMDAwMDAwXSBwc2NpOiBUcnVzdGVkIE9TIG1pZ3JhdGlvbiBu
b3QgcmVxdWlyZWQKWyAgICAwLjAwMDAwMF0gcHNjaTogU01DIENhbGxpbmcgQ29udmVudGlvbiB2
MS4xClsgICAgMC4wMDAwMDBdIHBlcmNwdTogRW1iZWRkZWQgMjMgcGFnZXMvY3B1IHM1NDIzMiBy
ODE5MiBkMzE3ODQgdTk0MjA4ClsgICAgMC4wMDAwMDBdIERldGVjdGVkIFBJUFQgSS1jYWNoZSBv
biBDUFUwClsgICAgMC4wMDAwMDBdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IEVMMiB2ZWN0b3Ig
aGFyZGVuaW5nClsgICAgMC4wMDAwMDBdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IFNwZWN1bGF0
aXZlIFN0b3JlIEJ5cGFzcyBEaXNhYmxlClsgICAgMC4wMDAwMDBdIENQVSBmZWF0dXJlczogZGV0
ZWN0ZWQ6IEFSTSBlcnJhdHVtIDEzMTkzNjcKWyAgICAwLjAwMDAwMF0gQnVpbHQgMSB6b25lbGlz
dHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDI1ODA0OApbICAgIDAuMDAw
MDAwXSBQb2xpY3kgem9uZTogRE1BClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6
IGNvbnNvbGU9aHZjMCBlYXJseXByaW50az14ZW4gbm9tb2Rlc2V0ClsgICAgMC4wMDAwMDBdIERl
bnRyeSBjYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDgsIDEwNDg1NzYg
Ynl0ZXMsIGxpbmVhcikKWyAgICAwLjAwMDAwMF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRy
aWVzOiA2NTUzNiAob3JkZXI6IDcsIDUyNDI4OCBieXRlcywgbGluZWFyKQpbICAgIDAuMDAwMDAw
XSBtZW0gYXV0by1pbml0OiBzdGFjazpvZmYsIGhlYXAgYWxsb2M6b2ZmLCBoZWFwIGZyZWU6b2Zm
ClsgICAgMC4wMDAwMDBdIE1lbW9yeTogMTAwMTk4OEsvMTA0ODU3NksgYXZhaWxhYmxlICgxMjcz
Mksga2VybmVsIGNvZGUsIDE4NTJLIHJ3ZGF0YSwgNjE4NEsgcm9kYXRhLCA0NjcySyBpbml0LCA3
NThLIGJzcywgNDY1ODhLIHJlc2VydmVkLCAwSyBjbWEtcmVzZXJ2ZWQpClsgICAgMC4wMDAwMDBd
IHJhbmRvbTogZ2V0X3JhbmRvbV91NjQgY2FsbGVkIGZyb20gX19rbWVtX2NhY2hlX2NyZWF0ZSsw
eDQwLzB4NTc4IHdpdGggY3JuZ19pbml0PTAKWyAgICAwLjAwMDAwMF0gU0xVQjogSFdhbGlnbj02
NCwgT3JkZXI9MC0zLCBNaW5PYmplY3RzPTAsIENQVXM9MSwgTm9kZXM9MQpbICAgIDAuMDAwMDAw
XSByY3U6IEhpZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24uClsgICAgMC4wMDAwMDBdIHJj
dTogCVJDVSByZXN0cmljdGluZyBDUFVzIGZyb20gTlJfQ1BVUz00ODAgdG8gbnJfY3B1X2lkcz0x
LgpbICAgIDAuMDAwMDAwXSByY3U6IFJDVSBjYWxjdWxhdGVkIHZhbHVlIG9mIHNjaGVkdWxlci1l
bmxpc3RtZW50IGRlbGF5IGlzIDEwIGppZmZpZXMuClsgICAgMC4wMDAwMDBdIHJjdTogQWRqdXN0
aW5nIGdlb21ldHJ5IGZvciByY3VfZmFub3V0X2xlYWY9MTYsIG5yX2NwdV9pZHM9MQpbICAgIDAu
MDAwMDAwXSBOUl9JUlFTOiA2NCwgbnJfaXJxczogNjQsIHByZWFsbG9jYXRlZCBpcnFzOiAwClsg
ICAgMC4wMDAwMDBdIGFyY2hfdGltZXI6IGNwMTUgdGltZXIocykgcnVubmluZyBhdCA1NC4wME1I
eiAodmlydCkuClsgICAgMC4wMDAwMDBdIGNsb2Nrc291cmNlOiBhcmNoX3N5c19jb3VudGVyOiBt
YXNrOiAweGZmZmZmZmZmZmZmZmZmIG1heF9jeWNsZXM6IDB4Yzc0M2NlMzQ2LCBtYXhfaWRsZV9u
czogNDQwNzk1MjAzMTIzIG5zClsgICAgMC4wMDAwMDZdIHNjaGVkX2Nsb2NrOiA1NiBiaXRzIGF0
IDU0TUh6LCByZXNvbHV0aW9uIDE4bnMsIHdyYXBzIGV2ZXJ5IDQzOTgwNDY1MTExMDJucwpbICAg
IDAuMDAwNDA3XSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDI1ClsgICAgMC4yNzA5
NjldIHByaW50azogY29uc29sZSBbaHZjMF0gZW5hYmxlZApbICAgIDAuMjc1MjU2XSBDYWxpYnJh
dGluZyBkZWxheSBsb29wIChza2lwcGVkKSwgdmFsdWUgY2FsY3VsYXRlZCB1c2luZyB0aW1lciBm
cmVxdWVuY3kuLiAxMDguMDAgQm9nb01JUFMgKGxwaj01NDAwMDApClsgICAgMC4yODU4MTJdIHBp
ZF9tYXg6IGRlZmF1bHQ6IDMyNzY4IG1pbmltdW06IDMwMQpbICAgIDAuMjkwNjU2XSBMU006IFNl
Y3VyaXR5IEZyYW1ld29yayBpbml0aWFsaXppbmcKWyAgICAwLjI5NTM1NF0gTW91bnQtY2FjaGUg
aGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogMiwgMTYzODQgYnl0ZXMsIGxpbmVhcikK
WyAgICAwLjMwMjg2Ml0gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDIwNDgg
KG9yZGVyOiAyLCAxNjM4NCBieXRlcywgbGluZWFyKQpbICAgIDAuMzEzMzcyXSB4ZW46Z3JhbnRf
dGFibGU6IEdyYW50IHRhYmxlcyB1c2luZyB2ZXJzaW9uIDEgbGF5b3V0ClsgICAgMC4zMTg4NThd
IEdyYW50IHRhYmxlIGluaXRpYWxpemVkClsgICAgMC4zMjI0NThdIHhlbjpldmVudHM6IFVzaW5n
IEZJRk8tYmFzZWQgQUJJClsgICAgMC4zMjY5MDZdIFhlbjogaW5pdGlhbGl6aW5nIGNwdTAKWyAg
ICAwLjMzMDUwOV0gcmN1OiBIaWVyYXJjaGljYWwgU1JDVSBpbXBsZW1lbnRhdGlvbi4KWyAgICAw
LjMzOTQ5N10gRUZJIHNlcnZpY2VzIHdpbGwgbm90IGJlIGF2YWlsYWJsZS4KWyAgICAwLjM0MzY0
NF0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KWyAgICAwLjM0ODE1N10gc21w
OiBCcm91Z2h0IHVwIDEgbm9kZSwgMSBDUFUKWyAgICAwLjM1MjI1NV0gU01QOiBUb3RhbCBvZiAx
IHByb2Nlc3NvcnMgYWN0aXZhdGVkLgpbICAgIDAuMzU3MDkwXSBDUFUgZmVhdHVyZXM6IGRldGVj
dGVkOiAzMi1iaXQgRUwwIFN1cHBvcnQKWyAgICAwLjM2MjM3MF0gQ1BVIGZlYXR1cmVzOiBkZXRl
Y3RlZDogQ1JDMzIgaW5zdHJ1Y3Rpb25zClsgICAgMC4zOTY5NjldIENQVTogQWxsIENQVShzKSBz
dGFydGVkIGF0IEVMMQpbICAgIDAuNDAwNTU2XSBhbHRlcm5hdGl2ZXM6IHBhdGNoaW5nIGtlcm5l
bCBjb2RlClsgICAgMC40MDY1MzhdIGRldnRtcGZzOiBpbml0aWFsaXplZApbICAgIDAuNDE1OTEz
XSBSZWdpc3RlcmVkIGNwMTVfYmFycmllciBlbXVsYXRpb24gaGFuZGxlcgpbICAgIDAuNDIwNDQ4
XSBSZWdpc3RlcmVkIHNldGVuZCBlbXVsYXRpb24gaGFuZGxlcgpbICAgIDAuNDI1MDc1XSBLQVNM
UiBkaXNhYmxlZCBkdWUgdG8gbGFjayBvZiBzZWVkClsgICAgMC40MzAwNDJdIGNsb2Nrc291cmNl
OiBqaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYsIG1heF9p
ZGxlX25zOiAxOTExMjYwNDQ2Mjc1MDAwMCBucwpbICAgIDAuNDM5NzAxXSBmdXRleCBoYXNoIHRh
YmxlIGVudHJpZXM6IDI1NiAob3JkZXI6IDIsIDE2Mzg0IGJ5dGVzLCBsaW5lYXIpClsgICAgMC40
NDY4MTddIHBpbmN0cmwgY29yZTogaW5pdGlhbGl6ZWQgcGluY3RybCBzdWJzeXN0ZW0KWyAgICAw
LjQ1MzEzMl0gdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnZmFpcl9z
aGFyZScKWyAgICAwLjQ1MzEzNV0gdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zl
cm5vciAnYmFuZ19iYW5nJwpbICAgIDAuNDU4Njg1XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0
aGVybWFsIGdvdmVybm9yICdzdGVwX3dpc2UnClsgICAgMC40NjQ4NzZdIHRoZXJtYWxfc3lzOiBS
ZWdpc3RlcmVkIHRoZXJtYWwgZ292ZXJub3IgJ3VzZXJfc3BhY2UnClsgICAgMC40NzExMDNdIERN
SSBub3QgcHJlc2VudCBvciBpbnZhbGlkLgpbICAgIDAuNDgxNzIwXSBORVQ6IFJlZ2lzdGVyZWQg
cHJvdG9jb2wgZmFtaWx5IDE2ClsgICAgMC40ODYwMTJdIERNQTogcHJlYWxsb2NhdGVkIDI1NiBL
aUIgcG9vbCBmb3IgYXRvbWljIGFsbG9jYXRpb25zClsgICAgMC40OTE5ODVdIGF1ZGl0OiBpbml0
aWFsaXppbmcgbmV0bGluayBzdWJzeXMgKGRpc2FibGVkKQpbICAgIDAuNDk4Njk4XSBhdWRpdDog
dHlwZT0yMDAwIGF1ZGl0KDAuMzgwOjEpOiBzdGF0ZT1pbml0aWFsaXplZCBhdWRpdF9lbmFibGVk
PTAgcmVzPTEKWyAgICAwLjUwNjU1NF0gaHctYnJlYWtwb2ludDogZm91bmQgNiBicmVha3BvaW50
IGFuZCA0IHdhdGNocG9pbnQgcmVnaXN0ZXJzLgpbICAgIDAuNTEyOTM0XSBBU0lEIGFsbG9jYXRv
ciBpbml0aWFsaXNlZCB3aXRoIDY1NTM2IGVudHJpZXMKWyAgICAwLjUxODQ1OF0geGVuOnN3aW90
bGJfeGVuOiBXYXJuaW5nOiBvbmx5IGFibGUgdG8gYWxsb2NhdGUgNCBNQiBmb3Igc29mdHdhcmUg
SU8gVExCClsgICAgMC41MjgxODldIHNvZnR3YXJlIElPIFRMQjogbWFwcGVkIFttZW0gMHg3ZjAw
MDAwMC0weDdmNDAwMDAwXSAoNE1CKQpbICAgIDAuNTM1MzM1XSBTZXJpYWw6IEFNQkEgUEwwMTEg
VUFSVCBkcml2ZXIKWyAgICAwLjU1ODA1MV0gSHVnZVRMQiByZWdpc3RlcmVkIDEuMDAgR2lCIHBh
Z2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC41NjQyNjBdIEh1Z2VUTEIgcmVn
aXN0ZXJlZCAzMi4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMCBwYWdlcwpbICAgIDAu
NTcxMDg1XSBIdWdlVExCIHJlZ2lzdGVyZWQgMi4wMCBNaUIgcGFnZSBzaXplLCBwcmUtYWxsb2Nh
dGVkIDAgcGFnZXMKWyAgICAwLjU3NzkzN10gSHVnZVRMQiByZWdpc3RlcmVkIDY0LjAgS2lCIHBh
Z2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC41ODkwMjFdIGNyeXB0ZDogbWF4
X2NwdV9xbGVuIHNldCB0byAxMDAwClsgICAgMC41OTkwNDddIEFDUEk6IEludGVycHJldGVyIGRp
c2FibGVkLgpbICAgIDAuNjAyNzMyXSB4ZW46YmFsbG9vbjogSW5pdGlhbGlzaW5nIGJhbGxvb24g
ZHJpdmVyClsgICAgMC42MDg2NTVdIGlvbW11OiBEZWZhdWx0IGRvbWFpbiB0eXBlOiBUcmFuc2xh
dGVkClsgICAgMC42MTMyNzZdIHZnYWFyYjogbG9hZGVkClsgICAgMC42MTYxNjVdIFNDU0kgc3Vi
c3lzdGVtIGluaXRpYWxpemVkClsgICAgMC42MjAzODddIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3
IGludGVyZmFjZSBkcml2ZXIgdXNiZnMKWyAgICAwLjYyNTM1NV0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBodWIKWyAgICAwLjYzMDg3M10gdXNiY29yZTogcmVnaXN0
ZXJlZCBuZXcgZGV2aWNlIGRyaXZlciB1c2IKWyAgICAwLjYzNjA5Ml0gdXNiX3BoeV9nZW5lcmlj
IHBoeTogcGh5IHN1cHBseSB2Y2Mgbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IKWyAg
ICAwLjY0Mzg5NV0gcHBzX2NvcmU6IExpbnV4UFBTIEFQSSB2ZXIuIDEgcmVnaXN0ZXJlZApbICAg
IDAuNjQ4NTg4XSBwcHNfY29yZTogU29mdHdhcmUgdmVyLiA1LjMuNiAtIENvcHlyaWdodCAyMDA1
LTIwMDcgUm9kb2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAbGludXguaXQ+ClsgICAgMC42NTc5MjVd
IFBUUCBjbG9jayBzdXBwb3J0IHJlZ2lzdGVyZWQKWyAgICAwLjY2MjA2Ml0gRURBQyBNQzogVmVy
OiAzLjAuMApbICAgIDAuNjY2NDI5XSBOZXRMYWJlbDogSW5pdGlhbGl6aW5nClsgICAgMC42Njky
ODJdIE5ldExhYmVsOiAgZG9tYWluIGhhc2ggc2l6ZSA9IDEyOApbICAgIDAuNjczNzM2XSBOZXRM
YWJlbDogIHByb3RvY29scyA9IFVOTEFCRUxFRCBDSVBTT3Y0IENBTElQU08KWyAgICAwLjY3OTYx
M10gTmV0TGFiZWw6ICB1bmxhYmVsZWQgdHJhZmZpYyBhbGxvd2VkIGJ5IGRlZmF1bHQKWyAgICAw
LjY4NTc4MV0gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIGFyY2hfc3lzX2Nv
dW50ZXIKWyAgICAwLjY5MTc1NV0gVkZTOiBEaXNrIHF1b3RhcyBkcXVvdF82LjYuMApbICAgIDAu
Njk1NTc0XSBWRlM6IERxdW90LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNTEyIChvcmRlciAw
LCA0MDk2IGJ5dGVzKQpbICAgIDAuNzAyNzUwXSBwbnA6IFBuUCBBQ1BJOiBkaXNhYmxlZApbICAg
IDAuNzEyOTY0XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDIKWyAgICAwLjcxNzI4
MV0gdGNwX2xpc3Rlbl9wb3J0YWRkcl9oYXNoIGhhc2ggdGFibGUgZW50cmllczogNTEyIChvcmRl
cjogMSwgODE5MiBieXRlcywgbGluZWFyKQpbICAgIDAuNzI1Mjk1XSBUQ1AgZXN0YWJsaXNoZWQg
aGFzaCB0YWJsZSBlbnRyaWVzOiA4MTkyIChvcmRlcjogNCwgNjU1MzYgYnl0ZXMsIGxpbmVhcikK
WyAgICAwLjczMzI1MV0gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRyaWVzOiA4MTkyIChvcmRlcjog
NSwgMTMxMDcyIGJ5dGVzLCBsaW5lYXIpClsgICAgMC43NDA2ODFdIFRDUDogSGFzaCB0YWJsZXMg
Y29uZmlndXJlZCAoZXN0YWJsaXNoZWQgODE5MiBiaW5kIDgxOTIpClsgICAgMC43NDcyMzddIFVE
UCBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMiAob3JkZXI6IDIsIDE2Mzg0IGJ5dGVzLCBsaW5lYXIp
ClsgICAgMC43NTM4MjldIFVEUC1MaXRlIGhhc2ggdGFibGUgZW50cmllczogNTEyIChvcmRlcjog
MiwgMTYzODQgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjc2MTIwN10gTkVUOiBSZWdpc3RlcmVkIHBy
b3RvY29sIGZhbWlseSAxClsgICAgMC43NjU1MTRdIFBDSTogQ0xTIDAgYnl0ZXMsIGRlZmF1bHQg
NjQKWyAgICAwLjc3MDA1NV0ga3ZtIFsxXTogSFlQIG1vZGUgbm90IGF2YWlsYWJsZQpbICAgIDAu
NzgxMTc2XSBJbml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMC43ODUxOTNd
IHdvcmtpbmdzZXQ6IHRpbWVzdGFtcF9iaXRzPTQwIG1heF9vcmRlcj0xOCBidWNrZXRfb3JkZXI9
MApbICAgIDAuNzk4MDAwXSB6YnVkOiBsb2FkZWQKWyAgICAwLjgwMTQ2N10gc3F1YXNoZnM6IHZl
cnNpb24gNC4wICgyMDA5LzAxLzMxKSBQaGlsbGlwIExvdWdoZXIKWyAgICAwLjgwNzMzMF0gOXA6
IEluc3RhbGxpbmcgdjlmcyA5cDIwMDAgZmlsZSBzeXN0ZW0gc3VwcG9ydApbICAgIDAuODM2MDk3
XSBLZXkgdHlwZSBhc3ltbWV0cmljIHJlZ2lzdGVyZWQKWyAgICAwLjgzOTYzMF0gQXN5bW1ldHJp
YyBrZXkgcGFyc2VyICd4NTA5JyByZWdpc3RlcmVkClsgICAgMC44NDQ2NjZdIEJsb2NrIGxheWVy
IFNDU0kgZ2VuZXJpYyAoYnNnKSBkcml2ZXIgdmVyc2lvbiAwLjQgbG9hZGVkIChtYWpvciAyNDYp
ClsgICAgMC44NTIzNDZdIGlvIHNjaGVkdWxlciBtcS1kZWFkbGluZSByZWdpc3RlcmVkClsgICAg
MC44NTY4NjRdIGlvIHNjaGVkdWxlciBreWJlciByZWdpc3RlcmVkClsgICAgMC44NjExMzNdIGlv
IHNjaGVkdWxlciBiZnEgcmVnaXN0ZXJlZApbICAgIDAuODY5Nzk1XSBzaHBjaHA6IFN0YW5kYXJk
IEhvdCBQbHVnIFBDSSBDb250cm9sbGVyIERyaXZlciB2ZXJzaW9uOiAwLjQKWyAgICAwLjg3NzIy
Nl0gYnJjbS1wY2llIGZkNTAwMDAwLnBjaWU6IGhvc3QgYnJpZGdlIC9zY2IvcGNpZUA3ZDUwMDAw
MCByYW5nZXM6ClsgICAgMC44ODM2NzddIGJyY20tcGNpZSBmZDUwMDAwMC5wY2llOiAgICAgIE1F
TSAweDA2MDAwMDAwMDAuLjB4MDYwM2ZmZmZmZiAtPiAweDAwZjgwMDAwMDAKWyAgICAwLjg5MTk3
N10gYnJjbS1wY2llIGZkNTAwMDAwLnBjaWU6ICAgSUIgTUVNIDB4MDAwMDAwMDAwMC4uMHgwMGJm
ZmZmZmZmIC0+IDB4MDAwMDAwMDAwMApbICAgIDAuOTU1ODA4XSBicmNtLXBjaWUgZmQ1MDAwMDAu
cGNpZTogbGluayB1cCwgNSBHVC9zIHgxICghU1NDKQpbICAgIDAuOTYxMzEyXSBicmNtLXBjaWUg
ZmQ1MDAwMDAucGNpZTogUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAwMDAwOjAwClsgICAgMC45Njc1
MjRdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW2J1cyAwMC0wMV0KWyAgICAw
Ljk3MzEyNl0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4NjAwMDAw
MDAwLTB4NjAzZmZmZmZmXSAoYnVzIGFkZHJlc3MgWzB4ZjgwMDAwMDAtMHhmYmZmZmZmZl0pClsg
ICAgMC45ODM2OTZdIHBjaSAwMDAwOjAwOjAwLjA6IFsxNGU0OjI3MTFdIHR5cGUgMDEgY2xhc3Mg
MHgwNjA0MDAKWyAgICAwLjk4OTg5N10gcGNpIDAwMDA6MDA6MDAuMDogUE1FIyBzdXBwb3J0ZWQg
ZnJvbSBEMCBEM2hvdAooWEVOKSBwaHlzZGV2LmM6MTY6ZDB2MCBQSFlTREVWT1AgY21kPTI1OiBu
b3QgaW1wbGVtZW50ZWQKKFhFTikgcGh5c2Rldi5jOjE2OmQwdjAgUEhZU0RFVk9QIGNtZD0xNTog
bm90IGltcGxlbWVudGVkClsgICAgMS4wMDU4MTJdIHBjaSAwMDAwOjAwOjAwLjA6IEZhaWxlZCB0
byBhZGQgLSBwYXNzdGhyb3VnaCBvciBNU0kvTVNJLVggbWlnaHQgZmFpbCEKWyAgICAxLjAxNjQw
MF0gcGNpIDAwMDA6MDA6MDAuMDogYnJpZGdlIGNvbmZpZ3VyYXRpb24gaW52YWxpZCAoW2J1cyAw
MC0wMF0pLCByZWNvbmZpZ3VyaW5nClsgICAgMS4wMjM5OTNdIHBjaSAwMDAwOjAxOjAwLjA6IFsx
MTA2OjM0ODNdIHR5cGUgMDAgY2xhc3MgMHgwYzAzMzAKWyAgICAxLjAzMDA3M10gcGNpIDAwMDA6
MDE6MDAuMDogcmVnIDB4MTA6IFttZW0gMHgwMDAwMDAwMC0weDAwMDAwZmZmIDY0Yml0XQpbICAg
IDEuMDM3MDg5XSBwY2kgMDAwMDowMTowMC4wOiBQTUUjIHN1cHBvcnRlZCBmcm9tIEQwIEQzY29s
ZAooWEVOKSBwaHlzZGV2LmM6MTY6ZDB2MCBQSFlTREVWT1AgY21kPTE1OiBub3QgaW1wbGVtZW50
ZWQKWyAgICAxLjA0Nzg4M10gcGNpIDAwMDA6MDE6MDAuMDogRmFpbGVkIHRvIGFkZCAtIHBhc3N0
aHJvdWdoIG9yIE1TSS9NU0ktWCBtaWdodCBmYWlsIQpbICAgIDEuMDU4NDIwXSBwY2lfYnVzIDAw
MDA6MDE6IGJ1c25fcmVzOiBbYnVzIDAxXSBlbmQgaXMgdXBkYXRlZCB0byAwMQpbICAgIDEuMDY0
MjUyXSBwY2kgMDAwMDowMDowMC4wOiBCQVIgMTQ6IGFzc2lnbmVkIFttZW0gMHg2MDAwMDAwMDAt
MHg2MDAwZmZmZmZdClsgICAgMS4wNzE0NTNdIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiAwOiBhc3Np
Z25lZCBbbWVtIDB4NjAwMDAwMDAwLTB4NjAwMDAwZmZmIDY0Yml0XQpbICAgIDEuMDc5MDk0XSBw
Y2kgMDAwMDowMDowMC4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDFdClsgICAgMS4wODQxNjVdIHBj
aSAwMDAwOjAwOjAwLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4NjAwMDAwMDAwLTB4NjAwMGZm
ZmZmXQpbICAgIDEuMDkxNDI2XSBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IGVuYWJsaW5nIGRldmlj
ZSAoMDAwMCAtPiAwMDAyKQpbICAgIDEuMDk3NjU5XSBwY2llcG9ydCAwMDAwOjAwOjAwLjA6IFBN
RTogU2lnbmFsaW5nIHdpdGggSVJRIDM2ClsgICAgMS4xMDM2NzVdIHBjaWVwb3J0IDAwMDA6MDA6
MDAuMDogQUVSOiBlbmFibGVkIHdpdGggSVJRIDM2ClsgICAgMS4xMDkyNzNdIHBjaSAwMDAwOjAx
OjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQooWEVOKSB0cmFwcy5jOjE5NzI6
ZDB2MCBIU1I9MHg5MzgwMDAwNSBwYz0weGZmZmY4MDAwMTA4ZTM1NjQgZ3ZhPTB4ZmZmZjgwMDAx
MDAxZDAxMCBncGE9MHgwMDAwMDYwMDAwMDAxMApbICAgIDEuMTI0MjM0XSBVbmhhbmRsZWQgZmF1
bHQgYXQgMHhmZmZmODAwMDEwMDFkMDEwClsgICAgMS4xMjkwMzldIE1lbSBhYm9ydCBpbmZvOgpb
ICAgIDEuMTMxOTI2XSAgIEVTUiA9IDB4OTYwMDAwMDAKWyAgICAxLjEzNTA4OV0gICBFQyA9IDB4
MjU6IERBQlQgKGN1cnJlbnQgRUwpLCBJTCA9IDMyIGJpdHMKWyAgICAxLjE0MDU0Ml0gICBTRVQg
PSAwLCBGblYgPSAwClsgICAgMS4xNDM2OTFdICAgRUEgPSAwLCBTMVBUVyA9IDAKWyAgICAxLjE0
Njk1MF0gRGF0YSBhYm9ydCBpbmZvOgpbICAgIDEuMTQ5OTI2XSAgIElTViA9IDAsIElTUyA9IDB4
MDAwMDAwMDAKWyAgICAxLjE1Mzg3N10gICBDTSA9IDAsIFduUiA9IDAKWyAgICAxLjE1Njk2NV0g
c3dhcHBlciBwZ3RhYmxlOiA0ayBwYWdlcywgNDgtYml0IFZBcywgcGdkcD0wMDAwMDAwMDQxMmZl
MDAwClsgICAgMS4xNjM4MDBdIFtmZmZmODAwMDEwMDFkMDEwXSBwZ2Q9MDAwMDAwMDA3ZmZmZjAw
MywgcHVkPTAwMDAwMDAwN2ZmZmUwMDMsIHBtZD0wMDAwMDAwMDdmZmZkMDAzLCBwdGU9MDA2ODAw
MDYwMDAwMDcwNwpbICAgIDEuMTc0NjE0XSBJbnRlcm5hbCBlcnJvcjogdHRiciBhZGRyZXNzIHNp
emUgZmF1bHQ6IDk2MDAwMDAwIFsjMV0gU01QClsgICAgMS4xODEyNzJdIE1vZHVsZXMgbGlua2Vk
IGluOgpbICAgIDEuMTg0NDM4XSBDUFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFp
bnRlZCA1LjYuMS1kZWZhdWx0ICMxClsgICAgMS4xOTExMDZdIEhhcmR3YXJlIG5hbWU6IFJhc3Bi
ZXJyeSBQaSA0IE1vZGVsIEIgKERUKQpbICAgIDEuMTk2Mzg2XSBwc3RhdGU6IDYwMDAwMDA1IChu
WkN2IGRhaWYgLVBBTiAtVUFPKQpbICAgIDEuMjAxMzA3XSBwYyA6IHF1aXJrX3VzYl9lYXJseV9o
YW5kb2ZmKzB4NGZjLzB4ODcwClsgICAgMS4yMDYzOThdIGxyIDogcXVpcmtfdXNiX2Vhcmx5X2hh
bmRvZmYrMHg0ZWMvMHg4NzAKWyAgICAxLjIxMTQ3Nl0gc3AgOiBmZmZmODAwMDEwMDEzOWYwClsg
ICAgMS4yMTQ5MDFdIHgyOTogZmZmZjgwMDAxMDAxMzlmMCB4Mjg6IGZmZmYwMDAwM2RkOGMwODAK
WyAgICAxLjIyMDM0NV0geDI3OiBmZmZmMDAwMDNmZGY0YzcwIHgyNjogZmZmZjgwMDAxMDhlMzA2
OApbICAgIDEuMjI1Nzk3XSB4MjU6IGZmZmY4MDAwMTE5NjQwNTAgeDI0OiAwMDAwMDAwMDM5NmRm
YmY4ClsgICAgMS4yMzEyMzJdIHgyMzogMDAwMDAwMDAwMDAwZmZmZiB4MjI6IGZmZmY4MDAwMTAw
MWQwMDAKWyAgICAxLjIzNjY4NF0geDIxOiAwMDAwMDAwMDAwMDAxMDAwIHgyMDogZmZmZjgwMDAx
MTc5YjU0OApbICAgIDEuMjQyMTE5XSB4MTk6IGZmZmYwMDAwM2RjYWMwMDAgeDE4OiBmZmZmODAw
MDExMWRiYTQ4ClsgICAgMS4yNDc1NjRdIHgxNzogMDAwMDAwMDAwMDAwMDAwMSB4MTY6IDAwMDAw
MDAwZGVhZGJlZWYKWyAgICAxLjI1MzAwN10geDE1OiAwMDAwMDAwNjAwMDAwMDAwIHgxNDogZmZm
ZjgwMDAxMDAyNTAwMApbICAgIDEuMjU4NDUxXSB4MTM6IGZmZmY4MDAwMTAwMWQwMDAgeDEyOiBm
ZmZmMDAwMDNmODA0NDQwClsgICAgMS4yNjM4OTVdIHgxMTogZmZmZjgwMDAxMTQ2MTkyOCB4MTA6
IGZmZmY4MDAwMTAwMTM1MTAKWyAgICAxLjI2OTMzOV0geDkgOiAwMDAwMDAwMDAwMDAxMDAwIHg4
IDogZmZmZjgwMDAxMTdiMmQ1OApbICAgIDEuMjc0NzgyXSB4NyA6IDAwMDAwMDAwMDAwMDAwMDAg
eDYgOiBmZmZmODAwMDEwMDFkMDAwClsgICAgMS4yODAyMjZdIHg1IDogZmZmZjAwMDAzZmZmZjAw
MCB4NCA6IGZmZmYwMDAwM2ZmZmU0MDAKWyAgICAxLjI4NTY3MF0geDMgOiAwMDY4MDAwMDAwMDAw
NzA3IHgyIDogMDE0MDAwMDAwMDAwMDAwMApbICAgIDEuMjkxMTE0XSB4MSA6IDAwMDA4MDA1ZWZm
ZTMwMDAgeDAgOiBmZmZmODAwMDEwMDFkMDEwClsgICAgMS4yOTY1NjddIENhbGwgdHJhY2U6Clsg
ICAgMS4yOTkxMTFdICBxdWlya191c2JfZWFybHlfaGFuZG9mZisweDRmYy8weDg3MApbICAgIDEu
MzAzODUwXSAgcGNpX2RvX2ZpeHVwcysweGUwLzB4MTM4ClsgICAgMS4zMDc2MjVdICBwY2lfZml4
dXBfZGV2aWNlKzB4NGMvMHgxMzAKWyAgICAxLjMxMTY2NF0gIHBjaV9idXNfYWRkX2RldmljZSsw
eDIwLzB4YjgKWyAgICAxLjMxNTc5OV0gIHBjaV9idXNfYWRkX2RldmljZXMrMHgzOC8weDg4Clsg
ICAgMS4zMjAwMDRdICBwY2lfYnVzX2FkZF9kZXZpY2VzKzB4NjgvMHg4OApbICAgIDEuMzI0MjIw
XSAgYnJjbV9wY2llX3Byb2JlKzB4NzY4LzB4YjI4ClsgICAgMS4zMjgyNTldICBwbGF0Zm9ybV9k
cnZfcHJvYmUrMHg1MC8weGEwClsgICAgMS4zMzIzODddICByZWFsbHlfcHJvYmUrMHhkOC8weDQz
OApbICAgIDEuMzM2MDgzXSAgZHJpdmVyX3Byb2JlX2RldmljZSsweGRjLzB4MTMwClsgICAgMS4z
NDAzNzZdICBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDZjLzB4NzgKWyAgICAxLjM0NDY3OV0gIF9f
ZHJpdmVyX2F0dGFjaCsweDljLzB4MTY4ClsgICAgMS4zNDg2MzBdICBidXNfZm9yX2VhY2hfZGV2
KzB4NzAvMHhjMApbICAgIDEuMzUyNTgxXSAgZHJpdmVyX2F0dGFjaCsweDIwLzB4MjgKWyAgICAx
LjM1NjI3OF0gIGJ1c19hZGRfZHJpdmVyKzB4MTkwLzB4MjIwClsgICAgMS4zNjAyMjBdICBkcml2
ZXJfcmVnaXN0ZXIrMHg2MC8weDExMApbICAgIDEuMzY0MTY5XSAgX19wbGF0Zm9ybV9kcml2ZXJf
cmVnaXN0ZXIrMHg0NC8weDUwClsgICAgMS4zNjkwMDFdICBicmNtX3BjaWVfZHJpdmVyX2luaXQr
MHgxOC8weDIwClsgICAgMS4zNzMzOTFdICBkb19vbmVfaW5pdGNhbGwrMHg3NC8weDFiMApbICAg
IDEuMzc3MzQyXSAga2VybmVsX2luaXRfZnJlZWFibGUrMHgyMTQvMHgyYjAKWyAgICAxLjM4MTgy
MF0gIGtlcm5lbF9pbml0KzB4MTAvMHgxMDAKWyAgICAxLjM4NTQxOF0gIHJldF9mcm9tX2Zvcmsr
MHgxMC8weDE4ClsgICAgMS4zODkxMTJdIENvZGU6IGFhMDAwM2Y2IGI0ZmZkY2UwIDkxMDA0MDAw
IGE5MDM2M2Y3IChiOTQwMDAwMCkKWyAgICAxLjM5NTM1MV0gLS0tWyBlbmQgdHJhY2UgOGE2NDRh
YzE4NDIzZjQ1NyBdLS0tClsgICAgMS40MDAxNDNdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAwMDAwMDBiClsgICAgMS40MDc4
OThdIEtlcm5lbCBPZmZzZXQ6IGRpc2FibGVkClsgICAgMS40MTE0OTZdIENQVSBmZWF0dXJlczog
MHgxMDAwMiw2MTAwNjAwMApbICAgIDEuNDE1NzE3XSBNZW1vcnkgTGltaXQ6IG5vbmUKWyAgICAx
LjQxODg3NF0gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0
byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDAwMGIgXS0tLQo=
--0000000000006c6fd005a48cd2eb--

