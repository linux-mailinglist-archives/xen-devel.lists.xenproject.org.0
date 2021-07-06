Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C843BC817
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 10:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150890.278936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gle-0005GC-3z; Tue, 06 Jul 2021 08:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150890.278936; Tue, 06 Jul 2021 08:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0gle-0005Ep-0D; Tue, 06 Jul 2021 08:49:22 +0000
Received: by outflank-mailman (input) for mailman id 150890;
 Tue, 06 Jul 2021 08:49:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0gld-0005Ej-5m
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 08:49:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0glc-000551-0O; Tue, 06 Jul 2021 08:49:20 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0glb-00052J-Q7; Tue, 06 Jul 2021 08:49:19 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=anz3uTM/Zp68Sr7iUbwW5VdR6moMW32IE7gwUzZOM4U=; b=0/h8ju7H5kg1splEX3W3RqgC/v
	ymK32ZumQ4739a4svsqgfnt9H+TmClNZb1JZjq59IKM8h68Dyz2r6ATx+k+/R0cQquSu/D9cRHjRf
	8WzWiJjnPzH/45CevB8vHqYgoJ4upnnH0VcMjeaUgLAoaeApsIV5xxIGRD+TWs0Vjdak=;
Subject: Re: [XEN PATCH v3] libxl/arm: provide guests with random seed
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20210706063345.91169-1-Sergiy_Kibrik@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <46e2a04c-fa8f-f207-fe5e-328c891a0ca1@xen.org>
Date: Tue, 6 Jul 2021 09:49:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706063345.91169-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 06/07/2021 07:33, Sergiy Kibrik wrote:
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
> 
> ---
> 	Changes in V3:
> 		- Rebased on current master

Thank you for rebasing the patch. I have now committed it.

Cheers,

-- 
Julien Grall

