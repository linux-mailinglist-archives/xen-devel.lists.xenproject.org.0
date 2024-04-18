Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575208AA353
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 21:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708569.1107574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxXl3-0000GR-Id; Thu, 18 Apr 2024 19:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708569.1107574; Thu, 18 Apr 2024 19:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxXl3-0000D7-FQ; Thu, 18 Apr 2024 19:49:21 +0000
Received: by outflank-mailman (input) for mailman id 708569;
 Thu, 18 Apr 2024 19:49:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcTt=LX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxXl1-0000D1-UY
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 19:49:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdbfbf84-fdbc-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 21:49:17 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 050134EE0742;
 Thu, 18 Apr 2024 21:49:17 +0200 (CEST)
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
X-Inumbo-ID: bdbfbf84-fdbc-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 21:49:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation/eclair_analysis: substitute deprecated
 service
In-Reply-To: <eb04d2c3-5667-4f71-a2a2-ee8e108c2880@suse.com>
References: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
 <2d890f61-6f51-4d64-844e-24207805a65c@suse.com>
 <d0896c61235cb9f071cb0586fe87ee46@bugseng.com>
 <eb04d2c3-5667-4f71-a2a2-ee8e108c2880@suse.com>
Message-ID: <342ba95f9f424fce2d71588640474651@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-18 17:15, Jan Beulich wrote:
> On 18.04.2024 17:00, Nicola Vetrini wrote:
>> On 2024-04-18 09:22, Jan Beulich wrote:
>>> On 17.04.2024 16:51, Nicola Vetrini wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>>> @@ -44,8 +44,8 @@
>>>>  -doc_end
>>>> 
>>>>  -doc_begin="See Section \"6.19 Structures with No Members\" of
>>>> "GCC_MANUAL"."
>>>> --config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
>>>> --config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
>>>> +-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
>>>> +-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
>>>>  -doc_end
>>> 
>>> I'm irritated by this, which may be in part because of too terse a
>>> description.
>>> "emptrecd" looks like an abbreviation of "empty record" to me, in 
>>> line
>>> with
>>> "Structures with No Members". "anonstct" otoh looks an abbreviation 
>>> of
>>> "anonymous structures" to me, which is something different 
>>> (structures
>>> without
>>> names).
>> 
>> I'm afraid I can't do much about this. From a functionality standpoint
>> there is no difference for Xen.
> 
> What I'm pretty sure you can do is provide a patch description that
> allows readers to understand anything seemingly (or actually) 
> anomalous.
> 
> Jan

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

