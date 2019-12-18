Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C0123B5E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 01:11:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihMpn-00085o-OS; Wed, 18 Dec 2019 00:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hOUS=2I=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ihMpl-00085j-Ux
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 00:04:58 +0000
X-Inumbo-ID: 0680c3a6-212a-11ea-a1e1-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0680c3a6-212a-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 00:04:57 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n15so450145qtp.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 16:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8zdP6zSmr1UULd3uMA+6dIowAqwiVBLa0n+Ww1pcag=;
 b=Il1E8y34+94yoFRqt5lc0MHKnX0TG814+wMXvqjvoGFtBc8trucfkFD8NA5QlPO0Iq
 EBcR804SPHLutF7JbaswUVdCCbKepvYbkobttfh8DW5gI2b9zQx41V336y+K/y4oYOP+
 STIVJVmMu6M4xd98t4QiztlQ4T7ITm2LfT7rrT7O3UPLlimQywpqcqjX6449XAoXYFV3
 LZCQuV5C70VGf6qMI2KcEe4/L1p7v/GtUdRRRh1QnFsbyjrgyv3muHNmbDL8Xq0VWNJR
 VAdEQOAVu/OoeXcKuruYonUAmhCT79SpNizclT6fNgEqaAbtx73v2MUTMTgeWHzej7a6
 yiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8zdP6zSmr1UULd3uMA+6dIowAqwiVBLa0n+Ww1pcag=;
 b=hz3yYAlpXr3F4byKJvZ57YPIsFHh2RIaPs9i+kYmirCJKPhf79Xodl7qpHK2saLtUb
 togDrwG7qGM79ngkC0xFjfOht0uIJsdWcRbSq7I+XlazjADEblW3cTETjXwIQGa/s7s1
 s/30QJZpnvhgW1kjR2Nkxy5TrWOfprgx8aub8INiMYnYYe0yBrd4ErqeeUTmnEgf9c9O
 Oq09EFKB2MU7DwXoS/jkUW3fvvBOHET5N0I5o+WUDmoEh1nTz2aTXW/j77IBDpHlLlEJ
 qPefSSKWdTjPbUalhIT4UIIqelNavVWnVVp5ISA7qNmGFzYhhnjMmwVYFe68Q+IXxBtb
 xcNg==
X-Gm-Message-State: APjAAAXHNtuz0dqCvtMl/Nvrb4km1pQ9tz1ZCYU0AFnta3ORdIvqh9sT
 39yAjQNHZ/S4b4OU/O56Z0Smthw6wOJXid/7yDnHxQ==
X-Google-Smtp-Source: APXvYqyUgUfZk2Oo7QK1fS9S70ndIuD63DjcHKL5lokMWQiplaWwrTuM7rpjYFFbFbhtE9YZ47CPwtln6t7QuGcygbI=
X-Received: by 2002:aed:2e03:: with SMTP id j3mr536850qtd.365.1576627496504;
 Tue, 17 Dec 2019 16:04:56 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 17 Dec 2019 16:04:45 -0800
