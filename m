Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D08D1BA1B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 23:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202349.1517939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfnB8-0005sZ-8X; Tue, 13 Jan 2026 22:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202349.1517939; Tue, 13 Jan 2026 22:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfnB8-0005qD-5a; Tue, 13 Jan 2026 22:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1202349;
 Tue, 13 Jan 2026 22:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjAJ=7S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfnB6-0005q7-4z
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 22:47:56 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b3f6f5-f0d1-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 23:47:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D09F60018;
 Tue, 13 Jan 2026 22:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A85FC116C6;
 Tue, 13 Jan 2026 22:47:49 +0000 (UTC)
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
X-Inumbo-ID: e4b3f6f5-f0d1-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768344471;
	bh=tTt6Ten7zQu3KDjN/5ZOWgqcgitbPTpKXEV4joDC6IY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uNq2i/acM/fxNvpqAePr7NIYrGgV0j1ylhp+KVkdvx0wE3U1GQuCRuJZtkJOE6DnT
	 WUNM5wQ2FYRexSTmsX2KV35qUmdB3BqOTg+k2UXKs9umFdxesGGC8aiWTRpIS3h8Be
	 CU8aevbzDkHnjrSJXJKuB5EHiR3BeY/j+gfXiYj00KGv9PNvFpRS9NFQKHeWYzTs74
	 gVTOUoFnTRozpsGdtyJBLlr49xiTfeHSzPWMdYfDY/kDvkfErE0L/n9k9SdQPXPrzd
	 FonvDw6A86S7U+Ayf+y+zPUL4q9HEaZ2d9shseb+YPzLZDxetFe0UUVYzIaGKapUcc
	 kr2rXtw91yvWg==
Date: Tue, 13 Jan 2026 14:47:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykola Kvach <xakep.amatop@gmail.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, andrea.bastoni@minervasys.tech, 
    marco.solieri@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>
Subject: Re: [BUG] LLC coloring: parse_color_config shorthand/UINT_MAX/partial
 configs + missing newline
In-Reply-To: <CAGeoDV_aYQogU+eb-oGt9i2LrBU9Ak1vayh7dLZSmYEihN-deg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2601131438580.992863@ubuntu-linux-20-04-desktop>
References: <CAGeoDV_aYQogU+eb-oGt9i2LrBU9Ak1vayh7dLZSmYEihN-deg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1412054276-1768344472=:992863"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1412054276-1768344472=:992863
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Mykola,

Replies inline below


On Tue, 13 Jan 2026, Mykola Kvach wrote:
> Hi all,
> 
> While investigating the Arm cache coloring, I noticed a few issues in
> parse_color_config() and one minor logging issue in the DT-related changes.
> 
> 1) parse_color_config() appears to accept "shorthand" forms not described
> by the documented grammar
> 
> The function documents:
> COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> RANGE ::= COLOR-COLOR
> 
> However, as implemented, inputs starting with a delimiter may be
> accepted and interpreted as if a leading 0 was present. For example:
> 
> ",2-6" -> interpreted as "0,2-6"
> "-10,2-6" -> interpreted as "0-10,2-6"
> 
> The reason is that the parser calls simple_strtoul(s, &s, 0) and then
> directly checks for '-'/',' at *s. If no digits were consumed, start
> becomes 0 and s can remain at the delimiter, which then gets treated as
> a range or separator.
> 
> Questions/proposed direction:
> - Is accepting these shorthand forms intentional? If yes, I think we
> should document them explicitly (both in the comment above
> parse_color_config() and in user-visible docs).
> - If not intentional, we likely want to reject by verifying that at
> least one digit was consumed for each number before accepting '-'
> or ','.

Yes, I think it was intentional. I would be happy with adding the
shorthands to the documentation.



> 2) Potential infinite loop/hang for ranges ending at UINT_MAX
> 
> The range expansion loop uses:
> for (color = start; color <= end; color++)
> 
> If end == UINT_MAX, incrementing color wraps back to 0, and
> (color <= end) remains true, resulting in an infinite loop inside early
> parsing. The current bounds checks do not prevent
> (start=UINT_MAX-some_small_number, end=UINT_MAX)
> from passing.

While that is true, no cache in existence can have even close to
UINT_MAX colors, and the number of colors are either passed by the user
(and assumed correct) or detected from the hardware.

While I wouldn't mind hardening the code against bad configurations and
I welcome a patch for it, we are talking about a patch that would turn a
crash into an explicit panic or similar. Also see below.


> 3) Partial global state on parse error can leak into later init/config use
> parse_color_config() writes into the provided array and increments
> *num_colors as it goes. On a parse error it returns -EINVAL, but the
> partially updated outputs remain.
> 
> his is particularly problematic for the cmdline parameters, because the
> utputs are global and can later be consumed by llc_coloring_init() or
> dom0_set_llc_colors().
> 
> A concrete example is "1,w,3-5":
> - "1" is parsed and committed
> - at "w", simple_strtoul() returns 0 and does not advance 's'
> - the code then treats this as a single color 0, commits it, and breaks
> out with *s != '\0'
> - the function returns -EINVAL, but num_colors and the array already
> contain a partial configuration
> 
> In other words, a rejected configuration can still leave xen_num_colors
> or dom0_num_colors non-zero and the corresponding colors[] partially
> populated, which risks the feature being initialized/applied with an
> unintended set of colors.
> 
> I think the parser should be fail-closed here. Minimally: reset
> *num_colors to 0 on any error path (including the final "*s ? -EINVAL"
> case). Ideally: parse transactionally into a temporary buffer and only
> commit outputs on full success.

I think we should panic on parsing errors: cache coloring is not a
feature for beginners that a distro like Debian is going to enable to
improve the out of the box experience with new users. Cache coloring is
a sophisticated feature that takes time to learn how to use it
effectively. If an experience embedded developer is providing an
erroneous configuration the best we can do it panic so that it becomes
immediately obvious what they did wrong and they can fix it.


> 4) Cosmetic: missing newline in printk in domain_set_llc_colors_from_str()
> 
> printk(XENLOG_ERR "Error parsing LLC color configuration");
> without a trailing '\n'.
> 
> I wanted to flag these issues in case you’d like to address them in the
> next revision/follow-up.

Sure please fix
--8323329-1412054276-1768344472=:992863--

