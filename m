Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBD705358
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 18:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535420.833121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyxKF-0008Gg-U7; Tue, 16 May 2023 16:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535420.833121; Tue, 16 May 2023 16:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyxKF-0008Db-Qh; Tue, 16 May 2023 16:14:59 +0000
Received: by outflank-mailman (input) for mailman id 535420;
 Tue, 16 May 2023 16:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0wm=BF=citrix.com=prvs=4936e02c6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pyxKD-0008DV-A0
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 16:14:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d2d2c9-f404-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 18:14:54 +0200 (CEST)
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
X-Inumbo-ID: c9d2d2c9-f404-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684253694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VxODdMrCBjVxUSwtvqjRIRyj6mcOXr/iZtrFrAOhNPs=;
  b=fxBGw0If5FPlDcXR+HCkqaBMSWFm41s4sajmqolQpDWwxGRXjj0mlCKZ
   tmUxg4kjcEijwXXw6H2uWr1BJLX6xXYMFFyb/V9nYp6zDlkgp3fNTv2UH
   Ctx8JWMromTOVclLTdh1mm+Xj+8GIHGbCNHlfjd14p0wtT2XrHVXTSx9z
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109132810
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rRsmAa922pHNYqvhu22dDrUDtH6TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2ZKWG3XParZZzP1eN8iaYyyphxXsJCHy9MwTVBs/CE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI+1BjOkGlA5AdmOKkV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklk3
 qQbF2wKNCuM3cur5fGYE9V2n/4seZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhfB/
 TiWpjyR7hcyDuea1h2u62yXxfbzgwzLH98NNJam36s/6LGU7jNKU0BHPbehmtG+jkewc9tSM
 0IQ92wioMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRzhNcs07t+c5QDUr0
 hmCmNaBLSNrmK2YTzSa7Lj8hTqqNDIcN2MqeS4ORgxD6N7myLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7p+VT1Jrn+gr8jGiFu72KbVcJ/BztUTfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fK4fTgGfqqOBjarXnSWXFHvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF7mnlhmD2CHMyklXxLNIZyg1bEIYrpzXPUNrxphE96iF+9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUUG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3CaXeFnSNSsyNNsCn/9X9BoGAMDlBn7ws1BLXGplxPt3m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:X3RZSqPeJ+ybK8BcTvujsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICO8qTNWftWLdyQiVxe9ZnOzf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+od/A==
X-Talos-CUID: =?us-ascii?q?9a23=3ADv0dtmsHUFpNiusiPuNUsIRt6IsPWSXe8yvXeXS?=
 =?us-ascii?q?3U090bf62EGOK4Zlrxp8=3D?=
X-Talos-MUID: 9a23:h8vf1AV6DwlwN+Xq/AXXgS5FH9522Oe3NF4iodJbpOmvKwUlbg==
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109132810"
Date: Tue, 16 May 2023 17:14:42 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v3] Fix install.sh for systemd
Message-ID: <cb6134cc-d66d-4fa3-b2c6-0049424aac10@perard>
References: <20230512113643.3549-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230512113643.3549-1-olaf@aepfle.de>

On Fri, May 12, 2023 at 11:36:44AM +0000, Olaf Hering wrote:
> On a fedora system, if you run `sudo sh install.sh` you break your
> system. The installation clobbers /var/run, a symlink to /run.
> A subsequent boot fails when /var/run and /run are different since
> accesses through /var/run can't find items that now only exist in /run
> and vice-versa.
> 
> Skip populating /var/run/xen during make install.
> The directory is already created by some scripts. Adjust all remaining
> scripts to create XEN_RUN_DIR at runtime.
> 
> Use the shell variable XEN_RUN_DIR instead of hardcoded paths.
> 
> XEN_RUN_STORED is covered by XEN_RUN_DIR because xenstored is usually
> started afterwards.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Tested-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

