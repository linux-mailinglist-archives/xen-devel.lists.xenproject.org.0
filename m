Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCF157218D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 19:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365963.596484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBJKs-0003rF-DL; Tue, 12 Jul 2022 17:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365963.596484; Tue, 12 Jul 2022 17:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBJKs-0003oW-9e; Tue, 12 Jul 2022 17:06:10 +0000
Received: by outflank-mailman (input) for mailman id 365963;
 Tue, 12 Jul 2022 17:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xDJC=XR=cachengo.com=brad@srs-se1.protection.inumbo.net>)
 id 1oBJKq-0003oQ-RF
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 17:06:09 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e826cb67-0204-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 19:06:01 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id y4so10924047edc.4
 for <xen-devel@lists.xen.org>; Tue, 12 Jul 2022 10:06:01 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e826cb67-0204-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cachengo.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mPvlCY0D7q1NbpG5A6luYlqO1cYR+DoRmnFAVONJxk8=;
        b=L9p5XwJo/qqd3+L1Cd/plS2N+fPmv1w9dcPWmZQgsp2LkZadY0N9DBxTujQNJbXFgB
         6g4XLcNb7/ddmvwOgVoy+Er7+8X23MO0wFzOTltwPWVjnYPhY8dUj3c0BA+egaXMzfHt
         8GGAE0yapjLLT6TCxhdbbKjwdsLqMm4uGZVwY4Ge2cdNgRBIm7zjcUonnpGX9SAz4u1f
         WSsjThULfmQ6HgHrN/xhhvqHZ0fkGhY/RnEGs4WKhQyG8LJyh+Gs6Bq/ZoohJXyNCL+2
         Log5+MwAFcxJSeH+mobGQoo//Hl4r+voaGzWDLGgB5XUKXUGK1NpPMr7cVGZBDjBrPRn
         ldsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mPvlCY0D7q1NbpG5A6luYlqO1cYR+DoRmnFAVONJxk8=;
        b=y2buHOS3nTAmcI2IPkySwdLaai+aRsPy/xMwGIrV6JKXdiuyUYleejIyj8LTRcvDWv
         ZiHWdADVkWeCx46QWKtJm0qzocQmi+CYqeE6u8E9wSWw9tpKGePWkjns90o9WUxkrD0S
         pmCp1PqBeL5zlPububvh8TrGRMCDRZ2lcwdEm6ia/UoQMqh+qFdrN72z5L5X16n50RAD
         8ntUyVgSFeYEUATvLjKn00hKY8C7Nur7C//Hcb9evkR/fE9xAFNLUtB+theeN3aGVeky
         e5nU55xd6+55bzghbVgLSRWnsZqMRUO0zlsuBMhKpy+eN6kC10G3Rcz9E7P+v86WT7eb
         FuIg==
X-Gm-Message-State: AJIora+xegvca0E2OSzGtqE7MfQrXZZy/Tszl2GxUPtfXs6V53hAjIFs
	kwjC9fqCYV/8Qmbr4odlBDME8Zi0XlOezYItzdxlTizeQBWXDw==
X-Google-Smtp-Source: AGRyM1t8Lla/OAFCqEYh5HJzjWSZKrDNn9YiDIMSNAhLolPJN3zmZJYx1bpHLz/0oiauHgQaodcuK76NcOyS05g2qWQ=
X-Received: by 2002:a05:6402:3290:b0:43a:86c4:af70 with SMTP id
 f16-20020a056402329000b0043a86c4af70mr32747857eda.313.1657645561263; Tue, 12
 Jul 2022 10:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdBLPN183W-t5bNJvxGb=t0kL4QHFQNQ7O3LZAd_yXUOrSStA@mail.gmail.com>
 <C84A929A-CCFC-497E-96C8-8D5EC3DE9AFD@arm.com> <CAMdBLPP62J250=ZTAM=vMR-a0rD_AdFxnbP5WVtybDiLisEV9w@mail.gmail.com>
 <ECBAC842-3E20-4956-BACF-CB6D8CE708F8@arm.com> <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
In-Reply-To: <CAMdBLPOXnHuXyC9pqN=w4i8nD9aLXtBBhXL1JuUe-igsPkBwYQ@mail.gmail.com>
From: Brad Churchwell <brad@cachengo.com>
Date: Tue, 12 Jul 2022 12:05:50 -0500
Message-ID: <CAMdBLPNdJr=Qn9q2mkW3pcKGgos-MbAbA_AmEUR6uUjqumWNEg@mail.gmail.com>
Subject: Re: Xen on rk3399
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000d7c92805e39eae08"

--000000000000d7c92805e39eae08
Content-Type: text/plain; charset="UTF-8"

Sorry for all of the emails, but here is /proc/device-tree with XEN and
without XEN:

with Xen:

With XEN

qos@ffa60080                   interrupt-parent
qos@ffa90000                   qos@ffaa8080
pmu-clock-controller@ff750000  watchdog@ff848000
pwm@ff420030                   serial@ff1b0000
vcc5v0-usb-regulator           qos@ffa76000
mmc@fe310000                   iommu@ff903f00
i2c@ff110000                   #size-cells
spdif@ff870000                 qos@ffab0080
interrupt-controller           qos@ffae0000
serial@ff370000                spi@ff200000
qos@ffac8080                   xin24m
name                           hypervisor
vop@ff8f0000                   psci
vcc12v-dcin                    vcc-0v9
clock-controller@ff760000      leds
qos@ffab8000                   qos@ffaa0000
qos@ffa60100                   iommu@ff914000
qos@ffac0000                   model
i2c@ff3d0000                   vcc5v0-sys
cpus                           video-codec@ff650000
mipi@ff968000                  thermal-zones
isp0@ff910000                  i2s@ff890000
external-gmac-clock            rga@ff680000
dma-controller@ff6d0000        spi@ff1e0000
spi@ff1c0000                   iommu@ff670800
qos@ffa5c000                   dp@fec00000
iommu@ff650800                 opp-table0
serial@ff190000                display-subsystem
vop@ff900000                   qos@ffa98000
chosen                         i2c@ff160000
i2c@ff140000                   qos@ffa70080
edp@ff970000                   efuse@ff690000
opp-table1                     syscon@ff770000
i2s@ff8a0000                   hdmi-sound
usb@fe3c0000                   mmc@fe320000
qos@ffa60180                   qos@ffa58000
usb@fe800000                   i2c@ff120000
qos@ffac0080                   usb@fe3e0000
aliases                        qos@ffad8080
vcc3v3-pcie-regulator          saradc@ff100000
qos@ffaa8000                   usb@fe3a0000
phy@ff800000                   opp-table2
hdmi@ff940000                  qos@ffac8000
qos@ffab0000                   qos@ffaa0080
i2c@ff3c0000                   rktimer@ff850000
iommu@ff924000                 qos@ffad0000
compatible                     pcie@f8000000
sdio-pwrseq                    i2c@ff3e0000
video-codec@ff660000           memory@20000000
timer                          gpu@ff9a0000
iommu@ff8f3f00                 qos@ffa74000
mipi@ff960000                  #address-cells
syscon@ff320000                power-management@ff310000
spi@ff1f0000                   pinctrl
vcc3v3-sys                     pwm@ff420000
vcc-phy-regulator              vcc1v8-s0
spi@ff350000                   i2s@ff880000
ethernet@fe300000              dma-controller@ff6e0000
usb@fe380000                   spi@ff1d0000
serial@ff180000                iommu@ff660480
usb@fe900000                   pwm@ff420010
tsadc@ff260000                 phy@ff7c0000
mmc@fe330000                   pwm@ff420020
i2c@ff130000                   i2c@ff150000
qos@ffa70000

Without Xen

