Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9BB213E55
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 19:11:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrPD2-0005LE-KK; Fri, 03 Jul 2020 17:10:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ZZ1=AO=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1jrPD0-0005L9-Gm
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 17:10:42 +0000
X-Inumbo-ID: 1f892741-bd50-11ea-8a04-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f892741-bd50-11ea-8a04-12813bfff9fa;
 Fri, 03 Jul 2020 17:10:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1E88214D8
 for <xen-devel@lists.xenproject.org>; Fri,  3 Jul 2020 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593796241;
 bh=eSLxwCsrnjTN1e/eMh6nr/qbzVVZVXbOT9m3hRAwgUY=;
 h=From:Date:Subject:To:Cc:From;
 b=pHjE8pN36o+e/YKNzwG1ysSGr2KqQURQ5A7ukoqZCvAeM1u7QOU8KseOSXJXzkpAT
 PQOIWf348pJihiEl9qg2Hi497UH6KQNOrs3zlmjR9M1StahTZyL1dHxeA5VAccfvoU
 10GIlFJGhmfIeXAQX/vByyDFlLGgiXthQ7kZwzDw=
Received: by mail-wr1-f51.google.com with SMTP id z2so11214777wrp.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 10:10:40 -0700 (PDT)
X-Gm-Message-State: AOAM5307LjnqRWRYjFfvvAZeIQG2MRE4Hwqm/woIGelDMqF0chvzU19J
 k5/fKroPNrf3WIN4YLIamglTYFqvSSBw9xoHAq4rVQ==
X-Google-Smtp-Source: ABdhPJxAdrtZOxCWu77L4TeW9SEziwQ1Q79FxUmVvDBqK30QeKHVkoNZP7TaDcgSwTQuWVtqX6NTUmygzsDDwM6qVdA=
X-Received: by 2002:adf:8104:: with SMTP id 4mr38344164wrm.18.1593796239481;
 Fri, 03 Jul 2020 10:10:39 -0700 (PDT)
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
Date: Fri, 3 Jul 2020 10:10:28 -0700
X-Gmail-Original-Message-ID: <CALCETrVfi1Rnt5nnrHNivdxE7MqRPiLXvon4-engqo=LCKiojA@mail.gmail.com>
Message-ID: <CALCETrVfi1Rnt5nnrHNivdxE7MqRPiLXvon4-engqo=LCKiojA@mail.gmail.com>
Subject: FSGSBASE seems to be busted on Xen PV
To: xen-devel <xen-devel@lists.xenproject.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: X86 ML <x86@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Xen folks-

I did some testing of the upcoming Linux FSGSBASE support on Xen PV,
and I found what appears to be some significant bugs in the Xen
context switching code.  These bugs are causing Linux selftest
failures, and they could easily cause random and hard-to-debug
failures of user programs that use the new instructions in a Xen PV
guest.

The bugs seem to boil down to the context switching code in Xen being
clever and trying to guess that a nonzero FS or GS means that the
segment base must match the in-memory descriptor.  This is simply not
true if CR4.FSGSBASE is set -- the bases can have any canonical value,
under the full control of the guest, and Xen has absolutely no way of
knowing whether the values are expected to be in sync with the
selectors.  (The same is true of FSGSBASE except that guest funny
business either requires MSR accesses or some descriptor table
fiddling, and guests are perhaps less likely to care)

Having written a bunch of the corresponding Linux code, I don't
there's any way around just independently saving and restoring the
selectors and the bases.  At least it's relatively fast with FSGSBASE
enabled.

If you can't get this fixed in upstream Xen reasonably quickly, we may
need to disable FSGSBASE in a Xen PV guest in Linux.

--Andy

