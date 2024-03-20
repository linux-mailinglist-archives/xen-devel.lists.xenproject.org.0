Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B2880E09
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:57:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695810.1085942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrks-0004bd-Fk; Wed, 20 Mar 2024 08:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695810.1085942; Wed, 20 Mar 2024 08:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrks-0004ZL-Cq; Wed, 20 Mar 2024 08:57:02 +0000
Received: by outflank-mailman (input) for mailman id 695810;
 Wed, 20 Mar 2024 08:57:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rmrkr-0004Yw-Hf
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:57:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rmrkr-00021b-2O; Wed, 20 Mar 2024 08:57:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rmrkq-0001HC-TW; Wed, 20 Mar 2024 08:57:01 +0000
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
	bh=emC8rffH3vnmHuHyLdxkyK1SBNSw+hOp77sCYuhO3qg=; b=PUXlXcc05CmqWuzEcpVXIlfcFE
	abS/UwwTTz4uE8VxI6UTB5ZiOQyhNDp+MWoy9kQyWwC6vzvDAB0y3JTO6t68lYcB+f6m5eElZBe8t
	//bHGYuqoaammnmf4rSbYz9bfK4qAFOLLaNMdW/Vl7py+h4aPpTlBxqpzZuHVVnQhjt0=;
Message-ID: <5ccdbad1-7610-45bf-878a-2d0f99cc805b@xen.org>
Date: Wed, 20 Mar 2024 08:56:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/rwlock: Don't perpeuatite broken API in new logic
Content-Language: en-GB
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240319113020.3843309-1-andrew.cooper3@citrix.com>
 <553a8bfb-94f3-4c3a-b1ae-17d0cb185737@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <553a8bfb-94f3-4c3a-b1ae-17d0cb185737@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/03/2024 06:35, Jürgen Groß wrote:
> On 19.03.24 12:30, Andrew Cooper wrote:
>> The single user wants this the sane way around.  Write it as a normal 
>> static
>> inline just like rspin_lock().
>>
>> Fixes: cc3e8df542ed ("xen/spinlock: add 
>> rspin_[un]lock_irq[save|restore]()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Maybe with the subject fixed (s/rwlock/spinlock/).

And s/perpeuatite/perpetuate/ :).

Cheers,

-- 
Julien Grall

