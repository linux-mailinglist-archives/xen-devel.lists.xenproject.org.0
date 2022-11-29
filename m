Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E063C6DE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 18:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449580.706425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p04oT-0007bO-UZ; Tue, 29 Nov 2022 17:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449580.706425; Tue, 29 Nov 2022 17:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p04oT-0007Z1-Rl; Tue, 29 Nov 2022 17:54:33 +0000
Received: by outflank-mailman (input) for mailman id 449580;
 Tue, 29 Nov 2022 17:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xhDl=35=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1p04oS-0007Yv-QY
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 17:54:33 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de083b81-700e-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 18:54:29 +0100 (CET)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 09:43:54 -0800
Received: from wteng-mobl1.gar.corp.intel.com (HELO [10.209.83.194])
 ([10.209.83.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 09:43:53 -0800
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
X-Inumbo-ID: de083b81-700e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669744468; x=1701280468;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lKETQwm8/AYRbtudWQgvt+s2fE4xcmiG++pU4pE+d6w=;
  b=NrGHt9hmVH34l1gobtYnuPPw9Lmy1ow5L98bzjwwI5f0QYoxCqk95X0c
   L863JL5RsSTAIeK5TXg/Fpo0x3HN0fQB9TKTgk2zjUT9Fi/fuL07i6rQq
   +9t/QT8r41O8gdhcNJWN6oAiwoZqEnL+T9QGKbsmTah15Tzx1t8dATULK
   3nxwFQ2eDa57HVM0Ei4nz5VGHlH1CDqxPVDGpH9oi/B19wODmymusbeR+
   X5P+PxWXs49ohxFWxXZfAGBTJSgPGVzaUw2Fb0qEhq7Si1aW+Ydwv8QDB
   VaD4SiSh883mm3BAiGlHOho+XCPf1egVYUEg9pivFqeeo9Te2XbX63PCK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="316335762"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; 
   d="scan'208";a="316335762"
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="768512573"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="768512573"
Message-ID: <6b212148-4e3f-3ef6-7922-901175746d44@intel.com>
Date: Tue, 29 Nov 2022 09:43:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Alex Chiang <achiang@hp.com>,
 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
 linux-acpi@vger.kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
 <20221121102113.41893-2-roger.pau@citrix.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221121102113.41893-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/22 02:21, Roger Pau Monne wrote:
> When running as a Xen dom0 the number of CPUs available to Linux can
> be different from the number of CPUs present on the system, but in
> order to properly fetch processor performance related data _PDC must
> be executed on all the physical CPUs online on the system.

How is the number of CPUs available to Linux different?

Is this a result of the ACPI tables that dom0 sees being "wrong"?

> The current checks in processor_physically_present() result in some
> processor objects not getting their _PDC methods evaluated when Linux
> is running as Xen dom0.  Fix this by introducing a custom function to
> use when running as Xen dom0 in order to check whether a processor
> object matches a CPU that's online.

What is the end user visible effect of this problem and of the solution?



