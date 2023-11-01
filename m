Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA677DDDF4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 10:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626148.976129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75Y-00061k-Tw; Wed, 01 Nov 2023 09:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626148.976129; Wed, 01 Nov 2023 09:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qy75Y-0005wd-P3; Wed, 01 Nov 2023 09:00:36 +0000
Received: by outflank-mailman (input) for mailman id 626148;
 Wed, 01 Nov 2023 09:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIXo=GO=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1qy75Y-0005dE-4z
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:00:36 +0000
Received: from smarthost01a.ixn.mail.zen.net.uk
 (smarthost01a.ixn.mail.zen.net.uk [212.23.1.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1db9d30f-7895-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 10:00:34 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.ixn.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1qy75V-005aL3-GD
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 09:00:33 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 461DF88EEA0
 for <xen-devel@lists.xenproject.org>; Wed,  1 Nov 2023 09:00:33 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id THK6b9QEUa-Q for <xen-devel@lists.xenproject.org>;
 Wed,  1 Nov 2023 09:00:33 +0000 (GMT)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk [192.168.1.5])
 by dingwall.me.uk (Postfix) with ESMTP id 208B888EE9D
 for <xen-devel@lists.xenproject.org>; Wed,  1 Nov 2023 09:00:33 +0000 (GMT)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id C8AACB0AAE2; Wed,  1 Nov 2023 09:00:32 +0000 (GMT)
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
X-Inumbo-ID: 1db9d30f-7895-11ee-98d6-6d05b1d4d9a1
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Wed, 1 Nov 2023 09:00:32 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: Re: live migration fails: qemu placing pci devices at different
 locations
Message-ID: <ZUITsLTEziW6/xFP@dingwall.me.uk>
References: <ZUDR4daChIWHZBUo@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUDR4daChIWHZBUo@dingwall.me.uk>
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189

On Tue, Oct 31, 2023 at 10:07:29AM +0000, James Dingwall wrote:
> Hi,
> 
> I'm having a bit of trouble performing live migration between hvm guests.  The
> sending side is xen 4.14.5 (qemu 5.0), receiving 4.15.5 (qemu 5.1).  The error
> message recorded in qemu-dm-<name>--incoming.log:
> 
> qemu-system-i386: Unknown savevm section or instance '0000:00:04.0/vga' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
> 
> I have patched libxl_dm.c to explicitly assign `addr=xx` values for various
> devices and when these are correct the domain migrates correctly.  However
> the configuration differences between guests means that the values are not
> consistent.  The domain config file doesn't allow the pci address to be
> expressed in the configuration for, e.g. `soundhw="DEVICE"`
> 
> e.g. 
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 6e531863ac0..daa7c49846f 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -1441,7 +1441,7 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
>              flexarray_append(dm_args, "-spice");
>              flexarray_append(dm_args, spiceoptions);
>              if (libxl_defbool_val(b_info->u.hvm.spice.vdagent)) {
> -                flexarray_vappend(dm_args, "-device", "virtio-serial",
> +                flexarray_vappend(dm_args, "-device", "virtio-serial,addr=04",
>                      "-chardev", "spicevmc,id=vdagent,name=vdagent", "-device",
>                      "virtserialport,chardev=vdagent,name=com.redhat.spice.0",
>                      NULL);
> 
> The order of devices on the qemu command line (below) appears to be the same
> so my assumption is that the internals of qemu have resulted in things being
> connected in a different order.  The output of a Windows `lspci` tool is
> also included.
> 
> Could anyone make any additional suggestions on how I could try to gain
> consistency between the different qemu versions?

After a bit more head scratching we worked out the cause and a solution for
our case.  In xen 4.15.4 d65ebacb78901b695bc5e8a075ad1ad865a78928 was
introduced to stop using the deprecated qemu `-soundhw` option.  The qemu
device initialisation code looks like:

...
    soundhw_init(); // handles old -soundhw option
...
    /* init generic devices */
    rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
    qemu_opts_foreach(qemu_find_opts("device"),
                      device_init_func, NULL, &error_fatal);
...

So for the old -soundhw option this was processed before any -device options
and the sound card was assigned the next available slot on the bus and then
any further -devices were added according to the command line order.  After
that xen change the sound card was added as a -device and depending on the
other emulated hardware would be added at a different point to the equivalent
-soundhw option.  By re-ordering the qemu command line building in libxl_dm.c
we can make the sound card be the first -device which resolves the migration
problem.

I think this would also have been a problem for live migration between 4.15.3
and 4.15.4 for a vm with a sound card and not just the major version jump we
are doing.

James

