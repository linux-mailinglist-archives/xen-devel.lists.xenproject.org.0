Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C056619AB4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437672.692108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqy9F-0005BW-QL; Fri, 04 Nov 2022 14:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437672.692108; Fri, 04 Nov 2022 14:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqy9F-00058N-Mb; Fri, 04 Nov 2022 14:58:21 +0000
Received: by outflank-mailman (input) for mailman id 437672;
 Fri, 04 Nov 2022 14:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L84E=3E=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1oqy9E-00058H-By
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:58:20 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c780e8c-5c51-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 15:58:17 +0100 (CET)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:58:15 -0700
Received: from anantsin-mobl2.amr.corp.intel.com (HELO [10.209.97.57])
 ([10.209.97.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:58:14 -0700
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
X-Inumbo-ID: 1c780e8c-5c51-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667573897; x=1699109897;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lPsbdi3iEDPlS9ix5hC1hyJYJM01ewfiP0KOIWr82XQ=;
  b=cNpMmDIhtY9Kjl3imF7RbBRNcFmzR8D8CRBafXG+r7CQrTviu/Sk/puB
   d88eoLtBVfwSdPMaXbj2xuKyEwLT7aMHkWphIapwNShPnpH4lo2s085j0
   cbqS1jb7qA9K4jLQWnMhvNKN7B/5qEFHk8j9q+ZMamcynr1N30Eop2fOK
   9Mr+QvkTnpLG5RteNPGYIJEE9/4rY0SqcUmFm45bsU1LkZ+FudKNC7XZm
   3PDbS2ia1jMQElSa5i29AEeignLfBYnY5TEXabnZwlBk3fYyyhrqrnWoy
   iZGbiyN0YC9ATVendemme05c7nrZkPBzWdyaDjMyqopm3vvi7aCLusm2X
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="289700872"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="289700872"
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="637606501"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="637606501"
Message-ID: <41808063-94b7-b2bc-a261-23d99ba1c0ba@intel.com>
Date: Fri, 4 Nov 2022 07:58:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/5] x86: remove unneeded 64-bit dependency in
 arch_enter_from_user_mode()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20221104072701.20283-1-jgross@suse.com>
 <20221104072701.20283-3-jgross@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221104072701.20283-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/22 00:26, Juergen Gross wrote:
> The check for 64-bit mode when testing X86_FEATURE_XENPV isn't needed,
> as Xen PV guests are no longer supported in 32-bit mode.

Tiniest nit if you revise this: please call out that this "no longer
supported" thing is enforced in Kconfig.  It's not just some random
edict where we pronounced 32-bit PV guests unsupported.

Otherwise:

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>



