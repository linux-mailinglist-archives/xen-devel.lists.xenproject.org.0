Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F629E69C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 09:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14054.34982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY3ab-0003Wf-1s; Thu, 29 Oct 2020 08:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14054.34982; Thu, 29 Oct 2020 08:47:21 +0000
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
	id 1kY3aa-0003WG-Uq; Thu, 29 Oct 2020 08:47:20 +0000
Received: by outflank-mailman (input) for mailman id 14054;
 Thu, 29 Oct 2020 08:47:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY3aZ-0003WB-0w
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 08:47:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c8c41d6-e7fa-4633-a6d4-6f4158091005;
 Thu, 29 Oct 2020 08:47:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF42FB95B;
 Thu, 29 Oct 2020 08:47:13 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY3aZ-0003WB-0w
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 08:47:19 +0000
X-Inumbo-ID: 8c8c41d6-e7fa-4633-a6d4-6f4158091005
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8c8c41d6-e7fa-4633-a6d4-6f4158091005;
	Thu, 29 Oct 2020 08:47:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603961234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5tvZJ4AQ6Vz2ud0aD2NJmoVWEaQSCMw/rCvCUHffpkI=;
	b=CrzEdll8O35dafx9oqaovKQJDz8TtlgCgY3k2sxiCPvsTMBp2IgNqoFQybaM4J7D29AysO
	x+z8lGWkVi8SKKZ0qbgT6DVGEJaf5oI5H4s5VI1km+eQ9YexCCMyP2e6Gbbh2NwAPut9x4
	rpwh+J37ubxN9IuZxk3cqdwzV7kH6Jo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DF42FB95B;
	Thu, 29 Oct 2020 08:47:13 +0000 (UTC)
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>
References: <20201026204151.23459-1-olaf@aepfle.de>
 <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
 <20201027112703.24d55a50.olaf@aepfle.de>
 <bc7a5e73-af27-45ae-5d82-f53176cd43a9@suse.com>
 <24025dd2-2c61-7e92-a9b1-2433eea2e909@citrix.com>
 <3880bcbd-9281-10a5-7de5-f73bcf74557a@suse.com>
 <20201028181344.GA273696@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4597e596-822e-041a-83de-9fcbfbd03933@suse.com>
Date: Thu, 29 Oct 2020 09:47:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028181344.GA273696@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.10.2020 19:13, Anthony PERARD wrote:
> On Tue, Oct 27, 2020 at 12:06:56PM +0100, Jan Beulich wrote:
>> On 27.10.2020 11:57, Andrew Cooper wrote:
>>> On 27/10/2020 10:37, Jan Beulich wrote:
>>>> On 27.10.2020 11:27, Olaf Hering wrote:
>>>>> Am Tue, 27 Oct 2020 11:16:04 +0100
>>>>> schrieb Jan Beulich <jbeulich@suse.com>:
>>>>>
>>>>>> This pattern is used when a rule consists of multiple commands
>>>>>> having their output appended to one another's.
>>>>> My understanding is: a rule is satisfied as soon as the file exists.
>>>> No - once make has found that a rule's commands need running, it'll
>>>> run the full set and only check again afterwards.
>>>
>>> It stops at the first command which fails.
>>>
>>> Olaf is correct, but the problem here is an incremental build issue, not
>>> a parallel build issue.
>>>
>>> Intermediate files must not use the name of the target, or a failure and
>>> re-build will use the (bogus) intermediate state rather than rebuilding it.
>>
>> But there's no intermediate file here - the file gets created in one
>> go. Furthermore doesn't make delete the target file(s) when a rule
>> fails? (One may not want to rely on this, and hence indeed keep multi-
>> part rules update intermediate files of different names.)
> 
> What if something went badly enough and sed didn't managed to write the
> whole file and make never had a chance to remove the bogus file?

How's this different from an object file getting only partly written
and not deleted? We'd have to use the temporary file approach in
literally every rule if we wanted to cater for this.

Jan

