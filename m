Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEF457BE5
	for <lists+xen-devel@lfdr.de>; Sat, 20 Nov 2021 06:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228322.395085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moJ3Z-0002GP-MJ; Sat, 20 Nov 2021 05:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228322.395085; Sat, 20 Nov 2021 05:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1moJ3Z-0002EA-J4; Sat, 20 Nov 2021 05:36:57 +0000
Received: by outflank-mailman (input) for mailman id 228322;
 Sat, 20 Nov 2021 02:23:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEuL=QH=intel.com=philip.li@srs-se1.protection.inumbo.net>)
 id 1moG2Q-0000tr-3O
 for xen-devel@lists.xenproject.org; Sat, 20 Nov 2021 02:23:34 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d948a555-49a8-11ec-9787-a32c541c8605;
 Sat, 20 Nov 2021 03:23:31 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 18:23:28 -0800
Received: from rli9-dbox.sh.intel.com (HELO rli9-dbox) ([10.239.159.142])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 18:23:24 -0800
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
X-Inumbo-ID: d948a555-49a8-11ec-9787-a32c541c8605
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="258320555"
X-IronPort-AV: E=Sophos;i="5.87,249,1631602800"; 
   d="scan'208";a="258320555"
X-IronPort-AV: E=Sophos;i="5.87,249,1631602800"; 
   d="scan'208";a="508141382"
Date: Sat, 20 Nov 2021 10:24:19 +0800
From: Philip Li <philip.li@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] xen/pvh: add missing prototype to header
Message-ID: <YZhcU3e0imdoKV7w@rli9-dbox>
References: <20211119153913.21678-1-jgross@suse.com>
 <0c654659-b010-791f-78e7-769108934ce2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c654659-b010-791f-78e7-769108934ce2@intel.com>

On Fri, Nov 19, 2021 at 08:47:49AM -0800, Dave Hansen wrote:
> On 11/19/21 7:39 AM, Juergen Gross wrote:
> > The prototype of mem_map_via_hcall() is missing in its header, so add
> > it.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Fixes: a43fb7da53007e67ad ("xen/pvh: Move Xen code for getting mem map via hcall out of common file")
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> $ git describe a43fb7da53007e67ad
> v4.20-rc6-5-ga43fb7da5300
> 
> Better late than never, I guess.  I wonder what made 0day find this now.
hi Dave, we recently find some unexpected failures for certain bisections,
with the fix, such failures are rerun to see whether we can successfully detect 
bad commits, which i think this resulted in extra but late finding on old
commit on mainline. We will keep scan our bisection process to further improve
it to reduce this kind late reporting.

> 
> I also guess the one mem_map_via_hcall() call site just used the __weak
> definition so it didn't cause problems if there wasn't a declaration in
> the header.

