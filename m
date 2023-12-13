Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A330381151D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 15:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654072.1020713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQTe-0000Y6-BE; Wed, 13 Dec 2023 14:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654072.1020713; Wed, 13 Dec 2023 14:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDQTe-0000VL-8U; Wed, 13 Dec 2023 14:44:46 +0000
Received: by outflank-mailman (input) for mailman id 654072;
 Wed, 13 Dec 2023 14:44:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw9L=HY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDQTd-0000VD-4B
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 14:44:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 277421bd-99c6-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 15:44:44 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A5E9D4EE0737;
 Wed, 13 Dec 2023 15:44:43 +0100 (CET)
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
X-Inumbo-ID: 277421bd-99c6-11ee-98e9-6d05b1d4d9a1
MIME-Version: 1.0
Date: Wed, 13 Dec 2023 15:44:43 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/7] x86/mm: address MISRA C:2012 Rule 2.1
In-Reply-To: <0ad1d3f5-2a23-4ee9-a6e7-ebb824d2b7d7@suse.com>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com>
 <5913d8871ff6c4f320c521e50e550a64e58d4351.1702283415.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312111741390.1703076@ubuntu-linux-20-04-desktop>
 <ff95c65f53ab8acfd577ec132009cd7b@bugseng.com>
 <0ad1d3f5-2a23-4ee9-a6e7-ebb824d2b7d7@suse.com>
Message-ID: <8a49facc4fbf4d3fefb91b9b5bef3305@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-12 10:53, Jan Beulich wrote:
> On 12.12.2023 10:12, Nicola Vetrini wrote:
>> On 2023-12-12 02:42, Stefano Stabellini wrote:
>>> On Mon, 11 Dec 2023, Nicola Vetrini wrote:
>>>> The "return 0" after the swich statement in 'xen/arch/x86/mm.c'
>>>> is unreachable because all switch clauses end with returns.
>>>> However, some of them can be substituted with "break"s to allow
>>>> the "return 0" outside the switch to be reachable.
>>>> 
>>>> No functional changes.
>>> 
>>> This is correct but makes the code inconsistent. I would either 
>>> remove
>>> the return 0; at the end of arch_memory_op, or do the following:
>>> 
>>> - initialize rc to 0 at the beginning: int rc = 0;
>>> - all switch clauses break instead of return;
>>> - at the end: return rc;
>> 
>> Given the feedback on the Arm side, the first solution is likely to be
>> preferred.
> 
> I wouldn't mind either option, with
> - the former ensured to be okay with all compiler versions we (still)
>   support,

I tested a stripped-down version of the switch on godbolt.org (as far 
back as gcc-4.8.5) and it doesn't complain. It should be tested on a 
real Xen build, though.

> - the latter having the initialize rc to 0 part dropped; imo it's 
> better
>   if every case block makes sure to set the intended value explicitly.
> 

This is a lot of churn, I'd rather avoid it.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

