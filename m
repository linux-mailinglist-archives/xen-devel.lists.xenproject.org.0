Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC015B2E0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 22:40:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1zgp-0006BT-N3; Wed, 12 Feb 2020 21:36:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=myKJ=4A=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1j1zgo-0006BO-9Q
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 21:36:58 +0000
X-Inumbo-ID: cb44f130-4ddf-11ea-b0fd-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb44f130-4ddf-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 21:36:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96C122173E;
 Wed, 12 Feb 2020 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581543416;
 bh=pncFrtxG2rv/gM1biDxYE9gVjWEeamEKpkbeQaiqRoc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mPI/QAC+KiFlrgu75y0BD17nmXtf0+958rYbTzBNHQPz+8x7P0q7KcxrVyET1vW1Q
 srsYcgLG4lREEwUdd3kvqOrMH8bBf1OthuivQOgO85fGwcGuj6HcGF2mtyAF0cFVI5
 3jHXtgbEM0wTXs2nQ+JC0myqCKVUGg3tRxkEcIMs=
Date: Wed, 12 Feb 2020 13:36:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
In-Reply-To: <VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0@VI1PR04MB5807.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2002121310350.1018@sstabellini-ThinkPad-T480s>
References: <VI1PR04MB5807A7F83F1B2763BD7EEB20F91B0@VI1PR04MB5807.eurprd04.prod.outlook.com>
 <VI1PR04MB58071B8C08BD7D7D7D61BDF2F91B0@VI1PR04MB5807.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2015755669-1581541913=:1018"
Content-ID: <alpine.DEB.2.21.2002121312160.1018@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
Cc: Jorge Pereira <jorge.pereira@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2015755669-1581541913=:1018
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2002121312161.1018@sstabellini-ThinkPad-T480s>

On Wed, 12 Feb 2020, Andrei Cherechesu wrote:
> Hello,
>  
> 
> I applied your direct-map patch, Stefano, on top of RELEASE-4.13.0
> Xen.

FYI I am working on a direct-map patch series but it is still
work-in-progress:

  http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git direct-map-1
  
There are a few fixes on top of the original direct-map patch I sent.

 
> I also took your advice and used the Imagebuilder tool to setup my
> u-boot environment. I modified the tool to allow SDCard booting and
> tweaked the parameters a little to fit our platforms, also introducing
> support to add “direct-map” parameter in specific /chosen/DomU node
> and “xen,passthrough” in the host dts. The tool is very helpful and
> allows me to quickly change the u-boot environment without manually
> entering all the fdt formatting commands.

That's great to hear :-)

For your information, if you have any changes that are worth
upstreaming, I'd be happy to take patches for imagebuilder. The mailing
list for that is viryaos-discuss@lists.sourceforge.net.

 
> The dom0less booting is successful, 

Good! I know it is not easy to setup a dom0less system. I am trying to
build tools and features to make it easier going forward.


