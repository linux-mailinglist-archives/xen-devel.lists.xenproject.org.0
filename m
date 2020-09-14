Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63F9268F3A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:11:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHq83-0000Iz-Gg; Mon, 14 Sep 2020 15:10:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHq82-0000It-3Y
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:10:50 +0000
X-Inumbo-ID: 71b2f012-11ef-40d9-91bc-1b622ac7e741
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71b2f012-11ef-40d9-91bc-1b622ac7e741;
 Mon, 14 Sep 2020 15:10:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 285BEAFC1;
 Mon, 14 Sep 2020 15:11:04 +0000 (UTC)
Subject: Re: [PATCH V1 04/16] xen/ioreq: Provide alias for the handle_mmio()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-5-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b3fc5ef-b13b-26c0-17dc-10e6a51c59a3@suse.com>
Date: Mon, 14 Sep 2020 17:10:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-5-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.09.2020 22:21, Oleksandr Tyshchenko wrote:
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -189,7 +189,7 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          break;
>  
>      case HVMIO_mmio_completion:
> -        return handle_mmio();
> +        return ioreq_handle_complete_mmio();

Again the question: Any particular reason to have "handle" in here?
With the abstraction simply named ioreq_complete_mmio() feel free
to add
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

