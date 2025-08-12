Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C56B22546
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078655.1439682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmqT-0005GK-W8; Tue, 12 Aug 2025 11:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078655.1439682; Tue, 12 Aug 2025 11:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmqT-0005EM-TX; Tue, 12 Aug 2025 11:07:09 +0000
Received: by outflank-mailman (input) for mailman id 1078655;
 Tue, 12 Aug 2025 11:07:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulmqT-0005EC-2e
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:07:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmqS-001g85-0Q;
 Tue, 12 Aug 2025 11:07:08 +0000
Received: from [2a02:8012:3a1:0:e0a7:2160:d657:5746]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmqS-001Bso-09;
 Tue, 12 Aug 2025 11:07:08 +0000
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
	bh=ThwmPyeI/sHsqriKaK1FnPJ7a54XDDCRuHBzABdRgD0=; b=zmUsPHCvsSazQenTDc30PvikvO
	NnKz51sIaCY/92Eexfr8ZwhV6wKFFp/WO7786TD6oQbIITz4rdnl0I/4wajmvjGeH+5DQpTT+mjJO
	yGxh9bHSiJvSs0oITgMEFxuHFWOG+TDIxTYlpWBTdxTRPh879Mwq2fxwudQlNord7L/I=;
Message-ID: <8e509e3b-4fc0-4615-bd72-f9af20162a0f@xen.org>
Date: Tue, 12 Aug 2025 12:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/6] FF-A VM to VM support
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Julien Grall <jgrall@amazon.com>
References: <cover.1754899329.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1754899329.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 11/08/2025 14:34, Bertrand Marquis wrote:
> This patch serie adds support to use FF-A between VM for communications
> using indirect messages.
> 
> It adds a Kconfig parameter to enable this feature and marks it as
> experimental as for now there is no system to restrict communication
> rights between VM using this system.
> 
> It also adds support to use VM to VM communications using FF-A even if
> there is no firmware support for FF-A. As this feature enables FF-A
> support in all cases, we also introduce a new command line parameter to
> allow the user to force which tee is to be used between FF-A and Optee
> to have a solution to enable optee support if FF-A VM to VM is enabled.
> 
> Changes since v7:
> - typo fixes
> - use LIST_HEAD and DEFINE_RWLOCK
> - add Jens R-b and Julien A-b
> 
> Changes since v6:
> - use a rwlock to protect access to the chain list of context
> - rebase on top of staging
> - add some R-b/A-b from Jens and Julien
> 
> Changes since v5:
> - coding style fixes
> - rework version negociation to use the context lock
> - split probe into fw and vm to vm probe to make code clearer
> - add some R-b from Jens
> 
> Changes since v4:
> - fix typos and optimize command line parameter
> - split VM to VM support in 2 patches to ease review
> - organize ffa contexts in a chain list to be able to build the partinfo
>    result without taking the global domain lock
> - introduce a maximum number of SPs to prevent holding the CPU for too
>    long during partinfo call
> - use an atomic to store the number of FF-A VMs
> - prevent potential overflows in indirect message handling
> - fix copy bug in indirect message introduced in v4
> 
> Changes since v3:
> - reintroduce firmare v1.0 support in partinfo
> - fix a possible TOC/TOU issue in indirect message handling
> - typos and small fixes
> 
> Changes since v2:
> - Rework partition_info_get implementation
> - Taint Xen and display a message when VM to VM is enabled
> - Various fixes explained in each patch
> 
> Changes since v1 (rfc):
> - add a tee command line parameter
> - use IS_ENABLED instead of ifdef when possible
> - rebase on latest staging
> 
> 
> Bertrand Marquis (6):
>    xen/arm: Create tee command line parameter
>    xen/arm: ffa: Rework partinfo_get implementation
>    xen/arm: ffa: Introduce VM to VM support
>    xen/arm: ffa: Add buffer full notification support
>    xen/arm: ffa: Add indirect message between VM
>    xen/arm: ffa: Enable VM to VM without firmware

I merged the series.

Cheers,

-- 
Julien Grall


