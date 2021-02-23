Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F63228DE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 11:32:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88694.166883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEUyT-00045o-R2; Tue, 23 Feb 2021 10:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88694.166883; Tue, 23 Feb 2021 10:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEUyT-00045P-NW; Tue, 23 Feb 2021 10:31:25 +0000
Received: by outflank-mailman (input) for mailman id 88694;
 Tue, 23 Feb 2021 10:31:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lEUyS-00045K-QV
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 10:31:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEUyO-0000aF-HD; Tue, 23 Feb 2021 10:31:20 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEUyO-0006iy-88; Tue, 23 Feb 2021 10:31:20 +0000
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
	bh=E9x98BvpQuPzE0ncy7ZaRY/7oUBcrD2szpENYMNrbK0=; b=EuP0yrFUq98LhuO61s8SKWIOv1
	O5MmLNM5KiTU7L8ADF3M3jQkfxsNCnt6jXiL7zRQC3WDBJUhjxoPpBxrWqDtxzgacAtkFMYjKEPUb
	CVkvNhhqyWBnCFX26KvMWPzEui6GM6qC0B7ZvUvRostVuV8cmYGQhtPxpw3blautRuwU=;
Subject: Re: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2,
 3}
To: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, dfaggioli@suse.com,
 George.Dunlap@citrix.com
References: <20210220140412.31610-1-julien@xen.org>
 <F86904EB-91E9-475C-B60B-E08C5C9E76C3@arm.com>
 <alpine.DEB.2.21.2102221253390.3234@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <767e2028-ca86-bd0f-e936-c386066c11c8@xen.org>
Date: Tue, 23 Feb 2021 10:31:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102221253390.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/02/2021 01:24, Stefano Stabellini wrote:
> On Mon, 22 Feb 2021, Bertrand Marquis wrote:
>>> On 20 Feb 2021, at 14:04, Julien Grall <julien@xen.org> wrote:
> The consequence of this patch is that a guest can cause vcpu_unblock(v),
> hence vcpu_wake(v), to be called for its own vcpu, which basically
> always changes v to RUNSTATE_runnable. However, that alone shouldn't
> allow v to always come up ahead of any other vcpus in the queue, right?
> It should be safe. I just wanted a second opinion on this :-)

vcpu_wake() only tells the scheduler that the vCPU can be run, it is 
then up to the scheduler to decide what to do. AFAIU, for credit{1, 2}, 
each vCPU will have some credit. If you run out of credit, then you vCPU 
will not be descheduled if there is work do it.

> 
> It was possible to trigger interrupts for your own vcpus even before, but
> now the code path is going to be direct for virtual interrupts.

You can already trigger "directly" virtual interrupts using the event 
channels.

Cheers,

-- 
Julien Grall

