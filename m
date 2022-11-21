Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB36321B0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446581.702224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5hA-00029f-6H; Mon, 21 Nov 2022 12:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446581.702224; Mon, 21 Nov 2022 12:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5hA-00026y-36; Mon, 21 Nov 2022 12:14:40 +0000
Received: by outflank-mailman (input) for mailman id 446581;
 Mon, 21 Nov 2022 12:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZuz=3V=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ox5h8-0001vt-5m
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:14:38 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f9defd7-6996-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 13:14:36 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1669032864902143.4470409260905;
 Mon, 21 Nov 2022 04:14:24 -0800 (PST)
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
X-Inumbo-ID: 0f9defd7-6996-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; t=1669032867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y+LsheZCVhhdQeNSE8I45kLFI95mq+XzQ4AOZ7rgVQ9gf3MiPOhwsU/HYTN728xroWjUsZW70+qif3Ovs3EcihxoyfoVJyBlFWJjkHsCjJINpz/yBCMvyuWcAaM6IfRmCe28gn1QNnozbVCzOD/9VZ8NEuhtfD/SLf9WjjGEOmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669032867; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kAvyxNhxrDhDOTk3kJ4SBAnDuRQLgM3Lx2hQnjnoA9A=; 
	b=a+S9zrpKWPTtoH9Mq0v6fk3qZseeCUMRO/6I/Pswp+RygZbq7cjbkRVI6ae7hRX9d0wCISysDnyvyc+zcUZ1qv4y8u8Vfh6YFijFftdKrOB6nfxjQisTgROV6DfluXjUsZ/Q+vajkVaFO6bMgdD8UjlaQlcPwz5zfmvzgdtV4RI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669032867;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kAvyxNhxrDhDOTk3kJ4SBAnDuRQLgM3Lx2hQnjnoA9A=;
	b=P81mi1pVtIhg9toGquMvsbAK3o/aktr0yYyyVvy0cp94pZ/UFGk2JdRDjz9uQiIx
	0U5CQayD2hR0C6wyiUhR6Mlc5lNtElUHUSkWO/+6gk/iRLUu2FA+TaRazqI6xd8TqlR
	XovwnMBa2XACUVGLVzaIIDCwdqZaHwmf3WMghieA=
Message-ID: <5e24609e-a54d-8303-9385-a99a98cdf3a2@apertussolutions.com>
Date: Mon, 21 Nov 2022 07:14:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Flask vs paging mempool - Was: [xen-unstable test] 174809:
 regressions - trouble: broken/fail/pass
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <osstest-174809-mainreport@xen.org>
 <Y3eZOcmOYkNLdeGe@Air-de-Roger>
 <6846bb37-345e-ca3d-4cad-2032c4852e15@citrix.com>
 <CAKf6xpvpqrrjbvn5zvBifZg2J=0TpLqgwic4gM7=4Viq-8uzLg@mail.gmail.com>
 <d367e187-015b-5aca-92eb-ccb8fead208d@apertussolutions.com>
 <08577045-517d-3566-9931-dcc1df6c2cb6@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <08577045-517d-3566-9931-dcc1df6c2cb6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/21/22 03:04, Jan Beulich wrote:
> On 20.11.2022 12:08, Daniel P. Smith wrote:
>> On 11/18/22 16:10, Jason Andryuk wrote:
>>> On Fri, Nov 18, 2022 at 12:22 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>>> For Flask, we need new access vectors because this is a common
>>>> hypercall, but I'm unsure how to interlink it with x86's shadow
>>>> control.  This will require a bit of pondering, but it is probably
>>>> easier to just leave them unlinked.
>>>
>>> It sort of seems like it could go under domain2 since domain/domain2
>>> have most of the memory stuff, but it is non-PV.  shadow has its own
>>> set of hooks.  It could go in hvm which already has some memory stuff.
>>
>> Since the new hypercall is for managing a memory pool for any domain,
>> though HVM is the only one supported today, imho it belongs under
>> domain/domain2.
>>
>> Something to consider is that there is another guest memory pool that is
>> managed, the PoD pool, which has a dedicated privilege for it. This
>> leads me to the question of whether access to manage the PoD pool and
>> the paging pool size should be separate accesses or whether they should
>> be under the same access. IMHO I believe it should be the latter as I
>> can see no benefit in disaggregating access to the PoD pool and the
>> paging pool. In fact I find myself thinking in terms of should the
>> managing domain have control over the size of any backing memory pools
>> for the target domain. I am not seeing any benefit to discriminating
>> between which backing memory pool a managing domain should be able to
>> manage. With that said, I am open to being convinced otherwise.
> 
> Yet the two pools are of quite different nature: The PoD pool is memory
> the domain itself gets to use (more precisely it is memory temporarily
> "stolen" from the domain). The paging pool, otoh, is memory we need to
> make the domain actually function, without the guest having access to
> that memory.

The question is not necessarily what the pools' exact purpose are, but 
who will need control over their size. If one takes a courser view, and 
say these memory pools relate to how a domain is consuming memory, then 
it follows that only entity needing access is the entity granted 
control/management over the domain memory usage. In the end there will 
still be an access check for both calls, the question is whether it 
makes any sense to differentiate between them in the security model. As 
I just outlined, IMHO there is not, but I am open to hearing why they 
would need to be differentiated in the security model.

v/r,
dps

