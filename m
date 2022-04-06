Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04EB4F6237
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 16:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299946.511309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc74g-0001u1-Qf; Wed, 06 Apr 2022 14:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299946.511309; Wed, 06 Apr 2022 14:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc74g-0001rx-My; Wed, 06 Apr 2022 14:55:58 +0000
Received: by outflank-mailman (input) for mailman id 299946;
 Wed, 06 Apr 2022 14:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ELh=UQ=citrix.com=prvs=088becc42=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nc74f-0001rr-BH
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 14:55:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8909442-b5b9-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 16:55:55 +0200 (CEST)
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
X-Inumbo-ID: a8909442-b5b9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649256956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HWzvp88MpAB2kGhzPVFI4VupZOnvLCOztJTzESTZhEM=;
  b=AfFqL+RWZItJ1d49xj1uwdJedS4060SWkyn04p0H3A9g5SGwtxaEfzBc
   LL4VDfIz+GHKEFvwV4lhaDUkdERGPIrEGbCJkJuvx43vDSC0BWOXeGEag
   RrkDYMVOstCu3qoJdqw6+qSV20MM5OBHJqRI6AX0KOQWGwefGeXIROFyI
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68180664
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+gYqy6ne+v2w8lBjcK70KXro5gxGJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXW2+Ha6uOYGb2edB+PNnk904C6JXRztZmTQJo/yE9HiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlW13V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYVgUpA4ucxN0maSJZTydsbZF596eYCC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHOWM/NEqeP3WjPH8eS4sYgMGK2kD+bjFahknJnvY68TTcmVkZPL/Fb4OOJ43iqd9utlmVp
 yTN/2n/KhgAMZqUzj/t2m2orv/Cm2X8Qo16PL+37Plxm3WI23ceThYRUDOTpeSygwiwUtRUJ
 kgQ5wInt610/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNYrrtMsTDomk
 FqAhcr0BCdHuaeQD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznUdRjLYjl0uTOIwrxn
 zaY/BQBiK1MpJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BKL0e+yzMUKVJdPUUORS9jvYyjN5fK9fekJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUSdDWfg3nGrmGLx1PVoXKsYWnz27qXfTlUrP7FZjTCTNFedt3KWmMIjVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zGLgBQtiEJTPPriv85Y/XrfaemJOQTh9Y9eMkeJJU9E0xMx9y7aXl
 kxRr2cFkTITc1Wccl7UAp2iAZuyNatCQYUTZnV2Zwv3giR9Ou5CLs43LvMKQFXuz8Q7pdYcc
 hXPU5/ZahiTYlwrIwggUKQ=
IronPort-HdrOrdr: A9a23:ErGQoakK8SSytw+n7cqRWIkKyq/pDfIC3DAbv31ZSRFFG/Fwz/
 re+MjzpiWE7wr5OUtQ4+xoV5PhfZqxz/NICMwqTNKftWrdyRaVxeNZnOjfKlTbckWUnNK1l5
 0QEZSWY+eeMbEOt6fHCX6DferIruPqzEniv5a5854kd3ASV0l3hz0JcjpzPHcGPzV7OQ==
X-IronPort-AV: E=Sophos;i="5.90,240,1643691600"; 
   d="scan'208";a="68180664"
Date: Wed, 6 Apr 2022 15:55:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 1/6] tools/cpupools: Give a name to unnamed cpupools
Message-ID: <Yk2p73WCT5Gi85vK@perard.uk.xensource.com>
References: <20220405085741.18336-1-luca.fancellu@arm.com>
 <20220405085741.18336-2-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220405085741.18336-2-luca.fancellu@arm.com>

Hi Luca,

On Tue, Apr 05, 2022 at 09:57:36AM +0100, Luca Fancellu wrote:
> diff --git a/tools/helpers/xen-init-dom0.c b/tools/helpers/xen-init-dom0.c
> index c99224a4b607..84286617790f 100644
> --- a/tools/helpers/xen-init-dom0.c
> +++ b/tools/helpers/xen-init-dom0.c
> @@ -43,7 +43,9 @@ int main(int argc, char **argv)
>      int rc;
>      struct xs_handle *xsh = NULL;
>      xc_interface *xch = NULL;
> -    char *domname_string = NULL, *domid_string = NULL;
> +    char *domname_string = NULL, *domid_string = NULL, *pool_path, *pool_name;
> +    xc_cpupoolinfo_t *xcinfo;
> +    unsigned int pool_id = 0;
>      libxl_uuid uuid;
>  
>      /* Accept 0 or 1 argument */
> @@ -114,6 +116,37 @@ int main(int argc, char **argv)
>          goto out;
>      }
>  
> +    /* Create an entry in xenstore for each cpupool on the system */
> +    do {
> +        xcinfo = xc_cpupool_getinfo(xch, pool_id);
> +        if (xcinfo != NULL) {
> +            if (xcinfo->cpupool_id != pool_id)
> +                pool_id = xcinfo->cpupool_id;
> +            xc_cpupool_infofree(xch, xcinfo);
> +            if (asprintf(&pool_path, "/local/pool/%d/name", pool_id) <= 0) {
> +                fprintf(stderr, "cannot allocate memory for pool path\n");
> +                rc = 1;
> +                goto out;
> +            }
> +            if (asprintf(&pool_name, "Pool-%d", pool_id) <= 0) {
> +                fprintf(stderr, "cannot allocate memory for pool name\n");
> +                rc = 1;
> +                goto out_err;

Could you rework this loop so that "goto out" is always the right things
to do in case of error? That is the function would always free()
"pool_path" and "pool_name" regardless of their values, and we only need
to make sure both are NULL when they are already free. This is to avoid
having several path in case of error, as this could result in mistake
later. If there's only one error path, there will be less likely to have
mistakes. This loop, at the moment, is using three different error
paths: "goto out", "goto out_err", and no goto followed by a standalone
goto.

> +            }
> +            pool_id++;
> +            if (!xs_write(xsh, XBT_NULL, pool_path, pool_name,
> +                          strlen(pool_name))) {
> +                fprintf(stderr, "cannot set pool name\n");
> +                rc = 1;
> +            }
> +            free(pool_name);
> +out_err:
> +            free(pool_path);
> +            if ( rc )
> +                goto out;
> +        }
> +    } while(xcinfo != NULL);

Thanks,

-- 
Anthony PERARD

