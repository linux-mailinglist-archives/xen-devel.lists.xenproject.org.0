Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C6A75092
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 19:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931150.1333612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEpd-0000xT-SY; Fri, 28 Mar 2025 18:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931150.1333612; Fri, 28 Mar 2025 18:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyEpd-0000w1-PW; Fri, 28 Mar 2025 18:53:29 +0000
Received: by outflank-mailman (input) for mailman id 931150;
 Fri, 28 Mar 2025 18:53:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tyEpc-0000vv-Kh
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 18:53:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEpb-00DzJc-0Q;
 Fri, 28 Mar 2025 18:53:27 +0000
Received: from [2a02:8012:3a1:0:9545:fe10:6ede:2324]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tyEpa-004tTp-32;
 Fri, 28 Mar 2025 18:53:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=wMaLlihXZMBFVyKL6z9cPYUIbmezUn8i1q152H0MpCE=; b=x5f0tp3NphX5kdTyU3DYhxhAzn
	6FCJIODNXKL6vWNOP84QD/x0rSf/Sn9XgD0fIh1MMMdyFT159uNzYwAjUZjZ8zcCSJIUzrGDRK/Cr
	dOTGZ/mIHmJLDlmWf+KgskDpFgT5gFdxMGbzNlvXOgbE2csXtH836t2QmH4xNedcSK+g=;
Message-ID: <dcd04f01-74d7-4269-a107-0af5512fdba6@xen.org>
Date: Fri, 28 Mar 2025 18:53:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 RESEND 6/6] common: honor CONFIG_CC_SPLIT_SECTIONS also
 for assembly functions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
 <ea8357e8-ae29-41d7-af51-507d598044f9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ea8357e8-ae29-41d7-af51-507d598044f9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

I am not very familiar with CC_SPLIT_SECTIONS. But I will try to answer 
the Arm questions.

On 13/03/2025 08:10, Jan Beulich wrote:
> Leverage the new infrastructure in xen/linkage.h to also switch to per-
> function sections (when configured), deriving the specific name from the
> "base" section in use at the time FUNC() is invoked.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
> ---
> TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
>       wanted side effect of this change is that respective out-of-line
>       code now moves much closer to its original (invoking) code.
> 
> TBD: Of course something with the same overall effect, but less
>       impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
>       instead of $(firstword (3)). In fact Roger wants the detection to
>       be in Kconfig, for LIVEPATCH to depend on it. Yet the whole
>       underlying discussion there imo would first need settling (and
>       therefore reviving).
> 
> Note that we'd need to split DATA() in order to separate r/w, r/o, and
> BSS contributions. Further splitting might be needed to also support
> more advanced attributes (e.g. merge), hence why this isn't done right
> here. Sadly while a new section's name can be derived from the presently
> in use, its attributes cannot be. Perhaps the only thing we can do is
> give DATA() a 2nd mandatory parameter. Then again I guess most data
> definitions could be moved to C anyway.
> 
> An alternative to the "override" in arm64/head.S would be to use
> LABEL{,_LOCAL}() instead of FUNC{,_LOCAL}() there. Yet that would also
> lose the type information then. Question is whether the annotated ranges
 > really are "functions" in whichever wide or narrow sense.

They are functions. So I would prefer if we keep FUNC{,_LOCAL} and do 
the override as proposed in this patch..

Also, I think you want to move some of the override from the previous 
patches to this patch.

Cheers,

-- 
Julien Grall


