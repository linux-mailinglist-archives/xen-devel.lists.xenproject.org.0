Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5435B76554E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 15:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571125.894215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1JI-0006Rp-Nh; Thu, 27 Jul 2023 13:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571125.894215; Thu, 27 Jul 2023 13:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP1JI-0006QA-Jm; Thu, 27 Jul 2023 13:45:44 +0000
Received: by outflank-mailman (input) for mailman id 571125;
 Thu, 27 Jul 2023 13:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qP1JG-0006Q4-OF
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 13:45:42 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de846668-2c83-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 15:45:40 +0200 (CEST)
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
X-Inumbo-ID: de846668-2c83-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690465539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h352hLwI0Tv3nQmo4STYZiYCwMoedDG49b8TEL0h0UA=;
  b=S8PNG7c7xIrEWYpw9ow+5YYMliFTWEuF52xaAkKPmJPOti+vXEJWjXvw
   PMAtIRM3rLIRSNgvOVLpsQ4wf/9Pb3dqFMkT9veSgT9oKqALnA+4slJva
   xik7i/Xcs3khH2NuDXTL/+pD7FjwbaD7Rmxvx/7ut6Tw5YQlQTaIpsNni
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117525348
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+wqk46yKiHw826Cl8dZ6t+fRxirEfRIJ4+MujC+fZmUNrF6WrkUAz
 GIYDGvUbv6NMTSne4pxYY23oRhSuMKEmtdlSwRtqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTBlt
 uESNSxVVyHZrvmw26uwF7R8of12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMwRvC+
 zmarwwVBDk5M9OF5Bekykj3n6jMtjL4WpIZE+aBo6sCbFq7mTVIVUx+uUGAid69h02lUtRTM
 Xso6zEupqg/8k+sZtTlVhj+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 kCNt8PkA3poqrL9YXWZ+7SPsSKpOQAaKGYDYWkPSg5ty9vsuoYolTrUU81uVqWyi7XdBzDqz
 iuK6isjgrwJpcoK0ayh+hbAmT3EjpHRQxQ8/An/QmOv5QQ/b4mgD7FE8nCCs6wGdtzACADc4
 j5dwZP2AP0y4Y+lxQfOXe8QAOmQ1qysKzvHmFUyQokGzmH4k5K8Rry88A2SNW8wbJdcIm6yM
 BeP0e9CzMQNZSX3NMebd6r0Up13lva4SLwJQ9iONrJzjo5NmBhrFc2ETWqZxCjTnUclisnT0
 r/LIJ/3XR725UmKpQdaptvxMpdxnEjSPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BZpPRmksFD7ylOna/HWsvwbYidyZT6Xfe8pI/SwJ+ClA+RDFJ5wH5n9vNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QikLVV8bZr4m9ShTFXV1bT6VN40LPd7HAFE3K8FmItHKNYVLkZZJc
 hXyU57aX64UE22Yp2l1gFuUhNUKSSlHTDmmZ0KNCAXTtbY7L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:YgexKqPNAT8HnsBcTv6jsMiBIKoaSvp037Dk7TEJdfU1SL3hqy
 nKpp4mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozJyV
X-Talos-CUID: 9a23:vHcyS20s0ECxOgV0pBoqJLxfS+tmb3fA0C/pEhWREmByUbbIFE+3wfYx
X-Talos-MUID: 9a23:gTNmMATeXBMc+MI1RXTPgz54GepJ2571EQcOuoQFudmPMndJbmI=
X-IronPort-AV: E=Sophos;i="6.01,235,1684814400"; 
   d="scan'208";a="117525348"
Date: Thu, 27 Jul 2023 14:45:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Juergen Gross
	<jgross@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Message-ID: <0bca0a3b-2a74-42c7-96d2-23f6dab7d169@perard>
References: <20230726141459.985463-1-olekstysh@gmail.com>
 <670c22f9-135d-4022-8272-78af3e28c011@perard>
 <5360d7ae-b754-99f9-686f-882bdc33e7eb@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5360d7ae-b754-99f9-686f-882bdc33e7eb@epam.com>

On Thu, Jul 27, 2023 at 10:38:03AM +0000, Oleksandr Tyshchenko wrote:
> 
> 
> On 27.07.23 12:50, Anthony PERARD wrote:
> 
> Hello Anthony
> 
> > On Wed, Jul 26, 2023 at 05:14:59PM +0300, Oleksandr Tyshchenko wrote:
> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>
> >> Without it being present it won't be possible to use some
> >> libxl__device_type's callbacks for virtio devices as the common code
> >> can only invoke these callbacks (by dereferencing a pointer) for valid
> >> libxl__device_type's elements when iterating over device_type_tbl[].
> > 
> > Did you notice an issue with it been missing from device_type_tbl[] ?
> > Because to me it looks like all the functions that are using
> > device_type_tbl will just skip over virtio devtype.
> > 
> > domcreate_attach_devices:
> >      skip virtio because ".skip_attach = 1"
> > 
> > libxl__need_xenpv_qemu:
> >      skip virtio because "dm_needed" is NULL
> > 
> > retrieve_domain_configuration_end:
> >      skip because "compare" is "libxl_device_virtio_compare" which is NULL
> > 
> > libxl__update_domain_configuration:
> >      skip because "update_config" is NULL.
> > 
> > So, I think the patch is fine, adding virtio to the device_type_tbl
> > array is good for completeness, but the patch description may be
> > misleading.
> > 
> > Did I miss something?
> 
> No, you didn't.
> 
> Just to be clear, there is no issue within *current* the code base, I am 
> experimenting with using device-model bits, so I implemented 
> libxl__device_virtio_dm_needed() locally and noticed that it didn't get 
> called at all, the reason was in absence of libxl__virtio_devtype in the 
> said array.
> 
> Do you agree with the following addition to the commit description?
> 
> "Please note, there is no issue within current the code base as virtio 
> devices don't use callbacks that depend on libxl__virtio_devtype 
> presence in device_type_tbl[]. The issue will appear as soon as we start
> using these callbacks (for example, dm_needed)."

Yes, that would be fine. With that addition:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

