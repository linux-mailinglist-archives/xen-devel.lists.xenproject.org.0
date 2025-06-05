Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A42ACF578
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:34:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007303.1386628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNETc-00036y-ID; Thu, 05 Jun 2025 17:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007303.1386628; Thu, 05 Jun 2025 17:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNETc-00035G-El; Thu, 05 Jun 2025 17:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1007303;
 Thu, 05 Jun 2025 17:34:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6DLO=YU=bounce.vates.tech=bounce-md_30504962.6841d508.v1-0bb2d6427e0a4913b4838eba3db60dae@srs-se1.protection.inumbo.net>)
 id 1uNETb-0002yp-7V
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:34:03 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44e13c02-4233-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 19:34:02 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bCs4m6kfNzS63JDF
 for <xen-devel@lists.xenproject.org>; Thu,  5 Jun 2025 17:34:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0bb2d6427e0a4913b4838eba3db60dae; Thu, 05 Jun 2025 17:34:00 +0000
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
X-Inumbo-ID: 44e13c02-4233-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749144840; x=1749414840;
	bh=7Qk+zJcuYuF4MWrIpDTvZSnqn9QBaHc5YiwsuPDkMs8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ROEOnonTh3gvTGBqJwDIgY0rh3RCsMkM/N5StLGf5LDy6yavlKDyPkKQDEz6t4hjt
	 9IjFXfbOry94/xbH2zJXHgHDjwjtMZ5XF499FTdFW0lOMmGFYktIlwyPJPUCqjBGPW
	 VogNAOUP+oEYLD6SxEpO12fuR7z9pym9NmJ7euyi/lqZwpXe0cAsKdavNv5MxU8/Od
	 2rZCP/1i+cxI0pFNHWA2n9RG5Sz4Oz0E1jyc9Q9xmfujwvznsiNzZvdbhq6vBW0VjF
	 nS/h2SrMXVe+CzoPCadCpxoCvpUc2oRkUZqgcGlLn/NzWKZjP3TP0av8fXJbfLhAvd
	 Z5n/Qus0IHs9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749144840; x=1749405340; i=teddy.astie@vates.tech;
	bh=7Qk+zJcuYuF4MWrIpDTvZSnqn9QBaHc5YiwsuPDkMs8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cGbh0gEWbi27YfH+h8/CH5UBm7ZyZbRey60OPjdz6vtWlR/KeUJq4TxTr/1XOsMpl
	 dSl1H4t5xKidoluR3xqkxZ8R0Cmchat6jOGcCxvHD5EIZN7CcQzjURr37UTFKWl5N6
	 8QdBwIuKwUbtDIThHkrKDoZsYihGUQLa8HeP9kWPrLyu4So3qENtpZsq6vCFvgdCgx
	 vkcDPNdnlZA4ZmrGcCObIYLTgC1jsNJ3kcGcRziIyPtnGW29dBcC/PrCJB49tknQjt
	 5LlMSY5mao5MRzKakKfrcvavWyuLLGh0PBgSHhU5yBtAj/effaXcnLJM/g89uPM6ZX
	 kl43NO+VzkBkw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=204/6]=20x86:=20control=20memset()=20and=20memcpy()=20inlining?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749144839800
Message-Id: <f909c07f-d587-4ce7-9bbc-bdc13f604664@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com> <f659ba34-a1cc-444b-8727-2ecfbcfb00e3@suse.com>
In-Reply-To: <f659ba34-a1cc-444b-8727-2ecfbcfb00e3@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0bb2d6427e0a4913b4838eba3db60dae?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250605:md
Date: Thu, 05 Jun 2025 17:34:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 05/06/2025 =C3=A0 12:28, Jan Beulich a =C3=A9crit=C2=A0:
> Stop the compiler from inlining non-trivial memset() and memcpy() (for
> memset() see e.g. map_vcpu_info() or kimage_load_segments() for
> examples). This way we even keep the compiler from using REP STOSQ /
> REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
> available).
> 

If the size is known and constant, and the compiler is able to generate 
a trivial rep movs/stos (usually with a mov $x, %ecx before). I don't 
see a reason to prevent it or forcing it to make a function call, as I 
suppose it is very likely that the plain inline rep movs/stos will 
perform better than a function call (even if it is not the prefered rep 
movsb/stosb), eventually also being smaller.

I wonder if it is possible to only generate inline rep movs/stos for 
"trivial cases" (i.e preceded with a plain mov $x, %ecx), and rely on 
either inline movs or function call in other cases (non-trivial ones).

> With gcc10 this yields a modest .text size reduction (release build) of
> around 2k.
> 
> Unfortunately these options aren't understood by the clang versions I
> have readily available for testing with; I'm unaware of equivalents.
> 
> Note also that using cc-option-add is not an option here, or at least I
> couldn't make things work with it (in case the option was not supported
> by the compiler): The embedded comma in the option looks to be getting
> in the way.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Re-base.
> v2: New.
> ---
> The boundary values are of course up for discussion - I wasn't really
> certain whether to use 16 or 32; I'd be less certain about using yet
> larger values.
> 
> Similarly whether to permit the compiler to emit REP STOSQ / REP MOVSQ
> for known size, properly aligned blocks is up for discussion.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -58,6 +58,9 @@ endif
>   $(call cc-option-add,CFLAGS_stack_boundary,CC,-mpreferred-stack-boundar=
y=3D3)
>   export CFLAGS_stack_boundary
>   
> +CFLAGS +=3D $(call cc-option,$(CC),-mmemcpy-strategy=3Dunrolled_loop:16:=
noalign$(comma)libcall:-1:noalign)
> +CFLAGS +=3D $(call cc-option,$(CC),-mmemset-strategy=3Dunrolled_loop:16:=
noalign$(comma)libcall:-1:noalign)
> +
>   ifeq ($(CONFIG_UBSAN),y)
>   # Don't enable alignment sanitisation.  x86 has efficient unaligned acc=
esses,
>   # and various things (ACPI tables, hypercall pages, stubs, etc) are won=
t-fix.
> 
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



