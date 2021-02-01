Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC530ACF5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 17:48:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80018.146129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6cMw-0008T6-Tj; Mon, 01 Feb 2021 16:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80018.146129; Mon, 01 Feb 2021 16:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6cMw-0008Sh-QK; Mon, 01 Feb 2021 16:48:06 +0000
Received: by outflank-mailman (input) for mailman id 80018;
 Mon, 01 Feb 2021 16:48:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6cMv-0008Sc-O3
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 16:48:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5def02a2-896b-4c72-8b7a-25691fb14c0f;
 Mon, 01 Feb 2021 16:48:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94E73AB92;
 Mon,  1 Feb 2021 16:48:02 +0000 (UTC)
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
X-Inumbo-ID: 5def02a2-896b-4c72-8b7a-25691fb14c0f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612198082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOVHCqx27sDKeippwBQDyPRkXExzEzerkHgT2dfxMis=;
	b=mVcjSUsBS73TmY7PymTduRcqVQfo4ROJSkVOWCOVbVwu1XeUNEMTvV2PVwGbMFe25xQMsF
	54mVXlW/+6TuKnHcIH0mUkB4Idp/WCqnxaFRCoPphJXNd1pSnCgNeQyyK2DEDRgIFadQxM
	OzOgcJtXP1ma041eLroDRDHXBWiFb6k=
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: Claudemir Todo Bom <claudemir@todobom.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
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
 <96a23d4a-b29f-46e2-a0f5-568a5d1f4b9e@suse.com>
 <CANyqHYfue3mPKESc6_U79=ckCHrJo6rEJg0TgXi8-g6=peM01A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <73a79bef-2c5d-cd94-8eaa-bd4139123a0f@suse.com>
Date: Mon, 1 Feb 2021 17:48:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CANyqHYfue3mPKESc6_U79=ckCHrJo6rEJg0TgXi8-g6=peM01A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.02.2021 16:26, Claudemir Todo Bom wrote:
> Em seg., 1 de fev. de 2021 às 12:09, Jan Beulich <jbeulich@suse.com> escreveu:
>>
>> On 01.02.2021 15:46, Claudemir Todo Bom wrote:
>>> Tested first without the debug patch and with following parameters:
>>
>> And this test was all three of the non-debugging patches?
> 
> Yes, all three patches.
> 
>>> xen: dom0_mem=1024M,max:2048M dom0_max_vcpus=4 dom0_vcpus_pin=true smt=true
>>> kernel: loglevel=3
>>>
>>> same behaviour as before... black screen right after the xen messages.
>>>
>>> adding earlyprintk=xen to the kernel command line is sufficient to
>>> make it boot, I can imagine this can be happening because Xen is not
>>> releasing console to the kernel at that moment.
>>
>> If the answer to the above question is "yes", then I start
>> suspecting this to be a different problem. I'm not sure I
>> see a way to debug this without having access to any output
>> (i.e. neither video nor serial). Without "earlyprintk=xen"
>> and instead with "vga=keep watchdog" on the Xen command
>> line, is there anything helpful (without or if need be with
>> the debugging patch in place)?
> 
> with "vga=text-80x25,keep watchdog" and without the earlyprintk,
> system booted.

Well, you clearly don't want to keep "vga=keep". There has to
be something that's still going wrong, but this may now be a
kernel side issue. In the logs you provided I couldn't spot
anything odd, but these were from working cases after all. So
as said, for now I'm lost, and you may need to live with some
form of workaround (which you've said you're okay with).

Jan

