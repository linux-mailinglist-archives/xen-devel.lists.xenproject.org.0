Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F9D70FAA9
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539156.839759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qf4-0001sI-7J; Wed, 24 May 2023 15:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539156.839759; Wed, 24 May 2023 15:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qf4-0001qV-4A; Wed, 24 May 2023 15:44:26 +0000
Received: by outflank-mailman (input) for mailman id 539156;
 Wed, 24 May 2023 15:44:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l7k3=BN=amazon.de=prvs=501c83221=mheyne@srs-se1.protection.inumbo.net>)
 id 1q1qf2-0001qP-B6
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:44:24 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9cbcd41-fa49-11ed-b230-6b7b168915f2;
 Wed, 24 May 2023 17:44:22 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-m6i4x-93c3b254.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 15:43:32 +0000
Received: from EX19MTAUWC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-m6i4x-93c3b254.us-east-1.amazon.com (Postfix)
 with ESMTPS id C180AE4889; Wed, 24 May 2023 15:43:31 +0000 (UTC)
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 May 2023 15:43:31 +0000
Received: from dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (10.15.57.183)
 by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP Server
 id
 15.2.1118.26 via Frontend Transport; Wed, 24 May 2023 15:43:31 +0000
Received: by dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id C18DD964; Wed, 24 May 2023 15:43:30 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d9cbcd41-fa49-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1684943062; x=1716479062;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=9/BFiR9WjSZPq/EuaxN0jvRDDD5ugdAe5QjD82M1rfs=;
  b=HGJlH/oIdvkNfHuDmWp/x95zW5+o42GOXyLReUl0j44zIZKrEAF53yW9
   JibG1YvfvoN7dCfNSbiOP68jD3v/EyJr9sw7QWRqou7D69OV43lX08BuR
   Zii5xOnzO1sDIEoVxcFsFI9FeH8p3w9lMWQgAgqNdMbsEeeeabRmWLKP5
   A=;
X-IronPort-AV: E=Sophos;i="6.00,189,1681171200"; 
   d="scan'208";a="335305194"
Date: Wed, 24 May 2023 15:43:30 +0000
From: Maximilian Heyne <mheyne@amazon.de>
To: Juergen Gross <jgross@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier
	<maz@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Ashok Raj <ashok.raj@intel.com>, "Ahmed S. Darwish"
	<darwi@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<xen-devel@lists.xenproject.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/pci/xen: populate MSI sysfs entries
Message-ID: <20230524154330.GA52988@dev-dsk-mheyne-1b-c1362c4d.eu-west-1.amazon.com>
References: <20230503131656.15928-1-mheyne@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230503131656.15928-1-mheyne@amazon.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk

On Wed, May 03, 2023 at 01:16:53PM +0000, Maximilian Heyne wrote:
> Commit bf5e758f02fc ("genirq/msi: Simplify sysfs handling") reworked the
> creation of sysfs entries for MSI IRQs. The creation used to be in
> msi_domain_alloc_irqs_descs_locked after calling ops->domain_alloc_irqs.
> Then it moved into __msi_domain_alloc_irqs which is an implementation of
> domain_alloc_irqs. However, Xen comes with the only other implementation
> of domain_alloc_irqs and hence doesn't run the sysfs population code
> anymore.
> 
> Commit 6c796996ee70 ("x86/pci/xen: Fixup fallout from the PCI/MSI
> overhaul") set the flag MSI_FLAG_DEV_SYSFS for the xen msi_domain_info
> but that doesn't actually have an effect because Xen uses it's own
> domain_alloc_irqs implementation.
> 
> Fix this by making use of the fallback functions for sysfs population.
> 
> Fixes: bf5e758f02fc ("genirq/msi: Simplify sysfs handling")
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>


Any other feedback on this one? This is definitely a bug but I understand that
there might be different ways to fix it.



Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