Message-ID: <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000df973d0599ef3161"
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000df973d0599ef3161
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 17, 2019 at 11:26 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 17 Dec 2019, Roman Shaposhnik wrote:
> > On Tue, Dec 17, 2019 at 10:30 AM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > On Tue, 17 Dec 2019, Julien Grall wrote:
> > > > Hi,
> > > >
> > > > On 17/12/2019 04:39, Roman Shaposhnik wrote:
> > > > > On Mon, Dec 16, 2019 at 6:55 PM Stefano Stabellini
> > > > > <sstabellini@kernel.org> wrote:
> > > > > > On Mon, 16 Dec 2019, Roman Shaposhnik wrote:
> > > > > > If I sum all the memory sizes together I get 0x3ddfd000 which is 990M.
> > > > > > If so, I wonder how you could boot succesfully with dom0_mem=1024M even
> > > > > > on Xen 4.12... :-?
> > > > >
> > > > > That is a very interesting observation indeed! I actually don't
> > > > > remember where that device tree came from, but I think it was from one
> > > > > of the Linaro sites.
> > > >
> > > > This is mostly likely because of:
> > > >
> > > > commit 6341a674573f1834f083f0ab0f5b36b075f9e02e
> > > > Author: Julien Grall <julien.grall@arm.com>
> > > > Date:   Wed Aug 21 22:42:31 2019 +0100
> > > >
> > > >     xen/arm: domain_build: Don't continue if unable to allocate all dom0 banks
> > > >
> > > >     Xen will only print a warning if there are memory unallocated when using
> > > >     1:1 mapping (only used by dom0). This also includes the case where no
> > > >     memory has been allocated.
> > > >
> > > >     It will bring to all sort of issues that can be hard to diagnostic for
> > > >     users (the warning can be difficult to spot or disregard).
> > > >
> > > >     If the users request 1GB of memory, then most likely they want the exact
> > > >     amount and not 512MB. So panic if all the memory has not been allocated.
> > > >
> > > >     After this change, the behavior is the same as for non-1:1 memory
> > > >     allocation (used by domU).
> > > >
> > > >     At the same time, reflow the message to have the format on a single
> > > >     line.
> > > >
> > > >     Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > >     Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > >
> > > Ah! Roman, could you please post the full boot log of a successful 4.12
> > > boot?
> > >
> > > If it has a "Failed to allocate requested dom0 memory" message, then we
> > > know what the issue is.
> >
> > Aha! Our messages seems to have crossed ;-) Full log is attached and
> > yes -- that's
> > the problem indeed.
> >
> > So at least that mystery is solved. But I'm still not able to get to a
> > full 1G of memory
> > even with your update to the device tree file. Any chance you can send me the
> > device tree file that works for you?
>
> I didn't try on real hardware, I only tried on QEMU with a similar
> configuration. I went back and check the HiKey device tree I used and it
> is the same as yours (including the ramoops reserved-memory error).
>
> Apparently there are 1G and 2G variants of the HiKey, obviously both
> yours and my device tree are for the 1G variant. I try to dig through
> the docs but couldn't find the details of the 2G variant. I cannot find
> anywhere the memory range for the top 1G of memory not even on the
> LeMaker docs! :-/

Yup. That's exactly the issue on my end as well - can't seem to find an
authoritative source for that devicetree.

I did find this, though:
     https://releases.linaro.org/96boards/hikey/linaro/debian/15.11/
which looks like it has the latest (at least file timestamp-wise) devicetree.

If you look at the memory and reserved memory nodes there, they
are actually much simpler than what we've got:

        memory {
                device_type = "memory";
                reg = <0x0 0x0 0x0 0x40000000>;
        };

        reserved-memory {
                #address-cells = <0x2>;
                #size-cells = <0x2>;
                ranges;

                mcu-buf@05e00000 {
                        no-map;
                        reg = <0x0 0x5e00000 0x0 0x100000 0x0
0x740f000 0x0 0x1000>;
                };

                mbox-buf@06dff000 {
                        no-map;
                        reg = <0x0 0x6dff000 0x0 0x1000>;
                };
        };

So -- just on a whim -- I changed it to:
    reg = <0x0 0x0 0x0 0x80000000>;

Interestingly enough, Xen booted, and complained about only 192MB
unallocated this time.
So, I dropped the size of Dom0 to 640M and I got it boot and here's
what I'm seeing as
an output of xl info:
   total_memory           : 1120
   free_memory            : 390
It still nowhere close to 2G.

Then I booted the Linux kernel without Xen and it correctly identified
all 2G worth of RAM, and in fact,
when I converted /sys/firmware/devicetree/base back into dts, here's
what I've got:

        memory {
                device_type = "memory";
                reg = <0x0 0x0 0x0 0x5e00000 0x0 0x5f00000 0x0 0x1000
0x0 0x5f02000 0x0 0xefd000 0x0 0x6e00000 0x0 0x60f000 0x0 0x7410000
0x0 0x1aaf0000 0x0 0x21f00000 0x0 0x100000 0x0 0x22000000 0x0
0x1c000000>;
        };

        reserved-memory {
                ranges;
                #size-cells = <0x2>;
                #address-cells = <0x2>;

                ramoops@21f00000 {
                        ftrace-size = <0x20000>;
                        console-size = <0x20000>;
                        reg = <0x0 0x21f00000 0x0 0x100000>;
                        record-size = <0x20000>;
                        compatible = "ramoops";
                };

                linux,cma {
                        linux,cma-default;
                        reusable;
                        size = <0x0 0x8000000>;
                        compatible = "shared-dma-pool";
                };
        };

