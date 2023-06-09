Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 089FC729E91
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 17:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546156.852809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e6L-000262-Ib; Fri, 09 Jun 2023 15:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546156.852809; Fri, 09 Jun 2023 15:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7e6L-00024M-Fa; Fri, 09 Jun 2023 15:32:33 +0000
Received: by outflank-mailman (input) for mailman id 546156;
 Fri, 09 Jun 2023 15:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYR=B5=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1q7e6J-00024C-3E
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 15:32:31 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6843a29-06da-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 17:32:28 +0200 (CEST)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:32:24 -0700
Received: from mdeisher-mobl3.amr.corp.intel.com (HELO [10.212.149.144])
 ([10.212.149.144])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 08:32:23 -0700
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
X-Inumbo-ID: d6843a29-06da-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686324748; x=1717860748;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v51RHSTw8xEjQxppc1XRi8stX/tlHpxTk03qUolx73Y=;
  b=Mq9O4tqkAzCmTj7rhN5nQ9WG5kP0gxT8mOd1UQLQX3pZSfMYJnhZIg99
   TwN4oUgnIVxLajlby0kIDCSMYwsmAHMFS6PyhWxVmyLVZL2cs6+AEZ0Jj
   pHM0yAh0vGMCrJqn+f8KjEsYbp8+GvPZthtAcYX38plEEELETUMDwjdY2
   rS/AHiEpM08jgFb40TIbx+op3R2lNvF3Ngd7gjKvQgVXB59D7fdruzOB5
   M3rMXuTtm4OYrK9IWVFmfYxOk5uCy+aC2M1CBaS+wsXJSKUCFjMQ6VDwE
   wHB3pl76fg8+pOo1aTPu89DyQu8CImFNDMU0wzbIDx3wo2110TZQiRrOw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="385988579"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="385988579"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="884633183"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="884633183"
Message-ID: <74ec3164-1d1d-7546-6008-9d028354e50a@intel.com>
Date: Fri, 9 Jun 2023 08:32:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] iscsi_ibft: Fix finding the iBFT under Xen Dom 0
Content-Language: en-US
To: konrad@darnok.org, Juergen Gross <jgross@suse.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 LKML <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Jones
 <pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>
References: <20230605102840.1521549-1-ross.lagerwall@citrix.com>
 <f2ccd563-4fac-084f-bd11-e6819dff5710@suse.com>
 <CAPbh3ruFn1to+t9QiuYM7h8CqL-fs2q73Rscj6PWGZuBkS8FEw@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAPbh3ruFn1to+t9QiuYM7h8CqL-fs2q73Rscj6PWGZuBkS8FEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/9/23 08:22, Konrad Rzeszutek Wilk wrote:
> Dave, are you OK with the change in where the reserve call is made?

The move makes logical sense.  I'm not 100% confident it won't regress
anything, but the blast radius should be limited to iSCSI.  But, yeah,
I'm OK with it.

