Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E2303AC7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 11:52:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74816.134500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Lwx-000878-6j; Tue, 26 Jan 2021 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74816.134500; Tue, 26 Jan 2021 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Lwx-00086h-2Y; Tue, 26 Jan 2021 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 74816;
 Tue, 26 Jan 2021 10:51:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Lwv-00086c-VA
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 10:51:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8f258c4-c1e9-4afb-a1cf-fca89c108f52;
 Tue, 26 Jan 2021 10:51:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 277A6ACC6;
 Tue, 26 Jan 2021 10:51:52 +0000 (UTC)
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
X-Inumbo-ID: d8f258c4-c1e9-4afb-a1cf-fca89c108f52
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611658312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctBd3QEgUh7szt0fu3ynnMhZnxoNVhX3YkTzIHeXw1s=;
	b=BzJvolLR78m9bVKjsv1agv/JnHN3UHhG4HEuQaDq4FJ9elfXHDNAMzlPFxP9buUx5dENHW
	3BDTIzIllRJ7Sq5w51b7OvZqEl1zQGRbthBqLPGe7tgzZ93bNFmCmdK/gpJxjMCRRCTcmX
	5YeFuL3Ve7YbD77YMJsioSjQndWwPyY=
Subject: Re: [PATCH v7 02/10] xen/domain: Add vmtrace_frames domain creation
 parameter
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-3-andrew.cooper3@citrix.com>
 <752e7de2-b95e-f7ab-0d14-877c72c66134@suse.com>
 <b4ccc233-d006-1f7b-0c0a-8fd8034a25cd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e6c3f76d-6ab0-54e5-c2f5-78aba7cc711f@suse.com>
Date: Tue, 26 Jan 2021 11:51:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <b4ccc233-d006-1f7b-0c0a-8fd8034a25cd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.01.2021 18:17, Andrew Cooper wrote:
> On 25/01/2021 15:08, Jan Beulich wrote:
>> On 21.01.2021 22:27, Andrew Cooper wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -257,6 +257,10 @@ struct vcpu
>>>      /* vPCI per-vCPU area, used to store data for long running operations. */
>>>      struct vpci_vcpu vpci;
>>>  
>>> +    struct {
>>> +        struct page_info *buf;
>>> +    } vmtrace;
>> While perhaps minor, I'm unconvinced "buf" is a good name
>> for a field of this type.
> 
> Please suggest a better one then.  This one is properly namespaced as
> v->vmtrace.buf which is the least bad option I could come up with.

"pg", "page", or "pages" are all names we use for variables and
fields of this type. I don't see at all how the namespacing
helps it - to me "v->vmtrace.buf" is still a pointer to the
actual buffer, not the struct page_info describing the 1st page
of it.

Jan

