Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD697CBD35
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 10:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618117.961401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfG7-0005yv-33; Tue, 17 Oct 2023 08:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618117.961401; Tue, 17 Oct 2023 08:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsfG6-0005wK-Vl; Tue, 17 Oct 2023 08:16:58 +0000
Received: by outflank-mailman (input) for mailman id 618117;
 Tue, 17 Oct 2023 08:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHSl=F7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsfG5-0005mo-PG
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 08:16:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c6f4b8-6cc5-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 10:16:57 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E464B4EE0737;
 Tue, 17 Oct 2023 10:16:56 +0200 (CEST)
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
X-Inumbo-ID: 89c6f4b8-6cc5-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 10:16:56 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2 1/1] xen: introduce a deviation for Rule
 11.9
In-Reply-To: <b2048df4-ec76-f91f-1f17-fcd45f295281@suse.com>
References: <cover.1696948320.git.nicola.vetrini@bugseng.com>
 <c684c36402e6740472fa91d73436ca5790e5e109.1696948320.git.nicola.vetrini@bugseng.com>
 <7be93272-dc82-06e0-726d-030d33aee5e1@suse.com>
 <66e27d108e856fcf69f78652daae6447@bugseng.com>
 <b2048df4-ec76-f91f-1f17-fcd45f295281@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <c08559530413426ea7d06bc0921f2d85@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2023 08:51, Jan Beulich wrote:
> On 16.10.2023 18:49, Nicola Vetrini wrote:
>> On 16/10/2023 15:43, Jan Beulich wrote:
>>> On 11.10.2023 14:46, Nicola Vetrini wrote:
>>>> --- a/xen/include/xen/compiler.h
>>>> +++ b/xen/include/xen/compiler.h
>>>> @@ -109,13 +109,16 @@
>>>> 
>>>>  #define offsetof(a,b) __builtin_offsetof(a,b)
>>>> 
>>>> +/* Access the field of structure type, without defining a local
>>>> variable */
>>>> +#define access_field(type, member) (((type *)NULL)->member)
>>> 
>>> This is not a field access, so I consider the macro misnamed. 
>>> Question
>>> is
>>> whether such a helper macro is needed in the first place.
>>> 
>>>> +#define typeof_field(type, member) typeof(access_field(type, 
>>>> member))
>>> 
>>> If this needs adding, it wants to come ...
>>> 
>>>>  /**
>>>>   * sizeof_field(TYPE, MEMBER)
>>>>   *
>>>>   * @TYPE: The structure containing the field of interest
>>>>   * @MEMBER: The field to return the size of
>>>>   */
>>>> -#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
>>>> +#define sizeof_field(TYPE, MEMBER) sizeof(access_field(TYPE, 
>>>> MEMBER))
>>> 
>>> ... with a commend similar as this one has. (Or the commend could be
>>> slightly altered to cover both).
>>> 
>> 
>> I added access_field since it's possibly useful on its own in the
>> future,
>> but that may not be the case. Not a real field access, perhaps a
>> fake_access_field?
> 
> I don't like this either, I'm afraid: This isn't a fake access. Maybe
> field_of() or field_of_type()? Yet at this point I'd still prefer for
> this to not be a separate macro in the first place.
> 
> Jan

Ok, no problem.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

