Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3DF7F119F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636606.992187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52Gt-0004tO-OZ; Mon, 20 Nov 2023 11:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636606.992187; Mon, 20 Nov 2023 11:16:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52Gt-0004r3-Lk; Mon, 20 Nov 2023 11:16:55 +0000
Received: by outflank-mailman (input) for mailman id 636606;
 Mon, 20 Nov 2023 11:16:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r52Gs-0004qx-5z
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:16:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r52Gq-0004hz-Pt; Mon, 20 Nov 2023 11:16:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r52Gq-0007r2-I4; Mon, 20 Nov 2023 11:16:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=X+qWaj3+3C0EKFQCpNrXouQFELKlOZMDstI67Ck946Q=; b=NVVAAtGvgUDY46SG0qf5dzYT0m
	m3XEpOaQmSNP8YZ1IiH67j5YRwkiDxtwbeECeU2i3a67bBS9Z2pJDL/l4RLKZklm7nYaGgQy68TYk
	ljmvzBekO89AVzj7+xH3a+A8CKbio4hKueoqnu6VSDnJbSL2emb+r8JZm+eJyw91bw2k=;
Message-ID: <da1d557a-6030-4dd8-a875-af733572fc48@xen.org>
Date: Mon, 20 Nov 2023 11:16:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Devise macros to encapsulate (x & -x)
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>, Jbeulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com>
 <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
 <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/11/2023 02:46, Stefano Stabellini wrote:
> On Fri, 17 Nov 2023, Andrew Cooper wrote:
>> On 17/11/2023 10:17 am, Nicola Vetrini wrote:
>>> Hi all,
>>>
>>> As discussed in this thread [1], which is about complying with MISRA C
>>> Rule 10.1,
>>> a macro was introduced to encapsulate a well-known construct:
>>>
>>> /*
>>>   * Given an unsigned integer argument, expands to a mask where just
>>> the least
>>>   * significant nonzero bit of the argument is set, or 0 if no bits are
>>> set.
>>>   */
>>> #define ISOLATE_LSB(x) ((x) & -(x))
>>>
>>> This macro has a gained some calls in the subsequent patches in that
>>> thread, but concerns were raised around the fact that it would be
>>> better to devise a macro that evaluates its argument only once. A
>>> proposed solution is this (thanks to Jan Beulich):
>>>
>>> #define ISOLATE_LSB(x) ({ \
>>>       typeof(x) x_ = (x); \
>>>       x_ & -x_; \
>>> })
>>
>> Of course this was going to explode.
>>
>> This isn't even the first time an unwise attempt to do single-evaluation
>> has needed to be reverted because it doesn't work with Integer Constant
>> Expressions.
>>
>> Switch it back to the first form.  It's obviously a macro to begin with,
>> and not likely to be used in cases that have side effects.
> 
> +1

FWIW +1. I don't much like the idea to have two different versions of 
the helper if there is no real need for it.

Cheers,

-- 
Julien Grall

