Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5545AECD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 23:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229959.397580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpdqm-0003lm-RW; Tue, 23 Nov 2021 22:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229959.397580; Tue, 23 Nov 2021 22:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpdqm-0003k0-OA; Tue, 23 Nov 2021 22:01:16 +0000
Received: by outflank-mailman (input) for mailman id 229959;
 Tue, 23 Nov 2021 22:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T9bO=QK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mpdql-0003ju-DF
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 22:01:15 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dde6c303-4ca8-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 23:01:13 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6638760F50;
 Tue, 23 Nov 2021 22:01:09 +0000 (UTC)
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
X-Inumbo-ID: dde6c303-4ca8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637704869;
	bh=HGfGWCxuK9DIawT+rUDvDMSCooy9oKsJBObWZ2+jCRA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LuO9imbrv0n2pc9yWxt2zPqH/TVN7XLOgjVyHQITsp1nhQnYLrRyt+aDW8GkpzEIh
	 Qnp3VSAxfE3dIKSK//AyM+JAA65v4qr4duuPtj/Z1P+8aiImfcGaZcyqd/CNLFUevC
	 3ZGbuAkcPtArRfCaB7WFE4+jjIykToT3NxvtqS4cs+iJTZ3AH0zz6rzEf117ATuuPP
	 Y+MA8CscI0XPFZh6PfIdPngpQOmfkAElaN0VPeshMGdmqESRVFC0omCLG2OdlF6Oc0
	 nejlyauclSFqDwbAMHm83qtfZ+5g7cJqkfmoj3sgyR2pqnAemPFef0zNpklgx6na2G
	 cvTAfaJD7Tq/g==
Date: Tue, 23 Nov 2021 14:01:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
In-Reply-To: <75B06FD4-B2EC-4C93-95B1-8E3C9A181913@arm.com>
Message-ID: <alpine.DEB.2.22.394.2111231334470.1412361@ubuntu-linux-20-04-desktop>
References: <20211117095711.26596-1-luca.fancellu@arm.com> <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org> <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com> <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org> <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org> <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop> <17cd2c69-56cb-15b9-d381-f854aea55d27@xen.org> <alpine.DEB.2.22.394.2111191052050.1412361@ubuntu-linux-20-04-desktop>
 <d1139023-6788-2c58-5873-327e0917f868@xen.org> <75B06FD4-B2EC-4C93-95B1-8E3C9A181913@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Nov 2021, Bertrand Marquis wrote:
> Hi Julien,
> 
> > On 23 Nov 2021, at 13:54, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Stefano,
> > 
> > On 19/11/2021 18:55, Stefano Stabellini wrote:
> >> On Fri, 19 Nov 2021, Julien Grall wrote:
> >>> I like better Juergen's version. But before agreeing on the command line , I
> >>> would like to understand how Linux is dealing with big.LITTLE today (see my
> >>> question above).
> >> I also like Juergen's version better :-)
> >> The device tree binding that covers big.LITTLE is the same that covers
> >> cpus: Documentation/devicetree/bindings/arm/cpus.yaml
> > 
> > Are you sure? I found Documentation/devicetree/bindings/arm/cpu-capacity.txt.
> > 
> >> So basically, you can tell it is a big.LITTLE system because the
> >> compatible strings differ between certain cpus, e.g.:
> >>       cpu@0 {
> >>         device_type = "cpu";
> >>         compatible = "arm,cortex-a15";
> >>         reg = <0x0>;
> >>       };
> >>       cpu@1 {
> >>         device_type = "cpu";
> >>         compatible = "arm,cortex-a15";
> >>         reg = <0x1>;
> >>       };
> >>       cpu@100 {
> >>         device_type = "cpu";
> >>         compatible = "arm,cortex-a7";
> >>         reg = <0x100>;
> >>       };
> >>       cpu@101 {
> >>         device_type = "cpu";
> >>         compatible = "arm,cortex-a7";
> >>         reg = <0x101>;
> >>       };
> > 
> > I have not found any code in Linux using the compatible. Instead, they all seem to use the cpu-map (see drivers/base/arch_topology.c).
> > 
> > Anyway, to me it would be better to parse the Device-Tree over using the MIDR. The advantage is we can cover a wide range of cases (you may have processor with the same MIDR but different frequency). For now, we could create a cpupool per cluster.
> 
> This is a really good idea as this could also work for NUMA systems.
> 
> So reg & ~0xff would give the cluster number ?
> 
> We will probably end up splitting cores into different cpupools even if they are all the same as there are several CPUs having several clusters but the same cores (I recall some NXP boards being like that).
> 
> Some device tree also have a cpu-map definition:
>         cpu-map {
>             cluster0 {
>                 core0 {
>                     cpu = <&A57_0>;
>                 };
>                 core1 {
>                     cpu = <&A57_1>;
>                 };
>             };
> 
>             cluster1 {
>                 core0 {
>                     cpu = <&A53_0>;
>                 };
>                 core1 {
>                     cpu = <&A53_1>;
>                 };
>                 core2 {
>                     cpu = <&A53_2>;
>                 };
>                 core3 {
>                     cpu = <&A53_3>;
>                 };
>             };
>         };
> 
> @stefano: is the cpu-map something standard ? Lots of device trees do have it in Linux now but I do not recall seeing that on older device trees.
> Maybe using cpu-map could be a solution, we could say that device tree without a cpu-map are not supported.


cpu-map is newer than big.LITTLE support in Linux. See for instance
commit 4ab328f06. Before cpu-map was introduced, Linux used mostly the
MPIDR or sometimes the *machine* compatible string. I did find one
example of a board where the cpu compatible string is the same for both
big and LITTLE CPUs: arch/arm64/boot/dts/rockchip/rk3368.dtsi. That
could be the reason why the cpu compatible string is not used for
detecting big.LITTLE. Sorry about that, my earlier suggestion was wrong.

Yes I think using cpu-map would be fine. It seems to be widely used by
different vendors. (Even if something as generic as cpu-map should
really be under the devicetree.org spec, not under Linux, but anyway.)

Only one note: you mentioned NUMA. As you can see from
Documentation/devicetree/bindings/numa.txt, NUMA doesn't use cpu-map.
Instead, it uses numa-node-id and distance-map.

