Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C56AF6DB2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031847.1405590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFgV-0003i5-TO; Thu, 03 Jul 2025 08:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031847.1405590; Thu, 03 Jul 2025 08:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFgV-0003fW-QT; Thu, 03 Jul 2025 08:52:47 +0000
Received: by outflank-mailman (input) for mailman id 1031847;
 Thu, 03 Jul 2025 08:52:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uXFgU-0003fQ-49
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:52:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uXFgO-00GK6U-1Z;
 Thu, 03 Jul 2025 08:52:40 +0000
Received: from [2a00:23ee:2988:5cd:6cf5:e82:f131:ba77]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uXFgO-00AuOv-0h;
 Thu, 03 Jul 2025 08:52:40 +0000
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
	bh=a2VnxTlYPNcpP1UDeo6woRHX3H2FrW/DFEw6z3wbqJI=; b=CJYMJzCthZT8BatuEOcVBEx8Wi
	wjDZInYhYefYsncXEfNtIBCXdhvtR1A7P61+DK+Sx7sWFfXaHOzB7NUMssPnm10cUUZIsKoZuJ+ja
	xlExPXR+ZxymENLxa36PgiZHOIwVYhW0aKfNvyI/HrCY4I6peZeOjNyTfABOnd06PgK8=;
Message-ID: <079ead0e-e613-4c58-89f4-8a0df1294ba9@xen.org>
Date: Thu, 3 Jul 2025 09:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
 <d6ac150c-b2c0-4d90-af1e-64f2df151e60@xen.org>
 <5e52900c-97fb-4895-bde5-33ccfb132986@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <5e52900c-97fb-4895-bde5-33ccfb132986@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/07/2025 14:37, Jan Beulich wrote:
> On 02.07.2025 15:18, Julien Grall wrote:
>> On 02/07/2025 14:06, Jan Beulich wrote:
>>> When the bumping by <nr> (instead of just 1) was introduced, a comment
>>> was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
>>> code path can in principle be taken (depending on configuration coming
>>> from the outside), and we shouldn't assert anything we didn't check
>>> elsewhere.
>>
>> I suggested to add the ASSERT_UNREACHABLE (see [1]). My take is the
>> overflow is not something that should happen and it is good to be able
>> to catch very clearly in debug build.
> 
> But catching an anomalous entry in DT (which aiui the values come from,
> even if perhaps indirectly) isn't going to depend on people using debug
> builds. It depends on what DT blobs they use. And issues there shouldn't
> be checked by assertions, as those blobs live outside of Xen.

I agree we probably want check upfront. But I still don't think we want 
to remove this ASSERT_UNREACHABLE().

By the way, I am not asking you to add those checks.

Cheers,

-- 
Julien Grall


