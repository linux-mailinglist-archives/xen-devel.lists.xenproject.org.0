Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED2290DC7
	for <lists+xen-devel@lfdr.de>; Sat, 17 Oct 2020 00:35:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8246.21979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTYII-00087j-AK; Fri, 16 Oct 2020 22:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8246.21979; Fri, 16 Oct 2020 22:33:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTYII-00087K-7P; Fri, 16 Oct 2020 22:33:50 +0000
Received: by outflank-mailman (input) for mailman id 8246;
 Fri, 16 Oct 2020 22:33:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NCZ+=DX=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kTYIG-00087F-KA
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 22:33:48 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f509f265-2c51-4e95-ba41-330921ffc062;
 Fri, 16 Oct 2020 22:33:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09GMXPlK024387
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 16 Oct 2020 18:33:30 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09GMXNFv024386;
 Fri, 16 Oct 2020 15:33:23 -0700 (PDT) (envelope-from ehem)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=NCZ+=DX=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kTYIG-00087F-KA
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 22:33:48 +0000
X-Inumbo-ID: f509f265-2c51-4e95-ba41-330921ffc062
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f509f265-2c51-4e95-ba41-330921ffc062;
	Fri, 16 Oct 2020 22:33:47 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09GMXPlK024387
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 16 Oct 2020 18:33:30 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09GMXNFv024386;
	Fri, 16 Oct 2020 15:33:23 -0700 (PDT)
	(envelope-from ehem)
Date: Fri, 16 Oct 2020 15:33:23 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
        Alex Benn??e <alex.bennee@linaro.org>, bertrand.marquis@arm.com,
        andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>
Subject: Xen-ARM EFI/ACPI problems (was: Re: [PATCH 0/4] xen/arm: Unbreak
 ACPI)
Message-ID: <20201016223323.GA23508@mattapan.m5p.com>
References: <20200926205542.9261-1-julien@xen.org>
 <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
 <CAA93ih2EiyCnuL4sw1OLw+XEWa7sN3zJWvsnxHfx9b9Fq+cOxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA93ih2EiyCnuL4sw1OLw+XEWa7sN3zJWvsnxHfx9b9Fq+cOxw@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Sep 28, 2020 at 10:00:35PM +0900, Masami Hiramatsu wrote:
> I've missed the explanation of the attached patch. This prototype
> patch was also needed for booting up the Xen on my box (for the system
> which has no SPCR).

I'm pretty sure of this on the hardware I'm dealing with, but don't know
about the hardware you're dealing with.

Does your device have a framebuffer?  Have you ever tried/succeeded
booting your device with the framebuffer disabled? (booted with a
HDMI/DVI cable disconnected or the device on the other end *completely*
powered down)

Based upon the back and forth both on xen-devel and some messages which
were split off due to not being general.  An observation I had made a
while ago finally caused me to try recreating it.

On the device I'm on (Raspberry PI 4B with Tianocore -> GRUB -> Xen) I
discovered a SPCR table shows up if I boot with the device the output is
plugged into is powered down.  I'm guessing this causes Tianocore to
advise GRUB/Linux/Xen to boot with a serial console (presenting a Serial
Port Console Redirect table), whereas if the display device is
functioning the absense of SPCR is supposed to indicate console on
framebuffer.

This means the ACPI_FAILURE case in acpi_iomem_deny_access() simply needs
to be filled in similar to how it likely is on x86.  Allocate a serial
port for Xen's use as console, present it to domain 0 as hvc0, and hide
it from domain 0.



Next issue for me will be getting the framebuffer operational.
Apparently the Xen-ARM EFI implementation doesn't provide any EFI
variables to domain 0?  Jan Beulich, your name was mentioned as person
likely to have ideas for getting Linux's efifb code operational Xen-ARM.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



