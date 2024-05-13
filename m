Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88F78C490C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 23:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721082.1124214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ddM-0005iY-Mv; Mon, 13 May 2024 21:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721082.1124214; Mon, 13 May 2024 21:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ddM-0005gl-KH; Mon, 13 May 2024 21:55:00 +0000
Received: by outflank-mailman (input) for mailman id 721082;
 Mon, 13 May 2024 21:54:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6ddK-0005gf-Nu
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 21:54:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6ddK-0006QJ-FH; Mon, 13 May 2024 21:54:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6ddK-0003Vz-94; Mon, 13 May 2024 21:54:58 +0000
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
	bh=EFaqGHI74Ifgk2yBG2wxZNsF+t3ZzIIpLTtX8JzjiX8=; b=gS07JZdBI+be9hCzVsYU4tP43O
	fMZlcHUo2iYog5++6hEVf9VM8CzDz88ZCDWS/tps7jia0meqLhus14jN+FOqizbam6cVSBNM1Zb6F
	rPp0L4jMF+80q21zuCFwOmiNKBvVURD6Dh8twNZsZuRropIkxaemeQMfB2MLXK54/CHw=;
Message-ID: <a9629975-87d1-457b-b6aa-cbeb91fd4854@xen.org>
Date: Mon, 13 May 2024 22:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to
 bootinfo.reserved_mem
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240425131119.2299629-1-luca.fancellu@arm.com>
 <20240425131119.2299629-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240425131119.2299629-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 25/04/2024 14:11, Luca Fancellu wrote:
> Currently the code is listing device tree reserve map regions
> as reserved memory for Xen, but they are not added into
> bootinfo.reserved_mem and they are fetched in multiple places
> using the same code sequence, causing duplication. Fix this
> by adding them to the bootinfo.reserved_mem at early stage.

Do we have enough space in bootinfo.reserved_mem for them?

The rest of the changes LGTM.

Cheers,

-- 
Julien Grall

