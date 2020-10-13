Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE428CC8C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 13:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6158.16258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIRr-00080k-ON; Tue, 13 Oct 2020 11:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6158.16258; Tue, 13 Oct 2020 11:26:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSIRr-00080N-L6; Tue, 13 Oct 2020 11:26:31 +0000
Received: by outflank-mailman (input) for mailman id 6158;
 Tue, 13 Oct 2020 11:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSIRq-00080I-1T
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:26:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa1e477f-fe02-4aab-ba8f-6668161e0707;
 Tue, 13 Oct 2020 11:26:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98BFFAE42;
 Tue, 13 Oct 2020 11:26:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSIRq-00080I-1T
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 11:26:30 +0000
X-Inumbo-ID: aa1e477f-fe02-4aab-ba8f-6668161e0707
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id aa1e477f-fe02-4aab-ba8f-6668161e0707;
	Tue, 13 Oct 2020 11:26:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602588388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw07yfL6az0UmJvBGC4MJOmiCkthwdIYWHMwsnc9tMo=;
	b=EjnVX6g87wKpgZ0PaA4s8WTHzYew4vBAYaVHXELpKNtd3Ltz9ZIVv5WhigTdyZN+FJ9+iB
	5f1xBtnysYO2j8AXuoTxmyuE8Nm/LtW92VM/fKp71bDtBS6YSy93ydSVhCeqWTpDijXCip
	2HBWsvbNw0rvGXwxAv5/VilB/xA0rbA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 98BFFAE42;
	Tue, 13 Oct 2020 11:26:28 +0000 (UTC)
Subject: Re: [PATCH v2 2/6] x86: reduce CET-SS related #ifdef-ary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
 <d8561c46-a6df-3f64-78df-f84c649a99b4@suse.com>
 <88bf4e8d-055f-dfc6-5090-c2628d383632@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bae57d19-b9dc-ae8c-5979-b269feb05428@suse.com>
Date: Tue, 13 Oct 2020 13:26:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <88bf4e8d-055f-dfc6-5090-c2628d383632@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.10.2020 13:20, Andrew Cooper wrote:
> On 28/09/2020 13:30, Jan Beulich wrote:
>> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
>> to introduce a number of #ifdef-s to make the build work with older tool
>> chains. Introduce an assembler macro covering for tool chains not
>> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
>> problem to be dropped again.
>>
>> No change to generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Now that I've done this I'm no longer sure which direction is better to
>> follow: On one hand this introduces dead code (even if just NOPs) into
>> CET-SS-disabled builds. Otoh this is a step towards breaking the tool
>> chain version dependency of the feature.
> 
> I've said before.  You cannot break the toolchain dependency without
> hardcoding memory operands.  I'm not prepared to let that happen.
> 
> There is no problem requiring newer toolchains for newer features
> (you're definitely not having CET-IBT, for example), and there is a
> (unacceptably, IMO) large cost to this work.

I'm aware of your view. What remains unclear to me is whether your
reply is merely a remark on this post-commit-message comment, or
whether it is an objection to the tidying (as I view it) the patch
does.

Jan

