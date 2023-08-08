Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C650F773A94
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579949.908167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNBZ-0006ik-SX; Tue, 08 Aug 2023 13:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579949.908167; Tue, 08 Aug 2023 13:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTNBZ-0006gW-Pi; Tue, 08 Aug 2023 13:55:45 +0000
Received: by outflank-mailman (input) for mailman id 579949;
 Tue, 08 Aug 2023 13:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTNBY-0006gQ-P5
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:55:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42a0f203-35f3-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:55:42 +0200 (CEST)
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
X-Inumbo-ID: 42a0f203-35f3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691502941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17T/aoOsALy0M/J00/DrJ/Rw39x1aMjip/oySxG8Qo4=;
  b=dkM43OnAGNGpRZDQ4J59s3AO0iXs+v0YX+xd0s98c9EuTAWGkVrjE1py
   a7Xft+xUyn+8b7uheOcKgd3laILjsZNHY/g8BJADti+HWtqcn8Yhri3gR
   6whF9FkgNVg3RF1vrXXxHO++ENyjizGQ7vgNodCUlg560PIyN44mdaxVp
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118138738
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:OEqeLKCHj0zmNRVW/w/jw5YqxClBgxIJ4kV8jS/XYbTApG8q0DADy
 GdKUWDVP6qLM2DwKI9wPtzi/B4Cu5CBy4dnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GNA7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8eYwIHBi7
 /MhAz0jNUCpo6Hr/7brc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XaHJ4FwR3Iz
 o7A1zjIIggjbtiW8juU7Cq8g/CfnS3QWqtHQdVU8dY12QbOlwT/EiY+V1ShpuKiolWjQN8ZI
 EsRkgI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yxmdLngJSHhGctNOnMYuSCYjz
 FOhg9LjDjspu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8bhRKIb8dPCqGMpdDbQmHa5
 3PXkyxuvuBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWWxC
 KMwkVkLjHO2AJdNRfEfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ9yP1kY
 s3KLZb1XR727JiLKxLsHo8gPUIDnHhilQs/u7ikp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJJ9A0xvsIy7aSl
 px/M2cBoGfCabT8AV3iQhhehHnHB/6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:+NW3iKuuc/1AAo4GShoJOMRA7skDTNV00zEX/kB9WHVpm5qj5q
 eTdZMgpHzJYVcqOE3I9urqBEDtexnhHP1OgLX5X43MYOC8ghrNEGgK1+KL/9SHIUDDH4Vmu5
 uIHZITNDVeZ2IK6/oTTGODYrQdKHjsytHMudvj
X-Talos-CUID: =?us-ascii?q?9a23=3AzEbXPmgjPhfQcrJckZv+ez5dBTJueX2a7Wb8OUC?=
 =?us-ascii?q?BImtHE+2/bRzNx6c0qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AZGQRkgy7do8o0Yege/ogsR1sYCKaqPifKFk0y5E?=
 =?us-ascii?q?PgMiVK3RgPijNjDqcQKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,156,1684814400"; 
   d="scan'208";a="118138738"
Date: Tue, 8 Aug 2023 14:55:33 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] tools/xl: reject bootloader=pygrub in case pygrub
 is disabled
Message-ID: <fe01f752-ac14-4bde-b81a-ca558cbf8163@perard>
References: <20230808132219.6422-1-jgross@suse.com>
 <20230808132219.6422-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808132219.6422-4-jgross@suse.com>

On Tue, Aug 08, 2023 at 03:22:19PM +0200, Juergen Gross wrote:
> In case Xen has been configured with "--disable-pygrub", don't accept
> the domain config option "bootloader=pygrub".
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I'm unsure about this patch, but I guess we kind of expect pygrub to be
built at the same time as `xl'. And it still allow to use "pygrub" if
one specify the full path to it. So,

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

