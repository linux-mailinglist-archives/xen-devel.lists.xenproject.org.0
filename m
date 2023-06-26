Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C873E22C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 16:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555561.867434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDnGL-0004TY-76; Mon, 26 Jun 2023 14:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555561.867434; Mon, 26 Jun 2023 14:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDnGL-0004Rs-49; Mon, 26 Jun 2023 14:32:17 +0000
Received: by outflank-mailman (input) for mailman id 555561;
 Mon, 26 Jun 2023 14:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpUb=CO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qDnGJ-0004Rm-OH
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 14:32:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e39ef0a-142e-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 16:32:14 +0200 (CEST)
Received: from [192.168.1.198] (unknown [151.35.129.1])
 by support.bugseng.com (Postfix) with ESMTPSA id A575A4EE0738;
 Mon, 26 Jun 2023 16:32:11 +0200 (CEST)
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
X-Inumbo-ID: 3e39ef0a-142e-11ee-b237-6b7b168915f2
Message-ID: <deacc01b-184f-cfda-46ca-a4b5eae0d9d3@bugseng.com>
Date: Mon, 26 Jun 2023 16:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v4] xen/include: avoid using a compiler extension for
 BUILD_BUG_ON_ZERO.
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <4ab190bd0d80898311aa9f1e912f18e7cdef2762.1687510380.git.nicola.vetrini@bugseng.com>
 <f099efe2-e318-a40d-5254-e9c1e87578e6@suse.com>
 <63d48b43-8ce9-3df6-1407-17c2af734828@xen.org>
 <eb629e26-0673-725c-c02f-3d5300c2c406@suse.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <eb629e26-0673-725c-c02f-3d5300c2c406@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/23 09:32, Jan Beulich wrote:
> On 24.06.2023 09:11, Julien Grall wrote:
>> On 23/06/2023 18:16, Jan Beulich wrote:
>>> I'm not happy to, with the continued use of the
>>> two U suffixes. It may seem minor, but to me it feels like setting a
>>> bad precedent.
>>
>> I wasn't able to find the reasoning behind your objections in the
>> archive. I would like to understand your concern before providing any
>> ack. Would you be able to give a pointer?
> 
> I appreciate the Misra-invoked desire to add U suffixes where
> otherwise (visual) ambiguities may exist. But on numbers like
> 0 or 1, and when use of e.g. resulting #define-s doesn't require
> the constants to be of unsigned type, I view such suffixes purely
> as clutter. In the specific case I might go as far as questioning
> why, when U is added, L isn't added as well, to "support" the
> size_t result aspect also from the "width of type" perspective.
> 
> Jan

I will purge the 'U's in a v5 (and correct the wrong commit message as 
well), since they are not necessary for this patch.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