If you look at the REG -- it does now add up to 2Gb, but booting Xen
with it has exactly the
same effect as booting it with: reg = <0x0 0x0 0x0 0x80000000>;

I am attaching a full log, and I see the following in the logs:

(XEN) Allocating 1:1 mappings totalling 720MB for dom0:
(XEN) BANK[0] 0x00000008000000-0x0000001c000000 (320MB)
(XEN) BANK[1] 0x00000040000000-0x00000058000000 (384MB)
(XEN) BANK[2] 0x0000007b000000-0x0000007c000000 (16MB)

Which sort of makes sense, I guess -- but I still don't understand
where all these ranges
are coming from and how come Xen doesn't see the full 2Gb even with various
devicetrees I tried.

Any ideas here would be greatly apprecaited!

Thanks,
Roman.

P.S. Any guess at what these mean?

(XEN) traps.c:1973:d0v0 HSR=0x93880006 pc=0x00ffff87355558
gva=0xffff872f2000 gpa=0x000000000f0000
(XEN) traps.c:1973:d0v0 HSR=0x93880006 pc=0x00ffffb734e558
gva=0xffffb72eb000 gpa=0x000000000f0000
(XEN) traps.c:1973:d0v0 HSR=0x93880006 pc=0x00ffff8f9d2558
gva=0xffff8f96f000 gpa=0x000000000f0000

--000000000000df973d0599ef3161
Content-Type: application/octet-stream; name="xen4.log"
Content-Disposition: attachment; filename="xen4.log"
Content-Transfer-Encoding: base64
Content-ID: <f_k4aips5o0>
X-Attachment-Id: f_k4aips5o0

