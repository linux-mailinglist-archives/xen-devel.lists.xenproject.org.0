Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7618908DE7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 16:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740758.1147863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI8KE-0007CP-Dk; Fri, 14 Jun 2024 14:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740758.1147863; Fri, 14 Jun 2024 14:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI8KE-00079b-AL; Fri, 14 Jun 2024 14:54:46 +0000
Received: by outflank-mailman (input) for mailman id 740758;
 Fri, 14 Jun 2024 14:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnHe=NQ=linux.intel.com=ilpo.jarvinen@srs-se1.protection.inumbo.net>)
 id 1sI8KC-00079V-Iu
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 14:54:44 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06393e07-2a5e-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 16:54:41 +0200 (CEST)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 07:54:38 -0700
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.222])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 07:54:34 -0700
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
X-Inumbo-ID: 06393e07-2a5e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718376881; x=1749912881;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OzFYerauOBqolouxgkZVxe0lW7TOcqR6/DYM51DUUMo=;
  b=jhpDin8pJDILbLFyeduAPVcXYlpuqOdZ42aVIxsV4tln9ZaI5S+ezyGQ
   BPqVESkeUDiULDHQpKjQTbkr/JgiWItCRHRJp1D9EcXzoLortn1AaZWnd
   GjDihkoPjbUVd6D3EKQBhvBeDUgHJub8M5sKKO1RCSOjpNrFyhXtsIcC/
   9BLhAvMDTx/4MPP8PI3W3HFsIWtq8RXSxyV/YRsfcjPtMZgGLAs+D08u6
   RvT+kNoiYyf8SAud99HzBcK0KvipJjCTOsBhSjidltk6+S4SorPz3gtSq
   9sPnMzbx99wgcGJu9QuANeCoyVNSEG8BIjKyGyNHodx2ehClv9OwXKN5B
   g==;
X-CSE-ConnectionGUID: 1RxbpxxOROOjRFgEDYyqFw==
X-CSE-MsgGUID: hrli3pnWQZaTDSJNtc/mRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="14997206"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="14997206"
X-CSE-ConnectionGUID: +PcahY8mTLKwdfa1YAsVXw==
X-CSE-MsgGUID: Wz+fHa1oRq2VAKHfFneYkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="78002414"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 14 Jun 2024 17:54:30 +0300 (EEST)
To: Li zeming <zeming@nfschina.com>
cc: jgross@suse.com, bhelgaas@google.com, tglx@linutronix.de, mingo@redhat.com, 
    bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
    xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: =?ISO-8859-7?Q?Re=3A_=5BPATCH=5D_x86=3A_pci=3A_xen=3A_Remove_?=
 =?ISO-8859-7?Q?unnecessary_=A10=A2_values_from_ret?=
In-Reply-To: <20240612092406.39007-1-zeming@nfschina.com>
Message-ID: <b1c91d7e-9701-c93c-d336-3729be33f67e@linux.intel.com>
References: <20240612092406.39007-1-zeming@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jun 2024, Li zeming wrote:

> ret is assigned first, so it does not need to initialize the assignment.

While the patch seems fine, this description and the shortlog are
confusing.

-- 
 i.

> Signed-off-by: Li zeming <zeming@nfschina.com>
> ---
>  arch/x86/pci/xen.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 652cd53e77f6..67cb9dc9b2e7 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -267,7 +267,7 @@ static bool __read_mostly pci_seg_supported = true;
>  
>  static int xen_initdom_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>  {
> -	int ret = 0;
> +	int ret;
>  	struct msi_desc *msidesc;
>  
>  	msi_for_each_desc(msidesc, &dev->dev, MSI_DESC_NOTASSOCIATED) {
> @@ -353,7 +353,7 @@ static int xen_initdom_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>  
>  bool xen_initdom_restore_msi(struct pci_dev *dev)
>  {
> -	int ret = 0;
> +	int ret;
>  
>  	if (!xen_initial_domain())
>  		return true;
> 


