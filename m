Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6A729E25
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546123.852752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7dqW-0005kR-3t; Fri, 09 Jun 2023 15:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546123.852752; Fri, 09 Jun 2023 15:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7dqW-0005hC-1B; Fri, 09 Jun 2023 15:16:12 +0000
Received: by outflank-mailman (input) for mailman id 546123;
 Fri, 09 Jun 2023 15:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYR=B5=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1q7dqU-0005h6-Sr
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:16:11 +0000
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d7594a9-06d8-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 17:16:07 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:16:03 -0700
Received: from mdeisher-mobl3.amr.corp.intel.com (HELO [10.212.149.144])
 ([10.212.149.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:16:02 -0700
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
X-Inumbo-ID: 8d7594a9-06d8-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686323767; x=1717859767;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WsfbXnCcsa4TSM5XB3U7xjDRRc9X6Hu2PjNqEmPgRBA=;
  b=WrvLmo8GuJTdogObdujeozYDmCSrZb9/ocNfeXdmbLIokIiPmZ+QH59F
   V2swluS13c5Fb5sKNOvtBcVZLXNslNUj4miG5knjIg8VViQ3e/ovZk0n5
   qk//O/sIAjKCN1VubxY2YCc0GzXAL66gehy4SN9lmhzdDFg9gi9h7Z3wR
   SXZtJQsGzREGW3pwYog3+9cdy5RoZ7pfMkq2JZXnwNH/nqP2FDvmjV0U2
   /SwPyNJMlYMK66ChQocY/LOSpIrNtm6bsCTwxasfTYgTCtVsrqzaULFBo
   Gj8DISg44qsRvBIzxsWw6hPgsNKXZH/eKeV5wrXB9hyaYy78BwszaOqjZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="337978233"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="337978233"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="740198658"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="740198658"
Message-ID: <2e28fcdb-f0ff-dca4-3dc4-34b11cc7e469@intel.com>
Date: Fri, 9 Jun 2023 08:16:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
Content-Language: en-US
To: Ross Lagerwall <ross.lagerwall@citrix.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Peter Jones <pjones@redhat.com>,
 Konrad Rzeszutek Wilk <konrad@kernel.org>
References: <20230605102840.1521549-1-ross.lagerwall@citrix.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230605102840.1521549-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/5/23 03:28, Ross Lagerwall wrote:
> The result of these changes is that it is possible to boot a diskless
> Xen + Dom0 running off an iSCSI disk whereas previously it would fail to
> find the iBFT and consequently, the iSCSI root disk.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86

The work in this patch seems pretty evenly split between x86 and iSCSI.
Any preferences on who picks it up?

