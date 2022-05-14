Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654685272DB
	for <lists+xen-devel@lfdr.de>; Sat, 14 May 2022 18:19:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329147.552345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npuUF-0006Ch-H8; Sat, 14 May 2022 16:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329147.552345; Sat, 14 May 2022 16:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npuUF-00069F-E6; Sat, 14 May 2022 16:19:23 +0000
Received: by outflank-mailman (input) for mailman id 329147;
 Sat, 14 May 2022 16:19:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1npuUD-000699-4g
 for xen-devel@lists.xenproject.org; Sat, 14 May 2022 16:19:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npuUC-0005rl-0k; Sat, 14 May 2022 16:19:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1npuUB-0005X2-QN; Sat, 14 May 2022 16:19:19 +0000
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
	bh=xPgNX10W2vScqjWZLnhk/hXk/4aLAbV/mVirWkKODBU=; b=0YsvglZJH8yFSFD5FM7YmZVOGF
	8btVI9gMliO/6JK8i7yTDG7ShRyU2xKHONTa2Eq2z+6sE/Zf+YszwyAuz/eiHHM5SRHhlBe8Zy62c
	qRU8RwksQhnWK4+75P2+AGBA1CPp9hI25jH0AsSTn+4helAf8KJZqAmMm+OXM03Ela+k=;
Message-ID: <6ef42026-8b14-c16f-175c-5b3d9ca55f99@xen.org>
Date: Sat, 14 May 2022 17:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <alpine.DEB.2.22.394.2205131405550.3842@ubuntu-linux-20-04-desktop>
 <20220513210730.679871-6-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v7 6/7] tools: add example application to initialize
 dom0less PV drivers
In-Reply-To: <20220513210730.679871-6-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/05/2022 22:07, Stefano Stabellini wrote:
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> new file mode 100644
> index 0000000000..3e7ad54da7
> --- /dev/null
> +++ b/tools/helpers/init-dom0less.c
> @@ -0,0 +1,345 @@
> +#include <stdbool.h>
> +#include <syslog.h>
> +#include <stdio.h>
> +#include <err.h>
> +#include <stdlib.h>
> +#include <sys/mman.h>
> +#include <sys/time.h>
> +#include <xenstore.h>
> +#include <xenctrl.h>
> +#include <xenguest.h>
> +#include <libxl.h>
> +#include <xenevtchn.h>
> +#include <xenforeignmemory.h>
> +#include <xen/io/xs_wire.h>
> +
> +#include "init-dom-json.h"
> +
> +#define XENSTORE_PFN_OFFSET 1
> +#define STR_MAX_LENGTH 64

Sorry, I should have spotted this earlier. Looking at the nodes below, 
the node control/platform-feature-multiprocessor-suspend would result to 
63 characters without even the domid:

42sh> echo -n 
'/local/domain//control/platform-feature-multiprocessor-suspend' | wc -c
62

So I think it would be wiser to bump the value to 128 here.

> +static bool do_xs_write_dom(struct xs_handle *xsh, xs_transaction_t t,
> +                            domid_t domid, char *path, char *val)
> +{
> +    char full_path[STR_MAX_LENGTH];
> +    struct xs_permissions perms[2];
> +
> +    perms[0].id = domid;
> +    perms[0].perms = XS_PERM_NONE;
> +    perms[1].id = 0;
> +    perms[1].perms = XS_PERM_READ;
> +
> +    if (snprintf(full_path, STR_MAX_LENGTH,
> +                 "/local/domain/%u/%s", domid, path) < 0)

The issue I mentionned above would not have been spotted because you 
only check the value is negative. From glibc version 2.1,
snprintf() returns the number of character (excluding the NUL bytes) it 
would have written if the buffer is big enough.

So to avoid writing a truncated node, you will want to check the return 
value is > 0 && < (STR_MAX_LENGTH - 1).

Looking at the code below, there are a few wrong use of snprintf(). To 
avoid another round (we are at v7 already), I would be OK if they are 
dealt after so long we bump the size of the buffer.

The rest of the code looks ok:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

