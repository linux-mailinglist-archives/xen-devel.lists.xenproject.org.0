Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC6A70FB14
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 18:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539170.839789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qu0-0004dA-5x; Wed, 24 May 2023 15:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539170.839789; Wed, 24 May 2023 15:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qu0-0004bD-2m; Wed, 24 May 2023 15:59:52 +0000
Received: by outflank-mailman (input) for mailman id 539170;
 Wed, 24 May 2023 15:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zbm=BN=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1q1qty-0004b7-3B
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:59:50 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00d9dc89-fa4c-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:59:47 +0200 (CEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 08:59:45 -0700
Received: from kknopp-mobl1.amr.corp.intel.com (HELO [10.212.186.147])
 ([10.212.186.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 08:59:44 -0700
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
X-Inumbo-ID: 00d9dc89-fa4c-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684943987; x=1716479987;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wx0Ob/xebu07nSB9TJ+GF90jaV0TCKSH0UQ2GQEg59o=;
  b=CH85vFvrR+4NpRd4ezVB0OpvX04ZhRtgrngvhvcsCCGPNJqZM33EE+cG
   WW1M2MBHcqKWaRjRrcnNuECBcASy1cans7CozSOQXQPhEnmDHsOIgQpN0
   +HuRAOqFp2Xwo6ZX/O/iSSvJa5eybEaDkPZnjFipeKW0iyQ1uAtqZZyNF
   CbwI5YDG6YQj0BNSzeh4XBBqACpzjEbqnEd8C1x68D6CKYd4W0vPfpsBU
   M70ylyqTKnv4OUDm505scBUb5YxqSwySZJCzoUpuRYDWFRv4s03f/FPtd
   aFsyicjO1/XX7Uac0ZZ18Z6yILJvcbJBNmMQlLN163WKkHTUadXKRxyoC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343073977"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="343073977"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="654853056"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="654853056"
Message-ID: <571c2a4a-4832-e64e-4f3c-8e7c8a795579@intel.com>
Date: Wed, 24 May 2023 09:00:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86/pci/xen: populate MSI sysfs entries
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Maximilian Heyne <mheyne@amazon.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ashok Raj <ashok.raj@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zyngier <maz@kernel.org>, "Ahmed S. Darwish" <darwi@linutronix.de>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20230503131656.15928-1-mheyne@amazon.de>
 <20230524154330.GA52988@dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com>
 <c0f7cf97-f7ea-83f2-3a9c-f77f82dfb689@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <c0f7cf97-f7ea-83f2-3a9c-f77f82dfb689@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/23 08:47, Juergen Gross wrote:
>> Any other feedback on this one? This is definitely a bug but I
>> understand that
>> there might be different ways to fix it.
> 
> I'd be happy to take the patch via the Xen tree, but I think x86
> maintainers should at least ack that.

Ack.

Works for me.

