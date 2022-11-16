Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0D62C1BB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 16:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444327.699413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovJvS-0002Zy-Em; Wed, 16 Nov 2022 15:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444327.699413; Wed, 16 Nov 2022 15:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovJvS-0002XV-BP; Wed, 16 Nov 2022 15:02:06 +0000
Received: by outflank-mailman (input) for mailman id 444327;
 Wed, 16 Nov 2022 15:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIfa=3Q=citrix.com=prvs=31219dc3c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ovJvR-0002XG-GN
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 15:02:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a070d20d-65bf-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 16:02:03 +0100 (CET)
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
X-Inumbo-ID: a070d20d-65bf-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668610923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvPry1rW0ptZIe4HprQkZ4xldI44Bjk872FTp8DAsP4=;
  b=QGAY6f8npf1q43gLyBf/ZELL0i543sqRO9Z3Pd90W8FNzLsfyKlLhXGS
   xTdbEAH81aCVnYO1oejZstsBCR/NlCcQgd48ZpgrqsUD16lW0DKPyskBt
   ptEeDHh6/HVHUtiWZFu3m+Q/8tqGEvI1FMCtSD37snCVO7+WNp4L0THlu
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84012303
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/mblvKIK7P6OFrH2FE+R4pUlxSXFcZb7ZxGr2PjKsXjdYENS02FRy
 mIdWG/Sb/aONDP2L9BwPoy+oUhVvZ6BmtNhGlNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5wVgPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4sITpI7
 ftCIwwkQSizrrOK/+LnDdJz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozWHZwPxR7Dz
 o7A12rfPh4kLf6N8GGM6izrpM7Bpge4abtHQdVU8dY12QbOlwT/EiY+V0a/oPS/ol6zXZRYM
 UN80igkoLU29UerZsLgRBD+q3mB1jY8VtxKAqsF4QeC4qPO5kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMW3utJy5RRjuPioA6B02nESoX1ohAdvSWMWHqitAhFTaGdV6X51WeLsbF7M9PMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1HswDaJz9zq3+KTJrU3YE
 cnzTCpUJSxGYZmLNRLvLwrduJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXQPr1is/nV8VuKq
 L6z0vdmLD0GDoXDjtT/q9ZPfTjm01BmbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9z4/1E
 7DUchEw9WcTclWddl7SNS49NOuyNXu9xFpiVRER0Z+T8yBLSe6SAG03LfPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:qMtkR6Dvj7pNEaflHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.96,167,1665460800"; 
   d="scan'208";a="84012303"
Date: Wed, 16 Nov 2022 15:01:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "George
 Dunlap" <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH for-4.17 v2 5/6] Rework COPYING installed in
 /usr/include/xen/, due to several licences
Message-ID: <Y3T7V+Q8i//1DD+X@perard.uk.xensource.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
 <20221103115204.49610-6-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221103115204.49610-6-anthony.perard@citrix.com>

On Thu, Nov 03, 2022 at 11:52:03AM +0000, Anthony PERARD wrote:
> The notice in the COPYING file in "xen/include/public/COPYING" doesn't
> really apply to the files that ultimately are been install at
> "/usr/include/xen". The issue are headers in the "sys/" subdirectory
> that comes from other projects such as Linux or FreeBSD.
> 
> The main issue is that there are two headers that have a different
> licence than the MIT licence:
> 
> - xen-sys/Linux/gntalloc.h (installed as "sys/gntalloc.h") is public
>   domain.
> - xen-sys/FreeBSD/gntdev.h (installed as "sys/gntdev.h") is BSD-2.
> 
> To clarify this, we'll install a COPYING file with a different notice.
> 
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---

So the COPYING file is currently listed to be "ignored" by git (at least
when untracked) and that seems to bother someone or something. So I
guess an extra hunk to this patch is wanted:

diff --git a/.gitignore b/.gitignore
index 418bdfaebf..4eb602480a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -195,6 +195,7 @@ tools/hotplug/NetBSD/rc.d/xendriverdomain
 tools/include/acpi
 tools/include/_libxl*.h
 tools/include/xen/*
+!tools/include/xen/COPYING
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
 tools/include/xen-foreign/checker

Cheers,

-- 
Anthony PERARD

