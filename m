Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3FA3B362
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 09:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892433.1301406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfCZ-0003AX-Ar; Wed, 19 Feb 2025 08:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892433.1301406; Wed, 19 Feb 2025 08:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkfCZ-00039Q-7a; Wed, 19 Feb 2025 08:13:03 +0000
Received: by outflank-mailman (input) for mailman id 892433;
 Wed, 19 Feb 2025 08:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jbWK=VK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tkfCW-00039F-TL
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 08:13:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52333eaa-ee99-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 09:12:55 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 407054EF40C8;
 Wed, 19 Feb 2025 09:12:54 +0100 (CET)
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
X-Inumbo-ID: 52333eaa-ee99-11ef-9896-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739952774;
	b=FtlSVLhm3JldDkIEw2GFY8i//lUvNbmBx4Izioi/YviG0HWEwr8S2p7JQgJ0Hww/MIwz
	 iMhmYg6jsNJ+OTLtHjn25QZ9JnsISlvp5eWOsghSbxLKJnKQq/9KFQMlNBF4U3W4NBQSd
	 tbE9sHE8NrtquMr0wjbQ06/7S2C2z44I4YOfT+vxm9alA2KRYkE7ViFSihjmFou/YO5++
	 ZAUNYALF+xS47KnAtedHw+GxJ9/GVpWN7WN7eUOw/gIUGYaidUK7XPZPbvLnhqwGqansQ
	 ve3Q3d9bAqjf5+MfXJfA9oQxNu+5xObL4r7M143bz98rxCfeLkSgmc6b/x/kQjO0kdm/E
	 TZHx1qjIv3e25g0BgMwKEEh49pUqW1tc1kC0SXsiRjri3EmiJhy6iF5LQUsdNtIqA7h/V
	 k4YaNDWyTlVuFFQBjk5MIFeHj9Z2FfeNl0xvR+tOOXvex3o40JBikEcMFbOdEY3AdYZXc
	 ov4YbFOgy+I6KZ7ND5b/tpRJWY93akdYwcp0ImoQNB17WAIZ4k7zQ9tOKSzkOA35D/feO
	 ThK+anUKD3xAo0kKH3ceT6tX6VESbgjhn+eb1YSiQtNT7x0Xpc5Ycn7blqlGD//sdJf/M
	 v3zyaAdXReJm5mJ4Luh4RSHSe8awAoBk0AJbGLs8/YWTGoRwvSE8/RepPnsctIU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739952774;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=4+oBlGhxBJ5EysxRzPH7bUEWF7p3IETPBaawTZhOMgs=;
	b=0l0JrErnnCvJHYYdaaO/SxMZljBA3U5zsVx2BkEgM54Qg9zfLF8BSIgcdMck9aTtkapB
	 80U+FYW0IUuNVscg35/JiijdnfUgWXVu1ssyJJLZBYH2dfsh7JLvbFG/5vBiqSc0K6Bvt
	 WI5htmJOMq0Xz4UA3qw2CJBOxkbBJ7hyuwatUIjqH8VcqYkvtJ560qzsDTIn0nAeJfPnM
	 sOT5xPyybekvyAEQrW2HzZtVxUOm8+P+X2uX6Uer+xTGTMkEdeVpJGGwTyeFN+eH8xJ/Y
	 kX/uFsKSV5iyV8D7hQlQCjd2NR5g6vCjnHqsy4jXt3ZQj/gawlf7hOtEH5AvMItv9fzyf
	 x5rAmTnihYt/aIuquLRxHZqDeSMhsPYYPJGifq9brjISzyCW1888SqZqgGtLCHe7eofRQ
	 h6OHKiBsQz0Cb6dUuYvEOgjmQt3NrxNRxF3bKc6y50F7vP7my3fZe680tWDIAIbk6tpWQ
	 Z8xwEza7DS3zdbuXMHeC86BaDKljLHV0bDE131SkYaVNJk/PAPjivPxjjVFIBa75/0sdi
	 EyX6sgIrtM2YGtDZ9hoIQUc5rMotucAJd19NG0wFre9EK9LLUi8JdPe3xDB/FwSZd8bfa
	 AyIZnVqCrCO53UcaK2S6GDNHAZaz3GE8zDjiGUtjiJV+0GsJ/WZyD8PONWDO9Ng=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739952774; bh=ToAywkZNjAkdEnKErPdkz4qjyB7Foj22xaeeHEQY3co=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qvYNUNIGlNH5jjtfR/K/MCI1Ja99RfQ397Vj7H+tAlGtx0vETyN566NhmS5/u8rfN
	 9b9bNAP9+cczQX7uuXROaiP0Ft9k0QgGERGeDuKvrMlsSIU1T9AlACIDmlVc+BnsmY
	 RG3rXvlZ7uBNgTsJoVPZaxBDnkoqnMrA6Tg8L0B1gJK5y7FtKgWJh0swCWCF92BkmR
	 HA24/MnlezDu7z3tHBvtI503iAtjWfM8UGdgIaMBdt1HPbGQUxEDpt0YgtOcH3MLng
	 fZ18rhn0E8lMPYbSEaUo/8/D36yL2wfKoc2MKjbPcDp8UNanq66R79fv0kl3kvZXKj
	 dzhqblx3Pk89A==
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 09:12:54 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, consulting@bugseng.com,
 xen-devel@lists.xenproject.org
