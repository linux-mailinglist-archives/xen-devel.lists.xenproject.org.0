Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C782B981A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 17:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31139.61386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfmwT-0003CU-Od; Thu, 19 Nov 2020 16:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31139.61386; Thu, 19 Nov 2020 16:37:53 +0000
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
	id 1kfmwT-0003C9-LA; Thu, 19 Nov 2020 16:37:53 +0000
Received: by outflank-mailman (input) for mailman id 31139;
 Thu, 19 Nov 2020 16:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfmwR-0003C4-Ex
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:37:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0778bc08-21cd-4961-a343-cc8cfe4918a0;
 Thu, 19 Nov 2020 16:37:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A209DAC2D;
 Thu, 19 Nov 2020 16:37:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfmwR-0003C4-Ex
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 16:37:51 +0000
X-Inumbo-ID: 0778bc08-21cd-4961-a343-cc8cfe4918a0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0778bc08-21cd-4961-a343-cc8cfe4918a0;
	Thu, 19 Nov 2020 16:37:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605803869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+Xf18YHgnei9DXh5gYTPxA+nYmJ8ESY2h/5F4AwS/E=;
	b=Ac5gIp0TMzRzPxZnVNjrxvenqTYQtUesFqwDYg32cY5y2ea41zHuhlkn+Iic6Q9y2C3mOJ
	wf3gDRP0fF0514MT+gPrKn5T2rZg2sCyxRSrC1TUsAIu9qIiGrnhzIKA3/3RM0nez9LjIX
	y5qZDqFUdmQ2SwWcbXQOKSCKFVgd550=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A209DAC2D;
	Thu, 19 Nov 2020 16:37:49 +0000 (UTC)
Subject: Re: [PATCH] x86/Intel: avoid UB with NMI watchdog on family 15 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63500eb6-b1da-ce08-52e2-00b30ffe2c26@suse.com>
 <1c2ffdcb-577d-8bea-35e3-904777a0c2e5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e056d6ff-aceb-e4f9-1fe8-a41c482e34bc@suse.com>
Date: Thu, 19 Nov 2020 17:37:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1c2ffdcb-577d-8bea-35e3-904777a0c2e5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.11.2020 17:10, Andrew Cooper wrote:
> On 19/11/2020 15:57, Jan Beulich wrote:
>> Found by looking for patterns similar to the one Julien did spot in
>> pci_vtd_quirks().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Subject is wonky.  Is it P4 (Intel), or Fam15 (AMD) ?  I'd be tempted to
> have the prefix as x86/nmi: either way.

With this code:

    case X86_VENDOR_INTEL:
        switch (boot_cpu_data.x86) {
        case 6:
            setup_p6_watchdog((boot_cpu_data.x86_model < 14) 
                              ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
                              : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
            break;
        case 15:
            if (!setup_p4_watchdog())

I think qualifying it like I did is quite reasonable. Hence ...

> With that suitably adjusted, Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

... I'd prefer to keep it as is - please clarify.

Jan

