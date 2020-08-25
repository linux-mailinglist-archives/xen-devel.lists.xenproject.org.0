Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A7C251215
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 08:33:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kASUr-0006XQ-5w; Tue, 25 Aug 2020 06:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kASUq-0006XL-19
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 06:31:52 +0000
X-Inumbo-ID: 050ede25-44a2-47f2-91f4-daef96ff131f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 050ede25-44a2-47f2-91f4-daef96ff131f;
 Tue, 25 Aug 2020 06:31:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DFDC2AC23;
 Tue, 25 Aug 2020 06:32:20 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: Kconfig vs tool chain capabilities
Message-ID: <6d5a2014-5184-04f0-62f9-60ddd7537886@suse.com>
Date: Tue, 25 Aug 2020 08:31:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

while the (ongoing) migration to Linux'es Kbuild has brought (and
will continue to bring) quite a few good improvements, there's one
aspect that was - afaict - slipped in without any prior mentioning
and discussing. This mail is meant to serve as a starting point to
have such a discussion "after the fact". The implication is that I
expect there to not be an argument along the lines of "is already
in the tree". In fact one or two of my acks for related patches
were made dependent upon such a discussion to happen, without a
preset outcome.

I'd also like to ask to avoid an argument of "Linux is doing so,
hence we should do so, too". We really ought to form our own
opinion rather than "blindly" inheriting whatever they do.

The issue is the intended recognition and recording of tool chain
capabilities. Until now I'm unconvinced this is the intended
purpose of Kconfig, unlike user land's typical ./configure. The
latter serves to interrogate the system of available functionality,
including but not limited to tool chain capabilities. Admin
overrides to this are possible via --enable*, --disable*, or
--with* kinds of options handed to the script.

As opposed, Kconfig traditionally has served as merely a tool to
collect (build) admin decisions, recording them as well as derived
data. The implication was that the person doing the configuration
was responsible to ensure that selections requiring special tool
chain capabilities would be enabled only if the tool chain used
was actually capable of dealing with the involved code.

Therefore I see two questions that need answering before either
making more wide spread use of the new functionality, or before
undoing the present uses and returning back to the original model:

1) Does it make sense for tool chain capabilities to be recorded?

2) Does the recording actually work reliably?

As to 1), I'm personally of the opinion that the original model
was the better one, even if I can see advantages from downstream
(distro in particular) pov. Yet even for them it may mean they
would not get presented certain options which they may want to
enable, if only they knew they'd need to upgrade their tool
chain. For developers otoh, I don't think this model is a helpful
one: They absolutely should be aware of pieces they end up not
building (and which hence they're also not going test).

(I'd like to note that there may certainly be cases where during
the building of the tree features get enabled/disabled by other
means without the person doing the build becoming aware. I think
such should equally be converted to Kconfig selections, with the
build simply failing if tool chain prereqs aren't met. The
typical case though is a choice between different ways of
generating code, with no effect on resulting functionality
beyond a possible difference in performance.)

Additionally the answer to 2) is, I'm afraid, continuing to be
"No", as there is - afaict - no way for a once recorded .config
to get updated if the underlying tool chain changed. All options
to overcome this that I have been able to think of so far
(unconditional invocation of kconfig; hashing of involved [tool
chain] binaries) come with a pretty heavy overhead on build time
and/or other complications.

Jan

