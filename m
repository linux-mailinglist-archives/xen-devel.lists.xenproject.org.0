Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB81757F61
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565316.883367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlbj-0004AV-A9; Tue, 18 Jul 2023 14:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565316.883367; Tue, 18 Jul 2023 14:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlbj-00048D-6j; Tue, 18 Jul 2023 14:23:19 +0000
Received: by outflank-mailman (input) for mailman id 565316;
 Tue, 18 Jul 2023 14:23:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLlbi-000485-1R
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:23:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLlbh-0002Ts-8V; Tue, 18 Jul 2023 14:23:17 +0000
Received: from [15.248.2.157] (helo=[10.24.67.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLlbh-0002gp-2Z; Tue, 18 Jul 2023 14:23:17 +0000
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
	bh=l5HQF3ZCa/dBY8S8DXko8dxRN778wHdTjO4sZStdlLw=; b=5vaRLm/3hq9KVDyD6iUX27QJTg
	iVwx5BlB/rDalPTWK5X3sa0aMazxdFbs66wz8bnE63d9KOKWbX/VJDGzdvxMV8Lhz6lxl8niHDjSC
	nBSuKNS2tDW5czxRSpRJlqmQGBnCZsBzeX0iWaOgRYIAtmbYdyBOSnqYiMGTlRrn6yDg=;
Message-ID: <b37b15c6-d7f7-df9d-83c1-337f434a713b@xen.org>
Date: Tue, 18 Jul 2023 15:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2] ns16550: add support for polling mode when device tree
 is used
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/07/2023 15:13, Oleksii Kurochko wrote:
> RISC-V doesn't support interrupts for the time being, so it would be nice to
> have polling mode.
> 
> The patch assumes that polling mode will be used if there is no interrupt
> property 

As I asked in v1, please explain that this is allowed by the binding and 
provide a link for others to verify.

> or the interrupt is equal to some unused UART interrupt number ( look
> at the definition of NO_IRQ_POLL in ns16550.c ).

Nack. If you want to use polling mode and yet have an interrupts 
property then you should provide the information differently. This would 
either be via the command line or an extra property in the DT node.

If the latter, it would need to be standardized first.

Cheers,

-- 
Julien Grall

