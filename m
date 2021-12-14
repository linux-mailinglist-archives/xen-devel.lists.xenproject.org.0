Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95952474928
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246979.425977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBUA-0002Wl-Gs; Tue, 14 Dec 2021 17:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246979.425977; Tue, 14 Dec 2021 17:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBUA-0002Td-Dp; Tue, 14 Dec 2021 17:21:06 +0000
Received: by outflank-mailman (input) for mailman id 246979;
 Tue, 14 Dec 2021 17:21:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBU9-0002TX-FK
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:21:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBU8-0004uT-7j; Tue, 14 Dec 2021 17:21:04 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBU8-0005ay-0z; Tue, 14 Dec 2021 17:21:04 +0000
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
	bh=tnYvMRimOZIN7460hREEVRJGGqHlnG04HoHpZv9+SPg=; b=IaANiDtAdUf59C4OZpBGZrQvcq
	prjPNK7cDpWFXHXDQHEJR4iUiVk1n4Ak/CxIQrTPhp4I6K8sFHleh8mDqfuv3zs4HqeEaBN+/rIbh
	uKlg3hbCorfxRr4yKPwj0mPUJeZS+DRh4UE/kG3s4oXTCyvEkUPKM+sLKCF+cth+7xMw=;
Message-ID: <1ce9aa8a-adc2-18cb-2c06-8a8a63c3b774@xen.org>
Date: Tue, 14 Dec 2021 17:21:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v3 01/13] xen: move do_vcpu_op() to arch specific code
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211208155606.20029-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/12/2021 15:55, Juergen Gross wrote:
> Today Arm is using another entry point for the vcpu_op hypercall as

NIT: The 'as' doesn't sound right here. Did you mean 'compare to'?

> x86, as some of the common sub-ops are not supported on Arm. The Arm
> specific handler filetrs out the not supported sub-ops and then calls

Typo: s/filetrs/filters/

> the common handler. This leads to the weird call hierarchy:
> 
>    do_arm_vcpu_op()
>      do_vcpu_op()
>        arch_do_vcpu_op()
> 
> Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
> arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
> of above calls can be avoided without restricting any potential
> future use of common sub-ops for Arm.
> 
> Additionally the single user of HYPERCALL_ARM() can be modified and
> HYPERCALL_ARM() can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

