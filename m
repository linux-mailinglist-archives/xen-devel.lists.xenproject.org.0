Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2717A87DEC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 12:47:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949670.1346153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HKt-00025s-2b; Mon, 14 Apr 2025 10:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949670.1346153; Mon, 14 Apr 2025 10:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HKt-00023y-02; Mon, 14 Apr 2025 10:46:43 +0000
Received: by outflank-mailman (input) for mailman id 949670;
 Mon, 14 Apr 2025 10:46:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4HKs-00023s-4C
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 10:46:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4HKr-00Enc0-1g;
 Mon, 14 Apr 2025 10:46:41 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4HKr-00CuVU-04;
 Mon, 14 Apr 2025 10:46:41 +0000
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
	bh=YsLdd4okGbFyUMZEaXCm9PK0tHAOyH+W/fWSDrZmedM=; b=KsVxwLY9JmHKRg2RVmN5Tw6Qz/
	D1GONdQWtqbNiZufl9VeXm6VAS05l1t67T3Ax/uqVgMGDYDr5Lkv9rIhLU7KL41QGpAQER4jeutZt
	XsbkbFF42vadTFQqt0R1KBhAAE5EIbOcr/l34h7Vl0ulpEwyoy5/he4EiB3nPvZpzlKw=;
Message-ID: <98feb427-7da5-47ff-831c-2b4bcb26c4b9@xen.org>
Date: Mon, 14 Apr 2025 19:46:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add support for MSI injection on Arm
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1744621166.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 14/04/2025 18:51, Mykyta Poturai wrote:
> This series adds the base support for MSI injection on Arm. This is
> needed to streamline virtio-pci interrupt triggering.
> 
> With this patches, MSIs can be triggered in guests by issuing the new
> DM op, inject_msi2. This op is similar to inject_msi, but it allows
> to specify the source id of the MSI.
> 
> We chose the approach of adding a new DM op instead of using the pad
> field of inject_msi because we have no clear way of distinguishing
> between set and unset pad fields. New implementations also adds flags
> field to clearly specify if the SBDF is set.
> 
> Patches were tested on QEMU with

[...]

> patches for ITS support for DomUs applied.

This means this series is unusable without external patches. Given this 
is adding a new DM operations, I think it would be more sensible to have 
the vITS support merged first. Then we can look at merging this series.

Cheers,

-- 
Julien Grall


