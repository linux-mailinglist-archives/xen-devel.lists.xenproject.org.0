Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B376A430
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 00:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573502.898264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQbO2-0001sr-Qs; Mon, 31 Jul 2023 22:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573502.898264; Mon, 31 Jul 2023 22:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQbO2-0001qm-OG; Mon, 31 Jul 2023 22:29:10 +0000
Received: by outflank-mailman (input) for mailman id 573502;
 Mon, 31 Jul 2023 22:29:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SN+h=DR=flex--seanjc.bounces.google.com=3sTXIZAYKCWoaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@srs-se1.protection.inumbo.net>)
 id 1qQbO0-0001qd-Ra
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 22:29:08 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9021a38-2ff1-11ee-b257-6b7b168915f2;
 Tue, 01 Aug 2023 00:29:07 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-585fb08172bso31623387b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jul 2023 15:29:07 -0700 (PDT)
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
X-Inumbo-ID: a9021a38-2ff1-11ee-b257-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690842546; x=1691447346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q8GvYD+4dtlsTwSTiHUPQzTJlHbTbzrpGF3h1vVBww=;
        b=wjwMM2KWT8HU0SHDHdNRxn0t00ajJ3rnXd0KHF3IvjHCM9C9HEucQqbNqO3DdnlESa
         nz4NidPHfLZdlM97AQO2l5R9cvi5qOsP8Ijvq8FdyQ975MNIp/vKfJQp4Fn/KRaq6Jwk
         4kloVUH4EDmpWV0M/Jbjnxx6ZpxxBUBTWBZfCkK7wrUfN/3hE3YtfIlsy05XGvIcQMBR
         YwOaTVtyj5jc9ti6xzcRvjvMofBrcZ2GDu27qgywzvVHzJ4o32YZtNXzHqvcANqA6/YW
         sTLo8o8faSsSn6oqDWZE2/b1jMu9Jj3r8qqQ2mBwBCqkSpgBEgjiP8UrfNG7IjOkrlZB
         RMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690842546; x=1691447346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q8GvYD+4dtlsTwSTiHUPQzTJlHbTbzrpGF3h1vVBww=;
        b=ZhDk+Fu1mif4EqxdEyXdpuJCwV+FTdO/B5N1D8EtbMWFfv4M4xpX88T4D+f9J8q06l
         7DpXK6a4SmDO00t49Ljwfyyk//0t+aN1ADUlmhZP/N4SVk3mLOiv+73B3UU+8i7HSNuF
         3ygl5uclI4TtfBxqmLP0C5DkaoEjTrKUMHfKgwlSiF7Jnt2pQoIhkr520N6mS06A/+6V
         R86ca9dT3GrQE6XuQgXVEtW60KelH2Ncfmkvgyip4vXG+Tk7EkllEMtgaxiuFD1LfIfZ
         ja3cwz/99Uvr0XE//sbzMzXKk48t6xyB2iOK5u7r/RUK/VnwBK1HgcR1v0FAztvAPTIK
         NS2w==
X-Gm-Message-State: ABy/qLZJuuVlhjQzZIIWwJDAPOm7vTmDwOlULNLD+QYAkRg9WgW4Ietn
	vgcP/HWsI71GWFyPDZeRpqhOSs0PlHA=
X-Google-Smtp-Source: APBJJlGgIomNHDqU6KhEMJb1Ck8ilBU2ctVZYZehyK88j/kbenJFHvBGJ75gfwK64a/yrr50dO0Jiu4+k6c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b109:0:b0:56d:502:9eb0 with SMTP id
 p9-20020a81b109000000b0056d05029eb0mr90305ywh.6.1690842545957; Mon, 31 Jul
 2023 15:29:05 -0700 (PDT)
Date: Mon, 31 Jul 2023 15:29:04 -0700
In-Reply-To: <20230731063317.3720-1-xin3.li@intel.com>
Mime-Version: 1.0
References: <20230731063317.3720-1-xin3.li@intel.com>
Message-ID: <ZMg1sD7IamB0INVs@google.com>
Subject: Re: [PATCH v9 00/36] x86: enable FRED for x86-64
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Tony Luck <tony.luck@intel.com>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
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
	Fei Li <fei1.li@intel.com>, Conghui <conghui.chen@intel.com>, 
	Ashok Raj <ashok.raj@intel.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jane Malalane <jane.malalane@citrix.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Yantengsi <siyanteng@loongson.cn>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Sathvika Vasireddy <sv@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"

On Sun, Jul 30, 2023, Xin Li wrote:
> This patch set enables the Intel flexible return and event delivery
> (FRED) architecture for x86-64.

...

> -- 
> 2.34.1

What is this based on?	FYI, you're using a version of git that will (mostly)
automatically generate the based, e.g. I do 

  git format-patch --base=HEAD~$nr ...

in my scripts, where $nr is the number of patches I am sending.  My specific
approaches requires HEAD-$nr to be a publicly visible object/commit, but that
should be the case the vast majority of the time anyways.

