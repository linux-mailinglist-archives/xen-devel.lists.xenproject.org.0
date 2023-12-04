Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204EB8031C1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 12:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646859.1009475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7Ud-0005SS-5K; Mon, 04 Dec 2023 11:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646859.1009475; Mon, 04 Dec 2023 11:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7Ud-0005QL-0V; Mon, 04 Dec 2023 11:52:07 +0000
Received: by outflank-mailman (input) for mailman id 646859;
 Mon, 04 Dec 2023 11:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjtD=HP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rA7Ub-0005QF-UP
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 11:52:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a7445b0-929b-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 12:52:03 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2F5F24EE073D;
 Mon,  4 Dec 2023 12:52:03 +0100 (CET)
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
X-Inumbo-ID: 8a7445b0-929b-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 12:52:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/DMI: adjustments to comply with Misra C:2012 Rule 9.3
In-Reply-To: <0bf576e1-b9ce-44f5-9866-7b67706a100c@suse.com>
References: <4876b0a8-b96b-4f60-8040-a346b2655645@suse.com>
 <0bf576e1-b9ce-44f5-9866-7b67706a100c@suse.com>
Message-ID: <a9e42c5d486003375aec441b17d33d96@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-30 15:56, Jan Beulich wrote:
> On 30.11.2023 08:55, Jan Beulich wrote:
>> The rule demands that all array elements be initialized (or dedicated
>> initializers be used). Introduce a small set of macros to allow doing 
>> so
>> without unduly affecting use sites (in particular in terms of how many
>> elements .matches[] actually has; right now there's no use of
>> DMI_MATCH4(), so we could even consider reducing the array size to 3).
>> 
>> Note that DMI_MATCH() needs adjustment because of the comma included 
>> in
>> its expansion, which - due to being unparenthesized - would otherwise
>> cause macro arguments in the "further replacement" step to be wrong.
> 
> Sadly this doesn't work with older gcc (4.8.5 is what I had an issue 
> with,
> complaining "initializer element is not constant").
> 
> Jan

Hi,

I tried plugging the relevant code into godbolt.org to try gcc-4.8.5, 
but I'm not able to reproduce the error (see 
https://godbolt.org/z/cP88YeWhh). Can you please provide some more 
details on where the issue is?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

