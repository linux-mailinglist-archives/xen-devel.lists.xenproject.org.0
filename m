Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B2D76A4B4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 01:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573511.898285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQc8x-0007tD-Lg; Mon, 31 Jul 2023 23:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573511.898285; Mon, 31 Jul 2023 23:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQc8x-0007sX-Hq; Mon, 31 Jul 2023 23:17:39 +0000
Received: by outflank-mailman (input) for mailman id 573511;
 Mon, 31 Jul 2023 23:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PAQm=DR=flex--seanjc.bounces.google.com=3EEHIZAYKCd8TFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@srs-se1.protection.inumbo.net>)
 id 1qQc8w-0007sR-EG
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 23:17:38 +0000
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [2607:f8b0:4864:20::b4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fa9fcfd-2ff8-11ee-b257-6b7b168915f2;
 Tue, 01 Aug 2023 01:17:37 +0200 (CEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d1c693a29a0so5968323276.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 16:17:37 -0700 (PDT)
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
X-Inumbo-ID: 6fa9fcfd-2ff8-11ee-b257-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690845456; x=1691450256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A2YbEGxqz9SscBGtet0Gs0ciHUjPL61/tRobVSn5JSc=;
        b=Aspi3sVz1s4NKlFaJjQOa2DQlODn/JsCKt4eqnvhQolwNg6rVTEqjLQs26sN5J6ZNe
         3e/etHAaEqvAoxl+oSQQP1bHfmA59RbK7Nu0azx4K+EVcSxVntDfjH8buFsuy2V7KlEw
         5RZ7h2m65ZZHDqRcD6/spD/JjZaCVH323kw1HLp8C4YPZbjDkNb49TqTz+Z2vaOWATUw
         n/OnsLadTVEbeeCCi9f1Xp8cRMaUuSd29J6gHrEWBjtkXdfJ7q9euJ/ihFEIWOoOKssN
         /B9i1WTYQfm0A5NhSpMZHAiVkGnI47YF/h8cE5B0h4DZfCGtUwSF1W1GjS47WDQ5r/1d
         NbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690845456; x=1691450256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2YbEGxqz9SscBGtet0Gs0ciHUjPL61/tRobVSn5JSc=;
        b=GJTGHDJ2YPW8hv2HNXjvPG4FV42KFZhG6DUkgahg+2PkwlsA0AJEa7zUuJpr4+ZyYG
         F6XfIWOTFmm0Szpgk2st7kOxTgytSYXzgTOFhhOO4QHWAnYzwO6yfsHljARB2u3DITs2
         SaJ9VwWuNZQSyGvV/kdiTVvEaXbLpsXn/hDpnSKre/PdaGAremHojmhEnMxjE52I6pYc
         6/JOt58OKX1R3pQTTn9iS2Tt97yXX+oxrXnGVa9F0IYCJ5w+qaLG8qVn4uCFxwuCHVrn
         wcyjK+BCx96bbjrGdo50XgbjlhjtR3e8UriM9smhThs5hYhzTFnucacLHiYp2SK1folK
         3HRA==
X-Gm-Message-State: ABy/qLa2bqWH05mtJWjF9AzPZPWVNQw8fJ4ezKBxuiGv6jzG31eaHZm8
	LODQYY4VxexPRy92GnWdU9Oz7ZkbgdA=
X-Google-Smtp-Source: APBJJlETEe4EZ6/j95cQ4sv3ryYhK33RfUu+RWsNUCsL/BaRynxJ5PFVR6kJ5MkvzQvyz83entZG77hN4jM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:69c7:0:b0:d07:f1ed:521a with SMTP id
 e190-20020a2569c7000000b00d07f1ed521amr63258ybc.4.1690845456129; Mon, 31 Jul
 2023 16:17:36 -0700 (PDT)
Date: Mon, 31 Jul 2023 16:17:34 -0700
In-Reply-To: <SA1PR11MB6734A02EEFD83969F1965A8FA805A@SA1PR11MB6734.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <20230731063317.3720-1-xin3.li@intel.com> <ZMg1sD7IamB0INVs@google.com>
 <SA1PR11MB6734A02EEFD83969F1965A8FA805A@SA1PR11MB6734.namprd11.prod.outlook.com>
Message-ID: <ZMhBDoTxqghvF7G7@google.com>
Subject: Re: [PATCH v9 00/36] x86: enable FRED for x86-64
From: Sean Christopherson <seanjc@google.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Tony Luck <tony.luck@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Jurgen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Kim Phillips <kim.phillips@amd.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Suren Baghdasaryan <surenb@google.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Jiaxi Chen <jiaxi.chen@linux.intel.com>, 
	Babu Moger <babu.moger@amd.com>, Jim Mattson <jmattson@google.com>, 
	Sandipan Das <sandipan.das@amd.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, Breno Leitao <leitao@debian.org>, 
	Nikunj A Dadhania <nikunj@amd.com>, Brian Gerst <brgerst@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ze Gao <zegao2021@gmail.com>, 
	Fei1 Li <fei1.li@intel.com>, Conghui <conghui.chen@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jane Malalane <jane.malalane@citrix.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Yantengsi <siyanteng@loongson.cn>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Sathvika Vasireddy <sv@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 31, 2023, Xin3 Li wrote:
> > > This patch set enables the Intel flexible return and event delivery
> > > (FRED) architecture for x86-64.
> > 
> > ...
> > 
> > > --
> > > 2.34.1
> > 
> > What is this based on?
> 
> The tip tree master branch.
> 
> > FYI, you're using a version of git that will (mostly)
> > automatically generate the based, e.g. I do
> > 
> >   git format-patch --base=HEAD~$nr ...
> > 
> > in my scripts, where $nr is the number of patches I am sending.  My specific
> > approaches requires HEAD-$nr to be a publicly visible object/commit, but that
> > should be the case the vast majority of the time anyways.
> 
> Are you talking about that you only got a subset of this patch set?

No, I'm saying I don't want to waste a bunch of time tracking down exactly which
commit a 36 patch series is based on.  E.g. I just refreshed tip/master and still
get:

Applying: x86/idtentry: Incorporate definitions/declarations of the FRED external interrupt handler type
error: sha1 information is lacking or useless (arch/x86/include/asm/idtentry.h).
error: could not build fake ancestor
Patch failed at 0024 x86/idtentry: Incorporate definitions/declarations of the FRED external interrupt handler type
hint: Use 'git am --show-current-patch=diff' to see the failed patch

> HPA told me he only got patches 0-25/36.
> 
> And I got several undeliverable email notifications, saying
> "
> The following message to <tglx@linutronix.de> was undeliverable.
> The reason for the problem:
> 5.x.1 - Maximum number of delivery attempts exceeded. [Default] 450-'4.7.25 Client host rejected: cannot find your hostname, [134.134.136.31]'
> "
> 
> I guess there were some problems with the Intel mail system last night,
> probably I should resend this patch set later.

Yes, lore also appears to be missing patches.  I grabbed the mbox off of KVM's
patchwork instance.

