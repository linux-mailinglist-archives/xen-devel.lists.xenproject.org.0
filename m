Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1A123DA1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 04:00:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihPWA-0004gk-Ci; Wed, 18 Dec 2019 02:56:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hOUS=2I=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1ihPW9-0004gf-1F
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 02:56:53 +0000
X-Inumbo-ID: 0aab66a8-2142-11ea-88e7-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aab66a8-2142-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 02:56:51 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id t6so189901qvs.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 18:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xvjOHrC9J6UpxyXdr5mUmNZlGvdDR2p970nANfryq88=;
 b=LmXx6PFDbuRcNE2KvTWrDxMduHz7Qaq1CgYKhmKuPe7e92p6ctz7WkemEmd58De22t
 tGkR2dmsJIQcAW6Hx8EXt7W+H1cok5rq/KCN8TWexqaElV/Koof+2gxhdgEhu+TIOxMd
 ISaGwQSFyrZMzaLGjOpCL2oe+4kdlxaV4/CBHgd4ECRU4iQAdsxzeVSAjEF2Ca+MZaFB
 jkmJ/80L9LGD5JaZTJF1z1D/uM6iksqHkVrKYA5wwUH5dDaH3aVfy/GtDCAd/XwgPXVQ
 lvFdiHUdjg6uCbZx4FE2ef/eGiJ+Avicq1eMi77/QMjZZZawTNrZkG1E8V8Q5FlixqFu
 paUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xvjOHrC9J6UpxyXdr5mUmNZlGvdDR2p970nANfryq88=;
 b=Cs5cZs+qc/kQBCFZ4cS3w40Hi6Odbu3m3iBj7FrQLkPELHb00rmXQb6aRLqJcRtyKx
 AJPoEquf8PSxMpTpNq18nLJTsbI4UjpX1aGI8B5eR4qygcC297SV5Jmnrh6tAFqiUgVn
 haKC3r5sm9jGfd0gnKYRTCkgiW+YEZp0VM4drkBVonAhkySgTkinqql4xPLMJAwdLmAR
 9V8sYCm+LGthNc0j/M91HQI7mcQdYbeo+xhRgxHWJQ5NCKpYHK0RwkUkMlMyC+dqsoiQ
 wt5iS94ie7Ew1SO1uDWWnaY8FSLtbPGL9RagxZBmt6I0xkZM+MFDUSrIfk9zAlUcmMvX
 IrSw==
X-Gm-Message-State: APjAAAXeNTbPVDgFGXQQhFypTknOtVTW0U9gDHYzD7DEf398yDRC/2zL
 h562N3m4mUqDcEA5/GLT7wpzeexlct0FNi5pInkp0g==
X-Google-Smtp-Source: APXvYqwf0jbwgM6uSpDj9Z3Vti7GNKYB1MBgjT3G/v4QlU9kR1AQ47sk8YkpaeHe/6c32FLCFrKBqb2ogfvV6hCBeX0=
X-Received: by 2002:ad4:498d:: with SMTP id t13mr301560qvx.58.1576637811371;
 Tue, 17 Dec 2019 18:56:51 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 17 Dec 2019 18:56:40 -0800
Message-ID: <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000b04b970599f198d1"
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

--000000000000b04b970599f198d1
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 17, 2019 at 5:51 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 17 Dec 2019, Roman Shaposhnik wrote:
> > On Tue, Dec 17, 2019 at 11:26 AM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > On Tue, 17 Dec 2019, Roman Shaposhnik wrote:
> > > > On Tue, Dec 17, 2019 at 10:30 AM Stefano Stabellini
> > > > <sstabellini@kernel.org> wrote:
> > > > >
> > > > > On Tue, 17 Dec 2019, Julien Grall wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On 17/12/2019 04:39, Roman Shaposhnik wrote:
> > > > > > > On Mon, Dec 16, 2019 at 6:55 PM Stefano Stabellini
> > > > > > > <sstabellini@kernel.org> wrote:
> > > > > > > > On Mon, 16 Dec 2019, Roman Shaposhnik wrote:
> > > > > > > > If I sum all the memory sizes together I get 0x3ddfd000 which is 990M.
> > > > > > > > If so, I wonder how you could boot succesfully with dom0_mem=1024M even
> > > > > > > > on Xen 4.12... :-?
> > > > > > >
> > > > > > > That is a very interesting observation indeed! I actually don't
> > > > > > > remember where that device tree came from, but I think it was from one
> > > > > > > of the Linaro sites.
> > > > > >
> > > > > > This is mostly likely because of:
> > > > > >
> > > > > > commit 6341a674573f1834f083f0ab0f5b36b075f9e02e
> > > > > > Author: Julien Grall <julien.grall@arm.com>
> > > > > > Date:   Wed Aug 21 22:42:31 2019 +0100
> > > > > >
> > > > > >     xen/arm: domain_build: Don't continue if unable to allocate all dom0 banks
> > > > > >
> > > > > >     Xen will only print a warning if there are memory unallocated when using
> > > > > >     1:1 mapping (only used by dom0). This also includes the case where no
> > > > > >     memory has been allocated.
> > > > > >
> > > > > >     It will bring to all sort of issues that can be hard to diagnostic for
> > > > > >     users (the warning can be difficult to spot or disregard).
> > > > > >
> > > > > >     If the users request 1GB of memory, then most likely they want the exact
> > > > > >     amount and not 512MB. So panic if all the memory has not been allocated.
> > > > > >
> > > > > >     After this change, the behavior is the same as for non-1:1 memory
> > > > > >     allocation (used by domU).
> > > > > >
> > > > > >     At the same time, reflow the message to have the format on a single
> > > > > >     line.
> > > > > >
> > > > > >     Signed-off-by: Julien Grall <julien.grall@arm.com>
> > > > > >     Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > > > >
> > > > > Ah! Roman, could you please post the full boot log of a successful 4.12
> > > > > boot?
> > > > >
> > > > > If it has a "Failed to allocate requested dom0 memory" message, then we
> > > > > know what the issue is.
> > > >
> > > > Aha! Our messages seems to have crossed ;-) Full log is attached and
> > > > yes -- that's
> > > > the problem indeed.
> > > >
> > > > So at least that mystery is solved. But I'm still not able to get to a
> > > > full 1G of memory
> > > > even with your update to the device tree file. Any chance you can send me the
> > > > device tree file that works for you?
> > >
> > > I didn't try on real hardware, I only tried on QEMU with a similar
> > > configuration. I went back and check the HiKey device tree I used and it
> > > is the same as yours (including the ramoops reserved-memory error).
> > >
> > > Apparently there are 1G and 2G variants of the HiKey, obviously both
> > > yours and my device tree are for the 1G variant. I try to dig through
> > > the docs but couldn't find the details of the 2G variant. I cannot find
> > > anywhere the memory range for the top 1G of memory not even on the
> > > LeMaker docs! :-/
> >
> > Yup. That's exactly the issue on my end as well - can't seem to find an
> > authoritative source for that devicetree.
> >
> > I did find this, though:
> >      https://releases.linaro.org/96boards/hikey/linaro/debian/15.11/
> > which looks like it has the latest (at least file timestamp-wise) devicetree.
> >
> > If you look at the memory and reserved memory nodes there, they
> > are actually much simpler than what we've got:
> >
> >         memory {
> >                 device_type = "memory";
> >                 reg = <0x0 0x0 0x0 0x40000000>;
> >         };
>
> Which is still 1G, but it is surprisingly simpler.
>
>
> >         reserved-memory {
> >                 #address-cells = <0x2>;
> >                 #size-cells = <0x2>;
> >                 ranges;
> >
> >                 mcu-buf@05e00000 {
> >                         no-map;
> >                         reg = <0x0 0x5e00000 0x0 0x100000 0x0
> > 0x740f000 0x0 0x1000>;
> >                 };
> >
> >                 mbox-buf@06dff000 {
> >                         no-map;
> >                         reg = <0x0 0x6dff000 0x0 0x1000>;
> >                 };
> >         };
> >
> > So -- just on a whim -- I changed it to:
> >     reg = <0x0 0x0 0x0 0x80000000>;
>
> I would have tried that too :-)
>
>
> > Interestingly enough, Xen booted, and complained about only 192MB
> > unallocated this time.
> > So, I dropped the size of Dom0 to 640M and I got it boot and here's
> > what I'm seeing as
> > an output of xl info:
> >    total_memory           : 1120
> >    free_memory            : 390
> > It still nowhere close to 2G.
> >
> > Then I booted the Linux kernel without Xen and it correctly identified
> > all 2G worth of RAM, and in fact,
>
> Good! We can work with that.

So that is, in fact, my first question -- why is Xen not showing
available memory in xl info?

> > when I converted /sys/firmware/devicetree/base back into dts, here's
> > what I've got:
> >
> >         memory {
> >                 device_type = "memory";
> >                 reg = <0x0 0x0 0x0 0x5e00000 0x0 0x5f00000 0x0 0x1000
> > 0x0 0x5f02000 0x0 0xefd000 0x0 0x6e00000 0x0 0x60f000 0x0 0x7410000
> > 0x0 0x1aaf0000 0x0 0x21f00000 0x0 0x100000 0x0 0x22000000 0x0
> > 0x1c000000>;
> >         };
> >
> >         reserved-memory {
> >                 ranges;
> >                 #size-cells = <0x2>;
> >                 #address-cells = <0x2>;
> >
> >                 ramoops@21f00000 {
> >                         ftrace-size = <0x20000>;
> >                         console-size = <0x20000>;
> >                         reg = <0x0 0x21f00000 0x0 0x100000>;
> >                         record-size = <0x20000>;
> >                         compatible = "ramoops";
> >                 };
> >
> >                 linux,cma {
> >                         linux,cma-default;
> >                         reusable;
> >                         size = <0x0 0x8000000>;
> >                         compatible = "shared-dma-pool";
> >                 };
> >         };
> >
> > If you look at the REG -- it does now add up to 2Gb,
>
> I am a bit confused by this. I did the calculation twice and it is still
> only 990MB. In fact, what you pasted here really looks like the old
> device tree. Is it possible that you run the test with the old device
> tree?

There's something weird going on when it comes to Linux on this
box. Basically, it seems that regardless of what devicetree I pass,
Linux kernel seems to successfully discover all of 2G of memory.

For example, I'm attaching a Linux boot log that clearly shows:
   Memory: 1877336K/2062392K available
Even though I double checked that devicetree is only advertising 1G.

But see below for more on this:

