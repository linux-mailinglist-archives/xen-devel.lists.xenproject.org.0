Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FD296936
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 06:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10685.28548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVozg-0007cV-EY; Fri, 23 Oct 2020 04:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10685.28548; Fri, 23 Oct 2020 04:48:00 +0000
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
	id 1kVozg-0007c4-BE; Fri, 23 Oct 2020 04:48:00 +0000
Received: by outflank-mailman (input) for mailman id 10685;
 Fri, 23 Oct 2020 04:47:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H00l=D6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVoze-0007bz-TD
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 04:47:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9ae739a-e6be-45af-93af-1d9983dcb6c0;
 Fri, 23 Oct 2020 04:47:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45FADAC12;
 Fri, 23 Oct 2020 04:47:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=H00l=D6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVoze-0007bz-TD
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 04:47:58 +0000
X-Inumbo-ID: d9ae739a-e6be-45af-93af-1d9983dcb6c0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d9ae739a-e6be-45af-93af-1d9983dcb6c0;
	Fri, 23 Oct 2020 04:47:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603428477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkR5342vNBYPqcxXX4kwtXys8DqB+7POEMSyGjxkSTk=;
	b=JSvSZoGnITPdQ1Cf3/SdVPtHe1SfZgCJuOhmzprg/xNV7NKOO0xNUfYfQElaKIqtWjlHpZ
	Dlkm38ihh6Fwnz457d504pUepkJvGi5sW/4Ak84yGqQm5Bk8PAIhZvCjP+vMvcZ3ciuZMk
	N4IgcrrobRu3ZBhRUkEMSkXcBsn7GH4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 45FADAC12;
	Fri, 23 Oct 2020 04:47:57 +0000 (UTC)
Subject: Re: BUG: credit=sched2 machine hang when using DRAKVUF
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a80f05ac-bd18-563e-12f7-1a0f9f0d4f6b@suse.com>
Date: Fri, 23 Oct 2020 06:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <157653679.6164.1603407559737.JavaMail.zimbra@nask.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.10.20 00:59, Michał Leszczyński wrote:
> Hello,
> 
> when using DRAKVUF against a Windows 7 x64 DomU, the whole machine hangs after a few minutes.
> 
> The chance for a hang seems to be correlated with number of PCPUs, in this case we have 14 PCPUs and hang is very easily reproducible, while on other machines with 2-4 PCPUs it's very rare (but still occurring sometimes). The issue is observed with the default sched=credit2 and is no longer reproducible once sched=credit is set.

Interesting. Can you please share some more information?

Which Xen version are you using?

Is there any additional information in the dom0 log which could be
related to the hang (earlier WARN() splats, Oopses, Xen related
messages, hardware failure messages, ...?

Can you please try to get backtraces of all cpus at the time of the
hang?

It would help to know which cpu was the target of the call of
smp_call_function_single(), so a disassembly of that function would
be needed to find that information from the dumped registers.

I'm asking because I've seen a similar problem recently and I was
rather suspecting a fifo event channel issue than the Xen scheduler,
but your data suggests it could be the scheduler after all (if it is
the same issue, of course).


Juergen

