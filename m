Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B523F2A6
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 20:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k470v-0003ro-4j; Fri, 07 Aug 2020 18:22:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fjaa=BR=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1k470u-0003rj-6i
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 18:22:44 +0000
X-Inumbo-ID: c2036141-5803-4be7-9ca0-92d2ce9a077a
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2036141-5803-4be7-9ca0-92d2ce9a077a;
 Fri, 07 Aug 2020 18:22:41 +0000 (UTC)
Date: Fri, 07 Aug 2020 18:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1596824560;
 bh=mWuowmtVHupWq5n0J2fbIRjJDLNlHQjQNXMUB8Hgh2U=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=qF7p/RWxNknRFlOPEoAIAMhmrmqzJlZIkjpHwb9252ja1mJkPZowWh8M8zdzfQ59h
 UF9RUhWVR5zCp0sY5uSHhBGpWd3g3SkuH/Utf11DQpvidKQ2+AN3Xm8JLTBs2ERs8D
 rdXtTrn9RW/tBjUVU04DYaqdr1i5L+pyOinJipoI=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Subject: Re: [RFC] efi/boot: Unified Xen executable for UEFI Secure Boot
 support
Message-ID: <CXSQq8DgbTTtEtGG6W67lvGVMmT92dpQQWdC5bHKya9WwRwKZmcI3Oy4clutRHjY7BjDay5i-Iy5QVc6PAQsOKmIGvrI1MrfuN7RLnOnG1E=@trmm.net>
In-Reply-To: <132b5b88-c78d-01cf-df27-6430689570e4@citrix.com>
References: <SQvDCuitxs8ZbVLJqpnPlbhTvIw_fMkZDetiBpJD-DID2X8EnTvReCaJgThJ8b-3kS9gHm3-HYRqNJk-k1cVYPIQf04R8uuhPjm9WNKzJh4=@trmm.net>
 <1bd2d79e-5bef-835c-f6cc-9fd367e8beb7@suse.com>
 <FKRB6MJm-n6DwX0LoYfI4Ysny1U_xRbxvZn7ttLHGxpKTEnAmcoDMLsLsgKZGYaB2eVuIzoNQ6UPpsfiMlaRPW-7AIXQ9mqz_i9sF-tI2Ks=@trmm.net>
 <5e3b16b3-0f93-4683-dcc7-852c805870c8@suse.com>
 <y5v76XS6whE9vu9FqI2eN6ieuvXkjnAJ1oaBXdXyKKNjJxvbLqaRnHi99iq_AIknqaQ9V18cLCLy9v3dV8YIEsfyrQq9apJRcWiQeFXuGuk=@trmm.net>
 <132b5b88-c78d-01cf-df27-6430689570e4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thursday, August 6, 2020 8:14 PM, Andrew Cooper <andrew.cooper3@citrix.c=
om> wrote:
> For SecureBoot, it is important that nothing which is signed can be
> tricked into running unsigned code.
>
> That includes configuration such as xen.cfg or the command line.
> Consuming these from unsigned sources is ok, so long as we can guarantee
> that the parsing is robust (see boothole for how this goes wrong), and
> the effects are controlled.

In addition to the "unsafe_fsgsbase", the Linux command line is full
of potential issues, from subtle ones like "lockdown=3Dnone" to more
brute force things like "init=3D/bin/sh".  safeboot uses the signed
kernel command line to pass in the root hash of the dm-verity Merkle
tree, which cryptographically protects the rest of the runtime, so
it definitely needs to come from a trusted source.

> [...]
> In the absence of a full audit of all our command line arguments, and
> extra vigilance reviewing code coming in, the safer alternative is to
> prohibit use of the command line, and only accept it in its Kconfig
> embedded form for now.

Turning off command line or config parsing might be a step too far.
Since the xen.cfg in the unified image is included in the signature,
any options configured in it should be trustworthy.  This makes it easier
for distributions to have a Xen build with boot-time work arounds for
different hardware or configurations.

> [...]
> I think it might be worth having a CONFIG_SECURE_BOOT, selectable
> initially only under CONFIG_EXPERT, and use it to force off various
> other aspects of functionality, along with a list of known issues which
> can be chipped away at before it can be declared supported.

That makes sense to me.  Either doing it at compile time (by making
CONFIG_LIVEPATCH and CONFIG_KEXEC and etc depend on !CONFIG_SECURE_BOOT),
or having a global variable that turns off the code (similar to the
Linux lockdown patches that are triggered if UEFI secure boot is enabled).

> [...]
> I think it is great that work is being started in this direction, but
> there is a huge quantity of work to do before a downstream could
> plausibly put together a Xen system which honours the intent of SecureBoo=
t.

I'm really worried that the current shim based approach is a false sense
of security -- it provides trivial ways for attackers to bypass the
SecureBoot guarantees, so closing some of those easy holes with the
verified unified image is definitely an incremental improvement towards
a more secure system.

However, I also don't want the unified image patch to get bogged down
while trying to pursue every UEFI SecureBoot(tm) related issue, so
perhaps the patch series should be renamed to only focus on the unified
build part, not the SecureBoot part.  That way downstream distributions
can use it to add the security features that they need (caveat lector),
without necessarily depending on the strict UEFI compliance.

--
Trammell


