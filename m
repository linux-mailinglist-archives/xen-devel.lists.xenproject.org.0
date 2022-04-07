Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53B4F7C35
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 11:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300614.512865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOqG-0008US-09; Thu, 07 Apr 2022 09:54:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300614.512865; Thu, 07 Apr 2022 09:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncOqF-0008Rd-SS; Thu, 07 Apr 2022 09:54:15 +0000
Received: by outflank-mailman (input) for mailman id 300614;
 Thu, 07 Apr 2022 09:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2qr=UR=citrix.com=prvs=08907668d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ncOqE-0008RT-Ch
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 09:54:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ace57bb0-b658-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 11:54:13 +0200 (CEST)
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
X-Inumbo-ID: ace57bb0-b658-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649325253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q9ilmh6Q/+4PCubIhN7HuEFE1hpMKlPHUEJzlDY1wf8=;
  b=VknEoeZYZZEVlBhzWGxTV5uxMFSfM9QWJeMUBl7AImojSefy3NegcLLJ
   20AJLnrTuHO9lmUyWGxTCOEVZJmfof2rwPmFPrA4XcAU847IBF7Cn8CPK
   CM+AdRsEblX32jHol2RHZpvo1bluF/onVql+kh3k+7fJ7B3wQgrYMfItP
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68652061
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J97cyKu5geq52G5Lq9VtBbvJe+fnVFheMUV32f8akzHdYApBsoF/q
 tZmKW7VPqmLMWqhftEnboXlpkgEsJbdnIRmGgpkpShkEisT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/V5
 ouryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8EMoHQpP0gWiJGUH1vMYoBobqXC3iw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQ/MkmaO0MWUrsRILQZjsCVjHnTSWJRmAKe5rQ702HfwyUkhdABN/KKI4fXFK25hH2wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZhiUefwWE7AxQMWVy25/K+jyaWQMlDI
 kYZ/i4vq6ka90GxSNT5GRqirxa5UgU0AoQKVbdgsUfUl/SSs13x6nU4oiBpRdAKqPMveDURy
 BzVjt/OQmVq4JeVRifInluLlg+aNS8QJG4EQCYLSwoZ/tXuyL0OYgLzosVLS/Ds0ICscd3k6
 3XT9XVl2e1P5SIe///jlW0rlQ5AsXQgouQdwgzMFlyo4QpiDGJOT9z5sAOLhRqswWvwc7Vgg
 JTms5XGhAztJcvU/MBofAnrNOv0jxpiGGeB6WOD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYCrwPfIqM93uUp1CIU3c+TLNDK28gj1mOMYZSeN61Hs2OR74M57FziDAbp3Ty
 b/EKJ3xXB72+IxszSasRvd17FPY7ntW+I8nfriil07P+ePHPBa9EO5ZWHPTPrFRxP7V+239r
 ocAX/ZmPj0CCYUSlAGMqtVNRb3LRFBmba3LRzt/KrbYclU7Qjl4YxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:TqZG9quiEh1w5/V7DUjIlqZJ7skDdNV00zEX/kB9WHVpmszxra
 GTddAgpHjJYVcqKRUdcL+7VJVoLUmyyXcx2/h2AV7AZniChILLFvAA0WKK+VSJcEeSygce79
 YDT0EXMqyIMbEQt6bHCWeDfeod/A==
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68652061"
Date: Thu, 7 Apr 2022 10:54:06 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <cardoe@cardoe.com>, <xen-devel@lists.xenproject.org>,
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as Continuous Integration
 maintainer
Message-ID: <Yk60vk2xmnTfBZsR@perard.uk.xensource.com>
References: <alpine.DEB.2.22.394.2204061323490.2910984@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204061323490.2910984@ubuntu-linux-20-04-desktop>

On Wed, Apr 06, 2022 at 01:27:05PM -0700, Stefano Stabellini wrote:
> I have contributed all the ARM tests to gitlab-ci. After checking with
> Doug, I am happy to volunteer to co-maintain Continuous Integration.
> 
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Doug Goldstein <cardoe@cardoe.com>
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a097b43eb..cc87d5bbf1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -262,6 +262,7 @@ F:	CHANGELOG.md
>  
>  Continuous Integration (CI)
>  M:	Doug Goldstein <cardoe@cardoe.com>
> +M:	Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>
for the addition.

>  W:	https://gitlab.com/xen-project/xen
>  W:	https://travis-ci.org/xen-project/xen

It's look like this entry is staled, we don't use travis anymore.

There's some more entry that are staled:
> F:      .travis.yml
This file was removed by e0dc9b095e ("CI: Drop TravisCI")

Cheers,

-- 
Anthony PERARD

