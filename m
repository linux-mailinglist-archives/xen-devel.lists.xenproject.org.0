Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0A3BC7F6
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150871.278904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gYc-0002HS-8I; Tue, 06 Jul 2021 08:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150871.278904; Tue, 06 Jul 2021 08:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gYc-0002F5-4U; Tue, 06 Jul 2021 08:35:54 +0000
Received: by outflank-mailman (input) for mailman id 150871;
 Tue, 06 Jul 2021 08:35:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbbY=L6=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m0gYa-0002Ev-MV
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:35:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 65932b67-2fbf-47ba-8adf-f4e5af57921f;
 Tue, 06 Jul 2021 08:35:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6D2B31B;
 Tue,  6 Jul 2021 01:35:50 -0700 (PDT)
Received: from [10.57.8.167] (unknown [10.57.8.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6F583F5A1;
 Tue,  6 Jul 2021 01:35:49 -0700 (PDT)
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
X-Inumbo-ID: 65932b67-2fbf-47ba-8adf-f4e5af57921f
Subject: Re: [XEN PATCH v3] libxl/arm: provide guests with random seed
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <20210706063345.91169-1-Sergiy_Kibrik@epam.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <fe305fd6-afba-5d22-8f3a-08bd3632db25@arm.com>
Date: Tue, 6 Jul 2021 10:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210706063345.91169-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 06.07.2021 08:33, Sergiy Kibrik wrote:
> Pass 128 bytes of random seed via FDT, so that guests' CRNGs are better seeded
> early at boot. This is larger than ChaCha20 key size of 32, so each byte of
> CRNG state will be mixed 4 times using this seed. There does not seem to be
> advantage in larger seed though.
> 
> Depending on its configuration Linux can use the seed as device randomness
> or to just quickly initialize CRNG.
> In either case this will provide extra randomness to further harden CRNG.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Reviewed-by: Julien Grall <julien@xen.org>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> 
> ---
> 	Changes in V3:
> 		- Rebased on current master
> 
> ---


