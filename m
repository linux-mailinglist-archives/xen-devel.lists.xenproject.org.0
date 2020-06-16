Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF641FAD88
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 12:07:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl8UP-0006F3-ET; Tue, 16 Jun 2020 10:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl8UO-0006Ey-Ka
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 10:06:44 +0000
X-Inumbo-ID: 1473bcd4-afb9-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1473bcd4-afb9-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 10:06:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57284AD60;
 Tue, 16 Jun 2020 10:06:46 +0000 (UTC)
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <423db379-785d-d003-638c-223c4465e635@suse.com>
Date: Tue, 16 Jun 2020 12:06:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612002205.174295-2-volodymyr_babchuk@epam.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 02:22, Volodymyr Babchuk wrote:
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1895,6 +1895,7 @@ void do_IRQ(struct cpu_user_regs *regs)
>      int               irq = this_cpu(vector_irq)[vector];
>      struct cpu_user_regs *old_regs = set_irq_regs(regs);
>  
> +    vcpu_begin_irq_handler();
>      perfc_incr(irqs);
>      this_cpu(irq_count)++;
>      irq_enter();
> @@ -2024,6 +2025,7 @@ void do_IRQ(struct cpu_user_regs *regs)
>   out_no_unlock:
>      irq_exit();
>      set_irq_regs(old_regs);
> +    vcpu_end_irq_handler();
>  }

This looks like a fight for who's going to be first/last here. I
think you want to add your calls after irq_enter() and before
irq_exit().

Jan

