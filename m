Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD7024D21E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 12:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9483-0007A2-Hy; Fri, 21 Aug 2020 10:18:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NMHL=B7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9482-00079v-5e
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 10:18:34 +0000
X-Inumbo-ID: a675ecf7-020d-4df0-804e-2f29b3c82542
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a675ecf7-020d-4df0-804e-2f29b3c82542;
 Fri, 21 Aug 2020 10:18:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67071AF83;
 Fri, 21 Aug 2020 10:19:00 +0000 (UTC)
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
To: Sergey Temerkhanov <s.temerkhanov@gmail.com>,
 xen-devel@lists.xenproject.org
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
Date: Fri, 21 Aug 2020 12:18:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200821071547.18894-1-s.temerkhanov@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 21.08.20 09:15, Sergey Temerkhanov wrote:
> Use a dedicated pointer for IRQ data to avoid conflicts with some
> other parts of the kernel code which my use handler_data for their
> own purposes while still running on Xen
> 
> Sergey Temerkhanov (2):
>    Xen: Use a dedicated irq_info structure pointer
>    Xen: Rename irq_info structure
> 
>   drivers/xen/events/events_2l.c       |  2 +-
>   drivers/xen/events/events_base.c     | 80 +++++++++++++---------------
>   drivers/xen/events/events_fifo.c     |  5 +-
>   drivers/xen/events/events_internal.h | 12 ++---
>   include/linux/irq.h                  | 17 ++++++
>   kernel/irq/chip.c                    | 14 +++++
>   6 files changed, 78 insertions(+), 52 deletions(-)
> 

Did you see any specific problem where handler_data is written by
another component?

In case this is a real problem I don't think your approach will be
accepted, especially the IRQ subsystem maintainers probably won't
like it.

And please include the maintainers of the files you are modifying in
the recipients list of the patch(es).


Juergen

