Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE86810EBD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 11:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653847.1020508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMiB-0004vq-39; Wed, 13 Dec 2023 10:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653847.1020508; Wed, 13 Dec 2023 10:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDMiA-0004tP-Vy; Wed, 13 Dec 2023 10:43:30 +0000
Received: by outflank-mailman (input) for mailman id 653847;
 Wed, 13 Dec 2023 10:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw9L=HY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDMi9-0004s2-2L
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 10:43:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72477514-99a4-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 11:43:26 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5FAB84EE0737;
 Wed, 13 Dec 2023 11:43:26 +0100 (CET)
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
X-Inumbo-ID: 72477514-99a4-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Wed, 13 Dec 2023 11:43:26 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn?=
 =?UTF-8?Q?=C3=A9?= <roger.pau@citrix.com>, consulting@bugseng.com, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/7] x86/platform: removed break to address MISRA
 C:2012 Rule 2.1
In-Reply-To: <a8c42909-6316-448b-8d21-628d055abfbc@suse.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <b1103bc13d5ce04159417592705b4fe6a6db748b.1702283415.git.nicola.vetrini@bugseng.com>
 <a8c42909-6316-448b-8d21-628d055abfbc@suse.com>
Message-ID: <5a5db7d32c91658f80bf7d2991023a30@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-12 11:13, Jan Beulich wrote:
> On 11.12.2023 11:30, Nicola Vetrini wrote:
>> The break statement is redundant, hence it can be removed.
> 
> Except ...
> 
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -723,7 +723,6 @@ ret_t do_platform_op(
>> 
>>          ret = continue_hypercall_on_cpu(
>>              0, cpu_down_helper, (void *)(unsigned long)cpu);
>> -        break;
>>      }
>>      break;
> 
> ... it wants to be the other break that is removed, imo. Andrew, Roger,
> what do you think? There are many such (again: imo) oddly placed 
> break-s
> in that switch() ... In some cases there are also inner scopes without
> there being new local variables in there. IOW imo throughout this
> switch()
> - pointless inner scopes want dropping,
> - all "main" break-s want to have the same indentation.
> 
> Jan

Ok. I'm not particularly keen on doing a full style cleanup; I can drop 
the other break, for the sake of resolving the MISRA violation, so that 
the cleanup can happen anytime.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

