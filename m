Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59DF74E7F9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 09:28:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561562.878011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ7mz-000200-8Q; Tue, 11 Jul 2023 07:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561562.878011; Tue, 11 Jul 2023 07:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ7mz-0001y7-52; Tue, 11 Jul 2023 07:28:01 +0000
Received: by outflank-mailman (input) for mailman id 561562;
 Tue, 11 Jul 2023 07:27:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJ7mx-0001y1-L3
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 07:27:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJ7ms-0007Mo-Qb; Tue, 11 Jul 2023 07:27:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJ7ms-0006PT-K2; Tue, 11 Jul 2023 07:27:54 +0000
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
	bh=boiCSDtKzeZhz1YSrweThGV4k4qKZI4njnOKBX/9ePw=; b=STET8AQt4U4eU5g08r2RspjwiF
	KGmvDZutGPDTaZSIDbSpr1L3UA01mx3TFt2171dXMEAquOQFuMVfcW5adtHFlxEnegeHnSic/M5tE
	ErJjDxS7+1MTVPqNxMeqrorpW+ztTvHzF8hhlOodRsM8u1ORgRZP5lQ9pcQkp/Z9wihI=;
Message-ID: <1c0ff25f-e3bd-e852-1836-c240d9273bc9@xen.org>
Date: Tue, 11 Jul 2023 08:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: Ping: [PATCH v2 0/2] new CONFIG_HAS_PIRQ and extra_guest_irqs
 adjustment
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <85e59fd5-9a06-48b4-ba7e-81865d44e332@suse.com>
 <e14fdd8e-692b-bb19-627a-0462cce45de5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e14fdd8e-692b-bb19-627a-0462cce45de5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/07/2023 08:33, Jan Beulich wrote:
> On 03.05.2023 17:31, Jan Beulich wrote:
>> The 1st patch (new in v2) has the effect of the 2nd one no longer
>> affecting Arm.
>>
>> 1: restrict concept of pIRQ to x86
>> 2: cmdline: document and enforce "extra_guest_irqs" upper bounds
> 
> REST- and Arm-maintainers,
> 
> may I please ask for some feedback here? Roger did supply some, resulting
> in me considering to revert back to the earlier version (i.e. patch 1
> dropped again and patch 2 minimally adjusted to address feedback there),
> but which route to go wants input from other maintainers. What I think is
> unacceptable is that we continue to not document and enforce the upper
> bound, leading to people needlessly running into issues on big enough
> systems.

I looked at patch #1, I think this the right approach for Arm. Do you 
need further input?

Cheers,

-- 
Julien Grall