> > but booting Xen
> > with it has exactly theo
> > same effect as booting it with: reg = <0x0 0x0 0x0 0x80000000>;
> >
> > I am attaching a full log, and I see the following in the logs:
> >
> > (XEN) Allocating 1:1 mappings totalling 720MB for dom0:
> > (XEN) BANK[0] 0x00000008000000-0x0000001c000000 (320MB)
> > (XEN) BANK[1] 0x00000040000000-0x00000058000000 (384MB)
> > (XEN) BANK[2] 0x0000007b000000-0x0000007c000000 (16MB)
> >
> > Which sort of makes sense, I guess -- but I still don't understand
> > where all these ranges
> > are coming from and how come Xen doesn't see the full 2Gb even with various
> > devicetrees I tried.
> >
> > Any ideas here would be greatly apprecaited!
>
> I think you might have run the test with the old device tree by mistake?
> If you are sure that Linux can boot OK with memory as:
>
>   reg = <0x0 0x0 0x0 0x80000000>;
>
> and correctly sees 2GB, then it should work with Xen too.

Well, that's the issue -- it seems that Linux somehow doesn't depend *at all*
on what I put in devicetrees -- it always detects full 2G.

> In fact, looking at the logs you pasted, the choice of memory for dom0:
>
>   0x40000000-0x58000000
>   0x7b000000-0x7c000000
>
> means that Xen was succesfully able to see the RAM above 0x40000000!
> So, it looked like it already worked some extent!

Exactly! That's the other surprising bit -- I noticed that too -- its not like
Xen doesn't see any of the memory above 1G -- it just doesn't see enough of it.

So the question is -- what is Linux doing that Xen doesn't?

Thanks,
Roman.

--000000000000b04b970599f198d1
Content-Type: application/octet-stream; name="linux.log"
Content-Disposition: attachment; filename="linux.log"
Content-Transfer-Encoding: base64
Content-ID: <f_k4apdjhy0>
X-Attachment-Id: f_k4apdjhy0

