Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B4268F6E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:16:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqD8-0000Zq-In; Mon, 14 Sep 2020 15:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHqD7-0000Zk-2e
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:16:05 +0000
X-Inumbo-ID: 1feb9f08-7686-43fc-8551-513cb7750d42
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1feb9f08-7686-43fc-8551-513cb7750d42;
 Mon, 14 Sep 2020 15:16:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C872EAFC1;
 Mon, 14 Sep 2020 15:16:18 +0000 (UTC)
Subject: Re: [PATCH V1 06/16] xen/ioreq: Make x86's
 hvm_ioreq_(page/vcpu/server) structs common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-7-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c02f776-a9ae-ac7f-4d17-35745c324c91@suse.com>
Date: Mon, 14 Sep 2020 17:16:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-7-git-send-email-olekstysh@gmail.com>
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

On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -23,6 +23,40 @@
>  
>  #include <asm/hvm/ioreq.h>
>  
> +struct hvm_ioreq_page {
> +    gfn_t gfn;
> +    struct page_info *page;
> +    void *va;
> +};
> +
> +struct hvm_ioreq_vcpu {
> +    struct list_head list_entry;
> +    struct vcpu      *vcpu;
> +    evtchn_port_t    ioreq_evtchn;
> +    bool             pending;
> +};
> +
> +#define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
> +#define MAX_NR_IO_RANGES  256
> +
> +struct hvm_ioreq_server {
> +    struct domain          *target, *emulator;
> +
> +    /* Lock to serialize toolstack modifications */
> +    spinlock_t             lock;
> +
> +    struct hvm_ioreq_page  ioreq;
> +    struct list_head       ioreq_vcpu_list;
> +    struct hvm_ioreq_page  bufioreq;
> +
> +    /* Lock to serialize access to buffered ioreq ring */
> +    spinlock_t             bufioreq_lock;
> +    evtchn_port_t          bufioreq_evtchn;
> +    struct rangeset        *range[NR_IO_RANGE_TYPES];
> +    bool                   enabled;
> +    uint8_t                bufioreq_handling;
> +};

Besides there again being the question of hvm_ prefixes here,
is the bufioreq concept something Arm is meaning to make use
of? If not, this may want to become conditional ...

Jan