root@zaku:/home/.cachengo# ls /proc/device-tree
'#address-cells'                 qos@ffa5c000
'#size-cells'                    qos@ffa60080
 aliases                         qos@ffa60100
 chosen                          qos@ffa60180
 clock-controller@ff760000       qos@ffa70000
 compatible                      qos@ffa70080
 cpus                            qos@ffa74000
 display-subsystem               qos@ffa76000
 dma-controller@ff6d0000         qos@ffa90000
 dma-controller@ff6e0000         qos@ffa98000
 dp@fec00000                     qos@ffaa0000
 edp@ff970000                    qos@ffaa0080
 efuse@ff690000                  qos@ffaa8000
 ethernet@fe300000               qos@ffaa8080
 external-gmac-clock             qos@ffab0000
 gpu@ff9a0000                    qos@ffab0080
 hdmi-sound                      qos@ffab8000
 hdmi@ff940000                   qos@ffac0000
 i2c@ff110000                    qos@ffac0080
 i2c@ff120000                    qos@ffac8000
 i2c@ff130000                    qos@ffac8080
 i2c@ff140000                    qos@ffad0000
 i2c@ff150000                    qos@ffad8080
 i2c@ff160000                    qos@ffae0000
 i2c@ff3c0000                    rga@ff680000
 i2c@ff3d0000                    rktimer@ff850000
 i2c@ff3e0000                    saradc@ff100000
 i2s@ff880000                    sdio-pwrseq
 i2s@ff890000                    serial@ff180000
 i2s@ff8a0000                    serial@ff190000
 interrupt-controller@fee00000   serial@ff1a0000
 interrupt-parent                serial@ff1b0000
 iommu@ff650800                  serial@ff370000
 iommu@ff660480                  spdif@ff870000
 iommu@ff670800                  spi@ff1c0000
 iommu@ff8f3f00                  spi@ff1d0000
 iommu@ff903f00                  spi@ff1e0000
 iommu@ff914000                  spi@ff1f0000
 iommu@ff924000                  spi@ff200000
 isp0@ff910000                   spi@ff350000
 leds                            syscon@ff320000
 memory                          syscon@ff770000
 mipi@ff960000                   thermal-zones
 mipi@ff968000                   timer
 mmc@fe310000                    tsadc@ff260000
 mmc@fe320000                    usb@fe380000
 mmc@fe330000                    usb@fe3a0000
 model                           usb@fe3c0000
 name                            usb@fe3e0000
 opp-table0                      usb@fe800000
 opp-table1                      usb@fe900000
 opp-table2                      vcc-0v9
 pcie@f8000000                   vcc-phy-regulator
 phy@ff7c0000                    vcc12v-dcin
 phy@ff800000                    vcc1v8-s0
 pinctrl                         vcc3v3-pcie-regulator
 pmu-clock-controller@ff750000   vcc3v3-sys
 pmu_a53                         vcc5v0-sys
 pmu_a72                         vcc5v0-usb-regulator
 power-management@ff310000       video-codec@ff650000
 psci                            video-codec@ff660000
 pwm@ff420000                    vop@ff8f0000
 pwm@ff420010                    vop@ff900000
 pwm@ff420020                    watchdog@ff848000
 pwm@ff420030                    xin24m
 qos@ffa58000

With XEN

qos@ffa60080                   interrupt-parent
qos@ffa90000                   qos@ffaa8080
pmu-clock-controller@ff750000  watchdog@ff848000
pwm@ff420030                   serial@ff1b0000
vcc5v0-usb-regulator           qos@ffa76000
mmc@fe310000                   iommu@ff903f00
i2c@ff110000                   #size-cells
spdif@ff870000                 qos@ffab0080
interrupt-controller           qos@ffae0000
serial@ff370000                spi@ff200000
qos@ffac8080                   xin24m
name                           hypervisor
vop@ff8f0000                   psci
vcc12v-dcin                    vcc-0v9
clock-controller@ff760000      leds
qos@ffab8000                   qos@ffaa0000
qos@ffa60100                   iommu@ff914000
qos@ffac0000                   model
i2c@ff3d0000                   vcc5v0-sys
cpus                           video-codec@ff650000
mipi@ff968000                  thermal-zones
isp0@ff910000                  i2s@ff890000
external-gmac-clock            rga@ff680000
dma-controller@ff6d0000        spi@ff1e0000
spi@ff1c0000                   iommu@ff670800
qos@ffa5c000                   dp@fec00000
iommu@ff650800                 opp-table0
serial@ff190000                display-subsystem
vop@ff900000                   qos@ffa98000
chosen                         i2c@ff160000
i2c@ff140000                   qos@ffa70080
edp@ff970000                   efuse@ff690000
opp-table1                     syscon@ff770000
i2s@ff8a0000                   hdmi-sound
usb@fe3c0000                   mmc@fe320000
qos@ffa60180                   qos@ffa58000
usb@fe800000                   i2c@ff120000
qos@ffac0080                   usb@fe3e0000
aliases                        qos@ffad8080
vcc3v3-pcie-regulator          saradc@ff100000
qos@ffaa8000                   usb@fe3a0000
phy@ff800000                   opp-table2
hdmi@ff940000                  qos@ffac8000
qos@ffab0000                   qos@ffaa0080
i2c@ff3c0000                   rktimer@ff850000
iommu@ff924000                 qos@ffad0000
compatible                     pcie@f8000000
sdio-pwrseq                    i2c@ff3e0000
video-codec@ff660000           memory@20000000
timer                          gpu@ff9a0000
iommu@ff8f3f00                 qos@ffa74000
mipi@ff960000                  #address-cells
syscon@ff320000                power-management@ff310000
spi@ff1f0000                   pinctrl
vcc3v3-sys                     pwm@ff420000
vcc-phy-regulator              vcc1v8-s0
spi@ff350000                   i2s@ff880000
ethernet@fe300000              dma-controller@ff6e0000
usb@fe380000                   spi@ff1d0000
serial@ff180000                iommu@ff660480
usb@fe900000                   pwm@ff420010
tsadc@ff260000                 phy@ff7c0000
mmc@fe330000                   pwm@ff420020
i2c@ff130000                   i2c@ff150000
qos@ffa70000

Without Xen

root@zaku:/home/.cachengo# ls /proc/device-tree
'#address-cells'                 qos@ffa5c000
'#size-cells'                    qos@ffa60080
 aliases                         qos@ffa60100
 chosen                          qos@ffa60180
 clock-controller@ff760000       qos@ffa70000
 compatible                      qos@ffa70080
 cpus                            qos@ffa74000
 display-subsystem               qos@ffa76000
 dma-controller@ff6d0000         qos@ffa90000
 dma-controller@ff6e0000         qos@ffa98000
 dp@fec00000                     qos@ffaa0000
 edp@ff970000                    qos@ffaa0080
 efuse@ff690000                  qos@ffaa8000
 ethernet@fe300000               qos@ffaa8080
 external-gmac-clock             qos@ffab0000
 gpu@ff9a0000                    qos@ffab0080
 hdmi-sound                      qos@ffab8000
 hdmi@ff940000                   qos@ffac0000
 i2c@ff110000                    qos@ffac0080
 i2c@ff120000                    qos@ffac8000
 i2c@ff130000                    qos@ffac8080
 i2c@ff140000                    qos@ffad0000
 i2c@ff150000                    qos@ffad8080
 i2c@ff160000                    qos@ffae0000
 i2c@ff3c0000                    rga@ff680000
 i2c@ff3d0000                    rktimer@ff850000
 i2c@ff3e0000                    saradc@ff100000
 i2s@ff880000                    sdio-pwrseq
 i2s@ff890000                    serial@ff180000
 i2s@ff8a0000                    serial@ff190000
 interrupt-controller@fee00000   serial@ff1a0000
 interrupt-parent                serial@ff1b0000
 iommu@ff650800                  serial@ff370000
 iommu@ff660480                  spdif@ff870000
 iommu@ff670800                  spi@ff1c0000
 iommu@ff8f3f00                  spi@ff1d0000
 iommu@ff903f00                  spi@ff1e0000
 iommu@ff914000                  spi@ff1f0000
 iommu@ff924000                  spi@ff200000
 isp0@ff910000                   spi@ff350000
 leds                            syscon@ff320000
 memory                          syscon@ff770000
 mipi@ff960000                   thermal-zones
 mipi@ff968000                   timer
 mmc@fe310000                    tsadc@ff260000
 mmc@fe320000                    usb@fe380000
 mmc@fe330000                    usb@fe3a0000
 model                           usb@fe3c0000
 name                            usb@fe3e0000
 opp-table0                      usb@fe800000
 opp-table1                      usb@fe900000
 opp-table2                      vcc-0v9
 pcie@f8000000                   vcc-phy-regulator
 phy@ff7c0000                    vcc12v-dcin
 phy@ff800000                    vcc1v8-s0
 pinctrl                         vcc3v3-pcie-regulator
 pmu-clock-controller@ff750000   vcc3v3-sys
 pmu_a53                         vcc5v0-sys
 pmu_a72                         vcc5v0-usb-regulator
 power-management@ff310000       video-codec@ff650000
 psci                            video-codec@ff660000
 pwm@ff420000                    vop@ff8f0000
 pwm@ff420010                    vop@ff900000
 pwm@ff420020                    watchdog@ff848000
 pwm@ff420030                    xin24m
 qos@ffa58000

On Tue, Jul 12, 2022 at 11:24 AM Brad Churchwell <brad@cachengo.com> wrote:

