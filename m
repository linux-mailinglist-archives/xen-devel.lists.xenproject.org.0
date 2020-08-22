Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053A24E419
	for <lists+xen-devel@lfdr.de>; Sat, 22 Aug 2020 02:17:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9HDT-0006fL-1S; Sat, 22 Aug 2020 00:17:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Jp4=CA=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k9HDR-0006fG-Vy
 for xen-devel@lists.xenproject.org; Sat, 22 Aug 2020 00:17:02 +0000
X-Inumbo-ID: f0115add-f179-40c7-8598-0e9ed18a8a86
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0115add-f179-40c7-8598-0e9ed18a8a86;
 Sat, 22 Aug 2020 00:17:00 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598055419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SXlatTWwBLvZi4cEnNXzqvFiZZrsRCCLYtN+ZxPprcU=;
 b=huFNYtIqltcGUKwp2/LeEfX8G87OjAkV3KV4wk8Z3qib9z/tIxzjUkJQxxhmCB3vvAQ/0p
 VloQ6Lz6eBgU2gWfJLQHpvlt2bZf30itpMjb2G7JEgR7uGqrDQ2JZm7AHyNEKZaZDICzfd
 pz5rxRYenha9xmQqJrWHhQceLwqqF2FQLmUhMHcbr5GcKx68TCpAzxa4K02vZk/lx+W6Hv
 Pb9oXiE20Aj52cFys8Z/hOPTEWwpWf4DoRUFVBPfWFxzuKfrZN6Z3ecTXaSobBioFs/+AM
 jsON2JpQecv6Y3qk+/es0vXdgguB57KDII5RSnwkFZ3b5MLJsEDT//+ai5ARYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598055419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SXlatTWwBLvZi4cEnNXzqvFiZZrsRCCLYtN+ZxPprcU=;
 b=3MDp2mAioQjB26Q7XVaCYgF8Av0V4t4vYyIwe1jZghr5MuPr3gdsw1m/xTxij7SNmSQ4Wj
 KQVj811PZnRKHcDg==
To: Sergei Temerkhanov <s.temerkhanov@gmail.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
In-Reply-To: <CAPEA6dbdePG2V0MmRo0jFH5Q82Kk5cD=hsvqnDYymFrZ1K=aGg@mail.gmail.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
 <CAPEA6dbdePG2V0MmRo0jFH5Q82Kk5cD=hsvqnDYymFrZ1K=aGg@mail.gmail.com>
Date: Sat, 22 Aug 2020 02:16:58 +0200
Message-ID: <87k0xrr0ud.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, Aug 21 2020 at 23:38, Sergei Temerkhanov wrote:
> On Fri, Aug 21, 2020 at 11:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> Fiddling in irqchip is wrong to begin with.
>>
>> int irq_set_handler_data(unsigned int irq, void *data);
>> static inline void *irq_get_handler_data(unsigned int irq)
>> static inline void *irq_data_get_irq_handler_data(struct irq_data *d)
>>
>> are accessors to handler_data. Am I missing something?
>
> Well, the patches in question are meant to solve the issue discussed
> in this thread:
> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00957.html
> All in all, the Dom0 kernel crashes due to a conflict between Xen and
> GPIO pinctrl code both trying to use hander data to track some private
> data. The patch series adds a separate pointer along with a few
> functions for Xen. There may be other ideas on how to resolve this
> issue though
> Here are web archive :-) links:
> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg01144.html
> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg01145.html

As I said before, I'm not going to wade through a web archive simply
because it's tideous and I can't reply and quote properly.

Can you please just resend this series with the appropriate maintainers
and mailing lists in Cc which you should have done in the first place,
instead of offering me web links?

Just upfront, adding something just for XEN is wrong to begin with. This
is a conceptual problem and XEN is just triggering it, but the
argumentation must be on the concept level, not at the XEN level.

Without having looked at the patches, I bet that this new pointer has a
XEN name tag on it and the changelogs do not explain anything about the
conceptual problem the patches try to solve.

If I'm right, you might want to fix that before resending. If I'm wrong,
then I owe you a beer.

Thanks,

        tglx