KFhFTikgQ2hlY2tpbmcgZm9yIGluaXRyZCBpbiAvY2hvc2VuCihYRU4pIFJBTTogMDAwMDAwMDAw
MDAwMDAwMCAtIDAwMDAwMDAwMDVkZmZmZmYKKFhFTikgUkFNOiAwMDAwMDAwMDA1ZjAwMDAwIC0g
MDAwMDAwMDAwNmRmZWZmZgooWEVOKSBSQU06IDAwMDAwMDAwMDZlMDAwMDAgLSAwMDAwMDAwMDA3
NDBlZmZmCihYRU4pIFJBTTogMDAwMDAwMDAwNzQxMDAwMCAtIDAwMDAwMDAwMWRiOGRmZmYKKFhF
TikgUkFNOiAwMDAwMDAwMDM1MGYwMDAwIC0gMDAwMDAwMDAzZGJkMmZmZgooWEVOKSBSQU06IDAw
MDAwMDAwM2RiZDMwMDAgLSAwMDAwMDAwMDNkZmZmZmZmCihYRU4pIFJBTTogMDAwMDAwMDA0MDAw
MDAwMCAtIDAwMDAwMDAwNWE2NTNmZmYKKFhFTikgUkFNOiAwMDAwMDAwMDdhZGEwMDAwIC0gMDAw
MDAwMDA3YWRhM2ZmZgooWEVOKSBSQU06IDAwMDAwMDAwN2FlYTgwMDAgLSAwMDAwMDAwMDdhZmE5
ZmZmCihYRU4pIFJBTTogMDAwMDAwMDA3YWZhYTAwMCAtIDAwMDAwMDAwN2VjNzNmZmYKKFhFTikg
UkFNOiAwMDAwMDAwMDdlYzc0MDAwIC0gMDAwMDAwMDA3ZmRkZGZmZgooWEVOKSBSQU06IDAwMDAw
MDAwN2ZkZGUwMDAgLSAwMDAwMDAwMDdmZWE1ZmZmCihYRU4pIFJBTTogMDAwMDAwMDA3ZmVhNjAw
MCAtIDAwMDAwMDAwN2ZmNmRmZmYKKFhFTikgUkFNOiAwMDAwMDAwMDdmZmZmMDAwIC0gMDAwMDAw
MDA3ZmZmZmZmZgooWEVOKQooWEVOKSBNT0RVTEVbMF06IDAwMDAwMDAwNWE2NjAwMDAgLSAwMDAw
MDAwMDVhNzliOTAwIFhlbgooWEVOKSBNT0RVTEVbMV06IDAwMDAwMDAwNWE2NTQwMDAgLSAwMDAw
MDAwMDVhNjYwMDAwIERldmljZSBUcmVlCihYRU4pIE1PRFVMRVsyXTogMDAwMDAwMDA1YTdhNzAw
MCAtIDAwMDAwMDAwNWI5NWEyMDAgS2VybmVsCihYRU4pICBSRVNWRFswXTogMDAwMDAwMDAyMWYw
MDAwMCAtIDAwMDAwMDAwMjFmZmZmZmYKKFhFTikKKFhFTikgQ01ETElORVswMDAwMDAwMDVhN2E3
MDAwXTpjaG9zZW4gY29uc29sZT1odmMwIHJvb3Q9UEFSVFVVSUQ9ZjcxYmQ5ODctZDk5YS00Yzg4
LTk3ODEtY2Y0YzI2Y2FlNTVlIHJvb3RkZWxheT0zCihYRU4pCihYRU4pIENvbW1hbmQgbGluZTog
Y29uc29sZT1kdHVhcnQgZG9tMF9tZW09NzIwTSBkb20wX21heF92Y3B1cz0xIGRvbTBfdmNwdXNf
cGluCihYRU4pIERvbWFpbiBoZWFwIGluaXRpYWxpc2VkCihYRU4pIEJvb3RpbmcgdXNpbmcgRGV2
aWNlIFRyZWUKKFhFTikgUGxhdGZvcm06IEdlbmVyaWMgU3lzdGVtCihYRU4pIFRha2luZyBkdHVh
cnQgY29uZmlndXJhdGlvbiBmcm9tIC9jaG9zZW4vc3Rkb3V0LXBhdGgKKFhFTikgTG9va2luZyBm
b3IgZHR1YXJ0IGF0ICJzZXJpYWwzIiwgb3B0aW9ucyAiMTE1MjAwbjgiCihYRU4pIFdBUk5JTkc6
IFVBUlQgY29uZmlndXJhdGlvbiBpcyBub3Qgc3VwcG9ydGVkCiBYZW4gNC4xMy4wLXJjCihYRU4p
IFhlbiB2ZXJzaW9uIDQuMTMuMC1yYyAoQCkgKGdjYyAoQWxwaW5lIDYuNC4wKSA2LjQuMCkgZGVi
dWc9eSAgRnJpIERlYyAgNiAwNzoyOToxMCBVVEMgMjAxOQooWEVOKSBMYXRlc3QgQ2hhbmdlU2V0
OgooWEVOKSBidWlsZC1pZDogYmYyZTVkZGU4ZGY4MTk5MjMwYTFiMGEyNWZiOGYyMjBiZTM3MTRh
MAooWEVOKSBQcm9jZXNzb3I6IDQxMGZkMDMzOiAiQVJNIExpbWl0ZWQiLCB2YXJpYW50OiAweDAs
IHBhcnQgMHhkMDMsIHJldiAweDMKKFhFTikgNjQtYml0IEV4ZWN1dGlvbjoKKFhFTikgICBQcm9j
ZXNzb3IgRmVhdHVyZXM6IDAwMDAwMDAwMDAwMDIyMjIgMDAwMDAwMDAwMDAwMDAwMAooWEVOKSAg
ICAgRXhjZXB0aW9uIExldmVsczogRUwzOjY0KzMyIEVMMjo2NCszMiBFTDE6NjQrMzIgRUwwOjY0
KzMyCihYRU4pICAgICBFeHRlbnNpb25zOiBGbG9hdGluZ1BvaW50IEFkdmFuY2VkU0lNRAooWEVO
KSAgIERlYnVnIEZlYXR1cmVzOiAwMDAwMDAwMDEwMzA1MTA2IDAwMDAwMDAwMDAwMDAwMDAKKFhF
TikgICBBdXhpbGlhcnkgRmVhdHVyZXM6IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MAooWEVOKSAgIE1lbW9yeSBNb2RlbCBGZWF0dXJlczogMDAwMDAwMDAwMDAwMTEyMiAwMDAwMDAw
MDAwMDAwMDAwCihYRU4pICAgSVNBIEZlYXR1cmVzOiAgMDAwMDAwMDAwMDAxMTEyMCAwMDAwMDAw
MDAwMDAwMDAwCihYRU4pIDMyLWJpdCBFeGVjdXRpb246CihYRU4pICAgUHJvY2Vzc29yIEZlYXR1
cmVzOiAwMDAwMDEzMTowMDAxMTAxMQooWEVOKSAgICAgSW5zdHJ1Y3Rpb24gU2V0czogQUFyY2gz
MiBBMzIgVGh1bWIgVGh1bWItMiBKYXplbGxlCihYRU4pICAgICBFeHRlbnNpb25zOiBHZW5lcmlj
VGltZXIgU2VjdXJpdHkKKFhFTikgICBEZWJ1ZyBGZWF0dXJlczogMDMwMTAwNjYKKFhFTikgICBB
dXhpbGlhcnkgRmVhdHVyZXM6IDAwMDAwMDAwCihYRU4pICAgTWVtb3J5IE1vZGVsIEZlYXR1cmVz
OiAxMDEwMTEwNSA0MDAwMDAwMCAwMTI2MDAwMCAwMjEwMjIxMQooWEVOKSAgSVNBIEZlYXR1cmVz
OiAwMjEwMTExMCAxMzExMjExMSAyMTIzMjA0MiAwMTExMjEzMSAwMDAxMTE0MiAwMDAxMTEyMQoo
WEVOKSBVc2luZyBTTUMgQ2FsbGluZyBDb252ZW50aW9uIHYxLjAKKFhFTikgVXNpbmcgUFNDSSB2
MS4wCihYRU4pIFNNUDogQWxsb3dpbmcgOCBDUFVzCihYRU4pIEdlbmVyaWMgVGltZXIgSVJROiBw
aHlzPTMwIGh5cD0yNiB2aXJ0PTI3IEZyZXE6IDEyMDAgS0h6CihYRU4pIEdJQ3YyIGluaXRpYWxp
emF0aW9uOgooWEVOKSAgICAgICAgIGdpY19kaXN0X2FkZHI9MDAwMDAwMDBmNjgwMTAwMAooWEVO
KSAgICAgICAgIGdpY19jcHVfYWRkcj0wMDAwMDAwMGY2ODAyMDAwCihYRU4pICAgICAgICAgZ2lj
X2h5cF9hZGRyPTAwMDAwMDAwZjY4MDQwMDAKKFhFTikgICAgICAgICBnaWNfdmNwdV9hZGRyPTAw
MDAwMDAwZjY4MDYwMDAKKFhFTikgICAgICAgICBnaWNfbWFpbnRlbmFuY2VfaXJxPTI1CihYRU4p
IEdJQ3YyOiAxNjAgbGluZXMsIDggY3B1cywgc2VjdXJlIChJSUQgMDIwMDE0M2IpLgooWEVOKSBY
U00gRnJhbWV3b3JrIHYxLjAuMCBpbml0aWFsaXplZAooWEVOKSBJbml0aWFsaXNpbmcgWFNNIFNJ
TE8gbW9kZQooWEVOKSBVc2luZyBzY2hlZHVsZXI6IFNNUCBDcmVkaXQgU2NoZWR1bGVyIHJldjIg
KGNyZWRpdDIpCihYRU4pIEluaXRpYWxpemluZyBDcmVkaXQyIHNjaGVkdWxlcgooWEVOKSAgbG9h
ZF9wcmVjaXNpb25fc2hpZnQ6IDE4CihYRU4pICBsb2FkX3dpbmRvd19zaGlmdDogMzAKKFhFTikg
IHVuZGVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogMAooWEVOKSAgb3ZlcmxvYWRfYmFsYW5jZV90
b2xlcmFuY2U6IC0zCihYRU4pICBydW5xdWV1ZXMgYXJyYW5nZW1lbnQ6IHNvY2tldAooWEVOKSAg
Y2FwIGVuZm9yY2VtZW50IGdyYW51bGFyaXR5OiAxMG1zCihYRU4pIGxvYWQgdHJhY2tpbmcgd2lu
ZG93IGxlbmd0aCAxMDczNzQxODI0IG5zCihYRU4pIEFsbG9jYXRlZCBjb25zb2xlIHJpbmcgb2Yg
NjQgS2lCLgooWEVOKSBDUFUwOiBHdWVzdCBhdG9taWNzIHdpbGwgdHJ5IDggdGltZXMgYmVmb3Jl
IHBhdXNpbmcgdGhlIGRvbWFpbgooWEVOKSBCcmluZ2luZyB1cCBDUFUxCihYRU4pIENQVTE6IEd1
ZXN0IGF0b21pY3Mgd2lsbCB0cnkgMTcgdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhlIGRvbWFpbgoo
WEVOKSBDUFUgMSBib290ZWQuCihYRU4pIEJyaW5naW5nIHVwIENQVTIKKFhFTikgQ1BVMjogR3Vl
c3QgYXRvbWljcyB3aWxsIHRyeSAxMCB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihY
RU4pIENQVSAyIGJvb3RlZC4KKFhFTikgQnJpbmdpbmcgdXAgQ1BVMwooWEVOKSBDUFUzOiBHdWVz
dCBhdG9taWNzIHdpbGwgdHJ5IDIyIHRpbWVzIGJlZm9yZSBwYXVzaW5nIHRoZSBkb21haW4KKFhF
TikgQ1BVIDMgYm9vdGVkLgooWEVOKSBCcmluZ2luZyB1cCBDUFU0CihYRU4pIENQVTQ6IEd1ZXN0
IGF0b21pY3Mgd2lsbCB0cnkgMjIgdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhlIGRvbWFpbgooWEVO
KSBDUFUgNCBib290ZWQuCihYRU4pIEJyaW5naW5nIHVwIENQVTUKKFhFTikgQ1BVNTogR3Vlc3Qg
YXRvbWljcyB3aWxsIHRyeSAxMyB0aW1lcyBiZWZvcmUgcGF1c2luZyB0aGUgZG9tYWluCihYRU4p
IENQVSA1IGJvb3RlZC4KKFhFTikgQnJpbmdpbmcgdXAgQ1BVNgooWEVOKSBDUFU2OiBHdWVzdCBh
dG9taWNzIHdpbGwgdHJ5IDIwIHRpbWVzIGJlZm9yZSBwYXVzaW5nIHRoZSBkb21haW4KKFhFTikg
Q1BVIDYgYm9vdGVkLgooWEVOKSBCcmluZ2luZyB1cCBDUFU3CihYRU4pIENQVTc6IEd1ZXN0IGF0
b21pY3Mgd2lsbCB0cnkgMTIgdGltZXMgYmVmb3JlIHBhdXNpbmcgdGhlIGRvbWFpbgooWEVOKSBC
cm91Z2h0IHVwIDggQ1BVcwooWEVOKSBDUFUgNyBib290ZWQuCihYRU4pIEkvTyB2aXJ0dWFsaXNh
dGlvbiBkaXNhYmxlZAooWEVOKSBQMk06IDQwLWJpdCBJUEEgd2l0aCA0MC1iaXQgUEEgYW5kIDgt
Yml0IFZNSUQKKFhFTikgUDJNOiAzIGxldmVscyB3aXRoIG9yZGVyLTEgcm9vdCwgVlRDUiAweDgw
MDIzNTU4CihYRU4pIEFkZGluZyBjcHUgMCB0byBydW5xdWV1ZSAwCihYRU4pICBGaXJzdCBjcHUg
b24gcnVucXVldWUsIGFjdGl2YXRpbmcKKFhFTikgQWRkaW5nIGNwdSAxIHRvIHJ1bnF1ZXVlIDAK
KFhFTikgQWRkaW5nIGNwdSAyIHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSAzIHRvIHJ1
bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA0IHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNw
dSA1IHRvIHJ1bnF1ZXVlIDAKKFhFTikgQWRkaW5nIGNwdSA2IHRvIHJ1bnF1ZXVlIDAKKFhFTikg
QWRkaW5nIGNwdSA3IHRvIHJ1bnF1ZXVlIDAKKFhFTikgYWx0ZXJuYXRpdmVzOiBQYXRjaGluZyB3
aXRoIGFsdCB0YWJsZSAwMDAwMDAwMDAwMmNjMDY4IC0+IDAwMDAwMDAwMDAyY2M3N2MKKFhFTikg
KioqIExPQURJTkcgRE9NQUlOIDAgKioqCihYRU4pIExvYWRpbmcgZDAga2VybmVsIGZyb20gYm9v
dCBtb2R1bGUgQCAwMDAwMDAwMDVhN2E3MDAwCihYRU4pIEFsbG9jYXRpbmcgMToxIG1hcHBpbmdz
IHRvdGFsbGluZyA3MjBNQiBmb3IgZG9tMDoKKFhFTikgQkFOS1swXSAweDAwMDAwMDA4MDAwMDAw
LTB4MDAwMDAwMWMwMDAwMDAgKDMyME1CKQooWEVOKSBCQU5LWzFdIDB4MDAwMDAwNDAwMDAwMDAt
MHgwMDAwMDA1ODAwMDAwMCAoMzg0TUIpCihYRU4pIEJBTktbMl0gMHgwMDAwMDA3YjAwMDAwMC0w
eDAwMDAwMDdjMDAwMDAwICgxNk1CKQooWEVOKSBHcmFudCB0YWJsZSByYW5nZTogMHgwMDAwMDA1
YTY2MDAwMC0weDAwMDAwMDVhNmEwMDAwCihYRU4pIEFsbG9jYXRpbmcgUFBJIDE2IGZvciBldmVu
dCBjaGFubmVsIGludGVycnVwdAooWEVOKSBMb2FkaW5nIHpJbWFnZSBmcm9tIDAwMDAwMDAwNWE3
YTcwMDAgdG8gMDAwMDAwMDAwODA4MDAwMC0wMDAwMDAwMDA5MjMzMjAwCihYRU4pIExvYWRpbmcg
ZDAgRFRCIHRvIDB4MDAwMDAwMDAxMDAwMDAwMC0weDAwMDAwMDAwMTAwMDhiNjkKKFhFTikgSW5p
dGlhbCBsb3cgbWVtb3J5IHZpcnEgdGhyZXNob2xkIHNldCBhdCAweDQwMDAgcGFnZXMuCihYRU4p
IFNjcnViYmluZyBGcmVlIFJBTSBpbiBiYWNrZ3JvdW5kCihYRU4pIFN0ZC4gTG9nbGV2ZWw6IEFs
bAooWEVOKSBHdWVzdCBMb2dsZXZlbDogQWxsCihYRU4pICoqKiBTZXJpYWwgaW5wdXQgdG8gRE9N
MCAodHlwZSAnQ1RSTC1hJyB0aHJlZSB0aW1lcyB0byBzd2l0Y2ggaW5wdXQpCihYRU4pIEZyZWVk
IDM0NGtCIGluaXQgbWVtb3J5LgooWEVOKSBkMHYwOiB2R0lDRDogdW5oYW5kbGVkIHdvcmQgd3Jp
dGUgMHgwMDAwMDBmZmZmZmZmZiB0byBJQ0FDVElWRVI0CihYRU4pIGQwdjA6IHZHSUNEOiB1bmhh
bmRsZWQgd29yZCB3cml0ZSAweDAwMDAwMGZmZmZmZmZmIHRvIElDQUNUSVZFUjgKKFhFTikgZDB2
MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8gSUNBQ1RJ
VkVSMTIKKFhFTikgZDB2MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3JkIHdyaXRlIDB4MDAwMDAwZmZm
ZmZmZmYgdG8gSUNBQ1RJVkVSMTYKKFhFTikgZDB2MDogdkdJQ0Q6IHVuaGFuZGxlZCB3b3JkIHdy
aXRlIDB4MDAwMDAwZmZmZmZmZmYgdG8gSUNBQ1RJVkVSMAooWEVOKSBkMHYwIFVuaGFuZGxlZCBT
TUMvSFZDOiAweGJmMDBmZjAxCihYRU4pIHRyYXBzLmM6MTk3MzpkMHYwIEhTUj0weDkzODgwMDA2
IHBjPTB4MDBmZmZmODczNTU1NTggZ3ZhPTB4ZmZmZjg3MmYyMDAwIGdwYT0weDAwMDAwMDAwMGYw
MDAwCihYRU4pIHRyYXBzLmM6MTk3MzpkMHYwIEhTUj0weDkzODgwMDA2IHBjPTB4MDBmZmZmYjcz
NGU1NTggZ3ZhPTB4ZmZmZmI3MmViMDAwIGdwYT0weDAwMDAwMDAwMGYwMDAwCihYRU4pIHRyYXBz
LmM6MTk3MzpkMHYwIEhTUj0weDkzODgwMDA2IHBjPTB4MDBmZmZmOGY5ZDI1NTggZ3ZhPTB4ZmZm
ZjhmOTZmMDAwIGdwYT0weDAwMDAwMDAwMGYwMDAwCg==
--000000000000df973d0599ef3161
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--000000000000df973d0599ef3161--

