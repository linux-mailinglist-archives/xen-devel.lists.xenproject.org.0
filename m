Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526CB769213
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 11:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572862.896931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQPR7-0003Ob-JQ; Mon, 31 Jul 2023 09:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572862.896931; Mon, 31 Jul 2023 09:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQPR7-0003Lo-G5; Mon, 31 Jul 2023 09:43:33 +0000
Received: by outflank-mailman (input) for mailman id 572862;
 Mon, 31 Jul 2023 09:43:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYfp=DR=kernel.org=mhiramat@srs-se1.protection.inumbo.net>)
 id 1qQPR6-0003Li-Rq
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 09:43:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b47720a9-2f86-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 11:43:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3DCB60FDE;
 Mon, 31 Jul 2023 09:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF064C433C8;
 Mon, 31 Jul 2023 09:43:11 +0000 (UTC)
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
X-Inumbo-ID: b47720a9-2f86-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690796608;
	bh=lbshF7OnIf+ShzXg9sWYCNJD7v4GqiDpC1WTlweUVIw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jA6auAhOhFj5SZDRCEf2dZqVFRoPfsG08UJgYypsJjaXcRuJIvWWXIhRSIIpK9Shp
	 ozxGEb8OrB52TVM8mvm6ELO8Bjvc6MZms4+pZNp8MBiqt7lnp5HCLoP4RNq0RueNAE
	 YX4r/uBUyO5sdRou/PP4ipFPMyYT0OrMBm/sRc9Ve5fThd2+57fTvl7t9ZhmEPp3Lh
	 4WOZyZUfl3Fb2BviKBayRNiLZWEo8DDunJYoijrZCjHyF/UqD/cxDXnG8Rux4UZNCu
	 c7Iw4n7RRvscYp7z4hzCMxtPFNgpvghtt00/1Tcd/0d63wKan/msaki0A7NIwthB9K
	 +Se4fZCsj8nSQ==
Date: Mon, 31 Jul 2023 18:43:09 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Xin Li <xin3.li@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org, Jonathan Corbet
 <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Oleg Nesterov
 <oleg@redhat.com>, Tony Luck <tony.luck@intel.com>, "K . Y . Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, Peter
 Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Randy Dunlap <rdunlap@infradead.org>, Steven
 Rostedt <rostedt@goodmis.org>, Kim Phillips <kim.phillips@amd.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Liam R . Howlett"
 <Liam.Howlett@Oracle.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, "Kirill A . Shutemov"
 <kirill.shutemov@linux.intel.com>, Suren Baghdasaryan <surenb@google.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Jiaxi Chen
 <jiaxi.chen@linux.intel.com>, Babu Moger <babu.moger@amd.com>, Jim Mattson
 <jmattson@google.com>, Sandipan Das <sandipan.das@amd.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Reinette
 Chatre <reinette.chatre@intel.com>, Daniel Sneddon
 <daniel.sneddon@linux.intel.com>, Breno Leitao <leitao@debian.org>, Nikunj
 A Dadhania <nikunj@amd.com>, Brian Gerst <brgerst@gmail.com>, Sami Tolvanen
 <samitolvanen@google.com>, Alexander Potapenko <glider@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 "Eric W . Biederman" <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Masami Hiramatsu <mhiramat@kernel.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Ze Gao <zegao2021@gmail.com>, Fei Li
 <fei1.li@intel.com>, Conghui <conghui.chen@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Mark
 Rutland <mark.rutland@arm.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jane Malalane
 <jane.malalane@citrix.com>, David Woodhouse <dwmw@amazon.co.uk>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Arnaldo Carvalho de Melo
 <acme@redhat.com>, Yantengsi <siyanteng@loongson.cn>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v9 05/36] x86/opcode: Add ERETU, ERETS instructions to
 x86-opcode-map
Message-Id: <20230731184309.9888dfd44fa1a5fd69c779cd@kernel.org>
In-Reply-To: <20230731063317.3720-6-xin3.li@intel.com>
References: <20230731063317.3720-1-xin3.li@intel.com>
	<20230731063317.3720-6-xin3.li@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Jul 2023 23:32:46 -0700
Xin Li <xin3.li@intel.com> wrote:

> From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
> 
> Add instruction opcodes used by FRED ERETU/ERETS to x86-opcode-map.
> 
> Opcode numbers are per FRED spec v5.0.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>

This looks good to me. (ERETS has the opcode F2 0F 01 CA, ERETU
has the opcode F3 0F 01 CA)

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you,

> ---
>  arch/x86/lib/x86-opcode-map.txt       | 2 +-
>  tools/arch/x86/lib/x86-opcode-map.txt | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
> index 5168ee0360b2..7a269e269dc0 100644
> --- a/arch/x86/lib/x86-opcode-map.txt
> +++ b/arch/x86/lib/x86-opcode-map.txt
> @@ -1052,7 +1052,7 @@ EndTable
>  
>  GrpTable: Grp7
>  0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B)
> -1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
> +1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B) | ERETU (F3),(010),(11B) | ERETS (F2),(010),(11B)
>  2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
>  3: LIDT Ms
>  4: SMSW Mw/Rv
> diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
> index 5168ee0360b2..7a269e269dc0 100644
> --- a/tools/arch/x86/lib/x86-opcode-map.txt
> +++ b/tools/arch/x86/lib/x86-opcode-map.txt
> @@ -1052,7 +1052,7 @@ EndTable
>  
>  GrpTable: Grp7
>  0: SGDT Ms | VMCALL (001),(11B) | VMLAUNCH (010),(11B) | VMRESUME (011),(11B) | VMXOFF (100),(11B) | PCONFIG (101),(11B) | ENCLV (000),(11B)
> -1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B)
> +1: SIDT Ms | MONITOR (000),(11B) | MWAIT (001),(11B) | CLAC (010),(11B) | STAC (011),(11B) | ENCLS (111),(11B) | ERETU (F3),(010),(11B) | ERETS (F2),(010),(11B)
>  2: LGDT Ms | XGETBV (000),(11B) | XSETBV (001),(11B) | VMFUNC (100),(11B) | XEND (101)(11B) | XTEST (110)(11B) | ENCLU (111),(11B)
>  3: LIDT Ms
>  4: SMSW Mw/Rv
> -- 
> 2.34.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

