Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D20EA57390
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 22:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905383.1313237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqfBE-0006wd-OV; Fri, 07 Mar 2025 21:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905383.1313237; Fri, 07 Mar 2025 21:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqfBE-0006vA-Ln; Fri, 07 Mar 2025 21:24:28 +0000
Received: by outflank-mailman (input) for mailman id 905383;
 Fri, 07 Mar 2025 21:24:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqfBC-0006uz-SE
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 21:24:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqfBC-0079sp-2E;
 Fri, 07 Mar 2025 21:24:26 +0000
Received: from [2a02:8012:3a1:0:5057:2808:1e53:9bd7]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqfBC-00D9Nj-0j;
 Fri, 07 Mar 2025 21:24:26 +0000
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
	bh=oNme71YGqOUbSAVXsT2MrRmE1ZrdbBnkJbKNACGYj2A=; b=2wqMJhjPivrKbJR68MuHlXWMwK
	TxvPDY0Yhfi6EckK6LBLPMEI+UwOKpjW3FCmJ4MnjzHyNb5BpeNZ8h23a+piVydbzxRNqTmEF/1yW
	T6xPa/c5ItP51bGkz0sCM8H2R1mU63EDNUOS1btY89JMUOXySDusDkzqKl2akXUQLJnI=;
Message-ID: <4c66ad14-9a30-48e5-aae1-49f61efaaf67@xen.org>
Date: Fri, 7 Mar 2025 21:24:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250306220343.203047-9-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/03/2025 22:03, Jason Andryuk wrote:
> With a split hardware and control domain, the control domain may still
> want and xenstore access.  Currently this relies on init-dom0less to
> seed the grants.  This is problematic since we don't want hardware
> domain to be able to map the control domain's resources.  Instead have
> the hypervisor see the grant table entry.  The grant is then accessible
> as normal.

I am probably missing something, but why would run xenstored in the 
hardware domain rather than the control domain? Isn't xenstored more 
related to the VM management than HW?

Cheers,

-- 
Julien Grall


