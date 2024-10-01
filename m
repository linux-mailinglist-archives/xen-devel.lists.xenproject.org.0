Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD998B39F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 07:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807703.1219321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svVO9-0004O2-BG; Tue, 01 Oct 2024 05:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807703.1219321; Tue, 01 Oct 2024 05:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svVO9-0004LH-7G; Tue, 01 Oct 2024 05:25:33 +0000
Received: by outflank-mailman (input) for mailman id 807703;
 Tue, 01 Oct 2024 05:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6QT=Q5=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1svVO7-0004LB-FA
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 05:25:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91823bc6-7fb5-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 07:25:28 +0200 (CEST)
Received: from [192.168.1.219] (unknown [176.206.49.208])
 by support.bugseng.com (Postfix) with ESMTPSA id DB6034EE0744;
 Tue,  1 Oct 2024 07:25:26 +0200 (CEST)
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
X-Inumbo-ID: 91823bc6-7fb5-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1727760327; bh=54FFJV/NJX54G+G6luBnoK5AHBpf3668S/97M0l0ErQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JznBYWrhqlBRnfvlSFUc+d9EkUhjKHXZ4FglHFj6rs2YFD2Gb37+bdbYIHXMlwgxd
	 F4oeOfq4U1uq/gBNuQQLwVpiaaSBV1+CZzP3KjziRY7PH7VfClYd3aoLz2uyfBan0P
	 G4dJPNUDOMsd8XjTyg0IGR3xRIUKHkPieB680LReb7spzY2JQxIzBGe2yPMhIjBUSw
	 TwS/PuCCbEXGX8ZiFLlaBDfB8cFemhBZsYTBt4iJ6bNStju/YmdnjWg9lVJUo/4F7c
	 G/hVdr8s/7BpQM7zVfFFCrSrdsX4ZQ6kpdSjata4oKvFVSksaPUsWWeL4qXBIGtAKb
	 7oMe4QvWtLo4g==
Message-ID: <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
Date: Tue, 1 Oct 2024 07:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
To: Jan Beulich <jbeulich@suse.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-09-30 15:07, Jan Beulich wrote:
> On 30.09.2024 14:49, Federico Serafini wrote:
>> guest_handle_ok()'s expansion contains a sizeof() involving its
>> first argument which is guest_handle_cast().
>> The expansion of the latter, in turn, contains a variable
>> initialization.
>>
>> Since MISRA considers the initialization (even of a local variable)
>> a side effect, the chain of expansions mentioned above violates
>> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
>> contain any expression which has potential side effect).
> 
> I'm afraid I need to ask for clarification of terminology and alike here.
> While the Misra doc has a section on Persistent Side Effects in its
> Glossary appendix, what constitutes a side effect from its pov isn't
> really spelled out anywhere. Which in turn raises the question whether it
> is indeed Misra (and not just Eclair) which deems initialization a side
> effect. This is even more so relevant as 13.6 talks of only expressions,
> yet initializers fall under declarations (in turn involving an expression
> on the rhs of the equal sign).
> 
> All the same of course affects patch 2 then, too.

MISRA C leaves the definition of "side effect" to the C Standard.
E.g., C18 5.1.2.3p2:

   Accessing a volatile object, modifying an object, modifying a file,
   or calling a function that does any of those operations are all
   side effects,[omitted irrelevant footnote reference] which are
   changes in the state of the execution environment.

The MISRA C:2012/2023 Glossary entry for "Persistent side effect"
indirectly confirms that initialization is always a side effect.

Kind regards,

    Roberto

