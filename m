Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824D624E1DC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 22:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9DJq-0000oL-Ti; Fri, 21 Aug 2020 20:07:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k9DJo-0000oG-Rw
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 20:07:20 +0000
X-Inumbo-ID: 76ea2f3f-afc5-414f-8451-25b7e255d9ba
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76ea2f3f-afc5-414f-8451-25b7e255d9ba;
 Fri, 21 Aug 2020 20:07:19 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598040438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAe+tKtD8q6kZ0TT9TyfkQSi0+F8aqLXObIBu28SBSM=;
 b=XMlNAmFOLtvwJD3paBg6nNK7V3bTink3/qTkA2vJYzHqkswjb9BT+WJpZdFAAvKwY9MFLK
 WSYUPB9wt4exrfD19bBNCo1UWHFVcWmquuhH5NH3qos2Wgu7BemquK8nxqWCJ8FX0eDrdl
 6BMiKpsSHEKeLoH3Z9TrHOgI8G110/5XeovGvsnA/BDcDQnjEY/yDZiBGVM2IP/AW2bVAn
 LRVmrrtv5xEARSJZzqHE4FS+T1/1h6j0WlueTH02s33ZUUedEJtjj3tfIR1GOf0ygdkCAd
 KXK5M2Qrcyn3Oh4yeCklTx45/fXniknCDMa8PZ0u3iVY9Q1Haepji3AAcYbeiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598040438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rAe+tKtD8q6kZ0TT9TyfkQSi0+F8aqLXObIBu28SBSM=;
 b=CwpJDAyDc+BbA/isj/DsRfXK/N/xumAbM3Wb4N/Be29VIoMiEq7OLrYpQX1Nt38MRDuOqk
 5uSjwpiW6/6wggAA==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Sergei Temerkhanov
 <s.temerkhanov@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
In-Reply-To: <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
Date: Fri, 21 Aug 2020 22:07:17 +0200
Message-ID: <871rjzsqyy.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 21 2020 at 14:17, J=C3=BCrgen Gro=C3=9F wrote:
> On 21.08.20 13:19, Sergei Temerkhanov wrote:
>>> Did you see any specific problem where handler_data is written by
>> another component?
>>=20
>> I've posted this series in the thread
>> https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00957.ht=
ml
>> where the problem is caused exactly by that behavior
>>=20
>>> In case this is a real problem I don't think your approach will be acce=
pted
>> Any comments/suggestions are welcome
>
> Not sure if the IRQ maintainers agree with me, but I would add
> a set_handler_data and get_handler_data function pointer to
> struct irq_chip. If those are set I'd call them for writing/reading
> handler_data instead doing it directly. Xen could then specify those
> and add a field to its own handler data struct for storing the data
> of the driver coming later.
>
> Xen would need another accessor function for its own primary data,
> of course.
>
> Adding the IRQ maintainer as he might have an opinion here. :-)

Without seeing the patches, and no I'm not going to grab them from a web
archive, I'd say they are wrong :)

Fiddling in irqchip is wrong to begin with.

int irq_set_handler_data(unsigned int irq, void *data);
static inline void *irq_get_handler_data(unsigned int irq)
static inline void *irq_data_get_irq_handler_data(struct irq_data *d)

are accessors to handler_data. Am I missing something?

Thanks,

        tglx

