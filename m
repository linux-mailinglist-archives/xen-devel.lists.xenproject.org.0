Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E584062469D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 17:08:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441989.696044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otA5y-0003Uc-77; Thu, 10 Nov 2022 16:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441989.696044; Thu, 10 Nov 2022 16:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otA5y-0003Rc-2y; Thu, 10 Nov 2022 16:08:02 +0000
Received: by outflank-mailman (input) for mailman id 441989;
 Thu, 10 Nov 2022 16:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U22N=3K=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1otA5w-0003Nw-3M
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 16:08:00 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d60a0e6e-6111-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 17:07:57 +0100 (CET)
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:07:55 -0800
Received: from csalvo-mobl1.amr.corp.intel.com (HELO [10.212.217.97])
 ([10.212.217.97])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:07:54 -0800
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
X-Inumbo-ID: d60a0e6e-6111-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668096477; x=1699632477;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JPp5EDDddCIcW0tICeOFfz4HE4lQV+wPxVcAIA4+K6M=;
  b=ILDFbCoRv6Z6ZC7iLQ9ZZQguYluYQVYF5GqmyeVSGICIGgeJLD3ErfCn
   Dss3ImDXR3PECBB5KGxxZ6/2IcQUZOoSvUKWoQ68rq1gfGDDnG4r4Q26o
   dUwDL80YenrAiRgomGAjjDR9il6GlJqmX4LFPCceojsOvt1EYW4ER1/zR
   Lwd+xAV7Wv+NRaMAkgKgAdxGvySu2C55ZhBHY5vbWVD5EQx7mtuNW1xgZ
   dMXvuKLon7WlrYSyr4FTUcjjLVFDmUiuoa22tTC6nbpgDaMjjLAF+L0C4
   BjOP3fDOb284GpGqeKCn48bC1mu5J4po61XLh/MZ73JaFNN9hGL55kAMc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="310063739"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="310063739"
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="631702730"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; 
   d="scan'208";a="631702730"
Message-ID: <8e62a029-f2fa-0627-1f71-4850a68ec6b6@intel.com>
Date: Thu, 10 Nov 2022 08:07:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: dpsmith@apertussolutions.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, luto@amacapital.net,
 dave.hansen@linux.intel.com, kanth.ghatraju@oracle.com,
 trenchboot-devel@googlegroups.com, jailhouse-dev@googlegroups.com,
 jan.kiszka@siemens.com, xen-devel@lists.xenproject.org, jgross@suse.com,
 boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
References: <20221110154521.613472-1-ross.philipson@oracle.com>
 <20221110154521.613472-2-ross.philipson@oracle.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221110154521.613472-2-ross.philipson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/22 07:45, Ross Philipson wrote:
>  	dt = early_memremap(initial_dtb, map_len);
> +	if (!dt) {
> +		pr_warn("failed to memremap initial dtb\n");
> +		return;
> +	}

Are all of these new pr_warn/err()'s really adding much value?  They all
look pretty generic.  It makes me wonder if we should just spit out a
generic message in early_memremap() and save all the callers the trouble.

Oh, and don't we try to refer to functions() with parenthesis?

