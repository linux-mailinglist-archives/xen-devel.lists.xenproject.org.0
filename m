Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B398635559F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 15:46:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105964.202617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTm2O-00039z-Ft; Tue, 06 Apr 2021 13:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105964.202617; Tue, 06 Apr 2021 13:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTm2O-00039a-Cf; Tue, 06 Apr 2021 13:46:36 +0000
Received: by outflank-mailman (input) for mailman id 105964;
 Tue, 06 Apr 2021 13:46:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTm2M-00039V-S3
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 13:46:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTm2M-0007fy-Ed; Tue, 06 Apr 2021 13:46:34 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTm2M-0007os-6u; Tue, 06 Apr 2021 13:46:34 +0000
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
	bh=hL/DNXPgONRhYcLJof2CA1fzKZNQ0/R+MlOogkZCxL0=; b=EvBKmne0DBgjh15xBCHJLlyoSk
	duyPUpDgm7KnGPKqgTjZlC+cQzPAkPH8g1QNA4uOA+7IKkakATGmeDJ1s+PfoqVLvqTuS/bO0F3Gv
	HXcOPAGQgh2WxyxboCR0mmYB6WdY86xkucxL5+Q5UKz9IZZVS56gnBfTQJ2sNJ8hoAcw=;
Subject: Re: [PATCH] xen/evtchn: Change irq_info lock to raw_spinlock_t
To: Luca Fancellu <luca.fancellu@arm.com>, sstabellini@kernel.org,
 jgross@suse.com, jgrall@amazon.com
Cc: boris.ostrovsky@oracle.com, tglx@linutronix.de, wei.liu@kernel.org,
 jbeulich@suse.com, yyankovskyi@gmail.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 bertrand.marquis@arm.com
References: <20210406105105.10141-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <74349f41-ba4e-7486-5467-fb8fa3c96e50@xen.org>
Date: Tue, 6 Apr 2021 14:46:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406105105.10141-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 06/04/2021 11:51, Luca Fancellu wrote:
> Unmask operation must be called with interrupt disabled,
> on preempt_rt spin_lock_irqsave/spin_unlock_irqrestore
> don't disable/enable interrupts, so use raw_* implementation
> and change lock variable in struct irq_info from spinlock_t
> to raw_spinlock_t
> 
> Cc: stable@vger.kernel.org
> Fixes: 25da4618af24 ("xen/events: don't unmask an event channel
> when an eoi is pending")
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

