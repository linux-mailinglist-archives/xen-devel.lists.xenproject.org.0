Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B523A30AA80
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79952.145864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apQ-0003y4-6h; Mon, 01 Feb 2021 15:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79952.145864; Mon, 01 Feb 2021 15:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6apQ-0003xg-38; Mon, 01 Feb 2021 15:09:24 +0000
Received: by outflank-mailman (input) for mailman id 79952;
 Mon, 01 Feb 2021 15:09:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6apO-0003xW-EE
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:09:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebf6e760-b35b-4046-bb6d-a7e01e55b497;
 Mon, 01 Feb 2021 15:09:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47A77ABD5;
 Mon,  1 Feb 2021 15:09:19 +0000 (UTC)
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
X-Inumbo-ID: ebf6e760-b35b-4046-bb6d-a7e01e55b497
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612192159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tzm3Ir4Xb3LXI0gewPtMCGXTGNN2FaOl2nuWVwTF40c=;
	b=qDGXoTs+NlA33B4DWSXl/pUB3IZe5GIEMbex0aGkgj8nzilG7QEeCJ0an2mai7dkkyhsaV
	bycMJfSPGK2pUe3vR+iEJaqmoueroPwkghC8SuUvbBeUwJPgTZ0PwoJyMeidSHQAZ3T2cy
	ZxAcxXkSfqto0ppBqKJIas2k13l0Vi4=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com>
 <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com>
 <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
 <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
 <9d04edfe-0059-6fbf-c1da-2087f6190e64@suse.com>
 <CANyqHYfOC6JY978SRPAQ8Ug3GevFD=jbT6bVVET4+QOv8mv7qA@mail.gmail.com>
 <a0a7bbd0-c4c3-cfb8-5af0-a5a4aff14b76@suse.com>
 <CANyqHYeDR_NUKzPtbfLiUzxAUzerKepbU4B-_6=U-7Y6uy8gpQ@mail.gmail.com>
 <8837c3fb-1e0c-5941-258c-e76551a9e02b@suse.com>
 <8cf69fb3-5b8c-60ea-bd1c-39a0cbd5cb5c@suse.com>
 <CANyqHYeCQc2bt836uyrtm9Eo2T1uPP-+ups-ygfACu6zK36BQg@mail.gmail.com>
 <bd150f4d-4f7e-082e-6b10-03bf1eca7b80@suse.com>
 <CANyqHYeHf8f6G+U2z9A0JC049HPYvWQ+WXZYLCQyWyx5Jvq6BA@mail.gmail.com>
 <803a50a9-707f-14db-b523-cd1f6f685ab4@suse.com>
 <CANyqHYfNjqjm7tFoHD=XDcv_P42wppmx0gjy=--Kz88MZcK6Pw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <96a23d4a-b29f-46e2-a0f5-568a5d1f4b9e@suse.com>
Date: Mon, 1 Feb 2021 16:09:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CANyqHYfNjqjm7tFoHD=XDcv_P42wppmx0gjy=--Kz88MZcK6Pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.02.2021 15:46, Claudemir Todo Bom wrote:
> Tested first without the debug patch and with following parameters:

And this test was all three of the non-debugging patches?

> xen: dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true smt=true
> kernel: loglevel=3
> 
> same behaviour as before... black screen right after the xen messages.
> 
> adding earlyprintk=xen to the kernel command line is sufficient to
> make it boot, I can imagine this can be happening because Xen is not
> releasing console to the kernel at that moment.

If the answer to the above question is "yes", then I start
suspecting this to be a different problem. I'm not sure I
see a way to debug this without having access to any output
(i.e. neither video nor serial). Without "earlyprintk=xen"
and instead with "vga=keep watchdog" on the Xen command
line, is there anything helpful (without or if need be with
the debugging patch in place)?

> The system worked well (with earlyprintk=xen), tested with the "yes
> stress test" mentioned before on a guest and on dom0.
> 
> Then, I installed the debug patch and booted it again, it also needed
> the earlyprintk=xen parameter on the kernel command line. I've also
> added console_timestamps=boot to the xen command line in order to get
> the time of the messages.
> 
> I'm attaching the outputs of "xl dmesg" and "dmesg" on this message.
> 
> Think it is almost done! WIll wait for the next round of tests!

As per above, not sure if there's going to be one. Thanks
for your patient testing!

Jan

