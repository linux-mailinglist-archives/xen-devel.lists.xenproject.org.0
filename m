Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868E766AEF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 12:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571420.895218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKxf-0003t8-8c; Fri, 28 Jul 2023 10:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571420.895218; Fri, 28 Jul 2023 10:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPKxf-0003pv-5S; Fri, 28 Jul 2023 10:44:43 +0000
Received: by outflank-mailman (input) for mailman id 571420;
 Fri, 28 Jul 2023 10:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJ5m=DO=citrix.com=prvs=5668a7b85=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qPKxd-0003pn-FJ
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 10:44:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf5f870f-2d33-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 12:44:39 +0200 (CEST)
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
X-Inumbo-ID: bf5f870f-2d33-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690541078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FOwqXk0q5KCGpGCuGeMIFYd2ScB+k4Rw78r6CfvkwFE=;
  b=ek6SppTbwOHT5wgOv9hqlqdrt+hTeDEycnxwK0FyKpErvLUq9eELX26n
   4Zk/ECVKiHqq/AaJznsIszWE+bwEYAnA+IazeMA6PybWoAQb3eYzZz1gi
   TZWzOWyGrjDPiEzm612uUNwA2TD10uZmG3f+Kv/EEUV9PlprnWfrtT5UL
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118196025
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:dDEiRKBy7tgrDBVW/8Ljw5YqxClBgxIJ4kV8jS/XYbTApDlw32MFz
 2FMCGGOM/feN2KjfdxxYdi08kxV68XQmtA2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC7gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+ctwAzBh0
 cUhIz02bz2kotKb57iVc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XaHJQLxhzFz
 o7A10LoPD42P8bE8xyE2CONouzPoiTbA41HQdVU8dY12QbOlwT/EiY+TVanrOP/ikmvVsl3I
 lYRvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAOQyRdctUguIkzTCYzy
 16St9rzAHpkt7j9YW2Q9/GfrT60ESEPKCkJYipsZQ8Y6NClrog1hR/LSstLGbSwyNbyHFnY3
 DSivCU4wbIJgqYj1aqh+kvcqymxvZWPRQkwji3eRm+/5xl1TJKkbYevr1Pc6J59wJ2xFwfb+
 iJewo7Hsb5IVMvW/MCQfAkTNLKE4PTUHxnluFViJJgM0BGd1lmpU7kFtVmSO3xV3tY4lS7BO
 RGC4V4KvcICYxNGfocsPdvvVp1CIbzIUI28C6uKNocmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYD7H8qTI+yPi+b2WZJsYe5t3KGyRu449riYhw7e7
 sxSMcCHoz0GDrymPnmNr95NdgpVRZTeOXwQg5YKHgJkClM2cFzN9teLme9xE2Cbt/o9ehj0E
 oGVBRYDlQuXaYzvIgSWcHFzAI4Drr4mxU/XyRcEZA7ys1B6ONbH0UvqX8dvFVXR3LA5nKEco
 jhsU5noP8mjvRydpmlMMMej9dMzHPlp7CrXVxeYjPEEV8YIb2T0FhXMJWMDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:I+K0K69DZtNcaDQ7lUBuk+AoI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HLoB1/73XJYVkqN03I9ervBEDiewK4yXcW2/hzAV7KZmCP1FdASrsC0WKL+Vbd8kbFh4xgPM
 lbE5SWc+eAamSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-Talos-CUID: 9a23:AuXoXG+0l6fs5+NDmQeVv005HcJ0XVnk9XzdGE6VLkNZZZqfZ2bFrQ==
X-Talos-MUID: 9a23:CHMW5QjxshK3/ZO7hPFr6MMpEtZWzIilEhs3t5Qs6uigNixPPBfGg2Hi
X-IronPort-AV: E=Sophos;i="6.01,237,1684814400"; 
   d="scan'208";a="118196025"
Date: Fri, 28 Jul 2023 11:44:27 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <peter.hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, <luca.fancellu@arm.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v6 2/2] xl: Add escape character argument to xl console
Message-ID: <7e020fcb-b2f1-40fa-a800-cb7e6a13cfa5@perard>
References: <20230727164450.77640-1-peter.hoyes@arm.com>
 <20230727164450.77640-3-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230727164450.77640-3-peter.hoyes@arm.com>

On Thu, Jul 27, 2023 at 05:44:49PM +0100, Peter Hoyes wrote:
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index f497be141b..0b7293fe71 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -75,15 +76,26 @@ int libxl_console_exec(libxl_ctx *ctx, uint32_t domid, int cons_num,
>          goto out;
>      }
>  
> +    char *args[] = {
> +        p, domid_s, "--num", cons_num_s, "--type", cons_type_s,
> +        NULL, NULL, NULL, NULL, // start-notify-fd, escape
> +        NULL, // list terminator - do not use

So, you are going back and forth between C and C++ comment style, any
reason? The preferred style is '/* comment */' so previous patch was
better in that regards.

With the comment style fixed: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

