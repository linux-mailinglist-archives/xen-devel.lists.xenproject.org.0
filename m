Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB671EFDF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 18:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542687.846831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lcO-0004TY-AB; Thu, 01 Jun 2023 16:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542687.846831; Thu, 01 Jun 2023 16:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4lcO-0004Qx-7O; Thu, 01 Jun 2023 16:57:44 +0000
Received: by outflank-mailman (input) for mailman id 542687;
 Thu, 01 Jun 2023 16:57:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Di2f=BV=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1q4lcM-0004MB-3B
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 16:57:42 +0000
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68d51787-009d-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 18:57:38 +0200 (CEST)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:57:31 -0700
Received: from jdboswor-mobl.amr.corp.intel.com (HELO [10.212.227.45])
 ([10.212.227.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:57:30 -0700
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
X-Inumbo-ID: 68d51787-009d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638658; x=1717174658;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fwWF/Gy9Rnn01MNcEZTbrQhC277/QH+VMbqZkWIZ3UU=;
  b=R1/e2XqFM6uEcMfPqeHGHsb0j1wd5NpOP2dlDG+5r9semtvLC15DMP0g
   jWndZo/rpdtbuY10A6b+SrcUngqk6DTGhXX22iHWofIyZNyKWM3nFoSNl
   nOwtzN5V6qSx2+1RTzqB42rVgqVq+cSnZNzUDvGx56b5xRGZffBM5w5CB
   bv/yIZiRKzjPKkXDNgo3ht/IYCb9m/vKgZLxn9xnzkFszucDYCAW/4XKh
   aPYHGygam/VOcPq+9tOIn8IJ/dOOFIV3tbpBPNsNK6QJC2+NsdorTUmJs
   MfArhaqap+O/MqXMmWaUJPFKOuG6Oe4TSH0z6Y2MIEiIaE4StsFDrYckr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340237758"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="340237758"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737181505"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="737181505"
Message-ID: <5aae0317-72cf-fc3c-6ce3-7e1fe1d6b699@intel.com>
Date: Thu, 1 Jun 2023 09:57:30 -0700
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
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230530150106.2703849-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/30/23 08:01, Ross Lagerwall wrote:
> Since firmware doesn't indicate the iBFT in the E820, add a reserved
> region so that it gets identity mapped when running as Dom 0 so that it
> is possible to search for it. Move the call to reserve_ibft_region()
> later so that it is called after the Xen identity mapping adjustments
> are applied.
> 
> Finally, instead of using isa_bus_to_virt() which doesn't do the right
> thing under Xen, use early_memremap() like the dmi_scan code does.

This is connecting Xen, iSCSI and x86.  Some background here would be
*really* nice for dummies like me that deal heavily in only one of those
three.

One or two sentences like this:

	Firmware can provide an iSCSI-specific table called the iBFT
	which helps the OS boot from iSCSI devices.

can go a long way for dummies like me.  As could some background about
why this:

	... add a reserved region so that it gets identity mapped when
	running as Dom 0 so that it is possible to search for it.

These are all English words, but off the top of my head, I have no idea
why reserved regions get identity mapped when running as Dom 0 or why
that makes it possible to search.

The addresses and size here:

> +#ifdef CONFIG_ISCSI_IBFT_FIND
> +		/* Reserve 0.5 MiB to 1 MiB region so iBFT can be found */
> +		xen_e820_table.entries[xen_e820_table.nr_entries].addr = 0x80000;
> +		xen_e820_table.entries[xen_e820_table.nr_entries].size = 0x80000;
> +		xen_e820_table.entries[xen_e820_table.nr_entries].type = E820_TYPE_RESERVED;
> +		xen_e820_table.nr_entries++;
> +#endif

also appear to be conjured out of thin air.

As does the move of:

> +	reserve_ibft_region();

I'm sure I can go figure this all out with some research.  But, I'd
really appreciate some extra effort from you in this changelog to save
me the time.  I bet you can explain it a lot more efficiently than I can
go figure it out.

