Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEA72C6E0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:05:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547160.854414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iA0-0006Hf-A1; Mon, 12 Jun 2023 14:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547160.854414; Mon, 12 Jun 2023 14:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iA0-0006FD-6M; Mon, 12 Jun 2023 14:04:44 +0000
Received: by outflank-mailman (input) for mailman id 547160;
 Mon, 12 Jun 2023 14:04:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COfM=CA=citrix.com=prvs=5202ad488=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q8i9y-0006F7-No
 for xen-devel@lists.xen.org; Mon, 12 Jun 2023 14:04:42 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11af72b6-092a-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:04:40 +0200 (CEST)
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
X-Inumbo-ID: 11af72b6-092a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686578680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YOd/6V4B9CxUyxO0MvwfIi5irZQXNcV8zi/Ogq486jY=;
  b=MmKKq3u9/AzqUeb+sTooO5ObyVCouEHdJqR0n/M6H/f7B9qmq7gmZpZ4
   EVvLC0DGB7xCIQJNEF/d65heY34xmV2g2Sj5MJKSQvjeGlr1VtE2uAITG
   S7J3L2ja6Gkj9/3xx+sXYDMFKz+kVe7uOJsp3fuAmU0xvIQrJadC1j6FL
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111218772
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2jocR6B3QUqZSRVW/2vkw5YqxClBgxIJ4kV8jS/XYbTApGsrhmcOm
 2QZWGHVOP2PZ2ejeNl/aNzlpkMFuZ/UnYA3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq899DD9/2
 6QiODk2LQndqP6/7aOFVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XTH5wFwRnCz
 o7A1z6nUhAeE/qb8gSE63CwrbPBmi74Wo1HQdVU8dY12QbOlwT/EiY+S1qhrOK5zE2jXttFA
 0gV/CM0qu417kPDZsnwWVi0rWCJujYYWsFMCKsq5QfLzbDbiy6bCXIDVSVpc8E9uYk9QjlC/
 l2Um9LkAxR/vbvTTmiSnp+KrDW5NC4Ja2AfZDMYShct59jlqZs0yBXVQb5LC7Kvh8HyAnT8z
 i6iqzB7g7QIkdVN06S99ErAxTW2qfDhRwo49kPdU2Sj4w5RYI+jbpavr1/B4p5oKY+FTliMo
 T4cnMmE7e0UJZWMkiWXR6MGG7TBz/GBPT7HnU90H7Eu8j2s/zioeoU4yDxkJUQvKc0EeDvtY
 UnckQdQ4pZJOz2td6AfS4upBt4j16TICdXvXfeSZd1LCqWdbyfeonsoPxTJmTmwzg51y/pX1
 YqnndiEXF8QBPpW4mKMV+4mkqZ16Tw36HLtWsWup/i46oZydEJ5WJ9cbgvQNLBit/LZyOnG2
 40BbpXXkn2zRMW7O3CKqtBLcDjmOFBhXfjLR9prmvlvy+aMMEUoELfvzLwoYOSJdIwFx76Tr
 hlRtqK1oWcTZEEryi3QMBiPkJu1Af5CQYsTZETAx2qA1Xk5epqI56wCbZYxdrRP3LU9naApF
 6lZI5TYXqonptH7F9M1N8CVkWCfXE7z2VLm09SNPVDTgKKMtySWo4S5L2MDBQEFDzattNtWn
 lFT/lqzfHb3fCw7VJy+QKv2nzuMUY01xLoas73gfoMCJy0BMeFCd0TMsxPAC5tVcUWYmmrLj
 lj+7NVxjbClnrLZOeLh3cisx7pF2cMkdqaGNwE3NYqLCBQ=
IronPort-HdrOrdr: A9a23:3byc4Kwbfxz/7VWQH+1IKrPwAL1zdoMgy1knxilNoEpuA6ilfq
 eV8MjztCWatN91YhodcL+7VpVoLUm8yXcW2/hzAV7SZmnbUQKTRekJgLcKpQeQfhEWndQtt5
 uIHZIOcOEYJGIK6vrS0U2VFMsh3cnC0I3Av5ak8561d3ANV0i31XYBNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3ApRV5GWrePL6CzzpMUm3eXxHmUZEMeHCD/VmIGV+?=
 =?us-ascii?q?xMiVwFpKJQHKBxrwxxg=3D=3D?=
X-Talos-MUID: 9a23:umtXJAZeYkkwsuBT7WG8hTVFEsNT3aW3ClwmzZsBtsqGOnkl
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111218772"
Date: Mon, 12 Jun 2023 15:04:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V3 1/3] libxl: virtio: Remove unused frontend nodes
Message-ID: <c0b56a86-e681-4db3-af11-32d5ac9bf713@perard>
References: <cover.1685684586.git.viresh.kumar@linaro.org>
 <fef3d3ca5b2c78eaf85e907f03561e82a05fdeb6.1685684586.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fef3d3ca5b2c78eaf85e907f03561e82a05fdeb6.1685684586.git.viresh.kumar@linaro.org>

On Fri, Jun 02, 2023 at 11:19:07AM +0530, Viresh Kumar wrote:
> Only the VirtIO backend will watch xenstore to find out when a new
> instance needs to be created for a guest, and read the parameters from
> there. VirtIO frontend are only virtio, so they will not do anything
> with the xenstore nodes. They can be removed.
> 
> While at it, also add a comment to the libxl_virtio.c file.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

