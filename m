Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16433640A75
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 17:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452136.709944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p18jn-0006zo-Vp; Fri, 02 Dec 2022 16:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452136.709944; Fri, 02 Dec 2022 16:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p18jn-0006wn-Sm; Fri, 02 Dec 2022 16:18:07 +0000
Received: by outflank-mailman (input) for mailman id 452136;
 Fri, 02 Dec 2022 16:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lg1c=4A=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1p18jl-0006iu-MP
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 16:18:05 +0000
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3de7b3f-725c-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 17:18:02 +0100 (CET)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:17:59 -0800
Received: from rsnyder-mobl.amr.corp.intel.com (HELO [10.209.68.71])
 ([10.209.68.71])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 08:17:57 -0800
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
X-Inumbo-ID: e3de7b3f-725c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669997882; x=1701533882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7kU26MIub+cu0n7tSsFLX1XdaUFcNgPBdV26TZeWYFY=;
  b=TSakR07WkkqBh3fQHAcFpnvOIjlit4d3nWC4vvOpC21q7dcSHQG4HOC9
   nIbOeVNJv1q1HK/1XGcAHye91sSzK6HAvibAAHHO/hW8NbT+2fXoJIaiP
   t79tMNA7UcQk+HaPA5svn9WSxzygnW4slIpNlXmgi97ogdcaH1pR+a3d0
   LH+GhrO5cmmGEtDBnYXwvBJb7QY10UWJvLwbTyscohnUkazidp7eSF5MF
   Ub3z9yBJ1eAo0vJNPHoAiLyaE2wbfSexDoYu7l39w6bWgTHYSJhVepKln
   74VRZq0oXtbLaFThUzdzbKH+zuiy/egCVSVH03CU/qSLVYvfudPVS0HCH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380274539"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="380274539"
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="595493381"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="595493381"
Message-ID: <93fd7ed0-5311-d6db-4d8b-b992a8f78ada@intel.com>
Date: Fri, 2 Dec 2022 08:17:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Alex Chiang <achiang@hp.com>,
 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
 linux-acpi@vger.kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
 <20221121102113.41893-2-roger.pau@citrix.com>
 <6b212148-4e3f-3ef6-7922-901175746d44@intel.com>
 <Y4d8cm97hn5zuRQ1@Air-de-Roger>
 <4a0e9f91-8d8b-84bc-c9db-7265f5b65b63@intel.com>
 <Y4nugxKV1J/BqhBt@Air-de-Roger>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <Y4nugxKV1J/BqhBt@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/2/22 04:24, Roger Pau Monné wrote:
> On the implementation side, is the proposed approach acceptable?
> Mostly asking because it adds Xen conditionals to otherwise generic
> ACPI code.

That's a good Rafael question.

But, how do other places in the ACPI code handle things like this?

