Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7332D951A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52026.91031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok5f-0004l2-78; Mon, 14 Dec 2020 09:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52026.91031; Mon, 14 Dec 2020 09:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok5f-0004kd-3I; Mon, 14 Dec 2020 09:24:23 +0000
Received: by outflank-mailman (input) for mailman id 52026;
 Mon, 14 Dec 2020 09:24:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kok5d-0004kY-Tz
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:24:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 338fba1a-b0e0-45cb-9b5c-2f6104e149f9;
 Mon, 14 Dec 2020 09:24:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C14EB719;
 Mon, 14 Dec 2020 09:24:20 +0000 (UTC)
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
X-Inumbo-ID: 338fba1a-b0e0-45cb-9b5c-2f6104e149f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607937860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02uHgHFOx1xv38bGx6gxW0glBdRxZ0Uf7XJBEfVhmAM=;
	b=s2hANY+wf4cWP7z6JzoyEvyts9tc7c22maUWxmeMAkP7QfIteGsfPRv8FISP2VzSXoYIng
	i7Sd1aR9BoWSrVR/BnImaJm6OGyGW7muxIwlGUgYfNUGyDFHCipP4UoVK30v4O4jWjGp+y
	ttviFhqMWf8TCUMJrZH6UVYflS9GBTQ=
Subject: Re: [PATCH v4 0/3] xen: add support for automatic debug key actions
 in case of crash
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <247d9c9c-5ab1-c733-6960-e406040c28ac@suse.com>
 <dd39f92b-e0b0-135b-faf2-379c21652df3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9de26f40-87e9-aab6-01d7-720217e23721@suse.com>
Date: Mon, 14 Dec 2020 10:24:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <dd39f92b-e0b0-135b-faf2-379c21652df3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.12.2020 10:21, Jürgen Groß wrote:
> On 14.12.20 10:09, Jan Beulich wrote:
>> On 14.12.2020 08:56, Juergen Gross wrote:
>>> Patch 2 opens up more potential for simplification: in theory there is
>>> no need any more to call any key handler with the regs parameter,
>>> allowing to use the same prototype for all handlers. The downside would
>>> be to have an additional irq frame on the stack for the dump_registers()
>>> and the do_debug_key() handlers.
>>
>> This isn't the only downside, is it? We'd then also need to be able
>> to (sufficiently cleanly) unwind through the new frame to reach the
>> prior one, in order to avoid logging less reliable information. Plus
>> decompose the prior frame as well to avoid logging less easy to
>> consume data.
> 
> Yes, this was implied by the "additional irq frame on the stack".

Oh, okay - I read it as just referring to the possible concern of
more of the not overly large stack to get used.

Jan

