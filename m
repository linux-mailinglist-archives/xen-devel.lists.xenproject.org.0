Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F376A906A04
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 12:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739781.1146730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhiN-0004kA-8I; Thu, 13 Jun 2024 10:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739781.1146730; Thu, 13 Jun 2024 10:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHhiN-0004iL-5I; Thu, 13 Jun 2024 10:29:55 +0000
Received: by outflank-mailman (input) for mailman id 739781;
 Thu, 13 Jun 2024 10:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+hf=NP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sHhiL-0004iF-ND
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 10:29:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de544c0f-296f-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 12:29:52 +0200 (CEST)
Received: from [172.20.10.8] (unknown [78.209.79.104])
 by support.bugseng.com (Postfix) with ESMTPSA id DBB024EE0756;
 Thu, 13 Jun 2024 12:29:50 +0200 (CEST)
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
X-Inumbo-ID: de544c0f-296f-11ef-90a3-e314d9c70b13
Message-ID: <0d9fa72c-11f1-4b34-931a-d9afbaa4b339@bugseng.com>
Date: Thu, 13 Jun 2024 12:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair: extend existing deviations of
 MISRA C:2012 Rule 16.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20c0779f2d749a682758defc06514772e97c9d89.1718260010.git.federico.serafini@bugseng.com>
 <cbd59b32-213b-4b5c-90fb-67906b7ae680@suse.com>
 <81332f64-9bd3-47bb-a6a5-adeecabf9730@bugseng.com>
 <1dd68917-090b-45ab-88a5-157a4afe0f6a@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <1dd68917-090b-45ab-88a5-157a4afe0f6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/24 12:03, Jan Beulich wrote:
> On 13.06.2024 11:02, Federico Serafini wrote:
>> On 13/06/24 10:16, Jan Beulich wrote:
>>> On 13.06.2024 08:38, Federico Serafini wrote:
>>>> +   * - R16.3
>>>> +     - Switch clauses ending with a do-while-false which, in turn, ends with an
>>>
>>> Maybe more precisely "the body of which"?
>>
>> Will do.
>>
>>>
>>>> +       allowed terminal statement are safe (e.g., PARSE_ERR_RET()).
>>>> +       Being ASSERT_UNREACHABLE() a construct that is effective in debug builds
>>>> +       only, it is not considered as an allowed terminal statement, despite its
>>>> +       definition.
>>>
>>> DYM despite its name? Its definition is what specifically renders it unsuitable
>>> for release builds.
>>
>> In debug builds, ASSERT_UNREACHABLE() expands to a do-while-false
>> the body of which ends with __builtin_unreachable() which is a builtin
>> marked as "noreturn" and thus considered as one of the "allowed
>> terminal statements".
>> As a result, ASSERT_UNREACHABLE() will be considered as an
>> "allowed terminal statement" as well, which is something we want to
>> avoid.
> 
> Hmm, then maybe add "there" at the end of the sentence, to refer back to
> "debug builds"?

Alright.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

