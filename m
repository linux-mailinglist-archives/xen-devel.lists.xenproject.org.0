Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF91619AEC
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 16:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437696.692163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyFf-0000r0-IL; Fri, 04 Nov 2022 15:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437696.692163; Fri, 04 Nov 2022 15:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqyFf-0000pD-Fh; Fri, 04 Nov 2022 15:04:59 +0000
Received: by outflank-mailman (input) for mailman id 437696;
 Fri, 04 Nov 2022 15:04:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L84E=3E=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1oqyFe-0008DZ-L6
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 15:04:58 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad3911a-5c52-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 16:04:57 +0100 (CET)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:04:55 -0700
Received: from anantsin-mobl2.amr.corp.intel.com (HELO [10.209.97.57])
 ([10.209.97.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 08:04:54 -0700
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
X-Inumbo-ID: 0ad3911a-5c52-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667574297; x=1699110297;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RaXeA3lCHqq/I4+SahQVZ4hXUivbF7Ar5S6jFlTfNpc=;
  b=gRUWbSqHDlRm5oITuzJgnH0GsvnevuspJ66nu5+8VKhteC/nyAiusnLb
   N4mLnxPgLHxs3DC+yD8GgI7qPDa9BXxi9NkmB2pF6GWGmemvcJrwcCFMQ
   t4CIKN+XMQF4u0I2VkgCPHtqbXDu4wbkCJeKsZjsJIhN0uWuhaYknydgp
   muPxph29u2Le6V/m+l5lUSrGwpfT5udnGrXURpg4jzgQTtGb8FjgYAwzR
   ze5hEmGdxQ3c04Id0uBeGZkGjCsgxqyPBc5YcmPJImvn4Isv3nC2HIlGW
   Yd9r9XWX0Zvpi/q5D3Wao6nYmqFXCRv1dUd3QgX/Y7qJr1DzArzQXXH7x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="307610888"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="307610888"
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="777739712"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="777739712"
Message-ID: <ad9ef7ad-f01b-a3f9-2d30-5cd405d26b2c@intel.com>
Date: Fri, 4 Nov 2022 08:04:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 4/5] x86: remove X86_FEATURE_XENPV usage in
 setup_cpu_entry_area()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20221104072701.20283-1-jgross@suse.com>
 <20221104072701.20283-5-jgross@suse.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20221104072701.20283-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/22 00:27, Juergen Gross wrote:
> Testing of X86_FEATURE_XENPV in setup_cpu_entry_area() can be removed,
> as this code path is 32-bit only, and Xen PV guests are not supporting
> 32-bit mode.

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

