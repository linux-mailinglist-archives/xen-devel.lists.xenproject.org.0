Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96709281E86
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 00:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2366.7030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOTin-0004RD-V4; Fri, 02 Oct 2020 22:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2366.7030; Fri, 02 Oct 2020 22:40:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOTin-0004Qo-RQ; Fri, 02 Oct 2020 22:40:13 +0000
Received: by outflank-mailman (input) for mailman id 2366;
 Fri, 02 Oct 2020 22:40:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOTim-0004Qj-MO
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:40:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4b2cbae-1b05-4553-8751-bf35517b65e7;
 Fri, 02 Oct 2020 22:40:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOTim-0004Qj-MO
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 22:40:12 +0000
X-Inumbo-ID: c4b2cbae-1b05-4553-8751-bf35517b65e7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c4b2cbae-1b05-4553-8751-bf35517b65e7;
	Fri, 02 Oct 2020 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601678411;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ycMtR+kFyjIg1ssaKlwxGf0OECEDVKoeSG01xTSkcz8=;
  b=dtuuGyXKG6NLeigLdjgCJTi8g0wCo/DaLAUPcfgsvteztmjraew13TKl
   nSoAUJViBDTZ4uoNaCs5L3lEbIAvi6IhU6YdklumV3tbMrjkyrP4duIMX
   1b67nNRmTVrXx3pPw26P2f/9g6H3Tk6QWHPOooPjZskV6T8LhTK+MZXxV
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SYRLOTH05nF4h2mk9XtLth5dBJ0yXQ/DfHwVjKKYdLxCV8kO8OV0/HlE9SpjXizCBaFRqTzx7f
 AFI86pdm2JkN1Lt3uINTPEAh4ig3TEHjVVnnTk9/nHl3Iz7d0SwYnnH4WMpx1t+MD1NboqhXwI
 Db4wf7WlmP1C40h2ibuXKcZxCykoSrbbaZZE8cGWB4Yqm3W/8G+t5eQNP3slNRoUb7YCLHx2i9
 +b1ulmvTSvS7TKG7yDKY2qeWyDH0letlDawVLnaiydyd6ZGuA1rAXOx6QcS0f22FctWVnEJa7J
 6i4=
X-SBRS: None
X-MesageID: 29217147
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,329,1596513600"; 
   d="scan'208";a="29217147"
Subject: Re: [PATCH v9 3/8] tools/misc: add xen-domctx to present domain
 context
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson
	<ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-4-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <241eda02-e7ab-a44c-8f1c-38eb85c2f8dc@citrix.com>
Date: Fri, 2 Oct 2020 23:39:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-4-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> This tool is analogous to 'xen-hvmctx' which presents HVM context.
> Subsequent patches will add 'dump' functions when new records are
> introduced.
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
>
> NOTE: Ian requested ack from Andrew

I mean - its a fairly throwaway piece of misc userspace, so ack.

However, it is largely superseded by the changes you need to make to
verify-stream-v2 so you might want to bear that in mind.

Also, I wonder if it is wise in general that we're throwing so many misc
debugging tools into sbin.

> +#include <inttypes.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#include <xenctrl.h>
> +#include <xen/xen.h>
> +#include <xen/domctl.h>
> +#include <xen/save.h>
> +
> +static void *buf = NULL;
> +static size_t len, off;
> +
> +#define GET_PTR(_x)                                                        \
> +    do {                                                                   \
> +        if ( len - off < sizeof(*(_x)) )                                   \
> +        {                                                                  \
> +            fprintf(stderr,                                                \
> +                    "error: need another %lu bytes, only %lu available\n", \

%zu is the correct formatter for size_t.

> +                    sizeof(*(_x)), len - off);                             \
> +            exit(1);                                                       \

Your error handling will be far more simple by using err() instead of
opencoding it.

~Andrew

