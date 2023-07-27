Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB07765742
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 17:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571185.894444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2ky-0003Fz-5L; Thu, 27 Jul 2023 15:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571185.894444; Thu, 27 Jul 2023 15:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP2ky-0003Dw-2h; Thu, 27 Jul 2023 15:18:24 +0000
Received: by outflank-mailman (input) for mailman id 571185;
 Thu, 27 Jul 2023 15:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGGP=DN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qP2kw-0003Dq-9J
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 15:18:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d19c5a32-2c90-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 17:18:20 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.207.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 666C74EE073F;
 Thu, 27 Jul 2023 17:18:18 +0200 (CEST)
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
X-Inumbo-ID: d19c5a32-2c90-11ee-8613-37d641c3527e
Message-ID: <86841a3d-2731-5ea4-07ec-f1d4833b4b7f@bugseng.com>
Date: Thu, 27 Jul 2023 17:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 1/4] x86: mechanically rename to address MISRA C:2012
 Rule 5.3
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <614dd6fe03ab82db83eabc430b27435b19096791.1690449587.git.nicola.vetrini@bugseng.com>
 <604b915b-e07e-8985-87f1-300568d0259f@suse.com>
 <40b2fb63-463c-2f9c-dc46-572cb0925807@citrix.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <40b2fb63-463c-2f9c-dc46-572cb0925807@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27/07/23 17:00, Andrew Cooper wrote:
> On 27/07/2023 3:50 pm, Jan Beulich wrote:
>> On 27.07.2023 12:47, Nicola Vetrini wrote:
>>> Rule 5.3 has the following headline:
>>> "An identifier declared in an inner scope shall not hide an
>>> identifier declared in an outer scope"
>>>
>>> The renames done by this patch avoid shadowing from happening.
>>> They are as follows:
>>> - s/str/s/ in 'lapic_disable'
>>> - s/str/level/ in '(apic|mce)_set_verbosity'
>>> - s/str/state_str/ in 'mwait_idle_probe'
>>> - s/str/memmap_name/ in 'init_e820'
>> I'm sorry to say that, but I'm not willing to go and figure out where
>> that "str" is that there's supposedly a collision with. Please can you
>> state such right here, ...
>>
>>> - s/i/j/ in 'mce_action' (the shadowing here is due to macro
>>>    'x86_mcinfo_lookup' that defines 'i' as a loop counter)
>> ... much like you do in this case?
> 
> In fairness to Nicola, that was given.
> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Function 'str' in 'xen/arch/x86/include/asm/desc.h'
>> causes the shadowing.
> 
> which is the wrapper for the STR instruction.
> 
> It's used in a single assertion, and I'd be happy getting rid of it
> entirely.  Alternatively, it could be renamed to read_tr() (or
> read_tr_sel() ?) if we want to keep the assertion.
> 
> We're not renaming every other use of 'str' to mean string just for this...
> 
> ~Andrew

Seems reasonable to remove it, though there aren't that many instances 
of shadowing on 'str'.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

