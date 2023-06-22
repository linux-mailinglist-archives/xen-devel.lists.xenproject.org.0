Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56992739D5F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 11:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553450.864014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGhh-0004gt-3T; Thu, 22 Jun 2023 09:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553450.864014; Thu, 22 Jun 2023 09:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCGhh-0004eU-0k; Thu, 22 Jun 2023 09:34:13 +0000
Received: by outflank-mailman (input) for mailman id 553450;
 Thu, 22 Jun 2023 09:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J06O=CK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qCGhf-0004eO-HW
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 09:34:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0950c77-10df-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 11:34:09 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.37.206.199])
 by support.bugseng.com (Postfix) with ESMTPSA id E73E84EE0737;
 Thu, 22 Jun 2023 11:34:06 +0200 (CEST)
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
X-Inumbo-ID: f0950c77-10df-11ee-b237-6b7b168915f2
Message-ID: <7c04191b-62d2-6802-df77-e262d567cb7d@bugseng.com>
Date: Thu, 22 Jun 2023 11:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v3] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <db883456d7d210e2ea9ac4a7b402dda73c3ea8cd.1687421893.git.nicola.vetrini@bugseng.com>
 <a2cb3db9-50a6-f620-8001-1eac8586ad61@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <a2cb3db9-50a6-f620-8001-1eac8586ad61@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/06/23 10:56, Jan Beulich wrote:
> On 22.06.2023 10:24, Nicola Vetrini wrote:
>> --- a/xen/include/xen/lib.h
>> +++ b/xen/include/xen/lib.h
>> @@ -51,9 +51,10 @@
>>      e.g. in a structure initializer (or where-ever else comma expressions
>>      aren't permitted). */
>>   #define BUILD_BUG_ON_ZERO(cond) \
>> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
>> +    (sizeof(struct { char c; _Static_assert(!(cond), "!(" #cond ")"); }) & 0U)
>>   #else
>> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
>> +#define BUILD_BUG_ON_ZERO(cond) \
>> +    (sizeof(struct { unsigned u : (cond) ? -1 : 1; }) & 0U)
> 
> Given your remark on named bitfields not being allowed to be zero length
> (which hopefully holds universally, i.e. isn't subject to compiler
> extensions), how about
> 
> #define BUILD_BUG_ON_ZERO(cond) (sizeof(struct { int _:!(cond); }) & 0)

Well, the reason for the change is to drop any assumption on 
compiler-specific quirks that may arise (it would be a surprise if this 
wasn't the case, though)

> 
> ? (Implicitly, as said before, I question the value of the U suffixes here.
> Even better might be to make sure the expression is explicitly not of
> unsigned type, to avoid surprises if someone used ~BUILD_BUG_ON_ZERO()
> somewhere.)
> 
> Jan

The documentation for the macro definition states that the expression 
must have value 0 and type size_t when cond is false. If I understand 
correctly what you're saying here, then this is not allowed by the 
documentation.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

