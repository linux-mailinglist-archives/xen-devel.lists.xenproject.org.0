Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51D71F04F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 19:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542692.846844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lnL-00067A-Dp; Thu, 01 Jun 2023 17:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542692.846844; Thu, 01 Jun 2023 17:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lnL-00065A-9i; Thu, 01 Jun 2023 17:09:03 +0000
Received: by outflank-mailman (input) for mailman id 542692;
 Thu, 01 Jun 2023 17:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Di2f=BV=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1q4lnJ-000652-Pa
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 17:09:01 +0000
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdb38d9e-009e-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 19:08:58 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:08:41 -0700
Received: from jdboswor-mobl.amr.corp.intel.com (HELO [10.212.227.45])
 ([10.212.227.45])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 10:08:41 -0700
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
X-Inumbo-ID: fdb38d9e-009e-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685639338; x=1717175338;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TR5fGtwRtA3BECP2nBOSsf+c8VaVhidSV/NOHGkaUvg=;
  b=nwoVa4bwlJkW5VmsCHL1+w5KHdAN94uv7Bd33Vc13QJtA820Ac6hEk7b
   Cwj1sXdqpF0D9XgDxTKb2KQBVKQrzMmeXVmPzrzIlmJp3S0WDjZpcUscV
   dlVyxCth3hIxIBrO2MLfumsUs6rHmWL0l+AlyAYg0GgSE7BL4hcYxGsYh
   L2f+9nE0g9xbqC8/qg28xCU9xXHh2tExPZ2y2GQ0unu84GWnAzkhXUZ9Q
   x4SRu9zqXMzb4VNpDQpHsttaYpg4zK6b9e3AaxBaY0AO6sHlbFRHhZ57W
   Yfl485QuIP+gXNbvdCbcBPgc0PVJCbvXBdR3uvK25SjjfLPdsbtJ9dA9F
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358919585"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="358919585"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657873151"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="657873151"
Message-ID: <b6c4347d-bd03-0332-c4a9-9d2a11f17a6a@intel.com>
Date: Thu, 1 Jun 2023 10:08:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Peter Jones <pjones@redhat.com>,
 Konrad Rzeszutek Wilk <konrad@kernel.org>
References: <20230530150106.2703849-1-ross.lagerwall@citrix.com>
 <5aae0317-72cf-fc3c-6ce3-7e1fe1d6b699@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <5aae0317-72cf-fc3c-6ce3-7e1fe1d6b699@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/23 09:57, Dave Hansen wrote:
> On 5/30/23 08:01, Ross Lagerwall wrote:
>> Since firmware doesn't indicate the iBFT in the E820, add a reserved
>> region so that it gets identity mapped when running as Dom 0 so that it
>> is possible to search for it. Move the call to reserve_ibft_region()
>> later so that it is called after the Xen identity mapping adjustments
>> are applied.

Oh, and one more thing:

What is the end user visible effect of this problem and of your solution?

Do Xen Dom 0 systems fail to find their boot iSCSI volume and refuse to
boot?  I take it after this patch that they can boot again.

