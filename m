Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBA99F09C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 17:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819223.1232508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0j54-00073Q-SU; Tue, 15 Oct 2024 15:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819223.1232508; Tue, 15 Oct 2024 15:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0j54-00071K-PV; Tue, 15 Oct 2024 15:03:26 +0000
Received: by outflank-mailman (input) for mailman id 819223;
 Tue, 15 Oct 2024 15:03:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3bi0=RL=bounce.vates.tech=bounce-md_30504962.670e8437.v1-9f379b0ef034429daa972e3ae31da283@srs-se1.protection.inumbo.net>)
 id 1t0j52-00071E-DR
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 15:03:24 +0000
Received: from mail136-14.atl41.mandrillapp.com
 (mail136-14.atl41.mandrillapp.com [198.2.136.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da59dab-8b06-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 17:03:21 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-14.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XScmR1zwHz705jsS
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 15:03:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9f379b0ef034429daa972e3ae31da283; Tue, 15 Oct 2024 15:03:19 +0000
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
X-Inumbo-ID: 9da59dab-8b06-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729004599; x=1729265099;
	bh=bB3tmUmodvCERpf11kqHx2ir+SoIIlyIYgxa8IBjy5k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zdWOrf9rJ9foIpFomz/IbmL4H7e+1XqFzvP7uMXUjY5Ip756y0bwIiP7w3jL0eTYx
	 jwiuYoTmFk51cEq3JxSoDoKFkiFJfGs5D1GIcBynfZOypvwq7IQfzYDQD+9fEl/qJ+
	 EzYFor9lmxz3XdiWapdDzKrI9xDG9AmZu88YARWGSwzrNNtbdtooGd6SrzutaK48wN
	 ui2kDES/xKbpltc8+6pvDGGaU+hD3aXnkDNQkikV/P+cdPGwFSSNgDyBUkDt5QJ7Ln
	 tDYRSVKno+rVuLwRcZWQ3Pk/I8ZZj2UpKSZ+fS8mDPYZUkS2aRGjcUdM6ZAFBGq97C
	 3lBwdu/waiVvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729004599; x=1729265099; i=anthony.perard@vates.tech;
	bh=bB3tmUmodvCERpf11kqHx2ir+SoIIlyIYgxa8IBjy5k=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MhjY5Amq8TKOZHJ1GHANHk8MZRGtUozc7TfbAYI9pIIR0QVYTlcJoDwQf0ZZabe+B
	 Ecn2zVjbOZaBrKG7WygVnLbjE5KeYUefBz8Clv9IzfdqpWLZgcfd63S5LE2Gks+LhL
	 gLl1wnmb6TnIslokP0jzuGuBlqJF60puCYvBRuqRRGJ3ReGJQPgLqGXRYoBcRQPsTi
	 qFTbtBIPKOQtCnoGUpXIxqIGgryBI3DPS+kyiU/Zy6iiTHVk6Q++aHi1ZcT6bStagT
	 WkVHx9OSqkbUdFnNumUZDNdvN31T3VJN0usGgrTRRVV5v5D+V7pNWC3ZnacQ4pLJBk
	 u0bzEfqi6bATw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=203/6]=20x86/boot:=20Reuse=20code=20to=20relocate=20trampoline?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729004596651
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <Zw6ENAH6sVr0Zuv6@l14>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com> <20241014085332.3254546-4-frediano.ziglio@cloud.com>
In-Reply-To: <20241014085332.3254546-4-frediano.ziglio@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9f379b0ef034429daa972e3ae31da283?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241015:md
Date: Tue, 15 Oct 2024 15:03:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Oct 14, 2024 at 09:53:29AM +0100, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 23ad274c89..ca258a9729 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,12 +1,16 @@
>  obj-bin-y += head.o
>  obj-bin-y += built_in_32.o
> +obj-bin-y += $(obj64)

Could you move this so $(obj64) is fully set when added to $(obj-bin-y)?
There's no garanties that this is going to keep working. We already have
"obj-y :=", so it is possible we will have "obj-bin-y :=" one day. (Or
that we get rid of $(obj-bin-y) because it becomes unnecessary.)

>  obj32 := cmdline.32.o
>  obj32 += reloc.32.o
> +obj32 += reloc-trampoline.32.o
>  
> -nocov-y   += $(obj32)
> -noubsan-y += $(obj32)
> -targets   += $(obj32)
> +obj64 := reloc-trampoline.o
> +
> +nocov-y   += $(obj32) $(obj64)
> +noubsan-y += $(obj32) $(obj64)
> +targets   += $(obj32) $(obj64)

Technically, the change to $(targets) isn't necessary, $(obj-bin-y)
should already be added to it.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

