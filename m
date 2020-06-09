Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20641F3B47
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 15:01:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jidrs-0006Ej-7D; Tue, 09 Jun 2020 13:00:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ij5=7W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jidrq-0006Ee-97
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 13:00:38 +0000
X-Inumbo-ID: 362cc180-aa51-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 362cc180-aa51-11ea-b7bb-bc764e2007e4;
 Tue, 09 Jun 2020 13:00:37 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FLHfnbZ19HU5+V4aYCNCFuh8XHpbMIyH5L+DLjdAW7PjoV8RS19U2IBMAAKShMUBg+4qCn4V4F
 a5MlxdWNfXkhNW7hnE2n7g6wqjRdORcpcdeObt0XlzBNSC9W94nAhroxXgEMpYmycKeSj1+L+2
 ZnXsVYbx8GDlhZ81qVyYqRUoN+8Rh7UqDQ3AaqLClW5EEfUV8bpmY1sMI4hIt7pf4MU1AGk+C7
 OMJeSCwudICq9jAnDct0hOUtidcMdWSdRPfk4jPTOpfiZMP/Om3IsYn2mM4M5n5xSXkusPem1R
 tVM=
X-SBRS: 2.7
X-MesageID: 19868725
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,492,1583211600"; d="scan'208";a="19868725"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24287.34799.645497.809135@mariner.uk.xensource.com>
Date: Tue, 9 Jun 2020 14:00:31 +0100
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] libxl__prepare_sockaddr_un
In-Reply-To: <20200608182539.29415-1-olaf@aepfle.de>
References: <20200608182539.29415-1-olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Olaf Hering writes ("[PATCH v2] libxl__prepare_sockaddr_un"):
> libxl: remove usage of strncpy from libxl__prepare_sockaddr_un
> 
> The runtime check for the length of path already prevents malfunction.
> But gcc does not detect this runtime check and reports incorrect
> usage of strncpy. Remove the usage of strncpy and work directly with
> the calculated path length.
> 
> In file included from /usr/include/string.h:495,
>                  from libxl_internal.h:38,
>                  from libxl_utils.c:20:
> In function 'strncpy',
>     inlined from 'libxl__prepare_sockaddr_un' at libxl_utils.c:1262:5:
> /usr/include/bits/string_fortified.h:106:10: error: '__builtin_strncpy' specified bound 108 equals destination size [-Werror=stringop-truncation]
>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors

Thanks for working on this.


I found this code a bit confusing:

> -    if (sizeof(un->sun_path) <= strlen(path)) {
> +    size_t len = strlen(path);
> +
> +    if (sizeof(un->sun_path) <= len) {
>          LOG(ERROR, "UNIX socket path '%s' is too long for %s", path, what);
> -        LOG(DEBUG, "Path must be less than %zu bytes", sizeof(un->sun_path));
> +        LOG(DEBUG, "Path of len %zu must be less than %zu bytes", len, sizeof(un->sun_path));
>          return ERROR_INVAL;
>      }
>      memset(un, 0, sizeof(struct sockaddr_un));
>      un->sun_family = AF_UNIX;
> -    strncpy(un->sun_path, path, sizeof(un->sun_path));
> +    memcpy(un->sun_path, path, len);

This does not copy the trailing nul.  The reader must read up to see
the call to memset.  Why do you not use strcpy here ?

Nevertheless, as this is a minor point of style,

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

Ian.

