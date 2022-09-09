Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C777C5B3B63
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 17:03:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404443.646918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfWr-0007QU-Ol; Fri, 09 Sep 2022 15:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404443.646918; Fri, 09 Sep 2022 15:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWfWr-0007Od-Lu; Fri, 09 Sep 2022 15:02:49 +0000
Received: by outflank-mailman (input) for mailman id 404443;
 Fri, 09 Sep 2022 15:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWfWq-0007OX-0h
 for xen-devel@lists.xen.org; Fri, 09 Sep 2022 15:02:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a13f0f-3050-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 17:02:46 +0200 (CEST)
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
X-Inumbo-ID: 75a13f0f-3050-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662735766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wC6lIJM4fDkL2TNAkHxCnZOgC9YLapXEbaLWhneaQ1E=;
  b=Z7WY0mfM6p/io7Ay8bAH89tgNhyC5HQ5NsdWcW1LG9gY3/h48FbT8qx3
   N06xXiIoZRym3rfZ7+a/SIRnZthhbAZb1a4booZYn7wPjovrQ/zWB/4Sj
   Ywc0JcljH7X2BH6XkhIKFn2RHOW8KJx5b4NgRehPNTgDPoG46EKF6Op2h
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80155415
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Kk4guqlp2vLJ28nSmn/VXlXo5gzAIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWGiBbPvYamLwc9lwbtm+8R4GuseByIVgHAQ+rXozQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37ayj4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2l1NKsh3v9SMVhqz
 tJfJg8HfCCb3L2plefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+Oi1aYeIJoXXLSlTtl+n+
 Fndr3TYOBUfacSekAqs8y2+38aayEsXX6pNTeblp5aGmma7wWgeCwYKREC7ifa8g0+6HdlYL
 iQ8/ystoO4y80iuQ8LVWxy+qWSD+BkGVLJ4FuQm6ACA1+zM5AeDB2UeZjpAbtU8s4k9QjlC/
 l2Um9LkAxR/vbvTTmiSnp+Woim1IjM9NnIZaGkPSg5ty8bniJE+iFTIVNkLOLC0iNb4Hy22z
 C2LsDQ5m50XjMgCzaL9+krI6xq8q56MQgMr6wH/WmO+8hg/dIOjIYuy5jDz8/daIZ2ZCFqcu
 XEes8yf6ukUCteKjiPlaP4REb+g4fHDKyHVi1NrG5gn9hy9+nqie5AW6zZ7TG9gNssUPzXkZ
 knetCtV5ZlaJnzsarV4C6qqF94j0a/7UNjoSNjTdp9KY4Ntb0mD/Sdnf0nW2Hri+HXAiolmZ
 83dK5z1Sy9HV+I3l1JaWtvxz5dozwYH4Xr2danf9Drg34WUdk6NEugaZQ7mgv8C0E+UnOnE2
 48BaZHUkEwEDLKWjjr/qtBKcw1TRZQvLdWv8pEMKLbeSuZzMDt5Y8I914/NbGCMc059su7Tt
 k+wVUZDoLYUrS2WcF7aApyPhV6GYHqekZ7YFXZ2VbpQ8yJ/CbtDFY9GH3fNQZEp9fZ40dl/R
 OQfdsOLD5xnE2qZoWpDN8Ci9tU/K3xHYD5i2AL8OFACk2NIHVSVqrcIgCO0nMXxMsZHnZRn+
 ODxvu8qaZECWx5jHK7rVR5b9Hvo5CB1pQ6HdxGXSjWlUBmzrdMCxu2YpqNfHvzg3j2YnmLGi
 17PW05CzQQPyqdsmOT0aWm/h9/BO4ND8oByRQE3MZ7e2fHmw1ee
IronPort-HdrOrdr: A9a23:pK0i5KkNXWbNV5R8kfxjqYizzdHpDfIu3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5OUtQ/exoV5PtfZqxz/FICMwqTNGftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCFHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="80155415"
Date: Fri, 9 Sep 2022 16:02:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH V6.1 3/3] libxl: arm: make creation of iommu node
 independent of disk device
Message-ID: <YxtVjpDU1HOrhiAE@perard.uk.xensource.com>
References: <099616e1092409fceea4eb30590215310f8c091c.1662626550.git.viresh.kumar@linaro.org>
 <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ebcf40f0d5dfe6bfa27c11dc2fe3e65df48772fe.1662734469.git.viresh.kumar@linaro.org>

On Fri, Sep 09, 2022 at 08:13:28PM +0530, Viresh Kumar wrote:
> The iommu node will be required for other virtio device types too, not
> just disk device.
> 
> Move the call to make_xen_iommu_node(), out of the disk device specific
> block and rename "iommu_created" variable to "iommu_needed", and set it
> to true for virtio disk device.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

