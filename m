Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED22FD534
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 17:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71604.128342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2G8s-0003Pz-6B; Wed, 20 Jan 2021 16:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71604.128342; Wed, 20 Jan 2021 16:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2G8s-0003Pa-2S; Wed, 20 Jan 2021 16:15:34 +0000
Received: by outflank-mailman (input) for mailman id 71604;
 Wed, 20 Jan 2021 16:15:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2G8q-0003PV-R6
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 16:15:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4713b04c-9edd-4bd8-874c-1881b5151499;
 Wed, 20 Jan 2021 16:15:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 269C7AB7F;
 Wed, 20 Jan 2021 16:15:31 +0000 (UTC)
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
X-Inumbo-ID: 4713b04c-9edd-4bd8-874c-1881b5151499
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611159331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWPe8TFUXyYQPci2ndQZhATyTbcQsQ97qvpBErLc1VQ=;
	b=MTychSIDwgH2n+mU6HlSIr42EkoXvVPXWIeWsozK7qgwANXmY27mM2IQdYqOaR4IP51PT4
	9SzYu/qHwgEgkmPO+hChkcb1f5eiZ8NsBQ8fXMZLg+qMmMB0x7mxqjwx6EMZ5iuYVPY+aK
	ADKSqysCWts9t+Cojr/XWlzylnUgGgw=
Subject: Re: [PATCH V4 06/24] xen/ioreq: Make x86's
 hvm_mmio_first(last)_byte() common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-7-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3328d6c-a754-efc7-fe94-489dd5282878@suse.com>
Date: Wed, 20 Jan 2021 17:15:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-7-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The IOREQ is a common feature now and these helpers will be used
> on Arm as is. Move them to xen/ioreq.h and replace "hvm" prefixes
> with "ioreq".
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - new patch
> 
> Changes V1 -> V2:
>    - replace "hvm" prefix by "ioreq"
> 
> Changes V2 -> V3:
>    - add Paul's R-b
> 
> Changes V32 -> V4:
>    - add Jan's A-b

Did you?

Jan

