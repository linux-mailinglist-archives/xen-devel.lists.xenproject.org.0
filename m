Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A477E57FC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 14:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629281.981362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ibX-00044u-KO; Wed, 08 Nov 2023 13:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629281.981362; Wed, 08 Nov 2023 13:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0ibX-00042u-Hj; Wed, 08 Nov 2023 13:28:23 +0000
Received: by outflank-mailman (input) for mailman id 629281;
 Wed, 08 Nov 2023 13:28:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7seD=GV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0ibW-00042o-5j
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 13:28:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aedcc491-7e3a-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 14:28:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E21E64EE0737;
 Wed,  8 Nov 2023 14:28:19 +0100 (CET)
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
X-Inumbo-ID: aedcc491-7e3a-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 14:28:19 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
 <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
 <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
Message-ID: <4a58abb52afed75a748440f1adf9a2ac@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-08 12:19, Jan Beulich wrote:
> On 08.11.2023 12:03, Nicola Vetrini wrote:
>> On 2023-11-08 09:24, Jan Beulich wrote:
>>> On 03.11.2023 18:58, Nicola Vetrini wrote:
>>>> Static analysis tools may detect a possible null
>>>> pointer dereference at line 760 (the memcpy call)
>>>> of xen/common/domain.c. This ASSERT helps them in
>>>> detecting that such a condition is not possible
>>>> and also provides a basic sanity check.
>>> 
>>> I disagree with this being a possible justification for adding such a
>>> redundant assertion. More detail is needed on what is actually
>>> (suspected to be) confusing the tool. Plus it also needs explaining
>>> why (a) adding such an assertion helps and (b) how that's going to
>>> cover release builds.
>>> 
>> 
>> How about:
>> "Static analysis tools may detect a possible null pointer dereference
>> at line 760 (config->handle) due to config possibly being NULL.
>> 
>> However, given that all system domains, including IDLE, have a NULL
>> config and in the code path leading to the assertion only real domains
>> (which have a non-NULL config) can be present."
>> 
>> On point b): this finding is a false positive, therefore even if the
>> ASSERT is
>> expanded to effectively a no-op, there is no inherent problem with 
>> Xen's
>> code.
>> The context in which the patch was suggested [1] hinted at avoiding
>> inserting in
>> the codebase false positive comments.
> 
> Which I largely agree with. What I don't agree with is adding an
> assertion which is only papering over the issue, and only in debug
> builds. So perhaps instead we need a different way of tracking
> false positives (which need to be tied to specific checker versions
> anyway).
> 

Hmm. Is it better in your opinion to write something like:

if (config == NULL)
    return ERR_PTR(<some error code>); // or die() or something 
appropriate

this would be a rudimentary handling of the error with some messages 
detailing that something
is wrong if a domain has a null config at that point.

To be clear: I'm fine with every way of deviating the construct, but 
agreeing on an
alternate mechanism to SAF-x-false-positive would land later than 
implementing some form
of error handling, I think.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

