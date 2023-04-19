Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41E6E7CDB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523533.813664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8ur-0007Rt-9W; Wed, 19 Apr 2023 14:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523533.813664; Wed, 19 Apr 2023 14:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8ur-0007PR-6e; Wed, 19 Apr 2023 14:36:13 +0000
Received: by outflank-mailman (input) for mailman id 523533;
 Wed, 19 Apr 2023 14:36:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pp8uq-0007PL-3W
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:36:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp8up-0007KU-IG; Wed, 19 Apr 2023 14:36:11 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp8up-0000sK-Ak; Wed, 19 Apr 2023 14:36:11 +0000
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
	bh=Ya2xh48fL0W2mtUddvUGYN9g8EKkLWyBHqJGJGejEdE=; b=MJ+ulhP2i8dtXIFiTNecNW236b
	redCzOWXYcUdMsedKhtFEC9k+jE2L6/KxdQGsai0ndAQKq1eEk+wRN5//rvfp7ck2mvkgUkK4Vj0n
	hop5C2ecmosT8issExNvk1rcI6tFAz+5kXI6Wa2QT86+FArg/OMeqR5sCl+1XBp+XzZw=;
Message-ID: <ad321af4-574b-6133-9f10-1d41d4b544f0@xen.org>
Date: Wed, 19 Apr 2023 15:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
 <752ce1ba-8c23-e397-3f6a-15c93ac6cee0@xen.org>
 <5915f963-97d9-19f3-e797-3fd02b6fb406@amd.com>
 <fcb46556-c729-df8a-1db1-820f7400e429@xen.org>
 <0a1246d2-092a-2767-4c1e-0db4ddf71013@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0a1246d2-092a-2767-4c1e-0db4ddf71013@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/04/2023 15:29, Michal Orzel wrote:
>> I am not in favor of changing of the CODING_STYLE and I thought I would
>> express it right now to spare the round-trip of writing a patch.
> Sure thing :)
> So, all in all, we agree that SPDX comment must be a single line comment on its own
> (which is also stated in our CODING_STYLE) and not like it was placed in this patch, right?

Correct.

Cheers,

-- 
Julien Grall

