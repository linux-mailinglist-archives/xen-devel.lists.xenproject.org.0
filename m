Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256577CBFC3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 11:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618168.961491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgc0-0003G9-9O; Tue, 17 Oct 2023 09:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618168.961491; Tue, 17 Oct 2023 09:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsgc0-0003Dt-6Y; Tue, 17 Oct 2023 09:43:40 +0000
Received: by outflank-mailman (input) for mailman id 618168;
 Tue, 17 Oct 2023 09:43:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tHSl=F7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsgbz-0003Dk-C6
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 09:43:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5b8047f-6cd1-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 11:43:38 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A04144EE0737;
 Tue, 17 Oct 2023 11:43:37 +0200 (CEST)
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
X-Inumbo-ID: a5b8047f-6cd1-11ee-98d4-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 11:43:37 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roberto Bagnara <roberto.bagnara@bugseng.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-next v2 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
In-Reply-To: <59692ac7-8b68-5913-8e51-0a68feb2a1bc@suse.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
 <6622a2ec7079f86b73ae420e1e840d3d35ffb3a0.1697123806.git.nicola.vetrini@bugseng.com>
 <f1f0fc3c-0eb2-81d6-132c-d6b2ed2d7308@suse.com>
 <d417da49a926fec385c95774035dc4cb@bugseng.com>
 <172b1f70-bffb-125f-3181-38ce5989daec@suse.com>
 <831edadc894659a79f7689dfe384ba97@bugseng.com>
 <59692ac7-8b68-5913-8e51-0a68feb2a1bc@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <b9177bf523d36df16b9fc3d116e0e89d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2023 10:26, Jan Beulich wrote:
> On 17.10.2023 10:12, Nicola Vetrini wrote:
>> On 17/10/2023 09:02, Jan Beulich wrote:
>>> On 16.10.2023 18:05, Nicola Vetrini wrote:
>>>> On 16/10/2023 17:45, Jan Beulich wrote:
>>>>> On 12.10.2023 17:28, Nicola Vetrini wrote:
>>>>>> The definition of MC_NCLASSES contained a violation of MISRA 
>>>>>> C:2012
>>>>>> Rule 10.1, therefore by moving it as an enumeration constant
>>>>>> resolves
>>>>>> the
>>>>>> violation and makes it more resilient to possible additions to 
>>>>>> that
>>>>>> enum.
>>>>> 
>>>>> And using an enumerator as array dimension specifier is okay for
>>>>> Misra?
>>>>> That would be odd when elsewhere named enums are treated specially.
>>>> 
>>>> Yes, the array subscript operator is one of the few places where an
>>>> enum
>>>> can be used as
>>>> an operand (also because negative values wouldn't compile), as 
>>>> opposed
>>>> to mixing them
>>>> with ordinary integers.
>>> 
>>> When saying "odd" I didn't even think of negative values. May I
>>> therefore
>>> ask for the reasoning of why this specific case is deemed non-risky? 
>>> To
>>> me there looks to be a fair risk of creating undersized arrays, 
>>> leading
>>> to out-of-bounds accesses.
>> 
>> Two reasons: MC_NCLASSES is the last value of the enum, and a pattern
>> I've spot in various
>> other places in Xen, so I assumed it was a fairly common pattern for 
>> the
>> community.
>> The other reason is that since the value of an enum constant can be
>> derived statically, there
>> is little risk of it being the wrong value, because no arithmetic is
>> done on it in its use
>> as an array's size (and besides, the enum changed the last time ~15
>> years ago, so I think
>> it's unlikely to change much in the near future).
> 
> You focus on the specific instance, yet my question was on the general
> principle.
> 
> Jan

A couple of reasons why this is allowed:
- associating values to set of symbols is typical and makes sense in 
some contexts
- out-of-bounds operations on arrays are dealt with by a host of other 
guidelines
   (Series 18, mainly)
- this rule is about which kinds of operands makes sense to use with 
certain operators.
   It was deemed unlikely by MISRA that risky behaviour may arise by 
using symbolic indices
   as subscripts, given the rest of the other guidelines and the 
unspecified and undefined
   associated with Rule 10.1. It's not impossible that problems will 
arise, but far less
   likely than using enums with no restrictions at all (such as those 
caused by an enum of
   and implementation-defined type used in an arithmetic operation, that 
could give
   unexpected results).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

