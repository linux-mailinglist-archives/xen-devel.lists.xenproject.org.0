Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 319A097025A
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2024 15:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792251.1202220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smvMi-0003lH-FX; Sat, 07 Sep 2024 13:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792251.1202220; Sat, 07 Sep 2024 13:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smvMi-0003iE-Ci; Sat, 07 Sep 2024 13:20:36 +0000
Received: by outflank-mailman (input) for mailman id 792251;
 Sat, 07 Sep 2024 13:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uvfV=QF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1smvMg-0003i8-UC
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2024 13:20:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f65691fc-6d1b-11ef-a0b4-8be0dac302b0;
 Sat, 07 Sep 2024 15:20:33 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A9D174EE0737;
 Sat,  7 Sep 2024 15:20:32 +0200 (CEST)
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
X-Inumbo-ID: f65691fc-6d1b-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725715233; bh=SXyKNqjDWiFexzypjIPhqFx4L1usdr6egQw53E7eHjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ugWtELiWhVdPiPGhXs5V4pWWAELVqtwqduqfxouC0y8fleYDnDBvh0fzZHFSmnhhr
	 BRnkz0LNV8oN5rtVr1oOITD2CYaDkUIZJglXhp2U1B8x7AX3uRA9W1gJ+joHN6b6TN
	 PRMllIIoaMvkhvJA59dOh5m4jMv7eF7PvripvTVTy1ZXBKhRylHIaJv54b4aaWO3ST
	 IN1qCfSyv2P1qVK0aAANM7mD9FMt+ITeJ5K6QivYWwDgt4S0eqTI6oUq3H6MKxV0Py
	 5IwaIR8o7tSpmeXaWDoGvzZz9QKB7y0H78owxCmDfSmHErdQk+uqRejII48WUHCXFj
	 MvmNN/3i70LkQ==
MIME-Version: 1.0
Date: Sat, 07 Sep 2024 15:20:32 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, consulting@bugseng.com, Roberto Bagnara
 <roberto.bagnara@bugseng.com>, Federico Serafini
 <federico.serafini@bugseng.com>
Subject: Re: [PATCH v3 3/5] xen/bitops: Implement hweight32() in terms of
 hweightl()
In-Reply-To: <925994e3-b865-4355-8751-4976d4ccbf79@citrix.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
 <20240904225530.3888315-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2409051605330.53815@ubuntu-linux-20-04-desktop>
 <34f1a11d-f0b7-45d8-92e6-fcb40e3c87d2@citrix.com>
 <925994e3-b865-4355-8751-4976d4ccbf79@citrix.com>
Message-ID: <668848de2ceb300ec6aaff84a7fceb01@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-09-06 20:50, Andrew Cooper wrote:
> On 06/09/2024 1:27 am, Andrew Cooper wrote:
>> On 06/09/2024 12:08 am, Stefano Stabellini wrote:
>>> On Wed, 4 Sep 2024, Andrew Cooper wrote:
>>>> ... and drop generic_hweight32().
>>>> 
>>>> As noted previously, the only two users of hweight32() are in __init 
>>>> paths.
>>>> 
>>>> The int-optimised form of generic_hweight() is only two instructions 
>>>> shorter
>>>> than the long-optimised form, and even then only on architectures 
>>>> which lack
>>>> fast multiplication, so there's no point providing an int-optimised 
>>>> form.
>>>> 
>>>> No functional change.
>>>> 
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> The patch is OK:
>>> 
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>> Thanks.
>> 
>>> I was looking at docs/misra/C-language-toolchain.rst to make sure
>>> everything is listed there. We have attr_const as "__const__" noted
>>> among "Non-standard tokens".
>>> 
>>> Looks like we need to add __always_inline__ ?
>> Luckily, no.
>> 
>> First, the __const__ referred to there is GCC's alternative spelling 
>> of
>> the regular C 'const' keyword, and not the function attribute by the
>> same name.
>> 
>> But, non-standard tokens are about things which survive full
>> preprocessing and are still not standard C.  In this case, it's the
>> __attribute__ that matters, not what's in it, and this is why we don't
>> have a hundreds of rows in that table for __attribute__((foo, bar, 
>> baz)).
>> 
>> That said, I think f96e2f64576cdbb147391c7cb399d393385719a9 probably
>> should have removed the entire row including __const__ seeing as 
>> AFAICT
>> the last user in Xen was dropped in 1aa3c54a31a5 in 2008
> 
> Hmm.  Eclair disagrees.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7765315981
> 
> Now I'm completely confused as to why __const__ matters and everything
> else inside an __attribute__(()) apparently doesn't.
> 
> CC-ing some folk.  Any ideas?
> 
> ~Andrew

The reason why __attribute__((__const__)) is reported after removing 
from the configuration of STD.tokenext the __const__ token is that:
- __const__ is just an alternate keyword for const, and as such needs to 
be special-cased in the configuration, as it was originally;
- the __const__ inside the attribute is still a non-standard token, no 
matter the surrounding context, and the kind of token is determined 
right after preprocessing as being a keyword (albeit non-standard), as 
far as I'm aware;
- this only happens due to the overlap with the alternate keyword 
__const__; in other words, other attributes such as 
__transparent_union__ in __attribute__((__transparent_union__)) do not 
need to be listed as permitted non-standard tokens because they aren't 
either standard or non-standard keywords, but just ordinary identifiers.

Therefore, I suggest keeping the __const__ inside the configuration.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