Subject: Re: xen/x86: resolve the last 3 MISRA R16.6 violations
In-Reply-To: <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502141811180.3858257@ubuntu-linux-20-04-desktop>
 <daaf4284-102c-4fc4-819c-2231705ab572@suse.com>
 <alpine.DEB.2.22.394.2502171509330.1085376@ubuntu-linux-20-04-desktop>
 <c24f9d41-1cf4-4cfc-ba11-6ad1d1223e9f@suse.com>
 <alpine.DEB.2.22.394.2502181338150.1085376@ubuntu-linux-20-04-desktop>
Message-ID: <1abbfc57051e7e4c0ff803d138c9c494@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-18 22:42, Stefano Stabellini wrote:
> On Tue, 18 Feb 2025, Jan Beulich wrote:
>> On 18.02.2025 00:12, Stefano Stabellini wrote:
>> > On Mon, 17 Feb 2025, Jan Beulich wrote:
>> >> On 15.02.2025 03:16, Stefano Stabellini wrote:
>> >>> --- a/xen/arch/x86/hvm/hvm.c
>> >>> +++ b/xen/arch/x86/hvm/hvm.c
>> >>> @@ -3797,22 +3797,14 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int reg)
>> >>>  {
>> >>>      ASSERT(v == current || !vcpu_runnable(v));
>> >>>
>> >>> -    switch ( reg )
>> >>> -    {
>> >>> -    default:
>> >>> -        return alternative_call(hvm_funcs.get_reg, v, reg);
>> >>> -    }
>> >>> +    return alternative_call(hvm_funcs.get_reg, v, reg);
>> >>>  }
>> >>>
>> >>>  void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>> >>>  {
>> >>>      ASSERT(v == current || !vcpu_runnable(v));
>> >>>
>> >>> -    switch ( reg )
>> >>> -    {
>> >>> -    default:
>> >>> -        return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>> >>> -    }
>> >>> +    return alternative_vcall(hvm_funcs.set_reg, v, reg, val);
>> >>>  }
>> >>
>> >> Both of these were, iirc, deliberately written using switch(), to ease
>> >> possible future changes.
>> >
>> > To be honest, I do not see any value in the way they are currently
>> > written. However, if you prefer, I can add a deviation for this, with
>> > one SAF comment for each of these two. The reason for the deviation
>> > would be "deliberate to ease possible future change". Please let me know
>> > how you would like to proceed.
>> 
>> Well, best next thing you can do is seek input from the person who has
>> written that code, i.e. Andrew.
> 
> Andrew wrote in chat that he is OK with a deviation and he can live 
> with
> a SAF deviation. Here is the patch.
> 
> 
> ---
> xen/x86: resolve the last 3 MISRA R16.6 violations
> 
> MISRA R16.6 states that "Every switch statement shall have at least two
> switch-clauses". There are only 3 violations left on x86 (zero on ARM).
> 
> One of them is only a violation depending on the kconfig configuration.
> So deviate it instead with a SAF comment.
> 
> Two of them are deliberate to enable future additions. Deviate them as
> such.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 

Looks good to me, from an ECLAIR point of view. Did you have a chance to 
run a pipeline on it to confirm that the SAF comments are recognized 
correctly?

With that,

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index b8a4f878ea..3d68b59169 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -92,6 +92,22 @@
>          },
>          {
>              "id": "SAF-11-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R16.6"
> +            },
> +            "name": "Rule 16.6: single clause due to kconfig",
> +            "text": "A switch statement with a single switch clause 
> because other switch clauses are disabled in a given kconfig is safe."
> +        },
> +        {
> +            "id": "SAF-12-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R16.6"
> +            },
> +            "name": "Rule 16.6: single clause due to future 
> expansion",
> +            "text": "A switch statement with a single switch clause to 
> purposely enable future additions of new cases is safe."
> +        },
> +        {
> +            "id": "SAF-13-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 39e39ce4ce..0f0630769b 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3797,6 +3797,7 @@ uint64_t hvm_get_reg(struct vcpu *v, unsigned int 
> reg)
>  {
>      ASSERT(v == current || !vcpu_runnable(v));
> 
> +    /* SAF-12-safe */
>      switch ( reg )
>      {
>      default:
> @@ -3808,6 +3809,7 @@ void hvm_set_reg(struct vcpu *v, unsigned int 
> reg, uint64_t val)
>  {
>      ASSERT(v == current || !vcpu_runnable(v));
> 
> +    /* SAF-12-safe */
>      switch ( reg )
>      {
>      default:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 87b30ce4df..dca11a613d 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -436,6 +436,7 @@ unsigned long get_stack_trace_bottom(unsigned long 
> sp)
> 
>  static unsigned long get_shstk_bottom(unsigned long sp)
>  {
> +    /* SAF-11-safe */
>      switch ( get_stack_page(sp) )
>      {
>  #ifdef CONFIG_XEN_SHSTK

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

