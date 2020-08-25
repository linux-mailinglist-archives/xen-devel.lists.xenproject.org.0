Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74E251C7D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 17:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAb6f-0001gH-3W; Tue, 25 Aug 2020 15:43:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAb6d-0001gC-Pi
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 15:43:27 +0000
X-Inumbo-ID: 3726592d-67f4-4675-84c7-c8bf6f454044
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3726592d-67f4-4675-84c7-c8bf6f454044;
 Tue, 25 Aug 2020 15:43:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06DE5ACBA;
 Tue, 25 Aug 2020 15:43:52 +0000 (UTC)
Subject: Re: [PATCH] xen/events: Use chip data for storing per IRQ XEN data
 pointer
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sergei Temerkhanov <s.temerkhanov@gmail.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
 <87k0xn5cgl.fsf@nanos.tec.linutronix.de>
 <cb64e4e9-2ed3-fb15-8c20-d49e47cbff34@suse.com>
 <87lfi2yckt.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0f85eadf-f13b-97a2-2a82-0d0018a72e9e@suse.com>
Date: Tue, 25 Aug 2020 17:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87lfi2yckt.fsf@nanos.tec.linutronix.de>
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

On 25.08.20 17:22, Thomas Gleixner wrote:
> XEN uses irqdesc::irq_data_common::handler_data to store a per interrupt
> XEN data pointer which contains XEN specific information.
> 
> handler data is meant for interrupt handlers and not for storing irq chip
> specific information as some devices require handler data to store internal
> per interrupt information, e.g. pinctrl/GPIO chained interrupt handlers.
> 
> This obviously creates a conflict of interests and crashes the machine
> because the XEN pointer is overwritten by the driver pointer.
> 
> As the XEN data is not handler specific it should be stored in
> irqdesc::irq_data::chip_data instead.
> 
> A simple sed s/irq_[sg]et_handler_data/irq_[sg]et_chip_data/ cures that.
> 
> Reported-by: Roman Shaposhnik <roman@zededa.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Juergen Gross <jgross@suse.com>

> ---
> Note: This probably wants a 'Cc: stable@' and a 'Fixes:' tag, but I
> leave that as an exercise to the maintainers how far they want to move
> that back.

Will do. :-)

Thanks for the patch,


Juergen

