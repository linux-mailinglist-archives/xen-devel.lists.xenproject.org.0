Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD036E98C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 13:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119888.226679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4pm-000745-WD; Thu, 29 Apr 2021 11:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119888.226679; Thu, 29 Apr 2021 11:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4pm-00073O-S5; Thu, 29 Apr 2021 11:27:54 +0000
Received: by outflank-mailman (input) for mailman id 119888;
 Thu, 29 Apr 2021 11:27:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc4pl-00072o-Rv
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:27:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc4pj-00033f-JF; Thu, 29 Apr 2021 11:27:51 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc4pj-00014n-CK; Thu, 29 Apr 2021 11:27:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=5lORt5x6BV5eAFqPhrdiakTGkNYAtS037+8oc7UMlY4=; b=Dn5toUWnX3Hn54Dmqn1g54KHwY
	HaE4/XyM6hfi18rlMdQGMm/xbS4njcc/wsWbLrMyHaS7xP+jwlH/IRGho/gFJKYhircWtQ5gct4Ek
	CJ5g8kjP2p6vw0UbqNkU7+LeweEx3a5mWXu/BSNI2BVXuf9//fqHbgAIPAuakIJHT87c=;
Subject: Re: [PATCH v4 3/3] unzstd: make helper symbols static
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
Date: Thu, 29 Apr 2021 12:27:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/04/2021 11:22, Jan Beulich wrote:
> While for the original library's purposes these functions of course want
> to be externally exposed, we don't need this, and we also don't want
> this both to prevent unintended use and to keep the name space tidy.
> (When functions have no callers at all, wrap them with a suitable
> #ifdef.) This has the added benefit of reducing the resulting binary
> size - while this is all .init code, it's still desirable to not carry
> dead code.

So I understand the desire to keep the code close to Linux and removing 
the dead code. However I am still not convinced that the approach taken 
is actually worth the amount of memory saved.

How much memory are we talking about here?

Cheers,

-- 
Julien Grall

