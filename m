Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BED28D167
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 17:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6297.16769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSMQR-0000va-AJ; Tue, 13 Oct 2020 15:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6297.16769; Tue, 13 Oct 2020 15:41:19 +0000
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
	id 1kSMQR-0000vF-72; Tue, 13 Oct 2020 15:41:19 +0000
Received: by outflank-mailman (input) for mailman id 6297;
 Tue, 13 Oct 2020 15:41:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSMQQ-0000vA-3c
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:41:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9edea0e4-ddb0-4520-856b-065138215da2;
 Tue, 13 Oct 2020 15:41:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87C25B1A6;
 Tue, 13 Oct 2020 15:41:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSMQQ-0000vA-3c
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 15:41:18 +0000
X-Inumbo-ID: 9edea0e4-ddb0-4520-856b-065138215da2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9edea0e4-ddb0-4520-856b-065138215da2;
	Tue, 13 Oct 2020 15:41:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602603676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U4OemMNmTMTBI16JsiuhCKQ5aOSybutzFsISwsGQk70=;
	b=ZyP1+fYMd/XVeVjPkNU5lreZtF6BG0RcylFd/KwjLtmSYZPI6QXgx/zYWyCQDoaGi7B6p8
	7mTbhrBc3eRXBOAfDrSUZrUSZn/Vzg17oHmnghg2bS07iW/zorATPxVlu0I2soFcdXGmYA
	lEaiflLL/HlPAwrBZF49Rmj533VPqGk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 87C25B1A6;
	Tue, 13 Oct 2020 15:41:16 +0000 (UTC)
Subject: Re: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback mechanism
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-4-roger.pau@citrix.com>
 <a6863a90-584a-af21-4a0a-1b104b750978@suse.com>
 <20201013143028.GQ19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8d878fc-4d05-d059-61f4-6994cb595838@suse.com>
Date: Tue, 13 Oct 2020 17:41:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201013143028.GQ19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.10.2020 16:30, Roger Pau Monné wrote:
> On Fri, Oct 02, 2020 at 11:39:50AM +0200, Jan Beulich wrote:
>> On 30.09.2020 12:41, Roger Pau Monne wrote:
>>> Add a new vlapic_set_irq_callback helper in order to inject a vector
>>> and set a callback to be executed when the guest performs the end of
>>> interrupt acknowledgment.
>>
>> On v1 I did ask
>>
>> "One thing I don't understand at all for now is how these
>>  callbacks are going to be re-instated after migration for
>>  not-yet-EOIed interrupts."
>>
>> Afaics I didn't get an answer on this.
> 
> Oh sorry, I remember your comment and I've changed further patches to
> address this.
> 
> The setter of the callback will be in charge for setting the callback
> again on resume. That's why vlapic_set_callback is not a static
> function, and is added to the header.
> 
> Patch 5/11 [0] contains an example of hw the vIO-APIC resets the callbacks
> on load. 

Ah, I see - I didn't get there yet. Could you mention this behavior in
the description here, or maybe in a code comment next to the declaration
(or definition) of the function?

Jan