> however, when I try to passthrough any device (I tried with ethernet
> card and uSDHC) I get a kernel panic in DomU when it tries to probe
> the driver, because of an unhandled
> 
> fault:
> 
> (XEN) DOM1: [    3.883482] sdhci: Secure Digital Host Controller Interface driver
> (XEN) DOM1: [    3.891021] sdhci: Copyright(c) Pierre Ossman
> (XEN) DOM1: [    3.896389] sdhci-pltfm: SDHCI platform and OF driver helper
> (XEN) DOM1: [    3.903298] Unhandled fault at 0xffffff800800d048
> (XEN) DOM1: [    3.909021] Mem abort info:
> (XEN) DOM1: [    3.912863]   ESR = 0x96000000
> (XEN) DOM1: [    3.917019]   Exception class = DABT (current EL), IL = 32 bits
> (XEN) DOM1: [    3.924115]   SET = 0, FnV = 0
> (XEN) DOM1: [    3.928206]   EA = 0, S1PTW = 0
> (XEN) DOM1: [    3.932457] Data abort info:
> (XEN) DOM1: [    3.936514]   ISV = 0, ISS = 0x00000000
> (XEN) DOM1: [    3.941398]   CM = 0, WnR = 0
> (XEN) DOM1: [    3.945481] swapper pgtable: 4k pages, 39-bit VAs, pgdp = (____ptrval____)
> (XEN) DOM1: [    3.953532] [ffffff800800d048] pgd=00000000bfffe803, pud=00000000bfffe803, pmd=00000000bfffd803, pte=00e80000402f0f07
> (XEN) DOM1: [    3.965278] Internal error: ttbr address size fault: 96000000 [#1] PREEMPT SMP
> (XEN) DOM1: [    3.973546] Modules linked in:
> (XEN) DOM1: [    3.977709] Process swapper/0 (pid: 1, stack limit = 0x(____ptrval____))
> (XEN) DOM1: [    3.985525] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.59-rt24+g00334f2 #1
> (XEN) DOM1: [    3.993855] pstate: 60000005 (nZCv daif -PAN -UAO)
> (XEN) DOM1: [    3.999755] pc : 0xffffff80083ac864
> (XEN) DOM1: [    4.004354] lr : 0xffffff80083ac810
> (XEN) DOM1: [    4.008955] sp : ffffff800800bba0
> (XEN) DOM1: [    4.013382] x29: ffffff800800bba0 x28: 0000000000000000
> (XEN) DOM1: [    4.019805] x27: ffffff800864f068 x26: ffffff80086ba000
> (XEN) DOM1: [    4.026228] x25: ffffffc031564980 x24: ffffff800856e0c0
> (XEN) DOM1: [    4.032651] x23: ffffffc03e8eec00 x22: ffffffc03e8eec10
> (XEN) DOM1: [    4.039074] x21: ffffffc03e8bf500 x20: ffffffc03e8bf800
> (XEN) DOM1: [    4.045497] x19: 0000000000000000 x18: ffffffffffffffff
> (XEN) DOM1: [    4.051921] x17: 0000000000000000 x16: 0000000000000000
> (XEN) DOM1: [    4.058344] x15: ffffff8008678548 x14: ffffffffffffffff
> (XEN) DOM1: [    4.064767] x13: 0000000000000018 x12: 0101010101010101
> (XEN) DOM1: [    4.071190] x11: 0000000000000020 x10: 0101010101010101
> (XEN) DOM1: [    4.077613] x9 : 0000000000000000 x8 : ffffffc031564c00
> (XEN) DOM1: [    4.084036] x7 : 0000000000000000 x6 : 000000000000003f
> (XEN) DOM1: [    4.090459] x5 : 0000000000000002 x4 : ffffffc03e83b4c0
> (XEN) DOM1: [    4.096883] x3 : 0000000000000000 x2 : 0000000000000000
> (XEN) DOM1: [    4.103306] x1 : ffffffc03e8bf000 x0 : ffffff800800d048
> (XEN) DOM1: [    4.109729] Call trace:
> (XEN) DOM1: [    4.113290]  0xffffff80083ac864
> (XEN) DOM1: [    4.117541]  0xffffff800832e3b8
> (XEN) DOM1: [    4.121795]  0xffffff800832c49c
> (XEN) DOM1: [    4.126047]  0xffffff800832c6bc
> (XEN) DOM1: [    4.130301]  0xffffff800832c808
> (XEN) DOM1: [    4.134554]  0xffffff800832a208
> (XEN) DOM1: [    4.138807]  0xffffff800832bd38
> (XEN) DOM1: [    4.143060]  0xffffff800832b5d8
> (XEN) DOM1: [    4.147314]  0xffffff800832d1f0
> (XEN) DOM1: [    4.151567]  0xffffff800832e318
> (XEN) DOM1: [    4.155820]  0xffffff800861d5f8
> (XEN) DOM1: [    4.160073]  0xffffff800808397c
> (XEN) DOM1: [    4.164326]  0xffffff8008600db4
> (XEN) DOM1: [    4.168580]  0xffffff80085078c0
> (XEN) DOM1: [    4.172833]  0xffffff8008084c30
> (XEN) DOM1: [    4.177091] Code: b9000ea0 d5033e9f f9400ea0 91012000 (b900001f)
> (XEN) DOM1: [    4.184298] ---[ end trace 7dc5f6b878cccbfa ]---
> (XEN) DOM1: [    4.191546] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>  
> 
> I uploaded on pastebin.com the u-boot env settings [0], my device
> passthrough partial dts [1], and the whole log of boot messages
> from xen, Dom0 and DomU [2].

I don't know for sure what caused the kernel panic you are seeing,
however, I spotted a couple of issues:

1) A missing feature in the original direct-map patch, specifically it
   couldn't handle interrupts. Please give a try at the updated branch.
