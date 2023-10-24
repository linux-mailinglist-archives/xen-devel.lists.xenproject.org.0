Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FB07D4588
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 04:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621668.968339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv7Eg-0006iI-U7; Tue, 24 Oct 2023 02:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621668.968339; Tue, 24 Oct 2023 02:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv7Eg-0006fl-RV; Tue, 24 Oct 2023 02:33:38 +0000
Received: by outflank-mailman (input) for mailman id 621668;
 Tue, 24 Oct 2023 02:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m8rW=GG=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1qv7Ef-0006ff-EM
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 02:33:37 +0000
Received: from out0-213.mail.aliyun.com (out0-213.mail.aliyun.com
 [140.205.0.213]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8de0115-7215-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 04:33:34 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.V6N0APV_1698114808) by smtp.aliyun-inc.com;
 Tue, 24 Oct 2023 10:33:29 +0800
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
X-Inumbo-ID: b8de0115-7215-11ee-98d5-6d05b1d4d9a1
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047202;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---.V6N0APV_1698114808;
Date: Tue, 24 Oct 2023 10:33:28 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"moderated list:XEN HYPERVISOR X86" <xen-devel@lists.xenproject.org>,
	"open list:X86 PLATFORM DRIVERS - ARCH" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH 1/2] x86/xen/pvh: Set up percpu for stack canary in
 32-bit kernel entry
Message-ID: <20231024023328.GA29837@k08j02272.eu95sqa>
References: <cover.1698051454.git.houwenlong.hwl@antgroup.com>
 <90df6cf5674241a85ac7dfe0a1558f1fd025cc17.1698051454.git.houwenlong.hwl@antgroup.com>
 <CAHp75VeXiOprRDNakewo2iSe==EeLUxfxuPYS3R+ZsY2KDmQBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeXiOprRDNakewo2iSe==EeLUxfxuPYS3R+ZsY2KDmQBQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Mon, Oct 23, 2023 at 08:02:02PM +0800, Andy Shevchenko wrote:
> On Mon, Oct 23, 2023 at 12:10 PM Hou Wenlong
> <houwenlong.hwl@antgroup.com> wrote:
> >
> > In a 32-bit SMP kernel, the stack canary is a percpu variable accessed
> > as %fs:__stack_chk_guard. However, the ABI for PVH entry does not
> > specify the %fs register state. It currently works because the initial
> > %fs register is 0x10 for QEMU, which is the same as $PVH_DS_SEL.
> 
> > %However, for added safety, the percpu should be set up explicitly
> > %before calling xen_prepare_pvh(), which accesses the stack canary.
> 
> Stray leading % in two lines above.
>
Oh, sorry for that. It was added by mistake by my editor, and I didn't
carefully review it before sending.
 
Thanks!

> -- 
> With Best Regards,
> Andy Shevchenko

