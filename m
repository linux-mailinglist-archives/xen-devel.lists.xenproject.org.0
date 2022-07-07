Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E639656AA2C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 20:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363110.593469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Vnm-0007SW-Co; Thu, 07 Jul 2022 18:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363110.593469; Thu, 07 Jul 2022 18:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9Vnm-0007Qi-8q; Thu, 07 Jul 2022 18:00:34 +0000
Received: by outflank-mailman (input) for mailman id 363110;
 Thu, 07 Jul 2022 18:00:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9Vnk-0007QI-UJ
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 18:00:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9Vnh-00049J-4s; Thu, 07 Jul 2022 18:00:29 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9Vng-0004QV-Sp; Thu, 07 Jul 2022 18:00:29 +0000
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
	bh=lShGzR6qwIyBYvG26+ukeDZ0pjhDQ2kB8igP/AKpxEY=; b=z4gbfWFLICpw3fGEgRH8d8zOi4
	8lZ0c+YNfdNPjD3GkvZaf8YKcJOIdN8UymxjEsOfJN963FkRzrSiVF9MIGbUybc9ytnwHD8qofdWp
	7y3m/YXaveHiPlITuK7WEhSH0ALLmiJEaFjxdLM/wKGtDlIQbH+YVgG3X4E8HFMTOPr0=;
Message-ID: <6683c78f-ab19-ebe7-b6f9-32019f2226ef@xen.org>
Date: Thu, 7 Jul 2022 19:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/6] evtchn: convert domain event lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <5f5fc6a7-6e27-8275-0f05-11ba5454156a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5f5fc6a7-6e27-8275-0f05-11ba5454156a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

As discussed in [1], I think it would good to revive this patch.

AFAICT, this patch was dropped because the performance was thought to be 
minimal. However, I think it would be a better way to resolve the 
problem that one is trying to address [1].

So I will do another review of this patch.

On 27/01/2021 08:16, Jan Beulich wrote:
> Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
> across pCPU-s) and the ones in EOI handling in PCI pass-through code,
> serializing perhaps an entire domain isn't helpful when no state (which
> isn't e.g. further protected by the per-channel lock) changes.
> 
> Unfortunately this implies dropping of lock profiling for this lock,
> until r/w locks may get enabled for such functionality.
> 
> While ->notify_vcpu_id is now meant to be consistently updated with the
> per-channel lock held, an extension applies to ECS_PIRQ: The field is
> also guaranteed to not change with the per-domain event lock held for
> writing. Therefore the link_pirq_port() call from evtchn_bind_pirq()
> could in principle be moved out of the per-channel locked regions, but
> this further code churn didn't seem worth it.

This doesn't seem to apply on upstream anymore. Would you be able to 
respin it?

I have looked at the place where you use read_lock() rather than 
write_lock(). They all look fine to me, so I would be fine to give my 
reviewed-by on the next version (assuming there are nothing wrong with 
the rebase :)).

Cheers,

[1] 
https://lore.kernel.org/xen-devel/acd0dfae-b045-8505-3f6c-30ce72653660@suse.com/

-- 
Julien Grall