> Hi Bertrand,
>
> I believe I understand, but just to clarify, should I leave the
> ppi-partitions block in rk3399.dtsi as is and disable the little cores, or
> should I also modify that block?
>
> Brad
>
> On Tue, Jul 12, 2022 at 11:11 AM Bertrand Marquis <
> Bertrand.Marquis@arm.com> wrote:
>
>> Hi Brad,
>>
>> > On 12 Jul 2022, at 16:59, Brad Churchwell <brad@cachengo.com> wrote:
>> >
>> > Hi Bertrand,
>> >
>> > Thanks so much for the quick response!
>> >
>> > I should have mentioned previously that this device tree and kernel
>> Image (5.15.16) does boot properly with the rootfs without XEN. The
>> interrupt errors are only present when booting with XEN.
>> >
>> > These are custom boards and they do have usb c, however we are unable
>> to boot from usb as it doesn't receive power.  We currently only use the
>> usb to flash u-boot to spi which requires us to use a separate power
>> adapter. These boards get power and networking through a custom backplane
>> and interface with the backplane via a sata style justice (I'm not sure
>> what the proper terminology would be here).
>> >
>> > Since I cannot boot to rootfs with XEN, I'm unable to show the device
>> tree there. The only bit that I added to accommodate XEN is this bit here:
>> >
>> > chosen {
>> >     stdout-path = "serial2:1500000n8";
>> >     bootargs = "hmp-unsafe=true";
>> >     xen,dom0-bootargs = "console=hvc0 earlyprintk=xen clk_ignore_unused
>> root=/dev/nvme0n1p2 rw init=/sbin/init rootwait rootfstype=ext4
>> ignore_loglevel";
>> >     modules {
>> >         #address-cells = <2>;
>> >         #size-cells = <2>;
>> >
>> >         module@1 {
>> >             compatible = "xen,linux-zimage", "xen,multiboot-module";
>> >             reg = <0x0 0x03F80000 0x0 0x01aa8008>;
>> >         };
>> >         module@2 {
>> >             compatible = "xen,linux-initrd", "xen,multiboot-module";
>> >             reg = <0x0 0x06000000 0x0 0x02000000>;
>> >         };
>> >     };
>> >
>> > };
>> >
>> > The gic declaration is in the vanilla rk3399.dtsi file and hasn't been
>> modified:
>> >
>> >         gic: interrupt-controller@fee00000 {
>> >                 compatible = "arm,gic-v3";
>> >                 #interrupt-cells = <4>;
>> >                 #address-cells = <2>;
>> >                 #size-cells = <2>;
>> >                 ranges;
>> >                 interrupt-controller;
>> >
>> >                 reg = <0x0 0xfee00000 0 0x10000>, /* GICD */
>> >                       <0x0 0xfef00000 0 0xc0000>, /* GICR */
>> >                       <0x0 0xfff00000 0 0x10000>, /* GICC */
>> >                       <0x0 0xfff10000 0 0x10000>, /* GICH */
>> >                       <0x0 0xfff20000 0 0x10000>; /* GICV */
>> >                 interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
>> >                 its: interrupt-controller@fee20000 {
>> >                         compatible = "arm,gic-v3-its";
>> >                         msi-controller;
>> >                         #msi-cells = <1>;
>> >                         reg = <0x0 0xfee20000 0x0 0x20000>;
>> >                 };
>> >
>> >                 ppi-partitions {
>> >                         ppi_cluster0: interrupt-partition-0 {
>> >                                 affinity = <&cpu_l0 &cpu_l1 &cpu_l2
>> &cpu_l3>;
>> >                         };
>> >
>> >                         ppi_cluster1: interrupt-partition-1 {
>> >                                 affinity = <&cpu_b0 &cpu_b1>;
>> >                         };
>> >                 };
>>
>> Xen is not supporting PPI partitions.
>> I also saw that your booting using SMP unsafe so all core are enabled by
>> Xen.
>>
>> Right now big/little is not supported by Xen and here you might have some
>> interrupts in your system which can only occur on some specific cores.
>> I would suggest to try the following:
>> - only boot enable in your dtb the cores with the same type than the boot
>> core
>> - check in your device tree which devices are assign to the ppi_cluster
>> not available and disable them
>>
>> This kind of configuration will be tricky to handle so it will depend on
>> which devices have interrupts that can only be fired on one cluster type.
>>
>> Sorry but I cannot right now check in the device tree and do those checks
>> myself but if you do get the idea send back a mail :-)
>>
>> Cheers
>> Bertrand
>>
>> >         };
>> >
>> > I've attached the device tree and include files just in case you'd like
>> to take a look at those.
>> >
>> > Thanks so much for your help! I've been at this for weeks with very
>> little progress.
>> >
>> > Cheers,
>> > Brad
>> >
>> >
>> > On Tue, Jul 12, 2022 at 10:05 AM Bertrand Marquis <
>> Bertrand.Marquis@arm.com> wrote:
>> > Hi Brad,
>> >
>> > > On 11 Jul 2022, at 19:38, Brad Churchwell <brad@cachengo.com> wrote:
>> > >
>> > > Hello,
>> > >
>> > > I've been trying to get Xen to boot dom0 with my kernel for weeks on
>> an rk3399 based board and thought I'd reach out for help. It looks like
>> either Xen is not properly recreating the device tree or the interrupt
>> controller is just failing. The hypervisor boots but falls to initramfs
>> because it cannot find the root device (nvme on pcie). Any help would be
>> greatly appreciated. Here is the complete boot log
>> >
>> > From the logs you have an issue with the interrupt controller and the
>> fact that your NVME is behind PCIE and as such depends on ITS is probably
>> not helping.
>> >
>> > I would suggest to try to boot on usb as root fs for a try.
>> >
>> > Also it could be useful to compare the device tree on xen and without
>> xen to understand what is going on (using /proc/device-tree).
>> >
>> > Xen seems to be ok but Linux is not happy with interrupts and is
>> showing several issues around this area on your logs.
>> > Could you show us an extract of your device tree around the gic
>> declaration ?
>> >
>> > Cheers
>> > Bertrand
>> >
>> >
>> > IMPORTANT NOTICE: The contents of this email and any attachments are
>> confidential and may also be privileged. If you are not the intended
>> recipient, please notify the sender immediately and do not disclose the
>> contents to any other person, use it for any purpose, or store or copy the
>> information in any medium. Thank you.
>> > <rk3399-zaku.dts><rk3399-zaku.dtsi><rk3399.dtsi>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are
>> confidential and may also be privileged. If you are not the intended
>> recipient, please notify the sender immediately and do not disclose the
>> contents to any other person, use it for any purpose, or store or copy the
>> information in any medium. Thank you.
>>
>

