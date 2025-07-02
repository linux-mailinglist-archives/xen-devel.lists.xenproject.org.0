Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9CAF0E6E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030759.1404420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWt9y-0007J8-UW; Wed, 02 Jul 2025 08:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030759.1404420; Wed, 02 Jul 2025 08:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWt9y-0007HU-Rk; Wed, 02 Jul 2025 08:49:42 +0000
Received: by outflank-mailman (input) for mailman id 1030759;
 Wed, 02 Jul 2025 08:49:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uWt9x-0007HO-MB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:49:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWt9t-00EdPi-36;
 Wed, 02 Jul 2025 08:49:37 +0000
Received: from [2a02:8012:3a1:0:694b:6608:aaf6:1a4c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uWt9t-007YQm-2X;
 Wed, 02 Jul 2025 08:49:37 +0000
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
	bh=Too/8UX3KW51uZVYN9hVg15Wdekzf5qs+pwsbTpZ2aQ=; b=l57t6ynnrWTgXZs1CZxj7Tn+x0
	Wa+5CTWd7qbfZ/s53V6cxdEJzolaHSOnlbHfzspRygoTLdPMoH7FwyXgxEB4jgU5AbBMXmS5tO2Fr
	UZVQCH779jduT96y9EMzia3P5Z39VVnSRWK8OhDxzwqt3l/EfpD8tY1Y3JIeN49B4cpA=;
Message-ID: <400e3acb-99b7-4ece-9cc2-4ec435d3ebf9@xen.org>
Date: Wed, 2 Jul 2025 09:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] pdx: introduce a new compression algorithm
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Orzel, Michal" <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
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
 <aGTtJTTbEkYvnMq6@macbook.local>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <aGTtJTTbEkYvnMq6@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 02/07/2025 09:26, Roger Pau Monné wrote:
> On Wed, Jul 02, 2025 at 09:52:45AM +0200, Orzel, Michal wrote:
>> We have a few issues on Arm. First, we don't check whether direct map is big
>> enough provided max_pdx that we don't set at all. Second, we don't really use
>> PDX grouping (can be also used without compression). My patch (that Stefano
>> attached previously) fixes the second issue (Allejandro will take it over to
>> come up with common solution).
> 
> You probably can handle those as different issues, as PDX grouping is
> completely disjoint from PDX compression.  It might be helpful if
> we could split the PDX grouping into a separate file from the PDX
> compression.
> 
> One weirdness I've noticed with ARM is the addition of start offsets
> to the existing PDX compression, by using directmap_base_pdx,
> directmap_mfn_start, directmap_base_pdx &c.  I'm not sure whether this will
> interfere with the PDX compression, but it looks like a bodge.  This
> should be part of the generic PDX compression implementation, not an
> extra added on a per-arch basis.

They were introduced right at the beginning of the ARM port because we 
have quite a few platforms where the memory doesn't start at 0 and there 
was still a fairly large hole between two banks. IIRC until this series 
we would have been able to handle the hole but not the offset.

This is can be handled in common, then I would be happy with that.

> 
> FWIW, PDX offset translation should already compress any gaps from 0
> to the first RAM range, and hence this won't be needed (in fact it
> would just make ARM translations slower by doing an extra unneeded
> operation).  My recommendation would be to move this initial offset
> compression inside the PDX mask translation.
> 
>> For the first issue, we need to know max_page (at
>> the moment we calculate it in setup_mm() at the very end but we could do it in
>> init_pdx() to know it ahead of setting direct map) and PDX offset (on x86 there
>> is no offset). I also think that on Arm we should just panic if direct map is
>> too small.
> 
> Hm, that's up to the ARM folks, but my opinion is that you should
> simply ignore memory above the threshold.  Panicking should IMO be a
> last resort option when there's no way to workaround the issue.

This is following the other pattern within the Arm port. We want to fail 
early with a clear error rather than booting an half broken system.

Cheers,

-- 
Julien Grall


