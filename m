Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9580AF0E4A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030749.1404411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWt5c-0006XU-E5; Wed, 02 Jul 2025 08:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030749.1404411; Wed, 02 Jul 2025 08:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWt5c-0006Uv-B2; Wed, 02 Jul 2025 08:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1030749;
 Wed, 02 Jul 2025 08:45:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uWt5b-0006Up-4R
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:45:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWt5X-00EdKP-1I;
 Wed, 02 Jul 2025 08:45:07 +0000
Received: from [2a02:8012:3a1:0:694b:6608:aaf6:1a4c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWt5X-007Xzb-0W;
 Wed, 02 Jul 2025 08:45:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=tYvMN78O5awv87mBc9KA8WtaDMxXQM5Oow7bybyxPFI=; b=3pA7OhJGesP0dpFQ5JF23I15/U
	aH9jz69NVrCdFgtD6BfmQYEARvvhGdBoqaAog9A/jqV0N5UitftNFTloox9R4yposn/vqo4sLSECr
	L7LvyqKHKDksGUI1eM8Vd+Ekd5eeK13uVLfs7CmB1huYr1OF0FYctDbPkTrcIQQsNVJk=;
Message-ID: <9d0bed39-4ec5-4b7c-977d-69c4cfe2f043@xen.org>
Date: Wed, 2 Jul 2025 09:45:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: "Orzel, Michal" <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2506271905350.862517@ubuntu-linux-20-04-desktop>
 <aGKnDHtRD5OLGaYj@macbook.local>
 <alpine.DEB.2.22.394.2506301726500.862517@ubuntu-linux-20-04-desktop>
 <1507b441-dd3c-4a24-beda-0d1d3143faf9@suse.com>
 <alpine.DEB.2.22.394.2507011338360.862517@ubuntu-linux-20-04-desktop>
 <aGTZK0YmBTvGmNQr@macbook.local>
 <0807cdba-b0bb-42a7-a18d-407ab818709a@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <0807cdba-b0bb-42a7-a18d-407ab818709a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 02/07/2025 08:52, Orzel, Michal wrote:
> We have a few issues on Arm. First, we don't check whether direct map is big
> enough provided max_pdx that we don't set at all. Second, we don't really use
> PDX grouping (can be also used without compression). My patch (that Stefano
> attached previously) fixes the second issue (Allejandro will take it over to
> come up with common solution). For the first issue, we need to know max_page (at
> the moment we calculate it in setup_mm() at the very end but we could do it in
> init_pdx() to know it ahead of setting direct map) and PDX offset (on x86 there
> is no offset). I also think that on Arm we should just panic if direct map is
> too small.
> 
> The issue can be reproduced by disabling PDX compression, so not only with
> Roger's patch.
> 
> @Julien, I'm thinking of something like this:

The change below look good to me.

Cheers,

-- 
Julien Grall


