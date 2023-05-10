Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784166FE2E4
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 19:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532954.829301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwnB2-0003qe-2O; Wed, 10 May 2023 17:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532954.829301; Wed, 10 May 2023 17:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwnB1-0003oP-Ux; Wed, 10 May 2023 17:00:31 +0000
Received: by outflank-mailman (input) for mailman id 532954;
 Wed, 10 May 2023 17:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0RdQ=A7=citrix.com=prvs=48752e3ca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pwnB0-0003oJ-52
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 17:00:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2902bee6-ef54-11ed-b229-6b7b168915f2;
 Wed, 10 May 2023 19:00:28 +0200 (CEST)
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
X-Inumbo-ID: 2902bee6-ef54-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683738028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=razkh7WSXxnGlMs6f+lGuSwuIwxW+cZSqfJrJE8zXMM=;
  b=iVYMh/FfbH7h9s4w5l0KB1dyJUZtc+sLZB0nvw0VJ1nAIMbPSf10hiZX
   dy/usfQdcYQmR9mvpDecq0D12VCkXYO0jKrYDckA5O0xEi9xQwonc1pAk
   sfuqPiDUb+AfVojjebp3iqFK2h1723xLlwvHu5t0QOi2WiI7YekKoht+K
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108442796
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:H060h6KP3PT8mUkvFE+R+ZUlxSXFcZb7ZxGr2PjKsXjdYENShjBVn
 zcfCDuBbqzeajbxKdAjPY21ph8GvJ7Qz9ZhG1RlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5TX10Tr
 6VHMwkHQQi8gOmznaq4GvlV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZUJwhzH9
 zyuE2LRKS1dEu6F9TC+2WuhtN3Nu32jCZMMLejtnhJtqALKnTFCYPEMbnO5ruO+kVWWQM9EJ
 gof/S9Gha82/UKDR9TlURm15nKJ1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 kCNt8PkA3poqrL9YXuF+62dtz+aJSkfJmhEbigBJTbp+PG6/tt11EiWCI8+Tujs1Iad9SzML
 y6iiHYC2u9K0tUy3YqjwlfMhm+0pcjZd1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9jpYyjJ5fK6fTgAahwzRoUmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTmHLlAjuN7nnxjmAs/oKwXKDz4uYdymVbPEetVWLdwRrpRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbMuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVBBEAkQCm3yebQehIA1g6AI7SsV9EhSpTFUQR0ZyAgRDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:9VqTHa2/FN51js7rEm2CyAqjBSByeYIsimQD101hICG9Kvbo7v
 xG785rliMc6QxhGk3I/OrqBEDuewK4yXcY2+cs1PKZLW/bUQiTXfVfBOnZslnd8kTFn4Y2uc
 hdmupFebrN5DNB7foSlTPIcerIt+P3k5xA692+85/BJjsGV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+Lp7+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+yeWrCAu1fhPl3ont5rcejau5Z+7Qu3+4QowwDX+02VjUJaKvK/VX4O0a+SAR0R4a
 HxSl8bTr9OA/S7RBD0nfM4sDOQkQrGrUWSvmOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljpxKa/ICmw7RgV3eK4Jy1Chw6xuz4vgOQTh3tQXc8Xb6JQt5UW+AdQHI0bFCz35Yg7GK
 02Zfuskcp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIgUn2sG9pg6V55Yjt
 60QJhAhfVLVIsbfKh9DOAOTY++DXHMWwvFNCaILVHuBMg8SgzwQl7MkcoIDc2RCeA1JcEJ6e
 78uXtjxBMPR34=
X-Talos-CUID: 9a23:awk5hmxyL6FFml7mt7VXBgUwRPx4KCSC107aDFeHDm1sFaWWGU+prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AXHsBnQ1iS29B5gPsTApFPkOqYTUjyJjpLnIXrZ8?=
 =?us-ascii?q?9kNCJBx5yHWnF3SWpe9py?=
X-IronPort-AV: E=Sophos;i="5.99,265,1677560400"; 
   d="scan'208";a="108442796"
Date: Wed, 10 May 2023 18:00:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] tools: convert bitfields to unsigned type
Message-ID: <b85759aa-183e-4cf3-9137-1427c947c160@perard>
References: <20230508164618.21496-1-olaf@aepfle.de>
 <0e7c1819-f611-1ba1-9f5a-3295eae7f95d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0e7c1819-f611-1ba1-9f5a-3295eae7f95d@suse.com>

On Tue, May 09, 2023 at 09:10:04AM +0200, Juergen Gross wrote:
> On 08.05.23 18:46, Olaf Hering wrote:
> > clang complains about the signed type:
> > 
> > implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Wsingle-bit-bitfield-constant-conversion]
> > 
> > The potential ABI change in libxenvchan is covered by the Xen version based SONAME.
> > 
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