--000000000000d7c92805e39eae08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+U29ycnkgZm9yIGFsbCBvZiB0aGUgZW1haWxzLCBidXQgaGVyZSBpcyAv
cHJvYy9kZXZpY2UtdHJlZSB3aXRoIFhFTiBhbmQgd2l0aG91dCBYRU46PGRpdj48YnI+PC9kaXY+
PGRpdj53aXRoIFhlbjo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldpdGggWEVOPGJyPjxicj5x
b3NAZmZhNjAwODAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW50ZXJydXB0LXBhcmVudDxi
cj5xb3NAZmZhOTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYWE4MDgwPGJy
PnBtdS1jbG9jay1jb250cm9sbGVyQGZmNzUwMDAwIMKgd2F0Y2hkb2dAZmY4NDgwMDA8YnI+cHdt
QGZmNDIwMDMwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNlcmlhbEBmZjFiMDAwMDxicj52
Y2M1djAtdXNiLXJlZ3VsYXRvciDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhNzYwMDA8YnI+bW1jQGZl
MzEwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlvbW11QGZmOTAzZjAwPGJyPmkyY0Bm
ZjExMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAjc2l6ZS1jZWxsczxicj5zcGRpZkBm
Zjg3MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhYjAwODA8YnI+aW50ZXJydXB0
LWNvbnRyb2xsZXIgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYWUwMDAwPGJyPnNlcmlhbEBmZjM3MDAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwaUBmZjIwMDAwMDxicj5xb3NAZmZhYzgwODAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgeGluMjRtPGJyPm5hbWUgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaHlwZXJ2aXNvcjxicj52b3BAZmY4ZjAwMDAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcHNjaTxicj52Y2MxMnYtZGNpbiDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHZjYy0wdjk8YnI+Y2xvY2stY29udHJvbGxlckBmZjc2MDAwMCDCoCDCoCDCoGxl
ZHM8YnI+cW9zQGZmYWI4MDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmFhMDAw
MDxicj5xb3NAZmZhNjAxMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW9tbXVAZmY5MTQw
MDA8YnI+cW9zQGZmYWMwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1vZGVsPGJyPmky
Y0BmZjNkMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2Y2M1djAtc3lzPGJyPmNwdXMg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdmlkZW8tY29kZWNAZmY2NTAw
MDA8YnI+bWlwaUBmZjk2ODAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRoZXJtYWwtem9u
ZXM8YnI+aXNwMEBmZjkxMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyc0BmZjg5MDAw
MDxicj5leHRlcm5hbC1nbWFjLWNsb2NrIMKgIMKgIMKgIMKgIMKgIMKgcmdhQGZmNjgwMDAwPGJy
PmRtYS1jb250cm9sbGVyQGZmNmQwMDAwIMKgIMKgIMKgIMKgc3BpQGZmMWUwMDAwPGJyPnNwaUBm
ZjFjMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpb21tdUBmZjY3MDgwMDxicj5xb3NA
ZmZhNWMwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZHBAZmVjMDAwMDA8YnI+aW9tbXVA
ZmY2NTA4MDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BwLXRhYmxlMDxicj5zZXJpYWxAZmYx
OTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkaXNwbGF5LXN1YnN5c3RlbTxicj52b3BAZmY5
MDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYTk4MDAwPGJyPmNob3NlbiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpMmNAZmYxNjAwMDA8YnI+aTJjQGZm
MTQwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmE3MDA4MDxicj5lZHBAZmY5
NzAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZWZ1c2VAZmY2OTAwMDA8YnI+b3BwLXRh
YmxlMSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzeXNjb25AZmY3NzAwMDA8YnI+aTJz
QGZmOGEwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGhkbWktc291bmQ8YnI+dXNiQGZl
M2MwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1tY0BmZTMyMDAwMDxicj5xb3NAZmZh
NjAxODAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYTU4MDAwPGJyPnVzYkBmZTgw
MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpMmNAZmYxMjAwMDA8YnI+cW9zQGZmYWMw
MDgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVzYkBmZTNlMDAwMDxicj5hbGlhc2VzIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYWQ4MDgwPGJyPnZjYzN2My1w
Y2llLXJlZ3VsYXRvciDCoCDCoCDCoCDCoCDCoHNhcmFkY0BmZjEwMDAwMDxicj5xb3NAZmZhYTgw
MDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdXNiQGZlM2EwMDAwPGJyPnBoeUBmZjgwMDAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcHAtdGFibGUyPGJyPmhkbWlAZmY5NDAwMDAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhYzgwMDA8YnI+cW9zQGZmYWIwMDAwIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmFhMDA4MDxicj5pMmNAZmYzYzAwMDAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmt0aW1lckBmZjg1MDAwMDxicj5pb21tdUBmZjkyNDAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhZDAwMDA8YnI+Y29tcGF0aWJsZSDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwY2llQGY4MDAwMDAwPGJyPnNkaW8tcHdyc2VxIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjQGZmM2UwMDAwPGJyPnZpZGVvLWNvZGVjQGZm
NjYwMDAwIMKgIMKgIMKgIMKgIMKgIG1lbW9yeUAyMDAwMDAwMDxicj50aW1lciDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdwdUBmZjlhMDAwMDxicj5pb21tdUBmZjhmM2Yw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhNzQwMDA8YnI+bWlwaUBmZjk2MDAwMCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzPGJyPnN5c2NvbkBmZjMyMDAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBvd2VyLW1hbmFnZW1lbnRAZmYzMTAwMDA8YnI+c3Bp
QGZmMWYwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBpbmN0cmw8YnI+dmNjM3YzLXN5
cyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwd21AZmY0MjAwMDA8YnI+dmNjLXBoeS1y
ZWd1bGF0b3IgwqAgwqAgwqAgwqAgwqAgwqAgwqB2Y2MxdjgtczA8YnI+c3BpQGZmMzUwMDAwIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGkyc0BmZjg4MDAwMDxicj5ldGhlcm5ldEBmZTMwMDAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRtYS1jb250cm9sbGVyQGZmNmUwMDAwPGJyPnVzYkBmZTM4
MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzcGlAZmYxZDAwMDA8YnI+c2VyaWFsQGZm
MTgwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW9tbXVAZmY2NjA0ODA8YnI+dXNiQGZlOTAw
MDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHB3bUBmZjQyMDAxMDxicj50c2FkY0BmZjI2
MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwaHlAZmY3YzAwMDA8YnI+bW1jQGZlMzMwMDAw
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHB3bUBmZjQyMDAyMDxicj5pMmNAZmYxMzAwMDAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaTJjQGZmMTUwMDAwPGJyPnFvc0BmZmE3MDAwMDxi
cj48YnI+V2l0aG91dCBYZW48YnI+PGJyPnJvb3RAemFrdTovaG9tZS8uY2FjaGVuZ28jIGxzIC9w
cm9jL2RldmljZS10cmVlPGJyPiYjMzk7I2FkZHJlc3MtY2VsbHMmIzM5OyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBxb3NAZmZhNWMwMDA8YnI+JiMzOTsjc2l6ZS1jZWxscyYjMzk7IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYTYwMDgwPGJyPsKgYWxpYXNlcyDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhNjAxMDA8YnI+wqBjaG9zZW4gwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhNjAxODA8YnI+wqBjbG9jay1j
b250cm9sbGVyQGZmNzYwMDAwIMKgIMKgIMKgIHFvc0BmZmE3MDAwMDxicj7CoGNvbXBhdGlibGUg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhNzAwODA8YnI+wqBjcHVzIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYTc0MDAwPGJyPsKg
ZGlzcGxheS1zdWJzeXN0ZW0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYTc2MDAwPGJyPsKg
ZG1hLWNvbnRyb2xsZXJAZmY2ZDAwMDAgwqAgwqAgwqAgwqAgcW9zQGZmYTkwMDAwPGJyPsKgZG1h
LWNvbnRyb2xsZXJAZmY2ZTAwMDAgwqAgwqAgwqAgwqAgcW9zQGZmYTk4MDAwPGJyPsKgZHBAZmVj
MDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYWEwMDAwPGJyPsKgZWRw
QGZmOTcwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYWEwMDgwPGJyPsKg
ZWZ1c2VAZmY2OTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhYTgwMDA8YnI+
wqBldGhlcm5ldEBmZTMwMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhYTgwODA8YnI+
wqBleHRlcm5hbC1nbWFjLWNsb2NrIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmFiMDAwMDxicj7C
oGdwdUBmZjlhMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFvc0BmZmFiMDA4MDxi
cj7CoGhkbWktc291bmQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhYjgw
MDA8YnI+wqBoZG1pQGZmOTQwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmFj
MDAwMDxicj7CoGkyY0BmZjExMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFvc0Bm
ZmFjMDA4MDxicj7CoGkyY0BmZjEyMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFv
c0BmZmFjODAwMDxicj7CoGkyY0BmZjEzMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHFvc0BmZmFjODA4MDxicj7CoGkyY0BmZjE0MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHFvc0BmZmFkMDAwMDxicj7CoGkyY0BmZjE1MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHFvc0BmZmFkODA4MDxicj7CoGkyY0BmZjE2MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHFvc0BmZmFlMDAwMDxicj7CoGkyY0BmZjNjMDAwMCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJnYUBmZjY4MDAwMDxicj7CoGkyY0BmZjNkMDAwMCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJrdGltZXJAZmY4NTAwMDA8YnI+wqBpMmNAZmYzZTAwMDAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzYXJhZGNAZmYxMDAwMDA8YnI+wqBpMnNAZmY4ODAwMDAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZGlvLXB3cnNlcTxicj7CoGkyc0BmZjg5MDAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcmlhbEBmZjE4MDAwMDxicj7CoGkyc0Bm
ZjhhMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcmlhbEBmZjE5MDAwMDxicj7C
oGludGVycnVwdC1jb250cm9sbGVyQGZlZTAwMDAwIMKgIHNlcmlhbEBmZjFhMDAwMDxicj7CoGlu
dGVycnVwdC1wYXJlbnQgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXJpYWxAZmYxYjAwMDA8YnI+
wqBpb21tdUBmZjY1MDgwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcmlhbEBmZjM3MDAw
MDxicj7CoGlvbW11QGZmNjYwNDgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3BkaWZAZmY4
NzAwMDA8YnI+wqBpb21tdUBmZjY3MDgwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNwaUBm
ZjFjMDAwMDxicj7CoGlvbW11QGZmOGYzZjAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Bp
QGZmMWQwMDAwPGJyPsKgaW9tbXVAZmY5MDNmMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBz
cGlAZmYxZTAwMDA8YnI+wqBpb21tdUBmZjkxNDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHNwaUBmZjFmMDAwMDxicj7CoGlvbW11QGZmOTI0MDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgc3BpQGZmMjAwMDAwPGJyPsKgaXNwMEBmZjkxMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBzcGlAZmYzNTAwMDA8YnI+wqBsZWRzIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgc3lzY29uQGZmMzIwMDAwPGJyPsKgbWVtb3J5IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3lzY29uQGZmNzcwMDAwPGJyPsKgbWlwaUBmZjk2MDAwMCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0aGVybWFsLXpvbmVzPGJyPsKgbWlwaUBmZjk2ODAw
MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0aW1lcjxicj7CoG1tY0BmZTMxMDAwMCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRzYWRjQGZmMjYwMDAwPGJyPsKgbW1jQGZlMzIwMDAw
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdXNiQGZlMzgwMDAwPGJyPsKgbW1jQGZlMzMw
MDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdXNiQGZlM2EwMDAwPGJyPsKgbW9kZWwg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdXNiQGZlM2MwMDAwPGJyPsKg
bmFtZSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVzYkBmZTNlMDAw
MDxicj7CoG9wcC10YWJsZTAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1c2JAZmU4
MDAwMDA8YnI+wqBvcHAtdGFibGUxIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdXNi
QGZlOTAwMDAwPGJyPsKgb3BwLXRhYmxlMiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHZjYy0wdjk8YnI+wqBwY2llQGY4MDAwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZj
Yy1waHktcmVndWxhdG9yPGJyPsKgcGh5QGZmN2MwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdmNjMTJ2LWRjaW48YnI+wqBwaHlAZmY4MDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB2Y2MxdjgtczA8YnI+wqBwaW5jdHJsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIHZjYzN2My1wY2llLXJlZ3VsYXRvcjxicj7CoHBtdS1jbG9jay1jb250cm9sbGVy
QGZmNzUwMDAwIMKgIHZjYzN2My1zeXM8YnI+wqBwbXVfYTUzIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHZjYzV2MC1zeXM8YnI+wqBwbXVfYTcyIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHZjYzV2MC11c2ItcmVndWxhdG9yPGJyPsKgcG93ZXItbWFuYWdl
bWVudEBmZjMxMDAwMCDCoCDCoCDCoCB2aWRlby1jb2RlY0BmZjY1MDAwMDxicj7CoHBzY2kgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2aWRlby1jb2RlY0BmZjY2MDAw
MDxicj7CoHB3bUBmZjQyMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZvcEBmZjhm
MDAwMDxicj7CoHB3bUBmZjQyMDAxMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZvcEBm
ZjkwMDAwMDxicj7CoHB3bUBmZjQyMDAyMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHdh
dGNoZG9nQGZmODQ4MDAwPGJyPsKgcHdtQGZmNDIwMDMwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgeGluMjRtPGJyPsKgcW9zQGZmYTU4MDAwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5X
aXRoIFhFTjxicj48YnI+cW9zQGZmYTYwMDgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlu
dGVycnVwdC1wYXJlbnQ8YnI+cW9zQGZmYTkwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IHFvc0BmZmFhODA4MDxicj5wbXUtY2xvY2stY29udHJvbGxlckBmZjc1MDAwMCDCoHdhdGNoZG9n
QGZmODQ4MDAwPGJyPnB3bUBmZjQyMDAzMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzZXJp
YWxAZmYxYjAwMDA8YnI+dmNjNXYwLXVzYi1yZWd1bGF0b3IgwqAgwqAgwqAgwqAgwqAgcW9zQGZm
YTc2MDAwPGJyPm1tY0BmZTMxMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpb21tdUBm
ZjkwM2YwMDxicj5pMmNAZmYxMTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgI3NpemUt
Y2VsbHM8YnI+c3BkaWZAZmY4NzAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYWIw
MDgwPGJyPmludGVycnVwdC1jb250cm9sbGVyIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmFlMDAwMDxi
cj5zZXJpYWxAZmYzNzAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGlAZmYyMDAwMDA8YnI+
cW9zQGZmYWM4MDgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhpbjI0bTxicj5uYW1lIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGh5cGVydmlzb3I8YnI+dm9wQGZm
OGYwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBzY2k8YnI+dmNjMTJ2LWRjaW4gwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2Y2MtMHY5PGJyPmNsb2NrLWNvbnRyb2xsZXJAZmY3
NjAwMDAgwqAgwqAgwqBsZWRzPGJyPnFvc0BmZmFiODAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBxb3NAZmZhYTAwMDA8YnI+cW9zQGZmYTYwMTAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGlvbW11QGZmOTE0MDAwPGJyPnFvc0BmZmFjMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBtb2RlbDxicj5pMmNAZmYzZDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdmNj
NXYwLXN5czxicj5jcHVzIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZp
ZGVvLWNvZGVjQGZmNjUwMDAwPGJyPm1pcGlAZmY5NjgwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB0aGVybWFsLXpvbmVzPGJyPmlzcDBAZmY5MTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpMnNAZmY4OTAwMDA8YnI+ZXh0ZXJuYWwtZ21hYy1jbG9jayDCoCDCoCDCoCDCoCDCoCDC
oHJnYUBmZjY4MDAwMDxicj5kbWEtY29udHJvbGxlckBmZjZkMDAwMCDCoCDCoCDCoCDCoHNwaUBm
ZjFlMDAwMDxicj5zcGlAZmYxYzAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaW9tbXVA
ZmY2NzA4MDA8YnI+cW9zQGZmYTVjMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRwQGZl
YzAwMDAwPGJyPmlvbW11QGZmNjUwODAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wcC10YWJs
ZTA8YnI+c2VyaWFsQGZmMTkwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGlzcGxheS1zdWJz
eXN0ZW08YnI+dm9wQGZmOTAwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmE5
ODAwMDxicj5jaG9zZW4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaTJjQGZm
MTYwMDAwPGJyPmkyY0BmZjE0MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZh
NzAwODA8YnI+ZWRwQGZmOTcwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVmdXNlQGZm
NjkwMDAwPGJyPm9wcC10YWJsZTEgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3lzY29u
QGZmNzcwMDAwPGJyPmkyc0BmZjhhMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoZG1p
LXNvdW5kPGJyPnVzYkBmZTNjMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBtbWNAZmUz
MjAwMDA8YnI+cW9zQGZmYTYwMTgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0BmZmE1
ODAwMDxicj51c2JAZmU4MDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaTJjQGZmMTIw
MDAwPGJyPnFvc0BmZmFjMDA4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1c2JAZmUzZTAw
MDA8YnI+YWxpYXNlcyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFvc0BmZmFk
ODA4MDxicj52Y2MzdjMtcGNpZS1yZWd1bGF0b3IgwqAgwqAgwqAgwqAgwqBzYXJhZGNAZmYxMDAw
MDA8YnI+cW9zQGZmYWE4MDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVzYkBmZTNhMDAw
MDxicj5waHlAZmY4MDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BwLXRhYmxlMjxi
cj5oZG1pQGZmOTQwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYWM4MDAwPGJy
PnFvc0BmZmFiMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBxb3NAZmZhYTAwODA8YnI+
aTJjQGZmM2MwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJrdGltZXJAZmY4NTAwMDA8
YnI+aW9tbXVAZmY5MjQwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYWQwMDAwPGJy
PmNvbXBhdGlibGUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGNpZUBmODAwMDAwMDxi
cj5zZGlvLXB3cnNlcSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGkyY0BmZjNlMDAwMDxi
cj52aWRlby1jb2RlY0BmZjY2MDAwMCDCoCDCoCDCoCDCoCDCoCBtZW1vcnlAMjAwMDAwMDA8YnI+
dGltZXIgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBncHVAZmY5YTAwMDA8
YnI+aW9tbXVAZmY4ZjNmMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYTc0MDAwPGJy
Pm1pcGlAZmY5NjAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRkcmVzcy1jZWxsczxi
cj5zeXNjb25AZmYzMjAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwb3dlci1tYW5hZ2VtZW50
QGZmMzEwMDAwPGJyPnNwaUBmZjFmMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwaW5j
dHJsPGJyPnZjYzN2My1zeXMgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHdtQGZmNDIw
MDAwPGJyPnZjYy1waHktcmVndWxhdG9yIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmNjMXY4LXMwPGJy
PnNwaUBmZjM1MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpMnNAZmY4ODAwMDA8YnI+
ZXRoZXJuZXRAZmUzMDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkbWEtY29udHJvbGxlckBmZjZl
MDAwMDxicj51c2JAZmUzODAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3BpQGZmMWQw
MDAwPGJyPnNlcmlhbEBmZjE4MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlvbW11QGZmNjYw
NDgwPGJyPnVzYkBmZTkwMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwd21AZmY0MjAw
MTA8YnI+dHNhZGNAZmYyNjAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGh5QGZmN2MwMDAw
PGJyPm1tY0BmZTMzMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwd21AZmY0MjAwMjA8
YnI+aTJjQGZmMTMwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGkyY0BmZjE1MDAwMDxi
cj5xb3NAZmZhNzAwMDA8YnI+PGJyPldpdGhvdXQgWGVuPGJyPjxicj5yb290QHpha3U6L2hvbWUv
LmNhY2hlbmdvIyBscyAvcHJvYy9kZXZpY2UtdHJlZTxicj4mIzM5OyNhZGRyZXNzLWNlbGxzJiMz
OTsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYTVjMDAwPGJyPiYjMzk7I3NpemUtY2Vs
bHMmIzM5OyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFvc0BmZmE2MDA4MDxicj7CoGFs
aWFzZXMgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcW9zQGZmYTYwMTAwPGJy
PsKgY2hvc2VuIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYTYw
MTgwPGJyPsKgY2xvY2stY29udHJvbGxlckBmZjc2MDAwMCDCoCDCoCDCoCBxb3NAZmZhNzAwMDA8
YnI+wqBjb21wYXRpYmxlIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcW9zQGZmYTcw
MDgwPGJyPsKgY3B1cyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFv
c0BmZmE3NDAwMDxicj7CoGRpc3BsYXktc3Vic3lzdGVtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFv
c0BmZmE3NjAwMDxicj7CoGRtYS1jb250cm9sbGVyQGZmNmQwMDAwIMKgIMKgIMKgIMKgIHFvc0Bm
ZmE5MDAwMDxicj7CoGRtYS1jb250cm9sbGVyQGZmNmUwMDAwIMKgIMKgIMKgIMKgIHFvc0BmZmE5
ODAwMDxicj7CoGRwQGZlYzAwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHFvc0Bm
ZmFhMDAwMDxicj7CoGVkcEBmZjk3MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHFv
c0BmZmFhMDA4MDxicj7CoGVmdXNlQGZmNjkwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cW9zQGZmYWE4MDAwPGJyPsKgZXRoZXJuZXRAZmUzMDAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
cW9zQGZmYWE4MDgwPGJyPsKgZXh0ZXJuYWwtZ21hYy1jbG9jayDCoCDCoCDCoCDCoCDCoCDCoCBx
b3NAZmZhYjAwMDA8YnI+wqBncHVAZmY5YTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBxb3NAZmZhYjAwODA8YnI+wqBoZG1pLXNvdW5kIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcW9zQGZmYWI4MDAwPGJyPsKgaGRtaUBmZjk0MDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBxb3NAZmZhYzAwMDA8YnI+wqBpMmNAZmYxMTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBxb3NAZmZhYzAwODA8YnI+wqBpMmNAZmYxMjAwMDAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBxb3NAZmZhYzgwMDA8YnI+wqBpMmNAZmYxMzAwMDAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhYzgwODA8YnI+wqBpMmNAZmYxNDAwMDAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhZDAwMDA8YnI+wqBpMmNAZmYxNTAwMDAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhZDgwODA8YnI+wqBpMmNAZmYxNjAwMDAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBxb3NAZmZhZTAwMDA8YnI+wqBpMmNAZmYzYzAwMDAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZ2FAZmY2ODAwMDA8YnI+wqBpMmNAZmYzZDAw
MDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBya3RpbWVyQGZmODUwMDAwPGJyPsKgaTJj
QGZmM2UwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2FyYWRjQGZmMTAwMDAwPGJy
PsKgaTJzQGZmODgwMDAwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2Rpby1wd3JzZXE8
YnI+wqBpMnNAZmY4OTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXJpYWxAZmYx
ODAwMDA8YnI+wqBpMnNAZmY4YTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZXJp
YWxAZmYxOTAwMDA8YnI+wqBpbnRlcnJ1cHQtY29udHJvbGxlckBmZWUwMDAwMCDCoCBzZXJpYWxA
ZmYxYTAwMDA8YnI+wqBpbnRlcnJ1cHQtcGFyZW50IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2Vy
aWFsQGZmMWIwMDAwPGJyPsKgaW9tbXVAZmY2NTA4MDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBzZXJpYWxAZmYzNzAwMDA8YnI+wqBpb21tdUBmZjY2MDQ4MCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHNwZGlmQGZmODcwMDAwPGJyPsKgaW9tbXVAZmY2NzA4MDAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzcGlAZmYxYzAwMDA8YnI+wqBpb21tdUBmZjhmM2YwMCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHNwaUBmZjFkMDAwMDxicj7CoGlvbW11QGZmOTAzZjAwIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3BpQGZmMWUwMDAwPGJyPsKgaW9tbXVAZmY5MTQwMDAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBzcGlAZmYxZjAwMDA8YnI+wqBpb21tdUBmZjkyNDAwMCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHNwaUBmZjIwMDAwMDxicj7CoGlzcDBAZmY5MTAwMDAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgc3BpQGZmMzUwMDAwPGJyPsKgbGVkcyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN5c2NvbkBmZjMyMDAwMDxicj7CoG1lbW9yeSDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN5c2NvbkBmZjc3MDAwMDxicj7C
oG1pcGlAZmY5NjAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGhlcm1hbC16b25lczxi
cj7CoG1pcGlAZmY5NjgwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdGltZXI8YnI+wqBt
bWNAZmUzMTAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0c2FkY0BmZjI2MDAwMDxi
cj7CoG1tY0BmZTMyMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVzYkBmZTM4MDAw
MDxicj7CoG1tY0BmZTMzMDAwMCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHVzYkBmZTNh
MDAwMDxicj7CoG1vZGVsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHVz
YkBmZTNjMDAwMDxicj7CoG5hbWUgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB1c2JAZmUzZTAwMDA8YnI+wqBvcHAtdGFibGUwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdXNiQGZlODAwMDAwPGJyPsKgb3BwLXRhYmxlMSDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHVzYkBmZTkwMDAwMDxicj7CoG9wcC10YWJsZTIgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB2Y2MtMHY5PGJyPsKgcGNpZUBmODAwMDAwMCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB2Y2MtcGh5LXJlZ3VsYXRvcjxicj7CoHBoeUBmZjdjMDAwMCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHZjYzEydi1kY2luPGJyPsKgcGh5QGZmODAwMDAwIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmNjMXY4LXMwPGJyPsKgcGluY3RybCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2Y2MzdjMtcGNpZS1yZWd1bGF0b3I8YnI+wqBwbXUt
Y2xvY2stY29udHJvbGxlckBmZjc1MDAwMCDCoCB2Y2MzdjMtc3lzPGJyPsKgcG11X2E1MyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2Y2M1djAtc3lzPGJyPsKgcG11X2E3MiDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2Y2M1djAtdXNiLXJlZ3VsYXRvcjxi
cj7CoHBvd2VyLW1hbmFnZW1lbnRAZmYzMTAwMDAgwqAgwqAgwqAgdmlkZW8tY29kZWNAZmY2NTAw
MDA8YnI+wqBwc2NpIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdmlk
ZW8tY29kZWNAZmY2NjAwMDA8YnI+wqBwd21AZmY0MjAwMDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB2b3BAZmY4ZjAwMDA8YnI+wqBwd21AZmY0MjAwMTAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB2b3BAZmY5MDAwMDA8YnI+wqBwd21AZmY0MjAwMjAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB3YXRjaGRvZ0BmZjg0ODAwMDxicj7CoHB3bUBmZjQyMDAzMCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHhpbjI0bTxicj7CoHFvc0BmZmE1ODAwMDxicj48L2Rpdj48
L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbF9hdHRyIj5PbiBUdWUsIEp1bCAxMiwgMjAyMiBhdCAxMToyNCBBTSBCcmFkIENodXJjaHdl
bGwgJmx0OzxhIGhyZWY9Im1haWx0bzpicmFkQGNhY2hlbmdvLmNvbSI+YnJhZEBjYWNoZW5nby5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPkhpIEJlcnRy
YW5kLDxkaXY+PGJyPjwvZGl2PjxkaXY+SSBiZWxpZXZlIEkgdW5kZXJzdGFuZCwgYnV0IGp1c3Qg
dG8gY2xhcmlmeSwgc2hvdWxkIEkgbGVhdmUgdGhlIHBwaS1wYXJ0aXRpb25zIGJsb2NrIGluIHJr
MzM5OS5kdHNpIGFzIGlzIGFuZCBkaXNhYmxlIHRoZSBsaXR0bGUgY29yZXMsIG9yIHNob3VsZCBJ
IGFsc28gbW9kaWZ5IHRoYXQgYmxvY2s/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CcmFkPC9k
aXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfYXR0ciI+T24gVHVlLCBKdWwgMTIsIDIwMjIgYXQgMTE6MTEgQU0gQmVydHJhbmQg
TWFycXVpcyAmbHQ7PGEgaHJlZj0ibWFpbHRvOkJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiPkJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48
L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBw
eCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGlu
Zy1sZWZ0OjFleCI+SGkgQnJhZCw8YnI+DQo8YnI+DQomZ3Q7IE9uIDEyIEp1bCAyMDIyLCBhdCAx
Njo1OSwgQnJhZCBDaHVyY2h3ZWxsICZsdDs8YSBocmVmPSJtYWlsdG86YnJhZEBjYWNoZW5nby5j
b20iIHRhcmdldD0iX2JsYW5rIj5icmFkQGNhY2hlbmdvLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4N
CiZndDs8YnI+DQomZ3Q7IEhpIEJlcnRyYW5kLDxicj4NCiZndDs8YnI+DQomZ3Q7IFRoYW5rcyBz
byBtdWNoIGZvciB0aGUgcXVpY2sgcmVzcG9uc2UhPGJyPg0KJmd0Ozxicj4NCiZndDsgSSBzaG91
bGQgaGF2ZSBtZW50aW9uZWQgcHJldmlvdXNseSB0aGF0IHRoaXMgZGV2aWNlIHRyZWUgYW5kIGtl
cm5lbCBJbWFnZSAoNS4xNS4xNikgZG9lcyBib290IHByb3Blcmx5IHdpdGggdGhlIHJvb3RmcyB3
aXRob3V0IFhFTi4gVGhlIGludGVycnVwdCBlcnJvcnMgYXJlIG9ubHkgcHJlc2VudCB3aGVuIGJv
b3Rpbmcgd2l0aCBYRU4uPGJyPg0KJmd0Ozxicj4NCiZndDsgVGhlc2UgYXJlIGN1c3RvbSBib2Fy
ZHMgYW5kIHRoZXkgZG8gaGF2ZSB1c2IgYywgaG93ZXZlciB3ZSBhcmUgdW5hYmxlIHRvIGJvb3Qg
ZnJvbSB1c2IgYXMgaXQgZG9lc24mIzM5O3QgcmVjZWl2ZSBwb3dlci7CoCBXZSBjdXJyZW50bHkg
b25seSB1c2UgdGhlIHVzYiB0byBmbGFzaCB1LWJvb3QgdG8gc3BpIHdoaWNoIHJlcXVpcmVzIHVz
IHRvIHVzZSBhIHNlcGFyYXRlIHBvd2VyIGFkYXB0ZXIuIFRoZXNlIGJvYXJkcyBnZXQgcG93ZXIg
YW5kIG5ldHdvcmtpbmcgdGhyb3VnaCBhIGN1c3RvbSBiYWNrcGxhbmUgYW5kIGludGVyZmFjZSB3
aXRoIHRoZSBiYWNrcGxhbmUgdmlhIGEgc2F0YSBzdHlsZSBqdXN0aWNlIChJJiMzOTttIG5vdCBz
dXJlIHdoYXQgdGhlIHByb3BlciB0ZXJtaW5vbG9neSB3b3VsZCBiZSBoZXJlKS48YnI+DQomZ3Q7
PGJyPg0KJmd0OyBTaW5jZSBJIGNhbm5vdCBib290IHRvIHJvb3RmcyB3aXRoIFhFTiwgSSYjMzk7
bSB1bmFibGUgdG8gc2hvdyB0aGUgZGV2aWNlIHRyZWUgdGhlcmUuIFRoZSBvbmx5IGJpdCB0aGF0
IEkgYWRkZWQgdG8gYWNjb21tb2RhdGUgWEVOIGlzIHRoaXMgYml0IGhlcmU6PGJyPg0KJmd0Ozxi
cj4NCiZndDsgY2hvc2VuIHs8YnI+DQomZ3Q7wqAgwqAgwqBzdGRvdXQtcGF0aCA9ICZxdW90O3Nl
cmlhbDI6MTUwMDAwMG44JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoGJvb3RhcmdzID0gJnF1b3Q7
aG1wLXVuc2FmZT10cnVlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoHhlbixkb20wLWJvb3Rhcmdz
ID0gJnF1b3Q7Y29uc29sZT1odmMwIGVhcmx5cHJpbnRrPXhlbiBjbGtfaWdub3JlX3VudXNlZCBy
b290PS9kZXYvbnZtZTBuMXAyIHJ3IGluaXQ9L3NiaW4vaW5pdCByb290d2FpdCByb290ZnN0eXBl
PWV4dDQgaWdub3JlX2xvZ2xldmVsJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoG1vZHVsZXMgezxi
cj4NCiZndDvCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZn
dDvCoCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzImZ3Q7Ozxicj4NCiZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgwqAgwqBtb2R1bGVAMSB7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
Y29tcGF0aWJsZSA9ICZxdW90O3hlbixsaW51eC16aW1hZ2UmcXVvdDssICZxdW90O3hlbixtdWx0
aWJvb3QtbW9kdWxlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZs
dDsweDAgMHgwM0Y4MDAwMCAweDAgMHgwMWFhODAwOCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqBtb2R1bGVAMiB7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3hlbixsaW51eC1pbml0cmQmcXVvdDssICZx
dW90O3hlbixtdWx0aWJvb3QtbW9kdWxlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZyA9ICZsdDsweDAgMHgwNjAwMDAwMCAweDAgMHgwMjAwMDAwMCZndDs7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqB9Ozxicj4NCiZndDs8YnI+DQomZ3Q7
IH07PGJyPg0KJmd0Ozxicj4NCiZndDsgVGhlIGdpYyBkZWNsYXJhdGlvbiBpcyBpbiB0aGUgdmFu
aWxsYSByazMzOTkuZHRzaSBmaWxlIGFuZCBoYXNuJiMzOTt0IGJlZW4gbW9kaWZpZWQ6PGJyPg0K
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoGdpYzogaW50ZXJydXB0LWNvbnRyb2xsZXJAZmVl
MDAwMDAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDthcm0sZ2ljLXYzJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCNpbnRlcnJ1cHQtY2VsbHMgPSAmbHQ7NCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MiZndDs7PGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmFuZ2VzOzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdC1jb250cm9sbGVyOzxicj4NCiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHgwIDB4ZmVlMDAwMDAgMCAweDEwMDAwJmd0OywgLyog
R0lDRCAqLzxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDsw
eDAgMHhmZWYwMDAwMCAwIDB4YzAwMDAmZ3Q7LCAvKiBHSUNSICovPGJyPg0KJmd0O8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmx0OzB4MCAweGZmZjAwMDAwIDAgMHgxMDAwMCZn
dDssIC8qIEdJQ0MgKi88YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAmbHQ7MHgwIDB4ZmZmMTAwMDAgMCAweDEwMDAwJmd0OywgLyogR0lDSCAqLzxicj4NCiZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDsweDAgMHhmZmYyMDAwMCAwIDB4
MTAwMDAmZ3Q7OyAvKiBHSUNWICovPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW50ZXJydXB0cyA9ICZsdDtHSUNfUFBJIDkgSVJRX1RZUEVfTEVWRUxfSElHSCAwJmd0Ozs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpdHM6IGludGVycnVwdC1jb250cm9sbGVy
QGZlZTIwMDAwIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBjb21wYXRpYmxlID0gJnF1b3Q7YXJtLGdpYy12My1pdHMmcXVvdDs7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbXNpLWNvbnRyb2xsZXI7PGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI21zaS1jZWxscyA9ICZsdDsx
Jmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcg
PSAmbHQ7MHgwIDB4ZmVlMjAwMDAgMHgwIDB4MjAwMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBwaS1wYXJ0aXRpb25zIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBwcGlfY2x1c3RlcjA6IGludGVycnVwdC1wYXJ0aXRpb24tMCB7PGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYWZm
aW5pdHkgPSAmbHQ7JmFtcDtjcHVfbDAgJmFtcDtjcHVfbDEgJmFtcDtjcHVfbDIgJmFtcDtjcHVf
bDMmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBwaV9jbHVzdGVyMTogaW50ZXJydXB0LXBhcnRpdGlvbi0xIHs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhZmZpbml0eSA9ICZsdDsm
YW1wO2NwdV9iMCAmYW1wO2NwdV9iMSZndDs7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCjxicj4NClhlbiBpcyBub3Qgc3VwcG9ydGluZyBQUEkgcGFydGl0aW9ucy48YnI+DQpJ
IGFsc28gc2F3IHRoYXQgeW91ciBib290aW5nIHVzaW5nIFNNUCB1bnNhZmUgc28gYWxsIGNvcmUg
YXJlIGVuYWJsZWQgYnkgWGVuLjxicj4NCjxicj4NClJpZ2h0IG5vdyBiaWcvbGl0dGxlIGlzIG5v
dCBzdXBwb3J0ZWQgYnkgWGVuIGFuZCBoZXJlIHlvdSBtaWdodCBoYXZlIHNvbWUgaW50ZXJydXB0
cyBpbiB5b3VyIHN5c3RlbSB3aGljaCBjYW4gb25seSBvY2N1ciBvbiBzb21lIHNwZWNpZmljIGNv
cmVzLjxicj4NCkkgd291bGQgc3VnZ2VzdCB0byB0cnkgdGhlIGZvbGxvd2luZzo8YnI+DQotIG9u
bHkgYm9vdCBlbmFibGUgaW4geW91ciBkdGIgdGhlIGNvcmVzIHdpdGggdGhlIHNhbWUgdHlwZSB0
aGFuIHRoZSBib290IGNvcmU8YnI+DQotIGNoZWNrIGluIHlvdXIgZGV2aWNlIHRyZWUgd2hpY2gg
ZGV2aWNlcyBhcmUgYXNzaWduIHRvIHRoZSBwcGlfY2x1c3RlciBub3QgYXZhaWxhYmxlIGFuZCBk
aXNhYmxlIHRoZW08YnI+DQo8YnI+DQpUaGlzIGtpbmQgb2YgY29uZmlndXJhdGlvbiB3aWxsIGJl
IHRyaWNreSB0byBoYW5kbGUgc28gaXQgd2lsbCBkZXBlbmQgb24gd2hpY2ggZGV2aWNlcyBoYXZl
IGludGVycnVwdHMgdGhhdCBjYW4gb25seSBiZSBmaXJlZCBvbiBvbmUgY2x1c3RlciB0eXBlLjxi
cj4NCjxicj4NClNvcnJ5IGJ1dCBJIGNhbm5vdCByaWdodCBub3cgY2hlY2sgaW4gdGhlIGRldmlj
ZSB0cmVlIGFuZCBkbyB0aG9zZSBjaGVja3MgbXlzZWxmIGJ1dCBpZiB5b3UgZG8gZ2V0IHRoZSBp
ZGVhIHNlbmQgYmFjayBhIG1haWwgOi0pPGJyPg0KPGJyPg0KQ2hlZXJzPGJyPg0KQmVydHJhbmQ8
YnI+DQo8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDs8YnI+DQomZ3Q7IEkmIzM5
O3ZlIGF0dGFjaGVkIHRoZSBkZXZpY2UgdHJlZSBhbmQgaW5jbHVkZSBmaWxlcyBqdXN0IGluIGNh
c2UgeW91JiMzOTtkIGxpa2UgdG8gdGFrZSBhIGxvb2sgYXQgdGhvc2UuPGJyPg0KJmd0Ozxicj4N
CiZndDsgVGhhbmtzIHNvIG11Y2ggZm9yIHlvdXIgaGVscCEgSSYjMzk7dmUgYmVlbiBhdCB0aGlz
IGZvciB3ZWVrcyB3aXRoIHZlcnkgbGl0dGxlIHByb2dyZXNzLjxicj4NCiZndDs8YnI+DQomZ3Q7
IENoZWVycyw8YnI+DQomZ3Q7IEJyYWQ8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgT24g
VHVlLCBKdWwgMTIsIDIwMjIgYXQgMTA6MDUgQU0gQmVydHJhbmQgTWFycXVpcyAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOkJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPkJlcnRy
YW5kLk1hcnF1aXNAYXJtLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDsgSGkgQnJhZCw8YnI+
DQomZ3Q7PGJyPg0KJmd0OyAmZ3Q7IE9uIDExIEp1bCAyMDIyLCBhdCAxOTozOCwgQnJhZCBDaHVy
Y2h3ZWxsICZsdDs8YSBocmVmPSJtYWlsdG86YnJhZEBjYWNoZW5nby5jb20iIHRhcmdldD0iX2Js
YW5rIj5icmFkQGNhY2hlbmdvLmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj4NCiZndDsgJmd0Ozxicj4N
CiZndDsgJmd0OyBIZWxsbyw8YnI+DQomZ3Q7ICZndDs8YnI+DQomZ3Q7ICZndDsgSSYjMzk7dmUg
YmVlbiB0cnlpbmcgdG8gZ2V0IFhlbiB0byBib290IGRvbTAgd2l0aCBteSBrZXJuZWwgZm9yIHdl
ZWtzIG9uIGFuIHJrMzM5OSBiYXNlZCBib2FyZCBhbmQgdGhvdWdodCBJJiMzOTtkIHJlYWNoIG91
dCBmb3IgaGVscC4gSXQgbG9va3MgbGlrZSBlaXRoZXIgWGVuIGlzIG5vdCBwcm9wZXJseSByZWNy
ZWF0aW5nIHRoZSBkZXZpY2UgdHJlZSBvciB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgaXMganVz
dCBmYWlsaW5nLiBUaGUgaHlwZXJ2aXNvciBib290cyBidXQgZmFsbHMgdG8gaW5pdHJhbWZzIGJl
Y2F1c2UgaXQgY2Fubm90IGZpbmQgdGhlIHJvb3QgZGV2aWNlIChudm1lIG9uIHBjaWUpLiBBbnkg
aGVscCB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLiBIZXJlIGlzIHRoZSBjb21wbGV0ZSBi
b290IGxvZzxicj4NCiZndDs8YnI+DQomZ3Q7IEZyb20gdGhlIGxvZ3MgeW91IGhhdmUgYW4gaXNz
dWUgd2l0aCB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgYW5kIHRoZSBmYWN0IHRoYXQgeW91ciBO
Vk1FIGlzIGJlaGluZCBQQ0lFIGFuZCBhcyBzdWNoIGRlcGVuZHMgb24gSVRTIGlzIHByb2JhYmx5
IG5vdCBoZWxwaW5nLjxicj4NCiZndDs8YnI+DQomZ3Q7IEkgd291bGQgc3VnZ2VzdCB0byB0cnkg
dG8gYm9vdCBvbiB1c2IgYXMgcm9vdCBmcyBmb3IgYSB0cnkuPGJyPg0KJmd0Ozxicj4NCiZndDsg
QWxzbyBpdCBjb3VsZCBiZSB1c2VmdWwgdG8gY29tcGFyZSB0aGUgZGV2aWNlIHRyZWUgb24geGVu
IGFuZCB3aXRob3V0IHhlbiB0byB1bmRlcnN0YW5kIHdoYXQgaXMgZ29pbmcgb24gKHVzaW5nIC9w
cm9jL2RldmljZS10cmVlKS48YnI+DQomZ3Q7PGJyPg0KJmd0OyBYZW4gc2VlbXMgdG8gYmUgb2sg
YnV0IExpbnV4IGlzIG5vdCBoYXBweSB3aXRoIGludGVycnVwdHMgYW5kIGlzIHNob3dpbmcgc2V2
ZXJhbCBpc3N1ZXMgYXJvdW5kIHRoaXMgYXJlYSBvbiB5b3VyIGxvZ3MuPGJyPg0KJmd0OyBDb3Vs
ZCB5b3Ugc2hvdyB1cyBhbiBleHRyYWN0IG9mIHlvdXIgZGV2aWNlIHRyZWUgYXJvdW5kIHRoZSBn
aWMgZGVjbGFyYXRpb24gPzxicj4NCiZndDs8YnI+DQomZ3Q7IENoZWVyczxicj4NCiZndDsgQmVy
dHJhbmQ8YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgSU1QT1JUQU5UIE5PVElDRTogVGhl
IGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUgY29uZmlkZW50
aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRv
IG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwgdXNlIGl0IGZv
ciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24gaW4gYW55IG1l
ZGl1bS4gVGhhbmsgeW91Ljxicj4NCiZndDsgJmx0O3JrMzM5OS16YWt1LmR0cyZndDsmbHQ7cmsz
Mzk5LXpha3UuZHRzaSZndDsmbHQ7cmszMzk5LmR0c2kmZ3Q7PGJyPg0KPGJyPg0KSU1QT1JUQU5U
IE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBh
cmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5v
dCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRp
YXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNv
biwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRp
b24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Ljxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj4NCjwv
YmxvY2txdW90ZT48L2Rpdj4NCg==
--000000000000d7c92805e39eae08--

