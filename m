Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C436A073C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:22:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500248.771543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9g0-00023J-BT; Thu, 23 Feb 2023 11:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500248.771543; Thu, 23 Feb 2023 11:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9g0-00020Y-8g; Thu, 23 Feb 2023 11:22:16 +0000
Received: by outflank-mailman (input) for mailman id 500248;
 Thu, 23 Feb 2023 11:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOJK=6T=citrix.com=prvs=41104d4c8=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pV9fz-0001yQ-Im
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:22:15 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51ef61fe-b36c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:22:14 +0100 (CET)
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
X-Inumbo-ID: 51ef61fe-b36c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677151334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/LaXOhlKy62fsRtyznVF8MxgJx0IoUtdGt3a7/D3zLQ=;
  b=Vpiu5CjluN/7B1aQnbMsA2PXagar5a49ocsQCTrC6aGjVWr3RwoOo5f7
   uuwMiPSU0/LCpyF/RSnmar/FTfBRQoeedj/jCcgf0ep4SWLRYcT78aJd5
   1PdzzRcbyqNofipHawRXRkS9uHZe9Jzx9w7qwMBJabXVgRN1E/DkW+4rM
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97035940
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ma2Nna2hC+2ilq4XhfbD5Xdxkn2cJEfYwER7XKvMYLTBsI5bp2NTz
 TEbCmyEPv3ZYmryet8ib9zn8R8OvpGAytRgSAVtpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUWdS2
 uA0JBw2QCui2dDs2b+ha9t+v5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFJoNxRvJ+
 jquE2LROTdFEtun1Qu80VX0hcySnn7HcaIdPejtnhJtqALKnTFCYPEMbnO5vP24h0iWS99Zb
 UsO9UIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6VC20FZj9Hdt09tcUySCAq1
 1mGhNfgD3pkt7j9YXCS7L6QqRu7PCEHKmlEbigBJSMH6dT+pIA4jjrUU81uVqWyi7XdBjXY0
 z2M6i8kiN07j9MNkaOy/lnFgjeljpnPUgMxoA7QWwqN7Q5nZYjje42h73Da6+pNKMCSSVzpl
 GANhsy2/O0IS5aXm0SlSf0ABriz696ZMTfXhhhkGJxJyti20yf9J8YKumg4fRo3dJ9eIlcFf
 XM/pysB4oN8IFemQZRZWKPvOZ4zwLLBJ8bcA6W8gsV1XrB9cwqO/SdLbEGW3nzwnEVErZzTK
 at3Yu73Uy9EVP0PIC6eAr5EjOR1nnxWKXb7H8iT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7dwxiwZsTX8qeRylrmgmrc2Jb9JkJUaO5/F/YU9UNc15pvunJ5
 GqhfURT1UDyg3bKQS3TNC88MOK3DM8n8i1nVcDJAbpP8yJ+CbtDEY9FL8dnFVXZ3LELIQFIo
 wktJJzbX6UnpsXv8DUBd5jtxLGOhzzy7T9iyxGNOWBlF7Y5HlyhxzMRVle3nMX4Jnbt5JRWT
 nzJ/l+zfKfvsCw7VpmNOajxlwPr1ZXf8corN3b1zhBoUB2E2OBXx+bZ15fb/+lkxc3/+wan
IronPort-HdrOrdr: A9a23:CdLyc6qtdnsC9qHoLhsP8wsaV5oReYIsimQD101hICG9E/bo9P
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEGgN1/qE/xTQXwH46+5Bxe
 NBXsFFebvN5IFB/KPHCd+DYrIdKXK8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="97035940"
Date: Thu, 23 Feb 2023 11:22:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, <demi@invisiblethingslab.com>, "Julien
 Grall" <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Paul Durrant
	<paul@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag
 in *.c
Message-ID: <Y/dMXBQJ86QHEAMB@perard.citrite.net>
References: <20230209230020.52695-1-julien@xen.org>
 <20230209230020.52695-2-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230209230020.52695-2-julien@xen.org>

On Thu, Feb 09, 2023 at 11:00:15PM +0000, Julien Grall wrote:
> This is replacing the below pattern with the SPDX tag GPL-2.0 in

The "GPL-2.0" identifier is actually deprecated:
    https://spdx.org/licenses/GPL-2.0.html
We should use "GPL-2.0-only" instead.
    https://spdx.org/licenses/GPL-2.0-only.html

> xen/arch/x86/*.c:
> 
>  * This program is free software; you can redistribute it and/or modify it
>  * under the terms and conditions of the GNU General Public License,
>  * version 2, as published by the Free Software Foundation.
>  *
>  * This program is distributed in the hope it will be useful, but WITHOUT
>  * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>  * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>  * more details.
>  *
>  * You should have received a copy of the GNU General Public License along with
>  * this program; If not, see <http://www.gnu.org/licenses/>.

-- 
Anthony PERARD

