Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97E8AF2BD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710881.1110411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIRG-0007vk-HG; Tue, 23 Apr 2024 15:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710881.1110411; Tue, 23 Apr 2024 15:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzIRG-0007tX-EL; Tue, 23 Apr 2024 15:52:10 +0000
Received: by outflank-mailman (input) for mailman id 710881;
 Tue, 23 Apr 2024 15:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=is0t=L4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzIRF-0007s2-Kw
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:52:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7090afe6-0189-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:52:08 +0200 (CEST)
Received: from [192.168.1.11] (host-79-60-221-62.business.telecomitalia.it
 [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 986974EE073C;
 Tue, 23 Apr 2024 17:52:07 +0200 (CEST)
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
X-Inumbo-ID: 7090afe6-0189-11ef-909a-e314d9c70b13
Message-ID: <11b8bbbd-1e22-4eb9-b571-cdd5d2661dfc@bugseng.com>
Date: Tue, 23 Apr 2024 17:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4981c3fb0992898a121881333485004f3609eaf7.1713866519.git.federico.serafini@bugseng.com>
 <17c022d9-245b-449f-96c5-7a29ba782880@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <17c022d9-245b-449f-96c5-7a29ba782880@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/24 12:26, Jan Beulich wrote:
> On 23.04.2024 12:02, Federico Serafini wrote:
>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -302,6 +302,19 @@ Deviations related to MISRA C:2012 Rules:
>>          leave such files as is.
>>        - Tagged as `deliberate` for ECLAIR.
>>   
>> +   * - R16.4
>> +     - Switch statements having a controlling expression of enum type
>> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
>> +       which warns (and breaks the build as we use -Werror) if one of the enum
>> +       labels is missing from the switch.
>> +     - Tagged as `deliberate` for ECLAIR.
>> +
>> +   * - R16.4
>> +     - A switch statement with a single switch clause and no default label may
>> +       be used in place of an equivalent if statement if it is considered to
>> +       improve readability."

(I placed Rule 16.4 before Rule 16.3.
I will propose a new version with the correct ordering.)

> 
> First a terminology related comment here: I'm afraid "switch clause" can be
> interpreted multiple ways, when I think we want to leave no room for
> interpretation here. It's not even clear to me whether
> 
>      switch ( x )
>      {
>      case 1: case 2: case 3: case 4:
>          ...
>          break;
>      }
> 
> would be covered by the deviation, or whether the multiple case labels
> wouldn't already be too much.

The MISRA C document, within Rule 16.1 ("A switch statement shall be
well-formed") defines the syntax rules that can be used to define a
"well formed" switch statement.
When I say "switch clause", I refer to the same entity the MISRA
document refers to in the definition of such syntax rules.
In the example above, we have a single switch clause with multiple
labels and no default label: this is a violation of Rule 16.4
("Every `switch' statement shall have a `default' label") which will
be covered by the deviation.
Do you think inserting the example in rules.rst or deviations.rst could
be useful?

> 
> And then it is not clear to me why
> 
>      switch ( x )
>      {
>      case 1:
>          ...
>          break;
>      default:
>          ...
>          break;
>      }
> 
> shouldn't also be covered, as potentially a readability improvement /
> future change simplification over
> 
>      if ( x == 1 )
>      {
>          ...
>      }
>      else
>      {
>          ...
>      }

Here there are two switch clauses,
each of them terminated by a break statement,
and the default label is present:
the switch is well formed, no violations of series 16 will
be reported.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

