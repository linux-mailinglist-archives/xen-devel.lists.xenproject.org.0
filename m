Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255683F88B8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173058.315774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFLu-00046Q-GE; Thu, 26 Aug 2021 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173058.315774; Thu, 26 Aug 2021 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFLu-00043f-Cb; Thu, 26 Aug 2021 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 173058;
 Thu, 26 Aug 2021 13:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gmLS=NR=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mJFLs-00043Z-SF
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:23:29 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc0ec97e-0670-11ec-aa01-12813bfff9fa;
 Thu, 26 Aug 2021 13:23:27 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1629984200774124.61309886122797;
 Thu, 26 Aug 2021 06:23:20 -0700 (PDT)
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
X-Inumbo-ID: cc0ec97e-0670-11ec-aa01-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1629984202; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QRVp7GF/ZIiudoetvcQ0fUYO8Hovd90ICSZEYqnRI8ouawpnigvH3t+oqLYOfYfgU0py7ZU82z/d7APV6Q9xz/vo9hWK4qJT+Gy2SfWtl7OzYpOL5dUyhUFOnrutVqZ1DEvGdPbXcag/2gZNAxOS9dK35T4xdqLfqkYZlLilL3s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1629984202; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Kz2l4HfGPqE2vjbZ8+KpQP2zyqlQT888tY8f/K7FMyc=; 
	b=IBsecZFwSlyoEKHsO5Q69GN83Wopne216Cnrzw5oHt06rrqvTduTvYiEMLBBbehCpat+kDD/1ZQcw29ejPn0HIAgInC97YXPL4MqZ1MGAaNHxcWfr5erm+ss9TizWZTN9X9eh6CLz4JjpDDAfN4W7Zzbg2SGX1A3rd0Cbv5/M24=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1629984202;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Kz2l4HfGPqE2vjbZ8+KpQP2zyqlQT888tY8f/K7FMyc=;
	b=G4djD15ievOZgDyfbi+T3VP/DVSLtVi2wXY/jlzKrjwRcZ6glEfycsHPxSt+23PK
	8ZRCqOI8YpzSVDxPBZ9eJsAl40Ysbo5dXy9/obEEVw5DpqfFKIXZwRuAzTQ/m3C+tkd
	U5V5T2p+iOqqlG/0VDOJ6RG0asNX4rsCPa0kCsR4=
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Message-ID: <5902a971-3a8d-b166-65a3-48e7c34cc7bc@apertussolutions.com>
Date: Thu, 26 Aug 2021 09:23:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/19/21 8:02 AM, Rahul Singh wrote:
> MSI code that implements MSI functionality to support MSI within XEN is
> not usable on ARM. Move the code under CONFIG_HAS_PCI_MSI flag to gate
> the code for ARM.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/x86/Kconfig             |  1 +
>  xen/drivers/passthrough/Makefile |  1 +
>  xen/drivers/passthrough/msi.c    | 96 ++++++++++++++++++++++++++++++++
>  xen/drivers/passthrough/pci.c    | 54 +++++-------------
>  xen/drivers/pci/Kconfig          |  4 ++
>  xen/include/xen/msi.h            | 56 +++++++++++++++++++
>  xen/xsm/flask/hooks.c            |  8 +--
>  7 files changed, 175 insertions(+), 45 deletions(-)
>  create mode 100644 xen/drivers/passthrough/msi.c
>  create mode 100644 xen/include/xen/msi.h
> 

...

> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index f1a1217c98..fdcfeb984c 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -21,7 +21,7 @@
>  #include <xen/guest_access.h>
>  #include <xen/xenoprof.h>
>  #include <xen/iommu.h>
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>  #include <asm/msi.h>
>  #endif
>  #include <public/xen.h>
> @@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
>          }
>          return security_irq_sid(irq, sid);
>      }
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>      {
>          struct irq_desc *desc = irq_to_desc(irq);
>          if ( desc->msi_desc && desc->msi_desc->dev ) {
> @@ -874,7 +874,7 @@ static int flask_map_domain_pirq (struct domain *d)
>  static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
>                                   u32 *sid, struct avc_audit_data *ad)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>      const struct msi_info *msi = data;
>      u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
>  
> @@ -940,7 +940,7 @@ static int flask_unmap_domain_pirq (struct domain *d)
>  static int flask_unmap_domain_msi (struct domain *d, int irq, const void *data,
>                                     u32 *sid, struct avc_audit_data *ad)
>  {
> -#ifdef CONFIG_HAS_PCI
> +#ifdef CONFIG_HAS_PCI_MSI
>      const struct pci_dev *pdev = data;
>      u32 machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
>  
> 

Straightforward, so I see no issue with the flask related changes.

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>


v/r
dps

