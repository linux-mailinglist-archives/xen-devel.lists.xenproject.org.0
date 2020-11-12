Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C47C2B02A7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 11:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25634.53525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9lS-0003K5-QP; Thu, 12 Nov 2020 10:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25634.53525; Thu, 12 Nov 2020 10:23:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd9lS-0003Jg-NK; Thu, 12 Nov 2020 10:23:38 +0000
Received: by outflank-mailman (input) for mailman id 25634;
 Thu, 12 Nov 2020 10:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd9lQ-0003Jb-Kz
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:23:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c66a8743-060f-450d-8df7-38d74687e05a;
 Thu, 12 Nov 2020 10:23:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6EC7ABCC;
 Thu, 12 Nov 2020 10:23:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd9lQ-0003Jb-Kz
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 10:23:36 +0000
X-Inumbo-ID: c66a8743-060f-450d-8df7-38d74687e05a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c66a8743-060f-450d-8df7-38d74687e05a;
	Thu, 12 Nov 2020 10:23:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605176614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NH8x4vk4jgxILtPHWfT8lREPrKPQ5W1ZL/eyg12DyI=;
	b=Mw+986j6+xJZOBktWfdFEtGvihH5vN1Z/3QJfNzpweoLYXzNEBx7x1GJtzUUqYjqALerno
	E2xXEi043gbr8Bb9WYTkodIeT54X4Zp+xvKvPX1I74xFhWGO6v5U19x3TeoRNAoIWX2KHQ
	QAnyACWNGyDiuLPUerrKojz2eG2oOVk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6EC7ABCC;
	Thu, 12 Nov 2020 10:23:33 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
 <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
Date: Thu, 12 Nov 2020 11:23:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.11.2020 16:48, Jürgen Groß wrote:
> On 11.11.20 16:45, Jan Beulich wrote:
>> On 09.11.2020 10:50, Juergen Gross wrote:
>>> @@ -83,14 +85,28 @@ void passive_domain_destroy(struct vcpu *v)
>>>   		model->free_msr(v);
>>>   }
>>>   
>>> +bool nmi_oprofile_send_virq(void)
>>> +{
>>> +	struct vcpu *v = this_cpu(nmi_cont_vcpu);
>>> +
>>> +	if ( v )
>>> +		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
>>> +
>>> +	this_cpu(nmi_cont_vcpu) = NULL;
>>
>> What if, by the time we make it here, a 2nd NMI has arrived? I
>> agree the next overflow interrupt shouldn't arrive this
>> quickly, but I also think you want to zap the per-CPU variable
>> first here, and ...
> 
> How could that happen? This function is activated only from NMI
> context in case the NMI happened in guest mode. And it will be
> executed with higher priority than any guest, so there is a zero
> chance another NMI in guest mode can happen in between.

While I'll admit I didn't pay attention to the bogus (as far as
HVM is concerned) xen_mode check, my understanding is that the
self-IPI will be delivered once we're back in guest mode, as
that's the first time IRQs would be on again (even event checking
gets deferred by sending a self-IPI). If another NMI was latched
by that time, it would take precedence over the IRQ and would
also be delivered on the guest mode insn that the IRET returned
to.

I agree though that this is benign, as the vCPU wouldn't have
been context switched out yet, i.e. current is still the same
and there'll then merely be two NMI instances folded into one.

However, I still think the ordering would better be changed, to
set a good precedent.

>>>   static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
>>>   {
>>>   	int xen_mode, ovf;
>>>   
>>>   	ovf = model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
>>>   	xen_mode = ring_0(regs);

Unrelated to the patch here (i.e. just as an observation), this
use of ring_0() looks bogus when the NMI occurred in HVM guest
mode.

Jan