WyAgICAwLjAwMDAwMF0gQm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwMDAwMDAwMDAw
IFsweDQxMGZkMDMzXQpbICAgIDAuMDAwMDAwXSBMaW51eCB2ZXJzaW9uIDQuMTkuNSAocm9vdEAz
NTA4NDVhZTUzMzUpIChnY2MgdmVyc2lvbiA2LjMuMCAoQWxwaW5lIDYuMy4wKSkgIzEgU01QIFBS
RUVNUFQgU2F0IFNlcCA3IDA2OjMwOjU2IFVUQyAyMDE5ClsgICAgMC4wMDAwMDBdIE1hY2hpbmUg
bW9kZWw6IEhpS2V5IERldmVsb3BtZW50IEJvYXJkClsgICAgMC4wMDAwMDBdIGVmaTogR2V0dGlu
ZyBFRkkgcGFyYW1ldGVycyBmcm9tIEZEVDoKWyAgICAwLjAwMDAwMF0gZWZpOiBFRkkgdjIuNDAg
YnkgTGluYXJvIEhpS2V5IEVGSSBOb3YgMjggMjAxNSAxMDo1MDowNwpbICAgIDAuMDAwMDAwXSBl
Zmk6ClsgICAgMC4wMDAwMDBdIFJlc2VydmVkIG1lbW9yeTogY3JlYXRlZCBDTUEgbWVtb3J5IHBv
b2wgYXQgMHgwMDAwMDAwMDcyYzAwMDAwLCBzaXplIDEyOCBNaUIKWyAgICAwLjAwMDAwMF0gT0Y6
IHJlc2VydmVkIG1lbTogaW5pdGlhbGl6ZWQgbm9kZSBsaW51eCxjbWEsIGNvbXBhdGlibGUgaWQg
c2hhcmVkLWRtYS1wb29sClsgICAgMC4wMDAwMDBdIE5VTUE6IE5vIE5VTUEgY29uZmlndXJhdGlv
biBmb3VuZApbICAgIDAuMDAwMDAwXSBOVU1BOiBGYWtpbmcgYSBub2RlIGF0IFttZW0gMHgwMDAw
MDAwMDAwMDAwMDAwLTB4MDAwMDAwMDA3ZmZmZmZmZl0KWyAgICAwLjAwMDAwMF0gTlVNQTogTk9E
RV9EQVRBIFttZW0gMHg3ZmYyODY4MC0weDdmZjI5ZTNmXQpbICAgIDAuMDAwMDAwXSBab25lIHJh
bmdlczoKWyAgICAwLjAwMDAwMF0gICBETUEzMiAgICBbbWVtIDB4MDAwMDAwMDAwMDAwMDAwMC0w
eDAwMDAwMDAwN2ZmZmZmZmZdClsgICAgMC4wMDAwMDBdICAgTm9ybWFsICAgZW1wdHkKWyAgICAw
LjAwMDAwMF0gTW92YWJsZSB6b25lIHN0YXJ0IGZvciBlYWNoIG5vZGUKWyAgICAwLjAwMDAwMF0g
RWFybHkgbWVtb3J5IG5vZGUgcmFuZ2VzClsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0g
MHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDAwNWRmZmZmZl0KWyAgICAwLjAwMDAwMF0gICBu
b2RlICAgMDogW21lbSAweDAwMDAwMDAwMDVmMDAwMDAtMHgwMDAwMDAwMDA2ZGZlZmZmXQpbICAg
IDAuMDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDAwNmUwMDAwMC0weDAwMDAwMDAw
MDc0MGVmZmZdClsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDA3NDEw
MDAwLTB4MDAwMDAwMDAzNGZmZmZmZl0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAw
eDAwMDAwMDAwMzUwZjAwMDAtMHgwMDAwMDAwMDNkZmZmZmZmXQpbICAgIDAuMDAwMDAwXSAgIG5v
ZGUgICAwOiBbbWVtIDB4MDAwMDAwMDA0MDAwMDAwMC0weDAwMDAwMDAwN2ZmNmRmZmZdClsgICAg
MC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDdmZjZlMDAwLTB4MDAwMDAwMDA3
ZmZmZWZmZl0KWyAgICAwLjAwMDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwN2ZmZmYw
MDAtMHgwMDAwMDAwMDdmZmZmZmZmXQpbICAgIDAuMDAwMDAwXSBJbml0bWVtIHNldHVwIG5vZGUg
MCBbbWVtIDB4MDAwMDAwMDAwMDAwMDAwMC0weDAwMDAwMDAwN2ZmZmZmZmZdClsgICAgMC4wMDAw
MDBdIE9uIG5vZGUgMCB0b3RhbHBhZ2VzOiA1MTU1OTgKWyAgICAwLjAwMDAwMF0gICBETUEzMiB6
b25lOiA4MTkyIHBhZ2VzIHVzZWQgZm9yIG1lbW1hcApbICAgIDAuMDAwMDAwXSAgIERNQTMyIHpv
bmU6IDAgcGFnZXMgcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gICBETUEzMiB6b25lOiA1MTU1OTgg
cGFnZXMsIExJRk8gYmF0Y2g6NjMKWyAgICAwLjAwMDAwMF0gcHNjaTogcHJvYmluZyBmb3IgY29u
ZHVpdCBtZXRob2QgZnJvbSBEVC4KWyAgICAwLjAwMDAwMF0gcHNjaTogUFNDSXYxLjAgZGV0ZWN0
ZWQgaW4gZmlybXdhcmUuClsgICAgMC4wMDAwMDBdIHBzY2k6IFVzaW5nIHN0YW5kYXJkIFBTQ0kg
djAuMiBmdW5jdGlvbiBJRHMKWyAgICAwLjAwMDAwMF0gcHNjaTogVHJ1c3RlZCBPUyBtaWdyYXRp
b24gbm90IHJlcXVpcmVkClsgICAgMC4wMDAwMDBdIHBzY2k6IFNNQyBDYWxsaW5nIENvbnZlbnRp
b24gdjEuMApbICAgIDAuMDAwMDAwXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZy
b20gc3RhcnRfa2VybmVsKzB4YWMvMHg0MTQgd2l0aCBjcm5nX2luaXQ9MApbICAgIDAuMDAwMDAw
XSBwZXJjcHU6IEVtYmVkZGVkIDIzIHBhZ2VzL2NwdSBAKF9fX19wdHJ2YWxfX19fKSBzNTY2NjQg
cjgxOTIgZDI5MzUyIHU5NDIwOApbICAgIDAuMDAwMDAwXSBwY3B1LWFsbG9jOiBzNTY2NjQgcjgx
OTIgZDI5MzUyIHU5NDIwOCBhbGxvYz0yMyo0MDk2ClsgICAgMC4wMDAwMDBdIHBjcHUtYWxsb2M6
IFswXSAwIFswXSAxIFswXSAyIFswXSAzIFswXSA0IFswXSA1IFswXSA2IFswXSA3ClsgICAgMC4w
MDAwMDBdIERldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUwClsgICAgMC4wMDAwMDBdIENQVSBm
ZWF0dXJlczogZW5hYmxpbmcgd29ya2Fyb3VuZCBmb3IgQVJNIGVycmF0dW0gODQzNDE5ClsgICAg
MC4wMDAwMDBdIENQVSBmZWF0dXJlczogZW5hYmxpbmcgd29ya2Fyb3VuZCBmb3IgQVJNIGVycmF0
dW0gODQ1NzE5ClsgICAgMC4wMDAwMDBdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IEtlcm5lbCBw
YWdlIHRhYmxlIGlzb2xhdGlvbiAoS1BUSSkKWyAgICAwLjAwMDAwMF0gQnVpbHQgMSB6b25lbGlz
dHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDUwNzQwNgpbICAgIDAuMDAw
MDAwXSBQb2xpY3kgem9uZTogRE1BMzIKWyAgICAwLjAwMDAwMF0gS2VybmVsIGNvbW1hbmQgbGlu
ZTogQk9PVF9JTUFHRT0vYm9vdC9rZXJuZWwgY29uc29sZT10dHlBTUEwIGNvbnNvbGU9dHR5QU1B
MSBjb25zb2xlPXR0eUFNQTIgY29uc29sZT10dHlBTUEzIHJvb3Q9UEFSVFVVSUQ9ZjcxYmQ5ODct
ZDk5YS00Yzg4LTk3ODEtY2Y0YzI2Y2FlNTVlIHJvb3RkZWxheT0zClsgICAgMC4wMDAwMDBdIE1l
bW9yeTogMTg3NzMzNksvMjA2MjM5MksgYXZhaWxhYmxlICgxMDEwOEsga2VybmVsIGNvZGUsIDE2
NzZLIHJ3ZGF0YSwgNTAxNksgcm9kYXRhLCAxMjgwSyBpbml0LCAzNzZLIGJzcywgNTM5ODRLIHJl
c2VydmVkLCAxMzEwNzJLIGNtYS1yZXNlcnZlZCkKWyAgICAwLjAwMDAwMF0gU0xVQjogSFdhbGln
bj02NCwgT3JkZXI9MC0zLCBNaW5PYmplY3RzPTAsIENQVXM9OCwgTm9kZXM9MQpbICAgIDAuMDAw
MDAwXSByY3U6IFByZWVtcHRpYmxlIGhpZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24uClsg
ICAgMC4wMDAwMDBdIHJjdTogCVJDVSByZXN0cmljdGluZyBDUFVzIGZyb20gTlJfQ1BVUz02NCB0
byBucl9jcHVfaWRzPTguClsgICAgMC4wMDAwMDBdIAlUYXNrcyBSQ1UgZW5hYmxlZC4KWyAgICAw
LjAwMDAwMF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwg
bnJfY3B1X2lkcz04ClsgICAgMC4wMDAwMDBdIE5SX0lSUVM6IDY0LCBucl9pcnFzOiA2NCwgcHJl
YWxsb2NhdGVkIGlycXM6IDAKWyAgICAwLjAwMDAwMF0gR0lDOiBVc2luZyBzcGxpdCBFT0kvRGVh
Y3RpdmF0ZSBtb2RlClsgICAgMC4wMDAwMDBdIGNsb2Nrc291cmNlOiBhcm0sc3A4MDQ6IG1hc2s6
IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDk5NTQ0ODE0
OTIwIG5zClsgICAgMC4wMDAwMDVdIHNjaGVkX2Nsb2NrOiAzMiBiaXRzIGF0IDE5TUh6LCByZXNv
bHV0aW9uIDUybnMsIHdyYXBzIGV2ZXJ5IDExMTg0ODEwNjk4MW5zClsgICAgMC4wMDAzNjVdIGFy
Y2hfdGltZXI6IGNwMTUgdGltZXIocykgcnVubmluZyBhdCAxLjIwTUh6IChwaHlzKS4KWyAgICAw
LjAwMDM3M10gY2xvY2tzb3VyY2U6IGFyY2hfc3lzX2NvdW50ZXI6IG1hc2s6IDB4ZmZmZmZmZmZm
ZmZmZmYgbWF4X2N5Y2xlczogMHgxMWI2NjFmOGUsIG1heF9pZGxlX25zOiAxNzYzMTgwODA5MTEz
IG5zClsgICAgMC4wMDA1ODldIENvbnNvbGU6IGNvbG91ciBkdW1teSBkZXZpY2UgODB4MjUKWyAg
ICAwLjAwMDY2Nl0gQ2FsaWJyYXRpbmcgZGVsYXkgbG9vcCAoc2tpcHBlZCksIHZhbHVlIGNhbGN1
bGF0ZWQgdXNpbmcgdGltZXIgZnJlcXVlbmN5Li4gMi40MCBCb2dvTUlQUyAobHBqPTQ4MDApClsg
ICAgMC4wMDA2NzZdIHBpZF9tYXg6IGRlZmF1bHQ6IDMyNzY4IG1pbmltdW06IDMwMQpbICAgIDAu
MDAwNzQzXSBTZWN1cml0eSBGcmFtZXdvcmsgaW5pdGlhbGl6ZWQKWyAgICAwLjAwMTM5N10gRGVu
dHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMjYyMTQ0IChvcmRlcjogOSwgMjA5NzE1MiBi
eXRlcykKWyAgICAwLjAwMTcyNF0gSW5vZGUtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMzEw
NzIgKG9yZGVyOiA4LCAxMDQ4NTc2IGJ5dGVzKQpbICAgIDAuMDAxNzU5XSBNb3VudC1jYWNoZSBo
YXNoIHRhYmxlIGVudHJpZXM6IDQwOTYgKG9yZGVyOiAzLCAzMjc2OCBieXRlcykKWyAgICAwLjAw
MTc3NV0gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDQwOTYgKG9yZGVyOiAz
LCAzMjc2OCBieXRlcykKWyAgICAwLjAyNDM3MV0gQVNJRCBhbGxvY2F0b3IgaW5pdGlhbGlzZWQg
d2l0aCAzMjc2OCBlbnRyaWVzClsgICAgMC4wMzIzNzBdIHJjdTogSGllcmFyY2hpY2FsIFNSQ1Ug
aW1wbGVtZW50YXRpb24uClsgICAgMC4wNDQ0OTldIFJlbWFwcGluZyBhbmQgZW5hYmxpbmcgRUZJ
IHNlcnZpY2VzLgpbICAgIDAuMDUyNDQ0XSBzbXA6IEJyaW5naW5nIHVwIHNlY29uZGFyeSBDUFVz
IC4uLgpbICAgIDAuMDg0NzM1XSBEZXRlY3RlZCBWSVBUIEktY2FjaGUgb24gQ1BVMQpbICAgIDAu
MDg0Nzg5XSBDUFUxOiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAweDAwMDAwMDAwMDEgWzB4
NDEwZmQwMzNdClsgICAgMC4xMTY4MjRdIERldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUyClsg
ICAgMC4xMTY4NzFdIENQVTI6IEJvb3RlZCBzZWNvbmRhcnkgcHJvY2Vzc29yIDB4MDAwMDAwMDEw
MyBbMHg0MTBmZDAzM10KWyAgICAwLjE0ODgyMF0gRGV0ZWN0ZWQgVklQVCBJLWNhY2hlIG9uIENQ
VTMKWyAgICAwLjE0ODg0NV0gQ1BVMzogQm9vdGVkIHNlY29uZGFyeSBwcm9jZXNzb3IgMHgwMDAw
MDAwMTAxIFsweDQxMGZkMDMzXQpbICAgIDAuMTgwODg0XSBEZXRlY3RlZCBWSVBUIEktY2FjaGUg
b24gQ1BVNApbICAgIDAuMTgwOTEzXSBDUFU0OiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAw
eDAwMDAwMDAwMDIgWzB4NDEwZmQwMzNdClsgICAgMC4yMTI5NjBdIERldGVjdGVkIFZJUFQgSS1j
YWNoZSBvbiBDUFU1ClsgICAgMC4yMTI5ODZdIENQVTU6IEJvb3RlZCBzZWNvbmRhcnkgcHJvY2Vz
c29yIDB4MDAwMDAwMDEwMiBbMHg0MTBmZDAzM10KWyAgICAwLjI0NTAyN10gRGV0ZWN0ZWQgVklQ
VCBJLWNhY2hlIG9uIENQVTYKWyAgICAwLjI0NTA1MV0gQ1BVNjogQm9vdGVkIHNlY29uZGFyeSBw
cm9jZXNzb3IgMHgwMDAwMDAwMTAwIFsweDQxMGZkMDMzXQpbICAgIDAuMjc3MDkxXSBEZXRlY3Rl
ZCBWSVBUIEktY2FjaGUgb24gQ1BVNwpbICAgIDAuMjc3MTE5XSBDUFU3OiBCb290ZWQgc2Vjb25k
YXJ5IHByb2Nlc3NvciAweDAwMDAwMDAwMDMgWzB4NDEwZmQwMzNdClsgICAgMC4yNzcxOTBdIHNt
cDogQnJvdWdodCB1cCAxIG5vZGUsIDggQ1BVcwpbICAgIDAuMjc3MjI1XSBTTVA6IFRvdGFsIG9m
IDggcHJvY2Vzc29ycyBhY3RpdmF0ZWQuClsgICAgMC4yNzcyMzJdIENQVSBmZWF0dXJlczogZGV0
ZWN0ZWQ6IDMyLWJpdCBFTDAgU3VwcG9ydApbICAgIDAuMjgxMzgzXSBDUFU6IEFsbCBDUFUocykg
c3RhcnRlZCBhdCBFTDIKWyAgICAwLjI4MTQyMl0gYWx0ZXJuYXRpdmVzOiBwYXRjaGluZyBrZXJu
ZWwgY29kZQpbICAgIDAuMjgyNjA1XSBkZXZ0bXBmczogaW5pdGlhbGl6ZWQKWyAgICAwLjI4ODMy
MV0gUmVnaXN0ZXJlZCBjcDE1X2JhcnJpZXIgZW11bGF0aW9uIGhhbmRsZXIKWyAgICAwLjI4ODMz
OF0gUmVnaXN0ZXJlZCBzZXRlbmQgZW11bGF0aW9uIGhhbmRsZXIKWyAgICAwLjI4ODY0M10gY2xv
Y2tzb3VyY2U6IGppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZm
ZiwgbWF4X2lkbGVfbnM6IDc2NDUwNDE3ODUxMDAwMDAgbnMKWyAgICAwLjI4ODcwMV0gZnV0ZXgg
aGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzKQpbICAgIDAu
MjkyMzU0XSBwaW5jdHJsIGNvcmU6IGluaXRpYWxpemVkIHBpbmN0cmwgc3Vic3lzdGVtClsgICAg
MC4yOTQxNzRdIERNSSBub3QgcHJlc2VudCBvciBpbnZhbGlkLgpbICAgIDAuMjk0NTQ4XSBORVQ6
IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE2ClsgICAgMC4yOTUwMDBdIGF1ZGl0OiBpbml0
aWFsaXppbmcgbmV0bGluayBzdWJzeXMgKGRpc2FibGVkKQpbICAgIDAuMjk1MTA2XSBhdWRpdDog
dHlwZT0yMDAwIGF1ZGl0KDAuMjkyOjEpOiBzdGF0ZT1pbml0aWFsaXplZCBhdWRpdF9lbmFibGVk
PTAgcmVzPTEKWyAgICAwLjI5NjY3MF0gY3B1aWRsZTogdXNpbmcgZ292ZXJub3IgbWVudQpbICAg
IDAuMjk3MDA1XSB2ZHNvOiAyIHBhZ2VzICgxIGNvZGUgQCAoX19fX3B0cnZhbF9fX18pLCAxIGRh
dGEgQCAoX19fX3B0cnZhbF9fX18pKQpbICAgIDAuMjk3MDE1XSBody1icmVha3BvaW50OiBmb3Vu
ZCA2IGJyZWFrcG9pbnQgYW5kIDQgd2F0Y2hwb2ludCByZWdpc3RlcnMuClsgICAgMC4zMDU5MDRd
IERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgcG9vbCBmb3IgYXRvbWljIGFsbG9jYXRpb25zClsg
ICAgMC4zMDczMTZdIFNlcmlhbDogQU1CQSBQTDAxMSBVQVJUIGRyaXZlcgpbICAgIDAuMzEwMTQx
XSBoaTYyMjAtbWJveCBmNzUxMDAwMC5tYWlsYm94OiBNYWlsYm94IGVuYWJsZWQKWyAgICAwLjMx
Njk1NV0gT0Y6IGFtYmFfZGV2aWNlX2FkZCgpIGZhaWxlZCAoLTE5KSBmb3IgL3NvYy91YXJ0QGY3
MTExMDAwClsgICAgMC4zMTgxNzldIGY4MDE1MDAwLnVhcnQ6IHR0eUFNQTAgYXQgTU1JTyAweGY4
MDE1MDAwIChpcnEgPSA0MSwgYmFzZV9iYXVkID0gMCkgaXMgYSBQTDAxMSByZXYyClsgICAgMC45
MTE2NTZdIGNvbnNvbGUgW3R0eUFNQTBdIGVuYWJsZWQKWyAgICAwLjkyNzM1N10gSHVnZVRMQiBy
ZWdpc3RlcmVkIDIuMDAgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsgICAg
MC45MzQ1MDVdIGNyeXB0ZDogbWF4X2NwdV9xbGVuIHNldCB0byAxMDAwClsgICAgMC45Mzk3MTld
IEFDUEk6IEludGVycHJldGVyIGRpc2FibGVkLgpbICAgIDAuOTQ1MTgyXSB2Z2FhcmI6IGxvYWRl
ZApbICAgIDAuOTQ4NDc0XSBTQ1NJIHN1YnN5c3RlbSBpbml0aWFsaXplZApbICAgIDAuOTUyNDgz
XSBsaWJhdGEgdmVyc2lvbiAzLjAwIGxvYWRlZC4KWyAgICAwLjk1MjgzN10gdXNiY29yZTogcmVn
aXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2JmcwpbICAgIDAuOTU4Mzg2XSB1c2Jjb3Jl
OiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGh1YgpbICAgIDAuOTYzNzk1XSB1c2Jj
b3JlOiByZWdpc3RlcmVkIG5ldyBkZXZpY2UgZHJpdmVyIHVzYgpbICAgIDAuOTY5ODg4XSBwcHNf
Y29yZTogTGludXhQUFMgQVBJIHZlci4gMSByZWdpc3RlcmVkClsgICAgMC45NzQ4NzZdIHBwc19j
b3JlOiBTb2Z0d2FyZSB2ZXIuIDUuMy42IC0gQ29weXJpZ2h0IDIwMDUtMjAwNyBSb2RvbGZvIEdp
b21ldHRpIDxnaW9tZXR0aUBsaW51eC5pdD4KWyAgICAwLjk4NDAzN10gUFRQIGNsb2NrIHN1cHBv
cnQgcmVnaXN0ZXJlZApbICAgIDAuOTg4MTA4XSBFREFDIE1DOiBWZXI6IDMuMC4wClsgICAgMC45
OTE1NzhdIFJlZ2lzdGVyZWQgZWZpdmFycyBvcGVyYXRpb25zClsgICAgMC45OTcyOThdIGNsb2Nr
c291cmNlOiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSBhcmNoX3N5c19jb3VudGVyClsgICAgMS4w
MDM1OThdIFZGUzogRGlzayBxdW90YXMgZHF1b3RfNi42LjAKWyAgICAxLjAwNzU3Nl0gVkZTOiBE
cXVvdC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMiAob3JkZXIgMCwgNDA5NiBieXRlcykK
WyAgICAxLjAxNDU5OV0gcG5wOiBQblAgQUNQSTogZGlzYWJsZWQKWyAgICAxLjAyNDQ5MF0gTkVU
OiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAyClsgICAgMS4wMjkzNTZdIHRjcF9saXN0ZW5f
cG9ydGFkZHJfaGFzaCBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAyLCAxNjM4NCBi
eXRlcykKWyAgICAxLjAzNzMxMV0gVENQIGVzdGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczog
MTYzODQgKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMpClsgICAgMS4wNDQ2ODddIFRDUCBiaW5kIGhh
c2ggdGFibGUgZW50cmllczogMTYzODQgKG9yZGVyOiA2LCAyNjIxNDQgYnl0ZXMpClsgICAgMS4w
NTE1MTddIFRDUDogSGFzaCB0YWJsZXMgY29uZmlndXJlZCAoZXN0YWJsaXNoZWQgMTYzODQgYmlu
ZCAxNjM4NCkKWyAgICAxLjA1ODE1N10gVURQIGhhc2ggdGFibGUgZW50cmllczogMTAyNCAob3Jk
ZXI6IDMsIDMyNzY4IGJ5dGVzKQpbICAgIDEuMDY0MjM0XSBVRFAtTGl0ZSBoYXNoIHRhYmxlIGVu
dHJpZXM6IDEwMjQgKG9yZGVyOiAzLCAzMjc2OCBieXRlcykKWyAgICAxLjA3MDg0M10gTkVUOiBS
ZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxClsgICAgMS4wNzUyMzddIFBDSTogQ0xTIDAgYnl0
ZXMsIGRlZmF1bHQgNjQKWyAgICAxLjA3NjE1Ml0ga3ZtIFsxXTogOC1iaXQgVk1JRApbICAgIDEu
MDgwMDUwXSBrdm0gWzFdOiB2Z2ljIGludGVycnVwdCBJUlExClsgICAgMS4wODQxODRdIGt2bSBb
MV06IEh5cCBtb2RlIGluaXRpYWxpemVkIHN1Y2Nlc3NmdWxseQpbICAgIDEuMDkyNzY5XSBJbml0
aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMS4wOTczODVdIHdvcmtpbmdzZXQ6
IHRpbWVzdGFtcF9iaXRzPTQ0IG1heF9vcmRlcj0xOSBidWNrZXRfb3JkZXI9MApbICAgIDEuMTA5
Njk2XSBzcXVhc2hmczogdmVyc2lvbiA0LjAgKDIwMDkvMDEvMzEpIFBoaWxsaXAgTG91Z2hlcgpb
ICAgIDEuMTE2MDQ5XSA5cDogSW5zdGFsbGluZyB2OWZzIDlwMjAwMCBmaWxlIHN5c3RlbSBzdXBw
b3J0ClsgICAgMS4xMjE2MjZdIHBzdG9yZTogdXNpbmcgZGVmbGF0ZSBjb21wcmVzc2lvbgpbICAg
IDEuMTI4NzgyXSBLZXkgdHlwZSBhc3ltbWV0cmljIHJlZ2lzdGVyZWQKWyAgICAxLjEzMjkwMF0g
QXN5bW1ldHJpYyBrZXkgcGFyc2VyICd4NTA5JyByZWdpc3RlcmVkClsgICAgMS4xMzc4MzhdIEJs
b2NrIGxheWVyIFNDU0kgZ2VuZXJpYyAoYnNnKSBkcml2ZXIgdmVyc2lvbiAwLjQgbG9hZGVkICht
YWpvciAyNDQpClsgICAgMS4xNDU0MDBdIGlvIHNjaGVkdWxlciBub29wIHJlZ2lzdGVyZWQKWyAg
ICAxLjE0OTMzMl0gaW8gc2NoZWR1bGVyIGRlYWRsaW5lIHJlZ2lzdGVyZWQKWyAgICAxLjE1Mzc0
OV0gaW8gc2NoZWR1bGVyIGNmcSByZWdpc3RlcmVkIChkZWZhdWx0KQpbICAgIDEuMTU4NDYzXSBp
byBzY2hlZHVsZXIgbXEtZGVhZGxpbmUgcmVnaXN0ZXJlZApbICAgIDEuMTYzMDA2XSBpbyBzY2hl
ZHVsZXIga3liZXIgcmVnaXN0ZXJlZApbICAgIDEuMTcwOTgyXSBwaW5jdHJsLXNpbmdsZSBmNzAx
MDAwMC5waW5tdXg6IDE1OSBwaW5zLCBzaXplIDYzNgpbICAgIDEuMTc3MjA2XSBwaW5jdHJsLXNp
bmdsZSBmODAwMTgwMC5waW5tdXg6IDMwIHBpbnMsIHNpemUgMTIwClsgICAgMS4xODMzODldIHBp
bmN0cmwtc2luZ2xlIGY3MDEwODAwLnBpbm11eDogMTYzIHBpbnMsIHNpemUgNjUyClsgICAgMS4x
OTE0MzldIHBsMDYxX2dwaW8gZjcwMmYwMDAuZ3BpbzogUEwwNjEgR1BJTyBjaGlwIEAweDAwMDAw
MDAwZjcwMmYwMDAgcmVnaXN0ZXJlZApbICAgIDEuMTk5NDYzXSBwbDA2MV9ncGlvIGY3MDJjMDAw
LmdwaW86IFBMMDYxIEdQSU8gY2hpcCBAMHgwMDAwMDAwMGY3MDJjMDAwIHJlZ2lzdGVyZWQKWyAg
ICAxLjIwNzQ3NV0gcGwwNjFfZ3BpbyBmNzAyOTAwMC5ncGlvOiBQTDA2MSBHUElPIGNoaXAgQDB4
MDAwMDAwMDBmNzAyOTAwMCByZWdpc3RlcmVkClsgICAgMS4yMTU0NjddIHBsMDYxX2dwaW8gZjcw
MjYwMDAuZ3BpbzogUEwwNjEgR1BJTyBjaGlwIEAweDAwMDAwMDAwZjcwMjYwMDAgcmVnaXN0ZXJl
ZApbICAgIDEuMjIzNDc0XSBwbDA2MV9ncGlvIGY3MDIzMDAwLmdwaW86IFBMMDYxIEdQSU8gY2hp
cCBAMHgwMDAwMDAwMGY3MDIzMDAwIHJlZ2lzdGVyZWQKWyAgICAxLjIzMTQ1Nl0gcGwwNjFfZ3Bp
byBmODAxMzAwMC5ncGlvOiBQTDA2MSBHUElPIGNoaXAgQDB4MDAwMDAwMDBmODAxMzAwMCByZWdp
c3RlcmVkClsgICAgMS4yMzk0NTNdIHBsMDYxX2dwaW8gZjcwMjAwMDAuZ3BpbzogUEwwNjEgR1BJ
TyBjaGlwIEAweDAwMDAwMDAwZjcwMjAwMDAgcmVnaXN0ZXJlZApbICAgIDEuMjQ3NDQ0XSBwbDA2
MV9ncGlvIGY3MDJlMDAwLmdwaW86IFBMMDYxIEdQSU8gY2hpcCBAMHgwMDAwMDAwMGY3MDJlMDAw
IHJlZ2lzdGVyZWQKWyAgICAxLjI1NTQ0OF0gcGwwNjFfZ3BpbyBmNzAyYjAwMC5ncGlvOiBQTDA2
MSBHUElPIGNoaXAgQDB4MDAwMDAwMDBmNzAyYjAwMCByZWdpc3RlcmVkClsgICAgMS4yNjM0Mzdd
IHBsMDYxX2dwaW8gZjcwMjgwMDAuZ3BpbzogUEwwNjEgR1BJTyBjaGlwIEAweDAwMDAwMDAwZjcw
MjgwMDAgcmVnaXN0ZXJlZApbICAgIDEuMjcxNDMzXSBwbDA2MV9ncGlvIGY3MDI1MDAwLmdwaW86
IFBMMDYxIEdQSU8gY2hpcCBAMHgwMDAwMDAwMGY3MDI1MDAwIHJlZ2lzdGVyZWQKWyAgICAxLjI3
OTQzNl0gcGwwNjFfZ3BpbyBmNzAyMjAwMC5ncGlvOiBQTDA2MSBHUElPIGNoaXAgQDB4MDAwMDAw
MDBmNzAyMjAwMCByZWdpc3RlcmVkClsgICAgMS4yODc0NDFdIHBsMDYxX2dwaW8gZjgwMTIwMDAu
Z3BpbzogUEwwNjEgR1BJTyBjaGlwIEAweDAwMDAwMDAwZjgwMTIwMDAgcmVnaXN0ZXJlZApbICAg
IDEuMjk1NDM3XSBwbDA2MV9ncGlvIGY3MDJkMDAwLmdwaW86IFBMMDYxIEdQSU8gY2hpcCBAMHgw
MDAwMDAwMGY3MDJkMDAwIHJlZ2lzdGVyZWQKWyAgICAxLjMwMzQ0OV0gcGwwNjFfZ3BpbyBmNzAy
YTAwMC5ncGlvOiBQTDA2MSBHUElPIGNoaXAgQDB4MDAwMDAwMDBmNzAyYTAwMCByZWdpc3RlcmVk
ClsgICAgMS4zMTE0NDFdIHBsMDYxX2dwaW8gZjcwMjcwMDAuZ3BpbzogUEwwNjEgR1BJTyBjaGlw
IEAweDAwMDAwMDAwZjcwMjcwMDAgcmVnaXN0ZXJlZApbICAgIDEuMzE5MzExXSBncGlvIGdwaW9j
aGlwMTY6IG5hbWVzIDkgZG8gbm90IG1hdGNoIG51bWJlciBvZiBHUElPcyA4ClsgICAgMS4zMjU3
NDddIHBsMDYxX2dwaW8gZjcwMjQwMDAuZ3BpbzogUEwwNjEgR1BJTyBjaGlwIEAweDAwMDAwMDAw
ZjcwMjQwMDAgcmVnaXN0ZXJlZApbICAgIDEuMzMzNjA2XSBncGlvIGdwaW9jaGlwMTc6IG5hbWVz
IDkgZG8gbm90IG1hdGNoIG51bWJlciBvZiBHUElPcyA4ClsgICAgMS4zNDAwMjldIHBsMDYxX2dw
aW8gZjgwMTQwMDAuZ3BpbzogUEwwNjEgR1BJTyBjaGlwIEAweDAwMDAwMDAwZjgwMTQwMDAgcmVn
aXN0ZXJlZApbICAgIDEuMzQ4MDQ2XSBwbDA2MV9ncGlvIGY3MDIxMDAwLmdwaW86IFBMMDYxIEdQ
SU8gY2hpcCBAMHgwMDAwMDAwMGY3MDIxMDAwIHJlZ2lzdGVyZWQKWyAgICAxLjM1NjA0MV0gcGww
NjFfZ3BpbyBmODAxMTAwMC5ncGlvOiBQTDA2MSBHUElPIGNoaXAgQDB4MDAwMDAwMDBmODAxMTAw
MCByZWdpc3RlcmVkClsgICAgMS4zNjYzMjRdIEVJTko6IEFDUEkgZGlzYWJsZWQuClsgICAgMS4z
NzM3NjddIGszLWRtYSBmNzM3MDAwMC5kbWE6IGluaXRpYWxpemVkClsgICAgMS4zODM5NjldIFNl
cmlhbDogODI1MC8xNjU1MCBkcml2ZXIsIDQgcG9ydHMsIElSUSBzaGFyaW5nIGVuYWJsZWQKWyAg
ICAxLjM5MjM0NF0gU3VwZXJIIChIKVNDSShGKSBkcml2ZXIgaW5pdGlhbGl6ZWQKWyAgICAxLjM5
NzMxM10gbXNtX3NlcmlhbDogZHJpdmVyIGluaXRpYWxpemVkClsgICAgMS40MDk2OTVdIGxvb3A6
IG1vZHVsZSBsb2FkZWQKWyAgICAxLjQxNDcxOF0gVkREXzNWMzogc3VwcGxpZWQgYnkgU1lTXzVW
ClsgICAgMS40MjQxODRdIGxpYnBoeTogRml4ZWQgTURJTyBCdXM6IHByb2JlZApbICAgIDEuNDI4
NzU4XSB0dW46IFVuaXZlcnNhbCBUVU4vVEFQIGRldmljZSBkcml2ZXIsIDEuNgpbICAgIDEuNDM0
NTY1XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGFzaXgKWyAgICAx
LjQ0MDAzMl0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBheDg4MTc5
XzE3OGEKWyAgICAxLjQ0NjI4OF0gVkZJTyAtIFVzZXIgTGV2ZWwgbWV0YS1kcml2ZXIgdmVyc2lv
bjogMC4zClsgICAgMS40NTIxNzJdIGVoY2lfaGNkOiBVU0IgMi4wICdFbmhhbmNlZCcgSG9zdCBD
b250cm9sbGVyIChFSENJKSBEcml2ZXIKWyAgICAxLjQ1ODc0MV0gZWhjaS1wY2k6IEVIQ0kgUENJ
IHBsYXRmb3JtIGRyaXZlcgpbICAgIDEuNDYzMjQ1XSBlaGNpLXBsYXRmb3JtOiBFSENJIGdlbmVy
aWMgcGxhdGZvcm0gZHJpdmVyClsgICAgMS40Njg2MDNdIGVoY2ktb3Jpb246IEVIQ0kgb3Jpb24g
ZHJpdmVyClsgICAgMS40NzI3MDVdIGVoY2ktZXh5bm9zOiBFSENJIEVYWU5PUyBkcml2ZXIKWyAg
ICAxLjQ3Njk2OF0gb2hjaV9oY2Q6IFVTQiAxLjEgJ09wZW4nIEhvc3QgQ29udHJvbGxlciAoT0hD
SSkgRHJpdmVyClsgICAgMS40ODMxNjddIG9oY2ktcGNpOiBPSENJIFBDSSBwbGF0Zm9ybSBkcml2
ZXIKWyAgICAxLjQ4NzY3MF0gb2hjaS1wbGF0Zm9ybTogT0hDSSBnZW5lcmljIHBsYXRmb3JtIGRy
aXZlcgpbICAgIDEuNDkyOTk5XSBvaGNpLWV4eW5vczogT0hDSSBFWFlOT1MgZHJpdmVyClsgICAg
MS40OTc2NDZdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiLXN0
b3JhZ2UKWyAgICAxLjUwMzc2MV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRy
aXZlciB1c2JzZXJpYWxfZ2VuZXJpYwpbICAgIDEuNTEwMzI0XSB1c2JzZXJpYWw6IFVTQiBTZXJp
YWwgc3VwcG9ydCByZWdpc3RlcmVkIGZvciBnZW5lcmljClsgICAgMS41MTcxNjJdIGlucHV0OiBI
SVNJIDY1eHggUG93ZXJPbiBLZXkgYXMgL2RldmljZXMvcGxhdGZvcm0vZjgwMDAwMDAucG1pYy9o
aTY1eHgtcG93ZXJrZXkuMC5hdXRvL2lucHV0L2lucHV0MApbICAgIDEuNTI4NzU0XSBydGMtcGww
MzEgZjgwMDQwMDAucnRjOiBydGMgY29yZTogcmVnaXN0ZXJlZCBwbDAzMSBhcyBydGMwClsgICAg
MS41MzU2MTRdIHJ0Yy1wbDAzMSBmODAwMzAwMC5ydGM6IHJ0YyBjb3JlOiByZWdpc3RlcmVkIHBs
MDMxIGFzIHJ0YzEKWyAgICAxLjU0Mjc2MF0gaTJjIC9kZXYgZW50cmllcyBkcml2ZXIKWyAgICAx
LjU0ODE1NV0gV0FSTklORzogQ1BVOiAxIFBJRDogMSBhdCBhcmNoL2FybTY0L21tL2lvcmVtYXAu
Yzo1OCBfX2lvcmVtYXBfY2FsbGVyKzB4ZDAvMHhlMApbICAgIDEuNTU2NTEwXSBNb2R1bGVzIGxp
bmtlZCBpbjoKWyAgICAxLjU1OTU2N10gQ1BVOiAxIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90
IHRhaW50ZWQgNC4xOS41ICMxClsgICAgMS41NjU0ODJdIEhhcmR3YXJlIG5hbWU6IEhpS2V5IERl
dmVsb3BtZW50IEJvYXJkIChEVCkKWyAgICAxLjU3MDcwNF0gcHN0YXRlOiA4MDAwMDAwNSAoTnpj
diBkYWlmIC1QQU4gLVVBTykKWyAgICAxLjU3NTQ5NF0gcGMgOiBfX2lvcmVtYXBfY2FsbGVyKzB4
ZDAvMHhlMApbICAgIDEuNTc5Njc2XSBsciA6IF9faW9yZW1hcF9jYWxsZXIrMHg1NC8weGUwClsg
ICAgMS41ODM4NTNdIHNwIDogZmZmZjAwMDAwODA2MzljMApbICAgIDEuNTg3MTYyXSB4Mjk6IGZm
ZmYwMDAwMDgwNjM5YzAgeDI4OiAwMDAwMDAwMDAwMDAwMDAwClsgICAgMS41OTI0NzRdIHgyNzog
ZmZmZjAwMDAwOTAwMjA2OCB4MjY6IGZmZmYwMDAwMDhmNDI2YjAKWyAgICAxLjU5Nzc4N10geDI1
OiBmZmZmMDAwMDA4ZjUwNjMwIHgyNDogMDAwMDAwMDAwMDAwMDAwMApbICAgIDEuNjAzMDk4XSB4
MjM6IDAwZTgwMDAwMDAwMDBmMDcgeDIyOiBmZmZmMDAwMDA4NjVlYTA4ClsgICAgMS42MDg0MDld
IHgyMTogMDAwMDAwMDAwMDAwMDAwMCB4MjA6IDAwMDAwMDAwMDVmMDEwMDAKWyAgICAxLjYxMzcx
OV0geDE5OiAwMDAwMDAwMDAwMDAxMDAwIHgxODogZmZmZmZmZmZmZmZmZmZmZgpbICAgIDEuNjE5
MDI5XSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2OiAwMDAwMDAwMDAwMDAwMDE2ClsgICAgMS42
MjQzNDJdIHgxNTogZmZmZjAwMDAwOTA5OTZjOCB4MTQ6IGZmZmY4MDAwN2NmOTRkMGEKWyAgICAx
LjYyOTY1NF0geDEzOiBmZmZmODAwMDdjZjk0ZDA5IHgxMjogMDAwMDAwMDAwMDAwMDAzMApbICAg
IDEuNjM0OTY1XSB4MTE6IDAwMDAwMDAwMDAwMDAwMTggeDEwOiAwMTAxMDEwMTAxMDEwMTAxClsg
ICAgMS42NDAyNzRdIHg5IDogMDAwMDAwMDAwMDAwMDAwMyB4OCA6IDAwMDAwMDAwMDBlZmYwMDAK
WyAgICAxLjY0NTU4NV0geDcgOiAwMDAwMDAwMDAwMDAwMDE4IHg2IDogZmZmZjAwMDAwOTI2N2Y5
MApbICAgIDEuNjUwODk3XSB4NSA6IDAwMDAwMDAwMDAwMDAwMDIgeDQgOiAwMDAwMDAwMDAwMDAw
MDAyClsgICAgMS42NTYyMTBdIHgzIDogMDAwMDAwMDAwNmRmZjAwMCB4MiA6IGZmZmYwMDAwMDky
NjdmYTgKWyAgICAxLjY2MTUyMl0geDEgOiAwMDAwMDAwMDAwMDAwMDAxIHgwIDogMDAwMDAwMDAw
MDAwMDAwMQpbICAgIDEuNjY2ODMyXSBDYWxsIHRyYWNlOgpbICAgIDEuNjY5Mjc2XSAgX19pb3Jl
bWFwX2NhbGxlcisweGQwLzB4ZTAKWyAgICAxLjY3MzEwOF0gIF9faW9yZW1hcCsweDEwLzB4MTgK
WyAgICAxLjY3NjMzNV0gIG9mX3N5c2Nvbl9yZWdpc3RlcisweGUwLzB4MmYwClsgICAgMS42ODA0
MjhdICBzeXNjb25fbm9kZV90b19yZWdtYXArMHg3NC8weGMwClsgICAgMS42ODQ2OTddICBzeXNj
b25fcmVib290X21vZGVfcHJvYmUrMHg1OC8weDExOApbICAgIDEuNjg5MzEyXSAgcGxhdGZvcm1f
ZHJ2X3Byb2JlKzB4NTAvMHhiMApbICAgIDEuNjkzMzE5XSAgcmVhbGx5X3Byb2JlKzB4MWVjLzB4
M2MwClsgICAgMS42OTY5ODBdICBkcml2ZXJfcHJvYmVfZGV2aWNlKzB4MTI0LzB4MTQ4ClsgICAg
MS43MDEyNDldICBfX2RyaXZlcl9hdHRhY2grMHgxMzQvMHgxMzgKWyAgICAxLjcwNTE3Ml0gIGJ1
c19mb3JfZWFjaF9kZXYrMHg2OC8weGM4ClsgICAgMS43MDkwMDJdICBkcml2ZXJfYXR0YWNoKzB4
MjAvMHgyOApbICAgIDEuNzEyNTc1XSAgYnVzX2FkZF9kcml2ZXIrMHgxYjgvMHgyOTgKWyAgICAx
LjcxNjQwOF0gIGRyaXZlcl9yZWdpc3RlcisweDYwLzB4MTEwClsgICAgMS43MjAyMzldICBfX3Bs
YXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDQ0LzB4NTAKWyAgICAxLjcyNDk0NF0gIHN5c2Nvbl9y
ZWJvb3RfbW9kZV9kcml2ZXJfaW5pdCsweDE4LzB4MjAKWyAgICAxLjcyOTk5M10gIGRvX29uZV9p
bml0Y2FsbCsweDU4LzB4MTcwClsgICAgMS43MzM4MjhdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsw
eDE5NC8weDIzYwpbICAgIDEuNzM4MTg1XSAga2VybmVsX2luaXQrMHgxMC8weDEwOApbICAgIDEu
NzQxNjczXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgKWyAgICAxLjc0NTI1MF0gLS0tWyBlbmQg
dHJhY2UgZjQwMzIzMjY3NjUwZjNhZSBdLS0tClsgICAgMS43NDk5MDRdIHN5c2Nvbi1yZWJvb3Qt
bW9kZTogcHJvYmUgb2YgNWYwMTAwMC5yZWJvb3QtbW9kZS1zeXNjb246cmVib290LW1vZGUgZmFp
bGVkIHdpdGggZXJyb3IgLTEyClsgICAgMS43NjExOTJdIHNwODA1LXdkdCBmODAwNTAwMC53YXRj
aGRvZzogcmVnaXN0cmF0aW9uIHN1Y2Nlc3NmdWwKWyAgICAxLjc3MDYwMF0gc2RoY2k6IFNlY3Vy
ZSBEaWdpdGFsIEhvc3QgQ29udHJvbGxlciBJbnRlcmZhY2UgZHJpdmVyClsgICAgMS43NzY4MTJd
IHNkaGNpOiBDb3B5cmlnaHQoYykgUGllcnJlIE9zc21hbgpbICAgIDEuNzgxNTIwXSBTeW5vcHN5
cyBEZXNpZ253YXJlIE11bHRpbWVkaWEgQ2FyZCBJbnRlcmZhY2UgRHJpdmVyClsgICAgMS43ODgy
NzddIGR3bW1jX2szIGY3MjNmMDAwLmR3bW1jMjogZmlmby1kZXB0aCBwcm9wZXJ0eSBub3QgZm91
bmQsIHVzaW5nIHZhbHVlIG9mIEZJRk9USCByZWdpc3RlciBhcyBkZWZhdWx0ClsgICAgMS43OTg0
MDldIGR3bW1jX2szIGY3MjNmMDAwLmR3bW1jMjogSURNQUMgc3VwcG9ydHMgMzItYml0IGFkZHJl
c3MgbW9kZS4KWyAgICAxLjgwNjI4MV0gZHdtbWNfazMgZjcyM2YwMDAuZHdtbWMyOiBVc2luZyBp
bnRlcm5hbCBETUEgY29udHJvbGxlci4KWyAgICAxLjgxMjY1NV0gZHdtbWNfazMgZjcyM2YwMDAu
ZHdtbWMyOiBWZXJzaW9uIElEIGlzIDI1MGEKWyAgICAxLjgxODAyM10gZHdtbWNfazMgZjcyM2Yw
MDAuZHdtbWMyOiBEVyBNTUMgY29udHJvbGxlciBhdCBpcnEgMTMsMzIgYml0IGhvc3QgZGF0YSB3
aWR0aCwxMjggZGVlcCBmaWZvClsgICAgMS44Mjc0NDRdIGR3bW1jX2szIGY3MjNmMDAwLmR3bW1j
MjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gcmVndWxhdG9yLjEKWyAgICAxLjgzNDMxMl0gZHdt
bWNfazMgZjcyM2YwMDAuZHdtbWMyOiBhbGxvY2F0ZWQgbW1jLXB3cnNlcQpbICAgIDEuODM5ODM1
XSBtbWNfaG9zdCBtbWMwOiBjYXJkIGlzIG5vbi1yZW1vdmFibGUuClsgICAgMS44NTc4MjldIG1t
Y19ob3N0IG1tYzA6IEJ1cyBzcGVlZCAoc2xvdCAwKSA9IDI0ODAwMDAwSHogKHNsb3QgcmVxIDQw
MDAwMEh6LCBhY3R1YWwgNDAwMDAwSFogZGl2ID0gMzEpClsgICAgMS44ODE1MzldIGR3bW1jX2sz
IGY3MjNlMDAwLmR3bW1jMTogZmlmby1kZXB0aCBwcm9wZXJ0eSBub3QgZm91bmQsIHVzaW5nIHZh
bHVlIG9mIEZJRk9USCByZWdpc3RlciBhcyBkZWZhdWx0ClsgICAgMS44OTMxMjNdIGR3bW1jX2sz
IGY3MjNlMDAwLmR3bW1jMTogSURNQUMgc3VwcG9ydHMgMzItYml0IGFkZHJlc3MgbW9kZS4KWyAg
ICAxLjg5ODc1NF0gZHdtbWNfazMgZjcyM2YwMDAuZHdtbWMyOiBjYXJkIGNsYWltcyB0byBzdXBw
b3J0IHZvbHRhZ2VzIGJlbG93IGRlZmluZWQgcmFuZ2UKWyAgICAxLjkwODQ5OV0gZHdtbWNfazMg
ZjcyM2UwMDAuZHdtbWMxOiBVc2luZyBpbnRlcm5hbCBETUEgY29udHJvbGxlci4KWyAgICAxLjkx
NDg4OV0gZHdtbWNfazMgZjcyM2UwMDAuZHdtbWMxOiBWZXJzaW9uIElEIGlzIDI1MGEKWyAgICAx
LjkyMDI4MV0gZHdtbWNfazMgZjcyM2UwMDAuZHdtbWMxOiBEVyBNTUMgY29udHJvbGxlciBhdCBp
cnEgMjEsMzIgYml0IGhvc3QgZGF0YSB3aWR0aCwxMjggZGVlcCBmaWZvClsgICAgMS45Mjk3MDNd
IGR3bW1jX2szIGY3MjNlMDAwLmR3bW1jMTogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gcmVndWxh
dG9yLjUKWyAgICAxLjkzNjU2M10gZHdtbWNfazMgZjcyM2UwMDAuZHdtbWMxOiBMaW5rZWQgYXMg
YSBjb25zdW1lciB0byByZWd1bGF0b3IuNApbICAgIDEuOTM3MjE0XSBtbWNfaG9zdCBtbWMwOiBC
dXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90IHJlcSAyNTAwMDAwMEh6LCBhY3R1
YWwgMjQ4MDAwMDBIWiBkaXYgPSAwKQpbICAgIDEuOTQzNDQyXSBkd21tY19rMyBmNzIzZTAwMC5k
d21tYzE6IEdvdCBDRCBHUElPClsgICAgMS45NTkyMzVdIG1tYzA6IG5ldyBTRElPIGNhcmQgYXQg
YWRkcmVzcyAwMDAxClsgICAgMS45NzA5MzBdIG1tY19ob3N0IG1tYzE6IEJ1cyBzcGVlZCAoc2xv
dCAwKSA9IDI0ODAwMDAwSHogKHNsb3QgcmVxIDQwMDAwMEh6LCBhY3R1YWwgNDAwMDAwSFogZGl2
ID0gMzEpClsgICAgMS45OTU4MzRdIGR3bW1jX2szIGY3MjNkMDAwLmR3bW1jMDogZmlmby1kZXB0
aCBwcm9wZXJ0eSBub3QgZm91bmQsIHVzaW5nIHZhbHVlIG9mIEZJRk9USCByZWdpc3RlciBhcyBk
ZWZhdWx0ClsgICAgMi4wMDgxMjZdIGR3bW1jX2szIGY3MjNkMDAwLmR3bW1jMDogSURNQUMgc3Vw
cG9ydHMgMzItYml0IGFkZHJlc3MgbW9kZS4KWyAgICAyLjAxNTk2NV0gZHdtbWNfazMgZjcyM2Qw
MDAuZHdtbWMwOiBVc2luZyBpbnRlcm5hbCBETUEgY29udHJvbGxlci4KWyAgICAyLjAyMjM3N10g
ZHdtbWNfazMgZjcyM2QwMDAuZHdtbWMwOiBWZXJzaW9uIElEIGlzIDI1MGEKWyAgICAyLjAyNzc2
OF0gZHdtbWNfazMgZjcyM2QwMDAuZHdtbWMwOiBEVyBNTUMgY29udHJvbGxlciBhdCBpcnEgMjIs
MzIgYml0IGhvc3QgZGF0YSB3aWR0aCwyNTYgZGVlcCBmaWZvClsgICAgMi4wMzczMzFdIGR3bW1j
X2szIGY3MjNkMDAwLmR3bW1jMDogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gcmVndWxhdG9yLjEw
ClsgICAgMi4wNDQzMTJdIG1tY19ob3N0IG1tYzI6IGNhcmQgaXMgbm9uLXJlbW92YWJsZS4KWyAg
ICAyLjA2NDM1Ml0gbW1jX2hvc3QgbW1jMjogQnVzIHNwZWVkIChzbG90IDApID0gMjQ4MDAwMDBI
eiAoc2xvdCByZXEgNDAwMDAwSHosIGFjdHVhbCA0MDAwMDBIWiBkaXYgPSAzMSkKWyAgICAyLjA5
MDcxOF0gc2RoY2ktcGx0Zm06IFNESENJIHBsYXRmb3JtIGFuZCBPRiBkcml2ZXIgaGVscGVyClsg
ICAgMi4xMDA0OTZdIGxlZHRyaWctY3B1OiByZWdpc3RlcmVkIHRvIGluZGljYXRlIGFjdGl2aXR5
IG9uIENQVXMKWyAgICAyLjEwNzc2MV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciB1c2JoaWQKWyAgICAyLjExMzM3N10gdXNiaGlkOiBVU0IgSElEIGNvcmUgZHJpdmVy
ClsgICAgMi4xMTkwMzVdIG9wdGVlOiBwcm9iaW5nIGZvciBjb25kdWl0IG1ldGhvZCBmcm9tIERU
LgpbICAgIDIuMTI0MjI2XSBvcHRlZTogcmV2aXNpb24gMS4wClsgICAgMi4xMjQyMzJdIG9wdGVl
OiBhcGkgcmV2aXNpb24gbWlzbWF0Y2gKWyAgICAyLjEzMjAyNl0gTkVUOiBSZWdpc3RlcmVkIHBy
b3RvY29sIGZhbWlseSAxMApbICAgIDIuMTM3NTk1XSBTZWdtZW50IFJvdXRpbmcgd2l0aCBJUHY2
ClsgICAgMi4xNDEzOTddIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMTcKWyAgICAy
LjE0NTg4NV0gOXBuZXQ6IEluc3RhbGxpbmcgOVAyMDAwIHN1cHBvcnQKWyAgICAyLjE1MDI0OV0g
S2V5IHR5cGUgZG5zX3Jlc29sdmVyIHJlZ2lzdGVyZWQKWyAgICAyLjE1NTg2M10gcmVnaXN0ZXJl
ZCB0YXNrc3RhdHMgdmVyc2lvbiAxClsgICAgMi4xNTk5ODddIExvYWRpbmcgY29tcGlsZWQtaW4g
WC41MDkgY2VydGlmaWNhdGVzClsgICAgMi4xNzAzMzhdIGY3MTEzMDAwLnVhcnQ6IHR0eUFNQTMg
YXQgTU1JTyAweGY3MTEzMDAwIChpcnEgPSA5LCBiYXNlX2JhdWQgPSAwKSBpcyBhIFBMMDExIHJl
djIKWyAgICAyLjE3OTg1M10gZjcxMTIwMDAudWFydDogdHR5QU1BMiBhdCBNTUlPIDB4ZjcxMTIw
MDAgKGlycSA9IDI0LCBiYXNlX2JhdWQgPSAwKSBpcyBhIFBMMDExIHJldjIKWyAgICAyLjE4OTM5
NV0gNVZfSFVCOiBzdXBwbGllZCBieSBTWVNfNVYKWyAgICAyLjE5MzU3MF0gc3NwLXBsMDIyIGY3
MTA2MDAwLnNwaTogQVJNIFBMMDIyIGRyaXZlciwgZGV2aWNlIElEOiAweDAwMDQxMDIyClsgICAg
Mi4yMDA2ODVdIHNzcC1wbDAyMiBmNzEwNjAwMC5zcGk6IG1hcHBlZCByZWdpc3RlcnMgZnJvbSAw
eDAwMDAwMDAwZjcxMDYwMDAgdG8gKF9fX19wdHJ2YWxfX19fKQpbICAgIDIuMjA5NTUxXSBzc3At
cGwwMjIgZjcxMDYwMDAuc3BpOiBzZXR1cCBmb3IgRE1BIG9uIFJYIGRtYTBjaGFuMCwgVFggZG1h
MGNoYW4xClsgICAgMi4yMjA4MDNdIHBoeSBwaHktc29jOnVzYnBoeS4wOiBMaW5rZWQgYXMgYSBj
b25zdW1lciB0byByZWd1bGF0b3IuMTMKWyAgICAyLjIyODEwNF0gbW1jX2hvc3QgbW1jMjogQnVz
IHNwZWVkIChzbG90IDApID0gMTk4NDAwMDAwSHogKHNsb3QgcmVxIDIwMDAwMDAwMEh6LCBhY3R1
YWwgMTk4NDAwMDAwSFogZGl2ID0gMCkKWyAgICAyLjIzODYyNV0gZHdjMiBmNzJjMDAwMC51c2I6
IGY3MmMwMDAwLnVzYiBzdXBwbHkgdnVzYl9kIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxh
dG9yClsgICAgMi4yNDY5NjNdIGR3YzIgZjcyYzAwMDAudXNiOiBMaW5rZWQgYXMgYSBjb25zdW1l
ciB0byByZWd1bGF0b3IuMApbICAgIDIuMjUzMTc1XSBkd2MyIGY3MmMwMDAwLnVzYjogZjcyYzAw
MDAudXNiIHN1cHBseSB2dXNiX2Egbm90IGZvdW5kLCB1c2luZyBkdW1teSByZWd1bGF0b3IKWyAg
ICAyLjI2MTY5Nl0gbW1jMjogbmV3IEhTMjAwIE1NQyBjYXJkIGF0IGFkZHJlc3MgMDAwMQpbICAg
IDIuMjY3NTExXSBtbWNibGsyOiBtbWMyOjAwMDEgOEdORDNSIDcuMjggR2lCClsgICAgMi4yNzI2
NzVdIG1tY2JsazJib290MDogbW1jMjowMDAxIDhHTkQzUiBwYXJ0aXRpb24gMSA0LjAwIE1pQgpb
ICAgIDIuMjc5MjI1XSBtbWNibGsyYm9vdDE6IG1tYzI6MDAwMSA4R05EM1IgcGFydGl0aW9uIDIg
NC4wMCBNaUIKWyAgICAyLjI4NTQ5N10gbW1jYmxrMnJwbWI6IG1tYzI6MDAwMSA4R05EM1IgcGFy
dGl0aW9uIDMgNTEyIEtpQiwgY2hhcmRldiAoMjM5OjApClsgICAgMi4yOTg5NjddIHJhbmRvbTog
ZmFzdCBpbml0IGRvbmUKWyAgICAyLjMwMzQ5NF0gIG1tY2JsazI6IHAxIHAyIHAzIHA0IHA1IHA2
IHA3IHA4IHAxMSBwMTIgcDEzIHAxNCBwMTkKWyAgICAyLjQ3MDM2OV0gZHdjMiBmNzJjMDAwMC51
c2I6IEVQczogMTYsIGRlZGljYXRlZCBmaWZvcywgMTkyMCBlbnRyaWVzIGluIFNQUkFNClsgICAg
Mi40ODE1ODNdIGR3YzIgZjcyYzAwMDAudXNiOiBEV0MgT1RHIENvbnRyb2xsZXIKWyAgICAyLjQ4
NjM4OV0gZHdjMiBmNzJjMDAwMC51c2I6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVk
IGJ1cyBudW1iZXIgMQpbICAgIDIuNDkzNTI2XSBkd2MyIGY3MmMwMDAwLnVzYjogaXJxIDE1LCBp
byBtZW0gMHhmNzJjMDAwMApbICAgIDIuNTAwNjE0XSBodWIgMS0wOjEuMDogVVNCIGh1YiBmb3Vu
ZApbICAgIDIuNTA0NDMwXSBodWIgMS0wOjEuMDogMSBwb3J0IGRldGVjdGVkClsgICAgMi41MTA5
MjNdIHJ0Yy1wbDAzMSBmODAwNDAwMC5ydGM6IHNldHRpbmcgc3lzdGVtIGNsb2NrIHRvIDE5NzAt
MDEtMDEgMDA6MDE6MDYgVVRDICg2NikKWyAgICAyLjUxOTUxN10gTERPMl8yVjg6IGRpc2FibGlu
ZwpbICAgIDIuNTIyNjg3XSBMRE83X1NESU86IGRpc2FibGluZwpbICAgIDIuNTI1OTUzXSBMRE8x
MF8yVjg1OiBkaXNhYmxpbmcKWyAgICAyLjUyOTI3MF0gTERPMTNfMVY4OiBkaXNhYmxpbmcKWyAg
ICAyLjUzMjUxMF0gTERPMTRfMlY4OiBkaXNhYmxpbmcKWyAgICAyLjUzNTc0OV0gTERPMTdfMlY1
OiBkaXNhYmxpbmcKWyAgICAyLjUzOTQxMF0gdWFydC1wbDAxMSBmODAxNTAwMC51YXJ0OiBubyBE
TUEgcGxhdGZvcm0gZGF0YQpbICAgIDIuNTQ0OTc1XSBXYWl0aW5nIDMgc2VjIGJlZm9yZSBtb3Vu
dGluZyByb290IGRldmljZS4uLgpbICAgIDIuOTAyMTY0XSBkd2MyIGY3MmMwMDAwLnVzYjogU2V0
IHNwZWVkIHRvIGhpZ2gtc3BlZWQKWyAgICAyLjkwNzQ2M10gdXNiIDEtMTogbmV3IGhpZ2gtc3Bl
ZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyBkd2MyClsgICAgMy4xMDIxNDddIGR3YzIgZjcy
YzAwMDAudXNiOiBTZXQgc3BlZWQgdG8gaGlnaC1zcGVlZApbICAgIDMuMTM0NDg2XSBodWIgMS0x
OjEuMDogVVNCIGh1YiBmb3VuZApbICAgIDMuMTM4NjIxXSBodWIgMS0xOjEuMDogMyBwb3J0cyBk
ZXRlY3RlZApbICAgIDUuNjI5MTcwXSBWRlM6IE1vdW50ZWQgcm9vdCAoc3F1YXNoZnMgZmlsZXN5
c3RlbSkgcmVhZG9ubHkgb24gZGV2aWNlIDE3OToxMi4KWyAgICA1LjY0MDExMl0gZGV2dG1wZnM6
IG1vdW50ZWQKWyAgICA1LjY0MzY1OF0gRnJlZWluZyB1bnVzZWQga2VybmVsIG1lbW9yeTogMTI4
MEsKWyAgICA1LjY0ODM0Nl0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9jZXNzClsgICAgNi44
NjcyNTNdIG1tY19ob3N0IG1tYzA6IEJ1cyBzcGVlZCAoc2xvdCAwKSA9IDI0ODAwMDAwSHogKHNs
b3QgcmVxIDQwMDAwMEh6LCBhY3R1YWwgNDAwMDAwSFogZGl2ID0gMzEpClsgICAgNi45NjM1OTdd
IG1tY19ob3N0IG1tYzA6IEJ1cyBzcGVlZCAoc2xvdCAwKSA9IDI0ODAwMDAwSHogKHNsb3QgcmVx
IDI1MDAwMDAwSHosIGFjdHVhbCAyNDgwMDAwMEhaIGRpdiA9IDApClsgICAgNi45OTI3NTVdIG1t
Y19ob3N0IG1tYzA6IEJ1cyBzcGVlZCAoc2xvdCAwKSA9IDI0ODAwMDAwSHogKHNsb3QgcmVxIDQw
MDAwMEh6LCBhY3R1YWwgNDAwMDAwSFogZGl2ID0gMzEpClsgICAgNy4wOTQzNzJdIG1tY19ob3N0
IG1tYzA6IEJ1cyBzcGVlZCAoc2xvdCAwKSA9IDI0ODAwMDAwSHogKHNsb3QgcmVxIDI1MDAwMDAw
SHosIGFjdHVhbCAyNDgwMDAwMEhaIGRpdiA9IDApClsgICAgOC4wMDI1ODldIHVhcnQtcGwwMTEg
ZjcxMTIwMDAudWFydDogbm8gRE1BIHBsYXRmb3JtIGRhdGEKWyAgICA4LjUyMDM2OF0gdWFydC1w
bDAxMSBmNzExMzAwMC51YXJ0OiBubyBETUEgcGxhdGZvcm0gZGF0YQpbICAgMTAuNjg3NjI2XSBG
QVQtZnMgKG1tY2JsazJwMTQpOiBWb2x1bWUgd2FzIG5vdCBwcm9wZXJseSB1bm1vdW50ZWQuIFNv
bWUgZGF0YSBtYXkgYmUgY29ycnVwdC4gUGxlYXNlIHJ1biBmc2NrLgpbICAgMTIuMTkxMjUxXSBF
WFQ0LWZzIChtbWNibGsycDE5KTogbW91bnRlZCBmaWxlc3lzdGVtIHdpdGggb3JkZXJlZCBkYXRh
IG1vZGUuIE9wdHM6IChudWxsKQpbICAgMTIuOTE1MzI4XSByYW5kb206IHJuZ2Q6IHVuaW5pdGlh
bGl6ZWQgdXJhbmRvbSByZWFkICg4IGJ5dGVzIHJlYWQpClsgICAxMi45MjE3MjldIHJhbmRvbTog
Y3JuZyBpbml0IGRvbmUKWyAgIDEzLjQ5MzA5MF0gY2ZnODAyMTE6IExvYWRpbmcgY29tcGlsZWQt
aW4gWC41MDkgY2VydGlmaWNhdGVzIGZvciByZWd1bGF0b3J5IGRhdGFiYXNlClsgICAxMy41MzIx
NDBdIGNmZzgwMjExOiBMb2FkZWQgWC41MDkgY2VydCAnc2ZvcnNoZWU6IDAwYjI4ZGRmNDdhZWY5
Y2VhNycKWyAgIDEzLjUzOTU0MV0gcGxhdGZvcm0gcmVndWxhdG9yeS4wOiBEaXJlY3QgZmlybXdh
cmUgbG9hZCBmb3IgcmVndWxhdG9yeS5kYiBmYWlsZWQgd2l0aCBlcnJvciAtMgpbICAgMTMuNTQ4
MjI1XSBjZmc4MDIxMTogZmFpbGVkIHRvIGxvYWQgcmVndWxhdG9yeS5kYgpbICAgMTQuNjQzODQ1
XSBtbWNfaG9zdCBtbWMwOiBCdXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90IHJl
cSA0MDAwMDBIeiwgYWN0dWFsIDQwMDAwMEhaIGRpdiA9IDMxKQpbICAgMTQuNzM3OTAzXSBtbWNf
aG9zdCBtbWMwOiBCdXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90IHJlcSAyNTAw
MDAwMEh6LCBhY3R1YWwgMjQ4MDAwMDBIWiBkaXYgPSAwKQpbICAgMTQuNzk4NTYzXSBtbWNfaG9z
dCBtbWMwOiBCdXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90IHJlcSA0MDAwMDBI
eiwgYWN0dWFsIDQwMDAwMEhaIGRpdiA9IDMxKQpbICAgMTQuODcxOTE5XSBtbWNfaG9zdCBtbWMw
OiBCdXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90IHJlcSAyNTAwMDAwMEh6LCBh
Y3R1YWwgMjQ4MDAwMDBIWiBkaXYgPSAwKQpbICAgMTUuMDkzMDU1XSB3bGNvcmU6IHdsMTh4eCBI
VzogMTgzeCBvciAxODB4LCBQRyAyLjIgKFJPTSAweDExKQpbICAgMTUuMDk0MzYxXSBicmlkZ2U6
IGZpbHRlcmluZyB2aWEgYXJwL2lwL2lwNnRhYmxlcyBpcyBubyBsb25nZXIgYXZhaWxhYmxlIGJ5
IGRlZmF1bHQuIFVwZGF0ZSB5b3VyIHNjcmlwdHMgdG8gbG9hZCBicl9uZXRmaWx0ZXIgaWYgeW91
IG5lZWQgdGhpcy4KWyAgIDE1LjEwMTE2N10gd2xjb3JlOiBXQVJOSU5HIERldGVjdGVkIHVuY29u
ZmlndXJlZCBtYWMgYWRkcmVzcyBpbiBudnMsIGRlcml2ZSBmcm9tIGZ1c2UgaW5zdGVhZC4KWyAg
IDE1LjEyMDYwNV0gd2xjb3JlOiBXQVJOSU5HIFRoaXMgZGVmYXVsdCBudnMgZmlsZSBjYW4gYmUg
cmVtb3ZlZCBmcm9tIHRoZSBmaWxlIHN5c3RlbQpbICAgMTUuMTQwOTU2XSBCcmlkZ2UgZmlyZXdh
bGxpbmcgcmVnaXN0ZXJlZApbICAgMTUuMTcxNDQwXSB3bGNvcmU6IGxvYWRlZApbICAgMjQuMjc0
Mjc0XSBtbWNfaG9zdCBtbWMwOiBCdXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90
IHJlcSA0MDAwMDBIeiwgYWN0dWFsIDQwMDAwMEhaIGRpdiA9IDMxKQpbICAgMjQuMzQzOTc5XSBt
bWNfaG9zdCBtbWMwOiBCdXMgc3BlZWQgKHNsb3QgMCkgPSAyNDgwMDAwMEh6IChzbG90IHJlcSAy
NTAwMDAwMEh6LCBhY3R1YWwgMjQ4MDAwMDBIWiBkaXYgPSAwKQpbICAgMjQuODU1NTA2XSB3bGNv
cmU6IFBIWSBmaXJtd2FyZSB2ZXJzaW9uOiBSZXYgOC4yLjAuMC4yNDAKWyAgIDI0Ljk2NjkyN10g
d2xjb3JlOiBmaXJtd2FyZSBib290ZWQgKFJldiA4LjkuMC4wLjc2KQpbICAgMjUuMDI2NzI3XSBJ
UHY2OiBBRERSQ09ORihORVRERVZfVVApOiB3bGFuMDogbGluayBpcyBub3QgcmVhZHkKWyAgIDI1
LjI3MzU1M10gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBxY3Nlcmlh
bApbICAgMjUuMjc5NDUxXSB1c2JzZXJpYWw6IFVTQiBTZXJpYWwgc3VwcG9ydCByZWdpc3RlcmVk
IGZvciBRdWFsY29tbSBVU0IgbW9kZW0KWyAgIDI1LjI5ODcxM10gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBjZGNfd2RtClsgICAyNi4wNjk5OTFdIHdsYW4wOiBhdXRo
ZW50aWNhdGUgd2l0aCA3Yzo1NzozYzpkMzo5Yjo0MQpbICAgMjYuMDc5NzY2XSB3bGFuMDogc2Vu
ZCBhdXRoIHRvIDdjOjU3OjNjOmQzOjliOjQxICh0cnkgMS8zKQpbICAgMjYuMTAwMDE1XSB3bGFu
MDogYXV0aGVudGljYXRlZApbICAgMjYuMTA1NjE4XSB3bGFuMDogYXNzb2NpYXRlIHdpdGggN2M6
NTc6M2M6ZDM6OWI6NDEgKHRyeSAxLzMpClsgICAyNi4xMTY4MTJdIHdsYW4wOiBSWCBBc3NvY1Jl
c3AgZnJvbSA3Yzo1NzozYzpkMzo5Yjo0MSAoY2FwYWI9MHg0MzEgc3RhdHVzPTAgYWlkPTEpClsg
ICAyNi4xNTc5MzZdIHdsY29yZTogQXNzb2NpYXRpb24gY29tcGxldGVkLgpbICAgMjYuMTc2MTEx
XSB3bGFuMDogYXNzb2NpYXRlZApbICAgMjYuMTkzMTUxXSBJUHY2OiBBRERSQ09ORihORVRERVZf
Q0hBTkdFKTogd2xhbjA6IGxpbmsgYmVjb21lcyByZWFkeQo=
--000000000000b04b970599f198d1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--000000000000b04b970599f198d1--

