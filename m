Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86FB01AAA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 13:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040785.1412082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaC3y-0006HK-6n; Fri, 11 Jul 2025 11:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040785.1412082; Fri, 11 Jul 2025 11:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaC3y-0006FM-3u; Fri, 11 Jul 2025 11:37:10 +0000
Received: by outflank-mailman (input) for mailman id 1040785;
 Fri, 11 Jul 2025 11:37:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaC3w-0006FG-DG
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 11:37:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaC3v-00C8ha-2T;
 Fri, 11 Jul 2025 11:37:07 +0000
Received: from [2a02:8012:3a1:0:c903:9e79:7dcd:5b41]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaC3v-00FPAE-1Z;
 Fri, 11 Jul 2025 11:37:07 +0000
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
	bh=W+sc8EXX7womjqXiO6Zb9r0I7Hk3o4pAE7iNRsU9a4c=; b=NCV8D1bGjwhuK9bLbsAqwny/z8
	D9ftqm7HNZrm/EHlwRr1jplFd1+eZXNCVh4qeeBzbrue+iGt1j6qc+a6aj2JUUOZNnMPFkYddioVW
	Cw060KUuJrrucDyoH67Fk25mkF8lO2cCJ9fYkZs1iGZuWEGmK9TBr7W5TlKDDQiDXy48=;
Message-ID: <d0a67031-ee9e-4ae2-a890-b00ac8572621@xen.org>
Date: Fri, 11 Jul 2025 12:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Proposal for supporting EL1 MPU region context switch in Xen
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, luca.fancellu@arm.com, ayankuma@amd.com
References: <sx7fysbgi6fwrza24lq2xkyvnz254756cptucxqfokwrd7pxs7@k3swbmqmfvel>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <sx7fysbgi6fwrza24lq2xkyvnz254756cptucxqfokwrd7pxs7@k3swbmqmfvel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hari,

On 08/07/2025 17:30, Hari Limaye wrote:
> # Proposal for supporting EL1 MPU region context switch in Xen
> 
> This proposal will introduce the proposed design for supporting EL1 MPU region
> context switch for guests.
> 
> ## Purpose
> 
> We would like to be able to support the PMSAv8-64 translation regime at EL1 for
> Xen guests. We would also like to configure the number of supported MPU regions
> on a per-guest basis.

Thanks for writing a documentation. Skimming through the documentation, 
it sounds like allowing each guest to have a different number of MPU 
regions will introduce quite a bit of work in Xen and also expensive for 
the guests.

Can you provide some details on why we would want to do this? Also, if 
we were going with expose the same as the HW, how much of this is going 
to be re-used?

Cheers,

-- 
Julien Grall


