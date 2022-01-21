Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C810495E44
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 12:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259319.447495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAruR-0005Bp-Fg; Fri, 21 Jan 2022 11:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259319.447495; Fri, 21 Jan 2022 11:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAruR-00059C-CW; Fri, 21 Jan 2022 11:16:47 +0000
Received: by outflank-mailman (input) for mailman id 259319;
 Fri, 21 Jan 2022 11:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAruP-000596-Hr
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 11:16:45 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c68b84e-7aab-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 12:16:44 +0100 (CET)
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
X-Inumbo-ID: 9c68b84e-7aab-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642763804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=579+9ZLHPP5v3s3zHHoKTfh1YnRNB/uNW0k+2wiUxY8=;
  b=hogHfykGW4MuDDJYcynE+dKZZHgxzGDhNvncP/WnYd5My+izdVcCLH/B
   ProQR6aDTmsYSxPpl+FtECSNIFZPjEYiowNzKlEixs9R9MQUUgOS1Vcsg
   3XIhEO+vjuZJdfgtwChM24vONkZvuzoSinHCnFGTJimVgLSPg7zVbK3+m
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FN5SC08U3Bgp+At31mZikkACmFRsb0s5kC8idTwoO8eipptHBTcXW7sObk8j9hTVhsX7G9kb8N
 /wVbc1reWrS0j0WMGn96/CHRAxv9CgmLXQaFQaqNllwPbLG4Z6RsP23NU9w6vPbuICAiqMvr0t
 ZUYbwjzSjoe7DiUgwkjpDoy/u31csCdwZbh+eZEUJyrOktawwQly3RtHFa2JroNne92wtqX7Ay
 urM9/iP4IQ8BSs99mKO6p2Bhd4QNMkhV3dZDdn/XJuC+tWWnifYTvldFKGx4clzf9GNHS3CvxT
 qNlLBd4+nC/MeDIue0pPSPMV
X-SBRS: 5.2
X-MesageID: 62399296
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2PCeqqJMTUMDQPqaFE+RNJIlxSXFcZb7ZxGr2PjKsXjdYENS32AEz
 GIXW2uEPvmLNGrwedwiYYi18RsG6MXdnNU1TFdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB21nt1A5
 9Bopaa2WD0HOb3Fqu8ZSCVxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glq3ZEfR6eAD
 yYfQTE0PRTibTZxA1YwKY4knuqrxV7EIwQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2nCjnOjUhgvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILo4guoKW0hXgRHeeYIs98/dzcuz
 WOgyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9XBm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7EFjFtX
 1BewqByCdzi67nXxURhp81XTdmUCw6tamG0vLKWN8BJG86R03CiZ5tMxzp1OV1kNM0JERewP
 hOJ5lsKtc4KYCXyBUOSX25XI59ypUQHPY+9Ps04k/IUOsQhHON51HwGibGsM5DFzxF3zPBX1
 WazesewF3cKYZmLPxLtL9rxJYQDn3hkrUuKHMiT503+jdK2OSDJIZ9YbgrmRr1pvcus/VSOm
 /4CZpTi9vmqeLCkCsUh2dRNfQliwLlSLc2elvG7gcbaclM5QzlwUqGIqV7jEqQ895loei7z1
 inVcidlJJDX3xUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:0VlYWa+kVpXC0JwusP9uk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62399296"
Date: Fri, 21 Jan 2022 11:16:38 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] tools/xenstore: use talloc_asprintf_append() in
 do_control_help()
Message-ID: <YeqWFgUKXUJQ580B@perard>
References: <20220120065947.31587-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220120065947.31587-1-jgross@suse.com>

On Thu, Jan 20, 2022 at 07:59:47AM +0100, Juergen Gross wrote:
> Instead of calculating the length of all help output and then
> allocating the space for it, just use talloc_asprintf_append() to
> expand the text as needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

