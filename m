Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FF6483C7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 15:29:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457960.715897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3eNg-0007h7-8V; Fri, 09 Dec 2022 14:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457960.715897; Fri, 09 Dec 2022 14:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3eNg-0007f5-5Z; Fri, 09 Dec 2022 14:29:40 +0000
Received: by outflank-mailman (input) for mailman id 457960;
 Fri, 09 Dec 2022 14:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3eNe-0007ez-KY
 for xen-devel@lists.xen.org; Fri, 09 Dec 2022 14:29:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7cf118c-77cd-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 15:29:37 +0100 (CET)
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
X-Inumbo-ID: e7cf118c-77cd-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670596177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gqAwn1UNcuQHA5bjRmQJJ7JE2Ha6t/5XvnErAYxVWkw=;
  b=fAUP/3dTglUJLQ5VIMyckeGa2u2vCTiMmFnbqTo6taPpWDpJsGqmj64w
   UPBDTJ4XMke34dB6GmRbSPJoikViE7mT22Ipl21uzSz+p4v3WF9cM/QOM
   KLEC8nUytcTKaZeCcdV9Rpkr00B2kMaX7V0pwu1yw6EEcjiqnO7PUbAJG
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87953843
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:i1wGj6wZRexr9ticW1R6t+dfwSrEfRIJ4+MujC+fZmUNrF6WrkVUn
 zBKWjiCPqyMNjSgfdh2PdjnoBlUuZHVyYJmHVFu+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPaET5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KThSy
 v4mMD0DVD6oqN6Lx6u+Wvdej+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZoEwx3I+
 jmuE2LRLyAANpvA0WK8yyjvr7T0sgXpf781G+jtnhJtqALKnTFCYPEMbnO+qOW5i0OjHcpYK
 lYV9zAGqak0/VasCNL6WnWQu2KJsBcaXJxLD+Qw5QWJy6zVyxaYAmkCXnhKb9lOnMYySCxs3
 FKPmd7kLThutrSPTjSa7Lj8hSy2ETgYKykFfyBsZQwB7tr4vJAojjrAS99iFOi+ididMTTxw
 D3MrC86grgIpcoK0ayh+hbAmT3EjprGVAku/S3MQ3moqAh+YeaNd4GurFTW8/tEBIKYVUWa+
 mgJnY6Z9u9mJY+MjiGWQKMOAbSg/d6BMTvVm1kpGIMunxy252SqYYdLpT1zOm9uKoMAeCT1e
 wnXuAVY/pgVO2GlBYdpYoS6BsI2i6f9FMj5Uez8attIa4J2Mgid80lGZ1OU3m3ruFghl+c4I
 5jzTCq3JS9EU+I9lmPwHrpDl+9wrswj+Y/Nbcnn8BaZybeQXlC+Zos4N0KLfv4L5YrR9W057
 O1jH8eNzhxeVsj3bS/W7ZMfIDg2EJQrOXzlg5cJL7Dee2KKDElkUqaMmu15J+SJiowPzo/1E
 meBtli0IbYVrVnOMk20Z39qc9sDtr4v/CtgbUTA0btFskXPgLpDDo9FL/PbnpF9roSPKMKYq
 NFbE/hs+twVFlz6F801NPERVrBKehWxnh6pNCG4ejU5dJMIb1WXpYe5JFezrHhUVXPfWS4CT
 1qIj1KzfHb+b146UJa+hAyHkDtdQkTxaMotBhCVc7G/iW3n8ZRwKjyZsxPEC5hkFPk3/RPDj
 1z+KU5B9YHwT3odrIGhaVas8934TIOT3yNyQwHm0FpBHXWDpDL4m98aCr3gkPK0fDqcxZhOr
 N59l5nUWMDrVn4Q22agO96HFZ4D2uY=
IronPort-HdrOrdr: A9a23:wPD6PaNxIs0BLsBcTtCjsMiBIKoaSvp037BL7TETdfUxSKfzqy
 nAppkmPGDP+VQssR0b9exoW5PhfZq/z/BICOAqVN+ftWLd2VdAQrsM0WLq+UyEJxHD
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87953843"
Date: Fri, 9 Dec 2022 14:29:30 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH V7 3/3] docs: Add documentation for generic virtio devices
Message-ID: <Y5NGSknKmbeX4hCZ@perard.uk.xensource.com>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
 <7376c617d457ffd402cd6518a7fd6c71552e9ec8.1670396758.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7376c617d457ffd402cd6518a7fd6c71552e9ec8.1670396758.git.viresh.kumar@linaro.org>

On Wed, Dec 07, 2022 at 12:50:44PM +0530, Viresh Kumar wrote:
> +=item B<virtio=[ "VIRTIO_DEVICE_STRING", "VIRTIO_DEVICE_STRING", ...]>
> +
> +Specifies the Virtio devices to be provided to the guest.
> +
> +Each B<VIRTIO_DEVICE_STRING> is a comma-separated list of C<KEY=VALUE>
> +settings from the following list:

We should probably say something about allowing a comma in the VALUE for
"type" when the value starts with "virtio," as otherwise it might be
confusing.

> +
> +=over 4
> +
> +=item B<backend=domain-id>
> +
> +Specifies the backend domain name or id, defaults to dom0.
> +
> +=item B<type=STRING>
> +
> +Specifies the compatible string for the specific Virtio device. The same will be
> +written in the Device Tree compatible property of the Virtio device. For
> +example, "type=virtio,device22" for the I2C device, whose device-tree binding is
> +present here:
> +
> +L<https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml>
> +
> +=item B<transport=STRING>
> +
> +Specifies the transport mechanism for the Virtio device, like "mmio" or "pci".

"pci" doesn't exist, only "mmio" is allowed here at the moment. We can
change the man page later when new options become available.


Thanks,

-- 
Anthony PERARD

