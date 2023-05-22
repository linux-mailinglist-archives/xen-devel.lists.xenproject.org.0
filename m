Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A670C805
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 21:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538083.837852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1BJI-0004Y3-E0; Mon, 22 May 2023 19:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538083.837852; Mon, 22 May 2023 19:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1BJI-0004VW-Ai; Mon, 22 May 2023 19:35:12 +0000
Received: by outflank-mailman (input) for mailman id 538083;
 Mon, 22 May 2023 19:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iirr=BL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1q1BJG-0004Ud-GD
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 19:35:10 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1eb3879-f8d7-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 21:35:08 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16847841019723.4284023614443413;
 Mon, 22 May 2023 12:35:01 -0700 (PDT)
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
X-Inumbo-ID: c1eb3879-f8d7-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1684784103; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NZD3h/6MSHBDgza8k9G0UMwscqDDu8wBb/sEltpJfAmGWHwBYjPbXcZTW/D/EgV1QD90XEZa25nNA4iEjlhdrBiZqSf2gO8uIayZyEAwlnrY9hAUJMT7g/3u8Th6c44QftbzTwPVGt5eUGQhLpNwmPOm6vLW8yALTxnnlLOqFyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684784103; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LHtXxuQLJ2qd3EJg+oiO4vWWwXemlyBNcmjyBgrOsEI=; 
	b=V4HQghP2xS1Oh4wqTTWJT3hEk5bSvOeRVtvn/SjmKON3XVexFDS6rOpI79iFC0++cCQNcKosnya7dFDMoBGSEcAb4WyD0DuDdPT2fkK2QVjS8sb33pkMq8/t9ZCvk+8gupXtEUWJf5eE/CtPqCg2T/eUF2O/d1IuCALg2xNa1Ck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684784103;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LHtXxuQLJ2qd3EJg+oiO4vWWwXemlyBNcmjyBgrOsEI=;
	b=QKqBKbAMwOMFEacp/FFpoY6l4QtyAfj0SHU6qV1pF2V+4Twx1x8rib/sg+ZwBwdw
	Iuv4pckJEj0psdvrRQUVfQsL8TafUPN4kRlplM9G8cWyxcBLK3EKqQ+giKiFT724TnF
	u2o/17K5/697qS1B5MobmyWDJ4/XJZ+D5XIHGGVw=
Message-ID: <6028fc89-9a9a-5d3d-66f7-e761a6c9439b@apertussolutions.com>
Date: Mon, 22 May 2023 15:35:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] maintainers: add regex matching for xsm
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230519114824.12482-1-dpsmith@apertussolutions.com>
 <4a8c30bd-ebe7-3800-37ae-9e3e6c37a7d0@suse.com>
 <4c72b060-52b7-a852-f966-5849a78ccc19@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4c72b060-52b7-a852-f966-5849a78ccc19@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 5/22/23 06:27, Julien Grall wrote:
> Hi,
> 
> On 22/05/2023 10:23, Jan Beulich wrote:
>> On 19.05.2023 13:48, Daniel P. Smith wrote:
>>> XSM is a subsystem where it is equally important of how and where its 
>>> hooks are
>>> called as is the implementation of the hooks. The people best suited for
>>> evaluating the how and where are the XSM maintainers and reviewers. This
>>> creates a challenge as the hooks are used throughout the hypervisor 
>>> for which
>>> the XSM maintainers and reviewers are not, and should not be, a 
>>> reviewer for
>>> each of these subsystems in the MAINTAINERS file. Though the 
>>> MAINTAINERS file
>>> does support the use of regex matches, 'K' identifier, that are 
>>> applied to both
>>> the commit message and the commit delta. Adding the 'K' identifier 
>>> will declare
>>> that any patch relating to XSM require the input from the XSM 
>>> maintainers and
>>> reviewers. For those that use the get_maintianers script, the 'K' 
>>> identifier
>>> will automatically add the XSM maintainers and reviewers.
>>
>> With, aiui, a fair chance of false positives when e.g. XSM hook 
>> invocations
>> are only in patch context. Much like ...
>>
>>> Any one not using
>>> get_maintainers, it will be their responsibility to ensure that if 
>>> their work
>>> touches and XSM hook, to ensure the XSM maintainers and reviewers are 
>>> copied.
>>
>> ... manual intervention is needed in the case of not using the script, I
>> think people should also be at least asked to see about avoiding stray 
>> Cc-s
>> in that case. 
> 
> I don't particularly like this suggestion because the sender may 
> mistakenly believe this is a "stray CC".
> 
> Personally, I would prefer to be in CC more often than less often. I 
> think we should give the choice to Daniel to decide whether he is happy 
> to be in CC potentially more often.
> 
> If it is becoming too much then we can decide to adjust the script.
> 
>> Unless of course I'm misreading get_maintainers.pl (my Perl
>> isn't really great) or the script would be adjusted to only look at 
>> added/
>> removed lines (albeit even that would leave a certain risk of false
>> positives).
>>
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -674,6 +674,8 @@ F:    tools/flask/
>>>   F:    xen/include/xsm/
>>>   F:    xen/xsm/
>>>   F:    docs/misc/xsm-flask.txt
>>> +K:  xsm_.*
>>> +K:  \b(xsm|XSM)\b
> 
> Aside the NIT from Jan, this change is only affecting the number of 
> e-mails the XSM maintainers will receive. So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Apologies, I missed your ack before I sent v2 out.

v/r,
dps

