Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43509351098
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104135.198811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsNm-0001oh-3m; Thu, 01 Apr 2021 08:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104135.198811; Thu, 01 Apr 2021 08:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsNl-0001oH-Vf; Thu, 01 Apr 2021 08:08:49 +0000
Received: by outflank-mailman (input) for mailman id 104135;
 Thu, 01 Apr 2021 08:08:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsNj-0001oC-V8
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:08:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fccfb449-61ac-41b7-8c55-206b68946616;
 Thu, 01 Apr 2021 08:08:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49277B06A;
 Thu,  1 Apr 2021 08:08:46 +0000 (UTC)
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
X-Inumbo-ID: fccfb449-61ac-41b7-8c55-206b68946616
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617264526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxipyp9rt3pRxcGI+J9L6VZB7lZCIV/pDMRlARWLStQ=;
	b=A7KGEJUKSoKxX/JVRTQeIWWzA9m2aWowhXYJqxAefA8kAFHgjlDD7+nbWsxi7c9xslJGE7
	Hm4CiHGogrTY0N2SdLgM78xm6yuqVO4Yq/iM3A/6Ea+483GljePWKq9yiKfm3b36pG9bh0
	If+51CXjfonExerjZjB92G2IeL/1qpc=
Subject: Ping: [PATCH] libxg: don't use max policy in xc_cpuid_xend_policy()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
 <20201106155839.vnhdqcptbpkbzfly@liuwe-devbox-debian-v2>
 <bab94d0a-89e8-18d8-9098-e30781c3a2e9@suse.com>
Message-ID: <44e9cf2e-e90a-12bd-59bf-3c8389ac0862@suse.com>
Date: Thu, 1 Apr 2021 10:08:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bab94d0a-89e8-18d8-9098-e30781c3a2e9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.11.2020 14:58, Jan Beulich wrote:
> On 06.11.2020 16:58, Wei Liu wrote:
>> On Thu, Nov 05, 2020 at 04:56:53PM +0100, Jan Beulich wrote:
>>> Using max undermines the separation between default and max. For example,
>>> turning off AVX512F on an MPX-capable system silently turns on MPX,
>>> despite this not being part of the default policy anymore. Since the
>>> information is used only for determining what to convert 'x' to (but not
>>> to e.g. validate '1' settings), the effect of this change is identical
>>> for guests with (suitable) "cpuid=" settings to that of the changes
>>> separating default from max and then converting (e.g.) MPX from being
>>> part of default to only being part of max for guests without (affected)
>>> "cpuid=" settings.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> I will defer this to Andrew.
> 
> Andrew?

Yet another one (here having been pending for nearly 5 months), and hence
same thing (despite again not feeling well, albeit iirc at the time we
discussed this on irc and you looked to be basically agreeing): I intend
to commit this once the tree is fully open again, unless I hear otherwise.

Jan

