Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE492365C4E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 17:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113869.216949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsQG-00022m-Kq; Tue, 20 Apr 2021 15:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113869.216949; Tue, 20 Apr 2021 15:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYsQG-00022N-HS; Tue, 20 Apr 2021 15:36:20 +0000
Received: by outflank-mailman (input) for mailman id 113869;
 Tue, 20 Apr 2021 15:36:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYsQE-00022I-Ll
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 15:36:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3f746b0-5812-4390-b2c4-e91c4654cfb4;
 Tue, 20 Apr 2021 15:36:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92024B4B1;
 Tue, 20 Apr 2021 15:36:16 +0000 (UTC)
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
X-Inumbo-ID: a3f746b0-5812-4390-b2c4-e91c4654cfb4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618932976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vmhD1JONKE+fqwyJTw4Eqjx4wm+/siPyUpTulmZ7fc=;
	b=lWSH7bSc7L9vfoQ2iQCFrSDpFUUsorBsEXCUlcGVZ84i0X8skUeoNC6GpSnzn642+7tXxu
	Mx5aNTkUZcW+V0fhxTBJ3jpAWtz93oeRhhf4PwGkwsKOVVUKJns4CRu+fNOJay00VrtNKc
	FSpBHgLAuCyGNzaMb4na9nZETSqhidU=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Julien Grall <julien@xen.org>, xen-devel
 <xen-devel@lists.xenproject.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
Date: Tue, 20 Apr 2021 17:36:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.04.2021 15:45, Rahul Singh wrote:
>> On 19 Apr 2021, at 1:33 pm, Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.04.2021 13:54, Julien Grall wrote:
>>> For the time being, I think move this code in x86 is a lot better than 
>>> #ifdef or keep the code in common code.
>>
>> Well, I would perhaps agree if it ended up being #ifdef CONFIG_X86.
>> I would perhaps not agree if there was a new CONFIG_* which other
>> (future) arch-es could select if desired.
> 
> I agree with Julien moving the code to x86 file as currently it is referenced only in x86 code
> and as of now we are not sure how other architecture will implement the Interrupt remapping
> (via IOMMU or any other means).  
> 
> Let me know if you are ok with moving the code to x86.

I can't answer this with "yes" or "no" without knowing what the alternative
would be. As said, if the alternative is CONFIG_X86 #ifdef-ary, then yes.
If a separate CONFIG_* gets introduced (and selected by X86), then a
separate file (getting built only when that new setting is y) would seem
better to me.

Jan

