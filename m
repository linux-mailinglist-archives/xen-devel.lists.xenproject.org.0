Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A06412721
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 22:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191179.341120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSPVk-0006bH-0N; Mon, 20 Sep 2021 20:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191179.341120; Mon, 20 Sep 2021 20:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSPVj-0006YN-TD; Mon, 20 Sep 2021 20:03:31 +0000
Received: by outflank-mailman (input) for mailman id 191179;
 Mon, 20 Sep 2021 20:03:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCl0=OK=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1mSPVh-0006YH-LB
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 20:03:29 +0000
Received: from MTA-10-3.privateemail.com (unknown [198.54.127.62])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0484fb3-9dde-4439-b480-1c86ab7bfb28;
 Mon, 20 Sep 2021 20:03:28 +0000 (UTC)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id E279A18000A7
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 16:03:27 -0400 (EDT)
Received: from mail-wr1-f47.google.com (unknown [10.20.151.216])
 by mta-10.privateemail.com (Postfix) with ESMTPA id C9FD118000A2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 16:03:27 -0400 (EDT)
Received: by mail-wr1-f47.google.com with SMTP id u15so32991155wru.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Sep 2021 13:03:27 -0700 (PDT)
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
X-Inumbo-ID: d0484fb3-9dde-4439-b480-1c86ab7bfb28
X-Gm-Message-State: AOAM531d71lQXRgY8EBczaGCGZBAt02YdjXURZRXroeMTIeDV7vKnDy7
	SJ/wxJDVjXOD2lCgsj3uGbEZXYS/wJaRCg/jjRE=
X-Google-Smtp-Source: ABdhPJwvpkjCnukkyOje3BkMgoiVojuuPg7T7q9NqAW24I5VHt1EYytFGkYYZjvRRELjVCZLu+OkUB1mSRjSRI9FxAA=
X-Received: by 2002:a05:6000:d2:: with SMTP id q18mr7482121wrx.4.1632168206522;
 Mon, 20 Sep 2021 13:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <8fa3c3e10446f99b75e3d4aef10624cfa2fdf72c.1632145015.git.tamas.lengyel@intel.com>
 <342dd9a2-88b3-34d5-d2ee-b288f8d81f5e@suse.com>
In-Reply-To: <342dd9a2-88b3-34d5-d2ee-b288f8d81f5e@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Sep 2021 16:02:50 -0400
X-Gmail-Original-Message-ID: <CABfawh=oS2oR5JKc2TB1WODAT8D4qSMEG1paV814CFCEWg8SKg@mail.gmail.com>
Message-ID: <CABfawh=oS2oR5JKc2TB1WODAT8D4qSMEG1paV814CFCEWg8SKg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/mem_sharing: don't lock parent during fork reset
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Sep 20, 2021 at 10:15 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.09.2021 15:40, Tamas K Lengyel wrote:
> > During fork reset operation the parent domain doesn't need to be gathered using
> > rcu_lock_live_remote_domain_by_id, the fork already has the parent pointer.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

