Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 144AE619AE8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 16:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437689.692153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyF5-00008r-BJ; Fri, 04 Nov 2022 15:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437689.692153; Fri, 04 Nov 2022 15:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyF5-00005G-7a; Fri, 04 Nov 2022 15:04:23 +0000
Received: by outflank-mailman (input) for mailman id 437689;
 Fri, 04 Nov 2022 15:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L84E=3E=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1oqyF3-0008WD-UW
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 15:04:21 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4876cf2-5c51-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 16:04:20 +0100 (CET)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:04:17 -0700
Received: from anantsin-mobl2.amr.corp.intel.com (HELO [10.209.97.57])
 ([10.209.97.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:04:16 -0700
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
X-Inumbo-ID: f4876cf2-5c51-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667574260; x=1699110260;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jw3Y9otHji7QTX5CGBkw7V4WGp0ZcL6hQNZS7M1jLPk=;
  b=mjIZuSdqTte5BObNu/vKtSGXcM10v2WcVmjTVr7Ta8O/N2++Y1Hx8JmC
   6lsgBorqsAmkaISN9ZUo+Zro7MGys6TXhBGJJRrPpP7bo7ZxMMdOMXtn0
   goIAuxSfaI3THfwo4pNtfrsHVtliI0u4bmVGCEIPTlWPzaDEBhhu0xkNK
   g4L5CgfWJA7i3iooPhOmN5v4ARt0n2+Y8J5NFPIASzcu79+mIbNZ/1efy
   wCC3h/zmFb6AKvOQWwgnye9Dmo9Y0xI16SGQm42tSRrnQSYt0S8Tr43dR
   fr/UW/Ael+I+GfZ92V7PSJORuWs7fVEBfxNp3vy+WF28mJ4y8zrBmCyl3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="311726028"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="311726028"
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="698672785"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="698672785"
Message-ID: <8b5e9d9d-b55b-7af0-7ea7-f7130f6a1886@intel.com>
Date: Fri, 4 Nov 2022 08:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/5] x86: drop 32-bit Xen PV guest code in
 update_task_stack()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20221104072701.20283-1-jgross@suse.com>
 <20221104072701.20283-4-jgross@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221104072701.20283-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/22 00:26, Juergen Gross wrote:
> Testing for Xen PV guest mode in a 32-bit only code section can be
> dropped, as Xen PV guests are supported in 64-bit mode only.
> 
> While at it switch from boot_cpu_has() to cpu_feature_enabled() in the
> 64-bit part of the code.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

