Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C40A86CFB4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687342.1070691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjf5-0006p3-P3; Thu, 29 Feb 2024 16:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687342.1070691; Thu, 29 Feb 2024 16:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjf5-0006nT-Lc; Thu, 29 Feb 2024 16:53:35 +0000
Received: by outflank-mailman (input) for mailman id 687342;
 Thu, 29 Feb 2024 16:53:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfjf4-0006n4-6Z
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:53:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 129fd58f-d723-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 17:53:33 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D61804EE0737;
 Thu, 29 Feb 2024 17:53:32 +0100 (CET)
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
X-Inumbo-ID: 129fd58f-d723-11ee-afd8-a90da7624cb6
MIME-Version: 1.0
Date: Thu, 29 Feb 2024 17:53:32 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, julien@xen.org, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 01/10] xen/include: address violations of MISRA C Rule
 20.7
In-Reply-To: <dd361525-be1a-4d11-bbc8-4f5eedd381e0@citrix.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <15d6e4fb5c873e7ea42cfcee2faa0bf33c10d101.1709219010.git.nicola.vetrini@bugseng.com>
 <b844e28f-a53b-49c0-b4b9-297367546bd3@citrix.com>
 <d9674a6e2ef00457a90d570fc3866c81@bugseng.com>
 <dd361525-be1a-4d11-bbc8-4f5eedd381e0@citrix.com>
Message-ID: <95c49f91b6a2b4d7766db7b0152969af@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-02-29 17:47, Andrew Cooper wrote:
> On 29/02/2024 4:21 pm, Nicola Vetrini wrote:
>> On 2024-02-29 17:10, Andrew Cooper wrote:
>>> On 29/02/2024 3:27 pm, Nicola Vetrini wrote:
>>>> diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
>>>> index c25dc0f6c2a9..b7e70289737b 100644
>>>> --- a/xen/include/xen/kconfig.h
>>>> +++ b/xen/include/xen/kconfig.h
>>>> @@ -25,7 +25,7 @@
>>>>  #define __ARG_PLACEHOLDER_1 0,
>>>>  #define config_enabled(cfg) _config_enabled(cfg)
>>>>  #define _config_enabled(value)
>>>> __config_enabled(__ARG_PLACEHOLDER_##value)
>>>> -#define __config_enabled(arg1_or_junk)
>>>> ___config_enabled(arg1_or_junk 1, 0)
>>>> +#define __config_enabled(arg1_or_junk)
>>>> ___config_enabled(arg1_or_junk (1), (0))
>>>>  #define ___config_enabled(__ignored, val, ...) val
>>> 
>>> This one hunk I suggest we deviate rather than adjust.  You've subtly
>>> broken it, and it's extreme preprocessor magic in the first place to
>>> turn an absent symbol into a 0.
>>> 
>> 
>> How so? I did test this because I was very wary of it, but it seemed
>> to expand fine (either if ((0)) or if ((1)) ). I may of course be
>> wrong, and it could be deviated regardless.
>> 
> 
> arg1_or_junk(1) can now be a function or macro expansion depending on
> context, where previously it couldn't be.
> 

I see, that would be a latent bug. I do agree on deviating then.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

