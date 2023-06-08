Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFA727B7C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 11:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545217.851521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7C18-0003OM-Ix; Thu, 08 Jun 2023 09:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545217.851521; Thu, 08 Jun 2023 09:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7C18-0003MR-Fu; Thu, 08 Jun 2023 09:33:18 +0000
Received: by outflank-mailman (input) for mailman id 545217;
 Thu, 08 Jun 2023 09:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZNzU=B4=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1q7C17-0003ML-IT
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 09:33:17 +0000
Received: from out0-212.mail.aliyun.com (out0-212.mail.aliyun.com
 [140.205.0.212]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb3b861-05df-11ee-8611-37d641c3527e;
 Thu, 08 Jun 2023 11:33:13 +0200 (CEST)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.TOc6qlT_1686216783) by smtp.aliyun-inc.com;
 Thu, 08 Jun 2023 17:33:04 +0800
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
X-Inumbo-ID: 7bb3b861-05df-11ee-8611-37d641c3527e
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R551e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047201;MF=houwenlong.hwl@antgroup.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---.TOc6qlT_1686216783;
Date: Thu, 08 Jun 2023 17:33:03 +0800
From: "Hou Wenlong" <houwenlong.hwl@antgroup.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc:  <linux-kernel@vger.kernel.org>,
  "Lai Jiangshan" <jiangshan.ljs@antgroup.com>,
  "Alexey Makhalov" <amakhalov@vmware.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,
  "Andy Lutomirski" <luto@kernel.org>,
  "Anshuman Khandual" <anshuman.khandual@arm.com>,
  "Borislav Petkov" <bp@alien8.de>,
  "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
  "Brian Gerst" <brgerst@gmail.com>,
  "Dave Hansen" <dave.hansen@linux.intel.com>,
  "David Woodhouse" <dwmw@amazon.co.uk>,
  "H. Peter Anvin" <hpa@zytor.com>,
  "Ingo Molnar" <mingo@redhat.com>,
  "Josh Poimboeuf" <jpoimboe@kernel.org>,
  "Juergen Gross" <jgross@suse.com>,
  "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
  "=?UTF-8?B?TWlrZSBSYXBvcG9ydCAoSUJNKQ==?=" <rppt@kernel.org>,
  "Pasha Tatashin" <pasha.tatashin@soleen.com>,
  "Peter Zijlstra" <peterz@infradead.org>,
  "=?UTF-8?B?U3JpdmF0c2EgUy4gQmhhdCAoVk13YXJlKQ==?=" <srivatsa@csail.mit.edu>,
  "Suren Baghdasaryan" <surenb@google.com>,
  "Thomas Gleixner" <tglx@linutronix.de>,
  "Usama Arif" <usama.arif@bytedance.com>,
   <virtualization@lists.linux-foundation.org>,
  "VMware PV-Drivers Reviewers" <pv-drivers@vmware.com>,
   <x86@kernel.org>,
   <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC 0/4] x86/fixmap: Unify FIXADDR_TOP
Message-ID: <20230608093303.GA16983@k08j02272.eu95sqa>
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
 <1f633e99-d294-6932-31e9-0eb158d030ea@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f633e99-d294-6932-31e9-0eb158d030ea@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Wed, Jun 07, 2023 at 08:49:15PM +0800, Dave Hansen wrote:
> On 5/15/23 01:19, Hou Wenlong wrote:
> > This patchset unifies FIXADDR_TOP as a variable for x86, allowing the
> > fixmap area to be movable and relocated with the kernel image in the
> > x86/PIE patchset [0]. This enables the kernel image to be relocated in
> > the top 512G of the address space.
> 
> What problems does this patch set solve?  How might that solution be
> visible to end users?  Why is this problem important to you?
> 
> Also, while you're waiting for someone to review _your_ code, have you
> considered reviewing anyone else's code?  I don't think I've seen any
> review activity from you lately.

Hello,

Sorry for bothering you. This patch is not important; it is just a part
of our PIE patchset. I should be more patient.

We want to build the kernel as PIE and allow the kernel image area,
including the fixmap area, to be placed at any virtual address. We have
also implemented a PV Linux guest based on PIE, which can be used in
software virtualization similar to Lguest. PIE makes the guest kernel
share the host kernel space similar to a normal userspace process.
Additionally, we are considering whether it is possible to use PIE and
PVOPS to implement a user-mode kernel.

Thank you for your advice. I will participate more actively in community
review activities. Sorry again for bothering you.

Thanks.

