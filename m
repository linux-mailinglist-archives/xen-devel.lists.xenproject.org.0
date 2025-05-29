Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F8AC845E
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 00:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000227.1380569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKlvl-0001wp-6A; Thu, 29 May 2025 22:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000227.1380569; Thu, 29 May 2025 22:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKlvl-0001v5-3R; Thu, 29 May 2025 22:40:57 +0000
Received: by outflank-mailman (input) for mailman id 1000227;
 Thu, 29 May 2025 22:40:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7t4/=YN=bounce.vates.tech=bounce-md_30504962.6838e26f.v1-f5d62f09982d4a5090cf9d96bbfa4bae@srs-se1.protection.inumbo.net>)
 id 1uKlvk-0001uz-8u
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 22:40:56 +0000
Received: from mail137-30.atl71.mandrillapp.com
 (mail137-30.atl71.mandrillapp.com [198.2.137.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77efc91-3cdd-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 00:40:49 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-30.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4b7hCz75fPzMQxc7s
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 22:40:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f5d62f09982d4a5090cf9d96bbfa4bae; Thu, 29 May 2025 22:40:47 +0000
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
X-Inumbo-ID: f77efc91-3cdd-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1748558448; x=1748828448;
	bh=Y53hueVrFDexdKiEqYRowA2tjeyA5Izf+Dp0bUmOPKk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nKHLE82LdqKY75Z8gKUJtJXHuGXQLNf5db0Gdi3tsZtG1SjH4epoAWpsKo2m4YEVU
	 IEg63BYnl10BPiJio2lCzU0/YEYtLApYuIXJfre8ArLrbn7OLvRrqGrL7bBh9I8Jq1
	 bvwRJy5koInppEcin5fLUeEbFq9aDZJ5TDsaiNnk+KRjJ4qGl12OMmxD1SKP1cOL8+
	 HeTsT/MM3r8UW/Prl+d9kdtMMeHHsHBdrROLY+P5Ao9vIfp7OvlFLeSXf6/kB9Qh5q
	 pt3PIti+5pCLE8xgRxG/cmd+4QQOfLgXagbOYp9GwgAgpdUgwfSIp0+Xv+yUFUbmbT
	 pMXVNTAJayM5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1748558448; x=1748818948; i=teddy.astie@vates.tech;
	bh=Y53hueVrFDexdKiEqYRowA2tjeyA5Izf+Dp0bUmOPKk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Tuq0BTu4afXaFsfdY0dFFeyHUS+lafUc4A9VysZku/KQSbliymGCuQ4i2ijxIn6tT
	 5QHrQ28Sb1mZfYPDoImeq/hCYpPnlZeqQGJ5dZfp88HMiNMQRdZiDWMFhATgv9giw8
	 roJlAM8s6FYg+jlcEZ4jYVggOCcM5txzebH9Y/Yqk/Ifaw35Zmnl44Dg6kb3GAwQVL
	 yzzV6uDRg+/9r/N6eswVJ9Q6uBCY8EdPPSMhJBD7moDnDGEfn6NkM75Tyzla3PTEJi
	 1cwHGCYZsPvqBZZ8s3quqoDsKUKMGqXo9+8qAX7t2agUPkuhzZcouHsHoGhnX/DFE4
	 2v6DPt1XgN6fA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=201/3]=20docs:=20add=20documentation=20for=20Argo=20as=20a=20feature?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1748558445858
Message-Id: <f05fb94f-91ba-4abe-b59a-c14e25388e68@vates.tech>
To: "Christopher Clark" <christopher.w.clark@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Daniel Smith" <dpsmith@apertussolutions.com>, "Rich Persaud" <persaur@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <20250528211040.10562-1-christopher.w.clark@gmail.com>
In-Reply-To: <20250528211040.10562-1-christopher.w.clark@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f5d62f09982d4a5090cf9d96bbfa4bae?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250529:md
Date: Thu, 29 May 2025 22:40:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Christopher,

Le 28/05/2025 =C3=A0 23:13, Christopher Clark a =C3=A9crit=C2=A0:
> Adds approachable documentation describing system components and
> introduces the support statement for feature status.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>   docs/features/argo-feature.pandoc | 99 +++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
>   create mode 100644 docs/features/argo-feature.pandoc
> 
> diff --git a/docs/features/argo-feature.pandoc b/docs/features/argo-featu=
re.pandoc
> new file mode 100644
> index 0000000000..b6a10be78a
> --- /dev/null
> +++ b/docs/features/argo-feature.pandoc
> @@ -0,0 +1,99 @@
> +% Argo interdomain communication
> +% Revision 1
> +
> +\clearpage
> +
> +# Basics
> +
> +---------------- ----------------------------------------------------
> +         Status: **Tech Preview**
> +
> +  Architectures: x86, ARM
> +
> +   Component(s): Hypervisor, guest
> +---------------- ----------------------------------------------------
> +
> +# Overview
> +
> +Argo is a lightweight data transport for communication between virtual
> +machines, with a simple hypervisor interface that is accessible for
> +building embedded systems and designed to work with familiar primitives
> +within guest OS kernels. It supports policy control over communication
> +and isolation between VMs.
> +
> +# User details
> +
> +Argo is present in Xen, included since Xen 4.12. A Linux device driver
> +and userspace library are available and Argo is regularly tested in the
> +Xen Continuous Integration system.
> +

Not really related to the documentation itself, but it would be 
preferable to have the Linux driver upstreamed such as this sentence 
sounds more as "it is supported" rather than "it's possible to make it 
work".

It would also make Argo easier to integrate in Xen-based projects.

> +To configure a Xen system to enable Argo:
> +
> +* ensure that Argo is enabled in the hypervisor with KConfig option
> +
> +* enable Argo on the Xen hypervisor command line
> +
> +* load the Argo guest kernel device driver
> +
> +* ensure that the Argo guest libraries are installed
> +
> +The guest userspace libraries support software designed for Argo
> +interfaces and also enables software designed for networks to
> +communicate between VMs by Argo.  This allows platform software to be
> +plumbed easily between virtual machines, without requiring networking
> +and with system policy controls over this communication.
> +
> +# Technical details
> +
> +## Argo components
> +
> +* Xen: Argo in the hypervisor provides communication between virtual
> +  machines.
> +
> +* Guest kernel: driver provides interfaces for data transport for use
> +  within the kernel, and implements familiar abstractions for
> +  networking software.
> +
> +* Guest libraries: provide application-level support for interdomain
> +  communication.
> +

That sounds a bit confusing to me, the guest kernel provides familiar 
abstractions for networking software (I hear through that something like 
sockets), yet we still have guest libraries for application-level support.

I think the guest libraries provide a shim for some of the argo-specific 
aspects (like ioctls and sockaddr_argo related bits); while the 
interface is more unix-oriented with regular sockets operations 
(sendmsg, ...).

> +## Argo implementation within Xen
> +
> +See the public Xen headers for the primary interface documentation.
> +

There is the design document in docs/designs/argo.pandoc that explains 
the inner design inside Xen. I think the public headers are more for 
guest consumption.

As this document also targets guest developers, it would be great to 
have some guidance (e.g a docs document) on how a guest should implement 
argo support.

> +# Limitations
> +
> +Argo has been developed and tested on x86 and ARM architectures.
> +
> +# Testing
> +
> +The Argo test developed for the Xen Test Framework provides coverage of
> +the hypercall operations.
> +
> +The Xen Project CI provides system test coverage of an Argo-enabled Xen
> +system with Linux.
> +
> +# Areas for improvement
> +
> +## Argo and VirtIO
> +
> +References to design documentation for the development of an Argo
> +transport for VirtIO are available via:
> +https://wiki.xenproject.org/wiki/Virtio_On_Xen
> +

Are there news regarding this ?

There is work done on virtio-msg [1], which looks fairly similar to 
virtio-argo (or at least, virtio-msg could work with Argo in a similar 
fashion to what's described on the virtio-argo design).

[1] https://linaro.atlassian.net/wiki/spaces/HVAC/overview

> +# Known issues
> +
> +* For development: sysctl/domctls for toolstack to control per-VM access
> +  to Argo
> +

Is it regarding disabling the argo on a per-guest basis, or regarding if 
a specific VM can communicate with another VM ? i.e can the toolstack 
decide to prevent 2 guest from communicating ?

IIRC, in Argo, a guest on his own can decide who can communicate with 
him using separate registered rings. But I am not sure if there is more 
on that regard.

> +# References
> +
> +See the ARGO section of the Xen MAINTAINERS document for web reference.
> +
> +# History
> +
> +------------------------------------------------------------------------
> +Date       Revision Version   Notes
> +---------- -------- --------- ------------------------------------------
> +2025-05-28 1        Xen 4.12+ Feature included in Xen 4.12.
> +---------- -------- --------- ------------------------------------------

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



