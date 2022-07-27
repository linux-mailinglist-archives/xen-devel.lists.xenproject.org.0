Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C9583217
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 20:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376423.609182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlrA-0000vQ-Ja; Wed, 27 Jul 2022 18:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376423.609182; Wed, 27 Jul 2022 18:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGlrA-0000sj-Gn; Wed, 27 Jul 2022 18:34:04 +0000
Received: by outflank-mailman (input) for mailman id 376423;
 Wed, 27 Jul 2022 18:34:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGlr9-0000sb-Cb
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 18:34:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGlr6-0004Q9-C5; Wed, 27 Jul 2022 18:34:00 +0000
Received: from [54.239.6.186] (helo=[192.168.6.7])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGlr6-0006Wx-5k; Wed, 27 Jul 2022 18:34:00 +0000
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
	bh=bv4MA8qCouhTy0sn7RM1g97aMwrZIgBG2t39tdfZ2TY=; b=Gq3LsgEHmLmEAzLLm/wxKPzaeK
	RkjiykUIqTUNGEVmeYy4lf/Qt5q2AWuRmame6opr5fUAbdN2mT8aMvl9LjqCyKQgpxNOZgotqBAgz
	VQ0L5xhxWK0jSEYCJq2GUzqnm8hEZwtILGKxCK6ma/VHelITCRRtisSkfBtiW8M/Dx3I=;
Message-ID: <f4039aed-2b85-fec2-fab1-ac279eee4c29@xen.org>
Date: Wed, 27 Jul 2022 19:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v7] evtchn: convert domain event lock to an r/w one
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <d6a04eb7-bea7-0757-38da-526ee5d5448b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d6a04eb7-bea7-0757-38da-526ee5d5448b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/07/2022 16:56, Jan Beulich wrote:
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
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

