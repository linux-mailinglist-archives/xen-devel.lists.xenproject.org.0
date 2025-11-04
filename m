Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD4C30923
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 11:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155649.1485091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEYJ-0007T4-SB; Tue, 04 Nov 2025 10:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155649.1485091; Tue, 04 Nov 2025 10:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEYJ-0007Rd-PM; Tue, 04 Nov 2025 10:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1155649;
 Tue, 04 Nov 2025 10:46:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGEYI-0007RI-5V
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:46:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEYH-000m9x-0d;
 Tue, 04 Nov 2025 10:46:13 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEYH-00B4Rx-0o;
 Tue, 04 Nov 2025 10:46:13 +0000
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
	bh=m4d65BzOjjw23PnfyKNRcSMNDlBgZqZ/9Q0lDxpIUBc=; b=NYmx0NUPhV4F0PUGmnikHLlY2H
	m21WiVrGHxt7ilTfoWLtUUxONt+NbBvj5/OHxGtdJu8uzI0ALN/VVSu642Valx5QmOTnNneWWZzwI
	58Y+X42/HIlVP9Pb9C4/WgB1OmJk/+gv3s3OwkRE2obTdkgghUIFS5xzhPKQzkYUtJyc=;
Message-ID: <b2b32858-180e-4e8a-97d7-59a272c13d0a@xen.org>
Date: Tue, 4 Nov 2025 10:46:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: adjust soft-reset arch dependency
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c9c8c9c6-a155-4986-bf77-5766cdcd6024@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/10/2025 12:10, Jan Beulich wrote:
> Arm's arch_domain_soft_reset() returning -ENOSYS is quite unhelpful: This
> way a domain will be crashed if a tool stack mistakenly invokes
> XEN_DOMCTL_soft_reset on it. Instead the tool stack should be told of its
> mistake.
> 
> Introduce HAS_SOFT_RESET, implied only by x86. "imply" rather than
> "select" such that HAS_SOFT_RESET can later gain a dependency on
> MGMT_HYPERCALLS. That way HAS_SOFT_RESET will go off when
> MGMT_HYPERCALLS is off.
> 
> Check the new setting early in domctl handling, and compile out the thus
> dead (when HAS_SOFT_RESET=n) domain_soft_reset() as well as its dedicated
> helpers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien GralL <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


