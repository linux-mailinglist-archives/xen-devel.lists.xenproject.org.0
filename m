Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA090AE08
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 14:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742251.1149011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJBZO-0000xI-5N; Mon, 17 Jun 2024 12:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742251.1149011; Mon, 17 Jun 2024 12:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJBZO-0000v1-2p; Mon, 17 Jun 2024 12:34:46 +0000
Received: by outflank-mailman (input) for mailman id 742251;
 Mon, 17 Jun 2024 12:34:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YyRo=NT=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sJBZM-0000uv-ED
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 12:34:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7e595a2-2ca5-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 14:34:41 +0200 (CEST)
Received: from [10.176.134.52] (unknown [160.78.253.153])
 by support.bugseng.com (Postfix) with ESMTPSA id D36284EE0738;
 Mon, 17 Jun 2024 14:34:39 +0200 (CEST)
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
X-Inumbo-ID: f7e595a2-2ca5-11ef-b4bb-af5377834399
Message-ID: <cad05a5c-e2d8-4e5d-af05-30ae6f959184@bugseng.com>
Date: Mon, 17 Jun 2024 14:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: add explicit comment to identify notifier
 patterns
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <96a1b98d7831154c58d39b85071b9670de94aed0.1718617636.git.federico.serafini@bugseng.com>
 <058a6cc6-bf84-4140-a3fb-12ec648536b0@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <058a6cc6-bf84-4140-a3fb-12ec648536b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/06/24 12:03, Jan Beulich wrote:
> On 17.06.2024 11:49, Federico Serafini wrote:
>> MISRA C Rule 16.4 states that every `switch' statement shall have a
>> `default' label" and a statement or a comment prior to the
>> terminating break statement.
>>
>> This patch addresses some violations of the rule related to the
>> "notifier pattern": a frequently-used pattern whereby only a few values
>> are handled by the switch statement and nothing should be done for
>> others (nothing to do in the default case).
>>
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> I guess I shouldn't outright NAK this, but I certainly won't ack it. This
> is precisely the purely mechanical change that in earlier discussions some
> (including me) have indicated isn't going to help safety. However, if
> others want to ack something purely mechanical like this, then my minimal
> requirement would be that somewhere it is spelled out what falls under
> 
>> ---
>>   xen/arch/arm/cpuerrata.c            | 1 +
>>   xen/arch/arm/gic.c                  | 1 +
>>   xen/arch/arm/irq.c                  | 4 ++++
> 
> giv-v3-lpi.c has a similar instance, yet you don't adjust that. This may
> be because that possibly is the one where it was previously indicated that
> it may in fact be a mistake that the dying/dead case isn't handled, but
> then at the very least I'd have expected that you explicitly mention cases
> where the adjustment is (deliberately) not made.

I did the changes accordingly to the instruction in docs/misra/rules.rst
for Rule 16.4 and I touched only the files having an unjustified
violations of the rule.
The violation triggered by gic-v3-lpi.c is currently deviated with the
following justification: "A switch statement with a single switch clause
and no default label may be used in place of an equivalent if statement
if it is considered to improve readability."
However, I agree with you that also gic-v3.c should be consistent with
the other.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

