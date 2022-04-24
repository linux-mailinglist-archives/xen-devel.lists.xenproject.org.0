Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC750D2F5
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 17:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312151.529334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nieRF-0002vD-S7; Sun, 24 Apr 2022 15:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312151.529334; Sun, 24 Apr 2022 15:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nieRF-0002t4-P2; Sun, 24 Apr 2022 15:46:17 +0000
Received: by outflank-mailman (input) for mailman id 312151;
 Sun, 24 Apr 2022 15:46:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nieRF-0002sy-3z
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 15:46:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nieRC-0004vr-5Z; Sun, 24 Apr 2022 15:46:14 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nieRB-0002SI-Vz; Sun, 24 Apr 2022 15:46:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=YdywgbeFh9usAAic3yJ/a3BdO5PaskS+FhaLbPIad5I=; b=6IEkDn7QSR/3Len5p0Lqe2Le9d
	rXM6tYI/pnQw8KY8WyeWKgS84aEGoT0w88Da/20citgVY6AHFSZKDmk9pE2VOx9ZMI4TAwoDgZ379
	ZeiFwwOURiE0t6koFpbbqyhdgewzDmi2mMZRHiOhD9dynsvB2TaGPeeNqEpc/oSJZMFQ=;
Message-ID: <ea06f2ac-4ac1-4a6f-bda6-e775a7e68699@xen.org>
Date: Sun, 24 Apr 2022 16:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Paran Lee <p4ranlee@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Austin Kim <austindh.kim@gmail.com>, xen-devel@lists.xenproject.org
References: <20220422185251.GA7124@DESKTOP-NK4TH6S.localdomain>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: fdt fix duplicated ternary operator, shift
 operations
In-Reply-To: <20220422185251.GA7124@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/04/2022 19:52, Paran Lee wrote:
> It doesn't seem necessary to do duplicate ternary operation and calculation
> of order shift using fdt32_to_cpu macro.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>   xen/arch/arm/bootfdt.c  | 12 ++++++++++--
>   xen/common/libfdt/fdt.c | 10 +++++-----
>   2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index e318ef9603..e5b885a7f2 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -159,8 +159,16 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>               continue;
>           }
>   
> -        as = depth > 0 ? address_cells[depth-1] : DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> -        ss = depth > 0 ? size_cells[depth-1] : DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> +        if ( depth > 0 )
> +        {
> +            as = address_cells[depth-1];
> +            ss = size_cells[depth-1];
> +        }
> +        else
> +        {
> +            as = DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
> +            ss = DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
> +        }
IHMO the original code is easier to read. That said, in the two cases, I 
think this is a bit pointless to check if the depth is > 0 at every 
iteration because it will mostly be only always true but for one node.

So I would go with the following code (not tested):

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index e318ef960386..a382e10065f9 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -144,10 +144,13 @@ int __init device_tree_for_each_node(const void 
*fdt, int node,
       */
      int depth = 0;
      const int first_node = node;
-    u32 address_cells[DEVICE_TREE_MAX_DEPTH];
-    u32 size_cells[DEVICE_TREE_MAX_DEPTH];
+    u32 address_cells[DEVICE_TREE_MAX_DEPTH + 1];
+    u32 size_cells[DEVICE_TREE_MAX_DEPTH + 1];
      int ret;

+    address_cells[0] = DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
+    size_cells[0] = DT_ROOT_NOT_SIZE_CELLS_DEFAULT;
+
      do {
          const char *name = fdt_get_name(fdt, node, NULL);
          u32 as, ss;
@@ -159,13 +162,13 @@ int __init device_tree_for_each_node(const void 
*fdt, int node,
              continue;
          }

-        as = depth > 0 ? address_cells[depth-1] : 
DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
-        ss = depth > 0 ? size_cells[depth-1] : 
DT_ROOT_NODE_SIZE_CELLS_DEFAULT;
+        as = address_cells[depth];
+        ss = size_cells[depth];

-        address_cells[depth] = device_tree_get_u32(fdt, node,
+        address_cells[depth + 1] = device_tree_get_u32(fdt, node,
                                                     "#address-cells", as);
-        size_cells[depth] = device_tree_get_u32(fdt, node,
-                                                "#size-cells", ss);
+        size_cells[depth + 1] = device_tree_get_u32(fdt, node,
+                                                    "#size-cells", ss);

          /* skip the first node */
          if ( node != first_node )

Any thoughts?

>   
>           address_cells[depth] = device_tree_get_u32(fdt, node,
>                                                      "#address-cells", as);
> diff --git a/xen/common/libfdt/fdt.c b/xen/common/libfdt/fdt.c
> index 9fe7cf4b74..a507169d29 100644
> --- a/xen/common/libfdt/fdt.c
> +++ b/xen/common/libfdt/fdt.c

fdt.c is an (old) verbatim copy from DTC (see [1]). I would rather 
prefer to keep this directory as a verbatim copy because it makes easier 
to sync with the upstream version.

In fact, there are a patch on xen-devel ([1]) to re-sync. So any of your 
changes would be lost. Therefore, please send this change to the DTC 
mailing list. We will pick it up on the next re-sync.

Cheers,

[1] https://github.com/dgibson/dtc
[2] 
https://lore.kernel.org/xen-devel/1636702040-116895-1-git-send-email-fnu.vikram@xilinx.com/

-- 
Julien Grall

