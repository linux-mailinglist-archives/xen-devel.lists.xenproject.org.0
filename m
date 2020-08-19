Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BAE2498EA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Jvf-0000zC-Ee; Wed, 19 Aug 2020 08:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8Jve-0000z7-4w
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:58:42 +0000
X-Inumbo-ID: 4fc59246-e038-4e43-a80b-d9d0a0a3954d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4fc59246-e038-4e43-a80b-d9d0a0a3954d;
 Wed, 19 Aug 2020 08:58:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C45D6B686;
 Wed, 19 Aug 2020 08:59:06 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
To: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <jgrall@amazon.com>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
 <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
 <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
 <5a406d61-293b-8dd7-44c2-d4f5dde4856f@xen.org>
 <7EAB4E0A-338C-4DCF-80A4-A426BC95C051@arm.com>
 <5dceeedf-9982-37c5-553e-76f22d9d6db2@xen.org>
 <B2AFB28F-0D54-45D4-AFAA-8C495A6D9054@arm.com>
 <75e13b0b-07fc-1e30-42e8-e11a65fa1c81@suse.com>
 <52ce222b-2d48-8824-aac6-6240dbe30ebf@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7276d345-606f-7560-5bc7-b23780ae3e7e@suse.com>
Date: Wed, 19 Aug 2020 10:58:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <52ce222b-2d48-8824-aac6-6240dbe30ebf@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.08.2020 10:50, Julien Grall wrote:
> On 19/08/2020 09:02, Jan Beulich wrote:
>> On 19.08.2020 09:59, Bertrand Marquis wrote:
>>>> On 18 Aug 2020, at 18:34, Julien Grall <julien@xen.org> wrote:
>>
>> Btw - is there any need for this thread to be cross posted to both
>> xen-devel@ and security@? (I've dropped the latter here.)
> 
>  From the cover letter:
> 
> "The patch series is directly sent on the mailing list as the
> security team has been aware of the issues after the whitepaper was
> publicly released."
> 
> This is technically still a security issue except this is discussed in 
> the open as it is a zero day for us. An XSA will have to be issued in 
> due course. Hence why security@ is added to keep track of the conversation.

I thought cross-posting is generally considered bad practice. I can't
see what extra "keeping track of the conversation" gets added by CCing
security@: Everything will already be recorded in the list archives of
xen-devel.

For some background of my original question: The cross posting confuses
the rules I have set up in my mail client - the mail gets moved back
and forth between the two distinct folders for each of the lists. I
haven't been able to figure a non-clumsy way yet to avoid this
happening. The mail client we used to use until about a year ago did
not have any issue with the same scenario.

Jan

