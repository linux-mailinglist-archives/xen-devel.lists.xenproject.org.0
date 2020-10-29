Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0ED29F59F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 20:54:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14615.36096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYDzZ-0003qP-A7; Thu, 29 Oct 2020 19:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14615.36096; Thu, 29 Oct 2020 19:53:49 +0000
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
	id 1kYDzZ-0003q0-6l; Thu, 29 Oct 2020 19:53:49 +0000
Received: by outflank-mailman (input) for mailman id 14615;
 Thu, 29 Oct 2020 19:53:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kYDzY-0003pv-00
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 19:53:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15ee0e1c-4e07-47a8-a4d9-ea5bf67a6df0;
 Thu, 29 Oct 2020 19:53:46 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4CA020825;
 Thu, 29 Oct 2020 19:53:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IgEN=EE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kYDzY-0003pv-00
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 19:53:48 +0000
X-Inumbo-ID: 15ee0e1c-4e07-47a8-a4d9-ea5bf67a6df0
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15ee0e1c-4e07-47a8-a4d9-ea5bf67a6df0;
	Thu, 29 Oct 2020 19:53:46 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D4CA020825;
	Thu, 29 Oct 2020 19:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604001225;
	bh=Zoi/yikzohcZPcA0qdIgH94+cmvGhtI4trijgDqXqus=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jGQA2PZ0fHR+NSCU1sU7NXi2M7F3AwDqPfidMVfEcdQ2Y7kbaGwHgCVvtbDZNpQ9p
	 LpssgOtZwGLXKltBdLc1ue+UV4P3BC7tU+8DMZszAYaMr7fJseyP+ygguk2dVJV+9T
	 DQk06oHuBG3eIcyYM4qekcj+Q0pyhzczMYy4XcME=
Date: Thu, 29 Oct 2020 12:53:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V2 00/23] IOREQ feature (+ virtio-mmio) on Arm
In-Reply-To: <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010291252410.12247@sstabellini-ThinkPad-T480s>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com> <CAA93ih0o3XmD9neBu1fAkP1iBETu1-4qaQaEsZfEWRfYo7VCZA@mail.gmail.com> <CAPD2p-npnQz+7NtMH81s2C3dsAt_6kxQ68n7LhwYbOuTFaUEvw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1222637645-1604001225=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1222637645-1604001225=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Oct 2020, Oleksandr Tyshchenko wrote:
> On Thu, Oct 29, 2020 at 9:42 AM Masami Hiramatsu <masami.hiramatsu@linaro.org> wrote:
>       Hi Oleksandr,
> 
> Hi Masami
> 
> [sorry for the possible format issue]
>  
> 
>       I would like to try this on my arm64 board.
> 
> Glad to hear you are interested in this topic. 
>  
> 
>       According to your comments in the patch, I made this config file.
>       # cat debian.conf
>       name = "debian"
>       type = "pvh"
>       vcpus = 8
>       memory = 512
>       kernel = "/opt/agl/vmlinuz-5.9.0-1-arm64"
>       ramdisk = "/opt/agl/initrd.img-5.9.0-1-arm64"
>       cmdline= "console=hvc0 earlyprintk=xen root=/dev/xvda1 rw"
>       disk = [ '/opt/agl/debian.qcow2,qcow2,hda' ]
>       vif = [ 'mac=00:16:3E:74:3d:76,bridge=xenbr0' ]
>       virtio = 1
>       vdisk = [ 'backend=Dom0, disks=ro:/dev/sda1' ]
> 
>       And tried to boot a DomU, but I got below error.
> 
>       # xl create -c debian.conf
>       Parsing config from debian.conf
>       libxl: error: libxl_create.c:1863:domcreate_attach_devices: Domain
>       1:unable to add virtio_disk devices
>       libxl: error: libxl_domain.c:1218:destroy_domid_pci_done: Domain
>       1:xc_domain_pause failed
>       libxl: error: libxl_dom.c:39:libxl__domain_type: unable to get domain
>       type for domid=1
>       libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain
>       1:Unable to destroy guest
>       libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain
>       1:Destruction of domain failed
> 
> 
>       Could you tell me how can I test it?
> 
> 
> I assume it is due to the lack of the virtio-disk backend (which I haven't shared yet as I focused on the IOREQ/DM support on Arm in the
> first place).
> Could you wait a little bit, I am going to share it soon. 

Do you have a quick-and-dirty hack you can share in the meantime? Even
just on github as a special branch? It would be very useful to be able
to have a test-driver for the new feature.
--8323329-1222637645-1604001225=:12247--

