Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C5D5F3FEE
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 11:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415329.659874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeOA-0004S9-08; Tue, 04 Oct 2022 09:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415329.659874; Tue, 04 Oct 2022 09:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofeO9-0004PZ-Si; Tue, 04 Oct 2022 09:38:57 +0000
Received: by outflank-mailman (input) for mailman id 415329;
 Tue, 04 Oct 2022 09:38:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ofeO8-0004PT-Iu
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 09:38:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ofeO8-0007Fz-EW; Tue, 04 Oct 2022 09:38:56 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.104.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ofeO8-0004fP-8O; Tue, 04 Oct 2022 09:38:56 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=JyHkCzSF9dxv6ZDNJB6qZmBM9mc+7MOjYLzlBYcG7Uw=; b=csQJkCK3zN4nfrUSnkIucT+f2x
	XBM1iH77aNXE2MukTHSahG0/M46dR7WVw+Heo4wIWtqcJQo8WHY0SaTLOUG3tj/uAk6uhSngAy6J+
	WCPeWfJRUUM4Kuc0PywCv6FyzqJJfm7t+rinbe72YE2CHDjt7XS15535wEjhSFMhOouA=;
Message-ID: <639ca2ef-5529-a9cb-df31-7968d7f23a2d@xen.org>
Date: Tue, 4 Oct 2022 10:38:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: Proposal for physical address based hypercalls
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 28/09/2022 11:38, Jan Beulich wrote:
> For quite some time we've been talking about replacing the present virtual
> address based hypercall interface with one using physical addresses.  This is in
> particular a prerequisite to being able to support guests with encrypted
> memory, as for such guests we cannot perform the page table walks necessary to
> translate virtual to (guest-)physical addresses.  But using (guest) physical
> addresses is also expected to help performance of non-PV guests (i.e. all Arm
> ones plus HVM/PVH on x86), because of the no longer necessary address
> translation.

I am not sure this is going to be a gain in performance on Arm. In most 
of the cases we are using the HW to translate the guest virtual address 
to a host physical address. But there are no instruction to translate a 
guest physical address to a host physical address. So we will have to do
the translation in software.

That said, there are other reasons on Arm (and possibly x86) to get rid 
of the virtual address. At the moment, we are requiring the VA to be 
always valid. This is quite fragile as we can't fully control how the 
kernel is touching its page-table (remember that on Arm we need to use 
break-before-make to do any shattering).

I have actually seen in the past some failure during the translation on 
Arm32. But I never fully investigated it because they were hard to repro 
as they rarely happen.

> 
> Clearly to be able to run existing guests, we need to continue to support the
> present virtual address based interface.  Previously it was suggested to change
> the model on a per-domain basis, perhaps by a domain creation control.  This
> has two major shortcomings:
>   - Entire guest OSes would need to switch over to the new model all in one go.
>     This could be particularly problematic for in-guest interfaces like Linux'es
>     privcmd driver, which is passed hypercall argument from user space.  Such
>     necessarily use virtual addresses, and hence the kernel would need to learn
>     of all hypercalls legitimately coming in, in order to translate the buffer
>     addresses.  Reaching sufficient coverage there might take some time.
>   - All base components within an individual guest instance which might run in
>     succession (firmware, boot loader, kernel, kexec) would need to agree on the
>     hypercall ABI to use.
> 
> As an alternative I'd like to propose the introduction of a bit (or multiple
> ones, see below) augmenting the hypercall number, to control the flavor of the
> buffers used for every individual hypercall.  This would likely involve the
> introduction of a new hypercall page (or multiple ones if more than one bit is
> to be used), to retain the present abstraction where it is the hypervisor which
> actually fills these pages.  For multicalls the wrapping multicall itself would
> be controlled independently of the constituent hypercalls.
> 
> A model involving just a single bit to indicate "flat" buffers has limitations
> when it comes to large buffers passed to a hypercall.  Since in many cases
> hypercalls (currently) allowing for rather large buffers wouldn't normally be
> used with buffers significantly larger than a single page (several of the
> mem-ops for example), special casing the (presumably) few hypercalls which have
> an actual need for large buffers might be an option.
> 
> Another approach would be to build in a scatter/gather model for buffers right
> away.  Jürgen suggests that the low two address bits could be used as a
> "descriptor" here.

IIUC, with this approach we would still need to have a bit in the 
hypercall number to indicate this is not a virtual address. Is that correct?

Cheers,

-- 
Julien Grall

