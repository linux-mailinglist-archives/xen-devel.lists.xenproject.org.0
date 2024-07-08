Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA192A39B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 15:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755423.1163782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQoOg-0002vD-53; Mon, 08 Jul 2024 13:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755423.1163782; Mon, 08 Jul 2024 13:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQoOg-0002sq-1x; Mon, 08 Jul 2024 13:27:14 +0000
Received: by outflank-mailman (input) for mailman id 755423;
 Mon, 08 Jul 2024 13:27:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B806=OI=bounce.vates.tech=bounce-md_30504962.668be92d.v1-494f96f395654904a47aff0113bb610d@srs-se1.protection.inumbo.net>)
 id 1sQoOe-0002si-K2
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 13:27:12 +0000
Received: from mail179-23.suw41.mandrillapp.com
 (mail179-23.suw41.mandrillapp.com [198.2.179.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72b0e57-3d2d-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 15:27:10 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-23.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4WHlK91XYkz35hj2x
 for <xen-devel@lists.xenproject.org>; Mon,  8 Jul 2024 13:27:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 494f96f395654904a47aff0113bb610d; Mon, 08 Jul 2024 13:27:09 +0000
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
X-Inumbo-ID: c72b0e57-3d2d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720445229; x=1720705729;
	bh=oFmoLPEXzn98QnGemcNqcRRcKv4zR3DgUEv5buJilHY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cDAhcZAJ1aFCCcfQNghaQKuXT5EmSABJiol5veabm3B4hSVWq6dkRushM3y/2G2bg
	 3FWdvKFA7whNNlYSZAgt6Cv8C/8SnDOQNKRh+mejcBonTu0sVfUQuajEvqrTHMi6rF
	 3WGXJZhqVH547cahgrwwWX6r+bORsn/Pbh7eVqJVMqu5+BV7+aQn3AEQ4hLdpCAPFG
	 MW3Q35JK1kqwGEf1L+atPsYGjlWb3ZpbcqWas3XlZwz4QJxKfkyn3ozhJR1XTkI9F6
	 uDAzpg38QAt+Uh8Tt/pfplv99vpwcBLYxJL2IS4ji4cd9udbzFgdXMbcr9HBtyjoU2
	 uNsvz7jS8pqZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720445229; x=1720705729; i=anthony.perard@vates.tech;
	bh=oFmoLPEXzn98QnGemcNqcRRcKv4zR3DgUEv5buJilHY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=j55suZBY/BMT/dznVyJGphLe69JEJPttKVJCpRnYG2JlV3Fgepn8KZfytXEO2Zr8J
	 OGWII96VXGcKlyHmFuHH+5K42KNe3zDs9hLXAteAbWxe63lm+bP0dCypIbcOLdNqo7
	 YQop7aNR3Kpso/taPuK56fQxl+B6rnKOG8Y/jgfb7sdvmim8LZxi+Hnz0r6g3jqvSr
	 TdVbn1qMKqZQoGdiOcSmcupqOdUDoz3+u8CEHOuoxc7xAQ+jEs1gum50SV3WFbrTdt
	 +ApWMNe938t/cGtliOmPPK+OmPSY6zl/qbxi0dCBTgnJmJJb3MiVlUyE63APdZIEZX
	 yR8A7KBReb5RQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v12=206/7]=20tools:=20Add=20new=20function=20to=20get=20gsi=20from=20dev?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720445227146
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>
Message-Id: <ZovpKmmoabIvy135@l14>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-7-Jiqian.Chen@amd.com>
In-Reply-To: <20240708114124.407797-7-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.494f96f395654904a47aff0113bb610d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240708:md
Date: Mon, 08 Jul 2024 13:27:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 08, 2024 at 07:41:23PM +0800, Jiqian Chen wrote:
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index e9fcd755fa62..54edb0f3c0dc 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -111,3 +111,38 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf)
> +{
> +    int rc = -1;
> +
> +#if defined(__linux__)
> +    int fd;
> +    privcmd_gsi_from_pcidev_t dev_gsi = {
> +        .sbdf = sbdf,
> +        .gsi = 0,
> +    };
> +
> +    fd = open("/dev/xen/privcmd", O_RDWR);


You could reuse the already opened fd from libxencall:
    xencall_fd(xch->xcall)

> +
> +    if (fd < 0 && (errno == ENOENT || errno == ENXIO || errno == ENODEV)) {
> +        /* Fallback to /proc/xen/privcmd */
> +        fd = open("/proc/xen/privcmd", O_RDWR);
> +    }
> +
> +    if (fd < 0) {
> +        PERROR("Could not obtain handle on privileged command interface");
> +        return rc;
> +    }
> +
> +    rc = ioctl(fd, IOCTL_PRIVCMD_GSI_FROM_PCIDEV, &dev_gsi);

I think this would be better implemented in Linux only C file instead of
using #define. There's already "xc_linux.c" which is probably good
enough to be used here.

Implementation for other OS would just set errno to ENOSYS and
return -1.


-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

