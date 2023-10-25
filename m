Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B27D7320
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 20:20:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623162.970717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviUP-0002xI-07; Wed, 25 Oct 2023 18:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623162.970717; Wed, 25 Oct 2023 18:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviUO-0002ty-TB; Wed, 25 Oct 2023 18:20:20 +0000
Received: by outflank-mailman (input) for mailman id 623162;
 Wed, 25 Oct 2023 18:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGX2=GH=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1qviUM-0002ts-Th
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 18:20:18 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 256d4f75-7363-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 20:20:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-MD8IH2-EMh6IsUtGtqLM8Q-1; Wed,
 25 Oct 2023 14:20:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DC1E3822E9C;
 Wed, 25 Oct 2023 18:20:11 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71065C1596D;
 Wed, 25 Oct 2023 18:20:09 +0000 (UTC)
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
X-Inumbo-ID: 256d4f75-7363-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698258016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kbl9Vh12iHFjO5JwnG1NE2HG/x04t0/PepbwFFk28Kc=;
	b=G2LNUbCMHb9IdymxqJkwPLKWZ6iNo4JMIJGERWEHBpOjuzx5C78DKA0GYRn1Nz/KNzz1GW
	hHUMYzTa6srEWwNZ0HnpAWRL2gsMf6udVL4f9qe90DhD0PD6j6SeK5ACp+uzWDtZdQ6GXv
	fgpTCO7PZBk8bfZx1twzi4trokDQRHg=
X-MC-Unique: MD8IH2-EMh6IsUtGtqLM8Q-1
Date: Wed, 25 Oct 2023 13:20:07 -0500
From: Eric Blake <eblake@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Hanna Reitz <hreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, Bernhard Beschow <shentey@gmail.com>, 
	Joel Upham <jupham125@gmail.com>
Subject: Re: [PATCH v3 28/28] docs: update Xen-on-KVM documentation
Message-ID: <6vbpkrebc7fpypbv2t7jbs7m3suxwbqqykeomzfxpenjj2sogd@rphcppcl4inl>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-29-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025145042.627381-29-dwmw2@infradead.org>
User-Agent: NeoMutt/20231006
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

On Wed, Oct 25, 2023 at 03:50:42PM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Add notes about console and network support, and how to launch PV guests.
> Clean up the disk configuration examples now that that's simpler, and
> remove the comment about IDE unplug on q35/AHCI now that it's fixed.
> 
> Also update stale avocado test filename in MAINTAINERS.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
> +Xen paravirtual devices
> +-----------------------
> +
> +The Xen PCI platform device is enabled automatically for a Xen guest. This
> +allows a guest to unplug all emulated devices, in order to use paravirtual
> +block and network drivers instead.
> +
> +Those paravirtual Xen block, network (and console) devices can be created
> +through the command line, and/or hot-plugged.
> +
> +To provide a Xen console device, define a character device and then a device
> +of type ``xen-console`` to connect to it. For the Xen console equivalent of
> +the handy ``-serial mon:stdio`` option, for example:
> +
> +.. parsed-literal::
> +   -chardev -chardev stdio,mux=on,id=char0,signal=off -mon char0 \\
> +   -device xen-console,chardev=char0

Is -chardev supposed to appear twice here?

...
> +
> +Booting Xen PV guests
> +---------------------
> +
> +Booting PV guest kernels is possible by using the Xen PV shim (a version of Xen
> +itself, designed to run inside a Xen HVM guest and provide memory management
> +services for one guest alone).
> +
> +The Xen binary is provided as the ``-kernel`` and the guest kernel itself (or
> +PV Grub image) as the ``-initrd`` image, which actually just means the first
> +multiboot "module". For example:
> +
> +.. parsed-literal::
> +
> +  |qemu_system| --accel kvm,xen-version=0x40011,kernel-irqchip=split \\
> +       -chardev stdio,id=char0 -device xen-console,chardev=char0 \\
> +       -display none  -m 1G  -kernel xen -initrd bzImage \\
> +       -append "pv-shim console=xen,pv -- console=hvc0 root=/dev/xvda1" \\
> +       -drive file=${GUEST_IMAGE},if=xen

Is the space between -- and console= intentionsl?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org


