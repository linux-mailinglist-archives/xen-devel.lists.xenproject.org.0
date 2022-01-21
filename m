Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B249619B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 15:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259375.447644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvKU-0006il-G3; Fri, 21 Jan 2022 14:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259375.447644; Fri, 21 Jan 2022 14:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvKU-0006fi-CF; Fri, 21 Jan 2022 14:55:54 +0000
Received: by outflank-mailman (input) for mailman id 259375;
 Fri, 21 Jan 2022 14:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAvKT-0006fb-9W
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 14:55:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d439a5-7aca-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 15:55:51 +0100 (CET)
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
X-Inumbo-ID: 38d439a5-7aca-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642776951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NaRXlwHupBinXn5fzubQl2UrLsm/m1+DpUx3ogW/GmU=;
  b=iQ1xU53FkZWxIhZzN/XtgiGibD9sDECGirCZnM1+/EYOXe2XOLXD/d5j
   AZ/vfIWqTHQT2ommKD+Tvyxcb9CKGGQeExtXpF1AbNdtbyZKZY6w9rs9z
   LxvEQaDqr/LiuNxg95uODT+WLM8yqrYS/Xy+FJqIqadsQ9Q7AbP1CCh1o
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RA/fp89q+XlWjsavLttCCqmrhFNM2coWCCirnZE7aRWuvnzc9/7ZJ9WWmHB4AeeJqLBc4YkATB
 sUBFvhjzNrfv4fYnauac1wCNph9cv3DdoCl1y0yoG0+4AEA+rsesp8VOEqh28JAnOJKXXSWTYM
 gQmQnzkIFYNKIb0oQige20Z1utSJe5E5o5QWiku7tcuh92uoiWf3lvaGX8+EflSj/fPQOV8euF
 tx3PnCtHrXSRPm2ceZxZjDgV/KM4UM+KIpnMZyLyrFLLn3SNwy1VOXCuXYFBzVqreVQuUJxl9S
 KPsoKzk8rfODBNUAKFffhIKo
X-SBRS: 5.2
X-MesageID: 62414346
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UDTV76KMTLkWDim7FE+RNJIlxSXFcZb7ZxGr2PjKsXjdYENS02QCz
 WofC22BafyKMDf2etF1atnkpENSupLSydZrTgZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Uz4tKm
 PtQrqXsE1kVEKHttbUvEAJXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Glq2pkSRqqAD
 yYfQR1Qci3lPxhdA308KrU1x+eY3EDHfBQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2nCjnOjUhgvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1IKJs12iVkYZVQcdMoIamsMXaG0Yl
 USGyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
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
IronPort-HdrOrdr: A9a23:yh9DtakAxKN/WHPgGV7QmohbR0bpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62414346"
Date: Fri, 21 Jan 2022 14:55:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH 2/3] tools/xenstore: fix hashtable_expand() zeroing new
 area
Message-ID: <YerJcqrgaeyd9ZRC@perard>
References: <20220120120236.13826-1-jgross@suse.com>
 <20220120120236.13826-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220120120236.13826-3-jgross@suse.com>

On Thu, Jan 20, 2022 at 01:02:35PM +0100, Juergen Gross wrote:
> When realloc()ing the hashtable for expanding it, zero out all the new
> bytes at the end of the table, not only one byte for each new element.
> 
> Fixes: 186f0e02a1c ("Added hashtable implementation")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

