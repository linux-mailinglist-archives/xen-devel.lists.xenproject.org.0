Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D55520E1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 17:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352811.579679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3JJb-0005C5-CR; Mon, 20 Jun 2022 15:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352811.579679; Mon, 20 Jun 2022 15:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3JJb-00059j-9H; Mon, 20 Jun 2022 15:27:47 +0000
Received: by outflank-mailman (input) for mailman id 352811;
 Mon, 20 Jun 2022 15:27:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0pT=W3=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1o3JJZ-00059d-Jd
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 15:27:46 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83dd4510-f0ad-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 17:27:40 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:27:36 -0700
Received: from echeresh-mobl1.amr.corp.intel.com (HELO [10.209.15.145])
 ([10.209.15.145])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 08:27:36 -0700
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
X-Inumbo-ID: 83dd4510-f0ad-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655738860; x=1687274860;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8giL0qZv3yIElRFo4fVuIKMG5Tx+3XAwog7jJ8DWOI8=;
  b=fsMA6M5O2EmDaq5pGmmWI/nwriHtxrXSQO9VZlCo8PJXaFm+qUu00HPL
   Ctu5NI79TH+QTJmPzriPmA+Cg9uq+8K3xfVBmpQPKk/AXqiUNj0FZ/NM1
   x4KnD7thqXc/M+5rOpi2+DB9fV6sbKt08q7I0ciI/qJw9bgLXGS9uKCYt
   D3Ssg3tf9njp1y5RYR1uLQi5rgz0V29yNXMWxGWsX5bKNWmIuGsB2lLJt
   nduTqXVLHwv8knJXS2VDAf83ET7KRO/ad4kAoKxKlL/mV6v+2/SS3x5DF
   pKFnFpDU6ujlMwc2ZjrGuVy4XR1Za6XTnRnvjLnZvgQetT3/qxO2WYlfN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="343915119"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="343915119"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="561998169"
Message-ID: <63ccccac-2aa7-8850-9cd3-a8b7b89e1872@intel.com>
Date: Mon, 20 Jun 2022 08:27:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] x86/pat: fix x86_has_pat_wp()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, jbeulich@suse.com,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-2-jgross@suse.com> <YrBLU2C5cJoalnax@zn.tnic>
 <1cfde4bf-241f-d94c-ffd7-2a11cf9aa1f2@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <1cfde4bf-241f-d94c-ffd7-2a11cf9aa1f2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/22 03:41, Juergen Gross wrote:
>> But I'm only guessing - this needs a *lot* more elaboration and
>> explanation why exactly this is needed.
> 
> I will correct the code and update the commit message.

It would also be great to cover the end-user-visible impact of the bug
and the fix.  It _looks_ like it will probably only affect an SEV
system's ability to read some EFI data.  That will presumably be pretty
bad because it ends up reading from an encrypted mapping instead of a
decrypted one.

The

	pr_warn("failed to early memremap...

is (counterintuitively) what is wanted here.

Right?

