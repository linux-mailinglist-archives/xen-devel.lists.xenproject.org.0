Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF122B8E4F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 10:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30490.60533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kffns-0007j7-92; Thu, 19 Nov 2020 09:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30490.60533; Thu, 19 Nov 2020 09:00:32 +0000
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
	id 1kffns-0007ig-5j; Thu, 19 Nov 2020 09:00:32 +0000
Received: by outflank-mailman (input) for mailman id 30490;
 Thu, 19 Nov 2020 09:00:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kffnq-0007iW-G1
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:00:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96ec46dc-60b4-491f-b9c0-a14c5a5c58d8;
 Thu, 19 Nov 2020 09:00:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A70DEAD2B;
 Thu, 19 Nov 2020 09:00:28 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kffnq-0007iW-G1
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:00:30 +0000
X-Inumbo-ID: 96ec46dc-60b4-491f-b9c0-a14c5a5c58d8
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 96ec46dc-60b4-491f-b9c0-a14c5a5c58d8;
	Thu, 19 Nov 2020 09:00:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605776428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zvL9pyoRF907QtRRaXB1t2Dt9IOlGCKcMhWe71ls8sA=;
	b=PAZUYhvCEypm74SzKqtGMny7Ug+x1Nz0QaASDTBdVUogdv9DHEwFbBJRlq+3SA8XYtHQfG
	Z5e9uihcQkUCL+9Vv9I0SaD+WvldCypcNnc+xKVJzQJnk9oDTyp8bEQhqfeRkBLuG5nmir
	NpHCD7d81TjN+O23sOrJZFCDRQd19/A=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A70DEAD2B;
	Thu, 19 Nov 2020 09:00:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
 <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
 <1530c2fb-8def-37eb-8a22-d7f9fc4e38b4@suse.com>
 <0946edb2-c2c1-0d3d-c8ff-f24055f78ebf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f505669-a107-fecc-d26c-75e14cdabadf@suse.com>
Date: Thu, 19 Nov 2020 10:00:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <0946edb2-c2c1-0d3d-c8ff-f24055f78ebf@xen.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 16:35, Julien Grall wrote:
> On 18/11/2020 15:16, Jan Beulich wrote:
>> On 18.11.2020 16:02, Rahul Singh wrote:
>>> Hello Jan,
>>>
>>>> On 17 Nov 2020, at 10:55 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 16.11.2020 13:25, Rahul Singh wrote:
>>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>>>> is enabled for ARM, compilation error is observed for ARM architecture
>>>>> because ARM platforms do not have full PCI support available.
>>>>
>>>> While you've extended the sentence, it remains unclear to me what
>>>> compilation error it is that results here. I've requested such
>>>> clarification for v2 already.
>>>
>>> Compilation error is related to the code that refer to x86  functions (create_irq()..) and MSI implementation related error.
>>> For more details please find the attached file for compilation error.
>>
>> The use of mmio_ro_ranges is almost quite possibly going to remain
>> x86-specific, but then I guess this wants abstracting in a suitable
>> way.
>>
>> The remaining look to all be MSI-related, so perhaps what you want
>> to avoid is just that part rather than everything PCI-ish?
> 
> Not really (see more above).

Did you really mean "above", not "below"? If so, I guess I need some
clarification. If not, I suppose I've addressed your concern by the
2-patch series I've just sent.

Jan

