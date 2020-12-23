Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 242662E1F8F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 17:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58520.103002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7D3-00022W-CB; Wed, 23 Dec 2020 16:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58520.103002; Wed, 23 Dec 2020 16:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks7D3-000227-8q; Wed, 23 Dec 2020 16:41:57 +0000
Received: by outflank-mailman (input) for mailman id 58520;
 Wed, 23 Dec 2020 16:41:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks7D1-00021o-Il
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 16:41:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b8c4c7e-fc3c-4c9b-80eb-edee12388e81;
 Wed, 23 Dec 2020 16:41:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E27EACF1;
 Wed, 23 Dec 2020 16:41:53 +0000 (UTC)
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
X-Inumbo-ID: 3b8c4c7e-fc3c-4c9b-80eb-edee12388e81
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608741713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9OOtA8Qc/tES3oyETCPx+qqFk54z+xzGKtXLHHlof8=;
	b=vEgprFgdIii6UYfy+7T9yE8j6sxQsFoQqB5jcBFosL4nohggNofzN5fH6MTJwayS0B02LM
	syvlsieyOXVGpd2NFvstKwCtCG1IPZdWdyt/OOswdsaJd01+19vzW364v5XLr8RS2LtRN+
	PUfx76doQ0VciZ9+sKu9eca1mH9Ghrc=
Subject: Re: [PATCH 4/4] tools/misc: Test for fault injection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fe99df6-ea2a-d877-8cb9-a4e7e84589d0@suse.com>
Date: Wed, 23 Dec 2020 17:41:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223163442.8840-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:34, Andrew Cooper wrote:
> --- /dev/null
> +++ b/tools/misc/xen-fault-ttl.c
> @@ -0,0 +1,56 @@
> +#include <stdio.h>
> +#include <err.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#include <xenctrl.h>
> +
> +int main(int argc, char **argv)
> +{
> +    int rc;
> +    xc_interface *xch = xc_interface_open(NULL, NULL, 0);
> +
> +    if ( !xch )
> +        err(1, "xc_interface_open");
> +
> +    struct xen_domctl_createdomain create = {
> +        .fault_ttl = 1,
> +        .flags = (XEN_DOMCTL_CDF_hvm |
> +                  XEN_DOMCTL_CDF_hap),
> +        .max_vcpus = 1,
> +        .max_evtchn_port = -1,
> +        .max_grant_frames = 64,
> +        .max_maptrack_frames = 1024,
> +        .arch = {
> +            .emulation_flags = XEN_X86_EMU_LAPIC,
> +        },
> +    };
> +    uint32_t domid = 0;
> +
> +    for ( rc = 1; rc && errno == ENOMEM; create.fault_ttl++ )
> +        rc = xc_domain_create(xch, &domid, &create);

The very first time you get here, how does errno end up being
set to ENOMEM? To me

    do {
        create.fault_ttl++;
        rc = xc_domain_create(xch, &domid, &create);
    } while ( rc && errno == ENOMEM );

would seem more natural (and also avoid the somewhat odd
"rc = 1").

Jan

