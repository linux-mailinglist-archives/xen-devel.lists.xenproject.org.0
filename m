Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC474E60E3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 10:10:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294227.500173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXJTS-00021U-2S; Thu, 24 Mar 2022 09:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294227.500173; Thu, 24 Mar 2022 09:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXJTR-0001zR-VW; Thu, 24 Mar 2022 09:09:41 +0000
Received: by outflank-mailman (input) for mailman id 294227;
 Thu, 24 Mar 2022 09:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXJTQ-0001zL-FT
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 09:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXJTP-0008MV-UN; Thu, 24 Mar 2022 09:09:39 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.139.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXJTP-0002sp-Nk; Thu, 24 Mar 2022 09:09:39 +0000
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
	bh=XO0fxGIpZS0fMoc6Izajk8ggSVMpHvyqcqzPNLhr7gA=; b=SX6UwoUvOQqOS1Igej7JQERdMI
	ntAY5FWrSXYQXIksl77CjFNQnL9RWHCwqGRU8RjbTAW/K5ll6NqIF7pd8RvCbKv1hFjECyjXSgi+1
	t/jB0X3P1ctA+rn7GVwPXkSZgnvXDyczzE+X4+grUfWljq6wFl4T5qiHP0PSIx/YkOiQ=;
Message-ID: <3a32618d-2a34-bcac-1dfd-d41bbc54a550@xen.org>
Date: Thu, 24 Mar 2022 09:09:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v5 02/10] xen: move do_vcpu_op() to arch specific code
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220324081312.18222-1-jgross@suse.com>
 <20220324081312.18222-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220324081312.18222-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/03/2022 08:13, Juergen Gross wrote:
> The entry point used for the vcpu_op hypercall on Arm is different
> from the one on x86 today, as some of the common sub-ops are not
> supported on Arm. The Arm specific handler filters out the not
> supported sub-ops and then calls the common handler. This leads to the
> weird call hierarchy:
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
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

