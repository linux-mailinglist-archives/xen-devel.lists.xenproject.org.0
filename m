Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5BF710E75
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539644.840751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2C5D-0005hu-TO; Thu, 25 May 2023 14:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539644.840751; Thu, 25 May 2023 14:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2C5D-0005g1-QM; Thu, 25 May 2023 14:36:51 +0000
Received: by outflank-mailman (input) for mailman id 539644;
 Thu, 25 May 2023 14:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ga2A=BO=citrix.com=prvs=5022cd99a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q2C5C-0005fv-CP
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:36:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93121e8e-fb09-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 16:36:47 +0200 (CEST)
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
X-Inumbo-ID: 93121e8e-fb09-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685025407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WYlecdcfITSHWJwnhw60PwZawoXJ0bmlqJMKFxXgcAc=;
  b=CaOcVg4xhy88sXWDR36Kg52r93lrM2K4SMhvA0JTz+Yq+/AX2W8++osR
   reBUjDWp9FR02wNi4Ze4oi3AjVGB4dXCwyApp9IQJDrO2UdV/vObKkXYf
   /8qkWqhonjA58Usla8iXIyo9P5YuFYE6BFyKhsRBHmId168XdvvMzvItR
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110291947
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/K7LgKAmOJEckBVW/+Xjw5YqxClBgxIJ4kV8jS/XYbTApDlx0jJRz
 DYfCD3UOq2PYmSnL49xOo238ExVup7dxoVjQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C4wRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw67xbOX1A8
 dgjEjEIQE7YrcyL6o+AY7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XSH5QMzxrHz
 o7A1yPoOzUaCfqZ8h3fw3D2rMzMxGD7eLtHQdVU8dY12QbOlwT/EiY+V1G2vP24gU6WQM9EJ
 gof/S9Ghaov8E2mSPHtUhv+p2SL1jYHQMZZGeA+7ACLy4LX7hyfC2xCSSROAPQ5sOcmSDps0
 UWG9/v5CDoqvLCLRHa18raPsSj0KSUTNXUFZyIPUU0C+daLiIgrgwjGVNpLDK+/hdqzEjb1q
 w1mtwBn2e9V15RSkfzmoxae2WnESoX1ohAd91/7Zn6r6idCXo+gSdLzw3bmx8t7BdPMJrWeh
 0Qsl8+b5eEIKJiCki2RXekAdI2UC+a53C702gA2QcR4n9i50zv6JN0LvmkiTKt8GpxcEQIFd
 nM/ru+4CHV7GHKxJZF6bIuqYyjB5fixTI+1Phw4gzcnX3SQSONl1Hs2DaJz9zq3+KTJrU3YE
 cnzTCpUJSxGYZmLNRLvLwvn7Zclxzol2UTYTo3hwhKs3NK2PSDFFeZYawHVNLlktMtoRTk5F
 P4GbaO3J+h3CrWiMkE7D6ZIRbz1EZTLLc+v8JEGHgJyCgFnBHsgG5fs/F/VQKQ8x/49vr6Rr
 hmAtrpwlAKXaYvvdV/bNRiOqdrHAf5CkJ7MFXdyYw35hSZ5Pd3HAWV2X8JfQITLPddLlZZcJ
 8Tpse3aahiTYlwrIwggUKQ=
IronPort-HdrOrdr: A9a23:dL77KaGB3WxbrIZNpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: 9a23:7OM+92Gvc0/aUrbCqmJ2rmIsBs4hVkbnzXL+fRSSJ1tDdYa8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AGWu+hQ2VSJ2BhrkXjG9VQ9h5VDUjpLWXLEAwt5M?=
 =?us-ascii?q?9nJO1N3ZaGDTEzzSXe9py?=
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="110291947"
Date: Thu, 25 May 2023 15:36:40 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 08/15] build: use $(filechk, ) for all
 compat/.xlat/%.lst
Message-ID: <9b27e21a-6a9a-420d-b74f-41e4b7ada2fb@perard>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-9-anthony.perard@citrix.com>
 <b04a433a-0606-e473-cb1e-41b45bd1079f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b04a433a-0606-e473-cb1e-41b45bd1079f@suse.com>

On Thu, May 25, 2023 at 02:04:00PM +0200, Jan Beulich wrote:
> On 23.05.2023 18:38, Anthony PERARD wrote:
> > Make use of filechk mean that we don't have to use
> 
> I think you mean "Making use of filechk means ...", or else it reads as
> if you're changing how filechk behaves. (I'd again be happy to adjust
> while committing, provided you agree; here it looks pretty clear that
> there is no dependency on earlier patches, and there's also no need to
> wait for further acks.)

The change sounds good. And yes, no dependency.

> > $(move-if-changed,). It also mean that will have sometime "UPD .." in
> > the build output when the target changed, rather than having "GEN ..."
> > all the time when "xlat.lst" happen to have a more recent modification
> > timestamp.
> > 
> > While there, replace `grep -v` by `sed '//d'` to avoid an extra
> > fork and pipe when building.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks,

-- 
Anthony PERARD

