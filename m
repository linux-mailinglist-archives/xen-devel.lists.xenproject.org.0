Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE8854843
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680594.1058595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDQU-0008Hx-7M; Wed, 14 Feb 2024 11:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680594.1058595; Wed, 14 Feb 2024 11:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDQU-0008GQ-4H; Wed, 14 Feb 2024 11:27:42 +0000
Received: by outflank-mailman (input) for mailman id 680594;
 Wed, 14 Feb 2024 11:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3HRx=JX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1raDQS-0007mb-KI
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:27:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1c83a9-cb2c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 12:27:39 +0100 (CET)
Received: from [172.20.10.2] (unknown [37.163.90.143])
 by support.bugseng.com (Postfix) with ESMTPSA id 4B8374EE0738;
 Wed, 14 Feb 2024 12:27:37 +0100 (CET)
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
X-Inumbo-ID: 0f1c83a9-cb2c-11ee-98f5-efadbce2ee36
Message-ID: <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
Date: Wed, 14 Feb 2024 12:27:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, roberto.bagnara@bugseng.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrannd.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
 <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/24 09:28, Jan Beulich wrote:
> On 13.02.2024 23:33, Stefano Stabellini wrote:
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> ---
>>   docs/misra/rules.rst | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>> index c185366966..931158b354 100644
>> --- a/docs/misra/rules.rst
>> +++ b/docs/misra/rules.rst
>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>          headers (xen/include/public/) are allowed to retain longer
>>          identifiers for backward compatibility.
>>   
>> +   * - `Rule 5.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>> +     - Required
>> +     - Identifiers shall be distinct from macro names
>> +     - Clashes between function-like macros and non-callable entities
>> +       are allowed. The pattern #define x x is also allowed.
> 
> Just for me to know what exactly is covered (hence also a question
> to Roberto as to [to be] implemented Eclair behavior): Even when
> the above would be sufficient (and imo better) people frequently
> write
> 
> #define a(x, y) b(x, y)
> 
> which, transformed to the specific case here, would then be
> 
> #define a(x, y) a(x, y)
> 
> I'd assume such ought to also be covered, but that's not clear
> from the spelling above.

I list what happens in some different situations,
then we can find the right words for the documentation and/or
refine the configuration:

If you
#define x x
and then use `x' as identifier,
the resulting violation is deviated (allowed pattern).

If you
#define a(x, y) a(x, y)
and then use `a' as identifier for a non-callable entity,
the resulting violation is deviated (no clash with non-callable
entities).
If you use identifier `a' for a callable entity, the resulting violation
is reported: the allowed pattern covers only macros expanding to their
own name, in this case the macro name is considered to be
`a' only, not a(x, y).

If you
#define a(x, y) b(x, y)
and then use `a' as identifier for a non-callable entity,
the resulting violation is deviated (no clash with non-callable
entities).
If you use `a' as identifier for a callable entity,
this is not a violation because after the preprocessing phase,
identifier `a' no longer exists.

As far as I know, this is what was agreed upon in one of the recent
MISRA meetings.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

