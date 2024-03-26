Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0D88C537
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 15:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698110.1089466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7sM-0008Ip-2G; Tue, 26 Mar 2024 14:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698110.1089466; Tue, 26 Mar 2024 14:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp7sL-0008H5-VT; Tue, 26 Mar 2024 14:34:05 +0000
Received: by outflank-mailman (input) for mailman id 698110;
 Tue, 26 Mar 2024 14:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PUu=LA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rp7sK-0008Gx-Lt
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 14:34:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e419437f-eb7d-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 15:34:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7777E4EE0739;
 Tue, 26 Mar 2024 15:34:02 +0100 (CET)
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
X-Inumbo-ID: e419437f-eb7d-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 15:34:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 11/11] x86/public: hvm: address violations of MISRA C
 Rule 20.7
In-Reply-To: <77f8990e-5809-4429-92d6-53bbddc89caa@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <d9342b2a0390cf3128487cfe885940682bf9442e.1711118582.git.nicola.vetrini@bugseng.com>
 <77f8990e-5809-4429-92d6-53bbddc89caa@suse.com>
Message-ID: <b78fc2e7b0e93c55534897a19a7de4e0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-26 11:15, Jan Beulich wrote:
> On 22.03.2024 17:02, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
>> --- a/xen/include/public/arch-x86/xen.h
>> +++ b/xen/include/public/arch-x86/xen.h
>> @@ -36,7 +36,7 @@
>>  #define __XEN_GUEST_HANDLE(name)        __guest_handle_ ## name
>>  #define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
>>  #define XEN_GUEST_HANDLE_PARAM(name)    XEN_GUEST_HANDLE(name)
>> -#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = val; } 
>> while (0)
>> +#define set_xen_guest_handle_raw(hnd, val)  do { (hnd).p = (val); } 
>> while (0)
>>  #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, 
>> val)
>> 
>>  #if defined(__i386__)
> 
> Would have been nice though to do the same thing for Arm at the same 
> time.
> PPC and RISC-V already have "val" parenthesized there.
> 
> Jan

Ok, no problem.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

