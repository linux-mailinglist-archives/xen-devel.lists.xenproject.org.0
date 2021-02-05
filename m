Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743EC310DD7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 17:26:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81853.151350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83wK-00064f-JK; Fri, 05 Feb 2021 16:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81853.151350; Fri, 05 Feb 2021 16:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83wK-00064K-GA; Fri, 05 Feb 2021 16:26:36 +0000
Received: by outflank-mailman (input) for mailman id 81853;
 Fri, 05 Feb 2021 16:26:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l83wJ-00064F-F4
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 16:26:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71759d0d-1dc5-4c48-8466-cc4dda91890c;
 Fri, 05 Feb 2021 16:26:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD4E9AD29;
 Fri,  5 Feb 2021 16:26:33 +0000 (UTC)
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
X-Inumbo-ID: 71759d0d-1dc5-4c48-8466-cc4dda91890c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612542393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b/aHtEjb3Xmz73loVJMDhFauQ6/tDF9t8/KHwkleKAU=;
	b=m6dkOGSPdyqX/Qlc4PvBStTZkCmi9kHYqpWjwZaah2IqcKm0fiZo8uOSPU9FKRAZ6jhSZA
	asYZCNzp23BYrKfV4ZuLczB48PVniVCdxjq38aULXsc19XbJ1/+rncnzpdW0JBSbuooTfv
	t/jtzCTnkq9f8w2NSsXvennWRsfXeuI=
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YB1nhBeMRVGyO8Fk@Air-de-Roger>
 <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
 <YB1v60CuOdhxFwNy@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <199d2681-9704-8804-d3c3-d8ad24fca137@suse.com>
Date: Fri, 5 Feb 2021 17:26:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YB1v60CuOdhxFwNy@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 17:18, Roger Pau Monné wrote:
> On Fri, Feb 05, 2021 at 05:13:22PM +0100, Jan Beulich wrote:
>> On 05.02.2021 16:43, Roger Pau Monné wrote:
>>> On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
>>>> The "guest" variants are intended to work with (potentially) fully guest
>>>> controlled addresses, while the "unsafe" variants are not.
>>>
>>> Just to clarify, both work against user addresses, but guest variants
>>> need to be more careful because the guest provided address can also be
>>> modified?
>>>
>>> I'm trying to understand the difference between "fully guest
>>> controlled" and "guest controlled".
>>
>> Not exactly, not. "unsafe" means access to anything which may
>> fault, guest controlled or not. do_invalid_op()'s reading of
>> the insn stream is a good example - the faulting insn there
>> isn't guest controlled at all, but we still want to be careful
>> when trying to read these bytes, as we don't want to fully
>> trust %rip there.
> 
> Would it make sense to threat everything as 'guest' accesses for the
> sake of not having this difference?

That's what we've been doing until now. It is the purpose of
this change to allow the two to behave differently.

> I think having two accessors it's likely to cause confusion and could
> possibly lead to the wrong one being used in unexpected contexts. Does
> it add a too big performance penalty to always use the most
> restrictive one?

The problem is the most restrictive one is going to be too
restrictive - we wouldn't be able to access Xen space anymore
e.g. from the place pointed at above as example. This is
because for guest accesses (but not for "unsafe" ones) we're
going to divert them into non-canonical space (and hence make
speculation impossible, as such an access would fault) if it
would touch Xen space.

Jan

