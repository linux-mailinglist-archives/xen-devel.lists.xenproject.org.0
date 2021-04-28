Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30436E0EA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 23:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119583.226117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbriO-0000Ed-7v; Wed, 28 Apr 2021 21:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119583.226117; Wed, 28 Apr 2021 21:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbriO-0000EE-4f; Wed, 28 Apr 2021 21:27:24 +0000
Received: by outflank-mailman (input) for mailman id 119583;
 Wed, 28 Apr 2021 21:27:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RKXr=JZ=goodmis.org=rostedt@kernel.org>)
 id 1lbriM-0000E6-33
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 21:27:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83793284-a4c2-4e3d-9a80-719f8191aa93;
 Wed, 28 Apr 2021 21:27:21 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB10F6143C;
 Wed, 28 Apr 2021 21:27:15 +0000 (UTC)
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
X-Inumbo-ID: 83793284-a4c2-4e3d-9a80-719f8191aa93
Date: Wed, 28 Apr 2021 17:27:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@linux.alibaba.com>,
 Thomas Gleixner <tglx@linutronix.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Andi Kleen <ak@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, Josh Poimboeuf
 <jpoimboe@redhat.com>, Uros Bizjak <ubizjak@gmail.com>, Maxim Levitsky
 <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Alexandre Chartre <alexandre.chartre@oracle.com>,
 Joerg Roedel <jroedel@suse.de>, Jian Cai <caij2003@gmail.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] x86/xen/entry: Rename xenpv_exc_nmi to
 noist_exc_nmi
Message-ID: <20210428172714.53adac43@gandalf.local.home>
In-Reply-To: <20210426230949.3561-2-jiangshanlai@gmail.com>
References: <20210426230949.3561-1-jiangshanlai@gmail.com>
	<20210426230949.3561-2-jiangshanlai@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Apr 2021 07:09:46 +0800
Lai Jiangshan <jiangshanlai@gmail.com> wrote:

> From: Lai Jiangshan <laijs@linux.alibaba.com>
> 
> There is no any functionality change intended.  Just rename it and
> move it to arch/x86/kernel/nmi.c so that we can resue it later in
> next patch for early NMI and kvm.

Nit, but in change logs, please avoid stating "next patch" as searching git
history (via git blame or whatever) there is no such thing as "next patch".

Just state: "so that we can reuse it for early NMI and KVM."

I also just noticed the typo in "resue". Or maybe both NMI and KVM should
be sued again ;-)

-- Steve

