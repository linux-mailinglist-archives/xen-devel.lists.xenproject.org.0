Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33203726007
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 14:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544750.850726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sbP-0007OE-9m; Wed, 07 Jun 2023 12:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544750.850726; Wed, 07 Jun 2023 12:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6sbP-0007Lq-6w; Wed, 07 Jun 2023 12:49:27 +0000
Received: by outflank-mailman (input) for mailman id 544750;
 Wed, 07 Jun 2023 12:49:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JaSR=B3=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1q6sbM-0007Lk-Pz
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 12:49:25 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b79da748-0531-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 14:49:21 +0200 (CEST)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 05:49:17 -0700
Received: from vsmyers-mobl2.amr.corp.intel.com (HELO [10.212.146.233])
 ([10.212.146.233])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 05:49:16 -0700
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
X-Inumbo-ID: b79da748-0531-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686142161; x=1717678161;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=96j5LP+QrdvCGDRDBIDgXK+1HoouV0Xv0Dmwi4N0S9M=;
  b=nwFyXZmi/DiGqXa46dzeKdrWW3w4m3RLQlwc3ykmmZZeuBzdJ30CU2Gb
   SsAQqPi9qrKeh2pZYJ0OpxjVX0nOzEGqep2WvaIkPT0ULZpWzRCCMbWWc
   2hKNc/FAvGQ4xxNsk0RlEKYq3R1YPDAPbJbHilc5/jS6/MhTk43HZ8Ct2
   sDl0AflnDpXhGcQWvosPHViHjMmuQombOzPiP1HOuKjDjc1wvNV7CCV7/
   Z+3+yfPrGCJP7ORGVFZFhvIl2H1lNAKOBzYyOBFh7qtReMZNvUHyg31s1
   0sb5augaEimGI1cY2FAek4+bsz/yJufM7tVGnofXnkMBJiCNWxti0lC2s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="355829398"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="355829398"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774592705"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; 
   d="scan'208";a="774592705"
Message-ID: <1f633e99-d294-6932-31e9-0eb158d030ea@intel.com>
Date: Wed, 7 Jun 2023 05:49:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 0/4] x86/fixmap: Unify FIXADDR_TOP
Content-Language: en-US
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 Alexey Makhalov <amakhalov@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Borislav Petkov <bp@alien8.de>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Brian Gerst <brgerst@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Woodhouse <dwmw@amazon.co.uk>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Usama Arif <usama.arif@bytedance.com>,
 virtualization@lists.linux-foundation.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, x86@kernel.org,
 xen-devel@lists.xenproject.org
References: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <cover.1684137557.git.houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/23 01:19, Hou Wenlong wrote:
> This patchset unifies FIXADDR_TOP as a variable for x86, allowing the
> fixmap area to be movable and relocated with the kernel image in the
> x86/PIE patchset [0]. This enables the kernel image to be relocated in
> the top 512G of the address space.

What problems does this patch set solve?  How might that solution be
visible to end users?  Why is this problem important to you?

Also, while you're waiting for someone to review _your_ code, have you
considered reviewing anyone else's code?  I don't think I've seen any
review activity from you lately.

