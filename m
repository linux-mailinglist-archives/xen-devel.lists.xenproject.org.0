Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A803F80852E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649749.1014588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBJu-0001f1-1I; Thu, 07 Dec 2023 10:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649749.1014588; Thu, 07 Dec 2023 10:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBJt-0001cm-UX; Thu, 07 Dec 2023 10:09:25 +0000
Received: by outflank-mailman (input) for mailman id 649749;
 Thu, 07 Dec 2023 10:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBBJs-0001cg-EN
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:09:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1aa55eb-94e8-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 11:09:23 +0100 (CET)
Received: from [192.168.1.229] (93-36-216-194.ip62.fastwebnet.it
 [93.36.216.194])
 by support.bugseng.com (Postfix) with ESMTPSA id B3FA44EE073C;
 Thu,  7 Dec 2023 11:09:22 +0100 (CET)
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
X-Inumbo-ID: b1aa55eb-94e8-11ee-98e7-6d05b1d4d9a1
Message-ID: <f6245172-d094-411e-9edf-6912129abe18@bugseng.com>
Date: Thu, 7 Dec 2023 11:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/5] x86/acpi: remove acpi_pic_sci_set_trigger()
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <f0c7d42c12a0b89c61265cdfe67a35b07d220aa0.1701936906.git.federico.serafini@bugseng.com>
 <2205366c-c66a-419a-9232-ec41432127c1@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <2205366c-c66a-419a-9232-ec41432127c1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/23 10:19, Jan Beulich wrote:
> On 07.12.2023 09:47, Federico Serafini wrote:
>> Remove apci_pic_set_trigger() declaration: there is no definition and there are
>> no calls to such function in the XEN project.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> A reference to the offending commit would have been nice, the more that iirc
> I had already gone and fished that out for you.

Is it correct to use Fixes: <id> ("subj") even if there are other
useless entities left?
In particular, this is what I think should be removed:

Functions:
__acpi_acquire_global_lock()
__acpi_release_global_lock()
acpi_save_state{mem,disk}()
acpi_restore_state_mem()
acpi_enter_state()
{save,restore}_rest_processor_state()

Variables:
acpi_wakeup_address

Macros:
ACPI_ACQUIRE_GLOBAL_LOCK()

If you agree with me, I can propose a new patch which includes such 
removals and refers to the offending commit with a Fixes.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