2) missing information in the partial device tree.

You have:

        usdhc@402F0000 {
            xen,force-assign-without-iommu;
            #address-cells = <1>;
            #size-cells = <0>;
            compatible = "fsl,s32gen1-usdhc";
            status = "okay";
            reg = <0x0 0x402f0000 0x1000>;
            interrupt-parent = <&gic>;
            interrupts = <0 36 4>;
            clocks = <&misc_clk &misc_clk1 &misc_clk2>;
            clock-names = "ipg", "ahb", "per";
            bus-width = <8>;
            xen,reg = <0x0 0x4002f000 0x1000 0x0 0x4002f000>;
        };

You also need to specify xen,path so that the interrupts are properly
remapped (with my latest direct-map patch series.) Something like:

            xen,path = "/amba/usdhc@402F0000";
            xen,reg = <0x0 0x402f0000 0x10000 0x0 0x402f0000>;
            xen,force-assign-without-iommu;

Assuming that /amba/usdhc@402F0000 is the right path on the host device
tree. Also you shouldn't need the following under usdhc@402F0000:

            #address-cells = <1>;
            #size-cells = <0>;

So overall I'd use:

        usdhc@402F0000 {
            compatible = "fsl,s32gen1-usdhc";
            status = "okay";
            reg = <0x0 0x402f0000 0x1000>;
            interrupt-parent = <&gic>;
            interrupts = <0 36 4>;
            clocks = <&misc_clk &misc_clk1 &misc_clk2>;
            clock-names = "ipg", "ahb", "per";
            bus-width = <8>;
            xen,path = "/amba/usdhc@402F0000";
            xen,reg = <0x0 0x4002f000 0x1000 0x0 0x4002f000>;
            xen,force-assign-without-iommu;
        };


> I also modified the guest address
> layout and mapped the PL011 UART and GICv3 addresses to match
> the physical ones, as well as setting the GUEST_GNTTAB_BASE and
> GUEST_MAGIC_BASE to addresses before our board's RAM start address.
> I updated the GUEST_RAM0_BASE and GUEST_RAM0_SIZE to match the
> physical ones.

Well done! FYI one of the new things in my updated patch series is the
ability to set emulated devices addresses based on the corresponding
physical addresses automatically. Not everything is done yet, but it is
a start.


> Maybe you could check if I did anything wrong, because I couldn't
> figure it out.

Let me know how it goes with the updated partial device tree and
direct-map branch. The changes I suggested should fix the interrupts
setup. However, the kernel panic you are seeing might be caused by
something else -- there might be also another bug.

  
 
> [0] https://pastebin.com/As6PgVFf
> 
> [1] https://pastebin.com/j0NS4x5Z
> 
> [2] https://pastebin.com/TaZR8pii
> 
>  
> 
> Thank you once again for your support,
> 
> Andrei
--8323329-2015755669-1581541913=:1018
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2015755669-1581541913=:1018--

