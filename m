Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8692C6E162E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 23:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520975.809178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn43P-0002Ck-G9; Thu, 13 Apr 2023 21:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520975.809178; Thu, 13 Apr 2023 21:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn43P-0002A6-DS; Thu, 13 Apr 2023 21:00:27 +0000
Received: by outflank-mailman (input) for mailman id 520975;
 Thu, 13 Apr 2023 21:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn43O-0002A0-KT
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 21:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn43N-0005iQ-NU; Thu, 13 Apr 2023 21:00:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn43N-0006ML-G8; Thu, 13 Apr 2023 21:00:25 +0000
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
	bh=Ag2m83F870Cvztjq8+K6JnjMvBiAtIBnhlonGZVMLEY=; b=NlZZYNnze0XdrXvObNrLz2QWHU
	X1Qt9nPDGruRyCKNd+hPwKiyy0ExOlpFpGxvTADKybzq3/9yv62FJW/NmqBxh87MIaSriXbOUv3T9
	rloJAfd1XJLBcCIGBfK1apw/UxExkfDGj1+yMCKiZbFj6NoqgkkEoygaboP5uVstAWrc=;
Message-ID: <7a29bc06-61b5-51e6-4625-bf19e530b975@xen.org>
Date: Thu, 13 Apr 2023 22:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-23-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230413071424.3273490-23-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 13/04/2023 08:14, Jens Wiklander wrote:
> Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
> 
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   SUPPORT.md               |  8 ++++++++
>   docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index aa1940e55f09..1fd746f7f7f2 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -818,6 +818,14 @@ that covers the DMA of the device to be passed through.
>   
>   No support for QEMU backends in a 16K or 64K domain.
>   
> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> +
> +    Status, Arm64: Tech Preview
> +
> +There are still some code paths where a vCPU may hog a pCPU longer than
> +necessary. The FF-A mediator is not yet implemented for Arm32. Part of the
> +FF-A specification is not supported.

NIT: You would suggest to add: "(See the top comment in ...)". So one 
can easily find the limitation.

> +
>   ### ARM: Guest Device Tree support
>   
>       Status: Supported
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 10f37990be57..bba99c576b48 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1645,6 +1645,21 @@ in OP-TEE.
>   
>   This feature is a B<technology preview>.
>   
> +=item B<ffa>
> +
> +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partitions
> +(SP), default false.
> +
> +Currently is only a small subset of the FF-A specification supported. Just
> +enough to communicate with OP-TEE. In general only direct messaging and
> +sharing memory with one SP. More advanced use cases where memory might be
> +shared or donated to multple SPs are not supported.

Typo: s/multple/multiple/

> +
> +See L<https://developer.arm.com/documentation/den0077/latest> for more
> +informantion about FF-A.

Typo: s/informantion/information/

> +
> +This feature is a B<technology preview>.
> +
>   =back
>   
>   =back

-- 
Julien Grall

