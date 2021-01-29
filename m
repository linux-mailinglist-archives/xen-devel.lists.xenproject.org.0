Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13D308729
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77798.141141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PXS-0002Kq-FL; Fri, 29 Jan 2021 08:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77798.141141; Fri, 29 Jan 2021 08:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5PXS-0002KR-C7; Fri, 29 Jan 2021 08:53:58 +0000
Received: by outflank-mailman (input) for mailman id 77798;
 Fri, 29 Jan 2021 08:53:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5PXR-0002KM-DK
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:53:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0c19a65-9ea1-472b-8e12-fb13a0931e83;
 Fri, 29 Jan 2021 08:53:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9593B03D;
 Fri, 29 Jan 2021 08:53:55 +0000 (UTC)
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
X-Inumbo-ID: d0c19a65-9ea1-472b-8e12-fb13a0931e83
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611910436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kfWmmaQ7rNYWBdqW+ajJzvKqc69MziqQgfhVg3FGSfQ=;
	b=eMxV0Fjh9QsAmFHyAwQ2qj4k4gNAI8jf+//XQXiRBKDbZC3NR6jm9GacX/WOHRGGxeD2Rr
	UYBhux3F3ZB7kXjSsYnsh+jMhVxidjnU850KsAJlnHtuFWjHbP67nEqco7poq6zqjHqoTY
	QsWGW1Zh4ct+6V1jKfmw8fXiGIByM7Q=
Subject: Re: [PATCH V6 09/24] xen/ioreq: Make x86's IOREQ related dm-op
 handling common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-10-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1f9012d6-0e5d-0483-00d3-5dfe1fb583dc@suse.com>
Date: Fri, 29 Jan 2021 09:53:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.01.2021 02:48, Oleksandr Tyshchenko wrote:
> --- /dev/null
> +++ b/xen/include/xen/dm.h
> @@ -0,0 +1,44 @@
> +/*
> + * Copyright (c) 2016 Citrix Systems Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __XEN_DM_H__
> +#define __XEN_DM_H__
> +
> +#include <xen/types.h>
> +
> +#include <public/xen.h>
> +#include <public/hvm/dm_op.h>

Nit (we can certainly live with how it is now): This is not the
alphabetical ordering we try to use in new code. The committer
may want to consider switching around these two.

Jan

