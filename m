Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2A3B40471
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106525.1457190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRHX-0003IT-Ku; Tue, 02 Sep 2025 13:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106525.1457190; Tue, 02 Sep 2025 13:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRHX-0003Fl-IL; Tue, 02 Sep 2025 13:42:43 +0000
Received: by outflank-mailman (input) for mailman id 1106525;
 Tue, 02 Sep 2025 13:42:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utRHW-0003FX-K2
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:42:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utRHV-002uGB-1N;
 Tue, 02 Sep 2025 13:42:41 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utRHV-00D8iW-15;
 Tue, 02 Sep 2025 13:42:41 +0000
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
	bh=RQOBeHLl9PzNLflNgTIney80B2YgZ34VG3/X6iJD4OA=; b=2wfYSrZ+7O3W9Clhb/IDr3taxE
	SPeC6bOSc8sFWzGuI+XpE/qgu4fu0hvkEPql/TJCy1Rjg6m81Tokpnw6oz+8gXcV6vavUjuqVQpkg
	khGhJkElVlA19rBmPVpEXqpIIGFHkEVllhfdZp5eIAsTi/da7NH2xS+5TrZ4yUwkYaUY=;
Message-ID: <e8798e98-d3f2-4fee-948d-5d1b7eba5403@xen.org>
Date: Tue, 2 Sep 2025 14:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <d5634a41e70c517bc476894f3b871fc910d9d648.1756481577.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d5634a41e70c517bc476894f3b871fc910d9d648.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/08/2025 17:06, Leonid Komarianskyi wrote:
> The gic_interrupt function is the main handler for processing IRQs.
> Currently, due to restrictive checks, it does not process interrupt
> numbers greater than 1019. This patch updates the condition to allow
> the handling of interrupts from the eSPI range.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


