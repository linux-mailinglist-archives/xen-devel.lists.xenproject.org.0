Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A896A355
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789402.1199019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVp2-0005CE-OX; Tue, 03 Sep 2024 15:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789402.1199019; Tue, 03 Sep 2024 15:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slVp2-0005Aj-Ll; Tue, 03 Sep 2024 15:52:00 +0000
Received: by outflank-mailman (input) for mailman id 789402;
 Tue, 03 Sep 2024 15:51:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6iY=QB=bounce.vates.tech=bounce-md_30504962.66d7309c.v1-95079714ab3947658841abc904d0075c@srs-se1.protection.inumbo.net>)
 id 1slVp1-0005Ad-3m
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:51:59 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72faedb6-6a0c-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 17:51:58 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4Wyqqw6Q3dzRKLprb
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 15:51:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 95079714ab3947658841abc904d0075c; Tue, 03 Sep 2024 15:51:56 +0000
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
X-Inumbo-ID: 72faedb6-6a0c-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725378716; x=1725639216;
	bh=QogfXXo+LApb1v45eboEtUVnFbyP+E6bT/DIkYB9IZQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e8VaQ6VUmp8P7ISDZbRSPQv3zS2d99k7E2C/q/ituueUUBEbverZ4GA2wab9WdE/r
	 u5hdVh8JDduR1vHkAiYMGltlkWuPdrt7ITCL+xkZ00XgcOZDCbxVrYP05EUEOGD1ja
	 hdw86C6/f7d/2rJD+jtzqPbXNedd15jusV5TZ9ljGLqvZG++XzPSPPibaKVcoqoy3Q
	 R+ufHAxug1xKyGbZRgyJ0NRgbWm3uGPprNDdRzQqBP9edvORc3n3jv2nwTnjoPbv0y
	 oQG/GiId7KlvQJWJMiYcQxHSNvtY5OgVy2+ffig09Wvyn4JVlVx6tSnQV188crVszy
	 /P121vuasJY/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725378716; x=1725639216; i=anthony.perard@vates.tech;
	bh=QogfXXo+LApb1v45eboEtUVnFbyP+E6bT/DIkYB9IZQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ruCEKADql4PslAuKqd8hg1vskT+/iWy3KqVxNv//LnRv3AwCzcl5oY05TJPqWMiDa
	 mNGC7JkY+g0utfx9stoiPivnwsSvBcttiKt8xWi/nOOhWJ8tMuoPR0EPHLahl2XIy9
	 ppD/jqHCjBJXhDue0GdH8H+QT4gBTg0PHjEYCPw1zvcM/W1D31W7xFKelZDb7b5qjG
	 VdUGjozAb6pVYh3fg3j/rzfEMM8z981uqHASjLiMR8fj9C3GPfKQyK0JANQO6zCspd
	 605czJb4yJKd/AtMvJ5AlBx0QkCmP/A9Sr4JsLfgAfiYH55mafaeg19v54/z7HZHjH
	 aW7Qw8CNRThng==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v14=204/5]=20tools:=20Add=20new=20function=20to=20get=20gsi=20from=20dev?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725378714414
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>
Message-Id: <ZtcwmSqeryBVjmlh@l14>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com> <20240903070424.982218-5-Jiqian.Chen@amd.com>
In-Reply-To: <20240903070424.982218-5-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.95079714ab3947658841abc904d0075c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 15:51:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 03:04:23PM +0800, Jiqian Chen wrote:
> diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
> index bc60e8fd55eb..607dfa2287bc 100644
> --- a/tools/include/xen-sys/Linux/privcmd.h
> +++ b/tools/include/xen-sys/Linux/privcmd.h
> @@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
>  	__u64 addr;
>  } privcmd_mmap_resource_t;
>  
> +typedef struct privcmd_pcidev_get_gsi {
> +	__u32 sbdf;
> +	__u32 gsi;
> +} privcmd_pcidev_get_gsi_t;

> diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
> index c67c71c08be3..92591e49a1c8 100644
> --- a/tools/libs/ctrl/xc_linux.c
> +++ b/tools/libs/ctrl/xc_linux.c
> @@ -66,6 +66,26 @@ void *xc_memalign(xc_interface *xch, size_t alignment, size_t size)
>      return ptr;
>  }
>  
> +int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
> +{
> +    int ret;
> +    privcmd_pcidev_get_gsi_t dev_gsi = {
> +        .sbdf = sbdf,
> +        .gsi = 0,
> +    };
> +
> +    ret = ioctl(xencall_fd(xch->xcall),
> +                IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
> +
> +    if (ret < 0) {
> +        PERROR("Failed to get gsi from dev");
> +    } else {
> +        ret = dev_gsi.gsi;

I've just notice that this is mixing signed and unsigned int.
We are storing a "__u32" into an "int" here. This isn't great as we are
throwing way lots of potentially good value. (Even if I have no idea if
they are possible.)

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

