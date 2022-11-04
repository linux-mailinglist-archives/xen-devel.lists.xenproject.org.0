Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03240619AA9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 15:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437667.692097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqy7y-0004cP-En; Fri, 04 Nov 2022 14:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437667.692097; Fri, 04 Nov 2022 14:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqy7y-0004aR-Bm; Fri, 04 Nov 2022 14:57:02 +0000
Received: by outflank-mailman (input) for mailman id 437667;
 Fri, 04 Nov 2022 14:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L84E=3E=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1oqy7x-0004aL-F7
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 14:57:01 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece1d09a-5c50-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 15:56:59 +0100 (CET)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:56:55 -0700
Received: from anantsin-mobl2.amr.corp.intel.com (HELO [10.209.97.57])
 ([10.209.97.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:56:54 -0700
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
X-Inumbo-ID: ece1d09a-5c50-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667573819; x=1699109819;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hJWKUf4NuPQtRp34Roj2E15yGLAfK5Wxv7G4E7L5eFc=;
  b=nBHfCsBpS3RrqFFQQx9qUVO3iOn/k9pCkgbsTEP4+CbckfxV0YJqbchD
   +AWtj22nHzWibwozC0y9D7q8m9c8Iqb7GeLfLdCjanthw30WH7Gq4K1ao
   G2h9+aPGkWWt2yAxAACxDhaGDb41lqgYg3KMaG891d338PwWt8+RiOeXz
   X3FnTWaJFi3dnpw4IaqLt/dCHnUmB+c3DLyqm4v0QtqnN31Eu55k74YUN
   IDK595YNLOlDi6OSiqjevoVrU+oCr3y7mpFLN+5A3TPnIH25JIe8ZC+xs
   yQNld/8rJOJDwWIVxNLtpfGIos24JPyiawKN43lW5GWnoGmisDykmCSU4
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="308695616"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="308695616"
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="704106559"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="704106559"
Message-ID: <7af3d21c-4313-4892-eff5-be66dacf3b13@intel.com>
Date: Fri, 4 Nov 2022 07:56:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/5] x86: add X86_FEATURE_XENPV to disabled-features.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20221104072701.20283-1-jgross@suse.com>
 <20221104072701.20283-2-jgross@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221104072701.20283-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/22 00:26, Juergen Gross wrote:
> Add X86_FEATURE_XENPV to the features handled specially in
> disabled-features.h.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>


