Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495DD7C012E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 18:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615112.956314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqFFX-0000dZ-DU; Tue, 10 Oct 2023 16:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615112.956314; Tue, 10 Oct 2023 16:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqFFX-0000aN-AF; Tue, 10 Oct 2023 16:06:23 +0000
Received: by outflank-mailman (input) for mailman id 615112;
 Tue, 10 Oct 2023 16:06:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c+X1=FY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqFFV-0000aH-Jp
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 16:06:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2d3b7ca-6786-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 18:06:19 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EB9F94EE0743;
 Tue, 10 Oct 2023 18:06:18 +0200 (CEST)
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
X-Inumbo-ID: f2d3b7ca-6786-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Tue, 10 Oct 2023 18:06:18 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH 9/9] xen/compat: address Rule 10.1 for macros
 CHECK_SIZE
In-Reply-To: <9ee8d16c-d34c-45c2-b5f7-53725bdc01c8@citrix.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <7edf60c0e7bd0680d8b8f8d3aec1264ee5a43878.1696514677.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310091749380.3431292@ubuntu-linux-20-04-desktop>
 <9ee8d16c-d34c-45c2-b5f7-53725bdc01c8@citrix.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b40d9faac462c21e91392017b81bc68c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2023 18:00, Andrew Cooper wrote:
> On 10/10/2023 9:02 am, Stefano Stabellini wrote:
>> On Fri, 6 Oct 2023, Nicola Vetrini wrote:
>>> The essential type of the result of an inequality operator is
>>> essentially boolean, therefore it shouldn't be used as an argument of
>>> the multiplication operator, which expects an integer.
>>> 
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>>  xen/include/xen/compat.h | 10 ++++++----
>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>> 
>>> diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
>>> index f2ce5bb3580a..5ffee6a9fed1 100644
>>> --- a/xen/include/xen/compat.h
>>> +++ b/xen/include/xen/compat.h
>>> @@ -151,12 +151,14 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
>>>      return x == c; \
>>>  }
>>> 
>>> +#define SIZE_NEQUAL(a, b) \
>>> +    (sizeof(a) != sizeof(b) ? 1 : 0)
>>>  #define CHECK_SIZE(name) \
>>> -    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) 
>>> != \
>>> -                                         sizeof(compat_ ## name ## 
>>> _t)) * 2]
>>> +    typedef int CHECK_NAME(name, S)[1 - (SIZE_NEQUAL(xen_ ## name ## 
>>> _t, \
>>> +                                                     compat_ ## name 
>>> ## _t)) * 2]
>>>  #define CHECK_SIZE_(k, n) \
>>> -    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
>>> -                                          sizeof(k compat_ ## n)) * 
>>> 2]
>>> +    typedef int CHECK_NAME_(k, n, S)[1 - (SIZE_NEQUAL(k xen_ ## n, \
>>> +                                                      k compat_ ## 
>>> n)) * 2]
>> I think this style is easier to read but I'll let the x86 maintainers
>> decide
>> 
>>     typedef int CHECK_NAME(name, S)[(sizeof(xen_ ## name ## _t) == \
>>                                      sizeof(compat_ ## name ## _t)) ? 
>> 1 : -1]
>> 
>> Also am I reading this correctly that we are using -1 as array index? 
>> I
>> must have made a calculation mistake?
> 
> This is a NIH BUILD_BUG_ON().  It should be rewritten as
> 
> BUILD_BUG_ON(sizeof(xen ...) != sizeof(compat ...));
> 
> which will use _Static_assert() in modern compilers.
> 
> ~Andrew

Ok, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

