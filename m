Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78924619ECD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 18:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437785.692261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or0Yq-0004YL-F3; Fri, 04 Nov 2022 17:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437785.692261; Fri, 04 Nov 2022 17:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or0Yq-0004VV-Bu; Fri, 04 Nov 2022 17:32:56 +0000
Received: by outflank-mailman (input) for mailman id 437785;
 Fri, 04 Nov 2022 17:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L84E=3E=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1or0Yo-0004VF-F1
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 17:32:54 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b38545db-5c66-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 18:32:50 +0100 (CET)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:32:33 -0700
Received: from anantsin-mobl2.amr.corp.intel.com (HELO [10.209.97.57])
 ([10.209.97.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:32:32 -0700
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
X-Inumbo-ID: b38545db-5c66-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667583170; x=1699119170;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pPOPNM3vYCz/Z1s0LA7RHwJYYh7DKEACrCv7Y9YF86s=;
  b=JPdy2S90tVikMPKiz6Aa9mtiOkR8DdycrmvJisEC/Z/rW+/CdJKWm5cO
   1UeTHeJN5znUmeO6HnGTtguNuYkHQ95eh9/hq+haHvwviEKglMt1Lf5H6
   UhzdmSF5yslzJRAwhFUff06zs/+no2kV5oZtH4oLKRxcJ89SkhN2k7nrE
   BviOOAx/Jk7pPh1SWhcIJbd/pCxmpk6F0frhEVhYIVlDsm7bWDGcTDt6n
   OvhS5syF0UTgsNF2ugXbThkobE/K0IJjit4TzAP9sa4HsFKVTVze7G8/n
   si8vQJbg93Xk6+GlF34J3qsTgZKN1JAelg2/NvWM8RAO6kx8wf2t8QoT2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="307648581"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="307648581"
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="635164724"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; 
   d="scan'208";a="635164724"
Message-ID: <0a04e55c-ccfb-9383-1768-a88f4602fb4e@intel.com>
Date: Fri, 4 Nov 2022 10:32:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 5/5] x86: switch to cpu_feature_enabled() for
 X86_FEATURE_XENPV
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Pu Wen <puwen@hygon.cn>
References: <20221104072701.20283-1-jgross@suse.com>
 <20221104072701.20283-6-jgross@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221104072701.20283-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/22 00:27, Juergen Gross wrote:
> Convert the remaining cases of static_cpu_has(X86_FEATURE_XENPV) and
> boot_cpu_has(X86_FEATURE_XENPV) to use cpu_feature_enabled(), allowing
> more efficient code in case the kernel is configured without
> CONFIG_XEN_PV.

As with the rest:

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Seems like a very straightforward, sane set of cleanups.

