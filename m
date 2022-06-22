Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17686554A5C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 14:56:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353852.580847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ztu-0004Ir-Sa; Wed, 22 Jun 2022 12:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353852.580847; Wed, 22 Jun 2022 12:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ztu-0004FQ-P3; Wed, 22 Jun 2022 12:56:06 +0000
Received: by outflank-mailman (input) for mailman id 353852;
 Wed, 22 Jun 2022 12:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4/ZK=W5=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3zts-0004FK-KH
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 12:56:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id abe18e63-f22a-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 14:56:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F71613D5;
 Wed, 22 Jun 2022 05:56:02 -0700 (PDT)
Received: from [10.57.38.102] (unknown [10.57.38.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77BC83F534;
 Wed, 22 Jun 2022 05:55:59 -0700 (PDT)
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
X-Inumbo-ID: abe18e63-f22a-11ec-b725-ed86ccbb4733
Message-ID: <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
Date: Wed, 22 Jun 2022 14:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22.06.2022 12:25, Jan Beulich wrote:
> On 20.06.2022 09:02, Michal Orzel wrote:
>> This series fixes all the findings for MISRA C 2012 8.1 rule, reported by
>> cppcheck 2.7 with misra addon, for Arm (arm32/arm64 - target allyesconfig).
>> Fixing this rule comes down to replacing implicit 'unsigned' with explicit
>> 'unsigned int' type as there are no other violations being part of that rule
>> in the Xen codebase.
> 
> I'm puzzled, I have to admit. While I agree with all the examples in the
> doc, I notice that there's no instance of "signed" or "unsigned" there.
> Which matches my understanding that "unsigned" and "signed" on their own
> (just like "long") are proper types, and hence the omission of "int"
> there is not an "omission of an explicit type".
> 
Cppcheck was choosed as a tool for MISRA checking and it is considering it as a violation.
It treats unsigned as an implicit type. You can see this flag in cppcheck source code:

"fIsImplicitInt          = (1U << 31),   // Is "int" token implicitly added?"

> Nevertheless I think we have had the intention to use "unsigned int"
> everywhere, but simply for cosmetic / style reasons (while I didn't ever
> see anyone request the use of "long int" in place of "long", despite it
> also being possible to combine with "double"), so I'm happy to see this
> being changed. Just that (for now) I don't buy the justification.
> 
> Jan

Cheers,
Michal

